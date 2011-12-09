Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZ5DZ-000496-F7
	for openembedded-core@openembedded.org; Fri, 09 Dec 2011 19:30:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2011 10:23:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100564230"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2011 10:23:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Fri,  9 Dec 2011 10:23:34 -0800
Message-Id: <a22c1965ba768ccd9870a1cecc12277afed4e2b3.1323454935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/15] lzop-1.03: add recipe
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
X-List-Received-Date: Fri, 09 Dec 2011 18:30:46 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is needed by some kernels when CONFIG_KERNEL_LZO=y (specifically, given
the current defconfig, this affects linux-omap4 2.6 in the meta-ti layer).

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/lzop/lzop/acinclude.m4 |  390 +++++++++++++++++++++++++++
 meta/recipes-support/lzop/lzop_1.03.bb      |   27 ++
 2 files changed, 417 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/lzop/lzop/acinclude.m4
 create mode 100644 meta/recipes-support/lzop/lzop_1.03.bb

diff --git a/meta/recipes-support/lzop/lzop/acinclude.m4 b/meta/recipes-support/lzop/lzop/acinclude.m4
new file mode 100644
index 0000000..0029c19
--- /dev/null
+++ b/meta/recipes-support/lzop/lzop/acinclude.m4
@@ -0,0 +1,390 @@
+
+AC_DEFUN([mfx_ACC_CHECK_ENDIAN], [
+AC_C_BIGENDIAN([AC_DEFINE(ACC_ABI_BIG_ENDIAN,1,[Define to 1 if your machine is big endian.])],[AC_DEFINE(ACC_ABI_LITTLE_ENDIAN,1,[Define to 1 if your machine is little endian.])])
+])#
+
+AC_DEFUN([mfx_ACC_CHECK_HEADERS], [
+AC_HEADER_TIME
+AC_CHECK_HEADERS([assert.h ctype.h dirent.h errno.h fcntl.h float.h limits.h malloc.h memory.h setjmp.h signal.h stdarg.h stddef.h stdint.h stdio.h stdlib.h string.h strings.h time.h unistd.h utime.h sys/stat.h sys/time.h sys/types.h sys/wait.h])
+])#
+
+AC_DEFUN([mfx_ACC_CHECK_FUNCS], [
+AC_CHECK_FUNCS(access alloca atexit atoi atol chmod chown ctime difftime fstat gettimeofday gmtime localtime longjmp lstat memcmp memcpy memmove memset mktime qsort raise setjmp signal snprintf strcasecmp strchr strdup strerror strftime stricmp strncasecmp strnicmp strrchr strstr time umask utime vsnprintf)
+])#
+
+
+AC_DEFUN([mfx_ACC_CHECK_SIZEOF], [
+AC_CHECK_SIZEOF(short)
+AC_CHECK_SIZEOF(int)
+AC_CHECK_SIZEOF(long)
+
+AC_CHECK_SIZEOF(long long)
+AC_CHECK_SIZEOF(__int16)
+AC_CHECK_SIZEOF(__int32)
+AC_CHECK_SIZEOF(__int64)
+
+AC_CHECK_SIZEOF(void *)
+AC_CHECK_SIZEOF(size_t)
+AC_CHECK_SIZEOF(ptrdiff_t)
+])#
+
+
+# /***********************************************************************
+# // Check for ACC_conformance
+# ************************************************************************/
+
+AC_DEFUN([mfx_ACC_ACCCHK], [
+mfx_tmp=$1
+mfx_save_CPPFLAGS=$CPPFLAGS
+dnl in Makefile.in $(INCLUDES) will be before $(CPPFLAGS), so we mimic this here
+test "X$mfx_tmp" = "X" || CPPFLAGS="$mfx_tmp $CPPFLAGS"
+
+AC_MSG_CHECKING([whether your compiler passes the ACC conformance test])
+
+AC_LANG_CONFTEST([AC_LANG_PROGRAM(
+[[#define ACC_CONFIG_NO_HEADER 1
+#include "acc/acc.h"
+#include "acc/acc_incd.h"
+#undef ACCCHK_ASSERT
+#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT_HEADER(expr)
+#include "acc/acc_chk.ch"
+#undef ACCCHK_ASSERT
+static void test_acc_compile_time_assert(void) {
+#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT(expr)
+#include "acc/acc_chk.ch"
+#undef ACCCHK_ASSERT
+}
+#undef NDEBUG
+#include <assert.h>
+static int test_acc_run_time_assert(int r) {
+#define ACCCHK_ASSERT(expr)     assert(expr);
+#include "acc/acc_chk.ch"
+#undef ACCCHK_ASSERT
+return r;
+}
+]], [[
+test_acc_compile_time_assert();
+if (test_acc_run_time_assert(1) != 1) return 1;
+]]
+)])
+
+mfx_tmp=FAILED
+_AC_COMPILE_IFELSE([], [mfx_tmp=yes])
+rm -f conftest.$ac_ext conftest.$ac_objext
+
+CPPFLAGS=$mfx_save_CPPFLAGS
+
+AC_MSG_RESULT([$mfx_tmp])
+case x$mfx_tmp in
+  xpassed | xyes) ;;
+  *)
+    AC_MSG_NOTICE([])
+    AC_MSG_NOTICE([Your compiler failed the ACC conformance test - for details see ])
+    AC_MSG_NOTICE([`config.log'. Please check that log file and consider sending])
+    AC_MSG_NOTICE([a patch or bug-report to <${PACKAGE_BUGREPORT}>.])
+    AC_MSG_NOTICE([Thanks for your support.])
+    AC_MSG_NOTICE([])
+    AC_MSG_ERROR([ACC conformance test failed. Stop.])
+dnl    AS_EXIT
+    ;;
+esac
+])# mfx_ACC_ACCCHK
+
+
+# /***********************************************************************
+# // Check for ACC_conformance
+# ************************************************************************/
+
+AC_DEFUN([mfx_MINIACC_ACCCHK], [
+mfx_tmp=$1
+mfx_save_CPPFLAGS=$CPPFLAGS
+dnl in Makefile.in $(INCLUDES) will be before $(CPPFLAGS), so we mimic this here
+test "X$mfx_tmp" = "X" || CPPFLAGS="$mfx_tmp $CPPFLAGS"
+
+AC_MSG_CHECKING([whether your compiler passes the ACC conformance test])
+
+AC_LANG_CONFTEST([AC_LANG_PROGRAM(
+[[#define ACC_CONFIG_NO_HEADER 1
+#define ACC_WANT_ACC_INCD_H 1
+#include $2
+
+#define ACC_WANT_ACC_CHK_CH 1
+#undef ACCCHK_ASSERT
+#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT_HEADER(expr)
+#include $2
+
+#define ACC_WANT_ACC_CHK_CH 1
+#undef ACCCHK_ASSERT
+#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT(expr)
+static void test_acc_compile_time_assert(void) {
+#include $2
+}
+
+#undef NDEBUG
+#include <assert.h>
+#define ACC_WANT_ACC_CHK_CH 1
+#undef ACCCHK_ASSERT
+#define ACCCHK_ASSERT(expr)  assert(expr);
+static int test_acc_run_time_assert(int r) {
+#include $2
+return r;
+}
+]], [[
+test_acc_compile_time_assert();
+if (test_acc_run_time_assert(1) != 1) return 1;
+]]
+)])
+
+mfx_tmp=FAILED
+_AC_COMPILE_IFELSE([], [mfx_tmp=yes])
+rm -f conftest.$ac_ext conftest.$ac_objext
+
+CPPFLAGS=$mfx_save_CPPFLAGS
+
+AC_MSG_RESULT([$mfx_tmp])
+case x$mfx_tmp in
+  xpassed | xyes) ;;
+  *)
+    AC_MSG_NOTICE([])
+    AC_MSG_NOTICE([Your compiler failed the ACC conformance test - for details see ])
+    AC_MSG_NOTICE([`config.log'. Please check that log file and consider sending])
+    AC_MSG_NOTICE([a patch or bug-report to <${PACKAGE_BUGREPORT}>.])
+    AC_MSG_NOTICE([Thanks for your support.])
+    AC_MSG_NOTICE([])
+    AC_MSG_ERROR([ACC conformance test failed. Stop.])
+dnl    AS_EXIT
+    ;;
+esac
+])# mfx_MINIACC_ACCCHK
+
+
+
+# serial 1
+
+AC_DEFUN([mfx_PROG_CPPFLAGS], [
+AC_MSG_CHECKING([whether the C preprocessor needs special flags])
+
+AC_LANG_CONFTEST([AC_LANG_PROGRAM(
+[[#include <limits.h>
+#if (32767 >= 4294967295ul) || (65535u >= 4294967295ul)
+#  include "your C preprocessor is broken 1"
+#elif (0xffffu == 0xfffffffful)
+#  include "your C preprocessor is broken 2"
+#elif (32767 >= ULONG_MAX) || (65535u >= ULONG_MAX)
+#  include "your C preprocessor is broken 3"
+#endif
+]], [[ ]]
+)])
+
+mfx_save_CPPFLAGS=$CPPFLAGS
+mfx_tmp=ERROR
+for mfx_arg in "" -no-cpp-precomp
+do
+  CPPFLAGS="$mfx_arg $mfx_save_CPPFLAGS"
+  _AC_COMPILE_IFELSE([],
+[mfx_tmp=$mfx_arg
+break])
+done
+CPPFLAGS=$mfx_save_CPPFLAGS
+rm -f conftest.$ac_ext conftest.$ac_objext
+case x$mfx_tmp in
+  x)
+    AC_MSG_RESULT([none needed]) ;;
+  xERROR)
+    AC_MSG_RESULT([ERROR])
+    AC_MSG_ERROR([your C preprocessor is broken - for details see config.log])
+    ;;
+  *)
+    AC_MSG_RESULT([$mfx_tmp])
+    CPPFLAGS="$mfx_tmp $CPPFLAGS"
+    ;;
+esac
+])# mfx_PROG_CPPFLAGS
+
+
+
+# serial 3
+
+AC_DEFUN([mfx_CHECK_HEADER_SANE_LIMITS_H], [
+AC_CACHE_CHECK([whether limits.h is sane],
+mfx_cv_header_sane_limits_h,
+[AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <limits.h>
+#if (32767 >= 4294967295ul) || (65535u >= 4294967295ul)
+#  if defined(__APPLE__) && defined(__GNUC__)
+#    error "your preprocessor is broken - use compiler option -no-cpp-precomp"
+#  else
+#    include "your preprocessor is broken"
+#  endif
+#endif
+#define MFX_0xffff          0xffff
+#define MFX_0xffffffffL     4294967295ul
+#if !defined(CHAR_BIT) || (CHAR_BIT != 8)
+#  include "error CHAR_BIT"
+#endif
+#if !defined(UCHAR_MAX)
+#  include "error UCHAR_MAX 1"
+#endif
+#if !defined(USHRT_MAX)
+#  include "error USHRT_MAX 1"
+#endif
+#if !defined(UINT_MAX)
+#  include "error UINT_MAX 1"
+#endif
+#if !defined(ULONG_MAX)
+#  include "error ULONG_MAX 1"
+#endif
+#if !defined(SHRT_MAX)
+#  include "error SHRT_MAX 1"
+#endif
+#if !defined(INT_MAX)
+#  include "error INT_MAX 1"
+#endif
+#if !defined(LONG_MAX)
+#  include "error LONG_MAX 1"
+#endif
+#if (UCHAR_MAX < 1)
+#  include "error UCHAR_MAX 2"
+#endif
+#if (USHRT_MAX < 1)
+#  include "error USHRT_MAX 2"
+#endif
+#if (UINT_MAX < 1)
+#  include "error UINT_MAX 2"
+#endif
+#if (ULONG_MAX < 1)
+#  include "error ULONG_MAX 2"
+#endif
+#if (UCHAR_MAX < 0xff)
+#  include "error UCHAR_MAX 3"
+#endif
+#if (USHRT_MAX < MFX_0xffff)
+#  include "error USHRT_MAX 3"
+#endif
+#if (UINT_MAX < MFX_0xffff)
+#  include "error UINT_MAX 3"
+#endif
+#if (ULONG_MAX < MFX_0xffffffffL)
+#  include "error ULONG_MAX 3"
+#endif
+#if (USHRT_MAX > UINT_MAX)
+#  include "error USHRT_MAX vs UINT_MAX"
+#endif
+#if (UINT_MAX > ULONG_MAX)
+#  include "error UINT_MAX vs ULONG_MAX"
+#endif
+]], [[
+#if (USHRT_MAX == MFX_0xffff)
+{ typedef char a_short2a[1 - 2 * !(sizeof(short) == 2)]; }
+#elif (USHRT_MAX >= MFX_0xffff)
+{ typedef char a_short2b[1 - 2 * !(sizeof(short) > 2)]; }
+#endif
+#if (UINT_MAX == MFX_0xffff)
+{ typedef char a_int2a[1 - 2 * !(sizeof(int) == 2)]; }
+#elif (UINT_MAX >= MFX_0xffff)
+{ typedef char a_int2b[1 - 2 * !(sizeof(int) > 2)]; }
+#endif
+#if (ULONG_MAX == MFX_0xffff)
+{ typedef char a_long2a[1 - 2 * !(sizeof(long) == 2)]; }
+#elif (ULONG_MAX >= MFX_0xffff)
+{ typedef char a_long2b[1 - 2 * !(sizeof(long) > 2)]; }
+#endif
+#if (USHRT_MAX == MFX_0xffffffffL)
+{ typedef char a_short4a[1 - 2 * !(sizeof(short) == 4)]; }
+#elif (USHRT_MAX >= MFX_0xffffffffL)
+{ typedef char a_short4b[1 - 2 * !(sizeof(short) > 4)]; }
+#endif
+#if (UINT_MAX == MFX_0xffffffffL)
+{ typedef char a_int4a[1 - 2 * !(sizeof(int) == 4)]; }
+#elif (UINT_MAX >= MFX_0xffffffffL)
+{ typedef char a_int4b[1 - 2 * !(sizeof(int) > 4)]; }
+#endif
+#if (ULONG_MAX == MFX_0xffffffffL)
+{ typedef char a_long4a[1 - 2 * !(sizeof(long) == 4)]; }
+#elif (ULONG_MAX >= MFX_0xffffffffL)
+{ typedef char a_long4b[1 - 2 * !(sizeof(long) > 4)]; }
+#endif
+]])],
+[mfx_cv_header_sane_limits_h=yes],
+[mfx_cv_header_sane_limits_h=no])])
+])
+
+# /***********************************************************************
+# // standard
+# ************************************************************************/
+
+AC_DEFUN([mfx_LZO_CHECK_ENDIAN], [
+AC_C_BIGENDIAN([AC_DEFINE(LZO_ABI_BIG_ENDIAN,1,[Define to 1 if your machine is big endian.])],[AC_DEFINE(LZO_ABI_LITTLE_ENDIAN,1,[Define to 1 if your machine is little endian.])])
+])#
+
+
+# /***********************************************************************
+# //
+# ************************************************************************/
+
+dnl more types which are not yet covered by ACC
+
+AC_DEFUN([mfx_CHECK_SIZEOF], [
+AC_CHECK_SIZEOF(__int32)
+AC_CHECK_SIZEOF(intmax_t)
+AC_CHECK_SIZEOF(uintmax_t)
+AC_CHECK_SIZEOF(intptr_t)
+AC_CHECK_SIZEOF(uintptr_t)
+
+AC_CHECK_SIZEOF(float)
+AC_CHECK_SIZEOF(double)
+AC_CHECK_SIZEOF(long double)
+
+AC_CHECK_SIZEOF(dev_t)
+AC_CHECK_SIZEOF(fpos_t)
+AC_CHECK_SIZEOF(mode_t)
+AC_CHECK_SIZEOF(off_t)
+AC_CHECK_SIZEOF(ssize_t)
+AC_CHECK_SIZEOF(time_t)
+])#
+
+
+
+AC_DEFUN([mfx_CHECK_LIB_WINMM], [
+if test "X$GCC" = Xyes; then
+case $host_os in
+cygwin* | mingw* | pw32*)
+     test "X$LIBS" != "X" && LIBS="$LIBS "
+     LIBS="${LIBS}-lwinmm" ;;
+*)
+     ;;
+esac
+fi
+])#
+
+#serial 6
+
+dnl From Paul Eggert.
+
+# Define ST_MTIM_NSEC to be the nanoseconds member of struct stat's st_mtim,
+# if it exists.
+
+AC_DEFUN([AC_STRUCT_ST_MTIM_NSEC],
+ [AC_CACHE_CHECK([for nanoseconds member of struct stat.st_mtim],
+   ac_cv_struct_st_mtim_nsec,
+   [ac_save_CPPFLAGS="$CPPFLAGS"
+    ac_cv_struct_st_mtim_nsec=no
+    # tv_nsec -- the usual case
+    # _tv_nsec -- Solaris 2.6, if
+    #	(defined _XOPEN_SOURCE && _XOPEN_SOURCE_EXTENDED == 1
+    #	 && !defined __EXTENSIONS__)
+    # st__tim.tv_nsec -- UnixWare 2.1.2
+    for ac_val in tv_nsec _tv_nsec st__tim.tv_nsec; do
+      CPPFLAGS="$ac_save_CPPFLAGS -DST_MTIM_NSEC=$ac_val"
+      AC_TRY_COMPILE([#include <sys/types.h>
+#include <sys/stat.h>], [struct stat s; s.st_mtim.ST_MTIM_NSEC;],
+        [ac_cv_struct_st_mtim_nsec=$ac_val; break])
+    done
+    CPPFLAGS="$ac_save_CPPFLAGS"])
+
+  if test $ac_cv_struct_st_mtim_nsec != no; then
+    AC_DEFINE_UNQUOTED(ST_MTIM_NSEC, $ac_cv_struct_st_mtim_nsec,
+      [Define to be the nanoseconds member of struct stat's st_mtim,
+       if it exists.])
+  fi
+ ]
+)
diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.03.bb
new file mode 100644
index 0000000..63a2a62
--- /dev/null
+++ b/meta/recipes-support/lzop/lzop_1.03.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Real-time file compressor"
+DESCRIPTION = "lzop is a compression utility which is designed to be a companion to gzip. \n\
+It is based on the LZO data compression library and its main advantages over \n\
+gzip are much higher compression and decompression speed at the cost of some \n\
+compression ratio. The lzop compression utility was designed with the goals \n\
+of reliability, speed, portability and with reasonable drop-in compatibility \n\
+to gzip."
+DEPENDS += "lzo"
+PR = "r0"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dfeaf3dc4beef4f5a7bdbc35b197f39e \
+                    file://src/lzop.c;beginline=5;endline=21;md5=6797bd3ed0a1a49327b7ebf9366ebd86"
+
+SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
+           file://acinclude.m4"
+SRC_URI[md5sum] = "006c5e27fb78cdd14a628fdfa5aa1905"
+SRC_URI[sha256sum] = "c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9"
+
+inherit autotools
+
+do_configure () {
+    ln -sf ../acinclude.m4
+    autotools_do_configure
+}
+
+BBCLASSEXTEND += "native nativesdk"
-- 
1.7.6.4



