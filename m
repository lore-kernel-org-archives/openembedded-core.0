Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id F2AB577B95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 17:09:38 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v7LH6jiL000858; Mon, 21 Aug 2017 12:09:39 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2cejupy32k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 21 Aug 2017 12:09:38 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v7LH9b43013022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2017 12:09:37 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 21 Aug 2017 12:09:37 -0500
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 21 Aug 2017 12:09:36 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <richard.purdie@linuxfoundation.com>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 20:09:35 +0300
Message-ID: <20170821170935.21346-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-21_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1708210269
Subject: [PATCH v2] oe/path.py: copyhardlinktree: don't overwrite existing symlinks
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
X-List-Received-Date: Mon, 21 Aug 2017 17:09:39 -0000
Content-Type: text/plain

Before GNU tar 1.24, only the archive creation command had the '-h'
argument to preserve and follow symlinks. After >= 1.24 via commit
14efeb9f956e38d7be (tar: --dereference consistency) the capability to
preserve symlinks was also added to the archive extraction command.

-h is default at archive creation but is not default at extraction,
meaning that it will replace symlinks with directories even if the
original filesystem directory tree and archive contains them.

Add -h to the copyhardlinktree extraction step so the build can
support symlinks in variables like ${DEPLOY_DIR_IPK/RPM/DEB}.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/lib/oe/path.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 448a2b944e..1ea03d5d56 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -98,7 +98,7 @@ def copyhardlinktree(src, dst):
     if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
         # Need to copy directories only with tar first since cp will error if two 
         # writers try and create a directory at the same time
-        cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
+        cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
         source = ''
         if os.path.isdir(src):
-- 
2.14.1


