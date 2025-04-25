Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3028CC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 05:43:36 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.1027.1745559810470592941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 22:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHeGCqNU;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7398d65476eso1520704b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 22:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745559810; x=1746164610; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ka7ScMNCU5+mqxFHQmJdvsQprmeaqF1aUA+Wm5NZphU=;
        b=OHeGCqNUryYRsX//+yjNRNMOSUWeLfbQYDHaFMuYzYsQqsiGptCBSXNkO5KSks9xdJ
         ksBDOE0dDrvpkVZ/+X+80uSn8Mm43mZ0Glo36bGs8D18Wlh0gHvzej6V4jDkDC+zXJiM
         c8s+x0RPzc1SFfzz8NZwa4bmvCvb/ofIPkJOoYBDY7MhSiW0blHQaK4ZWynfvMHmiRxc
         D9mLvCQu1624GWbAlBoIGNQd1EvFFFVDhrIPaXA1KqbDgfkZlI9+/6QAAm3fo/odaq8Y
         xb7UeNHKaoltrAvB2yd6Kg3BspJj5c5/3AJZu8nHs/PkGWZ0dQBXnYhvZvUH9xViOjZq
         GBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559810; x=1746164610;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ka7ScMNCU5+mqxFHQmJdvsQprmeaqF1aUA+Wm5NZphU=;
        b=aWPzOga3ilZz2bU7zvxvmGQR+B6h9wOVxwxrg/TduYi2OsZFA1b9elDxtcjEAIErWz
         sHUf+/jqy8px7s5vrP/9SfOMUmLOOv+YTvpWEvyICxjI+94QwDojOnBoKwyq3nnFOM4f
         4ZrcejTXvK+/q3g9DAlm60H9k3QTy5mB6ZLyEh57gZcN+c5KxEe2EkhNFh0m4Ec6/1Zd
         onrFAF/6DJ1y6TQeGxeFGlQjmloXv7lDKkHvJe3daC4TzCSRLEpesMvTJ/MPpOqWIGjs
         xcKXgf0tw++PG1ejYrp/WJNYvsKh6pDm0CtZZD9YItBwtW9fUMh+rML5bEbXSrUTlNQy
         p4Eg==
X-Gm-Message-State: AOJu0YxzXFFbDKetrFtDfscZrgpWSJrT7+cmJ9FcIWuh9DA77uM7ujE2
	CZosLMIo2yS71zj3I1AbHvTaFwwxOd4qMa+Bs/Hcu6aDrebQ8kqI
X-Gm-Gg: ASbGnctzzY1gNlUvy3tzMnTxAZxaOlMhD7bTepd0CgyLzb3gksUIrziaQmZ6JFOQ8uC
	BrQ0PsYJ9Vu7iWDdyL2bOL63bI8BG0zjsrKHMAIJjjUFm5OmReKbY9deTuZK9PtPQYhP1cABSqp
	gRSp8jYlCGXdXx2SBWN0RKe3JuzzCWXsO9E1ktiqlvXQQ/p//iF3SoAZr93gMZl4qEL42gyO/j2
	BCm0/tLNDKTw1mzpfsRO7HRtfDQ5KpQD0k1I8s/W3cgwJLtGMG3Z0J2goU6YROvhzM+9dhkAYPA
	HEkE5q7PuSBm1KmhPZEy/s1Kwm0ZwFQ6
X-Google-Smtp-Source: AGHT+IHSZXVOKTKZM/CM0N+2NB18KwnwiA9qpndA4qHeS5P1S/wKC7b7Xeny/i2qqNuHn/VgNjq3TA==
X-Received: by 2002:a05:6a00:2f53:b0:732:706c:c4ff with SMTP id d2e1a72fcca58-73e2689e456mr5852335b3a.7.1745559809639;
        Thu, 24 Apr 2025 22:43:29 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm2363626b3a.167.2025.04.24.22.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:43:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 0/7] clang-merge: Bring clang recipes from meta-clang
Date: Thu, 24 Apr 2025 22:43:21 -0700
Message-Id: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkgC2gC/1WMQQ7CIBBFr9LMWgxQMOLKe5guJjhtJynFgCGah
 ruLTVy4fO/nvw0yJaYMl26DRIUzx7WBPnTgZ1wnEnxvDFpqK43uhV+aFYFSmzw61UskZ3GE9ng
 kGvm1125D45nzM6b3Hi/qa38d89cpSkhh0TiNZ3NSiNcpIC9HHwMMtdYP3y6VnaYAAAA=
X-Change-ID: 20250423-clang-merge-ca9130ae95af
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Liu Yiding <liuyd.fnst@fujitsu.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215415

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
Changes in v2:
- Address Feedback from Alex and Dmitry.
- Squash similar commits to reduce number of patches.
- Move native toolchain file generation to cmake bbclass instead of
  adding new class
- Fix space/tabs indentation inconsistencies
- Reorder the patch sequence to avoid errors in future git bisects
- Fix use before define string problem in one of the patches
- Link to v1: https://lore.kernel.org/r/20250424-clang-merge-v1-0-5a492a8461aa@gmail.com

---
Khem Raj (7):
      cmake.bbclass: Enhance to emit a native toolchain cmake file
      toolchain/clang: Remove duplicate RANLIB setting
      sstatesig: Handle special case of llvm-project-source shared-workdir
      multilib.conf: Add llvm-project-source recipe to NON_MULTILIB_RECIPES
      kernel-arch.bbclass: Do not use weak assignment for TOOLCHAIN
      clang: Merge llvm/clang family recipes from meta-clang
      maintainers.inc: Add myself as maintainer for clang family of recipes

 meta/classes-recipe/cmake.bbclass                  |  58 +++
 meta/classes-recipe/kernel-arch.bbclass            |   2 +-
 meta/conf/distro/include/maintainers.inc           |  11 +-
 meta/conf/multilib.conf                            |   2 +-
 meta/conf/toolchain/clang.inc                      |   1 -
 meta/lib/oe/sstatesig.py                           |   3 +
 .../clang/clang-cross-canadian_git.bb              |  36 ++
 meta/recipes-devtools/clang/clang-cross_git.bb     |  39 ++
 meta/recipes-devtools/clang/clang-crosssdk_git.bb  |  33 ++
 ...ind-libunwind-headers-when-LIBCXXABI_LIBU.patch |  60 +++
 ...er-rt-support-a-new-embedded-linux-target.patch | 309 +++++++++++++
 ...-Simplify-cross-compilation.-Don-t-use-na.patch |  44 ++
 ...LibraryInfo-Undefine-libc-functions-if-th.patch |  90 ++++
 ...allow-env-override-of-exe-and-libdir-path.patch |  71 +++
 ...-clang-driver-Check-sysroot-for-ldso-path.patch |  78 ++++
 ...iver-tools.cpp-Add-lssp_nonshared-on-musl.patch |  32 ++
 .../0008-clang-Prepend-trailing-to-sysroot.patch   |  39 ++
 ...inside-the-target-sysroot-for-compiler-ru.patch |  41 ++
 ...ang-Define-releative-gcc-installation-dir.patch | 123 +++++
 ...pthread-and-ldl-along-with-lunwind-for-st.patch |  35 ++
 ..._EXECUTABLE-when-cross-compiling-for-nati.patch |  24 +
 .../0013-Check-for-atomic-double-intrinsics.patch  |  34 ++
 ...configure-for-packages-using-find_package.patch |   2 +-
 ...esource-dir-location-for-cross-toolchains.patch |  50 +++
 ...r-Add-dyld-prefix-when-checking-sysroot-f.patch |  79 ++++
 .../0017-clang-Use-python3-in-python-scripts.patch |  35 ++
 ...Insert-anchor-for-adding-OE-distro-vendor.patch | 167 +++++++
 ...-Do-not-use-backtrace-APIs-on-non-glibc-l.patch |  68 +++
 ...86-triple-for-non-debian-multiarch-linux-.patch |  28 ++
 ...0021-libunwind-Added-unw_backtrace-method.patch |  56 +++
 .../0022-lldb-Link-with-libatomic-on-x86.patch     |  33 ++
 ...023-compiler-rt-Enable-__int128-for-ppc32.patch |  73 +++
 ...-Do-not-use-cmake-infra-to-detect-libzstd.patch |  62 +++
 ...ler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch |  46 ++
 ...-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch |  43 ++
 ...s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch |  81 ++++
 ...vm-Add-OE-specific-ABI-triple-for-N32-ABI.patch |  78 ++++
 ...d-libunwind.pc.in-and-llvm-config-scripts.patch |  90 ++++
 ...py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  92 ++++
 ...r-rt-Do-not-pass-target-to-clang-compiler.patch |  29 ++
 .../clang/clang/0032-Fix-build-on-ppc64-musl.patch |  97 ++++
 ...d-a-build-option-to-disable-building-dexp.patch |  85 ++++
 ...itter-sort-ClassInfo-lists-by-name-as-we.patch} |   4 +-
 ...-remove-LLVM_LDFLAGS-from-ldflags-output.patch} |  12 +-
 ...ot-emit-date-and-time-into-generate-files.patch |  37 ++
 .../clang}/spirv-internal-build.patch              |   0
 .../clang}/spirv-shared-library.patch              |   0
 meta/recipes-devtools/clang/clang_git.bb           | 496 +++++++++++++++++++++
 meta/recipes-devtools/clang/common-clang.inc       |  24 +
 meta/recipes-devtools/clang/common-source.inc      |  17 +
 meta/recipes-devtools/clang/common.inc             |  83 ++++
 .../clang/compiler-rt-sanitizers_git.bb            | 139 ++++++
 meta/recipes-devtools/clang/compiler-rt_git.bb     | 125 ++++++
 meta/recipes-devtools/clang/libcxx_git.bb          | 119 +++++
 meta/recipes-devtools/clang/llvm-project-source.bb |  12 +
 .../recipes-devtools/clang/llvm-project-source.inc |  99 ++++
 .../recipes-devtools/clang/nativesdk-clang-glue.bb |  36 ++
 meta/recipes-devtools/clang/openmp_git.bb          |  67 +++
 .../0007-llvm-allow-env-override-of-exe-path.patch |  36 --
 meta/recipes-devtools/llvm/llvm/llvm-config        |  54 ---
 meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ----------
 61 files changed, 3715 insertions(+), 337 deletions(-)
---
base-commit: c807b703cdfc5dc2c7fe98f55a5d323eb3e1877c
change-id: 20250423-clang-merge-ca9130ae95af

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


