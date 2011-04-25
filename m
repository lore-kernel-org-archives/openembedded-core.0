Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQyr-0003wn-UZ
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:59 +0200
Received: by pvc30 with SMTP id 30so1380158pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=IzMhn2z9FOJWx7W8TSZ5Jy0abzyybJpGXgFp6Hbz/HM=;
	b=OYAQ2A0WZQtWj/gtXRnrzpN5z5q8+FXRYsiF//qHYm5KLWaVEnLAfrZZzI/Q23w/JG
	fCg/qSae/v0093G9hcK8Zpyf7mMORwkM3Ip2RfLCUEnoftMaxbPrfKiNsAHSTZpUVTZ1
	AMsHGLW3ifFaeWs5D6QLSTufT+TP+nOvIwS9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=R/jDDoren2qPdXrrou0sBmvouxwxLm4Mjr6oKfxGteueExLoBJDx4EWVbE5LM7AHcg
	M8r+QEKLCQnGXeaHWmnWSjQukQ9oCCZjIR/67oDDUh4meQcg4SGp3/OlMzOLD0jJRM4a
	JvKkwlecbUSrIds3pDDGJc2/qx3oapQt0bB+s=
Received: by 10.68.57.235 with SMTP id l11mr2318663pbq.478.1303757717506;
	Mon, 25 Apr 2011 11:55:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p17sm1014978pbt.83.2011.04.25.11.55.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:55:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:55:11 -0700
Message-Id: <a3b739ff07fc5bef7a9b66ffdd6533004b55f8bf.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 10/17] glib-2.0: Inherit gettext should provide right libintl so remove from DEPENDS
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:59 -0000

Add no-iconv.patch to provide dummy libiconv in case of uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |  104 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb      |    4 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    5 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 4 files changed, 112 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch b/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
new file mode 100644
index 0000000..cca57d4
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
@@ -0,0 +1,104 @@
+We provide dummy implementation of iconv functionality if it does not find
+iconv which will be case with uclibc. We remove the check for iconv in configure
+
+This is needed when libintl and libiconv is not available. It wont have any
+impact on case when they are available.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Index: glib-2.26.1/glib/gconvert.c
+===================================================================
+--- glib-2.26.1.orig/glib/gconvert.c
++++ glib-2.26.1/glib/gconvert.c
+@@ -23,7 +23,7 @@
+ #include "config.h"
+ #include "glibconfig.h"
+ 
+-#ifndef G_OS_WIN32
++#if !defined G_OS_WIN32 && defined HAVE_ICONV_H
+ #include <iconv.h>
+ #endif
+ #include <errno.h>
+@@ -65,6 +65,28 @@
+ #error GNU libiconv not in use but included iconv.h is from libiconv
+ #endif
+ 
++#ifndef HAVE_ICONV_H
++typedef void *iconv_t;
++
++iconv_t iconv_open(const char *tocode, const char *fromcode)
++{
++	return (iconv_t)(-1);
++}
++
++int iconv_close(iconv_t cd)
++{
++	free(cd);
++
++	return 0;
++}
++size_t iconv (iconv_t __cd, char **__inbuf,
++                     size_t *__inbytesleft,
++                     char **__outbuf,
++                     size_t *__outbytesleft)
++{
++	return 0;
++}
++#endif
+ 
+ /**
+  * SECTION:conversions
+Index: glib-2.26.1/configure.ac
+===================================================================
+--- glib-2.26.1.orig/configure.ac
++++ glib-2.26.1/configure.ac
+@@ -373,46 +373,8 @@ dnl *** Tests for iconv ***
+ dnl ***********************
+ dnl
+ dnl We do this before the gettext checks, to avoid distortion
+-
+-dnl On Windows we use a native implementation
+-
+-if test x"$glib_native_win32" = xyes; then
+-  with_libiconv=native
+-else
+-  AC_ARG_WITH(libiconv,
+-	      [AC_HELP_STRING([--with-libiconv=@<:@no/gnu/native@:>@],
+-			      [use the libiconv library])],,
+-	      [with_libiconv=maybe])
+-
+-  found_iconv=no
+-  case $with_libiconv in
+-    maybe)
+-      # Check in the C library first
+-      AC_CHECK_FUNC(iconv_open, [with_libiconv=no; found_iconv=yes])
+-      # Check if we have GNU libiconv
+-      if test $found_iconv = "no"; then
+-	AC_CHECK_LIB(iconv, libiconv_open, [with_libiconv=gnu; found_iconv=yes])
+-      fi
+-      # Check if we have a iconv in -liconv, possibly from vendor
+-      if test $found_iconv = "no"; then
+-	AC_CHECK_LIB(iconv, iconv_open, [with_libiconv=native; found_iconv=yes])
+-      fi
+-      ;;
+-    no)
+-      AC_CHECK_FUNC(iconv_open, [with_libiconv=no; found_iconv=yes])
+-      ;;
+-    gnu|yes)
+-      AC_CHECK_LIB(iconv, libiconv_open, [with_libiconv=gnu; found_iconv=yes])
+-      ;;
+-    native)
+-      AC_CHECK_LIB(iconv, iconv_open, [with_libiconv=native; found_iconv=yes])
+-      ;;
+-  esac
+-
+-  if test "x$found_iconv" = "xno" ; then
+-     AC_MSG_ERROR([*** No iconv() implementation found in C library or libiconv])
+-  fi
+-fi
++found_iconv=yes
++with_libiconv=no
+ 
+ gl_GLIBC21
+ AC_ARG_ENABLE(iconv-cache, 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb
index 6a1fb6c..256abc1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb
@@ -1,13 +1,15 @@
 require glib.inc
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.26/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
           "
+# Only apply this patch for target recipe on uclibc
+SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
 
 SRC_URI[md5sum] = "17535accceef55bcb17a74d73f9c2aef"
 SRC_URI[sha256sum] = "7a74ff12b6b9dee1f2d0e520b56b68b621920c4f4250bdf23468e515625c28d5"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
index 4014a1b..776284e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.27/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
@@ -13,6 +13,9 @@ SRC_URI[sha256sum] = "aad3038db865b762e01b1dc455ffd601b4083c069018d290e5fdfe1a61
 
 SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 
+# Only apply this patch for target recipe on uclibc
+SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 5ebff68..756b9ef 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -15,7 +15,7 @@ SECTION = "libs"
 
 require glib-2.0.inc
 
-DEPENDS = "glib-2.0-native gtk-doc-native virtual/libiconv virtual/libintl zip dbus"
+DEPENDS = "glib-2.0-native gtk-doc-native zip dbus"
 DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native dbus-native"
 DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
 PACKAGES =+ "glib-2.0-utils "
-- 
1.7.4.1



