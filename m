Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A66737F314
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 06:00:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,420,1559491200"; d="scan'208";a="74144558"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Aug 2019 14:00:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AB2394CE042F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 14:00:13 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 23 Aug 2019 14:00:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2019 13:59:41 +0800
Message-ID: <20190823055941.30324-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: AB2394CE042F.A757B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] subversion:upgrade 1.12.0 -> 1.12.2
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
X-List-Received-Date: Fri, 23 Aug 2019 06:00:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch
 Removed since this is included in 1.12.2.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../subversion-1.12.0-apr_1.7.0_fix-1.patch        | 107 ---------------------
 .../{subversion_1.12.0.bb => subversion_1.12.2.bb} |   5 +-
 2 files changed, 2 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch
 rename meta/recipes-devtools/subversion/{subversion_1.12.0.bb => subversion_1.12.2.bb} (94%)

diff --git a/meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch b/meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch
deleted file mode 100644
index f0edd5f..0000000
--- a/meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From b147803553237654f8268e831dee8fed4989ad3b Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 May 2019 14:46:39 +0800
-Subject: [PATCH] Submitted By: Pierre Labastie (pierre dot labastie at neuf
- dot fr) Date: 2019-04-17 Initial Package Version: 1.11.1 Origin: Upstream
- revision 1857391 Upstream Status: Committed Description: Get rid of
- apr_int64_t format string check in swig py configure.
-
-This check relied on APR implementation details and broke with APR 1.7.0.
-Rather than trying to guess a perfect format string to use, just use the
-largest possible format and cast the argument accordingly.
-
-Should fix build against APR 1.7.0 and later.
-
-Suggested by: brane
-
-* build/ac-macros/swig.m4: Remove code related to SVN_APR_INT64_T_PYCFMT.
-
-* subversion/bindings/swig/python/libsvn_swig_py/swigutil_py.c
-  (svn_swig_py_client_blame_receiver_func): Stop relying on the
-   SVN_APR_INT64_T_PYCFMT constant from configure. Use "L" and
-   acast to PY_LONG_LONG instead.
-
-Upstream-Status: Backport [www.linuxfromscratch.org/patches/blfs/svn/subversion-1.12.0-apr_1.7.0_fix-1.patch]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- build/ac-macros/swig.m4                            | 35 ----------------------
- .../swig/python/libsvn_swig_py/swigutil_py.c       |  9 +++---
- 2 files changed, 4 insertions(+), 40 deletions(-)
-
-diff --git a/build/ac-macros/swig.m4 b/build/ac-macros/swig.m4
-index 55501fb..2963872 100644
---- a/build/ac-macros/swig.m4
-+++ b/build/ac-macros/swig.m4
-@@ -128,41 +128,6 @@ AC_DEFUN(SVN_FIND_SWIG,
-       ac_cv_python_libs="`$PYTHON ${abs_srcdir}/build/get-py-info.py --libs`"
-     ])
-     SWIG_PY_LIBS="`SVN_REMOVE_STANDARD_LIB_DIRS($ac_cv_python_libs)`"
--
--    dnl Sun Forte adds an extra space before substituting APR_INT64_T_FMT
--    dnl gcc-2.95 adds an extra space after substituting APR_INT64_T_FMT
--    dnl thus the egrep patterns have a + in them.
--    SVN_PYCFMT_SAVE_CPPFLAGS="$CPPFLAGS"
--    CPPFLAGS="$CPPFLAGS $SVN_APR_INCLUDES"
--    AC_CACHE_CHECK([for apr_int64_t Python/C API format string],
--                   [svn_cv_pycfmt_apr_int64_t], [
--      if test "x$svn_cv_pycfmt_apr_int64_t" = "x"; then
--        AC_EGREP_CPP([MaTcHtHiS +\"lld\" +EnDeNd],
--                     [#include <apr.h>
--                      MaTcHtHiS APR_INT64_T_FMT EnDeNd],
--                     [svn_cv_pycfmt_apr_int64_t="L"])
--      fi
--      if test "x$svn_cv_pycfmt_apr_int64_t" = "x"; then
--        AC_EGREP_CPP([MaTcHtHiS +\"ld\" +EnDeNd],r
--                     [#include <apr.h>
--                      MaTcHtHiS APR_INT64_T_FMT EnDeNd],
--                     [svn_cv_pycfmt_apr_int64_t="l"])
--      fi
--      if test "x$svn_cv_pycfmt_apr_int64_t" = "x"; then
--        AC_EGREP_CPP([MaTcHtHiS +\"d\" +EnDeNd],
--                     [#include <apr.h>
--                      MaTcHtHiS APR_INT64_T_FMT EnDeNd],
--                     [svn_cv_pycfmt_apr_int64_t="i"])
--      fi
--    ])
--    CPPFLAGS="$SVN_PYCFMT_SAVE_CPPFLAGS"
--    if test "x$svn_cv_pycfmt_apr_int64_t" = "x"; then
--      AC_MSG_ERROR([failed to recognize APR_INT64_T_FMT on this platform])
--    fi
--    AC_DEFINE_UNQUOTED([SVN_APR_INT64_T_PYCFMT],
--                       ["$svn_cv_pycfmt_apr_int64_t"],
--                       [Define to the Python/C API format character suitable]
--                       [ for apr_int64_t])
-   fi
- 
-   if test "$PERL" != "none"; then
-diff --git a/subversion/bindings/swig/python/libsvn_swig_py/swigutil_py.c b/subversion/bindings/swig/python/libsvn_swig_py/swigutil_py.c
-index 2c90a6a..abe5a2a 100644
---- a/subversion/bindings/swig/python/libsvn_swig_py/swigutil_py.c
-+++ b/subversion/bindings/swig/python/libsvn_swig_py/swigutil_py.c
-@@ -46,7 +46,7 @@
- #include "svn_mergeinfo.h"
- #include "svn_types.h"
- 
--#include "svn_private_config.h" /* for SVN_APR_INT64_T_PYCFMT */
-+#include "svn_private_config.h"
- 
- #include "swig_python_external_runtime.swg"
- #include "swigutil_py.h"
-@@ -3394,10 +3394,9 @@ svn_error_t *svn_swig_py_client_blame_receiver_func(void *baton,
-   svn_swig_py_acquire_py_lock();
- 
-   if ((result = PyObject_CallFunction(receiver,
--                                      (char *)
--                                      (SVN_APR_INT64_T_PYCFMT "lsssO&"),
--                                      line_no, revision, author, date, line,
--                                      make_ob_pool, pool)) == NULL)
-+                                      (char *)"LlsssO&",
-+                                      (PY_LONG_LONG)line_no, revision, author,
-+                                      date, line, make_ob_pool, pool)) == NULL)
-     {
-       err = callback_exception_error();
-     }
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/subversion/subversion_1.12.0.bb b/meta/recipes-devtools/subversion/subversion_1.12.2.bb
similarity index 94%
rename from meta/recipes-devtools/subversion/subversion_1.12.0.bb
rename to meta/recipes-devtools/subversion/subversion_1.12.2.bb
index f1ac1dc..4ffa1c5 100644
--- a/meta/recipes-devtools/subversion/subversion_1.12.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.12.2.bb
@@ -11,11 +11,10 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            file://serfmacro.patch \
-           file://subversion-1.12.0-apr_1.7.0_fix-1.patch \
            "
 
-SRC_URI[md5sum] = "be4f5c0b1b38a5d82bd6d16a16ff1346"
-SRC_URI[sha256sum] = "7fae7c73d8a007c107c0ae5eb372bc0bb013dbfe966fcd5c59cd5a195a5e2edf"
+SRC_URI[md5sum] = "1ff249f848f834ded88536543e031975"
+SRC_URI[sha256sum] = "3bd0b5c8e4c5175263dc9a92fd9aef94ce917e80af034f26fe5c45fde7e0f771"
 
 inherit autotools pkgconfig gettext
 
-- 
2.7.4




