Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.233.1610580138575626665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 15:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SB7DuXAh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id a6so3038877wmc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 15:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vzi3F4xLnqnSvlgmggSy6UVW02xeK+LuFMt+7/z9jtc=;
        b=SB7DuXAh2fvy3xBQXy8jBEdzhub4lY2MHNICzk0tSUvWUQtpHoIwhmi5n22nCMGD1I
         +w5FKKMKQBL6/7nvZqWvgP2PyV/ykjd8FjUczUWkjA1xyrBKWIddMK2zAGauSGAj874i
         o8Jl4sNRuMKJFYNuX0cMSQ4d1hS0GQBFMhsRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vzi3F4xLnqnSvlgmggSy6UVW02xeK+LuFMt+7/z9jtc=;
        b=RJ975FOPCxqnJNxNIdUiZeuwSez9L2TNm/KiWOJoIZJbHc5PsKY+VxadA/bVWbiUbQ
         FhZq3liAdYEVNmS24mmG7t0zxL2lO1bfMGP6BVZREC+073OxxzL8S2++mAUhIuKjMLcK
         qD/IgqtwcSICLt5KkRo33ZFekkfV1DbUke5hC+dxUN+16QHJUp9lC2GI6Ulrcp2w4LFI
         tagyFwf0JR26/77NUR/YvL9BrXCULOPFj+6J0nvnM6uekf3jq0sZo3u7uDV2LZ/vsOIM
         mu+iajBXUHGMRk2JiOg1xD1HxwH1gbj37QXU7bQgKinxgB8uQ5SUk1feW0aX3c9lViPq
         ligQ==
X-Gm-Message-State: AOAM531fN8VE5nbNdT0WiS7I7OdT/9tq3CUiP854pnzO6FbyZJnvvGGy
	MbxUjMpqqE5mVkt9ZENmCZBFgZMJP5Wx7w==
X-Google-Smtp-Source: ABdhPJwBPE6YUuFfGloB/KEj7NWOfgKAstTDqLSEtaIcPiwjYwX9XDSagoD/9RKjjVWBF7WoXA45VQ==
X-Received: by 2002:a7b:ce0f:: with SMTP id m15mr1285901wmc.56.1610580136687;
        Wed, 13 Jan 2021 15:22:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b0e3:c052:eb93:5c3])
        by smtp.gmail.com with ESMTPSA id a12sm6360902wrh.71.2021.01.13.15.22.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 15:22:16 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vulkan-samples: Fix reproducibility issue
Date: Wed, 13 Jan 2021 23:22:15 +0000
Message-Id: <20210113232215.799303-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is code to remove the prefix CMAKE_SOURCE_DIR from __FILENAME__ paths
used for logging with LOGE() in the code. We need to make this match the value we use
in the debug source remapping from CFLAGS. If we don't, the code is firstly removing
the incorrect prefix and possibly moving outside the string, secondly, it causes a
reproducibility issue depending on the length of path the build happens in.

Add a small patch and configuration to avoid the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../vulkan/vulkan-samples/debugfix.patch      | 31 +++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  8 +++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/debugfix.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/debugfix.patch b/meta/recipes-graphics/vulkan/vulkan-samples/debugfix.patch
new file mode 100644
index 00000000000..d723fcc19ad
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/debugfix.patch
@@ -0,0 +1,31 @@
+There is code to remove the prefix CMAKE_SOURCE_DIR from __FILENAME__ paths
+used for logging with LOGE() in the code. We need to make this match the value we use
+in the debug source remapping from CFLAGS
+
+We export the right path to use in the recipe with:
+
+EXTRA_OECMAKE = "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/"
+
+and we then patch this into the code instead of the broken use
+of CMAKE_SOURCE_DIR since __FILENAME__ will match our path prefix
+changes.
+
+This also breaks reproducibility since the path length of the build directory
+will currently change the output!
+
+Upstream-Status: Pending [needs to be discussed upstream]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/bldsys/cmake/global_options.cmake
+===================================================================
+--- git.orig/bldsys/cmake/global_options.cmake
++++ git/bldsys/cmake/global_options.cmake
+@@ -47,7 +47,7 @@ set(CMAKE_CXX_STANDARD 14)
+ set(CMAKE_DISABLE_SOURCE_CHANGES ON)
+ set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
+ 
+-string(LENGTH "${CMAKE_SOURCE_DIR}/" ROOT_PATH_SIZE)
++string(LENGTH "${CMAKE_DEBUG_SRCDIR}/" ROOT_PATH_SIZE)
+ add_definitions(-DROOT_PATH_SIZE=${ROOT_PATH_SIZE})
+ 
+ set(CMAKE_C_FLAGS_DEBUG   "-DDEBUG=0 ${CMAKE_C_FLAGS_DEBUG}")
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 896b2483272..447d498fb34 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://0001-support-link-against-libatomic-if-no-built-in-atomic.patch \
+           file://debugfix.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
@@ -19,3 +20,10 @@ REQUIRED_DISTRO_FEATURES = 'vulkan'
 inherit cmake features_check
 
 FILES_${PN} += "${datadir}"
+
+#
+# There is code to remove the prefix CMAKE_SOURCE_DIR from __FILENAME__ paths
+# used for logging with LOGE in the code. We need to make this match the value we use
+# in the debug source remapping from CFLAGS
+#
+EXTRA_OECMAKE = "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/"
\ No newline at end of file
-- 
2.27.0

