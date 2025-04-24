Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5364CC369D9
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.9729.1745479252485952386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AAIgQZS7;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223fb0f619dso7087765ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479252; x=1746084052; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XzGDacn4LWQ7epPyCp6vPoow0AlP80ArPCqiILsAdrk=;
        b=AAIgQZS79yD2JH3sQFADCGjO6BCfIzPHf82ER5Yk6KleHncinWuzZd8Y8lXY1OChWp
         3WSa9ktHoZH1ocM5lfml31BFV+V0iyYHcjm2fHjEpFzxbPfb0bjyOaYM+sXrfyNhl3rf
         uQEN5df5pLMMd4cE/BndAOY5xlTNFJE8/IrFEi68TRRWk5laUpOtJgTWk6GswgvthY8N
         9PvkRV2jANoIzjBISR4KK0xydYF3Iams2Naq0VmWcFhISIFHeh5GKQJ1vtRbwuIFbAk8
         +Npptmr+o0H7o6hm8bAzLtRe/ZXZD0Z7VlaE83hJbtPsa1mHGMsMiyRTPX+GkJo1g/55
         EI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479252; x=1746084052;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzGDacn4LWQ7epPyCp6vPoow0AlP80ArPCqiILsAdrk=;
        b=CcD64mowPkBjKIQwBvgzZECJ0eWpywcwI262/vXPwmrCa8DrXtkueUFpA+aeHz9Ntt
         tTrsVXkyPakLeYxCrKgS1ByZ2Tl69Pa9qyDzSo3nefM8n64XSdVIxaI4sBKhedJTEDJt
         xzzPCBdOcKhRxv5yp1SXBsXf69KxlZiqqz6vgKanxDqcc2a/gjvj2yuI2xAeg3pgXx/2
         Ko9zlydYbvo6RjIgxxxAjB14JdLAVBS9003DHn/PCf3kaJF4x50c4FagYDAuvrK+yBwP
         NDfbTvIIcO4bsq3drl78W5Xqa/jAn+vUU826FkmqgMOHrMFX77MMEnxE/GeCtTg1ldr6
         9hUg==
X-Gm-Message-State: AOJu0Yxk/8mtQ3tyt2Dd1rEYcv5eT67xF0dwW6PYktgCrkM3JArN1UQF
	AdhXlul8ldbf2AjZagAzeSSYp7L4r/aHZROXec6oHphGlG9fLmLN
X-Gm-Gg: ASbGncsyaj5EQuXGmlLtiaOyBPWdX6NeuXpQnDVNRjVIoB1F2MtN7/pjfPt/0cREqyY
	XiNZ143kUg5PmJkmBHgGuTVUDyA+v0Lho7M9clTSuWqelKeVbkQGl69PkK17r9TGyrJKDkpskCV
	s/L1PDjTQnHFOFcpWiAXkDo9O9YcW3pmXtvyb+eOAD73udECjpEvemSpA1zesE4HUsWlaX4QK/4
	nTWHKCQscq5gv5gIzv7B6D6VSm+urH1hfPqOd3DJDclmyV3BiiEZDWPYL79rE4uFGilczMZieMf
	idIsUxfahUmiVphc7BAmXUzv3AwJjzrp5CkXviR8Oc0=
X-Google-Smtp-Source: AGHT+IF7HyaljpTtEUP4moDlSZMSgLGL/3pJd2mOUdakel6//qsZdREGBezYJxTcmfvq4sYLD7oy3A==
X-Received: by 2002:a17:903:1103:b0:22c:3609:97ed with SMTP id d9443c01a7336-22db3c3a039mr19455515ad.30.1745479251760;
        Thu, 24 Apr 2025 00:20:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 00/11] clang-merge: Bring clang recipes from meta-clang
Date: Thu, 24 Apr 2025 00:20:34 -0700
Message-Id: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEPmCWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNj3eQcoKhubmoRUCo50dLQ2CAx1dI0MU0JqKOgKDUtswJsWnRsbS0
 AE+sXlF0AAAA=
X-Change-ID: 20250423-clang-merge-ca9130ae95af
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Liu Yiding <liuyd.fnst@fujitsu.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215327

Latest mesa 25+ needs libclang during build for tools like mesa_clc,
we enahnced already existing llvm recipe to build pieces of clang as
well, which worked for mesa's needs but broke static clang compiler
provided by meta-clang due to newfound conflicts, since clang is now
built with llvm recipe from core and also by meta-clang and they
compete for same namespace, an attempt to make them co-habit did reveal
more difficulties. Clang compiler from meta-clang is not able to use
llvm libraries from core since they patch them differently.

This patch series therefore brings clang and all recipes that build from
llvm sources into core. With this changeset, clang recipes can be removed
from meta-clang there is a pull request for that already [1]
As an aside, we only build clang once and use it for meta-clang needs
and core needs.

With this, meta-clang can depend upon core layer to provide clang and
related recipes, meta-clang will still provide the toolchain policies
around clang based toolchains. Clang compiler from core, while usable
for mesa is not yet fully usable out of box, since we need to workout
the multi-toolchain architecture for core, which will be done in next
phase after this merge.

[1] https://github.com/kraj/meta-clang/pull/1088

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Dmitry Baryshkov (1):
      clang: remove LLVM_LDFLAGS from llvm-config --ldflags output

Khem Raj (9):
      cmake-native.bbclass: Abstraction to use cmake with native toolchains
      llvm: Renamed to clang
      maintainers.inc: Add myself as maintainer for clang family of recipes
      clang: Merge llvm/clang family recipes from meta-clang
      kernel-arch.bbclass: Do not use weak assignment for TOOLCHAIN
      clang.inc: Remove duplicate RANLIB setting
      openmp: Omit time stamps from generated files
      sstatesig: Handle special case of llvm-project-source shared-workdir
      multilib.conf: Add llvm-project-source recipe to NON_MULTILIB_RECIPES

Liu Yiding (1):
      clang: multilib-header fix for llvm-config.h

 meta/classes-recipe/cmake-native.bbclass           |  56 +++
 meta/classes-recipe/kernel-arch.bbclass            |   2 +-
 meta/conf/distro/include/maintainers.inc           |  11 +-
 meta/conf/multilib.conf                            |   2 +-
 meta/conf/toolchain/clang.inc                      |   1 -
 meta/lib/oe/sstatesig.py                           |   3 +
 .../clang/clang-cross-canadian_git.bb              |  36 ++
 meta/recipes-devtools/clang/clang-cross_git.bb     |  39 ++
 meta/recipes-devtools/clang/clang-crosssdk_git.bb  |  34 ++
 ...ind-libunwind-headers-when-LIBCXXABI_LIBU.patch |  60 +++
 ...er-rt-support-a-new-embedded-linux-target.patch | 309 +++++++++++++
 ...-Simplify-cross-compilation.-Don-t-use-na.patch |  44 ++
 ...LibraryInfo-Undefine-libc-functions-if-th.patch |  90 ++++
 ...allow-env-override-of-exe-and-libdir-path.patch |  71 +++
 ...-clang-driver-Check-sysroot-for-ldso-path.patch |  75 ++++
 ...iver-tools.cpp-Add-lssp_nonshared-on-musl.patch |  32 ++
 .../0008-clang-Prepend-trailing-to-sysroot.patch   |  39 ++
 ...inside-the-target-sysroot-for-compiler-ru.patch |  41 ++
 ...ang-Define-releative-gcc-installation-dir.patch |  47 ++
 ...pthread-and-ldl-along-with-lunwind-for-st.patch |  35 ++
 ..._EXECUTABLE-when-cross-compiling-for-nati.patch |  24 +
 .../0013-Check-for-atomic-double-intrinsics.patch  |  34 ++
 ...configure-for-packages-using-find_package.patch |   2 +-
 ...esource-dir-location-for-cross-toolchains.patch |  50 +++
 ...r-Add-dyld-prefix-when-checking-sysroot-f.patch |  79 ++++
 .../0017-clang-Use-python3-in-python-scripts.patch |  35 ++
 ...4-set-Yocto-based-GCC-install-search-path.patch |  70 +++
 ...-anchor-for-adding-OE-distro-vendor-names.patch |  32 ++
 ...-Do-not-use-backtrace-APIs-on-non-glibc-l.patch |  68 +++
 ...86-triple-for-non-debian-multiarch-linux-.patch |  28 ++
 ...0022-libunwind-Added-unw_backtrace-method.patch |  56 +++
 ...-Do-not-use-install-relative-libc-headers.patch |  34 ++
 .../0024-Fix-lib-paths-for-OpenEmbedded-Host.patch |  79 ++++
 ...library-search-path-for-OpenEmbedded-Host.patch |  84 ++++
 .../0026-lldb-Link-with-libatomic-on-x86.patch     |  33 ++
 ...027-compiler-rt-Enable-__int128-for-ppc32.patch |  73 +++
 ...-Do-not-use-cmake-infra-to-detect-libzstd.patch |  62 +++
 ...ler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch |  46 ++
 ...-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch |  43 ++
 ...s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch |  81 ++++
 ...vm-Add-OE-specific-ABI-triple-for-N32-ABI.patch |  78 ++++
 ...d-libunwind.pc.in-and-llvm-config-scripts.patch |  90 ++++
 ...py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  92 ++++
 ...r-rt-Do-not-pass-target-to-clang-compiler.patch |  29 ++
 .../clang/clang/0036-Fix-build-on-ppc64-musl.patch |  97 ++++
 ...d-a-build-option-to-disable-building-dexp.patch |  85 ++++
 ...itter-sort-ClassInfo-lists-by-name-as-we.patch} |   4 +-
 ...-remove-LLVM_LDFLAGS-from-ldflags-output.patch} |  12 +-
 ...ot-emit-date-and-time-into-generate-files.patch |  37 ++
 .../clang}/spirv-internal-build.patch              |   0
 .../clang}/spirv-shared-library.patch              |   0
 meta/recipes-devtools/clang/clang_git.bb           | 498 +++++++++++++++++++++
 meta/recipes-devtools/clang/common-clang.inc       |  24 +
 meta/recipes-devtools/clang/common-source.inc      |  17 +
 meta/recipes-devtools/clang/common.inc             |  87 ++++
 .../clang/compiler-rt-sanitizers_git.bb            | 139 ++++++
 meta/recipes-devtools/clang/compiler-rt_git.bb     | 135 ++++++
 meta/recipes-devtools/clang/libcxx_git.bb          | 119 +++++
 meta/recipes-devtools/clang/llvm-project-source.bb |  12 +
 .../recipes-devtools/clang/llvm-project-source.inc |  99 ++++
 .../recipes-devtools/clang/nativesdk-clang-glue.bb |  36 ++
 meta/recipes-devtools/clang/openmp_git.bb          |  67 +++
 .../0007-llvm-allow-env-override-of-exe-path.patch |  36 --
 meta/recipes-devtools/llvm/llvm/llvm-config        |  54 ---
 meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ----------
 65 files changed, 3783 insertions(+), 337 deletions(-)
---
base-commit: 576c4fd9e0b571c3ee37f67f25a51fe68466eac3
change-id: 20250423-clang-merge-ca9130ae95af

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


