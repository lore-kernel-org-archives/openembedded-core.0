Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F60CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 00:39:50 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26656.1779323987688412374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 17:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 21 May 2026 09:39:46 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.151 with ESMTP; 21 May 2026 09:39:45 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH 2/2] llvm: introduce thin-lto-pgo PACKAGECONFIG for PGO bootstrap
Date: Thu, 21 May 2026 09:39:29 +0900
Message-ID: <20260521003929.14947-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521003929.14947-1-mark.yang@lge.com>
References: <20260521003929.14947-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 00:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237470

From: "mark.yang" <mark.yang@lge.com>

Introduce thin-lto-pgo PACKAGECONFIG enabling LLVM's 3-stage PGO+ThinLTO bootstrap on class-native.
Stage 3 builds LLVM only, yielding a PGO ThinLTO optimized libLLVM.so without overlapping clang-native or lld-native.

The name sorts after 'shared-libs' in PACKAGECONFIG_CONFARGS so its dylib overrides land last on the cmake command line,
stage 3 BOOTSTRAP_BOOTSTRAP_LLVM_BUILD/LINK_LLVM_DYLIB to match shared-libs.

Selected the top 10 components using clang as a toolchain in core-image-sato and compared their do_compile time from buildstat.
Built sequentially to avoid warm cache hits and performed 10 cycles.
Compared the median of compile time.
AMD Ryzen 9 7950x (16 cores, 32 threads)
BB_NUMBER_THREADS = "32"
PARALLEL_MAKE = "-j 32"
TOOLCHAIN = "clang"
PACKAGECONFIG:append:pn-clang-native = " thin-lto-pgo"
PACKAGECONFIG:append:pn-llvm-native = " thin-lto-pgo"

Recipe         baseline (s)   full PGO (s)   diff (vs baseline)
sqlite3        36.455         19.605         -46.2%
fmt            24.770         13.720         -44.6%
perl           36.470         35.360         -3.0%
libunistring   36.300         26.685         -26.5%
icu            30.930         15.860         -48.7%
librsvg        73.785         70.580         -4.3%
mesa           39.610         22.895         -42.2%
openssl        27.505         17.495         -36.4%
binutils       36.855         26.565         -27.9%
busybox        18.100         15.335         -15.3%

One-time bootstrap cost:
clang-native do_compile 448s -> 1307s
llvm-native do_compile 396s -> 2273s

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-devtools/clang/llvm_git.bb | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..07c044eb5d 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -67,6 +67,8 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
 
 PACKAGECONFIG ??= "eh rtti shared-libs ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto', d)}"
 PACKAGECONFIG:remove:class-native = "lto thin-lto"
+PACKAGECONFIG:remove:class-target = "thin-lto-pgo"
+PACKAGECONFIG:remove:class-nativesdk = "thin-lto-pgo"
 
 PACKAGECONFIG[eh] = "-DLLVM_ENABLE_EH=ON,-DLLVM_ENABLE_EH=OFF"
 PACKAGECONFIG[exegesis] = "-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON,-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=OFF"
@@ -79,6 +81,32 @@ PACKAGECONFIG[opt-viewer] = "-DLLVM_TOOL_OPT_VIEWER_BUILD=ON,-DLLVM_TOOL_OPT_VIE
                              python3-pyyaml python3-pygments,"
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
+PGO_FINAL_DYLIB = "${@bb.utils.contains('PACKAGECONFIG', 'shared-libs', 'ON', 'OFF', d)}"
+PACKAGECONFIG[thin-lto-pgo] = " -DLLVM_ENABLE_PROJECTS='clang;lld' \
+                                -DLLVM_LINK_LLVM_DYLIB=OFF -DCLANG_LINK_CLANG_DYLIB=OFF \
+                                -DBOOTSTRAP_LLVM_LINK_LLVM_DYLIB=OFF -DBOOTSTRAP_CLANG_LINK_CLANG_DYLIB=OFF \
+                                -DBOOTSTRAP_BOOTSTRAP_LLVM_BUILD_LLVM_DYLIB=${PGO_FINAL_DYLIB} -DBOOTSTRAP_BOOTSTRAP_LLVM_LINK_LLVM_DYLIB=${PGO_FINAL_DYLIB} \
+                                -DBOOTSTRAP_BOOTSTRAP_LLVM_ENABLE_PROJECTS='' -DBOOTSTRAP_BOOTSTRAP_LLVM_ENABLE_RUNTIMES='' \
+                                -DBOOTSTRAP_BOOTSTRAP_LLVM_TOOL_CLANG_BUILD=OFF -DBOOTSTRAP_BOOTSTRAP_LLVM_TOOL_LLD_BUILD=OFF \
+                                -DLLVM_EXTERNAL_LIT=${S}/llvm/utils/lit/lit.py \
+                                -DBOOTSTRAP_LLVM_ENABLE_LLD=ON -DBOOTSTRAP_BOOTSTRAP_LLVM_ENABLE_LTO=Thin -DBOOTSTRAP_BOOTSTRAP_LLVM_ENABLE_FATLTO=ON \
+                                -DCLANG_BOOTSTRAP_PASSTHROUGH='${PASSTHROUGH}' -DBOOTSTRAP_CLANG_BOOTSTRAP_PASSTHROUGH='${PASSTHROUGH}' -C ${S}/clang/cmake/caches/PGO.cmake"
+
+PASSTHROUGH = "\
+LLVM_TARGETS_TO_BUILD;LLVM_EXPERIMENTAL_TARGETS_TO_BUILD;\
+LLVM_LIBDIR_SUFFIX;LLVM_VERSION_SUFFIX;\
+LLVM_NATIVE_TOOL_DIR;LLVM_TABLEGEN;\
+LLVM_ENABLE_FFI;LLVM_ENABLE_RTTI;LLVM_ENABLE_BINDINGS;\
+LLVM_INSTALL_UTILS;LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN;\
+LLVM_INCLUDE_TESTS;LLVM_INCLUDE_EXAMPLES;\
+LLVM_TOOL_OBJ2YAML_BUILD;LLVM_TOOL_YAML2OBJ_BUILD;\
+LLVM_BUILD_LLVM_DYLIB;\
+LLVM_ENABLE_LTO;LLVM_ENABLE_LLD;LLVM_ENABLE_EH;\
+CMAKE_BUILD_TYPE;\
+"
+
+OECMAKE_TARGET_COMPILE:class-native = "${@bb.utils.contains('PACKAGECONFIG', 'thin-lto-pgo', 'stage2', 'all', d)}"
+OECMAKE_TARGET_INSTALL:class-native = "${@bb.utils.contains('PACKAGECONFIG', 'thin-lto-pgo', 'stage2-install', 'install', d)}"
 
 # LLVM debug symbols are very large (several gigabytes), reduce the debug level
 # so they're just hundreds of megabytes.

