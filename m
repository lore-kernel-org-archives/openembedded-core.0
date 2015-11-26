Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 402066E268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574658"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:06 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:12 +0200
Message-Id: <af6baba3a07b2d53884a3d370282496370b19823.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/29] udev: enable gobject introspection
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:05 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/udev/udev.inc                    | 10 ++++---
 ...file.am-don-t-hardcode-g-ir-compiler-name.patch | 27 ++++++++++++++++++
 ...c-use-PKG_CONFIG_SYSROOT_PATH-when-findin.patch | 32 ++++++++++++++++++++++
 ....am-use-libtool-when-running-g-ir-scanner.patch | 26 ++++++++++++++++++
 4 files changed, 91 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/0001-Makefile.am-don-t-hardcode-g-ir-compiler-name.patch
 create mode 100644 meta/recipes-core/udev/udev/0001-configure.ac-use-PKG_CONFIG_SYSROOT_PATH-when-findin.patch
 create mode 100644 meta/recipes-core/udev/udev/0002-Makefile.am-use-libtool-when-running-g-ir-scanner.patch

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index c378ae3..ea5fb24 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -19,6 +19,9 @@ PROVIDES = "libgudev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
+           file://0001-configure.ac-use-PKG_CONFIG_SYSROOT_PATH-when-findin.patch \
+           file://0002-Makefile.am-use-libtool-when-running-g-ir-scanner.patch \
+           file://0001-Makefile.am-don-t-hardcode-g-ir-compiler-name.patch \
            file://avoid-mouse-autosuspend.patch \
            file://run.rules \
            file://udev.rules \
@@ -33,12 +36,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://run-ptest \
            file://init"
 
-inherit autotools pkgconfig update-rc.d ptest
+inherit autotools pkgconfig update-rc.d ptest gobject-introspection
 RDEPENDS_${PN}-ptest += "make perl python"
 
 libexecdir = "${base_libdir}"
-EXTRA_OECONF = "--disable-introspection \
-                --with-rootlibdir=${base_libdir} \
+EXTRA_OECONF = "--with-rootlibdir=${base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids \
                 ac_cv_file__usr_share_pci_ids=no \
                 ac_cv_file__usr_share_hwdata_pci_ids=no \
@@ -72,7 +74,7 @@ FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
 FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/*"
-FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
+FILES_${PN}-dev += "${datadir}/pkgconfig/udev.pc \
                    ${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
                    ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc \
                    ${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
diff --git a/meta/recipes-core/udev/udev/0001-Makefile.am-don-t-hardcode-g-ir-compiler-name.patch b/meta/recipes-core/udev/udev/0001-Makefile.am-don-t-hardcode-g-ir-compiler-name.patch
new file mode 100644
index 0000000..859c47c
--- /dev/null
+++ b/meta/recipes-core/udev/udev/0001-Makefile.am-don-t-hardcode-g-ir-compiler-name.patch
@@ -0,0 +1,27 @@
+From c00a9a5cca2fe805c5c3de85ad3962df55927bbc Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 3 Nov 2015 15:49:48 +0200
+Subject: [PATCH] Makefile.am: don't hardcode g-ir-compiler name
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c7e7447..9d32acc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -469,7 +469,7 @@ src/gudev/GUdev-1.0.gir: libgudev-1.0.la $(G_IR_SCANNER)
+ 		$(top_srcdir)/src/gudev/gudevenumerator.c
+ 
+ src/gudev/GUdev-1.0.typelib: src/gudev/GUdev-1.0.gir $(G_IR_COMPILER)
+-	$(AM_V_GEN)g-ir-compiler $< -o $@
++	$(AM_V_GEN)$(G_IR_COMPILER) $< -o $@
+ 
+ girdir = $(GIRDIR)
+ gir_DATA = src/gudev/GUdev-1.0.gir
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/udev/udev/0001-configure.ac-use-PKG_CONFIG_SYSROOT_PATH-when-findin.patch b/meta/recipes-core/udev/udev/0001-configure.ac-use-PKG_CONFIG_SYSROOT_PATH-when-findin.patch
new file mode 100644
index 0000000..658e924
--- /dev/null
+++ b/meta/recipes-core/udev/udev/0001-configure.ac-use-PKG_CONFIG_SYSROOT_PATH-when-findin.patch
@@ -0,0 +1,32 @@
+From 54fd0dfd3b2961afe8c1bcd06b9cdf08f9df0a92 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 29 Oct 2015 14:04:08 +0200
+Subject: [PATCH 1/2] configure.ac: use PKG_CONFIG_SYSROOT_PATH when finding
+ out the location of introspection binaries
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0500313..689c6b9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -134,9 +134,9 @@ AC_ARG_ENABLE([introspection],
+ AS_IF([test "x$enable_introspection" = "xyes"], [
+        PKG_CHECK_MODULES([INTROSPECTION], [gobject-introspection-1.0 >= 0.6.2])
+        AC_DEFINE([ENABLE_INTROSPECTION], [1], [enable GObject introspection support])
+-       AC_SUBST([G_IR_SCANNER], [$($PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0)])
+-       AC_SUBST([G_IR_COMPILER], [$($PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0)])
+-       AC_SUBST([G_IR_GENERATE], [$($PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0)])
++       AC_SUBST([G_IR_SCANNER], [$PKG_CONFIG_SYSROOT_DIR$($PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0)])
++       AC_SUBST([G_IR_COMPILER], [$PKG_CONFIG_SYSROOT_DIR$($PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0)])
++       AC_SUBST([G_IR_GENERATE], [$PKG_CONFIG_SYSROOT_DIR$($PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0)])
+        AC_SUBST([GIRDIR], [$($PKG_CONFIG --define-variable=datadir=${datadir} --variable=girdir gobject-introspection-1.0)])
+        AC_SUBST([GIRTYPELIBDIR], [$($PKG_CONFIG --define-variable=libdir=${libdir} --variable=typelibdir gobject-introspection-1.0)])
+ ])
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/udev/udev/0002-Makefile.am-use-libtool-when-running-g-ir-scanner.patch b/meta/recipes-core/udev/udev/0002-Makefile.am-use-libtool-when-running-g-ir-scanner.patch
new file mode 100644
index 0000000..b5373fc
--- /dev/null
+++ b/meta/recipes-core/udev/udev/0002-Makefile.am-use-libtool-when-running-g-ir-scanner.patch
@@ -0,0 +1,26 @@
+From 47bdabf2e07dee5e09d171653c2dbe9fee009a5b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 29 Oct 2015 14:05:26 +0200
+Subject: [PATCH 2/2] Makefile.am: use --libtool when running g-ir-scanner
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2e32e69..c7e7447 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -443,6 +443,7 @@ src/gudev/GUdev-1.0.gir: libgudev-1.0.la $(G_IR_SCANNER)
+ 		--warn-all \
+ 		--namespace GUdev \
+ 		--nsversion=1.0 \
++                --libtool=$(LIBTOOL) \
+ 		--include=GObject-2.0 \
+ 		--library=gudev-1.0 \
+ 		--library-path=$(top_builddir)/src \
+-- 
+2.1.4
+
-- 
2.6.2


