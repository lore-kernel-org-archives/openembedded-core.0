Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04203C5479D
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.176134.1672213056713324348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HcnOX+ho;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso7532025wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7/BJuv8+pZe+fPXFB75yBhDENoBwA3jrIEi6+3bedk=;
        b=HcnOX+hoNfUz5cgeKGfa4JzXbUQBNVonJ3MvEZT06yxewPfY1CixxeE7miBAR/2cIj
         2MkPDuZL3ZQb9qf4ETHPMabFcFLabRanPpZOX356R7Ek7lgLzlgX+iftHMGcxpH0vheT
         NVIRjnSn1c4myYvAA8kzoPBZz5NLQ2jIICDk2jiaLfpgQY4aO60AvfYmhsE9G1HwioID
         px77suXB2m/AZMCmwYLEEhnsuOMwmfSX3jKcqmWtlokYTVddcx/wsNfl9wk3SwfNglHc
         1syJZANQME2HYWL8n9/hfkDeHz6QRR9+kVMVJu4Dmvsl13spnCmtZadPlG05IfRjAsIl
         Jstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7/BJuv8+pZe+fPXFB75yBhDENoBwA3jrIEi6+3bedk=;
        b=3CSA0I5Rh1QUohb4NBpGN4l9BjkoYG9p/HX2tANBnM1s+JhD7zy0iZUsi+3enSKKVL
         73uQ8iz7pezMvbmLBrANqKuLCZhep1Oi9YMAJOWvEWQCjyg8VfAVBWJGVN7trV5uoDrS
         FHn/aE23Rpfth4fDiZEoDc06WmHJzcliC3uS7lmILC6IY+2WqZ9cPq+CeyeEPLyqtod9
         C2tGU4enLJGoK+30S/7Q1VTj60IRbX10rJLPKClaHxQWID8cBo4XHdTgWkSI545IzQxw
         lWllMIW37j9PpThtpp70vSk4ZbuwOS0d+6BNSExHzqJbdTsgfvHBZUlyXYNsKLMVDfQu
         oh3w==
X-Gm-Message-State: AFqh2kpU5A5/x6gcMz/oQYvcdIblBtjZv3k0ckr4d1Ta/7fP1MqBr3ZY
	W9XOEKso6+VQpKyo0cHnhZv8Mze3GtE=
X-Google-Smtp-Source: AMrXdXv+mIV681+pdbWlygHlpjoE0WuF4bnvn5QvRtw4zrQgCyPL4mzNlnaYi8VCNnm0YyWNFWsedA==
X-Received: by 2002:a05:600c:218f:b0:3d1:fbf9:3bd4 with SMTP id e15-20020a05600c218f00b003d1fbf93bd4mr17047474wme.10.1672213051629;
        Tue, 27 Dec 2022 23:37:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/25] python3: update 3.11.0 -> 3.11.1
Date: Wed, 28 Dec 2022 08:37:00 +0100
Message-Id: <20221228073721.3454255-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175050

Drop 0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch:
the patch has been rejected upstream (see the bug), and does quite a
bit more than just fix the mips softfloat problem. If the problem
still exists, then the fix needs to be re-done, and re-submitted.

The other two patches have been merged upstream.

License-Update: http->https

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-search-system-for-headers-libraries.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   2 +-
 ...-detection-of-mips-architecture-for-.patch | 227 ------------------
 ...asename-to-replace-CC-for-checking-c.patch |  24 +-
 ...add-more-elements-in-test_determinis.patch |  27 ---
 ...tutils-prefix-is-inside-staging-area.patch |   2 +-
 .../python/python3/cve-2022-37460.patch       |  95 --------
 .../{python3_3.11.0.bb => python3_3.11.1.bb}  |   7 +-
 8 files changed, 17 insertions(+), 369 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_marshal.py-add-more-elements-in-test_determinis.patch
 delete mode 100644 meta/recipes-devtools/python/python3/cve-2022-37460.patch
 rename meta/recipes-devtools/python/{python3_3.11.0.bb => python3_3.11.1.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index d6d9e451ff..bd696ade92 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 910a905aaeb6edb6b042ef65b3e2b73faada80aa Mon Sep 17 00:00:00 2001
+From 32aba1dfba1e27103e7367bbb9e4bef0e31aeac5 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 5ca855e7ed..cb79d9c671 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 45548f40668d429adcb7532d35db1ac16fe74562 Mon Sep 17 00:00:00 2001
+From a73020a9c388b4882c384087882a77ab2c7b3729 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use values from build configuration file
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
deleted file mode 100644
index f303eb35dc..0000000000
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+++ /dev/null
@@ -1,227 +0,0 @@
-From d2abe7328cea770425405aa0da2f4c2dac89fcad Mon Sep 17 00:00:00 2001
-From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
-Date: Fri, 31 May 2019 15:34:34 +0200
-Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
-
- float
-
-When (cross) compiling for softfloat mips, __mips_hard_float will not be
-defined and detection of OS triplet in configure.ac / configure will fail.
-
-This also has to do with the custom detection of the build triplet. Trying
-to do this in a more autoconf/autotools manner.
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
-Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
-
----
- configure.ac | 196 ++++++---------------------------------------------
- 1 file changed, 21 insertions(+), 175 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 358b6ea..085fc0b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -907,181 +907,27 @@ then
- fi
- 
- 
--AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
--cat > conftest.c <<EOF
--#undef bfin
--#undef cris
--#undef fr30
--#undef linux
--#undef hppa
--#undef hpux
--#undef i386
--#undef mips
--#undef powerpc
--#undef sparc
--#undef unix
--#if defined(__ANDROID__)
--    # Android is not a multiarch system.
--#elif defined(__linux__)
--# if defined(__x86_64__) && defined(__LP64__)
--        x86_64-linux-gnu
--# elif defined(__x86_64__) && defined(__ILP32__)
--        x86_64-linux-gnux32
--# elif defined(__i386__)
--        i386-linux-gnu
--# elif defined(__aarch64__) && defined(__AARCH64EL__)
--#  if defined(__ILP32__)
--        aarch64_ilp32-linux-gnu
--#  else
--        aarch64-linux-gnu
--#  endif
--# elif defined(__aarch64__) && defined(__AARCH64EB__)
--#  if defined(__ILP32__)
--        aarch64_be_ilp32-linux-gnu
--#  else
--        aarch64_be-linux-gnu
--#  endif
--# elif defined(__alpha__)
--        alpha-linux-gnu
--# elif defined(__ARM_EABI__) && defined(__ARM_PCS_VFP)
--#  if defined(__ARMEL__)
--        arm-linux-gnueabihf
--#  else
--        armeb-linux-gnueabihf
--#  endif
--# elif defined(__ARM_EABI__) && !defined(__ARM_PCS_VFP)
--#  if defined(__ARMEL__)
--        arm-linux-gnueabi
--#  else
--        armeb-linux-gnueabi
--#  endif
--# elif defined(__hppa__)
--        hppa-linux-gnu
--# elif defined(__ia64__)
--        ia64-linux-gnu
--# elif defined(__m68k__) && !defined(__mcoldfire__)
--        m68k-linux-gnu
--# elif defined(__mips_hard_float) && defined(__mips_isa_rev) && (__mips_isa_rev >=6) && defined(_MIPSEL)
--#  if _MIPS_SIM == _ABIO32
--        mipsisa32r6el-linux-gnu
--#  elif _MIPS_SIM == _ABIN32
--        mipsisa64r6el-linux-gnuabin32
--#  elif _MIPS_SIM == _ABI64
--        mipsisa64r6el-linux-gnuabi64
--#  else
--#   error unknown platform triplet
--#  endif
--# elif defined(__mips_hard_float) && defined(__mips_isa_rev) && (__mips_isa_rev >=6)
--#  if _MIPS_SIM == _ABIO32
--        mipsisa32r6-linux-gnu
--#  elif _MIPS_SIM == _ABIN32
--        mipsisa64r6-linux-gnuabin32
--#  elif _MIPS_SIM == _ABI64
--        mipsisa64r6-linux-gnuabi64
--#  else
--#   error unknown platform triplet
--#  endif
--# elif defined(__mips_hard_float) && defined(_MIPSEL)
--#  if _MIPS_SIM == _ABIO32
--        mipsel-linux-gnu
--#  elif _MIPS_SIM == _ABIN32
--        mips64el-linux-gnuabin32
--#  elif _MIPS_SIM == _ABI64
--        mips64el-linux-gnuabi64
--#  else
--#   error unknown platform triplet
--#  endif
--# elif defined(__mips_hard_float)
--#  if _MIPS_SIM == _ABIO32
--        mips-linux-gnu
--#  elif _MIPS_SIM == _ABIN32
--        mips64-linux-gnuabin32
--#  elif _MIPS_SIM == _ABI64
--        mips64-linux-gnuabi64
--#  else
--#   error unknown platform triplet
--#  endif
--# elif defined(__or1k__)
--        or1k-linux-gnu
--# elif defined(__powerpc__) && defined(__SPE__)
--        powerpc-linux-gnuspe
--# elif defined(__powerpc64__)
--#  if defined(__LITTLE_ENDIAN__)
--        powerpc64le-linux-gnu
--#  else
--        powerpc64-linux-gnu
--#  endif
--# elif defined(__powerpc__)
--        powerpc-linux-gnu
--# elif defined(__s390x__)
--        s390x-linux-gnu
--# elif defined(__s390__)
--        s390-linux-gnu
--# elif defined(__sh__) && defined(__LITTLE_ENDIAN__)
--        sh4-linux-gnu
--# elif defined(__sparc__) && defined(__arch64__)
--        sparc64-linux-gnu
--# elif defined(__sparc__)
--        sparc-linux-gnu
--# elif defined(__riscv)
--#  if __riscv_xlen == 32
--        riscv32-linux-gnu
--#  elif __riscv_xlen == 64
--        riscv64-linux-gnu
--#  else
--#   error unknown platform triplet
--#  endif
--# else
--#   error unknown platform triplet
--# endif
--#elif defined(__FreeBSD_kernel__)
--# if defined(__LP64__)
--        x86_64-kfreebsd-gnu
--# elif defined(__i386__)
--        i386-kfreebsd-gnu
--# else
--#   error unknown platform triplet
--# endif
--#elif defined(__gnu_hurd__)
--        i386-gnu
--#elif defined(__APPLE__)
--        darwin
--#elif defined(__VXWORKS__)
--        vxworks
--#elif defined(__wasm32__)
--#  if defined(__EMSCRIPTEN__)
--	wasm32-emscripten
--#  elif defined(__wasi__)
--	wasm32-wasi
--#  else
--#    error unknown wasm32 platform
--#  endif
--#elif defined(__wasm64__)
--#  if defined(__EMSCRIPTEN)
--	wasm64-emscripten
--#  elif defined(__wasi__)
--	wasm64-wasi
--#  else
--#    error unknown wasm64 platform
--#  endif
--#else
--# error unknown platform triplet
--#endif
--
--EOF
--
--if $CPP $CPPFLAGS conftest.c >conftest.out 2>/dev/null; then
--  PLATFORM_TRIPLET=`grep -v '^#' conftest.out | grep -v '^ *$' | tr -d ' 	'`
--  case "$build_os" in
--  linux-musl*)
--    PLATFORM_TRIPLET=`echo "$PLATFORM_TRIPLET" | sed 's/linux-gnu/linux-musl/'`
--    ;;
--  esac
--  AC_MSG_RESULT([$PLATFORM_TRIPLET])
--else
--  AC_MSG_RESULT([none])
--fi
--rm -f conftest.c conftest.out
-+AC_CANONICAL_TARGET
-+## Not using $target to filter out vendor
-+## Need to handle macos, vxworks and hurd special (?) :-/
-+case ${target_os} in
-+     darwin*)
-+     	PLATFORM_TRIPLET=darwin
-+	;;
-+     hurd*)
-+     	PLATFORM_TRIPLET=i386-gnu
-+	;;
-+     vxworks*)
-+     	PLATFORM_TRIPLET=vxworks
-+	;;
-+     *)
-+        if test "${target_cpu}" != "i686"; then
-+		PLATFORM_TRIPLET=${target_cpu}-${target_os}
-+	else
-+		PLATFORM_TRIPLET=i386-${target_os}
-+	fi
-+	;;
-+esac	
- 
- AC_MSG_CHECKING([for multiarch])
- AS_CASE([$ac_sys_system],
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index 4d589dd759..ef8edca51f 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -1,4 +1,4 @@
-From 175ed10e0a59a5395546ef88702f23d100b909f9 Mon Sep 17 00:00:00 2001
+From 4ba40ee527f844a804be571e52d9dc5447ae4cdd Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 22 Oct 2018 15:19:51 +0800
 Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
@@ -27,7 +27,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 10 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 77fb609..358b6ea 100644
+index 90008bc..bf56195 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -134,6 +134,7 @@ AC_CONFIG_HEADERS([pyconfig.h])
@@ -38,7 +38,7 @@ index 77fb609..358b6ea 100644
  
  AS_VAR_IF([cross_compiling], [maybe],
   [AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])]
-@@ -877,7 +878,7 @@ AC_MSG_RESULT($with_cxx_main)
+@@ -887,7 +888,7 @@ AC_MSG_RESULT($with_cxx_main)
  preset_cxx="$CXX"
  if test -z "$CXX"
  then
@@ -47,7 +47,7 @@ index 77fb609..358b6ea 100644
          gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
          cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
          clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;
-@@ -1290,7 +1291,7 @@ rmdir CaseSensitiveTestDir
+@@ -1300,7 +1301,7 @@ rmdir CaseSensitiveTestDir
  
  case $ac_sys_system in
  hp*|HP*)
@@ -56,16 +56,16 @@ index 77fb609..358b6ea 100644
      cc|*/cc) CC="$CC -Ae";;
      esac;;
  esac
-@@ -1798,7 +1799,7 @@ esac
+@@ -1834,7 +1835,7 @@ esac
  ],
  [AC_MSG_RESULT(no)])
  if test "$Py_LTO" = 'true' ; then
 -  case $CC in
 +  case $cc_basename in
      *clang*)
-       dnl flag to disable lto during linking
        LDFLAGS_NOLTO="-fno-lto"
-@@ -1917,7 +1918,7 @@ then
+       dnl Clang linker requires -flto in order to link objects with LTO information.
+@@ -1955,7 +1956,7 @@ then
    fi
  fi
  LLVM_PROF_ERR=no
@@ -74,7 +74,7 @@ index 77fb609..358b6ea 100644
    *clang*)
      # Any changes made here should be reflected in the GCC+Darwin case below
      PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
-@@ -1978,7 +1979,7 @@ esac
+@@ -2016,7 +2017,7 @@ esac
  # compiler and platform.  BASECFLAGS tweaks need to be made even if the
  # user set OPT.
  
@@ -83,7 +83,7 @@ index 77fb609..358b6ea 100644
      *clang*)
          cc_is_clang=1
          ;;
-@@ -2197,7 +2198,7 @@ yes)
+@@ -2235,7 +2236,7 @@ yes)
  
      # ICC doesn't recognize the option, but only emits a warning
      ## XXX does it emit an unused result warning and can it be disabled?
@@ -92,7 +92,7 @@ index 77fb609..358b6ea 100644
              [*icc*], [ac_cv_disable_unused_result_warning=no]
              [PY_CHECK_CC_WARNING([disable], [unused-result])])
      AS_VAR_IF([ac_cv_disable_unused_result_warning], [yes],
-@@ -2439,7 +2440,7 @@ yes)
+@@ -2477,7 +2478,7 @@ yes)
      ;;
  esac
  
@@ -101,7 +101,7 @@ index 77fb609..358b6ea 100644
  *icc*)
      # ICC needs -fp-model strict or floats behave badly
      CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
-@@ -3281,7 +3282,7 @@ then
+@@ -3319,7 +3320,7 @@ then
  		then
  			LINKFORSHARED="-Wl,--export-dynamic"
  		fi;;
@@ -110,7 +110,7 @@ index 77fb609..358b6ea 100644
  		  *gcc*)
  		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
  		    then
-@@ -6370,7 +6371,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
+@@ -6410,7 +6411,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
      # Some versions of gcc miscompile inline asm:
      # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
      # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
diff --git a/meta/recipes-devtools/python/python3/0001-test_marshal.py-add-more-elements-in-test_determinis.patch b/meta/recipes-devtools/python/python3/0001-test_marshal.py-add-more-elements-in-test_determinis.patch
deleted file mode 100644
index 9da7f94255..0000000000
--- a/meta/recipes-devtools/python/python3/0001-test_marshal.py-add-more-elements-in-test_determinis.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 076a4f9ab06105b94c87386c0dfe17b823502a13 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 1 Dec 2022 19:02:51 +0100
-Subject: [PATCH] test_marshal.py: add more elements in test_deterministic_sets
-
-Existing elements do produce different output on x86_64, but they
-do not on x86. Let's make the data longer to ensure it differs.
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/99935]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Lib/test/test_marshal.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Lib/test/test_marshal.py b/Lib/test/test_marshal.py
-index aae86cc..29d95ad 100644
---- a/Lib/test/test_marshal.py
-+++ b/Lib/test/test_marshal.py
-@@ -352,7 +352,7 @@ class BugsTestCase(unittest.TestCase):
-             for elements in (
-                 "float('nan'), b'a', b'b', b'c', 'x', 'y', 'z'",
-                 # Also test for bad interactions with backreferencing:
--                "('Spam', 0), ('Spam', 1), ('Spam', 2)",
-+                "('Spam', 0), ('Spam', 1), ('Spam', 2), ('Spam', 3), ('Spam', 4), ('Spam', 5)",
-             ):
-                 s = f"{kind}([{elements}])"
-                 with self.subTest(s):
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 7b497b83ca..1879024e16 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 2918d431cb5607933755fc80a6220135dd7fcb1d Mon Sep 17 00:00:00 2001
+From 3bdf292be303e239e78ed39dd8106fbd5f7ee645 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3/cve-2022-37460.patch b/meta/recipes-devtools/python/python3/cve-2022-37460.patch
deleted file mode 100644
index 12177684fd..0000000000
--- a/meta/recipes-devtools/python/python3/cve-2022-37460.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 94582bb643f98bc58b1ff206d1d2a56f97c3a7e5 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Wed, 28 Sep 2022 16:46:11 -0700
-Subject: [PATCH] gh-97612: Fix shell injection in get-remote-certificate.py
- (GH-97613)
-
-Fix a shell code injection vulnerability in the
-get-remote-certificate.py example script. The script no longer uses a
-shell to run "openssl" commands. Issue reported and initial fix by
-Caleb Shortt.
-
-Remove the Windows code path to send "quit" on stdin to the "openssl
-s_client" command: use DEVNULL on all platforms instead.
-
-Co-authored-by: Caleb Shortt <caleb@rgauge.com>
-(cherry picked from commit 83a0f44ffd8b398673ae56c310cf5768d359c341)
-
-Co-authored-by: Victor Stinner <vstinner@python.org>
----
-CVE: CVE-2022-37460
-
-Upstream-Status: Backport [https://github.com/python/cpython.git]
-                          [commit 94582bb643... unmodified]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
- ...2-09-28-12-10-57.gh-issue-97612.y6NvOQ.rst |  3 +++
- Tools/scripts/get-remote-certificate.py       | 25 ++++++-------------
- 2 files changed, 10 insertions(+), 18 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2022-09-28-12-10-57.gh-issue-97612.y6NvOQ.rst
-
-diff --git a/Misc/NEWS.d/next/Security/2022-09-28-12-10-57.gh-issue-97612.y6NvOQ.rst b/Misc/NEWS.d/next/Security/2022-09-28-12-10-57.gh-issue-97612.y6NvOQ.rst
-new file mode 100644
-index 0000000000..2f113492d4
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2022-09-28-12-10-57.gh-issue-97612.y6NvOQ.rst
-@@ -0,0 +1,3 @@
-+Fix a shell code injection vulnerability in the ``get-remote-certificate.py``
-+example script. The script no longer uses a shell to run ``openssl`` commands.
-+Issue reported and initial fix by Caleb Shortt. Patch by Victor Stinner.
-diff --git a/Tools/scripts/get-remote-certificate.py b/Tools/scripts/get-remote-certificate.py
-index 38901286e1..68272fca83 100755
---- a/Tools/scripts/get-remote-certificate.py
-+++ b/Tools/scripts/get-remote-certificate.py
-@@ -15,8 +15,8 @@
- def fetch_server_certificate (host, port):
- 
-     def subproc(cmd):
--        from subprocess import Popen, PIPE, STDOUT
--        proc = Popen(cmd, stdout=PIPE, stderr=STDOUT, shell=True)
-+        from subprocess import Popen, PIPE, STDOUT, DEVNULL
-+        proc = Popen(cmd, stdout=PIPE, stderr=STDOUT, stdin=DEVNULL)
-         status = proc.wait()
-         output = proc.stdout.read()
-         return status, output
-@@ -33,8 +33,8 @@ def strip_to_x509_cert(certfile_contents, outfile=None):
-                 fp.write(m.group(1) + b"\n")
-             try:
-                 tn2 = (outfile or tempfile.mktemp())
--                status, output = subproc(r'openssl x509 -in "%s" -out "%s"' %
--                                         (tn, tn2))
-+                cmd = ['openssl', 'x509', '-in', tn, '-out', tn2]
-+                status, output = subproc(cmd)
-                 if status != 0:
-                     raise RuntimeError('OpenSSL x509 failed with status %s and '
-                                        'output: %r' % (status, output))
-@@ -45,20 +45,9 @@ def strip_to_x509_cert(certfile_contents, outfile=None):
-             finally:
-                 os.unlink(tn)
- 
--    if sys.platform.startswith("win"):
--        tfile = tempfile.mktemp()
--        with open(tfile, "w") as fp:
--            fp.write("quit\n")
--        try:
--            status, output = subproc(
--                'openssl s_client -connect "%s:%s" -showcerts < "%s"' %
--                (host, port, tfile))
--        finally:
--            os.unlink(tfile)
--    else:
--        status, output = subproc(
--            'openssl s_client -connect "%s:%s" -showcerts < /dev/null' %
--            (host, port))
-+    cmd = ['openssl', 's_client', '-connect', '%s:%s' % (host, port), '-showcerts']
-+    status, output = subproc(cmd)
-+
-     if status != 0:
-         raise RuntimeError('OpenSSL connect failed with status %s and '
-                            'output: %r' % (status, output))
--- 
-2.38.1
-
diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipes-devtools/python/python3_3.11.1.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.11.0.bb
rename to meta/recipes-devtools/python/python3_3.11.1.bb
index ff25fe1ac4..37092d30d2 100644
--- a/meta/recipes-devtools/python/python3_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3_3.11.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSF-2.0"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4b8801e752a2c70ac41a5f9aa243f766"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a1822df8d0f068628ca6090aedc5bfc8"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -18,7 +18,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
-           file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
            file://crosspythonpath.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
@@ -32,8 +31,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
-           file://cve-2022-37460.patch \
-           file://0001-test_marshal.py-add-more-elements-in-test_determinis.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -41,7 +38,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "a57dc82d77358617ba65b9841cee1e3b441f386c3789ddc0676eca077f2951c3"
+SRC_URI[sha256sum] = "85879192f2cffd56cb16c092905949ebf3e5e394b7f764723529637901dfb58f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


