Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D2AC369A5
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.42759.1744018855843273647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LJ7LMy3G;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf680d351so29767235e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018854; x=1744623654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RcI2qUZLvVkiX7/IDMl76SwCTKAAxO9M/qURvhyRaM=;
        b=LJ7LMy3GCP/Lrh3SYs+JnH1+7hPT1ZuuvPbExyc5ZHiaoU6MtEE8iqhuUFSs8TNTmO
         FwIGTZ9q2d6PhgEhTbWThF2m2mkWMFKEsMcwi+gEQ2OWjx/w5JdGffaaQXejq8NHm/M5
         P2fYqXhSAIb2cm3/m0yRwOEMkF7lp/mfloLzMNL89DXfHo1qcPzWRz9Tui0BNz7a/vW5
         ZI9itDuhYLI8NeT37pCvomL0GG7n12akb8tnh53bG4JvVdVS0/nOeZuqGTNIy4dMKhLT
         +Ty7aTEef38MtOMQik7Vl79soGqXdFPB0AN0yKMf0qFogVbCxvZ0wWxwNC1UzYefKBqr
         HUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018854; x=1744623654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RcI2qUZLvVkiX7/IDMl76SwCTKAAxO9M/qURvhyRaM=;
        b=A61FN3FZQKwB0VAwZfoAC9TQP7IuA1DxXP1CllumCrqt6EsjgrqmXifpLy/8Bys9vW
         fLZYTYzxnsLgpydkrdm6aI2AzRP/xrYMmQGezBty81waARXW8UX6BWtH8O71KfoTcpth
         gqAaksKfCLfl7zksMh/A2BBDzBJS5QN2z0K0SfmfspEs4MancY4C507+1dFyTqOlSELg
         qeCCVNM8nZge5QM3BLgZt07nsiCjgp33eeWiPM/Q1Wwj8aQEuZy04noIL1QFfBMpgvvp
         iq/r4iAS9JKERInx1d5kOsn73Np7SY524yUgrmf/hTcYfs8Mn9KhCPghsBe5qVse9T/z
         5ntQ==
X-Gm-Message-State: AOJu0YyCoOvuudiW6/AnmAHmoGHmv9EYHQWFolV/rAVC1Yqp91Tkgyk4
	0B8z0MpXR966A4QQZrK7VZzgM2hWzqQIkqGEnkXmZyRYef3aw1cpxa+I+A==
X-Gm-Gg: ASbGncvyH3ht1wvEC2S2Wlf6acjRmMsuYw25lktbBgPcf0wQbNWZfoeMV5XEbLJK4Or
	svofMy0SEgGf0f4qRweAFpQ5Rh7qNkCvL725sAOCMGs8I+umpVdzDXfP4RYtgpJdmOVvvz8Evyu
	4Df06+35hob0sFS6lXObnOj4V7ANgUgcKsxOrXirzwCEj7hB0s/8MXaDlYMeNaIZkZRe8caotGL
	zYgj6PS8QeXM4ETwGS+fiEYGN7KV4ix+Ba42DiUwO9FUEOMhRLxcrTq4QcoDv8PHez8HyR2EqF0
	Q2LSnDwxY9KxopH+D8z/yO69gHpqeScIVTZSbZkdwhog0zY5SV9q21AVcSI248iR6parwlzJfMk
	UgHUMsQ==
X-Google-Smtp-Source: AGHT+IFBdHYjCqREbz4AGOE88Hhhtbv3P2Sz3kPu6iv7rXZ0YpeT6qeyu/pWuDT1X2qEJieEmdcYxA==
X-Received: by 2002:a05:600c:19ce:b0:43b:ca8c:fca3 with SMTP id 5b1f17b1804b1-43eceec3b21mr101890795e9.11.1744018853824;
        Mon, 07 Apr 2025 02:40:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/18] vulkan-samples: rewrite and submit reproducubility patch upstream
Date: Mon,  7 Apr 2025 11:40:34 +0200
Message-Id: <20250407094045.753021-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214416

From: Alexander Kanavin <alex@linutronix.de>

At some point the problematic define ceased to be used anywhere,
and so we can simply patch it out (and remove the associated
option setting from the recipe).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-framework-Include-stdint.h.patch     |  2 +-
 ...an-samples-Fix-reproducibility-issue.patch | 43 -------------------
 ...bal_options.cmake-removed-unused-ROO.patch | 30 +++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  8 +---
 4 files changed, 32 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0003-bldsys-cmake-global_options.cmake-removed-unused-ROO.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch
index 8d323f2cef8..b30b0e0017f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch
@@ -1,4 +1,4 @@
-From 445fcfd7b9245881d769880a5942ce9faa893045 Mon Sep 17 00:00:00 2001
+From 9a187d2f54d3683636b951a10c165d949b3a1d18 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 23 Mar 2025 20:09:35 -0700
 Subject: [PATCH] framework: Include stdint.h
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
deleted file mode 100644
index c16e05112f9..00000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d998c753254649c7cf7c64e3fed78e41c11ad7ed Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 23 Aug 2023 09:38:37 +0200
-Subject: [PATCH] vulkan-samples: Fix reproducibility issue
-
-There is code to remove the prefix CMAKE_SOURCE_DIR from __FILENAME__ paths
-used for logging with LOGE() in the code. We need to make this match the value we use
-in the debug source remapping from CFLAGS
-
-We export the right path to use in the recipe with:
-
-EXTRA_OECMAKE = "-DCMAKE_DEBUG_SRCDIR=${TARGET_DBGSRC_DIR}/"
-
-and we then patch this into the code instead of the broken use
-of CMAKE_SOURCE_DIR since __FILENAME__ will match our path prefix
-changes.
-
-This also breaks reproducibility since the path length of the build directory
-will currently change the output!
-
-Upstream-Status: Pending [needs to be discussed upstream]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Signed-off-by: Julien Stephan <jstephan@baylibre.com>
----
- bldsys/cmake/global_options.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bldsys/cmake/global_options.cmake b/bldsys/cmake/global_options.cmake
-index b15c2da..d8952e5 100644
---- a/bldsys/cmake/global_options.cmake
-+++ b/bldsys/cmake/global_options.cmake
-@@ -62,7 +62,7 @@ set(CMAKE_CXX_STANDARD 14)
- set(CMAKE_DISABLE_SOURCE_CHANGES ON)
- set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
- 
--string(LENGTH "${CMAKE_SOURCE_DIR}/" ROOT_PATH_SIZE)
-+string(LENGTH "${CMAKE_DEBUG_SRCDIR}/" ROOT_PATH_SIZE)
- add_definitions(-DROOT_PATH_SIZE=${ROOT_PATH_SIZE})
- 
- set(CMAKE_C_FLAGS_DEBUG   "-DDEBUG=0 ${CMAKE_C_FLAGS_DEBUG}")
---
-2.41.0
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0003-bldsys-cmake-global_options.cmake-removed-unused-ROO.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0003-bldsys-cmake-global_options.cmake-removed-unused-ROO.patch
new file mode 100644
index 00000000000..ffac2d78ce6
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0003-bldsys-cmake-global_options.cmake-removed-unused-ROO.patch
@@ -0,0 +1,30 @@
+From da4ef211810bc3b0c51ea89f02c031a170fe0cb8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 1 Apr 2025 18:53:34 +0200
+Subject: [PATCH] bldsys/cmake/global_options.cmake: removed unused
+ ROOT_PATH_SIZE define
+
+After various refactorings it is no longer used anywhere (and
+is problematic for build reproducibility, as build path sizes can
+differ between build hosts).
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/1325]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ bldsys/cmake/global_options.cmake | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/bldsys/cmake/global_options.cmake b/bldsys/cmake/global_options.cmake
+index 96c7add..67a6c5e 100644
+--- a/bldsys/cmake/global_options.cmake
++++ b/bldsys/cmake/global_options.cmake
+@@ -126,9 +126,6 @@ set(CMAKE_CXX_STANDARD 17)
+ set(CMAKE_DISABLE_SOURCE_CHANGES ON)
+ set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
+ 
+-string(LENGTH "${CMAKE_SOURCE_DIR}/" ROOT_PATH_SIZE)
+-add_definitions(-DROOT_PATH_SIZE=${ROOT_PATH_SIZE})
+-
+ set(CMAKE_C_FLAGS_DEBUG   "-DDEBUG=0 ${CMAKE_C_FLAGS_DEBUG}")
+ set(CMAKE_CXX_FLAGS_DEBUG "-DDEBUG=0 ${CMAKE_CXX_FLAGS_DEBUG}")
+ 
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 75174f6a91f..554e6eb2902 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -6,9 +6,9 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
-           file://0001-vulkan-samples-Fix-reproducibility-issue.patch \
            file://0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch;patchdir=third_party/glslang \
            file://0001-framework-Include-stdint.h.patch \
+           file://0003-bldsys-cmake-global_options.cmake-removed-unused-ROO.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
@@ -25,12 +25,6 @@ inherit cmake features_check
 
 FILES:${PN} += "${datadir}"
 
-#
-# There is code to remove the prefix CMAKE_SOURCE_DIR from __FILENAME__ paths
-# used for logging with LOGE in the code. We need to make this match the value we use
-# in the debug source remapping from CFLAGS
-#
-EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=${TARGET_DBGSRC_DIR}/"
 # Binaries built with PCH enabled don't appear reproducible, differing results were seen
 # from some builds depending on the point the PCH was compiled. Disable it to be
 # deterministic
-- 
2.39.5


