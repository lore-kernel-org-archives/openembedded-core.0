Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C045C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 06:43:25 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.8636.1717569802185742536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 23:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qu0EEHxV;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d206a85082so73680b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 23:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717569801; x=1718174601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLD3Db/6K8aXngaV4mAdppKVa103hyngEtOnGhYNxKw=;
        b=Qu0EEHxVeb6auDO/dhnMY8CIHo1ht+EzEBkc6VL3pIpvJyMKaCEtDouUECwxOTmbVM
         89/hrqgIjpa+JR3wfwiNKK+dLRW6wovkMCbWoqAZ7eOuF39I7FecR73rOEt8LlbRZ7Sn
         Zu0gv2W9tBFWTj7aJfbwJTnvAa0qUrcTn7yCmTKGAkyOkgrkGQLqRb9ZfNsR8HYgUsHl
         2PxbdVmi5eEey+PuW2k6NOUecKMsdeiTJl8C8puXjjORK2+u5jB+hvZQvwgHmt3QwXH7
         +dwdxyrwCkrF6SzNh6wLoXPd2lSNahEcPnb/faGB3e+Ff+IKKWLKVnZRoOEmZ8flJsV+
         Tpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717569801; x=1718174601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLD3Db/6K8aXngaV4mAdppKVa103hyngEtOnGhYNxKw=;
        b=lGB/QnQ0DppQEbk8i2dQN8WL96754/Ft07DnOOpT96hV1vCcelcqYNwpRZVoL4X/qU
         oFC9TfMtDRQXqvT76vLL7ivsU0sxygO6e+pLMo046LorUGcIY3iOmVJEv25WW+o8UVXx
         +bAU5BjKejfPI3fGC+ZzCYdXS/ycoiNcHlpxozlTQSvSZO1kFAzyWAaV1WD9DIpc7Hgz
         GTp37MBwbAOD3AODpt6oDqreTb/q5gqDei5YbESk+/oprN3j4JIw7FXRI3mmhZVrw9kU
         v6gL07FyUXOrASPL0BJiD2fb4qmQmoT2XdWDClHqRQ8o+2OZ/r06QAZRM2HyERITB+hI
         fn4A==
X-Gm-Message-State: AOJu0YxYVd4KkK+p7NlIALUr3xGlEWDTrlTcXFVWR7gyQA7ON/GY9EQ2
	slJV8Pbdr1JWee0/EtjPnmM5kKdxr/bSVgKybQ7vwaLS0VRbvwJbRWszC17+
X-Google-Smtp-Source: AGHT+IHYBEzpykyHLda5BF1UtFptjDT6CVXXuhKfLQWmPQ/uXuqJP1VXVKOGBW28mrHqP+gm0yE+LA==
X-Received: by 2002:a05:6808:1492:b0:3c9:7097:748f with SMTP id 5614622812f47-3d20439d50fmr2011636b6e.29.1717569800394;
        Tue, 04 Jun 2024 23:43:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6d8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703edadedd1sm436214b3a.92.2024.06.04.23.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 23:43:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] python3: Check for host OS type instead of build OS
Date: Tue,  4 Jun 2024 23:43:16 -0700
Message-ID: <20240605064317.1646597-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 06:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200353

configure uses PLATOFRM_TRIPLET derive many variabled e.g.
SOABI, EXT_SUFFIX etc. However, the check is for build system
which is not correct when cross-compiling python, it works ok
for native builds since host == build, however for cross-builds
host != build and this ends up with wrong value e.g. on musl/linux
it gets linux-gnu whereas it should be linux-musl.

Luckily, its fixed upstream, hence backported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-platform-triplet-detection-code-ad.patch | 498 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.3.bb |   1 +
 2 files changed, 499 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch b/meta/recipes-devtools/python/python3/0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch
new file mode 100644
index 00000000000..c0dc3a79f67
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch
@@ -0,0 +1,498 @@
+From c163d7f0b67a568e9b64eeb9c1cbbaa127818596 Mon Sep 17 00:00:00 2001
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
+Co-authored-by: Christian Heimes <christian@python.org>
+Co-authored-by: Erlend E. Aasland <erlend@python.org>
+
+Upstream-Status: Backport [https://github.com/kraj/cpython/commit/c163d7f0b67a568e9b64eeb9c1cbbaa127818596]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ...3-07-25-02-30-00.gh-issue-95855.wA7rAf.rst |   2 +
+ Misc/platform_triplet.c                       | 255 ++++++++++++++++++
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
diff --git a/meta/recipes-devtools/python/python3_3.12.3.bb b/meta/recipes-devtools/python/python3_3.12.3.bb
index 37afa442fa3..f5f311f61c9 100644
--- a/meta/recipes-devtools/python/python3_3.12.3.bb
+++ b/meta/recipes-devtools/python/python3_3.12.3.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
            file://0001-test_shutdown-skip-problematic-test.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
+           file://0001-gh-95855-Refactor-platform-triplet-detection-code-ad.patch \
            "
 
 SRC_URI:append:class-native = " \

