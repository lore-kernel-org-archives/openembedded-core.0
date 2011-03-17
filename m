Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q0A0N-0005ZI-9P
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 11:00:36 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Mar 2011 02:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,198,1299484800"; d="scan'208";a="668232594"
Received: from unknown (HELO localhost) ([10.255.12.145])
	by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2011 02:58:46 -0700
Message-Id: <fd06b5736366d72c63c1bf88eb5e3ea175589039.1300355683.git.sgw@linux.intel.com>
In-Reply-To: <cover.1300355683.git.sgw@linux.intel.com>
References: <cover.1300355683.git.sgw@linux.intel.com>
Old-Date: Thu, 17 Mar 2011 01:12:56 -0700
Date: Thu, 17 Mar 2011  2:58:46 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 6/7] gettext: Upgrade GPLv2 version to 0.16.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2011 10:00:36 -0000

From: Saul Wold <sgw@linux.intel.com>

This adds a couple of new patches for handling various autoconf
and autolocal issues.  It also hardcodes a GETTEXT_MACRO_VERSION
to 0.17 to match the native gettext.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gettext/gettext-0.14.1/gettext-vpath.patch     |   15 -
 .../gettext/gettext-0.14.1/linklib_from_0.17.patch | 1135 --------------------
 .../disable_java.patch                             |   19 +-
 .../gettext-0.16.1/fix_aclocal_version.patch       |  107 ++
 .../gettext-0.16.1/fix_gnu_source_circular.patch   |  345 ++++++
 .../fixchicken.patch                               |    0
 .../getline.m4.patch                               |    0
 .../gettext-autoconf-lib-link-no-L.patch           |    4 +
 .../gettext-error_print_progname.patch             |    0
 .../gettext/gettext-0.16.1/gettext-vpath.patch     |   17 +
 .../gettext-0.16.1/hardcode_macro_version.patch    |   48 +
 .../gettext/gettext-0.16.1/linklib_from_0.17.patch |  717 ++++++++++++
 .../{gettext_0.14.1.bb => gettext_0.16.1.bb}       |   20 +-
 13 files changed, 1258 insertions(+), 1169 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.14.1/gettext-vpath.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.14.1/linklib_from_0.17.patch
 rename meta/recipes-core/gettext/{gettext-0.14.1 => gettext-0.16.1}/disable_java.patch (53%)
 create mode 100644 meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
 create mode 100644 meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
 rename meta/recipes-core/gettext/{gettext-0.14.1 => gettext-0.16.1}/fixchicken.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.14.1 => gettext-0.16.1}/getline.m4.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.14.1 => gettext-0.16.1}/gettext-autoconf-lib-link-no-L.patch (88%)
 rename meta/recipes-core/gettext/{gettext-0.14.1 => gettext-0.16.1}/gettext-error_print_progname.patch (100%)
 create mode 100644 meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
 create mode 100644 meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
 create mode 100644 meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
 rename meta/recipes-core/gettext/{gettext_0.14.1.bb => gettext_0.16.1.bb} (74%)

diff --git a/meta/recipes-core/gettext/gettext-0.14.1/gettext-vpath.patch b/meta/recipes-core/gettext/gettext-0.14.1/gettext-vpath.patch
deleted file mode 100644
index e31243b..0000000
--- a/meta/recipes-core/gettext/gettext-0.14.1/gettext-vpath.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-# Pulled from OpenEmbedded
-# 
-# Commented by: Saul Wold <saul.wold@intel.com>
-
---- gettext-0.14.1/gettext-runtime/intl/Makefile.in~	2004-04-09 13:23:40.000000000 +0100
-+++ gettext-0.14.1/gettext-runtime/intl/Makefile.in	2004-04-09 13:22:05.000000000 +0100
-@@ -24,7 +24,7 @@
- srcdir = $(top_srcdir)/../gettext-runtime/intl
- top_srcdir = /var/tmp/oe-tmp.pb/base/gettext-0.14.1-r0/gettext-0.14.1/gettext-tools
- top_builddir = ..
--VPATH = $(srcdir)
-+#VPATH = $(srcdir)
- 
- prefix = /usr
- exec_prefix = /usr
diff --git a/meta/recipes-core/gettext/gettext-0.14.1/linklib_from_0.17.patch b/meta/recipes-core/gettext/gettext-0.14.1/linklib_from_0.17.patch
deleted file mode 100644
index f4ae846..0000000
--- a/meta/recipes-core/gettext/gettext-0.14.1/linklib_from_0.17.patch
+++ /dev/null
@@ -1,1135 +0,0 @@
-# Pulled from OpenEmbedded
-# 
-# Commented by: Saul Wold <saul.wold@intel.com>
-
-Index: gettext-0.14.1/autoconf-lib-link/m4/lib-ld.m4
-===================================================================
---- gettext-0.14.1.orig/autoconf-lib-link/m4/lib-ld.m4	2008-04-15 14:32:45.000000000 +0100
-+++ gettext-0.14.1/autoconf-lib-link/m4/lib-ld.m4	2008-04-15 14:32:47.000000000 +0100
-@@ -1,10 +1,8 @@
- # lib-ld.m4 serial 3 (gettext-0.13)
- dnl Copyright (C) 1996-2003 Free Software Foundation, Inc.
--dnl This file is free software, distributed under the terms of the GNU
--dnl General Public License.  As a special exception to the GNU General
--dnl Public License, this file may be distributed as part of a program
--dnl that contains a configuration script generated by Autoconf, under
--dnl the same distribution terms as the rest of that program.
-+dnl This file is free software; the Free Software Foundation
-+dnl gives unlimited permission to copy and/or distribute it,
-+dnl with or without modifications, as long as this notice is preserved.
- 
- dnl Subroutines of libtool.m4,
- dnl with replacements s/AC_/AC_LIB/ and s/lt_cv/acl_cv/ to avoid collision
-Index: gettext-0.14.1/autoconf-lib-link/m4/lib-link.m4
-===================================================================
---- gettext-0.14.1.orig/autoconf-lib-link/m4/lib-link.m4	2008-04-15 14:32:45.000000000 +0100
-+++ gettext-0.14.1/autoconf-lib-link/m4/lib-link.m4	2008-04-15 14:32:47.000000000 +0100
-@@ -1,17 +1,19 @@
--# lib-link.m4 serial 4 (gettext-0.12)
--dnl Copyright (C) 2001-2003 Free Software Foundation, Inc.
--dnl This file is free software, distributed under the terms of the GNU
--dnl General Public License.  As a special exception to the GNU General
--dnl Public License, this file may be distributed as part of a program
--dnl that contains a configuration script generated by Autoconf, under
--dnl the same distribution terms as the rest of that program.
-+# lib-link.m4 serial 13 (gettext-0.17)
-+dnl Copyright (C) 2001-2007 Free Software Foundation, Inc.
-+dnl This file is free software; the Free Software Foundation
-+dnl gives unlimited permission to copy and/or distribute it,
-+dnl with or without modifications, as long as this notice is preserved.
- 
- dnl From Bruno Haible.
- 
-+AC_PREREQ(2.54)
-+
- dnl AC_LIB_LINKFLAGS(name [, dependencies]) searches for libname and
- dnl the libraries corresponding to explicit and implicit dependencies.
- dnl Sets and AC_SUBSTs the LIB${NAME} and LTLIB${NAME} variables and
- dnl augments the CPPFLAGS variable.
-+dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if libname
-+dnl was found in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
- AC_DEFUN([AC_LIB_LINKFLAGS],
- [
-   AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
-@@ -24,13 +26,16 @@
-     ac_cv_lib[]Name[]_libs="$LIB[]NAME"
-     ac_cv_lib[]Name[]_ltlibs="$LTLIB[]NAME"
-     ac_cv_lib[]Name[]_cppflags="$INC[]NAME"
-+    ac_cv_lib[]Name[]_prefix="$LIB[]NAME[]_PREFIX"
-   ])
-   LIB[]NAME="$ac_cv_lib[]Name[]_libs"
-   LTLIB[]NAME="$ac_cv_lib[]Name[]_ltlibs"
-   INC[]NAME="$ac_cv_lib[]Name[]_cppflags"
-+  LIB[]NAME[]_PREFIX="$ac_cv_lib[]Name[]_prefix"
-   AC_LIB_APPENDTOVAR([CPPFLAGS], [$INC]NAME)
-   AC_SUBST([LIB]NAME)
-   AC_SUBST([LTLIB]NAME)
-+  AC_SUBST([LIB]NAME[_PREFIX])
-   dnl Also set HAVE_LIB[]NAME so that AC_LIB_HAVE_LINKFLAGS can reuse the
-   dnl results of this search when this library appears as a dependency.
-   HAVE_LIB[]NAME=yes
-@@ -46,6 +51,8 @@
- dnl LTLIB${NAME} variables and augments the CPPFLAGS variable, and
- dnl #defines HAVE_LIB${NAME} to 1. Otherwise, it sets and AC_SUBSTs
- dnl HAVE_LIB${NAME}=no and LIB${NAME} and LTLIB${NAME} to empty.
-+dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if libname
-+dnl was found in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
- AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
- [
-   AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
-@@ -82,19 +89,27 @@
-     CPPFLAGS="$ac_save_CPPFLAGS"
-     LIB[]NAME=
-     LTLIB[]NAME=
-+    LIB[]NAME[]_PREFIX=
-   fi
-   AC_SUBST([HAVE_LIB]NAME)
-   AC_SUBST([LIB]NAME)
-   AC_SUBST([LTLIB]NAME)
-+  AC_SUBST([LIB]NAME[_PREFIX])
-   undefine([Name])
-   undefine([NAME])
- ])
- 
- dnl Determine the platform dependent parameters needed to use rpath:
--dnl libext, shlibext, hardcode_libdir_flag_spec, hardcode_libdir_separator,
--dnl hardcode_direct, hardcode_minus_L.
-+dnl   acl_libext,
-+dnl   acl_shlibext,
-+dnl   acl_hardcode_libdir_flag_spec,
-+dnl   acl_hardcode_libdir_separator,
-+dnl   acl_hardcode_direct,
-+dnl   acl_hardcode_minus_L.
- AC_DEFUN([AC_LIB_RPATH],
- [
-+  dnl Tell automake >= 1.10 to complain if config.rpath is missing.
-+  m4_ifdef([AC_REQUIRE_AUX_FILE], [AC_REQUIRE_AUX_FILE([config.rpath])])
-   AC_REQUIRE([AC_PROG_CC])                dnl we use $CC, $GCC, $LDFLAGS
-   AC_REQUIRE([AC_LIB_PROG_LD])            dnl we use $LD, $with_gnu_ld
-   AC_REQUIRE([AC_CANONICAL_HOST])         dnl we use $host
-@@ -107,12 +122,14 @@
-     acl_cv_rpath=done
-   ])
-   wl="$acl_cv_wl"
--  libext="$acl_cv_libext"
--  shlibext="$acl_cv_shlibext"
--  hardcode_libdir_flag_spec="$acl_cv_hardcode_libdir_flag_spec"
--  hardcode_libdir_separator="$acl_cv_hardcode_libdir_separator"
--  hardcode_direct="$acl_cv_hardcode_direct"
--  hardcode_minus_L="$acl_cv_hardcode_minus_L"
-+  acl_libext="$acl_cv_libext"
-+  acl_shlibext="$acl_cv_shlibext"
-+  acl_libname_spec="$acl_cv_libname_spec"
-+  acl_library_names_spec="$acl_cv_library_names_spec"
-+  acl_hardcode_libdir_flag_spec="$acl_cv_hardcode_libdir_flag_spec"
-+  acl_hardcode_libdir_separator="$acl_cv_hardcode_libdir_separator"
-+  acl_hardcode_direct="$acl_cv_hardcode_direct"
-+  acl_hardcode_minus_L="$acl_cv_hardcode_minus_L"
-   dnl Determine whether the user wants rpath handling at all.
-   AC_ARG_ENABLE(rpath,
-     [  --disable-rpath         do not hardcode runtime library paths],
-@@ -122,19 +139,24 @@
- dnl AC_LIB_LINKFLAGS_BODY(name [, dependencies]) searches for libname and
- dnl the libraries corresponding to explicit and implicit dependencies.
- dnl Sets the LIB${NAME}, LTLIB${NAME} and INC${NAME} variables.
-+dnl Also, sets the LIB${NAME}_PREFIX variable to nonempty if libname was found
-+dnl in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
- AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
- [
-+  AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
-   define([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
-                                [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
-+  dnl Autoconf >= 2.61 supports dots in --with options.
-+  define([N_A_M_E],[m4_if(m4_version_compare(m4_defn([m4_PACKAGE_VERSION]),[2.61]),[-1],[translit([$1],[.],[_])],[$1])])
-   dnl By default, look in $includedir and $libdir.
-   use_additional=yes
-   AC_LIB_WITH_FINAL_PREFIX([
-     eval additional_includedir=\"$includedir\"
-     eval additional_libdir=\"$libdir\"
-   ])
--  AC_LIB_ARG_WITH([lib$1-prefix],
--[  --with-lib$1-prefix[=DIR]  search for lib$1 in DIR/include and DIR/lib
--  --without-lib$1-prefix     don't search for lib$1 in includedir and libdir],
-+  AC_LIB_ARG_WITH([lib]N_A_M_E[-prefix],
-+[  --with-lib]N_A_M_E[-prefix[=DIR]  search for lib$1 in DIR/include and DIR/lib
-+  --without-lib]N_A_M_E[-prefix     don't search for lib$1 in includedir and libdir],
- [
-     if test "X$withval" = "Xno"; then
-       use_additional=no
-@@ -146,7 +168,7 @@
-         ])
-       else
-         additional_includedir="$withval/include"
--        additional_libdir="$withval/lib"
-+        additional_libdir="$withval/$acl_libdirstem"
-       fi
-     fi
- ])
-@@ -155,6 +177,7 @@
-   LIB[]NAME=
-   LTLIB[]NAME=
-   INC[]NAME=
-+  LIB[]NAME[]_PREFIX=
-   rpathdirs=
-   ltrpathdirs=
-   names_already_handled=
-@@ -194,22 +217,55 @@
-           found_la=
-           found_so=
-           found_a=
-+          eval libname=\"$acl_libname_spec\"    # typically: libname=lib$name
-+          if test -n "$acl_shlibext"; then
-+            shrext=".$acl_shlibext"             # typically: shrext=.so
-+          else
-+            shrext=
-+          fi
-           if test $use_additional = yes; then
--            if test -n "$shlibext" && test -f "$additional_libdir/lib$name.$shlibext"; then
--              found_dir="$additional_libdir"
--              found_so="$additional_libdir/lib$name.$shlibext"
--              if test -f "$additional_libdir/lib$name.la"; then
--                found_la="$additional_libdir/lib$name.la"
--              fi
--            else
--              if test -f "$additional_libdir/lib$name.$libext"; then
--                found_dir="$additional_libdir"
--                found_a="$additional_libdir/lib$name.$libext"
--                if test -f "$additional_libdir/lib$name.la"; then
--                  found_la="$additional_libdir/lib$name.la"
-+            dir="$additional_libdir"
-+            dnl The same code as in the loop below:
-+            dnl First look for a shared library.
-+            if test -n "$acl_shlibext"; then
-+              if test -f "$dir/$libname$shrext"; then
-+                found_dir="$dir"
-+                found_so="$dir/$libname$shrext"
-+              else
-+                if test "$acl_library_names_spec" = '$libname$shrext$versuffix'; then
-+                  ver=`(cd "$dir" && \
-+                        for f in "$libname$shrext".*; do echo "$f"; done \
-+                        | sed -e "s,^$libname$shrext\\\\.,," \
-+                        | sort -t '.' -n -r -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 \
-+                        | sed 1q ) 2>/dev/null`
-+                  if test -n "$ver" && test -f "$dir/$libname$shrext.$ver"; then
-+                    found_dir="$dir"
-+                    found_so="$dir/$libname$shrext.$ver"
-+                  fi
-+                else
-+                  eval library_names=\"$acl_library_names_spec\"
-+                  for f in $library_names; do
-+                    if test -f "$dir/$f"; then
-+                      found_dir="$dir"
-+                      found_so="$dir/$f"
-+                      break
-+                    fi
-+                  done
-                 fi
-               fi
-             fi
-+            dnl Then look for a static library.
-+            if test "X$found_dir" = "X"; then
-+              if test -f "$dir/$libname.$acl_libext"; then
-+                found_dir="$dir"
-+                found_a="$dir/$libname.$acl_libext"
-+              fi
-+            fi
-+            if test "X$found_dir" != "X"; then
-+              if test -f "$dir/$libname.la"; then
-+                found_la="$dir/$libname.la"
-+              fi
-+            fi
-           fi
-           if test "X$found_dir" = "X"; then
-             for x in $LDFLAGS $LTLIB[]NAME; do
-@@ -217,21 +273,46 @@
-               case "$x" in
-                 -L*)
-                   dir=`echo "X$x" | sed -e 's/^X-L//'`
--                  if test -n "$shlibext" && test -f "$dir/lib$name.$shlibext"; then
--                    found_dir="$dir"
--                    found_so="$dir/lib$name.$shlibext"
--                    if test -f "$dir/lib$name.la"; then
--                      found_la="$dir/lib$name.la"
--                    fi
--                  else
--                    if test -f "$dir/lib$name.$libext"; then
-+                  dnl First look for a shared library.
-+                  if test -n "$acl_shlibext"; then
-+                    if test -f "$dir/$libname$shrext"; then
-                       found_dir="$dir"
--                      found_a="$dir/lib$name.$libext"
--                      if test -f "$dir/lib$name.la"; then
--                        found_la="$dir/lib$name.la"
-+                      found_so="$dir/$libname$shrext"
-+                    else
-+                      if test "$acl_library_names_spec" = '$libname$shrext$versuffix'; then
-+                        ver=`(cd "$dir" && \
-+                              for f in "$libname$shrext".*; do echo "$f"; done \
-+                              | sed -e "s,^$libname$shrext\\\\.,," \
-+                              | sort -t '.' -n -r -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 \
-+                              | sed 1q ) 2>/dev/null`
-+                        if test -n "$ver" && test -f "$dir/$libname$shrext.$ver"; then
-+                          found_dir="$dir"
-+                          found_so="$dir/$libname$shrext.$ver"
-+                        fi
-+                      else
-+                        eval library_names=\"$acl_library_names_spec\"
-+                        for f in $library_names; do
-+                          if test -f "$dir/$f"; then
-+                            found_dir="$dir"
-+                            found_so="$dir/$f"
-+                            break
-+                          fi
-+                        done
-                       fi
-                     fi
-                   fi
-+                  dnl Then look for a static library.
-+                  if test "X$found_dir" = "X"; then
-+                    if test -f "$dir/$libname.$acl_libext"; then
-+                      found_dir="$dir"
-+                      found_a="$dir/$libname.$acl_libext"
-+                    fi
-+                  fi
-+                  if test "X$found_dir" != "X"; then
-+                    if test -f "$dir/$libname.la"; then
-+                      found_la="$dir/$libname.la"
-+                    fi
-+                  fi
-                   ;;
-               esac
-               if test "X$found_dir" != "X"; then
-@@ -246,7 +327,7 @@
-               dnl Linking with a shared library. We attempt to hardcode its
-               dnl directory into the executable's runpath, unless it's the
-               dnl standard /usr/lib.
--              if test "$enable_rpath" = no || test "X$found_dir" = "X/usr/lib"; then
-+              if test "$enable_rpath" = no || test "X$found_dir" = "X/usr/$acl_libdirstem"; then
-                 dnl No hardcoding is needed.
-                 LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
-               else
-@@ -265,12 +346,12 @@
-                   ltrpathdirs="$ltrpathdirs $found_dir"
-                 fi
-                 dnl The hardcoding into $LIBNAME is system dependent.
--                if test "$hardcode_direct" = yes; then
-+                if test "$acl_hardcode_direct" = yes; then
-                   dnl Using DIR/libNAME.so during linking hardcodes DIR into the
-                   dnl resulting binary.
-                   LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
-                 else
--                  if test -n "$hardcode_libdir_flag_spec" && test "$hardcode_minus_L" = no; then
-+                  if test -n "$acl_hardcode_libdir_flag_spec" && test "$acl_hardcode_minus_L" = no; then
-                     dnl Use an explicit option to hardcode DIR into the resulting
-                     dnl binary.
-                     LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
-@@ -301,13 +382,13 @@
-                     if test -z "$haveit"; then
-                       LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-L$found_dir"
-                     fi
--                    if test "$hardcode_minus_L" != no; then
-+                    if test "$acl_hardcode_minus_L" != no; then
-                       dnl FIXME: Not sure whether we should use
-                       dnl "-L$found_dir -l$name" or "-L$found_dir $found_so"
-                       dnl here.
-                       LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
-                     else
--                      dnl We cannot use $hardcode_runpath_var and LD_RUN_PATH
-+                      dnl We cannot use $acl_hardcode_runpath_var and LD_RUN_PATH
-                       dnl here, because this doesn't fit in flags passed to the
-                       dnl compiler. So give up. No hardcoding. This affects only
-                       dnl very old systems.
-@@ -332,8 +413,9 @@
-             dnl Assume the include files are nearby.
-             additional_includedir=
-             case "$found_dir" in
--              */lib | */lib/)
--                basedir=`echo "X$found_dir" | sed -e 's,^X,,' -e 's,/lib/*$,,'`
-+              */$acl_libdirstem | */$acl_libdirstem/)
-+                basedir=`echo "X$found_dir" | sed -e 's,^X,,' -e "s,/$acl_libdirstem/"'*$,,'`
-+                LIB[]NAME[]_PREFIX="$basedir"
-                 additional_includedir="$basedir/include"
-                 ;;
-             esac
-@@ -350,7 +432,7 @@
-                 if test "X$additional_includedir" = "X/usr/local/include"; then
-                   if test -n "$GCC"; then
-                     case $host_os in
--                      linux*) haveit=yes;;
-+                      linux* | gnu* | k*bsd*-gnu) haveit=yes;;
-                     esac
-                   fi
-                 fi
-@@ -394,12 +476,12 @@
-                     dnl   3. if it's already present in $LDFLAGS or the already
-                     dnl      constructed $LIBNAME,
-                     dnl   4. if it doesn't exist as a directory.
--                    if test "X$additional_libdir" != "X/usr/lib"; then
-+                    if test "X$additional_libdir" != "X/usr/$acl_libdirstem"; then
-                       haveit=
--                      if test "X$additional_libdir" = "X/usr/local/lib"; then
-+                      if test "X$additional_libdir" = "X/usr/local/$acl_libdirstem"; then
-                         if test -n "$GCC"; then
-                           case $host_os in
--                            linux*) haveit=yes;;
-+                            linux* | gnu* | k*bsd*-gnu) haveit=yes;;
-                           esac
-                         fi
-                       fi
-@@ -495,18 +577,18 @@
-     done
-   done
-   if test "X$rpathdirs" != "X"; then
--    if test -n "$hardcode_libdir_separator"; then
-+    if test -n "$acl_hardcode_libdir_separator"; then
-       dnl Weird platform: only the last -rpath option counts, the user must
-       dnl pass all path elements in one option. We can arrange that for a
-       dnl single library, but not when more than one $LIBNAMEs are used.
-       alldirs=
-       for found_dir in $rpathdirs; do
--        alldirs="${alldirs}${alldirs:+$hardcode_libdir_separator}$found_dir"
-+        alldirs="${alldirs}${alldirs:+$acl_hardcode_libdir_separator}$found_dir"
-       done
--      dnl Note: hardcode_libdir_flag_spec uses $libdir and $wl.
-+      dnl Note: acl_hardcode_libdir_flag_spec uses $libdir and $wl.
-       acl_save_libdir="$libdir"
-       libdir="$alldirs"
--      eval flag=\"$hardcode_libdir_flag_spec\"
-+      eval flag=\"$acl_hardcode_libdir_flag_spec\"
-       libdir="$acl_save_libdir"
-       LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$flag"
-     else
-@@ -514,7 +596,7 @@
-       for found_dir in $rpathdirs; do
-         acl_save_libdir="$libdir"
-         libdir="$found_dir"
--        eval flag=\"$hardcode_libdir_flag_spec\"
-+        eval flag=\"$acl_hardcode_libdir_flag_spec\"
-         libdir="$acl_save_libdir"
-         LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$flag"
-       done
-@@ -549,3 +631,79 @@
-     fi
-   done
- ])
-+
-+dnl For those cases where a variable contains several -L and -l options
-+dnl referring to unknown libraries and directories, this macro determines the
-+dnl necessary additional linker options for the runtime path.
-+dnl AC_LIB_LINKFLAGS_FROM_LIBS([LDADDVAR], [LIBSVALUE], [USE-LIBTOOL])
-+dnl sets LDADDVAR to linker options needed together with LIBSVALUE.
-+dnl If USE-LIBTOOL evaluates to non-empty, linking with libtool is assumed,
-+dnl otherwise linking without libtool is assumed.
-+AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],
-+[
-+  AC_REQUIRE([AC_LIB_RPATH])
-+  AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
-+  $1=
-+  if test "$enable_rpath" != no; then
-+    if test -n "$acl_hardcode_libdir_flag_spec" && test "$acl_hardcode_minus_L" = no; then
-+      dnl Use an explicit option to hardcode directories into the resulting
-+      dnl binary.
-+      rpathdirs=
-+      next=
-+      for opt in $2; do
-+        if test -n "$next"; then
-+          dir="$next"
-+          dnl No need to hardcode the standard /usr/lib.
-+          if test "X$dir" != "X/usr/$acl_libdirstem"; then
-+            rpathdirs="$rpathdirs $dir"
-+          fi
-+          next=
-+        else
-+          case $opt in
-+            -L) next=yes ;;
-+            -L*) dir=`echo "X$opt" | sed -e 's,^X-L,,'`
-+                 dnl No need to hardcode the standard /usr/lib.
-+                 if test "X$dir" != "X/usr/$acl_libdirstem"; then
-+                   rpathdirs="$rpathdirs $dir"
-+                 fi
-+                 next= ;;
-+            *) next= ;;
-+          esac
-+        fi
-+      done
-+      if test "X$rpathdirs" != "X"; then
-+        if test -n ""$3""; then
-+          dnl libtool is used for linking. Use -R options.
-+          for dir in $rpathdirs; do
-+            $1="${$1}${$1:+ }-R$dir"
-+          done
-+        else
-+          dnl The linker is used for linking directly.
-+          if test -n "$acl_hardcode_libdir_separator"; then
-+            dnl Weird platform: only the last -rpath option counts, the user
-+            dnl must pass all path elements in one option.
-+            alldirs=
-+            for dir in $rpathdirs; do
-+              alldirs="${alldirs}${alldirs:+$acl_hardcode_libdir_separator}$dir"
-+            done
-+            acl_save_libdir="$libdir"
-+            libdir="$alldirs"
-+            eval flag=\"$acl_hardcode_libdir_flag_spec\"
-+            libdir="$acl_save_libdir"
-+            $1="$flag"
-+          else
-+            dnl The -rpath options are cumulative.
-+            for dir in $rpathdirs; do
-+              acl_save_libdir="$libdir"
-+              libdir="$dir"
-+              eval flag=\"$acl_hardcode_libdir_flag_spec\"
-+              libdir="$acl_save_libdir"
-+              $1="${$1}${$1:+ }$flag"
-+            done
-+          fi
-+        fi
-+      fi
-+    fi
-+  fi
-+  AC_SUBST([$1])
-+])
-Index: gettext-0.14.1/autoconf-lib-link/m4/lib-prefix.m4
-===================================================================
---- gettext-0.14.1.orig/autoconf-lib-link/m4/lib-prefix.m4	2008-04-15 14:32:45.000000000 +0100
-+++ gettext-0.14.1/autoconf-lib-link/m4/lib-prefix.m4	2008-04-15 14:32:47.000000000 +0100
-@@ -1,10 +1,8 @@
--# lib-prefix.m4 serial 3 (gettext-0.13)
--dnl Copyright (C) 2001-2003 Free Software Foundation, Inc.
--dnl This file is free software, distributed under the terms of the GNU
--dnl General Public License.  As a special exception to the GNU General
--dnl Public License, this file may be distributed as part of a program
--dnl that contains a configuration script generated by Autoconf, under
--dnl the same distribution terms as the rest of that program.
-+# lib-prefix.m4 serial 5 (gettext-0.15)
-+dnl Copyright (C) 2001-2005 Free Software Foundation, Inc.
-+dnl This file is free software; the Free Software Foundation
-+dnl gives unlimited permission to copy and/or distribute it,
-+dnl with or without modifications, as long as this notice is preserved.
- 
- dnl From Bruno Haible.
- 
-@@ -26,6 +24,7 @@
-   AC_BEFORE([$0], [AC_LIB_LINKFLAGS])
-   AC_REQUIRE([AC_PROG_CC])
-   AC_REQUIRE([AC_CANONICAL_HOST])
-+  AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
-   AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
-   dnl By default, look in $includedir and $libdir.
-   use_additional=yes
-@@ -47,7 +46,7 @@
-         ])
-       else
-         additional_includedir="$withval/include"
--        additional_libdir="$withval/lib"
-+        additional_libdir="$withval/$acl_libdirstem"
-       fi
-     fi
- ])
-@@ -71,7 +70,7 @@
-         if test "X$additional_includedir" = "X/usr/local/include"; then
-           if test -n "$GCC"; then
-             case $host_os in
--              linux*) haveit=yes;;
-+              linux* | gnu* | k*bsd*-gnu) haveit=yes;;
-             esac
-           fi
-         fi
-@@ -89,7 +88,7 @@
-     dnl   2. if it's already present in $LDFLAGS,
-     dnl   3. if it's /usr/local/lib and we are using GCC on Linux,
-     dnl   4. if it doesn't exist as a directory.
--    if test "X$additional_libdir" != "X/usr/lib"; then
-+    if test "X$additional_libdir" != "X/usr/$acl_libdirstem"; then
-       haveit=
-       for x in $LDFLAGS; do
-         AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
-@@ -99,7 +98,7 @@
-         fi
-       done
-       if test -z "$haveit"; then
--        if test "X$additional_libdir" = "X/usr/local/lib"; then
-+        if test "X$additional_libdir" = "X/usr/local/$acl_libdirstem"; then
-           if test -n "$GCC"; then
-             case $host_os in
-               linux*) haveit=yes;;
-@@ -153,3 +152,34 @@
-   exec_prefix="$acl_save_exec_prefix"
-   prefix="$acl_save_prefix"
- ])
-+
-+dnl AC_LIB_PREPARE_MULTILIB creates a variable acl_libdirstem, containing
-+dnl the basename of the libdir, either "lib" or "lib64".
-+AC_DEFUN([AC_LIB_PREPARE_MULTILIB],
-+[
-+  dnl There is no formal standard regarding lib and lib64. The current
-+  dnl practice is that on a system supporting 32-bit and 64-bit instruction
-+  dnl sets or ABIs, 64-bit libraries go under $prefix/lib64 and 32-bit
-+  dnl libraries go under $prefix/lib. We determine the compiler's default
-+  dnl mode by looking at the compiler's library search path. If at least
-+  dnl of its elements ends in /lib64 or points to a directory whose absolute
-+  dnl pathname ends in /lib64, we assume a 64-bit ABI. Otherwise we use the
-+  dnl default, namely "lib".
-+  acl_libdirstem=lib
-+  searchpath=`(LC_ALL=C $CC -print-search-dirs) 2>/dev/null | sed -n -e 's,^libraries: ,,p' | sed -e 's,^=,,'`
-+  if test -n "$searchpath"; then
-+    acl_save_IFS="${IFS= 	}"; IFS=":"
-+    for searchdir in $searchpath; do
-+      if test -d "$searchdir"; then
-+        case "$searchdir" in
-+          */lib64/ | */lib64 ) acl_libdirstem=lib64 ;;
-+          *) searchdir=`cd "$searchdir" && pwd`
-+             case "$searchdir" in
-+               */lib64 ) acl_libdirstem=lib64 ;;
-+             esac ;;
-+        esac
-+      fi
-+    done
-+    IFS="$acl_save_IFS"
-+  fi
-+])
-Index: gettext-0.14.1/autoconf-lib-link/config.rpath
-===================================================================
---- gettext-0.14.1.orig/autoconf-lib-link/config.rpath	2008-04-15 14:32:51.000000000 +0100
-+++ gettext-0.14.1/autoconf-lib-link/config.rpath	2007-06-28 00:01:49.000000000 +0100
-@@ -2,28 +2,13 @@
- # Output a system dependent set of variables, describing how to set the
- # run time search path of shared libraries in an executable.
- #
--#   Copyright 1996-2003 Free Software Foundation, Inc.
-+#   Copyright 1996-2007 Free Software Foundation, Inc.
- #   Taken from GNU libtool, 2001
- #   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
- #
--#   This program is free software; you can redistribute it and/or modify
--#   it under the terms of the GNU General Public License as published by
--#   the Free Software Foundation; either version 2 of the License, or
--#   (at your option) any later version.
--#
--#   This program is distributed in the hope that it will be useful, but
--#   WITHOUT ANY WARRANTY; without even the implied warranty of
--#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--#   General Public License for more details.
--#
--#   You should have received a copy of the GNU General Public License
--#   along with this program; if not, write to the Free Software
--#   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
--#
--#   As a special exception to the GNU General Public License, if you
--#   distribute this file as part of a program that contains a
--#   configuration script generated by Autoconf, you may include it under
--#   the same distribution terms that you use for the rest of that program.
-+#   This file is free software; the Free Software Foundation gives
-+#   unlimited permission to copy and/or distribute it, with or without
-+#   modifications, as long as this notice is preserved.
- #
- # The first argument passed to this file is the canonical host specification,
- #    CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM
-@@ -40,7 +25,7 @@
- #   known workaround is to choose shorter directory names for the build
- #   directory and/or the installation directory.
- 
--# All known linkers require a `.a' archive for static linking (except M$VC,
-+# All known linkers require a `.a' archive for static linking (except MSVC,
- # which needs '.lib').
- libext=a
- shrext=.so
-@@ -50,6 +35,18 @@
- host_vendor=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\2/'`
- host_os=`echo "$host" | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
- 
-+# Code taken from libtool.m4's _LT_CC_BASENAME.
-+
-+for cc_temp in $CC""; do
-+  case $cc_temp in
-+    compile | *[\\/]compile | ccache | *[\\/]ccache ) ;;
-+    distcc | *[\\/]distcc | purify | *[\\/]purify ) ;;
-+    \-*) ;;
-+    *) break;;
-+  esac
-+done
-+cc_basename=`echo "$cc_temp" | sed -e 's%^.*/%%'`
-+
- # Code taken from libtool.m4's AC_LIBTOOL_PROG_COMPILER_PIC.
- 
- wl=
-@@ -60,7 +57,14 @@
-     aix*)
-       wl='-Wl,'
-       ;;
--    mingw* | pw32* | os2*)
-+    darwin*)
-+      case $cc_basename in
-+        xlc*)
-+          wl='-Wl,'
-+          ;;
-+      esac
-+      ;;
-+    mingw* | cygwin* | pw32* | os2*)
-       ;;
-     hpux9* | hpux10* | hpux11*)
-       wl='-Wl,'
-@@ -70,20 +74,33 @@
-       ;;
-     newsos6)
-       ;;
--    linux*)
--      case $CC in
--        icc|ecc)
-+    linux* | k*bsd*-gnu)
-+      case $cc_basename in
-+        icc* | ecc*)
-+          wl='-Wl,'
-+          ;;
-+        pgcc | pgf77 | pgf90)
-           wl='-Wl,'
-           ;;
--        ccc)
-+        ccc*)
-           wl='-Wl,'
-           ;;
-+        como)
-+          wl='-lopt='
-+          ;;
-+        *)
-+          case `$CC -V 2>&1 | sed 5q` in
-+            *Sun\ C*)
-+              wl='-Wl,'
-+              ;;
-+          esac
-+          ;;
-       esac
-       ;;
-     osf3* | osf4* | osf5*)
-       wl='-Wl,'
-       ;;
--    sco3.2v5*)
-+    rdos*)
-       ;;
-     solaris*)
-       wl='-Wl,'
-@@ -91,11 +108,17 @@
-     sunos4*)
-       wl='-Qoption ld '
-       ;;
--    sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
-+    sysv4 | sysv4.2uw2* | sysv4.3*)
-       wl='-Wl,'
-       ;;
-     sysv4*MP*)
-       ;;
-+    sysv5* | unixware* | sco3.2v5* | sco5v6* | OpenUNIX*)
-+      wl='-Wl,'
-+      ;;
-+    unicos*)
-+      wl='-Wl,'
-+      ;;
-     uts4*)
-       ;;
-   esac
-@@ -117,6 +140,10 @@
-       with_gnu_ld=no
-     fi
-     ;;
-+  interix*)
-+    # we just hope/assume this is gcc and not c89 (= MSVC++)
-+    with_gnu_ld=yes
-+    ;;
-   openbsd*)
-     with_gnu_ld=no
-     ;;
-@@ -124,6 +151,12 @@
- 
- ld_shlibs=yes
- if test "$with_gnu_ld" = yes; then
-+  # Set some defaults for GNU ld with shared library support. These
-+  # are reset later if shared libraries are not supported. Putting them
-+  # here allows them to be overridden if necessary.
-+  # Unlike libtool, we use -rpath here, not --rpath, since the documented
-+  # option of GNU ld is called -rpath, not --rpath.
-+  hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
-   case "$host_os" in
-     aix3* | aix4* | aix5*)
-       # On AIX/PPC, the GNU linker is very broken
-@@ -138,7 +171,7 @@
-       # that the semantics of dynamic libraries on AmigaOS, at least up
-       # to version 4, is to share data among multiple programs linked
-       # with the same dynamic library.  Since this doesn't match the
--      # behavior of shared libraries on other platforms, we can use
-+      # behavior of shared libraries on other platforms, we cannot use
-       # them.
-       ld_shlibs=no
-       ;;
-@@ -159,9 +192,20 @@
-         ld_shlibs=no
-       fi
-       ;;
-+    interix[3-9]*)
-+      hardcode_direct=no
-+      hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
-+      ;;
-+    gnu* | linux* | k*bsd*-gnu)
-+      if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
-+        :
-+      else
-+        ld_shlibs=no
-+      fi
-+      ;;
-     netbsd*)
-       ;;
--    solaris* | sysv5*)
-+    solaris*)
-       if $LD -v 2>&1 | grep 'BFD 2\.8' > /dev/null; then
-         ld_shlibs=no
-       elif $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
-@@ -170,6 +214,20 @@
-         ld_shlibs=no
-       fi
-       ;;
-+    sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX*)
-+      case `$LD -v 2>&1` in
-+        *\ [01].* | *\ 2.[0-9].* | *\ 2.1[0-5].*)
-+          ld_shlibs=no
-+          ;;
-+        *)
-+          if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
-+            hardcode_libdir_flag_spec='`test -z "$SCOABSPATH" && echo ${wl}-rpath,$libdir`'
-+          else
-+            ld_shlibs=no
-+          fi
-+          ;;
-+      esac
-+      ;;
-     sunos4*)
-       hardcode_direct=yes
-       ;;
-@@ -181,10 +239,8 @@
-       fi
-       ;;
-   esac
--  if test "$ld_shlibs" = yes; then
--    # Unlike libtool, we use -rpath here, not --rpath, since the documented
--    # option of GNU ld is called -rpath, not --rpath.
--    hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
-+  if test "$ld_shlibs" = no; then
-+    hardcode_libdir_flag_spec=
-   fi
- else
-   case "$host_os" in
-@@ -215,6 +271,7 @@
-               break
-             fi
-           done
-+          ;;
-         esac
-       fi
-       hardcode_direct=yes
-@@ -226,7 +283,7 @@
-             strings "$collect2name" | grep resolve_lib_name >/dev/null
-           then
-             # We have reworked collect2
--            hardcode_direct=yes
-+            :
-           else
-             # We have old collect2
-             hardcode_direct=unsupported
-@@ -234,6 +291,7 @@
-             hardcode_libdir_flag_spec='-L$libdir'
-             hardcode_libdir_separator=
-           fi
-+          ;;
-         esac
-       fi
-       # Begin _LT_AC_SYS_LIBPATH_AIX.
-@@ -266,7 +324,7 @@
-       # see comment about different semantics on the GNU ld section
-       ld_shlibs=no
-       ;;
--    bsdi4*)
-+    bsdi[45]*)
-       ;;
-     cygwin* | mingw* | pw32*)
-       # When not using gcc, we currently assume that we are using
-@@ -277,8 +335,17 @@
-       libext=lib
-       ;;
-     darwin* | rhapsody*)
--      if $CC -v 2>&1 | grep 'Apple' >/dev/null ; then
--        hardcode_direct=no
-+      hardcode_direct=no
-+      if test "$GCC" = yes ; then
-+        :
-+      else
-+        case $cc_basename in
-+          xlc*)
-+            ;;
-+          *)
-+            ld_shlibs=no
-+            ;;
-+        esac
-       fi
-       ;;
-     dgux*)
-@@ -295,7 +362,7 @@
-       hardcode_direct=yes
-       hardcode_minus_L=yes
-       ;;
--    freebsd*)
-+    freebsd* | dragonfly*)
-       hardcode_libdir_flag_spec='-R$libdir'
-       hardcode_direct=yes
-       ;;
-@@ -307,24 +374,25 @@
-       # but as the default location of the library.
-       hardcode_minus_L=yes
-       ;;
--    hpux10* | hpux11*)
-+    hpux10*)
-       if test "$with_gnu_ld" = no; then
--        case "$host_cpu" in
--          hppa*64*)
--            hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
--            hardcode_libdir_separator=:
--            hardcode_direct=no
--            ;;
--          ia64*)
--            hardcode_libdir_flag_spec='-L$libdir'
-+        hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
-+        hardcode_libdir_separator=:
-+        hardcode_direct=yes
-+        # hardcode_minus_L: Not really in the search PATH,
-+        # but as the default location of the library.
-+        hardcode_minus_L=yes
-+      fi
-+      ;;
-+    hpux11*)
-+      if test "$with_gnu_ld" = no; then
-+        hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
-+        hardcode_libdir_separator=:
-+        case $host_cpu in
-+          hppa*64*|ia64*)
-             hardcode_direct=no
--            # hardcode_minus_L: Not really in the search PATH,
--            # but as the default location of the library.
--            hardcode_minus_L=yes
-             ;;
-           *)
--            hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
--            hardcode_libdir_separator=:
-             hardcode_direct=yes
-             # hardcode_minus_L: Not really in the search PATH,
-             # but as the default location of the library.
-@@ -347,18 +415,22 @@
-       hardcode_libdir_separator=:
-       ;;
-     openbsd*)
--      hardcode_direct=yes
--      if test -z "`echo __ELF__ | $CC -E - | grep __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
--        hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
-+      if test -f /usr/libexec/ld.so; then
-+        hardcode_direct=yes
-+        if test -z "`echo __ELF__ | $CC -E - | grep __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
-+          hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
-+        else
-+          case "$host_os" in
-+            openbsd[01].* | openbsd2.[0-7] | openbsd2.[0-7].*)
-+              hardcode_libdir_flag_spec='-R$libdir'
-+              ;;
-+            *)
-+              hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
-+              ;;
-+          esac
-+        fi
-       else
--        case "$host_os" in
--          openbsd[01].* | openbsd2.[0-7] | openbsd2.[0-7].*)
--            hardcode_libdir_flag_spec='-R$libdir'
--            ;;
--          *)
--            hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
--            ;;
--        esac
-+        ld_shlibs=no
-       fi
-       ;;
-     os2*)
-@@ -378,8 +450,6 @@
-       fi
-       hardcode_libdir_separator=:
-       ;;
--    sco3.2v5*)
--      ;;
-     solaris*)
-       hardcode_libdir_flag_spec='-R$libdir'
-       ;;
-@@ -408,14 +478,11 @@
-         ld_shlibs=yes
-       fi
-       ;;
--    sysv4.2uw2*)
--      hardcode_direct=yes
--      hardcode_minus_L=no
--      ;;
--    sysv5OpenUNIX8* | sysv5UnixWare7* |  sysv5uw[78]* | unixware7*)
-+    sysv4*uw2* | sysv5OpenUNIX* | sysv5UnixWare7.[01].[10]* | unixware7* | sco3.2v5.0.[024]*)
-       ;;
--    sysv5*)
--      hardcode_libdir_flag_spec=
-+    sysv5* | sco3.2v5* | sco5v6*)
-+      hardcode_libdir_flag_spec='`test -z "$SCOABSPATH" && echo ${wl}-R,$libdir`'
-+      hardcode_libdir_separator=':'
-       ;;
-     uts4*)
-       hardcode_libdir_flag_spec='-L$libdir'
-@@ -428,34 +495,54 @@
- 
- # Check dynamic linker characteristics
- # Code taken from libtool.m4's AC_LIBTOOL_SYS_DYNAMIC_LINKER.
-+# Unlike libtool.m4, here we don't care about _all_ names of the library, but
-+# only about the one the linker finds when passed -lNAME. This is the last
-+# element of library_names_spec in libtool.m4, or possibly two of them if the
-+# linker has special search rules.
-+library_names_spec=      # the last element of library_names_spec in libtool.m4
- libname_spec='lib$name'
- case "$host_os" in
-   aix3*)
-+    library_names_spec='$libname.a'
-     ;;
-   aix4* | aix5*)
-+    library_names_spec='$libname$shrext'
-     ;;
-   amigaos*)
-+    library_names_spec='$libname.a'
-     ;;
-   beos*)
-+    library_names_spec='$libname$shrext'
-     ;;
--  bsdi4*)
-+  bsdi[45]*)
-+    library_names_spec='$libname$shrext'
-     ;;
-   cygwin* | mingw* | pw32*)
-     shrext=.dll
-+    library_names_spec='$libname.dll.a $libname.lib'
-     ;;
-   darwin* | rhapsody*)
-     shrext=.dylib
-+    library_names_spec='$libname$shrext'
-     ;;
-   dgux*)
-+    library_names_spec='$libname$shrext'
-     ;;
-   freebsd1*)
-     ;;
--  freebsd*)
-+  freebsd* | dragonfly*)
-+    case "$host_os" in
-+      freebsd[123]*)
-+        library_names_spec='$libname$shrext$versuffix' ;;
-+      *)
-+        library_names_spec='$libname$shrext' ;;
-+    esac
-     ;;
-   gnu*)
-+    library_names_spec='$libname$shrext'
-     ;;
-   hpux9* | hpux10* | hpux11*)
--    case "$host_cpu" in
-+    case $host_cpu in
-       ia64*)
-         shrext=.so
-         ;;
-@@ -466,8 +553,13 @@
-         shrext=.sl
-         ;;
-     esac
-+    library_names_spec='$libname$shrext'
-+    ;;
-+  interix[3-9]*)
-+    library_names_spec='$libname$shrext'
-     ;;
-   irix5* | irix6* | nonstopux*)
-+    library_names_spec='$libname$shrext'
-     case "$host_os" in
-       irix5* | nonstopux*)
-         libsuff= shlibsuff=
-@@ -484,42 +576,62 @@
-     ;;
-   linux*oldld* | linux*aout* | linux*coff*)
-     ;;
--  linux*)
-+  linux* | k*bsd*-gnu)
-+    library_names_spec='$libname$shrext'
-+    ;;
-+  knetbsd*-gnu)
-+    library_names_spec='$libname$shrext'
-     ;;
-   netbsd*)
-+    library_names_spec='$libname$shrext'
-     ;;
-   newsos6)
-+    library_names_spec='$libname$shrext'
-     ;;
--  nto-qnx)
-+  nto-qnx*)
-+    library_names_spec='$libname$shrext'
-     ;;
-   openbsd*)
-+    library_names_spec='$libname$shrext$versuffix'
-     ;;
-   os2*)
-     libname_spec='$name'
-     shrext=.dll
-+    library_names_spec='$libname.a'
-     ;;
-   osf3* | osf4* | osf5*)
-+    library_names_spec='$libname$shrext'
-     ;;
--  sco3.2v5*)
-+  rdos*)
-     ;;
-   solaris*)
-+    library_names_spec='$libname$shrext'
-     ;;
-   sunos4*)
-+    library_names_spec='$libname$shrext$versuffix'
-     ;;
--  sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
-+  sysv4 | sysv4.3*)
-+    library_names_spec='$libname$shrext'
-     ;;
-   sysv4*MP*)
-+    library_names_spec='$libname$shrext'
-+    ;;
-+  sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX* | sysv4*uw2*)
-+    library_names_spec='$libname$shrext'
-     ;;
-   uts4*)
-+    library_names_spec='$libname$shrext'
-     ;;
- esac
- 
- sed_quote_subst='s/\(["`$\\]\)/\\\1/g'
- escaped_wl=`echo "X$wl" | sed -e 's/^X//' -e "$sed_quote_subst"`
- shlibext=`echo "$shrext" | sed -e 's,^\.,,'`
-+escaped_libname_spec=`echo "X$libname_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
-+escaped_library_names_spec=`echo "X$library_names_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
- escaped_hardcode_libdir_flag_spec=`echo "X$hardcode_libdir_flag_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
- 
--sed -e 's/^\([a-zA-Z0-9_]*\)=/acl_cv_\1=/' <<EOF
-+LC_ALL=C sed -e 's/^\([a-zA-Z0-9_]*\)=/acl_cv_\1=/' <<EOF
- 
- # How to pass a linker flag through the compiler.
- wl="$escaped_wl"
-@@ -530,6 +642,12 @@
- # Shared library suffix (normally "so").
- shlibext="$shlibext"
- 
-+# Format of library name prefix.
-+libname_spec="$escaped_libname_spec"
-+
-+# Library names that the linker finds when passed -lNAME.
-+library_names_spec="$escaped_library_names_spec"
-+
- # Flag to hardcode \$libdir into a binary during linking.
- # This must work even if \$libdir does not exist.
- hardcode_libdir_flag_spec="$escaped_hardcode_libdir_flag_spec"
diff --git a/meta/recipes-core/gettext/gettext-0.14.1/disable_java.patch b/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
similarity index 53%
rename from meta/recipes-core/gettext/gettext-0.14.1/disable_java.patch
rename to meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
index f1ae816..cf7dc55 100644
--- a/meta/recipes-core/gettext/gettext-0.14.1/disable_java.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
@@ -2,31 +2,30 @@
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
 
-Index: gettext-0.14.1/gettext-tools/configure.ac
+Index: gettext-0.16.1/gettext-tools/configure.ac
 ===================================================================
---- gettext-0.14.1.orig/gettext-tools/configure.ac	2004-01-16 10:49:06.000000000 +0000
-+++ gettext-0.14.1/gettext-tools/configure.ac	2007-11-14 21:43:39.000000000 +0000
-@@ -37,28 +37,16 @@
- AC_PROG_YACC
+--- gettext-0.16.1.orig/gettext-tools/configure.ac	2006-11-27 09:02:01.000000000 -0800
++++ gettext-0.16.1/gettext-tools/configure.ac	2011-03-16 16:55:36.111396557 -0700
+@@ -36,27 +36,15 @@
+ gt_JAVA_CHOICE
  
  gt_GCJ
--if test -n "$HAVE_GCJ"; then
+-if test -n "$HAVE_GCJ" && test "$JAVA_CHOICE" = yes; then
 -  BUILDJAVAEXE=yes
 -else
    BUILDJAVAEXE=no
 -fi
  AC_SUBST(BUILDJAVAEXE)
  
- gt_JAVACOMP
+ gt_JAVAEXEC
+ gt_JAVACOMP([1.3])
  AC_CHECK_PROG(JAR, jar, jar)
--if test -n "$HAVE_JAVACOMP" && test -n "$JAR"; then
+-if test -n "$HAVE_JAVACOMP" && test -n "$JAR" && test "$JAVA_CHOICE" != no; then
 -  BUILDJAVA=yes
 -else
    BUILDJAVA=no
 -fi
  AC_SUBST(BUILDJAVA)
- 
- gt_JAVAEXEC
 -if test -n "$HAVE_JAVAEXEC" && test $BUILDJAVA = yes; then
 -  TESTJAVA=yes
 -else
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch b/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
new file mode 100644
index 0000000..3796052
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
@@ -0,0 +1,107 @@
+This patch updates the required version number from 2.61 to the 
+current 2.65 version of aclocal, this will need to be updated 
+when we update aclocal
+
+Signed-off-by Saul Wold <sgw@linux.intel.com>
+
+Index: gettext-0.16.1/autoconf-lib-link/m4/lib-link.m4
+===================================================================
+--- gettext-0.16.1.orig/autoconf-lib-link/m4/lib-link.m4	2011-03-17 02:24:36.391519775 -0700
++++ gettext-0.16.1/autoconf-lib-link/m4/lib-link.m4	2011-03-17 02:24:45.569526073 -0700
+@@ -148,7 +148,7 @@
+   define([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
+                                [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
+   dnl Autoconf >= 2.61 supports dots in --with options.
+-  define([N_A_M_E],[m4_if(m4_version_compare(m4_defn([m4_PACKAGE_VERSION]),[2.61]),[-1],[translit([$1],[.],[_])],[$1])])
++  define([N_A_M_E],[m4_if(m4_version_compare(m4_defn([m4_PACKAGE_VERSION]),[2.65]),[-1],[translit([$1],[.],[_])],[$1])])
+   dnl By default, look in $includedir and $libdir.
+   use_additional=yes
+   AC_LIB_WITH_FINAL_PREFIX([
+Index: gettext-0.16.1/autoconf-lib-link/tests/rpathly/aclocal.m4
+===================================================================
+--- gettext-0.16.1.orig/autoconf-lib-link/tests/rpathly/aclocal.m4	2011-03-17 02:24:36.391519775 -0700
++++ gettext-0.16.1/autoconf-lib-link/tests/rpathly/aclocal.m4	2011-03-17 02:24:45.570526904 -0700
+@@ -11,8 +11,8 @@
+ # even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+ # PARTICULAR PURPOSE.
+ 
+-m4_if(m4_PACKAGE_VERSION, [2.61],,
+-[m4_fatal([this file was generated for autoconf 2.61.
++m4_if(m4_PACKAGE_VERSION, [2.65],,
++[m4_fatal([this file was generated for autoconf 2.65.
+ You have another version of autoconf.  If you want to use that,
+ you should regenerate the build system entirely.], [63])])
+ 
+Index: gettext-0.16.1/autoconf-lib-link/tests/rpathx/aclocal.m4
+===================================================================
+--- gettext-0.16.1.orig/autoconf-lib-link/tests/rpathx/aclocal.m4	2011-03-17 02:24:36.391519775 -0700
++++ gettext-0.16.1/autoconf-lib-link/tests/rpathx/aclocal.m4	2011-03-17 02:24:45.572525773 -0700
+@@ -11,8 +11,8 @@
+ # even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+ # PARTICULAR PURPOSE.
+ 
+-m4_if(m4_PACKAGE_VERSION, [2.61],,
+-[m4_fatal([this file was generated for autoconf 2.61.
++m4_if(m4_PACKAGE_VERSION, [2.65],,
++[m4_fatal([this file was generated for autoconf 2.65.
+ You have another version of autoconf.  If you want to use that,
+ you should regenerate the build system entirely.], [63])])
+ 
+Index: gettext-0.16.1/autoconf-lib-link/tests/rpathy/aclocal.m4
+===================================================================
+--- gettext-0.16.1.orig/autoconf-lib-link/tests/rpathy/aclocal.m4	2011-03-17 02:24:36.391519775 -0700
++++ gettext-0.16.1/autoconf-lib-link/tests/rpathy/aclocal.m4	2011-03-17 02:24:45.578394916 -0700
+@@ -11,7 +11,7 @@
+ # even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+ # PARTICULAR PURPOSE.
+ 
+-m4_if(m4_PACKAGE_VERSION, [2.61],,
++m4_if(m4_PACKAGE_VERSION, [2.65],,
+ [m4_fatal([this file was generated for autoconf 2.61.
+ You have another version of autoconf.  If you want to use that,
+ you should regenerate the build system entirely.], [63])])
+Index: gettext-0.16.1/autoconf-lib-link/tests/rpathz/aclocal.m4
+===================================================================
+--- gettext-0.16.1.orig/autoconf-lib-link/tests/rpathz/aclocal.m4	2011-03-17 02:24:36.391519775 -0700
++++ gettext-0.16.1/autoconf-lib-link/tests/rpathz/aclocal.m4	2011-03-17 02:24:45.586395416 -0700
+@@ -11,8 +11,8 @@
+ # even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+ # PARTICULAR PURPOSE.
+ 
+-m4_if(m4_PACKAGE_VERSION, [2.61],,
+-[m4_fatal([this file was generated for autoconf 2.61.
++m4_if(m4_PACKAGE_VERSION, [2.65],,
++[m4_fatal([this file was generated for autoconf 2.65.
+ You have another version of autoconf.  If you want to use that,
+ you should regenerate the build system entirely.], [63])])
+ 
+Index: gettext-0.16.1/gettext-tools/aclocal.m4
+===================================================================
+--- gettext-0.16.1.orig/gettext-tools/aclocal.m4	2006-11-27 09:34:32.000000000 -0800
++++ gettext-0.16.1/gettext-tools/aclocal.m4	2011-03-17 02:27:01.135682807 -0700
+@@ -11,8 +11,8 @@
+ # even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+ # PARTICULAR PURPOSE.
+ 
+-m4_if(m4_PACKAGE_VERSION, [2.61],,
+-[m4_fatal([this file was generated for autoconf 2.61.
++m4_if(m4_PACKAGE_VERSION, [2.65],,
++[m4_fatal([this file was generated for autoconf 2.65.
+ You have another version of autoconf.  If you want to use that,
+ you should regenerate the build system entirely.], [63])])
+ 
+Index: gettext-0.16.1/gettext-tools/examples/aclocal.m4
+===================================================================
+--- gettext-0.16.1.orig/gettext-tools/examples/aclocal.m4	2006-11-27 09:16:23.000000000 -0800
++++ gettext-0.16.1/gettext-tools/examples/aclocal.m4	2011-03-17 02:26:52.589396683 -0700
+@@ -11,8 +11,8 @@
+ # even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+ # PARTICULAR PURPOSE.
+ 
+-m4_if(m4_PACKAGE_VERSION, [2.61],,
+-[m4_fatal([this file was generated for autoconf 2.61.
++m4_if(m4_PACKAGE_VERSION, [2.65],,
++[m4_fatal([this file was generated for autoconf 2.65.
+ You have another version of autoconf.  If you want to use that,
+ you should regenerate the build system entirely.], [63])])
+ 
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch b/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
new file mode 100644
index 0000000..8b42f1b
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
@@ -0,0 +1,345 @@
+This patch removes the circular dependency on AC_GNU_SOURCE in
+AC_USE_SYSTEM_EXTENSIONS.
+
+Thanks to Mark Hatle for the timely pointers and fixes.
+
+Signed-off-by Saul Wold <sgw@linux.intel.com>
+
+diff -ru gettext-0.16.1/gettext-runtime/gnulib-m4/extensions.m4 gettext.patched/gettext-runtime/gnulib-m4/extensions.m4
+--- gettext-0.16.1/gettext-runtime/gnulib-m4/extensions.m4	2006-11-27 09:14:38.000000000 -0800
++++ gettext.patched/gettext-runtime/gnulib-m4/extensions.m4	2011-03-16 23:54:01.711923448 -0700
+@@ -16,43 +16,47 @@
+ # ------------------------
+ # Enable extensions on systems that normally disable them,
+ # typically due to standards-conformance issues.
+-AC_DEFUN([AC_USE_SYSTEM_EXTENSIONS],
+-[
+-  AC_BEFORE([$0], [AC_COMPILE_IFELSE])
+-  AC_BEFORE([$0], [AC_RUN_IFELSE])
+-
+-  AC_REQUIRE([AC_GNU_SOURCE])
+-  AC_REQUIRE([AC_AIX])
+-  AC_REQUIRE([AC_MINIX])
+-
+-  AH_VERBATIM([__EXTENSIONS__],
+-[/* Enable extensions on Solaris.  */
+-#ifndef __EXTENSIONS__
+-# undef __EXTENSIONS__
+-#endif
+-#ifndef _POSIX_PTHREAD_SEMANTICS
+-# undef _POSIX_PTHREAD_SEMANTICS
+-#endif
+-#ifndef _TANDEM_SOURCE
+-# undef _TANDEM_SOURCE
+-#endif])
+-  AC_CACHE_CHECK([whether it is safe to define __EXTENSIONS__],
+-    [ac_cv_safe_to_define___extensions__],
+-    [AC_COMPILE_IFELSE(
+-       [AC_LANG_PROGRAM([
+-#	  define __EXTENSIONS__ 1
+-	  AC_INCLUDES_DEFAULT])],
+-       [ac_cv_safe_to_define___extensions__=yes],
+-       [ac_cv_safe_to_define___extensions__=no])])
+-  test $ac_cv_safe_to_define___extensions__ = yes &&
+-    AC_DEFINE([__EXTENSIONS__])
+-  AC_DEFINE([_POSIX_PTHREAD_SEMANTICS])
+-  AC_DEFINE([_TANDEM_SOURCE])
+-])
++#AC_DEFUN([AC_USE_SYSTEM_EXTENSIONS],
++#[
++#  AC_BEFORE([$0], [AC_COMPILE_IFELSE])
++#  AC_BEFORE([$0], [AC_RUN_IFELSE])
++#
++#  AC_REQUIRE([AC_GNU_SOURCE])
++#  AC_REQUIRE([AC_AIX])
++#  AC_REQUIRE([AC_MINIX])
++#
++#  AH_VERBATIM([__EXTENSIONS__],
++#[/* Enable extensions on Solaris.  */
++##ifndef __EXTENSIONS__
++## undef __EXTENSIONS__
++##endif
++##ifndef _POSIX_PTHREAD_SEMANTICS
++## undef _POSIX_PTHREAD_SEMANTICS
++##endif
++##ifndef _TANDEM_SOURCE
++## undef _TANDEM_SOURCE
++##endif])
++#  AC_CACHE_CHECK([whether it is safe to define __EXTENSIONS__],
++#    [ac_cv_safe_to_define___extensions__],
++#    [AC_COMPILE_IFELSE(
++#       [AC_LANG_PROGRAM([
++##	  define __EXTENSIONS__ 1
++#	  AC_INCLUDES_DEFAULT])],
++#       [ac_cv_safe_to_define___extensions__=yes],
++#       [ac_cv_safe_to_define___extensions__=no])])
++#  test $ac_cv_safe_to_define___extensions__ = yes &&
++#    AC_DEFINE([__EXTENSIONS__])
++#  AC_DEFINE([_POSIX_PTHREAD_SEMANTICS])
++#  AC_DEFINE([_TANDEM_SOURCE])
++#])
+ 
+ # gl_USE_SYSTEM_EXTENSIONS
+ # ------------------------
+ # Enable extensions on systems that normally disable them,
+ # typically due to standards-conformance issues.
+ AC_DEFUN([gl_USE_SYSTEM_EXTENSIONS],
+-  [AC_REQUIRE([AC_USE_SYSTEM_EXTENSIONS])])
++[
++   AC_REQUIRE([AC_GNU_SOURCE])
++
++   AC_REQUIRE([AC_USE_SYSTEM_EXTENSIONS])
++])
+diff -ru gettext-0.16.1/gettext-runtime/gnulib-m4/gnulib-comp.m4 gettext.patched/gettext-runtime/gnulib-m4/gnulib-comp.m4
+--- gettext-0.16.1/gettext-runtime/gnulib-m4/gnulib-comp.m4	2006-11-27 09:33:19.000000000 -0800
++++ gettext.patched/gettext-runtime/gnulib-m4/gnulib-comp.m4	2011-03-16 23:50:17.471531838 -0700
+@@ -25,7 +25,7 @@
+   m4_pattern_allow([^gl_LIBOBJS$])dnl a variable
+   m4_pattern_allow([^gl_LTLIBOBJS$])dnl a variable
+   AC_REQUIRE([AC_PROG_RANLIB])
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+   AC_REQUIRE([gl_USE_SYSTEM_EXTENSIONS])
+ ])
+ 
+diff -ru gettext-0.16.1/gettext-runtime/gnulib-m4/mbchar.m4 gettext.patched/gettext-runtime/gnulib-m4/mbchar.m4
+--- gettext-0.16.1/gettext-runtime/gnulib-m4/mbchar.m4	2006-11-27 09:14:38.000000000 -0800
++++ gettext.patched/gettext-runtime/gnulib-m4/mbchar.m4	2011-03-16 23:50:10.814396529 -0700
+@@ -9,7 +9,7 @@
+ 
+ AC_DEFUN([gl_MBCHAR],
+ [
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+   dnl The following line is that so the user can test HAVE_WCHAR_H
+   dnl before #include "mbchar.h".
+   AC_CHECK_HEADERS_ONCE([wchar.h])
+diff -ru gettext-0.16.1/gettext-runtime/gnulib-m4/wcwidth.m4 gettext.patched/gettext-runtime/gnulib-m4/wcwidth.m4
+--- gettext-0.16.1/gettext-runtime/gnulib-m4/wcwidth.m4	2006-11-27 09:14:38.000000000 -0800
++++ gettext.patched/gettext-runtime/gnulib-m4/wcwidth.m4	2011-03-16 23:50:08.357396247 -0700
+@@ -7,7 +7,7 @@
+ AC_DEFUN([gl_FUNC_WCWIDTH],
+ [
+   dnl Persuade glibc <wchar.h> to declare wcwidth().
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+ 
+   AC_REQUIRE([AC_C_INLINE])
+   AC_REQUIRE([gt_TYPE_WCHAR_T])
+diff -ru gettext-0.16.1/gettext-runtime/m4/lock.m4 gettext.patched/gettext-runtime/m4/lock.m4
+--- gettext-0.16.1/gettext-runtime/m4/lock.m4	2006-10-24 13:59:59.000000000 -0700
++++ gettext.patched/gettext-runtime/m4/lock.m4	2011-03-16 23:50:04.355891676 -0700
+@@ -35,7 +35,7 @@
+   AC_BEFORE([$0], [gl_ARGP])dnl
+ 
+   AC_REQUIRE([AC_CANONICAL_HOST])
+-  AC_REQUIRE([AC_GNU_SOURCE]) dnl needed for pthread_rwlock_t on glibc systems
++  dnl AC_REQUIRE([AC_GNU_SOURCE]) dnl needed for pthread_rwlock_t on glibc systems
+   dnl Check for multithreading.
+   AC_ARG_ENABLE(threads,
+ AC_HELP_STRING([--enable-threads={posix|solaris|pth|win32}], [specify multithreading API])
+diff -ru gettext-0.16.1/gettext-tools/gnulib-m4/extensions.m4 gettext.patched/gettext-tools/gnulib-m4/extensions.m4
+--- gettext-0.16.1/gettext-tools/gnulib-m4/extensions.m4	2006-11-27 09:14:54.000000000 -0800
++++ gettext.patched/gettext-tools/gnulib-m4/extensions.m4	2011-03-16 23:53:28.487671266 -0700
+@@ -16,43 +16,47 @@
+ # ------------------------
+ # Enable extensions on systems that normally disable them,
+ # typically due to standards-conformance issues.
+-AC_DEFUN([AC_USE_SYSTEM_EXTENSIONS],
+-[
+-  AC_BEFORE([$0], [AC_COMPILE_IFELSE])
+-  AC_BEFORE([$0], [AC_RUN_IFELSE])
+-
+-  AC_REQUIRE([AC_GNU_SOURCE])
+-  AC_REQUIRE([AC_AIX])
+-  AC_REQUIRE([AC_MINIX])
+-
+-  AH_VERBATIM([__EXTENSIONS__],
+-[/* Enable extensions on Solaris.  */
+-#ifndef __EXTENSIONS__
+-# undef __EXTENSIONS__
+-#endif
+-#ifndef _POSIX_PTHREAD_SEMANTICS
+-# undef _POSIX_PTHREAD_SEMANTICS
+-#endif
+-#ifndef _TANDEM_SOURCE
+-# undef _TANDEM_SOURCE
+-#endif])
+-  AC_CACHE_CHECK([whether it is safe to define __EXTENSIONS__],
+-    [ac_cv_safe_to_define___extensions__],
+-    [AC_COMPILE_IFELSE(
+-       [AC_LANG_PROGRAM([
+-#	  define __EXTENSIONS__ 1
+-	  AC_INCLUDES_DEFAULT])],
+-       [ac_cv_safe_to_define___extensions__=yes],
+-       [ac_cv_safe_to_define___extensions__=no])])
+-  test $ac_cv_safe_to_define___extensions__ = yes &&
+-    AC_DEFINE([__EXTENSIONS__])
+-  AC_DEFINE([_POSIX_PTHREAD_SEMANTICS])
+-  AC_DEFINE([_TANDEM_SOURCE])
+-])
++#AC_DEFUN([AC_USE_SYSTEM_EXTENSIONS],
++#[
++#  AC_BEFORE([$0], [AC_COMPILE_IFELSE])
++#  AC_BEFORE([$0], [AC_RUN_IFELSE])
++#
++#  AC_REQUIRE([AC_GNU_SOURCE])
++#  AC_REQUIRE([AC_AIX])
++#  AC_REQUIRE([AC_MINIX])
++#
++#  AH_VERBATIM([__EXTENSIONS__],
++#[/* Enable extensions on Solaris.  */
++##ifndef __EXTENSIONS__
++## undef __EXTENSIONS__
++##endif
++##ifndef _POSIX_PTHREAD_SEMANTICS
++## undef _POSIX_PTHREAD_SEMANTICS
++##endif
++##ifndef _TANDEM_SOURCE
++## undef _TANDEM_SOURCE
++##endif])
++#  AC_CACHE_CHECK([whether it is safe to define __EXTENSIONS__],
++#    [ac_cv_safe_to_define___extensions__],
++#    [AC_COMPILE_IFELSE(
++#       [AC_LANG_PROGRAM([
++##	  define __EXTENSIONS__ 1
++#	  AC_INCLUDES_DEFAULT])],
++#       [ac_cv_safe_to_define___extensions__=yes],
++#       [ac_cv_safe_to_define___extensions__=no])])
++#  test $ac_cv_safe_to_define___extensions__ = yes &&
++#    AC_DEFINE([__EXTENSIONS__])
++#  AC_DEFINE([_POSIX_PTHREAD_SEMANTICS])
++#  AC_DEFINE([_TANDEM_SOURCE])
++#])
+ 
+ # gl_USE_SYSTEM_EXTENSIONS
+ # ------------------------
+ # Enable extensions on systems that normally disable them,
+ # typically due to standards-conformance issues.
+ AC_DEFUN([gl_USE_SYSTEM_EXTENSIONS],
+-  [AC_REQUIRE([AC_USE_SYSTEM_EXTENSIONS])])
++[
++   AC_REQUIRE([AC_GNU_SOURCE])
++
++   AC_REQUIRE([AC_USE_SYSTEM_EXTENSIONS])
++])
+diff -ru gettext-0.16.1/gettext-tools/gnulib-m4/fnmatch.m4 gettext.patched/gettext-tools/gnulib-m4/fnmatch.m4
+--- gettext-0.16.1/gettext-tools/gnulib-m4/fnmatch.m4	2006-11-27 09:14:54.000000000 -0800
++++ gettext.patched/gettext-tools/gnulib-m4/fnmatch.m4	2011-03-16 23:52:06.477463671 -0700
+@@ -91,7 +91,7 @@
+ AC_DEFUN([gl_FUNC_FNMATCH_GNU],
+ [
+   dnl Persuade glibc <fnmatch.h> to declare FNM_CASEFOLD etc.
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+ 
+   FNMATCH_H=
+   _AC_FUNC_FNMATCH_IF([GNU], [ac_cv_func_fnmatch_gnu],
+diff -ru gettext-0.16.1/gettext-tools/gnulib-m4/getdelim.m4 gettext.patched/gettext-tools/gnulib-m4/getdelim.m4
+--- gettext-0.16.1/gettext-tools/gnulib-m4/getdelim.m4	2006-11-27 09:14:54.000000000 -0800
++++ gettext.patched/gettext-tools/gnulib-m4/getdelim.m4	2011-03-16 23:52:22.871674845 -0700
+@@ -12,7 +12,7 @@
+ [
+ 
+   dnl Persuade glibc <stdio.h> to declare getdelim().
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+ 
+   AC_REPLACE_FUNCS(getdelim)
+   AC_CHECK_DECLS_ONCE(getdelim)
+diff -ru gettext-0.16.1/gettext-tools/gnulib-m4/getline.m4 gettext.patched/gettext-tools/gnulib-m4/getline.m4
+--- gettext-0.16.1/gettext-tools/gnulib-m4/getline.m4	2006-11-27 09:14:54.000000000 -0800
++++ gettext.patched/gettext-tools/gnulib-m4/getline.m4	2011-03-16 23:51:49.829971108 -0700
+@@ -16,7 +16,7 @@
+ AC_DEFUN([gl_FUNC_GETLINE],
+ [
+   dnl Persuade glibc <stdio.h> to declare getline().
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+ 
+   AC_CHECK_DECLS([getline])
+ 
+diff -ru gettext-0.16.1/gettext-tools/gnulib-m4/gnulib-comp.m4 gettext.patched/gettext-tools/gnulib-m4/gnulib-comp.m4
+--- gettext-0.16.1/gettext-tools/gnulib-m4/gnulib-comp.m4	2006-11-27 09:33:36.000000000 -0800
++++ gettext.patched/gettext-tools/gnulib-m4/gnulib-comp.m4	2011-03-16 23:52:18.970450488 -0700
+@@ -25,7 +25,7 @@
+   m4_pattern_allow([^gl_LIBOBJS$])dnl a variable
+   m4_pattern_allow([^gl_LTLIBOBJS$])dnl a variable
+   AC_REQUIRE([AC_PROG_RANLIB])
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+   AC_REQUIRE([gl_USE_SYSTEM_EXTENSIONS])
+   AC_REQUIRE([gl_LOCK_EARLY])
+ ])
+diff -ru gettext-0.16.1/gettext-tools/gnulib-m4/mbchar.m4 gettext.patched/gettext-tools/gnulib-m4/mbchar.m4
+--- gettext-0.16.1/gettext-tools/gnulib-m4/mbchar.m4	2006-11-27 09:14:55.000000000 -0800
++++ gettext.patched/gettext-tools/gnulib-m4/mbchar.m4	2011-03-16 23:51:40.844410216 -0700
+@@ -9,7 +9,7 @@
+ 
+ AC_DEFUN([gl_MBCHAR],
+ [
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+   dnl The following line is that so the user can test HAVE_WCHAR_H
+   dnl before #include "mbchar.h".
+   AC_CHECK_HEADERS_ONCE([wchar.h])
+diff -ru gettext-0.16.1/gettext-tools/gnulib-m4/stpcpy.m4 gettext.patched/gettext-tools/gnulib-m4/stpcpy.m4
+--- gettext-0.16.1/gettext-tools/gnulib-m4/stpcpy.m4	2006-11-27 09:14:55.000000000 -0800
++++ gettext.patched/gettext-tools/gnulib-m4/stpcpy.m4	2011-03-16 23:52:14.691396045 -0700
+@@ -7,7 +7,7 @@
+ AC_DEFUN([gl_FUNC_STPCPY],
+ [
+   dnl Persuade glibc <string.h> to declare stpcpy().
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+ 
+   AC_REPLACE_FUNCS(stpcpy)
+   if test $ac_cv_func_stpcpy = no; then
+diff -ru gettext-0.16.1/gettext-tools/gnulib-m4/stpncpy.m4 gettext.patched/gettext-tools/gnulib-m4/stpncpy.m4
+--- gettext-0.16.1/gettext-tools/gnulib-m4/stpncpy.m4	2006-11-27 09:14:55.000000000 -0800
++++ gettext.patched/gettext-tools/gnulib-m4/stpncpy.m4	2011-03-16 23:52:10.356641459 -0700
+@@ -7,7 +7,7 @@
+ AC_DEFUN([gl_FUNC_STPNCPY],
+ [
+   dnl Persuade glibc <string.h> to declare stpncpy().
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+ 
+   dnl Both glibc and AIX (4.3.3, 5.1) have an stpncpy() function
+   dnl declared in <string.h>. Its side effects are the same as those
+diff -ru gettext-0.16.1/gettext-tools/gnulib-m4/wcwidth.m4 gettext.patched/gettext-tools/gnulib-m4/wcwidth.m4
+--- gettext-0.16.1/gettext-tools/gnulib-m4/wcwidth.m4	2006-11-27 09:14:55.000000000 -0800
++++ gettext.patched/gettext-tools/gnulib-m4/wcwidth.m4	2011-03-16 23:51:08.260324221 -0700
+@@ -7,7 +7,7 @@
+ AC_DEFUN([gl_FUNC_WCWIDTH],
+ [
+   dnl Persuade glibc <wchar.h> to declare wcwidth().
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+ 
+   AC_REQUIRE([AC_C_INLINE])
+   AC_REQUIRE([gt_TYPE_WCHAR_T])
+diff -ru gettext-0.16.1/gettext-tools/libgettextpo/gnulib-m4/gnulib-comp.m4 gettext.patched/gettext-tools/libgettextpo/gnulib-m4/gnulib-comp.m4
+--- gettext-0.16.1/gettext-tools/libgettextpo/gnulib-m4/gnulib-comp.m4	2006-11-27 09:33:45.000000000 -0800
++++ gettext.patched/gettext-tools/libgettextpo/gnulib-m4/gnulib-comp.m4	2011-03-16 23:51:02.036061317 -0700
+@@ -25,7 +25,7 @@
+   m4_pattern_allow([^gl_LIBOBJS$])dnl a variable
+   m4_pattern_allow([^gl_LTLIBOBJS$])dnl a variable
+   AC_REQUIRE([AC_PROG_RANLIB])
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+   AC_REQUIRE([gl_USE_SYSTEM_EXTENSIONS])
+   AC_REQUIRE([gl_LOCK_EARLY])
+ ])
+diff -ru gettext-0.16.1/gettext-tools/m4/regex.m4 gettext.patched/gettext-tools/m4/regex.m4
+--- gettext-0.16.1/gettext-tools/m4/regex.m4	2006-11-27 09:02:05.000000000 -0800
++++ gettext.patched/gettext-tools/m4/regex.m4	2011-03-16 23:50:53.533477195 -0700
+@@ -116,7 +116,7 @@
+   dnl to get them.
+ 
+   dnl Persuade glibc <string.h> to declare mempcpy().
+-  AC_REQUIRE([AC_GNU_SOURCE])
++  dnl AC_REQUIRE([AC_GNU_SOURCE])
+ 
+   AC_REQUIRE([AC_C_RESTRICT])
+   AC_REQUIRE([AC_FUNC_ALLOCA])
diff --git a/meta/recipes-core/gettext/gettext-0.14.1/fixchicken.patch b/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.14.1/fixchicken.patch
rename to meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
diff --git a/meta/recipes-core/gettext/gettext-0.14.1/getline.m4.patch b/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.14.1/getline.m4.patch
rename to meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
diff --git a/meta/recipes-core/gettext/gettext-0.14.1/gettext-autoconf-lib-link-no-L.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
similarity index 88%
rename from meta/recipes-core/gettext/gettext-0.14.1/gettext-autoconf-lib-link-no-L.patch
rename to meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
index 2fe62c0..e8bb2f6 100644
--- a/meta/recipes-core/gettext/gettext-0.14.1/gettext-autoconf-lib-link-no-L.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
@@ -1,3 +1,7 @@
+# Pulled from OpenEmbedded
+# 
+# Commented by: Saul Wold <saul.wold@intel.com>
+
 --- gettext-0.17/autoconf-lib-link/m4/lib-link.m4~	2009-04-17 15:12:30.000000000 -0700
 +++ gettext-0.17/autoconf-lib-link/m4/lib-link.m4	2009-04-17 15:37:39.000000000 -0700
 @@ -267,6 +267,9 @@
diff --git a/meta/recipes-core/gettext/gettext-0.14.1/gettext-error_print_progname.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.14.1/gettext-error_print_progname.patch
rename to meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
new file mode 100644
index 0000000..62420b7
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
@@ -0,0 +1,17 @@
+# Pulled from OpenEmbedded
+# 
+# Commented by: Saul Wold <saul.wold@intel.com>
+
+Index: gettext-0.16.1/gettext-runtime/intl/Makefile.in
+===================================================================
+--- gettext-0.16.1.orig/gettext-runtime/intl/Makefile.in	2006-11-27 09:02:00.000000000 -0800
++++ gettext-0.16.1/gettext-runtime/intl/Makefile.in	2011-03-16 16:04:49.175419930 -0700
+@@ -35,7 +35,7 @@
+ #    'make' does the wrong thing if GNU gettext was configured with
+ #    "./configure --srcdir=`pwd`", namely it gets confused by the .lo and .la
+ #    files it finds in srcdir = ../../gettext-runtime/intl.
+-VPATH = $(srcdir)
++#VPATH = $(srcdir)
+ 
+ prefix = @prefix@
+ exec_prefix = @exec_prefix@
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch b/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
new file mode 100644
index 0000000..ef57dc2
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
@@ -0,0 +1,48 @@
+This patch hardcodes in version 0.17 for the GETTEXT_MACRO_VERSION,
+the version check is only part of 0.17 and will not affect any 0.16.1
+operations
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: gettext-0.16.1/gettext-runtime/m4/po.m4
+===================================================================
+--- gettext-0.16.1.orig/gettext-runtime/m4/po.m4	2011-03-17 02:24:28.953520231 -0700
++++ gettext-0.16.1/gettext-runtime/m4/po.m4	2011-03-17 02:28:25.455396862 -0700
+@@ -27,6 +27,9 @@
+   AC_REQUIRE([AM_PROG_MKDIR_P])dnl defined by automake
+   AC_REQUIRE([AM_NLS])dnl
+ 
++  dnl Hardcode the MACRO_VERSION to 0.17 for gnutls
++  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
++
+   dnl Perform the following tests also if --disable-nls has been given,
+   dnl because they are needed for "make dist" to work.
+ 
+Index: gettext-0.16.1/gettext-runtime/po/Makefile.in.in
+===================================================================
+--- gettext-0.16.1.orig/gettext-runtime/po/Makefile.in.in	2011-03-17 02:24:28.953520231 -0700
++++ gettext-0.16.1/gettext-runtime/po/Makefile.in.in	2011-03-17 02:28:07.574395144 -0700
+@@ -10,6 +10,9 @@
+ #
+ # Origin: gettext-0.16
+ 
++# Hardcode this value for gnutls building against gplv2 code
++GETTEXT_MACRO_VERSION = 0.17
++
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+ PACKAGE_BUGREPORT = @PACKAGE_BUGREPORT@
+Index: gettext-0.16.1/gettext-tools/po/Makefile.in.in
+===================================================================
+--- gettext-0.16.1.orig/gettext-tools/po/Makefile.in.in	2011-03-17 02:24:28.953520231 -0700
++++ gettext-0.16.1/gettext-tools/po/Makefile.in.in	2011-03-17 02:28:07.574395144 -0700
+@@ -10,6 +10,9 @@
+ #
+ # Origin: gettext-0.16
+ 
++# Hardcode this value for gnutls building against gplv2 code
++GETTEXT_MACRO_VERSION = 0.17
++
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+ PACKAGE_BUGREPORT = @PACKAGE_BUGREPORT@
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch b/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
new file mode 100644
index 0000000..2b805c9
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
@@ -0,0 +1,717 @@
+# Pulled from OpenEmbedded
+# 
+# Commented by: Saul Wold <saul.wold@intel.com>
+
+Index: gettext-0.16.1/autoconf-lib-link/m4/lib-link.m4
+===================================================================
+--- gettext-0.16.1.orig/autoconf-lib-link/m4/lib-link.m4	2006-11-27 09:01:58.000000000 -0800
++++ gettext-0.16.1/autoconf-lib-link/m4/lib-link.m4	2011-03-17 00:36:08.710836720 -0700
+@@ -6,12 +6,14 @@
+ 
+ dnl From Bruno Haible.
+ 
+-AC_PREREQ(2.50)
++AC_PREREQ(2.54)
+ 
+ dnl AC_LIB_LINKFLAGS(name [, dependencies]) searches for libname and
+ dnl the libraries corresponding to explicit and implicit dependencies.
+ dnl Sets and AC_SUBSTs the LIB${NAME} and LTLIB${NAME} variables and
+ dnl augments the CPPFLAGS variable.
++dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if libname
++dnl was found in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
+ AC_DEFUN([AC_LIB_LINKFLAGS],
+ [
+   AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
+@@ -24,13 +26,16 @@
+     ac_cv_lib[]Name[]_libs="$LIB[]NAME"
+     ac_cv_lib[]Name[]_ltlibs="$LTLIB[]NAME"
+     ac_cv_lib[]Name[]_cppflags="$INC[]NAME"
++    ac_cv_lib[]Name[]_prefix="$LIB[]NAME[]_PREFIX"
+   ])
+   LIB[]NAME="$ac_cv_lib[]Name[]_libs"
+   LTLIB[]NAME="$ac_cv_lib[]Name[]_ltlibs"
+   INC[]NAME="$ac_cv_lib[]Name[]_cppflags"
++  LIB[]NAME[]_PREFIX="$ac_cv_lib[]Name[]_prefix"
+   AC_LIB_APPENDTOVAR([CPPFLAGS], [$INC]NAME)
+   AC_SUBST([LIB]NAME)
+   AC_SUBST([LTLIB]NAME)
++  AC_SUBST([LIB]NAME[_PREFIX])
+   dnl Also set HAVE_LIB[]NAME so that AC_LIB_HAVE_LINKFLAGS can reuse the
+   dnl results of this search when this library appears as a dependency.
+   HAVE_LIB[]NAME=yes
+@@ -46,6 +51,8 @@
+ dnl LTLIB${NAME} variables and augments the CPPFLAGS variable, and
+ dnl #defines HAVE_LIB${NAME} to 1. Otherwise, it sets and AC_SUBSTs
+ dnl HAVE_LIB${NAME}=no and LIB${NAME} and LTLIB${NAME} to empty.
++dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if libname
++dnl was found in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
+ AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
+ [
+   AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
+@@ -82,17 +89,24 @@
+     CPPFLAGS="$ac_save_CPPFLAGS"
+     LIB[]NAME=
+     LTLIB[]NAME=
++    LIB[]NAME[]_PREFIX=
++
+   fi
+   AC_SUBST([HAVE_LIB]NAME)
+   AC_SUBST([LIB]NAME)
+   AC_SUBST([LTLIB]NAME)
++  AC_SUBST([LIB]NAME[_PREFIX])
+   undefine([Name])
+   undefine([NAME])
+ ])
+ 
+ dnl Determine the platform dependent parameters needed to use rpath:
+-dnl libext, shlibext, hardcode_libdir_flag_spec, hardcode_libdir_separator,
+-dnl hardcode_direct, hardcode_minus_L.
++dnl   acl_libext,
++dnl   acl_shlibext,
++dnl   acl_hardcode_libdir_flag_spec,
++dnl   acl_hardcode_libdir_separator,
++dnl   acl_hardcode_direct,
++dnl   acl_hardcode_minus_L.
+ AC_DEFUN([AC_LIB_RPATH],
+ [
+   dnl Tell automake >= 1.10 to complain if config.rpath is missing.
+@@ -109,12 +123,14 @@
+     acl_cv_rpath=done
+   ])
+   wl="$acl_cv_wl"
+-  libext="$acl_cv_libext"
+-  shlibext="$acl_cv_shlibext"
+-  hardcode_libdir_flag_spec="$acl_cv_hardcode_libdir_flag_spec"
+-  hardcode_libdir_separator="$acl_cv_hardcode_libdir_separator"
+-  hardcode_direct="$acl_cv_hardcode_direct"
+-  hardcode_minus_L="$acl_cv_hardcode_minus_L"
++  acl_libext="$acl_cv_libext"
++  acl_shlibext="$acl_cv_shlibext"
++  acl_libname_spec="$acl_cv_libname_spec"
++  acl_library_names_spec="$acl_cv_library_names_spec"
++  acl_hardcode_libdir_flag_spec="$acl_cv_hardcode_libdir_flag_spec"
++  acl_hardcode_libdir_separator="$acl_cv_hardcode_libdir_separator"
++  acl_hardcode_direct="$acl_cv_hardcode_direct"
++  acl_hardcode_minus_L="$acl_cv_hardcode_minus_L"
+   dnl Determine whether the user wants rpath handling at all.
+   AC_ARG_ENABLE(rpath,
+     [  --disable-rpath         do not hardcode runtime library paths],
+@@ -124,20 +140,24 @@
+ dnl AC_LIB_LINKFLAGS_BODY(name [, dependencies]) searches for libname and
+ dnl the libraries corresponding to explicit and implicit dependencies.
+ dnl Sets the LIB${NAME}, LTLIB${NAME} and INC${NAME} variables.
++dnl Also, sets the LIB${NAME}_PREFIX variable to nonempty if libname was found
++dnl in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
+ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
+ [
+   AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
+   define([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
+                                [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
++  dnl Autoconf >= 2.61 supports dots in --with options.
++  define([N_A_M_E],[m4_if(m4_version_compare(m4_defn([m4_PACKAGE_VERSION]),[2.61]),[-1],[translit([$1],[.],[_])],[$1])])
+   dnl By default, look in $includedir and $libdir.
+   use_additional=yes
+   AC_LIB_WITH_FINAL_PREFIX([
+     eval additional_includedir=\"$includedir\"
+     eval additional_libdir=\"$libdir\"
+   ])
+-  AC_LIB_ARG_WITH([lib$1-prefix],
+-[  --with-lib$1-prefix[=DIR]  search for lib$1 in DIR/include and DIR/lib
+-  --without-lib$1-prefix     don't search for lib$1 in includedir and libdir],
++  AC_LIB_ARG_WITH([lib]N_A_M_E[-prefix],
++[  --with-lib]N_A_M_E[-prefix[=DIR]  search for lib$1 in DIR/include and DIR/lib
++  --without-lib]N_A_M_E[-prefix     don't search for lib$1 in includedir and libdir],
+ [
+     if test "X$withval" = "Xno"; then
+       use_additional=no
+@@ -158,6 +178,7 @@
+   LIB[]NAME=
+   LTLIB[]NAME=
+   INC[]NAME=
++  LIB[]NAME[]_PREFIX=
+   rpathdirs=
+   ltrpathdirs=
+   names_already_handled=
+@@ -197,27 +218,53 @@
+           found_la=
+           found_so=
+           found_a=
++          eval libname=\"$acl_libname_spec\"    # typically: libname=lib$name
++          if test -n "$acl_shlibext"; then
++            shrext=".$acl_shlibext"             # typically: shrext=.so
++          else
++            shrext=
++          fi
+           if test $use_additional = yes; then
+-            if test -n "$shlibext" \
+-               && { test -f "$additional_libdir/lib$name.$shlibext" \
+-                    || { test "$shlibext" = dll \
+-                         && test -f "$additional_libdir/lib$name.dll.a"; }; }; then
+-              found_dir="$additional_libdir"
+-              if test -f "$additional_libdir/lib$name.$shlibext"; then
+-                found_so="$additional_libdir/lib$name.$shlibext"
++            dir="$additional_libdir"
++            dnl The same code as in the loop below:
++            dnl First look for a shared library.
++            if test -n "$acl_shlibext"; then
++              if test -f "$dir/$libname$shrext"; then
++                found_dir="$dir"
++                found_so="$dir/$libname$shrext"
+               else
+-                found_so="$additional_libdir/lib$name.dll.a"
++                if test "$acl_library_names_spec" = '$libname$shrext$versuffix'; then
++                  ver=`(cd "$dir" && \
++                        for f in "$libname$shrext".*; do echo "$f"; done \
++                        | sed -e "s,^$libname$shrext\\\\.,," \
++                        | sort -t '.' -n -r -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 \
++                        | sed 1q ) 2>/dev/null`
++                  if test -n "$ver" && test -f "$dir/$libname$shrext.$ver"; then
++                    found_dir="$dir"
++                    found_so="$dir/$libname$shrext.$ver"
++                  fi
++                else
++                  eval library_names=\"$acl_library_names_spec\"
++                  for f in $library_names; do
++                    if test -f "$dir/$f"; then
++                      found_dir="$dir"
++                      found_so="$dir/$f"
++                      break
++                    fi
++                  done
++                fi
+               fi
+-              if test -f "$additional_libdir/lib$name.la"; then
+-                found_la="$additional_libdir/lib$name.la"
++            fi
++            dnl Then look for a static library.
++            if test "X$found_dir" = "X"; then
++              if test -f "$dir/$libname.$acl_libext"; then
++                found_dir="$dir"
++                found_a="$dir/$libname.$acl_libext"
+               fi
+-            else
+-              if test -f "$additional_libdir/lib$name.$libext"; then
+-                found_dir="$additional_libdir"
+-                found_a="$additional_libdir/lib$name.$libext"
+-                if test -f "$additional_libdir/lib$name.la"; then
+-                  found_la="$additional_libdir/lib$name.la"
+-                fi
++            fi
++            if test "X$found_dir" != "X"; then
++              if test -f "$dir/$libname.la"; then
++                found_la="$dir/$libname.la"
+               fi
+             fi
+           fi
+@@ -227,26 +274,44 @@
+               case "$x" in
+                 -L*)
+                   dir=`echo "X$x" | sed -e 's/^X-L//'`
+-                  if test -n "$shlibext" \
+-                     && { test -f "$dir/lib$name.$shlibext" \
+-                          || { test "$shlibext" = dll \
+-                               && test -f "$dir/lib$name.dll.a"; }; }; then
+-                    found_dir="$dir"
+-                    if test -f "$dir/lib$name.$shlibext"; then
+-                      found_so="$dir/lib$name.$shlibext"
++                  dnl First look for a shared library.
++                  if test -n "$acl_shlibext"; then
++                    if test -f "$dir/$libname$shrext"; then
++                      found_dir="$dir"
++                      found_so="$dir/$libname$shrext"
+                     else
+-                      found_so="$dir/lib$name.dll.a"
+-                    fi
+-                    if test -f "$dir/lib$name.la"; then
+-                      found_la="$dir/lib$name.la"
++                      if test "$acl_library_names_spec" = '$libname$shrext$versuffix'; then
++                        ver=`(cd "$dir" && \
++                              for f in "$libname$shrext".*; do echo "$f"; done \
++                              | sed -e "s,^$libname$shrext\\\\.,," \
++                              | sort -t '.' -n -r -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 \
++                              | sed 1q ) 2>/dev/null`
++                        if test -n "$ver" && test -f "$dir/$libname$shrext.$ver"; then
++                          found_dir="$dir"
++                          found_so="$dir/$libname$shrext.$ver"
++                        fi
++                      else
++                        eval library_names=\"$acl_library_names_spec\"
++                        for f in $library_names; do
++                          if test -f "$dir/$f"; then
++                            found_dir="$dir"
++                            found_so="$dir/$f"
++                            break
++                          fi
++                        done
++                      fi
+                     fi
+-                  else
+-                    if test -f "$dir/lib$name.$libext"; then
++                  fi
++                  dnl Then look for a static library.
++                  if test "X$found_dir" = "X"; then
++                    if test -f "$dir/$libname.$acl_libext"; then
+                       found_dir="$dir"
+-                      found_a="$dir/lib$name.$libext"
+-                      if test -f "$dir/lib$name.la"; then
+-                        found_la="$dir/lib$name.la"
+-                      fi
++                      found_a="$dir/$libname.$acl_libext"
++                    fi
++                  fi
++                  if test "X$found_dir" != "X"; then
++                    if test -f "$dir/$libname.la"; then
++                      found_la="$dir/$libname.la"
+                     fi
+                   fi
+                   ;;
+@@ -282,12 +347,12 @@
+                   ltrpathdirs="$ltrpathdirs $found_dir"
+                 fi
+                 dnl The hardcoding into $LIBNAME is system dependent.
+-                if test "$hardcode_direct" = yes; then
++                if test "$acl_hardcode_direct" = yes; then
+                   dnl Using DIR/libNAME.so during linking hardcodes DIR into the
+                   dnl resulting binary.
+                   LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
+                 else
+-                  if test -n "$hardcode_libdir_flag_spec" && test "$hardcode_minus_L" = no; then
++                  if test -n "$acl_hardcode_libdir_flag_spec" && test "$acl_hardcode_minus_L" = no; then
+                     dnl Use an explicit option to hardcode DIR into the resulting
+                     dnl binary.
+                     LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
+@@ -318,13 +383,13 @@
+                     if test -z "$haveit"; then
+                       LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-L$found_dir"
+                     fi
+-                    if test "$hardcode_minus_L" != no; then
++                    if test "$acl_hardcode_minus_L" != no; then
+                       dnl FIXME: Not sure whether we should use
+                       dnl "-L$found_dir -l$name" or "-L$found_dir $found_so"
+                       dnl here.
+                       LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
+                     else
+-                      dnl We cannot use $hardcode_runpath_var and LD_RUN_PATH
++                      dnl We cannot use $acl_hardcode_runpath_var and LD_RUN_PATH
+                       dnl here, because this doesn't fit in flags passed to the
+                       dnl compiler. So give up. No hardcoding. This affects only
+                       dnl very old systems.
+@@ -512,18 +577,18 @@
+     done
+   done
+   if test "X$rpathdirs" != "X"; then
+-    if test -n "$hardcode_libdir_separator"; then
++    if test -n "$acl_hardcode_libdir_separator"; then
+       dnl Weird platform: only the last -rpath option counts, the user must
+       dnl pass all path elements in one option. We can arrange that for a
+       dnl single library, but not when more than one $LIBNAMEs are used.
+       alldirs=
+       for found_dir in $rpathdirs; do
+-        alldirs="${alldirs}${alldirs:+$hardcode_libdir_separator}$found_dir"
++        alldirs="${alldirs}${alldirs:+$acl_hardcode_libdir_separator}$found_dir"
+       done
+-      dnl Note: hardcode_libdir_flag_spec uses $libdir and $wl.
++      dnl Note: acl_hardcode_libdir_flag_spec uses $libdir and $wl.
+       acl_save_libdir="$libdir"
+       libdir="$alldirs"
+-      eval flag=\"$hardcode_libdir_flag_spec\"
++      eval flag=\"$acl_hardcode_libdir_flag_spec\"
+       libdir="$acl_save_libdir"
+       LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$flag"
+     else
+@@ -531,7 +596,7 @@
+       for found_dir in $rpathdirs; do
+         acl_save_libdir="$libdir"
+         libdir="$found_dir"
+-        eval flag=\"$hardcode_libdir_flag_spec\"
++        eval flag=\"$acl_hardcode_libdir_flag_spec\"
+         libdir="$acl_save_libdir"
+         LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$flag"
+       done
+@@ -642,3 +707,79 @@
+   fi
+   AC_SUBST([$1])
+ ])
++
++dnl For those cases where a variable contains several -L and -l options
++dnl referring to unknown libraries and directories, this macro determines the
++dnl necessary additional linker options for the runtime path.
++dnl AC_LIB_LINKFLAGS_FROM_LIBS([LDADDVAR], [LIBSVALUE], [USE-LIBTOOL])
++dnl sets LDADDVAR to linker options needed together with LIBSVALUE.
++dnl If USE-LIBTOOL evaluates to non-empty, linking with libtool is assumed,
++dnl otherwise linking without libtool is assumed.
++AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],
++[
++  AC_REQUIRE([AC_LIB_RPATH])
++  AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
++  $1=
++  if test "$enable_rpath" != no; then
++    if test -n "$acl_hardcode_libdir_flag_spec" && test "$acl_hardcode_minus_L" = no; then
++      dnl Use an explicit option to hardcode directories into the resulting
++      dnl binary.
++      rpathdirs=
++      next=
++      for opt in $2; do
++        if test -n "$next"; then
++          dir="$next"
++          dnl No need to hardcode the standard /usr/lib.
++          if test "X$dir" != "X/usr/$acl_libdirstem"; then
++            rpathdirs="$rpathdirs $dir"
++          fi
++          next=
++        else
++          case $opt in
++            -L) next=yes ;;
++            -L*) dir=`echo "X$opt" | sed -e 's,^X-L,,'`
++                 dnl No need to hardcode the standard /usr/lib.
++                 if test "X$dir" != "X/usr/$acl_libdirstem"; then
++                   rpathdirs="$rpathdirs $dir"
++                 fi
++                 next= ;;
++            *) next= ;;
++          esac
++        fi
++      done
++      if test "X$rpathdirs" != "X"; then
++        if test -n ""$3""; then
++          dnl libtool is used for linking. Use -R options.
++          for dir in $rpathdirs; do
++            $1="${$1}${$1:+ }-R$dir"
++          done
++        else
++          dnl The linker is used for linking directly.
++          if test -n "$acl_hardcode_libdir_separator"; then
++            dnl Weird platform: only the last -rpath option counts, the user
++            dnl must pass all path elements in one option.
++            alldirs=
++            for dir in $rpathdirs; do
++              alldirs="${alldirs}${alldirs:+$acl_hardcode_libdir_separator}$dir"
++            done
++            acl_save_libdir="$libdir"
++            libdir="$alldirs"
++            eval flag=\"$acl_hardcode_libdir_flag_spec\"
++            libdir="$acl_save_libdir"
++            $1="$flag"
++          else
++            dnl The -rpath options are cumulative.
++            for dir in $rpathdirs; do
++              acl_save_libdir="$libdir"
++              libdir="$dir"
++              eval flag=\"$acl_hardcode_libdir_flag_spec\"
++              libdir="$acl_save_libdir"
++              $1="${$1}${$1:+ }$flag"
++            done
++          fi
++        fi
++      fi
++    fi
++  fi
++  AC_SUBST([$1])
++])
+Index: gettext-0.16.1/autoconf-lib-link/config.rpath
+===================================================================
+--- gettext-0.16.1.orig/autoconf-lib-link/config.rpath	2006-11-27 09:01:58.000000000 -0800
++++ gettext-0.16.1/autoconf-lib-link/config.rpath	2011-03-17 00:33:23.336539490 -0700
+@@ -2,7 +2,7 @@
+ # Output a system dependent set of variables, describing how to set the
+ # run time search path of shared libraries in an executable.
+ #
+-#   Copyright 1996-2006 Free Software Foundation, Inc.
++#   Copyright 1996-2007 Free Software Foundation, Inc.
+ #   Taken from GNU libtool, 2001
+ #   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
+ #
+@@ -47,6 +47,18 @@
+ done
+ cc_basename=`echo "$cc_temp" | sed -e 's%^.*/%%'`
+ 
++# Code taken from libtool.m4's _LT_CC_BASENAME.
++
++for cc_temp in $CC""; do
++  case $cc_temp in
++    compile | *[\\/]compile | ccache | *[\\/]ccache ) ;;
++    distcc | *[\\/]distcc | purify | *[\\/]purify ) ;;
++    \-*) ;;
++    *) break;;
++  esac
++done
++cc_basename=`echo "$cc_temp" | sed -e 's%^.*/%%'`
++
+ # Code taken from libtool.m4's AC_LIBTOOL_PROG_COMPILER_PIC.
+ 
+ wl=
+@@ -64,7 +76,14 @@
+           ;;
+       esac
+       ;;
+-    mingw* | pw32* | os2*)
++    darwin*)
++      case $cc_basename in
++        xlc*)
++          wl='-Wl,'
++          ;;
++      esac
++      ;;
++    mingw* | cygwin* | pw32* | os2*)
+       ;;
+     hpux9* | hpux10* | hpux11*)
+       wl='-Wl,'
+@@ -74,7 +93,7 @@
+       ;;
+     newsos6)
+       ;;
+-    linux*)
++    linux* | k*bsd*-gnu)
+       case $cc_basename in
+         icc* | ecc*)
+           wl='-Wl,'
+@@ -100,7 +119,7 @@
+     osf3* | osf4* | osf5*)
+       wl='-Wl,'
+       ;;
+-    sco3.2v5*)
++    rdos*)
+       ;;
+     solaris*)
+       wl='-Wl,'
+@@ -108,11 +127,14 @@
+     sunos4*)
+       wl='-Qoption ld '
+       ;;
+-    sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
++    sysv4 | sysv4.2uw2* | sysv4.3*)
+       wl='-Wl,'
+       ;;
+     sysv4*MP*)
+       ;;
++    sysv5* | unixware* | sco3.2v5* | sco5v6* | OpenUNIX*)
++      wl='-Wl,'
++      ;;
+     unicos*)
+       wl='-Wl,'
+       ;;
+@@ -141,6 +163,10 @@
+     # we just hope/assume this is gcc and not c89 (= MSVC++)
+     with_gnu_ld=yes
+     ;;
++  interix*)
++    # we just hope/assume this is gcc and not c89 (= MSVC++)
++    with_gnu_ld=yes
++    ;;
+   openbsd*)
+     with_gnu_ld=no
+     ;;
+@@ -189,11 +215,11 @@
+         ld_shlibs=no
+       fi
+       ;;
+-    interix3*)
++    interix[3-9]*)
+       hardcode_direct=no
+       hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
+       ;;
+-    linux*)
++    gnu* | linux* | k*bsd*-gnu)
+       if $LD --help 2>&1 | grep ': supported targets:.* elf' > /dev/null; then
+         :
+       else
+@@ -280,7 +306,7 @@
+             strings "$collect2name" | grep resolve_lib_name >/dev/null
+           then
+             # We have reworked collect2
+-            hardcode_direct=yes
++            :
+           else
+             # We have old collect2
+             hardcode_direct=unsupported
+@@ -359,7 +385,7 @@
+       hardcode_direct=yes
+       hardcode_minus_L=yes
+       ;;
+-    freebsd* | kfreebsd*-gnu | dragonfly*)
++    freebsd* | dragonfly*)
+       hardcode_libdir_flag_spec='-R$libdir'
+       hardcode_direct=yes
+       ;;
+@@ -412,18 +438,22 @@
+       hardcode_libdir_separator=:
+       ;;
+     openbsd*)
+-      hardcode_direct=yes
+-      if test -z "`echo __ELF__ | $CC -E - | grep __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
+-        hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
++      if test -f /usr/libexec/ld.so; then
++        hardcode_direct=yes
++        if test -z "`echo __ELF__ | $CC -E - | grep __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
++          hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
++        else
++          case "$host_os" in
++            openbsd[01].* | openbsd2.[0-7] | openbsd2.[0-7].*)
++              hardcode_libdir_flag_spec='-R$libdir'
++              ;;
++            *)
++              hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
++              ;;
++          esac
++        fi
+       else
+-        case "$host_os" in
+-          openbsd[01].* | openbsd2.[0-7] | openbsd2.[0-7].*)
+-            hardcode_libdir_flag_spec='-R$libdir'
+-            ;;
+-          *)
+-            hardcode_libdir_flag_spec='${wl}-rpath,$libdir'
+-            ;;
+-        esac
++        ld_shlibs=no
+       fi
+       ;;
+     os2*)
+@@ -471,7 +501,7 @@
+         ld_shlibs=yes
+       fi
+       ;;
+-    sysv4*uw2* | sysv5OpenUNIX* | sysv5UnixWare7.[01].[10]* | unixware7*)
++    sysv4*uw2* | sysv5OpenUNIX* | sysv5UnixWare7.[01].[10]* | unixware7* |sco3.2v5.0.[024]*)
+       ;;
+     sysv5* | sco3.2v5* | sco5v6*)
+       hardcode_libdir_flag_spec='`test -z "$SCOABSPATH" && echo ${wl}-R,$libdir`'
+@@ -488,33 +518,51 @@
+ 
+ # Check dynamic linker characteristics
+ # Code taken from libtool.m4's AC_LIBTOOL_SYS_DYNAMIC_LINKER.
++# Unlike libtool.m4, here we don't care about _all_ names of the library, but
++# only about the one the linker finds when passed -lNAME. This is the last
++# element of library_names_spec in libtool.m4, or possibly two of them if the
++# linker has special search rules.
++library_names_spec=      # the last element of library_names_spec in libtool.m4
+ libname_spec='lib$name'
+ case "$host_os" in
+   aix3*)
++    library_names_spec='$libname.a'
+     ;;
+   aix4* | aix5*)
++    library_names_spec='$libname$shrext'
+     ;;
+   amigaos*)
++    library_names_spec='$libname.a'
+     ;;
+   beos*)
++    library_names_spec='$libname$shrext'
+     ;;
+   bsdi[45]*)
++    library_names_spec='$libname$shrext'
+     ;;
+   cygwin* | mingw* | pw32*)
+     shrext=.dll
++    library_names_spec='$libname.dll.a $libname.lib'
+     ;;
+   darwin* | rhapsody*)
+     shrext=.dylib
++    library_names_spec='$libname$shrext'
+     ;;
+   dgux*)
++    library_names_spec='$libname$shrext'
+     ;;
+   freebsd1*)
+     ;;
+-  kfreebsd*-gnu)
+-    ;;
+   freebsd* | dragonfly*)
++    case "$host_os" in
++      freebsd[123]*)
++        library_names_spec='$libname$shrext$versuffix' ;;
++      *)
++        library_names_spec='$libname$shrext' ;;
++    esac
+     ;;
+   gnu*)
++    library_names_spec='$libname$shrext'
+     ;;
+   hpux9* | hpux10* | hpux11*)
+     case $host_cpu in
+@@ -528,10 +576,13 @@
+         shrext=.sl
+         ;;
+     esac
++    library_names_spec='$libname$shrext'
+     ;;
+-  interix3*)
++  interix[3-9]*)
++    library_names_spec='$libname$shrext'
+     ;;
+   irix5* | irix6* | nonstopux*)
++    library_names_spec='$libname$shrext'
+     case "$host_os" in
+       irix5* | nonstopux*)
+         libsuff= shlibsuff=
+@@ -548,33 +599,46 @@
+     ;;
+   linux*oldld* | linux*aout* | linux*coff*)
+     ;;
+-  linux*)
++  linux* | k*bsd*-gnu)
++    library_names_spec='$libname$shrext'
+     ;;
+   knetbsd*-gnu)
++    library_names_spec='$libname$shrext'
+     ;;
+   netbsd*)
++    library_names_spec='$libname$shrext'
+     ;;
+   newsos6)
++    library_names_spec='$libname$shrext'
+     ;;
+   nto-qnx*)
++    library_names_spec='$libname$shrext'
+     ;;
+   openbsd*)
++    library_names_spec='$libname$shrext$versuffix'
+     ;;
+   os2*)
+     libname_spec='$name'
+     shrext=.dll
++    library_names_spec='$libname.a'
+     ;;
+   osf3* | osf4* | osf5*)
++    library_names_spec='$libname$shrext'
+     ;;
+   solaris*)
++    library_names_spec='$libname$shrext'
+     ;;
+   sunos4*)
++    library_names_spec='$libname$shrext$versuffix'
+     ;;
+   sysv4 | sysv4.3*)
++    library_names_spec='$libname$shrext'
+     ;;
+   sysv4*MP*)
++    library_names_spec='$libname$shrext'
+     ;;
+   sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX* | sysv4*uw2*)
++    library_names_spec='$libname$shrext'
+     ;;
+   uts4*)
+     ;;
+@@ -583,6 +647,8 @@
+ sed_quote_subst='s/\(["`$\\]\)/\\\1/g'
+ escaped_wl=`echo "X$wl" | sed -e 's/^X//' -e "$sed_quote_subst"`
+ shlibext=`echo "$shrext" | sed -e 's,^\.,,'`
++escaped_libname_spec=`echo "X$libname_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
++escaped_library_names_spec=`echo "X$library_names_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
+ escaped_hardcode_libdir_flag_spec=`echo "X$hardcode_libdir_flag_spec" | sed -e 's/^X//' -e "$sed_quote_subst"`
+ 
+ LC_ALL=C sed -e 's/^\([a-zA-Z0-9_]*\)=/acl_cv_\1=/' <<EOF
+@@ -596,6 +662,12 @@
+ # Shared library suffix (normally "so").
+ shlibext="$shlibext"
+ 
++# Format of library name prefix.
++libname_spec="$escaped_libname_spec"
++
++# Library names that the linker finds when passed -lNAME.
++library_names_spec="$escaped_library_names_spec"
++
+ # Flag to hardcode \$libdir into a binary during linking.
+ # This must work even if \$libdir does not exist.
+ hardcode_libdir_flag_spec="$escaped_hardcode_libdir_flag_spec"
diff --git a/meta/recipes-core/gettext/gettext_0.14.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
similarity index 74%
rename from meta/recipes-core/gettext/gettext_0.14.1.bb
rename to meta/recipes-core/gettext/gettext_0.16.1.bb
index 90756bc..754b0ad 100644
--- a/meta/recipes-core/gettext/gettext_0.14.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "The GNU internationalization library."
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ea3144f04c41cd2eada5d3f472e6ea5"
 
-PR = "r11"
+PR = "r3"
 DEPENDS = "virtual/libiconv"
 DEPENDS_virtclass-native = ""
 PROVIDES = "virtual/libintl"
@@ -12,24 +12,26 @@ PROVIDES_virtclass-native = ""
 
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://gettext-vpath.patch \
-           file://fixchicken.patch \
            file://linklib_from_0.17.patch \
-           file://getline.m4.patch \
-           file://disable_java.patch"
+	   file://gettext-autoconf-lib-link-no-L.patch \
+           file://disable_java.patch \
+           file://fix_aclocal_version.patch \
+           file://fix_gnu_source_circular.patch \
+           file://hardcode_macro_version.patch \
+          "
 
-#	   file://gettext-autoconf-lib-link-no-L.patch
 
 SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch"
 SRC_URI_append_linux-uclibceabi = " file://gettext-error_print_progname.patch"
 
-SRC_URI[md5sum] = "78f4b862510beb2e5d43223dd610e77d"
-SRC_URI[sha256sum] = "41f20c469c7759acb34cfa7e0b3cac9096d59a58ad800e471f07424a8e7adbb7"
+SRC_URI[md5sum] = "3d9ad24301c6d6b17ec30704a13fe127"
+SRC_URI[sha256sum] = "0bf850d1a079fb5a61f0a47b1a9efd35eb44032255375e1cedb0253bc27b376d"
 
 PARALLEL_MAKE = ""
 
 inherit autotools
 
-EXTRA_OECONF += "--without-lisp --disable-csharp"
+EXTRA_OECONF += "--without-lisp --disable-csharp --disable-openmp"
 acpaths = '-I ${S}/autoconf-lib-link/m4/ \
            -I ${S}/gettext-runtime/m4 \
            -I ${S}/gettext-tools/m4'
-- 
1.7.1.1



