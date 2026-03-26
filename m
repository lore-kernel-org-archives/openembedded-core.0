Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E641109E538
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 02:09:37 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39420.1774490968589017079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 19:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=geoEgKHh;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12a695044a4so1089438c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 19:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774490968; x=1775095768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5IwpIrnID8ZNLiyJnXlNpUqF3pUv7L4d2MoLf7RQcU=;
        b=geoEgKHhJ9VFUbeOCULs2MiCG5xUCKkgsN/YSObBORZ4wh2j00iZsv7C3poyc+y0+E
         5Cw2A/azAx2VZ4MWwCNeRTgtB2a42gOKJ6Wz+CuPRPx6e/ATUtQ316U3L0PB6l7BW3Zf
         5/LNqVueYpaEeE+Qw0HiGFkr2G6hfdRnMrJVBxRHM8fYg+leTe8lbSbJh1ASqJO+UGd2
         N8MX8qx/bBzOZbMnNTo4xI8hVd0kn7GCNl4seO4ZL5Z8puBlLlM02mnj6zr2zgyVi6Ve
         mVsXKh3SEX/kp9tGt5JVq6/OAMdQzmJn+7QTtFQL7d3nmlU2OUM8+nSiWWc5AkVgEN2h
         Cf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490968; x=1775095768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5IwpIrnID8ZNLiyJnXlNpUqF3pUv7L4d2MoLf7RQcU=;
        b=b7bOc0Ofmt3Rj4K4YX5Zaj/76W+KCaKFLGBfp+qnfL28OZvgVsmw7WkCfWRQ703ecd
         OdxJ61JQmAPtT8F85ZWBTjZxDgCbLUwJelod4VVm2RbcW8RlS9P0C4ZZPxzGwep16gUS
         iGK1Dv1fljkm721siiHc8xn/B8YkgYqsOICcb9VsLGzcNvzBJwXwb0xYOM6K3XuU0oD3
         Sm3SQsjyVy+LHIOt1ROoJmxB9Hu+WtIcsBhGFt6ONJR5tx5Z0FA9bI6Nr6tcs7uDwnfz
         wzC7W1XKophzCCMdrldnS4JhcCP+3yVDzV5/G1+rjhvjx5R5EE4jupLHaO0lTQKmmEpl
         VrqQ==
X-Gm-Message-State: AOJu0Yz72Tx9tOw5P6fsh4jPlQyXuNudmsG9sEPkGR486j/syKo4uJjj
	sN3qY14rqNR1usOF8lRAvM0mMoYu5CxXN0Oe5W5XnZXxROGOgiluhDqbc/VTr869q/M=
X-Gm-Gg: ATEYQzzKlwIcI05Z/qrr4fnmrU4l/UxvCg2al67IePuG0wwpZCOhT2oT5QdqA1SsVCb
	3bDHYoRHdllY6vFFrnTr8/lT0DyxDx5kqo1YAeNYclwsSHa9tTBUB06YXKnrBw3Qx5ks3rhkMID
	xnZ7UeJRHlHuZFtaPRZJX9wSonXVxxCmqeyotVJGhQFBaq43ugKFrJ9bpmm/LBvrgxP0DDTpCJs
	7wHMDixhnr1cqeXWNXP6gyoR/ly+i/x0dZLogF6+M+fg3ashRD/lPCkJoXxXbLccJYzEHV6FC5i
	eGEADDayjlO+sgcWoVku1x5qsUjn1akiJL+AAXmK8/3BXOTVFfoh1q2rJSYFtNcmZ99OIUl6GGH
	uydCIizljgVCBrsPVt0Fsn8SvcwMrUwtYN2fG7FPLbZe8y9y5DIbOaM5FT2RYpbCOj7ppEqoLvE
	iTwyUbZzOOXG3uZqMps807sy6EX9CxUzRmsJMYw481kep/9K6ouxBd2I0sG4MDlkvxTk6HdG+Nj
	Yl5NzU0Myt0Cah+lJOtE7oRigzO2c2uB9WuxgmHwcTz5peofmkmd/aJevua
X-Received: by 2002:a05:7022:fa1:b0:12a:6c84:6054 with SMTP id a92af1059eb24-12a96eef696mr3110593c88.35.1774490966591;
        Wed, 25 Mar 2026 19:09:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6e5b38csm2359060c88.2.2026.03.25.19.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:09:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/4] clang/llvm: Upgrade to 22.x major release
Date: Wed, 25 Mar 2026 19:09:19 -0700
Message-ID: <20260326020923.297511-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 02:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233941

From: Khem Raj <raj.khem@gmail.com>

Includes support for new Intel (Wildcat Lake, Nova Lake with APX and AVX10.2)
Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features performance
optimizations for AMD Zen 4 and Zen 5 architectures.

Integrated Distributed ThinLTO is more mature, with enhancements
like cache support for incremental builds and robust handling of temporary artifacts.

LLDB added first-class WebAssembly debugging support, including breakpoints and variable inspection.

Support for Google Native Client (NaCl) is dropped in this release.

Detailed ChangeLog [1]

[1] https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix libclc build

 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../clang/0001-Install-lldb-tblgen.patch      |  29 ----
 ...ilding-native-tools-when-cross-compi.patch |  63 ---------
 ...ibunwind-headers-when-LIBCXXABI_LIBU.patch |   8 +-
 ...-support-a-new-embedded-linux-target.patch |   2 +-
 ...lify-cross-compilation.-Don-t-use-na.patch |   6 +-
 ...env-override-of-exe-and-libdir-path.patch} |  22 +--
 ...-driver-Check-sysroot-for-ldso-path.patch} |  12 +-
 ...ools.cpp-Add-lssp_nonshared-on-musl.patch} |   6 +-
 ...7-clang-Prepend-trailing-to-sysroot.patch} |   6 +-
 ...-the-target-sysroot-for-compiler-ru.patch} |   6 +-
 ...fine-releative-gcc-installation-dir.patch} |  14 +-
 ...d-and-ldl-along-with-lunwind-for-st.patch} |   6 +-
 ...-Check-for-atomic-double-intrinsics.patch} |   2 +-
 ...UTABLE-when-cross-compiling-for-nati.patch |  24 ----
 ...ure-for-packages-using-find_package.patch} |  18 +--
 ...e-dir-location-for-cross-toolchains.patch} |  17 +--
 ...dyld-prefix-when-checking-sysroot-f.patch} |  14 +-
 ...clang-Use-python3-in-python-scripts.patch} |   4 +-
 ...-anchor-for-adding-OE-distro-vendor.patch} |  32 ++---
 ...t-use-backtrace-APIs-on-non-glibc-l.patch} |   2 +-
 ...iple-for-non-debian-multiarch-linux-.patch |  29 ++++
 ...ibunwind-Added-unw_backtrace-method.patch} |  12 +-
 ...iple-for-non-debian-multiarch-linux-.patch |  28 ----
 ...020-lldb-Link-with-libatomic-on-x86.patch} |   4 +-
 ...mpiler-rt-Enable-__int128-for-ppc32.patch} |  25 ++--
 ...t-use-cmake-infra-to-detect-libzstd.patch} |   8 +-
 ...-Fix-stat-struct-s-size-for-O32-ABI.patch} |   8 +-
 ...cpp-ARMLibDirs-search-also-in-lib32.patch} |   8 +-
 ...-OE-specific-ABI-triple-for-N32-ABI.patch} |  16 +--
 ...nwind.pc.in-and-llvm-config-scripts.patch} |   2 +-
 ...spect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  90 ++++++++++++
 ...o-not-pass-target-to-clang-compiler.patch} |   4 +-
 ...-sort-ClassInfo-lists-by-name-as-we.patch} |   6 +-
 ...spect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  92 -------------
 ...ve-LLVM_LDFLAGS-from-ldflags-output.patch} |  16 +--
 ...de-sync_fetch_and_-for-any-pre-ARMv.patch} |   6 +-
 ...ode-uptr-sptr-typedefs-on-Mips-Linu.patch} |   4 +-
 ...-relative-paths-for-getArchSpecific.patch} |   8 +-
 ...-headers-in-the-debug-info-when-bui.patch} |   6 +-
 ...g-block-when-searching-for-noreturn.patch} |   4 +-
 ..._HAVE_OPT_VIEWER_MODULES-externally.patch} |  10 +-
 ...0036-allow-external-prepare_builtins.patch |  54 --------
 ...clang-tblgen-if-it-is-actually-need.patch} |  10 +-
 ...symlink-path-for-libcc-when-LLVM_ENA.patch |  71 ++++++++++
 ...loadArch-UNUSED-to-UNUSED_-to-avoid-.patch | 128 ++++++++++++++++++
 ...ex-test-when-clang-tests-are-include.patch |  43 ------
 ...symlink-path-for-libcc-when-LLVM_ENA.patch |  33 -----
 ...libgcc.a-symlink-path-when-LLVM_ENAB.patch |  83 ------------
 meta/recipes-devtools/clang/common-clang.inc  |   8 +-
 meta/recipes-devtools/clang/common.inc        |  83 ++++++------
 meta/recipes-devtools/clang/libclc_git.bb     |  17 ---
 52 files changed, 529 insertions(+), 682 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0001-clang-Support-building-native-tools-when-cross-compi.patch
 rename meta/recipes-devtools/clang/clang/{0005-llvm-allow-env-override-of-exe-and-libdir-path.patch => 0004-llvm-allow-env-override-of-exe-and-libdir-path.patch} (81%)
 rename meta/recipes-devtools/clang/clang/{0006-clang-driver-Check-sysroot-for-ldso-path.patch => 0005-clang-driver-Check-sysroot-for-ldso-path.patch} (88%)
 rename meta/recipes-devtools/clang/clang/{0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch => 0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0008-clang-Prepend-trailing-to-sysroot.patch => 0007-clang-Prepend-trailing-to-sysroot.patch} (88%)
 rename meta/recipes-devtools/clang/clang/{0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch => 0008-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch} (89%)
 rename meta/recipes-devtools/clang/clang/{0010-clang-Define-releative-gcc-installation-dir.patch => 0009-clang-Define-releative-gcc-installation-dir.patch} (93%)
 rename meta/recipes-devtools/clang/clang/{0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch => 0010-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch} (87%)
 rename meta/recipes-devtools/clang/clang/{0013-Check-for-atomic-double-intrinsics.patch => 0011-Check-for-atomic-double-intrinsics.patch} (94%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
 rename meta/recipes-devtools/clang/clang/{0014-cmake-Fix-configure-for-packages-using-find_package.patch => 0012-cmake-Fix-configure-for-packages-using-find_package.patch} (90%)
 rename meta/recipes-devtools/clang/clang/{0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch => 0013-clang-Fix-resource-dir-location-for-cross-toolchains.patch} (80%)
 rename meta/recipes-devtools/clang/clang/{0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch => 0014-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch} (89%)
 rename meta/recipes-devtools/clang/clang/{0017-clang-Use-python3-in-python-scripts.patch => 0015-clang-Use-python3-in-python-scripts.patch} (92%)
 rename meta/recipes-devtools/clang/clang/{0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch => 0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch => 0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch} (97%)
 create mode 100644 meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
 rename meta/recipes-devtools/clang/clang/{0021-libunwind-Added-unw_backtrace-method.patch => 0019-libunwind-Added-unw_backtrace-method.patch} (82%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
 rename meta/recipes-devtools/clang/clang/{0022-lldb-Link-with-libatomic-on-x86.patch => 0020-lldb-Link-with-libatomic-on-x86.patch} (92%)
 rename meta/recipes-devtools/clang/clang/{0023-compiler-rt-Enable-__int128-for-ppc32.patch => 0021-compiler-rt-Enable-__int128-for-ppc32.patch} (68%)
 rename meta/recipes-devtools/clang/clang/{0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch => 0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch => 0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch} (88%)
 rename meta/recipes-devtools/clang/clang/{0026-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch => 0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch} (98%)
 rename meta/recipes-devtools/clang/clang/{0027-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch => 0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch} (88%)
 rename meta/recipes-devtools/clang/clang/{0028-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch => 0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch} (97%)
 create mode 100644 meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
 rename meta/recipes-devtools/clang/clang/{0030-compiler-rt-Do-not-pass-target-to-clang-compiler.patch => 0028-compiler-rt-Do-not-pass-target-to-clang-compiler.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0031-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch => 0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch} (89%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0029-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
 rename meta/recipes-devtools/clang/clang/{0032-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch => 0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch} (71%)
 rename meta/recipes-devtools/clang/clang/{0033-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch => 0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0034-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch => 0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch} (93%)
 rename meta/recipes-devtools/clang/clang/{0035-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch => 0033-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch} (88%)
 rename meta/recipes-devtools/clang/clang/{0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch => 0034-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch} (89%)
 rename meta/recipes-devtools/clang/clang/{0038-Prevent-revisiting-block-when-searching-for-noreturn.patch => 0035-Prevent-revisiting-block-when-searching-for-noreturn.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch => 0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch} (82%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0036-allow-external-prepare_builtins.patch
 rename meta/recipes-devtools/clang/clang/{clang-no-tblgen.patch => 0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.patch} (72%)
 create mode 100644 meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0039-Only-build-c-index-test-when-clang-tests-are-include.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6082ab5683..ff67d8c886 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -484,7 +484,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.8 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.1 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.patch b/meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.patch
deleted file mode 100644
index c974167589..0000000000
--- a/meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7de6d35aeea2d06b1597539c47f6af30d2798d73 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 19 Sep 2025 16:33:55 +0100
-Subject: [PATCH] Install lldb-tblgen
-
-In keeping with the llvm-tblgen and clang-tblgen binaries, allow
-lldb-tblgen to be installed by cmake so that cross builds are easier.
-
-Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/0ce6052a0c08035a07fcabb05271be7313308db3]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- lldb/utils/TableGen/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lldb/utils/TableGen/CMakeLists.txt b/lldb/utils/TableGen/CMakeLists.txt
-index 0ac010bcda35..ce96dddd4420 100644
---- a/lldb/utils/TableGen/CMakeLists.txt
-+++ b/lldb/utils/TableGen/CMakeLists.txt
-@@ -8,6 +8,7 @@ if (NOT DEFINED LLDB_TABLEGEN_EXE)
-     set(LLVM_LINK_COMPONENTS Support)
-
-     add_tablegen(lldb-tblgen LLDB
-+      DESTINATION "${CMAKE_INSTALL_BINDIR}"
-       LLDBOptionDefEmitter.cpp
-       LLDBPropertyDefEmitter.cpp
-       LLDBTableGen.cpp
---
-2.43.0
-
diff --git a/meta/recipes-devtools/clang/clang/0001-clang-Support-building-native-tools-when-cross-compi.patch b/meta/recipes-devtools/clang/clang/0001-clang-Support-building-native-tools-when-cross-compi.patch
deleted file mode 100644
index c4198394ac..0000000000
--- a/meta/recipes-devtools/clang/clang/0001-clang-Support-building-native-tools-when-cross-compi.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 2ff1134d1d2b9f3c207e3ebd98de922f9ef6c15a Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 24 Sep 2025 17:02:57 +0100
-Subject: [PATCH] [clang] Support building native tools when cross-compiling
- standalone clang
-
-When cross-compiling the LLVM project as a whole (from llvm/), if it
-cannot find presupplied tools it will create a native build environment
-to build the tools it needs.
-
-However, when doing a standalone build of clang (that is, from clang/
-and linking against an existing libLLVM) this doesn't work. Instead
-a _target_ binary is built which predictably then fails.
-
-The conventional workaround for this is to build the native tools in a
-separate native compile phase and pass the paths to the cross build, for
-example see OpenEmbedded[1] or Nix[2]. But we can do better!
-
-The first problem is that LLVM_USE_HOST_TOOLS is only set in the llvm/
-CMakeLists.txt, so setup_host_tool() will never consider building a
-native binary.  This can be solved by setting LLVM_USE_HOST_TOOLS based
-on CMAKE_CROSSCOMPILING in clang/CMakeLists.txt in the standalone case.
-
-Now setup_host_tool() will try to build a native tool, but it needs
-build_native_tool() from CrossCompile.cmake, so that also needs to be
-included.
-
-Finally, the native binary then fails because there's no provider for
-the dependency "CONFIGURE_Clang_NATIVE", so use llvm_create_cross_target
-to create the native environment.
-
-These few lines mirror what the lldb CMakeLists.txt does in the
-standalone case, so there is prior art for this.
-
-[1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/clang/clang_git.bb?id=e18d697e92b55e57124e80234369d46575226386#n212
-[2] https://github.com/NixOS/nixpkgs/blob/3354d448f2a26117a74638957b0131ce3da9c8c4/pkgs/development/compilers/llvm/common/tblgen.nix#L54
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/160605]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- clang/CMakeLists.txt | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/clang/CMakeLists.txt b/clang/CMakeLists.txt
-index 1bb73599970c..4eaa71289985 100644
---- a/clang/CMakeLists.txt
-+++ b/clang/CMakeLists.txt
-@@ -80,6 +80,12 @@ if(CLANG_BUILT_STANDALONE)
-   include(GetErrcMessages)
-   include(LLVMDistributionSupport)
-
-+  if(CMAKE_CROSSCOMPILING)
-+    set(LLVM_USE_HOST_TOOLS ON)
-+    include(CrossCompile)
-+    llvm_create_cross_target(Clang NATIVE "" Release)
-+  endif()
-+
-   set(PACKAGE_VERSION "${LLVM_PACKAGE_VERSION}")
-   set(BUG_REPORT_URL "${LLVM_PACKAGE_BUGREPORT}" CACHE STRING
-     "Default URL where bug reports are to be submitted.")
---
-2.43.0
-
diff --git a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
index ab84a877fa..c48118d2e2 100644
--- a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
+++ b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
@@ -1,4 +1,4 @@
-From 41ba0feeeebcbe242836639ef3b562adc29ffa96 Mon Sep 17 00:00:00 2001
+From 96e23bbd0ec636d0042508675f9e8f4a1dfbbaa0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 Aug 2017 10:37:49 -0700
 Subject: [PATCH] libcxxabi: Find libunwind headers when
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 5 deletions(-)

 diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt
-index cf478bcee01f..4b374572905d 100644
+index 2b67c5972339..45d84b404b30 100644
 --- a/libcxxabi/CMakeLists.txt
 +++ b/libcxxabi/CMakeLists.txt
-@@ -472,7 +472,7 @@ set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
+@@ -476,7 +476,7 @@ set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
      "Specify path to libunwind source." FORCE)

  if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
@@ -30,7 +30,7 @@ index cf478bcee01f..4b374572905d 100644
      PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}
            ${LIBCXXABI_LIBUNWIND_PATH}/include
            ${CMAKE_BINARY_DIR}/${LIBCXXABI_LIBUNWIND_INCLUDES}
-@@ -483,18 +483,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
+@@ -487,18 +487,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
      NO_CMAKE_FIND_ROOT_PATH
    )

diff --git a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
index b6885e2f42..7a082be28a 100644
--- a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
+++ b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
@@ -1,4 +1,4 @@
-From b044e0e56a8af940836056f61145dea1f961cd4c Mon Sep 17 00:00:00 2001
+From ef520576789bee51de0bb3914ad51cf117c1c880 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 19 Apr 2015 15:16:23 -0700
 Subject: [PATCH] compiler-rt: support a new embedded linux target
diff --git a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
index 44cb2299cd..5777a48e59 100644
--- a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
+++ b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
@@ -1,4 +1,4 @@
-From ab6fdb73b582c1eafd1c342e9cde5b3d8ec7ab86 Mon Sep 17 00:00:00 2001
+From 4eeac06ba9fda1f253021aa79ab471c7d835ec43 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 May 2016 23:11:45 -0700
 Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 1 deletion(-)

 diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt
-index 9f8e8334d75b..a0ba047bdb73 100644
+index a92258ae1244..98c4e9a681d5 100644
 --- a/compiler-rt/CMakeLists.txt
 +++ b/compiler-rt/CMakeLists.txt
-@@ -107,7 +107,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
+@@ -109,7 +109,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
    set(CMAKE_CXX_EXTENSIONS NO)

    if (NOT LLVM_RUNTIMES_BUILD)
diff --git a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe-and-libdir-path.patch
similarity index 81%
rename from meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
rename to meta/recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe-and-libdir-path.patch
index 797980f554..9749ba5c67 100644
--- a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
+++ b/meta/recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe-and-libdir-path.patch
@@ -1,4 +1,4 @@
-From fb846030137c14f4f64937f0bfad5a6aad9bb523 Mon Sep 17 00:00:00 2001
+From 8d6bc584c3aa0b695fc8616bbdcd02e0b6bb1e45 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
@@ -19,13 +19,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 19 insertions(+), 6 deletions(-)

 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index 49df8fdcb7f7..c092db81bb8f 100644
+index 24ea264419af..0a3f51ae2b83 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -245,6 +245,13 @@ Typical components:\n\
+@@ -248,6 +248,13 @@ Typical components:\n\

  /// Compute the path to the main executable.
- std::string GetExecutablePath(const char *Argv0) {
+ static std::string getExecutablePath(const char *Argv0) {
 +  // Hack for Yocto: we need to override the root path when we are using
 +  // llvm-config from within a target sysroot.
 +  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
@@ -35,24 +35,24 @@ index 49df8fdcb7f7..c092db81bb8f 100644
 +
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
-   void *P = (void *)(intptr_t)GetExecutablePath;
-@@ -324,7 +331,7 @@ int main(int argc, char **argv) {
+   void *P = (void *)(intptr_t)getExecutablePath;
+@@ -326,7 +333,7 @@ int main(int argc, char **argv) {
    // Compute various directory locations based on the derived location
    // information.
    std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
 -              ActiveCMakeDir;
 +              ActiveCMakeDir, BaseLibDir;
-   std::string ActiveIncludeOption;
+   std::vector<std::string> ActiveIncludeOptions;
    if (IsInDevelopmentTree) {
      ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
-@@ -365,12 +372,18 @@ int main(int argc, char **argv) {
-       sys::fs::make_absolute(ActivePrefix, Path);
+@@ -367,12 +374,18 @@ int main(int argc, char **argv) {
+       sys::path::make_absolute(ActivePrefix, Path);
        ActiveBinDir = std::string(Path);
      }
 -    ActiveLibDir = ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
 -    {
 -      SmallString<256> Path(LLVM_INSTALL_PACKAGE_DIR);
--      sys::fs::make_absolute(ActivePrefix, Path);
+-      sys::path::make_absolute(ActivePrefix, Path);
 -      ActiveCMakeDir = std::string(Path);
 +    // Hack for Yocto: we need to override the lib path when we are using
 +    // llvm-config from within a target sysroot since LLVM_LIBDIR_SUFFIX
@@ -66,6 +66,6 @@ index 49df8fdcb7f7..c092db81bb8f 100644
      }
 +    ActiveLibDir = ActivePrefix + BaseLibDir;
 +    ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
-     ActiveIncludeOption = "-I" + ActiveIncludeDir;
+     ActiveIncludeOptions.push_back(ActiveIncludeDir);
    }

diff --git a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sysroot-for-ldso-path.patch
similarity index 88%
rename from meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
rename to meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sysroot-for-ldso-path.patch
index c4f04e68e8..a80b472bc3 100644
--- a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
+++ b/meta/recipes-devtools/clang/clang/0005-clang-driver-Check-sysroot-for-ldso-path.patch
@@ -1,4 +1,4 @@
-From d547d656c8063eff2db8dbab3e226e29288acd54 Mon Sep 17 00:00:00 2001
+From 449d13f69cf2a59d6e5b13e0db48d9f10592a34e Mon Sep 17 00:00:00 2001
 From: Dan McGregor <dan.mcgregor@usask.ca>
 Date: Wed, 26 Apr 2017 20:29:41 -0600
 Subject: [PATCH] clang: driver: Check sysroot for ldso path
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 21 insertions(+), 1 deletion(-)

 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index 8ac8d4eb9181..f1a334c7a081 100644
+index d525b417b4ea..1c31901ade74 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -515,8 +515,12 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -630,8 +630,12 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
          Triple.getEnvironment() == llvm::Triple::GNUEABIHFT64 ||
          tools::arm::getARMFloatABI(*this, Args) == tools::arm::FloatABI::Hard;

@@ -34,7 +34,7 @@ index 8ac8d4eb9181..f1a334c7a081 100644
      break;
    }
    case llvm::Triple::loongarch32: {
-@@ -570,11 +574,19 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -685,11 +689,19 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
      LibDir = "lib64";
      Loader =
          (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.so.1";
@@ -54,7 +54,7 @@ index 8ac8d4eb9181..f1a334c7a081 100644
      break;
    case llvm::Triple::riscv32:
    case llvm::Triple::riscv64: {
-@@ -592,6 +604,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -707,6 +719,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
    case llvm::Triple::sparcv9:
      LibDir = "lib64";
      Loader = "ld-linux.so.2";
@@ -65,7 +65,7 @@ index 8ac8d4eb9181..f1a334c7a081 100644
      break;
    case llvm::Triple::systemz:
      LibDir = "lib";
-@@ -606,6 +622,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -721,6 +737,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {

      LibDir = X32 ? "libx32" : "lib64";
      Loader = X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
diff --git a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
similarity index 86%
rename from meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
rename to meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
index 0ebabad3f6..a313639818 100644
--- a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
+++ b/meta/recipes-devtools/clang/clang/0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
@@ -1,4 +1,4 @@
-From 007986bc79780a879d9fbf77ac8565bf9c82eb8c Mon Sep 17 00:00:00 2001
+From 83c7e439b87352ac28f4f13cccd23ac9892bd624 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 May 2016 21:11:06 -0700
 Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+)

 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index f5e265585743..3565c9398f92 100644
+index cb6a9b242421..8f126474b7d1 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -551,6 +551,12 @@ void tools::gnutools::Linker::ConstructJob(Compilation &C, const JobAction &JA,
+@@ -539,6 +539,12 @@ void tools::gnutools::Linker::ConstructJob(Compilation &C, const JobAction &JA,
        if (IsIAMCU)
          CmdArgs.push_back("-lgloss");

diff --git a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch b/meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing-to-sysroot.patch
similarity index 88%
rename from meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
rename to meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing-to-sysroot.patch
index eb11427f96..95c3620a76 100644
--- a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
+++ b/meta/recipes-devtools/clang/clang/0007-clang-Prepend-trailing-to-sysroot.patch
@@ -1,4 +1,4 @@
-From 82ba05d9deeba4188f4a61d6a502565b22dad656 Mon Sep 17 00:00:00 2001
+From a4a69433c13e4d8f17c16920a7fee4370f3f99e8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 Mar 2017 09:02:13 -0700
 Subject: [PATCH] clang: Prepend trailing '/' to sysroot
@@ -25,10 +25,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index f1a334c7a081..67e922e08228 100644
+index 1c31901ade74..f7f096c1ac0a 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -215,7 +215,7 @@ Linux::Linux(const Driver &D, const llvm::Triple &Triple, const ArgList &Args)
+@@ -235,7 +235,7 @@ Linux::Linux(const Driver &D, const llvm::Triple &Triple, const ArgList &Args)
    Multilibs = GCCInstallation.getMultilibs();
    SelectedMultilibs.assign({GCCInstallation.getMultilib()});
    llvm::Triple::ArchType Arch = Triple.getArch();
diff --git a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch b/meta/recipes-devtools/clang/clang/0008-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
similarity index 89%
rename from meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
rename to meta/recipes-devtools/clang/clang/0008-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
index 4d60808814..9010a424c1 100644
--- a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
+++ b/meta/recipes-devtools/clang/clang/0008-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
@@ -1,4 +1,4 @@
-From caf707f3e0dfe6a589dbbd73a4d0edbe759892cd Mon Sep 17 00:00:00 2001
+From 210b589dcd380c54af2d74313203cb1b5dcf99eb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 Mar 2017 19:06:26 -0700
 Subject: [PATCH] clang: Look inside the target sysroot for compiler runtime
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 1 deletion(-)

 diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain.cpp
-index 07a3ae925f96..ec28b899f829 100644
+index 77a2c73f0d44..f39de1409c3c 100644
 --- a/clang/lib/Driver/ToolChain.cpp
 +++ b/clang/lib/Driver/ToolChain.cpp
 @@ -15,6 +15,7 @@
@@ -27,7 +27,7 @@ index 07a3ae925f96..ec28b899f829 100644
  #include "clang/Config/config.h"
  #include "clang/Driver/Action.h"
  #include "clang/Driver/CommonArgs.h"
-@@ -702,7 +703,10 @@ StringRef ToolChain::getOSLibName() const {
+@@ -723,7 +724,10 @@ StringRef ToolChain::getOSLibName() const {
  }

  std::string ToolChain::getCompilerRTPath() const {
diff --git a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch b/meta/recipes-devtools/clang/clang/0009-clang-Define-releative-gcc-installation-dir.patch
similarity index 93%
rename from meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
rename to meta/recipes-devtools/clang/clang/0009-clang-Define-releative-gcc-installation-dir.patch
index 5a170b3113..600af6165b 100644
--- a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
+++ b/meta/recipes-devtools/clang/clang/0009-clang-Define-releative-gcc-installation-dir.patch
@@ -1,4 +1,4 @@
-From efd146e3170d15f5c6fbe177ce98b61f796bb45b Mon Sep 17 00:00:00 2001
+From 34fea9c83ec264f37573a3498ad25d5f15cc5139 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 20 Mar 2021 16:09:16 -0700
 Subject: [PATCH] clang: Define / releative gcc installation dir
@@ -61,7 +61,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 14 insertions(+), 8 deletions(-)

 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index 3565c9398f92..6c52b337c16d 100644
+index 8f126474b7d1..c80980a7fb09 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
 @@ -18,6 +18,7 @@
@@ -71,8 +71,8 @@ index 3565c9398f92..6c52b337c16d 100644
 +#include "clang/Driver/Distro.h"
  #include "clang/Driver/Driver.h"
  #include "clang/Driver/MultilibBuilder.h"
- #include "clang/Driver/Options.h"
-@@ -2798,6 +2799,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
+ #include "clang/Driver/Tool.h"
+@@ -2847,6 +2848,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
      const llvm::Triple &TargetTriple, const ArgList &Args,
      const std::string &LibDir, StringRef CandidateTriple,
      bool NeedsBiarchSuffix, bool GCCDirExists, bool GCCCrossDirExists) {
@@ -80,7 +80,7 @@ index 3565c9398f92..6c52b337c16d 100644
    // Locations relative to the system lib directory where GCC's triple-specific
    // directories might reside.
    struct GCCLibSuffix {
-@@ -2809,19 +2811,20 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
+@@ -2858,19 +2860,20 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
      // Whether this library suffix is relevant for the triple.
      bool Active;
    } Suffixes[] = {
@@ -106,9 +106,9 @@ index 3565c9398f92..6c52b337c16d 100644
 +      // Debian puts cross-compilers in gcc-cross.
 +      {"gcc-cross/" + CandidateTriple.str(), "../..", GCCCrossDirExists}};

+   SmallVector<GCCInstallCandidate, 3> Installations;
    for (auto &Suffix : Suffixes) {
-     if (!Suffix.Active)
-@@ -3212,8 +3215,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::opt::ArgList &DriverArgs,
+@@ -3273,8 +3276,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::opt::ArgList &DriverArgs,
    // incompatible with the NDK libraries.
    SmallString<128> DriverIncludeDir(getDriver().Dir);
    llvm::sys::path::append(DriverIncludeDir, "..", "include");
diff --git a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch b/meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
similarity index 87%
rename from meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
rename to meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
index 35e0e7b8a0..730b1a69d6 100644
--- a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
+++ b/meta/recipes-devtools/clang/clang/0010-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
@@ -1,4 +1,4 @@
-From ec4353ee503799295624e1d3a23bd58f81916942 Mon Sep 17 00:00:00 2001
+From a2e17ab8cdaec876783272c4a981e1d0840dc2f3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Jul 2019 22:51:39 -0700
 Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for static
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)

 diff --git a/clang/lib/Driver/ToolChains/CommonArgs.cpp b/clang/lib/Driver/ToolChains/CommonArgs.cpp
-index 8d3775de9be5..d34b4d680c5e 100644
+index 10a1a412eea0..a217897610c3 100644
 --- a/clang/lib/Driver/ToolChains/CommonArgs.cpp
 +++ b/clang/lib/Driver/ToolChains/CommonArgs.cpp
-@@ -2326,6 +2326,8 @@ static void AddUnwindLibrary(const ToolChain &TC, const Driver &D,
+@@ -2415,6 +2415,8 @@ static void AddUnwindLibrary(const ToolChain &TC, const Driver &D,
          CmdArgs.push_back("-lunwind");
      } else if (LGT == LibGccType::StaticLibGcc) {
        CmdArgs.push_back("-l:libunwind.a");
diff --git a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch b/meta/recipes-devtools/clang/clang/0011-Check-for-atomic-double-intrinsics.patch
similarity index 94%
rename from meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
rename to meta/recipes-devtools/clang/clang/0011-Check-for-atomic-double-intrinsics.patch
index 3421465af4..47c6b3af3f 100644
--- a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
+++ b/meta/recipes-devtools/clang/clang/0011-Check-for-atomic-double-intrinsics.patch
@@ -1,4 +1,4 @@
-From d8aa37bcef7b1def50a84315b9a6165257a3a4f3 Mon Sep 17 00:00:00 2001
+From f5ede55e9ee16abace53b961767a96b705c35033 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 18 Nov 2019 17:00:29 -0800
 Subject: [PATCH] Check for atomic<double> intrinsics
diff --git a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
deleted file mode 100644
index 64c17d23f2..0000000000
--- a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From c3600b46f7fae26fb66fa48401617e6ca1be260c Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Thu, 26 Dec 2019 12:56:16 -0800
-Subject: [PATCH] Pass PYTHON_EXECUTABLE when cross compiling for native build
-
-Upstream-Status: Pending
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/cmake/modules/CrossCompile.cmake | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/llvm/cmake/modules/CrossCompile.cmake b/llvm/cmake/modules/CrossCompile.cmake
-index bfbd9cfd4063..2a69c5133c56 100644
---- a/llvm/cmake/modules/CrossCompile.cmake
-+++ b/llvm/cmake/modules/CrossCompile.cmake
-@@ -101,6 +101,7 @@ function(llvm_create_cross_target project_name target_name toolchain buildtype)
-         -DLLVM_INCLUDE_BENCHMARKS=OFF
-         -DLLVM_INCLUDE_TESTS=OFF
-         -DLLVM_TABLEGEN_FLAGS="${LLVM_TABLEGEN_FLAGS}"
-+        -DPYTHON_EXECUTABLE="${PYTHON_EXECUTABLE}"
-         ${build_type_flags} ${linker_flag} ${external_clang_dir} ${libc_flags}
-         ${ARGN}
-     WORKING_DIRECTORY ${${project_name}_${target_name}_BUILD}
diff --git a/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch b/meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-for-packages-using-find_package.patch
similarity index 90%
rename from meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
rename to meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-for-packages-using-find_package.patch
index b518da1724..3d80fb811c 100644
--- a/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
+++ b/meta/recipes-devtools/clang/clang/0012-cmake-Fix-configure-for-packages-using-find_package.patch
@@ -1,4 +1,4 @@
-From f2232b5332f650f4920e1f2a86530de9b26ef1fc Mon Sep 17 00:00:00 2001
+From 1fd496b6c684f5c2d3c562e1bfd8b176a604c55c Mon Sep 17 00:00:00 2001
 From: Ovidiu Panait <ovidiu.panait@windriver.com>
 Date: Fri, 31 Jan 2020 10:56:11 +0200
 Subject: [PATCH] cmake: Fix configure for packages using find_package()
@@ -51,10 +51,10 @@ index 4059fc3e986c..44d43aa8f25b 100644
    endif()
    set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEME ON)
 diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/AddLLVM.cmake
-index 83772ed8d2b1..1d184b8d613f 100644
+index d938214f9d0d..4816f2127e14 100644
 --- a/llvm/cmake/modules/AddLLVM.cmake
 +++ b/llvm/cmake/modules/AddLLVM.cmake
-@@ -1495,7 +1495,6 @@ macro(llvm_add_tool project name)
+@@ -1485,7 +1485,6 @@ macro(llvm_add_tool project name)
        if( LLVM_BUILD_TOOLS )
          get_target_export_arg(${name} ${project} export_to_llvmexports)
          install(TARGETS ${name}
@@ -62,7 +62,7 @@ index 83772ed8d2b1..1d184b8d613f 100644
                  RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
                  COMPONENT ${name})
          if (LLVM_ENABLE_PDB)
-@@ -1511,10 +1510,8 @@ macro(llvm_add_tool project name)
+@@ -1501,10 +1500,8 @@ macro(llvm_add_tool project name)
          endif()
        endif()
      endif()
@@ -75,7 +75,7 @@ index 83772ed8d2b1..1d184b8d613f 100644
    endif()
    get_subproject_title(subproject_title)
    set_target_properties(${name} PROPERTIES FOLDER "${subproject_title}/Tools")
-@@ -1569,7 +1566,6 @@ macro(add_llvm_utility name)
+@@ -1559,7 +1556,6 @@ macro(add_llvm_utility name)
      if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
        get_target_export_arg(${name} LLVM export_to_llvmexports)
        install(TARGETS ${name}
@@ -83,7 +83,7 @@ index 83772ed8d2b1..1d184b8d613f 100644
                RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
                COMPONENT ${name})
        if (LLVM_ENABLE_PDB)
-@@ -1583,7 +1579,6 @@ macro(add_llvm_utility name)
+@@ -1573,7 +1569,6 @@ macro(add_llvm_utility name)
                                   DEPENDS ${name}
                                   COMPONENT ${name})
        endif()
@@ -92,10 +92,10 @@ index 83772ed8d2b1..1d184b8d613f 100644
        set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY ${name})
      endif()
 diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/TableGen.cmake
-index 9a2e73a1e371..149c94487edb 100644
+index 84c03cd6432e..72da60ce3ca1 100644
 --- a/llvm/cmake/modules/TableGen.cmake
 +++ b/llvm/cmake/modules/TableGen.cmake
-@@ -227,12 +227,7 @@ macro(add_tablegen target project)
+@@ -237,12 +237,7 @@ macro(add_tablegen target project)

    if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AND
        (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DISTRIBUTION_COMPONENTS))
@@ -108,7 +108,7 @@ index 9a2e73a1e371..149c94487edb 100644
              COMPONENT ${target}
              RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
      if(NOT LLVM_ENABLE_IDE)
-@@ -243,7 +238,6 @@ macro(add_tablegen target project)
+@@ -253,7 +248,6 @@ macro(add_tablegen target project)
    endif()
    if(ADD_TABLEGEN_EXPORT)
      string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
diff --git a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch b/meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir-location-for-cross-toolchains.patch
similarity index 80%
rename from meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
rename to meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir-location-for-cross-toolchains.patch
index a9841fdc29..1247435624 100644
--- a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
+++ b/meta/recipes-devtools/clang/clang/0013-clang-Fix-resource-dir-location-for-cross-toolchains.patch
@@ -1,4 +1,4 @@
-From acc6845a5fc31b64640dece7786293f782a33f35 Mon Sep 17 00:00:00 2001
+From 4489105ec8cac2924ba1a9b97e93d220d5c80e4e Mon Sep 17 00:00:00 2001
 From: Jim Broadus <jbroadus@xevo.com>
 Date: Thu, 26 Mar 2020 16:05:53 -0700
 Subject: [PATCH] clang: Fix resource dir location for cross toolchains
@@ -13,17 +13,18 @@ As a fix for this, check the parent directory name. If that is "bin", then
 use that directory's parent.

 Upstream-Status: Pending
+
 Signed-off-by: Jim Broadus <jbroadus@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- clang/lib/Driver/Driver.cpp | 9 ++++++++-
+ clang/lib/Options/OptionUtils.cpp | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)

-diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
-index 55748c0bce91..306716809f54 100644
---- a/clang/lib/Driver/Driver.cpp
-+++ b/clang/lib/Driver/Driver.cpp
-@@ -188,6 +188,7 @@ std::string Driver::GetResourcesPath(StringRef BinaryPath) {
+diff --git a/clang/lib/Options/OptionUtils.cpp b/clang/lib/Options/OptionUtils.cpp
+index e5aefa012f67..7c1b657ce2c1 100644
+--- a/clang/lib/Options/OptionUtils.cpp
++++ b/clang/lib/Options/OptionUtils.cpp
+@@ -213,6 +213,7 @@ std::string clang::GetResourcesPath(StringRef BinaryPath) {

    // Dir is bin/ or lib/, depending on where BinaryPath is.
    StringRef Dir = llvm::sys::path::parent_path(BinaryPath);
@@ -31,7 +32,7 @@ index 55748c0bce91..306716809f54 100644
    SmallString<128> P(Dir);

    StringRef ConfiguredResourceDir(CLANG_RESOURCE_DIR);
-@@ -204,9 +205,15 @@ std::string Driver::GetResourcesPath(StringRef BinaryPath) {
+@@ -229,9 +230,15 @@ std::string clang::GetResourcesPath(StringRef BinaryPath) {
      // With a static-library build of libclang, LibClangPath will contain the
      // path of the embedding binary, which for LLVM binaries will be in bin/.
      // ../lib gets us to lib/ in both cases.
diff --git a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch b/meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
similarity index 89%
rename from meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
rename to meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
index 1b8e137813..27eec3575f 100644
--- a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
+++ b/meta/recipes-devtools/clang/clang/0014-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
@@ -1,4 +1,4 @@
-From cbb2d023069d3774a68ac37aa9815ba5e80f2903 Mon Sep 17 00:00:00 2001
+From 96609db9cb81baa404bff930cf3e0093a70367a7 Mon Sep 17 00:00:00 2001
 From: Oleksandr Ocheretnyi <oocheret@cisco.com>
 Date: Wed, 15 Apr 2020 00:08:39 +0300
 Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot for ldso
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 10 deletions(-)

 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index 67e922e08228..3ee2d56df00f 100644
+index f7f096c1ac0a..7b608a84a66e 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -517,8 +517,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -632,8 +632,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {

      Loader = HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
      LibDir = "lib32";
@@ -33,7 +33,7 @@ index 67e922e08228..3ee2d56df00f 100644
          LibDir = "lib";
      }
      break;
-@@ -574,8 +574,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -689,8 +689,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
      LibDir = "lib64";
      Loader =
          (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.so.1";
@@ -44,7 +44,7 @@ index 67e922e08228..3ee2d56df00f 100644
          LibDir = "lib";
      }
      break;
-@@ -583,8 +583,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -698,8 +698,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
      LibDir = "lib64";
      Loader =
          (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" : "ld64.so.2";
@@ -55,7 +55,7 @@ index 67e922e08228..3ee2d56df00f 100644
          LibDir = "lib";
      }
      break;
-@@ -604,8 +604,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -719,8 +719,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
    case llvm::Triple::sparcv9:
      LibDir = "lib64";
      Loader = "ld-linux.so.2";
@@ -66,7 +66,7 @@ index 67e922e08228..3ee2d56df00f 100644
          LibDir = "lib";
      }
      break;
-@@ -622,8 +622,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+@@ -737,8 +737,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {

      LibDir = X32 ? "libx32" : "lib64";
      Loader = X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
diff --git a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch b/meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-python-scripts.patch
similarity index 92%
rename from meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
rename to meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-python-scripts.patch
index d283d77c2b..cf31f0f2b7 100644
--- a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0015-clang-Use-python3-in-python-scripts.patch
@@ -1,4 +1,4 @@
-From 9ed96e86d625e5a08b1142798d6da13e8e9c62c6 Mon Sep 17 00:00:00 2001
+From eda6a8b4da8630db99fb23ca8a49a9375d4a8aa8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 14 Oct 2020 22:19:57 -0700
 Subject: [PATCH] clang: Use python3 in python scripts
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)

 diff --git a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
-index 471dbf8c110b..f98385dc6651 100755
+index 49a1b1493264..6158876d15f7 100755
 --- a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
 +++ b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
similarity index 91%
rename from meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
rename to meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
index 696253a602..f9cf5eb3b0 100644
--- a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
+++ b/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
@@ -1,4 +1,4 @@
-From 7cff6198ade4591b8bf2bfe4e94d7fe57241f926 Mon Sep 17 00:00:00 2001
+From 83ff15be59e49cdb746df59b5cb492b56552162e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 25 Jan 2021 16:14:35 +0800
 Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor names
@@ -97,18 +97,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 6 insertions(+), 1 deletion(-)

 diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clang/Driver/Distro.h
-index 5c25592e68ad..122095f98bca 100644
+index 0e17b30eb7e8..b449a62dc299 100644
 --- a/clang/include/clang/Driver/Distro.h
 +++ b/clang/include/clang/Driver/Distro.h
-@@ -47,6 +47,7 @@ public:
-     RHEL7,
+@@ -45,6 +45,7 @@ public:
+     RHEL10,
      Fedora,
      Gentoo,
 +    //CLANG_EXTRA_OE_DISTRO_NAME
      OpenSUSE,
-     UbuntuHardy,
-     UbuntuIntrepid,
-@@ -142,6 +143,7 @@ public:
+     UbuntuQuantal,
+     UbuntuRaring,
+@@ -132,6 +133,7 @@ public:

    bool IsGentoo() const { return DistroVal == Gentoo; }

@@ -117,7 +117,7 @@ index 5c25592e68ad..122095f98bca 100644
  };

 diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
-index 90e5a390be7e..1246236d62ef 100644
+index df10458d092d..61dc127a4574 100644
 --- a/clang/lib/Driver/Distro.cpp
 +++ b/clang/lib/Driver/Distro.cpp
 @@ -43,6 +43,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs::FileSystem &VFS) {
@@ -129,10 +129,10 @@ index 90e5a390be7e..1246236d62ef 100644
    return Version;
  }
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index 6c52b337c16d..df84e07da1fc 100644
+index c80980a7fb09..80fd8058bd98 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -2374,6 +2374,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
+@@ -2370,6 +2370,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
        "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
        "x86_64-redhat-linux",    "x86_64-suse-linux",
        "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
@@ -141,7 +141,7 @@ index 6c52b337c16d..df84e07da1fc 100644
    static const char *const X32Triples[] = {"x86_64-linux-gnux32",
                                             "x86_64-pc-linux-gnux32"};
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index 3ee2d56df00f..bb7270bb08ba 100644
+index 7b608a84a66e..4a0adedce09a 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
 @@ -81,6 +81,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
@@ -153,15 +153,15 @@ index 3ee2d56df00f..bb7270bb08ba 100644
    case llvm::Triple::aarch64:
      if (IsAndroid)
 diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Triple.cpp
-index 0584c941d2e6..6b9567ad0b8d 100644
+index a4f9dd42c0fe..86b74451ec0d 100644
 --- a/llvm/lib/TargetParser/Triple.cpp
 +++ b/llvm/lib/TargetParser/Triple.cpp
-@@ -668,7 +668,7 @@ static Triple::VendorType parseVendor(StringRef VendorName) {
-       .Case("mesa", Triple::Mesa)
+@@ -702,7 +702,7 @@ static Triple::VendorType parseVendor(StringRef VendorName) {
        .Case("suse", Triple::SUSE)
        .Case("oe", Triple::OpenEmbedded)
--      .Case("intel", Triple::Intel)
-+      .Case("intel", Triple::Intel) //CLANG_EXTRA_OE_VENDORS_CASES
+       .Case("intel", Triple::Intel)
+-      .Case("meta", Triple::Meta)
++      .Case("meta", Triple::Meta) //CLANG_EXTRA_OE_VENDORS_CASES
        .Default(Triple::UnknownVendor);
  }

diff --git a/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch b/meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
similarity index 97%
rename from meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
rename to meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
index 79b396e132..b591fecc7e 100644
--- a/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
+++ b/meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
@@ -1,4 +1,4 @@
-From 806d90c9bead326dc1d181fdc6449f7c14f6abef Mon Sep 17 00:00:00 2001
+From 4902e73e4bfaec34ddeb5b367b0b197b3cece5f2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 May 2021 17:32:13 -0700
 Subject: [PATCH] compiler-rt: Do not use backtrace APIs on non-glibc linux
diff --git a/meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch b/meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
new file mode 100644
index 0000000000..b4db6c1996
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0018-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
@@ -0,0 +1,29 @@
+From c61bf65967bfd083862f227c69e2e0dc51b0ecc2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 May 2021 17:56:03 -0700
+Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux distros
+
+OpenEmbedded does not hardcode mutli-arch like debian therefore ensure
+that it still uses the proper tuple
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
+index 4a0adedce09a..9fed904c05c2 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -227,8 +227,9 @@ Linux::Linux(const Driver &D, const llvm::Triple &Triple, const ArgList &Args)
+     : Generic_ELF(D, Triple, Args) {
+   GCCInstallation.TripleToDebianMultiarch = [](const llvm::Triple &T) {
+     StringRef TripleStr = T.str();
++    // OpenEmbedded does not hardcode the triple to i386-linux-gnu like debian
+     StringRef DebianMultiarch =
+-        T.getArch() == llvm::Triple::x86 ? "i386-linux-gnu" : TripleStr;
++        T.getArch() == llvm::Triple::x86 && T.getVendor() != llvm::Triple::OpenEmbedded ? "i386-linux-gnu" : TripleStr;
+     return DebianMultiarch;
+   };
+
diff --git a/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch b/meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_backtrace-method.patch
similarity index 82%
rename from meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
rename to meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_backtrace-method.patch
index 2580c9e68e..9440b73767 100644
--- a/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
+++ b/meta/recipes-devtools/clang/clang/0019-libunwind-Added-unw_backtrace-method.patch
@@ -1,4 +1,4 @@
-From 04c601a6a77aff75bae5e395c5c6a21446ad1856 Mon Sep 17 00:00:00 2001
+From 66fd11e91ad01fd8065d5545caabd86cf73b0a82 Mon Sep 17 00:00:00 2001
 From: Maksim Kita <maksim-kita@yandex-team.ru>
 Date: Sun, 23 May 2021 10:27:29 +0000
 Subject: [PATCH] libunwind: Added unw_backtrace method
@@ -12,22 +12,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 21 insertions(+)

 diff --git a/libunwind/include/libunwind.h b/libunwind/include/libunwind.h
-index b2dae8feed9a..0ab974c9bfa4 100644
+index 56ca7110274a..60a27f28100b 100644
 --- a/libunwind/include/libunwind.h
 +++ b/libunwind/include/libunwind.h
-@@ -130,6 +130,7 @@ extern int unw_is_fpreg(unw_cursor_t *, unw_regnum_t) LIBUNWIND_AVAIL;
- extern int unw_is_signal_frame(unw_cursor_t *) LIBUNWIND_AVAIL;
+@@ -235,6 +235,7 @@ extern int unw_is_signal_frame(unw_cursor_t *) LIBUNWIND_AVAIL;
  extern int unw_get_proc_name(unw_cursor_t *, char *, size_t, unw_word_t *) LIBUNWIND_AVAIL;
  //extern int       unw_get_save_loc(unw_cursor_t*, int, unw_save_loc_t*);
+ extern const char *unw_strerror(int) LIBUNWIND_AVAIL;
 +extern int unw_backtrace(void **, int) LIBUNWIND_AVAIL;

  extern unw_addr_space_t unw_local_addr_space;

 diff --git a/libunwind/src/libunwind.cpp b/libunwind/src/libunwind.cpp
-index cf39ec5f7dbd..1896f20d57f8 100644
+index 7ffffc2a30c0..ed0b394cb002 100644
 --- a/libunwind/src/libunwind.cpp
 +++ b/libunwind/src/libunwind.cpp
-@@ -431,6 +431,26 @@ int __unw_remove_find_dynamic_unwind_sections(
+@@ -531,6 +531,26 @@ int __unw_remove_find_dynamic_unwind_sections(

  #endif // __APPLE__

diff --git a/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch b/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
deleted file mode 100644
index 5646fcd026..0000000000
--- a/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 38c0e64da50d88605728f26c5d9dd6fbbb84ec82 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 May 2021 17:56:03 -0700
-Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux distros
-
-OpenEmbedded does not hardcode mutli-arch like debian therefore ensure
-that it still uses the proper tuple
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- clang/lib/Driver/ToolChains/Linux.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index bb7270bb08ba..6354c4d06570 100644
---- a/clang/lib/Driver/ToolChains/Linux.cpp
-+++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -720,6 +720,9 @@ void Linux::addLibStdCxxIncludePaths(const llvm::opt::ArgList &DriverArgs,
-       GCCInstallation.getTriple().getArch() == llvm::Triple::x86
-           ? "i386-linux-gnu"
-           : TripleStr;
-+  // OpenEmbedded does not hardcode the triple to i386-linux-gnu like debian
-+  if (GCCInstallation.getTriple().getVendor() == llvm::Triple::OpenEmbedded)
-+	  DebianMultiarch = TripleStr;
-
-   // Try generic GCC detection first.
-   if (Generic_GCC::addGCCLibStdCxxIncludePaths(DriverArgs, CC1Args,
diff --git a/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch b/meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatomic-on-x86.patch
similarity index 92%
rename from meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
rename to meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatomic-on-x86.patch
index cc25c4b5cb..86572c9f5c 100644
--- a/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
+++ b/meta/recipes-devtools/clang/clang/0020-lldb-Link-with-libatomic-on-x86.patch
@@ -1,4 +1,4 @@
-From 1e5283110b9c089eece00e3104704f2317bd7586 Mon Sep 17 00:00:00 2001
+From d3369eb71b185b8dd4a861c95f3ee1c37f4c4d62 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Feb 2022 01:31:26 -0800
 Subject: [PATCH] lldb: Link with libatomic on x86
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)

 diff --git a/lldb/source/Utility/CMakeLists.txt b/lldb/source/Utility/CMakeLists.txt
-index 1dd4d63f7016..8821b73be476 100644
+index 04f1692e53b3..da0a48d9da54 100644
 --- a/lldb/source/Utility/CMakeLists.txt
 +++ b/lldb/source/Utility/CMakeLists.txt
 @@ -19,6 +19,10 @@ if (CMAKE_SYSTEM_NAME MATCHES "Windows")
diff --git a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch b/meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__int128-for-ppc32.patch
similarity index 68%
rename from meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
rename to meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__int128-for-ppc32.patch
index 866a1ecc70..0ddac62e0f 100644
--- a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
+++ b/meta/recipes-devtools/clang/clang/0021-compiler-rt-Enable-__int128-for-ppc32.patch
@@ -1,4 +1,4 @@
-From 371173b5c202288f7992fb4855ec631250b691b4 Mon Sep 17 00:00:00 2001
+From 223392b1ee3179b237856447ca42ab527276a995 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Mar 2022 16:28:16 -0800
 Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
@@ -6,15 +6,15 @@ Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- compiler-rt/lib/builtins/CMakeLists.txt | 15 +++++++--------
+ compiler-rt/lib/builtins/CMakeLists.txt | 13 ++++++-------
  compiler-rt/lib/builtins/int_types.h    |  2 +-
- 2 files changed, 8 insertions(+), 9 deletions(-)
+ 2 files changed, 7 insertions(+), 8 deletions(-)

 diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/builtins/CMakeLists.txt
-index 3ab92403d416..9c1148e2a8e3 100644
+index c3dbd65998f1..b3a44ea3c3b3 100644
 --- a/compiler-rt/lib/builtins/CMakeLists.txt
 +++ b/compiler-rt/lib/builtins/CMakeLists.txt
-@@ -752,11 +752,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}
+@@ -813,11 +813,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}

  set(nvptx64_SOURCES ${GENERIC_SOURCES})

@@ -27,7 +27,7 @@ index 3ab92403d416..9c1148e2a8e3 100644
    ppc/divtc3.c
    ppc/fixtfdi.c
    ppc/fixunstfdi.c
-@@ -771,14 +769,15 @@ set(powerpc64_SOURCES
+@@ -832,14 +830,15 @@ set(powerpc64_SOURCES
  )
  # These routines require __int128, which isn't supported on AIX.
  if (NOT OS_NAME MATCHES "AIX")
@@ -46,18 +46,15 @@ index 3ab92403d416..9c1148e2a8e3 100644

  set(riscv_SOURCES
    cpu_model/riscv.c
-@@ -948,9 +947,9 @@ else ()
-         list(APPEND BUILTIN_CFLAGS_${arch} -fomit-frame-pointer -DCOMPILER_RT_ARMHF_TARGET)
-       endif()
+@@ -1014,7 +1013,7 @@ else ()

--      # For RISCV32, we must force enable int128 for compiling long
-+      # For RISCV32/PPC32, we must force enable int128 for compiling long
+       # For RISCV32 and 32-bit SPARC, we must force enable int128 for compiling long
        # double routines.
--      if(COMPILER_RT_ENABLE_SOFTWARE_INT128 OR "${arch}" STREQUAL "riscv32")
-+      if(COMPILER_RT_ENABLE_SOFTWARE_INT128 OR "${arch}" STREQUAL "riscv32" OR "${arch}" STREQUAL "powerpc")
+-      if (COMPILER_RT_ENABLE_SOFTWARE_INT128 OR ("${arch}" MATCHES "riscv32|sparc$"
++      if (COMPILER_RT_ENABLE_SOFTWARE_INT128 OR ("${arch}" MATCHES "riscv32|powerpc|sparc$"
+         AND NOT CMAKE_COMPILER_IS_GNUCC))
          list(APPEND BUILTIN_CFLAGS_${arch} -fforce-enable-int128)
        endif()
-
 diff --git a/compiler-rt/lib/builtins/int_types.h b/compiler-rt/lib/builtins/int_types.h
 index 7c7f8cb64aa9..81386f1b99b0 100644
 --- a/compiler-rt/lib/builtins/int_types.h
diff --git a/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch b/meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
similarity index 91%
rename from meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
rename to meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
index 6d5e7db46b..025e52078d 100644
--- a/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
+++ b/meta/recipes-devtools/clang/clang/0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
@@ -1,4 +1,4 @@
-From 71b10214a98cdd3fdec3965a1195ce8cc70baf96 Mon Sep 17 00:00:00 2001
+From 8f03c695454a0a79a7f8bc651434e651f46c1f02 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Aug 2022 11:50:57 -0700
 Subject: [PATCH] llvm: Do not use cmake infra to detect libzstd
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)

 diff --git a/llvm/lib/Support/CMakeLists.txt b/llvm/lib/Support/CMakeLists.txt
-index a579eaf7d953..6eba2b7a8e6c 100644
+index 099b0e55579b..8c35b8a31457 100644
 --- a/llvm/lib/Support/CMakeLists.txt
 +++ b/llvm/lib/Support/CMakeLists.txt
 @@ -22,7 +22,7 @@ if (HAS_WERROR_GLOBAL_CTORS)
@@ -42,7 +42,7 @@ index a579eaf7d953..6eba2b7a8e6c 100644
  endif()

  if( WIN32 )
-@@ -339,7 +339,7 @@ if(LLVM_ENABLE_ZLIB)
+@@ -351,7 +351,7 @@ if(LLVM_ENABLE_ZLIB)
      get_property(zlib_library TARGET ZLIB::ZLIB PROPERTY LOCATION)
    endif()
    get_library_name(${zlib_library} zlib_library)
@@ -51,7 +51,7 @@ index a579eaf7d953..6eba2b7a8e6c 100644
  endif()

  if(LLVM_ENABLE_ZSTD)
-@@ -353,7 +353,7 @@ if(LLVM_ENABLE_ZSTD)
+@@ -365,7 +365,7 @@ if(LLVM_ENABLE_ZSTD)
    endif()
    if (zstd_target STREQUAL zstd::libzstd_shared)
      get_library_name(${zstd_library} zstd_library)
diff --git a/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch b/meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
similarity index 88%
rename from meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
rename to meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
index 409b60132e..241dcc0b14 100644
--- a/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
+++ b/meta/recipes-devtools/clang/clang/0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
@@ -1,4 +1,4 @@
-From 8245da75b5626e2361ed2833cdfd08a51dc70459 Mon Sep 17 00:00:00 2001
+From d463a5bde09e3aa42eef12dafca5090d11000434 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Jan 2023 18:44:34 -0800
 Subject: [PATCH] compiler-rt: Fix stat struct's size for O32 ABI
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+)

 diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
-index f118d53f0df8..c72814288990 100644
+index 05ebee49f2ab..89c4dcaf3e3d 100644
 --- a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
 +++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -98,6 +98,18 @@ const unsigned struct_kernel_stat64_sz = 104;
+@@ -100,6 +100,18 @@ const unsigned struct_kernel_stat64_sz = 104;
  const unsigned struct_kernel_stat_sz = 144;
  const unsigned struct_kernel_stat64_sz = 104;
  #    elif defined(__mips__)
@@ -36,7 +36,7 @@ index f118d53f0df8..c72814288990 100644
  const unsigned struct_kernel_stat_sz = SANITIZER_ANDROID
                                             ? FIRST_32_SECOND_64(104, 128)
  #      if defined(_ABIN32) && _MIPS_SIM == _ABIN32
-@@ -108,6 +120,7 @@ const unsigned struct_kernel_stat_sz = SANITIZER_ANDROID
+@@ -110,6 +122,7 @@ const unsigned struct_kernel_stat_sz = SANITIZER_ANDROID
                                             : FIRST_32_SECOND_64(160, 216);
  #      endif
  const unsigned struct_kernel_stat64_sz = 104;
diff --git a/meta/recipes-devtools/clang/clang/0026-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch b/meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
similarity index 98%
rename from meta/recipes-devtools/clang/clang/0026-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
rename to meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
index 6c8dfb96b7..66f8206cb9 100644
--- a/meta/recipes-devtools/clang/clang/0026-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
+++ b/meta/recipes-devtools/clang/clang/0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
@@ -1,4 +1,4 @@
-From fa56e3ce3bbd7b795ab553a1b5da4a0f90589fda Mon Sep 17 00:00:00 2001
+From f131292f065b8f0abaf747f27b390ce0cc91d88d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 31 Aug 2023 18:14:47 +0200
 Subject: [PATCH] ToolChains/Gnu.cpp: ARMLibDirs search also in lib32
@@ -55,10 +55,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 2 insertions(+), 1 deletion(-)

 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index df84e07da1fc..21c8a30719e0 100644
+index 80fd8058bd98..37cb6cfdf2da 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -2350,7 +2350,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
+@@ -2346,7 +2346,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
    static const char *const AArch64beLibDirs[] = {"/lib"};
    static const char *const AArch64beTriples[] = {"aarch64_be-none-linux-gnu"};

@@ -68,7 +68,7 @@ index df84e07da1fc..21c8a30719e0 100644
    static const char *const ARMHFTriples[] = {"arm-linux-gnueabihf",
                                               "armv7hl-redhat-linux-gnueabi",
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index 6354c4d06570..c77337561b89 100644
+index 9fed904c05c2..5bb66c9faa1f 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
 @@ -198,6 +198,7 @@ static StringRef getOSLibDir(const llvm::Triple &Triple, const ArgList &Args) {
diff --git a/meta/recipes-devtools/clang/clang/0027-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch b/meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
similarity index 88%
rename from meta/recipes-devtools/clang/clang/0027-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
rename to meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
index 40fb95439a..b7b4e9430d 100644
--- a/meta/recipes-devtools/clang/clang/0027-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
+++ b/meta/recipes-devtools/clang/clang/0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
@@ -1,4 +1,4 @@
-From 6d381de086b2646c438af919f2f1ed2c46c8e89a Mon Sep 17 00:00:00 2001
+From c709e3253eada59c2d17bd6bc826180247e9692b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 3 Feb 2024 16:47:10 -0800
 Subject: [PATCH] clang/llvm: Add OE specific ABI triple for N32 ABI
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 3 deletions(-)

 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
-index 21c8a30719e0..3a0f1a247481 100644
+index 37cb6cfdf2da..bcd7d345c25a 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
-@@ -2413,6 +2413,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
+@@ -2415,6 +2415,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(

    static const char *const MIPSN32LibDirs[] = {"/lib32"};
    static const char *const MIPSN32Triples[] = {"mips64-linux-gnuabin32",
@@ -26,7 +26,7 @@ index 21c8a30719e0..3a0f1a247481 100644
    static const char *const MIPSN32ELLibDirs[] = {"/lib32"};
    static const char *const MIPSN32ELTriples[] = {
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
-index c77337561b89..9a7f8ffd72e2 100644
+index 5bb66c9faa1f..c6d6e20dbc4d 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
 @@ -138,7 +138,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
@@ -48,10 +48,10 @@ index c77337561b89..9a7f8ffd72e2 100644
        return MT;
      if (D.getVFS().exists(concat(SysRoot, "/lib/mips64el-linux-gnu")))
 diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Triple.cpp
-index 6b9567ad0b8d..6eafade97808 100644
+index 86b74451ec0d..d94b7d44d11a 100644
 --- a/llvm/lib/TargetParser/Triple.cpp
 +++ b/llvm/lib/TargetParser/Triple.cpp
-@@ -339,7 +339,7 @@ StringRef Triple::getEnvironmentTypeName(EnvironmentType Kind) {
+@@ -358,7 +358,7 @@ StringRef Triple::getEnvironmentTypeName(EnvironmentType Kind) {
    case GNU: return "gnu";
    case GNUT64: return "gnut64";
    case GNUABI64: return "gnuabi64";
@@ -60,7 +60,7 @@ index 6b9567ad0b8d..6eafade97808 100644
    case GNUEABI: return "gnueabi";
    case GNUEABIT64: return "gnueabit64";
    case GNUEABIHF: return "gnueabihf";
-@@ -725,6 +725,7 @@ static Triple::EnvironmentType parseEnvironment(StringRef EnvironmentName) {
+@@ -762,6 +762,7 @@ static Triple::EnvironmentType parseEnvironment(StringRef EnvironmentName) {
        .StartsWith("eabihf", Triple::EABIHF)
        .StartsWith("eabi", Triple::EABI)
        .StartsWith("gnuabin32", Triple::GNUABIN32)
@@ -68,7 +68,7 @@ index 6b9567ad0b8d..6eafade97808 100644
        .StartsWith("gnuabi64", Triple::GNUABI64)
        .StartsWith("gnueabihft64", Triple::GNUEABIHFT64)
        .StartsWith("gnueabihf", Triple::GNUEABIHF)
-@@ -1039,6 +1040,7 @@ Triple::Triple(std::string &&Str) : Data(std::move(Str)) {
+@@ -1087,6 +1088,7 @@ Triple::Triple(std::string &&Str) : Data(std::move(Str)) {
        Environment =
            StringSwitch<Triple::EnvironmentType>(Components[0])
                .StartsWith("mipsn32", Triple::GNUABIN32)
diff --git a/meta/recipes-devtools/clang/clang/0028-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
similarity index 97%
rename from meta/recipes-devtools/clang/clang/0028-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
rename to meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
index 407956f8ee..6c0d57637c 100644
--- a/meta/recipes-devtools/clang/clang/0028-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
@@ -1,4 +1,4 @@
-From c9060d3385b65e9a3d514801c68da7aa41647c5b Mon Sep 17 00:00:00 2001
+From e6188607010124711424b0e740026eb814260a01 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2024 22:04:43 -0700
 Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
diff --git a/meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch b/meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
new file mode 100644
index 0000000000..43154fc25c
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
@@ -0,0 +1,90 @@
+From 65c639d79a5f914cfdfaf1357f0583d2a96d927e Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 13 Sep 2024 13:38:08 +0200
+Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other tools do
+
+* other libraries are installed in 'lib64' or 'lib32' based on
+  LLVM_LIBDIR_SUFFIX value, but libscanbuild files were always
+  installed in 'lib'
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/108549]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ clang/tools/scan-build-py/CMakeLists.txt | 38 ++++++++++++------------
+ 1 file changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/clang/tools/scan-build-py/CMakeLists.txt b/clang/tools/scan-build-py/CMakeLists.txt
+index 84087a9fd8d2..ed1e55cc099f 100644
+--- a/clang/tools/scan-build-py/CMakeLists.txt
++++ b/clang/tools/scan-build-py/CMakeLists.txt
+@@ -80,50 +80,50 @@ if(CLANG_INSTALL_SCANBUILDPY)
+   endforeach()
+
+   foreach(lib ${LibScanbuild})
+-    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libscanbuild/${lib}
++    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/${lib}
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+                          ${CMAKE_BINARY_DIR}/lib
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+-                         ${CMAKE_BINARY_DIR}/lib/libscanbuild
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild
+                        COMMAND ${CMAKE_COMMAND} -E copy
+-                         ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/${lib}
+-                         ${CMAKE_BINARY_DIR}/lib/libscanbuild/
+-                       DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/${lib})
+-    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libscanbuild/${lib})
++                         ${CMAKE_CURRENT_SOURCE_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/${lib}
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/
++                       DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/${lib})
++    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/${lib})
+     install(FILES lib/libscanbuild/${lib}
+             DESTINATION lib/libscanbuild
+             COMPONENT scan-build-py)
+   endforeach()
+
+   foreach(resource ${LibScanbuildResources})
+-    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources/${resource}
++    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources/${resource}
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+                          ${CMAKE_BINARY_DIR}/lib
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+-                         ${CMAKE_BINARY_DIR}/lib/libscanbuild
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+-                         ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources
+                        COMMAND ${CMAKE_COMMAND} -E copy
+-                         ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/resources/${resource}
+-                         ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources
+-                       DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/resources/${resource})
+-    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources/${resource})
++                         ${CMAKE_CURRENT_SOURCE_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources/${resource}
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources
++                       DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources/${resource})
++    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources/${resource})
+     install(FILES lib/libscanbuild/resources/${resource}
+             DESTINATION lib/libscanbuild/resources
+             COMPONENT scan-build-py)
+   endforeach()
+
+   foreach(lib ${LibEar})
+-    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libear/${lib}
++    add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/${lib}
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+                          ${CMAKE_BINARY_DIR}/lib
+                        COMMAND ${CMAKE_COMMAND} -E make_directory
+-                         ${CMAKE_BINARY_DIR}/lib/libear
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear
+                        COMMAND ${CMAKE_COMMAND} -E copy
+-                         ${CMAKE_CURRENT_SOURCE_DIR}/lib/libear/${lib}
+-                         ${CMAKE_BINARY_DIR}/lib/libear/
+-                       DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libear/${lib})
+-    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libear/${lib})
++                         ${CMAKE_CURRENT_SOURCE_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/${lib}
++                         ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/
++                       DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/${lib})
++    list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/${lib})
+     install(FILES lib/libear/${lib}
+             DESTINATION lib/libear
+             COMPONENT scan-build-py)
diff --git a/meta/recipes-devtools/clang/clang/0030-compiler-rt-Do-not-pass-target-to-clang-compiler.patch b/meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
similarity index 91%
rename from meta/recipes-devtools/clang/clang/0030-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
rename to meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
index 3a670bf94f..84384a3700 100644
--- a/meta/recipes-devtools/clang/clang/0030-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
+++ b/meta/recipes-devtools/clang/clang/0028-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
@@ -1,4 +1,4 @@
-From 223ba6978ee5d198e4dd792e702e5049d53bde37 Mon Sep 17 00:00:00 2001
+From 2363194c7a0aa99fa94f83c1508573070ab0a6e3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Mar 2025 00:30:38 -0700
 Subject: [PATCH] compiler-rt: Do not pass --target to clang compiler
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 deletions(-)

 diff --git a/compiler-rt/lib/fuzzer/CMakeLists.txt b/compiler-rt/lib/fuzzer/CMakeLists.txt
-index 6db24610df1f..692e194c2a98 100644
+index a57e2fe46245..2928ed2ab6d5 100644
 --- a/compiler-rt/lib/fuzzer/CMakeLists.txt
 +++ b/compiler-rt/lib/fuzzer/CMakeLists.txt
 @@ -140,10 +140,6 @@ if(OS_NAME MATCHES "Android|Linux|Fuchsia" AND
diff --git a/meta/recipes-devtools/clang/clang/0031-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
similarity index 89%
rename from meta/recipes-devtools/clang/clang/0031-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
rename to meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index f5ae5cca4c..2d188352c3 100644
--- a/meta/recipes-devtools/clang/clang/0031-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/clang/clang/0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From be6d7ca8f69615782b7376e61ff65feb0b389b58 Mon Sep 17 00:00:00 2001
+From 1cd4d023741bed5bc761a0ca598cb534448e531d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)

 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index bfd158614ae3..7b1a0ec686da 100644
+index e6085af5aa91..b0180638c754 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -362,7 +362,10 @@ public:
+@@ -384,7 +384,10 @@ public:
      // name of a class shouldn't be significant. However, some of the backends
      // accidentally rely on this behaviour, so it will have to stay like this
      // until they are fixed.
diff --git a/meta/recipes-devtools/clang/clang/0029-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch b/meta/recipes-devtools/clang/clang/0029-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
deleted file mode 100644
index 47af9a0541..0000000000
--- a/meta/recipes-devtools/clang/clang/0029-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 0380d07443155f26cca1fef70a21426faf102624 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Fri, 13 Sep 2024 13:38:08 +0200
-Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other tools do
-
-* other libraries are installed in 'lib64' or 'lib32' based on
-  LLVM_LIBDIR_SUFFIX value, but libscanbuild files were always
-  installed in 'lib'
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/108549]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- clang/tools/scan-build-py/CMakeLists.txt | 38 ++++++++++++------------
- 1 file changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/clang/tools/scan-build-py/CMakeLists.txt b/clang/tools/scan-build-py/CMakeLists.txt
-index 9273eb5ed977..9033786d2da5 100644
---- a/clang/tools/scan-build-py/CMakeLists.txt
-+++ b/clang/tools/scan-build-py/CMakeLists.txt
-@@ -77,52 +77,52 @@ foreach(lib ${LibExecs})
- endforeach()
-
- foreach(lib ${LibScanbuild})
--  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libscanbuild/${lib}
-+  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/${lib}
-                      COMMAND ${CMAKE_COMMAND} -E make_directory
--                       ${CMAKE_BINARY_DIR}/lib
-+                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}
-                      COMMAND ${CMAKE_COMMAND} -E make_directory
--                       ${CMAKE_BINARY_DIR}/lib/libscanbuild
-+                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild
-                      COMMAND ${CMAKE_COMMAND} -E copy
-                        ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/${lib}
--                       ${CMAKE_BINARY_DIR}/lib/libscanbuild/
-+                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/
-                      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/${lib})
--  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libscanbuild/${lib})
-+  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/${lib})
-   install(FILES lib/libscanbuild/${lib}
--          DESTINATION lib/libscanbuild
-+          DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libscanbuild
-           COMPONENT scan-build-py)
- endforeach()
-
- foreach(resource ${LibScanbuildResources})
--  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources/${resource}
-+  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources/${resource}
-                      COMMAND ${CMAKE_COMMAND} -E make_directory
--                       ${CMAKE_BINARY_DIR}/lib
-+                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}
-                      COMMAND ${CMAKE_COMMAND} -E make_directory
--                       ${CMAKE_BINARY_DIR}/lib/libscanbuild
-+                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild
-                      COMMAND ${CMAKE_COMMAND} -E make_directory
--                       ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources
-+                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources
-                      COMMAND ${CMAKE_COMMAND} -E copy
-                        ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/resources/${resource}
--                       ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources
-+                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources
-                      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/resources/${resource})
--  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources/${resource})
-+  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources/${resource})
-   install(FILES lib/libscanbuild/resources/${resource}
--          DESTINATION lib/libscanbuild/resources
-+          DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources
-           COMPONENT scan-build-py)
- endforeach()
-
- foreach(lib ${LibEar})
--  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libear/${lib}
-+  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/${lib}
-                      COMMAND ${CMAKE_COMMAND} -E make_directory
--                       ${CMAKE_BINARY_DIR}/lib
-+                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}
-                      COMMAND ${CMAKE_COMMAND} -E make_directory
--                       ${CMAKE_BINARY_DIR}/lib/libear
-+                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear
-                      COMMAND ${CMAKE_COMMAND} -E copy
-                        ${CMAKE_CURRENT_SOURCE_DIR}/lib/libear/${lib}
--                       ${CMAKE_BINARY_DIR}/lib/libear/
-+                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/
-                      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libear/${lib})
--  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libear/${lib})
-+  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/${lib})
-   install(FILES lib/libear/${lib}
--          DESTINATION lib/libear
-+          DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libear
-           COMPONENT scan-build-py)
- endforeach()
-
diff --git a/meta/recipes-devtools/clang/clang/0032-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
similarity index 71%
rename from meta/recipes-devtools/clang/clang/0032-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
rename to meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
index cfa24d8c4b..2413328dca 100644
--- a/meta/recipes-devtools/clang/clang/0032-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
+++ b/meta/recipes-devtools/clang/clang/0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
@@ -1,4 +1,4 @@
-From ac2b09550c5b7e51e4ac70ff5dfa006a54e0bf0e Mon Sep 17 00:00:00 2001
+From c98860bee062b81b9cad4b9c07e6c0e6f37801a6 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 2 Apr 2025 17:05:17 +0300
 Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
@@ -18,15 +18,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index c092db81bb8f..a02cc25020a7 100644
+index 0a3f51ae2b83..5c95a1f3ff24 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -542,7 +542,7 @@ int main(int argc, char **argv) {
-         OS << ActiveIncludeOption << ' ' << LLVM_CXXFLAGS << '\n';
-       } else if (Arg == "--ldflags") {
-         OS << ((HostTriple.isWindowsMSVCEnvironment()) ? "-LIBPATH:" : "-L")
--           << ActiveLibDir << ' ' << LLVM_LDFLAGS << '\n';
-+           << ActiveLibDir << '\n';
+@@ -576,7 +576,7 @@ int main(int argc, char **argv) {
+             HostTriple.isWindowsMSVCEnvironment() ? "-LIBPATH:" : "-L";
+         LDFlags += ActiveLibDir;
+         MaybePrintQuoted(LDFlags);
+-        OS << ' ' << LLVM_LDFLAGS << '\n';
++        OS << '\n';
        } else if (Arg == "--system-libs") {
          PrintSystemLibs = true;
        } else if (Arg == "--libs") {
diff --git a/meta/recipes-devtools/clang/clang/0033-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch b/meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
similarity index 95%
rename from meta/recipes-devtools/clang/clang/0033-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
rename to meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
index e586de7d99..d20041dc63 100644
--- a/meta/recipes-devtools/clang/clang/0033-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
+++ b/meta/recipes-devtools/clang/clang/0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
@@ -1,4 +1,4 @@
-From 2c1f2effb8a5489fbb384610d7bf515a2c5b9b68 Mon Sep 17 00:00:00 2001
+From a53fec9b2df6089fd813e625e32c60db3f47a782 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 May 2025 14:03:12 -0700
 Subject: [PATCH] compiler-rt: Exclude sync_fetch_and_* for any pre-ARMv6
@@ -40,10 +40,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)

 diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/builtins/CMakeLists.txt
-index 9c1148e2a8e3..9a15606e1e22 100644
+index b3a44ea3c3b3..4a328ab0ca26 100644
 --- a/compiler-rt/lib/builtins/CMakeLists.txt
 +++ b/compiler-rt/lib/builtins/CMakeLists.txt
-@@ -908,6 +908,18 @@ else ()
+@@ -975,6 +975,18 @@ else ()
          ${TARGET_${arch}_CFLAGS})
        list(JOIN CMAKE_REQUIRED_FLAGS " " CMAKE_REQUIRED_FLAGS)
        message(STATUS "Performing additional configure checks with target flags: ${CMAKE_REQUIRED_FLAGS}")
diff --git a/meta/recipes-devtools/clang/clang/0034-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch b/meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
similarity index 93%
rename from meta/recipes-devtools/clang/clang/0034-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
rename to meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
index 9ccd4997b0..db8683630d 100644
--- a/meta/recipes-devtools/clang/clang/0034-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
+++ b/meta/recipes-devtools/clang/clang/0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
@@ -1,4 +1,4 @@
-From e7ec5120258d95ac015100cbfe4e595d4592d47b Mon Sep 17 00:00:00 2001
+From d52b056f8450bb6dd224b7f905ebbab846197e00 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 22 May 2025 21:50:45 -0700
 Subject: [PATCH] [compiler-rt] Hardcode uptr/sptr typedefs on Mips/Linux
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
-index fff60c96f632..511ee8fe49cc 100644
+index c719e2a8ef60..60b997e653c4 100644
 --- a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
 +++ b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
 @@ -139,7 +139,7 @@
diff --git a/meta/recipes-devtools/clang/clang/0035-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch b/meta/recipes-devtools/clang/clang/0033-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
similarity index 88%
rename from meta/recipes-devtools/clang/clang/0035-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
rename to meta/recipes-devtools/clang/clang/0033-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
index 88e6fa9c4d..d630e8cf13 100644
--- a/meta/recipes-devtools/clang/clang/0035-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
+++ b/meta/recipes-devtools/clang/clang/0033-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
@@ -1,4 +1,4 @@
-From c4e8df6a492de2d98be18093de2fe0d97e221d48 Mon Sep 17 00:00:00 2001
+From d4acb02ca7e0a11b41c45068eb376dc306be304c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Jul 2025 19:22:07 -0700
 Subject: [PATCH] clang: Use sysroot relative paths for getArchSpecificLibPaths
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 2 deletions(-)

 diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain.cpp
-index ec28b899f829..f4aafa7996a9 100644
+index f39de1409c3c..d85ba775d317 100644
 --- a/clang/lib/Driver/ToolChain.cpp
 +++ b/clang/lib/Driver/ToolChain.cpp
-@@ -1001,7 +1001,10 @@ ToolChain::getTargetSubDirPath(StringRef BaseDir) const {
+@@ -1025,7 +1025,10 @@ ToolChain::getTargetSubDirPath(StringRef BaseDir) const {
  }

  std::optional<std::string> ToolChain::getRuntimePath() const {
@@ -34,7 +34,7 @@ index ec28b899f829..f4aafa7996a9 100644
    llvm::sys::path::append(P, "lib");
    if (auto Ret = getTargetSubDirPath(P))
      return Ret;
-@@ -1029,7 +1032,10 @@ ToolChain::path_list ToolChain::getArchSpecificLibPaths() const {
+@@ -1053,7 +1056,10 @@ ToolChain::path_list ToolChain::getArchSpecificLibPaths() const {
    path_list Paths;

    auto AddPath = [&](const ArrayRef<StringRef> &SS) {
diff --git a/meta/recipes-devtools/clang/clang/0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch b/meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
similarity index 89%
rename from meta/recipes-devtools/clang/clang/0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
rename to meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
index 7582134eea..09de70bbfc 100644
--- a/meta/recipes-devtools/clang/clang/0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
+++ b/meta/recipes-devtools/clang/clang/0034-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch
@@ -1,4 +1,4 @@
-From 4a5e076817be3291d9370a8831f96d1223087a72 Mon Sep 17 00:00:00 2001
+From 1ac8251ad0c136f413b566ee88ad646904b2adb6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 Jul 2025 19:12:13 -0700
 Subject: [PATCH] Revert "[libc++] Remap headers in the debug info when
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 deletions(-)

 diff --git a/libcxx/include/CMakeLists.txt b/libcxx/include/CMakeLists.txt
-index 9e9852de2a4c..9ee1b4695783 100644
+index 787cfffa5019..d73bcd852a1e 100644
 --- a/libcxx/include/CMakeLists.txt
 +++ b/libcxx/include/CMakeLists.txt
-@@ -1719,11 +1719,6 @@ add_dependencies(cxx-headers generate-cxx-headers)
+@@ -1718,11 +1718,6 @@ add_dependencies(cxx-headers generate-cxx-headers)
  target_include_directories(cxx-headers INTERFACE ${LIBCXX_GENERATED_INCLUDE_TARGET_DIR}
                                                   ${LIBCXX_GENERATED_INCLUDE_DIR})

diff --git a/meta/recipes-devtools/clang/clang/0038-Prevent-revisiting-block-when-searching-for-noreturn.patch b/meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-when-searching-for-noreturn.patch
similarity index 91%
rename from meta/recipes-devtools/clang/clang/0038-Prevent-revisiting-block-when-searching-for-noreturn.patch
rename to meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-when-searching-for-noreturn.patch
index d3d7403854..2ab1239fbc 100644
--- a/meta/recipes-devtools/clang/clang/0038-Prevent-revisiting-block-when-searching-for-noreturn.patch
+++ b/meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-when-searching-for-noreturn.patch
@@ -1,4 +1,4 @@
-From fdd02ac61cb909711f56f1e990f45439b0beef7b Mon Sep 17 00:00:00 2001
+From c62cf61d798289a9d890897c4b59dd0b333ab865 Mon Sep 17 00:00:00 2001
 From: Serge Pavlov <sepavloff@gmail.com>
 Date: Fri, 25 Jul 2025 13:35:19 +0700
 Subject: [PATCH] Prevent revisiting block when searching for noreturn vars
@@ -6,7 +6,7 @@ Subject: [PATCH] Prevent revisiting block when searching for noreturn vars
 When searching for noreturn variable initializations, do not visit CFG
 blocks that are already visited, it prevents hanging  the analysis.

-It must fix Ihttps://github.com/llvm/llvm-project/issues/150336.
+It must fix https://github.com/llvm/llvm-project/issues/150336.

 Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/150582]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta/recipes-devtools/clang/clang/0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch b/meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch
similarity index 82%
rename from meta/recipes-devtools/clang/clang/0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch
rename to meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch
index 4f6ab6d00f..9bb718fda3 100644
--- a/meta/recipes-devtools/clang/clang/0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch
+++ b/meta/recipes-devtools/clang/clang/0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch
@@ -1,4 +1,4 @@
-From b6af0a5b42adfbebaca1ee673d4c1d9d10fbacfb Mon Sep 17 00:00:00 2001
+From cb7ba8cd1ef469ada460ec19ec79261b8c0ae611 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 29 Sep 2025 14:44:05 +0100
 Subject: [PATCH] Don't expose LLVM_HAVE_OPT_VIEWER_MODULES externally
@@ -8,15 +8,16 @@ which is meaningless and simply introduces non-deterministic behaviour.

 Upstream-Status: Pending [https://github.com/llvm/llvm-project/issues/161199]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  llvm/cmake/modules/LLVMConfig.cmake.in | 1 -
  1 file changed, 1 deletion(-)

 diff --git a/llvm/cmake/modules/LLVMConfig.cmake.in b/llvm/cmake/modules/LLVMConfig.cmake.in
-index c15b9576cd5d..9cff70e4ef8e 100644
+index 70c807abea98..5603c9215332 100644
 --- a/llvm/cmake/modules/LLVMConfig.cmake.in
 +++ b/llvm/cmake/modules/LLVMConfig.cmake.in
-@@ -135,7 +135,6 @@ set(LLVM_DEFINITIONS "@LLVM_DEFINITIONS@")
+@@ -137,7 +137,6 @@ set(LLVM_DEFINITIONS "@LLVM_DEFINITIONS@")
  set(LLVM_BINARY_DIR "@LLVM_CONFIG_BINARY_DIR@")
  set(LLVM_CMAKE_DIR "@LLVM_CONFIG_CMAKE_DIR@")
  set(LLVM_TOOLS_BINARY_DIR "@LLVM_CONFIG_TOOLS_BINARY_DIR@")
@@ -24,6 +25,3 @@ index c15b9576cd5d..9cff70e4ef8e 100644
  set(LLVM_CONFIGURATION_TYPES @CMAKE_CONFIGURATION_TYPES@)
  set(LLVM_ENABLE_SHARED_LIBS @BUILD_SHARED_LIBS@)

---
-2.43.0
-
diff --git a/meta/recipes-devtools/clang/clang/0036-allow-external-prepare_builtins.patch b/meta/recipes-devtools/clang/clang/0036-allow-external-prepare_builtins.patch
deleted file mode 100644
index 7331eb6f83..0000000000
--- a/meta/recipes-devtools/clang/clang/0036-allow-external-prepare_builtins.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 61cb0afd40ef8d6a5493cbd3bd60f49f61e8b34f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 16 Jul 2025 23:24:21 +0100
-Subject: [PATCH] allow external prepare_builtins
-
-In standalone cross builds, libclc can't build a native prepare_builtins.
-
-Hack the CMake to allow it to use an existing binary, which we build in the recipe.
-
-Upstream-Status: Inappropriate [discussion for a proper fix in https://github.com/llvm/llvm-project/issues/149814]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- libclc/CMakeLists.txt | 23 +++++++++++++++++------
- 1 file changed, 17 insertions(+), 6 deletions(-)
-
-diff --git a/libclc/CMakeLists.txt b/libclc/CMakeLists.txt
-index c98e2043464d..151c5d2d20c6 100644
---- a/libclc/CMakeLists.txt
-+++ b/libclc/CMakeLists.txt
-@@ -178,17 +178,28 @@ set(LLVM_LINK_COMPONENTS
-   IRReader
-   Support
- )
-+
- if( LIBCLC_STANDALONE_BUILD )
--  add_llvm_executable( prepare_builtins utils/prepare-builtins.cpp )
--  set( prepare_builtins_exe prepare_builtins )
--  set( prepare_builtins_target prepare_builtins )
-+  message("cross ${CMAKE_CROSSCOMPILING}")
-+  if(CMAKE_CROSSCOMPILING)
-+    find_program(PREPARE_BUILTINS prepare_builtins REQUIRED)
-+    message("found ${PREPARE_BUILTINS}")
-+    set( prepare_builtins_exe ${PREPARE_BUILTINS} )
-+  else()
-+    add_llvm_executable( prepare_builtins utils/prepare-builtins.cpp )
-+    set( prepare_builtins_exe prepare_builtins )
-+    set( prepare_builtins_target prepare_builtins )
-+    target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION_DEFINE} )
-+    # These were not properly reported in early LLVM and we don't need them
-+    target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-exceptions )
-+  endif()
- else()
-   add_llvm_utility( prepare_builtins utils/prepare-builtins.cpp )
-   setup_host_tool( prepare_builtins PREPARE_BUILTINS prepare_builtins_exe prepare_builtins_target )
-+  target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION_DEFINE} )
-+  # These were not properly reported in early LLVM and we don't need them
-+  target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-exceptions )
- endif()
--target_compile_definitions( prepare_builtins PRIVATE ${LLVM_VERSION_DEFINE} )
--# These were not properly reported in early LLVM and we don't need them
--target_compile_options( prepare_builtins PRIVATE -fno-rtti -fno-exceptions )
-
- # Setup arch devices
- set( r600--_devices cedar cypress barts cayman )
diff --git a/meta/recipes-devtools/clang/clang/clang-no-tblgen.patch b/meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.patch
similarity index 72%
rename from meta/recipes-devtools/clang/clang/clang-no-tblgen.patch
rename to meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.patch
index e89cad8dc8..4bea94e4bc 100644
--- a/meta/recipes-devtools/clang/clang/clang-no-tblgen.patch
+++ b/meta/recipes-devtools/clang/clang/0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.patch
@@ -1,11 +1,19 @@
-[clang] Only build clang-tblgen if it is actually needed
+From 861a11e4307962e1bde286e150d75fb06f8583b1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Sat, 11 Oct 2025 16:01:50 -0700
+Subject: [PATCH] [clang] Only build clang-tblgen if it is actually needed

 It's possible to build clang with an existing clang-tblgen (common when
 cross-compiling, for instance) by setting CLANG_TABLEGEN_EXE.  If this
 is the case there's no need to build it, as it won't be used.

 Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/161952]
+
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)

 diff --git a/clang/CMakeLists.txt b/clang/CMakeLists.txt
 index e4cb1a359620..b650b3b986f4 100644
diff --git a/meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch b/meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
new file mode 100644
index 0000000000..9334aba6a5
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
@@ -0,0 +1,71 @@
+From eccc8eb432c94fb593f2858a8e8bf10bb259d045 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Oct 2025 15:44:49 -0700
+Subject: [PATCH] llvm-libgcc: Fix symlink path for libcc when
+ LLVM_ENABLE_PER_TARGET_RUNTIME_DIR is unset
+
+current logic fails when LLVM_ENABLE_PER_TARGET_RUNTIME_DIR = OFF
+and it ends up with symlinks e.g.
+
+libgcc.a -> ..//usr/lib/clang/21.1.4/lib/linux/libclang_rt.builtins.a
+
+the real library is at
+../lib/clang/21.1.4/lib/linux/libclang_rt.builtins-aarch64.a
+
+The relative path is incorrect and its missing to add -arch suffix
+as well.
+
+So we make checks a bit more explicit to cover this case.
+
+The symlink for libgcc_so.1.0 is made to point to libunwind.so
+which is functionally correct but it fails some linux distro packaging
+complain because libunwind.so is made part of -dev package but
+libgcc_so.1.0 ends up in the real package, and creates an unneeded
+package -> dev dependency
+
+create the symlink to point to libunwind.so.1 instead then the boundaries
+of packaging are not crossed and all is well.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/165487]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm-libgcc/CMakeLists.txt | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt
+index 47208fc19869..54009c1104c3 100644
+--- a/llvm-libgcc/CMakeLists.txt
++++ b/llvm-libgcc/CMakeLists.txt
+@@ -124,11 +124,21 @@ target_link_libraries(unwind_shared PUBLIC
+ #===============================================================================
+
+ get_compiler_rt_install_dir(${COMPILER_RT_DEFAULT_TARGET_ARCH} install_dir_builtins)
++
++# Drop a leading "lib/" if present so we don't duplicate lib/lib
+ string(REGEX REPLACE "^lib/" "" install_dir_builtins "${install_dir_builtins}")
+-string(FIND "${install_dir_builtins}" "clang" install_path_contains_triple)
+-if(install_path_contains_triple EQUAL -1)
++
++# Decide based on the actual CMake option, not on guessing from the path.
++if (NOT LLVM_ENABLE_PER_TARGET_RUNTIME_DIR)
++  # Flat-ish layout, e.g. usr/lib/clang/21.1.4/lib/linux/
++  # Libraries are named libclang_rt.builtins-<arch>.a
+   set(builtins_suffix "-${COMPILER_RT_DEFAULT_TARGET_ARCH}")
++  # Do NOT prepend "../"
+ else()
++  # Per-target layout, e.g.
++  # usr/lib/clang/21.1.4/lib/aarch64-unknown-linux-gnu/
++  # Libraries are just libclang_rt.builtins.a
++  set(builtins_suffix "")
+   string(PREPEND install_dir_builtins "../")
+ endif()
+ set(LLVM_LIBGCC_COMPILER_RT ${install_dir_builtins}/libclang_rt.builtins${builtins_suffix}.a)
+@@ -137,7 +147,7 @@ add_custom_target(llvm-libgcc ALL
+   DEPENDS unwind_shared unwind_static clang_rt.builtins-${COMPILER_RT_DEFAULT_TARGET_ARCH}
+   COMMAND ${CMAKE_COMMAND} -E create_symlink ${LLVM_LIBGCC_COMPILER_RT} libgcc.a
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.a libgcc_eh.a
+-  COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.so libgcc_s.so.1.0
++  COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.so.1 libgcc_s.so.1.0
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libgcc_s.so.1.0 libgcc_s.so.1
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libgcc_s.so.1 libgcc_s.so
+ )
diff --git a/meta/recipes-devtools/clang/clang/0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch b/meta/recipes-devtools/clang/clang/0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch
new file mode 100644
index 0000000000..4757e0103b
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch
@@ -0,0 +1,128 @@
+From 8e8793eb3ef1bc5ac45904378c8985fb62991e33 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 5 Jan 2026 18:30:54 -0800
+Subject: [PATCH] [Clang] Rename OffloadArch::UNUSED to UNUSED_ to avoid macro
+ collisions
+
+OffloadArch uses an enumerator named `UNUSED`, which is a very common macro name
+in external codebases (e.g. Mesa defines UNUSED as an attribute helper). If such
+a macro is visible when including clang/Basic/OffloadArch.h, the preprocessor
+expands the token inside the enum and breaks compilation of the installed Clang
+headers.
+
+Rename the enumerator to `UNUSED_` and update all in-tree references. This is a
+spelling-only change (no behavioral impact) and mirrors the existing approach
+used for SM_32_ to avoid macro clashes.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/include/clang/Basic/OffloadArch.h  | 2 +-
+ clang/lib/Basic/OffloadArch.cpp          | 2 +-
+ clang/lib/Basic/Targets/NVPTX.cpp        | 3 ++-
+ clang/lib/Basic/Targets/NVPTX.h          | 2 +-
+ clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp | 2 +-
+ clang/lib/Driver/Driver.cpp              | 6 +++---
+ 6 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/clang/include/clang/Basic/OffloadArch.h b/clang/include/clang/Basic/OffloadArch.h
+index ea665b1f49e0..b7d6e00f628e 100644
+--- a/clang/include/clang/Basic/OffloadArch.h
++++ b/clang/include/clang/Basic/OffloadArch.h
+@@ -16,7 +16,7 @@ class StringRef;
+ namespace clang {
+
+ enum class OffloadArch {
+-  UNUSED,
++  UNUSED_,
+   UNKNOWN,
+   // TODO: Deprecate and remove GPU architectures older than sm_52.
+   SM_20,
+diff --git a/clang/lib/Basic/OffloadArch.cpp b/clang/lib/Basic/OffloadArch.cpp
+index 05177f1c5803..6a743c73473e 100644
+--- a/clang/lib/Basic/OffloadArch.cpp
++++ b/clang/lib/Basic/OffloadArch.cpp
+@@ -17,7 +17,7 @@ struct OffloadArchToStringMap {
+ #define GFX(gpu) {OffloadArch::GFX##gpu, "gfx" #gpu, "compute_amdgcn"}
+ static const OffloadArchToStringMap ArchNames[] = {
+     // clang-format off
+-    {OffloadArch::UNUSED, "", ""},
++    {OffloadArch::UNUSED_, "", ""},
+     SM(20), {OffloadArch::SM_21, "sm_21", "compute_20"}, // Fermi
+     SM(30), {OffloadArch::SM_32_, "sm_32", "compute_32"}, SM(35), SM(37),  // Kepler
+     SM(50), SM(52), SM(53),          // Maxwell
+diff --git a/clang/lib/Basic/Targets/NVPTX.cpp b/clang/lib/Basic/Targets/NVPTX.cpp
+index 6526eeff3d71..cf2d4bd6f746 100644
+--- a/clang/lib/Basic/Targets/NVPTX.cpp
++++ b/clang/lib/Basic/Targets/NVPTX.cpp
+@@ -64,7 +64,7 @@ NVPTXTargetInfo::NVPTXTargetInfo(const llvm::Triple &Triple,
+   // Define available target features
+   // These must be defined in sorted order!
+   NoAsmVariants = true;
+-  GPU = OffloadArch::UNUSED;
++  GPU = OffloadArch::UNUSED_;
+
+   // PTX supports f16 as a fundamental type.
+   HasFastHalfType = true;
+@@ -177,6 +177,7 @@ void NVPTXTargetInfo::getTargetDefines(const LangOptions &Opts,
+
+   // Skip setting architecture dependent macros if undefined.
+   if (!IsNVIDIAOffloadArch(GPU))
++  if (GPU == OffloadArch::UNUSED_ && !HostTarget)
+     return;
+
+   if (Opts.CUDAIsDevice || Opts.OpenMPIsTargetDevice || !HostTarget) {
+diff --git a/clang/lib/Basic/Targets/NVPTX.h b/clang/lib/Basic/Targets/NVPTX.h
+index 9bd0cc36d12b..337864ac5c1a 100644
+--- a/clang/lib/Basic/Targets/NVPTX.h
++++ b/clang/lib/Basic/Targets/NVPTX.h
+@@ -87,7 +87,7 @@ public:
+   initFeatureMap(llvm::StringMap<bool> &Features, DiagnosticsEngine &Diags,
+                  StringRef CPU,
+                  const std::vector<std::string> &FeaturesVec) const override {
+-    if (GPU != OffloadArch::UNUSED)
++    if (GPU != OffloadArch::UNUSED_)
+       Features[OffloadArchToString(GPU)] = true;
+     // Only add PTX feature if explicitly requested. Otherwise, let the backend
+     // use the minimum required PTX version for the target SM.
+diff --git a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
+index db0d56d6b18c..6df0b3b3574d 100644
+--- a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
++++ b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
+@@ -2382,7 +2382,7 @@ void CGOpenMPRuntimeGPU::processRequiresDirective(const OMPRequiresDecl *D) {
+       case OffloadArch::Generic:
+       case OffloadArch::GRANITERAPIDS:
+       case OffloadArch::BMG_G21:
+-      case OffloadArch::UNUSED:
++      case OffloadArch::UNUSED_:
+       case OffloadArch::UNKNOWN:
+         break;
+       case OffloadArch::LAST:
+diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
+index eb3f9cbea284..f4760e80788c 100644
+--- a/clang/lib/Driver/Driver.cpp
++++ b/clang/lib/Driver/Driver.cpp
+@@ -961,12 +961,12 @@ inferOffloadToolchains(Compilation &C, Action::OffloadKind Kind) {
+       return llvm::DenseSet<llvm::StringRef>();
+     }
+     if (Kind == Action::OFK_OpenMP &&
+-        (ID == OffloadArch::UNKNOWN || ID == OffloadArch::UNUSED)) {
++        (ID == OffloadArch::UNKNOWN || ID == OffloadArch::UNUSED_)) {
+       C.getDriver().Diag(clang::diag::err_drv_failed_to_deduce_target_from_arch)
+           << Arch;
+       return llvm::DenseSet<llvm::StringRef>();
+     }
+-    if (ID == OffloadArch::UNKNOWN || ID == OffloadArch::UNUSED) {
++    if (ID == OffloadArch::UNKNOWN || ID == OffloadArch::UNUSED_) {
+       C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
+           << "offload" << Arch;
+       return llvm::DenseSet<llvm::StringRef>();
+@@ -3407,7 +3407,7 @@ class OffloadingActionBuilder final {
+
+       // If we have a fat binary, add it to the list.
+       if (CudaFatBinary) {
+-        AddTopLevel(CudaFatBinary, OffloadArch::UNUSED);
++        AddTopLevel(CudaFatBinary, OffloadArch::UNUSED_);
+         CudaDeviceActions.clear();
+         CudaFatBinary = nullptr;
+         return;
diff --git a/meta/recipes-devtools/clang/clang/0039-Only-build-c-index-test-when-clang-tests-are-include.patch b/meta/recipes-devtools/clang/clang/0039-Only-build-c-index-test-when-clang-tests-are-include.patch
deleted file mode 100644
index d3988b0f36..0000000000
--- a/meta/recipes-devtools/clang/clang/0039-Only-build-c-index-test-when-clang-tests-are-include.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From de5737078972d8ba89bc6194fc0f50421c8d5631 Mon Sep 17 00:00:00 2001
-From: David Spickett <david.spickett@linaro.org>
-Date: Tue, 29 Jul 2025 14:17:56 +0000
-Subject: [PATCH] Only build c-index-test when clang tests are included
-
-c-index-test is only used for testing, and it's used in tests
-that are already guarded by CLANG_INCLUDE_TESTS in clang/CMakeLists.txt.
-
-This change enables us to do builds with LLVM_INSTALL_TOOLCHAIN_ONLY=OFF,
-and CLANG_INCLUDE_TESTS=OFF, which contain the required files
-to build other bits of llvm-project standalone, but does not
-include c-index-test which we have no need for.
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/151157]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- clang/tools/CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/clang/tools/CMakeLists.txt b/clang/tools/CMakeLists.txt
-index 50e3d694236a..196dcb1e8466 100644
---- a/clang/tools/CMakeLists.txt
-+++ b/clang/tools/CMakeLists.txt
-@@ -2,7 +2,6 @@ create_subdirectory_options(CLANG TOOL)
-
- add_clang_subdirectory(diagtool)
- add_clang_subdirectory(driver)
--add_clang_subdirectory(apinotes-test)
- if(CLANG_ENABLE_CIR)
-   add_clang_subdirectory(cir-opt)
-   add_clang_subdirectory(cir-translate)
-@@ -23,7 +22,10 @@ if(HAVE_CLANG_REPL_SUPPORT)
-   add_clang_subdirectory(clang-repl)
- endif()
-
-+if(CLANG_INCLUDE_TESTS)
-+add_clang_subdirectory(apinotes-test)
- add_clang_subdirectory(c-index-test)
-+endif()
-
- add_clang_subdirectory(clang-refactor)
- # For MinGW/Cygwin we only enable shared library if LLVM_LINK_LLVM_DYLIB=ON.
diff --git a/meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch b/meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
deleted file mode 100644
index f385dc83ea..0000000000
--- a/meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4204fd1b62de30418433139fea1b7dad4fff9c59 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Oct 2025 15:44:49 -0700
-Subject: [PATCH] [llvm-libgcc] Fix symlink path for libgcc
-
-The symlink for libgcc_so.1.0 is made to point to libunwind.so
-which is functionally correct but it fails some linux distro packaging
-complain because libunwind.so is made part of -dev package but
-libgcc_so.1.0 ends up in the real package, and creates an unneeded
-package -> dev dependency
-
-create the symlink to point to libunwind.so.1 instead then the boundaries
-of packaging are not crossed and all is well.
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/165487]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm-libgcc/CMakeLists.txt | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt
-index 47208fc19869..54009c1104c3 100644
---- a/llvm-libgcc/CMakeLists.txt
-+++ b/llvm-libgcc/CMakeLists.txt
-@@ -137,7 +147,7 @@ add_custom_target(llvm-libgcc ALL
-   DEPENDS unwind_shared unwind_static clang_rt.builtins-${COMPILER_RT_DEFAULT_TARGET_ARCH}
-   COMMAND ${CMAKE_COMMAND} -E create_symlink ${LLVM_LIBGCC_COMPILER_RT} libgcc.a
-   COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.a libgcc_eh.a
--  COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.so libgcc_s.so.1.0
-+  COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.so.1 libgcc_s.so.1.0
-   COMMAND ${CMAKE_COMMAND} -E create_symlink libgcc_s.so.1.0 libgcc_s.so.1
-   COMMAND ${CMAKE_COMMAND} -E create_symlink libgcc_s.so.1 libgcc_s.so
- )
diff --git a/meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch b/meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch
deleted file mode 100644
index 789d6d727a..0000000000
--- a/meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 919fcd11ad53bdfab9a14d5df6de0895bf24e456 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Oct 2025 19:02:44 -0700
-Subject: [PATCH] [llvm-libgcc] Fix libgcc.a symlink path when LLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF
-
-The llvm-libgcc installation was creating incorrect symlinks for libgcc.a
-when built with LLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF, particularly seen with
-Yocto cross-compilation environments.
-
-Issues seen:
-
--  Absolute path in symlink: The previous code didn't handle absolute paths
-   returned by get_compiler_rt_install_dir() in staging/sysroot environments,
-   resulting in symlinks like:
-   libgcc.a -> /absolute/path/to/sysroot/usr/lib/clang/.../libclang_rt.builtins.a
-
--  Missing architecture suffix: When the install path contained "clang", the
-   code would skip setting builtins_suffix, creating:
-   libgcc.a -> clang/21.1.4/lib/linux/libclang_rt.builtins.a
-   instead of:
-   libgcc.a -> clang/21.1.4/lib/linux/libclang_rt.builtins-aarch64.a
-
--  Incorrect relative path calculation: The original regex stripped too much
-   or too little of the path, either creating symlinks pointing to non-existent
-   locations or stripping the clang/ directory prefix entirely.
-
-Solution:
-
-- Extract the relative path starting from 'clang/' when present in absolute
-  paths, ensuring the symlink points to the correct location within the
-  installation hierarchy
-- Always append the architecture suffix to the builtins library name
-- Only prepend '../' to the path when LLVM_ENABLE_PER_TARGET_RUNTIME_DIR is
-  enabled, as this is when the builtins are in a different directory level
-
-The symlink now correctly points to the existing compiler-rt builtins library
-without creating duplicate copies.
-
-Tested with LLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF in cross-compilation
-environments (aarch64 target).
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/165487]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm-libgcc/CMakeLists.txt | 24 ++++++++++++++++++++----
- 1 file changed, 20 insertions(+), 4 deletions(-)
-
-diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt
-index cd9c5011d410..ee7fe768bda0 100644
---- a/llvm-libgcc/CMakeLists.txt
-+++ b/llvm-libgcc/CMakeLists.txt
-@@ -124,11 +124,27 @@ target_link_libraries(unwind_shared PUBLIC
- #===============================================================================
-
- get_compiler_rt_install_dir(${COMPILER_RT_DEFAULT_TARGET_ARCH} install_dir_builtins)
--string(REGEX REPLACE "^lib/" "" install_dir_builtins "${install_dir_builtins}")
--string(FIND "${install_dir_builtins}" "clang" install_path_contains_triple)
--if(install_path_contains_triple EQUAL -1)
--  set(builtins_suffix "-${COMPILER_RT_DEFAULT_TARGET_ARCH}")
-+
-+# Extract the relative path starting from 'clang' or after 'lib/'
-+if(IS_ABSOLUTE "${install_dir_builtins}")
-+  # For absolute paths, extract starting from 'clang/' if it exists
-+  string(REGEX MATCH "clang/.*$" install_dir_builtins_temp "${install_dir_builtins}")
-+  if(install_dir_builtins_temp)
-+    set(install_dir_builtins "${install_dir_builtins_temp}")
-+  else()
-+    # Fallback: strip up to first lib/
-+    string(REGEX REPLACE "^.*/lib/" "" install_dir_builtins "${install_dir_builtins}")
-+  endif()
- else()
-+  string(REGEX REPLACE "^lib/" "" install_dir_builtins "${install_dir_builtins}")
-+endif()
-+
-+# Always add the architecture suffix
-+set(builtins_suffix "-${COMPILER_RT_DEFAULT_TARGET_ARCH}")
-+
-+# Only prepend ../ when using per-target runtime directories
-+string(FIND "${install_dir_builtins}" "clang" install_path_contains_triple)
-+if(install_path_contains_triple GREATER -1 AND LLVM_ENABLE_PER_TARGET_RUNTIME_DIR)
-   string(PREPEND install_dir_builtins "../")
- endif()
- set(LLVM_LIBGCC_COMPILER_RT ${install_dir_builtins}/libclang_rt.builtins${builtins_suffix}.a)
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 1f77400dd4..83735e292e 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -3,9 +3,9 @@ LLVM_DIR = "llvm${LLVM_RELEASE}"

 LLVM_HTTP ?= "https://github.com/llvm"

-MAJOR_VER = "21"
+MAJOR_VER = "22"
 MINOR_VER = "1"
-PATCH_VER = "8"
+PATCH_VER = "1"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""

@@ -16,10 +16,6 @@ CLANGMD5SUM = "ff42885ed2ab98f1ecb8c1fc41205343"
 LLDMD5SUM = "ae7dc7c027b1fa89b5b013d391d3ee2b"
 LLDBMD5SUM = "2e0d44968471fcde980034dbb826bea9"

-# remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
-
 LLVM_LIBDIR_SUFFIX = "${@d.getVar('baselib').replace('lib', '')}"

 # set the default pigz thread
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 1e70e9c64b..00aeed3993 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://llvm/LICENSE.TXT;md5=${LLVMMD5SUM} \
 LICENSE = "Apache-2.0-with-LLVM-exception"

 # Snapshot
-#RELEASE ?= "a69568efe6c4972e71af295c6577b3412dd57c22"
+#RELEASE ?= "108df0694cc12fa496f63faa3a8762e7cc1a3b37"
 #BASEURI ?= "https://api.github.com/repos/llvm/llvm-project/tarball/${RELEASE};downloadfilename=llvm-${PV}-${RELEASE}.tar.gz"
 #SOURCEDIR ?= "llvm-llvm-project-${@'${RELEASE}'[0:7]}"
-#SRC_URI[sha256sum] = "aed4f66cd72867b36cc55a0588436933c3d58d3e61ca782b6bf57605d3fdcb09"
+#SRC_URI[sha256sum] = "f19bc6ed902e30413a8a034a024fae228ca57339b450d3682fd7437fb2573378"

 # GA Release
 RELEASE ?= "${PV}"
@@ -17,54 +17,49 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "4633a23617fa31a3ea51242586ea7fb1da7140e426bd62fc164261fe036aa142"
+SRC_URI[sha256sum] = "9c6f37f6f5f68d38f435d25f770fc48c62d92b2412205767a16dac2c942f0c95"

 SRC_URI = "\
     ${BASEURI} \
     file://0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch \
     file://0002-compiler-rt-support-a-new-embedded-linux-target.patch \
     file://0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch \
-    file://0005-llvm-allow-env-override-of-exe-and-libdir-path.patch \
-    file://0006-clang-driver-Check-sysroot-for-ldso-path.patch \
-    file://0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch \
-    file://0008-clang-Prepend-trailing-to-sysroot.patch \
-    file://0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch \
-    file://0010-clang-Define-releative-gcc-installation-dir.patch \
-    file://0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch \
-    file://0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch \
-    file://0013-Check-for-atomic-double-intrinsics.patch \
-    file://0014-cmake-Fix-configure-for-packages-using-find_package.patch \
-    file://0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch \
-    file://0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch \
-    file://0017-clang-Use-python3-in-python-scripts.patch \
-    file://0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch \
-    file://0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch \
-    file://0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch \
-    file://0021-libunwind-Added-unw_backtrace-method.patch \
-    file://0022-lldb-Link-with-libatomic-on-x86.patch \
-    file://0023-compiler-rt-Enable-__int128-for-ppc32.patch \
-    file://0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
-    file://0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
-    file://0026-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch \
-    file://0027-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch \
-    file://0028-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
-    file://0029-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch \
-    file://0030-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
-    file://0031-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
-    file://0032-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
-    file://0033-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
-    file://0034-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
-    file://0035-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch \
-    file://0036-allow-external-prepare_builtins.patch \
-    file://0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch \
-    file://0038-Prevent-revisiting-block-when-searching-for-noreturn.patch \
-    file://0039-Only-build-c-index-test-when-clang-tests-are-include.patch \
-    file://0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
-    file://0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch \
-    file://0001-Install-lldb-tblgen.patch \
-    file://0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch \
-    file://0001-clang-Support-building-native-tools-when-cross-compi.patch \
-    file://clang-no-tblgen.patch \
+    file://0004-llvm-allow-env-override-of-exe-and-libdir-path.patch \
+    file://0005-clang-driver-Check-sysroot-for-ldso-path.patch \
+    file://0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch \
+    file://0007-clang-Prepend-trailing-to-sysroot.patch \
+    file://0008-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch \
+    file://0009-clang-Define-releative-gcc-installation-dir.patch \
+    file://0010-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch \
+    file://0011-Check-for-atomic-double-intrinsics.patch \
+    file://0012-cmake-Fix-configure-for-packages-using-find_package.patch \
+    file://0013-clang-Fix-resource-dir-location-for-cross-toolchains.patch \
+    file://0014-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch \
+    file://0015-clang-Use-python3-in-python-scripts.patch \
+    file://0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch \
+    file://0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch \
+    file://0018-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch \
+    file://0019-libunwind-Added-unw_backtrace-method.patch \
+    file://0020-lldb-Link-with-libatomic-on-x86.patch \
+    file://0021-compiler-rt-Enable-__int128-for-ppc32.patch \
+    file://0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
+    file://0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
+    file://0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch \
+    file://0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch \
+    file://0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
+    file://0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch \
+    file://0028-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
+    file://0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+    file://0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
+    file://0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
+    file://0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
+    file://0033-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch \
+    file://0034-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch \
+    file://0035-Prevent-revisiting-block-when-searching-for-noreturn.patch \
+    file://0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch \
+    file://0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.patch \
+    file://0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
+    file://0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devtools/clang/libclc_git.bb
index c4b4881542..1a73c9eb2a 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -16,28 +16,11 @@ inherit cmake pkgconfig
 DEPENDS += "clang-native spirv-llvm-translator-native"

 OECMAKE_SOURCEPATH = "${S}/libclc"
-B_NATIVE = "${B}-native"

 # Semicolon-separated list of targets to build
 LIBCLC_TARGETS ?= "all"

 EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD='${LIBCLC_TARGETS}'"
-EXTRA_OECMAKE:append:class-target = " -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
-EXTRA_OECMAKE:append:class-nativesdk = " -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
-
-# Need to build a native prepare_builtins binary in target builds. The easiest
-# way to do this is with a second native cmake build tree.
-do_build_prepare_builtins() {
-    env -i PATH=$PATH cmake --fresh -G Ninja \
-        -S ${OECMAKE_SOURCEPATH} -B ${B_NATIVE} \
-        -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain-native.cmake \
-        -DLIBCLC_TARGETS_TO_BUILD=
-    cmake --build ${B_NATIVE} --target prepare_builtins
-}
-do_build_prepare_builtins:class-native() {
-    :
-}
-do_configure[prefuncs] += "do_build_prepare_builtins"

 FILES:${PN} += "${datadir}/clc"


