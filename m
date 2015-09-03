Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4C13B77011
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539561"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:14 +0300
Message-Id: <b3683a100e2bcc959f299b7b01ea0a6114ae24c4.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/12] libunique: remove the recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:52 -0000

It is not used by anything in oe-core and will be moved to meta-oe

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libunique/libunique/build.patch | 421 ---------------------
 .../libunique/fix_for_compile_with_gcc-4.6.0.patch |  36 --
 .../libunique/libunique/noconst.patch              | 130 -------
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |  25 --
 4 files changed, 612 deletions(-)
 delete mode 100644 meta/recipes-gnome/libunique/libunique/build.patch
 delete mode 100644 meta/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
 delete mode 100644 meta/recipes-gnome/libunique/libunique/noconst.patch
 delete mode 100644 meta/recipes-gnome/libunique/libunique_1.1.6.bb

diff --git a/meta/recipes-gnome/libunique/libunique/build.patch b/meta/recipes-gnome/libunique/libunique/build.patch
deleted file mode 100644
index 46a5c62..0000000
--- a/meta/recipes-gnome/libunique/libunique/build.patch
+++ /dev/null
@@ -1,421 +0,0 @@
-Upstream-Status: Backport [http://git.gnome.org/browse/unique/commit/?h=unique-1.1&id=f75ca2d7aad7d27686acca6090c1c569a79d7e63]
-Signed-off-By: Ross Burton <ross.burton@intel.com>
-
-From f75ca2d7aad7d27686acca6090c1c569a79d7e63 Mon Sep 17 00:00:00 2001
-From: Emmanuele Bassi <ebassi@gnome.org>
-Date: Sat, 08 May 2010 11:17:21 +0000
-Subject: build: Update the build environment
-
-Require autoconf 2.63, automake 1.11 and libtool 2.2.6 to remove Shave.
-
-Also bump up the requirement for gobject-introspection to 0.6.7.
----
-diff --git a/build/autotools/Makefile.am b/build/autotools/Makefile.am
-index 5f35b85..b78428f 100644
---- a/build/autotools/Makefile.am
-+++ b/build/autotools/Makefile.am
-@@ -1,7 +1,4 @@
- EXTRA_DIST = \
--	shave-libtool.in 	\
--	shave.in 		\
--	shave.m4 		\
- 	as-compiler-flag.m4	\
- 	introspection.m4	\
- 	Makefile.am.enums	\
-diff --git a/build/autotools/Makefile.am.silent b/build/autotools/Makefile.am.silent
-index 249f6af..8576846 100644
---- a/build/autotools/Makefile.am.silent
-+++ b/build/autotools/Makefile.am.silent
-@@ -1,10 +1,5 @@
- # custom rules for quiet builds
- 
--if USE_SHAVE
--QUIET_GEN = $(Q:@=@echo '  GEN   '$@;)
--QUIET_LN  = $(Q:@=@echo '  LN    '$@;)
--QUIET_RM  = $(Q:@=@echo '  RM    '$@;)
--else
- QUIET_GEN = $(AM_V_GEN)
- 
- QUIET_LN   = $(QUIET_LN_$(V))
-@@ -14,4 +9,3 @@ QUIET_LN_0 = @echo '  LN     '$@;
- QUIET_RM   = $(QUIET_RM_$(V))
- QUIET_RM_  = $(QUIET_RM_$(AM_DEFAULT_VERBOSITY))
- QUIET_RM_0 = @echo '  RM     '$@;
--endif # USE_SHAVE
-diff --git a/build/autotools/introspection.m4 b/build/autotools/introspection.m4
-index f9ce49c..589721c 100644
---- a/build/autotools/introspection.m4
-+++ b/build/autotools/introspection.m4
-@@ -59,12 +59,18 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
-        INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-        INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
-        INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
-+       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
-+       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
-+       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-     fi
-     AC_SUBST(INTROSPECTION_SCANNER)
-     AC_SUBST(INTROSPECTION_COMPILER)
-     AC_SUBST(INTROSPECTION_GENERATE)
-     AC_SUBST(INTROSPECTION_GIRDIR)
-     AC_SUBST(INTROSPECTION_TYPELIBDIR)
-+    AC_SUBST(INTROSPECTION_CFLAGS)
-+    AC_SUBST(INTROSPECTION_LIBS)
-+    AC_SUBST(INTROSPECTION_MAKEFILE)
- 
-     AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
- ])
-diff --git a/build/autotools/shave-libtool.in b/build/autotools/shave-libtool.in
-deleted file mode 100644
-index 1f3a720..0000000
---- a/build/autotools/shave-libtool.in
-+++ b/dev/null
-@@ -1,69 +0,0 @@
--#!/bin/sh
--
--# we need sed
--SED=@SED@
--if test -z "$SED" ; then
--SED=sed
--fi
--
--lt_unmangle ()
--{
--   last_result=`echo $1 | $SED -e 's#.libs/##' -e 's#[0-9a-zA-Z_\-\.]*_la-##'`
--}
--
--# the real libtool to use
--LIBTOOL="$1"
--shift
--
--# if 1, don't print anything, the underlaying wrapper will do it
--pass_though=0
--
--# scan the arguments, keep the right ones for libtool, and discover the mode
--preserved_args=
--while test "$#" -gt 0; do
--    opt="$1"
--    shift
--
--    case $opt in
--    --mode=*)
--        mode=`echo $opt | $SED -e 's/[-_a-zA-Z0-9]*=//'`
--        preserved_args="$preserved_args $opt"
--        ;;
--    -o)
--        lt_output="$1"
--        preserved_args="$preserved_args $opt"
--	;;
--    *)
--        preserved_args="$preserved_args $opt"
--        ;;
--      esac
--done
--
--case "$mode" in
--compile)
--    # shave will be called and print the actual CC/CXX/LINK line
--    preserved_args="$preserved_args --shave-mode=$mode"
--    pass_though=1
--    ;;
--link)
--    preserved_args="$preserved_args --shave-mode=$mode"
--    Q="  LINK  "
--    ;;
--*)
--    # let's u
--    # echo "*** libtool: Unimplemented mode: $mode, fill a bug report"
--    ;;
--esac
--
--lt_unmangle "$lt_output"
--output=$last_result
--
--if test -z $V; then
--    if test $pass_though -eq 0; then
--        echo "$Q$output"
--    fi
--    $LIBTOOL --silent $preserved_args
--else
--    echo $LIBTOOL $preserved_args
--    $LIBTOOL $preserved_args
--fi
-diff --git a/build/autotools/shave.in b/build/autotools/shave.in
-deleted file mode 100644
-index 5c16f27..0000000
---- a/build/autotools/shave.in
-+++ b/dev/null
-@@ -1,79 +0,0 @@
--#!/bin/sh
--
--# we need sed
--SED=@SED@
--if test -z "$SED" ; then
--SED=sed
--fi
--
--lt_unmangle ()
--{
--   last_result=`echo $1 | $SED -e 's#.libs/##' -e 's#[0-9a-zA-Z_\-\.]*_la-##'`
--}
--
--# the tool to wrap (cc, cxx, ar, ranlib, ..)
--tool="$1"
--shift
--
--# the reel tool (to call)
--REEL_TOOL="$1"
--shift
--
--pass_through=0
--preserved_args=
--while test "$#" -gt 0; do
--    opt="$1"
--    shift
--
--    case $opt in
--    --shave-mode=*)
--        mode=`echo $opt | $SED -e 's/[-_a-zA-Z0-9]*=//'`
--	;;
--    -o)
--        lt_output="$1"
--        preserved_args="$preserved_args $opt"
--	;;
--    *)
--        preserved_args="$preserved_args $opt"
--        ;;
--      esac
--done
--
--# mode=link is handled in the libtool wrapper
--case "$mode,$tool" in
--link,*)
--    pass_through=1
--    ;;
--*,cxx)
--    Q="  CXX   "
--    ;;
--*,cc)
--    Q="  CC    "
--    ;;
--*,fc)
--    Q="  FC    "
--    ;;
--*,f77)
--    Q="  F77   "
--    ;;
--*,objc)
--    Q="  OBJC   "
--    ;;
--*,*)
--    # should not happen
--    Q="  CC    "
--    ;;
--esac
--
--lt_unmangle "$lt_output"
--output=$last_result
--
--if test -z $V; then
--    if test $pass_through -eq 0; then
--        echo "$Q$output"
--    fi
--    $REEL_TOOL $preserved_args
--else
--    echo $REEL_TOOL $preserved_args
--    $REEL_TOOL $preserved_args
--fi
-diff --git a/build/autotools/shave.m4 b/build/autotools/shave.m4
-deleted file mode 100644
-index 0a3509e..0000000
---- a/build/autotools/shave.m4
-+++ b/dev/null
-@@ -1,77 +0,0 @@
--dnl Make automake/libtool output more friendly to humans
--dnl  Damien Lespiau <damien.lespiau@gmail.com>
--dnl
--dnl SHAVE_INIT([shavedir],[default_mode])
--dnl
--dnl shavedir: the directory where the shave scripts are, it defaults to
--dnl           $(top_builddir)
--dnl default_mode: (enable|disable) default shave mode.  This parameter
--dnl               controls shave's behaviour when no option has been
--dnl               given to configure.  It defaults to disable.
--dnl
--dnl * SHAVE_INIT should be called late in your configure.(ac|in) file (just
--dnl   before AC_CONFIG_FILE/AC_OUTPUT is perfect.  This macro rewrites CC and
--dnl   LIBTOOL, you don't want the configure tests to have these variables
--dnl   re-defined.
--dnl * This macro requires GNU make's -s option.
--
--AC_DEFUN([_SHAVE_ARG_ENABLE],
--[
--  AC_ARG_ENABLE([shave],
--    AS_HELP_STRING(
--      [--enable-shave],
--      [use shave to make the build pretty [[default=$1]]]),,
--      [enable_shave=$1]
--    )
--])
--
--AC_DEFUN([SHAVE_INIT],
--[
--  dnl you can tweak the default value of enable_shave
--  m4_if([$2], [enable], [_SHAVE_ARG_ENABLE(yes)], [_SHAVE_ARG_ENABLE(no)])
--
--  if test x"$enable_shave" = xyes; then
--    dnl where can we find the shave scripts?
--    m4_if([$1],,
--      [shavedir="$ac_pwd"],
--      [shavedir="$ac_pwd/$1"])
--    AC_SUBST(shavedir)
--
--    dnl make is now quiet
--    AC_SUBST([MAKEFLAGS], [-s])
--    AC_SUBST([AM_MAKEFLAGS], ['`test -z $V && echo -s`'])
--
--    dnl we need sed
--    AC_CHECK_PROG(SED,sed,sed,false)
--
--    dnl substitute libtool
--    SHAVE_SAVED_LIBTOOL=$LIBTOOL
--    LIBTOOL="${SHELL} ${shavedir}/shave-libtool '${SHAVE_SAVED_LIBTOOL}'"
--    AC_SUBST(LIBTOOL)
--
--    dnl substitute cc/cxx
--    SHAVE_SAVED_CC=$CC
--    SHAVE_SAVED_CXX=$CXX
--    SHAVE_SAVED_FC=$FC
--    SHAVE_SAVED_F77=$F77
--    SHAVE_SAVED_OBJC=$OBJC
--    CC="${SHELL} ${shavedir}/shave cc ${SHAVE_SAVED_CC}"
--    CXX="${SHELL} ${shavedir}/shave cxx ${SHAVE_SAVED_CXX}"
--    FC="${SHELL} ${shavedir}/shave fc ${SHAVE_SAVED_FC}"
--    F77="${SHELL} ${shavedir}/shave f77 ${SHAVE_SAVED_F77}"
--    OBJC="${SHELL} ${shavedir}/shave objc ${SHAVE_SAVED_OBJC}"
--    AC_SUBST(CC)
--    AC_SUBST(CXX)
--    AC_SUBST(FC)
--    AC_SUBST(F77)
--    AC_SUBST(OBJC)
--
--    V=@
--  else
--    V=1
--  fi
--  Q='$(V:1=)'
--  AC_SUBST(V)
--  AC_SUBST(Q)
--])
--
-diff --git a/configure.ac b/configure.ac
-index a3ed3ee..bc3163a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,7 +14,7 @@ m4_define([unique_api_version], [1.0])
- # This is the X.Y used in the protocol negotiation
- m4_define([unique_protocol_version], [1.0])
- 
--AC_PREREQ([2.59])
-+AC_PREREQ([2.63])
- 
- AC_INIT([unique], [unique_version],
-         [http://bugzilla.gnome.org/enter_bug.cgi?product=libunique],
-@@ -23,9 +23,21 @@ AC_INIT([unique], [unique_version],
- AC_CONFIG_SRCDIR([unique/unique.h])
- AC_CONFIG_MACRO_DIR([build/autotools])
- 
--AM_INIT_AUTOMAKE([1.10])
-+AM_INIT_AUTOMAKE([1.11 no-define -Wno-portability dist-bzip2])
- AM_CONFIG_HEADER([config.h])
- 
-+AM_SILENT_RULES([yes])
-+
-+AC_PROG_CC_C_O
-+
-+AM_PATH_GLIB_2_0
-+
-+LT_PREREQ([2.2.6])
-+LT_INIT([disable-static])
-+
-+# Honor aclocal flags
-+ACLOCAL="$ACLOCAL $ACLOCAL_FLAGS"
-+
- # version symbols
- UNIQUE_MAJOR_VERSION=unique_major_version
- UNIQUE_MINOR_VERSION=unique_minor_version
-@@ -49,21 +61,6 @@ UNIQUE_LT_CURRENT_MINUS_AGE=m4_eval(lt_current - lt_age)
- AC_SUBST(UNIQUE_LT_VERSION_INFO)
- AC_SUBST(UNIQUE_LT_CURRENT_MINUS_AGE)
- 
--AC_ISC_POSIX
--AC_PROG_CC
--AC_PROG_INSTALL
--AC_PROG_MAKE_SET
--AC_C_CONST
--AC_PROG_LIBTOOL
--AC_PATH_PROG(GLIB_MKENUMS, [glib-mkenums])
--AC_PATH_PROG(GLIB_GENMARSHAL, [glib-genmarshal])
--
--AM_SANITY_CHECK
--AM_PROG_CC_STDC
--
--# Honor aclocal flags
--ACLOCAL="$ACLOCAL $ACLOCAL_FLAGS"
--
- m4_define([glib_required], [2.12.0])
- m4_define([gtk_required],  [2.11.0])
- m4_define([dbus_required], [0.70])
-@@ -122,7 +119,6 @@ AM_CONDITIONAL([HAVE_DBUS], [test "x$have_dbus" = "xyes"])
- dnl Bacon backend
- dnl This is the fallback backend, so we *need* these headers and functions
- dnl even if we end up using D-Bus
--dnl D-Bus backend dependencies
- m4_define([have_bacon_default], [yes])
- AC_ARG_ENABLE([bacon],
-               [AC_HELP_STRING([--enable-bacon=@<:@yes/no@:>@],
-@@ -178,9 +174,9 @@ AC_ARG_ENABLE([maintainer-flags],
- AS_IF([test "x$enable_maintainer_flags" = "xyes" &&  test "x$GCC" = "xyes"],
-       [
-         AS_COMPILER_FLAGS([MAINTAINER_CFLAGS],
--                          ["-Werror -Wall -Wshadow -Wcast-align
--                            -Wno-uninitialized -Wempty-body -Wformat-security
--                            -Winit-self"])
-+                          ["-Wall -Wshadow -Wcast-align
-+                            -Wno-uninitialized -Wempty-body
-+                            -Wformat-security -Winit-self"])
-       ]
- )
- 
-@@ -230,27 +226,10 @@ AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],
- AM_GLIB_DEFINE_LOCALEDIR(UNIQUE_LOCALEDIR)
- 
- # introspection
--GOBJECT_INTROSPECTION_CHECK([0.6.3])
-+GOBJECT_INTROSPECTION_CHECK([0.6.7])
- 
- # gtk-doc
--GTK_DOC_CHECK([1.11])
--
--# nice builds
--m4_ifdef([AM_SILENT_RULES],
--         [
--           AM_SILENT_RULES([yes])
--           use_shave=no
--         ],
--         [
--           SHAVE_INIT([build/autotools], [enable])
--           AC_CONFIG_FILES([
--                build/autotools/shave-libtool
--                build/autotools/shave
--           ])
--           use_shave=yes
--         ])
--
--AM_CONDITIONAL([USE_SHAVE], [test "x$use_shave" = "xyes"])
-+GTK_DOC_CHECK([1.13])
- 
- AC_CONFIG_FILES([
-         Makefile
---
-cgit v0.9.0.2
diff --git a/meta/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch b/meta/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
deleted file mode 100644
index d75de93..0000000
--- a/meta/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Pending
-
-Fix Following compilation errors with gcc 4.6.0
-
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/10
-
-| uniquebackend-dbus.c: In function 'unique_backend_dbus_request_name':
-| uniquebackend-dbus.c:87:22: error: variable 'backend_dbus' set but not used [-Werror=unused-but-set-variable]
-| uniquebackend-dbus.c: In function 'unique_backend_dbus_send_message':
-| uniquebackend-dbus.c:189:12: error: variable 'res' set but not used [-Werror=unused-but-set-variable]
-| cc1: all warnings being treated as errors
-| 
-| make[5]: *** [libunique_dbus_la-uniquebackend-dbus.lo] Error 1
-
-Index: libunique-1.1.6/unique/dbus/uniquebackend-dbus.c
-===================================================================
---- libunique-1.1.6.orig/unique/dbus/uniquebackend-dbus.c
-+++ libunique-1.1.6/unique/dbus/uniquebackend-dbus.c
-@@ -84,7 +84,7 @@ unique_backend_dbus_register_proxy (Uniq
- static gboolean
- unique_backend_dbus_request_name (UniqueBackend *backend)
- {
--  UniqueBackendDBus *backend_dbus;
-+  UniqueBackendDBus __attribute__((__unused__)) *backend_dbus;
-   const gchar *name;
-   DBusGConnection *connection;
-   DBusGProxy *proxy;
-@@ -186,7 +186,7 @@ unique_backend_dbus_send_message (Unique
-   GValueArray *data;
-   gchar *cmd;
-   gchar *resp;
--  gboolean res;
-+  gboolean __attribute__((__unused__)) res;
-   GError *error;
-   UniqueResponse response;
- 
diff --git a/meta/recipes-gnome/libunique/libunique/noconst.patch b/meta/recipes-gnome/libunique/libunique/noconst.patch
deleted file mode 100644
index 2cc0347..0000000
--- a/meta/recipes-gnome/libunique/libunique/noconst.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
-build failures.
-
-RP 2011/10/12
-
-Upstream-Status: Pending
-
-Index: libunique-1.1.6/unique/uniqueapp.c
-===================================================================
---- libunique-1.1.6.orig/unique/uniqueapp.c	2011-10-12 01:21:25.842046488 +0100
-+++ libunique-1.1.6/unique/uniqueapp.c	2011-10-12 01:21:55.062046796 +0100
-@@ -781,7 +781,7 @@
- }
- 
- 
--G_CONST_RETURN gchar *
-+const gchar *
- unique_command_to_string (UniqueApp *app,
-                           gint       command)
- {
-@@ -863,7 +863,7 @@
-   return retval;
- }
- 
--G_CONST_RETURN gchar *
-+const gchar *
- unique_response_to_string (UniqueResponse response)
- {
-   GEnumClass *enum_class;
-Index: libunique-1.1.6/unique/uniquebackend.c
-===================================================================
---- libunique-1.1.6.orig/unique/uniquebackend.c	2011-10-12 01:21:25.742046323 +0100
-+++ libunique-1.1.6/unique/uniquebackend.c	2011-10-12 01:21:55.062046796 +0100
-@@ -111,7 +111,7 @@
-  *
-  * Return value: FIXME
-  */
--G_CONST_RETURN gchar *
-+const gchar *
- unique_backend_get_name (UniqueBackend *backend)
- {
-   g_return_val_if_fail (UNIQUE_IS_BACKEND (backend), NULL);
-@@ -154,7 +154,7 @@
-  *
-  * Return value: FIXME
-  */
--G_CONST_RETURN gchar *
-+const gchar *
- unique_backend_get_startup_id (UniqueBackend *backend)
- {
-   g_return_val_if_fail (UNIQUE_IS_BACKEND (backend), NULL);
-Index: libunique-1.1.6/unique/uniquebackend.h
-===================================================================
---- libunique-1.1.6.orig/unique/uniquebackend.h	2011-10-12 01:21:25.992046521 +0100
-+++ libunique-1.1.6/unique/uniquebackend.h	2011-10-12 01:21:56.512047875 +0100
-@@ -94,10 +94,10 @@
- 
- UniqueBackend *       unique_backend_create         (void);
- 
--G_CONST_RETURN gchar *unique_backend_get_name       (UniqueBackend     *backend);
-+const gchar *unique_backend_get_name       (UniqueBackend     *backend);
- void                  unique_backend_set_name       (UniqueBackend     *backend,
-                                                      const gchar       *name);
--G_CONST_RETURN gchar *unique_backend_get_startup_id (UniqueBackend     *backend);
-+const gchar *unique_backend_get_startup_id (UniqueBackend     *backend);
- void                  unique_backend_set_startup_id (UniqueBackend     *backend,
-                                                      const gchar       *startup_id);
- GdkScreen *           unique_backend_get_screen     (UniqueBackend     *backend);
-Index: libunique-1.1.6/unique/uniqueinternals.h
-===================================================================
---- libunique-1.1.6.orig/unique/uniqueinternals.h	2011-10-12 01:21:25.892046532 +0100
-+++ libunique-1.1.6/unique/uniqueinternals.h	2011-10-12 01:21:56.512047875 +0100
-@@ -44,11 +44,11 @@
-  * and then back into an id
-  */
- UniqueResponse        unique_response_from_string  (const gchar    *response);
--G_CONST_RETURN gchar *unique_response_to_string    (UniqueResponse  response);
-+const gchar *unique_response_to_string    (UniqueResponse  response);
- 
- gint                  unique_command_from_string   (UniqueApp      *app,
-                                                     const gchar    *command);
--G_CONST_RETURN gchar *unique_command_to_string     (UniqueApp      *app,
-+const gchar *unique_command_to_string     (UniqueApp      *app,
-                                                     gint            command);
- 
- G_END_DECLS
-Index: libunique-1.1.6/unique/uniquemessage.c
-===================================================================
---- libunique-1.1.6.orig/unique/uniquemessage.c	2011-10-12 01:21:25.942046524 +0100
-+++ libunique-1.1.6/unique/uniquemessage.c	2011-10-12 01:21:55.072046595 +0100
-@@ -185,7 +185,7 @@
-  *
-  * Since: 1.0.2
-  */
--G_CONST_RETURN guchar *
-+const guchar *
- unique_message_data_get (UniqueMessageData *message_data,
-                          gsize             *length)
- {
-@@ -525,7 +525,7 @@
-  *   owned by the #UniqueMessageData structure and should not be
-  *   modified or freed
-  */
--G_CONST_RETURN gchar *
-+const gchar *
- unique_message_data_get_startup_id (UniqueMessageData *message_data)
- {
-   g_return_val_if_fail (message_data != NULL, NULL);
-Index: libunique-1.1.6/unique/uniquemessage.h
-===================================================================
---- libunique-1.1.6.orig/unique/uniquemessage.h	2011-10-12 01:21:25.792046596 +0100
-+++ libunique-1.1.6/unique/uniquemessage.h	2011-10-12 01:21:56.512047875 +0100
-@@ -48,7 +48,7 @@
- void                   unique_message_data_set            (UniqueMessageData *message_data,
-                                                            const guchar      *data,
-                                                            gsize              length);
--G_CONST_RETURN guchar *unique_message_data_get            (UniqueMessageData *message_data,
-+const guchar *unique_message_data_get            (UniqueMessageData *message_data,
-                                                            gsize             *length);
- 
- gboolean               unique_message_data_set_text       (UniqueMessageData *message_data,
-@@ -63,7 +63,7 @@
- gchar *                unique_message_data_get_filename   (UniqueMessageData *message_data);
- 
- GdkScreen *            unique_message_data_get_screen     (UniqueMessageData *message_data);
--G_CONST_RETURN gchar * unique_message_data_get_startup_id (UniqueMessageData *message_data);
-+const gchar * unique_message_data_get_startup_id (UniqueMessageData *message_data);
- guint                  unique_message_data_get_workspace  (UniqueMessageData *message_data);
- 
- G_END_DECLS
diff --git a/meta/recipes-gnome/libunique/libunique_1.1.6.bb b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
deleted file mode 100644
index d97d1d6..0000000
--- a/meta/recipes-gnome/libunique/libunique_1.1.6.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Library for supporting single instance GTK+ applications"
-DESCRIPTION = "Unique is a library for writing single instance GTK+ applications. If you launch a single instance application twice, the second instance will either just quit or will send a message to the running instance."
-HOMEPAGE = "https://wiki.gnome.org/Attic/LibUnique"
-BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=libunique"
-
-SRC_URI = "${GNOME_MIRROR}/libunique/1.1/libunique-${PV}.tar.bz2 \
-	file://fix_for_compile_with_gcc-4.6.0.patch \
-	file://noconst.patch \
-        file://build.patch"
-
-SRC_URI[md5sum] = "7955769ef31f1bc4f83446dbb3625e6d"
-SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66cdd4fbb"
-
-PR = "r7"
-
-DEPENDS = "glib-2.0 gtk+"
-
-PACKAGECONFIG ??= "dbus"
-PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-
-inherit autotools pkgconfig
-- 
2.1.4


