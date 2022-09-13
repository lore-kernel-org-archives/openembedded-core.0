Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 08/16] autoconf: Update K & R stype functions
Date: Tue, 13 Sep 2022 04:17:49 -1000
Message-Id: <0edeb22a8d4f77ece938b1f0e4cc8f06c6265e6c.1663078051.git.steve@sakoman.com>
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Khem Raj <raj.khem@gmail.com>

This replaces the proposed patch with a backport of what got accepted upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3e92b7cb5833f61ff13a66f03be513d97a69894)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ilers-that-moan-about-K-R-func-decls.patch | 138 ++++++++++++++++++
 ...totype-for-functions-with-no-paramet.patch |  64 --------
 .../autoconf/autoconf_2.71.bb                 |   2 +-
 3 files changed, 139 insertions(+), 65 deletions(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-specify-void-prototype-for-functions-with-no-paramet.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch b/meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch
new file mode 100644
index 0000000000..4f15bf96c3
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch
@@ -0,0 +1,138 @@
+From 7a3bbca81b803ba116b83c82de378e840cc35f81 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 1 Sep 2022 16:19:50 -0500
+Subject: [PATCH] Port to compilers that moan about K&R func decls
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* lib/autoconf/c.m4 (AC_LANG_CALL, AC_LANG_FUNC_LINK_TRY):
+Use '(void)' rather than '()' in function prototypes, as the latter
+provokes fatal errors in some compilers nowadays.
+* lib/autoconf/functions.m4 (AC_FUNC_STRTOD):
+* tests/fortran.at (AC_F77_DUMMY_MAIN usage):
+* tests/semantics.at (AC_CHECK_DECLS):
+Don’t use () in a function decl.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=8b5e2016c7ed2d67f31b03a3d2e361858ff5299b]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ doc/autoconf.texi         | 7 +++----
+ lib/autoconf/c.m4         | 6 +++---
+ lib/autoconf/functions.m4 | 3 ---
+ tests/fortran.at          | 8 ++++----
+ tests/semantics.at        | 2 +-
+ 5 files changed, 11 insertions(+), 15 deletions(-)
+
+--- a/doc/autoconf.texi
++++ b/doc/autoconf.texi
+@@ -5465,9 +5465,7 @@ the @samp{#undef malloc}):
+ #include <config.h>
+ #undef malloc
+ 
+-#include <sys/types.h>
+-
+-void *malloc ();
++#include <stdlib.h>
+ 
+ /* Allocate an N-byte block of memory from the heap.
+    If N is zero, allocate a 1-byte block.  */
+@@ -8295,7 +8293,7 @@ needed:
+ #  ifdef __cplusplus
+      extern "C"
+ #  endif
+-   int F77_DUMMY_MAIN () @{ return 1; @}
++   int F77_DUMMY_MAIN (void) @{ return 1; @}
+ #endif
+ @end example
+ 
+--- a/lib/autoconf/c.m4
++++ b/lib/autoconf/c.m4
+@@ -127,7 +127,7 @@ m4_if([$2], [main], ,
+ [/* Override any GCC internal prototype to avoid an error.
+    Use char because int might match the return type of a GCC
+    builtin and then its argument prototype would still apply.  */
+-char $2 ();])], [return $2 ();])])
++char $2 (void);])], [return $2 ();])])
+ 
+ 
+ # AC_LANG_FUNC_LINK_TRY(C)(FUNCTION)
+@@ -151,7 +151,7 @@ m4_define([AC_LANG_FUNC_LINK_TRY(C)],
+ #define $1 innocuous_$1
+ 
+ /* System header to define __stub macros and hopefully few prototypes,
+-   which can conflict with char $1 (); below.  */
++   which can conflict with char $1 (void); below.  */
+ 
+ #include <limits.h>
+ #undef $1
+@@ -162,7 +162,7 @@ m4_define([AC_LANG_FUNC_LINK_TRY(C)],
+ #ifdef __cplusplus
+ extern "C"
+ #endif
+-char $1 ();
++char $1 (void);
+ /* The GNU C library defines this for functions which it implements
+     to always fail with ENOSYS.  Some functions are actually named
+     something starting with __ and the normal name is an alias.  */
+--- a/lib/autoconf/functions.m4
++++ b/lib/autoconf/functions.m4
+@@ -1601,9 +1601,6 @@ AC_DEFUN([AC_FUNC_STRTOD],
+ AC_CACHE_CHECK(for working strtod, ac_cv_func_strtod,
+ [AC_RUN_IFELSE([AC_LANG_SOURCE([[
+ ]AC_INCLUDES_DEFAULT[
+-#ifndef strtod
+-double strtod ();
+-#endif
+ int
+ main (void)
+ {
+--- a/tests/fortran.at
++++ b/tests/fortran.at
+@@ -233,7 +233,7 @@ void FOOBAR_F77 (double *x, double *y);
+ #  ifdef __cplusplus
+      extern "C"
+ #  endif
+-   int F77_DUMMY_MAIN () { return 1; }
++   int F77_DUMMY_MAIN (void) { return 1; }
+ #endif
+ 
+ int main(int argc, char *argv[])
+@@ -315,7 +315,7 @@ void FOOBAR_FC(double *x, double *y);
+ #  ifdef __cplusplus
+      extern "C"
+ #  endif
+-   int FC_DUMMY_MAIN () { return 1; }
++   int FC_DUMMY_MAIN (void) { return 1; }
+ #endif
+ 
+ int main (int argc, char *argv[])
+@@ -561,7 +561,7 @@ void @foobar@ (int *x);
+ #  ifdef __cplusplus
+      extern "C"
+ #  endif
+-   int F77_DUMMY_MAIN () { return 1; }
++   int F77_DUMMY_MAIN (void) { return 1; }
+ #endif
+ 
+ int main(int argc, char *argv[])
+@@ -637,7 +637,7 @@ void @foobar@ (int *x);
+ #  ifdef __cplusplus
+      extern "C"
+ #  endif
+-   int FC_DUMMY_MAIN () { return 1; }
++   int FC_DUMMY_MAIN (void) { return 1; }
+ #endif
+ 
+ int main(int argc, char *argv[])
+--- a/tests/semantics.at
++++ b/tests/semantics.at
+@@ -207,7 +207,7 @@ AT_CHECK_MACRO([AC_CHECK_DECLS],
+ 		 [[extern int yes;
+ 		   enum { myenum };
+ 		   extern struct mystruct_s { int x[20]; } mystruct;
+-		   extern int myfunc();
++		   extern int myfunc (int);
+ 		   #define mymacro1(arg) arg
+ 		   #define mymacro2]])
+   # Ensure we can detect missing declarations of functions whose
diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-specify-void-prototype-for-functions-with-no-paramet.patch b/meta/recipes-devtools/autoconf/autoconf/0001-specify-void-prototype-for-functions-with-no-paramet.patch
deleted file mode 100644
index 4d8aa296cd..0000000000
--- a/meta/recipes-devtools/autoconf/autoconf/0001-specify-void-prototype-for-functions-with-no-paramet.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7ccfea413216bddd988823acf4e93421ea0f7f9f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 16 Aug 2022 18:35:45 -0700
-Subject: [PATCH] specify void prototype for functions with no parameters
-
-Compilers defaulting to C99 flag such functions as warning which fails
-to compile when using -Werror
-
-Fixes
-error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/autoconf-patches/2022-08/msg00003.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/autoconf/c.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/lib/autoconf/c.m4
-+++ b/lib/autoconf/c.m4
-@@ -127,7 +127,7 @@ m4_if([$2], [main], ,
- [/* Override any GCC internal prototype to avoid an error.
-    Use char because int might match the return type of a GCC
-    builtin and then its argument prototype would still apply.  */
--char $2 ();])], [return $2 ();])])
-+char $2 (void);])], [return $2 ();])])
- 
- 
- # AC_LANG_FUNC_LINK_TRY(C)(FUNCTION)
-@@ -151,7 +151,7 @@ m4_define([AC_LANG_FUNC_LINK_TRY(C)],
- #define $1 innocuous_$1
- 
- /* System header to define __stub macros and hopefully few prototypes,
--   which can conflict with char $1 (); below.  */
-+   which can conflict with char $1 (void); below.  */
- 
- #include <limits.h>
- #undef $1
-@@ -162,7 +162,7 @@ m4_define([AC_LANG_FUNC_LINK_TRY(C)],
- #ifdef __cplusplus
- extern "C"
- #endif
--char $1 ();
-+char $1 (void);
- /* The GNU C library defines this for functions which it implements
-     to always fail with ENOSYS.  Some functions are actually named
-     something starting with __ and the normal name is an alias.  */
-@@ -252,7 +252,7 @@ dnl other built-in extern "C" functions,
- dnl when it actually happens.
- [AC_LANG_PROGRAM([[$1
- namespace conftest {
--  extern "C" int $2 ();
-+  extern "C" int $2 (void);
- }]],
- [[return conftest::$2 ();]])])
- 
-@@ -2457,7 +2457,7 @@ using std::strcmp;
- 
- namespace {
- 
--void test_exception_syntax()
-+void test_exception_syntax(void)
- {
-   try {
-     throw "test";
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.71.bb b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
index 239b268119..97c241a3f5 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.71.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GNU_MIRROR}/autoconf/${BP}.tar.gz \
            file://preferbash.patch \
            file://autotest-automake-result-format.patch \
            file://man-host-perl.patch \
-           file://0001-specify-void-prototype-for-functions-with-no-paramet.patch \
+           file://0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch \
            "
 SRC_URI:append:class-native = " file://no-man.patch"
 
-- 
2.25.1

