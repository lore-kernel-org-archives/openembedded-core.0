Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FDEC41535
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:12 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.4286.1667832922748436115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vk+Xgw7f;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id g12so16560138wrs.10
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN7RMZMWPXr1kTCJf6HbegR/3+fjxuiOOJBZn30DLFI=;
        b=Vk+Xgw7feyHZRvjWQ4m3E6JESa9bWsPsNQElZ4RS35FdEhgQQ2Wgr72F3bpJjdqUue
         TqxsA3XVnEIVmYNreq5spfC2GPnouudp9hJd0dWAJWCZVrRo3JKWETldNvEPpVa1jtMn
         EV5mTayv2R5UUsBp6R8vB1gE5/g7+5EWeOf4WMwIWGIKH3SpJIPBPj4++09yJ+JO0X6n
         uYE7kQImKdv/XKFo108kr0J/pt+qPlNcSBj7L21hRZhg2yKX3HG4fv9cuiVtGVkDea6M
         zU7dwM0Qr7Ul+l8SJwDg0ZpuBmvG5/buRnHBSLVYLNrBSRoNeE3Y1gieFQavQ2i8JpIR
         vd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VN7RMZMWPXr1kTCJf6HbegR/3+fjxuiOOJBZn30DLFI=;
        b=Me+DiORKCezZWofcqsguMte8TUU18OuAE3RmBt5afFwyAY1iPySMCYhszSZRBoEtsS
         GTyrg2ldWL380U2ZQPLkdu6CyWceCh6y9QwgwyKMlDIT9DApPU6tphPFcyLKXGwiNDyP
         3rPsxD6sNkR2+5ST+i034H8E+UlDJC3PtBnSQXKMmZwhH7gPkSYeBlX85k7rtmL1Za4x
         KaBArhAG9SooQ6vz8UFjcZ9PZVYkK4fk5gEklBpmnUsEc3uJcSHTcCxm1RoO6iSUIPer
         oLerWIOGWLOhucbLP18lfdtoGWYEHmhP5lC+Og9ZPOGNXcypksTU2GzqydqwBE434Td+
         yhUw==
X-Gm-Message-State: ACrzQf3Fxn7k5BCSvW53FrJilqqruotb7V68U6EUkm3gJQhQXzNJI8pW
	FPzPzQHnQ8oRIOKN03fsKssRWDPTUdE=
X-Google-Smtp-Source: AMsMyM7pOuGa5B9vy8WApE/zR27ZQVHuX3V48qwxA+vciTciclMWuARQaXeBIueMb0iXKkPK/13Vnw==
X-Received: by 2002:a5d:6c6f:0:b0:236:d270:7bd2 with SMTP id r15-20020a5d6c6f000000b00236d2707bd2mr25590597wrz.366.1667832962504;
        Mon, 07 Nov 2022 06:56:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:56:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 43/48] shaderc: upgrade 2022.2 -> 2022.3
Date: Mon,  7 Nov 2022 15:55:03 +0100
Message-Id: <20221107145508.1051404-43-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172893

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rop-OSDependent-OGLCompiler-from-lis.patch | 76 +++++++++++++++++++
 .../{shaderc_2022.2.bb => shaderc_2022.3.bb}  |  3 +-
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/shaderc/files/0001-CMakeLists.txt-drop-OSDependent-OGLCompiler-from-lis.patch
 rename meta/recipes-graphics/shaderc/{shaderc_2022.2.bb => shaderc_2022.3.bb} (88%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-CMakeLists.txt-drop-OSDependent-OGLCompiler-from-lis.patch b/meta/recipes-graphics/shaderc/files/0001-CMakeLists.txt-drop-OSDependent-OGLCompiler-from-lis.patch
new file mode 100644
index 0000000000..ecaa2ddb30
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0001-CMakeLists.txt-drop-OSDependent-OGLCompiler-from-lis.patch
@@ -0,0 +1,76 @@
+From 7f6c60f928dabd8b15aa948886523ddf15709215 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 2 Nov 2022 15:42:58 +0100
+Subject: [PATCH] CMakeLists.txt: drop OSDependent/OGLCompiler from lists of
+ glslang libraries
+
+glslang no longer installs them separately, and all needed
+functionality has been merged into glslang shared library itself:
+
+This wasn't a problem previously as they were still provided,
+as static libraries but in latest glslang they no longer are:
+https://github.com/KhronosGroup/glslang/commit/7cd519511c32d7e86d901c7ed231cb84c652d18d
+
+Upstream-Status: Submitted [https://github.com/google/shaderc/pull/1276]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ glslc/CMakeLists.txt           | 2 +-
+ libshaderc/CMakeLists.txt      | 2 +-
+ libshaderc/README.md           | 4 ++--
+ libshaderc_util/CMakeLists.txt | 2 +-
+ 4 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
+index 31664d1..5093bd9 100644
+--- a/glslc/CMakeLists.txt
++++ b/glslc/CMakeLists.txt
+@@ -43,7 +43,7 @@ if (SHADERC_ENABLE_WGSL_OUTPUT)
+ endif(SHADERC_ENABLE_WGSL_OUTPUT)
+ 
+ target_link_libraries(glslc PRIVATE
+-  glslang OSDependent OGLCompiler HLSL glslang SPIRV    # Glslang libraries
++  glslang HLSL glslang SPIRV    # Glslang libraries
+   $<$<BOOL:${SHADERC_ENABLE_WGSL_OUTPUT}>:libtint>      # Tint libraries, optional
+   shaderc_util shaderc                                  # internal Shaderc libraries
+   ${CMAKE_THREAD_LIBS_INIT})
+diff --git a/libshaderc/CMakeLists.txt b/libshaderc/CMakeLists.txt
+index 3ada419..d3542bf 100644
+--- a/libshaderc/CMakeLists.txt
++++ b/libshaderc/CMakeLists.txt
+@@ -62,7 +62,7 @@ endif(SHADERC_ENABLE_INSTALL)
+ 
+ find_package(Threads)
+ set(SHADERC_LIBS
+-  glslang OSDependent OGLCompiler glslang ${CMAKE_THREAD_LIBS_INIT}
++  glslang glslang ${CMAKE_THREAD_LIBS_INIT}
+   shaderc_util
+   SPIRV # from glslang
+   SPIRV-Tools
+diff --git a/libshaderc/README.md b/libshaderc/README.md
+index bf9d317..1071769 100644
+--- a/libshaderc/README.md
++++ b/libshaderc/README.md
+@@ -7,8 +7,8 @@ A library for compiling shader strings into SPIR-V.
+ There are two main shaderc libraries that are created during a CMake
+ compilation. The first is `libshaderc`, which is a static library
+ containing just the functionality exposed by libshaderc. It depends
+-on other compilation targets `glslang`, `OSDependent`, `OGLCompiler`,
+-`shaderc_util`, `SPIRV`, `HLSL`, `SPIRV-Tools`, and `SPIRV-Tools-opt`.
++on other compilation targets `glslang`, `shaderc_util`, `SPIRV`,
++`HLSL`, `SPIRV-Tools`, and `SPIRV-Tools-opt`.
+ 
+ The other is `libshaderc_combined`, which is a static library containing
+ libshaderc and all of its dependencies.
+diff --git a/libshaderc_util/CMakeLists.txt b/libshaderc_util/CMakeLists.txt
+index 99ce3c4..5291175 100644
+--- a/libshaderc_util/CMakeLists.txt
++++ b/libshaderc_util/CMakeLists.txt
+@@ -46,7 +46,7 @@ add_definitions(-DENABLE_HLSL)
+ 
+ find_package(Threads)
+ target_link_libraries(shaderc_util PRIVATE
+-  glslang OSDependent OGLCompiler HLSL glslang SPIRV
++  glslang HLSL glslang SPIRV
+   SPIRV-Tools-opt ${CMAKE_THREAD_LIBS_INIT})
+ 
+ shaderc_add_tests(
diff --git a/meta/recipes-graphics/shaderc/shaderc_2022.2.bb b/meta/recipes-graphics/shaderc/shaderc_2022.3.bb
similarity index 88%
rename from meta/recipes-graphics/shaderc/shaderc_2022.2.bb
rename to meta/recipes-graphics/shaderc/shaderc_2022.3.bb
index df0fe8e6c8..c340646fa7 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2022.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2022.3.bb
@@ -6,10 +6,11 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "3f1635df7774a90f691773e0093bc6ad8005de5a"
+SRCREV = "4bbb646ddb3279c6a27e7aa0eb86c10c8add987b"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
+           file://0001-CMakeLists.txt-drop-OSDependent-OGLCompiler-from-lis.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.30.2


