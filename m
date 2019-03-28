Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED507D14F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 14:04:30 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q16so3716804wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 07:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0czuIJ7eolfQAymFBwDLzdVyRma5eUWHqjOOHYUyrj0=;
	b=aXQatDX33hKXiur4aLArbUWnmFvt55Fg1DgY01s1cumctbSpYtrzXb+0h+fx4nF908
	VsDjsG9i6CwBfVbaE1hMasJiSUPirPpLYpXMSHAY7sBZfLy92OapA8ZOahehuWYdSlNK
	PgWmKH28GBa5ReFWvSvTDx5+Bzzgz+KQt6GEPOVshhfR8+U9stVSgILaPW4MEMben5d4
	JW+JrttyidlqTsAu371PoGGzDmwyLr658VB0s3eg2Uea2DAcranr8Apb+I6D9fraN0yJ
	sMJEEMMGyeJmHRyG5lWfi3nBHxKBD3fr8G8Wy4Q3kHkHPbtorml8+1pFk6CBm6HMhKkO
	S8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0czuIJ7eolfQAymFBwDLzdVyRma5eUWHqjOOHYUyrj0=;
	b=J+v5/dStabvhirmB4xWLmsoCG2tlTzB8YQpW5MBv2NT+rIYxJPyCFjO67uolXfgNLS
	sbIIvlpDSjBiR38XJRU5z2z/rf6vbIFuMa/QPmfdBYWsIN4Ax+gWy5vYNKOk2Isb43SU
	vwc7vOgcZjFBx75a5TBiNSHQxuDkhFZ0pmwLSGoLQDL1EJtboAsKnSZcCsXRQiW2F+6H
	kZRNdbiz0uZUO+WGYfZjTajAUCfENxHFA+4CqGXPjTfHiAjIguHrkXyz1IDFbC52Y9oX
	9zwmyYMvN+071K4Qf//o8MJWl0MpAdo+SbNS0SBjpzo2mU5fEdQyPWv76dpYRsR/HPav
	xqgg==
X-Gm-Message-State: APjAAAVZGTqDnPxArCmQiVifmplsECyCztn2kSFzSe2k/iuSI3SSOInK
	ntdAs5WQhC/nxF4pT7ivtD6UKHY2
X-Google-Smtp-Source: APXvYqxqGsdAvmExzHzM1AlMEDyvF2TciO1m9gi7U8e47BczCll1PHpE9uh7WsVzrp8ZuWUaiRSQRA==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr91973wmf.85.1553781870803;
	Thu, 28 Mar 2019 07:04:30 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a10sm33951881wrs.19.2019.03.28.07.04.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 07:04:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 15:04:23 +0100
Message-Id: <20190328140423.522-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] llvm: fix more places where '8.0' version of llvm was hardcoded
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
X-List-Received-Date: Thu, 28 Mar 2019 14:04:30 -0000

So that it says '8.0.0' to reflect the recent PV change.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/meson.bbclass                     |  2 +-
 ...2-llvm-allow-env-override-of-exe-path.patch | 18 +++++++++---------
 meta/recipes-graphics/mesa/mesa.inc            |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index aaf873cad2d..115d1aedcb1 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -89,7 +89,7 @@ ld = ${@meson_array('LD', d)}
 strip = ${@meson_array('STRIP', d)}
 readelf = ${@meson_array('READELF', d)}
 pkgconfig = 'pkg-config'
-llvm-config = 'llvm-config8.0'
+llvm-config = 'llvm-config8.0.0'
 
 [properties]
 needs_exe_wrapper = true
diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
index 2970b0827bd..1369bcf78c7 100644
--- a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
@@ -51,7 +51,7 @@ index bec89fef98c..91b4d6e4c43 100644
      ActiveObjRoot = LLVM_OBJ_ROOT;
    } else if (sys::fs::equivalent(CurrentExecPrefix,
 -                                 Twine(LLVM_OBJ_ROOT) + "/bin")) {
-+                                 Twine(LLVM_OBJ_ROOT) + "/bin/llvm8.0")) {
++                                 Twine(LLVM_OBJ_ROOT) + "/bin/llvm8.0.0")) {
      IsInDevelopmentTree = true;
      DevelopmentTreeLayout = CMakeBuildModeStyle;
      ActiveObjRoot = LLVM_OBJ_ROOT;
@@ -63,12 +63,12 @@ index bec89fef98c..91b4d6e4c43 100644
 +  // llvm-config from within a target sysroot.
 +  std::string Multilibdir = std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME");
 +  if (Multilibdir.empty()) {
-+    Multilibdir = "/lib/llvm8.0" LLVM_LIBDIR_SUFFIX;
++    Multilibdir = "/lib/llvm8.0.0" LLVM_LIBDIR_SUFFIX;
 +  }
 +
    if (IsInDevelopmentTree) {
 -    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
-+    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include/llvm8.0";
++    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include/llvm8.0.0";
      ActivePrefix = CurrentExecPrefix;
  
      // CMake organizes the products differently than a normal prefix style
@@ -78,17 +78,17 @@ index bec89fef98c..91b4d6e4c43 100644
      case CMakeStyle:
 -      ActiveBinDir = ActiveObjRoot + "/bin";
 -      ActiveLibDir = ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX;
-+      ActiveBinDir = ActiveObjRoot + "/bin/llvm8.0";
-+      ActiveLibDir = ActiveObjRoot + "/lib/llvm8.0" + LLVM_LIBDIR_SUFFIX;
++      ActiveBinDir = ActiveObjRoot + "/bin/llvm8.0.0";
++      ActiveLibDir = ActiveObjRoot + "/lib/llvm8.0.0" + LLVM_LIBDIR_SUFFIX;
        ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
        break;
      case CMakeBuildModeStyle:
        ActivePrefix = ActiveObjRoot;
 -      ActiveBinDir = ActiveObjRoot + "/bin/" + build_mode;
-+      ActiveBinDir = ActiveObjRoot + "/bin/llvm8.0/" + build_mode;
++      ActiveBinDir = ActiveObjRoot + "/bin/llvm8.0.0/" + build_mode;
        ActiveLibDir =
 -          ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
-+          ActiveObjRoot + "/lib/llvm8.0" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
++          ActiveObjRoot + "/lib/llvm8.0.0" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
        ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
        break;
      }
@@ -96,11 +96,11 @@ index bec89fef98c..91b4d6e4c43 100644
      // We need to include files from both the source and object trees.
      ActiveIncludeOption =
 -        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include");
-+        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include/llvm8.0");
++        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include/llvm8.0.0");
    } else {
      ActivePrefix = CurrentExecPrefix;
 -    ActiveIncludeDir = ActivePrefix + "/include";
-+    ActiveIncludeDir = ActivePrefix + "/include/llvm8.0";
++    ActiveIncludeDir = ActivePrefix + "/include/llvm8.0.0";
      SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
      sys::fs::make_absolute(ActivePrefix, path);
      ActiveBinDir = path.str();
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 54818d7e0d2..ece74974b51 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -106,7 +106,7 @@ GALLIUMDRIVERS_append = ",virgl"
 
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium] = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
-MESA_LLVM_RELEASE ?= "8.0"
+MESA_LLVM_RELEASE ?= "8.0.0"
 PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
-- 
2.17.1


