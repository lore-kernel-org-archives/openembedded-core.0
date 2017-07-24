Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93229783BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 09:47:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6O9lAtC025349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 02:47:10 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 24 Jul 2017 02:47:09 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 17:51:09 +0800
Message-ID: <ccbb9c05cff2aa32ea2677bce15c076ea41acda4.1500889785.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1500889785.git.Qi.Chen@windriver.com>
References: <cover.1500889785.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] diffutils: upgrade to 3.6
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
X-List-Received-Date: Mon, 24 Jul 2017 09:47:09 -0000
Content-Type: text/plain

diffutils-3.5-gcc7.patch is removed as it's merged in this version.

do_configure_prepend is removed to solve the following configure error.

  error: possibly undefined macro: gl_TYPE_WINT_T_PREREQ

A workaround patch is made to fix the following compilation error for glibc.

  error: dereferencing pointer to incomplete type 'const struct rpl_option'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../diffutils-3.5/diffutils-3.5-gcc7.patch         | 228 ---------------------
 ...need_charset_alias-when-building-for-musl.patch |   0
 .../0001-explicitly-disable-replacing-getopt.patch |  30 +++
 .../{diffutils-3.5 => diffutils-3.6}/run-ptest     |   0
 .../{diffutils_3.5.bb => diffutils_3.6.bb}         |  14 +-
 5 files changed, 34 insertions(+), 238 deletions(-)
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.5/diffutils-3.5-gcc7.patch
 rename meta/recipes-extended/diffutils/{diffutils-3.5 => diffutils-3.6}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.6/0001-explicitly-disable-replacing-getopt.patch
 rename meta/recipes-extended/diffutils/{diffutils-3.5 => diffutils-3.6}/run-ptest (100%)
 rename meta/recipes-extended/diffutils/{diffutils_3.5.bb => diffutils_3.6.bb} (66%)

diff --git a/meta/recipes-extended/diffutils/diffutils-3.5/diffutils-3.5-gcc7.patch b/meta/recipes-extended/diffutils/diffutils-3.5/diffutils-3.5-gcc7.patch
deleted file mode 100644
index 52bcd7c..0000000
--- a/meta/recipes-extended/diffutils/diffutils-3.5/diffutils-3.5-gcc7.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-Cumulative Backports from upstream to address gcc 7 portablility issues
-Imported from Fedora
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff -up diffutils-3.5/lib/intprops.h.than diffutils-3.5/lib/intprops.h
---- diffutils-3.5/lib/intprops.h.than	2017-02-21 09:08:39.470417367 -0500
-+++ diffutils-3.5/lib/intprops.h	2017-02-21 09:46:57.090996508 -0500
-@@ -1,6 +1,6 @@
- /* intprops.h -- properties of integer types
- 
--   Copyright (C) 2001-2016 Free Software Foundation, Inc.
-+   Copyright (C) 2001-2017 Free Software Foundation, Inc.
- 
-    This program is free software: you can redistribute it and/or modify it
-    under the terms of the GNU General Public License as published
-@@ -47,12 +47,16 @@
- 
- /* Minimum and maximum values for integer types and expressions.  */
- 
-+/* The width in bits of the integer type or expression T.
-+   Padding bits are not supported; this is checked at compile-time below.  */
-+#define TYPE_WIDTH(t) (sizeof (t) * CHAR_BIT)
-+
- /* The maximum and minimum values for the integer type T.  */
- #define TYPE_MINIMUM(t) ((t) ~ TYPE_MAXIMUM (t))
- #define TYPE_MAXIMUM(t)                                                 \
-   ((t) (! TYPE_SIGNED (t)                                               \
-         ? (t) -1                                                        \
--        : ((((t) 1 << (sizeof (t) * CHAR_BIT - 2)) - 1) * 2 + 1)))
-+        : ((((t) 1 << (TYPE_WIDTH (t) - 2)) - 1) * 2 + 1)))
- 
- /* The maximum and minimum values for the type of the expression E,
-    after integer promotion.  E should not have side effects.  */
-@@ -65,7 +69,13 @@
-    ? _GL_SIGNED_INT_MAXIMUM (e)                                         \
-    : _GL_INT_NEGATE_CONVERT (e, 1))
- #define _GL_SIGNED_INT_MAXIMUM(e)                                       \
--  (((_GL_INT_CONVERT (e, 1) << (sizeof ((e) + 0) * CHAR_BIT - 2)) - 1) * 2 + 1)
-+  (((_GL_INT_CONVERT (e, 1) << (TYPE_WIDTH ((e) + 0) - 2)) - 1) * 2 + 1)
-+
-+/* Work around OpenVMS incompatibility with C99.  */
-+#if !defined LLONG_MAX && defined __INT64_MAX
-+# define LLONG_MAX __INT64_MAX
-+# define LLONG_MIN __INT64_MIN
-+#endif
- 
- /* This include file assumes that signed types are two's complement without
-    padding bits; the above macros have undefined behavior otherwise.
-@@ -84,10 +94,15 @@ verify (TYPE_MAXIMUM (long int) == LONG_
- verify (TYPE_MINIMUM (long long int) == LLONG_MIN);
- verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
- #endif
-+/* Similarly, sanity-check one ISO/IEC TS 18661-1:2014 macro if defined.  */
-+#ifdef UINT_WIDTH
-+verify (TYPE_WIDTH (unsigned int) == UINT_WIDTH);
-+#endif
- 
- /* Does the __typeof__ keyword work?  This could be done by
-    'configure', but for now it's easier to do it by hand.  */
--#if (2 <= __GNUC__ || defined __IBM__TYPEOF__ \
-+#if (2 <= __GNUC__ \
-+     || (1210 <= __IBMC__ && defined __IBM__TYPEOF__) \
-      || (0x5110 <= __SUNPRO_C && !__STDC__))
- # define _GL_HAVE___TYPEOF__ 1
- #else
-@@ -116,8 +131,7 @@ verify (TYPE_MAXIMUM (long long int) ==
-    signed, this macro may overestimate the true bound by one byte when
-    applied to unsigned types of size 2, 4, 16, ... bytes.  */
- #define INT_STRLEN_BOUND(t)                                     \
--  (INT_BITS_STRLEN_BOUND (sizeof (t) * CHAR_BIT                 \
--                          - _GL_SIGNED_TYPE_OR_EXPR (t))        \
-+  (INT_BITS_STRLEN_BOUND (TYPE_WIDTH (t) - _GL_SIGNED_TYPE_OR_EXPR (t)) \
-    + _GL_SIGNED_TYPE_OR_EXPR (t))
- 
- /* Bound on buffer size needed to represent an integer type or expression T,
-@@ -222,20 +236,23 @@ verify (TYPE_MAXIMUM (long long int) ==
-    ? (a) < (min) >> (b)                                 \
-    : (max) >> (b) < (a))
- 
--/* True if __builtin_add_overflow (A, B, P) works when P is null.  */
--#define _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL (7 <= __GNUC__)
-+/* True if __builtin_add_overflow (A, B, P) works when P is non-null.  */
-+#define _GL_HAS_BUILTIN_OVERFLOW (5 <= __GNUC__)
-+
-+/* True if __builtin_add_overflow_p (A, B, C) works.  */
-+#define _GL_HAS_BUILTIN_OVERFLOW_P (7 <= __GNUC__)
- 
- /* The _GL*_OVERFLOW macros have the same restrictions as the
-    *_RANGE_OVERFLOW macros, except that they do not assume that operands
-    (e.g., A and B) have the same type as MIN and MAX.  Instead, they assume
-    that the result (e.g., A + B) has that type.  */
--#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
--# define _GL_ADD_OVERFLOW(a, b, min, max)
--   __builtin_add_overflow (a, b, (__typeof__ ((a) + (b)) *) 0)
--# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)
--   __builtin_sub_overflow (a, b, (__typeof__ ((a) - (b)) *) 0)
--# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)
--   __builtin_mul_overflow (a, b, (__typeof__ ((a) * (b)) *) 0)
-+#if _GL_HAS_BUILTIN_OVERFLOW_P
-+# define _GL_ADD_OVERFLOW(a, b, min, max)                               \
-+   __builtin_add_overflow_p (a, b, (__typeof__ ((a) + (b))) 0)
-+# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)                          \
-+   __builtin_sub_overflow_p (a, b, (__typeof__ ((a) - (b))) 0)
-+# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)                          \
-+   __builtin_mul_overflow_p (a, b, (__typeof__ ((a) * (b))) 0)
- #else
- # define _GL_ADD_OVERFLOW(a, b, min, max)                                \
-    ((min) < 0 ? INT_ADD_RANGE_OVERFLOW (a, b, min, max)                  \
-@@ -315,7 +332,7 @@ verify (TYPE_MAXIMUM (long long int) ==
-   _GL_BINARY_OP_OVERFLOW (a, b, _GL_ADD_OVERFLOW)
- #define INT_SUBTRACT_OVERFLOW(a, b) \
-   _GL_BINARY_OP_OVERFLOW (a, b, _GL_SUBTRACT_OVERFLOW)
--#if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
-+#if _GL_HAS_BUILTIN_OVERFLOW_P
- # define INT_NEGATE_OVERFLOW(a) INT_SUBTRACT_OVERFLOW (0, a)
- #else
- # define INT_NEGATE_OVERFLOW(a) \
-@@ -349,10 +366,6 @@ verify (TYPE_MAXIMUM (long long int) ==
- #define INT_MULTIPLY_WRAPV(a, b, r) \
-   _GL_INT_OP_WRAPV (a, b, r, *, __builtin_mul_overflow, INT_MULTIPLY_OVERFLOW)
- 
--#ifndef __has_builtin
--# define __has_builtin(x) 0
--#endif
--
- /* Nonzero if this compiler has GCC bug 68193 or Clang bug 25390.  See:
-    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68193
-    https://llvm.org/bugs/show_bug.cgi?id=25390
-@@ -369,7 +382,7 @@ verify (TYPE_MAXIMUM (long long int) ==
-    the operation.  BUILTIN is the builtin operation, and OVERFLOW the
-    overflow predicate.  Return 1 if the result overflows.  See above
-    for restrictions.  */
--#if 5 <= __GNUC__ || __has_builtin (__builtin_add_overflow)
-+#if _GL_HAS_BUILTIN_OVERFLOW
- # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) builtin (a, b, r)
- #elif 201112 <= __STDC_VERSION__ && !_GL__GENERIC_BOGUS
- # define _GL_INT_OP_WRAPV(a, b, r, op, builtin, overflow) \
-@@ -412,7 +425,7 @@ verify (TYPE_MAXIMUM (long long int) ==
- # else
- #  define _GL_INT_OP_WRAPV_LONGISH(a, b, r, op, overflow) \
-     _GL_INT_OP_CALC (a, b, r, op, overflow, unsigned long int, \
--                     long int, LONG_MIN, LONG_MAX))
-+                     long int, LONG_MIN, LONG_MAX)
- # endif
- #endif
- 
-diff -up diffutils-3.5/lib/xalloc-oversized.h.than diffutils-3.5/lib/xalloc-oversized.h
---- diffutils-3.5/lib/xalloc-oversized.h.than	2017-02-21 09:45:13.729168233 -0500
-+++ diffutils-3.5/lib/xalloc-oversized.h	2017-02-21 09:45:18.309249247 -0500
-@@ -1,6 +1,6 @@
- /* xalloc-oversized.h -- memory allocation size checking
- 
--   Copyright (C) 1990-2000, 2003-2004, 2006-2016 Free Software Foundation, Inc.
-+   Copyright (C) 1990-2000, 2003-2004, 2006-2017 Free Software Foundation, Inc.
- 
-    This program is free software: you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-@@ -19,48 +19,37 @@
- #define XALLOC_OVERSIZED_H_
- 
- #include <stddef.h>
-+#include <stdint.h>
- 
--/* Default for (non-Clang) compilers that lack __has_builtin.  */
--#ifndef __has_builtin
--# define __has_builtin(x) 0
--#endif
--
--/* True if N * S would overflow in a size calculation.
-+/* True if N * S would overflow in a size_t calculation,
-+   or would generate a value larger than PTRDIFF_MAX.
-    This expands to a constant expression if N and S are both constants.
-    By gnulib convention, SIZE_MAX represents overflow in size
--   calculations, so the conservative dividend to use here is
--   SIZE_MAX - 1, since SIZE_MAX might represent an overflowed value.
--   However, malloc (SIZE_MAX) fails on all known hosts where
--   sizeof (ptrdiff_t) <= sizeof (size_t), so do not bother to test for
--   exactly-SIZE_MAX allocations on such hosts; this avoids a test and
--   branch when S is known to be 1.  */
-+   calculations, so the conservative size_t-based dividend to use here
-+   is SIZE_MAX - 1.  */
- #define __xalloc_oversized(n, s) \
--    ((size_t) (sizeof (ptrdiff_t) <= sizeof (size_t) ? -1 : -2) / (s) < (n))
-+  ((size_t) (PTRDIFF_MAX < SIZE_MAX ? PTRDIFF_MAX : SIZE_MAX - 1) / (s) < (n))
- 
-+#if PTRDIFF_MAX < SIZE_MAX
-+typedef ptrdiff_t __xalloc_count_type;
-+#else
-+typedef size_t __xalloc_count_type;
-+#endif
- 
--/* Return 1 if an array of N objects, each of size S, cannot exist due
--   to size arithmetic overflow.  S must be positive and N must be
--   nonnegative.  This is a macro, not a function, so that it
--   works correctly even when SIZE_MAX < N.  */
-+/* Return 1 if an array of N objects, each of size S, cannot exist
-+   reliably due to size or ptrdiff_t arithmetic overflow.  S must be
-+   positive and N must be nonnegative.  This is a macro, not a
-+   function, so that it works correctly even when SIZE_MAX < N.  */
- 
--/* GCC 7 __builtin_mul_overflow should easily compute this.  See:
--   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68120  */
- #if 7 <= __GNUC__
--# define xalloc_oversized(n, s) __builtin_mul_overflow (n, s, (size_t *) NULL)
--
--/* GCC 5 and Clang __builtin_mul_overflow needs a temporary, and
--   should be used only for non-constant operands, so that
--   xalloc_oversized is a constant expression if both arguments are.
--   Do not use this if pedantic, since pedantic GCC issues a diagnostic
--   for ({ ... }).  */
--#elif ((5 <= __GNUC__ \
--        || (__has_builtin (__builtin_mul_overflow) \
--            && __has_builtin (__builtin_constant_p))) \
--       && !__STRICT_ANSI__)
-+# define xalloc_oversized(n, s) \
-+   __builtin_mul_overflow_p (n, s, (__xalloc_count_type) 1)
-+#elif 5 <= __GNUC__ && !__STRICT_ANSI__
- # define xalloc_oversized(n, s) \
-    (__builtin_constant_p (n) && __builtin_constant_p (s) \
-     ? __xalloc_oversized (n, s) \
--    : ({ size_t __xalloc_size; __builtin_mul_overflow (n, s, &__xalloc_size); }))
-+    : ({ __xalloc_count_type __xalloc_count; \
-+         __builtin_mul_overflow (n, s, &__xalloc_count); }))
- 
- /* Other compilers use integer division; this may be slower but is
-    more portable.  */
diff --git a/meta/recipes-extended/diffutils/diffutils-3.5/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/diffutils/diffutils-3.6/0001-Unset-need_charset_alias-when-building-for-musl.patch
similarity index 100%
rename from meta/recipes-extended/diffutils/diffutils-3.5/0001-Unset-need_charset_alias-when-building-for-musl.patch
rename to meta/recipes-extended/diffutils/diffutils-3.6/0001-Unset-need_charset_alias-when-building-for-musl.patch
diff --git a/meta/recipes-extended/diffutils/diffutils-3.6/0001-explicitly-disable-replacing-getopt.patch b/meta/recipes-extended/diffutils/diffutils-3.6/0001-explicitly-disable-replacing-getopt.patch
new file mode 100644
index 0000000..351f87c
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils-3.6/0001-explicitly-disable-replacing-getopt.patch
@@ -0,0 +1,30 @@
+Subject: explicitly disable replacing getopt
+
+Explicitly disable replacing getopt to avoid compilation error like below.
+
+  xstrtol-error.c:84:26: error: invalid use of undefined type 'struct rpl_option'
+
+Upstream-Status: Inappropriate [workaround]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ m4/getopt.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/getopt.m4 b/m4/getopt.m4
+index 3ebc7b7..8934426 100644
+--- a/m4/getopt.m4
++++ b/m4/getopt.m4
+@@ -22,8 +22,8 @@ AC_DEFUN([gl_FUNC_GETOPT_POSIX],
+     fi
+   ])
+   if test $REPLACE_GETOPT = 1; then
+-    dnl Arrange for getopt.h to be created.
+-    gl_GETOPT_SUBSTITUTE_HEADER
++    dnl Explicitly disable replacing getopt
++    :
+   fi
+ ])
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/diffutils/diffutils-3.5/run-ptest b/meta/recipes-extended/diffutils/diffutils-3.6/run-ptest
similarity index 100%
rename from meta/recipes-extended/diffutils/diffutils-3.5/run-ptest
rename to meta/recipes-extended/diffutils/diffutils-3.6/run-ptest
diff --git a/meta/recipes-extended/diffutils/diffutils_3.5.bb b/meta/recipes-extended/diffutils/diffutils_3.6.bb
similarity index 66%
rename from meta/recipes-extended/diffutils/diffutils_3.5.bb
rename to meta/recipes-extended/diffutils/diffutils_3.6.bb
index a4fc27b..a2ea484 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.5.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.6.bb
@@ -5,24 +5,18 @@ require diffutils.inc
 
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-           file://diffutils-3.5-gcc7.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "569354697ff1cfc9a9de3781361015fa"
-SRC_URI[sha256sum] = "dad398ccd5b9faca6b0ab219a036453f62a602a56203ac659b43e889bec35533"
+SRC_URI_append_libc-glibc = " file://0001-explicitly-disable-replacing-getopt.patch"
+
+SRC_URI[md5sum] = "07cf286672ced26fba54cd0313bdc071"
+SRC_URI[sha256sum] = "d621e8bdd4b573918c8145f7ae61817d1be9deb4c8d2328a65cea8e11d783bd6"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
 # Fix "Argument list too long" error when len(TMPDIR) = 410
 acpaths = "-I ./m4"
 
-do_configure_prepend () {
-	# Need to remove gettext macros with weird mix of versions
-	for i in codeset.m4 gettext_gl.m4 intlmacosx.m4 inttypes-pri.m4 lib-ld_gl.m4 lib-prefix_gl.m4 po_gl.m4 ssize_t.m4 wchar_t.m4 wint_t.m4; do
-		rm -f ${S}/m4/$i
-	done
-}
-
 inherit ptest
 
 do_install_ptest() {
-- 
1.9.1


