Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 98E3D7F3AB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 18:35:47 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 19so37608765pfa.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JQbs+rgiYs8EezBulhdPnMMD6BT3wgqNTuZouMem0gE=;
	b=Vvv0CQHIux0T0LAxOpsato0FKFsgu03ReYQ3Q1Pt+s3dmEdqHLitDtKxLeuX4hKZgH
	aOWf2CF1+zjM4X3cADDD9n1+HAiMxhD4zDJwaW0t2/Xi4QhcBxk/X8QEQTnhxEI0waWq
	PJ2+qIlCwrOr8MGUoTbfn5iO90KzBjQwI+fHO/TIL3HW4VRhobCwC89WdZzY9hPGa3bW
	3OrhfVRDTC8gWk2B6KaypadcvKc+WAZ6K/btC5hlKjt6fx9/s1Po03ekshFGhCkv2qO3
	pI/E/cnxYY2Z6Ss+M7+pXF46d/Lz7UET9rHvgU8+Mqq7TyHCxLIMYHJa1TleJVYztC2N
	8sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JQbs+rgiYs8EezBulhdPnMMD6BT3wgqNTuZouMem0gE=;
	b=HxnX2lHCgeAJJxK5RDdLSpoIAR0/Jc5r326wdDZBYvCMSxG/TN4K6RzEyRC/+VWJwO
	gawuDwqYyD3qVthArge+n91hkeowpeqn5TQTQZOZgvyjeEf5Icikym+3dOTewd7ChTPv
	jmRYM8U5QIjTUwbqvtLUjiopkLPn1blVv2amAY/FmgiHhAYNMtNdntX4v3+QvnxMJqA8
	HsxF+fNHMaaZ5sUViCpLmOxI692PG45rsMCy1eL09wQQakk9WsDy3BpitK/9nByy/6vw
	x3kxmA/d5RLsdnjwBQAz80jOkVvns8DP28L7kGHtYlRyi0fKxffAMTPR/h35O5TuxP++
	mLOA==
X-Gm-Message-State: APjAAAVOvJEzAS0hno+L5pdcFee5o2U9ZnNWBn9SVki2a9hVm6oUlhFH
	YQoJVwobUFS7zznNVwuOXpqOQMNoLWw=
X-Google-Smtp-Source: APXvYqxyiFEyMbXZTbvmfjnM+aRAVbO70tl+BWfuRI+wJdU8pwYSqpCA2Ovud1dLrxnHKSliJQJG9Q==
X-Received: by 2002:a63:d301:: with SMTP id b1mr121460157pgg.379.1564857347835;
	Sat, 03 Aug 2019 11:35:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	g11sm85479791pgu.11.2019.08.03.11.35.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 03 Aug 2019 11:35:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Aug 2019 11:35:36 -0700
Message-Id: <20190803183536.38590-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH V2] mesa, llvm, meson: Update llvm to 8.0.1 plus define and use LLVM version globally
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Aug 2019 18:35:47 -0000
Content-Transfer-Encoding: 8bit

- Add missing dependency on libedit
- Define LLVMVERSION on the same lines as GCCVERSION and other tools
- Use LLVMVERSION in mesa and meson.bbclass to get llvm version instead of
  hardcoding it
- Use llvm patches unmodified from meta-clang, helps in keeping them in
  sync
- Define PREFERRED_VERSION for llvm, llvm-native, nativesdk-llvm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
 - Fix build failure due to meson hardcoding llvm version
 - Refresh and sync patches with meta-clang
 - Define LLVMVERSION

 meta/classes/meson.bbclass                    |   2 +-
 meta/conf/distro/include/tcmode-default.inc   |   7 ++
 ...-llvm-allow-env-override-of-exe-path.patch | 114 ------------------
 ...yInfo-Undefine-libc-functions-if-th.patch} |  31 ++---
 ...-llvm-allow-env-override-of-exe-path.patch |  38 ++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |  10 +-
 meta/recipes-graphics/mesa/mesa.inc           |   6 +-
 7 files changed, 71 insertions(+), 137 deletions(-)
 delete mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
 rename meta/recipes-devtools/llvm/llvm/{0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch => 0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch} (71%)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index dafdd18bf4..48ca112d80 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -82,7 +82,7 @@ ld = ${@meson_array('LD', d)}
 strip = ${@meson_array('STRIP', d)}
 readelf = ${@meson_array('READELF', d)}
 pkgconfig = 'pkg-config'
-llvm-config = 'llvm-config8.0.0'
+llvm-config = 'llvm-config${LLVMVERSION}'
 
 [properties]
 needs_exe_wrapper = true
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 69f6344c04..1966dbd521 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,6 +26,9 @@ GLIBCVERSION ?= "2.30%"
 LINUXLIBCVERSION ?= "5.0%"
 QEMUVERSION ?= "4.0%"
 GOVERSION ?= "1.12%"
+# This can not use wildcards like 8.0.% since it is also used in mesa to denote
+# llvm version being used, so always bump it with llvm recipe version bump
+LLVMVERSION ?= "8.0.1"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
@@ -76,3 +79,7 @@ PREFERRED_VERSION_go-native ?= "${GOVERSION}"
 PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
+
+PREFERRED_VERSION_llvm = "${LLVMVERSION}"
+PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
+PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
deleted file mode 100644
index 1369bcf78c..0000000000
--- a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 0570fe02c07244a8724c1e6c0437f893c8aa8e93 Mon Sep 17 00:00:00 2001
-From: Martin Kelly <mkelly@xevo.com>
-Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH 2/2] llvm: allow env override of exe path
-
-When using a native llvm-config from inside a sysroot, we need llvm-config to
-return the libraries, include directories, etc. from inside the sysroot rather
-than from the native sysroot. Thus provide an env override for calling
-llvm-config from a target sysroot.
-
-To let it work in multilib environment, we need to provide a knob to supply
-multilib dirname as well
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/llvm-config/llvm-config.cpp | 35 ++++++++++++++++++++++---------
- 1 file changed, 25 insertions(+), 10 deletions(-)
-
-diff --git a/tools/llvm-config/llvm-config.cpp b/tools/llvm-config/llvm-config.cpp
-index bec89fef98c..91b4d6e4c43 100644
---- a/tools/llvm-config/llvm-config.cpp
-+++ b/tools/llvm-config/llvm-config.cpp
-@@ -226,6 +226,13 @@ Typical components:\n\
- 
- /// Compute the path to the main executable.
- std::string GetExecutablePath(const char *Argv0) {
-+  // Hack for Yocto: we need to override the root path when we are using
-+  // llvm-config from within a target sysroot.
-+  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
-+  if (Sysroot != nullptr) {
-+    return Sysroot;
-+  }
-+
-   // This just needs to be some symbol in the binary; C++ doesn't
-   // allow taking the address of ::main however.
-   void *P = (void *)(intptr_t)GetExecutablePath;
-@@ -284,7 +291,7 @@ int main(int argc, char **argv) {
-   // bin dir).
-   sys::fs::make_absolute(CurrentPath);
-   CurrentExecPrefix =
--      sys::path::parent_path(sys::path::parent_path(CurrentPath)).str();
-+      sys::path::parent_path(sys::path::parent_path(sys::path::parent_path(CurrentPath))).str();
- 
-   // Check to see if we are inside a development tree by comparing to possible
-   // locations (prefix style or CMake style).
-@@ -293,7 +300,7 @@ int main(int argc, char **argv) {
-     DevelopmentTreeLayout = CMakeStyle;
-     ActiveObjRoot = LLVM_OBJ_ROOT;
-   } else if (sys::fs::equivalent(CurrentExecPrefix,
--                                 Twine(LLVM_OBJ_ROOT) + "/bin")) {
-+                                 Twine(LLVM_OBJ_ROOT) + "/bin/llvm8.0.0")) {
-     IsInDevelopmentTree = true;
-     DevelopmentTreeLayout = CMakeBuildModeStyle;
-     ActiveObjRoot = LLVM_OBJ_ROOT;
-@@ -307,37 +314,45 @@ int main(int argc, char **argv) {
-   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
-               ActiveCMakeDir;
-   std::string ActiveIncludeOption;
-+  // Hack for Yocto: we need to override the multilib path when we are using
-+  // llvm-config from within a target sysroot.
-+  std::string Multilibdir = std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME");
-+  if (Multilibdir.empty()) {
-+    Multilibdir = "/lib/llvm8.0.0" LLVM_LIBDIR_SUFFIX;
-+  }
-+
-   if (IsInDevelopmentTree) {
--    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
-+    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include/llvm8.0.0";
-     ActivePrefix = CurrentExecPrefix;
- 
-     // CMake organizes the products differently than a normal prefix style
-     // layout.
-+
-     switch (DevelopmentTreeLayout) {
-     case CMakeStyle:
--      ActiveBinDir = ActiveObjRoot + "/bin";
--      ActiveLibDir = ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX;
-+      ActiveBinDir = ActiveObjRoot + "/bin/llvm8.0.0";
-+      ActiveLibDir = ActiveObjRoot + "/lib/llvm8.0.0" + LLVM_LIBDIR_SUFFIX;
-       ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
-       break;
-     case CMakeBuildModeStyle:
-       ActivePrefix = ActiveObjRoot;
--      ActiveBinDir = ActiveObjRoot + "/bin/" + build_mode;
-+      ActiveBinDir = ActiveObjRoot + "/bin/llvm8.0.0/" + build_mode;
-       ActiveLibDir =
--          ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
-+          ActiveObjRoot + "/lib/llvm8.0.0" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
-       ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
-       break;
-     }
- 
-     // We need to include files from both the source and object trees.
-     ActiveIncludeOption =
--        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include");
-+        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include/llvm8.0.0");
-   } else {
-     ActivePrefix = CurrentExecPrefix;
--    ActiveIncludeDir = ActivePrefix + "/include";
-+    ActiveIncludeDir = ActivePrefix + "/include/llvm8.0.0";
-     SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
-     sys::fs::make_absolute(ActivePrefix, path);
-     ActiveBinDir = path.str();
--    ActiveLibDir = ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
-+    ActiveLibDir = ActivePrefix + Multilibdir;
-     ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
-     ActiveIncludeOption = "-I" + ActiveIncludeDir;
-   }
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
similarity index 71%
rename from meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
rename to meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
index 6dbbced7eb..789c308863 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
+++ b/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
@@ -1,7 +1,8 @@
-From 905cac8934fb17e20416a4df712a566e757471a3 Mon Sep 17 00:00:00 2001
+From 4c08879d2dfbe7face4e679ac8499dc7bff2dd20 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 May 2016 00:33:20 +0000
-Subject: [PATCH 1/2] llvm: TargetLibraryInfo: Undefine libc functions if they are macros
+Subject: [PATCH 06/19] llvm: TargetLibraryInfo: Undefine libc functions if
+ they are macros
 
 musl defines some functions as macros and not inline functions
 if this is the case then make sure to undefine them
@@ -9,14 +10,14 @@ if this is the case then make sure to undefine them
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- include/llvm/Analysis/TargetLibraryInfo.def | 21 +++++++++++++++++++++
+ .../llvm/Analysis/TargetLibraryInfo.def       | 21 +++++++++++++++++++
  1 file changed, 21 insertions(+)
 
-diff --git a/include/llvm/Analysis/TargetLibraryInfo.def b/include/llvm/Analysis/TargetLibraryInfo.def
-index 518a85ee1a0..6b4ead4efc6 100644
---- a/include/llvm/Analysis/TargetLibraryInfo.def
-+++ b/include/llvm/Analysis/TargetLibraryInfo.def
-@@ -731,6 +731,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
+diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
+index afed404f04c..876888656f2 100644
+--- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
++++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
+@@ -782,6 +782,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
  TLI_DEFINE_ENUM_INTERNAL(fopen)
  TLI_DEFINE_STRING_INTERNAL("fopen")
  /// FILE *fopen64(const char *filename, const char *opentype)
@@ -26,7 +27,7 @@ index 518a85ee1a0..6b4ead4efc6 100644
  TLI_DEFINE_ENUM_INTERNAL(fopen64)
  TLI_DEFINE_STRING_INTERNAL("fopen64")
  /// int fork();
-@@ -778,6 +781,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
+@@ -829,6 +832,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
  /// int fseeko(FILE *stream, off_t offset, int whence);
  TLI_DEFINE_ENUM_INTERNAL(fseeko)
  TLI_DEFINE_STRING_INTERNAL("fseeko")
@@ -36,7 +37,7 @@ index 518a85ee1a0..6b4ead4efc6 100644
  /// int fseeko64(FILE *stream, off64_t offset, int whence)
  TLI_DEFINE_ENUM_INTERNAL(fseeko64)
  TLI_DEFINE_STRING_INTERNAL("fseeko64")
-@@ -788,6 +794,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
+@@ -839,6 +845,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
  TLI_DEFINE_ENUM_INTERNAL(fstat)
  TLI_DEFINE_STRING_INTERNAL("fstat")
  /// int fstat64(int filedes, struct stat64 *buf)
@@ -46,7 +47,7 @@ index 518a85ee1a0..6b4ead4efc6 100644
  TLI_DEFINE_ENUM_INTERNAL(fstat64)
  TLI_DEFINE_STRING_INTERNAL("fstat64")
  /// int fstatvfs(int fildes, struct statvfs *buf);
-@@ -803,6 +812,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
+@@ -854,6 +863,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
  TLI_DEFINE_ENUM_INTERNAL(ftello)
  TLI_DEFINE_STRING_INTERNAL("ftello")
  /// off64_t ftello64(FILE *stream)
@@ -56,7 +57,7 @@ index 518a85ee1a0..6b4ead4efc6 100644
  TLI_DEFINE_ENUM_INTERNAL(ftello64)
  TLI_DEFINE_STRING_INTERNAL("ftello64")
  /// int ftrylockfile(FILE *file);
-@@ -929,6 +941,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
+@@ -980,6 +992,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
  TLI_DEFINE_ENUM_INTERNAL(lstat)
  TLI_DEFINE_STRING_INTERNAL("lstat")
  /// int lstat64(const char *path, struct stat64 *buf);
@@ -66,7 +67,7 @@ index 518a85ee1a0..6b4ead4efc6 100644
  TLI_DEFINE_ENUM_INTERNAL(lstat64)
  TLI_DEFINE_STRING_INTERNAL("lstat64")
  /// void *malloc(size_t size);
-@@ -1154,6 +1169,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
+@@ -1205,6 +1220,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
  TLI_DEFINE_ENUM_INTERNAL(stat)
  TLI_DEFINE_STRING_INTERNAL("stat")
  /// int stat64(const char *path, struct stat64 *buf);
@@ -76,7 +77,7 @@ index 518a85ee1a0..6b4ead4efc6 100644
  TLI_DEFINE_ENUM_INTERNAL(stat64)
  TLI_DEFINE_STRING_INTERNAL("stat64")
  /// int statvfs(const char *path, struct statvfs *buf);
-@@ -1283,6 +1301,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
+@@ -1340,6 +1358,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
  TLI_DEFINE_ENUM_INTERNAL(tmpfile)
  TLI_DEFINE_STRING_INTERNAL("tmpfile")
  /// FILE *tmpfile64(void)
@@ -87,5 +88,5 @@ index 518a85ee1a0..6b4ead4efc6 100644
  TLI_DEFINE_STRING_INTERNAL("tmpfile64")
  /// int toascii(int c);
 -- 
-2.20.1
+2.22.0
 
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
new file mode 100644
index 0000000000..f47080c9fd
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -0,0 +1,38 @@
+From b66d6f39a374b8df41e7235351e5dee2e81f440c Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Fri, 19 May 2017 00:22:57 -0700
+Subject: [PATCH 07/19] llvm: allow env override of exe path
+
+When using a native llvm-config from inside a sysroot, we need llvm-config to
+return the libraries, include directories, etc. from inside the sysroot rather
+than from the native sysroot. Thus provide an env override for calling
+llvm-config from a target sysroot.
+
+Upstream-Status: Pending
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
+index 7ef7c46a262..a4f7ed82c7b 100644
+--- a/llvm/tools/llvm-config/llvm-config.cpp
++++ b/llvm/tools/llvm-config/llvm-config.cpp
+@@ -225,6 +225,13 @@ Typical components:\n\
+ 
+ /// Compute the path to the main executable.
+ std::string GetExecutablePath(const char *Argv0) {
++  // Hack for Yocto: we need to override the root path when we are using
++  // llvm-config from within a target sysroot.
++  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
++  if (Sysroot != nullptr) {
++    return Sysroot;
++  }
++
+   // This just needs to be some symbol in the binary; C++ doesn't
+   // allow taking the address of ::main however.
+   void *P = (void *)(intptr_t)GetExecutablePath;
+-- 
+2.22.0
+
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 0067635c2b..35ad3ced37 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -8,7 +8,7 @@ SECTION = "devel"
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
 
-DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
+DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm-native"
 
 RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
 
@@ -19,17 +19,17 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "d2298e74235598f15594fe2c99bbac870a507c59"
+SRCREV = "19a71f6bdf2dddb10764939e7f0ec2b98dba76c9"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
 MAJOR_VERSION = "8"
 MINOR_VERSION = "0"
-PATCH_VERSION = "0"
+PATCH_VERSION = "1"
 SOLIBVER = "1"
 PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
-           file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
-           file://0002-llvm-allow-env-override-of-exe-path.patch \
+           file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
+           file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
           "
 
 S = "${WORKDIR}/git/llvm"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5bbd13bca2..e99eb39d26 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -36,6 +36,10 @@ PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
 
 export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
 export YOCTO_ALTERNATE_MULTILIB_NAME = "${base_libdir}"
+export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
+export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
+
+MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
 
 EXTRA_OEMESON = " \
     -Dshared-glapi=true \
@@ -107,10 +111,8 @@ GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600',
 GALLIUMDRIVERS_append = ",virgl"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS}, -Dgallium-drivers=''"
-MESA_LLVM_RELEASE ?= "8.0.0"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true, -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
-export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 PACKAGECONFIG[xa]  = "-Dgallium-xa=true, -Dgallium-xa=false"
 
 PACKAGECONFIG[lima] = ""
-- 
2.22.0


