Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38A7C43219
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:24:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10856.1653405849100500001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 08:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA04EED1;
	Tue, 24 May 2022 08:24:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 331983F70D;
	Tue, 24 May 2022 08:24:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 6/9] lzop: remove recipe from oe-core
Date: Tue, 24 May 2022 16:23:58 +0100
Message-Id: <20220524152401.1663317-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524152401.1663317-1-ross.burton@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 15:24:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166076

There are no users of lzop in oe-core, and there hasn't been a release of
lzop since 2017.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc    |   1 -
 meta/recipes-support/lzop/lzop/acinclude.m4 | 390 --------------------
 meta/recipes-support/lzop/lzop_1.04.bb      |  27 --
 3 files changed, 418 deletions(-)
 delete mode 100644 meta/recipes-support/lzop/lzop/acinclude.m4
 delete mode 100644 meta/recipes-support/lzop/lzop_1.04.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 3990d1d507f..de3fb7474cb 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -472,7 +472,6 @@ RECIPE_MAINTAINER:pn-lua =3D "Alexander Kanavin <alex=
.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-lz4 =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzo =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzip =3D "Denys Dmytriyenko <denis@denix.org>"
-RECIPE_MAINTAINER:pn-lzop =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-m4 =3D "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-m4-native =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-make =3D "Robert Yang <liezhi.yang@windriver.com>"
diff --git a/meta/recipes-support/lzop/lzop/acinclude.m4 b/meta/recipes-s=
upport/lzop/lzop/acinclude.m4
deleted file mode 100644
index 0029c19c7d9..00000000000
--- a/meta/recipes-support/lzop/lzop/acinclude.m4
+++ /dev/null
@@ -1,390 +0,0 @@
-
-AC_DEFUN([mfx_ACC_CHECK_ENDIAN], [
-AC_C_BIGENDIAN([AC_DEFINE(ACC_ABI_BIG_ENDIAN,1,[Define to 1 if your mach=
ine is big endian.])],[AC_DEFINE(ACC_ABI_LITTLE_ENDIAN,1,[Define to 1 if =
your machine is little endian.])])
-])#
-
-AC_DEFUN([mfx_ACC_CHECK_HEADERS], [
-AC_HEADER_TIME
-AC_CHECK_HEADERS([assert.h ctype.h dirent.h errno.h fcntl.h float.h limi=
ts.h malloc.h memory.h setjmp.h signal.h stdarg.h stddef.h stdint.h stdio=
.h stdlib.h string.h strings.h time.h unistd.h utime.h sys/stat.h sys/tim=
e.h sys/types.h sys/wait.h])
-])#
-
-AC_DEFUN([mfx_ACC_CHECK_FUNCS], [
-AC_CHECK_FUNCS(access alloca atexit atoi atol chmod chown ctime difftime=
 fstat gettimeofday gmtime localtime longjmp lstat memcmp memcpy memmove =
memset mktime qsort raise setjmp signal snprintf strcasecmp strchr strdup=
 strerror strftime stricmp strncasecmp strnicmp strrchr strstr time umask=
 utime vsnprintf)
-])#
-
-
-AC_DEFUN([mfx_ACC_CHECK_SIZEOF], [
-AC_CHECK_SIZEOF(short)
-AC_CHECK_SIZEOF(int)
-AC_CHECK_SIZEOF(long)
-
-AC_CHECK_SIZEOF(long long)
-AC_CHECK_SIZEOF(__int16)
-AC_CHECK_SIZEOF(__int32)
-AC_CHECK_SIZEOF(__int64)
-
-AC_CHECK_SIZEOF(void *)
-AC_CHECK_SIZEOF(size_t)
-AC_CHECK_SIZEOF(ptrdiff_t)
-])#
-
-
-# /*********************************************************************=
**
-# // Check for ACC_conformance
-# **********************************************************************=
**/
-
-AC_DEFUN([mfx_ACC_ACCCHK], [
-mfx_tmp=3D$1
-mfx_save_CPPFLAGS=3D$CPPFLAGS
-dnl in Makefile.in $(INCLUDES) will be before $(CPPFLAGS), so we mimic t=
his here
-test "X$mfx_tmp" =3D "X" || CPPFLAGS=3D"$mfx_tmp $CPPFLAGS"
-
-AC_MSG_CHECKING([whether your compiler passes the ACC conformance test])
-
-AC_LANG_CONFTEST([AC_LANG_PROGRAM(
-[[#define ACC_CONFIG_NO_HEADER 1
-#include "acc/acc.h"
-#include "acc/acc_incd.h"
-#undef ACCCHK_ASSERT
-#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT_HEADER(expr)
-#include "acc/acc_chk.ch"
-#undef ACCCHK_ASSERT
-static void test_acc_compile_time_assert(void) {
-#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT(expr)
-#include "acc/acc_chk.ch"
-#undef ACCCHK_ASSERT
-}
-#undef NDEBUG
-#include <assert.h>
-static int test_acc_run_time_assert(int r) {
-#define ACCCHK_ASSERT(expr)     assert(expr);
-#include "acc/acc_chk.ch"
-#undef ACCCHK_ASSERT
-return r;
-}
-]], [[
-test_acc_compile_time_assert();
-if (test_acc_run_time_assert(1) !=3D 1) return 1;
-]]
-)])
-
-mfx_tmp=3DFAILED
-_AC_COMPILE_IFELSE([], [mfx_tmp=3Dyes])
-rm -f conftest.$ac_ext conftest.$ac_objext
-
-CPPFLAGS=3D$mfx_save_CPPFLAGS
-
-AC_MSG_RESULT([$mfx_tmp])
-case x$mfx_tmp in
-  xpassed | xyes) ;;
-  *)
-    AC_MSG_NOTICE([])
-    AC_MSG_NOTICE([Your compiler failed the ACC conformance test - for d=
etails see ])
-    AC_MSG_NOTICE([`config.log'. Please check that log file and consider=
 sending])
-    AC_MSG_NOTICE([a patch or bug-report to <${PACKAGE_BUGREPORT}>.])
-    AC_MSG_NOTICE([Thanks for your support.])
-    AC_MSG_NOTICE([])
-    AC_MSG_ERROR([ACC conformance test failed. Stop.])
-dnl    AS_EXIT
-    ;;
-esac
-])# mfx_ACC_ACCCHK
-
-
-# /*********************************************************************=
**
-# // Check for ACC_conformance
-# **********************************************************************=
**/
-
-AC_DEFUN([mfx_MINIACC_ACCCHK], [
-mfx_tmp=3D$1
-mfx_save_CPPFLAGS=3D$CPPFLAGS
-dnl in Makefile.in $(INCLUDES) will be before $(CPPFLAGS), so we mimic t=
his here
-test "X$mfx_tmp" =3D "X" || CPPFLAGS=3D"$mfx_tmp $CPPFLAGS"
-
-AC_MSG_CHECKING([whether your compiler passes the ACC conformance test])
-
-AC_LANG_CONFTEST([AC_LANG_PROGRAM(
-[[#define ACC_CONFIG_NO_HEADER 1
-#define ACC_WANT_ACC_INCD_H 1
-#include $2
-
-#define ACC_WANT_ACC_CHK_CH 1
-#undef ACCCHK_ASSERT
-#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT_HEADER(expr)
-#include $2
-
-#define ACC_WANT_ACC_CHK_CH 1
-#undef ACCCHK_ASSERT
-#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT(expr)
-static void test_acc_compile_time_assert(void) {
-#include $2
-}
-
-#undef NDEBUG
-#include <assert.h>
-#define ACC_WANT_ACC_CHK_CH 1
-#undef ACCCHK_ASSERT
-#define ACCCHK_ASSERT(expr)  assert(expr);
-static int test_acc_run_time_assert(int r) {
-#include $2
-return r;
-}
-]], [[
-test_acc_compile_time_assert();
-if (test_acc_run_time_assert(1) !=3D 1) return 1;
-]]
-)])
-
-mfx_tmp=3DFAILED
-_AC_COMPILE_IFELSE([], [mfx_tmp=3Dyes])
-rm -f conftest.$ac_ext conftest.$ac_objext
-
-CPPFLAGS=3D$mfx_save_CPPFLAGS
-
-AC_MSG_RESULT([$mfx_tmp])
-case x$mfx_tmp in
-  xpassed | xyes) ;;
-  *)
-    AC_MSG_NOTICE([])
-    AC_MSG_NOTICE([Your compiler failed the ACC conformance test - for d=
etails see ])
-    AC_MSG_NOTICE([`config.log'. Please check that log file and consider=
 sending])
-    AC_MSG_NOTICE([a patch or bug-report to <${PACKAGE_BUGREPORT}>.])
-    AC_MSG_NOTICE([Thanks for your support.])
-    AC_MSG_NOTICE([])
-    AC_MSG_ERROR([ACC conformance test failed. Stop.])
-dnl    AS_EXIT
-    ;;
-esac
-])# mfx_MINIACC_ACCCHK
-
-
-
-# serial 1
-
-AC_DEFUN([mfx_PROG_CPPFLAGS], [
-AC_MSG_CHECKING([whether the C preprocessor needs special flags])
-
-AC_LANG_CONFTEST([AC_LANG_PROGRAM(
-[[#include <limits.h>
-#if (32767 >=3D 4294967295ul) || (65535u >=3D 4294967295ul)
-#  include "your C preprocessor is broken 1"
-#elif (0xffffu =3D=3D 0xfffffffful)
-#  include "your C preprocessor is broken 2"
-#elif (32767 >=3D ULONG_MAX) || (65535u >=3D ULONG_MAX)
-#  include "your C preprocessor is broken 3"
-#endif
-]], [[ ]]
-)])
-
-mfx_save_CPPFLAGS=3D$CPPFLAGS
-mfx_tmp=3DERROR
-for mfx_arg in "" -no-cpp-precomp
-do
-  CPPFLAGS=3D"$mfx_arg $mfx_save_CPPFLAGS"
-  _AC_COMPILE_IFELSE([],
-[mfx_tmp=3D$mfx_arg
-break])
-done
-CPPFLAGS=3D$mfx_save_CPPFLAGS
-rm -f conftest.$ac_ext conftest.$ac_objext
-case x$mfx_tmp in
-  x)
-    AC_MSG_RESULT([none needed]) ;;
-  xERROR)
-    AC_MSG_RESULT([ERROR])
-    AC_MSG_ERROR([your C preprocessor is broken - for details see config=
.log])
-    ;;
-  *)
-    AC_MSG_RESULT([$mfx_tmp])
-    CPPFLAGS=3D"$mfx_tmp $CPPFLAGS"
-    ;;
-esac
-])# mfx_PROG_CPPFLAGS
-
-
-
-# serial 3
-
-AC_DEFUN([mfx_CHECK_HEADER_SANE_LIMITS_H], [
-AC_CACHE_CHECK([whether limits.h is sane],
-mfx_cv_header_sane_limits_h,
-[AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <limits.h>
-#if (32767 >=3D 4294967295ul) || (65535u >=3D 4294967295ul)
-#  if defined(__APPLE__) && defined(__GNUC__)
-#    error "your preprocessor is broken - use compiler option -no-cpp-pr=
ecomp"
-#  else
-#    include "your preprocessor is broken"
-#  endif
-#endif
-#define MFX_0xffff          0xffff
-#define MFX_0xffffffffL     4294967295ul
-#if !defined(CHAR_BIT) || (CHAR_BIT !=3D 8)
-#  include "error CHAR_BIT"
-#endif
-#if !defined(UCHAR_MAX)
-#  include "error UCHAR_MAX 1"
-#endif
-#if !defined(USHRT_MAX)
-#  include "error USHRT_MAX 1"
-#endif
-#if !defined(UINT_MAX)
-#  include "error UINT_MAX 1"
-#endif
-#if !defined(ULONG_MAX)
-#  include "error ULONG_MAX 1"
-#endif
-#if !defined(SHRT_MAX)
-#  include "error SHRT_MAX 1"
-#endif
-#if !defined(INT_MAX)
-#  include "error INT_MAX 1"
-#endif
-#if !defined(LONG_MAX)
-#  include "error LONG_MAX 1"
-#endif
-#if (UCHAR_MAX < 1)
-#  include "error UCHAR_MAX 2"
-#endif
-#if (USHRT_MAX < 1)
-#  include "error USHRT_MAX 2"
-#endif
-#if (UINT_MAX < 1)
-#  include "error UINT_MAX 2"
-#endif
-#if (ULONG_MAX < 1)
-#  include "error ULONG_MAX 2"
-#endif
-#if (UCHAR_MAX < 0xff)
-#  include "error UCHAR_MAX 3"
-#endif
-#if (USHRT_MAX < MFX_0xffff)
-#  include "error USHRT_MAX 3"
-#endif
-#if (UINT_MAX < MFX_0xffff)
-#  include "error UINT_MAX 3"
-#endif
-#if (ULONG_MAX < MFX_0xffffffffL)
-#  include "error ULONG_MAX 3"
-#endif
-#if (USHRT_MAX > UINT_MAX)
-#  include "error USHRT_MAX vs UINT_MAX"
-#endif
-#if (UINT_MAX > ULONG_MAX)
-#  include "error UINT_MAX vs ULONG_MAX"
-#endif
-]], [[
-#if (USHRT_MAX =3D=3D MFX_0xffff)
-{ typedef char a_short2a[1 - 2 * !(sizeof(short) =3D=3D 2)]; }
-#elif (USHRT_MAX >=3D MFX_0xffff)
-{ typedef char a_short2b[1 - 2 * !(sizeof(short) > 2)]; }
-#endif
-#if (UINT_MAX =3D=3D MFX_0xffff)
-{ typedef char a_int2a[1 - 2 * !(sizeof(int) =3D=3D 2)]; }
-#elif (UINT_MAX >=3D MFX_0xffff)
-{ typedef char a_int2b[1 - 2 * !(sizeof(int) > 2)]; }
-#endif
-#if (ULONG_MAX =3D=3D MFX_0xffff)
-{ typedef char a_long2a[1 - 2 * !(sizeof(long) =3D=3D 2)]; }
-#elif (ULONG_MAX >=3D MFX_0xffff)
-{ typedef char a_long2b[1 - 2 * !(sizeof(long) > 2)]; }
-#endif
-#if (USHRT_MAX =3D=3D MFX_0xffffffffL)
-{ typedef char a_short4a[1 - 2 * !(sizeof(short) =3D=3D 4)]; }
-#elif (USHRT_MAX >=3D MFX_0xffffffffL)
-{ typedef char a_short4b[1 - 2 * !(sizeof(short) > 4)]; }
-#endif
-#if (UINT_MAX =3D=3D MFX_0xffffffffL)
-{ typedef char a_int4a[1 - 2 * !(sizeof(int) =3D=3D 4)]; }
-#elif (UINT_MAX >=3D MFX_0xffffffffL)
-{ typedef char a_int4b[1 - 2 * !(sizeof(int) > 4)]; }
-#endif
-#if (ULONG_MAX =3D=3D MFX_0xffffffffL)
-{ typedef char a_long4a[1 - 2 * !(sizeof(long) =3D=3D 4)]; }
-#elif (ULONG_MAX >=3D MFX_0xffffffffL)
-{ typedef char a_long4b[1 - 2 * !(sizeof(long) > 4)]; }
-#endif
-]])],
-[mfx_cv_header_sane_limits_h=3Dyes],
-[mfx_cv_header_sane_limits_h=3Dno])])
-])
-
-# /*********************************************************************=
**
-# // standard
-# **********************************************************************=
**/
-
-AC_DEFUN([mfx_LZO_CHECK_ENDIAN], [
-AC_C_BIGENDIAN([AC_DEFINE(LZO_ABI_BIG_ENDIAN,1,[Define to 1 if your mach=
ine is big endian.])],[AC_DEFINE(LZO_ABI_LITTLE_ENDIAN,1,[Define to 1 if =
your machine is little endian.])])
-])#
-
-
-# /*********************************************************************=
**
-# //
-# **********************************************************************=
**/
-
-dnl more types which are not yet covered by ACC
-
-AC_DEFUN([mfx_CHECK_SIZEOF], [
-AC_CHECK_SIZEOF(__int32)
-AC_CHECK_SIZEOF(intmax_t)
-AC_CHECK_SIZEOF(uintmax_t)
-AC_CHECK_SIZEOF(intptr_t)
-AC_CHECK_SIZEOF(uintptr_t)
-
-AC_CHECK_SIZEOF(float)
-AC_CHECK_SIZEOF(double)
-AC_CHECK_SIZEOF(long double)
-
-AC_CHECK_SIZEOF(dev_t)
-AC_CHECK_SIZEOF(fpos_t)
-AC_CHECK_SIZEOF(mode_t)
-AC_CHECK_SIZEOF(off_t)
-AC_CHECK_SIZEOF(ssize_t)
-AC_CHECK_SIZEOF(time_t)
-])#
-
-
-
-AC_DEFUN([mfx_CHECK_LIB_WINMM], [
-if test "X$GCC" =3D Xyes; then
-case $host_os in
-cygwin* | mingw* | pw32*)
-     test "X$LIBS" !=3D "X" && LIBS=3D"$LIBS "
-     LIBS=3D"${LIBS}-lwinmm" ;;
-*)
-     ;;
-esac
-fi
-])#
-
-#serial 6
-
-dnl From Paul Eggert.
-
-# Define ST_MTIM_NSEC to be the nanoseconds member of struct stat's st_m=
tim,
-# if it exists.
-
-AC_DEFUN([AC_STRUCT_ST_MTIM_NSEC],
- [AC_CACHE_CHECK([for nanoseconds member of struct stat.st_mtim],
-   ac_cv_struct_st_mtim_nsec,
-   [ac_save_CPPFLAGS=3D"$CPPFLAGS"
-    ac_cv_struct_st_mtim_nsec=3Dno
-    # tv_nsec -- the usual case
-    # _tv_nsec -- Solaris 2.6, if
-    #	(defined _XOPEN_SOURCE && _XOPEN_SOURCE_EXTENDED =3D=3D 1
-    #	 && !defined __EXTENSIONS__)
-    # st__tim.tv_nsec -- UnixWare 2.1.2
-    for ac_val in tv_nsec _tv_nsec st__tim.tv_nsec; do
-      CPPFLAGS=3D"$ac_save_CPPFLAGS -DST_MTIM_NSEC=3D$ac_val"
-      AC_TRY_COMPILE([#include <sys/types.h>
-#include <sys/stat.h>], [struct stat s; s.st_mtim.ST_MTIM_NSEC;],
-        [ac_cv_struct_st_mtim_nsec=3D$ac_val; break])
-    done
-    CPPFLAGS=3D"$ac_save_CPPFLAGS"])
-
-  if test $ac_cv_struct_st_mtim_nsec !=3D no; then
-    AC_DEFINE_UNQUOTED(ST_MTIM_NSEC, $ac_cv_struct_st_mtim_nsec,
-      [Define to be the nanoseconds member of struct stat's st_mtim,
-       if it exists.])
-  fi
- ]
-)
diff --git a/meta/recipes-support/lzop/lzop_1.04.bb b/meta/recipes-suppor=
t/lzop/lzop_1.04.bb
deleted file mode 100644
index d9b3524b678..00000000000
--- a/meta/recipes-support/lzop/lzop_1.04.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY =3D "Real-time file compressor"
-DESCRIPTION =3D "lzop is a compression utility which is designed to be a=
 companion to gzip. \n\
-It is based on the LZO data compression library and its main advantages =
over \n\
-gzip are much higher compression and decompression speed at the cost of =
some \n\
-compression ratio. The lzop compression utility was designed with the go=
als \n\
-of reliability, speed, portability and with reasonable drop-in compatibi=
lity \n\
-to gzip."
-HOMEPAGE =3D "http://www.lzop.org/"
-DEPENDS +=3D "lzo"
-
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
-                    file://src/lzop.c;beginline=3D5;endline=3D21;md5=3D2=
3d767de7754eb24b9e900b025cf7fc8"
-
-SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz \
-           file://acinclude.m4 \
-          "
-SRC_URI[md5sum] =3D "271eb10fde77a0a96b9cbf745e719ddf"
-SRC_URI[sha256sum] =3D "7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe177=
4d95147f305a2f41"
-
-inherit autotools
-
-do_configure:prepend () {
-    install -Dm 0644 ${WORKDIR}/acinclude.m4 ${S}/acinclude.m4
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


