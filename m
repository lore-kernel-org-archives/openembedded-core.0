Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEg-0005Qv-IB
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="634683418"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2011 00:30:05 -0700
Message-Id: <d591154f707d5df1b5b7f0817a40368a0a427312.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 20:36:42 -0700
Date: Wed, 27 Apr 2011  0:30:04 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 43/52] glib-2.0: Inherit gettext should provide right libintl so remove from DEPENDS
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:35 -0000

From: Khem Raj <raj.khem@gmail.com>

Add no-iconv.patch to provide dummy libiconv in case of uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |  104 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    5 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb      |    4 +-
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
index 6b6c1f5..ca5f4c8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
@@ -1,13 +1,15 @@
 require glib.inc
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
           "
+# Only apply this patch for target recipe on uclibc
+SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
 
 SRC_URI[md5sum] = "7d8fc15ae70d5111c0cf2a79d50ef717"
 SRC_URI[sha256sum] = "557fb7c39d21b9359fbac51fd6b0b883bc97a2561c0166eef993a4078312f578"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 9b6e17b..83f1990 100644
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
1.7.1.1



