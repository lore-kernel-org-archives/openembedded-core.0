Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82148CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 21:01:54 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.30222.1757538106993644693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 14:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QpkmaLQY;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7722f2f2aa4so45213b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 14:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757538106; x=1758142906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JuknkK7fx57sLBDsQh2fGlcqnmny0CY082OLLTiYVkA=;
        b=QpkmaLQYVgoTAeGSRaa0yWlzne0+XVKnq+k24N7YoPCeoNU65iCiT27ahuH92vHljL
         goa+jrN2RZ3rl2EQ8wcEyzxh7/c8+ej3wHTWFmPeVzk/sC8qfUHr4j35WOzJeoS67J07
         nYSONGffIhk9Ixc5dh5q5gte1b8c+/rbCv/bezAB8USbpzcwGTbW2CyJcF/fVPwmFvM9
         Z1PtypHXMfytTSGQtnhtRS2Lkenrp9rO+mw6x+plpswWHHaL/rRt/N0O+GmQUfomL25s
         Mtqin5ZmJSKqH6CnsFSrYXDRsT20qyWr36b3Oy3Q1HrtbTC8VbMXLgPV98W9SC6R6ysn
         8oKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757538106; x=1758142906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuknkK7fx57sLBDsQh2fGlcqnmny0CY082OLLTiYVkA=;
        b=ThKqWEovF946J/xMY0JDdzPuvLoebzGw4PgFmgNLPO1yORb5KwkpYkphIeoX8MgXvI
         EhutlMXK+ytp+Bzal6Fo2BBIrv1u3fs6fXAe8XqexT6CCCBmgSixkEBmZrSJfEMlK21g
         6XliUP2lBPJzJJbD6Mz3syc30FnFLZr2yFnCx/zL2jQLsna65JEeV5BmB3EpCsJXWzm8
         s6SDbh3lDhZ+/bQHLHTMJgBNpEBa+Wz+f/XaIF08Tc0P18XR+zQ5XdNOWB8IFIubU1pA
         cVqCawdDnyvNOYj2aXM7aFc5C0QvyuHYpitRACGUUtsXyiEha+COKtBZMfDklgLC72Fp
         JPmQ==
X-Gm-Message-State: AOJu0YyWOo4hokkZqv2Wl/sfaRBo7bhpVWHWMFnylOHr7pAVK+FTQY42
	8eSEA2BCYDggkDB07UFOkcULD4aGCzr0PUboJZB+OdFvk+DAy8JP1GasdKo0PkNv
X-Gm-Gg: ASbGncvkFQWSrQzczpKib8vev5bU/0uyLBdL7OO/Du++SiIWmXmTxL/IXnF4xvRPL1F
	Hav49MSOJOHfNHWw8Eb0z05VD2qgj1hvPJ2IvgUB3TJpp79WqBYUEzsYYC+fVORt21ifn1HGzTx
	9MeGEvcJFfmfnRIZNOn+UmxwN3dSf75ya/iz+u3j5FB7J1cFuEeZNm7REs4DZn9IfZYSYX7USEm
	VhyByiyT7BgFxUZQhoFp8zAdDr+Ai+K9lx3j8VwTsb1Xc3ZhTqHm9AANX4Nuj2m7LaVvL50VxSN
	VdCn1icI+EYrYfD7Kg63mfG0w6O9zRud/Wj8qTSuBe1BeFPP6VC4cC5/GJbqsQ+IggUtFBxmqzs
	on/nizLeA7LgV59fgivds2MBsbiskoNnRUPIlDQBWHHaEzS0BG3dwnvxZeYr+aTSXWZmaB/TT6r
	sa60WubtMi7eEg+PjCuCn/5OwJOUzKkOVwdHg80e3JleF8rRhCCrc=
X-Google-Smtp-Source: AGHT+IGWtf+ICSPAR3JDyXRfZmYgarLzEskrUog7F41TDZiObeGjODm18GTRPpDotDS+fWeMyCpVKA==
X-Received: by 2002:a05:6a00:b43:b0:771:e451:4edf with SMTP id d2e1a72fcca58-7742db82f46mr19416118b3a.0.1757538105414;
        Wed, 10 Sep 2025 14:01:45 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::d0a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77466119d92sm6207022b3a.30.2025.09.10.14.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 14:01:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] clang: Upgrade to 21.1.1 release
Date: Wed, 10 Sep 2025 14:01:42 -0700
Message-ID: <20250910210142.223675-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 21:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223234

Brings following bugfixes on top of 21.1.0

* 5a86dc996c26 [Xtensa] Fix lowering FP compare operations.
* bb383adfafca [SCEVExp] Fix early exit in ComputeEndCheck. (#156910)
* 2daad319889d [LV] Don't run instcombine for interleaved-accesses test.
* 2d726485a4a3 [LV] Add more tests for interleave groups requiring predicates.
* 81d3b6ee82bf [X86] Only fold AND/ANDNP back to VSELECT if we know the predicated mask select is legal (#156663)
* 41df6d5e08b0 [CMake][AIX] Enable CMP0182: Create shared library archives by default (#155686)
* 35f812f23263 compiler-rt: Use OpenBSD's elf_aux_info to detect AArch64 HW features (#155768)
* c75a0754d358 [builtins] Rename freebsd to elf_aux_info to reflect the function called. NFCI (#155749)
* 0bbb93672952 [libc++] Fix broken precondition of __bit_log2 (#155476)
* 677a8a2d3c5a [compiler-rt] Remove leftovers of FreeBSD md5/sha2 interceptors (#153351)
* fa462a66e418 [lldb][DataFormatter] Allow std::string formatters to match against custom allocators (#156050)
* 12fbb344a1e8 [Coroutines] Restore accidentally dropped intrinsic IDs
* 160ad51687cc [clang][docs] Fix implicit-int-conversion-on-negation typos
* e0d94d9626e4 [lldb][DWARFASTParserClang] Don't complete conflicting Objective-C++ types (#156681)
* b4274c3bc8ee [DebugInfo] When referencing structured bindings use the reference's location, not the binding's declaration's location (#153637)
* 7a077a1b312b [libc++][AIX] Fixup problems with ABI list checking (#155643)
* 85e3f8ec7ff6 Remove EH_LABEL comments from tests
* 3751e53c3e89 [AArch64][BTI] Add BTI at EH entries. (#155308)
* f8a0ecfc6108 [compiler-rt] Avoid depending on the libnvmm header for NetBSD (#153534)
* 113916ccf75f [lldb][ClangASTImporter] Don't ASTImport LambdaExpr nodes (#154962)
* 362b99f60ef5 [libcxx][fstream][NFC] Make __failed helper lambda a member function (#149390)
* b7c18c1e7ac0 [libc++] Ensure that we restore invariants in basic_filebuf::overflow (#147389)
* b63daf6312ab [RISCV] Cost casts with illegal types that can't be legalized (#153030)
* ca11cf3afa42 [clang-format] Use proper flags for git diff-tree (#155247)
* 27f0e6e579b7 [clang][PAC] Fix builtins that claim address discriminated types are bitwise compatible (#154490)
* e35cb1a59b3e [clang] Make sure EvalInfo pointer isn't null (#155563)
* acabba4f6d30 [NVPTX] don't erase CopyToRegs when folding movs into loads (#149393)
* 0e5c3f9b58b9 [mlir][cmake] Fix mlir target export (#153341)
* 1f1a20bcb03d [AArch64][PAC] Do not execute AUT instructions speculatively (#155372)
* d69907d99beb [AArch64][PAC] Fix clobbering registers by BLRA and AUTH_TCRETURN (#155373)
* 9f3f813c94f5 Add pointer auth documentation to contents (#155763)
* 7dbfe40cb318 [libc++] Disable cv-qualified arithmetic hash specializations (#155786)
* ef3a6bd37c15 [Clang][CMake] Use IRPGO instead of FE PGO for Cmake Caches (#155957)
* 35215b6412b4 [SLP]Do not to try to revectorize previously vectorized phis in loops
* 64dd5399f7a1 [sanitizer_common] Older Haiku needs _GNU_SOURCE (#156291)
* 95608643573a [LoongArch] Fix broadcast load with extension. (#155960)
* 0d6736704f38 [X86] getScalarMaskingNode - if the mask is zero just return the blended passthrough and preserved source value (#153575)
* 1db648d1016d [release] Correct download links for Windows on Arm packages (#156459)
* 562605cef22a ThinLTOBitcodeWriter: Emit __cfi_check to full LTO part of bitcode file.
* 33e18acf4a03 [Analyzer] No longer crash with VLA operands to unary type traits (#151719)
* 8b6caff342c3 Bump version to 21.1.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 ...ibunwind-headers-when-LIBCXXABI_LIBU.patch |  2 +-
 ...-support-a-new-embedded-linux-target.patch |  2 +-
 ...lify-cross-compilation.-Don-t-use-na.patch |  2 +-
 ...ryInfo-Undefine-libc-functions-if-th.patch |  2 +-
 ...-env-override-of-exe-and-libdir-path.patch |  2 +-
 ...g-driver-Check-sysroot-for-ldso-path.patch |  2 +-
 ...tools.cpp-Add-lssp_nonshared-on-musl.patch |  2 +-
 ...08-clang-Prepend-trailing-to-sysroot.patch |  2 +-
 ...e-the-target-sysroot-for-compiler-ru.patch |  2 +-
 ...efine-releative-gcc-installation-dir.patch |  2 +-
 ...ad-and-ldl-along-with-lunwind-for-st.patch |  2 +-
 ...UTABLE-when-cross-compiling-for-nati.patch |  2 +-
 ...3-Check-for-atomic-double-intrinsics.patch |  2 +-
 ...gure-for-packages-using-find_package.patch |  2 +-
 ...ce-dir-location-for-cross-toolchains.patch |  2 +-
 ...-dyld-prefix-when-checking-sysroot-f.patch |  2 +-
 ...-clang-Use-python3-in-python-scripts.patch |  2 +-
 ...t-anchor-for-adding-OE-distro-vendor.patch |  2 +-
 ...ot-use-backtrace-APIs-on-non-glibc-l.patch |  2 +-
 ...iple-for-non-debian-multiarch-linux-.patch |  2 +-
 ...libunwind-Added-unw_backtrace-method.patch |  2 +-
 ...0022-lldb-Link-with-libatomic-on-x86.patch |  2 +-
 ...ompiler-rt-Enable-__int128-for-ppc32.patch |  2 +-
 ...ot-use-cmake-infra-to-detect-libzstd.patch |  2 +-
 ...t-Fix-stat-struct-s-size-for-O32-ABI.patch |  2 +-
 ...cpp-ARMLibDirs-search-also-in-lib32.patch} |  2 +-
 ...f-_TIME_BITS-along-with-_FILE_OFFSET.patch | 43 ----------
 ...-OE-specific-ABI-triple-for-N32-ABI.patch} |  2 +-
 ...nwind.pc.in-and-llvm-config-scripts.patch} |  2 +-
 ...pect-LLVM_LIBDIR_SUFFIX-like-other-.patch} |  2 +-
 ...o-not-pass-target-to-clang-compiler.patch} |  2 +-
 ...-sort-ClassInfo-lists-by-name-as-we.patch} |  2 +-
 ...ve-LLVM_LDFLAGS-from-ldflags-output.patch} |  2 +-
 ...de-sync_fetch_and_-for-any-pre-ARMv.patch} |  2 +-
 ...ode-uptr-sptr-typedefs-on-Mips-Linu.patch} |  2 +-
 ...-relative-paths-for-getArchSpecific.patch} |  2 +-
 ...036-allow-external-prepare_builtins.patch} |  2 +-
 ...-headers-in-the-debug-info-when-bui.patch} |  2 +-
 ...g-block-when-searching-for-noreturn.patch} |  2 +-
 ...x-test-when-clang-tests-are-include.patch} |  2 +-
 ...users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch} |  2 +-
 meta/recipes-devtools/clang/common-clang.inc  |  2 +-
 meta/recipes-devtools/clang/common.inc        | 33 ++++---
 ...V-portion-of-test_makedev-when-linke.patch | 86 +++++++++++++++++++
 45 files changed, 144 insertions(+), 102 deletions(-)
 rename meta/recipes-devtools/clang/clang/{0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch => 0026-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch} (99%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
 rename meta/recipes-devtools/clang/clang/{0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch => 0027-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch} (98%)
 rename meta/recipes-devtools/clang/clang/{0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch => 0028-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch} (97%)
 rename meta/recipes-devtools/clang/clang/{0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch => 0029-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch} (98%)
 rename meta/recipes-devtools/clang/clang/{0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch => 0030-compiler-rt-Do-not-pass-target-to-clang-compiler.patch} (94%)
 rename meta/recipes-devtools/clang/clang/{0032-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch => 0031-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0033-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch => 0032-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0034-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch => 0033-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch} (97%)
 rename meta/recipes-devtools/clang/clang/{0035-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch => 0034-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0036-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch => 0035-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch} (96%)
 rename meta/recipes-devtools/clang/clang/{0037-allow-external-prepare_builtins.patch => 0036-allow-external-prepare_builtins.patch} (97%)
 rename meta/recipes-devtools/clang/clang/{0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch => 0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch} (96%)
 rename meta/recipes-devtools/clang/clang/{0039-Prevent-revisiting-block-when-searching-for-noreturn.patch => 0038-Prevent-revisiting-block-when-searching-for-noreturn.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0040-Only-build-c-index-test-when-clang-tests-are-include.patch => 0039-Only-build-c-index-test-when-clang-tests-are-include.patch} (96%)
 rename meta/recipes-devtools/clang/clang/{0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch => 0040-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch} (97%)
 create mode 100644 meta/recipes-devtools/python/0001-python-Skip-NODEV-portion-of-test_makedev-when-linke.patch

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6cfa76e2a3d..3ede77df4e0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.1 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
index 8836863e2b2..ab84a877fae 100644
--- a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
+++ b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
@@ -1,4 +1,4 @@
-From b741b268820d5c81cef9cf16cb9b8b8742220fdc Mon Sep 17 00:00:00 2001
+From 41ba0feeeebcbe242836639ef3b562adc29ffa96 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 Aug 2017 10:37:49 -0700
 Subject: [PATCH] libcxxabi: Find libunwind headers when
diff --git a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
index e76dc2bbe01..b6885e2f425 100644
--- a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
+++ b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
@@ -1,4 +1,4 @@
-From 9e42b5a74a86b108c49d9f4cc97ad4aa986af5e8 Mon Sep 17 00:00:00 2001
+From b044e0e56a8af940836056f61145dea1f961cd4c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 19 Apr 2015 15:16:23 -0700
 Subject: [PATCH] compiler-rt: support a new embedded linux target
diff --git a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
index 9bbd6e40271..44cb2299cd3 100644
--- a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
+++ b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
@@ -1,4 +1,4 @@
-From 098622b7dce4f28942a4f4a46d46580742dab972 Mon Sep 17 00:00:00 2001
+From ab6fdb73b582c1eafd1c342e9cde5b3d8ec7ab86 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 May 2016 23:11:45 -0700
 Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
diff --git a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
index ef6bd552466..88d1c542222 100644
--- a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
+++ b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
@@ -1,4 +1,4 @@
-From bd6aaf1bad7d46da1928a5b1ecfc9f15e4345a84 Mon Sep 17 00:00:00 2001
+From 04afd5f5cb10ccb899022a6c72ca2f2378eca409 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 May 2016 00:33:20 +0000
 Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if they are
diff --git a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
index 1fc9bd3df0c..797980f5545 100644
--- a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
+++ b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
@@ -1,4 +1,4 @@
-From 82bcb02b2bfbad848663726d68344ce919fc8e65 Mon Sep 17 00:00:00 2001
+From fb846030137c14f4f64937f0bfad5a6aad9bb523 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
diff --git a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
index 10888fefe93..c4f04e68e81 100644
--- a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
+++ b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
@@ -1,4 +1,4 @@
-From 1416f9085479ebe08cc299928844541e55f58504 Mon Sep 17 00:00:00 2001
+From d547d656c8063eff2db8dbab3e226e29288acd54 Mon Sep 17 00:00:00 2001
 From: Dan McGregor <dan.mcgregor@usask.ca>
 Date: Wed, 26 Apr 2017 20:29:41 -0600
 Subject: [PATCH] clang: driver: Check sysroot for ldso path
diff --git a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
index f91cbe7b436..0ebabad3f6c 100644
--- a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
+++ b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
@@ -1,4 +1,4 @@
-From 4facd87cbed8b8179730043efa120122dc86dcf1 Mon Sep 17 00:00:00 2001
+From 007986bc79780a879d9fbf77ac8565bf9c82eb8c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 May 2016 21:11:06 -0700
 Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
diff --git a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
index 78bc7661e40..eb11427f96b 100644
--- a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
+++ b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
@@ -1,4 +1,4 @@
-From 41442c26709f438a158b68c0339f1ea66c08864c Mon Sep 17 00:00:00 2001
+From 82ba05d9deeba4188f4a61d6a502565b22dad656 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 Mar 2017 09:02:13 -0700
 Subject: [PATCH] clang: Prepend trailing '/' to sysroot
diff --git a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
index 7e2fca77831..4d608088144 100644
--- a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
+++ b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
@@ -1,4 +1,4 @@
-From 04691d1155b246cb884162af863408ec1f471262 Mon Sep 17 00:00:00 2001
+From caf707f3e0dfe6a589dbbd73a4d0edbe759892cd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 Mar 2017 19:06:26 -0700
 Subject: [PATCH] clang: Look inside the target sysroot for compiler runtime
diff --git a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
index 27324a98087..5a170b31137 100644
--- a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
+++ b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
@@ -1,4 +1,4 @@
-From 0e77812bc764279a619a3fdd92d9c1f008dfa95a Mon Sep 17 00:00:00 2001
+From efd146e3170d15f5c6fbe177ce98b61f796bb45b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 20 Mar 2021 16:09:16 -0700
 Subject: [PATCH] clang: Define / releative gcc installation dir
diff --git a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
index 2fc967a79f7..35e0e7b8a0b 100644
--- a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
+++ b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
@@ -1,4 +1,4 @@
-From 3dd872e76d8ee8b9db384051115b7bb6679960b4 Mon Sep 17 00:00:00 2001
+From ec4353ee503799295624e1d3a23bd58f81916942 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Jul 2019 22:51:39 -0700
 Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for static
diff --git a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
index 1c2867ba898..64c17d23f22 100644
--- a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
+++ b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
@@ -1,4 +1,4 @@
-From a338c2ae924451e869b593f66fc67040169c0a43 Mon Sep 17 00:00:00 2001
+From c3600b46f7fae26fb66fa48401617e6ca1be260c Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 26 Dec 2019 12:56:16 -0800
 Subject: [PATCH] Pass PYTHON_EXECUTABLE when cross compiling for native build
diff --git a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
index e635cc2c3be..3421465af4b 100644
--- a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
+++ b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
@@ -1,4 +1,4 @@
-From 8b96f0b76e328e877707ab343703f5a7372de016 Mon Sep 17 00:00:00 2001
+From d8aa37bcef7b1def50a84315b9a6165257a3a4f3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 18 Nov 2019 17:00:29 -0800
 Subject: [PATCH] Check for atomic<double> intrinsics
diff --git a/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
index b99d4a36e8b..b518da17243 100644
--- a/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
+++ b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
@@ -1,4 +1,4 @@
-From 2df5d92a84396aeca1689e17a97e16a337a8a5df Mon Sep 17 00:00:00 2001
+From f2232b5332f650f4920e1f2a86530de9b26ef1fc Mon Sep 17 00:00:00 2001
 From: Ovidiu Panait <ovidiu.panait@windriver.com>
 Date: Fri, 31 Jan 2020 10:56:11 +0200
 Subject: [PATCH] cmake: Fix configure for packages using find_package()
diff --git a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
index df2f8cca2f7..a9841fdc294 100644
--- a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
+++ b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
@@ -1,4 +1,4 @@
-From 45d866a863dc78f33104c5c265557886e6f27b45 Mon Sep 17 00:00:00 2001
+From acc6845a5fc31b64640dece7786293f782a33f35 Mon Sep 17 00:00:00 2001
 From: Jim Broadus <jbroadus@xevo.com>
 Date: Thu, 26 Mar 2020 16:05:53 -0700
 Subject: [PATCH] clang: Fix resource dir location for cross toolchains
diff --git a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
index e0b38f10bb8..1b8e1378139 100644
--- a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
+++ b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
@@ -1,4 +1,4 @@
-From 887bddb6654d942842b2c81f0b726592d27f6be8 Mon Sep 17 00:00:00 2001
+From cbb2d023069d3774a68ac37aa9815ba5e80f2903 Mon Sep 17 00:00:00 2001
 From: Oleksandr Ocheretnyi <oocheret@cisco.com>
 Date: Wed, 15 Apr 2020 00:08:39 +0300
 Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot for ldso
diff --git a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
index 6db3857d42e..d283d77c2b3 100644
--- a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
@@ -1,4 +1,4 @@
-From 9ffa9959c6ebe18527129e6a41c4cdda279ef501 Mon Sep 17 00:00:00 2001
+From 9ed96e86d625e5a08b1142798d6da13e8e9c62c6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 14 Oct 2020 22:19:57 -0700
 Subject: [PATCH] clang: Use python3 in python scripts
diff --git a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
index 71d2da47748..696253a6021 100644
--- a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
+++ b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
@@ -1,4 +1,4 @@
-From 26b241706a61448a49fcfca5b15683f75735f9c8 Mon Sep 17 00:00:00 2001
+From 7cff6198ade4591b8bf2bfe4e94d7fe57241f926 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 25 Jan 2021 16:14:35 +0800
 Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor names
diff --git a/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
index f58427c0337..79b396e132b 100644
--- a/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
+++ b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
@@ -1,4 +1,4 @@
-From 50ed4a22ab3b8e2e9d6c0175133e5aa35ffa9e92 Mon Sep 17 00:00:00 2001
+From 806d90c9bead326dc1d181fdc6449f7c14f6abef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 May 2021 17:32:13 -0700
 Subject: [PATCH] compiler-rt: Do not use backtrace APIs on non-glibc linux
diff --git a/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch b/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
index 3116d7cf634..5646fcd0264 100644
--- a/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
+++ b/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
@@ -1,4 +1,4 @@
-From fd360e4c6e70a867e839c7d3237354d52c75a4ce Mon Sep 17 00:00:00 2001
+From 38c0e64da50d88605728f26c5d9dd6fbbb84ec82 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 May 2021 17:56:03 -0700
 Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux distros
diff --git a/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch b/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
index 0e64bae62bb..2580c9e68ee 100644
--- a/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
+++ b/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
@@ -1,4 +1,4 @@
-From 54545081ecd42df9c4a0f2dffe629e95c18ce701 Mon Sep 17 00:00:00 2001
+From 04c601a6a77aff75bae5e395c5c6a21446ad1856 Mon Sep 17 00:00:00 2001
 From: Maksim Kita <maksim-kita@yandex-team.ru>
 Date: Sun, 23 May 2021 10:27:29 +0000
 Subject: [PATCH] libunwind: Added unw_backtrace method
diff --git a/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch b/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
index 79a0ea43e22..cc25c4b5cb4 100644
--- a/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
+++ b/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
@@ -1,4 +1,4 @@
-From fc52c73be9ca2143720be9881b78954132588aee Mon Sep 17 00:00:00 2001
+From 1e5283110b9c089eece00e3104704f2317bd7586 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Feb 2022 01:31:26 -0800
 Subject: [PATCH] lldb: Link with libatomic on x86
diff --git a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch b/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
index ce9cfb2465e..866a1ecc704 100644
--- a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
+++ b/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
@@ -1,4 +1,4 @@
-From 7b690ce5d96bbd80f0f300e6f57a4be46073af76 Mon Sep 17 00:00:00 2001
+From 371173b5c202288f7992fb4855ec631250b691b4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Mar 2022 16:28:16 -0800
 Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
diff --git a/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch b/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
index 53ee3b0016c..6d5e7db46bd 100644
--- a/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
+++ b/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
@@ -1,4 +1,4 @@
-From 2b05b864651cb3bc611435ccbf8d4e4ba15ca62b Mon Sep 17 00:00:00 2001
+From 71b10214a98cdd3fdec3965a1195ce8cc70baf96 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Aug 2022 11:50:57 -0700
 Subject: [PATCH] llvm: Do not use cmake infra to detect libzstd
diff --git a/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch b/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
index 8d5708bac84..409b60132eb 100644
--- a/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
+++ b/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
@@ -1,4 +1,4 @@
-From d0cba62df8273177d9fbbb586e786e40cd8fea6e Mon Sep 17 00:00:00 2001
+From 8245da75b5626e2361ed2833cdfd08a51dc70459 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Jan 2023 18:44:34 -0800
 Subject: [PATCH] compiler-rt: Fix stat struct's size for O32 ABI
diff --git a/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch b/meta/recipes-devtools/clang/clang/0026-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
similarity index 99%
rename from meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
rename to meta/recipes-devtools/clang/clang/0026-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
index 5467fb2b681..6c8dfb96b7c 100644
--- a/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
+++ b/meta/recipes-devtools/clang/clang/0026-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
@@ -1,4 +1,4 @@
-From 7ee4e023df4661e96d5132855165a1d79cb77736 Mon Sep 17 00:00:00 2001
+From fa56e3ce3bbd7b795ab553a1b5da4a0f90589fda Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 31 Aug 2023 18:14:47 +0200
 Subject: [PATCH] ToolChains/Gnu.cpp: ARMLibDirs search also in lib32
diff --git a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
deleted file mode 100644
index 376733e07fd..00000000000
--- a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 20d83be701fe5fd03bbbd8352400179b74563ba7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 21 Feb 2023 12:46:10 -0800
-Subject: [PATCH] compiler-rt: Undef _TIME_BITS along with _FILE_OFFSET_BITS in
- sanitizers
-
-On 32bit systems using 64bit time_t build fails because
-_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
-
-Fixes
-In file included from compiler-rt/lib/sanitizer_common/sanitizer_procmaps_solaris.cpp:17:
-In file included from compiler-rt/lib/sanitizer_common/sanitizer_platform.h:25:
-In file included from /usr/include/features.h:393:
-/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-    ^
-1 error generated.
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D144514]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- compiler-rt/lib/sanitizer_common/sanitizer_platform.h | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
-index 13099fe84b0a..8fea7a260c3a 100644
---- a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
-+++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
-@@ -23,6 +23,15 @@
- // function declarations into a .S file which doesn't compile.
- // https://crbug.com/1162741
- #if __has_include(<features.h>) && !defined(__ANDROID__)
-+// Some sources undefine _FILE_OFFSET_BITS deliberately e.g.
-+// sanitizer_procmaps_solaris.cpp. This is problematic on glibc systems with
-+// 32-bit architectures using 64-bit time_t and users passing _TIME_BITS=64
-+// from build environment, therefore both _FILE_OFFSET_BITS and _TIME_BITS
-+// need to be undefined together since features.h will check for both being 64
-+// if one is set to 64.
-+#  if !defined(_FILE_OFFSET_BITS)
-+#    undef _TIME_BITS
-+#  endif
- #  include <features.h>
- #endif
- 
diff --git a/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch b/meta/recipes-devtools/clang/clang/0027-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
similarity index 98%
rename from meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
rename to meta/recipes-devtools/clang/clang/0027-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
index 518aeb2fd58..40fb95439a9 100644
--- a/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
+++ b/meta/recipes-devtools/clang/clang/0027-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
@@ -1,4 +1,4 @@
-From cbd5f24fd6095f69134cb5536f8187e7264ceaa0 Mon Sep 17 00:00:00 2001
+From 6d381de086b2646c438af919f2f1ed2c46c8e89a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 3 Feb 2024 16:47:10 -0800
 Subject: [PATCH] clang/llvm: Add OE specific ABI triple for N32 ABI
diff --git a/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0028-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
similarity index 97%
rename from meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
rename to meta/recipes-devtools/clang/clang/0028-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
index 1545e6b9ec1..407956f8ee2 100644
--- a/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0028-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
@@ -1,4 +1,4 @@
-From c4ebc0b6347886e679aa211a3fa3816be9b2fd52 Mon Sep 17 00:00:00 2001
+From c9060d3385b65e9a3d514801c68da7aa41647c5b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2024 22:04:43 -0700
 Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
diff --git a/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch b/meta/recipes-devtools/clang/clang/0029-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
similarity index 98%
rename from meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
rename to meta/recipes-devtools/clang/clang/0029-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
index b37661aff48..47af9a05414 100644
--- a/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
+++ b/meta/recipes-devtools/clang/clang/0029-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
@@ -1,4 +1,4 @@
-From 36b051141be917a466fbc26b140b3ba268d82468 Mon Sep 17 00:00:00 2001
+From 0380d07443155f26cca1fef70a21426faf102624 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Fri, 13 Sep 2024 13:38:08 +0200
 Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other tools do
diff --git a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch b/meta/recipes-devtools/clang/clang/0030-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
similarity index 94%
rename from meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
rename to meta/recipes-devtools/clang/clang/0030-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
index 5483638d12c..3a670bf94fc 100644
--- a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
+++ b/meta/recipes-devtools/clang/clang/0030-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
@@ -1,4 +1,4 @@
-From c4da3b294284213bad523c47a9ab1825175ccda6 Mon Sep 17 00:00:00 2001
+From 223ba6978ee5d198e4dd792e702e5049d53bde37 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Mar 2025 00:30:38 -0700
 Subject: [PATCH] compiler-rt: Do not pass --target to clang compiler
diff --git a/meta/recipes-devtools/clang/clang/0032-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/clang/clang/0031-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0032-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
rename to meta/recipes-devtools/clang/clang/0031-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index 416f29804da..f5ae5cca4c9 100644
--- a/meta/recipes-devtools/clang/clang/0032-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/clang/clang/0031-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 222b03ed7a0549e7cdbe67a37b6f965f93d3d8fe Mon Sep 17 00:00:00 2001
+From be6d7ca8f69615782b7376e61ff65feb0b389b58 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
diff --git a/meta/recipes-devtools/clang/clang/0033-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/clang/clang/0032-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0033-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
rename to meta/recipes-devtools/clang/clang/0032-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
index afd28fb8f5e..cfa24d8c4bd 100644
--- a/meta/recipes-devtools/clang/clang/0033-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
+++ b/meta/recipes-devtools/clang/clang/0032-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
@@ -1,4 +1,4 @@
-From 0bd04308858d0a5d582d54584e5c021e10fee1bb Mon Sep 17 00:00:00 2001
+From ac2b09550c5b7e51e4ac70ff5dfa006a54e0bf0e Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 2 Apr 2025 17:05:17 +0300
 Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
diff --git a/meta/recipes-devtools/clang/clang/0034-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch b/meta/recipes-devtools/clang/clang/0033-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
similarity index 97%
rename from meta/recipes-devtools/clang/clang/0034-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
rename to meta/recipes-devtools/clang/clang/0033-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
index c409509d00f..e586de7d997 100644
--- a/meta/recipes-devtools/clang/clang/0034-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
+++ b/meta/recipes-devtools/clang/clang/0033-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
@@ -1,4 +1,4 @@
-From 83994facdea30da795875b50a26d7f23035ae141 Mon Sep 17 00:00:00 2001
+From 2c1f2effb8a5489fbb384610d7bf515a2c5b9b68 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 May 2025 14:03:12 -0700
 Subject: [PATCH] compiler-rt: Exclude sync_fetch_and_* for any pre-ARMv6
diff --git a/meta/recipes-devtools/clang/clang/0035-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch b/meta/recipes-devtools/clang/clang/0034-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0035-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
rename to meta/recipes-devtools/clang/clang/0034-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
index 45d499e60f2..9ccd4997b04 100644
--- a/meta/recipes-devtools/clang/clang/0035-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
+++ b/meta/recipes-devtools/clang/clang/0034-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
@@ -1,4 +1,4 @@
-From 6167af21af9a97fe10d6d5f69aacf7d9785a8fcf Mon Sep 17 00:00:00 2001
+From e7ec5120258d95ac015100cbfe4e595d4592d47b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 22 May 2025 21:50:45 -0700
 Subject: [PATCH] [compiler-rt] Hardcode uptr/sptr typedefs on Mips/Linux
diff --git a/meta/recipes-devtools/clang/clang/0036-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch b/meta/recipes-devtools/clang/clang/0035-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
similarity index 96%
rename from meta/recipes-devtools/clang/clang/0036-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
rename to meta/recipes-devtools/clang/clang/0035-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
index 95cb9ce1e5e..88e6fa9c4d2 100644
--- a/meta/recipes-devtools/clang/clang/0036-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
+++ b/meta/recipes-devtools/clang/clang/0035-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
@@ -1,4 +1,4 @@
-From cda45a69a5fa5cd4106be8588c7e33e8f6535e17 Mon Sep 17 00:00:00 2001
+From c4e8df6a492de2d98be18093de2fe0d97e221d48 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Jul 2025 19:22:07 -0700
 Subject: [PATCH] clang: Use sysroot relative paths for getArchSpecificLibPaths
diff --git a/meta/recipes-devtools/clang/clang/0037-allow-external-prepare_builtins.patch b/meta/recipes-devtools/clang/clang/0036-allow-external-prepare_builtins.patch
similarity index 97%
rename from meta/recipes-devtools/clang/clang/0037-allow-external-prepare_builtins.patch
rename to meta/recipes-devtools/clang/clang/0036-allow-external-prepare_builtins.patch
index a9f401b21bb..7331eb6f83a 100644
--- a/meta/recipes-devtools/clang/clang/0037-allow-external-prepare_builtins.patch
+++ b/meta/recipes-devtools/clang/clang/0036-allow-external-prepare_builtins.patch
@@ -1,4 +1,4 @@
-From cd679dff50adb4a96dae132ba54e74d7c7371074 Mon Sep 17 00:00:00 2001
+From 61cb0afd40ef8d6a5493cbd3bd60f49f61e8b34f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 16 Jul 2025 23:24:21 +0100
 Subject: [PATCH] allow external prepare_builtins
diff --git a/meta/recipes-devtools/clang/clang/0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch b/meta/recipes-devtools/clang/clang/0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
similarity index 96%
rename from meta/recipes-devtools/clang/clang/0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
rename to meta/recipes-devtools/clang/clang/0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
index 1572911aad6..7582134eeac 100644
--- a/meta/recipes-devtools/clang/clang/0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
+++ b/meta/recipes-devtools/clang/clang/0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
@@ -1,4 +1,4 @@
-From e5033c176725f7877694cbee6a8aaa00291101c4 Mon Sep 17 00:00:00 2001
+From 4a5e076817be3291d9370a8831f96d1223087a72 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 Jul 2025 19:12:13 -0700
 Subject: [PATCH] Revert "[libc++] Remap headers in the debug info when
diff --git a/meta/recipes-devtools/clang/clang/0039-Prevent-revisiting-block-when-searching-for-noreturn.patch b/meta/recipes-devtools/clang/clang/0038-Prevent-revisiting-block-when-searching-for-noreturn.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0039-Prevent-revisiting-block-when-searching-for-noreturn.patch
rename to meta/recipes-devtools/clang/clang/0038-Prevent-revisiting-block-when-searching-for-noreturn.patch
index 343b65f505c..d3d7403854a 100644
--- a/meta/recipes-devtools/clang/clang/0039-Prevent-revisiting-block-when-searching-for-noreturn.patch
+++ b/meta/recipes-devtools/clang/clang/0038-Prevent-revisiting-block-when-searching-for-noreturn.patch
@@ -1,4 +1,4 @@
-From ef88c2d42100d7e9aee8dc876094993080b42b9f Mon Sep 17 00:00:00 2001
+From fdd02ac61cb909711f56f1e990f45439b0beef7b Mon Sep 17 00:00:00 2001
 From: Serge Pavlov <sepavloff@gmail.com>
 Date: Fri, 25 Jul 2025 13:35:19 +0700
 Subject: [PATCH] Prevent revisiting block when searching for noreturn vars
diff --git a/meta/recipes-devtools/clang/clang/0040-Only-build-c-index-test-when-clang-tests-are-include.patch b/meta/recipes-devtools/clang/clang/0039-Only-build-c-index-test-when-clang-tests-are-include.patch
similarity index 96%
rename from meta/recipes-devtools/clang/clang/0040-Only-build-c-index-test-when-clang-tests-are-include.patch
rename to meta/recipes-devtools/clang/clang/0039-Only-build-c-index-test-when-clang-tests-are-include.patch
index 111e0110bcd..d3988b0f36a 100644
--- a/meta/recipes-devtools/clang/clang/0040-Only-build-c-index-test-when-clang-tests-are-include.patch
+++ b/meta/recipes-devtools/clang/clang/0039-Only-build-c-index-test-when-clang-tests-are-include.patch
@@ -1,4 +1,4 @@
-From 70c4615ab54e5380019955a7cb3381b977802b7d Mon Sep 17 00:00:00 2001
+From de5737078972d8ba89bc6194fc0f50421c8d5631 Mon Sep 17 00:00:00 2001
 From: David Spickett <david.spickett@linaro.org>
 Date: Tue, 29 Jul 2025 14:17:56 +0000
 Subject: [PATCH] Only build c-index-test when clang tests are included
diff --git a/meta/recipes-devtools/clang/clang/0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch b/meta/recipes-devtools/clang/clang/0040-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
similarity index 97%
rename from meta/recipes-devtools/clang/clang/0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
rename to meta/recipes-devtools/clang/clang/0040-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
index 4dc01f6e640..4e93756af92 100644
--- a/meta/recipes-devtools/clang/clang/0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
+++ b/meta/recipes-devtools/clang/clang/0040-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
@@ -1,4 +1,4 @@
-From 93a51605fccf0f99868f8bae212a08823d01b03a Mon Sep 17 00:00:00 2001
+From c2b576a49ed1b83def75578f7d2b2e8c3c54e60f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 2 Aug 2025 17:58:20 -0700
 Subject: [PATCH] [opt-viewer] Allow users to set LLVM_HAVE_OPT_VIEWER_MODULES
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 98143194295..bf3a63914a7 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "0"
+PATCH_VER = "1"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 889847c3e11..625b0b064b7 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "1672e3efb4c2affd62dbbe12ea898b28a451416c7d95c1bd0190c26cbe878825"
+SRC_URI[sha256sum] = "8863980e14484a72a9b7d2c80500e1749054d74f08f8c5102fd540a3c5ac9f8a"
 
 SRC_URI = "\
     ${BASEURI} \
@@ -46,22 +46,21 @@ SRC_URI = "\
     file://0023-compiler-rt-Enable-__int128-for-ppc32.patch \
     file://0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
     file://0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
-    file://0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch \
-    file://0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch \
-    file://0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch \
-    file://0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
-    file://0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch \
-    file://0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
-    file://0032-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
-    file://0033-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
-    file://0034-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
-    file://0035-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
-    file://0036-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch \
-    file://0037-allow-external-prepare_builtins.patch \
-    file://0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch \
-    file://0039-Prevent-revisiting-block-when-searching-for-noreturn.patch \
-    file://0040-Only-build-c-index-test-when-clang-tests-are-include.patch \
-    file://0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch \
+    file://0026-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch \
+    file://0027-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch \
+    file://0028-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
+    file://0029-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch \
+    file://0030-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
+    file://0031-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+    file://0032-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
+    file://0033-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
+    file://0034-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
+    file://0035-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch \
+    file://0036-allow-external-prepare_builtins.patch \
+    file://0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch \
+    file://0038-Prevent-revisiting-block-when-searching-for-noreturn.patch \
+    file://0039-Only-build-c-index-test-when-clang-tests-are-include.patch \
+    file://0040-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
diff --git a/meta/recipes-devtools/python/0001-python-Skip-NODEV-portion-of-test_makedev-when-linke.patch b/meta/recipes-devtools/python/0001-python-Skip-NODEV-portion-of-test_makedev-when-linke.patch
new file mode 100644
index 00000000000..68bf3afe5f3
--- /dev/null
+++ b/meta/recipes-devtools/python/0001-python-Skip-NODEV-portion-of-test_makedev-when-linke.patch
@@ -0,0 +1,86 @@
+From 33ad9a401644f4191c8f1fd40b8eaf297509cef3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 1 Sep 2025 19:21:19 -0700
+Subject: [PATCH v3] python: Skip NODEV portion of test_makedev when linked to musl
+
+backport the upstreamed patch which is available in 3.14+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+v2: Update patch with newly filed GH issue report for this problem
+v3: Apply the backport
+
+ ...DEV-portion-of-test_makedev-when-lin.patch | 24 +++++++++++++++++++
+ .../python3/test_posix_nodev_disable.patch    | 16 -------------
+ .../recipes-devtools/python/python3_3.13.7.bb |  4 +---
+ 3 files changed, 25 insertions(+), 19 deletions(-)
+ create mode 100644 meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch
+ delete mode 100644 meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
+
+diff --git a/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch b/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch
+new file mode 100644
+index 00000000000..4390e086d0f
+--- /dev/null
++++ b/meta/recipes-devtools/python/python3/0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch
+@@ -0,0 +1,24 @@
++From 2dc5e9f4c82888dbe21bd1eadb4b59b0efa9608c Mon Sep 17 00:00:00 2001
++From: Zachary Ware <zach@python.org>
++Date: Sat, 6 Sep 2025 13:20:12 -0500
++Subject: [PATCH] gh-90548: Skip NODEV portion of test_makedev when linked to musl
++
++Upstream-Status: Backport [https://github.com/python/cpython/pull/138593]
++Signed-off-by: Khem Raj <raj.khem@gmail.com>
++---
++ Lib/test/test_posix.py | 2 +-
++ 1 file changed, 1 insertion(+), 1 deletion(-)
++
++diff --git a/Lib/test/test_posix.py b/Lib/test/test_posix.py
++index c9cbe15..bfc1e2b 100644
++--- a/Lib/test/test_posix.py
+++++ b/Lib/test/test_posix.py
++@@ -757,7 +757,7 @@ class PosixTester(unittest.TestCase):
++             self.assertRaises((ValueError, OverflowError), posix.makedev, x, minor)
++             self.assertRaises((ValueError, OverflowError), posix.makedev, major, x)
++ 
++-        if sys.platform == 'linux':
+++        if sys.platform == 'linux' and not support.linked_to_musl():
++             NODEV = -1
++             self.assertEqual(posix.major(NODEV), NODEV)
++             self.assertEqual(posix.minor(NODEV), NODEV)
+diff --git a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
+deleted file mode 100644
+index 85767e1e898..00000000000
+--- a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
++++ /dev/null
+@@ -1,16 +0,0 @@
+-Disable part of test_posix.test_makedev that depends on the NODEV
+-macro being defined (missing on musl).
+-
+-Upstream-Status: Submitted [https://github.com/python/cpython/pull/31794]
+-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---- a/Lib/test/test_posix.py
+-+++ b/Lib/test/test_posix.py
+-@@ -757,7 +757,7 @@ class PosixTester(unittest.TestCase):
+-             self.assertRaises((ValueError, OverflowError), posix.makedev, x, minor)
+-             self.assertRaises((ValueError, OverflowError), posix.makedev, major, x)
+- 
+--        if sys.platform == 'linux':
+-+        if False:
+-             NODEV = -1
+-             self.assertEqual(posix.major(NODEV), NODEV)
+-             self.assertEqual(posix.minor(NODEV), NODEV)
+diff --git a/meta/recipes-devtools/python/python3_3.13.7.bb b/meta/recipes-devtools/python/python3_3.13.7.bb
+index a42b2c2a2d2..c682f1288ec 100644
+--- a/meta/recipes-devtools/python/python3_3.13.7.bb
++++ b/meta/recipes-devtools/python/python3_3.13.7.bb
+@@ -30,9 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+            file://0001-test_active_children-skip-problematic-test.patch \
+            file://0001-test_readline-skip-limited-history-test.patch \
+            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
+-           "
+-SRC_URI:append:libc-musl = "\
+-           file://test_posix_nodev_disable.patch \
++           file://0001-gh-90548-Skip-NODEV-portion-of-test_makedev-when-lin.patch \
+            "
+ SRC_URI:append:class-native = " \
+            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \

