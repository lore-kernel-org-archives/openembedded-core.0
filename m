Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD57E7685A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 14:22:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Aug 2015 07:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="745684016"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2015 07:22:21 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:23:19 +0300
Message-Id: <2879a8849fa721c6e4d58a3c479dfb8a537486f9.1439216269.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/8] autogen: update to 5.18.5
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
X-List-Received-Date: Mon, 10 Aug 2015 14:22:24 -0000

Also, drop guile.patch, because the same problem has been fixed
differently in the new upstream release.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...n-native_5.18.4.bb => autogen-native_5.18.5.bb} |   5 +-
 meta/recipes-devtools/autogen/autogen/guile.patch  | 191 ---------------------
 2 files changed, 2 insertions(+), 194 deletions(-)
 rename meta/recipes-devtools/autogen/{autogen-native_5.18.4.bb => autogen-native_5.18.5.bb} (88%)
 delete mode 100644 meta/recipes-devtools/autogen/autogen/guile.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.4.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
similarity index 88%
rename from meta/recipes-devtools/autogen/autogen-native_5.18.4.bb
rename to meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
index 5fd6b7e..2a28512 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.4.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
@@ -9,14 +9,13 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
-           file://guile.patch \
            file://increase-timeout-limit.patch \
            file://mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch \
            file://redirect-output-dir.patch \
 "
 
-SRC_URI[md5sum] = "6f48029cc839303d28496e1609868938"
-SRC_URI[sha256sum] = "3cd9f81a8ae7c6865bb9bbbe16c4307a243a1373d0b315a83571cbba1fff725d"
+SRC_URI[md5sum] = "385d7c7dfbe60babbee261c054923a53"
+SRC_URI[sha256sum] = "7bbdb73b5518baf64c6d3739fb2ecc66d2cccda888ce5ad573abe235ab5d96ba"
 
 DEPENDS = "guile-native libtool-native libxml2-native"
 
diff --git a/meta/recipes-devtools/autogen/autogen/guile.patch b/meta/recipes-devtools/autogen/autogen/guile.patch
deleted file mode 100644
index 332e5aa..0000000
--- a/meta/recipes-devtools/autogen/autogen/guile.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-remove dpkg and guile-config
-
-Disable the autoconf macros that use dpkg (!) and guile-config to
-determine what version and where guile is installed, and just use
-pkg-config directly (guile-config is a deprecated wrapper around
-pkg-config).
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Uprade to  5.18.2
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Upstream-Status: Pending [should be submitted]
----
- config/ag_macros.m4 | 151 +++-------------------------------------------------
- 1 file changed, 8 insertions(+), 143 deletions(-)
-
-diff --git a/config/ag_macros.m4 b/config/ag_macros.m4
-index c05073e..a8e96da 100644
---- a/config/ag_macros.m4
-+++ b/config/ag_macros.m4
-@@ -180,118 +180,13 @@ return 0;],
- 
- 
- AC_DEFUN([AG_WITHLIB_GUILE],[
--  AC_ARG_WITH([libguile],
--    AS_HELP_STRING([--with-libguile], [libguile installation prefix]),
--    [ag_cv_with_libguile_root=${with_libguile}],
--    AC_CACHE_CHECK([whether with-libguile was specified], ag_cv_with_libguile_root,
--      ag_cv_with_libguile_root=no)
--  ) # end of AC_ARG_WITH libguile
--
--  if test "${with_libguile+set}" = set && \
--     test "X${withval}" = Xno
--  then ## disabled by request
--    ag_cv_with_libguile_root=no
--    ag_cv_with_libguile_cflags=no
--    ag_cv_with_libguile_libs=no
--  else
-+  PKG_PROG_PKG_CONFIG
-+  PKG_CHECK_MODULES(LIBGUILE, [guile-2.0])
-+  case "${LIBGUILE_LIBS}" in *-L* )
-+    LIBGUILE_PATH=`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L[   ]*//;s/[  ].*//'`
-+  ;; * ) LIBGUILE_PATH='' ;; esac
- 
--  AC_ARG_WITH([libguile-cflags],
--    AS_HELP_STRING([--with-libguile-cflags], [libguile compile flags]),
--    [ag_cv_with_libguile_cflags=${with_libguile_cflags}],
--    AC_CACHE_CHECK([whether with-libguile-cflags was specified], ag_cv_with_libguile_cflags,
--      ag_cv_with_libguile_cflags=no)
--  ) # end of AC_ARG_WITH libguile-cflags
--
--  AC_ARG_WITH([libguile-libs],
--    AS_HELP_STRING([--with-libguile-libs], [libguile link command arguments]),
--    [ag_cv_with_libguile_libs=${with_libguile_libs}],
--    AC_CACHE_CHECK([whether with-libguile-libs was specified], ag_cv_with_libguile_libs,
--      ag_cv_with_libguile_libs=no)
--  ) # end of AC_ARG_WITH libguile-libs
--
--  case "X${ag_cv_with_libguile_cflags}" in
--  Xyes|Xno|X )
--    case "X${ag_cv_with_libguile_root}" in
--    Xyes|Xno|X ) ag_cv_with_libguile_cflags=no ;;
--    * )        ag_cv_with_libguile_cflags=-I${ag_cv_with_libguile_root}/include ;;
--    esac
--  esac
--  case "X${ag_cv_with_libguile_libs}" in
--  Xyes|Xno|X )
--    case "X${ag_cv_with_libguile_root}" in
--    Xyes|Xno|X ) ag_cv_with_libguile_libs=no ;;
--    * )        ag_cv_with_libguile_libs="-L${ag_cv_with_libguile_root}/lib -lguile";;
--    esac
--  esac
--  ag_save_CPPFLAGS="${CPPFLAGS}"
--  ag_save_LIBS="${LIBS}"
--  case "X${ag_cv_with_libguile_cflags}" in
--  Xyes|Xno|X )
--    f=`guile-config compile 2>/dev/null` || f=''
--    test -n "${f}" && ag_cv_with_libguile_cflags="${f}" && \
--      AC_MSG_NOTICE([guile-config used for CFLAGS: $f]) ;;
--  esac
--  case "X${ag_cv_with_libguile_libs}" in
--  Xyes|Xno|X )
--    f=`guile-config link 2>/dev/null` || f=''
--    test -n "${f}" && ag_cv_with_libguile_libs="${f}" && \
--      AC_MSG_NOTICE([guile-config used for LIBS: $f]) ;;
--  esac
--  case "X${ag_cv_with_libguile_cflags}" in
--  Xyes|Xno|X )
--    ag_cv_with_libguile_cflags="" ;;
--  * ) CPPFLAGS="${CPPFLAGS} ${ag_cv_with_libguile_cflags}" ;;
--  esac
--  case "X${ag_cv_with_libguile_libs}" in
--  Xyes|Xno|X )
--    LIBS="${LIBS} -lguile"
--    ag_cv_with_libguile_libs="-lguile" ;;
--  * )
--    LIBS="${LIBS} ${ag_cv_with_libguile_libs}" ;;
--  esac
--  LIBGUILE_CFLAGS=""
--  LIBGUILE_LIBS=""
--  AC_MSG_CHECKING([whether libguile can be linked with])
--  AC_CACHE_VAL([ag_cv_with_libguile],[
--  AC_LINK_IFELSE(
--    [AC_LANG_SOURCE([[@%:@include <libguile.h>
--@%:@if ((SCM_MAJOR_VERSION * 100) + SCM_MINOR_VERSION) > 200
--This has not been tested with Guile 2.1.  Remove this line to proceed.
--@%:@endif
--int main () {
--  SCM fumble = SCM_UNDEFINED;
--  SCM bumble = SCM_UNDEFINED;
--  SCM stumble= SCM_UNDEFINED;
--  long lstumble;
--  stumble = scm_display( fumble, bumble );
--  lstumble = scm_ilength( fumble );
--  stumble = scm_c_eval_string( "stumble" );
--  scm_misc_error( "oops", "bad", bumble );
--  stumble = scm_num_eq_p( fumble, bumble );
--  scm_wrong_type_arg( "oops", 1, bumble );
--  return 0; }]])],
--    [ag_cv_with_libguile=yes],
--    [ag_cv_with_libguile=no]) # end of AC_LINK_IFELSE 
--  ]) # end of AC_CACHE_VAL for ag_cv_with_libguile
--  fi ## disabled by request
--  AC_MSG_RESULT([${ag_cv_with_libguile}])
--    AC_SUBST([LIBGUILE_CFLAGS])
--    AC_SUBST([LIBGUILE_LIBS])
--  if test "X${ag_cv_with_libguile}" != Xno
--  then[
--      LIBGUILE_CFLAGS="${ag_cv_with_libguile_cflags}"
--      LIBGUILE_LIBS="${ag_cv_with_libguile_libs}"]
--          CPPFLAGS="@S|@{ag_save_CPPFLAGS}"
--      LIBS="@S|@{ag_save_LIBS}"
--  else
--    CPPFLAGS="${ag_save_CPPFLAGS}"
--    LIBS="${ag_save_LIBS}"
--      LIBGUILE_CFLAGS=''
--      LIBGUILE_LIBS=''
--      AC_MSG_ERROR([Cannot find libguile.  libguile is required.  Perhaps you need to install guile-devel?])
--  fi
-   AC_SUBST([AG_GUILE])
--
- ]) # end of AC_DEFUN of AG_WITHLIB_GUILE
- 
- 
-@@ -311,40 +206,10 @@ AC_DEFUN([AG_WITHCONF_GUILE_VER],[
- 
- 
- AC_DEFUN([AG_TEST_GUILE_VERSION],[
--  AC_MSG_CHECKING([whether the guile version])
-+  PKG_PROG_PKG_CONFIG
-+  AC_MSG_CHECKING([the guile version])
-   AC_CACHE_VAL([ag_cv_test_guile_version],[
--    ag_cv_test_guile_version=`exec 2> /dev/null
--v=\`guile-config --version 2>&1\`
--test -n "${v}" && {
--  echo "${v}" | sed 's/.*Guile version *//'
--  exit 0
--}
--v=\`guile --version\`
--test -n "${v}" && {
--  echo "${v}" | sed 's/.*Guile *//;1q'
--  exit 0
--}
--v=\`rpm -q --list guile-devel 2>/dev/null | \\
--        grep '/version\\.h' | \\
--        head -1\`
--test -n "${v}" && {
--  v=\`awk '/^#define SCM_M/{print $2 "=" $3}' $v\`
--  eval "$v"
--  test "X$SCM_MICRO_VERSION" = X || \\
--    SCM_MINOR_VERSION=$SCM_MINOR_VERSION.$SCM_MICRO_VERSION
--  echo "$SCM_MAJOR_VERSION.$SCM_MINOR_VERSION"
--  exit 0
--}
--v=\`dpkg --list 2>/dev/null | egrep 'guile-[0-9.]*-dev' | head -1\`
--test -n "${v}" && {
--  echo "${v}" | sed 's/.*guile-//;s/-dev.*//'
--  exit 0
--}
--exit 1`
--    if test $? -ne 0 || test -z "$ag_cv_test_guile_version"
--    then ag_cv_test_guile_version=no
--    fi
--  ]) # end of CACHE_VAL of ag_cv_test_guile_version
-+    ag_cv_test_guile_version=`exec $PKG_CONFIG --modversion guile-2.0`])
-   AC_MSG_RESULT([${ag_cv_test_guile_version}])
-   if test "X${ag_cv_test_guile_version}" != Xno
-   then
--- 
-1.8.3.1
-
-- 
2.1.4


