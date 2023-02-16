Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFFDC636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 15:04:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12142.1676559842394355630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 07:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A41B01042;
	Thu, 16 Feb 2023 07:04:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 597683F703;
	Thu, 16 Feb 2023 07:04:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] pkgconfig: use system glib for nativesdk builds
Date: Thu, 16 Feb 2023 15:03:59 +0000
Message-Id: <20230216150359.3468054-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 15:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177289

There's no need to use the internal glib fork for nativesdk builds, as
we can use the proper nativsdk-glib-2.0 recipe.

This means we're shipping less statically linked and obsolete code, and
can also drop two patches to that code which were only needed in
nativesdk builds on Windows.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-support-for-the-__int64-type.-See-1.patch | 144 ------------------
 ...9-printf-format-specifiers-on-Window.patch |  68 ---------
 .../pkgconfig/pkgconfig_git.bb                |   3 -
 3 files changed, 215 deletions(-)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-autoto=
ols-remove-support-for-the-__int64-type.-See-1.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-autoto=
ols-use-C99-printf-format-specifiers-on-Window.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-rem=
ove-support-for-the-__int64-type.-See-1.patch b/meta/recipes-devtools/pkg=
config/pkgconfig/0001-autotools-remove-support-for-the-__int64-type.-See-=
1.patch
deleted file mode 100644
index bee4585724e..00000000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-remove-sup=
port-for-the-__int64-type.-See-1.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From 7e821441c482917e54435a07893272d87d3ad9e5 Mon Sep 17 00:00:00 2001
-From: Christoph Reiter <reiter.christoph@gmail.com>
-Date: Fri, 24 Aug 2018 19:43:04 +0200
-Subject: [PATCH] autotools: remove support for the __int64 type. See #13=
13
-
-__int64 was the 64bit type for Visual Studio before it added support for
-"long long" with VS2013. I think this was used to build glib with mingw =
and
-make the result usable for VS 6.0 which didn't support "long long" (??)
-
-Given that newer MSVC links against a different crt and mixing is not su=
pported
-and everything supports "long long" nowadays just remove it.
-
-This is also a cleanup for printf format changes needed for #1497
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://github.com/GNOME/glib/commit/7e821441=
c4]
----
- configure.ac | 43 ++++---------------------------------------
- 1 file changed, 4 insertions(+), 39 deletions(-)
-
---- a/glib/configure.ac
-+++ b/glib/configure.ac
-@@ -550,7 +550,6 @@ AC_CHECK_SIZEOF(long)
- AC_CHECK_SIZEOF(int)
- AC_CHECK_SIZEOF(void *)
- AC_CHECK_SIZEOF(long long)
--AC_CHECK_SIZEOF(__int64)
-=20
- AC_CACHE_CHECK([for sig_atomic_t], ac_cv_type_sig_atomic_t,
-   [AC_TRY_LINK([#include <signal.h>
-@@ -564,7 +563,7 @@ if test x$ac_cv_type_sig_atomic_t =3D xyes
-      [Define if you have the 'sig_atomic_t' type.])
- fi
-=20
--if test x$ac_cv_sizeof_long =3D x8 || test x$ac_cv_sizeof_long_long =3D=
 x8 || test x$ac_cv_sizeof___int64 =3D x8 ; then
-+if test x$ac_cv_sizeof_long =3D x8 || test x$ac_cv_sizeof_long_long =3D=
 x8 ; then
-   :
- else
-   AC_MSG_ERROR([
-@@ -573,7 +572,7 @@ else
- ])
- fi
-=20
--AS_IF([test x$glib_native_win32 !=3D xyes && test x$ac_cv_sizeof_long_l=
ong =3D x8], [
-+AS_IF([test x$ac_cv_sizeof_long_long =3D x8], [
- 	# long long is a 64 bit integer.
- 	AC_MSG_CHECKING(for format to printf and scanf a guint64)
- 	AC_CACHE_VAL(glib_cv_long_long_format,[
-@@ -599,14 +598,6 @@ AS_IF([test x$glib_native_win32 !=3D xyes
- 	    AC_DEFINE(HAVE_INT64_AND_I64,1,[define to support printing 64-bit =
integers with format I64])
-           fi
- 	], [AC_MSG_RESULT(none)])
--],[ test x$ac_cv_sizeof___int64 =3D x8], [
--	# __int64 is a 64 bit integer.
--	AC_MSG_CHECKING(for format to printf and scanf a guint64)
--	# We know this is MSVCRT.DLL, and what the formats are
--	glib_cv_long_long_format=3DI64
--	AC_MSG_RESULT(%${glib_cv_long_long_format}u)
--        AC_DEFINE(HAVE_LONG_LONG_FORMAT,1,[define if system printf can =
print long long])
--	AC_DEFINE(HAVE_INT64_AND_I64,1,[define to support printing 64-bit inte=
gers with format I64])
- ])
-=20
- AC_C_CONST
-@@ -872,9 +863,6 @@ case $ac_cv_sizeof_size_t in
-   $ac_cv_sizeof_long_long)
-       glib_size_type=3D'long long'
-       ;;
--  $ac_cv_sizeof__int64)
--      glib_size_type=3D'__int64'
--      ;;
-   *)  AC_MSG_ERROR([No type matching size_t in size])
-       ;;
- esac
-@@ -931,9 +919,6 @@ case $ac_cv_sizeof_ssize_t in
-   $ac_cv_sizeof_long_long)
-       glib_ssize_type=3D'long long'
-       ;;
--  $ac_cv_sizeof__int64)
--      glib_ssize_type=3D'__int64'
--      ;;
-   *)  AC_MSG_ERROR([No type matching ssize_t in size])
-       ;;
- esac
-@@ -2985,17 +2970,6 @@ $ac_cv_sizeof_long_long)
-   gint64_constant=3D'(G_GNUC_EXTENSION (val##LL))'
-   guint64_constant=3D'(G_GNUC_EXTENSION (val##ULL))'
-   ;;
--$ac_cv_sizeof___int64)
--  gint64=3D'__int64'
--  if test -n "$glib_cv_long_long_format"; then
--    gint64_modifier=3D'"'$glib_cv_long_long_format'"'
--    gint64_format=3D'"'$glib_cv_long_long_format'i"'
--    guint64_format=3D'"'$glib_cv_long_long_format'u"'
--  fi
--  glib_extension=3D
--  gint64_constant=3D'(val##i64)'
--  guint64_constant=3D'(val##ui64)'
--  ;;
- esac
- glib_size_t=3D$ac_cv_sizeof_size_t
- glib_ssize_t=3D$ac_cv_sizeof_ssize_t
-@@ -3020,7 +2994,7 @@ long)
-   gsize_format=3D'"lu"'
-   glib_msize_type=3D'LONG'
-   ;;
--"long long"|__int64)
-+"long long")
-   gsize_modifier=3D'"I64"'
-   gsize_format=3D'"I64u"'
-   glib_msize_type=3D'INT64'
-@@ -3043,7 +3017,7 @@ long)
-   gssize_format=3D'"li"'
-   glib_mssize_type=3D'LONG'
-   ;;
--"long long"|__int64)
-+"long long")
-   gssize_modifier=3D'"I64"'
-   gssize_format=3D'"I64i"'
-   glib_mssize_type=3D'INT64'
-@@ -3080,14 +3054,6 @@ $ac_cv_sizeof_long_long)
-   glib_gpi_cast=3D'(gint64)'
-   glib_gpui_cast=3D'(guint64)'
-   ;;
--$ac_cv_sizeof___int64)
--  glib_intptr_type_define=3D__int64
--  gintptr_modifier=3D'"I64"'
--  gintptr_format=3D'"I64i"'
--  guintptr_format=3D'"I64u"'
--  glib_gpi_cast=3D'(gint64)'
--  glib_gpui_cast=3D'(guint64)'
--  ;;
- *)
-   glib_unknown_void_p=3Dyes
-   ;;
-@@ -3258,9 +3224,6 @@ $ac_cv_sizeof_long)
- $ac_cv_sizeof_long_long)
-   gint64=3D'long long'
-   ;;
--$ac_cv_sizeof___int64)
--  gint64=3D'__int64'
--  ;;
- esac
-=20
- AC_CHECK_TYPE([guint32],,,[typedef unsigned $gint32 guint32;])
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-use=
-C99-printf-format-specifiers-on-Window.patch b/meta/recipes-devtools/pkg=
config/pkgconfig/0001-autotools-use-C99-printf-format-specifiers-on-Windo=
w.patch
deleted file mode 100644
index a4e92da34b2..00000000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-autotools-use-C99-pr=
intf-format-specifiers-on-Window.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 3d7cde654c4c6f3bdad32f5521f28f5802a7c377 Mon Sep 17 00:00:00 2001
-From: Christoph Reiter <reiter.christoph@gmail.com>
-Date: Fri, 24 Aug 2018 21:46:47 +0200
-Subject: [PATCH] autotools: use C99 printf format specifiers on Windows.=
 Fixes
- #1497
-
-Since we now require a C99 compatible printf and use gnulib on Windows,
-we also mark our printf functions as gnu_printf. GCC complains about the
-Windows specific I64 specifiers we still write to glibconfig.h with the
-autotools build.
-
-To fix this switch all I64(x) to ll(x).
-
-This also makes the glibconfig.h output for those macros match the ones
-we get when using meson.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://github.com/GNOME/glib/commit/3d7cde65=
4c]
----
- configure.ac | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
---- a/glib/configure.ac
-+++ b/glib/configure.ac
-@@ -576,7 +576,7 @@ AS_IF([test x$ac_cv_sizeof_long_long =3D x
- 	# long long is a 64 bit integer.
- 	AC_MSG_CHECKING(for format to printf and scanf a guint64)
- 	AC_CACHE_VAL(glib_cv_long_long_format,[
--		for format in ll q I64; do
-+		for format in ll q; do
- 		  AC_TRY_RUN([#include <stdio.h> =20
- 			int main()
- 			{
-@@ -2995,8 +2995,8 @@ long)
-   glib_msize_type=3D'LONG'
-   ;;
- "long long")
--  gsize_modifier=3D'"I64"'
--  gsize_format=3D'"I64u"'
-+  gsize_modifier=3D'"ll"'
-+  gsize_format=3D'"llu"'
-   glib_msize_type=3D'INT64'
-   ;;
- esac
-@@ -3018,8 +3018,8 @@ long)
-   glib_mssize_type=3D'LONG'
-   ;;
- "long long")
--  gssize_modifier=3D'"I64"'
--  gssize_format=3D'"I64i"'
-+  gssize_modifier=3D'"ll"'
-+  gssize_format=3D'"lli"'
-   glib_mssize_type=3D'INT64'
-   ;;
- esac
-@@ -3048,9 +3048,9 @@ $ac_cv_sizeof_long)
-   ;;
- $ac_cv_sizeof_long_long)
-   glib_intptr_type_define=3D'long long'
--  gintptr_modifier=3D'"I64"'
--  gintptr_format=3D'"I64i"'
--  guintptr_format=3D'"I64u"'
-+  gintptr_modifier=3D'"ll"'
-+  gintptr_format=3D'"lli"'
-+  guintptr_format=3D'"llu"'
-   glib_gpi_cast=3D'(gint64)'
-   glib_gpui_cast=3D'(guint64)'
-   ;;
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/reci=
pes-devtools/pkgconfig/pkgconfig_git.bb
index 7e5860c18cd..68f624c80a3 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -15,8 +15,6 @@ SRC_URI =3D "git://gitlab.freedesktop.org/pkg-config/pk=
g-config.git;branch=3Dmaster;
            file://pkg-config-esdk.in \
            file://pkg-config-native.in \
            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-mat=
ch-.patch \
-           file://0001-autotools-remove-support-for-the-__int64-type.-Se=
e-1.patch \
-           file://0001-autotools-use-C99-printf-format-specifiers-on-Win=
dow.patch \
            "
=20
 S =3D "${WORKDIR}/git"
@@ -30,7 +28,6 @@ EXTRA_OECONF +=3D "--disable-indirect-deps"
=20
 PACKAGECONFIG ??=3D "glib"
 PACKAGECONFIG:class-native =3D ""
-PACKAGECONFIG:class-nativesdk =3D ""
=20
 PACKAGECONFIG[glib] =3D "--without-internal-glib,--with-internal-glib,gl=
ib-2.0 pkgconfig-native"
=20
--=20
2.34.1


