Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9282.1602153567905789916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 03:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=dcV+Q5ec;
 spf=pass (domain: blade-group.com, ip: 209.85.128.41, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f41.google.com with SMTP id d81so5926433wmc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FV2GBdHb0euxJcz5RwCHMNb4stf5uDRWAwi1iO2Zygs=;
        b=dcV+Q5eclWkxq8+JBZXP3d2Sfk9KYMHzX9Qk7ADKI3wZMIrFzMQpzHTbSOct5sdcn9
         nXcGZuEre58DMvohsMw+Tk+HB5i5FdqW+JwQsmZJVG27g4jCpoD65CRbm1QB8gryJ4gX
         vUKhVY8c+s4/Xu82TaAV3d8wTDMvwahtPQcnzUwvD/hqrx7mDb9Caw3851UKn8bWbg1Z
         kCq0TTgSbKP7d9Shii0wwycazanVg6hv+Xinex4+CCZtyalXFx5qRQ4/qBYQROTIPG+0
         5G7I494GoUuw9mPnFteiclZe0fi5jGPIm44ICrp3kG3tZWLymhFDIOMxQIuGGB95DYan
         zctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FV2GBdHb0euxJcz5RwCHMNb4stf5uDRWAwi1iO2Zygs=;
        b=bWToccj59y2/DMQB8OZmyHH5WOVYp/FLYKByTMthL4WGIMzMkCFH6Qc+9Otp/9p+nX
         n6IWOSGlHloehk51dzM40FMsDrqkonS1tIB/5wsl5bMVrOl3v5eCeJxp2hDg1n44YYSW
         rGdNr49fzpi74f/v6gbdtHZFaNzXnvJg6fEakaW8jvwCATO0i9p3wWNe1EzQdA8LB0o7
         iYP1NXSSzP4F1NscmNh2/TA26leOkVCMwAFZHFXvl1vH4SdlUjp1zGZCUCQ32gYW2iXM
         WOSAiz1dnGByI+y4l10/qTsHJRKYoN/9BHqnJKeUJaYcH0OGO/r08wy7yN5I+Dfi26RW
         3GQw==
X-Gm-Message-State: AOAM533NzRmpmFo3RoS6juINKf3afZKHzErh+zdGn/6FGwAuCZhjAu4a
	zLI8CtKr7sAXWH2gQrXCFCiHSTjPwT5nKeB2
X-Google-Smtp-Source: ABdhPJwB1gfQiypznbUtafXbxi8GyZQP1tmbl0kjCl7oZq9B/9dHRtRRReKL8cBZtJsEXHHw+h5vrw==
X-Received: by 2002:a1c:e256:: with SMTP id z83mr7671282wmg.37.1602153565517;
        Thu, 08 Oct 2020 03:39:25 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id y10sm805996wrq.73.2020.10.08.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 03:39:24 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2] llvm: fix llvm-config to work again with multilib
Date: Thu,  8 Oct 2020 12:38:52 +0200
Message-Id: <20201008103852.803147-1-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Newer llvm versions have changed the logic for finding libraries,
which prevents Mesa from building with PACKAGECONFIG[gallium-llvm]:

The problem is visible in mesa/do_configure with this in local.conf:

    PACKAGECONFIG_append_pn-mesa += " gallium-llvm"
    require conf/multilib.conf
    MULTILIBS = "multilib:lib32"
    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13937

This patch comes from meta-amd#dunfell for llvm-9.0.1, adapted for llvm-10.0.1.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 ...-llvm-allow-env-override-of-exe-path.patch | 87 +++++++++++++++++--
 1 file changed, 78 insertions(+), 9 deletions(-)

I'm dubious about the [OE-Specific] tag in patch metadata, although it
sure would not be acceptable upstream as-is :)

diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index b01b8647c9..98d85eab5d 100644
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
@@ -35,3 +38,69 @@ index 7ef7c46a262..a4f7ed82c7b 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
+@@ -306,7 +313,7 @@ int main(int argc, char **argv) {
+   // bin dir).
+   sys::fs::make_absolute(CurrentPath);
+   CurrentExecPrefix =
+-      sys::path::parent_path(sys::path::parent_path(CurrentPath)).str();
++      sys::path::parent_path(sys::path::parent_path(sys::path::parent_path(CurrentPath))).str();
+ 
+   // Check to see if we are inside a development tree by comparing to possible
+   // locations (prefix style or CMake style).
+@@ -329,40 +336,47 @@ int main(int argc, char **argv) {
+   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
+               ActiveCMakeDir;
+   std::string ActiveIncludeOption;
++  // Hack for Yocto: we need to override the multilib path when we are using
++  // llvm-config from within a target sysroot.
++  std::string Multilibdir = std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME");
++  if (Multilibdir.empty()) {
++    Multilibdir = "/lib/llvm10.0.1" LLVM_LIBDIR_SUFFIX;
++  }
++
+   if (IsInDevelopmentTree) {
+-    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
++    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include/llvm10.0.1";
+     ActivePrefix = CurrentExecPrefix;
+ 
+     // CMake organizes the products differently than a normal prefix style
+     // layout.
+     switch (DevelopmentTreeLayout) {
+     case CMakeStyle:
+-      ActiveBinDir = ActiveObjRoot + "/bin";
+-      ActiveLibDir = ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX;
++      ActiveBinDir = ActiveObjRoot + "/bin/llvm10.0.1";
++      ActiveLibDir = ActiveObjRoot + "/lib/llvm10.0.1" + LLVM_LIBDIR_SUFFIX;
+       ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
+       break;
+     case CMakeBuildModeStyle:
+       // FIXME: Should we consider the build-mode-specific path as the prefix?
+       ActivePrefix = ActiveObjRoot;
+-      ActiveBinDir = ActiveObjRoot + "/" + build_mode + "/bin";
++      ActiveBinDir = ActiveObjRoot + "/" + build_mode + "/bin/llvm10.0.1";
+       ActiveLibDir =
+-          ActiveObjRoot + "/" + build_mode + "/lib" + LLVM_LIBDIR_SUFFIX;
++          ActiveObjRoot + "/" + build_mode + "/lib/llvm10.0.1" + LLVM_LIBDIR_SUFFIX;
+       // The CMake directory isn't separated by build mode.
+       ActiveCMakeDir =
+-          ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX + "/cmake/llvm";
++          ActivePrefix + "/lib/llvm10.0.1" + LLVM_LIBDIR_SUFFIX + "/cmake/llvm";
+       break;
+     }
+ 
+     // We need to include files from both the source and object trees.
+     ActiveIncludeOption =
+-        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include");
++        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include/llvm10.0.1");
+   } else {
+     ActivePrefix = CurrentExecPrefix;
+-    ActiveIncludeDir = ActivePrefix + "/include";
++    ActiveIncludeDir = ActivePrefix + "/include/llvm10.0.1";
+     SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
+     sys::fs::make_absolute(ActivePrefix, path);
+     ActiveBinDir = path.str();
+-    ActiveLibDir = ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
++    ActiveLibDir = ActivePrefix + Multilibdir;
+     ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
+     ActiveIncludeOption = "-I" + ActiveIncludeDir;
+   }
-- 
2.28.0

