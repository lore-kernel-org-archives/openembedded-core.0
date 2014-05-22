Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CA1AB60E23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:52:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4M9qsjW025556 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:52:55 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ehunO29y9lBQ
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:52:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4M9qp0m025537
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:52:52 +0100
Message-ID: <1400752363.17834.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 10:52:43 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libgcrypt: Use pkg-config for dependencies
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
X-List-Received-Date: Thu, 22 May 2014 09:53:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Use pkg-config instead of -config files in the m4 macros.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch b/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
index 3e33679..82c93bd 100644
--- a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
+++ b/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
@@ -1,4 +1,8 @@
-Upstream-Status: Inappropriate [distribution]
+Add and use pkg-config for libgcrypt instead of -config scripts.
+
+Upstream-Status: Rejected [upstream have indicated they don't want a pkg-config dependency]
+
+RP 2014/5/22
 
 Index: libgcrypt-1.2.4/configure.ac
 ===================================================================
@@ -16,7 +20,7 @@ Index: libgcrypt-1.2.4/src/libgcrypt.pc.in
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
 +++ libgcrypt-1.2.4/src/libgcrypt.pc.in	2008-03-19 22:14:58.000000000 +0000
-@@ -0,0 +1,32 @@
+@@ -0,0 +1,33 @@
 +# Process this file with autoconf to produce a pkg-config metadata file.
 +# Copyright (C) 2002, 2003, 2004, 2005, 2006 Free Software Foundation
 +# Author: Simon Josefsson
@@ -36,6 +40,7 @@ Index: libgcrypt-1.2.4/src/libgcrypt.pc.in
 +
 +# API info
 +api_version=@LIBGCRYPT_CONFIG_API_VERSION@
++host=@LIBGCRYPT_CONFIG_HOST@
 +
 +# Misc information.
 +symmetric_ciphers=@LIBGCRYPT_CIPHERS@
@@ -49,3 +54,98 @@ Index: libgcrypt-1.2.4/src/libgcrypt.pc.in
 +Libs: -L${libdir} -lgcrypt
 +Libs.private: -L${libdir} -lgpg-error
 +Cflags: -I${includedir} 
+Index: libgcrypt-1.6.1/src/libgcrypt.m4
+===================================================================
+--- libgcrypt-1.6.1.orig/src/libgcrypt.m4	2013-12-16 17:44:32.000000000 +0000
++++ libgcrypt-1.6.1/src/libgcrypt.m4	2014-05-13 21:25:37.478389833 +0000
+@@ -22,17 +22,7 @@
+ dnl
+ AC_DEFUN([AM_PATH_LIBGCRYPT],
+ [ AC_REQUIRE([AC_CANONICAL_HOST])
+-  AC_ARG_WITH(libgcrypt-prefix,
+-            AC_HELP_STRING([--with-libgcrypt-prefix=PFX],
+-                           [prefix where LIBGCRYPT is installed (optional)]),
+-     libgcrypt_config_prefix="$withval", libgcrypt_config_prefix="")
+-  if test x$libgcrypt_config_prefix != x ; then
+-     if test x${LIBGCRYPT_CONFIG+set} != xset ; then
+-        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/bin/libgcrypt-config
+-     fi
+-  fi
+ 
+-  AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, no)
+   tmp=ifelse([$1], ,1:1.2.0,$1)
+   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
+      req_libgcrypt_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
+@@ -42,48 +32,13 @@
+      min_libgcrypt_version="$tmp"
+   fi
+ 
+-  AC_MSG_CHECKING(for LIBGCRYPT - version >= $min_libgcrypt_version)
+-  ok=no
+-  if test "$LIBGCRYPT_CONFIG" != "no" ; then
+-    req_major=`echo $min_libgcrypt_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+-    req_minor=`echo $min_libgcrypt_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
+-    req_micro=`echo $min_libgcrypt_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
+-    libgcrypt_config_version=`$LIBGCRYPT_CONFIG --version`
+-    major=`echo $libgcrypt_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
+-    minor=`echo $libgcrypt_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
+-    micro=`echo $libgcrypt_config_version | \
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
+-    AC_MSG_RESULT([yes ($libgcrypt_config_version)])
+-  else
+-    AC_MSG_RESULT(no)
+-  fi
++  PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >= $min_libgcrypt_version], [ok=yes], [ok=no])
++
+   if test $ok = yes; then
+      # If we have a recent libgcrypt, we should also check that the
+      # API is compatible
+      if test "$req_libgcrypt_api" -gt 0 ; then
+-        tmp=`$LIBGCRYPT_CONFIG --api-version 2>/dev/null || echo 0`
++        tmp=`$PKG_CONFIG --variable=api_version libgcrypt`
+         if test "$tmp" -gt 0 ; then
+            AC_MSG_CHECKING([LIBGCRYPT API version])
+            if test "$req_libgcrypt_api" -eq "$tmp" ; then
+@@ -96,10 +51,8 @@
+      fi
+   fi
+   if test $ok = yes; then
+-    LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG --cflags`
+-    LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG --libs`
+     ifelse([$2], , :, [$2])
+-    libgcrypt_config_host=`$LIBGCRYPT_CONFIG --host 2>/dev/null || echo none`
++    libgcrypt_config_host=`$PKG_CONFIG --variable=host libgcrypt`
+     if test x"$libgcrypt_config_host" != xnone ; then
+       if test x"$libgcrypt_config_host" != x"$host" ; then
+   AC_MSG_WARN([[
+@@ -113,8 +66,6 @@
+       fi
+     fi
+   else
+-    LIBGCRYPT_CFLAGS=""
+-    LIBGCRYPT_LIBS=""
+     ifelse([$3], , :, [$3])
+   fi
+   AC_SUBST(LIBGCRYPT_CFLAGS)
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 724bf3d..8afa945 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -18,6 +18,11 @@ inherit autotools-brokensep texinfo binconfig pkgconfig
 
 EXTRA_OECONF = "--disable-asm --with-capabilities"
 
+do_configure_prepend () {
+	# Else these could be used in prefernce to those in aclocal-copy
+	rm ${S}/m4/*.m4
+}
+
 # libgcrypt.pc is added locally and thus installed here
 do_install_append() {
 	install -d ${D}/${libdir}/pkgconfig



