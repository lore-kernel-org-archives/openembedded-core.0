Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE357754DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 05:19:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6C5JdEi026597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 22:19:39 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 11 Jul 2018 22:19:38 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2018 13:19:36 +0800
Message-ID: <1531372776-5729-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] file: fix regression for determining DB file type
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
X-List-Received-Date: Thu, 12 Jul 2018 05:19:39 -0000
Content-Type: text/plain

The version 5.33 introduced a regression bug for determining the DB file
type. Backport a patch from upstream to fix it.

Before apply the patch:
$ file aliases.db
aliases.db: created: Thu Jan  1 00:38:24 1970, modified: Thu Jan  1 00:00:00 1970

After apply the patch:
$ file aliases.db
aliases.db: Berkeley DB (Btree, version 9, native byte-order)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
This patch is rebased against master-next

 .../file/file/fix-bogus-magic.patch                | 32 ++++++++++++++++++++++
 meta/recipes-devtools/file/file_5.33.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/file/file/fix-bogus-magic.patch

diff --git a/meta/recipes-devtools/file/file/fix-bogus-magic.patch b/meta/recipes-devtools/file/file/fix-bogus-magic.patch
new file mode 100644
index 0000000..9a33ea7
--- /dev/null
+++ b/meta/recipes-devtools/file/file/fix-bogus-magic.patch
@@ -0,0 +1,32 @@
+From c637aaad6f0db5ad45a5296c837cb1f5253d3e3a Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Thu, 24 May 2018 18:54:40 +0000
+Subject: [PATCH] fix bogus magic
+
+Upstream-Status: Backport
+[https://github.com/file/file/commit/4fb6a59df80d4974f8230bfce36e38e6de7d574f]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ magic/Magdir/dbpf | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/magic/Magdir/dbpf b/magic/Magdir/dbpf
+index 65cab61e..e81c5538 100644
+--- a/magic/Magdir/dbpf
++++ b/magic/Magdir/dbpf
+@@ -9,9 +9,7 @@
+ >4	ulelong	x	\b, version: %u.
+ >>8	ulelong	x	\b%u
+ >>>36	ulelong	x       \b, files: %u
++>>24	ledate	!0	\b, created: %s
++>>28	ledate	!0	\b, modified: %s
+ !:ext	dbpf/package/dat/sc4
+ !:mime	application/x-maxis-dbpf
+-4	ulelong	1
+->8	ulelong	!1
+->>24	ledate	!0	\b, created: %s
+->>>28	ledate	!0	\b, modified: %s
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/file/file_5.33.bb b/meta/recipes-devtools/file/file_5.33.bb
index 745ef10..a29402a0 100644
--- a/meta/recipes-devtools/file/file_5.33.bb
+++ b/meta/recipes-devtools/file/file_5.33.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 SRC_URI = "git://github.com/file/file.git \
         file://debian-742262.patch \
         file://CVE-2018-10360.patch \
+        file://fix-bogus-magic.patch \
         "
 
 SRCREV = "219846094c7593e27453e62855e61181089c48cf"
-- 
2.7.4


