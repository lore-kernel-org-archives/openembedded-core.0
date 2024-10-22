Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5EAD1CDA1
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 06:27:33 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.12429.1729578445687387746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 23:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M+rFL0Q0;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-27b7a1480bdso2272847fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 23:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729578445; x=1730183245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=36DufGybgif0cVxF9fChtA2FTauvgrIo0eeS6nHPQ8U=;
        b=M+rFL0Q0pFy0KXPxYltrFb6aXJ2UoolS6L2pyufzqdw7Lk6x3E6uWZX1FOh7At3p0P
         lsZi71QhPoX/jXkPkt/WG35XUKTiqnBraBKXsivmbHlKoP1jtW6IrA1EvSH6Abd8TUVE
         y1T1W+PEf/6RN54SIYryIABnY2mTY+OEA96sJ4rPavAFtU0H0UIPq/VjeGIczl74X42s
         9byHenu3dFCGw72mmNPnCqVHPLAMMZ9qe7jtN18HK4jpSO/KBgTMWrCmbBQ4ha9cOqLE
         wKoR6PO73KMFGKDUCbSgP0LrgYQAzz1oiFdkqtwCoEAES/oMXItYCD7fjHtYOt8yRx2w
         l3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729578445; x=1730183245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36DufGybgif0cVxF9fChtA2FTauvgrIo0eeS6nHPQ8U=;
        b=uCUKDbGNh2pmXwtT/eAEIJL5wy2uB2RmKfowWfu9DFCs30IMFLYGqYox78AKE5/eQO
         H5umS85LJH1j/dzTpDMUfV3fKXs1h7eR3ZGBtB2e9+2z/wwhk8GrGF4E4/BHb0tVY0df
         ckqz5caFrlIN5v+624lu8vhR/4djj9HjuJf8itELPRfOve08JzRAJ9J9+LDGHoS2NP+E
         v47ORqVawIHNF4RbinKicLbqm7tRcxgrJ/sTDqIDFiUngx/HuGsRpMR2pkpbNH1wBJd6
         7I0vmFn48I0yBuxQRLTHdufVHwr/xdk39ALZzskRacnCnFnD590f73FtQrlJ2yApVclJ
         rWEw==
X-Gm-Message-State: AOJu0YxxTMjlwfjneifuGxXxstl+3EPwK7uI8Fj+TwHA4lALnZjk9CSn
	BgNPtRMoDgejhqeX3c3wZcuUcGjFrmk1KAyiYWgUKTh736ZGJ3EU8hA+9Pzu
X-Google-Smtp-Source: AGHT+IEZJ15ZzHrp1LgWm/YvY67Vvz2Xn+qpRwmmqQ7LfMhk0jVdBi4iDvqPzKuvmZFPsKY06MzNHA==
X-Received: by 2002:a05:6870:a346:b0:277:f5de:210f with SMTP id 586e51a60fabf-28caff1e893mr1715314fac.19.1729578444563;
        Mon, 21 Oct 2024 23:27:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2fbb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13336c6sm3948775b3a.76.2024.10.21.23.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:27:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/3] python3: Fix platform triplet detection
Date: Mon, 21 Oct 2024 23:27:19 -0700
Message-ID: <20241022062721.4131585-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 06:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206138

Currently, platform is based upon build_os detection which works ok
for native builds and where build_os and host_os are same i.e. glibc
based systems, but it fails for musl based systems to load correct
modules which are shared libraries e.g. python3-pydantic-core

This is already fixed upstream in 3.13+ but we need this backported
at minimum to get 3.12 or 3.11 working with musl

see
https://gitlab.alpinelinux.org/alpine/aports/-/issues/13227
https://github.com/meta-homeassistant/meta-homeassistant/issues/89
https://github.com/pypa/auditwheel/issues/349
https://github.com/PyO3/maturin/issues/1559

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: rebased
v3: rebased
 ...r-platform-triplet-detection-code-ad.patch | 498 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.6.bb |   1 +
 2 files changed, 499 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch b/meta/recipes-devtools/python/python3/0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch
new file mode 100644
index 00000000000..863fcc2d36b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch
@@ -0,0 +1,498 @@
+rom c163d7f0b67a568e9b64eeb9c1cbbaa127818596 Mon Sep 17 00:00:00 2001
+From: Jeffery To <jeffery.to@gmail.com>
+Date: Thu, 24 Aug 2023 20:22:50 +0800
+Subject: [PATCH] gh-95855: Refactor platform triplet detection code, add
+ detection for MIPS soft float and musl libc (#107221)
+
+- Move platform triplet detection code into Misc/platform_triplet.c
+- Refactor MIPS detection, use defined(__mips64) to detect MIPS64
+- Compute libc values in separate section
+- Add detection for MIPS soft float
+- Add detection for musl
+
+musl supports SPE with its soft-float ABI:
+https://git.musl-libc.org/cgit/musl/commit/?id=7be59733d71ada3a32a98622507399253f1d5e48
+
+Original patch by Christian Heimes.
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/c163d7f0b67a568e9b64eeb9c1cbbaa127818596]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Co-authored-by: Christian Heimes <christian@python.org>
+Co-authored-by: Erlend E. Aasland <erlend@python.org>
+---
+ ...3-07-25-02-30-00.gh-issue-95855.wA7rAf.rst |   2 +
+ Misc/platform_triplet.c                       | 255 ++++++++++++++++++
+ configure                                     | 192 +------------
+ configure.ac                                  | 192 +------------
+ 4 files changed, 265 insertions(+), 376 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Build/2023-07-25-02-30-00.gh-issue-95855.wA7rAf.rst
+ create mode 100644 Misc/platform_triplet.c
+
+--- /dev/null
++++ b/Misc/NEWS.d/next/Build/2023-07-25-02-30-00.gh-issue-95855.wA7rAf.rst
+@@ -0,0 +1,2 @@
++Refactor platform triplet detection code and add detection for MIPS soft
++float and musl libc.
+--- /dev/null
++++ b/Misc/platform_triplet.c
+@@ -0,0 +1,255 @@
++/* Detect platform triplet from builtin defines
++ * cc -E Misc/platform_triplet.c | grep '^PLATFORM_TRIPLET=' | tr -d ' '
++ */
++#undef bfin
++#undef cris
++#undef fr30
++#undef linux
++#undef hppa
++#undef hpux
++#undef i386
++#undef mips
++#undef powerpc
++#undef sparc
++#undef unix
++#if defined(__ANDROID__)
++    # Android is not a multiarch system.
++#elif defined(__linux__)
++/*
++ * BEGIN of Linux block
++ */
++// Detect libc (based on config.guess)
++# include <features.h>
++# if defined(__UCLIBC__)
++#  error uclibc not supported
++# elif defined(__dietlibc__)
++#  error dietlibc not supported
++# elif defined(__GLIBC__)
++#  define LIBC gnu
++#  define LIBC_X32 gnux32
++#  if defined(__ARM_PCS_VFP)
++#   define LIBC_ARM gnueabihf
++#  else
++#   define LIBC_ARM gnueabi
++#  endif
++#  if defined(__loongarch__)
++#   if defined(__loongarch_soft_float)
++#    define LIBC_LA gnusf
++#   elif defined(__loongarch_single_float)
++#    define LIBC_LA gnuf32
++#   elif defined(__loongarch_double_float)
++#    define LIBC_LA gnu
++#   else
++#    error unknown loongarch floating-point base abi
++#   endif
++#  endif
++#  if defined(_MIPS_SIM)
++#   if defined(__mips_hard_float)
++#    if _MIPS_SIM == _ABIO32
++#     define LIBC_MIPS gnu
++#    elif _MIPS_SIM == _ABIN32
++#     define LIBC_MIPS gnuabin32
++#    elif _MIPS_SIM == _ABI64
++#     define LIBC_MIPS gnuabi64
++#    else
++#     error unknown mips sim value
++#    endif
++#   else
++#    if _MIPS_SIM == _ABIO32
++#     define LIBC_MIPS gnusf
++#    elif _MIPS_SIM == _ABIN32
++#     define LIBC_MIPS gnuabin32sf
++#    elif _MIPS_SIM == _ABI64
++#     define LIBC_MIPS gnuabi64sf
++#    else
++#     error unknown mips sim value
++#    endif
++#   endif
++#  endif
++#  if defined(__SPE__)
++#   define LIBC_PPC gnuspe
++#  else
++#   define LIBC_PPC gnu
++#  endif
++# else
++// Heuristic to detect musl libc
++#  include <stdarg.h>
++#  ifdef __DEFINED_va_list
++#   define LIBC musl
++#   define LIBC_X32 muslx32
++#   if defined(__ARM_PCS_VFP)
++#    define LIBC_ARM musleabihf
++#   else
++#    define LIBC_ARM musleabi
++#   endif
++#   if defined(__loongarch__)
++#    if defined(__loongarch_soft_float)
++#     define LIBC_LA muslsf
++#    elif defined(__loongarch_single_float)
++#     define LIBC_LA muslf32
++#    elif defined(__loongarch_double_float)
++#     define LIBC_LA musl
++#    else
++#     error unknown loongarch floating-point base abi
++#    endif
++#   endif
++#   if defined(_MIPS_SIM)
++#    if defined(__mips_hard_float)
++#     if _MIPS_SIM == _ABIO32
++#      define LIBC_MIPS musl
++#     elif _MIPS_SIM == _ABIN32
++#      define LIBC_MIPS musln32
++#     elif _MIPS_SIM == _ABI64
++#      define LIBC_MIPS musl
++#     else
++#      error unknown mips sim value
++#     endif
++#    else
++#     if _MIPS_SIM == _ABIO32
++#      define LIBC_MIPS muslsf
++#     elif _MIPS_SIM == _ABIN32
++#      define LIBC_MIPS musln32sf
++#     elif _MIPS_SIM == _ABI64
++#      define LIBC_MIPS muslsf
++#     else
++#      error unknown mips sim value
++#     endif
++#    endif
++#   endif
++#   if defined(_SOFT_FLOAT) || defined(__NO_FPRS__)
++#    define LIBC_PPC muslsf
++#   else
++#    define LIBC_PPC musl
++#   endif
++#  else
++#   error unknown libc
++#  endif
++# endif
++
++# if defined(__x86_64__) && defined(__LP64__)
++PLATFORM_TRIPLET=x86_64-linux-LIBC
++# elif defined(__x86_64__) && defined(__ILP32__)
++PLATFORM_TRIPLET=x86_64-linux-LIBC_X32
++# elif defined(__i386__)
++PLATFORM_TRIPLET=i386-linux-LIBC
++# elif defined(__aarch64__) && defined(__AARCH64EL__)
++#  if defined(__ILP32__)
++PLATFORM_TRIPLET=aarch64_ilp32-linux-LIBC
++#  else
++PLATFORM_TRIPLET=aarch64-linux-LIBC
++#  endif
++# elif defined(__aarch64__) && defined(__AARCH64EB__)
++#  if defined(__ILP32__)
++PLATFORM_TRIPLET=aarch64_be_ilp32-linux-LIBC
++#  else
++PLATFORM_TRIPLET=aarch64_be-linux-LIBC
++#  endif
++# elif defined(__alpha__)
++PLATFORM_TRIPLET=alpha-linux-LIBC
++# elif defined(__ARM_EABI__)
++#  if defined(__ARMEL__)
++PLATFORM_TRIPLET=arm-linux-LIBC_ARM
++#  else
++PLATFORM_TRIPLET=armeb-linux-LIBC_ARM
++#  endif
++# elif defined(__hppa__)
++PLATFORM_TRIPLET=hppa-linux-LIBC
++# elif defined(__ia64__)
++PLATFORM_TRIPLET=ia64-linux-LIBC
++# elif defined(__loongarch__) && defined(__loongarch_lp64)
++PLATFORM_TRIPLET=loongarch64-linux-LIBC_LA
++# elif defined(__m68k__) && !defined(__mcoldfire__)
++PLATFORM_TRIPLET=m68k-linux-LIBC
++# elif defined(__mips__)
++#  if defined(__mips_isa_rev) && (__mips_isa_rev >=6)
++#   if defined(_MIPSEL) && defined(__mips64)
++PLATFORM_TRIPLET=mipsisa64r6el-linux-LIBC_MIPS
++#   elif defined(_MIPSEL)
++PLATFORM_TRIPLET=mipsisa32r6el-linux-LIBC_MIPS
++#   elif defined(__mips64)
++PLATFORM_TRIPLET=mipsisa64r6-linux-LIBC_MIPS
++#   else
++PLATFORM_TRIPLET=mipsisa32r6-linux-LIBC_MIPS
++#   endif
++#  else
++#   if defined(_MIPSEL) && defined(__mips64)
++PLATFORM_TRIPLET=mips64el-linux-LIBC_MIPS
++#   elif defined(_MIPSEL)
++PLATFORM_TRIPLET=mipsel-linux-LIBC_MIPS
++#   elif defined(__mips64)
++PLATFORM_TRIPLET=mips64-linux-LIBC_MIPS
++#   else
++PLATFORM_TRIPLET=mips-linux-LIBC_MIPS
++#   endif
++#  endif
++# elif defined(__or1k__)
++PLATFORM_TRIPLET=or1k-linux-LIBC
++# elif defined(__powerpc64__)
++#  if defined(__LITTLE_ENDIAN__)
++PLATFORM_TRIPLET=powerpc64le-linux-LIBC
++#  else
++PLATFORM_TRIPLET=powerpc64-linux-LIBC
++#  endif
++# elif defined(__powerpc__)
++PLATFORM_TRIPLET=powerpc-linux-LIBC_PPC
++# elif defined(__s390x__)
++PLATFORM_TRIPLET=s390x-linux-LIBC
++# elif defined(__s390__)
++PLATFORM_TRIPLET=s390-linux-LIBC
++# elif defined(__sh__) && defined(__LITTLE_ENDIAN__)
++PLATFORM_TRIPLET=sh4-linux-LIBC
++# elif defined(__sparc__) && defined(__arch64__)
++PLATFORM_TRIPLET=sparc64-linux-LIBC
++# elif defined(__sparc__)
++PLATFORM_TRIPLET=sparc-linux-LIBC
++# elif defined(__riscv)
++#  if __riscv_xlen == 32
++PLATFORM_TRIPLET=riscv32-linux-LIBC
++#  elif __riscv_xlen == 64
++PLATFORM_TRIPLET=riscv64-linux-LIBC
++#  else
++#   error unknown platform triplet
++#  endif
++# else
++#   error unknown platform triplet
++# endif
++/*
++ * END of Linux block
++ */
++#elif defined(__FreeBSD_kernel__)
++# if defined(__LP64__)
++PLATFORM_TRIPLET=x86_64-kfreebsd-gnu
++# elif defined(__i386__)
++PLATFORM_TRIPLET=i386-kfreebsd-gnu
++# else
++#   error unknown platform triplet
++# endif
++#elif defined(__gnu_hurd__)
++PLATFORM_TRIPLET=i386-gnu
++#elif defined(__APPLE__)
++PLATFORM_TRIPLET=darwin
++#elif defined(__VXWORKS__)
++PLATFORM_TRIPLET=vxworks
++#elif defined(__wasm32__)
++#  if defined(__EMSCRIPTEN__)
++PLATFORM_TRIPLET=wasm32-emscripten
++#  elif defined(__wasi__)
++#    if defined(_REENTRANT)
++PLATFORM_TRIPLET=wasm32-wasi-threads
++#    else
++PLATFORM_TRIPLET=wasm32-wasi
++#    endif
++#  else
++#    error unknown wasm32 platform
++#  endif
++#elif defined(__wasm64__)
++#  if defined(__EMSCRIPTEN__)
++PLATFORM_TRIPLET=wasm64-emscripten
++#  elif defined(__wasi__)
++PLATFORM_TRIPLET=wasm64-wasi
++#  else
++#    error unknown wasm64 platform
++#  endif
++#else
++# error unknown platform triplet
++#endif
+--- a/configure.ac
++++ b/configure.ac
+@@ -927,198 +927,14 @@ fi
+ 
+ 
+ AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
+-cat > conftest.c <<EOF
+-#undef bfin
+-#undef cris
+-#undef fr30
+-#undef linux
+-#undef hppa
+-#undef hpux
+-#undef i386
+-#undef mips
+-#undef powerpc
+-#undef sparc
+-#undef unix
+-#if defined(__ANDROID__)
+-    # Android is not a multiarch system.
+-#elif defined(__linux__)
+-# if defined(__x86_64__) && defined(__LP64__)
+-        x86_64-linux-gnu
+-# elif defined(__x86_64__) && defined(__ILP32__)
+-        x86_64-linux-gnux32
+-# elif defined(__i386__)
+-        i386-linux-gnu
+-# elif defined(__aarch64__) && defined(__AARCH64EL__)
+-#  if defined(__ILP32__)
+-        aarch64_ilp32-linux-gnu
+-#  else
+-        aarch64-linux-gnu
+-#  endif
+-# elif defined(__aarch64__) && defined(__AARCH64EB__)
+-#  if defined(__ILP32__)
+-        aarch64_be_ilp32-linux-gnu
+-#  else
+-        aarch64_be-linux-gnu
+-#  endif
+-# elif defined(__alpha__)
+-        alpha-linux-gnu
+-# elif defined(__ARM_EABI__) && defined(__ARM_PCS_VFP)
+-#  if defined(__ARMEL__)
+-        arm-linux-gnueabihf
+-#  else
+-        armeb-linux-gnueabihf
+-#  endif
+-# elif defined(__ARM_EABI__) && !defined(__ARM_PCS_VFP)
+-#  if defined(__ARMEL__)
+-        arm-linux-gnueabi
+-#  else
+-        armeb-linux-gnueabi
+-#  endif
+-# elif defined(__hppa__)
+-        hppa-linux-gnu
+-# elif defined(__ia64__)
+-        ia64-linux-gnu
+-# elif defined(__loongarch__)
+-#  if defined(__loongarch_lp64)
+-#   if defined(__loongarch_soft_float)
+-        loongarch64-linux-gnusf
+-#   elif defined(__loongarch_single_float)
+-        loongarch64-linux-gnuf32
+-#   elif defined(__loongarch_double_float)
+-        loongarch64-linux-gnu
+-#   else
+-#    error unknown platform triplet
+-#   endif
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# elif defined(__m68k__) && !defined(__mcoldfire__)
+-        m68k-linux-gnu
+-# elif defined(__mips_hard_float) && defined(__mips_isa_rev) && (__mips_isa_rev >=6) && defined(_MIPSEL)
+-#  if _MIPS_SIM == _ABIO32
+-        mipsisa32r6el-linux-gnu
+-#  elif _MIPS_SIM == _ABIN32
+-        mipsisa64r6el-linux-gnuabin32
+-#  elif _MIPS_SIM == _ABI64
+-        mipsisa64r6el-linux-gnuabi64
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# elif defined(__mips_hard_float) && defined(__mips_isa_rev) && (__mips_isa_rev >=6)
+-#  if _MIPS_SIM == _ABIO32
+-        mipsisa32r6-linux-gnu
+-#  elif _MIPS_SIM == _ABIN32
+-        mipsisa64r6-linux-gnuabin32
+-#  elif _MIPS_SIM == _ABI64
+-        mipsisa64r6-linux-gnuabi64
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# elif defined(__mips_hard_float) && defined(_MIPSEL)
+-#  if _MIPS_SIM == _ABIO32
+-        mipsel-linux-gnu
+-#  elif _MIPS_SIM == _ABIN32
+-        mips64el-linux-gnuabin32
+-#  elif _MIPS_SIM == _ABI64
+-        mips64el-linux-gnuabi64
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# elif defined(__mips_hard_float)
+-#  if _MIPS_SIM == _ABIO32
+-        mips-linux-gnu
+-#  elif _MIPS_SIM == _ABIN32
+-        mips64-linux-gnuabin32
+-#  elif _MIPS_SIM == _ABI64
+-        mips64-linux-gnuabi64
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# elif defined(__or1k__)
+-        or1k-linux-gnu
+-# elif defined(__powerpc__) && defined(__SPE__)
+-        powerpc-linux-gnuspe
+-# elif defined(__powerpc64__)
+-#  if defined(__LITTLE_ENDIAN__)
+-        powerpc64le-linux-gnu
+-#  else
+-        powerpc64-linux-gnu
+-#  endif
+-# elif defined(__powerpc__)
+-        powerpc-linux-gnu
+-# elif defined(__s390x__)
+-        s390x-linux-gnu
+-# elif defined(__s390__)
+-        s390-linux-gnu
+-# elif defined(__sh__) && defined(__LITTLE_ENDIAN__)
+-        sh4-linux-gnu
+-# elif defined(__sparc__) && defined(__arch64__)
+-        sparc64-linux-gnu
+-# elif defined(__sparc__)
+-        sparc-linux-gnu
+-# elif defined(__riscv)
+-#  if __riscv_xlen == 32
+-        riscv32-linux-gnu
+-#  elif __riscv_xlen == 64
+-        riscv64-linux-gnu
+-#  else
+-#   error unknown platform triplet
+-#  endif
+-# else
+-#   error unknown platform triplet
+-# endif
+-#elif defined(__FreeBSD_kernel__)
+-# if defined(__LP64__)
+-        x86_64-kfreebsd-gnu
+-# elif defined(__i386__)
+-        i386-kfreebsd-gnu
+-# else
+-#   error unknown platform triplet
+-# endif
+-#elif defined(__gnu_hurd__)
+-        i386-gnu
+-#elif defined(__APPLE__)
+-        darwin
+-#elif defined(__VXWORKS__)
+-        vxworks
+-#elif defined(__wasm32__)
+-#  if defined(__EMSCRIPTEN__)
+-	wasm32-emscripten
+-#  elif defined(__wasi__)
+-#    if defined(_REENTRANT)
+-	wasm32-wasi-threads
+-#    else
+-	wasm32-wasi
+-#    endif
+-#  else
+-#    error unknown wasm32 platform
+-#  endif
+-#elif defined(__wasm64__)
+-#  if defined(__EMSCRIPTEN__)
+-	wasm64-emscripten
+-#  elif defined(__wasi__)
+-	wasm64-wasi
+-#  else
+-#    error unknown wasm64 platform
+-#  endif
+-#else
+-# error unknown platform triplet
+-#endif
+-
+-EOF
+-
+-if $CPP $CPPFLAGS conftest.c >conftest.out 2>/dev/null; then
+-  PLATFORM_TRIPLET=`grep -v '^#' conftest.out | grep -v '^ *$' | tr -d ' 	'`
+-  case "$build_os" in
+-  linux-musl*)
+-    PLATFORM_TRIPLET=`echo "$PLATFORM_TRIPLET" | sed 's/linux-gnu/linux-musl/'`
+-    ;;
+-  esac
++if $CPP $CPPFLAGS $srcdir/Misc/platform_triplet.c >conftest.out 2>/dev/null; then
++  PLATFORM_TRIPLET=`grep '^PLATFORM_TRIPLET=' conftest.out | tr -d ' 	'`
++  PLATFORM_TRIPLET="${PLATFORM_TRIPLET@%:@PLATFORM_TRIPLET=}"
+   AC_MSG_RESULT([$PLATFORM_TRIPLET])
+ else
+   AC_MSG_RESULT([none])
+ fi
+-rm -f conftest.c conftest.out
++rm -f conftest.out
+ 
+ AC_MSG_CHECKING([for multiarch])
+ AS_CASE([$ac_sys_system],
diff --git a/meta/recipes-devtools/python/python3_3.12.6.bb b/meta/recipes-devtools/python/python3_3.12.6.bb
index 858124d104f..da1a0afad4c 100644
--- a/meta/recipes-devtools/python/python3_3.12.6.bb
+++ b/meta/recipes-devtools/python/python3_3.12.6.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch \
            "
 
 SRC_URI:append:class-native = " \

