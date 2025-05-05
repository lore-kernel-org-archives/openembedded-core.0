Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE351C3ABB8
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 04:15:23 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.43258.1746418515183883008
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 21:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kveRLkLV;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73712952e1cso3769348b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746418514; x=1747023314; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ts7MUI0+AoaSKAnui8fve2I2zyp6gk3s3dJvjj/Kj4=;
        b=kveRLkLVVU9hGavn4Ub4dzeHDXbGfMw3OIuYUQtg/dwpSyYZklXBkECq5p4LBsl/JL
         OHfnDaI70mKjDtqYqkm1XZdX7zdekNQI5Cr0x//YAVeO9d+7SFFfnsnZk0cOcneNCVQt
         CZYjYpWeWERtVrC+HXxUy7gqtLEZSZpMVCJy9Wwugmr8u02s5kz6Mq5ZwKNHQa8LCsGW
         VAeU3ID6HoCwW/OzdFl2u7s+BGMNfymJLi2SASnzl7WduOlgvdGIdjb48enRCjHPpdiM
         DuV8QrjACjIuGLGWIohS8934im+h97xJdvBaVzvyO92huokedRcbkBJoa71OgEKlEX/W
         gZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746418514; x=1747023314;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ts7MUI0+AoaSKAnui8fve2I2zyp6gk3s3dJvjj/Kj4=;
        b=YNt0LcG8yQyLp0964f9qaTK7pppUdAf5E5UcpXhtSYL8BUmBPtJu2Wi5o8NKE6ui2S
         rRQZ6gzxBLIbDLkNqUmv1uVJDRehbgT0KNX4VQDOZZJHFuq0kkerbHT7CcrCRk0sjbXM
         5CnLrXr50n7K6Pw4lVaEv0EbrtCg/hmo1KXX960NEQhkJcZQQVhzKjMhGYrzaMO0r/xp
         4WYjyeox4wYB9UIN6omiLxASfuAf3+GiqkPNsPqwAmhwqSLkK6lW2vuDCThfVkohU4+l
         V9NSiW/68BMGBKKN/EKbosiSJKGe9gf7pfpnBS7lWh/GrCBGsIc9PTM60Z0KaSNuzTqA
         y3vA==
X-Gm-Message-State: AOJu0YxmcEGrDy5AcBnAUd06idx2SXmdPq4TDdqqwtIHHypHcSi3HjDy
	L4IhhKpptZP2UkChcy9L1ufnTbv+bHEN5b1WKZA/S1Grc2WfX9AH
X-Gm-Gg: ASbGncvOFkap1Vodc9xIbBFOGOJ3mxi+U25mf2sDtGxl6YzyWjYh+RWFF+0RFZrqo4x
	gPV9esXYN1Kkxyxd1+L6rV0nsqffNv1v9jR47sOMyxOimgRsRoB1s9KDTJdF2UctBD4W4K5IuMY
	KXP6zuRovSInpjpfa643qjYRuMnTYQT2u/kcq2RA+OwJKSDAxCvCoEC1sEPYhUAyalfR/V149uE
	6VUXuLewfrYX9hv7DBgX/8G6Qd6d6M4H3iDIrnfBVue5Ya5Utumyq4az5AsYYb4ePeLnYPzN5BN
	L0+BYwvwWZM3KRVyQchG3tRmqQRbNeIC
X-Google-Smtp-Source: AGHT+IH7QjxV6ZR+klgGiKtNdVAs8j8DO69BQNsdOjAw1XBSdUM7RouIXV3HPCecq8UB4HQp9MFpKQ==
X-Received: by 2002:a05:6a00:35c9:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-7406f089f3fmr7258045b3a.2.1746418514398;
        Sun, 04 May 2025 21:15:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021044sm5905039b3a.96.2025.05.04.21.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 21:15:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v7 0/8] clang-merge: Bring clang recipes from meta-clang
Date: Sun, 04 May 2025 21:15:10 -0700
Message-Id: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE47GGgC/33PTWrDMBAF4KsEresyGv3Y6qr3CF0M0igRxHGwi
 2kIvnvHgVLLhS7fG74H81ATj4Un9XZ4qJHnMpXhKqF9Oah4puuJm5IkKwR0YNE08SJt0/Mop0h
 BGyAOjrIScRs5l6/n2vFD8rlMn8N4f47Pem1/dmy1M+sGGkc2IHXWa6L3U0/l8hqHXq07M/5jU
 SyQ0wmiDhbS3pqtdbU1YjMz+Qxtklf21m6tr60VazEhuLAe9d66re1q68RGo7n17K3hP9b/Wgd
 YW7/+CxkjcsjZd1u7LMs3xoSog9IBAAA=
X-Change-ID: 20250423-clang-merge-ca9130ae95af
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215976

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
Changes in v7:
- Add patch to fix clang runtime without TOOLCHAIN variable
- Upgrade libsolv to 0.7.32 and enable static libs to fix a crash with opkg-native
- Link to v6: https://lore.kernel.org/r/20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com

Changes in v6:
- Drop setting TOOLCHAIN variable in clang recipes
- Upgrade minor version of clang to 20.1.3
- Link to v5: https://lore.kernel.org/r/20250428-clang-merge-v5-0-c31e76e643e1@gmail.com

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
Khem Raj (8):
      clang: Merge llvm/clang family recipes from meta-clang
      clang: RPROVIDE spirv-llvm-translator and libclc
      mesa: Pass needed clang flags via BINDGEN_EXTRA_CLANG_ARGS
      mesa: Fix header search paths
      maintainers.inc: Add myself as maintainer for clang family of recipes
      clang: Upgrade to 20.1.3
      libcxx,compiler-rt-sanitizers: Add cflags to build with clang compiler
      libsolv: Upgrade to 0.7.32 release

 meta/conf/distro/include/maintainers.inc           |  11 +-
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
 meta/recipes-devtools/clang/clang_git.bb           | 495 +++++++++++++++++++++
 meta/recipes-devtools/clang/common-clang.inc       |  24 +
 meta/recipes-devtools/clang/common-source.inc      |  17 +
 meta/recipes-devtools/clang/common.inc             |  83 ++++
 .../clang/compiler-rt-sanitizers_git.bb            | 137 ++++++
 meta/recipes-devtools/clang/compiler-rt_git.bb     | 121 +++++
 meta/recipes-devtools/clang/libcxx_git.bb          | 120 +++++
 meta/recipes-devtools/clang/llvm-project-source.bb |  12 +
 .../recipes-devtools/clang/llvm-project-source.inc |  99 +++++
 .../recipes-devtools/clang/nativesdk-clang-glue.bb |  36 ++
 meta/recipes-devtools/clang/openmp_git.bb          |  65 +++
 .../0007-llvm-allow-env-override-of-exe-path.patch |  36 --
 meta/recipes-devtools/llvm/llvm/llvm-config        |  54 ---
 meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ----------
 .../{libsolv_0.7.31.bb => libsolv_0.7.32.bb}       |   4 +-
 .../0001-clover-Don-t-include-libclc-headers.patch | 143 ++++++
 ...ver-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch |  34 ++
 meta/recipes-graphics/mesa/mesa.inc                |   6 +
 60 files changed, 3829 insertions(+), 336 deletions(-)
---
base-commit: 43fd724eac29dd6187e0e4bf777ee59898dc92ca
change-id: 20250423-clang-merge-ca9130ae95af

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


