Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Ua1yS-0001z2-Df
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 12:51:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 03:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,632,1363158000"; d="scan'208";a="330759254"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 03:33:47 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 13:37:24 +0300
Message-Id: <1368009444-29713-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] autogen: upgraded to 5.17.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 10:52:00 -0000

'guile.patch' updated for the new version.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 ...gen-native_5.12.bb => autogen-native_5.17.3.bb} |    6 +-
 meta/recipes-devtools/autogen/files/guile.patch    |   79 +++++++++++---------
 2 files changed, 45 insertions(+), 40 deletions(-)
 rename meta/recipes-devtools/autogen/{autogen-native_5.12.bb => autogen-native_5.17.3.bb} (90%)

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.17.3.bb
similarity index 90%
rename from meta/recipes-devtools/autogen/autogen-native_5.12.bb
rename to meta/recipes-devtools/autogen/autogen-native_5.17.3.bb
index d13af08..b101966 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.12.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.17.3.bb
@@ -11,10 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://guile.patch"
 
-SRC_URI[md5sum] = "6c6671b76021fb30dd43b0d5fdb7180b"
-SRC_URI[sha256sum] = "37e885d6c8a58f33ab198d38bb972fa4c14236f951d628161dde6e20527d0df2"
-
-PR = "r3"
+SRC_URI[md5sum] = "2d14ced1c28f71e61bb7c58e93317a40"
+SRC_URI[sha256sum] = "2f795c224fac899ec3a801a9a32aad2a8104fe926dcc1994cc0797f9a3f4e97d"
 
 DEPENDS = "guile-native libtool-native libxml2-native"
 RDEPENDS = "automake pkgconfig"
diff --git a/meta/recipes-devtools/autogen/files/guile.patch b/meta/recipes-devtools/autogen/files/guile.patch
index f485bba..09b441b 100644
--- a/meta/recipes-devtools/autogen/files/guile.patch
+++ b/meta/recipes-devtools/autogen/files/guile.patch
@@ -4,11 +4,11 @@ version and where guile is installed, and just use pkg-config directly (guile-co
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Upstream-Status: Pending (should be submitted)
 
-Index: a/config/ag_macros.m4
-===================================================================
---- a/config/ag_macros.m4	2012-11-27 14:53:24.336205621 +0000
-+++ b/config/ag_macros.m4	2012-11-27 16:16:42.968271120 +0000
-@@ -163,146 +162,20 @@
+diff --git a/config/ag_macros.m4 b/config/ag_macros.m4
+index c69b11c..915968b 100644
+--- a/config/ag_macros.m4
++++ b/config/ag_macros.m4
+@@ -175,124 +175,12 @@ return 0;],
  
  
  AC_DEFUN([AG_WITHLIB_GUILE],[
@@ -20,7 +20,7 @@ Index: a/config/ag_macros.m4
 -  ) # end of AC_ARG_WITH libguile
 -
 -  if test "${with_libguile+set}" = set && \
--     test "${withval}" = no
+-     test "X${withval}" = Xno
 -  then ## disabled by request
 -    ag_cv_with_libguile_root=no
 -    ag_cv_with_libguile_cflags=no
@@ -29,14 +29,14 @@ Index: a/config/ag_macros.m4
 -
 -  AC_ARG_WITH([libguile-cflags],
 -    AS_HELP_STRING([--with-libguile-cflags], [libguile compile flags]),
--    [ag_cv_with_libguile_cflags=${with_guile_cflags}],
+-    [ag_cv_with_libguile_cflags=${with_libguile_cflags}],
 -    AC_CACHE_CHECK([whether with-libguile-cflags was specified], ag_cv_with_libguile_cflags,
 -      ag_cv_with_libguile_cflags=no)
 -  ) # end of AC_ARG_WITH libguile-cflags
 -
 -  AC_ARG_WITH([libguile-libs],
 -    AS_HELP_STRING([--with-libguile-libs], [libguile link command arguments]),
--    [ag_cv_with_libguile_libs=${with_guile_libs}],
+-    [ag_cv_with_libguile_libs=${with_libguile_libs}],
 -    AC_CACHE_CHECK([whether with-libguile-libs was specified], ag_cv_with_libguile_libs,
 -      ag_cv_with_libguile_libs=no)
 -  ) # end of AC_ARG_WITH libguile-libs
@@ -97,10 +97,8 @@ Index: a/config/ag_macros.m4
 -  SCM bumble = SCM_UNDEFINED;
 -  SCM stumble= SCM_UNDEFINED;
 -  long lstumble;
--  stumble = scm_cons( fumble, bumble );
 -  stumble = scm_display( fumble, bumble );
 -  lstumble = scm_ilength( fumble );
--  /* stumble = scm_c_make_string( 1, SCM_UNDEFINED); */
 -  stumble = scm_c_eval_string( "stumble" );
 -  scm_misc_error( "oops", "bad", bumble );
 -  stumble = scm_num_eq_p( fumble, bumble );
@@ -120,41 +118,62 @@ Index: a/config/ag_macros.m4
 -      case "${LIBGUILE_LIBS}" in *-L* )
 -        LIBGUILE_PATH=`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L[ 	]*//;s/[ 	].*//'`
 -      ;; * ) LIBGUILE_PATH='' ;; esac]
--      CPPFLAGS="@S|@{ag_save_CPPFLAGS}"
--  LIBS="@S|@{ag_save_LIBS}"
+-          CPPFLAGS="@S|@{ag_save_CPPFLAGS}"
+-      LIBS="@S|@{ag_save_LIBS}"
 -  else
 -    CPPFLAGS="${ag_save_CPPFLAGS}"
 -    LIBS="${ag_save_LIBS}"
 -      LIBGUILE_CFLAGS=''
 -      LIBGUILE_LIBS=''
 -      LIBGUILE_PATH=''
--      AC_MSG_ERROR([Cannot find libguile.  libguile is required.])
+-      AC_MSG_ERROR([Cannot find libguile.  libguile is required.  Perhaps you need to install guile-devel?])
 -  fi
 +  PKG_PROG_PKG_CONFIG
 +  PKG_CHECK_MODULES(LIBGUILE, [guile-2.0])
 +  case "${LIBGUILE_LIBS}" in *-L* )
-+    LIBGUILE_PATH=`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L[ 	]*//;s/[ 	].*//'`
++    LIBGUILE_PATH=`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L[   ]*//;s/[  ].*//'`
 +  ;; * ) LIBGUILE_PATH='' ;; esac
    AC_SUBST([AG_GUILE])
--  
+-
  ]) # end of AC_DEFUN of AG_WITHLIB_GUILE
  
  
+@@ -312,40 +200,10 @@ AC_DEFUN([AG_WITHCONF_GUILE_VER],[
+ 
+ 
  AC_DEFUN([AG_TEST_GUILE_VERSION],[
 -  AC_MSG_CHECKING([whether the guile version])
 +  PKG_PROG_PKG_CONFIG
 +  AC_MSG_CHECKING([the guile version])
    AC_CACHE_VAL([ag_cv_test_guile_version],[
 -    ag_cv_test_guile_version=`exec 2> /dev/null
--pkginfo=\`dpkg --list 2>/dev/null | egrep 'guile-[0-9.]-dev'\`
--if test -n "${pkginfo}"
--then echo ${pkginfo} | sed -e 's/.*guile-//' -e 's/-dev.*//'
--else
--  v=\`( guile-config --version 2>&1 ) | sed 's/.*Guile version *//'\`
--  test -z "${v}" && v=\`guile --version | sed 's/.*Guile *//;1q'\`
--  test -z "${v}" && exit 1
--  echo ${v}
--fi`
+-v=\`guile-config --version 2>&1\`
+-test -n "${v}" && {
+-  echo "${v}" | sed 's/.*Guile version *//'
+-  exit 0
+-}
+-v=\`guile --version\`
+-test -n "${v}" && {
+-  echo "${v}" | sed 's/.*Guile *//;1q'
+-  exit 0
+-}
+-v=\`rpm -q --list guile-devel 2>/dev/null | \\
+-        grep '/version\\.h' | \\
+-        head -1\`
+-test -n "${v}" && {
+-  v=\`awk '/^#define SCM_M/{print $2 "=" $3}' $v\`
+-  eval "$v"
+-  test "X$SCM_MICRO_VERSION" = X || \\
+-    SCM_MINOR_VERSION=$SCM_MINOR_VERSION.$SCM_MICRO_VERSION
+-  echo "$SCM_MAJOR_VERSION.$SCM_MINOR_VERSION"
+-  exit 0
+-}
+-v=\`dpkg --list 2>/dev/null | egrep 'guile-[0-9.]*-dev' | head -1\`
+-test -n "${v}" && {
+-  echo "${v}" | sed 's/.*guile-//;s/-dev.*//'
+-  exit 0
+-}
+-exit 1`
 -    if test $? -ne 0 || test -z "$ag_cv_test_guile_version"
 -    then ag_cv_test_guile_version=no
 -    fi
@@ -163,15 +182,3 @@ Index: a/config/ag_macros.m4
    AC_MSG_RESULT([${ag_cv_test_guile_version}])
    if test "X${ag_cv_test_guile_version}" != Xno
    then
-@@ -324,9 +197,9 @@
-   AC_MSG_CHECKING([whether scm_primitive_eval_x links])
-   AC_CACHE_VAL([ag_cv_link_eval_string],[
-     ag_save_CPPFLAGS="${CPPFLAGS}"
--    CPPFLAGS="${ag_cv_with_libguile_cflags} ${CPPFLAGS}"
-+    CPPFLAGS="${LIBGUILE_CFLAGS} ${CPPFLAGS}"
-     ag_save_LIBS="${LIBS}"
--    LIBS="${ag_cv_with_libguile_libs} ${LIBS}"
-+    LIBS="${LIBGUILE_LIBS} ${LIBS}"
-   AC_TRY_LINK([@%:@include <libguile.h>],
-     [SCM res = scm_primitive_eval_x( SCM_UNDEFINED );],
-     [ag_cv_link_eval_string=yes],[ag_cv_link_eval_string=no]
-- 
1.7.10.4



