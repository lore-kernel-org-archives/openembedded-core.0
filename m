Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 22FEC65EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:55:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4M9t2LQ025625 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:55:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id afm6bprphYuW
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:55:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4M9svLN025621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:54:58 +0100
Message-ID: <1400752490.17834.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 10:54:50 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libksba: Use pkg-config for dependencies
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
X-List-Received-Date: Thu, 22 May 2014 09:55:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Use pkg-config in the m4 macros for the package, ensure we have a host
field in the .pc file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index fe1ec0f..0f136fd 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -6,10 +6,10 @@ They think pkgconfig adds no portability and maintaining them is not worthwhile.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
-Index: Makefile.am
-===============================================================
---- a/Makefile.am
-+++ b/Makefile.am
+Index: libksba-1.3.0/Makefile.am
+===================================================================
+--- libksba-1.3.0.orig/Makefile.am	2014-05-13 21:39:22.390385646 +0000
++++ libksba-1.3.0/Makefile.am	2014-05-13 21:39:22.462385646 +0000
 @@ -21,6 +21,9 @@
  ACLOCAL_AMFLAGS = -I m4 -I gl/m4
  AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
@@ -20,24 +20,23 @@ Index: Makefile.am
  # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
  GITLOG_TO_CHANGELOG=gitlog-to-changelog
  
-Index: configure.ac
-===============================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -399,6 +399,7 @@ m4/Makefile
- gl/Makefile
+Index: libksba-1.3.0/configure.ac
+===================================================================
+--- libksba-1.3.0.orig/configure.ac	2014-05-13 21:39:22.390385646 +0000
++++ libksba-1.3.0/configure.ac	2014-05-13 21:39:22.462385646 +0000
+@@ -400,6 +400,7 @@
  src/Makefile
  src/ksba-config
  src/versioninfo.rc
 +ksba.pc
  tests/Makefile
  doc/Makefile
-
-Index: src/ksba.pc.in
-===============================================================
---- /dev/null
-+++ b/ksba.pc.in
-@@ -0,0 +1,16 @@
+ ])
+Index: libksba-1.3.0/ksba.pc.in
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ libksba-1.3.0/ksba.pc.in	2014-05-13 21:39:22.462385646 +0000
+@@ -0,0 +1,17 @@
 +prefix=@prefix@
 +exec_prefix=@exec_prefix@
 +libdir=@libdir@
@@ -45,6 +44,7 @@ Index: src/ksba.pc.in
 +
 +# API info
 +api_version=@KSBA_CONFIG_API_VERSION@
++host=@KSBA_CONFIG_HOST@
 +
 +Name: ksba
 +Description: Libksba provides an easy API to create and parse X.509 and CMS related objects
@@ -54,6 +54,99 @@ Index: src/ksba.pc.in
 +Libs.private: -L{libdir} -lgpg-error
 +Cflags: -I${includedir}
 +
--- 
-1.7.5.4
-
+Index: libksba-1.3.0/src/ksba.m4
+===================================================================
+--- libksba-1.3.0.orig/src/ksba.m4	2014-05-13 21:39:22.390385646 +0000
++++ libksba-1.3.0/src/ksba.m4	2014-05-13 21:49:03.650382696 +0000
+@@ -22,18 +22,7 @@
+ dnl
+ AC_DEFUN([AM_PATH_KSBA],
+ [AC_REQUIRE([AC_CANONICAL_HOST])
+- AC_ARG_WITH(ksba-prefix,
+-            AC_HELP_STRING([--with-ksba-prefix=PFX],
+-                           [prefix where KSBA is installed (optional)]),
+-     ksba_config_prefix="$withval", ksba_config_prefix="")
+-  if test x$ksba_config_prefix != x ; then
+-     ksba_config_args="$ksba_config_args --prefix=$ksba_config_prefix"
+-     if test x${KSBA_CONFIG+set} != xset ; then
+-        KSBA_CONFIG=$ksba_config_prefix/bin/ksba-config
+-     fi
+-  fi
+ 
+-  AC_PATH_PROG(KSBA_CONFIG, ksba-config, no)
+   tmp=ifelse([$1], ,1:1.0.0,$1)
+   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
+      req_ksba_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
+@@ -43,48 +32,13 @@
+      min_ksba_version="$tmp"
+   fi
+ 
+-  AC_MSG_CHECKING(for KSBA - version >= $min_ksba_version)
+-  ok=no
+-  if test "$KSBA_CONFIG" != "no" ; then
+-    req_major=`echo $min_ksba_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+-    req_minor=`echo $min_ksba_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
+-    req_micro=`echo $min_ksba_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
+-    ksba_config_version=`$KSBA_CONFIG $ksba_config_args --version`
+-    major=`echo $ksba_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
+-    minor=`echo $ksba_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
+-    micro=`echo $ksba_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\3/'`
+-    if test "$major" -gt "$req_major"; then
+-        ok=yes
+-    else
+-        if test "$major" -eq "$req_major"; then
+-            if test "$minor" -gt "$req_minor"; then
+-               ok=yes
+-            else
+-               if test "$minor" -eq "$req_minor"; then
+-                   if test "$micro" -ge "$req_micro"; then
+-                     ok=yes
+-                   fi
+-               fi
+-            fi
+-        fi
+-    fi
+-  fi
+-  if test $ok = yes; then
+-    AC_MSG_RESULT([yes ($ksba_config_version)])
+-  else
+-    AC_MSG_RESULT(no)
+-  fi
++  PKG_CHECK_MODULES(KSBA, [ksba >= $min_ksba_version], [ok=yes], [ok=no])
++
+   if test $ok = yes; then
+      # Even if we have a recent libksba, we should check that the
+      # API is compatible.
+      if test "$req_ksba_api" -gt 0 ; then
+-        tmp=`$KSBA_CONFIG --api-version 2>/dev/null || echo 0`
++        tmp=`$PKG_CONFIG --variable=api_version ksba`
+         if test "$tmp" -gt 0 ; then
+            AC_MSG_CHECKING([KSBA API version])
+            if test "$req_ksba_api" -eq "$tmp" ; then
+@@ -97,10 +51,8 @@
+      fi
+   fi
+   if test $ok = yes; then
+-    KSBA_CFLAGS=`$KSBA_CONFIG $ksba_config_args --cflags`
+-    KSBA_LIBS=`$KSBA_CONFIG $ksba_config_args --libs`
+     ifelse([$2], , :, [$2])
+-    libksba_config_host=`$LIBKSBA_CONFIG $ksba_config_args --host 2>/dev/null || echo none`
++    libksba_config_host=`$PKG_CONFIG --variable=host ksba`
+     if test x"$libksba_config_host" != xnone ; then
+       if test x"$libksba_config_host" != x"$host" ; then
+   AC_MSG_WARN([[
+@@ -114,8 +66,6 @@
+       fi
+     fi
+   else
+-    KSBA_CFLAGS=""
+-    KSBA_LIBS=""
+     ifelse([$3], , :, [$3])
+   fi
+   AC_SUBST(KSBA_CFLAGS)
diff --git a/meta/recipes-support/libksba/libksba_1.3.0.bb b/meta/recipes-support/libksba/libksba_1.3.0.bb
index 7486bef..71404a0 100644
--- a/meta/recipes-support/libksba/libksba_1.3.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.0.bb
@@ -18,3 +18,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "cd86fad9c9d360b2cf80449f8a4a4075"
 SRC_URI[sha256sum] = "5a61eed50550d4d0dcb47457ce7b6a90f8e719d42a3b25f7e79333e8cd721971"
 
+do_configure_prepend () {
+	# Else these could be used in preference to those in aclocal-copy
+	rm -f ${S}/m4/gpg-error.m4
+}




