Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDBAC001DE
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.20170.1687728173450718955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iDzx+sPA;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f9c88ac077so34253825e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728172; x=1690320172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gK5FTDBpgRigRbs7IP1HMWCIEbsNjzZQlBGsb+gHCQ=;
        b=iDzx+sPAERMFAuppwQemGylicWKMTWHuyckGYyQIIuyYdAQiKOGxwJrV/1LO2eqj7q
         JidvjFUwObe61tk9SStADRNRr6qMGKvZ8WQIKrVB+UcI5csoqHOxR2MqCp9SIgwJJRZK
         YV5EHQ6ZH30ixGVa/Qkd7SS/r62g1qqD/Pa65MYDWMcG8aLjOmL8XluJASYU02mFeRfV
         aqA1gH3+fKGE2Gabkw1yOZNdc8uQLRZi6UkzZm96mnObOUfiIxi9piuNWVzpvPu7w2Is
         ujs82ezQIG1Xpm9af2WefV6OiNC8Xlag1BXctN4fgT3fkTUz7Rhw/4X97JXzl5jnp00R
         XQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728172; x=1690320172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gK5FTDBpgRigRbs7IP1HMWCIEbsNjzZQlBGsb+gHCQ=;
        b=Mxr6mJE56gWahrQyePjPT4rXsJMEy9haPLkUVvpMLixjTsKdEKfIppdBalnhNlDp/F
         6bqN8eEGspHbVUok5VUcA2BhQLj8Oitn1T91E7P++HeHdLNXry07FkSDmryZEofDUoP1
         29eHJ+0U2g4UxHUQlEdX8Twggyxz6qpjgeJII7EBFAG1Wg9Hev9kSFUAfcU8P6aDccH0
         ChNUxTusFDLN6GCWbzIq/+oKLkW/vajx866AnO04a8AxSq3f+/7V9VIVTZMgCckb28pe
         wGfgt0rh+tJ7a8NEcvYyEHGFAH0SW+ZoAZZjTgaYvrZ5mxy3B625mBoVH7KOkPriMpG0
         n01A==
X-Gm-Message-State: AC+VfDyze89Gmq629TpUv+11FTuogXonjnLKc0aPnhMOac2NYJ+wme5r
	68bPsVgZDri+zNUMLy6vQ8BFHnI6pr0MMA==
X-Google-Smtp-Source: ACHHUZ6v6xs3QQ5ruOMIIN6NbMdB6wX1QfmVHycGc7pVDkpjkOKmN/ix9bPDA9RXykdzBnIW/KpTGw==
X-Received: by 2002:a05:600c:2205:b0:3fa:8866:14af with SMTP id z5-20020a05600c220500b003fa886614afmr2844839wml.14.1687728171692;
        Sun, 25 Jun 2023 14:22:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/21] vulkan-validation-layers: update 1.3.243 -> 1.3.250
Date: Sun, 25 Jun 2023 23:22:34 +0200
Message-Id: <20230625212241.915739-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183389

Backport a patch to unbreak cross-builds.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ts.txt-append-to-CMAKE_FIND_ROOT_PAT.patch | 28 +++++++++++++++++++
 ... => vulkan-validation-layers_1.3.250.0.bb} |  6 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-validation-layers/0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.243.0.bb => vulkan-validation-layers_1.3.250.0.bb} (90%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers/0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch b/meta/recipes-graphics/vulkan/vulkan-validation-layers/0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch
new file mode 100644
index 00000000000..4db686fe2fe
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers/0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch
@@ -0,0 +1,28 @@
+From ea7b9e6fc0b3f45d6032ce624bed85bbde5ec0bf Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 21 Jun 2023 20:03:03 +0200
+Subject: [PATCH] scripts/CMakeLists.txt: append to CMAKE_FIND_ROOT_PATH
+ instead of replacing it
+
+Resetting CMAKE_FIND_ROOT_PATH in particular breaks builds in Yocto
+(which is a major cross compiling framework).
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-ValidationLayers/commit/e1b11dc7856765cf45a283ac805ea5066c81cd9b]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ scripts/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt
+index 94c8528c8..cd86c54eb 100644
+--- a/scripts/CMakeLists.txt
++++ b/scripts/CMakeLists.txt
+@@ -124,7 +124,7 @@ if (MIMALLOC_INSTALL_DIR)
+ endif()
+ 
+ if (CMAKE_CROSSCOMPILING)
+-    set(CMAKE_FIND_ROOT_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
++    set(CMAKE_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH} ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
+ else()
+     set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
+ endif()
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb
similarity index 90%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb
index bfb4b370b83..62c6343c45e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb
@@ -8,8 +8,10 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8df9e8826734226d08cb412babfa599c"
 
-SRC_URI = "git://git@github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.243;protocol=https"
-SRCREV = "4ac0fd8e6cb3d49105d707d9ec07f0f3aa0943d6"
+SRC_URI = "git://git@github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.250;protocol=https \
+           file://0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch \
+           "
+SRCREV = "1541e00a63cd125f15d231d5a8059ebe66503b25"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


