Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id AB25E744D2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:18 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id z129-v6so747311pgz.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ddPFADgXP3hAlwlekExbYnM/xAMwS2oXFY8YY+wJbpU=;
	b=oAC5nPsebV8SgJxfnb5ueAD/VwzdAwci+udzmbKUfMarAz1tCw69cNCGnvpBI/239J
	KPVIyakq9EpQfhPhBts7/GO4cYrH6n4iXVwk/r8WombfHnJsMKS776Tx90R3F/a38Ne+
	zD/qgpEemooYn9z3tNN+QXtN/75luFC+Y5bOloWoo8TwbzNOwoVmuNPRCs1EWA04RxKx
	PsTv4JGw/LaEEzqoRXWOBXDkm2aE2rHe9/YAA2eaV1afU2i8If+h1BCXDlc7EnizVYdj
	LZDiJo7EpyTQwVrzVQjFVnkzle4Vd9arGPFZ3B9u8sfrHHT/aiG2qFbGatKbJqH+nXBQ
	fOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ddPFADgXP3hAlwlekExbYnM/xAMwS2oXFY8YY+wJbpU=;
	b=V6W0bL3sw8y4uOnyqAMFrKD9q9LrwsDX6CsP67ADZ/46DO7cZmFQ7LHT0Lmd+Ok2Bo
	WY0yNg5e/mYUvlC2t7FW7BuY2phHofbD8eL4GIyQTmcKmWr0xUSVbxsvOrMlHBaH9E5L
	OdmlQviJuzMVisElR5qfqfc0R5pL4LDgy36CIXNOL5pvkI+KbUdHstpuYFQ5vezIpYVH
	37HyK/L/mnFDzhXKVciUmIhJzIuddqBmX2isuckRdIP3nUvUBOfUXJ/2NqxjtQ5BJTZp
	JsRnn4crAbg8BOBi9aQgqcbIFi1aEutu1+rkdL4VNbp7r8eWwcAW4acL95Nqy8vp9AZH
	zJKA==
X-Gm-Message-State: ALQs6tDB/Rk/c8ng24u6WtAW3Z6Dt3+JyyANiCyhBo65Denu0bu2k6G2
	VF6L/Z0jmjgF0LHP9pBESGN89g==
X-Google-Smtp-Source: AB8JxZrylOyMuZ7bpirV8LNiKlRfwjl91lvo5NvFYoAJ7A78Q8KRMOTSHB4bpPif3MnccS9IzMKhhA==
X-Received: by 10.98.127.145 with SMTP id a139mr9616058pfd.25.1525030579121;
	Sun, 29 Apr 2018 12:36:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:50 -0700
Message-Id: <21d44f26de7793f64a78548457ed16d126d13e16.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 03/24] gcc-runtime: Disable gcc version of libssp
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:19 -0000

libssp is implemented fully in glibc as well as in musl
so we really do not need the gcc version of this library
except may be for mingw, where we keep it enabled anyway
gcc in OE is built with the knowledge that C library
already provides libssp implementation, we should therefore
not need the gcc implementation of same.

libssp_nonshared piece is a detail which is needed when gcc
is the compiler, in glibc this is part of libc_nonshared.a
already and libc_nonshared.a is linked always when linking
with -lc becuase libc.so in glibc is actually a linker script

GROUP ( /usr/lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /usr/lib/ld-linux-x86-64.so.2 ) )

which automatically links in the needed runtime bits, this however
is not the case for musl, where core SSP APIs are implemented in full
but compiler specific runtime isn't, for this we add a new package
called libssp_nonshared which generate the needed runtime stub
and gcc is already carrying patch to link to libssp_nonshared.a
on musl

This should fix a long standing problem where static PIE executable
were not buildable with OE since it was conflicting SSP implementation
one from C library and the other one from gcc and we end up with
duplicate symbol errors during linking.

Backport a patch from trunk which enhances enable|disable-libssp
to not only disable building libssp but also not emit the gcc
specs to use it for subsequent linking when stack-protector options
are used on compiler cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc         |   7 +-
 ...cc-override-TARGET_LIBC_PROVIDES_SSP.patch | 204 ++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   4 +-
 3 files changed, 212 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index d968c322d2..0586182282 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
            file://0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0047-sync-gcc-stddef.h-with-musl.patch \
            file://0048-gcc-Enable-static-PIE.patch \
+           file://0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch \
            file://fix-segmentation-fault-precompiled-hdr.patch \
            file://no-sse-fix-test-case-failures.patch \
            ${BACKPORTS} \
@@ -93,10 +94,12 @@ FORTRAN = ""
 JAVA = ""
 
 LTO = "--enable-lto"
+SSP ?= "--disable-libssp"
+SSP_mingw32 = "--enable-libssp"
 
 EXTRA_OECONF_BASE = "\
     ${LTO} \
-    --enable-libssp \
+    ${SSP} \
     --enable-libitm \
     --disable-bootstrap \
     --disable-libmudflap \
@@ -120,7 +123,7 @@ EXTRA_OECONF_INITIAL = "\
     --disable-plugin \
     --enable-decimal-float=no \
     --without-isl \
-    gcc_cv_libc_provides_ssp=yes \
+    --disable-libssp \
 "
 
 EXTRA_OECONF_PATHS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch b/meta/recipes-devtools/gcc/gcc-7.3/0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch
new file mode 100644
index 0000000000..7c53c95c3a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch
@@ -0,0 +1,204 @@
+From 9815bd97561c778ee0bc0c17f245e88e66570111 Mon Sep 17 00:00:00 2001
+From: sandra <sandra@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 1 Nov 2017 02:14:19 +0000
+Subject: [PATCH] 2017-10-31  Sandra Loosemore  <sandra@codesourcery.com>
+
+	gcc/
+	* configure.ac (--enable-libssp): New.
+	(gcc_cv_libc_provides_ssp): Check for explicit setting before
+	trying to determine target-specific default.  Adjust indentation.
+	* configure: Regenerated.
+	* doc/install.texi (Configuration): Expand --disable-libssp
+	documentation.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@254288 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://patchwork.ozlabs.org/patch/823049/]
+
+ gcc/ChangeLog        |  9 +++++++++
+ gcc/configure        | 26 +++++++++++++++++++++++---
+ gcc/configure.ac     | 24 ++++++++++++++++++++----
+ gcc/doc/install.texi |  3 ++-
+ 4 files changed, 54 insertions(+), 8 deletions(-)
+
+Index: gcc-7.3.0/gcc/configure.ac
+===================================================================
+--- gcc-7.3.0.orig/gcc/configure.ac
++++ gcc-7.3.0/gcc/configure.ac
+@@ -5719,10 +5719,25 @@ if test x$gcc_cv_solaris_crts = xyes; th
+   	    [Define if the system-provided CRTs are present on Solaris.])
+ fi
+ 
++AC_ARG_ENABLE(libssp,
++[AS_HELP_STRING([--enable-libssp], [enable linking against libssp])],
++[case "${enableval}" in
++  yes|no)
++    ;;
++  *)
++    AC_MSG_ERROR([unknown libssp setting $enableval])
++    ;;
++esac], [])
++
+ # Test for stack protector support in target C library.
+ AC_CACHE_CHECK(__stack_chk_fail in target C library,
+-      gcc_cv_libc_provides_ssp,
+-      [gcc_cv_libc_provides_ssp=no
++  gcc_cv_libc_provides_ssp,
++  [gcc_cv_libc_provides_ssp=no
++  if test "x$enable_libssp" = "xno"; then
++    gcc_cv_libc_provides_ssp=yes
++  elif test "x$enable_libssp" = "xyes"; then
++    gcc_cv_libc_provides_ssp=no
++  else
+     case "$target" in
+        *-*-musl*)
+ 	 # All versions of musl provide stack protector
+@@ -5759,8 +5774,9 @@ AC_CACHE_CHECK(__stack_chk_fail in targe
+ 	 AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
+            [echo "no __stack_chk_fail on this target"])
+         ;;
+-  *) gcc_cv_libc_provides_ssp=no ;;
+-    esac])
++       *) gcc_cv_libc_provides_ssp=no ;;
++    esac
++  fi])
+ 
+ if test x$gcc_cv_libc_provides_ssp = xyes; then
+   AC_DEFINE(TARGET_LIBC_PROVIDES_SSP, 1,
+Index: gcc-7.3.0/gcc/doc/install.texi
+===================================================================
+--- gcc-7.3.0.orig/gcc/doc/install.texi
++++ gcc-7.3.0/gcc/doc/install.texi
+@@ -1658,7 +1658,8 @@ not be built.
+ 
+ @item --disable-libssp
+ Specify that the run-time libraries for stack smashing protection
+-should not be built.
++should not be built or linked against.  On many targets library support
++is provided by the C library instead.
+ 
+ @item --disable-libquadmath
+ Specify that the GCC quad-precision math library should not be built.
+Index: gcc-7.3.0/gcc/configure
+===================================================================
+--- gcc-7.3.0.orig/gcc/configure
++++ gcc-7.3.0/gcc/configure
+@@ -940,6 +940,7 @@ enable_fix_cortex_a53_843419
+ with_glibc_version
+ enable_gnu_unique_object
+ enable_linker_build_id
++enable_libssp
+ enable_default_ssp
+ with_long_double_128
+ with_gc
+@@ -1679,6 +1680,7 @@ Optional Features:
+                           extension on glibc systems
+   --enable-linker-build-id
+                           compiler will always pass --build-id to linker
++  --enable-libssp         enable linking against libssp
+   --enable-default-ssp    enable Stack Smashing Protection as default
+   --enable-maintainer-mode
+                           enable make rules and dependencies not useful (and
+@@ -18450,7 +18452,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 18436 "configure"
++#line 18455 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -18556,7 +18558,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 18542 "configure"
++#line 18561 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -25234,6 +25236,7 @@ $as_echo "#define HAVE_AS_SPARC5_VIS4 1"
+ 
+ fi
+ 
++
+     { $as_echo "$as_me:${as_lineno-$LINENO}: checking assembler for SPARC6 instructions" >&5
+ $as_echo_n "checking assembler for SPARC6 instructions... " >&6; }
+ if test "${gcc_cv_as_sparc_sparc6+set}" = set; then :
+@@ -25270,6 +25273,7 @@ $as_echo "#define HAVE_AS_SPARC6 1" >>co
+ 
+ fi
+ 
++
+     { $as_echo "$as_me:${as_lineno-$LINENO}: checking assembler for LEON instructions" >&5
+ $as_echo_n "checking assembler for LEON instructions... " >&6; }
+ if test "${gcc_cv_as_sparc_leon+set}" = set; then :
+@@ -28947,6 +28951,18 @@ $as_echo "#define HAVE_SOLARIS_CRTS 1" >
+ 
+ fi
+ 
++# Check whether --enable-libssp was given.
++if test "${enable_libssp+set}" = set; then :
++  enableval=$enable_libssp; case "${enableval}" in
++  yes|no)
++    ;;
++  *)
++    as_fn_error "unknown libssp setting $enableval" "$LINENO" 5
++    ;;
++esac
++fi
++
++
+ # Test for stack protector support in target C library.
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking __stack_chk_fail in target C library" >&5
+ $as_echo_n "checking __stack_chk_fail in target C library... " >&6; }
+@@ -28954,6 +28970,11 @@ if test "${gcc_cv_libc_provides_ssp+set}
+   $as_echo_n "(cached) " >&6
+ else
+   gcc_cv_libc_provides_ssp=no
++  if test "x$enable_libssp" = "xno"; then
++    gcc_cv_libc_provides_ssp=yes
++  elif test "x$enable_libssp" = "xyes"; then
++    gcc_cv_libc_provides_ssp=no
++  else
+     case "$target" in
+        *-*-musl*)
+ 	 # All versions of musl provide stack protector
+@@ -29001,8 +29022,9 @@ else
+ fi
+ 
+         ;;
+-  *) gcc_cv_libc_provides_ssp=no ;;
++       *) gcc_cv_libc_provides_ssp=no ;;
+     esac
++  fi
+ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_libc_provides_ssp" >&5
+ $as_echo "$gcc_cv_libc_provides_ssp" >&6; }
+@@ -29037,18 +29059,15 @@ fi
+ 
+ 
+ # Test for <sys/sdt.h> on the target.
+-
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
+-$as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
+-have_sys_sdt_h=no
++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
++#have_sys_sdt_h=no
+ #if test -f $target_header_dir/sys/sdt.h; then
+ #  have_sys_sdt_h=yes
+-#
+-#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
+-#
++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
++#            [Define if your target C library provides sys/sdt.h])
+ #fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
+-$as_echo "$have_sys_sdt_h" >&6; }
++#AC_MSG_RESULT($have_sys_sdt_h)
+ 
+ # Check if TFmode long double should be used by default or not.
+ # Some glibc targets used DFmode long double, but with glibc 2.4
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 7629fa56ff..72b8081cd3 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -22,8 +22,10 @@ RUNTIMELIBITM_nios2 = ""
 RUNTIMELIBITM_microblaze = ""
 RUNTIMELIBITM_riscv32 = ""
 RUNTIMELIBITM_riscv64 = ""
+RUNTIMELIBSSP ?= ""
+RUNTIMELIBSSP_mingw32 ?= "libssp"
 
-RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
+RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
 "
 RUNTIMETARGET_append_x86 = " libmpx"
-- 
2.17.0


