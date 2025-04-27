Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74473C369AB
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 03:17:05 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.20649.1745723816120520137
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 20:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RBBrBBt9;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-301cda78d48so4588090a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 20:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745723815; x=1746328615; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bmJ7oV1LwUUnTEAj0ATYPmjDHlzmKX3Mrgayq/mLNjA=;
        b=RBBrBBt9mpNpnpFznxwa7VryJkIZu8Tsc7GxylUHzHClk3yHQFLq/Uyc1cCPkpRCvp
         EdzoqdCZAO4m27KxC2dD0ShfLXYU8wU9UKe3bH5OVJlJ+DhiVJFcCnICykbEWehIZiuo
         qZFUbWUi55x45WYMlzvrB4vwGMmtXXJ9kl7We8h/j0tWDICGmylQbscTWTYk000ozKOM
         zOZDViH90EqhnQXv5VK9JVnjCXl7EbTcesKjJo2plSRx2/ya3zJ3Odm+cG5aMGGuYRMJ
         2CTnL+tVYDpkXqRTcX396lUVGnSRzbqxkMwZduJ5cIC5sed+1RJSaMP0/ojrEvLAnZ1j
         7QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745723815; x=1746328615;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmJ7oV1LwUUnTEAj0ATYPmjDHlzmKX3Mrgayq/mLNjA=;
        b=kfJkqddaIUKFsfx40G3SiMlT8NqQqN84a7Jm9VEosA9nwpJ7CBIevW8IPUEM+zaZIK
         HB/z28sAKsAnZUkpAEpfV31qDLugGKwvvtA25pv7CZkn9oG+sy9UFiJnOLzrwkrP92me
         pIx7srGnoYh0KmJnE4UWKJebEG987LOxRMIaO+yfsxZYFBMTG6WANZSKqBTVbQ+JxwXE
         3bqJuomp1ZzQsSmPCEd9ZwsZSHcaFMZIh0DQCzHTDn2D7Bg7DhCwvx8Tl+w5QsG076Bi
         IZr7Wsq8qR0g0EIwtTkNreUNNAOXlyBcFBSOOLYbswQ+aZfwI1EalIOvZlWbaq7m4Z7m
         /hAw==
X-Gm-Message-State: AOJu0YyAdhJD9dHt353NbX26nsIPBsAPOMonQ+QuObxw1SinPeac7Ujv
	vmm5N75VuRie52owY5zzJikwNms20Fs9SNsW6ILAUUQZ0eMH9f2u
X-Gm-Gg: ASbGncte53ErMWzTqTneu4VCY9U4MhlKyyOg1X0bLJOnJoCLqg7Kl4HGns4Vq/ZxRH8
	n2OFugb0cX35L12V3ZX5/i58XNx5IlrAUV8E/81e9rUF/mZGK8joT8KEhr8k95j3mKKuITGLMLm
	NfWtTB8cAlAbC9gZnJJRU9WuOLRszSRvYor631HuL87j4h6IMa90Htgg2oMsSpYUr3q1qbfH/7f
	ylBfumLABmODPUz4P3ta6Ar0LxvSYb8h9TBf1nO/2fR0K/v1YCyJs3R76ry+3V3RhFYMESw1kA+
	PQWCEexMQy2vetiXmwOOJsdzs2wZG85L
X-Google-Smtp-Source: AGHT+IFBGNz2kMRXhplknlgV7C7KM6O4LfS06dprV/jlOj2HAnqaknmx4jfS8CE3TKKpfwwt9xD8QA==
X-Received: by 2002:a17:90b:6d0:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-309f7df3083mr14243188a91.18.1745723815385;
        Sat, 26 Apr 2025 20:16:55 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm4362452a91.12.2025.04.26.20.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 20:16:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 00/10] clang-merge: Bring clang recipes from meta-clang
Date: Sat, 26 Apr 2025 20:16:39 -0700
Message-Id: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJihDWgC/33PTQrCMBCG4auUrI0kaVKNK+8hLoZ00gb6I4kEp
 fTuTgtC68LlN+F5IRNLGAMmdikmFjGHFMaBhj4UzLUwNMhDTZspoYzQquSuoyvvMdKTAytLAWg
 NeEbiEdGH11q73Wm3IT3H+F7jWS7Xb0fvOllywQ1oq+CsKwlwbXoI3dGNPVs6Wf2xiqwAI2vhp
 NWi/rXl1pq9Lcl6RKi8ONX0la2d5/kDpP+yWh4BAAA=
X-Change-ID: 20250423-clang-merge-ca9130ae95af
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Liu Yiding <liuyd.fnst@fujitsu.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 03:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215531

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
 meta/recipes-devtools/clang/clang_git.bb           | 499 +++++++++++++++++++++
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
 .../0001-clover-Don-t-include-libclc-headers.patch | 143 ++++++
 ...ver-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch |  34 ++
 meta/recipes-graphics/mesa/mesa.inc                |   6 +
 64 files changed, 3901 insertions(+), 337 deletions(-)
---
base-commit: 573c7b54e66704f04d09dbb4dab6a4f847609783
change-id: 20250423-clang-merge-ca9130ae95af

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


