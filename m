Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D93606103B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 12:38:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 02 Jul 2013 05:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,980,1363158000"; d="scan'208";a="359309808"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jul 2013 05:38:55 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2013 15:45:21 +0300
Message-Id: <1372769121-3111-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] mkelfimage: switch to git repository
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
X-List-Received-Date: Tue, 02 Jul 2013 12:38:03 -0000

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   31 ++++++++++++++++++++
 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb |   31 --------------------
 2 files changed, 31 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
 delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
new file mode 100644
index 0000000..b81ce2f
--- /dev/null
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "A utility to create ELF boot images from Linux kernel images"
+HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
+
+SRCREV = "686a48a339b3200184c27e7f98d4c03180b2be6c"
+PV = "4.0+git${SRCPV}"
+PR = "r0"
+
+DEPENDS += "zlib"
+
+SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http \
+           file://cross-compile.patch   \
+           file://fix-makefile-to-find-libz.patch   \
+          "
+
+S = "${WORKDIR}/git/util/mkelfImage"
+
+CFLAGS += "-fno-stack-protector"
+CACHED_CONFIGUREVARS += "HOST_CC='${BUILD_CC}'"
+EXTRA_OEMAKE += "HOST_CPPFLAGS='${BUILD_CPPFLAGS}'"
+
+inherit autotools
+
+do_install_append() {
+	rmdir ${D}${datadir}/mkelfImage/elf32-i386
+	rmdir ${D}${datadir}/mkelfImage
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
deleted file mode 100644
index b53f7a7..0000000
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "A utility to create ELF boot images from Linux kernel images"
-HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
-SECTION = "devel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
-
-SRCREV = "6637"
-PV = "1.0.0+svn${SRCPV}"
-PR = "r2"
-
-DEPENDS += "zlib"
-
-SRC_URI = "svn://coreboot.org/coreboot/trunk/util;module=mkelfImage;protocol=svn \
-           file://cross-compile.patch \
-           file://fix-makefile-to-find-libz.patch \
-          "
-
-S = "${WORKDIR}/mkelfImage"
-
-CFLAGS += "-fno-stack-protector"
-CACHED_CONFIGUREVARS += "HOST_CC='${BUILD_CC}'"
-EXTRA_OEMAKE += "HOST_CPPFLAGS='${BUILD_CPPFLAGS}'"
-
-inherit autotools
-
-do_install_append() {
-	rmdir ${D}${datadir}/mkelfImage/elf32-i386
-	rmdir ${D}${datadir}/mkelfImage
-}
-
-BBCLASSEXTEND = "native"
-- 
1.7.9.5


