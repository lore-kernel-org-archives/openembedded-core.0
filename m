Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC73E60E23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:50:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4M9nxU0025444 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:49:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UOgMNd1vD18E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:49:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4M9nsVo025440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:49:55 +0100
Message-ID: <1400752187.17834.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 10:49:47 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libgpg-error: Extend pkgconfig support to m4 macros
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
X-List-Received-Date: Thu, 22 May 2014 09:50:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Whilst there is currently .pc file pkgconfig support, it was unused by the
m4 macros. This extends the support so they're used instead of the -config
scripts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch
index 2764012..2a2c1e9 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch
@@ -5,22 +5,22 @@
 
 Upstream-Status: Pending
 
-Index: libgpg-error-1.8/configure.ac
+Index: libgpg-error-1.12/configure.ac
 ===================================================================
---- libgpg-error-1.8.orig/configure.ac	2010-05-06 06:01:08.000000000 -0700
-+++ libgpg-error-1.8/configure.ac	2010-07-21 02:20:20.923261305 -0700
-@@ -140,6 +140,7 @@
- AC_SUBST(GPG_ERROR_CONFIG_CFLAGS)
- AC_SUBST(GPG_ERROR_CONFIG_ISUBDIRAFTER)
+--- libgpg-error-1.12.orig/configure.ac	2014-05-13 21:14:26.846393236 +0000
++++ libgpg-error-1.12/configure.ac	2014-05-13 21:14:26.926393236 +0000
+@@ -217,6 +217,7 @@
+ AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpg-error.asd])
+ AC_CONFIG_FILES([src/versioninfo.rc])
  AC_CONFIG_FILES([src/gpg-error-config], [chmod +x src/gpg-error-config])
 +AC_CONFIG_FILES([src/gpg-error.pc])
  
+ AC_OUTPUT
  
- # Special defines for certain platforms
-Index: libgpg-error-1.8/src/Makefile.am
+Index: libgpg-error-1.12/src/Makefile.am
 ===================================================================
---- libgpg-error-1.8.orig/src/Makefile.am	2010-04-14 02:16:44.000000000 -0700
-+++ libgpg-error-1.8/src/Makefile.am	2010-07-21 02:22:36.655012496 -0700
+--- libgpg-error-1.12.orig/src/Makefile.am	2014-05-13 21:14:26.846393236 +0000
++++ libgpg-error-1.12/src/Makefile.am	2014-05-13 21:14:26.934393236 +0000
 @@ -37,13 +37,15 @@
  bin_SCRIPTS = gpg-error-config
  m4datadir = $(datadir)/aclocal
@@ -38,18 +38,95 @@ Index: libgpg-error-1.8/src/Makefile.am
  
  BUILT_SOURCES = err-sources.h err-codes.h code-to-errno.h code-from-errno.h \
  	err-sources-sym.h err-codes-sym.h errnos-sym.h gpg-error.h \
-Index: libgpg-error-1.8/src/gpg-error.pc.in
+Index: libgpg-error-1.12/src/gpg-error.pc.in
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libgpg-error-1.8/src/gpg-error.pc.in	2010-07-21 02:20:20.923261305 -0700
-@@ -0,0 +1,10 @@
++++ libgpg-error-1.12/src/gpg-error.pc.in	2014-05-13 21:48:20.266382916 +0000
+@@ -0,0 +1,11 @@
 +prefix=@prefix@
 +exec_prefix=@exec_prefix@
 +libdir=@libdir@
 +includedir=@includedir@
++host=@GPG_ERROR_CONFIG_HOST@
 +
 +Name: gpg-error
 +Description: a library that defines common error values for all GnuPG components
 +Version: @VERSION@
 +Libs: -L{libdir} -lgpg-error
 +Cflags: -I${includedir}
+Index: libgpg-error-1.12/src/gpg-error.m4
+===================================================================
+--- libgpg-error-1.12.orig/src/gpg-error.m4	2014-05-13 21:45:02.038383922 +0000
++++ libgpg-error-1.12/src/gpg-error.m4	2014-05-13 21:47:08.362383281 +0000
+@@ -15,58 +15,14 @@
+ dnl
+ AC_DEFUN([AM_PATH_GPG_ERROR],
+ [ AC_REQUIRE([AC_CANONICAL_HOST])
+-  gpg_error_config_prefix=""
+-  dnl --with-libgpg-error-prefix=PFX is the preferred name for this option,
+-  dnl since that is consistent with how our three siblings use the directory/
+-  dnl package name in --with-$dir_name-prefix=PFX.
+-  AC_ARG_WITH(libgpg-error-prefix,
+-              AC_HELP_STRING([--with-libgpg-error-prefix=PFX],
+-                             [prefix where GPG Error is installed (optional)]),
+-              [gpg_error_config_prefix="$withval"])
+ 
+-  dnl Accept --with-gpg-error-prefix and make it work the same as
+-  dnl --with-libgpg-error-prefix above, for backwards compatibility,
+-  dnl but do not document this old, inconsistently-named option.
+-  AC_ARG_WITH(gpg-error-prefix,,
+-              [gpg_error_config_prefix="$withval"])
++  min_gpg_error_version=ifelse([$1], ,0.0,$1)
+ 
+-  if test x$gpg_error_config_prefix != x ; then
+-     if test x${GPG_ERROR_CONFIG+set} != xset ; then
+-        GPG_ERROR_CONFIG=$gpg_error_config_prefix/bin/gpg-error-config
+-     fi
+-  fi
++  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version], [ok=yes], [ok=no])
+ 
+-  AC_PATH_TOOL(GPG_ERROR_CONFIG, gpg-error-config, no)
+-  min_gpg_error_version=ifelse([$1], ,0.0,$1)
+-  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
+-  ok=no
+-  if test "$GPG_ERROR_CONFIG" != "no" \
+-     && test -f "$GPG_ERROR_CONFIG" ; then
+-    req_major=`echo $min_gpg_error_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+-    req_minor=`echo $min_gpg_error_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
+-    gpg_error_config_version=`$GPG_ERROR_CONFIG $gpg_error_config_args --version`
+-    major=`echo $gpg_error_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
+-    minor=`echo $gpg_error_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
+-    if test "$major" -gt "$req_major"; then
+-        ok=yes
+-    else
+-        if test "$major" -eq "$req_major"; then
+-            if test "$minor" -ge "$req_minor"; then
+-               ok=yes
+-            fi
+-        fi
+-    fi
+-  fi
+   if test $ok = yes; then
+-    GPG_ERROR_CFLAGS=`$GPG_ERROR_CONFIG $gpg_error_config_args --cflags`
+-    GPG_ERROR_LIBS=`$GPG_ERROR_CONFIG $gpg_error_config_args --libs`
+-    AC_MSG_RESULT([yes ($gpg_error_config_version)])
+     ifelse([$2], , :, [$2])
+-    gpg_error_config_host=`$GPG_ERROR_CONFIG $gpg_error_config_args --host 2>/dev/null || echo none`
++    gpg_error_config_host=`$PKG_CONFIG --variable=host gpg-error`
+     if test x"$gpg_error_config_host" != xnone ; then
+       if test x"$gpg_error_config_host" != x"$host" ; then
+   AC_MSG_WARN([[
+@@ -80,9 +36,6 @@
+       fi
+     fi
+   else
+-    GPG_ERROR_CFLAGS=""
+-    GPG_ERROR_LIBS=""
+-    AC_MSG_RESULT(no)
+     ifelse([$3], , :, [$3])
+   fi
+   AC_SUBST(GPG_ERROR_CFLAGS)



