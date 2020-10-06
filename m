Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.11401.1601980883980255270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 03:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Vc1QgiyR;
 spf=pass (domain: blade-group.com, ip: 209.85.128.47, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f47.google.com with SMTP id d3so2547314wma.4
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 03:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rd0K6/8wnjbXxmeeAHCtNCU2Fp7SXLKxBLqPcWQUVuo=;
        b=Vc1QgiyRAbWUriu3MRyUZ1KMKi8c39PRT00TstPVOQ1TnkPufyr69jdTUDDhbaSVkk
         /E9NFTGgl0b+IrKswj+YVscj3GpygQfMo49zXwxqXRaSAMWSGRn4JSQr279yfotNAvGz
         LUoKeWyjcsY9DJUwMXW1QSSvLjTTMmvHqiQ3hFAGEjhv/qiIP1HRp5TNltBVs68qj8dd
         wDK/6d2eHsqd01bqwbsQTOVZbsWbSd9AJtuRsUzPRuT7Q2FkjuQ6TFpGB5pX+Rh8xcO8
         qclJfHGi+S+7vPzyBwbfsbUKtq89hzGIqNpwXykAzyQta2Y7Y7v0uoWtaP28LWoxH4Nw
         c/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rd0K6/8wnjbXxmeeAHCtNCU2Fp7SXLKxBLqPcWQUVuo=;
        b=mQJFIKD0YALLCXRLh9vyxWNHuUtJ559F4KWbpIAKxq/A/maOLiKG+T5GHxuT/iIBsQ
         Jdhz4XzdYjGNgMKC9SlFJVy3HRBrkYCF1Ag01RPV0jNPxhLsd9bj+UiIp3Th7ywklFjx
         lr29iDNQl+gCt2fJiUFXOyTnw1t5CcR9qVJ1+pltnL6ixAJqGGKTcBK0l6qNfYwPAh8D
         OV9TM/x3HyR/FBfdQsI/jvvTA3OUnU61Lb+0gRF//chEo8Ru+2K8VZVj35NOYIpl7QYv
         9jH/f3reR8S7xHaPXmxuuKiPzye9Lz/vcjkJgdreiXVcgrMzg9DYt8to1YoNvmQR0Avu
         4XBQ==
X-Gm-Message-State: AOAM533A8JoErmiJXThTH6sFvkwCFhhza+udexMjcLKyPoRqHhMIWSQ6
	f5z9RPjRtJN8qOlVWuRPiRviyXe0+8E8f1g1
X-Google-Smtp-Source: ABdhPJys9nC4dcsrYeknu0neQyJjI+MZX1+oOcS/PlOrz/s6ml7jDV/+saSM9GTFXCU7kIMKsRvXCQ==
X-Received: by 2002:a1c:bb84:: with SMTP id l126mr4367156wmf.159.1601980881777;
        Tue, 06 Oct 2020 03:41:21 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id f12sm3218755wmf.26.2020.10.06.03.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 03:41:20 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] llvm: fix llvm-config to work again with multilib
Date: Tue,  6 Oct 2020 12:40:34 +0200
Message-Id: <20201006104034.800021-1-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Newer llvm versions have changed the logic for finding libraries,
which prevents Mesa from building with PACKAGECONFIG[gallium-llvm]:

See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13937

This patch comes from meta-amd, which exhibits one such situation.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 ...-llvm-allow-env-override-of-exe-path.patch | 96 +++++++++++++++++--
 1 file changed, 87 insertions(+), 9 deletions(-)


Note that I took the updated patch from meta-amd without a change, and
I'm dubious about the [OE-Specific] tag in patch metadata.


diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index b01b8647c9..417eaf0aa1 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,27 +1,30 @@
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From 61b00e1e051e367f5483d7b5253b6c85a9e8a90f Mon Sep 17 00:00:00 2001
+From 0570fe02c07244a8724c1e6c0437f893c8aa8e93 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH] llvm: allow env override of exe path
+Subject: [PATCH 2/2] llvm: allow env override of exe path
 
 When using a native llvm-config from inside a sysroot, we need llvm-config to
 return the libraries, include directories, etc. from inside the sysroot rather
 than from the native sysroot. Thus provide an env override for calling
 llvm-config from a target sysroot.
 
+To let it work in multilib environment, we need to provide a knob to supply
+multilib dirname as well
+
+Upstream-Status: Inappropriate [OE-Specific]
+
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
 ---
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
+ llvm/tools/llvm-config/llvm-config.cpp | 35 ++++++++++++++++++++++---------
+ 1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index 7ef7c46a262..a4f7ed82c7b 100644
+index bec89fef98c..91b4d6e4c43 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -225,6 +225,13 @@ Typical components:\n\
+@@ -226,6 +226,13 @@ Typical components:\n\
  
  /// Compute the path to the main executable.
  std::string GetExecutablePath(const char *Argv0) {
@@ -35,3 +38,78 @@ index 7ef7c46a262..a4f7ed82c7b 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
+@@ -284,7 +291,7 @@ int main(int argc, char **argv) {
+   // bin dir).
+   sys::fs::make_absolute(CurrentPath);
+   CurrentExecPrefix =
+-      sys::path::parent_path(sys::path::parent_path(CurrentPath)).str();
++      sys::path::parent_path(sys::path::parent_path(sys::path::parent_path(CurrentPath))).str();
+ 
+   // Check to see if we are inside a development tree by comparing to possible
+   // locations (prefix style or CMake style).
+@@ -293,7 +300,7 @@ int main(int argc, char **argv) {
+     DevelopmentTreeLayout = CMakeStyle;
+     ActiveObjRoot = LLVM_OBJ_ROOT;
+   } else if (sys::fs::equivalent(CurrentExecPrefix,
+-                                 Twine(LLVM_OBJ_ROOT) + "/bin")) {
++                                 Twine(LLVM_OBJ_ROOT) + "/bin/llvm9.0.1")) {
+     IsInDevelopmentTree = true;
+     DevelopmentTreeLayout = CMakeBuildModeStyle;
+     ActiveObjRoot = LLVM_OBJ_ROOT;
+@@ -307,37 +314,45 @@ int main(int argc, char **argv) {
+   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
+               ActiveCMakeDir;
+   std::string ActiveIncludeOption;
++  // Hack for Yocto: we need to override the multilib path when we are using
++  // llvm-config from within a target sysroot.
++  std::string Multilibdir = std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME");
++  if (Multilibdir.empty()) {
++    Multilibdir = "/lib/llvm9.0.1" LLVM_LIBDIR_SUFFIX;
++  }
++
+   if (IsInDevelopmentTree) {
+-    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
++    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include/llvm9.0.1";
+     ActivePrefix = CurrentExecPrefix;
+ 
+     // CMake organizes the products differently than a normal prefix style
+     // layout.
++
+     switch (DevelopmentTreeLayout) {
+     case CMakeStyle:
+-      ActiveBinDir = ActiveObjRoot + "/bin";
+-      ActiveLibDir = ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX;
++      ActiveBinDir = ActiveObjRoot + "/bin/llvm9.0.1";
++      ActiveLibDir = ActiveObjRoot + "/lib/llvm9.0.1" + LLVM_LIBDIR_SUFFIX;
+       ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
+       break;
+     case CMakeBuildModeStyle:
+       ActivePrefix = ActiveObjRoot;
+-      ActiveBinDir = ActiveObjRoot + "/bin/" + build_mode;
++      ActiveBinDir = ActiveObjRoot + "/bin/llvm9.0.1/" + build_mode;
+       ActiveLibDir =
+-          ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
++          ActiveObjRoot + "/lib/llvm9.0.1" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
+       ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
+       break;
+     }
+ 
+     // We need to include files from both the source and object trees.
+     ActiveIncludeOption =
+-        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include");
++        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include/llvm9.0.1");
+   } else {
+     ActivePrefix = CurrentExecPrefix;
+-    ActiveIncludeDir = ActivePrefix + "/include";
++    ActiveIncludeDir = ActivePrefix + "/include/llvm9.0.1";
+     SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
+     sys::fs::make_absolute(ActivePrefix, path);
+     ActiveBinDir = path.str();
+-    ActiveLibDir = ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
++    ActiveLibDir = ActivePrefix + Multilibdir;
+     ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
+     ActiveIncludeOption = "-I" + ActiveIncludeDir;
+   }
+-- 
+2.20.1
+
-- 
2.28.0

