Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 82FFD65C8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="31132359"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2018 00:35:02 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id A1A9E5802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:01 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:02 +0200
Message-Id: <1519029438-11092-12-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 11/27] gobject-introspection: remove PKG_CONFIG_SYSROOT_DIR work-around
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:01 -0000

We are moving from freedesktop.org's pkg-config to pkgconf.
This helps us to remove the following patch as PKG_CONFIG_SYSROOT_DIR
behaves consistently with pkgconf:

1) 0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch | 96 ----------------------
 .../gobject-introspection_1.54.1.bb                |  1 -
 2 files changed, 97 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
deleted file mode 100644
index 47a18ec..0000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From e08b3677dd04d6ec407ba8f74f601b2d51310eff Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 8 Oct 2015 18:30:35 +0300
-Subject: [PATCH 5/5] Prefix pkg-config paths with PKG_CONFIG_SYSROOT_DIR
- environment variable
-
-This environment variable sets the location of sysroot directory in cross-compilation
-environments; if the variable is not set, the prefix will be empty.
-
-Upstream-Status: Pending [review on oe-core list]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile-gir.am     | 18 +++++++++---------
- m4/introspection.m4 |  8 ++++----
- 2 files changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/Makefile-gir.am b/Makefile-gir.am
-index a09260a..ba6e89e 100644
---- a/Makefile-gir.am
-+++ b/Makefile-gir.am
-@@ -55,8 +55,8 @@ else
- endif
- 
- # glib
--GLIB_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir glib-2.0)/glib-2.0
--GLIB_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir glib-2.0)
-+GLIB_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir glib-2.0)/glib-2.0
-+GLIB_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir glib-2.0)
- 
- GLIB_LIBRARY=glib-2.0
- 
-@@ -92,8 +92,8 @@ GLib-2.0.gir: g-ir-scanner g-ir-compiler$(EXEEXT)
- gir/DBusGLib-1.0.typelib: GObject-2.0.gir
- 
- # gobject
--GOBJECT_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir gobject-2.0)/glib-2.0
--GOBJECT_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir gobject-2.0)
-+GOBJECT_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gobject-2.0)/glib-2.0
-+GOBJECT_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir gobject-2.0)
- 
- GOBJECT_LIBRARY=gobject-2.0
- 
-@@ -120,8 +120,8 @@ GObject_2_0_gir_FILES = \
- BUILT_GIRSOURCES += GObject-2.0.gir
- 
- # gmodule
--GMODULE_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir gmodule-2.0)/glib-2.0
--GMODULE_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir gmodule-2.0)
-+GMODULE_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gmodule-2.0)/glib-2.0
-+GMODULE_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir gmodule-2.0)
- 
- GMODULE_LIBRARY=gmodule-2.0
- 
-@@ -146,13 +146,13 @@ GModule_2_0_gir_FILES = $(GLIB_INCLUDEDIR)/gmodule.h \
- BUILT_GIRSOURCES += GModule-2.0.gir
- 
- # gio
--GIO_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir gio-2.0)/glib-2.0
--GIO_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir gio-2.0)
-+GIO_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gio-2.0)/glib-2.0
-+GIO_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir gio-2.0)
- 
- GIO_LIBRARY=gio-2.0
- 
- if HAVE_GIO_UNIX
--GIO_UNIX_INCLUDEDIR = $(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0
-+GIO_UNIX_INCLUDEDIR = $(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0
- GIO_UNIX_HDRS = $(GIO_UNIX_INCLUDEDIR)/gio/*.h
- GIO_UNIX_PACKAGES = gio-unix-2.0
- else
-diff --git a/m4/introspection.m4 b/m4/introspection.m4
-index d89c3d9..b562266 100644
---- a/m4/introspection.m4
-+++ b/m4/introspection.m4
-@@ -56,14 +56,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
-     INTROSPECTION_GIRDIR=
-     INTROSPECTION_TYPELIBDIR=
-     if test "x$found_introspection" = "xyes"; then
--       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
--       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
--       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-+       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
-+       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
-+       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-        INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
-        INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
-        INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
-        INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
--       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-+       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-     fi
-     AC_SUBST(INTROSPECTION_SCANNER)
-     AC_SUBST(INTROSPECTION_COMPILER)
--- 
-2.7.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
index 85c8001..076593e 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.54.1.bb
@@ -13,7 +13,6 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/1.54/${BPN}-${PV}.tar.xz \
            file://0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch \
            file://0003-giscanner-add-use-binary-wrapper-option.patch \
            file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
-           file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
            "
 SRC_URI[md5sum] = "126c29e4d54adbed2ed4e2b04483de41"
-- 
2.4.0


