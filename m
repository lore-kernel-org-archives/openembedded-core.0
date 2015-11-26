Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B2E2A65D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2015 06:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574807"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:25 +0200
Message-Id: <a8eeaed3c3bc4134b39fcd19fe62248c4f7c5037.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/29] gnomebase.bbclass: enable gobject introspection
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:22 -0000

This also requires various tweaks to recipes that depend on this class, which are included in this commit as well.

One of those tweaks is that pygobject is finally updated to the latest upstream release.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gnomebase.bbclass                     |   5 +-
 ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch |  41 +++++++
 .../obsolete_automake_macros.patch                 |  23 ----
 .../python/python-pygobject_2.28.3.bb              |  53 ---------
 .../python/python-pygobject_3.18.2.bb              |  29 +++++
 .../gsettings-desktop-schemas_3.16.1.bb            |   2 +-
 meta/recipes-gnome/librsvg/librsvg_2.40.11.bb      |   3 -
 ...ation-paths-for-.gir-and-.typelib-as-reco.patch |  32 ++++++
 meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb      |   3 +-
 meta/recipes-graphics/pango/pango.inc              |   5 +-
 ...op-introspection-macros-from-acinclude.m4.patch | 121 +++++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.38.1.bb        |   1 +
 meta/recipes-support/atk/atk_2.18.0.bb             |   2 +-
 ...file.am-install-gir-typelib-using-datadir.patch |  34 ++++++
 meta/recipes-support/vte/vte.inc                   |   4 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |   3 +-
 16 files changed, 269 insertions(+), 92 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygobject_2.28.3.bb
 create mode 100644 meta/recipes-devtools/python/python-pygobject_3.18.2.bb
 create mode 100644 meta/recipes-gnome/libwnck/files/0001-Fix-installation-paths-for-.gir-and-.typelib-as-reco.patch
 create mode 100644 meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
 create mode 100644 meta/recipes-support/vte/vte-0.28.2/0001-Makefile.am-install-gir-typelib-using-datadir.patch

diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index d22ba5a..8310193 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -20,7 +20,7 @@ FILES_${PN} += "${datadir}/application-registry  \
 
 FILES_${PN}-doc += "${datadir}/devhelp"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gobject-introspection
 
 do_install_append() {
 	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
@@ -28,6 +28,3 @@ do_install_append() {
 	rm -f ${D}${datadir}/applications/*.cache
 }
 
-EXTRA_OECONF += "--disable-introspection"
-
-UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"
diff --git a/meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch b/meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
new file mode 100644
index 0000000..a391f7e
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
@@ -0,0 +1,41 @@
+From 5e5350d730f85957a42c6d846d347d080e7dd996 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 23 Oct 2015 12:40:34 +0300
+Subject: [PATCH] configure.ac: add sysroot path to GI_DATADIR; don't set
+ introspection scanner and compiler paths
+
+Upstream-Status: Pending [review on oe-core maillist]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2c0cfbd..cfcb3bf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -194,7 +194,7 @@ PKG_CHECK_MODULES(GI,
+     gobject-introspection-1.0 >= introspection_required_version
+ )
+ 
+-GI_DATADIR=$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
++GI_DATADIR=$PKG_CONFIG_SYSROOT_DIR$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
+ AC_SUBST(GI_DATADIR)
+ 
+ if test "$enable_cairo" != no; then
+@@ -219,12 +219,6 @@ AC_ARG_WITH(common,
+     with_common=yes)
+ AM_CONDITIONAL(WITH_COMMON, test "$with_common" = "yes")
+ 
+-INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-
+-AC_SUBST(INTROSPECTION_SCANNER)
+-AC_SUBST(INTROSPECTION_COMPILER)
+-
+ # compiler warnings, errors, required cflags, and code coverage support
+ GNOME_COMPILE_WARNINGS([maximum])
+ AC_MSG_CHECKING(for Gnome code coverage support)
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch b/meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch
deleted file mode 100644
index c259112..0000000
--- a/meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Accepted [https://bugzilla.gnome.org/show_bug.cgi?id=691101]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd pygobject-2.27.91/configure.ac pygobject-2.27.91/configure.ac
---- pygobject-2.27.91/configure.ac	2011-02-23 22:14:37.000000000 +0200
-+++ pygobject-2.27.91/configure.ac	2013-01-03 05:13:44.034949954 +0200
-@@ -35,7 +35,7 @@
- AC_DEFINE(PYGOBJECT_MICRO_VERSION, pygobject_micro_version, [pygobject micro version])
- AC_SUBST(PYGOBJECT_MICRO_VERSION, pygobject_micro_version)
-
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES(yes)])
- AM_INIT_AUTOMAKE(foreign)
- AM_MAINTAINER_MODE
-@@ -82,7 +82,6 @@
- m4_ifdef([LT_OUTPUT], [LT_OUTPUT])
- AC_ISC_POSIX
- AC_PROG_CC
--AM_PROG_CC_STDC
- AM_PROG_CC_C_O
-
- # check that we have the minimum version of python necisary to build
diff --git a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
deleted file mode 100644
index 81d37b4..0000000
--- a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Python GObject bindings"
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
-
-RECIPE_NO_UPDATE_REASON = "Newer versions of python-pygobject depend on gobject-introspection which doesn't cross-compile"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-DEPENDS = "python python-pygobject-native libffi glib-2.0"
-DEPENDS_class-native = "python-native libffi-native glib-2.0-native"
-RDEPENDS_class-native = ""
-
-MAJ_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-SRC_URI = "${GNOME_MIRROR}/pygobject/${MAJ_VER}/pygobject-${PV}.tar.bz2 \
-           file://obsolete_automake_macros.patch \
-"
-
-# libtool-native doesn't have fixinstall.patch applied which means
-# that libs get relinked at installation time. This triggers a 
-# relinking along the lines of:
-# gcc -L/tmp/foo/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/lib -lpyglib-2.0-python -o .libs/_glib.so
-# where /tmp/foo is DESTDIR and pyglib-2.0-python may be installed/reinstalled
-# at the same time as the gcc command runs.
-# If this happens between the handoff between gcc and ld, you can see:
-# /bin/ld: cannot find -lpyglib-2.0-python
-# Adding a dependency rule like  install-pyglibLTLIBRARIES: install-libLTLIBRARIES
-# would be ideal but automake can't cope with that without manually 
-# defining the whole function. Give up and disable parallel make in native builds.
-PARALLEL_MAKEINST_class-native = ""
-
-SRC_URI[md5sum] = "aa64900b274c4661a5c32e52922977f9"
-SRC_URI[sha256sum] = "7da88c169a56efccc516cebd9237da3fe518a343095a664607b368fe21df95b6"
-S = "${WORKDIR}/pygobject-${PV}"
-
-EXTRA_OECONF += "--disable-introspection"
-
-inherit autotools distutils-base pkgconfig
-
-# necessary to let the call for python-config succeed
-export BUILD_SYS
-export HOST_SYS
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-PACKAGES += "${PN}-lib"
-
-RDEPENDS_${PN} += "python-textutils"
-
-FILES_${PN} = "${libdir}/python*"
-FILES_${PN}-lib = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir} ${datadir}"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
new file mode 100644
index 0000000..c4554e6
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Python GObject bindings"
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+
+inherit autotools pkgconfig gnomebase distutils3-base
+
+DEPENDS = "python3 glib-2.0 gnome-common"
+
+SRCNAME="pygobject"
+SRC_URI = " \
+    http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
+    file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
+"
+SRC_URI[md5sum] = "0a956f3e785e23b0f136832f2e57a862"
+SRC_URI[sha256sum] = "2a3cad1517916b74e131e6002c3824361aee0671ffb0d55ded119477fc1c2c5f"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+BBCLASSEXTEND = "native"
+
+export STAGING_LIBDIR
+export STAGING_INCDIR
+export BUILD_SYS
+export HOST_SYS
+
+EXTRA_OECONF = "--disable-cairo"
+
+RDEPENDS_${PN} += "python3-setuptools"
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb
index f2f2c75..efb813a 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "glib-2.0 intltool-native gobject-introspection-stub-native"
+DEPENDS = "glib-2.0 intltool-native"
 
 inherit gnomebase gsettings gettext
 
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
index 8c5206b..9920049 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
@@ -19,8 +19,6 @@ SRC_URI[archive.sha256sum] = "611ac0f544debd0c9bf1ef5509c990d218e83dd1d8c8329707
 
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
 FILES_${PN}-dbg += "${libdir}/gdk-pixbuf-2.0/*/loaders/.debug"
 FILES_rsvg = "${bindir}/rsvg* \
 	      ${datadir}/pixmaps/svg-viewer.svg \
diff --git a/meta/recipes-gnome/libwnck/files/0001-Fix-installation-paths-for-.gir-and-.typelib-as-reco.patch b/meta/recipes-gnome/libwnck/files/0001-Fix-installation-paths-for-.gir-and-.typelib-as-reco.patch
new file mode 100644
index 0000000..993c18a
--- /dev/null
+++ b/meta/recipes-gnome/libwnck/files/0001-Fix-installation-paths-for-.gir-and-.typelib-as-reco.patch
@@ -0,0 +1,32 @@
+From c41bed70e28112246cc06d31b2cf39091d63b52d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 26 Oct 2015 19:43:21 +0200
+Subject: [PATCH] Fix installation paths for .gir and .typelib as recommended
+ by gobject-introspection documentation.
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libwnck/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libwnck/Makefile.am b/libwnck/Makefile.am
+index 4a105e6..a0b249a 100644
+--- a/libwnck/Makefile.am
++++ b/libwnck/Makefile.am
+@@ -182,10 +182,10 @@ Wnck_3_0_gir_SCANNERFLAGS = --pkg-export=libwnck-3.0
+ Wnck_3_0_gir_FILES = $(introspection_sources)
+ INTROSPECTION_GIRS += Wnck-3.0.gir
+ 
+-girdir = $(INTROSPECTION_GIRDIR)
++girdir = $(datadir)/gir-1.0
+ gir_DATA = $(INTROSPECTION_GIRS)
+ 
+-typelibdir = $(INTROSPECTION_TYPELIBDIR)
++typelibdir = $(libdir)/girepository-1.0
+ typelib_DATA = $(INTROSPECTION_GIRS:.gir=.typelib)
+ 
+ CLEANFILES += $(gir_DATA) $(typelib_DATA)
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb b/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
index 3ee1ae9..b0da43e 100644
--- a/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
+++ b/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
@@ -5,12 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 BPN = "libwnck"
 
 SECTION = "x11/libs"
-DEPENDS = "gobject-introspection-stub gtk+3 gdk-pixbuf-native libxres"
+DEPENDS = "gtk+3 gdk-pixbuf-native libxres"
 
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
 inherit gnomebase
+SRC_URI += "file://0001-Fix-installation-paths-for-.gir-and-.typelib-as-reco.patch"
 SRC_URI[archive.md5sum] = "4538672e0d775fadedf10abeb8020047"
 SRC_URI[archive.sha256sum] = "f5080076346609b4c36394b879f3a86b92ced3b90a37cb54c8e9a14f00e7921c"
 
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 04143bd..3b4678d 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -28,9 +28,8 @@ EXTRA_AUTORECONF = ""
 # seems to go wrong with default cflags
 FULL_OPTIMIZATION_arm = "-O2"
 
-EXTRA_OECONF = "--disable-introspection \
-	        --disable-debug \
-	        "
+EXTRA_OECONF = "--disable-debug \
+               "
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.8.0"
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
index d85c17b..d7e89fe 100644
--- a/meta/recipes-graphics/pango/pango_1.38.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.38.1.bb
@@ -3,6 +3,7 @@ require pango.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SRC_URI += "file://run-ptest \
+            file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
 "
 
 SRC_URI[archive.md5sum] = "7fde35d4a127b55ce8bbcefe109bc80d"
diff --git a/meta/recipes-support/atk/atk_2.18.0.bb b/meta/recipes-support/atk/atk_2.18.0.bb
index 83bcae0..f300d22 100644
--- a/meta/recipes-support/atk/atk_2.18.0.bb
+++ b/meta/recipes-support/atk/atk_2.18.0.bb
@@ -18,4 +18,4 @@ SRC_URI[archive.sha256sum] = "ce6c48d77bf951083029d5a396dd552d836fff3c1715d3a702
 BBCLASSEXTEND = "native"
 
 EXTRA_OECONF = "--disable-glibtest \
-                --disable-introspection"
+               "
diff --git a/meta/recipes-support/vte/vte-0.28.2/0001-Makefile.am-install-gir-typelib-using-datadir.patch b/meta/recipes-support/vte/vte-0.28.2/0001-Makefile.am-install-gir-typelib-using-datadir.patch
new file mode 100644
index 0000000..6971b7b
--- /dev/null
+++ b/meta/recipes-support/vte/vte-0.28.2/0001-Makefile.am-install-gir-typelib-using-datadir.patch
@@ -0,0 +1,34 @@
+From 4d6c01666e50068935e116cb98f7d142936597ed Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 27 Oct 2015 15:23:54 +0200
+Subject: [PATCH] Makefile.am: install gir/typelib using $(datadir)
+
+This is recommended by gobject-introspection docs, and works
+in sysroot environments.
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 1971458..4929f0c 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -182,10 +182,10 @@ Vte_@VTE_API_VERSION_U@_gir_FILES = \
+ 
+ INTROSPECTION_GIRS += Vte-$(VTE_API_VERSION).gir
+ 
+-girdir = $(INTROSPECTION_GIRDIR)
++girdir = $(datadir)/gir-1.0
+ nodist_gir_DATA = $(INTROSPECTION_GIRS)
+ 
+-typelibdir = $(INTROSPECTION_TYPELIBDIR)
++typelibdir = $(libdir)/girepository-1.0
+ nodist_typelib_DATA = $(INTROSPECTION_GIRS:.gir=.typelib)
+ 
+ CLEANFILES += $(nodist_gir_DATA) $(nodist_typelib_DATA)
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 07b9e10..6cf860d 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -1,13 +1,13 @@
 SUMMARY = "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
 LICENSE = "LGPLv2.0"
-DEPENDS = " glib-2.0 gtk+ intltool-native ncurses gobject-introspection-stub"
+DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
 RDEPENDS_libvte = "vte-termcap"
 
 inherit gnome gtk-doc distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-EXTRA_OECONF = "--disable-python --disable-introspection"
+EXTRA_OECONF = "--disable-python"
 
 PACKAGES =+ "libvte vte-termcap"
 FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 8b4e7f7..c047d9f 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 PR = "r6"
 
 SRC_URI += "file://obsolete_automake_macros.patch \
-            file://cve-2012-2738.patch"
+            file://cve-2012-2738.patch \
+            file://0001-Makefile.am-install-gir-typelib-using-datadir.patch"
 
 CFLAGS += "-D_GNU_SOURCE"
 
-- 
2.6.2


