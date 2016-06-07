Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D5CA5771A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 01:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174730"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:37 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:47 +0300
Message-Id: <81de01080e7d3180df7badba586f16c87160c893.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 29/37] sysprof: Upgrade to git version slightly past 3.20
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:47 -0000

New version uses Gtk+3.

3.20 release requires a bunch of fixes to build without polkit,
this git revision inclues those fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../sysprof/files/0001-Avoid-building-docs.patch   | 42 ++++++++++++++++++++++
 .../0001-Disable-check-for-polkit-for-UI.patch     | 32 +++++++++++++++++
 .../sysprof/files/define-NT_GNU_BUILD_ID.patch     |  4 +--
 .../sysprof/files/gui-argument.patch               | 35 ------------------
 meta/recipes-kernel/sysprof/files/rmb-arm.patch    | 21 -----------
 meta/recipes-kernel/sysprof/files/rmb-mips.patch   | 22 ------------
 meta/recipes-kernel/sysprof/sysprof_git.bb         | 32 +++++++++--------
 7 files changed, 93 insertions(+), 95 deletions(-)
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/rmb-arm.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/rmb-mips.patch

diff --git a/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch b/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
new file mode 100644
index 0000000..202f354
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
@@ -0,0 +1,42 @@
+From 27df521c68e7c8b5b050dab15f40aa15fd03623a Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 4 May 2016 14:58:24 +0300
+Subject: [PATCH] Avoid building docs
+
+Upstream-Status: Inappropriate
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ Makefile.am | 2 +-
+ m4/yelp.m4  | 6 ------
+ 2 files changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b919a3f..3a3851d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = daemon data help lib po src tools tests
++SUBDIRS = daemon data lib po src tools tests
+ 
+ EXTRA_DIST = AUTHORS tap-test COPYING.gpl-2
+ 
+diff --git a/m4/yelp.m4 b/m4/yelp.m4
+index 5db847f..1b6ede4 100644
+--- a/m4/yelp.m4
++++ b/m4/yelp.m4
+@@ -27,12 +27,6 @@ AC_ARG_WITH([help-dir],
+ HELP_DIR="$with_help_dir"
+ AC_SUBST(HELP_DIR)
+ 
+-AC_ARG_VAR([ITSTOOL], [Path to the `itstool` command])
+-AC_CHECK_PROG([ITSTOOL], [itstool], [itstool])
+-if test x"$ITSTOOL" = x; then
+-  AC_MSG_ERROR([itstool not found])
+-fi
+-
+ AC_ARG_VAR([XMLLINT], [Path to the `xmllint` command])
+ AC_CHECK_PROG([XMLLINT], [xmllint], [xmllint])
+ if test x"$XMLLINT" = x; then
+-- 
+2.1.4
+
diff --git a/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch b/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
new file mode 100644
index 0000000..6085232
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
@@ -0,0 +1,32 @@
+From 765d578145e31ddc9495adfab8037ade33c6a9cc Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 4 May 2016 10:59:36 +0300
+Subject: [PATCH] Disable check for polkit for UI
+
+The check is not technically required: sysprof just needs
+to be able to access system perf counters at runtime.
+
+Upstream-Status: Pending
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8559597..ecf93ad 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -131,8 +131,8 @@ AS_IF([test "$enable_gtk" = auto],[
+ 	AS_IF([test "$have_gtk" = "yes" && test "$have_polkit" = "yes"],[enable_gtk=yes],[enable_gtk=no])
+ ])
+ AS_IF([test "$enable_gtk" = "yes"],[
+-	AS_IF([test "$have_gtk" = "yes" && test "$have_polkit" = "yes"],[],[
+-		AC_MSG_ERROR([--enable-gtk requires gtk+-3.0 >= gtk_required_version and polkit-gobject-1])
++	AS_IF([test "$have_gtk" = "yes"],[],[
++		AC_MSG_ERROR([--enable-gtk requires gtk+-3.0 >= gtk_required_version])
+ 	])
+ ])
+ AM_CONDITIONAL(ENABLE_GTK, test "$enable_gtk" = "yes")
+-- 
+2.8.1
+
diff --git a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
index dcc2cbe..f75ddad 100644
--- a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
+++ b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
@@ -7,8 +7,8 @@ Upstream-Status: Pending
 
 Index: git/elfparser.h
 ===================================================================
---- git.orig/elfparser.h	2011-07-16 18:57:41.000000000 -0700
-+++ git/elfparser.h	2011-07-16 20:28:54.733829895 -0700
+--- git.orig/lib/util/elfparser.h	2011-07-16 18:57:41.000000000 -0700
++++ git/lib/util/elfparser.h	2011-07-16 20:28:54.733829895 -0700
 @@ -17,6 +17,10 @@
   */
  #include <glib.h>
diff --git a/meta/recipes-kernel/sysprof/files/gui-argument.patch b/meta/recipes-kernel/sysprof/files/gui-argument.patch
deleted file mode 100644
index d2c053e..0000000
--- a/meta/recipes-kernel/sysprof/files/gui-argument.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Add the ability to explicitly enable/disable GUI support
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-Status: Pending
-
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -62,12 +62,24 @@ KMICRO=`uname -r | cut -d"." -f 3 | cut
- # Pkgconfig dependencies
- 
- core_dep="glib-2.0 >= 2.6.0"
--gui_dep="gtk+-2.0 > 2.6.0 gdk-pixbuf-2.0 pangoft2 libglade-2.0"
- 
- PKG_CHECK_MODULES(CORE_DEP, $core_dep, [], AC_MSG_ERROR([sysprof dependencies not satisfied]))
- 
--build_gui=yes
--PKG_CHECK_MODULES(GUI_DEP, $gui_dep, [], build_gui=no)
-+gui_dep="gtk+-2.0 > 2.6.0 gdk-pixbuf-2.0 pangoft2 libglade-2.0"
-+
-+AC_ARG_ENABLE([gui],
-+  [AS_HELP_STRING([--disable-gui],
-+    [Disable GUI functionality (requires gtk+, gdk-pixbuf, pangoft2, libglade) @<:@default=auto@:>@])],
-+  [],
-+  [enable_gui=auto])
-+
-+build_gui=no
-+AS_IF([test "x$enable_gui" != xno],
-+  [PKG_CHECK_MODULES(GUI_DEP, $gui_dep, build_gui=yes,
-+    [if test "x$enable_gui" != xauto; then
-+       AC_MSG_FAILURE(
-+         [--enable-gui was given, but gui dependencies were not satisfied])
-+     fi])])
- 
- AM_CONDITIONAL([BUILD_GUI], [test "$build_gui" = yes])
- 
diff --git a/meta/recipes-kernel/sysprof/files/rmb-arm.patch b/meta/recipes-kernel/sysprof/files/rmb-arm.patch
deleted file mode 100644
index c53ac64..0000000
--- a/meta/recipes-kernel/sysprof/files/rmb-arm.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-
-Upstream-Status: Pending
-
-Index: git/util.h
-===================================================================
---- git.orig/util.h	2010-12-07 22:41:57.156243001 -0600
-+++ git/util.h	2010-12-07 22:43:47.616243002 -0600
-@@ -37,4 +37,13 @@
- #define cpu_relax()     asm volatile("" ::: "memory");
- #endif
- 
-+#ifdef __arm__
-+/*
-+ * Use the __kuser_memory_barrier helper in the CPU helper page. See
-+ * arch/arm/kernel/entry-armv.S in the kernel source for details.
-+ */
-+#define rmb()		((void(*)(void))0xffff0fa0)()
-+#define cpu_relax()	asm volatile("":::"memory")
-+#endif
-+
- #endif
diff --git a/meta/recipes-kernel/sysprof/files/rmb-mips.patch b/meta/recipes-kernel/sysprof/files/rmb-mips.patch
deleted file mode 100644
index e055b8a..0000000
--- a/meta/recipes-kernel/sysprof/files/rmb-mips.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/util.h
-===================================================================
---- git.orig/util.h	2010-12-08 01:22:44.486243001 -0600
-+++ git/util.h	2010-12-08 01:23:27.836243001 -0600
-@@ -37,4 +37,15 @@
- #define cpu_relax()     asm volatile("" ::: "memory");
- #endif
- 
-+#ifdef __mips__
-+#define rmb()		asm volatile(					\
-+				".set	mips2\n\t"			\
-+				"sync\n\t"				\
-+				".set	mips0"				\
-+				: /* no output */			\
-+				: /* no input */			\
-+				: "memory")
-+#define cpu_relax()	asm volatile("" ::: "memory")
-+#endif
-+
- #endif
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 84c6aad..3b06e6f 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -1,29 +1,31 @@
 SUMMARY = "System-wide Performance Profiler for Linux"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
+
+inherit gnomebase gettext
 
 DEPENDS = "glib-2.0"
 
-SRCREV = "cd44ee6644c3641507fb53b8a2a69137f2971219"
-PV = "1.2.0+git${SRCPV}"
+S = "${WORKDIR}/git"
+SRCREV = "9c6cec9b49766bf77c1713bc5a7c6d651e628068"
+PV = "3.20.0+git${SRCPV}"
 
 SRC_URI = "git://git.gnome.org/sysprof \
            file://define-NT_GNU_BUILD_ID.patch \
-           file://gui-argument.patch \
+           file://0001-Disable-check-for-polkit-for-UI.patch \
+           file://0001-Avoid-building-docs.patch \
           "
+SRC_URI[archive.md5sum] = "d56e8492033b60e247634731e7f760b9"
+SRC_URI[archive.sha256sum] = "4a338ad41bfffae87ef281f6e75c9660b3e0c6671bf5233be0c3f55a5e5b1ce5"
 
-SRC_URI_append_arm  = " file://rmb-arm.patch"
-SRC_URI_append_armeb  = " file://rmb-arm.patch"
-SRC_URI_append_mips = " file://rmb-mips.patch"
-SRC_URI_append_mips64 = " file://rmb-mips.patch"
-SRC_URI_append_mips64n32 = " file://rmb-mips.patch"
-
-S = "${WORKDIR}/git"
+AUTOTOOLS_AUXDIR = "${S}/build-aux"
 
-inherit autotools pkgconfig
+PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
 
-PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK2DISTROFEATURES}', 'gui', '', d)}"
-PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,gtk+ gdk-pixbuf pango libglade"
+FILES_${PN} += "${datadir}/icons/ ${libdir}"
+FILES_${PN}-dev = "${prefix}/include"
 
 # We do not yet work for aarch64.
 #
-- 
2.1.4


