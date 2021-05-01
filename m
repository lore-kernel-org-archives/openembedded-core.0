Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.13170.1619903546193642896
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 May 2021 14:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mgvEn+37;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id a11so784387plh.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 May 2021 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ElLa/ewEceo6jgz+aunJZy9HmPOK6gF0Tmf8zun4+0k=;
        b=mgvEn+37JWWdbUSyuTHH9bbRTo9R1B+v3DQmDd/wNszF6kw5jDBEJJ3J8T1aNpNGFn
         ztOcf7eaaDM60Fdzwr0o8i2KMyjpK1DXka/DSXQPEcgQja9UVSMd7dxWmmMPyE95BT0v
         95XbAUr5VrO8+SG35beR2fpuni1vQpnkkmml5zPR4OmOHvd+4r59NxllGbAacC+pFI6j
         jSKNDJwEli5kWhUCFGGQtCFEKnK0EwDCKYiZqJ4lLKrgMGT8mDyWoc+VnggDFwTcMc8D
         ETeVBUy5hg3PXJ9ydBVX1HqHp+ugGW2FhLwWzufFPyb9WIGn0txKsO1JGjHtNdS1j75n
         daag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ElLa/ewEceo6jgz+aunJZy9HmPOK6gF0Tmf8zun4+0k=;
        b=oFO2xmLUN+GVfUE5g73u7j1wJxowD62jBzIGCFzO5lyXCx38F7jJB/k4ZwD3aqFcpA
         AX+2i5aHXdM6JQVQCFxigHbCtj1DEGBRfN/mjbtj7jZqMJ35R6/U0u4AGwbKnQ+/AfdC
         4Pd+BSm3VOQzpc5wIuyVmZnjkFcZAPPvgtdqVplxRhHkOnwRtwyXYCCbwn8PtlsId+kB
         1T+qb4IX/p9lJLxKeVkaYvCFkgmFlwunW3CqTTmjXdEc9wMthnxcEORYlB9eXLEUbw6G
         yh/YMLE78nJvtvOK+Yg4QdA6qRG8nHmeLj1nBHsrrjZ0AsBq+g/OcceHwGv1cErp8hkV
         tijA==
X-Gm-Message-State: AOAM530NNJBIy8Gyoo4AKNwyovArMiDRYhmPnXnZADEgxVgODUFGHe/l
	3V4xBJ7CTPq4JAmWTA4S6j4XmayHMorzwQ==
X-Google-Smtp-Source: ABdhPJwQtaSHvRiXifJg6Jh6phA85EADWSqtDR9nDcH8ATjMqXYuOgSTQAbRAvnV656Iyf3C4rmdEA==
X-Received: by 2002:a17:90a:b907:: with SMTP id p7mr12167121pjr.79.1619903545171;
        Sat, 01 May 2021 14:12:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id d3sm6094926pgu.8.2021.05.01.14.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 14:12:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Joshua Watt <jpewhacker@gmail.com>
Subject: [PATCH] pkgconfig: Fix nativesdk builds for mingw sdk hosts
Date: Sat,  1 May 2021 14:12:21 -0700
Message-Id: <20210501211221.1101809-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pkgconfig uses a vendored version of ancient glib-2.0, which does not
have many of fixes that current glib-2.0 will have, we enable this
internal version for nativesdk/native recipe, which on mingw hosts does
not work well, as its missing necessary mingw support. This patch
backports couple of fixes which makes GCC11 happy

but its going to be a constant source of pain as long as we support mingw

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Joshua Watt <jpewhacker@gmail.com>
---
 ...-support-for-the-__int64-type.-See-1.patch | 144 ++++++++++++++++++
 ...9-printf-format-specifiers-on-Window.patch |  68 +++++++++
 .../pkgconfig/pkgconfig_git.bb                |   2 +
 3 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-remove-support-for-the-__int64-type.-See-1.patch
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-use-C99-printf-format-specifiers-on-Window.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-remove-support-for-the-__int64-type.-See-1.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-remove-support-for-the-__int64-type.-See-1.patch
new file mode 100644
index 0000000000..bee4585724
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-remove-support-for-the-__int64-type.-See-1.patch
@@ -0,0 +1,144 @@
+From 7e821441c482917e54435a07893272d87d3ad9e5 Mon Sep 17 00:00:00 2001
+From: Christoph Reiter <reiter.christoph@gmail.com>
+Date: Fri, 24 Aug 2018 19:43:04 +0200
+Subject: [PATCH] autotools: remove support for the __int64 type. See #1313
+
+__int64 was the 64bit type for Visual Studio before it added support for
+"long long" with VS2013. I think this was used to build glib with mingw and
+make the result usable for VS 6.0 which didn't support "long long" (??)
+
+Given that newer MSVC links against a different crt and mixing is not supported
+and everything supports "long long" nowadays just remove it.
+
+This is also a cleanup for printf format changes needed for #1497
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/GNOME/glib/commit/7e821441c4]
+---
+ configure.ac | 43 ++++---------------------------------------
+ 1 file changed, 4 insertions(+), 39 deletions(-)
+
+--- a/glib/configure.ac
++++ b/glib/configure.ac
+@@ -550,7 +550,6 @@ AC_CHECK_SIZEOF(long)
+ AC_CHECK_SIZEOF(int)
+ AC_CHECK_SIZEOF(void *)
+ AC_CHECK_SIZEOF(long long)
+-AC_CHECK_SIZEOF(__int64)
+ 
+ AC_CACHE_CHECK([for sig_atomic_t], ac_cv_type_sig_atomic_t,
+   [AC_TRY_LINK([#include <signal.h>
+@@ -564,7 +563,7 @@ if test x$ac_cv_type_sig_atomic_t = xyes
+      [Define if you have the 'sig_atomic_t' type.])
+ fi
+ 
+-if test x$ac_cv_sizeof_long = x8 || test x$ac_cv_sizeof_long_long = x8 || test x$ac_cv_sizeof___int64 = x8 ; then
++if test x$ac_cv_sizeof_long = x8 || test x$ac_cv_sizeof_long_long = x8 ; then
+   :
+ else
+   AC_MSG_ERROR([
+@@ -573,7 +572,7 @@ else
+ ])
+ fi
+ 
+-AS_IF([test x$glib_native_win32 != xyes && test x$ac_cv_sizeof_long_long = x8], [
++AS_IF([test x$ac_cv_sizeof_long_long = x8], [
+ 	# long long is a 64 bit integer.
+ 	AC_MSG_CHECKING(for format to printf and scanf a guint64)
+ 	AC_CACHE_VAL(glib_cv_long_long_format,[
+@@ -599,14 +598,6 @@ AS_IF([test x$glib_native_win32 != xyes
+ 	    AC_DEFINE(HAVE_INT64_AND_I64,1,[define to support printing 64-bit integers with format I64])
+           fi
+ 	], [AC_MSG_RESULT(none)])
+-],[ test x$ac_cv_sizeof___int64 = x8], [
+-	# __int64 is a 64 bit integer.
+-	AC_MSG_CHECKING(for format to printf and scanf a guint64)
+-	# We know this is MSVCRT.DLL, and what the formats are
+-	glib_cv_long_long_format=I64
+-	AC_MSG_RESULT(%${glib_cv_long_long_format}u)
+-        AC_DEFINE(HAVE_LONG_LONG_FORMAT,1,[define if system printf can print long long])
+-	AC_DEFINE(HAVE_INT64_AND_I64,1,[define to support printing 64-bit integers with format I64])
+ ])
+ 
+ AC_C_CONST
+@@ -872,9 +863,6 @@ case $ac_cv_sizeof_size_t in
+   $ac_cv_sizeof_long_long)
+       glib_size_type='long long'
+       ;;
+-  $ac_cv_sizeof__int64)
+-      glib_size_type='__int64'
+-      ;;
+   *)  AC_MSG_ERROR([No type matching size_t in size])
+       ;;
+ esac
+@@ -931,9 +919,6 @@ case $ac_cv_sizeof_ssize_t in
+   $ac_cv_sizeof_long_long)
+       glib_ssize_type='long long'
+       ;;
+-  $ac_cv_sizeof__int64)
+-      glib_ssize_type='__int64'
+-      ;;
+   *)  AC_MSG_ERROR([No type matching ssize_t in size])
+       ;;
+ esac
+@@ -2985,17 +2970,6 @@ $ac_cv_sizeof_long_long)
+   gint64_constant='(G_GNUC_EXTENSION (val##LL))'
+   guint64_constant='(G_GNUC_EXTENSION (val##ULL))'
+   ;;
+-$ac_cv_sizeof___int64)
+-  gint64='__int64'
+-  if test -n "$glib_cv_long_long_format"; then
+-    gint64_modifier='"'$glib_cv_long_long_format'"'
+-    gint64_format='"'$glib_cv_long_long_format'i"'
+-    guint64_format='"'$glib_cv_long_long_format'u"'
+-  fi
+-  glib_extension=
+-  gint64_constant='(val##i64)'
+-  guint64_constant='(val##ui64)'
+-  ;;
+ esac
+ glib_size_t=$ac_cv_sizeof_size_t
+ glib_ssize_t=$ac_cv_sizeof_ssize_t
+@@ -3020,7 +2994,7 @@ long)
+   gsize_format='"lu"'
+   glib_msize_type='LONG'
+   ;;
+-"long long"|__int64)
++"long long")
+   gsize_modifier='"I64"'
+   gsize_format='"I64u"'
+   glib_msize_type='INT64'
+@@ -3043,7 +3017,7 @@ long)
+   gssize_format='"li"'
+   glib_mssize_type='LONG'
+   ;;
+-"long long"|__int64)
++"long long")
+   gssize_modifier='"I64"'
+   gssize_format='"I64i"'
+   glib_mssize_type='INT64'
+@@ -3080,14 +3054,6 @@ $ac_cv_sizeof_long_long)
+   glib_gpi_cast='(gint64)'
+   glib_gpui_cast='(guint64)'
+   ;;
+-$ac_cv_sizeof___int64)
+-  glib_intptr_type_define=__int64
+-  gintptr_modifier='"I64"'
+-  gintptr_format='"I64i"'
+-  guintptr_format='"I64u"'
+-  glib_gpi_cast='(gint64)'
+-  glib_gpui_cast='(guint64)'
+-  ;;
+ *)
+   glib_unknown_void_p=yes
+   ;;
+@@ -3258,9 +3224,6 @@ $ac_cv_sizeof_long)
+ $ac_cv_sizeof_long_long)
+   gint64='long long'
+   ;;
+-$ac_cv_sizeof___int64)
+-  gint64='__int64'
+-  ;;
+ esac
+ 
+ AC_CHECK_TYPE([guint32],,,[typedef unsigned $gint32 guint32;])
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-use-C99-printf-format-specifiers-on-Window.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-use-C99-printf-format-specifiers-on-Window.patch
new file mode 100644
index 0000000000..a4e92da34b
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-use-C99-printf-format-specifiers-on-Window.patch
@@ -0,0 +1,68 @@
+From 3d7cde654c4c6f3bdad32f5521f28f5802a7c377 Mon Sep 17 00:00:00 2001
+From: Christoph Reiter <reiter.christoph@gmail.com>
+Date: Fri, 24 Aug 2018 21:46:47 +0200
+Subject: [PATCH] autotools: use C99 printf format specifiers on Windows. Fixes
+ #1497
+
+Since we now require a C99 compatible printf and use gnulib on Windows,
+we also mark our printf functions as gnu_printf. GCC complains about the
+Windows specific I64 specifiers we still write to glibconfig.h with the
+autotools build.
+
+To fix this switch all I64(x) to ll(x).
+
+This also makes the glibconfig.h output for those macros match the ones
+we get when using meson.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/GNOME/glib/commit/3d7cde654c]
+---
+ configure.ac | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+--- a/glib/configure.ac
++++ b/glib/configure.ac
+@@ -576,7 +576,7 @@ AS_IF([test x$ac_cv_sizeof_long_long = x
+ 	# long long is a 64 bit integer.
+ 	AC_MSG_CHECKING(for format to printf and scanf a guint64)
+ 	AC_CACHE_VAL(glib_cv_long_long_format,[
+-		for format in ll q I64; do
++		for format in ll q; do
+ 		  AC_TRY_RUN([#include <stdio.h>  
+ 			int main()
+ 			{
+@@ -2995,8 +2995,8 @@ long)
+   glib_msize_type='LONG'
+   ;;
+ "long long")
+-  gsize_modifier='"I64"'
+-  gsize_format='"I64u"'
++  gsize_modifier='"ll"'
++  gsize_format='"llu"'
+   glib_msize_type='INT64'
+   ;;
+ esac
+@@ -3018,8 +3018,8 @@ long)
+   glib_mssize_type='LONG'
+   ;;
+ "long long")
+-  gssize_modifier='"I64"'
+-  gssize_format='"I64i"'
++  gssize_modifier='"ll"'
++  gssize_format='"lli"'
+   glib_mssize_type='INT64'
+   ;;
+ esac
+@@ -3048,9 +3048,9 @@ $ac_cv_sizeof_long)
+   ;;
+ $ac_cv_sizeof_long_long)
+   glib_intptr_type_define='long long'
+-  gintptr_modifier='"I64"'
+-  gintptr_format='"I64i"'
+-  guintptr_format='"I64u"'
++  gintptr_modifier='"ll"'
++  gintptr_format='"lli"'
++  guintptr_format='"llu"'
+   glib_gpi_cast='(gint64)'
+   glib_gpui_cast='(guint64)'
+   ;;
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 52ef2a9779..72db876ad0 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -16,6 +16,8 @@ SRC_URI = "git://anongit.freedesktop.org/pkg-config \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
+           file://0001-autotools-remove-support-for-the-__int64-type.-See-1.patch \
+           file://0001-autotools-use-C99-printf-format-specifiers-on-Window.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.31.1

