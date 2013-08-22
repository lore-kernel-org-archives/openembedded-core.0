Return-Path: <Zhangle.Yang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id B383B6B89B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 07:42:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7M7gONn018778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 03:42:24 -0400 (EDT)
Received: from PEK-DSM-SYRINX.wrs.com (128.224.157.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 22 Aug 2013 00:42:23 -0700
From: Zhangle Yang <zhangle.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 15:42:15 +0800
Message-ID: <1377157335-21262-1-git-send-email-zhangle.yang@windriver.com>
X-Mailer: git-send-email 1.8.2.1
MIME-Version: 1.0
X-Originating-IP: [128.224.157.43]
Subject: [PATCH] stat: fix the wrong return code
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
X-List-Received-Date: Thu, 22 Aug 2013 07:42:25 -0000
Content-Type: text/plain

After stat -h is executed, the return code is 1.
This patch changes it to 0.

Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
---
 .../stat/stat-3.3/fix-error-return.patch           |   16 ++++++++++++++++
 meta/recipes-extended/stat/stat_3.3.bb             |    3 ++-
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/stat/stat-3.3/fix-error-return.patch

diff --git a/meta/recipes-extended/stat/stat-3.3/fix-error-return.patch b/meta/recipes-extended/stat/stat-3.3/fix-error-return.patch
new file mode 100644
index 0000000..032995d
--- /dev/null
+++ b/meta/recipes-extended/stat/stat-3.3/fix-error-return.patch
@@ -0,0 +1,16 @@
+This patch fixies the wrong return code of stat -h.
+
+Upstream-Status: Pending
+Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
+
+--- stat-3.3/stat.c.orig	2013-08-22 10:49:45.000000000 +0800
++++ stat-3.3/stat.c	2013-08-22 10:50:31.000000000 +0800
+@@ -845,7 +845,7 @@
+     fprintf(stderr, "\t\t%%S - Security ID in SE-Linux\n");
+     fprintf(stderr, "\t\t%%C - Security context in SE-Linux\n");
+     fprintf(stderr, "\t\t%%d - Free file nodes in file system\n");
+-    exit(1);
++    exit(0);
+ }
+   
+ 
diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
index 73e0873..1131bdf 100644
--- a/meta/recipes-extended/stat/stat_3.3.bb
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -8,7 +8,8 @@ BBCLASSEXTEND = "native"
 
 PR = "r0"
 
-SRC_URI = "ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz"
+SRC_URI = "ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz \
+           file://fix-error-return.patch"
 SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
 SRC_URI[sha256sum] = "7071f0384a423a938dd542c1f08547a02824f6359acd3ef3f944b2c4c2d1ee09"
 
-- 
1.7.4.1


