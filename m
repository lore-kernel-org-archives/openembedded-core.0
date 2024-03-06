Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA0DC54E60
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:31 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.14882.1709739743854502242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J6teFm7Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a4532f84144so137522666b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739742; x=1710344542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4uqDdPpEdM2BsuMWA8hZV8nZbOzQdxK+s3dzZ+uTG4=;
        b=J6teFm7ZS97/R7eACfUsQe38cbgjHRwjejRZJKpVolTtup9alRQ9IEk1SzOY3+EhiV
         gsXhDA1Jfm3sX621WKHEutdZgWDQJjMWFi6i+4rAsmb2dBDRaIDnd9Y1M09YnPah4hJl
         PbDWyw7WVJSGNhd4QFEz4iNC98sw1TGktGJLcrApnNr+tzFc8RU7NG9oyHcLvWRDgxTx
         SuGltWgyKHpyRn0tLhOCXf2e43/0tdapOduQfIgyPDwo9TYgiIUZBGwnVFloAIgYJfoX
         d+JH0P1ULzqeE42853W+PDceYTm6LxV/c3Z4gqZl5AMdWH0i8+OxXL4jsUhjUWZAJfYb
         m8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739742; x=1710344542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4uqDdPpEdM2BsuMWA8hZV8nZbOzQdxK+s3dzZ+uTG4=;
        b=ZaAEJqtGpxnHzSsXdK0L7w+0vunY0zqB4JazX2ntMYl2PIYNpK6W4oJyrOgF9EVPGt
         KtCORvIKpZ0QakotB0t6zWUpmm9cwLw4ZOeEwkPKEChqORg+65/fXsQt9PcXntE5yWjv
         NopcJZljLvr8ytCQBHQH6xU2csXnW/ezpRpCnAwFywBuOl8ZGIoTjs8OwikdExHGgDNL
         CXQTOaGlD8SGhaFU3/zMskVegiVgK2AkTLMlPCIwoxKRNOaqIMEV1l5slIjNeQa18lIA
         Wg7NBzLx9da592NBMXk1RXisYcIQ5CUUQYQKHf7eoaQMcjMUd6zCMg06lE2ntMgOYHOy
         zX9A==
X-Gm-Message-State: AOJu0Yy/UO7WMaeD9PfSf+pdQITlOrgAb5N8Ik25xs79FgByRf8vLAox
	dKAZPHydqyuNWXDpFt7RjgxdlAQO+pIQfUV6hyGshijgNsFv0Ng244tJbLsm
X-Google-Smtp-Source: AGHT+IGpB4aBKyGHA3XjTHnaXGvLr7Y4ieaNX/TTFh8D1Ggi14NdBVMt5l64oheWAcUJwVQ1ejARcA==
X-Received: by 2002:a17:906:3606:b0:a45:6d18:a80d with SMTP id q6-20020a170906360600b00a456d18a80dmr5673806ejb.62.1709739742266;
        Wed, 06 Mar 2024 07:42:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/47] shaderc: update 2023.7 -> 2023.8
Date: Wed,  6 Mar 2024 16:41:44 +0100
Message-Id: <20240306154151.3741709-40-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196723

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rop-OSDependent-OGLCompiler-from-lis.patch | 76 -------------------
 ...sable-building-external-dependencies.patch | 13 ++--
 ...til-fix-glslang-header-file-location.patch |  5 +-
 .../{shaderc_2023.7.bb => shaderc_2023.8.bb}  |  3 +-
 4 files changed, 9 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-graphics/shaderc/files/0001-CMakeLists.txt-drop-OSDependent-OGLCompiler-from-lis.patch
 rename meta/recipes-graphics/shaderc/{shaderc_2023.7.bb => shaderc_2023.8.bb} (88%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-CMakeLists.txt-drop-OSDependent-OGLCompiler-from-lis.patch b/meta/recipes-graphics/shaderc/files/0001-CMakeLists.txt-drop-OSDependent-OGLCompiler-from-lis.patch
deleted file mode 100644
index ecaa2ddb30f..00000000000
--- a/meta/recipes-graphics/shaderc/files/0001-CMakeLists.txt-drop-OSDependent-OGLCompiler-from-lis.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 7f6c60f928dabd8b15aa948886523ddf15709215 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 2 Nov 2022 15:42:58 +0100
-Subject: [PATCH] CMakeLists.txt: drop OSDependent/OGLCompiler from lists of
- glslang libraries
-
-glslang no longer installs them separately, and all needed
-functionality has been merged into glslang shared library itself:
-
-This wasn't a problem previously as they were still provided,
-as static libraries but in latest glslang they no longer are:
-https://github.com/KhronosGroup/glslang/commit/7cd519511c32d7e86d901c7ed231cb84c652d18d
-
-Upstream-Status: Submitted [https://github.com/google/shaderc/pull/1276]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- glslc/CMakeLists.txt           | 2 +-
- libshaderc/CMakeLists.txt      | 2 +-
- libshaderc/README.md           | 4 ++--
- libshaderc_util/CMakeLists.txt | 2 +-
- 4 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
-index 31664d1..5093bd9 100644
---- a/glslc/CMakeLists.txt
-+++ b/glslc/CMakeLists.txt
-@@ -43,7 +43,7 @@ if (SHADERC_ENABLE_WGSL_OUTPUT)
- endif(SHADERC_ENABLE_WGSL_OUTPUT)
- 
- target_link_libraries(glslc PRIVATE
--  glslang OSDependent OGLCompiler HLSL glslang SPIRV    # Glslang libraries
-+  glslang HLSL glslang SPIRV    # Glslang libraries
-   $<$<BOOL:${SHADERC_ENABLE_WGSL_OUTPUT}>:libtint>      # Tint libraries, optional
-   shaderc_util shaderc                                  # internal Shaderc libraries
-   ${CMAKE_THREAD_LIBS_INIT})
-diff --git a/libshaderc/CMakeLists.txt b/libshaderc/CMakeLists.txt
-index 3ada419..d3542bf 100644
---- a/libshaderc/CMakeLists.txt
-+++ b/libshaderc/CMakeLists.txt
-@@ -62,7 +62,7 @@ endif(SHADERC_ENABLE_INSTALL)
- 
- find_package(Threads)
- set(SHADERC_LIBS
--  glslang OSDependent OGLCompiler glslang ${CMAKE_THREAD_LIBS_INIT}
-+  glslang glslang ${CMAKE_THREAD_LIBS_INIT}
-   shaderc_util
-   SPIRV # from glslang
-   SPIRV-Tools
-diff --git a/libshaderc/README.md b/libshaderc/README.md
-index bf9d317..1071769 100644
---- a/libshaderc/README.md
-+++ b/libshaderc/README.md
-@@ -7,8 +7,8 @@ A library for compiling shader strings into SPIR-V.
- There are two main shaderc libraries that are created during a CMake
- compilation. The first is `libshaderc`, which is a static library
- containing just the functionality exposed by libshaderc. It depends
--on other compilation targets `glslang`, `OSDependent`, `OGLCompiler`,
--`shaderc_util`, `SPIRV`, `HLSL`, `SPIRV-Tools`, and `SPIRV-Tools-opt`.
-+on other compilation targets `glslang`, `shaderc_util`, `SPIRV`,
-+`HLSL`, `SPIRV-Tools`, and `SPIRV-Tools-opt`.
- 
- The other is `libshaderc_combined`, which is a static library containing
- libshaderc and all of its dependencies.
-diff --git a/libshaderc_util/CMakeLists.txt b/libshaderc_util/CMakeLists.txt
-index 99ce3c4..5291175 100644
---- a/libshaderc_util/CMakeLists.txt
-+++ b/libshaderc_util/CMakeLists.txt
-@@ -46,7 +46,7 @@ add_definitions(-DENABLE_HLSL)
- 
- find_package(Threads)
- target_link_libraries(shaderc_util PRIVATE
--  glslang OSDependent OGLCompiler HLSL glslang SPIRV
-+  glslang HLSL glslang SPIRV
-   SPIRV-Tools-opt ${CMAKE_THREAD_LIBS_INIT})
- 
- shaderc_add_tests(
diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 35855bd8326..4212512034b 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From d3fbd6b9427f29606540528d17fe02930cd78d0c Mon Sep 17 00:00:00 2001
+From 792a46ef27ef879a21c9f01a198eae213ea535e6 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -9,17 +9,16 @@ Subject: [PATCH] cmake: disable building external dependencies
 Upstream-Status: Inappropriate [OE-core specific]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
 ---
  CMakeLists.txt                | 13 ++++++++++---
  utils/update_build_version.py | 22 +++++++++++++++-------
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 633c244..75b01da 100644
+index 7bc8f5d..13fc535 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -67,6 +67,7 @@ else()
+@@ -62,6 +62,7 @@ else()
  endif()
  
  option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
@@ -27,7 +26,7 @@ index 633c244..75b01da 100644
  
  set (CMAKE_CXX_STANDARD 17)
  
-@@ -129,8 +130,14 @@ endif(MSVC)
+@@ -123,8 +124,14 @@ endif(MSVC)
  
  
  # Configure subdirectories.
@@ -44,7 +43,7 @@ index 633c244..75b01da 100644
  
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
-@@ -142,7 +149,7 @@ endif()
+@@ -136,7 +143,7 @@ endif()
  add_custom_target(build-version
    ${PYTHON_EXECUTABLE}
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/update_build_version.py
@@ -54,7 +53,7 @@ index 633c244..75b01da 100644
  
  function(define_pkg_config_file NAME LIBS)
 diff --git a/utils/update_build_version.py b/utils/update_build_version.py
-index 5785390..f72b762 100755
+index 11ee53e..d39e59d 100755
 --- a/utils/update_build_version.py
 +++ b/utils/update_build_version.py
 @@ -30,6 +30,7 @@ import re
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 0e8ad7e4d2a..39f982b7f3d 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From d02ad48d5c9b48af70ddea2e6998081347ef82f3 Mon Sep 17 00:00:00 2001
+From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
@@ -6,13 +6,12 @@ Subject: [PATCH] libshaderc_util: fix glslang header file location
 Upstream-Status: Pending
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
 ---
  libshaderc_util/src/compiler.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index 051558b..9c4476c 100644
+index e5f5d10..5fd6d3c 100644
 --- a/libshaderc_util/src/compiler.cc
 +++ b/libshaderc_util/src/compiler.cc
 @@ -20,7 +20,7 @@
diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.7.bb b/meta/recipes-graphics/shaderc/shaderc_2023.8.bb
similarity index 88%
rename from meta/recipes-graphics/shaderc/shaderc_2023.7.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.8.bb
index cf2ced98f09..bc7afbdf5e6 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.7.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.8.bb
@@ -6,11 +6,10 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "3882b16417077aa8eaa7b5775920e7ba4b8a224d"
+SRCREV = "f8a25c591bf5edbb462ca4aea99dcc666f096d13"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-           file://0001-CMakeLists.txt-drop-OSDependent-OGLCompiler-from-lis.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.39.2


