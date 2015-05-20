Return-Path: <Chuang.Dong@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 174A1601E3
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 07:37:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4K7b2QI010778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 00:37:02 -0700 (PDT)
Received: from pek-lpd-susbld.wrs.com (128.224.153.80) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Wed, 20 May 2015 00:37:02 -0700
From: Chuang Dong <Chuang.Dong@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 20 May 2015 15:37:00 +0800
Message-ID: <1432107420-36311-1-git-send-email-Chuang.Dong@windriver.com>
X-Mailer: git-send-email 1.8.5.2.233.g932f7e4
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: add expansion of mkdir_p to configure.in
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
X-List-Received-Date: Wed, 20 May 2015 07:37:02 -0000
Content-Type: text/plain

add 0001-e2fsprogs-add-expansion-of-mkdir_p-to-configure.in.patch
which fix a bug that macro @mkdir_p@ can't be substituted and modify
e2fsprogs_1.42.9.bb to add this patch

Upstream-Status: Pending

Signed-off-by: Chuang Dong <Chuang.Dong@windriver.com>
---
 ...-add-expansion-of-mkdir_p-to-configure.in.patch | 32 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-add-expansion-of-mkdir_p-to-configure.in.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-add-expansion-of-mkdir_p-to-configure.in.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-add-expansion-of-mkdir_p-to-configure.in.patch
new file mode 100644
index 0000000..fa62f4d
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-add-expansion-of-mkdir_p-to-configure.in.patch
@@ -0,0 +1,32 @@
+From 94868938a7e4728019640356b3919c7ddd0b91d4 Mon Sep 17 00:00:00 2001
+From: Chuang Dong <Chuang.Dong@windriver.com>
+Date: Wed, 20 May 2015 14:15:27 +0800
+Subject: [PATCH] e2fsprogs: add expansion of mkdir_p to configure.in
+
+the macro named @mkdir_p@ that can't be substituted, which in  the file
+Makefile(/build/e2fsprogs/build/po), @mkdir_p@ equal to @MKDIR_P@ which has
+been substituted. So, add a command in original code of e2fsprogs could
+substitute @mkdir_p@
+
+Upstream-Status: Pending
+
+Signed-off-by: Chuang Dong <Chuang.Dong@windriver.com>
+---
+ configure.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.in b/configure.in
+index 6f39cc9..f895531 100644
+--- a/configure.in
++++ b/configure.in
+@@ -6,6 +6,7 @@ AH_BOTTOM([#include "dirpaths.h"])
+ MCONFIG=./MCONFIG
+ AC_SUBST_FILE(MCONFIG)
+ BINARY_TYPE=bin
++AC_SUBST([mkdir_p], ['$(MKDIR_P)'])
+ dnl
+ dnl This is to figure out the version number and the date....
+ dnl
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index b354088..4ce1ba8 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://acinclude.m4 \
             file://cache_inode.patch \
             file://CVE-2015-0247.patch \
             file://0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch \
+            file://0001-e2fsprogs-add-expansion-of-mkdir_p-to-configure.in.patch \
 "
 
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
-- 
1.8.5.2.233.g932f7e4


