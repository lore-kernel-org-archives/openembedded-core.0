Return-Path: <rich.tollerton@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id A54BC77D16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 18:03:07 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vATI2how028847; Wed, 29 Nov 2017 12:03:08 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2egpkyqqfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 29 Nov 2017 12:03:08 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	vATI371b017586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2017 12:03:07 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 29 Nov 2017 12:03:07 -0600
Received: from weregild.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 29 Nov 2017 12:03:07 -0600
From: Richard Tollerton <rich.tollerton@ni.com>
To: <seebs@seebs.net>, <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Nov 2017 12:02:39 -0600
Message-ID: <20171129180242.29308-2-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171129180242.29308-1-rich.tollerton@ni.com>
References: <20171129180242.29308-1-rich.tollerton@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-11-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1709140000 definitions=main-1711290233
Subject: [PATCH][PSEUDO 1/4] linux/xattr/pseudo_wrappers.c: Preserve special bits on acl set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Nov 2017 18:03:07 -0000
Content-Type: text/plain

Recently (2015) coreutils cp -Rp changed its behavior such that chmod()
is followed by setxattr(); previously it was the other way around. This
broke pseudo when a copied directory has one of the special
bits (setuid, setgid, sticky) set; the special bit wound up getting
removed.

Root cause is that ACLs never included special bits in the first place,
so we need to merge them back in ourselves.

[YOCTO #12379]

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 ports/linux/xattr/pseudo_wrappers.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/ports/linux/xattr/pseudo_wrappers.c b/ports/linux/xattr/pseudo_wrappers.c
index d69d53e..1c228a2 100644
--- a/ports/linux/xattr/pseudo_wrappers.c
+++ b/ports/linux/xattr/pseudo_wrappers.c
@@ -97,6 +97,21 @@ posix_permissions(const acl_header *header, int entries, int *extra, int *mode)
 	return 0;
 }
 
+static int get_special_bits(const char *path, int fd) {
+	int rc;
+	struct stat64 buf;
+	if (path) {
+		rc = lstat64(path, &buf);
+	} else {
+		rc = fstat64(fd, &buf);
+	}
+	if (rc == -1) {
+		return rc;
+	}
+
+	return buf.st_mode & (S_ISUID | S_ISGID | S_ISVTX);
+}
+
 #define RC_AND_BUF \
 	int rc; \
 	PSEUDO_STATBUF buf; \
@@ -172,6 +187,10 @@ static int shared_setxattr(const char *path, int fd, const char *name, const voi
 		int entries = (size - sizeof(acl_header)) / sizeof(acl_entry);
 		int res = posix_permissions(value, entries, &extra, &mode);
 		if (res == 0) {
+			/* POSIX ACLs don't actually include
+			 * setuid/setgid/sticky bit. We need to add those back
+			 * in ourselves. */
+			mode |= get_special_bits(path, fd);
 			pseudo_debug(PDBGF_XATTR, "posix_acl_access translated to mode %04o. Remaining attribute(s): %d.\n",
 				mode, extra);
 			buf.st_mode = mode;
-- 
2.14.1


