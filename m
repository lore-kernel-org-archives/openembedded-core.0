Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7F17863D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 11:13:57 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v7GBBKlU016204 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 06:13:59 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2cc6demg8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 06:13:58 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v7GBDwCu031092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 06:13:58 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 16 Aug 2017 06:13:57 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 16 Aug 2017 06:13:57 -0500
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 16 Aug 2017 06:13:56 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 14:13:55 +0300
Message-ID: <20170816111355.11347-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.14.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-16_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1708160188
Cc: haris.okanovic@ni.com, ken.sharp@ni.com
Subject: [PATCH] oe/path.py: copyhardlinktree: don't overwrite existing symlinks
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
X-List-Received-Date: Wed, 16 Aug 2017 11:13:58 -0000
Content-Type: text/plain

Starting with tar>=1.26 the default behaviour when extracting is to
overwrite symlinks and a '-h' flag was added for tar to follow them.

The primary use case for this is to allow ${DEPLOY_DIR_IPK/RPM/DEB} to
be symlinks and avoid copyhardlinktree replacing those symlinks with a
normal directory.

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
2.14.0


