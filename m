Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164FBC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 21:26:22 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.60789.1745875580651098483
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 14:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LyMMw8mF;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2279915e06eso60386855ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745875580; x=1746480380; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLUkBr7gjXtba0BkIYyrs+8WkkShwL+c93wXuHHfRNY=;
        b=LyMMw8mFrElmhjdZK+133T/KGIACQHvn/A+637QilZ/Z73KrG+aIQ0TjH5ZKlUCcZ7
         wwcWvLoYsNfnv29T/allBjZw3Yghsap8LjfOOUMM0woA6qJijMaW5+HrRDb6vp8tyteF
         Fp9F8LHeQVWOY1k3R5IBYWqRwyWvRCa7HiUACbE7RHht38tE355Xjw4/7zbwyMrCPM2D
         7IM+2H8wW8tt10f6H/ex2LjJVgyl6+oItFJpvIoGjrWqMnhvm9UOJN1DcC7S7EfoxV8C
         0pO2Tx0mpwdcxfTLicNKHP3l0pJOP4z5MGw1h+I+VLDDEupavyYF4FsfDXexDIsH5zdE
         bTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875580; x=1746480380;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLUkBr7gjXtba0BkIYyrs+8WkkShwL+c93wXuHHfRNY=;
        b=QqYAb71uWipn8ZgrFFt0LSJKKuPIV+nROb6N3Brr27q6l1gaOe/Apn/x8p8VfRLpyX
         xt3KrJeC4VKVzZoRCTu3jyZpPknnEEdYtHLnlqU0Whoagkr9PteHpyIK1GKtuGaoiXMH
         +ADe/oOfsWv6myHbaGAH3j6g2SNZBdthXw/ceSZlDubd2PROgqfNr80YrC6/mJyGMnuI
         m/jEYLe5EoAsT1gQiq0YTpB8e3CP3UoFjXhQ9gftrQUHo5xv9iNM9GhKZ+uXr8Mq1lLY
         VzQ/pv2L5MDXMJBJ4eDPCvPtGpWDxeA0zO34Tlbc5fTgMFQEOSriQNC2gbFB0AN2V/hW
         oDMQ==
X-Gm-Message-State: AOJu0YycMKxthf5L4zQE3wtIfSDJ27XV/cjc48i8HuDh0TOr2z1yjd7u
	wdSiZMaykVzSW8+wF97cqS++Vwji80AYDEWSyvt+03fagf68/nJ0
X-Gm-Gg: ASbGncvy4R8pTwWtPjnUS8Jel9fu3xOUnLirFGw/S7TGFs82yICN47PzOqc1KTdkGXV
	HXKLMTmj0ucHT6J+1LpSdLxScjf4pcXImgVL5CLPp0ZEFy60w2vLXJynkA7iGwvikwrQuPq/QhM
	6SW7AzPxi+R2ShJkoGPWfmOBvDCzP06Jv0VflteP7pYt//jBkw0iRrwuz7vTGnXgVSLOGxrGhwf
	kzyMECr/tye/TCSEovJ9nEnfTlKBPF3RxiStjSmRdVM2g3VivJE99G1+BGlXZvOpBJtpSCkPlO2
	pVMS8Q57Ee08RxYD74IwCAxgMDw7q197
X-Google-Smtp-Source: AGHT+IEEgEKfVzZEDtTHK3U1Mp8AfJ4K9q8Kqqz2KH90QN5a8J4FnIrQS842IS/sZDpc748I7xmfeA==
X-Received: by 2002:a17:902:ea07:b0:224:e33:889b with SMTP id d9443c01a7336-22dc6a02897mr183097705ad.12.1745875579936;
        Mon, 28 Apr 2025 14:26:19 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::2f75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f61sm87924995ad.3.2025.04.28.14.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:26:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 00/10] clang-merge: Bring clang recipes from meta-clang
Date: Mon, 28 Apr 2025 14:26:15 -0700
Message-Id: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHfyD2gC/33PTQrCMBAF4KtI1kYmaVKNK+8hLoZk2gb6I6kUp
 fTuTgtC24XL94bvwYyipxSpF9fDKBINsY9dy8EeD8JX2JYkY+AsNGgLRmfS19zKhhKfPDqVAZK
 zWAgWz0RFfC9r9wfnKvavLn2W8UHN7W/HbHYGJUFaNE7jxeQK8VY2GOuT7xox7wz6j9VsAa0K4
 JUzEPY2W1u7tRnbggjzAs6BX9lbs7b51hq2RgcN1s1HtbbTNH0BA/lwp1oBAAA=
X-Change-ID: 20250423-clang-merge-ca9130ae95af
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 21:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215634

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
Changes in v5:
- Drop the llvm multilib patch, it needs more investigation.
- Fix compiler-rt-sanitizers build for qemuarm.
- Link to v4: https://lore.kernel.org/r/20250426-clang-merge-v4-0-42d205904261@gmail.com

Changes in v4:
- Set BINDGEN_EXTRA_CLANG_ARGS only for target recipe
- Link to v3: https://lore.kernel.org/r/20250425-clang-merge-v3-0-feea6f07d130@gmail.com

Changes in v3:
- Fix building mesa with openCL packageconfig.
- Fix buildpaths in libMesaOpenCL.so.1.0.0.
- Add mesa RPROVIDES for libclc and spirv-llvm-translator
- Link to v2: https://lore.kernel.org/r/20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com

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
Khem Raj (10):
      cmake.bbclass: Enhance to emit a native toolchain cmake file
      toolchain/clang: Remove duplicate RANLIB setting
      sstatesig: Handle special case of llvm-project-source shared-workdir
      multilib.conf: Add llvm-project-source recipe to NON_MULTILIB_RECIPES
      kernel-arch.bbclass: Do not use weak assignment for TOOLCHAIN
      clang: Merge llvm/clang family recipes from meta-clang
      clang: RPROVIDE spirv-llvm-translator and libclc
      mesa: Pass needed clang flags via BINDGEN_EXTRA_CLANG_ARGS
      mesa: Fix header search paths
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
 meta/recipes-devtools/clang/clang_git.bb           | 498 +++++++++++++++++++++
 meta/recipes-devtools/clang/common-clang.inc       |  24 +
 meta/recipes-devtools/clang/common-source.inc      |  17 +
 meta/recipes-devtools/clang/common.inc             |  83 ++++
 .../clang/compiler-rt-sanitizers_git.bb            | 135 ++++++
 meta/recipes-devtools/clang/compiler-rt_git.bb     | 125 ++++++
 meta/recipes-devtools/clang/libcxx_git.bb          | 119 +++++
 meta/recipes-devtools/clang/llvm-project-source.bb |  12 +
 .../recipes-devtools/clang/llvm-project-source.inc |  99 ++++
 .../recipes-devtools/clang/nativesdk-clang-glue.bb |  36 ++
 meta/recipes-devtools/clang/openmp_git.bb          |  67 +++
 .../0007-llvm-allow-env-override-of-exe-path.patch |  36 --
 meta/recipes-devtools/llvm/llvm/llvm-config        |  54 ---
 meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ----------
 .../0001-clover-Don-t-include-libclc-headers.patch | 143 ++++++
 ...ver-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch |  34 ++
 meta/recipes-graphics/mesa/mesa.inc                |   6 +
 64 files changed, 3896 insertions(+), 337 deletions(-)
---
base-commit: 573c7b54e66704f04d09dbb4dab6a4f847609783
change-id: 20250423-clang-merge-ca9130ae95af

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


