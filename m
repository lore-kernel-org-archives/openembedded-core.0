Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022A9C3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 16:55:20 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.24044.1746204919502084604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 09:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RQjlsMr4;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so2023985a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746204919; x=1746809719; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AjNW9OHKlEpdGfLAjUsv7eGB6frqNmdIr9RFUgg9s0=;
        b=RQjlsMr4CVIc62irYwQXyJb5ZCnGlKdQ4+dMvjDVaBGcUtbc/0Zd2Pt+Gq62rCGFQu
         NkvHvvJcu5J5DgRlctUE30zPVj0fCrK390ePjSOpargjqgWr7XZQJ4SdoNNadntn6ZxX
         l1TkfcynxaWB7FflB7LwfsDsSEh1l3iXRSOuG1aZ7bi6R/FhFblkf7zmRRanyCBgZerD
         0xDSNPsPwa/o3ZuFQ52HbA1lb5Bl293lzrIq42ej7ComypAvxDKV8Tf1Gtbbfph9d5eu
         0p3rhTSdAYcesDZUyVsRs9t+kBFkdQAEWRevEjka8p4Yz7nBcaouw2sIzaL8jqstBNEK
         ZgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204919; x=1746809719;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AjNW9OHKlEpdGfLAjUsv7eGB6frqNmdIr9RFUgg9s0=;
        b=V2iZLL+Z1lig1Ld703+4k1DvZHWWHuUlO5NLq/lpIeZOpPPf36PTEjod6bkcsNyR/p
         Z+064M4/C5fj9MXYA91imOVLFwGDx+UQghmU6B1SIb5W5NxgsQ60s4tYfhJUGKJd/ED0
         uhiPtczwkP7tjS8JhAF4EtO3WFO6ejXscY+SOYEObuF9IS+sCWsmjx6A7KOOQn9jeXUl
         6ao7EaROuma6ZAPjoRZQJx02EMRb+6/lm22ravEn+DGvocjBseH0xkGwo2wCvfM0YOyA
         Av9vXK+p49ZuX+qeCjSIDMzECikCgi1yTHq9gYd5B/o41xszbnO4YwS7nckI1wNM6Wmu
         OsPg==
X-Gm-Message-State: AOJu0YwfbcjUvaO2r1LzBKivYQncQFMP5hThYGJ56U0AOSXwqEaQlrSm
	GbUCmzD472hQlGfleBoS8vLtDSzd72tFd/c3IRDyex/hyEvW1TDj613H/kKT
X-Gm-Gg: ASbGncuHd/XByboxQ/VDhUjnB/6Q3tAfrdP6t6wBMBMyd8/FJR9+ON80NmTWLxibOu/
	QJ5oqgt2GzpKCRI1inhk6TN6jnGyE2B7BE8B2QmHCeJT52z1vlNjSUU2wD5eWxy3nM3D7J66xZ5
	0XLYuFxbO1jPZFNkRSvVrbc0CKkdDPIFAQNDhh1X1azzpoxgyFEjU+1kevyUY/8LJ8FLrPhT7pp
	qIqM1qm0Wxsx9+KIopHemootfM6970M+QnvLpDEILjuizYoqS0dJTJ93ehHGLoInnvLXyTLJN0m
	YLriB+WYokdwTvJfX8OMHOREEorvt51egyr5XmpRm4A=
X-Google-Smtp-Source: AGHT+IE7Vh2vP0I1tfLsfgt7hLfTVQN4KWGjRRaiX1+J91SvqPlxjRi99EXxvbvN7/OBo7Zl44u2BQ==
X-Received: by 2002:a17:90b:5244:b0:309:e195:59d4 with SMTP id 98e67ed59e1d1-30a4e5b1cefmr5858947a91.12.1746204918620;
        Fri, 02 May 2025 09:55:18 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47625af9sm3253794a91.31.2025.05.02.09.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:55:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v6 0/6] clang-merge: Bring clang recipes from meta-clang
Date: Fri, 02 May 2025 09:55:14 -0700
Message-Id: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPL4FGgC/33PQWrDMBAF0KsEraMykkZKlFXvUboYpHEiiOMgB
 9MSfPeOAwXLiyz/H96HeaqRa+FRnXZPVXkqYxluEsJ+p9KFbmfWJUtWFqwHtE6nq7S65yqnRNE
 4II6eOiXiXrkrP6+1r2/JlzI+hvr7Gp/M0v7vYLMzGQ3aE0ZLRwyG6PPcU7l+pKFXy85k31grF
 sibDMlEhLy1bm19a53YjplCB4csr2wtrm1oLYpFmy34uBzN1vq1PbbWi03O8CFwQMeNnef5D4f
 xYTKWAQAA
X-Change-ID: 20250423-clang-merge-ca9130ae95af
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 16:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215911

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
Khem Raj (6):
      clang: Merge llvm/clang family recipes from meta-clang
      clang: RPROVIDE spirv-llvm-translator and libclc
      mesa: Pass needed clang flags via BINDGEN_EXTRA_CLANG_ARGS
      mesa: Fix header search paths
      maintainers.inc: Add myself as maintainer for clang family of recipes
      clang: Upgrade to 20.1.3

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
 .../clang/compiler-rt-sanitizers_git.bb            | 131 ++++++
 meta/recipes-devtools/clang/compiler-rt_git.bb     | 121 +++++
 meta/recipes-devtools/clang/libcxx_git.bb          | 115 +++++
 meta/recipes-devtools/clang/llvm-project-source.bb |  12 +
 .../recipes-devtools/clang/llvm-project-source.inc |  99 +++++
 .../recipes-devtools/clang/nativesdk-clang-glue.bb |  36 ++
 meta/recipes-devtools/clang/openmp_git.bb          |  65 +++
 .../0007-llvm-allow-env-override-of-exe-path.patch |  36 --
 meta/recipes-devtools/llvm/llvm/llvm-config        |  54 ---
 meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ----------
 .../0001-clover-Don-t-include-libclc-headers.patch | 143 ++++++
 ...ver-Do-not-use-LLVM_LIBRARY_DIR-for-FALLB.patch |  34 ++
 meta/recipes-graphics/mesa/mesa.inc                |   6 +
 59 files changed, 3816 insertions(+), 334 deletions(-)
---
base-commit: 43fd724eac29dd6187e0e4bf777ee59898dc92ca
change-id: 20250423-clang-merge-ca9130ae95af

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


