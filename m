Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 51D0360559
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 20:00:09 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id e89so3841705qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jul 2014 13:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ahHEei7GNdxoiqS/WYHx4i6lJtrDxvotPr7JoaF+vjM=;
	b=fJ5JEDOJaUXzICfalTWHKtZ9YLwWlO2pyzSL2u9x8zZYro8SydWzsdFG5vvhtX+7tI
	z6GaQCgLV0K5bgq/qcL16U74Ujw8Y4uivEevB3Le4FwX2uPb7aaxb/mWZNGX8mqDL2an
	EsajpDm1uK8RvIdb73bjXhTMw54vt2tWqcHxM6QGCuno7t+b+WL5SAQB7x9xX2XVTfCU
	RLM9S7p5+XK0SMHepL7AiyUiwAB5AQJ8NiKnHSHfMmVYQDNVXfEbUmJ8R2rBokS9d+Vu
	CrA/3y2XCX1THnCuN2Sxwa0KSQU2KG3gd11Zf3Aygavv65qVhmvUlUig1SDcVB4owpJi
	ekJA==
X-Gm-Message-State: ALoCoQmhlbRwnglSLc+bVOUoU+aeMQon7bzkEDZmqEkS0UPZNZ4FFWy33juuMSwAxizT+d7p9+yY
X-Received: by 10.140.40.20 with SMTP id w20mr72088817qgw.92.1404244810506;
	Tue, 01 Jul 2014 13:00:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Tue, 1 Jul 2014 12:59:50 -0700 (PDT)
In-Reply-To: <0aee3b3737e431d7a880f52bbdbd72d4c5050b66.1404224041.git.roxana.ciobanu@intel.com>
References: <cover.1404224041.git.roxana.ciobanu@intel.com>
	<0aee3b3737e431d7a880f52bbdbd72d4c5050b66.1404224041.git.roxana.ciobanu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Jul 2014 20:59:50 +0100
Message-ID: <CAJTo0LZsi2f4TP-=DrCTtnoFU5NPaLtEOZHSp=ZGPSNhe5_PoQ@mail.gmail.com>
To: Roxana Ciobanu <roxana.ciobanu@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] elfutils/elfutils-native: Fix patching generated files
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
X-List-Received-Date: Tue, 01 Jul 2014 20:00:10 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross

On 1 July 2014 15:17, Roxana Ciobanu <roxana.ciobanu@intel.com> wrote:
>  Patch redhat-portability.diff was patching generated files.
>  This patch removes every hunk related to Makefile.in and configure files.
>
>  [YOCTO #6491]
>
> Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
> ---
>  .../elfutils-0.158/redhat-portability.diff         | 859 ---------------------
>  .../elfutils/elfutils/redhat-portability.diff      | 370 +--------
>  2 files changed, 1 insertion(+), 1228 deletions(-)
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff
> index a34ba29..5a75375 100644
> --- a/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff
> +++ b/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff
> @@ -44,56 +44,6 @@
>         $(textrel_check)
>
>   libebl_i386.so: $(cpu_i386)
> ---- elfutils/backends/Makefile.in
> -+++ elfutils/backends/Makefile.in
> -@@ -83,7 +83,8 @@ host_triplet = @host@
> - DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
> -       $(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
> -       $(noinst_HEADERS) ChangeLog
> --@MUDFLAP_TRUE@am__append_1 = -fmudflap
> -+@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
> -+@MUDFLAP_TRUE@am__append_2 = -fmudflap
> - subdir = backends
> - ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
> - am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
> -@@ -284,6 +285,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -315,6 +317,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -378,10 +381,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
> -       -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
> -       -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> --      $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> --      $(am__append_1)
> -+      $(am__append_1) $(am__append_2)
> - @MUDFLAP_FALSE@libmudflap =
> - @MUDFLAP_TRUE@libmudflap = -lmudflap
> - COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
> -@@ -888,7 +890,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a
> -       $(LINK) -shared -o $(@:.map=.so) \
> -               -Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
> -               -Wl,--version-script,$(@:.so=.map) \
> --              -Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw) $(libmudflap)
> -+              -Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw) $(libmudflap)
> -       $(textrel_check)
> -
> - libebl_i386.so: $(cpu_i386)
>  --- elfutils/ChangeLog
>  +++ elfutils/ChangeLog
>  @@ -118,6 +118,8 @@
> @@ -221,24 +171,6 @@
>   if MUDFLAP
>   AM_CFLAGS += -fmudflap
>   libmudflap = -lmudflap
> ---- elfutils/config/Makefile.in
> -+++ elfutils/config/Makefile.in
> -@@ -146,6 +146,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -177,6 +178,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
>  --- elfutils/config.h.in
>  +++ elfutils/config.h.in
>  @@ -6,6 +6,9 @@
> @@ -259,231 +191,6 @@
>  +#undef __thread
>  +
>   #include <eu-config.h>
> ---- elfutils/configure
> -+++ elfutils/configure
> -@@ -661,6 +661,8 @@ ZLIB_TRUE
> - LIBEBL_SUBDIR
> - TESTS_RPATH_FALSE
> - TESTS_RPATH_TRUE
> -+BUILD_WERROR_FALSE
> -+BUILD_WERROR_TRUE
> - BUILD_STATIC_FALSE
> - BUILD_STATIC_TRUE
> - USE_VALGRIND_FALSE
> -@@ -678,6 +680,8 @@ NEVER_TRUE
> - base_cpu
> - NATIVE_LD_FALSE
> - NATIVE_LD_TRUE
> -+LD_AS_NEEDED
> -+WEXTRA
> - NM
> - READELF
> - ac_ct_AR
> -@@ -802,6 +806,7 @@ enable_debugpred
> - enable_gprof
> - enable_gcov
> - enable_valgrind
> -+enable_werror
> - enable_tests_rpath
> - enable_libebl_subdir
> - with_zlib
> -@@ -1461,6 +1466,7 @@ Optional Features:
> -   --enable-gprof          build binaries with gprof support
> -   --enable-gcov           build binaries with gcov support
> -   --enable-valgrind       run all tests under valgrind
> -+  --disable-werror        do not build with -Werror
> -   --enable-tests-rpath    build $ORIGIN-using rpath into tests
> -   --enable-libebl-subdir=DIR
> -                           install libebl_CPU modules in $(libdir)/DIR
> -@@ -4709,6 +4715,130 @@ if test "x$ac_cv_c99" != xyes; then :
> -   as_fn_error $? "gcc with C99 support required" "$LINENO" 5
> - fi
> -
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for -Wextra option to $CC" >&5
> -+$as_echo_n "checking for -Wextra option to $CC... " >&6; }
> -+if ${ac_cv_cc_wextra+:} false; then :
> -+  $as_echo_n "(cached) " >&6
> -+else
> -+  old_CFLAGS="$CFLAGS"
> -+CFLAGS="$CFLAGS -Wextra"
> -+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -+/* end confdefs.h.  */
> -+void foo (void) { }
> -+_ACEOF
> -+if ac_fn_c_try_compile "$LINENO"; then :
> -+  ac_cv_cc_wextra=yes
> -+else
> -+  ac_cv_cc_wextra=no
> -+fi
> -+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> -+CFLAGS="$old_CFLAGS"
> -+fi
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_cc_wextra" >&5
> -+$as_echo "$ac_cv_cc_wextra" >&6; }
> -+
> -+if test "x$ac_cv_cc_wextra" = xyes; then :
> -+  WEXTRA=-Wextra
> -+else
> -+  WEXTRA=-W
> -+fi
> -+
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for -fgnu89-inline option to $CC" >&5
> -+$as_echo_n "checking for -fgnu89-inline option to $CC... " >&6; }
> -+if ${ac_cv_cc_gnu89_inline+:} false; then :
> -+  $as_echo_n "(cached) " >&6
> -+else
> -+  old_CFLAGS="$CFLAGS"
> -+CFLAGS="$CFLAGS -fgnu89-inline -Werror"
> -+cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -+/* end confdefs.h.  */
> -+
> -+void foo (void)
> -+{
> -+  inline void bar (void) {}
> -+  bar ();
> -+}
> -+extern inline void baz (void) {}
> -+
> -+_ACEOF
> -+if ac_fn_c_try_compile "$LINENO"; then :
> -+  ac_cv_cc_gnu89_inline=yes
> -+else
> -+  ac_cv_cc_gnu89_inline=no
> -+fi
> -+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> -+CFLAGS="$old_CFLAGS"
> -+fi
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_cc_gnu89_inline" >&5
> -+$as_echo "$ac_cv_cc_gnu89_inline" >&6; }
> -+if test "x$ac_cv_cc_gnu89_inline" = xyes; then :
> -+  WEXTRA="${WEXTRA:+$WEXTRA }-fgnu89-inline"
> -+fi
> -+
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for --as-needed linker option" >&5
> -+$as_echo_n "checking for --as-needed linker option... " >&6; }
> -+if ${ac_cv_as_needed+:} false; then :
> -+  $as_echo_n "(cached) " >&6
> -+else
> -+  cat > conftest.c <<EOF
> -+int main (void) { return 0; }
> -+EOF
> -+if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS
> -+                          -fPIC -shared -o conftest.so conftest.c
> -+                          -Wl,--as-needed 1>&5'
> -+  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
> -+  (eval $ac_try) 2>&5
> -+  ac_status=$?
> -+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
> -+  test $ac_status = 0; }; }
> -+then
> -+  ac_cv_as_needed=yes
> -+else
> -+  ac_cv_as_needed=no
> -+fi
> -+rm -f conftest*
> -+fi
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_as_needed" >&5
> -+$as_echo "$ac_cv_as_needed" >&6; }
> -+if test "x$ac_cv_as_needed" = xyes; then :
> -+  LD_AS_NEEDED=-Wl,--as-needed
> -+else
> -+  LD_AS_NEEDED=
> -+fi
> -+
> -+
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for __builtin_popcount" >&5
> -+$as_echo_n "checking for __builtin_popcount... " >&6; }
> -+if ${ac_cv_popcount+:} false; then :
> -+  $as_echo_n "(cached) " >&6
> -+else
> -+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -+/* end confdefs.h.  */
> -+
> -+int
> -+main ()
> -+{
> -+exit (__builtin_popcount (127));
> -+  ;
> -+  return 0;
> -+}
> -+_ACEOF
> -+if ac_fn_c_try_link "$LINENO"; then :
> -+  ac_cv_popcount=yes
> -+else
> -+  ac_cv_popcount=no
> -+fi
> -+rm -f core conftest.err conftest.$ac_objext \
> -+    conftest$ac_exeext conftest.$ac_ext
> -+fi
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_popcount" >&5
> -+$as_echo "$ac_cv_popcount" >&6; }
> -+if test "x$ac_cv_popcount" = xyes; then :
> -+
> -+$as_echo "#define HAVE_BUILTIN_POPCOUNT 1" >>confdefs.h
> -+
> -+fi
> -+
> - { $as_echo "$as_me:${as_lineno-$LINENO}: checking for __thread support" >&5
> - $as_echo_n "checking for __thread support... " >&6; }
> - if ${ac_cv_tls+:} false; then :
> -@@ -4745,7 +4875,13 @@ fi
> - { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_tls" >&5
> - $as_echo "$ac_cv_tls" >&6; }
> - if test "x$ac_cv_tls" != xyes; then :
> --  as_fn_error $? "__thread support required" "$LINENO" 5
> -+  if test "$use_locks" = yes; then :
> -+  as_fn_error $? "--enable-thread-safety requires __thread support" "$LINENO" 5
> -+else
> -+
> -+$as_echo "#define __thread /* empty: no multi-thread support */" >>confdefs.h
> -+
> -+fi
> - fi
> -
> - # Check whether --enable-largefile was given.
> -@@ -5155,6 +5291,22 @@ else
> - fi
> -
> -
> -+# Check whether --enable-werror was given.
> -+if test "${enable_werror+set}" = set; then :
> -+  enableval=$enable_werror; enable_werror=$enableval
> -+else
> -+  enable_werror=yes
> -+fi
> -+
> -+ if test "$enable_werror" = yes; then
> -+  BUILD_WERROR_TRUE=
> -+  BUILD_WERROR_FALSE='#'
> -+else
> -+  BUILD_WERROR_TRUE='#'
> -+  BUILD_WERROR_FALSE=
> -+fi
> -+
> -+
> - # Check whether --enable-tests-rpath was given.
> - if test "${enable_tests_rpath+set}" = set; then :
> -   enableval=$enable_tests_rpath; tests_use_rpath=$enableval
> -@@ -5875,7 +6027,7 @@ case "$eu_version" in
> - esac
> -
> - # Round up to the next release API (x.y) version.
> --eu_version=$(( (eu_version + 999) / 1000 ))
> -+eu_version=`expr \( $eu_version + 999 \) / 1000`
> -
> - ac_ext=c
> - ac_cpp='$CPP $CPPFLAGS'
> -@@ -6613,6 +6765,10 @@ if test -z "${BUILD_STATIC_TRUE}" && tes
> -   as_fn_error $? "conditional \"BUILD_STATIC\" was never defined.
> - Usually this means the macro was only invoked conditionally." "$LINENO" 5
> - fi
> -+if test -z "${BUILD_WERROR_TRUE}" && test -z "${BUILD_WERROR_FALSE}"; then
> -+  as_fn_error $? "conditional \"BUILD_WERROR\" was never defined.
> -+Usually this means the macro was only invoked conditionally." "$LINENO" 5
> -+fi
> - if test -z "${TESTS_RPATH_TRUE}" && test -z "${TESTS_RPATH_FALSE}"; then
> -   as_fn_error $? "conditional \"TESTS_RPATH\" was never defined.
> - Usually this means the macro was only invoked conditionally." "$LINENO" 5
>  --- elfutils/configure.ac
>  +++ elfutils/configure.ac
>  @@ -99,6 +99,54 @@ CFLAGS="$old_CFLAGS"])
> @@ -618,47 +325,6 @@
>
>   #ifdef SHARED
>   # define OLD_VERSION(name, version) \
> ---- elfutils/lib/Makefile.in
> -+++ elfutils/lib/Makefile.in
> -@@ -82,7 +82,8 @@ host_triplet = @host@
> - DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
> -       $(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
> -       $(noinst_HEADERS) ChangeLog
> --@MUDFLAP_TRUE@am__append_1 = -fmudflap
> -+@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
> -+@MUDFLAP_TRUE@am__append_2 = -fmudflap
> - subdir = lib
> - ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
> - am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
> -@@ -198,6 +199,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -229,6 +231,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -291,10 +294,9 @@ zip_LIBS = @zip_LIBS@
> - AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. \
> -       -I$(srcdir)/../libelf
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> --      $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> --      $(am__append_1) -fpic
> -+      $(am__append_1) $(am__append_2) -fpic
> - @MUDFLAP_FALSE@libmudflap =
> - @MUDFLAP_TRUE@libmudflap = -lmudflap
> - COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
>  --- elfutils/libasm/ChangeLog
>  +++ elfutils/libasm/ChangeLog
>  @@ -75,6 +75,11 @@
> @@ -673,60 +339,6 @@
>   2005-02-15  Ulrich Drepper  <drepper@redhat.com>
>
>         * Makefile.am (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
> ---- elfutils/libasm/Makefile.in
> -+++ elfutils/libasm/Makefile.in
> -@@ -83,10 +83,11 @@ host_triplet = @host@
> - DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
> -       $(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
> -       $(noinst_HEADERS) $(pkginclude_HEADERS) ChangeLog
> --@MUDFLAP_TRUE@am__append_1 = -fmudflap
> -+@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
> -+@MUDFLAP_TRUE@am__append_2 = -fmudflap
> - @MUDFLAP_FALSE@noinst_PROGRAMS = $(am__EXEEXT_1)
> - @MUDFLAP_TRUE@am_libasm_pic_a_OBJECTS =
> --@MUDFLAP_FALSE@@USE_LOCKS_TRUE@am__append_2 = -lpthread
> -+@MUDFLAP_FALSE@@USE_LOCKS_TRUE@am__append_3 = -lpthread
> - subdir = libasm
> - ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
> - am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
> -@@ -250,6 +251,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -281,6 +283,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = 1
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -344,10 +347,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
> -       -I$(top_srcdir)/libelf -I$(top_srcdir)/libebl \
> -       -I$(top_srcdir)/libdw
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> --      $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> --      $(am__append_1)
> -+      $(am__append_1) $(am__append_2)
> - @MUDFLAP_FALSE@libmudflap =
> - @MUDFLAP_TRUE@libmudflap = -lmudflap
> - COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
> -@@ -376,7 +378,7 @@ libasm_a_SOURCES = asm_begin.c asm_abort
> -
> - @MUDFLAP_FALSE@libasm_pic_a_SOURCES =
> - @MUDFLAP_FALSE@am_libasm_pic_a_OBJECTS = $(libasm_a_SOURCES:.c=.os)
> --@MUDFLAP_FALSE@libasm_so_LDLIBS = $(am__append_2)
> -+@MUDFLAP_FALSE@libasm_so_LDLIBS = $(am__append_3)
> - @MUDFLAP_FALSE@libasm_so_SOURCES =
> - noinst_HEADERS = libasmP.h symbolhash.h
> - EXTRA_DIST = libasm.map
>  --- elfutils/libcpu/ChangeLog
>  +++ elfutils/libcpu/ChangeLog
>  @@ -47,6 +47,9 @@
> @@ -761,47 +373,6 @@
>                         }
>                     }
>                   else
> ---- elfutils/libcpu/Makefile.in
> -+++ elfutils/libcpu/Makefile.in
> -@@ -84,7 +84,8 @@ DIST_COMMON = $(top_srcdir)/config/eu.am
> -       $(srcdir)/Makefile.am i386_lex.c i386_parse.c \
> -       $(top_srcdir)/config/depcomp $(top_srcdir)/config/ylwrap \
> -       $(am__noinst_HEADERS_DIST) ChangeLog
> --@MUDFLAP_TRUE@am__append_1 = -fmudflap
> -+@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
> -+@MUDFLAP_TRUE@am__append_2 = -fmudflap
> - @MAINTAINER_MODE_TRUE@noinst_PROGRAMS = i386_gendis$(EXEEXT)
> - subdir = libcpu
> - ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
> -@@ -225,6 +226,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = lex.$(<F:lex.l=)
> -@@ -256,6 +258,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -319,10 +322,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
> -       -I$(srcdir)/../libelf -I$(srcdir)/../libebl \
> -       -I$(srcdir)/../libdw -I$(srcdir)/../libasm
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> --      $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> --      $(am__append_1) -fpic -fdollars-in-identifiers
> -+      $(am__append_1) $(am__append_2) -fpic -fdollars-in-identifiers
> - @MUDFLAP_FALSE@libmudflap =
> - @MUDFLAP_TRUE@libmudflap = -lmudflap
> - COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
>  --- elfutils/libdw/ChangeLog
>  +++ elfutils/libdw/ChangeLog
>  @@ -346,6 +346,10 @@
> @@ -866,49 +437,6 @@
>   /* Return attribute code of given attribute.  */
>   __libdw_extern_inline unsigned int
>   dwarf_whatattr (Dwarf_Attribute *attr)
> ---- elfutils/libdw/Makefile.in
> -+++ elfutils/libdw/Makefile.in
> -@@ -84,8 +84,9 @@ DIST_COMMON = $(top_srcdir)/config/eu.am
> -       $(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
> -       $(include_HEADERS) $(noinst_HEADERS) $(pkginclude_HEADERS) \
> -       ChangeLog
> --@MUDFLAP_TRUE@am__append_1 = -fmudflap
> --@BUILD_STATIC_TRUE@am__append_2 = -fpic
> -+@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
> -+@MUDFLAP_TRUE@am__append_2 = -fmudflap
> -+@BUILD_STATIC_TRUE@am__append_3 = -fpic
> - @MUDFLAP_FALSE@noinst_PROGRAMS = $(am__EXEEXT_1)
> - @MUDFLAP_TRUE@am_libdw_pic_a_OBJECTS =
> - subdir = libdw
> -@@ -295,6 +296,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -326,6 +328,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = 1
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -388,10 +391,9 @@ zip_LIBS = @zip_LIBS@
> - AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. \
> -       -I$(srcdir)/../libelf
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> --      $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> --      $(am__append_1) $(am__append_2)
> -+      $(am__append_1) $(am__append_2) $(am__append_3)
> - @MUDFLAP_FALSE@libmudflap =
> - @MUDFLAP_TRUE@libmudflap = -lmudflap
> - COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
>  --- elfutils/libdwfl/ChangeLog
>  +++ elfutils/libdwfl/ChangeLog
>  @@ -283,6 +283,21 @@
> @@ -1014,75 +542,6 @@
>       }
>   }
>
> ---- elfutils/libdwfl/Makefile.in
> -+++ elfutils/libdwfl/Makefile.in
> -@@ -82,11 +82,12 @@ host_triplet = @host@
> - DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
> -       $(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
> -       $(noinst_HEADERS) $(pkginclude_HEADERS) ChangeLog
> --@MUDFLAP_TRUE@am__append_1 = -fmudflap
> --@MUDFLAP_FALSE@am__append_2 = libdwfl_pic.a
> --@ZLIB_TRUE@am__append_3 = gzip.c
> --@BZLIB_TRUE@am__append_4 = bzip2.c
> --@LZMA_TRUE@am__append_5 = lzma.c
> -+@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
> -+@MUDFLAP_TRUE@am__append_2 = -fmudflap
> -+@MUDFLAP_FALSE@am__append_3 = libdwfl_pic.a
> -+@ZLIB_TRUE@am__append_4 = gzip.c
> -+@BZLIB_TRUE@am__append_5 = bzip2.c
> -+@LZMA_TRUE@am__append_6 = lzma.c
> - @MUDFLAP_TRUE@am_libdwfl_pic_a_OBJECTS =
> - subdir = libdwfl
> - ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
> -@@ -289,6 +290,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -320,6 +322,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = 1
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -383,10 +386,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
> -       -I$(srcdir)/../libelf -I$(srcdir)/../libebl \
> -       -I$(srcdir)/../libdw
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> --      $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> --      $(am__append_1)
> -+      $(am__append_1) $(am__append_2)
> - @MUDFLAP_FALSE@libmudflap =
> - @MUDFLAP_TRUE@libmudflap = -lmudflap
> - COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
> -@@ -394,7 +396,7 @@ COMPILE.os = $(filter-out -fprofile-arcs
> -
> - CLEANFILES = *.gcno *.gcda $(am_libdwfl_pic_a_OBJECTS)
> - textrel_check = if $(READELF) -d $@ | fgrep -q TEXTREL; then exit 1; fi
> --noinst_LIBRARIES = libdwfl.a $(am__append_2)
> -+noinst_LIBRARIES = libdwfl.a $(am__append_3)
> - pkginclude_HEADERS = libdwfl.h
> - libdwfl_a_SOURCES = dwfl_begin.c dwfl_end.c dwfl_error.c \
> -       dwfl_version.c dwfl_module.c dwfl_report_elf.c relocate.c \
> -@@ -417,8 +419,8 @@ libdwfl_a_SOURCES = dwfl_begin.c dwfl_en
> -       dwfl_module_register_names.c dwfl_segment_report_module.c \
> -       link_map.c core-file.c open.c image-header.c dwfl_frame.c \
> -       frame_unwind.c dwfl_frame_pc.c linux-pid-attach.c \
> --      linux-core-attach.c dwfl_frame_regs.c $(am__append_3) \
> --      $(am__append_4) $(am__append_5)
> -+      linux-core-attach.c dwfl_frame_regs.c $(am__append_4) \
> -+      $(am__append_5) $(am__append_6)
> - @MUDFLAP_FALSE@libdwfl = $(libdw)
> - @MUDFLAP_TRUE@libdwfl = libdwfl.a $(libdw) $(libebl) $(libelf) $(libeu)
> - @MUDFLAP_FALSE@libdw = ../libdw/libdw.so
>  --- elfutils/libebl/ChangeLog
>  +++ elfutils/libebl/ChangeLog
>  @@ -738,6 +738,11 @@
> @@ -1097,47 +556,6 @@
>   2005-05-21  Ulrich Drepper  <drepper@redhat.com>
>
>         * libebl_x86_64.map: Add x86_64_core_note.
> ---- elfutils/libebl/Makefile.in
> -+++ elfutils/libebl/Makefile.in
> -@@ -82,7 +82,8 @@ host_triplet = @host@
> - DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
> -       $(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
> -       $(noinst_HEADERS) $(pkginclude_HEADERS) ChangeLog
> --@MUDFLAP_TRUE@am__append_1 = -fmudflap
> -+@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
> -+@MUDFLAP_TRUE@am__append_2 = -fmudflap
> - subdir = libebl
> - ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
> - am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
> -@@ -249,6 +250,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -280,6 +282,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = 1
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -343,10 +346,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
> -       -I$(srcdir)/../libelf -I$(srcdir)/../libdw \
> -       -I$(srcdir)/../libasm
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> --      $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> --      $(am__append_1) -fpic
> -+      $(am__append_1) $(am__append_2) -fpic
> - @MUDFLAP_FALSE@libmudflap =
> - @MUDFLAP_TRUE@libmudflap = -lmudflap
> - COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
>  --- elfutils/libelf/ChangeLog
>  +++ elfutils/libelf/ChangeLog
>  @@ -85,6 +85,11 @@
> @@ -1204,98 +622,6 @@
>         len -= 4;
>       }
>   }
> ---- elfutils/libelf/Makefile.in
> -+++ elfutils/libelf/Makefile.in
> -@@ -84,11 +84,12 @@ DIST_COMMON = $(top_srcdir)/config/eu.am
> -       $(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
> -       $(include_HEADERS) $(noinst_HEADERS) $(pkginclude_HEADERS) \
> -       ChangeLog
> --@MUDFLAP_TRUE@am__append_1 = -fmudflap
> --@BUILD_STATIC_TRUE@am__append_2 = -fpic
> -+@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
> -+@MUDFLAP_TRUE@am__append_2 = -fmudflap
> -+@BUILD_STATIC_TRUE@am__append_3 = -fpic
> - @MUDFLAP_FALSE@noinst_PROGRAMS = $(am__EXEEXT_1)
> - @MUDFLAP_TRUE@am_libelf_pic_a_OBJECTS =
> --@MUDFLAP_FALSE@@USE_LOCKS_TRUE@am__append_3 = -lpthread
> -+@MUDFLAP_FALSE@@USE_LOCKS_TRUE@am__append_4 = -lpthread
> - subdir = libelf
> - ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
> - am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
> -@@ -293,6 +294,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -324,6 +326,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = 1
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -385,10 +388,9 @@ top_srcdir = @top_srcdir@
> - zip_LIBS = @zip_LIBS@
> - AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> --      $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> --      $(am__append_1) $(am__append_2)
> -+      $(am__append_1) $(am__append_2) $(am__append_3)
> - @MUDFLAP_FALSE@libmudflap =
> - @MUDFLAP_TRUE@libmudflap = -lmudflap
> - COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
> -@@ -453,7 +455,7 @@ libelf_a_SOURCES = elf_version.c elf_has
> -
> - @MUDFLAP_FALSE@libelf_pic_a_SOURCES =
> - @MUDFLAP_FALSE@am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
> --@MUDFLAP_FALSE@libelf_so_LDLIBS = $(am__append_3)
> -+@MUDFLAP_FALSE@libelf_so_LDLIBS = $(am__append_4)
> - @MUDFLAP_FALSE@libelf_so_SOURCES =
> - noinst_HEADERS = elf.h abstract.h common.h exttypes.h gelf_xlate.h libelfP.h \
> -                version_xlate.h gnuhash_xlate.h note_xlate.h dl-hash.h
> ---- elfutils/m4/Makefile.in
> -+++ elfutils/m4/Makefile.in
> -@@ -145,6 +145,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -176,6 +177,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> ---- elfutils/Makefile.in
> -+++ elfutils/Makefile.in
> -@@ -263,6 +263,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -294,6 +295,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
>  --- elfutils/src/addr2line.c
>  +++ elfutils/src/addr2line.c
>  @@ -540,10 +540,10 @@ handle_address (const char *string, Dwfl
> @@ -1438,98 +764,6 @@
>   readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
>   nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
>            $(demanglelib)
> ---- elfutils/src/Makefile.in
> -+++ elfutils/src/Makefile.in
> -@@ -85,7 +85,8 @@ DIST_COMMON = $(top_srcdir)/config/eu.am
> -       $(srcdir)/Makefile.am ldlex.c ldscript.c \
> -       $(top_srcdir)/config/depcomp $(top_srcdir)/config/ylwrap \
> -       $(noinst_HEADERS) ChangeLog
> --@MUDFLAP_TRUE@am__append_1 = -fmudflap
> -+@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
> -+@MUDFLAP_TRUE@am__append_2 = -fmudflap
> - bin_PROGRAMS = readelf$(EXEEXT) nm$(EXEEXT) size$(EXEEXT) \
> -       strip$(EXEEXT) ld$(EXEEXT) elflint$(EXEEXT) \
> -       findtextrel$(EXEEXT) addr2line$(EXEEXT) elfcmp$(EXEEXT) \
> -@@ -94,9 +95,9 @@ bin_PROGRAMS = readelf$(EXEEXT) nm$(EXEE
> - @NATIVE_LD_FALSE@noinst_PROGRAMS = $(am__EXEEXT_1)
> - # We never build this library but we need to get the dependency files
> - # of all the linker backends that might be used in a non-generic linker.
> --@NEVER_TRUE@am__append_2 = libdummy.a
> -+@NEVER_TRUE@am__append_3 = libdummy.a
> - # -ldl is always needed for libebl.
> --@NATIVE_LD_TRUE@am__append_3 = libld_elf.a
> -+@NATIVE_LD_TRUE@am__append_4 = libld_elf.a
> - @NATIVE_LD_TRUE@am_libld_elf_i386_pic_a_OBJECTS =
> - subdir = src
> - ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
> -@@ -164,7 +165,7 @@ am_ld_OBJECTS = ld.$(OBJEXT) ldgeneric.$
> -       versionhash.$(OBJEXT)
> - ld_OBJECTS = $(am_ld_OBJECTS)
> - ld_DEPENDENCIES = $(libebl) $(libelf) $(libeu) $(am__DEPENDENCIES_1) \
> --      $(am__append_3)
> -+      $(am__append_4)
> - ld_LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(ld_LDFLAGS) $(LDFLAGS) -o \
> -       $@
> - am_libld_elf_i386_so_OBJECTS =
> -@@ -347,6 +348,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -378,6 +380,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -442,10 +445,9 @@ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_sr
> -       -I$(srcdir)/../libdw -I$(srcdir)/../libdwfl \
> -       -I$(srcdir)/../libasm
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> --      $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> --      $(am__append_1)
> -+      $(am__append_1) $(am__append_2)
> - @MUDFLAP_FALSE@libmudflap =
> - @MUDFLAP_TRUE@libmudflap = -lmudflap
> - COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
> -@@ -461,8 +463,8 @@ AM_LFLAGS = -Pld -olex.yy.c
> - native_ld = @native_ld@
> - ld_dsos = libld_elf_i386_pic.a
> - @NATIVE_LD_FALSE@noinst_LIBRARIES = libld_elf.a libar.a $(ld_dsos) \
> --@NATIVE_LD_FALSE@     $(am__append_2)
> --@NATIVE_LD_TRUE@noinst_LIBRARIES = libld_elf.a libar.a $(am__append_2)
> -+@NATIVE_LD_FALSE@     $(am__append_3)
> -+@NATIVE_LD_TRUE@noinst_LIBRARIES = libld_elf.a libar.a $(am__append_3)
> - @NATIVE_LD_TRUE@native_ld_cflags = -DBASE_ELF_NAME=elf_$(base_cpu)
> - @NEVER_TRUE@libdummy_a_SOURCES = i386_ld.c
> - ld_SOURCES = ld.c ldgeneric.c ldlex.l ldscript.y symbolhash.c sectionhash.c \
> -@@ -491,6 +493,9 @@ strings_no_Wformat = yes
> - addr2line_no_Wformat = yes
> - # XXX While the file is not finished, don't warn about this
> - ldgeneric_no_Wunused = yes
> -+
> -+# Buggy old compilers.
> -+readelf_no_Werror = yes
> - readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
> - nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
> -          $(demanglelib)
> -@@ -498,7 +503,7 @@ nm_LDADD = $(libdw) $(libebl) $(libelf)
> - size_LDADD = $(libelf) $(libeu) $(libmudflap)
> - strip_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
> - ld_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
> --      $(am__append_3)
> -+      $(am__append_4)
> - ld_LDFLAGS = -rdynamic
> - elflint_LDADD = $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
> - findtextrel_LDADD = $(libdw) $(libelf) $(libmudflap)
>  --- elfutils/src/readelf.c
>  +++ elfutils/src/readelf.c
>  @@ -4171,10 +4171,12 @@ listptr_base (struct listptr *p)
> @@ -1719,96 +953,3 @@
>         {
>         default:
>         case 0:
> ---- elfutils/tests/Makefile.in
> -+++ elfutils/tests/Makefile.in
> -@@ -80,14 +80,15 @@ host_triplet = @host@
> - DIST_COMMON = $(top_srcdir)/config/eu.am $(srcdir)/Makefile.in \
> -       $(srcdir)/Makefile.am $(top_srcdir)/config/depcomp \
> -       $(top_srcdir)/config/test-driver ChangeLog
> --@MUDFLAP_TRUE@am__append_1 = -fmudflap
> --@STANDALONE_FALSE@am__append_2 = -I$(top_srcdir)/libasm -I$(top_srcdir)/libdw \
> -+@BUILD_WERROR_TRUE@am__append_1 = $(if $($(*F)_no_Werror),,-Werror)
> -+@MUDFLAP_TRUE@am__append_2 = -fmudflap
> -+@STANDALONE_FALSE@am__append_3 = -I$(top_srcdir)/libasm -I$(top_srcdir)/libdw \
> - @STANDALONE_FALSE@        -I$(top_srcdir)/libdwfl \
> - @STANDALONE_FALSE@        -I$(top_srcdir)/libebl -I$(top_srcdir)/libelf \
> - @STANDALONE_FALSE@        -I$(top_srcdir)/lib -I..
> -
> --@STANDALONE_FALSE@am__append_3 = -Wl,-rpath-link,../libasm:../libdw:../libelf
> --@TESTS_RPATH_TRUE@am__append_4 = -Wl,-rpath,$(BUILD_RPATH)
> -+@STANDALONE_FALSE@am__append_4 = -Wl,-rpath-link,../libasm:../libdw:../libelf
> -+@TESTS_RPATH_TRUE@am__append_5 = -Wl,-rpath,$(BUILD_RPATH)
> - check_PROGRAMS = arextract$(EXEEXT) arsymtest$(EXEEXT) \
> -       newfile$(EXEEXT) saridx$(EXEEXT) scnnames$(EXEEXT) \
> -       sectiondump$(EXEEXT) showptable$(EXEEXT) update1$(EXEEXT) \
> -@@ -111,7 +112,7 @@ check_PROGRAMS = arextract$(EXEEXT) arsy
> -       varlocs$(EXEEXT) backtrace$(EXEEXT) backtrace-child$(EXEEXT) \
> -       backtrace-data$(EXEEXT) backtrace-dwarf$(EXEEXT) \
> -       $(am__EXEEXT_1) $(am__EXEEXT_2) $(am__EXEEXT_4)
> --@BIARCH_TRUE@am__append_5 = backtrace-child-biarch
> -+@BIARCH_TRUE@am__append_6 = backtrace-child-biarch
> - TESTS = run-arextract.sh run-arsymtest.sh newfile$(EXEEXT) \
> -       test-nlist$(EXEEXT) update1$(EXEEXT) update2$(EXEEXT) \
> -       update3$(EXEEXT) update4$(EXEEXT) run-show-die-info.sh \
> -@@ -151,14 +152,14 @@ TESTS = run-arextract.sh run-arsymtest.s
> -       run-backtrace-native-core-biarch.sh \
> -       run-backtrace-core-x86_64.sh run-backtrace-core-i386.sh \
> -       run-backtrace-core-ppc.sh run-backtrace-core-s390x.sh \
> --      run-backtrace-core-s390.sh $(am__EXEEXT_2) $(am__append_8) \
> --      $(am__EXEEXT_4) $(am__append_11)
> --@STANDALONE_FALSE@am__append_6 = msg_tst md5-sha1-test
> -+      run-backtrace-core-s390.sh $(am__EXEEXT_2) $(am__append_9) \
> -+      $(am__EXEEXT_4) $(am__append_12)
> - @STANDALONE_FALSE@am__append_7 = msg_tst md5-sha1-test
> --@LZMA_TRUE@am__append_8 = run-readelf-s.sh run-dwflsyms.sh
> --@HAVE_LIBASM_TRUE@am__append_9 = $(asm_TESTS)
> -+@STANDALONE_FALSE@am__append_8 = msg_tst md5-sha1-test
> -+@LZMA_TRUE@am__append_9 = run-readelf-s.sh run-dwflsyms.sh
> - @HAVE_LIBASM_TRUE@am__append_10 = $(asm_TESTS)
> --@ENABLE_DWZ_TRUE@am__append_11 = run-readelf-dwz-multi.sh run-allfcts-multi.sh
> -+@HAVE_LIBASM_TRUE@am__append_11 = $(asm_TESTS)
> -+@ENABLE_DWZ_TRUE@am__append_12 = run-readelf-dwz-multi.sh run-allfcts-multi.sh
> - subdir = tests
> - ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
> - am__aclocal_m4_deps = $(top_srcdir)/m4/biarch.m4 \
> -@@ -780,6 +781,7 @@ INSTALL_PROGRAM = @INSTALL_PROGRAM@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -811,6 +813,7 @@ SHELL = @SHELL@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -870,12 +873,11 @@ top_build_prefix = @top_build_prefix@
> - top_builddir = @top_builddir@
> - top_srcdir = @top_srcdir@
> - zip_LIBS = @zip_LIBS@
> --AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. $(am__append_2)
> -+AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. $(am__append_3)
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> --      $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> --      $(am__append_1)
> -+      $(am__append_1) $(am__append_2)
> - @MUDFLAP_FALSE@libmudflap =
> - @MUDFLAP_TRUE@libmudflap = -lmudflap
> - COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage $(no_mudflap.os),\
> -@@ -885,7 +887,7 @@ CLEANFILES = *.gcno *.gcda
> - textrel_check = if $(READELF) -d $@ | fgrep -q TEXTREL; then exit 1; fi
> - @MUDFLAP_FALSE@BUILD_RPATH = \$$ORIGIN/../libasm:\$$ORIGIN/../libdw:\$$ORIGIN/../backends:\$$ORIGIN/../libelf
> - @MUDFLAP_TRUE@BUILD_RPATH = \$$ORIGIN/../backends
> --AM_LDFLAGS = $(am__append_3) $(am__append_4)
> -+AM_LDFLAGS = $(am__append_4) $(am__append_5)
> - @TESTS_RPATH_FALSE@tests_rpath = no
> - @TESTS_RPATH_TRUE@tests_rpath = yes
> - asm_TESTS = asm-tst1 asm-tst2 asm-tst3 asm-tst4 asm-tst5 \
> diff --git a/meta/recipes-devtools/elfutils/elfutils/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils/redhat-portability.diff
> index 4b3bd64..b8a912c 100644
> --- a/meta/recipes-devtools/elfutils/elfutils/redhat-portability.diff
> +++ b/meta/recipes-devtools/elfutils/elfutils/redhat-portability.diff
> @@ -50,44 +50,6 @@ Index: elfutils-0.148/backends/Makefile.am
>         $(textrel_check)
>
>   libebl_i386.so: $(cpu_i386)
> -Index: elfutils-0.148/backends/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/backends/Makefile.in   2010-06-28 19:07:33.000000000 +0000
> -+++ elfutils-0.148/backends/Makefile.in        2010-07-03 13:04:07.000000000 +0000
> -@@ -165,6 +165,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -194,6 +195,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -257,7 +259,7 @@
> -       -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> -       $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> -       $(am__append_1)
> - @MUDFLAP_FALSE@libmudflap =
> -@@ -698,7 +700,7 @@
> -       $(LINK) -shared -o $(@:.map=.so) \
> -               -Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
> -               -Wl,--version-script,$(@:.so=.map) \
> --              -Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw) $(libmudflap)
> -+              -Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw) $(libmudflap)
> -       $(textrel_check)
> -
> - libebl_i386.so: $(cpu_i386)
>  Index: elfutils-0.148/ChangeLog
>  ===================================================================
>  --- elfutils-0.148.orig/ChangeLog      2010-04-21 14:26:40.000000000 +0000
> @@ -172,26 +134,6 @@ Index: elfutils-0.148/config/eu.am
>             $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
>             $($(*F)_CFLAGS)
>
> -Index: elfutils-0.148/config/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/config/Makefile.in     2010-06-28 19:07:34.000000000 +0000
> -+++ elfutils-0.148/config/Makefile.in  2010-07-03 13:04:07.000000000 +0000
> -@@ -76,6 +76,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -105,6 +106,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
>  Index: elfutils-0.148/config.h.in
>  ===================================================================
>  --- elfutils-0.148.orig/config.h.in    2010-06-28 19:07:37.000000000 +0000
> @@ -349,35 +291,6 @@ Index: elfutils-0.148/lib/eu-config.h
>
>   #ifdef SHARED
>   # define OLD_VERSION(name, version) \
> -Index: elfutils-0.148/lib/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/lib/Makefile.in        2010-06-28 19:07:33.000000000 +0000
> -+++ elfutils-0.148/lib/Makefile.in     2010-07-03 13:04:07.000000000 +0000
> -@@ -99,6 +99,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -128,6 +129,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -190,7 +192,7 @@
> -       -I$(srcdir)/../libelf
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> -       $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> -       $(am__append_1) -fpic
> - @MUDFLAP_FALSE@libmudflap =
>  Index: elfutils-0.148/libasm/ChangeLog
>  ===================================================================
>  --- elfutils-0.148.orig/libasm/ChangeLog       2010-03-05 05:48:23.000000000 +0000
> @@ -394,35 +307,6 @@ Index: elfutils-0.148/libasm/ChangeLog
>   2005-02-15  Ulrich Drepper  <drepper@redhat.com>
>
>         * Makefile.am (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
> -Index: elfutils-0.148/libasm/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/libasm/Makefile.in     2010-06-28 19:07:33.000000000 +0000
> -+++ elfutils-0.148/libasm/Makefile.in  2010-07-03 13:04:07.000000000 +0000
> -@@ -147,6 +147,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -176,6 +177,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = 1
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -239,7 +241,7 @@
> -       -I$(top_srcdir)/libdw
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> -       $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> -       $(am__append_1)
> - @MUDFLAP_FALSE@libmudflap =
>  Index: elfutils-0.148/libcpu/ChangeLog
>  ===================================================================
>  --- elfutils-0.148.orig/libcpu/ChangeLog       2010-03-05 05:48:23.000000000 +0000
> @@ -461,35 +345,6 @@ Index: elfutils-0.148/libcpu/i386_disasm.c
>                         }
>                     }
>                   else
> -Index: elfutils-0.148/libcpu/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/libcpu/Makefile.in     2010-06-28 19:07:33.000000000 +0000
> -+++ elfutils-0.148/libcpu/Makefile.in  2010-07-03 13:04:07.000000000 +0000
> -@@ -116,6 +116,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = lex.$(<F:lex.l=)
> -@@ -145,6 +146,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -208,7 +210,7 @@
> -       -I$(srcdir)/../libdw -I$(srcdir)/../libasm
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> -       $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> -       $(am__append_1) -fpic -fdollars-in-identifiers
> - @MUDFLAP_FALSE@libmudflap =
>  Index: elfutils-0.148/libdw/ChangeLog
>  ===================================================================
>  --- elfutils-0.148.orig/libdw/ChangeLog        2010-06-28 19:05:56.000000000 +0000
> @@ -530,35 +385,6 @@ Index: elfutils-0.148/libdw/libdw.h
>   /* Return attribute code of given attribute.  */
>   __libdw_extern_inline unsigned int
>   dwarf_whatattr (Dwarf_Attribute *attr)
> -Index: elfutils-0.148/libdw/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/libdw/Makefile.in      2010-06-28 19:07:33.000000000 +0000
> -+++ elfutils-0.148/libdw/Makefile.in   2010-07-03 13:04:07.000000000 +0000
> -@@ -191,6 +191,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -220,6 +221,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = 1
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -282,7 +284,7 @@
> -       -I$(srcdir)/../libelf
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> -       $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> -       $(am__append_1) $(am__append_2)
> - @MUDFLAP_FALSE@libmudflap =
>  Index: elfutils-0.148/libdwfl/ChangeLog
>  ===================================================================
>  --- elfutils-0.148.orig/libdwfl/ChangeLog      2010-06-28 19:05:56.000000000 +0000
> @@ -575,35 +401,6 @@ Index: elfutils-0.148/libdwfl/ChangeLog
>         * Makefile.am (noinst_HEADERS): Add loc2c.c.
>
>         * test2.c (main): Check sscanf result to quiet warning.
> -Index: elfutils-0.148/libdwfl/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/libdwfl/Makefile.in    2010-06-28 19:07:33.000000000 +0000
> -+++ elfutils-0.148/libdwfl/Makefile.in 2010-07-03 13:04:07.000000000 +0000
> -@@ -181,6 +181,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -210,6 +211,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = 1
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -273,7 +275,7 @@
> -       -I$(srcdir)/../libdw
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> -       $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> -       $(am__append_1)
> - @MUDFLAP_FALSE@libmudflap =
>  Index: elfutils-0.148/libebl/ChangeLog
>  ===================================================================
>  --- elfutils-0.148.orig/libebl/ChangeLog       2010-03-05 05:48:23.000000000 +0000
> @@ -620,35 +417,6 @@ Index: elfutils-0.148/libebl/ChangeLog
>   2005-05-21  Ulrich Drepper  <drepper@redhat.com>
>
>         * libebl_x86_64.map: Add x86_64_core_note.
> -Index: elfutils-0.148/libebl/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/libebl/Makefile.in     2010-06-28 19:07:34.000000000 +0000
> -+++ elfutils-0.148/libebl/Makefile.in  2010-07-03 13:04:07.000000000 +0000
> -@@ -143,6 +143,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -172,6 +173,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = 1
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -235,7 +237,7 @@
> -       -I$(srcdir)/../libasm
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> -       $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> -       $(am__append_1) -fpic
> - @MUDFLAP_FALSE@libmudflap =
>  Index: elfutils-0.148/libelf/ChangeLog
>  ===================================================================
>  --- elfutils-0.148.orig/libelf/ChangeLog       2010-06-14 21:17:20.000000000 +0000
> @@ -687,75 +455,6 @@ Index: elfutils-0.148/libelf/common.h
>               : (sizeof (Var) == 4                                            \
>                  ? bswap_32 (Var)                                             \
>                  : bswap_64 (Var))))
> -Index: elfutils-0.148/libelf/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/libelf/Makefile.in     2010-06-28 19:07:34.000000000 +0000
> -+++ elfutils-0.148/libelf/Makefile.in  2010-07-03 13:04:07.000000000 +0000
> -@@ -189,6 +189,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -218,6 +219,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = 1
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -279,7 +281,7 @@
> - INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> -       $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> -       $(am__append_1) $(am__append_2)
> - @MUDFLAP_FALSE@libmudflap =
> -Index: elfutils-0.148/m4/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/m4/Makefile.in 2010-06-28 19:07:34.000000000 +0000
> -+++ elfutils-0.148/m4/Makefile.in      2010-07-03 13:04:07.000000000 +0000
> -@@ -75,6 +75,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -104,6 +105,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -Index: elfutils-0.148/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/Makefile.in    2010-06-28 19:07:33.000000000 +0000
> -+++ elfutils-0.148/Makefile.in 2010-07-03 13:04:07.000000000 +0000
> -@@ -155,6 +155,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -184,6 +185,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
>  Index: elfutils-0.148/src/addr2line.c
>  ===================================================================
>  --- elfutils-0.148.orig/src/addr2line.c        2010-05-28 14:38:30.000000000 +0000
> @@ -908,45 +607,7 @@ Index: elfutils-0.148/src/Makefile.am
>   readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
>   nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
>   size_LDADD = $(libelf) $(libeu) $(libmudflap)
> -Index: elfutils-0.148/src/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/src/Makefile.in        2010-06-28 19:07:34.000000000 +0000
> -+++ elfutils-0.148/src/Makefile.in     2010-07-03 13:04:08.000000000 +0000
> -@@ -228,6 +228,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -257,6 +258,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -321,7 +323,7 @@
> -       -I$(srcdir)/../libasm
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> -       $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> -       $(am__append_1)
> - @MUDFLAP_FALSE@libmudflap =
> -@@ -368,6 +370,9 @@
> - addr2line_no_Wformat = yes
> - # XXX While the file is not finished, don't warn about this
> - ldgeneric_no_Wunused = yes
> -+
> -+# Buggy old compilers.
> -+readelf_no_Werror = yes
> - readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
> - nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
> - size_LDADD = $(libelf) $(libeu) $(libmudflap)
> +
>  Index: elfutils-0.148/src/readelf.c
>  ===================================================================
>  --- elfutils-0.148.orig/src/readelf.c  2010-06-28 19:05:56.000000000 +0000
> @@ -1093,32 +754,3 @@ Index: elfutils-0.148/tests/line2addr.c
>         {
>         default:
>         case 0:
> -Index: elfutils-0.148/tests/Makefile.in
> -===================================================================
> ---- elfutils-0.148.orig/tests/Makefile.in      2010-06-28 19:07:34.000000000 +0000
> -+++ elfutils-0.148/tests/Makefile.in   2010-07-03 13:04:08.000000000 +0000
> -@@ -372,6 +372,7 @@
> - INSTALL_SCRIPT = @INSTALL_SCRIPT@
> - INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
> - LDFLAGS = @LDFLAGS@
> -+LD_AS_NEEDED = @LD_AS_NEEDED@
> - LEX = @LEX@
> - LEXLIB = @LEXLIB@
> - LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
> -@@ -401,6 +402,7 @@
> - STRIP = @STRIP@
> - USE_NLS = @USE_NLS@
> - VERSION = @VERSION@
> -+WEXTRA = @WEXTRA@
> - XGETTEXT = @XGETTEXT@
> - XGETTEXT_015 = @XGETTEXT_015@
> - XGETTEXT_EXTRA_OPTIONS = @XGETTEXT_EXTRA_OPTIONS@
> -@@ -462,7 +464,7 @@
> - INCLUDES = -I. -I$(srcdir) -I$(top_srcdir)/lib -I.. $(am__append_2)
> - AM_CFLAGS = -std=gnu99 -Wall -Wshadow $(if \
> -       $($(*F)_no_Werror),,-Werror) $(if \
> --      $($(*F)_no_Wunused),,-Wunused -Wextra) $(if \
> -+      $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) $(if \
> -       $($(*F)_no_Wformat),-Wno-format,-Wformat=2) $($(*F)_CFLAGS) \
> -       $(am__append_1)
> - @MUDFLAP_FALSE@libmudflap =
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

