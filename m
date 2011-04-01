Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0n-0004qV-Qm
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:05 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so3431324iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Hv6iiztRBcy/M/zBbt0BQsaGKJhL+L93CzBKQYn8kis=;
	b=bA+UpBFgZUEz1bYRr7fjMVmnC41/a2Q3QZBzNIYAtItSv20ETObNjwBOVFF3G7g04w
	Y02eI73sqI9ocroiY4PAzTUN7/MIFfoIMn5t3Ao58FMIsTwujznvPIxOSXTKtwuO9hX2
	8sXy/kgbPJ3ygyY5YcA2NUEpfIV6HSlxcXDSU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mH0fTn3f1uFj1DWQAzEY/3r3Rm51Khc4YVQEJVO5232h/bB3fNVNrKZuqlAqzw9tsV
	ItX4BzlllHXbeoMycrYzcTPTOyomYpBykwd1nqdQlNmr16P3Ccq4NciEJzq+vaRbKd7r
	/n8BMuB197WKUvehi1DnKUmFDv+GZjbBiTqSE=
Received: by 10.42.208.145 with SMTP id gc17mr4150770icb.504.1301632139935;
	Thu, 31 Mar 2011 21:28:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c1sm1181118ibe.32.2011.03.31.21.28.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:51 -0700
Message-Id: <d7081610d5eebeb572620f7813d80a7caf578b48.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 14/46] glib-2.0: Inherit gettext should provide right libintl so remove from DEPENDS
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:06 -0000

Add no-iconv.patch to provide dummy libiconv in case of uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |  104 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb      |    4 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    3 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 4 files changed, 110 insertions(+), 3 deletions(-)
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
index 4014a1b..8320ee9 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
@@ -1,11 +1,12 @@
 require glib.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.27/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
+           file://no-iconv.patch \
           "
 
 SRC_URI[md5sum] = "b7025b581bf78fcd656117bfc113f21f"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 0319b9d..ce3203e 100644
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



