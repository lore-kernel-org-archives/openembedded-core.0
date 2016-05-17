Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 76E946AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 16:37:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2016 09:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,324,1459839600"; d="scan'208";a="978889474"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.59])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2016 09:37:23 -0700
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 11:37:34 -0500
Message-Id: <1463503054-21927-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH v2] meta:recipes-extended: zip: fix security issues
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
X-List-Received-Date: Tue, 17 May 2016 16:37:54 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

This patch avoids zip recipe fails to compile with compiler flags which elevate common string formatting issues into an error (-Wformat -Wformat-security -Werror=format-security).

[YOCTO #9552]

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/conf/distro/include/security_flags.inc        |  1 -
 .../zip/zip-3.0/fix-security-format.patch          | 42 ++++++++++++++++++++++
 meta/recipes-extended/zip/zip.inc                  |  3 +-
 3 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/fix-security-format.patch

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 7a91cec..bb1a398 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -107,7 +107,6 @@ SECURITY_STRINGFORMAT_pn-makedevs = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 SECURITY_STRINGFORMAT_pn-stat = ""
 SECURITY_STRINGFORMAT_pn-unzip = ""
-SECURITY_STRINGFORMAT_pn-zip = ""
 
 TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
diff --git a/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch b/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
new file mode 100644
index 0000000..fe29d41
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
@@ -0,0 +1,42 @@
+meta: recipes-extended: Fixing security formatting issues on zip
+
+Fix security formatting issues related to printing without NULL argument
+
+zip.c: In function 'help_extended':
+zip.c:1031:5: error: format not a string literal and no format arguments [-Werror=format-security]
+     printf(text[i]);
+     ^
+zip.c: In function 'version_info':
+zip.c:1228:5: error: format not a string literal and no format arguments [-Werror=format-security]
+     printf(cryptnote[i]);
+     ^
+
+[YOCTO #9552]
+[https://bugzilla.yoctoproject.org/show_bug.cgi?id=9552]
+
+Upstream-Status: Pending
+
+Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
+
+diff --git a/zip.c b/zip.c
+index 439821f..d7da768 100644
+--- a/zip.c
++++ b/zip.c
+@@ -1028,7 +1028,7 @@ local void help_extended()
+ 
+   for (i = 0; i < sizeof(text)/sizeof(char *); i++)
+   {
+-    printf(text[i]);
++    fputs(text[i],stdout);
+     putchar('\n');
+   }
+ #ifdef DOS
+@@ -1225,7 +1225,7 @@ local void version_info()
+             CR_MAJORVER, CR_MINORVER, CR_BETA_VER, CR_VERSION_DATE);
+   for (i = 0; i < sizeof(cryptnote)/sizeof(char *); i++)
+   {
+-    printf(cryptnote[i]);
++    fputs(cryptnote[i],stdout);
+     putchar('\n');
+   }
+   ++i;  /* crypt support means there IS at least one compilation option */
diff --git a/meta/recipes-extended/zip/zip.inc b/meta/recipes-extended/zip/zip.inc
index 6221c5e..21985a4 100644
--- a/meta/recipes-extended/zip/zip.inc
+++ b/meta/recipes-extended/zip/zip.inc
@@ -5,7 +5,8 @@ SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
 
-SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.', '')}.tgz"
+SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.', '')}.tgz \
+            file://fix-security-format.patch"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'BIND=${CC}' 'AS=${CC} -c' 'CPP=${CPP}' \
 		'CFLAGS=-I. -DUNIX ${CFLAGS}' 'INSTALL=install' \
-- 
1.9.1


