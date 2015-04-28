Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4C71273D3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 10:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAntoN028802 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dl8dU-_zaMXl
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAnhg4028771
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:55 +0100
Message-ID: <1430218166.13022.160.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 11:49:26 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] gpgme: Fix to use pkg-config in .m4 files
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
X-List-Received-Date: Tue, 28 Apr 2015 10:49:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

pkg-config is less error prone than -config files so switch to
using it (we already do for most of the rest of the gpg stack).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/gpgme/gpgme-1.4.3/pkgconfig.patch b/meta/recipes-support/gpgme/gpgme-1.4.3/pkgconfig.patch
new file mode 100644
index 0000000..b29cd70
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme-1.4.3/pkgconfig.patch
@@ -0,0 +1,278 @@
+Update gpgme to use pkgconfig instead of -config files since its
+simpler and less error prone when cross compiling.
+
+Upstream-Status: Rejected [Upstream not interested in pkg-config support]
+RP 2015/4/17
+
+Index: gpgme-1.4.3/configure.ac
+===================================================================
+--- gpgme-1.4.3.orig/configure.ac
++++ gpgme-1.4.3/configure.ac
+@@ -1058,6 +1058,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+                 src/versioninfo.rc
+                 src/gpgme.h)
+ AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
++AC_CONFIG_FILES(src/gpgme.pc src/gpgme-pthread.pc)
+ AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpgme.asd])
+ AC_OUTPUT
+ 
+Index: gpgme-1.4.3/src/Makefile.am
+===================================================================
+--- gpgme-1.4.3.orig/src/Makefile.am
++++ gpgme-1.4.3/src/Makefile.am
+@@ -20,11 +20,13 @@
+ 
+ # Note: moc_kdpipeiodevice should actually be a dependcy below.
+ EXTRA_DIST = gpgme-config.in gpgme.m4 libgpgme.vers ChangeLog-2011 \
+-	     gpgme.h.in versioninfo.rc.in gpgme.def moc_kdpipeiodevice.cpp
++	     gpgme.h.in versioninfo.rc.in gpgme.def moc_kdpipeiodevice.cpp gpgme.pc.in gpgme-pthread.pc.in
+ 
+ bin_SCRIPTS = gpgme-config
+ m4datadir = $(datadir)/aclocal
+ m4data_DATA = gpgme.m4
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = gpgme.pc gpgme-pthread.pc
+ nodist_include_HEADERS = gpgme.h
+ 
+ if HAVE_PTHREAD
+Index: gpgme-1.4.3/src/gpgme.pc.in
+===================================================================
+--- /dev/null
++++ gpgme-1.4.3/src/gpgme.pc.in
+@@ -0,0 +1,15 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++# API info
++api_version=@GPGME_CONFIG_API_VERSION@
++host=@GPGME_CONFIG_HOST@
++
++Name: gpgme
++Description: GnuPG Made Easy (GPGME) is a C language library that allows to addsupport for cryptography to a program.
++Version: @VERSION@
++Libs: -L${libdir} -lgpgme
++Cflags: -I${includedir}
++Requires: libassuan gpg-error
+\ No newline at end of file
+Index: gpgme-1.4.3/src/gpgme-pthread.pc.in
+===================================================================
+--- /dev/null
++++ gpgme-1.4.3/src/gpgme-pthread.pc.in
+@@ -0,0 +1,15 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++# API info
++api_version=@GPGME_CONFIG_API_VERSION@
++host=@GPGME_CONFIG_HOST@
++
++Name: gpgme
++Description: GnuPG Made Easy (GPGME) is a C language library that allows to addsupport for cryptography to a program (threaded version)
++Version: @VERSION@
++Libs: -L${libdir} -lgpgme-pthread -lpthread
++Cflags: -I${includedir}
++Requires: libassuan gpg-error
+Index: gpgme-1.4.3/src/gpgme.m4
+===================================================================
+--- gpgme-1.4.3.orig/src/gpgme.m4
++++ gpgme-1.4.3/src/gpgme.m4
+@@ -36,7 +36,7 @@ dnl               [ACTION-IF-FOUND [, AC
+ dnl Test for libgpgme and define GPGME_CFLAGS and GPGME_LIBS.
+ dnl
+ AC_DEFUN([AM_PATH_GPGME],
+-[ AC_REQUIRE([_AM_PATH_GPGME_CONFIG])dnl
++[
+   tmp=ifelse([$1], ,1:0.4.2,$1)
+   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
+      req_gpgme_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
+@@ -45,37 +45,12 @@ AC_DEFUN([AM_PATH_GPGME],
+      req_gpgme_api=0
+      min_gpgme_version="$tmp"
+   fi
+-
+-  AC_MSG_CHECKING(for GPGME - version >= $min_gpgme_version)
+-  ok=no
+-  if test "$GPGME_CONFIG" != "no" ; then
+-    req_major=`echo $min_gpgme_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+-    req_minor=`echo $min_gpgme_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
+-    req_micro=`echo $min_gpgme_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
+-    if test "$gpgme_version_major" -gt "$req_major"; then
+-        ok=yes
+-    else 
+-        if test "$gpgme_version_major" -eq "$req_major"; then
+-            if test "$gpgme_version_minor" -gt "$req_minor"; then
+-               ok=yes
+-            else
+-               if test "$gpgme_version_minor" -eq "$req_minor"; then
+-                   if test "$gpgme_version_micro" -ge "$req_micro"; then
+-                     ok=yes
+-                   fi
+-               fi
+-            fi
+-        fi
+-    fi
+-  fi
++  PKG_CHECK_MODULES(GPGME, [gpgme >= $min_gpgme_version], [ok=yes], [ok=no])  
+   if test $ok = yes; then
+      # If we have a recent GPGME, we should also check that the
+      # API is compatible.
+      if test "$req_gpgme_api" -gt 0 ; then
+-        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
++        tmp=`$PKG_CONFIG --variable=api_version gpgme 2>/dev/null || echo 0`
+         if test "$tmp" -gt 0 ; then
+            if test "$req_gpgme_api" -ne "$tmp" ; then
+              ok=no
+@@ -84,18 +59,10 @@ AC_DEFUN([AM_PATH_GPGME],
+      fi
+   fi
+   if test $ok = yes; then
+-    GPGME_CFLAGS=`$GPGME_CONFIG --cflags`
+-    GPGME_LIBS=`$GPGME_CONFIG --libs`
+-    AC_MSG_RESULT(yes)
+     ifelse([$2], , :, [$2])
+   else
+-    GPGME_CFLAGS=""
+-    GPGME_LIBS=""
+-    AC_MSG_RESULT(no)
+     ifelse([$3], , :, [$3])
+   fi
+-  AC_SUBST(GPGME_CFLAGS)
+-  AC_SUBST(GPGME_LIBS)
+ ])
+ 
+ dnl AM_PATH_GPGME_PTHREAD([MINIMUM-VERSION,
+@@ -104,7 +71,7 @@ dnl Test for libgpgme and define GPGME_P
+ dnl  and GPGME_PTHREAD_LIBS.
+ dnl
+ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
+-[ AC_REQUIRE([_AM_PATH_GPGME_CONFIG])dnl
++[
+   tmp=ifelse([$1], ,1:0.4.2,$1)
+   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
+      req_gpgme_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
+@@ -114,38 +81,13 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
+      min_gpgme_version="$tmp"
+   fi
+ 
+-  AC_MSG_CHECKING(for GPGME pthread - version >= $min_gpgme_version)
+-  ok=no
+-  if test "$GPGME_CONFIG" != "no" ; then
+-    if `$GPGME_CONFIG --thread=pthread 2> /dev/null` ; then
+-      req_major=`echo $min_gpgme_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+-      req_minor=`echo $min_gpgme_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
+-      req_micro=`echo $min_gpgme_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
+-      if test "$gpgme_version_major" -gt "$req_major"; then
+-        ok=yes
+-      else 
+-        if test "$gpgme_version_major" -eq "$req_major"; then
+-          if test "$gpgme_version_minor" -gt "$req_minor"; then
+-            ok=yes
+-          else
+-            if test "$gpgme_version_minor" -eq "$req_minor"; then
+-              if test "$gpgme_version_micro" -ge "$req_micro"; then
+-                ok=yes
+-              fi
+-            fi
+-          fi
+-        fi
+-      fi
+-    fi
+-  fi
++  PKG_CHECK_MODULES(GPGME_PTHREAD, [gpgme-pthread >= $min_gpgme_version], [ok=yes], [ok=no])  
++
+   if test $ok = yes; then
+      # If we have a recent GPGME, we should also check that the
+      # API is compatible.
+      if test "$req_gpgme_api" -gt 0 ; then
+-        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
++        tmp=`$PKG_CONFIG --variable=api_version gpgme-pthread 2>/dev/null || echo 0`
+         if test "$tmp" -gt 0 ; then
+            if test "$req_gpgme_api" -ne "$tmp" ; then
+              ok=no
+@@ -154,18 +96,10 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
+      fi
+   fi
+   if test $ok = yes; then
+-    GPGME_PTHREAD_CFLAGS=`$GPGME_CONFIG --thread=pthread --cflags`
+-    GPGME_PTHREAD_LIBS=`$GPGME_CONFIG --thread=pthread --libs`
+-    AC_MSG_RESULT(yes)
+     ifelse([$2], , :, [$2])
+   else
+-    GPGME_PTHREAD_CFLAGS=""
+-    GPGME_PTHREAD_LIBS=""
+-    AC_MSG_RESULT(no)
+     ifelse([$3], , :, [$3])
+   fi
+-  AC_SUBST(GPGME_PTHREAD_CFLAGS)
+-  AC_SUBST(GPGME_PTHREAD_LIBS)
+ ])
+ 
+ 
+@@ -184,36 +118,13 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+      min_gpgme_version="$tmp"
+   fi
+ 
+-  AC_MSG_CHECKING(for GPGME - version >= $min_gpgme_version)
+-  ok=no
+-  if test "$GPGME_CONFIG" != "no" ; then
+-    req_major=`echo $min_gpgme_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+-    req_minor=`echo $min_gpgme_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
+-    req_micro=`echo $min_gpgme_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
+-    if test "$gpgme_version_major" -gt "$req_major"; then
+-        ok=yes
+-    else 
+-        if test "$gpgme_version_major" -eq "$req_major"; then
+-            if test "$gpgme_version_minor" -gt "$req_minor"; then
+-               ok=yes
+-            else
+-               if test "$gpgme_version_minor" -eq "$req_minor"; then
+-                   if test "$gpgme_version_micro" -ge "$req_micro"; then
+-                     ok=yes
+-                   fi
+-               fi
+-            fi
+-        fi
+-    fi
+-  fi
++  PKG_CHECK_MODULES(GPGME_GLIB, [gpgme >= $min_gpgme_version glib-2.0], [ok=yes], [ok=no])  
++
+   if test $ok = yes; then
+      # If we have a recent GPGME, we should also check that the
+      # API is compatible.
+      if test "$req_gpgme_api" -gt 0 ; then
+-        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
++        tmp=`$PKG_CONFIG --variable=api_version gpgme 2>/dev/null || echo 0`
+         if test "$tmp" -gt 0 ; then
+            if test "$req_gpgme_api" -ne "$tmp" ; then
+              ok=no
+@@ -222,17 +133,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+      fi
+   fi
+   if test $ok = yes; then
+-    GPGME_GLIB_CFLAGS=`$GPGME_CONFIG --glib --cflags`
+-    GPGME_GLIB_LIBS=`$GPGME_CONFIG --glib --libs`
+-    AC_MSG_RESULT(yes)
+     ifelse([$2], , :, [$2])
+   else
+-    GPGME_GLIB_CFLAGS=""
+-    GPGME_GLIB_LIBS=""
+-    AC_MSG_RESULT(no)
+     ifelse([$3], , :, [$3])
+   fi
+-  AC_SUBST(GPGME_GLIB_CFLAGS)
+-  AC_SUBST(GPGME_GLIB_LIBS)
+ ])
+ 
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
index 98fd68b..cba3589 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
-           file://gpgme.pc"
+           file://gpgme.pc \
+           file://pkgconfig.patch"
 
 SRC_URI[md5sum] = "334e524cffa8af4e2f43ae8afe585672"
 SRC_URI[sha256sum] = "2d1cc12411753752d9c5b9037e6fd3fd363517af720154768cc7b46b60120496"



