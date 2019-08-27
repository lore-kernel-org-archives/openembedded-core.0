Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4F08D7E549
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 05:52:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46HdLB72mKz5k
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566885123;
	bh=MRSURFrMU1yfVhS5mtgTb2i6ckaZJr3JZ4z/SBcPH3Y=;
	h=From:To:Subject:Date:From;
	b=BbPGV5/ms6yu54ThkimrK8VhADw/R18DKQdJMmT+ImuqKKMlRqTNnRrTb7befGIu9
	DuLZqRGEmwqXRXh1tI2zFTyr2S4Ki5C9JUy63Xg6r4CWBuRl1TOOGCIAQzmwrV/bRi
	FUIAR8FrmtsLiTOOUMJdO7mpv4ulbFTXR2el059QuUOjPl31zFa1HRHGVrtv5QdzWL
	iD8L66iBJQUBf9ROhXjfSR491C3wg22JdOJ6d7iOY90rdRA7/hmuWkw+OlaCGzosKz
	YzBR98swEnPMQL8XZpYYk1vyiP5frkjeqhpTPewCvHjHQaSx+gjICoaw5KXcxiG8Dr
	rL24TdX283f0nBlDyM3HwLgSJRy7JPRh64cX9c2uYGa9y9C67P+tuVePyrL/bW8g6T
	v9qdd/jbGl6dJuYa7Lw1OAq6xs3mGPKsDx0KfAV6V8GJL5obm1jb+4qBhRDTRoHw3T
	wwhK2m8GJe9pCVA2eBe5CHSPvTKJ/AR+QLN1rsV6oIND/oUxoHrWGewhfvBWe5/LpL
	R5rqfcHZyiIlltQB3xGt0abSo0wsl39hXigrXuzSUFejWB4P50xCeJOFIgBUiTmltl
	tzfb1mSr5nxiKGuKyOVqaALmibW1jCI9H00hQL02i1mR2rV8xibaXWQol/sq1879ye
	BU4rjUycYDUEjM0eSDoWwDdM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 08:51:59 +0300
Message-Id: <20190827055200.3690-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] subversion: Upgrade 1.12.0 -> 1.12.2
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
X-List-Received-Date: Tue, 27 Aug 2019 05:52:02 -0000

Remove backported patch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../subversion-1.12.0-apr_1.7.0_fix-1.patch   | 107 ------------------
 ...version_1.12.0.bb => subversion_1.12.2.bb} |   5 +-
 2 files changed, 2 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch
 rename meta/recipes-devtools/subversion/{subversion_1.12.0.bb => subversion_1.12.2.bb} (94%)

diff --git a/meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch b/meta/recipes-devtools/subversion/subversion/subversion-1.12.0-apr_1.7.0_fix-1.patch
deleted file mode 100644
index f0edd5fe8a..0000000000
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
index f1ac1dcfdc..4ffa1c584e 100644
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
2.17.1


