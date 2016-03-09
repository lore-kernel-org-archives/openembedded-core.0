Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DC59C6FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:06:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 09 Mar 2016 07:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083788"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:37 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:02:05 +0200
Message-Id: <bb727cfdcbfdf5a49489f80c31708495aad7dbdf.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/24] recipes-gnome: fix introspection support
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
X-List-Received-Date: Wed, 09 Mar 2016 15:06:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.18.0.bb               |  22 +++-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb |   7 +-
 .../gnome-desktop/gnome-desktop3_3.18.2.bb         |   2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |   6 +-
 .../gsettings-desktop-schemas_3.19.3.bb            |   4 +-
 meta/recipes-gnome/json-glib/json-glib_1.0.4.bb    |   2 +-
 meta/recipes-gnome/libgudev/libgudev_230.bb        |   2 +-
 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb    |   2 +-
 meta/recipes-gnome/librsvg/librsvg_2.40.13.bb      |   5 +-
 meta/recipes-gnome/libsecret/libsecret_0.18.4.bb   |  14 ++-
 meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb      |   4 +-
 ...op-introspection-macros-from-acinclude.m4.patch | 121 +++++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.38.1.bb        |  10 +-
 meta/recipes-support/atk/at-spi2-core_2.18.3.bb    |   4 +-
 meta/recipes-support/atk/atk_2.18.0.bb             |   4 +-
 meta/recipes-support/vte/vte.inc                   |   6 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |   3 +-
 17 files changed, 182 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch

diff --git a/meta/recipes-gnome/gcr/gcr_3.18.0.bb b/meta/recipes-gnome/gcr/gcr_3.18.0.bb
index ed6e8c4..32523a6 100644
--- a/meta/recipes-gnome/gcr/gcr_3.18.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.18.0.bb
@@ -5,9 +5,9 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt vala"
+DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt"
 
-inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even
+inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -21,3 +21,21 @@ FILES_${PN} += " \
 
 # http://errors.yoctoproject.org/Errors/Details/20229/
 ARM_INSTRUCTION_SET = "arm"
+
+# on x86-64 the introspection binary goes into 
+# an infinite loop under qemu during compilation, 
+# printing the following:
+# 
+# gcrypt-Message: select() error: Bad address
+#
+# gcrypt-Message: select() error: Bad address
+#
+# gcrypt-Message: select() error: Bad address
+#
+# This will be investigated later.
+EXTRA_OECONF_append_x86-64 = " --disable-introspection"
+
+# Gcr-3.broken: poky/build-mips64/tmp/work/mips64-poky-linux/libgpg-error/1.19-r0/libgpg-error-1.19/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
+# qemu: uncaught target signal 6 (Aborted) - core dumped
+EXTRA_OECONF_append_mips64 = " --disable-introspection"
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb
index ed9c232..ba94eec 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "9275076639baa24a342f3e02c402920e"
 SRC_URI[sha256sum] = "2b6771f1ac72f687a8971e59810b8dc658e65e7d3086bd2e676e618fd541d031"
 
-inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even
+inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection
 
 LIBV = "2.10.0"
 
@@ -41,15 +41,12 @@ PACKAGECONFIG[jpeg2000] = "--with-libjasper,--without-libjasper,jasper"
 PACKAGECONFIG[gio-sniff] = "--enable-gio-sniffing,--disable-gio-sniffing,,shared-mime-info"
 PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
 
-EXTRA_OECONF = "--disable-introspection"
-
 PACKAGES =+ "${PN}-xlib"
 
 FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
 ALLOW_EMPTY_${PN}-xlib = "1"
 
-FILES_${PN} = "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
-	${libdir}/lib*.so.*"
+FILES_${PN} += "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
 FILES_${PN}-dev += " \
 	${bindir}/gdk-pixbuf-csource \
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
index 09850d6..ee460d9 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 BPN = "gnome-desktop"
 
-inherit gnome pkgconfig upstream-version-is-even
+inherit gnome pkgconfig upstream-version-is-even gobject-introspection
 SRC_URI[archive.md5sum] = "9a5875247abdb99bad93f1c4230d1d6d"
 SRC_URI[archive.sha256sum] = "ddd46d022de137543a71f50c7392b32f9b98d5d3f2b53040b35f5802de2e7b56"
 
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index e50d077..feaf080 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -3,9 +3,9 @@ SECTION = "x11/gnome"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native gobject-introspection-stub"
+DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native"
 
-inherit gnomebase gtk-doc gettext
+inherit gnomebase gtk-doc gettext gobject-introspection
 
 SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.xz;name=archive \
            file://remove_plus_from_invalid_characters_list.patch \
@@ -18,7 +18,7 @@ SRC_URI[archive.sha256sum] = "1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e
 S = "${WORKDIR}/GConf-${PV}"
 
 EXTRA_OECONF = "--enable-shared --disable-static --enable-debug=yes \
-                --disable-introspection --disable-orbit --with-openldap=no --disable-gtk"
+                --disable-orbit --with-openldap=no --disable-gtk"
 
 # Disable PolicyKit by default
 PACKAGECONFIG ??= ""
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.19.3.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.19.3.bb
index 4c1fbfc..25fdaba 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.19.3.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.19.3.bb
@@ -5,9 +5,9 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "glib-2.0 intltool-native gobject-introspection-stub-native"
+DEPENDS = "glib-2.0 intltool-native"
 
-inherit gnomebase gsettings gettext
+inherit gnomebase gsettings gettext gobject-introspection
 
 SRC_URI[archive.md5sum] = "fdc92abcffe46821be423193b275cf8b"
 SRC_URI[archive.sha256sum] = "9084989b75ca9b3fc5984c8a0d297a93d3d124f51cadd2bdaaaa75a783c80635"
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
index 4908ac0..3ce38ce 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
@@ -13,6 +13,6 @@ DEPENDS = "glib-2.0"
 SRC_URI[archive.md5sum] = "3131b0417ecde3da1ae72acceaa375cf"
 SRC_URI[archive.sha256sum] = "80f3593cb6bd13f1465828e46a9f740e2e9bd3cd2257889442b3e62bd6de05cd"
 
-inherit gnomebase gettext lib_package
+inherit gnomebase gettext lib_package gobject-introspection
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-gnome/libgudev/libgudev_230.bb b/meta/recipes-gnome/libgudev/libgudev_230.bb
index c61316b..6a10502 100644
--- a/meta/recipes-gnome/libgudev/libgudev_230.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_230.bb
@@ -10,5 +10,5 @@ RCONFLICTS_${PN} = "systemd (<= 220)"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-inherit gnomebase
+inherit gnomebase gobject-introspection
 
diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
index 1a24c10..ce8e5ae 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "dbus gtk+3 dbus-glib"
 
-inherit gnomebase gtk-doc distro_features_check
+inherit gnomebase gtk-doc distro_features_check gobject-introspection
 # depends on gtk+3
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.13.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.13.bb
index ed71243..2ac52f7 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.13.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.13.bb
@@ -10,7 +10,7 @@ SECTION = "x11/utils"
 DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
 BBCLASSEXTEND = "native"
 
-inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-even
+inherit autotools pkgconfig gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://gtk-option.patch"
 
@@ -19,8 +19,6 @@ SRC_URI[archive.sha256sum] = "4d6ea93ec05f5dabe7262d711d246a0a99b2311e215360dd3d
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-EXTRA_OECONF = "--disable-introspection --disable-vala"
-
 # The older ld (2.22) on the host (Centos 6.5) doesn't have the
 # -Bsymbolic-functions option, we can disable it for native.
 EXTRA_OECONF_append_class-native = " --enable-Bsymbolic=auto"
@@ -37,7 +35,6 @@ do_install_append() {
 }
 
 PACKAGES =+ "librsvg-gtk rsvg"
-FILES_${PN} = "${libdir}/*.so.*"
 FILES_rsvg = "${bindir}/rsvg* \
 	      ${datadir}/pixmaps/svg-viewer.svg \
 	      ${datadir}/themes"
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.4.bb
index 534caad..beaaba0 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.4.bb
@@ -2,9 +2,9 @@ SUMMARY = "libsecret is a library for storing and retrieving passwords and other
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
-inherit gnomebase gtk-doc
+inherit gnomebase gtk-doc vala gobject-introspection
 
-DEPENDS = "glib-2.0 libgcrypt gettext-native intltool-native"
+DEPENDS += "glib-2.0 libgcrypt gettext-native intltool-native"
 
 EXTRA_OECONF += "--disable-manpages"
 
@@ -13,3 +13,13 @@ SRC_URI[archive.sha256sum] = "0f29b51698198e6999c91f4adce3119c8c457f546b133a85ba
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET = "arm"
+
+# vapigen.m4 bundled with the tarball does not yet have our cross-compilation fixes
+do_configure_prepend() {
+    rm -f ${S}/build/m4/vapigen.m4
+}
+
+# Secret-1: poky/build-mips64/tmp/work/mips64-poky-linux/libgpg-error/1.19-r0/libgpg-error-1.19/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
+# qemu: uncaught target signal 6 (Aborted) - core dumped
+EXTRA_OECONF_append_mips64 = " --disable-introspection"
+
diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb b/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
index 97d6b88..495894b 100644
--- a/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
+++ b/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 BPN = "libwnck"
 
 SECTION = "x11/libs"
-DEPENDS = "gobject-introspection-stub gtk+3 gdk-pixbuf-native libxres"
+DEPENDS = "gtk+3 gdk-pixbuf-native libxres"
 
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
-inherit gnomebase
+inherit gnomebase gobject-introspection
 SRC_URI[archive.md5sum] = "d96c0b74c4dc5fdae758964098603c90"
 SRC_URI[archive.sha256sum] = "bb643c9c423c8aa79c59973ce27ce91d3b180d1e9907902278fb79391f52befa"
 
diff --git a/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch b/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
new file mode 100644
index 0000000..812da21
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
@@ -0,0 +1,121 @@
+From 867a512eddbeb1899d3e7096df3da1dd0ce3e7b7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 23 Oct 2015 14:06:17 +0300
+Subject: [PATCH] Drop introspection macros from acinclude.m4
+
+They take precendence over our customized macros, and so
+introspection doesn't work correctly.
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ acinclude.m4 | 96 ------------------------------------------------------------
+ 1 file changed, 96 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 8899c7c..48fd5d8 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -55,99 +55,3 @@ AC_DEFUN([JH_CHECK_XML_CATALOG],
+ ])
+ 
+ 
+-dnl REMOVE THIS WHEN introspection.m4 is widely available
+-dnl
+-dnl -*- mode: autoconf -*-
+-dnl Copyright 2009 Johan Dahlin
+-dnl
+-dnl This file is free software; the author(s) gives unlimited
+-dnl permission to copy and/or distribute it, with or without
+-dnl modifications, as long as this notice is preserved.
+-dnl
+-
+-# serial 1
+-
+-m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
+-[
+-    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
+-    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
+-    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
+-
+-    dnl enable/disable introspection
+-    m4_if([$2], [require],
+-    [dnl
+-        enable_introspection=yes
+-    ],[dnl
+-        AC_ARG_ENABLE(introspection,
+-                  AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
+-                                 [Enable introspection for this build]),, 
+-                                 [enable_introspection=auto])
+-    ])dnl
+-
+-    AC_MSG_CHECKING([for gobject-introspection])
+-
+-    dnl presence/version checking
+-    AS_CASE([$enable_introspection],
+-    [no], [dnl
+-        found_introspection="no (disabled, use --enable-introspection to enable)"
+-    ],dnl
+-    [yes],[dnl
+-        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
+-                         AC_MSG_ERROR([gobject-introspection-1.0 is not installed]))
+-        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
+-                         found_introspection=yes,
+-                         AC_MSG_ERROR([You need to have gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
+-    ],dnl
+-    [auto],[dnl
+-        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1], found_introspection=yes, found_introspection=no)
+-    ],dnl
+-    [dnl	
+-        AC_MSG_ERROR([invalid argument passed to --enable-introspection, should be one of @<:@no/auto/yes@:>@])
+-    ])dnl
+-
+-    AC_MSG_RESULT([$found_introspection])
+-
+-    INTROSPECTION_SCANNER=
+-    INTROSPECTION_COMPILER=
+-    INTROSPECTION_GENERATE=
+-    INTROSPECTION_GIRDIR=
+-    INTROSPECTION_TYPELIBDIR=
+-    if test "x$found_introspection" = "xyes"; then
+-       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
+-       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
+-       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
+-       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
+-       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
+-       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
+-    fi
+-    AC_SUBST(INTROSPECTION_SCANNER)
+-    AC_SUBST(INTROSPECTION_COMPILER)
+-    AC_SUBST(INTROSPECTION_GENERATE)
+-    AC_SUBST(INTROSPECTION_GIRDIR)
+-    AC_SUBST(INTROSPECTION_TYPELIBDIR)
+-    AC_SUBST(INTROSPECTION_CFLAGS)
+-    AC_SUBST(INTROSPECTION_LIBS)
+-    AC_SUBST(INTROSPECTION_MAKEFILE)
+-
+-    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
+-])
+-
+-
+-dnl Usage:
+-dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
+-
+-AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
+-[
+-  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
+-])
+-
+-dnl Usage:
+-dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
+-
+-
+-AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
+-[
+-  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
+-])
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/pango/pango_1.38.1.bb b/meta/recipes-graphics/pango/pango_1.38.1.bb
index a9a7500..7fc65fd 100644
--- a/meta/recipes-graphics/pango/pango_1.38.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.38.1.bb
@@ -11,7 +11,11 @@ LICENSE = "LGPLv2.0+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-SRC_URI += "file://run-ptest"
+inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
+
+SRC_URI += "file://run-ptest \
+            file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
+"
 
 SRC_URI[archive.md5sum] = "7fde35d4a127b55ce8bbcefe109bc80d"
 SRC_URI[archive.sha256sum] = "1320569f6c6d75d6b66172b2d28e59c56ee864ee9df202b76799c4506a214eb7"
@@ -21,11 +25,9 @@ DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo h
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"
 
-inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even
-
 EXTRA_AUTORECONF = ""
 
-EXTRA_OECONF = "--disable-introspection \
+EXTRA_OECONF = " \
 	        --disable-debug \
 	        "
 
diff --git a/meta/recipes-support/atk/at-spi2-core_2.18.3.bb b/meta/recipes-support/atk/at-spi2-core_2.18.3.bb
index f22bb83..eced597 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.18.3.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.18.3.bb
@@ -13,11 +13,11 @@ SRC_URI[sha256sum] = "ada26add94155f97d0f601a20cb7a0e3fd3ba1588c3520b72883164940
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native gettext-native"
 
-inherit autotools gtk-doc pkgconfig distro_features_check upstream-version-is-even
+inherit autotools gtk-doc pkgconfig distro_features_check upstream-version-is-even gobject-introspection
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-EXTRA_OECONF = "--disable-introspection --disable-xevie --with-dbus-daemondir=${bindir}"
+EXTRA_OECONF = "--disable-xevie --with-dbus-daemondir=${bindir}"
 
 FILES_${PN} += "${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/accessibility-services/*.service"
diff --git a/meta/recipes-support/atk/atk_2.18.0.bb b/meta/recipes-support/atk/atk_2.18.0.bb
index 97e2d22..3c0e82d 100644
--- a/meta/recipes-support/atk/atk_2.18.0.bb
+++ b/meta/recipes-support/atk/atk_2.18.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 DEPENDS = "glib-2.0"
 
-inherit gnomebase gtk-doc upstream-version-is-even
+inherit gnomebase gtk-doc upstream-version-is-even gobject-introspection
 
 SRC_URI[archive.md5sum] = "fd3678f35004b4c92e3da39356996054"
 SRC_URI[archive.sha256sum] = "ce6c48d77bf951083029d5a396dd552d836fff3c1715d3a7022e917e46d0c92b"
@@ -18,4 +18,4 @@ SRC_URI[archive.sha256sum] = "ce6c48d77bf951083029d5a396dd552d836fff3c1715d3a702
 BBCLASSEXTEND = "native"
 
 EXTRA_OECONF = "--disable-glibtest \
-                --disable-introspection"
+               "
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 68499d6..8565cc2 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -1,13 +1,13 @@
 SUMMARY = "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
 LICENSE = "LGPLv2.0"
-DEPENDS = " glib-2.0 gtk+ intltool-native ncurses gobject-introspection-stub"
+DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
 RDEPENDS_libvte = "vte-termcap"
 
-inherit gnome gtk-doc distro_features_check upstream-version-is-even
+inherit gnome gtk-doc distro_features_check upstream-version-is-even gobject-introspection
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-EXTRA_OECONF = "--disable-python --disable-introspection"
+EXTRA_OECONF = "--disable-python"
 
 PACKAGES =+ "libvte vte-termcap"
 FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 8b4e7f7..74087ca 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 PR = "r6"
 
 SRC_URI += "file://obsolete_automake_macros.patch \
-            file://cve-2012-2738.patch"
+            file://cve-2012-2738.patch \
+           "
 
 CFLAGS += "-D_GNU_SOURCE"
 
-- 
2.7.0


