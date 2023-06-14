Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB29BC001DD
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.7501.1686734996374260627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nKRQUg9z;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5149c51fd5bso10778552a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734995; x=1689326995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sdT0mzpYhKYQur3LYf+x3GuhVJ5upbZknZ1MbcnG6M=;
        b=nKRQUg9zOhIDL4Ag7dT67oSicaXjYWXVUOJ5eS09Donmp8hn3u/GDLVIs6wNwZlEzX
         5xlKBKqgW/zznkTYaNhkEF8VZGFH0Nvj4JMveUYVess0lwVO08siIHzWLGPKbIp6bhVn
         gHGlWJ51UnfrRfGN1lzeSEs+IUyJrH9uWDQPOVhU4NylsKDsAco3HJosYXuob6r0djMe
         4qK51rnLJbH9EdaTZmfjWJewhkRYeK7fWL+9n5jOdJmITZgITetbuyMdjNDp3fnEBL95
         5+DAN5V5psVIaSBnv4xrJoBuP7LmaFlfL5rUBj4BXNE+qy2WYJONjx1o7RUSx8ja6NhQ
         5HMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734995; x=1689326995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sdT0mzpYhKYQur3LYf+x3GuhVJ5upbZknZ1MbcnG6M=;
        b=UTn/qMu8HlNZuz0U36eMcrHeYiTqzJPzvRhrf3C3Z1KNJPBd1t1fdctip47FVWUHun
         MXFkTg1poC3a9MP3lCsbAYeSJd6Ct/HRdow0CJOQ6zm81jic8Aqa+df5wQiF0lXaKndy
         IrEvIpEyYTJ5HGnzBrULgxYnzDnETtNfqOe+3Ck8mcpu3Mrk9Md9XX2NM9IL8fWUtSw6
         CRuhZFEtFrPtZ7KEhjJZtXcK+E+OKk7lBPCvqHUAmgeLs52aEHLpCx6SdA7rUKYmDJBM
         G2+yAepN6+kZaINDsOs9KsHdPX5o0k1PobD7fJ+iV+5EWqrASdJEWhXeLbm1t404CGog
         VeEQ==
X-Gm-Message-State: AC+VfDyYBR/Wsn+62QoUUmiuNNUTR5Mb10/+6g+03zIc6U1qptSJ6rJD
	jq/6MLrWa8z98c4EtjHijKLx7vg13K0=
X-Google-Smtp-Source: ACHHUZ42TSWQpAIsSDjJDQxH6bmQ68PtZN14ijOVXsnnNq9ZzOZMJxoZ5z57HBLd7Ir36xKGNoBcTQ==
X-Received: by 2002:a17:907:3d93:b0:974:5ece:19a6 with SMTP id he19-20020a1709073d9300b009745ece19a6mr18874065ejc.54.1686734994753;
        Wed, 14 Jun 2023 02:29:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 50/55] vulkan: upgrade 1.3.243.0 -> 1.3.250.0
Date: Wed, 14 Jun 2023 11:29:13 +0200
Message-Id: <20230614092918.4065570-50-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182795

Add a patch to vulkan-tools that unbreaks cross-builds.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...lang_1.3.243.0.bb => glslang_1.3.250.0.bb} |  2 +-
 ....3.243.0.bb => spirv-headers_1.3.250.0.bb} |  2 +-
 ..._1.3.243.0.bb => spirv-tools_1.3.250.0.bb} |  2 +-
 ...3.243.0.bb => vulkan-headers_1.3.250.0.bb} |  2 +-
 ....3.243.0.bb => vulkan-loader_1.3.250.0.bb} |  4 +--
 ...ts.txt-do-not-make-special-arrangeme.patch | 29 +++++++++++++++++++
 ...1.3.243.0.bb => vulkan-tools_1.3.250.0.bb} |  6 ++--
 7 files changed, 39 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.243.0.bb => glslang_1.3.250.0.bb} (96%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.243.0.bb => spirv-headers_1.3.250.0.bb} (92%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.243.0.bb => spirv-tools_1.3.250.0.bb} (96%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.243.0.bb => vulkan-headers_1.3.250.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.243.0.bb => vulkan-loader_1.3.250.0.bb} (95%)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.243.0.bb => vulkan-tools_1.3.250.0.bb} (89%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.243.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
index c50d67a6522..6e9c666d46d 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "14e5a04e70057972eef8a40df422e30a3b70e4b5"
+SRCREV = "d1517d64cfca91f573af1bf7341dc3a5113349c0"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
index e27c0a67dc2..d0a2e2e9916 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "1feaf4414eb2b353764d01d88f8aa4bcc67b60db"
+SRCREV = "268a061764ee69f09a477a695bf6a11ffe311b8d"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb
index 21f9dd9650f..2b0a773e80a 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "44d72a9b36702f093dd20815561a56778b2d181e"
+SRCREV = "e7c6084fd1d6d6f5ac393e842728d8be309688ca"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb
index 6ddc35e5d87..2970767ff32 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "65ad768d8603671fc1085fe115019e72a595ced8"
+SRCREV = "9e61870ecbd32514113b467e0a0c46f60ed222c7"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb
index 20128667f12..456c9734068 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.243;protocol=https"
-SRCREV = "22407d7804f111fbc0e31fa0db592d658e19ae8b"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.250;protocol=https"
+SRCREV = "f372068d09fc13bcf54b8c81274f37aa5f46aea3"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch b/meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch
new file mode 100644
index 00000000000..6b70a1e62d8
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch
@@ -0,0 +1,29 @@
+From 9060e916ca05d34b56c62f2be0b4a77dd104e2aa Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 2 Jun 2023 14:13:00 +0200
+Subject: [PATCH] scripts/CMakeLists.txt: append to CMAKE_FIND_ROOT_PATH
+ instead of replacing it
+
+Resetting CMAKE_FIND_ROOT_PATH in particular breaks builds in Yocto
+(which is a major cross compiling framework).
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Tools/pull/808]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ scripts/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt
+index 5b979d43..19a58bf9 100644
+--- a/scripts/CMakeLists.txt
++++ b/scripts/CMakeLists.txt
+@@ -114,7 +114,7 @@ if (MOLTENVK_REPO_ROOT)
+ endif()
+ 
+ if (CMAKE_CROSSCOMPILING)
+-    set(CMAKE_FIND_ROOT_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
++    set(CMAKE_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH} ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
+ else()
+     set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
+ endif()
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
similarity index 89%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
index dfdd716abd3..0346b380ee7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
@@ -6,8 +6,10 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.243;protocol=https"
-SRCREV = "18bdf5565f5d02831869785cbf758fa7b295b7d5"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https \
+           file://0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch \
+           "
+SRCREV = "695887a994ef9cc00a7aa3f9c00b31a56ea79534"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


