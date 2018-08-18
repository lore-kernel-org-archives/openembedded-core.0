Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1986679210
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 19:25:49 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r64-v6so3792208pgr.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 12:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vKibzbLpaZgpSlBh2YkxbU8QkteV/aZDIQJG2yQS/Tk=;
	b=Qq69GJc2DZWFtgtbPwLgCT8uwEv5VV7ya5UyKbo4hKiOPNQkpCsyr/EVocvGAIS+Bf
	6J/+GiSnWo6qGBanOZC41C+1zuKfcmCIf/hxi9Mt2ArsUK2vCFfNMe1/JCNG8bcSqej+
	DO8uRqPecFCqY+wf7pUQbUy35CKPzj/9LsMozjD0XEbTZekmUTdwLsbsrV3y22c8oCvi
	F9pP8T3rIJEy70gXfZImit/SX0BieWERG/xwO9cxFSVJ9IOnWnRdz2STJQ/59XBWU2QH
	cJAHNPvzztcwluVEYyBXXq7JJPhiWkbK++Ub8J46/c0GiredjGST0eeGPyssX64EFQou
	KhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vKibzbLpaZgpSlBh2YkxbU8QkteV/aZDIQJG2yQS/Tk=;
	b=Vr6arrKvI4D+7KrwFCY1o6KumJP/pyovTDODDItYOs5gbmm/+6KMR0EIn4+gK8YzoW
	cl2z+qLaYx3DZ8Xx00ZaeX/KlF/B+QE9mJBB7mr+GX6CDzoMtaFP3ycLEjS7NbDMdcfs
	cMZzRfFT8bsHLHM6QwSbde+na1yz8jGNYZjkMa72spRr0HSWOTu7MqkxNteED29+WUNV
	g1LhyBVEnmexGnwDz6wNNx8EBRMiayQ9J3EGW7YnXa+lGL2MiiGPKTqkOnxyV/nr9zWN
	O7VNt73aQt1PimfNxI7gp+RZ6vE9pTCN69ofyeN6RObBIeNr+X18ZiE1r+YmtIJW+lCN
	HFow==
X-Gm-Message-State: AOUpUlHIrG7GFMGffKB5bnue5qoCngHeBrcRQnLt/ch7TYDkxtBQlPI5
	qCpI+q7H/9uThxKcwlbsASFu3m1I
X-Google-Smtp-Source: AA+uWPzz7QvZKm7QYwdSXUrVFypPxIF1FujT/VuOgOHnL567MEGz1WAG95gdVva7E+BzYeOtQHuz9w==
X-Received: by 2002:a63:8042:: with SMTP id
	j63-v6mr36893343pgd.230.1534620350880; 
	Sat, 18 Aug 2018 12:25:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	k64-v6sm6723068pgd.47.2018.08.18.12.25.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 12:25:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2018 12:25:37 -0700
Message-Id: <60211748013740f932e9e7f4b091f0df86d53a97.1534620189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534620189.git.raj.khem@gmail.com>
References: <cover.1534620189.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] llvm: Use YOCTO_ALTERNATE_MULTILIB_NAME environment variable in llvm-config
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
X-List-Received-Date: Sat, 18 Aug 2018 19:25:50 -0000

llvm-config is a tool on similar veins as pkg-config but provides a lot
more information and packages which use llvm e.g. mesa use this tool to
poke for llvm related informaiton e.g. version, libpath, includepaths
to name a few, this has few challanges in cross build environments where
llvm-config is supposed to be build for buildhost but provide information
about target llvm which is addressed by building native llvm-config along
with target llvm build, but this is frowned upon by OE build system since
it detects that host paths are being used so we have to build it as part
of llvm-native but then it means install paths for llvm and llvm-native
are different and wrong paths get reported when llvm-config is used.
This is solved by providing YOCTO_ALTERNATE_EXE_PATH variable to let
llvm-config use that path instead of self-relative path to report back

Second problem is when building multi-lib packages base_libdir is different
for target packages but native llvm-config does not know about it so
it reports non-multilibbed paths as libdir and packages can not find
llvm in sysroot. This is fixed by adding another environment variable
YOCTO_ALTERNATE_MULTILIB_NAME which can be set from recipes to set
proper multilib path

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-llvm-allow-env-override-of-exe-path.patch | 47 ++++++++++++++++---
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
index 21d2f81b58..6a9283323c 100644
--- a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 2f8ea767afdaa440c6368040630e1b3ea6a0977a Mon Sep 17 00:00:00 2001
+From aeccf16eaccdd80e4d5ecaa51673ce4b2bac1130 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH 2/2] llvm: allow env override of exe path
@@ -8,16 +8,19 @@ return the libraries, include directories, etc. from inside the sysroot rather
 than from the native sysroot. Thus provide an env override for calling
 llvm-config from a target sysroot.
 
+To let it work in multilib environment, we need to provide a knob to supply
+multilib dirname as well
+
+Upstream-Status: Inappropriate [OE-Specific]
+
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
- tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
+ tools/llvm-config/llvm-config.cpp | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/tools/llvm-config/llvm-config.cpp b/tools/llvm-config/llvm-config.cpp
-index 08b096afb05..d8d7742744e 100644
+index 08b096afb05..360cc5abf4e 100644
 --- a/tools/llvm-config/llvm-config.cpp
 +++ b/tools/llvm-config/llvm-config.cpp
 @@ -225,6 +225,13 @@ Typical components:\n\
@@ -34,6 +37,36 @@ index 08b096afb05..d8d7742744e 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
+@@ -306,12 +313,20 @@ int main(int argc, char **argv) {
+   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
+               ActiveCMakeDir;
+   std::string ActiveIncludeOption;
++  // Hack for Yocto: we need to override the multilib path when we are using
++  // llvm-config from within a target sysroot.
++  std::string Multilibdir = std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME");
++  if (Multilibdir.empty()) {
++    Multilibdir = "/lib" LLVM_LIBDIR_SUFFIX;
++  }
++
+   if (IsInDevelopmentTree) {
+     ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
+     ActivePrefix = CurrentExecPrefix;
+ 
+     // CMake organizes the products differently than a normal prefix style
+     // layout.
++
+     switch (DevelopmentTreeLayout) {
+     case CMakeStyle:
+       ActiveBinDir = ActiveObjRoot + "/bin";
+@@ -336,7 +351,7 @@ int main(int argc, char **argv) {
+     SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
+     sys::fs::make_absolute(ActivePrefix, path);
+     ActiveBinDir = path.str();
+-    ActiveLibDir = ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
++    ActiveLibDir = ActivePrefix + Multilibdir;
+     ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
+     ActiveIncludeOption = "-I" + ActiveIncludeDir;
+   }
 -- 
-2.16.1
+2.18.0
 
-- 
2.18.0


