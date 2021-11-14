Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9565AC433EF
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 16:52:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.11235.1636908758271350973
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 08:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EEGRjLah;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id v19so1748680plo.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 08:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5xD9aCREs53BPRCmFQNaqPiq4Y5yrUOehHq2nKLX3LA=;
        b=EEGRjLahwq1Rk2+vMJ2FPdtKb+De9Nf0IAHKQk342amvAFbNfpZY1MZSoQuKb/mSbM
         8hFoW9NQKN5LrYxe72CmAew3djCoyIzgzOnKWm4I68XIVvr+1khcis0rDJH1rRE0ciBW
         2Y+tnK4kGiUpRtIKJ1UMjh/QAYn4885jF8c6GfwSAhSGBklBG9IyK9S37Pg1KJa58I9i
         nsxbL61A+zqUlNBGfjVpsKHpP04fOy1cQRCI8LDFhaLKPTbKB/uOQHFEp0DR4LSHesRm
         5O4xCfpUxyuul5S1bEJ6laHYYrELzZwyiQDWwOT1Umk/+/y2UUHKHBtZZb6vSHvSDg2K
         nCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5xD9aCREs53BPRCmFQNaqPiq4Y5yrUOehHq2nKLX3LA=;
        b=sTXuR9GEJUV1WbS47iLUcjZY9uBniRyNt5QVg8OoBUOuOlU3uRH9YiLrX9e0xSoTIg
         Rl/QiLPKHeHcGwhN6hbQhDicFtR0gUNTtd3cWuPrQndJlXl+4GhGxWERiG5nH73yBu0k
         JQZHuHhzrJjnyMdEArjH8x5nGL3e6uDUsyuganWRZZZ0o3b2BO6sh8QOfH0zWb9Fk49W
         vMa1uaToqlX4H9Kd9RI51rzqwCzhxC9VhF1jvZzcrKaL6uAFM6ZJ0zjEDVrquJPN1LnI
         YjyaHhl1ZRIH4NkDhhxxkeIa3iOfqlA2Jwdbp41ZxzuMHAyBZDTLCGa5ztugmkoZ9+cL
         pk/Q==
X-Gm-Message-State: AOAM532wIcXCyhkFjkP9Hn4ZBFJBSKQe+JnLoKuNGxziaqsfuRRKDSpd
	jX/hZYhjvVqP0UJ8zLyVNHBuS+fe64moKQ==
X-Google-Smtp-Source: 
 ABdhPJwqgrZXJhKsmtHVwJN9LsnZZ1xeHMpc1bmC/P8T3yZhJMRNVbvydipywPvXY/2JO+y79T46CA==
X-Received: by 2002:a17:90b:3a83:: with SMTP id
 om3mr57080696pjb.211.1636908757457;
        Sun, 14 Nov 2021 08:52:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 a8sm13395625pfv.176.2021.11.14.08.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 08:52:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] vulkan-samples: Fix cmake errors about plain signature
Date: Sun, 14 Nov 2021 08:52:34 -0800
Message-Id: <20211114165235.3053064-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 16:52:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158260

Fix some typecasting errors seen on 32bit platforms with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add another typecasting fix

 ...dd-explicit-static_cast-from-vk-Buff.patch | 35 +++++++++++++++++
 ...-mix-plain-and-keyword-target_link_l.patch | 38 +++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  2 +
 3 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-Add-explicit-static_cast-from-vk-Buff.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-Add-explicit-static_cast-from-vk-Buff.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-Add-explicit-static_cast-from-vk-Buff.patch
new file mode 100644
index 00000000000..b0e7cdabe4a
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-Add-explicit-static_cast-from-vk-Buff.patch
@@ -0,0 +1,35 @@
+From f88fd472e57b59013570f08949dbbc0875c1bae4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Nov 2021 18:37:13 -0800
+Subject: [PATCH] framework/core: Add explicit static_cast from vk::Buffer to
+ VkBuffer
+
+This fixes errors like
+framework/core/hpp_buffer.cpp:149:3: error: no matching function for call to 'vmaDestroyBuffer'
+|                 vmaDestroyBuffer(vmaAllocator, handle, vmaAllocation);
+|                 ^~~~~~~~~~~~~~~~
+| /mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux-musl/vulkan-samples/git-r0/git/third_party/vma/src/vk_mem_alloc.h:3803:33: note: candidate function not viable: no known conversion from 'vk::Buffer' to 'V
+kBuffer' (aka 'unsigned long long') for 2nd argument
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/395]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/core/hpp_buffer.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/framework/core/hpp_buffer.cpp b/framework/core/hpp_buffer.cpp
+index c1f5649..2609e4e 100644
+--- a/framework/core/hpp_buffer.cpp
++++ b/framework/core/hpp_buffer.cpp
+@@ -146,7 +146,7 @@ void HPPBuffer::destroy()
+ 	{
+ 		assert(vmaAllocation != VK_NULL_HANDLE);
+ 		unmap();
+-		vmaDestroyBuffer(vmaAllocator, handle, vmaAllocation);
++		vmaDestroyBuffer(vmaAllocator, static_cast<VkBuffer>(handle), vmaAllocation);
+ 	}
+ }
+ 
+-- 
+2.33.1
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch
new file mode 100644
index 00000000000..66ed8bb47d3
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch
@@ -0,0 +1,38 @@
+From 64b806ab702a6f445fd84aca5f03bb85b86a66e3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 11 Nov 2021 18:37:09 -0800
+Subject: [PATCH] framework: do not mix plain and keyword
+ target_link_libraries() signatures
+
+Fixes
+| CMake Error at framework/CMakeLists.txt:461 (target_link_libraries):
+|   The plain signature for target_link_libraries has already been used with
+|   the target "framework".  All uses of target_link_libraries with a target                                            |   must be either all-keyword or all-plain.
+|
+|   The uses of the plain signature are here:
+|                                                                                                                       |    * framework/CMakeLists.txt:453 (target_link_libraries)
+|
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/395]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/framework/CMakeLists.txt b/framework/CMakeLists.txt
+index 948c796..13d3324 100644
+--- a/framework/CMakeLists.txt
++++ b/framework/CMakeLists.txt
+@@ -450,7 +450,7 @@ target_link_libraries(${PROJECT_NAME} PUBLIC
+     plugins)
+ 
+ if(${NEED_LINK_ATOMIC})
+-    target_link_libraries(${PROJECT_NAME} atomic)
++    target_link_libraries(${PROJECT_NAME} PUBLIC atomic)
+ endif()
+ 
+ # Link platform specific libraries
+-- 
+2.33.1
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 613ed592c61..81d8c6faf91 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
+           file://0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch \
+           file://0001-framework-core-Add-explicit-static_cast-from-vk-Buff.patch \
            file://debugfix.patch \
            "
 
-- 
2.33.1


