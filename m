Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4220CC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 07:32:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.43000.1747985535036003697
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 00:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EXKGF9ka;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-231e331baceso71513895ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 00:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747985534; x=1748590334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZMdWCHx1ZKd14KscvpKgLbaKjdPPwwx+DKKwkL9M34=;
        b=EXKGF9kaOj8EuoKDobFxH34gHJ0tqnh2SB3EPoONjxUXDFQ2rKM3WBmHYp3QdSEqp2
         MKqneANGdh71GRKJFnFJa2dDNIy+BrcaqmQDBfklfgmUVkmMjhJK63I33INJnbnxwGDV
         /Yk18QRw2zqrndqld2jOKzttFDr0BQ/+47KX8j2MdRsXlMt3PlvqhutHpbOIqbvixfc2
         9rPUoIbqIRdoAqcTVBSIBMo4aX6mTNsbBeyCo54CDQMlHzRNSw44XjweUqgcnpH1QhR+
         xwlCC+Tyc3q+mzZQLCM7DqehCKCAGlh7aURfsGEX5e/UPv7VUTEcQtb4/bcfQVd78Uia
         tfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747985534; x=1748590334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZMdWCHx1ZKd14KscvpKgLbaKjdPPwwx+DKKwkL9M34=;
        b=vruazGnghcMEhgAzPzpVrMNjUGmyAtSeZSEuTjjLfzWE+bPMVzFRXgCV9Nqt8cZqHz
         VotxAPm3+5+9DHC0VHiNLuhXWozYvr75qJRs1n5T8bxSDU5q/dNzsP427uCCs4atIHGu
         BALJLw7YnjgugNtGidrqLiLTI2A5MKyWT0GlSoMcDVFmb561ZoC0skrfIvdrd/ko+trb
         Ynt+9su4KSxYGJZAeRva/ugPi5xEiDrqyF/NlT5q/nXmuXEfs+3He5GMqfgkYO6Aipv1
         ri+U/xEmHFZSsrWVUcTRZVC2PyZJp1BtZqnOu1MSUadSCbjEtVSc6lu7qQsjbSAfYjK2
         VYow==
X-Gm-Message-State: AOJu0YyEceFB3M09dFjSeiiQv5dAPlbAJ+qZX9E5GtOoh9uWDid8PUmi
	Lx4g4yaosF5Oy6JejCU5AutCamQwVkbbIgDaEpelI3kW3LWOBB8j7phrG8q81/t8
X-Gm-Gg: ASbGnctofi3vHmrcAEl2CWWST8aQS6y5mcJelq5v40YfcM5Hc/h8VdhQArPV7EJvwCc
	inAjdSyNKx7ep/+Ac+V+E4O4I+29ngxxg7Fz4hP7ndEajKS2S1CHvdBCHNYGA5jlFhz6Z3j56VS
	765YQBdOUJBuWGAGiO+n+RcjHecOI354bGI2jcmivRSPhw+d69N1KAplQb48E2GJtjkAMyRCcAy
	Cayzv0iJ0DHdhf9exp3zCD3ZG8YY+S6veEebLYZZftVXLq0zzhLzmcWvubO0b0uW4tuvhz73edH
	1We9wuJ/Q/Oo10eG1o3wc2mAR/ygzEZjHqxShNYJyzU=
X-Google-Smtp-Source: AGHT+IHiDDBjxOtBEYxViLSSOT9omh04M9GnuAYQeZNBvWcRUvsbMWZv/0+m5ucrmHXo6HYF9LRmzw==
X-Received: by 2002:a17:902:e885:b0:224:1001:6787 with SMTP id d9443c01a7336-233f21c7cb4mr30411005ad.4.1747985533785;
        Fri, 23 May 2025 00:32:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e98082sm118843255ad.122.2025.05.23.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:32:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] clang: Upgrade to 20.1.5 release
Date: Fri, 23 May 2025 00:32:08 -0700
Message-ID: <20250523073208.211042-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523073208.211042-1-raj.khem@gmail.com>
References: <20250523073208.211042-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 07:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217180

Brings following fixes

* 7b09d7b44638 [analyzer] Workaround for slowdown spikes (unintended scope increase) (#136720)
* a708fb737a78 [RISCV] Allow `Zicsr`/`Zifencei` to duplicate with `g` (#136842)
* 1c0368417f55 [clang][analysis] Fix flaky clang/test/Analysis/live-stmts.cpp test (2nd attempt) (#127406)
* 0439d1d36312 [Clang] Fix handling of reference types in tryEvaluateBuiltinObjectSize (#138247)
* 74ed1ac61104 [sanitizer_common] Fix build on ppc64+musl (#120036)
* 2d079b96a5fb release/20.x: [clang-format] Fix a crash on formatting missing r_paren/r_brace (#138230)
* 2cacf46f35c8 [X86][TargetLowering] Avoid deleting temporary nodes in `getNegatedExpression` (#139029)
* f233430d977b [AArch64] Fix feature list for FUJITSU-MONAKA processor (#139212)
* 41c36d940804 [clang] Fix unused variable warning in MS mangler from constant matrix patch
* 72ad9be1e337 [Clang][MicrosoftMangle] Implement mangling for ConstantMatrixType (#134930)
* 0019b7d0ae0b [wasm-ld] Refactor WasmSym from static globals to per-link context (#134970)
* b7b834e2a20e [RTSan][Darwin] Adjust OSSpinLock/_os_nospin_lock interceptor and tests (#132867)
* f811c7df0a10 [rtsan][Apple] Add interceptor for _os_nospin_lock_lock (#131034)
* 4370072022e5 [clang] Forward TPL of NestedNameSpecifier
* d34d5296095b Support z17 processor name and scheduler description
* a7166c373946 release/20.x: [clang-format] RemoveParentheses shouldn't remove empty parentheses (#138229)
* 5429418cb064 [clang] Add support for Debian 14 Forky and Debian 15 Duke (#138460)
* be087ab35970 [libc++] Re-introduce _LIBCPP_DISABLE_AVAILABILITY (#134158)
* 2b34040173f7 [clang-repl] Fix destructor for interpreter for the cuda negation case (#138091)
* ae97a56d363f [Hexagon] Add missing patterns to select PFALSE and PTRUE (#138712)
* 2386c377db4f [BasicAA] Gracefully handle large LocationSize (#138528)
* 961ce35e2957 [OpenMP] Add pre sm_70 load hack back in (#138589)
* 009f3c10d1c1 [LLD][COFF] Don't dllimport from static libraries (#134443)
* 70eed33971d9 [InstCombine] Do not combine shuffle+bitcast if the bitcast is eliminable. (#135769)
* 6ddf2e5d10f8 [clang-tidy] Do not pass any file when listing checks in run_clang_ti… (#137286)
* 8272e451613d [flang] Exempt construct entities from SAVE check for PURE (#131383)
* 069ef671e0ab [AArch64][SME] Allow spills of ZT0 around SME ABI routines again (#136726)
* a38e1ae2041d [AArch64][SME2] Don't preserve ZT0 around SME ABI routines (#132722)
* be4097b6ee57 Fix crash lowering stack guard on OpenBSD/aarch64. (#125416)
* aecbb2364a7c [Clang] Fix the trailing comma regression (#136273)
* ebfae55af454 Bump version to 20.1.5

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
 ...t-anchor-for-adding-OE-distro-vendor.patch | 10 +-
 ...ot-use-backtrace-APIs-on-non-glibc-l.patch |  2 +-
 ...iple-for-non-debian-multiarch-linux-.patch |  2 +-
 ...libunwind-Added-unw_backtrace-method.patch |  2 +-
 ...0022-lldb-Link-with-libatomic-on-x86.patch |  2 +-
 ...ompiler-rt-Enable-__int128-for-ppc32.patch |  2 +-
 ...ot-use-cmake-infra-to-detect-libzstd.patch |  2 +-
 ...t-Fix-stat-struct-s-size-for-O32-ABI.patch |  2 +-
 ...f-_TIME_BITS-along-with-_FILE_OFFSET.patch |  2 +-
 ....cpp-ARMLibDirs-search-also-in-lib32.patch |  2 +-
 ...d-OE-specific-ABI-triple-for-N32-ABI.patch |  2 +-
 ...unwind.pc.in-and-llvm-config-scripts.patch |  2 +-
 ...spect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  2 +-
 ...Do-not-pass-target-to-clang-compiler.patch |  2 +-
 .../clang/0032-Fix-build-on-ppc64-musl.patch  | 97 -------------------
 ...ild-option-to-disable-building-dexp.patch} |  2 +-
 ...-sort-ClassInfo-lists-by-name-as-we.patch} |  2 +-
 ...ve-LLVM_LDFLAGS-from-ldflags-output.patch} |  2 +-
 ...t-date-and-time-into-generate-files.patch} |  2 +-
 ...-gcs-instead-of-gcs-target-attribute.patch | 56 +++++++++++
 ...de-sync_fetch_and_-for-any-pre-ARMv.patch} |  4 +-
 meta/recipes-devtools/clang/common-clang.inc  |  2 +-
 meta/recipes-devtools/clang/common.inc        | 14 +--
 41 files changed, 107 insertions(+), 146 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/0032-Fix-build-on-ppc64-musl.patch
 rename meta/recipes-devtools/clang/clang/{0033-clangd-Add-a-build-option-to-disable-building-dexp.patch => 0032-clangd-Add-a-build-option-to-disable-building-dexp.patch} (98%)
 rename meta/recipes-devtools/clang/clang/{0034-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch => 0033-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch => 0034-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch => 0035-openmp-Do-not-emit-date-and-time-into-generate-files.patch} (95%)
 create mode 100644 meta/recipes-devtools/clang/clang/0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
 rename meta/recipes-devtools/clang/clang/{0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch => 0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch} (92%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d7d157af4fe..d93b9b31095 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -478,7 +478,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-20.1.4 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.5 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
index 21b033b498e..3853d7648b4 100644
--- a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
+++ b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
@@ -1,4 +1,4 @@
-From ec9babfa91931042e7aa771915e2f1d4dc8d15e0 Mon Sep 17 00:00:00 2001
+From 1fa8ec110c67714cff009b481c430e3d004bfaad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 Aug 2017 10:37:49 -0700
 Subject: [PATCH] libcxxabi: Find libunwind headers when
diff --git a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
index 88cef402daa..d5d6a2c6d7e 100644
--- a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
+++ b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
@@ -1,4 +1,4 @@
-From 8cdfcfb9102c4008758bb844856e553d4fe4ae79 Mon Sep 17 00:00:00 2001
+From 6e8c6c53281fdd3b11d29d706905a3fe959afd11 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 19 Apr 2015 15:16:23 -0700
 Subject: [PATCH] compiler-rt: support a new embedded linux target
diff --git a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
index a1536248608..0ee70902900 100644
--- a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
+++ b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
@@ -1,4 +1,4 @@
-From c105a2efab08776d1f4df6b9b8d26d0f89d14b41 Mon Sep 17 00:00:00 2001
+From 419855642e4a48d09e7b3b1e02593b6d9a506089 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 May 2016 23:11:45 -0700
 Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
diff --git a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
index c70f740222f..60b5360057a 100644
--- a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
+++ b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
@@ -1,4 +1,4 @@
-From 388a70b4a8f828b7c58a0fb7bc3ee18001bc5f9b Mon Sep 17 00:00:00 2001
+From 2603da5f1fce88f6c7f6134faf7757f17b7e14f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 May 2016 00:33:20 +0000
 Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if they are
diff --git a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
index 6d3f5293aab..7aea73e611b 100644
--- a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
+++ b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
@@ -1,4 +1,4 @@
-From 0b344231c49d8c145bc3ad882d259d36fb19e827 Mon Sep 17 00:00:00 2001
+From 13a9ce5a34060abaa6d5da5176eb1dab271dac4e Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
diff --git a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
index 02586878207..44fa980ab88 100644
--- a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
+++ b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
@@ -1,4 +1,4 @@
-From 80cacc04e4c0d34f79ee2f112b302c4fbb797d72 Mon Sep 17 00:00:00 2001
+From a804903ed85707d9a06c7e01aef536b3042790d0 Mon Sep 17 00:00:00 2001
 From: Dan McGregor <dan.mcgregor@usask.ca>
 Date: Wed, 26 Apr 2017 20:29:41 -0600
 Subject: [PATCH] clang: driver: Check sysroot for ldso path
diff --git a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
index 1681080ece2..6374ec7bf59 100644
--- a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
+++ b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
@@ -1,4 +1,4 @@
-From 47dfdd42687c403c044fdb830472d7bedc1b3d39 Mon Sep 17 00:00:00 2001
+From 703e5acbeaad6eeb316740dd8b92b34db99bb1b3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 May 2016 21:11:06 -0700
 Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
diff --git a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
index 12f670034eb..16d8c9bae52 100644
--- a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
+++ b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
@@ -1,4 +1,4 @@
-From 4b64a243ce69f782964d4841d1079689a62ebdc1 Mon Sep 17 00:00:00 2001
+From b1d4a42b6078502530924cd0d15052671c760eb6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 Mar 2017 09:02:13 -0700
 Subject: [PATCH] clang: Prepend trailing '/' to sysroot
diff --git a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
index 5d7a292fcf6..2ad1130355b 100644
--- a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
+++ b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
@@ -1,4 +1,4 @@
-From edc111019281ed898add2c3f86ebfd54b0fa46d9 Mon Sep 17 00:00:00 2001
+From 3edfe16c0d8bb3d135465038cb07c8122baac698 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 Mar 2017 19:06:26 -0700
 Subject: [PATCH] clang: Look inside the target sysroot for compiler runtime
diff --git a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
index c4fbaee956a..346a4fcbb0e 100644
--- a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
+++ b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
@@ -1,4 +1,4 @@
-From e79d44241dfd0f4b4ec25547e6a65e61d2a0b4b2 Mon Sep 17 00:00:00 2001
+From dc2de98d70a763f30347df2d76df1c70cc464b87 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 20 Mar 2021 16:09:16 -0700
 Subject: [PATCH] clang: Define / releative gcc installation dir
diff --git a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
index e50e3bf0261..25dade43897 100644
--- a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
+++ b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
@@ -1,4 +1,4 @@
-From 42dc7f1fd3e7bc549f87b9c28fb3024a3970e96d Mon Sep 17 00:00:00 2001
+From 0712b0f0fa8c9cf27016e8b1ef8391f6c9cfa4ff Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Jul 2019 22:51:39 -0700
 Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for static
diff --git a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
index 0f386cd1a6c..b55740e0d61 100644
--- a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
+++ b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
@@ -1,4 +1,4 @@
-From 0e60706bcddbb9a97ab28df6fba39bf6bd49ab27 Mon Sep 17 00:00:00 2001
+From a6055a858f6e54cac2b427101fb43c83599b9072 Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 26 Dec 2019 12:56:16 -0800
 Subject: [PATCH] Pass PYTHON_EXECUTABLE when cross compiling for native build
diff --git a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
index 3a6713a2dee..99952fe1826 100644
--- a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
+++ b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
@@ -1,4 +1,4 @@
-From f7ef28286dd0adfd384ef55c9039022b4f92f99c Mon Sep 17 00:00:00 2001
+From c9e8942cace57d9d222e8f005408631e1cd06c5c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 18 Nov 2019 17:00:29 -0800
 Subject: [PATCH] Check for atomic<double> intrinsics
diff --git a/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
index 033f9e6d7ca..f6df85538df 100644
--- a/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
+++ b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
@@ -1,4 +1,4 @@
-From aae87f7ce9d07ba1c401de8f2981b046321fba3b Mon Sep 17 00:00:00 2001
+From a6bf17d7eb64bd7beabc73b5fe319b7a375bbcce Mon Sep 17 00:00:00 2001
 From: Ovidiu Panait <ovidiu.panait@windriver.com>
 Date: Fri, 31 Jan 2020 10:56:11 +0200
 Subject: [PATCH] cmake: Fix configure for packages using find_package()
diff --git a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
index 479cc01004e..4841d6c1bc3 100644
--- a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
+++ b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
@@ -1,4 +1,4 @@
-From e374b21872c382d0450a5813184c72fdaabcac11 Mon Sep 17 00:00:00 2001
+From f3c6f924525179ca190fecce2889997250ca8705 Mon Sep 17 00:00:00 2001
 From: Jim Broadus <jbroadus@xevo.com>
 Date: Thu, 26 Mar 2020 16:05:53 -0700
 Subject: [PATCH] clang: Fix resource dir location for cross toolchains
diff --git a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
index 3803603355d..6bbbb5a2598 100644
--- a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
+++ b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
@@ -1,4 +1,4 @@
-From 3acdfa74ce633bfebf1c3982d86b4931b8b606c8 Mon Sep 17 00:00:00 2001
+From 7c70f891fb94f2d8c88bc6af4514d8dcd6488658 Mon Sep 17 00:00:00 2001
 From: Oleksandr Ocheretnyi <oocheret@cisco.com>
 Date: Wed, 15 Apr 2020 00:08:39 +0300
 Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot for ldso
diff --git a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
index 329cd8b0237..8677c5ca134 100644
--- a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
@@ -1,4 +1,4 @@
-From 02ce42db3325d5fab553627dfc73750270c0b665 Mon Sep 17 00:00:00 2001
+From f06bb3e20e47ab5a76efa76f50f0bbef682cd263 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 14 Oct 2020 22:19:57 -0700
 Subject: [PATCH] clang: Use python3 in python scripts
diff --git a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
index bf46b22f361..7ae88b870d5 100644
--- a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
+++ b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
@@ -1,4 +1,4 @@
-From aec307904022e138d1004ceb44b9600deaa7fbdb Mon Sep 17 00:00:00 2001
+From cfe5ec616f1bbbe7d20409b552428e43e282f115 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 25 Jan 2021 16:14:35 +0800
 Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor names
@@ -97,10 +97,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clang/Driver/Distro.h
-index b4d485dac8a2..ac0bf25b7c63 100644
+index c544a8c00219..3cd687ede458 100644
 --- a/clang/include/clang/Driver/Distro.h
 +++ b/clang/include/clang/Driver/Distro.h
-@@ -45,6 +45,7 @@ public:
+@@ -47,6 +47,7 @@ public:
      RHEL7,
      Fedora,
      Gentoo,
@@ -108,7 +108,7 @@ index b4d485dac8a2..ac0bf25b7c63 100644
      OpenSUSE,
      UbuntuHardy,
      UbuntuIntrepid,
-@@ -139,6 +140,7 @@ public:
+@@ -141,6 +142,7 @@ public:
  
    bool IsGentoo() const { return DistroVal == Gentoo; }
  
@@ -117,7 +117,7 @@ index b4d485dac8a2..ac0bf25b7c63 100644
  };
  
 diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
-index 3cc79535de8d..595656179bdc 100644
+index 71ba71fa1837..f64d0abddf6d 100644
 --- a/clang/lib/Driver/Distro.cpp
 +++ b/clang/lib/Driver/Distro.cpp
 @@ -43,6 +43,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs::FileSystem &VFS) {
diff --git a/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
index 9518716c00a..05937b06c1d 100644
--- a/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
+++ b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
@@ -1,4 +1,4 @@
-From d0f40e9309a3f5734fa76c00994c5ebb70570c6c Mon Sep 17 00:00:00 2001
+From 4a23e833e66896f40bb36c3c13b4a4bb1b79162f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 May 2021 17:32:13 -0700
 Subject: [PATCH] compiler-rt: Do not use backtrace APIs on non-glibc linux
diff --git a/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch b/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
index fd2b434fe27..7ce60e0efd0 100644
--- a/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
+++ b/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
@@ -1,4 +1,4 @@
-From 1ef38e252a55d2cdb00c3b29154387fce02e9911 Mon Sep 17 00:00:00 2001
+From 739e65a126178e4c4d8452297ac13c119ae79403 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 May 2021 17:56:03 -0700
 Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux distros
diff --git a/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch b/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
index 2f0479bdd45..fe7157df47c 100644
--- a/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
+++ b/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
@@ -1,4 +1,4 @@
-From 5782e495684d6c056175ea16be83cfe788742d0a Mon Sep 17 00:00:00 2001
+From f60c6ade92826cea1c3d63d70f1168f4048a624b Mon Sep 17 00:00:00 2001
 From: Maksim Kita <maksim-kita@yandex-team.ru>
 Date: Sun, 23 May 2021 10:27:29 +0000
 Subject: [PATCH] libunwind: Added unw_backtrace method
diff --git a/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch b/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
index 4996bc1c874..128666b8fbd 100644
--- a/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
+++ b/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
@@ -1,4 +1,4 @@
-From f4f9b07a41449a0acbe5ea1717bb0e2ceabbfaab Mon Sep 17 00:00:00 2001
+From 45d44576a0dbaf843a9795519cafa944801c4679 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Feb 2022 01:31:26 -0800
 Subject: [PATCH] lldb: Link with libatomic on x86
diff --git a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch b/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
index eeaca43ae01..861064f4f49 100644
--- a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
+++ b/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
@@ -1,4 +1,4 @@
-From a63acbeb8db17aa113dc2b2058540c61c2a16ac6 Mon Sep 17 00:00:00 2001
+From b676d7d93fa35e095595fc1f967e4c6a3b58414b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Mar 2022 16:28:16 -0800
 Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
diff --git a/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch b/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
index 831e3e7d3a4..d49af8aeb9e 100644
--- a/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
+++ b/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
@@ -1,4 +1,4 @@
-From abe955ac96370a16258fba1348edb938f3649096 Mon Sep 17 00:00:00 2001
+From 9cf5cc6d4378ad7918f338aa65ce79178d8a84f2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Aug 2022 11:50:57 -0700
 Subject: [PATCH] llvm: Do not use cmake infra to detect libzstd
diff --git a/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch b/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
index 4b8a915837d..bca28cd7dbc 100644
--- a/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
+++ b/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
@@ -1,4 +1,4 @@
-From 7cafe5615d91a429048c8baa824769cdf34aafd1 Mon Sep 17 00:00:00 2001
+From 744dbb6cf6925796e2bc5c028af08c40445bbb1c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Jan 2023 18:44:34 -0800
 Subject: [PATCH] compiler-rt: Fix stat struct's size for O32 ABI
diff --git a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
index 0e671297057..e129aa245db 100644
--- a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
+++ b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
@@ -1,4 +1,4 @@
-From 92bf97247bb0df984410a6c1ee6b0d2577e82013 Mon Sep 17 00:00:00 2001
+From 6b6a518bc7686af7680f45fcdea7c414a22a2f53 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 21 Feb 2023 12:46:10 -0800
 Subject: [PATCH] compiler-rt: Undef _TIME_BITS along with _FILE_OFFSET_BITS in
diff --git a/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch b/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
index 8362acf8d41..b6852a124d7 100644
--- a/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
+++ b/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
@@ -1,4 +1,4 @@
-From 86a5a81c556e27cd097493a040580362d0217721 Mon Sep 17 00:00:00 2001
+From a83b407a9c1b04d95e6cda74059744fe815fde17 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 31 Aug 2023 18:14:47 +0200
 Subject: [PATCH] ToolChains/Gnu.cpp: ARMLibDirs search also in lib32
diff --git a/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch b/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
index a919a983c38..0136039358e 100644
--- a/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
+++ b/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
@@ -1,4 +1,4 @@
-From 721b7868a57fe3943557c405dd88365526d3728f Mon Sep 17 00:00:00 2001
+From 3572a4425844ef77131fd2635ea570eafc1df958 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 3 Feb 2024 16:47:10 -0800
 Subject: [PATCH] clang/llvm: Add OE specific ABI triple for N32 ABI
diff --git a/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
index 8eda4fb205b..a42ac2484d7 100644
--- a/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
@@ -1,4 +1,4 @@
-From cc2fb22ae8e64f65fd726b476c3bf85b4d31906d Mon Sep 17 00:00:00 2001
+From e5223f6013c7c70a7f6e35ecec046cfdc0c15c2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2024 22:04:43 -0700
 Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
diff --git a/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch b/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
index 01d054512fb..85d3ce9ed38 100644
--- a/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
+++ b/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
@@ -1,4 +1,4 @@
-From e468c9f5b5cf85583c0435ad934affd5b900caec Mon Sep 17 00:00:00 2001
+From 3f03bd4a5a16f2b5525f4dc32c7b196840b96856 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Fri, 13 Sep 2024 13:38:08 +0200
 Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other tools do
diff --git a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch b/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
index 01fcc0689d2..621c3653f04 100644
--- a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
+++ b/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
@@ -1,4 +1,4 @@
-From cbb5bca513714f539c899a123bf5dc17651c9737 Mon Sep 17 00:00:00 2001
+From 518c0025921b0bd21e69bf4c38f369778032f4e0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Mar 2025 00:30:38 -0700
 Subject: [PATCH] compiler-rt: Do not pass --target to clang compiler
diff --git a/meta/recipes-devtools/clang/clang/0032-Fix-build-on-ppc64-musl.patch b/meta/recipes-devtools/clang/clang/0032-Fix-build-on-ppc64-musl.patch
deleted file mode 100644
index e1fcb3a2037..00000000000
--- a/meta/recipes-devtools/clang/clang/0032-Fix-build-on-ppc64-musl.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From bb99b65d884185a2eb1d4601e5135da582cbd8a9 Mon Sep 17 00:00:00 2001
-From: mojyack <mojyack@gmail.com>
-Date: Mon, 16 Dec 2024 13:42:04 +0900
-Subject: [PATCH] Fix build on ppc64+musl
-
-In powerpc64-unknown-linux-musl, signal.h does not include asm/ptrace.h,
-which causes "member access into incomplete type 'struct pt_regs'" errors.
-Include the header explicitly to fix this.
-
-Also in sanitizer_linux_libcdep.cpp, there is a usage of
-TlsPreTcbSize which is not defined in such a platform.
-Guard the branch with macro.
-
-Upstream-Status: Backport [https://github.com/llvm/llvm-project/pull/120036]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../lib/sanitizer_common/sanitizer_linux.cpp        |  4 ++++
- .../sanitizer_common/sanitizer_linux_libcdep.cpp    | 13 +++++++------
- .../sanitizer_platform_limits_posix.cpp             |  2 +-
- .../sanitizer_stoptheworld_linux_libcdep.cpp        |  3 ++-
- 4 files changed, 14 insertions(+), 8 deletions(-)
-
-diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_linux.cpp b/compiler-rt/lib/sanitizer_common/sanitizer_linux.cpp
-index 7aa48d29d2d5..a4d526b4466c 100644
---- a/compiler-rt/lib/sanitizer_common/sanitizer_linux.cpp
-+++ b/compiler-rt/lib/sanitizer_common/sanitizer_linux.cpp
-@@ -86,6 +86,10 @@
- #    include <sys/sysmacros.h>
- #  endif
- 
-+#  if SANITIZER_LINUX && defined(__powerpc64__)
-+#    include <asm/ptrace.h>
-+#  endif
-+
- #  if SANITIZER_FREEBSD
- #    include <machine/atomic.h>
- #    include <sys/exec.h>
-diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_linux_libcdep.cpp b/compiler-rt/lib/sanitizer_common/sanitizer_linux_libcdep.cpp
-index e11eff13cd32..331e1c7d8d15 100644
---- a/compiler-rt/lib/sanitizer_common/sanitizer_linux_libcdep.cpp
-+++ b/compiler-rt/lib/sanitizer_common/sanitizer_linux_libcdep.cpp
-@@ -619,21 +619,22 @@ static void GetTls(uptr *addr, uptr *size) {
-   *addr = tp - RoundUpTo(*size, align);
-   *size = tp - *addr + ThreadDescriptorSize();
- #      else
--  if (SANITIZER_GLIBC)
--    *size += 1664;
--  else if (SANITIZER_FREEBSD)
--    *size += 128;  // RTLD_STATIC_TLS_EXTRA
--#        if defined(__mips__) || defined(__powerpc64__) || SANITIZER_RISCV64
-+#        if SANITIZER_GLIBC
-+  *size += 1664;
-+#        elif SANITIZER_FREEBSD
-+  *size += 128;  // RTLD_STATIC_TLS_EXTRA
-+#          if defined(__mips__) || defined(__powerpc64__) || SANITIZER_RISCV64
-   const uptr pre_tcb_size = TlsPreTcbSize();
-   *addr -= pre_tcb_size;
-   *size += pre_tcb_size;
--#        else
-+#          else
-   // arm and aarch64 reserve two words at TP, so this underestimates the range.
-   // However, this is sufficient for the purpose of finding the pointers to
-   // thread-specific data keys.
-   const uptr tcb_size = ThreadDescriptorSize();
-   *addr -= tcb_size;
-   *size += tcb_size;
-+#          endif
- #        endif
- #      endif
- #    elif SANITIZER_NETBSD
-diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cpp b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index a5311d266b0c..ec5f2edab6a6 100644
---- a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -96,7 +96,7 @@
- # include <sys/ptrace.h>
- #    if defined(__mips64) || defined(__aarch64__) || defined(__arm__) ||       \
-         defined(__hexagon__) || defined(__loongarch__) || SANITIZER_RISCV64 || \
--        defined(__sparc__)
-+        defined(__sparc__) || defined(__powerpc64__)
- #      include <asm/ptrace.h>
- #      ifdef __arm__
- typedef struct user_fpregs elf_fpregset_t;
-diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cpp b/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cpp
-index 945da99d41f4..58d17d90c343 100644
---- a/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cpp
-+++ b/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cpp
-@@ -31,7 +31,8 @@
- #include <sys/types.h> // for pid_t
- #include <sys/uio.h> // for iovec
- #include <elf.h> // for NT_PRSTATUS
--#if (defined(__aarch64__) || SANITIZER_RISCV64 || SANITIZER_LOONGARCH64) && \
-+#if (defined(__aarch64__) || defined(__powerpc64__) || \
-+     SANITIZER_RISCV64 || SANITIZER_LOONGARCH64) &&    \
-      !SANITIZER_ANDROID
- // GLIBC 2.20+ sys/user does not include asm/ptrace.h
- # include <asm/ptrace.h>
diff --git a/meta/recipes-devtools/clang/clang/0033-clangd-Add-a-build-option-to-disable-building-dexp.patch b/meta/recipes-devtools/clang/clang/0032-clangd-Add-a-build-option-to-disable-building-dexp.patch
similarity index 98%
rename from meta/recipes-devtools/clang/clang/0033-clangd-Add-a-build-option-to-disable-building-dexp.patch
rename to meta/recipes-devtools/clang/clang/0032-clangd-Add-a-build-option-to-disable-building-dexp.patch
index 198989cd422..3e0603477e1 100644
--- a/meta/recipes-devtools/clang/clang/0033-clangd-Add-a-build-option-to-disable-building-dexp.patch
+++ b/meta/recipes-devtools/clang/clang/0032-clangd-Add-a-build-option-to-disable-building-dexp.patch
@@ -1,4 +1,4 @@
-From 49fbbb928d5cafba3d367e3750d402b53425943a Mon Sep 17 00:00:00 2001
+From 12abcd058e2aa468054708b0ca7a06f2638eabab Mon Sep 17 00:00:00 2001
 From: Yoann Congal <yoann.congal@smile.fr>
 Date: Tue, 25 Mar 2025 22:25:55 +0100
 Subject: [PATCH] clangd: Add a build option to disable building dexp
diff --git a/meta/recipes-devtools/clang/clang/0034-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/clang/clang/0033-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0034-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
rename to meta/recipes-devtools/clang/clang/0033-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index 7545ba365b8..1901efeae4d 100644
--- a/meta/recipes-devtools/clang/clang/0034-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/clang/clang/0033-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 59921cb127dcfb2c655b357e8deb95004f3da41f Mon Sep 17 00:00:00 2001
+From 9e389e1dc73a2f5601cfbab34249aedffd053235 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
diff --git a/meta/recipes-devtools/clang/clang/0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/clang/clang/0034-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
rename to meta/recipes-devtools/clang/clang/0034-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
index 81820eeaca3..2618f5ac407 100644
--- a/meta/recipes-devtools/clang/clang/0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
+++ b/meta/recipes-devtools/clang/clang/0034-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
@@ -1,4 +1,4 @@
-From e414f6489e055c981970b7210b941c2a41cc322b Mon Sep 17 00:00:00 2001
+From 81db296472e146995c3c5728981cdc0cc065ab9c Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 2 Apr 2025 17:05:17 +0300
 Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
diff --git a/meta/recipes-devtools/clang/clang/0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch b/meta/recipes-devtools/clang/clang/0035-openmp-Do-not-emit-date-and-time-into-generate-files.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch
rename to meta/recipes-devtools/clang/clang/0035-openmp-Do-not-emit-date-and-time-into-generate-files.patch
index 91c718e2a4f..f33d8851ea3 100644
--- a/meta/recipes-devtools/clang/clang/0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch
+++ b/meta/recipes-devtools/clang/clang/0035-openmp-Do-not-emit-date-and-time-into-generate-files.patch
@@ -1,4 +1,4 @@
-From f79ebc5bc696e8747c79a2277ffcf8d91bdadfd5 Mon Sep 17 00:00:00 2001
+From c439de272b3f983c6d97b8f6fec0135323e3363c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Apr 2025 11:52:48 -0700
 Subject: [PATCH] openmp: Do not emit date and time into generate files
diff --git a/meta/recipes-devtools/clang/clang/0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch b/meta/recipes-devtools/clang/clang/0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
new file mode 100644
index 00000000000..fe2bd77b33f
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
@@ -0,0 +1,56 @@
+From 8c839483915183a9c1ca4f74646ca4f478900e77 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Apr 2025 19:51:19 -0700
+Subject: [PATCH] libunwind: Use +gcs instead of gcs target attribute
+
+__attribute__((target("gcs"))) does not work with gcc
+
+GCC-15 has added gcs intrinsics [1] but the syntax for enabling it is
+slightly different. This syntax works with clang too.
+
+With gcc15 compiler libunwind's check for this macros is succeeding and it
+ends up enabling 'gcs' by using function attribute, this works with clang
+but not with gcc but '+gcs' works with both
+
+We can see this in rust compiler bootstrap for aarch64/musl when system
+uses gcc15, it ends up with these errors
+
+Building libunwind.a for aarch64-poky-linux-musl
+cargo:warning=/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/src/UnwindLevel1.c:191:1: error: arch extension 'gcs' should be prefixed by '+'
+cargo:warning=  191 | unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exception *exception_object) {
+cargo:warning=      | ^~~~~~~~~~~~~
+cargo:warning=/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/src/UnwindLevel1.c:337:22: error: arch extension 'gcs' should be prefixed by '+'
+cargo:warning=  337 |                      _Unwind_Stop_Fn stop, void *stop_parameter) {
+cargo:warning=      |                      ^~~~~~~~~~~~~~~
+
+[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5a6af707f0af
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/138077]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libunwind/src/UnwindLevel1.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libunwind/src/UnwindLevel1.c b/libunwind/src/UnwindLevel1.c
+index 7e785f4d31e7..ed2c8239824c 100644
+--- a/libunwind/src/UnwindLevel1.c
++++ b/libunwind/src/UnwindLevel1.c
+@@ -185,7 +185,7 @@ extern int __unw_step_stage2(unw_cursor_t *);
+ 
+ #if defined(_LIBUNWIND_USE_GCS)
+ // Enable the GCS target feature to permit gcspop instructions to be used.
+-__attribute__((target("gcs")))
++__attribute__((target("+gcs")))
+ #endif
+ static _Unwind_Reason_Code
+ unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exception *exception_object) {
+@@ -329,7 +329,7 @@ unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exception *except
+ 
+ #if defined(_LIBUNWIND_USE_GCS)
+ // Enable the GCS target feature to permit gcspop instructions to be used.
+-__attribute__((target("gcs")))
++__attribute__((target("+gcs")))
+ #endif
+ static _Unwind_Reason_Code
+ unwind_phase2_forced(unw_context_t *uc, unw_cursor_t *cursor,
diff --git a/meta/recipes-devtools/clang/clang/0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch b/meta/recipes-devtools/clang/clang/0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
similarity index 92%
rename from meta/recipes-devtools/clang/clang/0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
rename to meta/recipes-devtools/clang/clang/0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
index 4639a73fe6b..a7e5c5a859f 100644
--- a/meta/recipes-devtools/clang/clang/0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
+++ b/meta/recipes-devtools/clang/clang/0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
@@ -1,4 +1,4 @@
-From 5a0daa2dcc2bb39d87c4fcae7036cd8ab7ee6f6d Mon Sep 17 00:00:00 2001
+From d2360096db2da00121f4e653b39ca1f7eb2801eb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 May 2025 14:03:12 -0700
 Subject: [PATCH] compiler-rt: Exclude sync_fetch_and_* for any pre-ARMv6 targets
@@ -38,6 +38,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  compiler-rt/lib/builtins/CMakeLists.txt | 12 ++++++++++++
  1 file changed, 12 insertions(+)
 
+diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/builtins/CMakeLists.txt
+index cb276311b290..53a3cd1dc81f 100644
 --- a/compiler-rt/lib/builtins/CMakeLists.txt
 +++ b/compiler-rt/lib/builtins/CMakeLists.txt
 @@ -864,6 +864,18 @@ else ()
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 1099274d900..45616de3e3e 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "20"
 MINOR_VER = "1"
-PATCH_VER = "4"
+PATCH_VER = "5"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 24f82f38128..f53336326aa 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-proje
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}.src"
-SRC_URI[sha256sum] = "a95365b02536ed4aef29b325c205dd89c268cba41503ab2fc05f81418613ab63"
+SRC_URI[sha256sum] = "a069565cd1c6aee48ee0f36de300635b5781f355d7b3c96a28062d50d575fa3e"
 
 SRC_URI = "\
     ${BASEURI} \
@@ -52,12 +52,12 @@ SRC_URI = "\
     file://0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
     file://0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch \
     file://0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
-    file://0032-Fix-build-on-ppc64-musl.patch \
-    file://0033-clangd-Add-a-build-option-to-disable-building-dexp.patch \
-    file://0034-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
-    file://0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
-    file://0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch \
-    file://0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
+    file://0032-clangd-Add-a-build-option-to-disable-building-dexp.patch \
+    file://0033-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+    file://0034-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
+    file://0035-openmp-Do-not-emit-date-and-time-into-generate-files.patch \
+    file://0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch \
+    file://0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
     file://0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
 "
 # Fallback to no-PIE if not set

