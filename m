Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.31880.1585204150591728010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 23:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QFz7YQ04;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id i13so2286399pfe.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 23:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9a7ChGZfAEl+22rokCyQ8+RjwiQGRdh3ouG2KnKguU=;
        b=QFz7YQ047ygYXHH9g3K/l8XYfyV59xu0TXKuLtCALUcMEeA02ZFi4lWuXNkZABcxzv
         HxUC9HeKgpVcZvNbegH8Li0iSlXfnnBScdwAz3QspfXntCq5L6pTi7VEWz7WJxh4name
         TK7pXRGaoAMIvFKfJE/ssQNFQR2JKcJlWDb7waGtQQDG1DzqpQDuM2EYFp36BlOut2dE
         Jka5aeexlgiggXPD79IuF8XLb3HQVxX5gD2FSGfKDYNS+oELiTZ7voTg9y7vo/duOZEh
         zZIw/OfTwV/M69+eE2JcfU80uxDfA5PKnyVca7lq/TVBN0+910Wl/Nc4ZWOlMmlDQZAY
         ocyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9a7ChGZfAEl+22rokCyQ8+RjwiQGRdh3ouG2KnKguU=;
        b=aAyvaSG9TQqmXdjEU7/9BukShZ5ZraGguwpl8Azn/95iAPoUZdRDr2tFaPno+pCHNN
         c7x4FEaKHEcpbtAAIwnCmlACYflkPrhMLRSXy5RmemcNNrv/L0ikwVbudKPPruKo7Fvf
         XzJl8OzmTQFC4vlRirKyC7iyhGTxcGLOwQsb8Uc6C85LzS68zT3f4sreAhgrA/zQRYp8
         o7ZW8Fx5dVPpwkXZI+beQ3hWFIJcPv819wo2isUg2rZrjawU3NhuhuqDhOqMwUrC32Op
         jOI3ETofCWTPhgr8GzDBeWGCc2lyBLH41wTjJyfD4Vgg+c3z/0CtXkvXlTKebyVG/Znu
         9VKw==
X-Gm-Message-State: ANhLgQ0BTIvKl8JjW5e8dGfcs7szwUTiCOKbK8LoMvfPt72nm1mH2s3V
	09udxyEZqLYp+1wqnkNYhMmtroF/KU4=
X-Google-Smtp-Source: ADFU+vseoZH41g9PQSPsv91sljIz9+4mk8IQDKbFdpa5o0NjH5L6r2qsBPJBrKUcsVtrDTTHnhIneQ==
X-Received: by 2002:a63:30c4:: with SMTP id w187mr7117555pgw.239.1585204149292;
        Wed, 25 Mar 2020 23:29:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6809])
        by smtp.gmail.com with ESMTPSA id gx22sm822065pjb.43.2020.03.25.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 23:29:08 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Backport patch to fix ifuncs on risc-v and gcc10 builds
Date: Wed, 25 Mar 2020 23:29:19 -0700
Message-Id: <20200326062919.1929050-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifunc patch is needed to address a glibc ptests failure on riscv
long double double patch is backported to let 2.31 build with gcc10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0030-Improve-IFUNC-check-BZ-25506.patch   |  47 +++++
 ...-with-GCC-10-when-long-double-double.patch | 170 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   2 +
 3 files changed, 219 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0031-Fix-build-with-GCC-10-when-long-double-double.patch

diff --git a/meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch b/meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch
new file mode 100644
index 0000000000..1cb398d2bc
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch
@@ -0,0 +1,47 @@
+From 87a698a21646b7ee620923ef5ffa9735471a8ddd Mon Sep 17 00:00:00 2001
+From: Fangrui Song <maskray@google.com>
+Date: Tue, 4 Feb 2020 21:55:44 -0800
+Subject: [PATCH] Improve IFUNC check [BZ #25506]
+
+GNU ld's RISCV port does not support IFUNC. ld -no-pie produces no
+relocation and the test passed incorrectly. Be more rigid by testing
+IRELATIVE explicitly.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=87a698a21646b7ee620923ef5ffa9735471a8ddd]
+Tested-by: Aurelien Jarno <aurelien@aurel32.net>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index b959d2d988..3b98ec312f 100755
+--- a/configure
++++ b/configure
+@@ -4035,7 +4035,7 @@ if ${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS \
+ 	    -o conftest conftest.S 1>&5 2>&5; then
+   # Do a link to see if the backend supports IFUNC relocs.
+   $READELF -r conftest 1>&5
+-  LC_ALL=C $READELF -r conftest | grep 'no relocations' >/dev/null || {
++  LC_ALL=C $READELF -Wr conftest | grep -q 'IRELATIVE\|R_SPARC_JMP_IREL' && {
+     libc_cv_ld_gnu_indirect_function=yes
+   }
+ fi
+diff --git a/configure.ac b/configure.ac
+index 49b900c1ed..e20034f301 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -649,7 +649,7 @@ if ${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS \
+ 	    -o conftest conftest.S 1>&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD; then
+   # Do a link to see if the backend supports IFUNC relocs.
+   $READELF -r conftest 1>&AS_MESSAGE_LOG_FD
+-  LC_ALL=C $READELF -r conftest | grep 'no relocations' >/dev/null || {
++  LC_ALL=C $READELF -Wr conftest | grep -q 'IRELATIVE\|R_SPARC_JMP_IREL' && {
+     libc_cv_ld_gnu_indirect_function=yes
+   }
+ fi
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/glibc/glibc/0031-Fix-build-with-GCC-10-when-long-double-double.patch b/meta/recipes-core/glibc/glibc/0031-Fix-build-with-GCC-10-when-long-double-double.patch
new file mode 100644
index 0000000000..72622961ad
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-Fix-build-with-GCC-10-when-long-double-double.patch
@@ -0,0 +1,170 @@
+From 49348beafe9ba150c9bd48595b3f372299bddbb0 Mon Sep 17 00:00:00 2001
+From: Joseph Myers <joseph@codesourcery.com>
+Date: Tue, 17 Mar 2020 22:57:42 +0000
+Subject: [PATCH] Fix build with GCC 10 when long double = double.
+
+On platforms where long double has the same ABI as double, glibc
+defines long double functions as aliases for the corresponding double
+functions.  The declarations of those functions in <math.h> are
+disabled to avoid problems with aliases having incompatible types, but
+GCC 10 now gives errors for incompatible types when the long double
+function is known to GCC as a built-in function, not just when there
+is an incompatible header declaration.
+
+This patch fixes those errors by using appropriate
+-fno-builtin-<function> options to compile the double functions.  The
+list of CFLAGS-* settings is an appropriately adapted version of that
+in sysdeps/ieee754/ldbl-opt/Makefile used there for building nldbl-*.c
+files; in particular, the options are used even if GCC does not
+currently have a built-in function of a given function, so that adding
+such a built-in function in future will not break the glibc build.
+Thus, various of the CFLAGS-* settings are only for future-proofing
+and may not currently be needed (and it's possible some could be
+irrelevant for other reasons).
+
+Tested with build-many-glibcs.py for arm-linux-gnueabi (compilers and
+glibcs builds), where it fixes the build that previously failed.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=49348beafe9ba150c9bd48595b3f372299bddbb0]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ math/Makefile | 122 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 122 insertions(+)
+
+diff --git a/math/Makefile b/math/Makefile
+index 84a8b94c74..0a5a40430e 100644
+--- a/math/Makefile
++++ b/math/Makefile
+@@ -650,6 +650,128 @@ ifneq ($(long-double-fcts),yes)
+ # We won't compile the `long double' code at all.  Tell the `double' code
+ # to define aliases for the `FUNCl' names.
+ math-CPPFLAGS += -DNO_LONG_DOUBLE
++# GCC 10 diagnoses aliases with types conflicting with built-in
++# functions.
++CFLAGS-w_acos.c += -fno-builtin-acosl
++CFLAGS-w_acosh.c += -fno-builtin-acoshl
++CFLAGS-w_asin.c += -fno-builtin-asinl
++CFLAGS-s_asinh.c += -fno-builtin-asinhl
++CFLAGS-s_atan.c += -fno-builtin-atanl
++CFLAGS-w_atan2.c += -fno-builtin-atan2l
++CFLAGS-w_atanh.c += -fno-builtin-atanhl
++CFLAGS-s_cabs.c += -fno-builtin-cabsl
++CFLAGS-s_cacos.c += -fno-builtin-cacosl
++CFLAGS-s_cacosh.c += -fno-builtin-cacoshl
++CFLAGS-s_canonicalize.c += -fno-builtin-canonicalizel
++CFLAGS-s_carg.c += -fno-builtin-cargl
++CFLAGS-s_casin.c += -fno-builtin-casinl
++CFLAGS-s_casinh.c += -fno-builtin-casinhl
++CFLAGS-s_catan.c += -fno-builtin-catanl
++CFLAGS-s_catanh.c += -fno-builtin-catanhl
++CFLAGS-s_cbrt.c += -fno-builtin-cbrtl
++CFLAGS-s_ccos.c += -fno-builtin-ccosl
++CFLAGS-s_ccosh.c += -fno-builtin-ccoshl
++CFLAGS-s_ceil.c += -fno-builtin-ceill
++CFLAGS-s_cexp.c += -fno-builtin-cexpl
++CFLAGS-s_cimag.c += -fno-builtin-cimagl
++CFLAGS-s_clog.c += -fno-builtin-clogl
++CFLAGS-s_clog10.c += -fno-builtin-clog10l
++CFLAGS-s_conj.c += -fno-builtin-conjl
++CFLAGS-s_copysign.c += -fno-builtin-copysignl
++CFLAGS-s_cos.c += -fno-builtin-cosl
++CFLAGS-w_cosh.c += -fno-builtin-coshl
++CFLAGS-s_cpow.c += -fno-builtin-cpowl
++CFLAGS-s_cproj.c += -fno-builtin-cprojl
++CFLAGS-s_creal.c += -fno-builtin-creall
++CFLAGS-s_csin.c += -fno-builtin-csinl
++CFLAGS-s_csinh.c += -fno-builtin-csinhl
++CFLAGS-s_csqrt.c += -fno-builtin-csqrtl
++CFLAGS-s_ctan.c += -fno-builtin-ctanl
++CFLAGS-s_ctanh.c += -fno-builtin-ctanhl
++CFLAGS-s_dadd.c += -fno-builtin-daddl
++CFLAGS-s_ddiv.c += -fno-builtin-ddivl
++CFLAGS-s_dmul.c += -fno-builtin-dmull
++CFLAGS-s_dsub.c += -fno-builtin-dsubl
++CFLAGS-s_erf.c += -fno-builtin-erfl
++CFLAGS-s_erfc.c += -fno-builtin-erfcl
++CFLAGS-e_exp.c += -fno-builtin-expl
++CFLAGS-w_exp10.c += -fno-builtin-exp10l
++CFLAGS-e_exp2.c += -fno-builtin-exp2l
++CFLAGS-s_expm1.c += -fno-builtin-expm1l
++CFLAGS-s_fabs.c += -fno-builtin-fabsl
++CFLAGS-s_fadd.c += -fno-builtin-faddl
++CFLAGS-s_fdim.c += -fno-builtin-fdiml
++CFLAGS-s_fdiv.c += -fno-builtin-fdivl
++CFLAGS-s_finite.c += -fno-builtin-finitel
++CFLAGS-s_floor.c += -fno-builtin-floorl
++CFLAGS-s_fma.c += -fno-builtin-fmal
++CFLAGS-s_fmax.c += -fno-builtin-fmaxl
++CFLAGS-s_fmaxmag.c += -fno-builtin-fmaxmagl
++CFLAGS-s_fmin.c += -fno-builtin-fminl
++CFLAGS-s_fminmag.c += -fno-builtin-fminmagl
++CFLAGS-w_fmod.c += -fno-builtin-fmodl
++CFLAGS-s_fmul.c += -fno-builtin-fmull
++CFLAGS-s_frexp.c += -fno-builtin-frexpl
++CFLAGS-s_fromfp.c += -fno-builtin-fromfpl
++CFLAGS-s_fromfpx.c += -fno-builtin-fromfpxl
++CFLAGS-s_fsub.c += -fno-builtin-fsubl
++CFLAGS-s_gamma.c += -fno-builtin-gammal
++CFLAGS-s_getpayload.c += -fno-builtin-getpayloadl
++CFLAGS-w_hypot.c += -fno-builtin-hypotl
++CFLAGS-w_ilogb.c += -fno-builtin-ilogbl
++CFLAGS-s_isinf.c += -fno-builtin-isinfl
++CFLAGS-s_isnan.c += -fno-builtin-isnanl
++CFLAGS-w_j0.c += -fno-builtin-j0l
++CFLAGS-w_j1.c += -fno-builtin-j1l
++CFLAGS-w_jn.c += -fno-builtin-jnl
++CFLAGS-s_ldexp.c += -fno-builtin-ldexpl
++CFLAGS-w_lgamma.c += -fno-builtin-lgammal
++CFLAGS-w_lgamma_r.c += -fno-builtin-lgammal_r
++CFLAGS-w_llogb.c += -fno-builtin-llogbl
++CFLAGS-s_llrint.c += -fno-builtin-llrintl
++CFLAGS-s_llround.c += -fno-builtin-llroundl
++CFLAGS-e_log.c += -fno-builtin-logl
++CFLAGS-w_log10.c += -fno-builtin-log10l
++CFLAGS-w_log1p.c += -fno-builtin-log1pl
++CFLAGS-e_log2.c += -fno-builtin-log2l
++CFLAGS-s_logb.c += -fno-builtin-logbl
++CFLAGS-s_lrint.c += -fno-builtin-lrintl
++CFLAGS-s_lround.c += -fno-builtin-lroundl
++CFLAGS-s_modf.c += -fno-builtin-modfl
++CFLAGS-s_nan.c += -fno-builtin-nanl
++CFLAGS-s_nearbyint.c += -fno-builtin-nearbyintl
++CFLAGS-s_nextafter.c += -fno-builtin-nextafterl
++CFLAGS-s_nextdown.c += -fno-builtin-nextdownl
++CFLAGS-s_nexttoward.c += -fno-builtin-nexttoward -fno-builtin-nexttowardl
++CFLAGS-s_nexttowardf.c += -fno-builtin-nexttowardf
++CFLAGS-s_nextup.c += -fno-builtin-nextupl
++CFLAGS-e_pow.c += -fno-builtin-powl
++CFLAGS-w_remainder.c += -fno-builtin-remainderl -fno-builtin-dreml
++CFLAGS-s_remquo.c += -fno-builtin-remquol
++CFLAGS-s_rint.c += -fno-builtin-rintl
++CFLAGS-s_round.c += -fno-builtin-roundl
++CFLAGS-s_roundeven.c += -fno-builtin-roundevenl
++CFLAGS-w_scalb.c += -fno-builtin-scalbl
++CFLAGS-w_scalbln.c += -fno-builtin-scalblnl
++CFLAGS-s_scalbn.c += -fno-builtin-scalbnl
++CFLAGS-s_setpayload.c += -fno-builtin-setpayloadl
++CFLAGS-s_setpayloadsig.c += -fno-builtin-setpayloadsigl
++CFLAGS-s_significand.c += -fno-builtin-significandl
++CFLAGS-s_sin.c += -fno-builtin-sinl
++CFLAGS-s_sincos.c += -fno-builtin-sincosl
++CFLAGS-w_sinh.c += -fno-builtin-sinhl
++CFLAGS-w_sqrt.c += -fno-builtin-sqrtl
++CFLAGS-s_tan.c += -fno-builtin-tanl
++CFLAGS-s_tanh.c += -fno-builtin-tanhl
++CFLAGS-w_tgamma.c += -fno-builtin-tgammal
++CFLAGS-s_totalorder.c += -fno-builtin-totalorderl
++CFLAGS-s_totalordermag.c += -fno-builtin-totalordermagl
++CFLAGS-s_trunc.c += -fno-builtin-truncl
++CFLAGS-s_ufromfp.c += -fno-builtin-ufromfpl
++CFLAGS-s_ufromfpx.c += -fno-builtin-ufromfpxl
++CFLAGS-s_y0.c += -fno-builtin-y0l
++CFLAGS-s_y1.c += -fno-builtin-y1l
++CFLAGS-s_yn.c += -fno-builtin-ynl
+ endif
+ 
+ # These files quiet sNaNs in a way that is optimized away without
+-- 
+2.26.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 6dd9415f6b..6605fd3967 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -41,6 +41,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://CVE-2020-10029.patch \
+           file://0030-Improve-IFUNC-check-BZ-25506.patch \
+           file://0031-Fix-build-with-GCC-10-when-long-double-double.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.26.0

