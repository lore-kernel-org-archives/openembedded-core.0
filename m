Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71352CAC586
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 21:22:49 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.6386.1757366563617207452
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 14:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cuqioLdG;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so5783989a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757366563; x=1757971363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9X8qRgS/tV/t6EKhlddwx7LEnM+V2Z+wmRqdDIStTIQ=;
        b=cuqioLdGzOzQuxb9gVbQCNSVR55A78wYaTg4boxFJPbRIjuAkv5ZNAcyHoA3hN8qtf
         2jC2tDxL1/DtEojV7wRHFe0pPcCfPO3nPp5LbDGW8bb+URT2KJtxf3HPAoOFlFs4UbKb
         EbBv5hxz9mvWtqMRfICmFy8E/M5AILWfvthy15c1Xr7t6gn9qbXcfPVMABRtnEsPUpZ9
         beXdyFwsLEJx76KMV3OhCFu3mqtN27CNriq5s0pKottL2mEq02c2/ZRRPBTeFmSNMqBf
         JNKAP+oJqNPdXLnoUhUA30Ke2oGBKTT66lru99qKL6QpmhymxA5482SCIYvTdnTNDGQg
         6Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757366563; x=1757971363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9X8qRgS/tV/t6EKhlddwx7LEnM+V2Z+wmRqdDIStTIQ=;
        b=Z8dhEcdo4X3C4J21NeqFmLDMEjNrukxnGad7eDRxi9w6eSfQf8XfPgCxJ7oNQZtMlq
         mMxMCa9xdGh5i9o3aCCjJUaD5Gpv7xjnUfzU6BIaWtQitp9mDa6JpaW4pkthV0eq8piK
         L5ENWrkHFQH2vkk2c2Miv72cmex/JhSMM5ltAPxwMt+VmuAlQOEoqnuPLcfBriNLn0MY
         +LLxNPyO31dsLdNQKiRi1SkZRbkzcI1WySqwlJxfANIKORrEQNmTcSj1wYRbELyAg1xw
         4sdtgjlu32i+OY1VRgmNL7XmLYgNsOSSaViAsB667C+UsIVT/VZ+8MBLlJsfCpBlzdbW
         A3bQ==
X-Gm-Message-State: AOJu0YxyHGtUV8cOEr/rb6AhfjHuSyT07Y34zAF2HbMEqDYLNeYwvbNc
	EoSmHKN+cp7xze3upLtW0rxcpgyQhJ2S50Aux+tpIzZ91zUvQ8uNpRcWSuJ5xmyH
X-Gm-Gg: ASbGncti59x1hgFavDrwWckfh08NmHiE3P0a0ZR+4/UPo9IICyH/IpvluxR+hjJVrZJ
	5BQHiulh51Vos4spO4cyoupG+p9OT/fK++TRGwP3SyOAwGdadl0rjDjhB0k/+L+cZ1RYYsJoEAZ
	XmMc6AYtYMyUotsFY8iV8DwVgaDJImO74QFyIatti3ukn1AOtAeaJqRdfncadj/nMxXXNY3ZQdY
	+87SsmlUPOOWRgKYVZqpuBugacl26J/19lKOdDzpxatbq5NHEP2/pgZkZtUUJzg0smVYZbcF0LX
	4NORcADfvFDxAlkju3ekrk7lJj1EvfsyCBp5neW/LxmsPJVaK1fsiU4lmIPvABeo1nRnIlVDNr7
	Z/pRr3CFGr8l4O53odVc2mmG+AMs84rdBNu+gGhNqAWyLX+6qUtX5vguzMT6sVcO0vQQdNTQEpk
	87mUl2tXDk1Ek/QtA+n83MO5NC6Jbxw5+ALOb1aKt8j7atoHFqDwc=
X-Google-Smtp-Source: AGHT+IEh+U+8ScfKrKDy2jHrYFWHN9sXjfRCheIoY6kLo5YiPy6QkIHdXY1VKvFDgwi2Saqwdx9Y/A==
X-Received: by 2002:a17:90b:3cce:b0:32b:96fa:5f46 with SMTP id 98e67ed59e1d1-32d43f2f472mr11920730a91.5.1757366561521;
        Mon, 08 Sep 2025 14:22:41 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fe29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723d79fcfesm27795562b3a.16.2025.09.08.14.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:22:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] clang: Upgrade to 21.1.0
Date: Mon,  8 Sep 2025 14:22:36 -0700
Message-ID: <20250908212238.3500731-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 21:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223084

Clang 21.1.0 is a major release in Clang21 series

Release Notes LLVM [1] Clang [2] LLD [3] Libcxx [4]

[1] https://releases.llvm.org/21.1.0/docs/ReleaseNotes.html
[2] https://releases.llvm.org/21.1.0/tools/clang/docs/ReleaseNotes.html
[3] https://releases.llvm.org/21.1.0/tools/lld/docs/ReleaseNotes.html
[4] https://releases.llvm.org/21.1.0/projects/libcxx/docs/ReleaseNotes.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Document Inappropriate patches for context

 meta/conf/distro/include/maintainers.inc      |   2 +-
 ...h64-Add-GCS-property-in-assembly-fil.patch | 151 ------------------
 ...ibunwind-headers-when-LIBCXXABI_LIBU.patch |   8 +-
 ...-support-a-new-embedded-linux-target.patch |   2 +-
 ...lify-cross-compilation.-Don-t-use-na.patch |   4 +-
 ...ryInfo-Undefine-libc-functions-if-th.patch |   8 +-
 ...-env-override-of-exe-and-libdir-path.patch |  10 +-
 ...g-driver-Check-sysroot-for-ldso-path.patch |  12 +-
 ...tools.cpp-Add-lssp_nonshared-on-musl.patch |   6 +-
 ...08-clang-Prepend-trailing-to-sysroot.patch |   6 +-
 ...e-the-target-sysroot-for-compiler-ru.patch |  10 +-
 ...efine-releative-gcc-installation-dir.patch |  16 +-
 ...ad-and-ldl-along-with-lunwind-for-st.patch |   6 +-
 ...UTABLE-when-cross-compiling-for-nati.patch |   8 +-
 ...3-Check-for-atomic-double-intrinsics.patch |   2 +-
 ...gure-for-packages-using-find_package.patch |  27 ++--
 ...ce-dir-location-for-cross-toolchains.patch |   8 +-
 ...-dyld-prefix-when-checking-sysroot-f.patch |  14 +-
 ...-clang-Use-python3-in-python-scripts.patch |   2 +-
 ...t-anchor-for-adding-OE-distro-vendor.patch |  20 +--
 ...ot-use-backtrace-APIs-on-non-glibc-l.patch |   2 +-
 ...iple-for-non-debian-multiarch-linux-.patch |   6 +-
 ...libunwind-Added-unw_backtrace-method.patch |   2 +-
 ...0022-lldb-Link-with-libatomic-on-x86.patch |   4 +-
 ...ompiler-rt-Enable-__int128-for-ppc32.patch |  12 +-
 ...ot-use-cmake-infra-to-detect-libzstd.patch |   8 +-
 ...t-Fix-stat-struct-s-size-for-O32-ABI.patch |  12 +-
 ...f-_TIME_BITS-along-with-_FILE_OFFSET.patch |   6 +-
 ....cpp-ARMLibDirs-search-also-in-lib32.patch |  10 +-
 ...d-OE-specific-ABI-triple-for-N32-ABI.patch |  20 +--
 ...unwind.pc.in-and-llvm-config-scripts.patch |   2 +-
 ...spect-LLVM_LIBDIR_SUFFIX-like-other-.patch |   2 +-
 ...Do-not-pass-target-to-clang-compiler.patch |   2 +-
 ...-sort-ClassInfo-lists-by-name-as-we.patch} |   6 +-
 ...uild-option-to-disable-building-dexp.patch |  85 ----------
 ...ve-LLVM_LDFLAGS-from-ldflags-output.patch} |   4 +-
 ...de-sync_fetch_and_-for-any-pre-ARMv.patch} |  15 +-
 ...ode-uptr-sptr-typedefs-on-Mips-Linu.patch} |   2 +-
 ...it-date-and-time-into-generate-files.patch |  37 -----
 ...t-relative-paths-for-getArchSpecific.patch |  48 ++++++
 ...-gcs-instead-of-gcs-target-attribute.patch |  56 -------
 ...037-allow-external-prepare_builtins.patch} |   9 +-
 ...p-headers-in-the-debug-info-when-bui.patch |  36 +++++
 ...ng-block-when-searching-for-noreturn.patch |  41 +++++
 ...x-test-when-clang-tests-are-include.patch} |  30 ++--
 ...users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch} |  59 +++----
 meta/recipes-devtools/clang/common-clang.inc  |   6 +-
 meta/recipes-devtools/clang/common.inc        |  27 ++--
 48 files changed, 322 insertions(+), 549 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch
 rename meta/recipes-devtools/clang/clang/{0033-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch => 0032-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch} (89%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0032-clangd-Add-a-build-option-to-disable-building-dexp.patch
 rename meta/recipes-devtools/clang/clang/{0034-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch => 0033-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch} (93%)
 rename meta/recipes-devtools/clang/clang/{0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch => 0034-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch => 0035-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch} (95%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0035-openmp-Do-not-emit-date-and-time-into-generate-files.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0036-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
 rename meta/recipes-devtools/clang/clang/{0001-libclc-allow-existing-prepare-builtins-in-standalone.patch => 0037-allow-external-prepare_builtins.patch} (93%)
 create mode 100644 meta/recipes-devtools/clang/clang/0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0039-Prevent-revisiting-block-when-searching-for-noreturn.patch
 rename meta/recipes-devtools/clang/clang/{no-c-index-test.patch => 0040-Only-build-c-index-test-when-clang-tests-are-include.patch} (64%)
 rename meta/recipes-devtools/clang/clang/{0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch => 0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch} (53%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8f230912567..6cfa76e2a3d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-20.1.8 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch b/meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch
deleted file mode 100644
index 5935c42d90e..00000000000
--- a/meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 2d102880766a5e55e5d7b4f9a2fb106d7d1ee55c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Csan=C3=A1d=20Hajd=C3=BA?= <csanad.hajdu@arm.com>
-Date: Thu, 7 Aug 2025 16:40:36 +0200
-Subject: [PATCH] [compiler-rt][AArch64] Add GCS property in assembly files
- (#152502)
-
-Only BTI and PAC properties were added previously.
-
-Fixes https://github.com/llvm/llvm-project/issues/152427.
-
-Upstream-Status: Backport [https://github.com/llvm/llvm-project/pull/152502]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- compiler-rt/lib/builtins/aarch64/lse.S         |  4 ++--
- compiler-rt/lib/builtins/aarch64/sme-abi.S     |  4 ++--
- compiler-rt/lib/builtins/assembly.h            | 18 +++++++++++++-----
- .../lib/hwasan/hwasan_interceptors_vfork.S     |  2 +-
- compiler-rt/lib/hwasan/hwasan_setjmp_aarch64.S |  2 +-
- .../lib/hwasan/hwasan_tag_mismatch_aarch64.S   |  2 +-
- ...zer_common_interceptors_vfork_aarch64.inc.S |  2 +-
- compiler-rt/lib/tsan/rtl/tsan_rtl_aarch64.S    |  2 +-
- 8 files changed, 22 insertions(+), 14 deletions(-)
-
-diff --git a/compiler-rt/lib/builtins/aarch64/lse.S b/compiler-rt/lib/builtins/aarch64/lse.S
-index 1fe18f4a4681..abad047096cc 100644
---- a/compiler-rt/lib/builtins/aarch64/lse.S
-+++ b/compiler-rt/lib/builtins/aarch64/lse.S
-@@ -264,7 +264,7 @@ END_COMPILERRT_OUTLINE_FUNCTION(NAME(LDNM))
- 
- NO_EXEC_STACK_DIRECTIVE
- 
--// GNU property note for BTI and PAC
--GNU_PROPERTY_BTI_PAC
-+// GNU property note for BTI, PAC, and GCS
-+GNU_PROPERTY_BTI_PAC_GCS
- 
- #endif // __aarch64__
-diff --git a/compiler-rt/lib/builtins/aarch64/sme-abi.S b/compiler-rt/lib/builtins/aarch64/sme-abi.S
-index 8dbbe061edb9..29d7ad53047d 100644
---- a/compiler-rt/lib/builtins/aarch64/sme-abi.S
-+++ b/compiler-rt/lib/builtins/aarch64/sme-abi.S
-@@ -371,5 +371,5 @@ END_COMPILERRT_FUNCTION(__arm_sme_restore)
- 
- NO_EXEC_STACK_DIRECTIVE
- 
--// GNU property note for BTI and PAC
--GNU_PROPERTY_BTI_PAC
-+// GNU property note for BTI, PAC, and GCS
-+GNU_PROPERTY_BTI_PAC_GCS
-diff --git a/compiler-rt/lib/builtins/assembly.h b/compiler-rt/lib/builtins/assembly.h
-index 34c71241524d..a554c10c18ac 100644
---- a/compiler-rt/lib/builtins/assembly.h
-+++ b/compiler-rt/lib/builtins/assembly.h
-@@ -79,11 +79,12 @@
- #define FUNC_ALIGN
- #endif
- 
--// BTI and PAC gnu property note
-+// BTI, PAC, and GCS gnu property note
- #define NT_GNU_PROPERTY_TYPE_0 5
- #define GNU_PROPERTY_AARCH64_FEATURE_1_AND 0xc0000000
- #define GNU_PROPERTY_AARCH64_FEATURE_1_BTI 1
- #define GNU_PROPERTY_AARCH64_FEATURE_1_PAC 2
-+#define GNU_PROPERTY_AARCH64_FEATURE_1_GCS 4
- 
- #if defined(__ARM_FEATURE_BTI_DEFAULT)
- #define BTI_FLAG GNU_PROPERTY_AARCH64_FEATURE_1_BTI
-@@ -97,6 +98,12 @@
- #define PAC_FLAG 0
- #endif
- 
-+#if defined(__ARM_FEATURE_GCS_DEFAULT)
-+#define GCS_FLAG GNU_PROPERTY_AARCH64_FEATURE_1_GCS
-+#else
-+#define GCS_FLAG 0
-+#endif
-+
- #define GNU_PROPERTY(type, value)                                              \
-   .pushsection .note.gnu.property, "a" SEPARATOR                               \
-   .p2align 3 SEPARATOR                                                         \
-@@ -118,11 +125,12 @@
- #define BTI_J
- #endif
- 
--#if (BTI_FLAG | PAC_FLAG) != 0
--#define GNU_PROPERTY_BTI_PAC                                                   \
--  GNU_PROPERTY(GNU_PROPERTY_AARCH64_FEATURE_1_AND, BTI_FLAG | PAC_FLAG)
-+#if (BTI_FLAG | PAC_FLAG | GCS_FLAG) != 0
-+#define GNU_PROPERTY_BTI_PAC_GCS                                               \
-+  GNU_PROPERTY(GNU_PROPERTY_AARCH64_FEATURE_1_AND,                             \
-+               BTI_FLAG | PAC_FLAG | GCS_FLAG)
- #else
--#define GNU_PROPERTY_BTI_PAC
-+#define GNU_PROPERTY_BTI_PAC_GCS
- #endif
- 
- #if defined(__clang__) || defined(__GCC_HAVE_DWARF2_CFI_ASM)
-diff --git a/compiler-rt/lib/hwasan/hwasan_interceptors_vfork.S b/compiler-rt/lib/hwasan/hwasan_interceptors_vfork.S
-index fd20825e3dac..825f41156509 100644
---- a/compiler-rt/lib/hwasan/hwasan_interceptors_vfork.S
-+++ b/compiler-rt/lib/hwasan/hwasan_interceptors_vfork.S
-@@ -11,4 +11,4 @@
- 
- NO_EXEC_STACK_DIRECTIVE
- 
--GNU_PROPERTY_BTI_PAC
-+GNU_PROPERTY_BTI_PAC_GCS
-diff --git a/compiler-rt/lib/hwasan/hwasan_setjmp_aarch64.S b/compiler-rt/lib/hwasan/hwasan_setjmp_aarch64.S
-index 0c0abb6de861..b8d98b09ada2 100644
---- a/compiler-rt/lib/hwasan/hwasan_setjmp_aarch64.S
-+++ b/compiler-rt/lib/hwasan/hwasan_setjmp_aarch64.S
-@@ -99,4 +99,4 @@ ASM_TRAMPOLINE_ALIAS(_setjmp, setjmp)
- // We do not need executable stack.
- NO_EXEC_STACK_DIRECTIVE
- 
--GNU_PROPERTY_BTI_PAC
-+GNU_PROPERTY_BTI_PAC_GCS
-diff --git a/compiler-rt/lib/hwasan/hwasan_tag_mismatch_aarch64.S b/compiler-rt/lib/hwasan/hwasan_tag_mismatch_aarch64.S
-index fd060c51cd8e..be82475101c8 100644
---- a/compiler-rt/lib/hwasan/hwasan_tag_mismatch_aarch64.S
-+++ b/compiler-rt/lib/hwasan/hwasan_tag_mismatch_aarch64.S
-@@ -157,4 +157,4 @@ mismatch:
- // We do not need executable stack.
- NO_EXEC_STACK_DIRECTIVE
- 
--GNU_PROPERTY_BTI_PAC
-+GNU_PROPERTY_BTI_PAC_GCS
-diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_common_interceptors_vfork_aarch64.inc.S b/compiler-rt/lib/sanitizer_common/sanitizer_common_interceptors_vfork_aarch64.inc.S
-index cdfa6f1d7f53..5066953980af 100644
---- a/compiler-rt/lib/sanitizer_common/sanitizer_common_interceptors_vfork_aarch64.inc.S
-+++ b/compiler-rt/lib/sanitizer_common/sanitizer_common_interceptors_vfork_aarch64.inc.S
-@@ -43,6 +43,6 @@ ASM_SIZE(vfork)
- ASM_INTERCEPTOR_TRAMPOLINE(vfork)
- ASM_TRAMPOLINE_ALIAS(vfork, vfork)
- 
--GNU_PROPERTY_BTI_PAC
-+GNU_PROPERTY_BTI_PAC_GCS
- 
- #endif
-diff --git a/compiler-rt/lib/tsan/rtl/tsan_rtl_aarch64.S b/compiler-rt/lib/tsan/rtl/tsan_rtl_aarch64.S
-index 7d920bee4a2d..f1d11a3e7f54 100644
---- a/compiler-rt/lib/tsan/rtl/tsan_rtl_aarch64.S
-+++ b/compiler-rt/lib/tsan/rtl/tsan_rtl_aarch64.S
-@@ -222,6 +222,6 @@ ASM_SIZE(ASM_SYMBOL_INTERCEPTOR(__sigsetjmp))
- 
- NO_EXEC_STACK_DIRECTIVE
- 
--GNU_PROPERTY_BTI_PAC
-+GNU_PROPERTY_BTI_PAC_GCS
- 
- #endif
diff --git a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
index 3853d7648b4..8836863e2b2 100644
--- a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
+++ b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
@@ -1,4 +1,4 @@
-From 1fa8ec110c67714cff009b481c430e3d004bfaad Mon Sep 17 00:00:00 2001
+From b741b268820d5c81cef9cf16cb9b8b8742220fdc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 Aug 2017 10:37:49 -0700
 Subject: [PATCH] libcxxabi: Find libunwind headers when
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 5 deletions(-)
 
 diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt
-index 6dcfc51e5532..32478a62a058 100644
+index cf478bcee01f..4b374572905d 100644
 --- a/libcxxabi/CMakeLists.txt
 +++ b/libcxxabi/CMakeLists.txt
-@@ -465,7 +465,7 @@ set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
+@@ -472,7 +472,7 @@ set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
      "Specify path to libunwind source." FORCE)
  
  if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
@@ -30,7 +30,7 @@ index 6dcfc51e5532..32478a62a058 100644
      PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}
            ${LIBCXXABI_LIBUNWIND_PATH}/include
            ${CMAKE_BINARY_DIR}/${LIBCXXABI_LIBUNWIND_INCLUDES}
-@@ -476,18 +476,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
+@@ -483,18 +483,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
      NO_CMAKE_FIND_ROOT_PATH
    )
  
diff --git a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
index d5d6a2c6d7e..e76dc2bbe01 100644
--- a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
+++ b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
@@ -1,4 +1,4 @@
-From 6e8c6c53281fdd3b11d29d706905a3fe959afd11 Mon Sep 17 00:00:00 2001
+From 9e42b5a74a86b108c49d9f4cc97ad4aa986af5e8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 19 Apr 2015 15:16:23 -0700
 Subject: [PATCH] compiler-rt: support a new embedded linux target
diff --git a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
index 0ee70902900..9bbd6e40271 100644
--- a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
+++ b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
@@ -1,4 +1,4 @@
-From 419855642e4a48d09e7b3b1e02593b6d9a506089 Mon Sep 17 00:00:00 2001
+From 098622b7dce4f28942a4f4a46d46580742dab972 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 May 2016 23:11:45 -0700
 Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt
-index 2c52788de56a..fe409704acc3 100644
+index 9f8e8334d75b..a0ba047bdb73 100644
 --- a/compiler-rt/CMakeLists.txt
 +++ b/compiler-rt/CMakeLists.txt
 @@ -107,7 +107,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
diff --git a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
index 60b5360057a..ef6bd552466 100644
--- a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
+++ b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
@@ -1,4 +1,4 @@
-From 2603da5f1fce88f6c7f6134faf7757f17b7e14f5 Mon Sep 17 00:00:00 2001
+From bd6aaf1bad7d46da1928a5b1ecfc9f15e4345a84 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 May 2016 00:33:20 +0000
 Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if they are
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 21 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
-index db566b8ee610..578161f9c978 100644
+index 014988299d37..ea77dae66482 100644
 --- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
 +++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
 @@ -1467,6 +1467,9 @@ TLI_DEFINE_STRING_INTERNAL("fopen")
@@ -68,7 +68,7 @@ index db566b8ee610..578161f9c978 100644
  TLI_DEFINE_ENUM_INTERNAL(lstat64)
  TLI_DEFINE_STRING_INTERNAL("lstat64")
  TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
-@@ -2334,6 +2348,9 @@ TLI_DEFINE_STRING_INTERNAL("stat")
+@@ -2339,6 +2353,9 @@ TLI_DEFINE_STRING_INTERNAL("stat")
  TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
  
  /// int stat64(const char *path, struct stat64 *buf);
@@ -78,7 +78,7 @@ index db566b8ee610..578161f9c978 100644
  TLI_DEFINE_ENUM_INTERNAL(stat64)
  TLI_DEFINE_STRING_INTERNAL("stat64")
  TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
-@@ -2559,6 +2576,9 @@ TLI_DEFINE_STRING_INTERNAL("tmpfile")
+@@ -2564,6 +2581,9 @@ TLI_DEFINE_STRING_INTERNAL("tmpfile")
  TLI_DEFINE_SIG_INTERNAL(Ptr)
  
  /// FILE *tmpfile64(void)
diff --git a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
index 7aea73e611b..1fc9bd3df0c 100644
--- a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
+++ b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
@@ -1,4 +1,4 @@
-From 13a9ce5a34060abaa6d5da5176eb1dab271dac4e Mon Sep 17 00:00:00 2001
+From 82bcb02b2bfbad848663726d68344ce919fc8e65 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 19 insertions(+), 6 deletions(-)
 
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index d5b76b1bb6c1..a739f0d8dbea 100644
+index 49df8fdcb7f7..c092db81bb8f 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -246,6 +246,13 @@ Typical components:\n\
+@@ -245,6 +245,13 @@ Typical components:\n\
  
  /// Compute the path to the main executable.
  std::string GetExecutablePath(const char *Argv0) {
@@ -36,7 +36,7 @@ index d5b76b1bb6c1..a739f0d8dbea 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
-@@ -325,7 +332,7 @@ int main(int argc, char **argv) {
+@@ -324,7 +331,7 @@ int main(int argc, char **argv) {
    // Compute various directory locations based on the derived location
    // information.
    std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
@@ -45,7 +45,7 @@ index d5b76b1bb6c1..a739f0d8dbea 100644
    std::string ActiveIncludeOption;
    if (IsInDevelopmentTree) {
      ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
-@@ -366,12 +373,18 @@ int main(int argc, char **argv) {
+@@ -365,12 +372,18 @@ int main(int argc, char **argv) {
        sys::fs::make_absolute(ActivePrefix, Path);
        ActiveBinDir = std::string(Path);
      }
diff --git a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
index 44fa980ab88..10888fefe93 100644
--- a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
+++ b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
@@ -1,4 +1,4 @@
-From a804903ed85707d9a06c7e01aef536b3042790d0 Mon Sep 17 00:00:00 2001
+From 1416f9085479ebe08cc299928844541e55f58504 Mon Sep 17 00:00:00 2001
 From: Dan McGregor <dan.mcgregor@usask.ca>
 Date: Wed, 26 Apr 2017 20:29:41 -0600
 Subject: [PATCH] clang: driver: Check sysroot for ldso path
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 21 insertions(+), 1 deletion(-)
 
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index 0767fe6c5879..e5a696f63fd0 100644
+index 8ac8d4eb9181..f1a334c7a081 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -523,8 +523,12 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -515,8 +515,12 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
          Triple.getEnvironment() == llvm::Triple::GNUEABIHFT64 ||
          tools::arm::getARMFloatABI(*this, Args) == tools::arm::FloatABI::Hard;
  
@@ -34,7 +34,7 @@ index 0767fe6c5879..e5a696f63fd0 100644
      break;
    }
    case llvm::Triple::loongarch32: {
-@@ -578,11 +582,19 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -570,11 +574,19 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
      LibDir = "lib64";
      Loader =
          (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.so.1";
@@ -54,7 +54,7 @@ index 0767fe6c5879..e5a696f63fd0 100644
      break;
    case llvm::Triple::riscv32:
    case llvm::Triple::riscv64: {
-@@ -600,6 +612,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -592,6 +604,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
    case llvm::Triple::sparcv9:
      LibDir = "lib64";
      Loader = "ld-linux.so.2";
@@ -65,7 +65,7 @@ index 0767fe6c5879..e5a696f63fd0 100644
      break;
    case llvm::Triple::systemz:
      LibDir = "lib";
-@@ -614,6 +630,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -606,6 +622,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
  
      LibDir = X32 ? "libx32" : "lib64";
      Loader = X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
diff --git a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
index 6374ec7bf59..f91cbe7b436 100644
--- a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
+++ b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
@@ -1,4 +1,4 @@
-From 703e5acbeaad6eeb316740dd8b92b34db99bb1b3 Mon Sep 17 00:00:00 2001
+From 4facd87cbed8b8179730043efa120122dc86dcf1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 May 2016 21:11:06 -0700
 Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index f56eeda3cb5f..9f7b9e8d42a8 100644
+index f5e265585743..3565c9398f92 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -631,6 +631,12 @@ void tools::gnutools::Linker::ConstructJob(Compilation &C, const JobAction &JA,
+@@ -551,6 +551,12 @@ void tools::gnutools::Linker::ConstructJob(Compilation &C, const JobAction &JA,
        if (IsIAMCU)
          CmdArgs.push_back("-lgloss");
  
diff --git a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
index 16d8c9bae52..78bc7661e40 100644
--- a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
+++ b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
@@ -1,4 +1,4 @@
-From b1d4a42b6078502530924cd0d15052671c760eb6 Mon Sep 17 00:00:00 2001
+From 41442c26709f438a158b68c0339f1ea66c08864c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 Mar 2017 09:02:13 -0700
 Subject: [PATCH] clang: Prepend trailing '/' to sysroot
@@ -25,10 +25,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index e5a696f63fd0..621fa17e0603 100644
+index f1a334c7a081..67e922e08228 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -216,7 +216,7 @@ Linux::Linux(const Driver &D, const llvm::Triple &Triple, const ArgList &Args)
+@@ -215,7 +215,7 @@ Linux::Linux(const Driver &D, const llvm::Triple &Triple, const ArgList &Args)
    Multilibs = GCCInstallation.getMultilibs();
    SelectedMultilibs.assign({GCCInstallation.getMultilib()});
    llvm::Triple::ArchType Arch = Triple.getArch();
diff --git a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
index 2ad1130355b..7e2fca77831 100644
--- a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
+++ b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
@@ -1,4 +1,4 @@
-From 3edfe16c0d8bb3d135465038cb07c8122baac698 Mon Sep 17 00:00:00 2001
+From 04691d1155b246cb884162af863408ec1f471262 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 Mar 2017 19:06:26 -0700
 Subject: [PATCH] clang: Look inside the target sysroot for compiler runtime
@@ -16,18 +16,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain.cpp
-index acf9d264d631..3e46c88e95cb 100644
+index 07a3ae925f96..ec28b899f829 100644
 --- a/clang/lib/Driver/ToolChain.cpp
 +++ b/clang/lib/Driver/ToolChain.cpp
-@@ -16,6 +16,7 @@
+@@ -15,6 +15,7 @@
  #include "ToolChains/InterfaceStubs.h"
  #include "clang/Basic/ObjCRuntime.h"
  #include "clang/Basic/Sanitizers.h"
 +#include "clang/Basic/Version.h"
  #include "clang/Config/config.h"
  #include "clang/Driver/Action.h"
- #include "clang/Driver/Driver.h"
-@@ -708,7 +709,10 @@ StringRef ToolChain::getOSLibName() const {
+ #include "clang/Driver/CommonArgs.h"
+@@ -702,7 +703,10 @@ StringRef ToolChain::getOSLibName() const {
  }
  
  std::string ToolChain::getCompilerRTPath() const {
diff --git a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
index 346a4fcbb0e..27324a98087 100644
--- a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
+++ b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
@@ -1,4 +1,4 @@
-From dc2de98d70a763f30347df2d76df1c70cc464b87 Mon Sep 17 00:00:00 2001
+From 0e77812bc764279a619a3fdd92d9c1f008dfa95a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 20 Mar 2021 16:09:16 -0700
 Subject: [PATCH] clang: Define / releative gcc installation dir
@@ -61,18 +61,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 14 insertions(+), 8 deletions(-)
 
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index 9f7b9e8d42a8..268fb7bf7167 100644
+index 3565c9398f92..6c52b337c16d 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -19,6 +19,7 @@
- #include "Linux.h"
+@@ -18,6 +18,7 @@
  #include "clang/Config/config.h" // for GCC_INSTALL_PREFIX
+ #include "clang/Driver/CommonArgs.h"
  #include "clang/Driver/Compilation.h"
 +#include "clang/Driver/Distro.h"
  #include "clang/Driver/Driver.h"
- #include "clang/Driver/DriverDiagnostic.h"
  #include "clang/Driver/MultilibBuilder.h"
-@@ -2860,6 +2861,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
+ #include "clang/Driver/Options.h"
+@@ -2798,6 +2799,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
      const llvm::Triple &TargetTriple, const ArgList &Args,
      const std::string &LibDir, StringRef CandidateTriple,
      bool NeedsBiarchSuffix, bool GCCDirExists, bool GCCCrossDirExists) {
@@ -80,7 +80,7 @@ index 9f7b9e8d42a8..268fb7bf7167 100644
    // Locations relative to the system lib directory where GCC's triple-specific
    // directories might reside.
    struct GCCLibSuffix {
-@@ -2871,19 +2873,20 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
+@@ -2809,19 +2811,20 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
      // Whether this library suffix is relevant for the triple.
      bool Active;
    } Suffixes[] = {
@@ -108,7 +108,7 @@ index 9f7b9e8d42a8..268fb7bf7167 100644
  
    for (auto &Suffix : Suffixes) {
      if (!Suffix.Active)
-@@ -3274,8 +3277,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::opt::ArgList &DriverArgs,
+@@ -3212,8 +3215,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::opt::ArgList &DriverArgs,
    // incompatible with the NDK libraries.
    SmallString<128> DriverIncludeDir(getDriver().Dir);
    llvm::sys::path::append(DriverIncludeDir, "..", "include");
diff --git a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
index 25dade43897..2fc967a79f7 100644
--- a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
+++ b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
@@ -1,4 +1,4 @@
-From 0712b0f0fa8c9cf27016e8b1ef8391f6c9cfa4ff Mon Sep 17 00:00:00 2001
+From 3dd872e76d8ee8b9db384051115b7bb6679960b4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Jul 2019 22:51:39 -0700
 Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for static
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/clang/lib/Driver/ToolChains/CommonArgs.cpp b/clang/lib/Driver/ToolChains/CommonArgs.cpp
-index ae635fb6a180..255e7e0b7150 100644
+index 8d3775de9be5..d34b4d680c5e 100644
 --- a/clang/lib/Driver/ToolChains/CommonArgs.cpp
 +++ b/clang/lib/Driver/ToolChains/CommonArgs.cpp
-@@ -2254,6 +2254,8 @@ static void AddUnwindLibrary(const ToolChain &TC, const Driver &D,
+@@ -2326,6 +2326,8 @@ static void AddUnwindLibrary(const ToolChain &TC, const Driver &D,
          CmdArgs.push_back("-lunwind");
      } else if (LGT == LibGccType::StaticLibGcc) {
        CmdArgs.push_back("-l:libunwind.a");
diff --git a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
index b55740e0d61..1c2867ba898 100644
--- a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
+++ b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
@@ -1,4 +1,4 @@
-From a6055a858f6e54cac2b427101fb43c83599b9072 Mon Sep 17 00:00:00 2001
+From a338c2ae924451e869b593f66fc67040169c0a43 Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 26 Dec 2019 12:56:16 -0800
 Subject: [PATCH] Pass PYTHON_EXECUTABLE when cross compiling for native build
@@ -11,13 +11,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/llvm/cmake/modules/CrossCompile.cmake b/llvm/cmake/modules/CrossCompile.cmake
-index 3b31d3e218a3..a07ab45878fd 100644
+index bfbd9cfd4063..2a69c5133c56 100644
 --- a/llvm/cmake/modules/CrossCompile.cmake
 +++ b/llvm/cmake/modules/CrossCompile.cmake
-@@ -100,6 +100,7 @@ function(llvm_create_cross_target project_name target_name toolchain buildtype)
-         -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN="${LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN}"
+@@ -101,6 +101,7 @@ function(llvm_create_cross_target project_name target_name toolchain buildtype)
          -DLLVM_INCLUDE_BENCHMARKS=OFF
          -DLLVM_INCLUDE_TESTS=OFF
+         -DLLVM_TABLEGEN_FLAGS="${LLVM_TABLEGEN_FLAGS}"
 +        -DPYTHON_EXECUTABLE="${PYTHON_EXECUTABLE}"
          ${build_type_flags} ${linker_flag} ${external_clang_dir} ${libc_flags}
          ${ARGN}
diff --git a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
index 99952fe1826..e635cc2c3be 100644
--- a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
+++ b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
@@ -1,4 +1,4 @@
-From c9e8942cace57d9d222e8f005408631e1cd06c5c Mon Sep 17 00:00:00 2001
+From 8b96f0b76e328e877707ab343703f5a7372de016 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 18 Nov 2019 17:00:29 -0800
 Subject: [PATCH] Check for atomic<double> intrinsics
diff --git a/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
index f6df85538df..b99d4a36e8b 100644
--- a/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
+++ b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
@@ -1,4 +1,4 @@
-From a6bf17d7eb64bd7beabc73b5fe319b7a375bbcce Mon Sep 17 00:00:00 2001
+From 2df5d92a84396aeca1689e17a97e16a337a8a5df Mon Sep 17 00:00:00 2001
 From: Ovidiu Panait <ovidiu.panait@windriver.com>
 Date: Fri, 31 Jan 2020 10:56:11 +0200
 Subject: [PATCH] cmake: Fix configure for packages using find_package()
@@ -31,7 +31,7 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
  3 files changed, 2 insertions(+), 15 deletions(-)
 
 diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules/AddClang.cmake
-index cdc8bd5cd503..5faa9117a30f 100644
+index 4059fc3e986c..44d43aa8f25b 100644
 --- a/clang/cmake/modules/AddClang.cmake
 +++ b/clang/cmake/modules/AddClang.cmake
 @@ -182,7 +182,6 @@ macro(add_clang_tool name)
@@ -42,7 +42,7 @@ index cdc8bd5cd503..5faa9117a30f 100644
          RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
          COMPONENT ${name})
  
-@@ -191,7 +190,6 @@ macro(add_clang_tool name)
+@@ -195,7 +194,6 @@ macro(add_clang_tool name)
                                   DEPENDS ${name}
                                   COMPONENT ${name})
        endif()
@@ -51,18 +51,18 @@ index cdc8bd5cd503..5faa9117a30f 100644
    endif()
    set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEME ON)
 diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/AddLLVM.cmake
-index d3e9377c8d2f..fe22d6f2b35a 100644
+index 83772ed8d2b1..1d184b8d613f 100644
 --- a/llvm/cmake/modules/AddLLVM.cmake
 +++ b/llvm/cmake/modules/AddLLVM.cmake
-@@ -1492,7 +1492,6 @@ macro(llvm_add_tool project name)
+@@ -1495,7 +1495,6 @@ macro(llvm_add_tool project name)
        if( LLVM_BUILD_TOOLS )
          get_target_export_arg(${name} ${project} export_to_llvmexports)
          install(TARGETS ${name}
 -                ${export_to_llvmexports}
                  RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
                  COMPONENT ${name})
- 
-@@ -1503,10 +1502,8 @@ macro(llvm_add_tool project name)
+         if (LLVM_ENABLE_PDB)
+@@ -1511,10 +1510,8 @@ macro(llvm_add_tool project name)
          endif()
        endif()
      endif()
@@ -75,15 +75,15 @@ index d3e9377c8d2f..fe22d6f2b35a 100644
    endif()
    get_subproject_title(subproject_title)
    set_target_properties(${name} PROPERTIES FOLDER "${subproject_title}/Tools")
-@@ -1556,7 +1553,6 @@ macro(add_llvm_utility name)
+@@ -1569,7 +1566,6 @@ macro(add_llvm_utility name)
      if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
        get_target_export_arg(${name} LLVM export_to_llvmexports)
        install(TARGETS ${name}
 -              ${export_to_llvmexports}
                RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
                COMPONENT ${name})
- 
-@@ -1565,7 +1561,6 @@ macro(add_llvm_utility name)
+       if (LLVM_ENABLE_PDB)
+@@ -1583,7 +1579,6 @@ macro(add_llvm_utility name)
                                   DEPENDS ${name}
                                   COMPONENT ${name})
        endif()
@@ -92,10 +92,10 @@ index d3e9377c8d2f..fe22d6f2b35a 100644
        set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY ${name})
      endif()
 diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/TableGen.cmake
-index ffcc718b4777..a76f28e74b86 100644
+index 9a2e73a1e371..149c94487edb 100644
 --- a/llvm/cmake/modules/TableGen.cmake
 +++ b/llvm/cmake/modules/TableGen.cmake
-@@ -232,12 +232,7 @@ macro(add_tablegen target project)
+@@ -227,12 +227,7 @@ macro(add_tablegen target project)
  
    if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AND
        (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DISTRIBUTION_COMPONENTS))
@@ -108,10 +108,11 @@ index ffcc718b4777..a76f28e74b86 100644
              COMPONENT ${target}
              RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
      if(NOT LLVM_ENABLE_IDE)
-@@ -248,6 +243,5 @@ macro(add_tablegen target project)
+@@ -243,7 +238,6 @@ macro(add_tablegen target project)
    endif()
    if(ADD_TABLEGEN_EXPORT)
      string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
 -    set_property(GLOBAL APPEND PROPERTY ${export_upper}_EXPORTS ${target})
    endif()
  endmacro()
+ 
diff --git a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
index 4841d6c1bc3..df2f8cca2f7 100644
--- a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
+++ b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
@@ -1,4 +1,4 @@
-From f3c6f924525179ca190fecce2889997250ca8705 Mon Sep 17 00:00:00 2001
+From 45d866a863dc78f33104c5c265557886e6f27b45 Mon Sep 17 00:00:00 2001
 From: Jim Broadus <jbroadus@xevo.com>
 Date: Thu, 26 Mar 2020 16:05:53 -0700
 Subject: [PATCH] clang: Fix resource dir location for cross toolchains
@@ -20,10 +20,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
-index 87855fdb7997..036c9d09df26 100644
+index 55748c0bce91..306716809f54 100644
 --- a/clang/lib/Driver/Driver.cpp
 +++ b/clang/lib/Driver/Driver.cpp
-@@ -176,6 +176,7 @@ std::string Driver::GetResourcesPath(StringRef BinaryPath) {
+@@ -188,6 +188,7 @@ std::string Driver::GetResourcesPath(StringRef BinaryPath) {
  
    // Dir is bin/ or lib/, depending on where BinaryPath is.
    StringRef Dir = llvm::sys::path::parent_path(BinaryPath);
@@ -31,7 +31,7 @@ index 87855fdb7997..036c9d09df26 100644
    SmallString<128> P(Dir);
  
    StringRef ConfiguredResourceDir(CLANG_RESOURCE_DIR);
-@@ -187,9 +188,15 @@ std::string Driver::GetResourcesPath(StringRef BinaryPath) {
+@@ -204,9 +205,15 @@ std::string Driver::GetResourcesPath(StringRef BinaryPath) {
      // With a static-library build of libclang, LibClangPath will contain the
      // path of the embedding binary, which for LLVM binaries will be in bin/.
      // ../lib gets us to lib/ in both cases.
diff --git a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
index 6bbbb5a2598..e0b38f10bb8 100644
--- a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
+++ b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
@@ -1,4 +1,4 @@
-From 7c70f891fb94f2d8c88bc6af4514d8dcd6488658 Mon Sep 17 00:00:00 2001
+From 887bddb6654d942842b2c81f0b726592d27f6be8 Mon Sep 17 00:00:00 2001
 From: Oleksandr Ocheretnyi <oocheret@cisco.com>
 Date: Wed, 15 Apr 2020 00:08:39 +0300
 Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot for ldso
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index 621fa17e0603..8fd454d4eff4 100644
+index 67e922e08228..3ee2d56df00f 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -525,8 +525,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -517,8 +517,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
  
      Loader = HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
      LibDir = "lib32";
@@ -33,7 +33,7 @@ index 621fa17e0603..8fd454d4eff4 100644
          LibDir = "lib";
      }
      break;
-@@ -582,8 +582,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -574,8 +574,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
      LibDir = "lib64";
      Loader =
          (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.so.1";
@@ -44,7 +44,7 @@ index 621fa17e0603..8fd454d4eff4 100644
          LibDir = "lib";
      }
      break;
-@@ -591,8 +591,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -583,8 +583,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
      LibDir = "lib64";
      Loader =
          (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" : "ld64.so.2";
@@ -55,7 +55,7 @@ index 621fa17e0603..8fd454d4eff4 100644
          LibDir = "lib";
      }
      break;
-@@ -612,8 +612,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -604,8 +604,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
    case llvm::Triple::sparcv9:
      LibDir = "lib64";
      Loader = "ld-linux.so.2";
@@ -66,7 +66,7 @@ index 621fa17e0603..8fd454d4eff4 100644
          LibDir = "lib";
      }
      break;
-@@ -630,8 +630,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -622,8 +622,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
  
      LibDir = X32 ? "libx32" : "lib64";
      Loader = X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
diff --git a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
index 8677c5ca134..6db3857d42e 100644
--- a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
@@ -1,4 +1,4 @@
-From f06bb3e20e47ab5a76efa76f50f0bbef682cd263 Mon Sep 17 00:00:00 2001
+From 9ffa9959c6ebe18527129e6a41c4cdda279ef501 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 14 Oct 2020 22:19:57 -0700
 Subject: [PATCH] clang: Use python3 in python scripts
diff --git a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
index 7ae88b870d5..71d2da47748 100644
--- a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
+++ b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
@@ -1,4 +1,4 @@
-From cfe5ec616f1bbbe7d20409b552428e43e282f115 Mon Sep 17 00:00:00 2001
+From 26b241706a61448a49fcfca5b15683f75735f9c8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 25 Jan 2021 16:14:35 +0800
 Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor names
@@ -97,7 +97,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clang/Driver/Distro.h
-index c544a8c00219..3cd687ede458 100644
+index 5c25592e68ad..122095f98bca 100644
 --- a/clang/include/clang/Driver/Distro.h
 +++ b/clang/include/clang/Driver/Distro.h
 @@ -47,6 +47,7 @@ public:
@@ -108,7 +108,7 @@ index c544a8c00219..3cd687ede458 100644
      OpenSUSE,
      UbuntuHardy,
      UbuntuIntrepid,
-@@ -141,6 +142,7 @@ public:
+@@ -142,6 +143,7 @@ public:
  
    bool IsGentoo() const { return DistroVal == Gentoo; }
  
@@ -117,7 +117,7 @@ index c544a8c00219..3cd687ede458 100644
  };
  
 diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
-index 71ba71fa1837..f64d0abddf6d 100644
+index 90e5a390be7e..1246236d62ef 100644
 --- a/clang/lib/Driver/Distro.cpp
 +++ b/clang/lib/Driver/Distro.cpp
 @@ -43,6 +43,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs::FileSystem &VFS) {
@@ -129,10 +129,10 @@ index 71ba71fa1837..f64d0abddf6d 100644
    return Version;
  }
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index 268fb7bf7167..868d32f501e8 100644
+index 6c52b337c16d..df84e07da1fc 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -2452,6 +2452,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
+@@ -2374,6 +2374,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
        "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
        "x86_64-redhat-linux",    "x86_64-suse-linux",
        "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
@@ -141,10 +141,10 @@ index 268fb7bf7167..868d32f501e8 100644
    static const char *const X32Triples[] = {"x86_64-linux-gnux32",
                                             "x86_64-pc-linux-gnux32"};
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index 8fd454d4eff4..fb9d433a80be 100644
+index 3ee2d56df00f..bb7270bb08ba 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -82,6 +82,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+@@ -81,6 +81,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
        return "x86_64-linux-android";
      if (TargetEnvironment == llvm::Triple::GNUX32)
        return "x86_64-linux-gnux32";
@@ -153,10 +153,10 @@ index 8fd454d4eff4..fb9d433a80be 100644
    case llvm::Triple::aarch64:
      if (IsAndroid)
 diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Triple.cpp
-index e9e6f130f757..97f426dd863b 100644
+index 0584c941d2e6..6b9567ad0b8d 100644
 --- a/llvm/lib/TargetParser/Triple.cpp
 +++ b/llvm/lib/TargetParser/Triple.cpp
-@@ -663,7 +663,7 @@ static Triple::VendorType parseVendor(StringRef VendorName) {
+@@ -668,7 +668,7 @@ static Triple::VendorType parseVendor(StringRef VendorName) {
        .Case("mesa", Triple::Mesa)
        .Case("suse", Triple::SUSE)
        .Case("oe", Triple::OpenEmbedded)
diff --git a/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
index 05937b06c1d..f58427c0337 100644
--- a/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
+++ b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
@@ -1,4 +1,4 @@
-From 4a23e833e66896f40bb36c3c13b4a4bb1b79162f Mon Sep 17 00:00:00 2001
+From 50ed4a22ab3b8e2e9d6c0175133e5aa35ffa9e92 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 May 2021 17:32:13 -0700
 Subject: [PATCH] compiler-rt: Do not use backtrace APIs on non-glibc linux
diff --git a/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch b/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
index 7ce60e0efd0..3116d7cf634 100644
--- a/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
+++ b/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
@@ -1,4 +1,4 @@
-From 739e65a126178e4c4d8452297ac13c119ae79403 Mon Sep 17 00:00:00 2001
+From fd360e4c6e70a867e839c7d3237354d52c75a4ce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 May 2021 17:56:03 -0700
 Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux distros
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index fb9d433a80be..ee0b4acbcef0 100644
+index bb7270bb08ba..6354c4d06570 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -728,6 +728,9 @@ void Linux::addLibStdCxxIncludePaths(const llvm::opt::ArgList &DriverArgs,
+@@ -720,6 +720,9 @@ void Linux::addLibStdCxxIncludePaths(const llvm::opt::ArgList &DriverArgs,
        GCCInstallation.getTriple().getArch() == llvm::Triple::x86
            ? "i386-linux-gnu"
            : TripleStr;
diff --git a/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch b/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
index fe7157df47c..0e64bae62bb 100644
--- a/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
+++ b/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
@@ -1,4 +1,4 @@
-From f60c6ade92826cea1c3d63d70f1168f4048a624b Mon Sep 17 00:00:00 2001
+From 54545081ecd42df9c4a0f2dffe629e95c18ce701 Mon Sep 17 00:00:00 2001
 From: Maksim Kita <maksim-kita@yandex-team.ru>
 Date: Sun, 23 May 2021 10:27:29 +0000
 Subject: [PATCH] libunwind: Added unw_backtrace method
diff --git a/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch b/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
index 128666b8fbd..79a0ea43e22 100644
--- a/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
+++ b/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
@@ -1,4 +1,4 @@
-From 45d44576a0dbaf843a9795519cafa944801c4679 Mon Sep 17 00:00:00 2001
+From fc52c73be9ca2143720be9881b78954132588aee Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Feb 2022 01:31:26 -0800
 Subject: [PATCH] lldb: Link with libatomic on x86
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/lldb/source/Utility/CMakeLists.txt b/lldb/source/Utility/CMakeLists.txt
-index 6954a2508ffe..b8bf8c07fefb 100644
+index 1dd4d63f7016..8821b73be476 100644
 --- a/lldb/source/Utility/CMakeLists.txt
 +++ b/lldb/source/Utility/CMakeLists.txt
 @@ -19,6 +19,10 @@ if (CMAKE_SYSTEM_NAME MATCHES "Windows")
diff --git a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch b/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
index 861064f4f49..ce9cfb2465e 100644
--- a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
+++ b/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
@@ -1,4 +1,4 @@
-From b676d7d93fa35e095595fc1f967e4c6a3b58414b Mon Sep 17 00:00:00 2001
+From 7b690ce5d96bbd80f0f300e6f57a4be46073af76 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Mar 2022 16:28:16 -0800
 Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/builtins/CMakeLists.txt
-index 19316c52d12c..cb276311b290 100644
+index 3ab92403d416..9c1148e2a8e3 100644
 --- a/compiler-rt/lib/builtins/CMakeLists.txt
 +++ b/compiler-rt/lib/builtins/CMakeLists.txt
-@@ -720,11 +720,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}
+@@ -752,11 +752,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}
  
  set(nvptx64_SOURCES ${GENERIC_SOURCES})
  
@@ -27,7 +27,7 @@ index 19316c52d12c..cb276311b290 100644
    ppc/divtc3.c
    ppc/fixtfdi.c
    ppc/fixunstfdi.c
-@@ -739,14 +737,15 @@ set(powerpc64_SOURCES
+@@ -771,14 +769,15 @@ set(powerpc64_SOURCES
  )
  # These routines require __int128, which isn't supported on AIX.
  if (NOT OS_NAME MATCHES "AIX")
@@ -46,7 +46,7 @@ index 19316c52d12c..cb276311b290 100644
  
  set(riscv_SOURCES
    cpu_model/riscv.c
-@@ -904,9 +903,9 @@ else ()
+@@ -948,9 +947,9 @@ else ()
          list(APPEND BUILTIN_CFLAGS_${arch} -fomit-frame-pointer -DCOMPILER_RT_ARMHF_TARGET)
        endif()
  
@@ -59,7 +59,7 @@ index 19316c52d12c..cb276311b290 100644
        endif()
  
 diff --git a/compiler-rt/lib/builtins/int_types.h b/compiler-rt/lib/builtins/int_types.h
-index 48862f364217..cc47d3e33f67 100644
+index 7c7f8cb64aa9..81386f1b99b0 100644
 --- a/compiler-rt/lib/builtins/int_types.h
 +++ b/compiler-rt/lib/builtins/int_types.h
 @@ -64,7 +64,7 @@ typedef union {
diff --git a/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch b/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
index d49af8aeb9e..53ee3b0016c 100644
--- a/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
+++ b/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
@@ -1,4 +1,4 @@
-From 9cf5cc6d4378ad7918f338aa65ce79178d8a84f2 Mon Sep 17 00:00:00 2001
+From 2b05b864651cb3bc611435ccbf8d4e4ba15ca62b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Aug 2022 11:50:57 -0700
 Subject: [PATCH] llvm: Do not use cmake infra to detect libzstd
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/llvm/lib/Support/CMakeLists.txt b/llvm/lib/Support/CMakeLists.txt
-index a6d8a2581886..5b461547bdde 100644
+index a579eaf7d953..6eba2b7a8e6c 100644
 --- a/llvm/lib/Support/CMakeLists.txt
 +++ b/llvm/lib/Support/CMakeLists.txt
 @@ -22,7 +22,7 @@ if (HAS_WERROR_GLOBAL_CTORS)
@@ -42,7 +42,7 @@ index a6d8a2581886..5b461547bdde 100644
  endif()
  
  if( WIN32 )
-@@ -325,7 +325,7 @@ if(LLVM_ENABLE_ZLIB)
+@@ -339,7 +339,7 @@ if(LLVM_ENABLE_ZLIB)
      get_property(zlib_library TARGET ZLIB::ZLIB PROPERTY LOCATION)
    endif()
    get_library_name(${zlib_library} zlib_library)
@@ -51,7 +51,7 @@ index a6d8a2581886..5b461547bdde 100644
  endif()
  
  if(LLVM_ENABLE_ZSTD)
-@@ -339,7 +339,7 @@ if(LLVM_ENABLE_ZSTD)
+@@ -353,7 +353,7 @@ if(LLVM_ENABLE_ZSTD)
    endif()
    if (zstd_target STREQUAL zstd::libzstd_shared)
      get_library_name(${zstd_library} zstd_library)
diff --git a/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch b/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
index bca28cd7dbc..8d5708bac84 100644
--- a/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
+++ b/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
@@ -1,4 +1,4 @@
-From 744dbb6cf6925796e2bc5c028af08c40445bbb1c Mon Sep 17 00:00:00 2001
+From d0cba62df8273177d9fbbb586e786e40cd8fea6e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Jan 2023 18:44:34 -0800
 Subject: [PATCH] compiler-rt: Fix stat struct's size for O32 ABI
@@ -14,13 +14,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+)
 
 diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
-index 1a7d9e64048e..854a87e17236 100644
+index f118d53f0df8..c72814288990 100644
 --- a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
 +++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
 @@ -98,6 +98,18 @@ const unsigned struct_kernel_stat64_sz = 104;
  const unsigned struct_kernel_stat_sz = 144;
  const unsigned struct_kernel_stat64_sz = 104;
- #elif defined(__mips__)
+ #    elif defined(__mips__)
 +#if defined(__mips_o32) // O32 ABI
 +#if _TIME_BITS == 64
 +const unsigned struct_kernel_stat_sz = 112;
@@ -32,15 +32,15 @@ index 1a7d9e64048e..854a87e17236 100644
 +const unsigned struct_kernel_stat_sz = 144;
 +const unsigned struct_kernel_stat64_sz = 160;
 +#endif
-+#else // __mips_o32
++#else //__mips_o32
  const unsigned struct_kernel_stat_sz = SANITIZER_ANDROID
                                             ? FIRST_32_SECOND_64(104, 128)
  #      if defined(_ABIN32) && _MIPS_SIM == _ABIN32
-@@ -106,6 +118,7 @@ const unsigned struct_kernel_stat_sz = SANITIZER_ANDROID
+@@ -108,6 +120,7 @@ const unsigned struct_kernel_stat_sz = SANITIZER_ANDROID
                                             : FIRST_32_SECOND_64(160, 216);
  #      endif
  const unsigned struct_kernel_stat64_sz = 104;
 +#endif
- #elif defined(__s390__) && !defined(__s390x__)
+ #    elif defined(__s390__) && !defined(__s390x__)
  const unsigned struct_kernel_stat_sz = 64;
  const unsigned struct_kernel_stat64_sz = 104;
diff --git a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
index e129aa245db..376733e07fd 100644
--- a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
+++ b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
@@ -1,4 +1,4 @@
-From 6b6a518bc7686af7680f45fcdea7c414a22a2f53 Mon Sep 17 00:00:00 2001
+From 20d83be701fe5fd03bbbd8352400179b74563ba7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 21 Feb 2023 12:46:10 -0800
 Subject: [PATCH] compiler-rt: Undef _TIME_BITS along with _FILE_OFFSET_BITS in
@@ -22,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
-index 57966403c92a..efa83f30eca0 100644
+index 13099fe84b0a..8fea7a260c3a 100644
 --- a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
 +++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
-@@ -22,6 +22,15 @@
+@@ -23,6 +23,15 @@
  // function declarations into a .S file which doesn't compile.
  // https://crbug.com/1162741
  #if __has_include(<features.h>) && !defined(__ANDROID__)
diff --git a/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch b/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
index b6852a124d7..5467fb2b681 100644
--- a/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
+++ b/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
@@ -1,4 +1,4 @@
-From a83b407a9c1b04d95e6cda74059744fe815fde17 Mon Sep 17 00:00:00 2001
+From 7ee4e023df4661e96d5132855165a1d79cb77736 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 31 Aug 2023 18:14:47 +0200
 Subject: [PATCH] ToolChains/Gnu.cpp: ARMLibDirs search also in lib32
@@ -55,10 +55,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index 868d32f501e8..beed8d34a127 100644
+index df84e07da1fc..21c8a30719e0 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -2428,7 +2428,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
+@@ -2350,7 +2350,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
    static const char *const AArch64beLibDirs[] = {"/lib"};
    static const char *const AArch64beTriples[] = {"aarch64_be-none-linux-gnu"};
  
@@ -68,10 +68,10 @@ index 868d32f501e8..beed8d34a127 100644
    static const char *const ARMHFTriples[] = {"arm-linux-gnueabihf",
                                               "armv7hl-redhat-linux-gnueabi",
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index ee0b4acbcef0..b02409fd72ee 100644
+index 6354c4d06570..c77337561b89 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -199,6 +199,7 @@ static StringRef getOSLibDir(const llvm::Triple &Triple, const ArgList &Args) {
+@@ -198,6 +198,7 @@ static StringRef getOSLibDir(const llvm::Triple &Triple, const ArgList &Args) {
    // reasoning about oslibdir spellings with the lib dir spellings in the
    // GCCInstallationDetector, but that is a more significant refactoring.
    if (Triple.getArch() == llvm::Triple::x86 || Triple.isPPC32() ||
diff --git a/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch b/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
index 0136039358e..518aeb2fd58 100644
--- a/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
+++ b/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
@@ -1,4 +1,4 @@
-From 3572a4425844ef77131fd2635ea570eafc1df958 Mon Sep 17 00:00:00 2001
+From cbd5f24fd6095f69134cb5536f8187e7264ceaa0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 3 Feb 2024 16:47:10 -0800
 Subject: [PATCH] clang/llvm: Add OE specific ABI triple for N32 ABI
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index beed8d34a127..c47b93a4e142 100644
+index 21c8a30719e0..3a0f1a247481 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -2491,6 +2491,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
+@@ -2413,6 +2413,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
  
    static const char *const MIPSN32LibDirs[] = {"/lib32"};
    static const char *const MIPSN32Triples[] = {"mips64-linux-gnuabin32",
@@ -26,10 +26,10 @@ index beed8d34a127..c47b93a4e142 100644
    static const char *const MIPSN32ELLibDirs[] = {"/lib32"};
    static const char *const MIPSN32ELTriples[] = {
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index b02409fd72ee..4999b0fc17a6 100644
+index c77337561b89..9a7f8ffd72e2 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -139,7 +139,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+@@ -138,7 +138,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
      return IsMipsR6 ? "mipsisa32r6el-linux-gnu" : "mipsel-linux-gnu";
    case llvm::Triple::mips64: {
      std::string MT = std::string(IsMipsR6 ? "mipsisa64r6" : "mips64") +
@@ -38,7 +38,7 @@ index b02409fd72ee..4999b0fc17a6 100644
      if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
        return MT;
      if (D.getVFS().exists(concat(SysRoot, "/lib/mips64-linux-gnu")))
-@@ -148,7 +148,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+@@ -147,7 +147,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
    }
    case llvm::Triple::mips64el: {
      std::string MT = std::string(IsMipsR6 ? "mipsisa64r6el" : "mips64el") +
@@ -48,10 +48,10 @@ index b02409fd72ee..4999b0fc17a6 100644
        return MT;
      if (D.getVFS().exists(concat(SysRoot, "/lib/mips64el-linux-gnu")))
 diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Triple.cpp
-index 97f426dd863b..dc57d5ff2d4a 100644
+index 6b9567ad0b8d..6eafade97808 100644
 --- a/llvm/lib/TargetParser/Triple.cpp
 +++ b/llvm/lib/TargetParser/Triple.cpp
-@@ -336,7 +336,7 @@ StringRef Triple::getEnvironmentTypeName(EnvironmentType Kind) {
+@@ -339,7 +339,7 @@ StringRef Triple::getEnvironmentTypeName(EnvironmentType Kind) {
    case GNU: return "gnu";
    case GNUT64: return "gnut64";
    case GNUABI64: return "gnuabi64";
@@ -60,7 +60,7 @@ index 97f426dd863b..dc57d5ff2d4a 100644
    case GNUEABI: return "gnueabi";
    case GNUEABIT64: return "gnueabit64";
    case GNUEABIHF: return "gnueabihf";
-@@ -719,6 +719,7 @@ static Triple::EnvironmentType parseEnvironment(StringRef EnvironmentName) {
+@@ -725,6 +725,7 @@ static Triple::EnvironmentType parseEnvironment(StringRef EnvironmentName) {
        .StartsWith("eabihf", Triple::EABIHF)
        .StartsWith("eabi", Triple::EABI)
        .StartsWith("gnuabin32", Triple::GNUABIN32)
@@ -68,7 +68,7 @@ index 97f426dd863b..dc57d5ff2d4a 100644
        .StartsWith("gnuabi64", Triple::GNUABI64)
        .StartsWith("gnueabihft64", Triple::GNUEABIHFT64)
        .StartsWith("gnueabihf", Triple::GNUEABIHF)
-@@ -1035,6 +1036,7 @@ Triple::Triple(const Twine &Str)
+@@ -1039,6 +1040,7 @@ Triple::Triple(std::string &&Str) : Data(std::move(Str)) {
        Environment =
            StringSwitch<Triple::EnvironmentType>(Components[0])
                .StartsWith("mipsn32", Triple::GNUABIN32)
diff --git a/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
index a42ac2484d7..1545e6b9ec1 100644
--- a/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
@@ -1,4 +1,4 @@
-From e5223f6013c7c70a7f6e35ecec046cfdc0c15c2a Mon Sep 17 00:00:00 2001
+From c4ebc0b6347886e679aa211a3fa3816be9b2fd52 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2024 22:04:43 -0700
 Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
diff --git a/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch b/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
index 85d3ce9ed38..b37661aff48 100644
--- a/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
+++ b/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
@@ -1,4 +1,4 @@
-From 3f03bd4a5a16f2b5525f4dc32c7b196840b96856 Mon Sep 17 00:00:00 2001
+From 36b051141be917a466fbc26b140b3ba268d82468 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Fri, 13 Sep 2024 13:38:08 +0200
 Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other tools do
diff --git a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch b/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
index 621c3653f04..5483638d12c 100644
--- a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
+++ b/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
@@ -1,4 +1,4 @@
-From 518c0025921b0bd21e69bf4c38f369778032f4e0 Mon Sep 17 00:00:00 2001
+From c4da3b294284213bad523c47a9ab1825175ccda6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Mar 2025 00:30:38 -0700
 Subject: [PATCH] compiler-rt: Do not pass --target to clang compiler
diff --git a/meta/recipes-devtools/clang/clang/0033-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/clang/clang/0032-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
similarity index 89%
rename from meta/recipes-devtools/clang/clang/0033-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
rename to meta/recipes-devtools/clang/clang/0032-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index 1901efeae4d..416f29804da 100644
--- a/meta/recipes-devtools/clang/clang/0033-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/clang/clang/0032-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 9e389e1dc73a2f5601cfbab34249aedffd053235 Mon Sep 17 00:00:00 2001
+From 222b03ed7a0549e7cdbe67a37b6f965f93d3d8fe Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 7684387d80fe..d225a3b6dfa9 100644
+index bfd158614ae3..7b1a0ec686da 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -361,7 +361,10 @@ public:
+@@ -362,7 +362,10 @@ public:
      // name of a class shouldn't be significant. However, some of the backends
      // accidentally rely on this behaviour, so it will have to stay like this
      // until they are fixed.
diff --git a/meta/recipes-devtools/clang/clang/0032-clangd-Add-a-build-option-to-disable-building-dexp.patch b/meta/recipes-devtools/clang/clang/0032-clangd-Add-a-build-option-to-disable-building-dexp.patch
deleted file mode 100644
index 3e0603477e1..00000000000
--- a/meta/recipes-devtools/clang/clang/0032-clangd-Add-a-build-option-to-disable-building-dexp.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 12abcd058e2aa468054708b0ca7a06f2638eabab Mon Sep 17 00:00:00 2001
-From: Yoann Congal <yoann.congal@smile.fr>
-Date: Tue, 25 Mar 2025 22:25:55 +0100
-Subject: [PATCH] clangd: Add a build option to disable building dexp
-
-Building dexp on Debian 11 currently causes intermittent failure[0][1].
-
-Adding the CLANGD_BUILD_DEXP option to disable dexp from the build
-allows Debian 11 users to build clang (albeit without the dexp tool).
-
-This option is set to "Build Dexp" by default so, no change is expected
-without manual setting.
-
-[0]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15803
-[1]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1101322
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/133124]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- clang-tools-extra/clangd/CMakeLists.txt          | 8 +++++++-
- clang-tools-extra/clangd/test/CMakeLists.txt     | 7 +++++--
- clang-tools-extra/clangd/test/lit.site.cfg.py.in | 1 +
- 3 files changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
-index 6f10afe4a562..a1e9da41b4b3 100644
---- a/clang-tools-extra/clangd/CMakeLists.txt
-+++ b/clang-tools-extra/clangd/CMakeLists.txt
-@@ -210,6 +210,9 @@ if (CLANGD_ENABLE_REMOTE)
-   include(AddGRPC)
- endif()
- 
-+option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
-+llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
-+
- if(CLANG_INCLUDE_TESTS)
-   add_subdirectory(test)
-   add_subdirectory(unittests)
-@@ -220,4 +223,7 @@ option(CLANGD_ENABLE_REMOTE "Use gRPC library to enable remote index support for
- set(GRPC_INSTALL_PATH "" CACHE PATH "Path to gRPC library manual installation.")
- 
- add_subdirectory(index/remote)
--add_subdirectory(index/dex/dexp)
-+
-+if(CLANGD_BUILD_DEXP)
-+  add_subdirectory(index/dex/dexp)
-+endif()
-diff --git a/clang-tools-extra/clangd/test/CMakeLists.txt b/clang-tools-extra/clangd/test/CMakeLists.txt
-index b51f461a4986..42fc3506641f 100644
---- a/clang-tools-extra/clangd/test/CMakeLists.txt
-+++ b/clang-tools-extra/clangd/test/CMakeLists.txt
-@@ -3,8 +3,6 @@ set(CLANGD_TEST_DEPS
-   ClangdTests
-   clangd-indexer
-   split-file
--  # No tests for it, but we should still make sure they build.
--  dexp
-   )
- 
- if(CLANGD_BUILD_XPC)
-@@ -12,6 +10,11 @@ if(CLANGD_BUILD_XPC)
-   list(APPEND CLANGD_TEST_DEPS ClangdXpcUnitTests)
- endif()
- 
-+if(CLANGD_BUILD_DEXP)
-+  # No tests for it, but we should still make sure they build.
-+  list(APPEND CLANGD_TEST_DEPS dexp)
-+endif()
-+
- if(CLANGD_ENABLE_REMOTE)
-   list(APPEND CLANGD_TEST_DEPS clangd-index-server clangd-index-server-monitor)
- endif()
-diff --git a/clang-tools-extra/clangd/test/lit.site.cfg.py.in b/clang-tools-extra/clangd/test/lit.site.cfg.py.in
-index 1fe7c8d0f324..a0bb3561e19e 100644
---- a/clang-tools-extra/clangd/test/lit.site.cfg.py.in
-+++ b/clang-tools-extra/clangd/test/lit.site.cfg.py.in
-@@ -15,6 +15,7 @@ config.llvm_shlib_dir = "@SHLIBDIR@"
- config.clangd_source_dir = "@CMAKE_CURRENT_SOURCE_DIR@/.."
- config.clangd_binary_dir = "@CMAKE_CURRENT_BINARY_DIR@/.."
- config.clangd_build_xpc = @CLANGD_BUILD_XPC@
-+config.clangd_build_dexp = @CLANGD_BUILD_DEXP@
- config.clangd_enable_remote = @CLANGD_ENABLE_REMOTE@
- config.clangd_tidy_checks = @CLANGD_TIDY_CHECKS@
- config.have_zlib = @LLVM_ENABLE_ZLIB@
diff --git a/meta/recipes-devtools/clang/clang/0034-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/clang/clang/0033-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
similarity index 93%
rename from meta/recipes-devtools/clang/clang/0034-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
rename to meta/recipes-devtools/clang/clang/0033-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
index 2618f5ac407..afd28fb8f5e 100644
--- a/meta/recipes-devtools/clang/clang/0034-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
+++ b/meta/recipes-devtools/clang/clang/0033-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
@@ -1,4 +1,4 @@
-From 81db296472e146995c3c5728981cdc0cc065ab9c Mon Sep 17 00:00:00 2001
+From 0bd04308858d0a5d582d54584e5c021e10fee1bb Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 2 Apr 2025 17:05:17 +0300
 Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index a739f0d8dbea..3120f95fba9d 100644
+index c092db81bb8f..a02cc25020a7 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
 @@ -542,7 +542,7 @@ int main(int argc, char **argv) {
diff --git a/meta/recipes-devtools/clang/clang/0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch b/meta/recipes-devtools/clang/clang/0034-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
similarity index 86%
rename from meta/recipes-devtools/clang/clang/0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
rename to meta/recipes-devtools/clang/clang/0034-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
index a7e5c5a859f..c409509d00f 100644
--- a/meta/recipes-devtools/clang/clang/0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
+++ b/meta/recipes-devtools/clang/clang/0034-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
@@ -1,7 +1,8 @@
-From d2360096db2da00121f4e653b39ca1f7eb2801eb Mon Sep 17 00:00:00 2001
+From 83994facdea30da795875b50a26d7f23035ae141 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 May 2025 14:03:12 -0700
-Subject: [PATCH] compiler-rt: Exclude sync_fetch_and_* for any pre-ARMv6 targets
+Subject: [PATCH] compiler-rt: Exclude sync_fetch_and_* for any pre-ARMv6
+ targets
 
 Sometimes builds may happen where ABI is not indidated by host_triple
 e.g. on Yocto the compiler used is called arm-poky-linux-gnueabi-clang
@@ -39,12 +40,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/builtins/CMakeLists.txt
-index cb276311b290..53a3cd1dc81f 100644
+index 9c1148e2a8e3..9a15606e1e22 100644
 --- a/compiler-rt/lib/builtins/CMakeLists.txt
 +++ b/compiler-rt/lib/builtins/CMakeLists.txt
-@@ -864,6 +864,18 @@ else ()
-       list(JOIN BUILTIN_CFLAGS " " CMAKE_REQUIRED_FLAGS)
-       set(CMAKE_REQUIRED_FLAGS "${TARGET_${arch}_CFLAGS} ${BUILTIN_CFLAGS_${arch}}")
+@@ -908,6 +908,18 @@ else ()
+         ${TARGET_${arch}_CFLAGS})
+       list(JOIN CMAKE_REQUIRED_FLAGS " " CMAKE_REQUIRED_FLAGS)
        message(STATUS "Performing additional configure checks with target flags: ${CMAKE_REQUIRED_FLAGS}")
 +      # For ARM archs, exclude any sync builtins if dmb or mcr p15, #0, r0, c7, c10, #5
 +      # is not supported
@@ -60,4 +61,4 @@ index cb276311b290..53a3cd1dc81f 100644
 +      endif()
        # For ARM archs, exclude any VFP builtins if VFP is not supported
        if (${arch} MATCHES "^(arm|armhf|armv7|armv7s|armv7k|armv7m|armv7em|armv8m.main|armv8.1m.main)$")
-         string(REPLACE ";" " " _TARGET_${arch}_CFLAGS "${TARGET_${arch}_CFLAGS}")
+         check_compile_definition(__ARM_FP "${CMAKE_C_FLAGS}" COMPILER_RT_HAS_${arch}_VFP)
diff --git a/meta/recipes-devtools/clang/clang/0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch b/meta/recipes-devtools/clang/clang/0035-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
rename to meta/recipes-devtools/clang/clang/0035-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
index b54c1638578..45d499e60f2 100644
--- a/meta/recipes-devtools/clang/clang/0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
+++ b/meta/recipes-devtools/clang/clang/0035-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
@@ -1,4 +1,4 @@
-From 9f88f2e4efa56e53c78f9b67775c71afa711a69c Mon Sep 17 00:00:00 2001
+From 6167af21af9a97fe10d6d5f69aacf7d9785a8fcf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 22 May 2025 21:50:45 -0700
 Subject: [PATCH] [compiler-rt] Hardcode uptr/sptr typedefs on Mips/Linux
diff --git a/meta/recipes-devtools/clang/clang/0035-openmp-Do-not-emit-date-and-time-into-generate-files.patch b/meta/recipes-devtools/clang/clang/0035-openmp-Do-not-emit-date-and-time-into-generate-files.patch
deleted file mode 100644
index f33d8851ea3..00000000000
--- a/meta/recipes-devtools/clang/clang/0035-openmp-Do-not-emit-date-and-time-into-generate-files.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c439de272b3f983c6d97b8f6fec0135323e3363c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 23 Apr 2025 11:52:48 -0700
-Subject: [PATCH] openmp: Do not emit date and time into generate files
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This improves reproducibility where the generated files do not
-contain time stamps e.g.
-
-//·The·file·was·generated·from·en_US.txt·by·message-converter.py·on·Wed·Apr·23·16:00:53·2025.·//
-./usr/src/debug/openmp/20.1.2/runtime/src/kmp_i18n_id.inc
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- openmp/runtime/tools/message-converter.py | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/openmp/runtime/tools/message-converter.py b/openmp/runtime/tools/message-converter.py
-index a493d64c1692..0bd5f929fab6 100644
---- a/openmp/runtime/tools/message-converter.py
-+++ b/openmp/runtime/tools/message-converter.py
-@@ -188,11 +188,10 @@ def insert_header(f, data, commentChar="//"):
-     f.write(
-         "{0} Do not edit this file! {0}\n"
-         "{0} The file was generated from"
--        " {1} by {2} on {3}. {0}\n\n".format(
-+        " {1} by {2} {0}\n\n".format(
-             commentChar,
-             os.path.basename(data.filename),
-             os.path.basename(__file__),
--            datetime.datetime.now().ctime(),
-         )
-     )
- 
diff --git a/meta/recipes-devtools/clang/clang/0036-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch b/meta/recipes-devtools/clang/clang/0036-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
new file mode 100644
index 00000000000..95cb9ce1e5e
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0036-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
@@ -0,0 +1,48 @@
+From cda45a69a5fa5cd4106be8588c7e33e8f6535e17 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Jul 2025 19:22:07 -0700
+Subject: [PATCH] clang: Use sysroot relative paths for getArchSpecificLibPaths
+ and getRuntimePath
+
+Clang's default sysroot implementation differs that what we do in OE,
+and we do it with gcc as well where we install c++ runtime headers in
+target sysroot, clang does not by default it puts them relative to its
+own installation and uses resourcedir to point to it. In order to solve
+this we have to raise this question with respective upstreams or rethink
+about how we package compiler runtime.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChain.cpp | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain.cpp
+index ec28b899f829..f4aafa7996a9 100644
+--- a/clang/lib/Driver/ToolChain.cpp
++++ b/clang/lib/Driver/ToolChain.cpp
+@@ -1001,7 +1001,10 @@ ToolChain::getTargetSubDirPath(StringRef BaseDir) const {
+ }
+ 
+ std::optional<std::string> ToolChain::getRuntimePath() const {
+-  SmallString<128> P(D.ResourceDir);
++  SmallString<128> P(D.SysRoot);
++  StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
++  llvm::sys::path::append(P, "/usr/", ClangLibdirBasename, "clang",
++                          CLANG_VERSION_STRING);
+   llvm::sys::path::append(P, "lib");
+   if (auto Ret = getTargetSubDirPath(P))
+     return Ret;
+@@ -1029,7 +1032,10 @@ ToolChain::path_list ToolChain::getArchSpecificLibPaths() const {
+   path_list Paths;
+ 
+   auto AddPath = [&](const ArrayRef<StringRef> &SS) {
+-    SmallString<128> Path(getDriver().ResourceDir);
++    SmallString<128> Path(getDriver().SysRoot);
++    StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
++    llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
++                            CLANG_VERSION_STRING);
+     llvm::sys::path::append(Path, "lib");
+     for (auto &S : SS)
+       llvm::sys::path::append(Path, S);
diff --git a/meta/recipes-devtools/clang/clang/0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch b/meta/recipes-devtools/clang/clang/0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
deleted file mode 100644
index fe2bd77b33f..00000000000
--- a/meta/recipes-devtools/clang/clang/0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 8c839483915183a9c1ca4f74646ca4f478900e77 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Apr 2025 19:51:19 -0700
-Subject: [PATCH] libunwind: Use +gcs instead of gcs target attribute
-
-__attribute__((target("gcs"))) does not work with gcc
-
-GCC-15 has added gcs intrinsics [1] but the syntax for enabling it is
-slightly different. This syntax works with clang too.
-
-With gcc15 compiler libunwind's check for this macros is succeeding and it
-ends up enabling 'gcs' by using function attribute, this works with clang
-but not with gcc but '+gcs' works with both
-
-We can see this in rust compiler bootstrap for aarch64/musl when system
-uses gcc15, it ends up with these errors
-
-Building libunwind.a for aarch64-poky-linux-musl
-cargo:warning=/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/src/UnwindLevel1.c:191:1: error: arch extension 'gcs' should be prefixed by '+'
-cargo:warning=  191 | unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exception *exception_object) {
-cargo:warning=      | ^~~~~~~~~~~~~
-cargo:warning=/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/src/UnwindLevel1.c:337:22: error: arch extension 'gcs' should be prefixed by '+'
-cargo:warning=  337 |                      _Unwind_Stop_Fn stop, void *stop_parameter) {
-cargo:warning=      |                      ^~~~~~~~~~~~~~~
-
-[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5a6af707f0af
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/138077]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libunwind/src/UnwindLevel1.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libunwind/src/UnwindLevel1.c b/libunwind/src/UnwindLevel1.c
-index 7e785f4d31e7..ed2c8239824c 100644
---- a/libunwind/src/UnwindLevel1.c
-+++ b/libunwind/src/UnwindLevel1.c
-@@ -185,7 +185,7 @@ extern int __unw_step_stage2(unw_cursor_t *);
- 
- #if defined(_LIBUNWIND_USE_GCS)
- // Enable the GCS target feature to permit gcspop instructions to be used.
--__attribute__((target("gcs")))
-+__attribute__((target("+gcs")))
- #endif
- static _Unwind_Reason_Code
- unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exception *exception_object) {
-@@ -329,7 +329,7 @@ unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exception *except
- 
- #if defined(_LIBUNWIND_USE_GCS)
- // Enable the GCS target feature to permit gcspop instructions to be used.
--__attribute__((target("gcs")))
-+__attribute__((target("+gcs")))
- #endif
- static _Unwind_Reason_Code
- unwind_phase2_forced(unw_context_t *uc, unw_cursor_t *cursor,
diff --git a/meta/recipes-devtools/clang/clang/0001-libclc-allow-existing-prepare-builtins-in-standalone.patch b/meta/recipes-devtools/clang/clang/0037-allow-external-prepare_builtins.patch
similarity index 93%
rename from meta/recipes-devtools/clang/clang/0001-libclc-allow-existing-prepare-builtins-in-standalone.patch
rename to meta/recipes-devtools/clang/clang/0037-allow-external-prepare_builtins.patch
index 46929798adb..a9f401b21bb 100644
--- a/meta/recipes-devtools/clang/clang/0001-libclc-allow-existing-prepare-builtins-in-standalone.patch
+++ b/meta/recipes-devtools/clang/clang/0037-allow-external-prepare_builtins.patch
@@ -1,4 +1,4 @@
-From 348f846b206780646430d6477c04b7793b669f34 Mon Sep 17 00:00:00 2001
+From cd679dff50adb4a96dae132ba54e74d7c7371074 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 16 Jul 2025 23:24:21 +0100
 Subject: [PATCH] allow external prepare_builtins
@@ -14,10 +14,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 17 insertions(+), 6 deletions(-)
 
 diff --git a/libclc/CMakeLists.txt b/libclc/CMakeLists.txt
-index 43e213b385f5..d4a6d096169e 100644
+index c98e2043464d..151c5d2d20c6 100644
 --- a/libclc/CMakeLists.txt
 +++ b/libclc/CMakeLists.txt
-@@ -181,17 +181,28 @@ set(LLVM_LINK_COMPONENTS
+@@ -178,17 +178,28 @@ set(LLVM_LINK_COMPONENTS
    IRReader
    Support
  )
@@ -52,6 +52,3 @@ index 43e213b385f5..d4a6d096169e 100644
  
  # Setup arch devices
  set( r600--_devices cedar cypress barts cayman )
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/clang/clang/0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch b/meta/recipes-devtools/clang/clang/0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
new file mode 100644
index 00000000000..1572911aad6
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
@@ -0,0 +1,36 @@
+From e5033c176725f7877694cbee6a8aaa00291101c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 Jul 2025 19:12:13 -0700
+Subject: [PATCH] Revert "[libc++] Remap headers in the debug info when
+ building the library (#143004)"
+
+This reverts commit 4d50b405f1585ce172f87cb5f8daf3c1b4145215.
+
+There is a discussion on this issue on [1]
+I have discussed this on PR and also with developer on IRC, I am
+hoping that our position will be considered by 22.x release
+
+[1] https://github.com/llvm/llvm-project/pull/143004/
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcxx/include/CMakeLists.txt | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/libcxx/include/CMakeLists.txt b/libcxx/include/CMakeLists.txt
+index 9e9852de2a4c..9ee1b4695783 100644
+--- a/libcxx/include/CMakeLists.txt
++++ b/libcxx/include/CMakeLists.txt
+@@ -1719,11 +1719,6 @@ add_dependencies(cxx-headers generate-cxx-headers)
+ target_include_directories(cxx-headers INTERFACE ${LIBCXX_GENERATED_INCLUDE_TARGET_DIR}
+                                                  ${LIBCXX_GENERATED_INCLUDE_DIR})
+ 
+-# Make sure to map the generated include directory back to libc++'s actual source directory when generating
+-# debug information. Otherwise, the debug information will refer to generated headers which are created during
+-# the build and generally not persistent.
+-target_add_compile_flags_if_supported(cxx-headers INTERFACE "-fdebug-prefix-map=${LIBCXX_GENERATED_INCLUDE_DIR}=${LIBCXX_SOURCE_DIR}/include")
+-
+ if (LIBCXX_INSTALL_HEADERS)
+   foreach(file ${files})
+     get_filename_component(dir ${file} DIRECTORY)
diff --git a/meta/recipes-devtools/clang/clang/0039-Prevent-revisiting-block-when-searching-for-noreturn.patch b/meta/recipes-devtools/clang/clang/0039-Prevent-revisiting-block-when-searching-for-noreturn.patch
new file mode 100644
index 00000000000..343b65f505c
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0039-Prevent-revisiting-block-when-searching-for-noreturn.patch
@@ -0,0 +1,41 @@
+From ef88c2d42100d7e9aee8dc876094993080b42b9f Mon Sep 17 00:00:00 2001
+From: Serge Pavlov <sepavloff@gmail.com>
+Date: Fri, 25 Jul 2025 13:35:19 +0700
+Subject: [PATCH] Prevent revisiting block when searching for noreturn vars
+
+When searching for noreturn variable initializations, do not visit CFG
+blocks that are already visited, it prevents hanging  the analysis.
+
+It must fix Ihttps://github.com/llvm/llvm-project/issues/150336.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/150582]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/test/SemaCXX/noreturn-vars.cpp | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/clang/test/SemaCXX/noreturn-vars.cpp b/clang/test/SemaCXX/noreturn-vars.cpp
+index ca65fcf5ca31..1bf074149f04 100644
+--- a/clang/test/SemaCXX/noreturn-vars.cpp
++++ b/clang/test/SemaCXX/noreturn-vars.cpp
+@@ -225,3 +225,20 @@ extern void abc_02(func_type *);
+   abc_02(&func_ptr);
+   func_ptr();
+ } // expected-warning {{function declared 'noreturn' should not return}}
++
++namespace Issue150336 {
++void free(void *);
++typedef void (*sel_freefunc)(void *);
++struct gmx_ana_selmethod_t {
++  sel_freefunc free;
++  int nparams;
++  int *param;
++};
++void gmx_selelem_free_method(struct gmx_ana_selmethod_t* method, void* mdata) {
++    sel_freefunc free_func = 0;
++    for (int i = 0; i < method->nparams; ++i)
++        free(&method->param[i]);
++    if (mdata && free_func)
++        free_func(mdata);
++}
++}
diff --git a/meta/recipes-devtools/clang/clang/no-c-index-test.patch b/meta/recipes-devtools/clang/clang/0040-Only-build-c-index-test-when-clang-tests-are-include.patch
similarity index 64%
rename from meta/recipes-devtools/clang/clang/no-c-index-test.patch
rename to meta/recipes-devtools/clang/clang/0040-Only-build-c-index-test-when-clang-tests-are-include.patch
index 55737403d8d..111e0110bcd 100644
--- a/meta/recipes-devtools/clang/clang/no-c-index-test.patch
+++ b/meta/recipes-devtools/clang/clang/0040-Only-build-c-index-test-when-clang-tests-are-include.patch
@@ -1,8 +1,7 @@
-From 714a9cb319a8946fa670c7e8bbe7f29f847fa45f Mon Sep 17 00:00:00 2001
+From 70c4615ab54e5380019955a7cb3381b977802b7d Mon Sep 17 00:00:00 2001
 From: David Spickett <david.spickett@linaro.org>
 Date: Tue, 29 Jul 2025 14:17:56 +0000
-Subject: [PATCH 1/2] [clang] Only build c-index-test when clang tests are
- included
+Subject: [PATCH] Only build c-index-test when clang tests are included
 
 c-index-test is only used for testing, and it's used in tests
 that are already guarded by CLANG_INCLUDE_TESTS in clang/CMakeLists.txt.
@@ -14,30 +13,31 @@ include c-index-test which we have no need for.
 
 Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/151157]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  clang/tools/CMakeLists.txt | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git i/clang/tools/CMakeLists.txt w/clang/tools/CMakeLists.txt
-index 98c018e96848..5410dd8de843 100644
---- i/clang/tools/CMakeLists.txt
-+++ w/clang/tools/CMakeLists.txt
+diff --git a/clang/tools/CMakeLists.txt b/clang/tools/CMakeLists.txt
+index 50e3d694236a..196dcb1e8466 100644
+--- a/clang/tools/CMakeLists.txt
++++ b/clang/tools/CMakeLists.txt
 @@ -2,7 +2,6 @@ create_subdirectory_options(CLANG TOOL)
-
+ 
  add_clang_subdirectory(diagtool)
  add_clang_subdirectory(driver)
 -add_clang_subdirectory(apinotes-test)
- add_clang_subdirectory(clang-diff)
- add_clang_subdirectory(clang-format)
- add_clang_subdirectory(clang-fuzzer)
-@@ -18,7 +17,10 @@ if(HAVE_CLANG_REPL_SUPPORT)
+ if(CLANG_ENABLE_CIR)
+   add_clang_subdirectory(cir-opt)
+   add_clang_subdirectory(cir-translate)
+@@ -23,7 +22,10 @@ if(HAVE_CLANG_REPL_SUPPORT)
    add_clang_subdirectory(clang-repl)
  endif()
-
+ 
 +if(CLANG_INCLUDE_TESTS)
 +add_clang_subdirectory(apinotes-test)
  add_clang_subdirectory(c-index-test)
 +endif()
-
+ 
  add_clang_subdirectory(clang-refactor)
- # For MinGW we only enable shared library if LLVM_LINK_LLVM_DYLIB=ON.
+ # For MinGW/Cygwin we only enable shared library if LLVM_LINK_LLVM_DYLIB=ON.
diff --git a/meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch b/meta/recipes-devtools/clang/clang/0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
similarity index 53%
rename from meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch
rename to meta/recipes-devtools/clang/clang/0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
index 4211cd2e3c0..4dc01f6e640 100644
--- a/meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch
+++ b/meta/recipes-devtools/clang/clang/0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
@@ -1,7 +1,7 @@
-From e396fbe0e698c80e112af76fcdff8bbd61a30740 Mon Sep 17 00:00:00 2001
+From 93a51605fccf0f99868f8bae212a08823d01b03a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 2 Aug 2025 17:58:20 -0700
-Subject: [PATCH] llvm: Allow users to set LLVM_HAVE_OPT_VIEWER_MODULES
+Subject: [PATCH] [opt-viewer] Allow users to set LLVM_HAVE_OPT_VIEWER_MODULES
  manually from the CMake
 
 Check right before setting LLVM_HAVE_OPT_VIEWER_MODULES
@@ -9,16 +9,15 @@ so that if the user specifies the variable on the commandline
 it takes precedence. If not, fall back to the old logic
 
 Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/151845]
-
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- llvm/CMakeLists.txt                  |  2 ++
- llvm/cmake/config-ix.cmake           | 13 ++++++++++---
- llvm/tools/opt-viewer/CMakeLists.txt | 24 +++++++++++++-----------
- 3 files changed, 25 insertions(+), 14 deletions(-)
+ llvm/CMakeLists.txt                     |  2 ++
+ llvm/cmake/config-ix.cmake              | 13 ++++++++++---
+ llvm/include/llvm/Config/config.h.cmake |  3 +++
+ 3 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/llvm/CMakeLists.txt b/llvm/CMakeLists.txt
-index 4c70b98a32f9..60b786ca39c2 100644
+index cb945b578e46..e4ed9eca6014 100644
 --- a/llvm/CMakeLists.txt
 +++ b/llvm/CMakeLists.txt
 @@ -7,6 +7,8 @@ set(LLVM_COMMON_CMAKE_UTILS ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
@@ -55,37 +54,17 @@ index a8e4e5a63244..17af3dc1e93f 100644
  endif()
  
  function(llvm_get_host_prefixes_and_suffixes)
-diff --git a/llvm/tools/opt-viewer/CMakeLists.txt b/llvm/tools/opt-viewer/CMakeLists.txt
-index 4bcf6932ee77..d231c39bcc5d 100644
---- a/llvm/tools/opt-viewer/CMakeLists.txt
-+++ b/llvm/tools/opt-viewer/CMakeLists.txt
-@@ -6,16 +6,18 @@ set (files
-   "optrecord.py"
-   "style.css")
+diff --git a/llvm/include/llvm/Config/config.h.cmake b/llvm/include/llvm/Config/config.h.cmake
+index ce83de8e4cba..02cf6d2ec363 100644
+--- a/llvm/include/llvm/Config/config.h.cmake
++++ b/llvm/include/llvm/Config/config.h.cmake
+@@ -287,6 +287,9 @@
+ /* Define to a function implementing strdup */
+ #cmakedefine strdup ${strdup}
  
--foreach (file ${files})
--  install(PROGRAMS ${file}
--    DESTINATION "${CMAKE_INSTALL_DATADIR}/opt-viewer"
--    COMPONENT opt-viewer)
--endforeach (file)
-+if(LLVM_HAVE_OPT_VIEWER_MODULES)
-+  foreach (file ${files})
-+    install(PROGRAMS ${file}
-+      DESTINATION "${CMAKE_INSTALL_DATADIR}/opt-viewer"
-+      COMPONENT opt-viewer)
-+  endforeach (file)
++/* Define indicating opt-viewer modules */
++#cmakedefine LLVM_HAVE_OPT_VIEWER_MODULES
++
+ /* Whether GlobalISel rule coverage is being collected */
+ #cmakedefine01 LLVM_GISEL_COV_ENABLED
  
--add_custom_target(opt-viewer DEPENDS ${files})
--set_target_properties(opt-viewer PROPERTIES FOLDER "LLVM/Tools")
--if(NOT LLVM_ENABLE_IDE)
--  add_llvm_install_targets("install-opt-viewer"
--                           DEPENDS opt-viewer
--                           COMPONENT opt-viewer)
-+  add_custom_target(opt-viewer DEPENDS ${files})
-+  set_target_properties(opt-viewer PROPERTIES FOLDER "LLVM/Tools")
-+  if(NOT LLVM_ENABLE_IDE)
-+    add_llvm_install_targets("install-opt-viewer"
-+                             DEPENDS opt-viewer
-+                             COMPONENT opt-viewer)
-+  endif()
- endif()
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 6ac53125f09..98143194295 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -3,13 +3,13 @@ LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 LLVM_HTTP ?= "https://github.com/llvm"
 
-MAJOR_VER = "20"
+MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "8"
+PATCH_VER = "0"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
+PV = "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}"
 
 LLVMMD5SUM = "8a15a0759ef07f2682d2ba4b893c9afe"
 CLANGMD5SUM = "ff42885ed2ab98f1ecb8c1fc41205343"
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index cbcc4feded5..889847c3e11 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -13,11 +13,11 @@ LICENSE = "Apache-2.0-with-LLVM-exception"
 
 # GA Release
 RELEASE ?= "${PV}"
-BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz"
+BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFIX}/llvm-project-${PV}${VER_SUFFIX}.src.tar.xz"
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
-SOURCEDIR ?= "llvm-project-${PV}.src"
-SRC_URI[sha256sum] = "6898f963c8e938981e6c4a302e83ec5beb4630147c7311183cf61069af16333d"
+SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
+SRC_URI[sha256sum] = "1672e3efb4c2affd62dbbe12ea898b28a451416c7d95c1bd0190c26cbe878825"
 
 SRC_URI = "\
     ${BASEURI} \
@@ -52,17 +52,16 @@ SRC_URI = "\
     file://0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
     file://0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch \
     file://0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
-    file://0032-clangd-Add-a-build-option-to-disable-building-dexp.patch \
-    file://0033-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
-    file://0034-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
-    file://0035-openmp-Do-not-emit-date-and-time-into-generate-files.patch \
-    file://0036-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch \
-    file://0037-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
-    file://0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
-    file://0001-libclc-allow-existing-prepare-builtins-in-standalone.patch \
-    file://no-c-index-test.patch \
-    file://0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch \
-    file://0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch \
+    file://0032-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+    file://0033-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
+    file://0034-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
+    file://0035-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
+    file://0036-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch \
+    file://0037-allow-external-prepare_builtins.patch \
+    file://0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch \
+    file://0039-Prevent-revisiting-block-when-searching-for-noreturn.patch \
+    file://0040-Only-build-c-index-test-when-clang-tests-are-include.patch \
+    file://0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""

