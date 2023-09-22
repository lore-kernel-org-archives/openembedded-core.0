Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91218CD4943
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:41 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.15996.1695367479361111831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tuj4haOE;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53136a13cd4so2110544a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367478; x=1695972278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIQ6ElJq3MTuySJp8CNkB//Pu9g+uNwdESX2TekqnL4=;
        b=Tuj4haOEWiztQ84+Sbdgsf00e0oICFVM0/KWFbiUv9/RhZi6EUdhfqX7Cg14U4Gw0u
         B6BwgG2WWSomE4m/QLVfb+LnJ7UnG2VifU9mzwzwI7bOsUzydGmaFT4oMV3B/fPypJpz
         ZwBfjAcb3/wjmZhE5i4fpOxE099h2S/GMoQ98ObTaqFYTClSHeLVqhY8JCHaTSZvRgEn
         HCk07sqigqMdHrg6bqHVk8e1FQrNAe7hU62SPgp9RhK+tiWrU0rNtWdPl8egtpo6htqO
         PBKV3ke+uxkZrscZUGkbUpM6URxdAoZcO2b8aVo1o1Xttu4MvRNxQo3PtIkdwzL4CIqs
         xPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367478; x=1695972278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIQ6ElJq3MTuySJp8CNkB//Pu9g+uNwdESX2TekqnL4=;
        b=q/TV4xCBma79mn8IWHK8Pa79vtHmM2VSgrcVF6MbhMhmNdeD8KoNzRzkg2O+UDrYvH
         DIB7WZu8NVKnOugo/W1bu//wjUcVZCCk4hBWqDnbCddsi+IFR0pVgZ03llI697b4JEcJ
         ifu31+/ZUIEFszg43JgToCpmrvt0X34EXFAWqMg5D0/FWniGG72CvKRWV8vCMEcAcbzW
         9WmTjlM4nU/VlPFGBZT4e7QCWfZR3wJ1t71KwqxQsvGVXPIRlmUgb/98NIZH04Sr+jt1
         7TkHxPzW49oCBWGLB5ICBX0jxFeMoc1ypX+VXkS/YsO2Cfa3ahleRsVFGn/asi3fo6MY
         U6ig==
X-Gm-Message-State: AOJu0Yw+pKddQQ1BW/fJlSRWheV9hRNb2eg2DGrWzfkpq2jNNWCg1hpl
	UlatLqXMxk6nbVDBFrBKV+JG3SXkcQQ=
X-Google-Smtp-Source: AGHT+IFX7KSm9EFV0RJxt6bFRfy2tk07p+dLT38LAAmm40z0UpwosicG9i9P3duonQBi3o8sdJb5Kw==
X-Received: by 2002:a17:907:770f:b0:99c:e38d:e484 with SMTP id kw15-20020a170907770f00b0099ce38de484mr6454615ejc.6.1695367477738;
        Fri, 22 Sep 2023 00:24:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/40] vulkan: upgrade 1.3.250.0 -> 1.3.261.1
Date: Fri, 22 Sep 2023 09:23:57 +0200
Message-Id: <20230922072431.1481743-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188050

License-update: clarifiction that licenses are apache and mit.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...lang_1.3.250.0.bb => glslang_1.3.261.1.bb} |  2 +-
 ....3.250.0.bb => spirv-headers_1.3.261.1.bb} |  2 +-
 ..._1.3.250.0.bb => spirv-tools_1.3.261.1.bb} |  2 +-
 ...3.250.0.bb => vulkan-headers_1.3.261.1.bb} |  6 ++--
 ....3.250.0.bb => vulkan-loader_1.3.261.1.bb} |  4 +--
 ...ts.txt-do-not-make-special-arrangeme.patch | 29 -------------------
 ...1.3.250.0.bb => vulkan-tools_1.3.261.1.bb} |  6 ++--
 ...ts.txt-append-to-CMAKE_FIND_ROOT_PAT.patch | 28 ------------------
 ... => vulkan-validation-layers_1.3.261.1.bb} | 10 +++----
 9 files changed, 14 insertions(+), 75 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.250.0.bb => glslang_1.3.261.1.bb} (96%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.250.0.bb => spirv-headers_1.3.261.1.bb} (92%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.250.0.bb => spirv-tools_1.3.261.1.bb} (96%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.250.0.bb => vulkan-headers_1.3.261.1.bb} (86%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.250.0.bb => vulkan-loader_1.3.261.1.bb} (95%)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.250.0.bb => vulkan-tools_1.3.261.1.bb} (89%)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-validation-layers/0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.250.0.bb => vulkan-validation-layers_1.3.261.1.bb} (85%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
index 6e9c666d46d..e607045148c 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "d1517d64cfca91f573af1bf7341dc3a5113349c0"
+SRCREV = "76b52ebf77833908dc4c0dd6c70a9c357ac720bd"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb
index d0a2e2e9916..945f0879f52 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "268a061764ee69f09a477a695bf6a11ffe311b8d"
+SRCREV = "124a9665e464ef98b8b718d572d5f329311061eb"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.261.1.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.261.1.bb
index bde6ddd04b8..6904288299c 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.261.1.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "e7c6084fd1d6d6f5ac393e842728d8be309688ca"
+SRCREV = "e553b884c7c9febaa4e52334f683641fb5f196a0"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb
similarity index 86%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb
index 2970767ff32..01eb14b9fb0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb
@@ -7,11 +7,11 @@ HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Headers"
 SECTION = "libs"
 
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LICENSE = "Apache-2.0 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "9e61870ecbd32514113b467e0a0c46f60ed222c7"
+SRCREV = "85c2334e92e215cce34e8e0ed8b2dce4700f4a50"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb
index 456c9734068..01cbeafa3ee 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.250;protocol=https"
-SRCREV = "f372068d09fc13bcf54b8c81274f37aa5f46aea3"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https"
+SRCREV = "afdd025ead2b63b2c73d900ab128a2d3b512cdf0"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch b/meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch
deleted file mode 100644
index 6b70a1e62d8..00000000000
--- a/meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9060e916ca05d34b56c62f2be0b4a77dd104e2aa Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 2 Jun 2023 14:13:00 +0200
-Subject: [PATCH] scripts/CMakeLists.txt: append to CMAKE_FIND_ROOT_PATH
- instead of replacing it
-
-Resetting CMAKE_FIND_ROOT_PATH in particular breaks builds in Yocto
-(which is a major cross compiling framework).
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Tools/pull/808]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- scripts/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt
-index 5b979d43..19a58bf9 100644
---- a/scripts/CMakeLists.txt
-+++ b/scripts/CMakeLists.txt
-@@ -114,7 +114,7 @@ if (MOLTENVK_REPO_ROOT)
- endif()
- 
- if (CMAKE_CROSSCOMPILING)
--    set(CMAKE_FIND_ROOT_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
-+    set(CMAKE_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH} ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
- else()
-     set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
- endif()
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb
similarity index 89%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb
index 0346b380ee7..7a7edc9ebdf 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb
@@ -6,10 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https \
-           file://0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch \
-           "
-SRCREV = "695887a994ef9cc00a7aa3f9c00b31a56ea79534"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
+SRCREV = "a7da7027ca9fd0901639f02619c226da9c6036f1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers/0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch b/meta/recipes-graphics/vulkan/vulkan-validation-layers/0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch
deleted file mode 100644
index 4db686fe2fe..00000000000
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers/0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ea7b9e6fc0b3f45d6032ce624bed85bbde5ec0bf Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 21 Jun 2023 20:03:03 +0200
-Subject: [PATCH] scripts/CMakeLists.txt: append to CMAKE_FIND_ROOT_PATH
- instead of replacing it
-
-Resetting CMAKE_FIND_ROOT_PATH in particular breaks builds in Yocto
-(which is a major cross compiling framework).
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-ValidationLayers/commit/e1b11dc7856765cf45a283ac805ea5066c81cd9b]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- scripts/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt
-index 94c8528c8..cd86c54eb 100644
---- a/scripts/CMakeLists.txt
-+++ b/scripts/CMakeLists.txt
-@@ -124,7 +124,7 @@ if (MIMALLOC_INSTALL_DIR)
- endif()
- 
- if (CMAKE_CROSSCOMPILING)
--    set(CMAKE_FIND_ROOT_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
-+    set(CMAKE_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH} ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
- else()
-     set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
- endif()
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.261.1.bb
similarity index 85%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.261.1.bb
index 62c6343c45e..1e2a0acedbd 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.261.1.bb
@@ -5,13 +5,11 @@ HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-ValidationLayers"
 SECTION = "libs"
 
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8df9e8826734226d08cb412babfa599c"
+LICENSE = "Apache-2.0 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://git@github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.250;protocol=https \
-           file://0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch \
-           "
-SRCREV = "1541e00a63cd125f15d231d5a8059ebe66503b25"
+SRC_URI = "git://git@github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.261;protocol=https"
+SRCREV = "628cd310bef6d54b4e6b25b5ac2ed013473409d6"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


