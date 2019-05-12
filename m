Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6057E102
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:18:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4C8HmIP008560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 01:17:58 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 12 May 2019 01:17:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2019 16:16:27 +0800
Message-ID: <a9c3abc462dc109a31dfeea79eca8a6058eda23f.1557628550.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557628550.git.hongxu.jia@windriver.com>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] subversion: upgrade 1.11.1 -> 1.12.0
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
X-List-Received-Date: Sun, 12 May 2019 08:18:23 -0000
Content-Type: text/plain

- Backport a patch to fix build failure while APR 1.7.0
...
checking for apr_int64_t Python/C API format string...
configure: error: failed to recognize APR_INT64_T_FMT on this platform
...

- Rebase disable_macos.patch and serfmacro.patch

License-update: no change, declare two new added file
* in build/ac-macros/ax_boost_base.m4
* in build/ac-macros/ax_boost_unit_test_framework.m4

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../subversion/subversion/disable_macos.patch      |  45 +++++----
 .../subversion/subversion/serfmacro.patch          |  27 ++++--
 .../subversion-1.12.0-apr_1.7.0_fix-1.patch        | 107 +++++++++++++++++++++
 .../{subversion_1.11.1.bb => subversion_1.12.0.bb} |   7 +-
 4 files changed, 153 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch
 rename meta/recipes-devtools/subversion/{subversion_1.11.1.bb => subversion_1.12.0.bb} (92%)

diff --git a/meta/recipes-devtools/subversion/subversion/disable_macos.patch b/meta/recipes-devtools/subversion/subversion/disable_macos.patch
index ec3be49..8d2d635 100644
--- a/meta/recipes-devtools/subversion/subversion/disable_macos.patch
+++ b/meta/recipes-devtools/subversion/subversion/disable_macos.patch
@@ -1,15 +1,25 @@
-These tests don't work in cross compiling, just disable them for now, we don't
-build subversion on OS-X at this time.
+From 9c350c037ca3489dbeece6ecc2d7e2e5dbb177e9 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 11 May 2019 15:21:46 +0800
+Subject: [PATCH] These tests don't work in cross compiling, just disable them
+ for now, we don't build subversion on OS-X at this time.
 
 RP 1014/7/16
 
 Upstream-Status: Pending [needs a rewrite to support a cache value]
 
-Index: subversion-1.8.9/build/ac-macros/macosx.m4
-===================================================================
---- subversion-1.8.9.orig/build/ac-macros/macosx.m4	2012-11-26 03:04:27.000000000 +0000
-+++ subversion-1.8.9/build/ac-macros/macosx.m4	2014-07-16 12:28:58.357300403 +0000
-@@ -24,21 +24,7 @@
+Rebase to 1.12.0
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ build/ac-macros/macosx.m4 | 31 +------------------------------
+ 1 file changed, 1 insertion(+), 30 deletions(-)
+
+diff --git a/build/ac-macros/macosx.m4 b/build/ac-macros/macosx.m4
+index 92fa58e..a568e1c 100644
+--- a/build/ac-macros/macosx.m4
++++ b/build/ac-macros/macosx.m4
+@@ -24,21 +24,7 @@ dnl Check for _dyld_image_name and _dyld_image_header availability
  AC_DEFUN(SVN_LIB_MACHO_ITERATE,
  [
    AC_MSG_CHECKING([for Mach-O dynamic module iteration functions])
@@ -31,7 +41,7 @@ Index: subversion-1.8.9/build/ac-macros/macosx.m4
  ])
  
  dnl SVN_LIB_MACOS_PLIST
-@@ -46,34 +32,7 @@
+@@ -46,23 +32,8 @@ dnl Assign variables for Mac OS property list support
  AC_DEFUN(SVN_LIB_MACOS_PLIST,
  [
    AC_MSG_CHECKING([for Mac OS property list utilities])
@@ -44,25 +54,18 @@ Index: subversion-1.8.9/build/ac-macros/macosx.m4
 -    #error ProperyList API unavailable.
 -    #endif
 -  ]],[[]])],[
--    dnl ### Hack.  We should only need to pass the -framework options when
--    dnl linking libsvn_subr, since it is the only library that uses Keychain.
--    dnl
--    dnl Unfortunately, libtool 1.5.x doesn't track transitive dependencies for
--    dnl OS X frameworks like it does for normal libraries, so we need to
--    dnl explicitly pass the option to all the users of libsvn_subr to allow
--    dnl static builds to link successfully.
--    dnl
--    dnl This does mean that all executables we link will be linked directly
--    dnl to these frameworks - even when building shared libraries - but that
--    dnl shouldn't cause any problems.
--
--    LIBS="$LIBS -framework CoreFoundation"
+-    SVN_MACOS_PLIST_LIBS="-framework CoreFoundation"
+-    AC_SUBST(SVN_MACOS_PLIST_LIBS)
 -    AC_DEFINE([SVN_HAVE_MACOS_PLIST], [1],
 -              [Is Mac OS property list API available?])
 -    AC_MSG_RESULT([yes])
 -  ],[
++  AC_SUBST([SVN_MACOS_PLIST_LIBS], [""])
      AC_MSG_RESULT([no])
 -  ])
  ])
  
  dnl SVN_LIB_MACOS_KEYCHAIN
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/subversion/subversion/serfmacro.patch b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
index 9a45cb9..507de0f 100644
--- a/meta/recipes-devtools/subversion/subversion/serfmacro.patch
+++ b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
@@ -1,22 +1,31 @@
-The existing sed expression can match expressions like 
---sysroot=/some/path/xxx-linux/ which clearly isn't intended and 
-injects incorrect paths into LDFLAGS.
+The existing sed expression can match expressions like
+--sysroot=/some/path/xxx-linux/ which clearly isn't intended and injects
+incorrect paths into LDFLAGS.
 
 Fix this in the same way we address the problem in CFLAGS.
 
 RP 2016/12/7
 Upstream-Status: Pending
 
-Index: subversion-1.9.4/build/ac-macros/serf.m4
-===================================================================
---- subversion-1.9.4.orig/build/ac-macros/serf.m4
-+++ subversion-1.9.4/build/ac-macros/serf.m4
+Rebase 1.12.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ build/ac-macros/serf.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/ac-macros/serf.m4 b/build/ac-macros/serf.m4
+index 0a549b3..3a069ac 100644
+--- a/build/ac-macros/serf.m4
++++ b/build/ac-macros/serf.m4
 @@ -171,7 +171,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
-           SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_pc_arg --cflags | $SED -e 's/ -D[^ ]*//g' -e 's/^-D[^ ]*//g'`]
-           SVN_SERF_LIBS=`$PKG_CONFIG $serf_pc_arg --libs-only-l` 
+           SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_pc_arg --cflags-only-I`]
+           SVN_SERF_LIBS=[`$PKG_CONFIG $serf_pc_arg --libs-only-l`]
            dnl don't use --libs-only-L because then we might miss some options
 -          LDFLAGS=["$LDFLAGS `$PKG_CONFIG $serf_pc_arg --libs | $SED -e 's/-l[^ ]*//g'`"]
 +          LDFLAGS=["$LDFLAGS `$PKG_CONFIG $serf_pc_arg --libs | $SED -e 's/ -l[^ ]*//g' -e 's/^-l[^ ]*//g'`"]
            break
          else
            AC_MSG_RESULT([no])
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch b/meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch
new file mode 100644
index 0000000..f0edd5f
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch
@@ -0,0 +1,107 @@
+From b147803553237654f8268e831dee8fed4989ad3b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 11 May 2019 14:46:39 +0800
+Subject: [PATCH] Submitted By: Pierre Labastie (pierre dot labastie at neuf
+ dot fr) Date: 2019-04-17 Initial Package Version: 1.11.1 Origin: Upstream
+ revision 1857391 Upstream Status: Committed Description: Get rid of
+ apr_int64_t format string check in swig py configure.
+
+This check relied on APR implementation details and broke with APR 1.7.0.
+Rather than trying to guess a perfect format string to use, just use the
+largest possible format and cast the argument accordingly.
+
+Should fix build against APR 1.7.0 and later.
+
+Suggested by: brane
+
+* build/ac-macros/swig.m4: Remove code related to SVN_APR_INT64_T_PYCFMT.
+
+* subversion/bindings/swig/python/libsvn_swig_py/swigutil_py.c
+  (svn_swig_py_client_blame_receiver_func): Stop relying on the
+   SVN_APR_INT64_T_PYCFMT constant from configure. Use "L" and
+   acast to PY_LONG_LONG instead.
+
+Upstream-Status: Backport [www.linuxfromscratch.org/patches/blfs/svn/subversion-1.12.0-apr_1.7.0_fix-1.patch]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ build/ac-macros/swig.m4                            | 35 ----------------------
+ .../swig/python/libsvn_swig_py/swigutil_py.c       |  9 +++---
+ 2 files changed, 4 insertions(+), 40 deletions(-)
+
+diff --git a/build/ac-macros/swig.m4 b/build/ac-macros/swig.m4
+index 55501fb..2963872 100644
+--- a/build/ac-macros/swig.m4
++++ b/build/ac-macros/swig.m4
+@@ -128,41 +128,6 @@ AC_DEFUN(SVN_FIND_SWIG,
+       ac_cv_python_libs="`$PYTHON ${abs_srcdir}/build/get-py-info.py --libs`"
+     ])
+     SWIG_PY_LIBS="`SVN_REMOVE_STANDARD_LIB_DIRS($ac_cv_python_libs)`"
+-
+-    dnl Sun Forte adds an extra space before substituting APR_INT64_T_FMT
+-    dnl gcc-2.95 adds an extra space after substituting APR_INT64_T_FMT
+-    dnl thus the egrep patterns have a + in them.
+-    SVN_PYCFMT_SAVE_CPPFLAGS="$CPPFLAGS"
+-    CPPFLAGS="$CPPFLAGS $SVN_APR_INCLUDES"
+-    AC_CACHE_CHECK([for apr_int64_t Python/C API format string],
+-                   [svn_cv_pycfmt_apr_int64_t], [
+-      if test "x$svn_cv_pycfmt_apr_int64_t" = "x"; then
+-        AC_EGREP_CPP([MaTcHtHiS +\"lld\" +EnDeNd],
+-                     [#include <apr.h>
+-                      MaTcHtHiS APR_INT64_T_FMT EnDeNd],
+-                     [svn_cv_pycfmt_apr_int64_t="L"])
+-      fi
+-      if test "x$svn_cv_pycfmt_apr_int64_t" = "x"; then
+-        AC_EGREP_CPP([MaTcHtHiS +\"ld\" +EnDeNd],r
+-                     [#include <apr.h>
+-                      MaTcHtHiS APR_INT64_T_FMT EnDeNd],
+-                     [svn_cv_pycfmt_apr_int64_t="l"])
+-      fi
+-      if test "x$svn_cv_pycfmt_apr_int64_t" = "x"; then
+-        AC_EGREP_CPP([MaTcHtHiS +\"d\" +EnDeNd],
+-                     [#include <apr.h>
+-                      MaTcHtHiS APR_INT64_T_FMT EnDeNd],
+-                     [svn_cv_pycfmt_apr_int64_t="i"])
+-      fi
+-    ])
+-    CPPFLAGS="$SVN_PYCFMT_SAVE_CPPFLAGS"
+-    if test "x$svn_cv_pycfmt_apr_int64_t" = "x"; then
+-      AC_MSG_ERROR([failed to recognize APR_INT64_T_FMT on this platform])
+-    fi
+-    AC_DEFINE_UNQUOTED([SVN_APR_INT64_T_PYCFMT],
+-                       ["$svn_cv_pycfmt_apr_int64_t"],
+-                       [Define to the Python/C API format character suitable]
+-                       [ for apr_int64_t])
+   fi
+ 
+   if test "$PERL" != "none"; then
+diff --git a/subversion/bindings/swig/python/libsvn_swig_py/swigutil_py.c b/subversion/bindings/swig/python/libsvn_swig_py/swigutil_py.c
+index 2c90a6a..abe5a2a 100644
+--- a/subversion/bindings/swig/python/libsvn_swig_py/swigutil_py.c
++++ b/subversion/bindings/swig/python/libsvn_swig_py/swigutil_py.c
+@@ -46,7 +46,7 @@
+ #include "svn_mergeinfo.h"
+ #include "svn_types.h"
+ 
+-#include "svn_private_config.h" /* for SVN_APR_INT64_T_PYCFMT */
++#include "svn_private_config.h"
+ 
+ #include "swig_python_external_runtime.swg"
+ #include "swigutil_py.h"
+@@ -3394,10 +3394,9 @@ svn_error_t *svn_swig_py_client_blame_receiver_func(void *baton,
+   svn_swig_py_acquire_py_lock();
+ 
+   if ((result = PyObject_CallFunction(receiver,
+-                                      (char *)
+-                                      (SVN_APR_INT64_T_PYCFMT "lsssO&"),
+-                                      line_no, revision, author, date, line,
+-                                      make_ob_pool, pool)) == NULL)
++                                      (char *)"LlsssO&",
++                                      (PY_LONG_LONG)line_no, revision, author,
++                                      date, line, make_ob_pool, pool)) == NULL)
+     {
+       err = callback_exception_error();
+     }
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/subversion/subversion_1.11.1.bb b/meta/recipes-devtools/subversion/subversion_1.12.0.bb
similarity index 92%
rename from meta/recipes-devtools/subversion/subversion_1.11.1.bb
rename to meta/recipes-devtools/subversion/subversion_1.12.0.bb
index 8abac74..f059ff9 100644
--- a/meta/recipes-devtools/subversion/subversion_1.11.1.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.12.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Subversion (svn) version control system client"
 HOMEPAGE = "http://subversion.apache.org"
 SECTION = "console/network"
 LICENSE = "Apache-2 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=83206f39819e7a4dfca2ff7c190f6ce0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6487ae7094d359fa90fb9c4096e52e2b"
 
 DEPENDS = "apr-util serf sqlite3 file lz4"
 DEPENDS_append_class-native = " file-replacement-native"
@@ -11,10 +11,11 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            file://serfmacro.patch \
+           file://subversion-1.12.0-apr_1.7.0_fix-1.patch \
            "
 
-SRC_URI[md5sum] = "5797bf701d2d868fa964c7bbc4931267"
-SRC_URI[sha256sum] = "9efd2750ca4d72ec903431a24b9c732b6cbb84aad9b7563f59dd96dea5be60bb"
+SRC_URI[md5sum] = "be4f5c0b1b38a5d82bd6d16a16ff1346"
+SRC_URI[sha256sum] = "7fae7c73d8a007c107c0ae5eb372bc0bb013dbfe966fcd5c59cd5a195a5e2edf"
 
 inherit autotools pkgconfig gettext
 
-- 
2.7.4


