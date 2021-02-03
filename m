Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.129.1612397196016903440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 16:06:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g3wubtVF;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id z21so893685pgj.4
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pYHWJXzFY4YDgJM38pINd4y9a/9ivE1ifr+lNld7pKk=;
        b=g3wubtVFatugzSNJ2AyRSXMRYYaLKF6Tt6Gwr2EMHX7vV6lekA4ixblhyenNoiY/fi
         YEzQ5FvyDHq12LI765NAsqfpII/SUZjPo9V2B/KAqmMqjVlnKLXvBje3fQ+X1EfdvV4b
         iHkIBuPLyRNhQk5Uy58cOTq/LteynGigWxMr48QghsgQHKnMo0MXmt9hosH2QoIbIgUd
         FGZr/XYIUznPywdL1tv15TEKs7YVRSJGX1QGSSb/KxPgfpPsxVFgeYRCP2w2iurcd8pF
         PgKwzsNlHeQ6G2iw+eJxzbKfI46Mp6jxFLVGFapzTkjkTw2VWQN02yd60PXL8lObmx/3
         rrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pYHWJXzFY4YDgJM38pINd4y9a/9ivE1ifr+lNld7pKk=;
        b=NxNV0MOBSrEhbn2nqo1RCTrLEscPDxU61Djk0byl5pErfnbfPswxMBiGuN5GIOEHDg
         pbdjN5UXG0EESVaepklJ9fPYeXsaHLWT2pmoxNV3UQv1bM86f5KfYkr/nw+jEwXkv3hh
         CeZ0rhzaK9/yvLxHIyZemZFBo3k3sTNDa86wum66NgzEv2s38yqtNNZa3Y7Rlt1l69vZ
         bHfryFHhvNsvip284QoS3YmNmquS0QIaVoch+eJtdh6NcpHvFxrx/JtsxV8zsTEr54dK
         oxeR1zNwqirEiRjQ6xScLBJT4YRDSfaujzJZ5SFMVaA/AZE9TvK6lxb/rSi8F46agKXW
         wgCQ==
X-Gm-Message-State: AOAM533AjznXXXt0hCQHAEwudaZEIAAVfXy5cAm+9XWhIgFFfN3DWAY/
	yC3D5hD41d03TPE0hJTSqN7bpEECJMVGSw==
X-Google-Smtp-Source: ABdhPJyMPyC1lJxLXqJRMds0JifW1F+/tAuGssTLEoBh9hdd0O5x/c7twTGJIbSNQyGcllVT+/wqnw==
X-Received: by 2002:a63:5642:: with SMTP id g2mr6082530pgm.434.1612396747350;
        Wed, 03 Feb 2021 15:59:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id f3sm3161840pfe.25.2021.02.03.15.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 15:59:06 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Require full ISA support for x86-64 level marker
Date: Wed,  3 Feb 2021 15:59:03 -0800
Message-Id: <20210203235903.12616-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-ISA-support-for-x86-64-level-marker.patch | 116 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch

diff --git a/meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch b/meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch
new file mode 100644
index 0000000000..3cb60b2e55
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch
@@ -0,0 +1,116 @@
+From b1971f6f1331d738d1d6b376b4741668a7546125 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 2 Feb 2021 13:45:58 -0800
+Subject: [PATCH] x86: Require full ISA support for x86-64 level marker [BZ #27318]
+
+Since -march=sandybridge enables ISAs in x86-64 ISA level v3, the v3
+marker is set on libc.so.  We couldn't set the needed ISA marker to v2
+since this libc won't run on all v2 machines.  Technically, the v3 marker
+is correct.  But the resulting libc.so won't run on Sandy Brigde, which
+is a v2 machine, even when libc is compiled with -march=sandybridge:
+
+$ ./elf/ld.so ./libc.so
+./libc.so: (p) CPU ISA level is lower than required: needed: 7; got: 3
+
+Instead, we require full ISA support for x86-64 level marker and disable
+x86-64 level marker for -march=sandybridge which enables ISAs between v2
+and v3.
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/libc-alpha/2021-February/122297.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+
+ sysdeps/x86/configure    |  7 ++++++-
+ sysdeps/x86/configure.ac |  2 +-
+ sysdeps/x86/isa-level.c  | 21 ++++++++++++++++++++-
+ 3 files changed, 27 insertions(+), 3 deletions(-)
+
+diff --git a/sysdeps/x86/configure b/sysdeps/x86/configure
+index 5e32dc62b3..5b20646843 100644
+--- a/sysdeps/x86/configure
++++ b/sysdeps/x86/configure
+@@ -133,7 +133,12 @@ if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -nostartfiles -nostdlib -r -o conftest c
+   $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
+   test $ac_status = 0; }; }; then
+   count=`LC_ALL=C $READELF -n conftest | grep NT_GNU_PROPERTY_TYPE_0 | wc -l`
+-  if test "$count" = 1; then
++  if test "$count" = 1 && { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -DINCLUDE_X86_ISA_LEVEL -S -o conftest.s $srcdir/sysdeps/x86/isa-level.c'
++  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
++  (eval $ac_try) 2>&5
++  ac_status=$?
++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
++  test $ac_status = 0; }; }; then
+     libc_cv_include_x86_isa_level=yes
+   fi
+ fi
+diff --git a/sysdeps/x86/configure.ac b/sysdeps/x86/configure.ac
+index f94088f377..54ecd33d2c 100644
+--- a/sysdeps/x86/configure.ac
++++ b/sysdeps/x86/configure.ac
+@@ -100,7 +100,7 @@ EOF
+ libc_cv_include_x86_isa_level=no
+ if AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS -nostartfiles -nostdlib -r -o conftest conftest1.S conftest2.S); then
+   count=`LC_ALL=C $READELF -n conftest | grep NT_GNU_PROPERTY_TYPE_0 | wc -l`
+-  if test "$count" = 1; then
++  if test "$count" = 1 && AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS -DINCLUDE_X86_ISA_LEVEL -S -o conftest.s $srcdir/sysdeps/x86/isa-level.c); then
+     libc_cv_include_x86_isa_level=yes
+   fi
+ fi
+diff --git a/sysdeps/x86/isa-level.c b/sysdeps/x86/isa-level.c
+index aaf524cb56..7f83449061 100644
+--- a/sysdeps/x86/isa-level.c
++++ b/sysdeps/x86/isa-level.c
+@@ -25,12 +25,17 @@
+    License along with the GNU C Library; if not, see
+    <https://www.gnu.org/licenses/>.  */
+ 
+-#include <elf.h>
++#ifdef _LIBC
++# include <elf.h>
++#endif
+ 
+ /* ELF program property for x86 ISA level.  */
+ #ifdef INCLUDE_X86_ISA_LEVEL
+ # if defined __x86_64__ || defined __FXSR__ || !defined _SOFT_FLOAT \
+      || defined  __MMX__ || defined __SSE__ || defined __SSE2__
++#  if !defined __SSE__ || !defined __SSE2__
++#   error "Missing ISAs for x86-64 ISA level baseline"
++#  endif
+ #  define ISA_BASELINE	GNU_PROPERTY_X86_ISA_1_BASELINE
+ # else
+ #  define ISA_BASELINE	0
+@@ -40,6 +45,11 @@
+      || (defined __x86_64__ && defined __LAHF_SAHF__) \
+      || defined __POPCNT__ || defined __SSE3__ \
+      || defined __SSSE3__ || defined __SSE4_1__ || defined __SSE4_2__
++#  if !defined __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 \
++     || !defined __POPCNT__ || !defined __SSE3__ \
++     || !defined __SSSE3__ || !defined __SSE4_1__ || !defined __SSE4_2__
++#   error "Missing ISAs for x86-64 ISA level v2"
++#  endif
+ #  define ISA_V2	GNU_PROPERTY_X86_ISA_1_V2
+ # else
+ #  define ISA_V2	0
+@@ -48,6 +58,10 @@
+ # if defined __AVX__ || defined __AVX2__ || defined __F16C__ \
+      || defined __FMA__ || defined __LZCNT__ || defined __MOVBE__ \
+      || defined __XSAVE__
++# if !defined __AVX__ || !defined __AVX2__ || !defined __F16C__ \
++     || !defined __FMA__ || !defined __LZCNT__
++#   error "Missing ISAs for x86-64 ISA level v3"
++#  endif
+ #  define ISA_V3	GNU_PROPERTY_X86_ISA_1_V3
+ # else
+ #  define ISA_V3	0
+@@ -55,6 +69,11 @@
+ 
+ # if defined __AVX512F__ || defined __AVX512BW__ || defined __AVX512CD__ \
+      || defined __AVX512DQ__ || defined __AVX512VL__
++#  if !defined __AVX512F__ || !defined __AVX512BW__ \
++      || !defined __AVX512CD__ || !defined __AVX512DQ__ \
++      || !defined __AVX512VL__
++#   error "Missing ISAs for x86-64 ISA level v4"
++#  endif
+ #  define ISA_V4	GNU_PROPERTY_X86_ISA_1_V4
+ # else
+ #  define ISA_V4	0
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index b39f97d656..4085c779eb 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -42,6 +42,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
+           file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.30.0

