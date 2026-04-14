Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8FBED7B8B
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 08:38:13 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14103.1776155871792673146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 01:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.53 with ESMTP; 14 Apr 2026 17:37:48 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.126 with ESMTP; 14 Apr 2026 17:37:48 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] clang: consolidate sysroot compiler-rt search path patches
Date: Tue, 14 Apr 2026 17:37:19 +0900
Message-ID: <20260414083718.3042783-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235146

From: "mark.yang" <mark.yang@lge.com>

Replace patches 0008 and 0033 with a single consolidated patch (0041)
that fixes native build breakage.

The original patches unconditionally changed the runtime library search
base from ResourceDir to SysRoot, which breaks native/standalone builds
where SysRoot is empty (e.g., PGO bootstrap fails to find
libclang_rt.profile.a). The new patch uses SysRoot-based paths only
during cross-compilation and falls back to the upstream default
ResourceDir for native builds.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...e-the-target-sysroot-for-compiler-ru.patch |  41 -------
 ...t-relative-paths-for-getArchSpecific.patch |  48 --------
 ...fix-sysroot-based-compiler-rt-search.patch | 105 ++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |   3 +-
 4 files changed, 106 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/0008-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0033-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch

diff --git a/meta/recipes-devtools/clang/clang/0008-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch b/meta/recipes-devtools/clang/clang/0008-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
deleted file mode 100644
index 5a0cea90d2..0000000000
--- a/meta/recipes-devtools/clang/clang/0008-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d972eb4a51d911e33ad75f8b3ebedafc08efefac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 16 Mar 2017 19:06:26 -0700
-Subject: [PATCH] clang: Look inside the target sysroot for compiler runtime
-
-In OE compiler-rt and libc++ are built and staged into target
-sysroot and not into resourcedir which is relative to clang
-driver installation where the libraries are not instlled
-
-Specific to cross compiling the way yocto/OE works
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- clang/lib/Driver/ToolChain.cpp | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain.cpp
-index 77a2c73f0d44..f39de1409c3c 100644
---- a/clang/lib/Driver/ToolChain.cpp
-+++ b/clang/lib/Driver/ToolChain.cpp
-@@ -15,6 +15,7 @@
- #include "ToolChains/InterfaceStubs.h"
- #include "clang/Basic/ObjCRuntime.h"
- #include "clang/Basic/Sanitizers.h"
-+#include "clang/Basic/Version.h"
- #include "clang/Config/config.h"
- #include "clang/Driver/Action.h"
- #include "clang/Driver/CommonArgs.h"
-@@ -723,7 +724,10 @@ StringRef ToolChain::getOSLibName() const {
- }
- 
- std::string ToolChain::getCompilerRTPath() const {
--  SmallString<128> Path(getDriver().ResourceDir);
-+  SmallString<128> Path(getDriver().SysRoot);
-+  StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
-+  llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
-+                            CLANG_VERSION_STRING);
-   if (isBareMetal()) {
-     llvm::sys::path::append(Path, "lib", getOSLibName());
-     if (!SelectedMultilibs.empty()) {
diff --git a/meta/recipes-devtools/clang/clang/0033-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch b/meta/recipes-devtools/clang/clang/0033-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
deleted file mode 100644
index f7b8e2f127..0000000000
--- a/meta/recipes-devtools/clang/clang/0033-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 6dfed7c23af059937e15523482311503d4bb275b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Jul 2025 19:22:07 -0700
-Subject: [PATCH] clang: Use sysroot relative paths for getArchSpecificLibPaths
- and getRuntimePath
-
-Clang's default sysroot implementation differs that what we do in OE,
-and we do it with gcc as well where we install c++ runtime headers in
-target sysroot, clang does not by default it puts them relative to its
-own installation and uses resourcedir to point to it. In order to solve
-this we have to raise this question with respective upstreams or rethink
-about how we package compiler runtime.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- clang/lib/Driver/ToolChain.cpp | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain.cpp
-index f39de1409c3c..d85ba775d317 100644
---- a/clang/lib/Driver/ToolChain.cpp
-+++ b/clang/lib/Driver/ToolChain.cpp
-@@ -1025,7 +1025,10 @@ ToolChain::getTargetSubDirPath(StringRef BaseDir) const {
- }
- 
- std::optional<std::string> ToolChain::getRuntimePath() const {
--  SmallString<128> P(D.ResourceDir);
-+  SmallString<128> P(D.SysRoot);
-+  StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
-+  llvm::sys::path::append(P, "/usr/", ClangLibdirBasename, "clang",
-+                          CLANG_VERSION_STRING);
-   llvm::sys::path::append(P, "lib");
-   if (auto Ret = getTargetSubDirPath(P))
-     return Ret;
-@@ -1053,7 +1056,10 @@ ToolChain::path_list ToolChain::getArchSpecificLibPaths() const {
-   path_list Paths;
- 
-   auto AddPath = [&](const ArrayRef<StringRef> &SS) {
--    SmallString<128> Path(getDriver().ResourceDir);
-+    SmallString<128> Path(getDriver().SysRoot);
-+    StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
-+    llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
-+                            CLANG_VERSION_STRING);
-     llvm::sys::path::append(Path, "lib");
-     for (auto &S : SS)
-       llvm::sys::path::append(Path, S);
diff --git a/meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch b/meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch
new file mode 100644
index 0000000000..a2a7fa80f1
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch
@@ -0,0 +1,105 @@
+From b818a92ac171e80e39ad9e99d1f862d23f2bb5b3 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Tue, 14 Apr 2026 16:17:01 +0900
+Subject: [PATCH] Consolidate and fix sysroot-based compiler-rt search paths
+
+Consolidate patches 0008 and 0033 into a single patch with a fix for
+native builds.
+
+Background:
+In Yocto/OE, compiler-rt and libc++ are built as separate recipes and
+installed into the target sysroot, not into clang's resource directory
+(which is relative to the clang driver installation).
+Patches 0008 (getCompilerRTPath, Khem Raj, 2017) and 0033 (getRuntimePath and
+getArchSpecificLibPaths, Khem Raj, 2025) addressed this by changing the
+runtime library search base from ResourceDir to SysRoot-based paths.
+
+Problem:
+The patches unconditionally replaced ResourceDir with a SysRoot-based
+path using CLANG_VERSION_STRING. In native/standalone builds where
+SysRoot is empty, this produces invalid absolute paths like
+"/usr/lib/clang/<full-version>/" pointing to the host filesystem instead of the
+build tree's resource directory. This breaks PGO bootstrap and any other
+native workflow that depends on compiler-rt runtime libraries
+(e.g., -fprofile-generate cannot find libclang_rt.profile.a).
+
+Fix:
+Use SysRoot-based paths only when SysRoot is actually set (i.e., during
+cross-compilation). When SysRoot is empty (native/standalone builds),
+fall back to the upstream default ResourceDir, which correctly resolves
+to the build tree's resource directory.
+
+The following functions are updated with this conditional logic:
+- getCompilerRTPath()
+- getRuntimePath()
+- getArchSpecificLibPaths()
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ clang/lib/Driver/ToolChain.cpp | 31 ++++++++++++++++++++++++++++---
+ 1 file changed, 28 insertions(+), 3 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain.cpp
+index 77a2c73f0..ac28b51c4 100644
+--- a/clang/lib/Driver/ToolChain.cpp
++++ b/clang/lib/Driver/ToolChain.cpp
+@@ -15,6 +15,7 @@
+ #include "ToolChains/InterfaceStubs.h"
+ #include "clang/Basic/ObjCRuntime.h"
+ #include "clang/Basic/Sanitizers.h"
++#include "clang/Basic/Version.h"
+ #include "clang/Config/config.h"
+ #include "clang/Driver/Action.h"
+ #include "clang/Driver/CommonArgs.h"
+@@ -723,7 +724,15 @@ StringRef ToolChain::getOSLibName() const {
+ }
+ 
+ std::string ToolChain::getCompilerRTPath() const {
+-  SmallString<128> Path(getDriver().ResourceDir);
++  SmallString<128> Path;
++  if (!getDriver().SysRoot.empty()) {
++    Path = getDriver().SysRoot;
++    StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
++    llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
++                              CLANG_VERSION_STRING);
++  } else {
++    Path = getDriver().ResourceDir;
++  }
+   if (isBareMetal()) {
+     llvm::sys::path::append(Path, "lib", getOSLibName());
+     if (!SelectedMultilibs.empty()) {
+@@ -1021,7 +1030,15 @@ ToolChain::getTargetSubDirPath(StringRef BaseDir) const {
+ }
+ 
+ std::optional<std::string> ToolChain::getRuntimePath() const {
+-  SmallString<128> P(D.ResourceDir);
++  SmallString<128> P;
++  if (!D.SysRoot.empty()) {
++    P = D.SysRoot;
++    StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
++    llvm::sys::path::append(P, "/usr/", ClangLibdirBasename, "clang",
++                            CLANG_VERSION_STRING);
++  } else {
++    P = D.ResourceDir;
++  }
+   llvm::sys::path::append(P, "lib");
+   if (auto Ret = getTargetSubDirPath(P))
+     return Ret;
+@@ -1049,7 +1066,15 @@ ToolChain::path_list ToolChain::getArchSpecificLibPaths() const {
+   path_list Paths;
+ 
+   auto AddPath = [&](const ArrayRef<StringRef> &SS) {
+-    SmallString<128> Path(getDriver().ResourceDir);
++    SmallString<128> Path;
++    if (!getDriver().SysRoot.empty()) {
++      Path = getDriver().SysRoot;
++      StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
++      llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
++                              CLANG_VERSION_STRING);
++    } else {
++      Path = getDriver().ResourceDir;
++    }
+     llvm::sys::path::append(Path, "lib");
+     for (auto &S : SS)
+       llvm::sys::path::append(Path, S);
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index fecc98d70a..9d45898c68 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -28,7 +28,6 @@ SRC_URI = "\
     file://0005-clang-driver-Check-sysroot-for-ldso-path.patch \
     file://0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch \
     file://0007-clang-Prepend-trailing-to-sysroot.patch \
-    file://0008-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch \
     file://0009-clang-Define-releative-gcc-installation-dir.patch \
     file://0010-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch \
     file://0011-Check-for-atomic-double-intrinsics.patch \
@@ -53,7 +52,6 @@ SRC_URI = "\
     file://0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
     file://0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
     file://0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
-    file://0033-clang-Use-sysroot-relative-paths-for-getArchSpecific.patch \
     file://0034-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch \
     file://0035-Prevent-revisiting-block-when-searching-for-noreturn.patch \
     file://0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch \
@@ -61,6 +59,7 @@ SRC_URI = "\
     file://0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
     file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch \
     file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch \
+    file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""

