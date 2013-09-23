Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DE7566CA1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 17:29:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Sep 2013 10:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,963,1371106800"; d="scan'208";a="382345469"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.44])
	by orsmga001.jf.intel.com with ESMTP; 23 Sep 2013 10:29:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 10:29:15 -0700
Message-Id: <1379957355-28446-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] elfutils: remove configure bits from patch
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
X-List-Received-Date: Mon, 23 Sep 2013 17:29:27 -0000

That is a generated file and patching it might fail, the patch already patches configure.ac
which will have the configure file regenerated.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../elfutils-0.155/redhat-portability.diff         | 228 ---------------------
 1 file changed, 228 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/redhat-portability.diff
index bf47ade..d5628aa 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.155/redhat-portability.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/redhat-portability.diff
@@ -277,234 +277,6 @@ Index: elfutils-0.155/config.h.in
 +#undef __thread
 +
  #include <eu-config.h>
-Index: elfutils-0.155/configure
-===================================================================
---- elfutils-0.155.orig/configure
-+++ elfutils-0.155/configure
-@@ -598,6 +598,8 @@ ZLIB_TRUE
- LIBEBL_SUBDIR
- TESTS_RPATH_FALSE
- TESTS_RPATH_TRUE
-+BUILD_WERROR_FALSE
-+BUILD_WERROR_TRUE
- BUILD_STATIC_FALSE
- BUILD_STATIC_TRUE
- GCOV_FALSE
-@@ -612,6 +614,8 @@ NEVER_TRUE
- base_cpu
- NATIVE_LD_FALSE
- NATIVE_LD_TRUE
-+LD_AS_NEEDED
-+WEXTRA
- LEXLIB
- LEX_OUTPUT_ROOT
- LEX
-@@ -725,6 +729,7 @@ enable_mudflap
- enable_debugpred
- enable_gprof
- enable_gcov
-+enable_werror
- enable_tests_rpath
- enable_libebl_subdir
- with_zlib
-@@ -1378,6 +1383,7 @@ Optional Features:
-                           prediction
-   --enable-gprof          build binaries with gprof support
-   --enable-gcov           build binaries with gcov support
-+  --disable-werror        do not build with -Werror
-   --enable-tests-rpath    build $ORIGIN-using rpath into tests
-   --enable-libebl-subdir=DIR
-                           install libebl_CPU modules in $(libdir)/DIR
-@@ -3917,6 +3923,130 @@ if test "x$ac_cv_c99" != xyes; then :
-   as_fn_error $? "gcc with C99 support required" "$LINENO" 5
- fi
- 
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for -Wextra option to $CC" >&5
-+$as_echo_n "checking for -Wextra option to $CC... " >&6; }
-+if ${ac_cv_cc_wextra+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  old_CFLAGS="$CFLAGS"
-+CFLAGS="$CFLAGS -Wextra"
-+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+void foo (void) { }
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  ac_cv_cc_wextra=yes
-+else
-+  ac_cv_cc_wextra=no
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+CFLAGS="$old_CFLAGS"
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_cc_wextra" >&5
-+$as_echo "$ac_cv_cc_wextra" >&6; }
-+
-+if test "x$ac_cv_cc_wextra" = xyes; then :
-+  WEXTRA=-Wextra
-+else
-+  WEXTRA=-W
-+fi
-+
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for -fgnu89-inline option to $CC" >&5
-+$as_echo_n "checking for -fgnu89-inline option to $CC... " >&6; }
-+if ${ac_cv_cc_gnu89_inline+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  old_CFLAGS="$CFLAGS"
-+CFLAGS="$CFLAGS -fgnu89-inline -Werror"
-+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+
-+void foo (void)
-+{
-+  inline void bar (void) {}
-+  bar ();
-+}
-+extern inline void baz (void) {}
-+
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  ac_cv_cc_gnu89_inline=yes
-+else
-+  ac_cv_cc_gnu89_inline=no
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+CFLAGS="$old_CFLAGS"
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_cc_gnu89_inline" >&5
-+$as_echo "$ac_cv_cc_gnu89_inline" >&6; }
-+if test "x$ac_cv_cc_gnu89_inline" = xyes; then :
-+  WEXTRA="${WEXTRA:+$WEXTRA }-fgnu89-inline"
-+fi
-+
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for --as-needed linker option" >&5
-+$as_echo_n "checking for --as-needed linker option... " >&6; }
-+if ${ac_cv_as_needed+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  cat > conftest.c <<EOF
-+int main (void) { return 0; }
-+EOF
-+if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS
-+			    -fPIC -shared -o conftest.so conftest.c
-+			    -Wl,--as-needed 1>&5'
-+  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-+  test $ac_status = 0; }; }
-+then
-+  ac_cv_as_needed=yes
-+else
-+  ac_cv_as_needed=no
-+fi
-+rm -f conftest*
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_as_needed" >&5
-+$as_echo "$ac_cv_as_needed" >&6; }
-+if test "x$ac_cv_as_needed" = xyes; then :
-+  LD_AS_NEEDED=-Wl,--as-needed
-+else
-+  LD_AS_NEEDED=
-+fi
-+
-+
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for __builtin_popcount" >&5
-+$as_echo_n "checking for __builtin_popcount... " >&6; }
-+if ${ac_cv_popcount+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+
-+int
-+main ()
-+{
-+exit (__builtin_popcount (127));
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_link "$LINENO"; then :
-+  ac_cv_popcount=yes
-+else
-+  ac_cv_popcount=no
-+fi
-+rm -f core conftest.err conftest.$ac_objext \
-+    conftest$ac_exeext conftest.$ac_ext
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_popcount" >&5
-+$as_echo "$ac_cv_popcount" >&6; }
-+if test "x$ac_cv_popcount" = xyes; then :
-+
-+$as_echo "#define HAVE_BUILTIN_POPCOUNT 1" >>confdefs.h
-+
-+fi
-+
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking for __thread support" >&5
- $as_echo_n "checking for __thread support... " >&6; }
- if ${ac_cv_tls+:} false; then :
-@@ -3953,7 +4083,13 @@ fi
- { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_tls" >&5
- $as_echo "$ac_cv_tls" >&6; }
- if test "x$ac_cv_tls" != xyes; then :
--  as_fn_error $? "__thread support required" "$LINENO" 5
-+  if test "$use_locks" = yes; then :
-+  as_fn_error $? "--enable-thread-safety requires __thread support" "$LINENO" 5
-+else
-+
-+$as_echo "#define __thread /* empty: no multi-thread support */" >>confdefs.h
-+
-+fi
- fi
- 
- # Check whether --enable-largefile was given.
-@@ -4302,6 +4438,22 @@ else
- fi
- 
- 
-+# Check whether --enable-werror was given.
-+if test "${enable_werror+set}" = set; then :
-+  enableval=$enable_werror; enable_werror=$enableval
-+else
-+  enable_werror=yes
-+fi
-+
-+ if test "$enable_werror" = yes; then
-+  BUILD_WERROR_TRUE=
-+  BUILD_WERROR_FALSE='#'
-+else
-+  BUILD_WERROR_TRUE='#'
-+  BUILD_WERROR_FALSE=
-+fi
-+
-+
- # Check whether --enable-tests-rpath was given.
- if test "${enable_tests_rpath+set}" = set; then :
-   enableval=$enable_tests_rpath; tests_use_rpath=$enableval
-@@ -5022,7 +5174,7 @@ case "$eu_version" in
- esac
- 
- # Round up to the next release API (x.y) version.
--eu_version=$(( (eu_version + 999) / 1000 ))
-+eu_version=`expr \( $eu_version + 999 \) / 1000`
- 
- cat >confcache <<\_ACEOF
- # This file is a shell script that caches the results of configure
-@@ -5185,6 +5337,10 @@ if test -z "${BUILD_STATIC_TRUE}" && tes
-   as_fn_error $? "conditional \"BUILD_STATIC\" was never defined.
- Usually this means the macro was only invoked conditionally." "$LINENO" 5
- fi
-+if test -z "${BUILD_WERROR_TRUE}" && test -z "${BUILD_WERROR_FALSE}"; then
-+  as_fn_error $? "conditional \"BUILD_WERROR\" was never defined.
-+Usually this means the macro was only invoked conditionally." "$LINENO" 5
-+fi
- if test -z "${TESTS_RPATH_TRUE}" && test -z "${TESTS_RPATH_FALSE}"; then
-   as_fn_error $? "conditional \"TESTS_RPATH\" was never defined.
- Usually this means the macro was only invoked conditionally." "$LINENO" 5
-
 Index: elfutils-0.155/configure.ac
 ===================================================================
 --- elfutils-0.155.orig/configure.ac
-- 
1.8.3.1


