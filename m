Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id EE9006A562
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:09:08 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hr14so793979wib.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=gnxFVO1lh5EJO7oQqopRT5Al+vrz4MOYC5j/lScHIhk=;
	b=pVx/HPHOGd/KO9QXowBaU1XKqJ+B3Fby1Vj7zN6lDmJTB5LCHAvan4ZzOuCZ8IIDkD
	0HjOfHevIzuTvxRehR0x5Pyy34fGc4ONwuqgz7WpaV/4ii05Q/Pb2F5q/xTE7NsQ3k8E
	TSzPDVd6xIdFHAp7W4A4h3g7jkEhK6i2UkXWrERDovWreo1LAv1/kgCGE9XSPYaLBSLY
	0xmS7CBf2uF1v7KLEDjphJ03E10W0OecZMVtkXmo87Gj76DX9fZyqpZAKeEiHdw3n4Fb
	xUzIiXGXTRjPOZVkgIXDZ61rp62wJmZn+EWFjtiJ2B7rsX6k6gABBRduNJCsR9T39dLZ
	yZ4Q==
X-Received: by 10.180.19.72 with SMTP id c8mr3760062wie.35.1370012949610;
	Fri, 31 May 2013 08:09:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu14sm4546170wic.8.2013.05.31.08.09.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:09:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:05:39 +0100
Message-Id: <20a27607777a1b75bbf7a3c4a41baa2f91356d64.1370012689.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlvXTwUT55tj8c02ha6ZuuO+Q3lypw8xwrOK7r+Y/YWOYq90lh4DN1wzTftQ1nWM80kHYTM
Subject: [PATCH 03/11] gtk+3: update to 3.8.2
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
X-List-Received-Date: Fri, 31 May 2013 15:09:09 -0000

Drop cross.patch as it was a backport and is integrated upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3/cross.patch          |  293 --------------------
 .../gtk+/{gtk+3_3.4.4.bb => gtk+3_3.8.2.bb}        |    9 +-
 2 files changed, 5 insertions(+), 297 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/cross.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.4.4.bb => gtk+3_3.8.2.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/cross.patch b/meta/recipes-gnome/gtk+/gtk+3/cross.patch
deleted file mode 100644
index f2ea99b..0000000
--- a/meta/recipes-gnome/gtk+/gtk+3/cross.patch
+++ /dev/null
@@ -1,293 +0,0 @@
-Upstream-Status: Backport [SHA 53083ea7b423482b203372f02d097edbef894a7d]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From b670abe861e8dde067f544b9131edc28575d63ab Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 7 Jan 2013 12:49:27 +0000
-Subject: [PATCH] build: support cross-compilation by natively building
- gtk-update-icon-cache
-
-When cross-compiling, instead of depending on a natively built GTK+ (which means
-building Glib, ATK, Pango, gdk-pixbuf, libX11...) for gtk-update-icon-cache,
-find the host compiler and gdk-pixbuf, and build another gtk-update-icon-cache
-with that.
-
-This uses AX_PROG_CC_FOR_BUILD from autostars to find the host compiler, and
-assumes that you'd set PKG_CONFIG_FOR_BUILD to a host pkg-config binary.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=691301
----
- configure.ac               |   39 ++++++++++----
- gtk/Makefile.am            |   12 ++++-
- gtk/native/Makefile.am     |   12 +++++
- m4/ax_prog_cc_for_build.m4 |  125 ++++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 177 insertions(+), 11 deletions(-)
- create mode 100644 gtk/native/Makefile.am
- create mode 100644 m4/ax_prog_cc_for_build.m4
-
-diff --git a/configure.ac b/configure.ac
-index 0069a9f..f502e06 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -29,6 +29,9 @@ AC_CONFIG_SRCDIR([gdk/gdktypes.h])
- AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_AUX_DIR([build-aux])
- 
-+AC_CANONICAL_HOST
-+AC_CANONICAL_TARGET
-+
- # Define a string for the earliest version that this release has
- # backwards binary compatibility with for all interfaces a module
- # might. Unless we add module-only API with lower stability
-@@ -123,6 +126,7 @@ AC_SUBST([GAIL_LT_CURRENT_MINUS_AGE],[gail_lt_current_minus_age])
- 
- # Checks for programs.
- AC_PROG_CC
-+AX_PROG_CC_FOR_BUILD
- AC_PROG_CC_C_O
- AC_PROG_CC_STDC
- AC_PROG_MKDIR_P
-@@ -135,8 +139,6 @@ AC_SUBST(GETTEXT_PACKAGE)
- AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE",
-                    [The prefix for our gettext translation domains.])
- 
--AC_CANONICAL_HOST
--
- MATH_LIB=-lm
- AC_MSG_CHECKING([for native Win32])
- LIB_EXE_MACHINE_FLAG=X86
-@@ -868,14 +870,32 @@ dnl Look for a host system's gdk-pixbuf-csource if we are cross-compiling
- 
- AM_CONDITIONAL(CROSS_COMPILING, test $cross_compiling = yes)
- 
--if test "x$cross_compiling" = xyes || test "x$enable_gtk2_dependency" = xyes; then
--  AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache, no)
--  if test x$GTK_UPDATE_ICON_CACHE = xno; then
--    REBUILD_PNGS=#
--  fi
--fi
-+AS_IF([test "x$enable_gtk2_dependency" = xyes],
-+      [AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache, no)
-+       if test x$GTK_UPDATE_ICON_CACHE = xno; then
-+         REBUILD_PNGS=#
-+       fi],
-+
-+      [test "x$cross_compiling" = xyes],
-+      [# If no GTK+2 dependency and cross compiling, we need to find a host gdk-pixbuf.
-+       # pkg.m4 blocks all variable starting with PKG, so allow this one
-+       m4_pattern_allow([PKG_CONFIG_FOR_BUILD])
-+
-+       AS_IF([test x$PKG_CONFIG_FOR_BUILD = x],
-+             [AC_MSG_ERROR([You must define PKG_CONFIG_FOR_BUILD when cross compiling])])
-+
-+       AC_MSG_CHECKING([for native gdk-pixbuf])
-+       AS_IF([AC_RUN_LOG([$PKG_CONFIG_FOR_BUILD --exists --print-errors gdk-pixbuf-2.0])],
-+             [AC_MSG_RESULT([yes])],
-+             [AC_MSG_ERROR([native gdk-pixbuf not found])])
-+
-+       NATIVE_GDKPIXBUF_CFLAGS=`$PKG_CONFIG_FOR_BUILD --cflags gdk-pixbuf-2.0`
-+       NATIVE_GDKPIXBUF_LIBS=`$PKG_CONFIG_FOR_BUILD --libs gdk-pixbuf-2.0`
-+       AC_SUBST(NATIVE_GDKPIXBUF_CFLAGS)
-+       AC_SUBST(NATIVE_GDKPIXBUF_LIBS)]
-+)
- 
--AM_CONDITIONAL(USE_EXTERNAL_ICON_CACHE, [test "x$cross_compiling" = xyes || test "x$enable_gtk2_dependency" = xyes])
-+AM_CONDITIONAL(USE_EXTERNAL_ICON_CACHE, [test "x$enable_gtk2_dependency" = xyes])
- 
- AC_PATH_PROG(GDK_PIXBUF_CSOURCE, gdk-pixbuf-csource, no)
- 
-@@ -1742,6 +1762,7 @@ gtk/makefile.msc
- gtk/gtkversion.h
- gtk/gtk-win32.rc
- gtk/a11y/Makefile
-+gtk/native/Makefile
- gtk/tests/Makefile
- libgail-util/Makefile
- modules/Makefile
-diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index e763ca8..6b1ec65 100644
---- a/gtk/Makefile.am
-+++ b/gtk/Makefile.am
-@@ -16,7 +16,7 @@ else
- GTK_PRINT_PREVIEW_COMMAND="evince --unlink-tempfile --preview --print-settings %s %f"
- endif
- 
--SUBDIRS = a11y . tests
-+SUBDIRS = a11y native . tests
- 
- if HAVE_PAPI_CUPS
- GTK_PRINT_BACKENDS=file,papi,cups
-@@ -1569,12 +1569,20 @@ stamp-icons: $(STOCK_ICONS)
- if USE_EXTERNAL_ICON_CACHE
- gtk_update_icon_cache_program = $(GTK_UPDATE_ICON_CACHE)
- else
-+if CROSS_COMPILING
-+gtk_update_icon_cache_program = ./native/native-update-icon-cache
-+else
- gtk_update_icon_cache_program = ./gtk-update-icon-cache
- endif
-+endif
- 
- gtkbuiltincache.h: @REBUILD@ stamp-icons
- if !USE_EXTERNAL_ICON_CACHE
--	$(AM_V_at) $(MAKE) $(AM_MAKEFLAGS) gtk-update-icon-cache$(EXEEXT) $(GTK_UPDATE_ICON_CACHE_MANIFEST)
-+if CROSS_COMPILING
-+	$(AM_V_at) $(MAKE) $(AM_MAKEFLAGS) -C native/
-+else
-+	$(AM_V_at) $(MAKE) $(AM_MAKEFLAGS) gtk-update-icon-cache$(EXEEXT)
-+endif
- endif
- 	$(AM_V_GEN) $(gtk_update_icon_cache_program) --quiet --force --ignore-theme-index		\
- 	   --source builtin_icons stock-icons > gtkbuiltincache.h.tmp &&        \
-diff --git a/gtk/native/Makefile.am b/gtk/native/Makefile.am
-new file mode 100644
-index 0000000..4f029f6
---- /dev/null
-+++ b/gtk/native/Makefile.am
-@@ -0,0 +1,12 @@
-+CC = @CC_FOR_BUILD@
-+CFLAGS = @CFLAGS_FOR_BUILD@
-+CPP = @CPP_FOR_BUILD@
-+CPPFLAGS = @CPPFLAGS_FOR_BUILD@
-+LDFLAGS = @LDFLAGS_FOR_BUILD@
-+
-+if CROSS_COMPILING
-+noinst_PROGRAMS = native-update-icon-cache
-+native_update_icon_cache_CFLAGS = $(NATIVE_GDKPIXBUF_CFLAGS)
-+native_update_icon_cache_LDADD = $(NATIVE_GDKPIXBUF_LIBS)
-+native_update_icon_cache_SOURCES = $(srcdir)/../updateiconcache.c
-+endif
-diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
-new file mode 100644
-index 0000000..96cd98a
---- /dev/null
-+++ b/m4/ax_prog_cc_for_build.m4
-@@ -0,0 +1,125 @@
-+# ===========================================================================
-+#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
-+# ===========================================================================
-+#
-+# SYNOPSIS
-+#
-+#   AX_PROG_CC_FOR_BUILD
-+#
-+# DESCRIPTION
-+#
-+#   This macro searches for a C compiler that generates native executables,
-+#   that is a C compiler that surely is not a cross-compiler. This can be
-+#   useful if you have to generate source code at compile-time like for
-+#   example GCC does.
-+#
-+#   The macro sets the CC_FOR_BUILD and CPP_FOR_BUILD macros to anything
-+#   needed to compile or link (CC_FOR_BUILD) and preprocess (CPP_FOR_BUILD).
-+#   The value of these variables can be overridden by the user by specifying
-+#   a compiler with an environment variable (like you do for standard CC).
-+#
-+#   It also sets BUILD_EXEEXT and BUILD_OBJEXT to the executable and object
-+#   file extensions for the build platform, and GCC_FOR_BUILD to `yes' if
-+#   the compiler we found is GCC. All these variables but GCC_FOR_BUILD are
-+#   substituted in the Makefile.
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
-+#
-+#   Copying and distribution of this file, with or without modification, are
-+#   permitted in any medium without royalty provided the copyright notice
-+#   and this notice are preserved. This file is offered as-is, without any
-+#   warranty.
-+
-+#serial 7
-+
-+AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
-+AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
-+AC_REQUIRE([AC_PROG_CC])dnl
-+AC_REQUIRE([AC_PROG_CPP])dnl
-+AC_REQUIRE([AC_EXEEXT])dnl
-+AC_REQUIRE([AC_CANONICAL_SYSTEM])dnl
-+
-+dnl Use the standard macros, but make them use other variable names
-+dnl
-+pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
-+pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
-+pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
-+pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
-+pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
-+pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
-+pushdef([ac_cv_objext], ac_cv_build_objext)dnl
-+pushdef([ac_exeext], ac_build_exeext)dnl
-+pushdef([ac_objext], ac_build_objext)dnl
-+pushdef([CC], CC_FOR_BUILD)dnl
-+pushdef([CPP], CPP_FOR_BUILD)dnl
-+pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
-+pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
-+pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
-+pushdef([host], build)dnl
-+pushdef([host_alias], build_alias)dnl
-+pushdef([host_cpu], build_cpu)dnl
-+pushdef([host_vendor], build_vendor)dnl
-+pushdef([host_os], build_os)dnl
-+pushdef([ac_cv_host], ac_cv_build)dnl
-+pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
-+pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
-+pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
-+pushdef([ac_cv_host_os], ac_cv_build_os)dnl
-+pushdef([ac_cpp], ac_build_cpp)dnl
-+pushdef([ac_compile], ac_build_compile)dnl
-+pushdef([ac_link], ac_build_link)dnl
-+
-+save_cross_compiling=$cross_compiling
-+save_ac_tool_prefix=$ac_tool_prefix
-+cross_compiling=no
-+ac_tool_prefix=
-+
-+AC_PROG_CC
-+AC_PROG_CPP
-+AC_EXEEXT
-+
-+ac_tool_prefix=$save_ac_tool_prefix
-+cross_compiling=$save_cross_compiling
-+
-+dnl Restore the old definitions
-+dnl
-+popdef([ac_link])dnl
-+popdef([ac_compile])dnl
-+popdef([ac_cpp])dnl
-+popdef([ac_cv_host_os])dnl
-+popdef([ac_cv_host_vendor])dnl
-+popdef([ac_cv_host_cpu])dnl
-+popdef([ac_cv_host_alias])dnl
-+popdef([ac_cv_host])dnl
-+popdef([host_os])dnl
-+popdef([host_vendor])dnl
-+popdef([host_cpu])dnl
-+popdef([host_alias])dnl
-+popdef([host])dnl
-+popdef([LDFLAGS])dnl
-+popdef([CPPFLAGS])dnl
-+popdef([CFLAGS])dnl
-+popdef([CPP])dnl
-+popdef([CC])dnl
-+popdef([ac_objext])dnl
-+popdef([ac_exeext])dnl
-+popdef([ac_cv_objext])dnl
-+popdef([ac_cv_exeext])dnl
-+popdef([ac_cv_prog_cc_g])dnl
-+popdef([ac_cv_prog_cc_cross])dnl
-+popdef([ac_cv_prog_cc_works])dnl
-+popdef([ac_cv_prog_gcc])dnl
-+popdef([ac_cv_prog_CPP])dnl
-+
-+dnl Finally, set Makefile variables
-+dnl
-+BUILD_EXEEXT=$ac_build_exeext
-+BUILD_OBJEXT=$ac_build_objext
-+AC_SUBST(BUILD_EXEEXT)dnl
-+AC_SUBST(BUILD_OBJEXT)dnl
-+AC_SUBST([CFLAGS_FOR_BUILD])dnl
-+AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
-+AC_SUBST([LDFLAGS_FOR_BUILD])dnl
-+])
--- 
-1.7.10.4
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index 16e3f1f..3c03add 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -16,10 +16,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
                     file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
 
-SRC_URI = "http://download.gnome.org/sources/gtk+/3.4/gtk+-${PV}.tar.xz \
-           file://cross.patch"
-SRC_URI[md5sum] = "1b2cf29502a6394e8d4b30f7f5bb9131"
-SRC_URI[sha256sum] = "f154e460075034da4c0ce89c320025dcd459da2a1fdf32d92a09522eaca242c7"
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "http://download.gnome.org/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz"
+SRC_URI[md5sum] = "8e878e18fc385f2b813419dc7b40a968"
+SRC_URI[sha256sum] = "1ca80c9c15a1df95d74cefb8c2afe4682ba272a4b489106f04877be2a7aff297"
 
 inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache
 
-- 
1.7.10.4


