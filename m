Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1D6C04FE1
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7370.1686734994116263615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=X3DO93IE;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso11030475a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734992; x=1689326992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPrT3ttDEW0ibwC0zywV0hPPEHCBdg2aDWRgN9V5ZsU=;
        b=X3DO93IE3oC4o0NVaVUdYiGZSeYkkDOR4Wgbpq17duqhEfaiocLRKILiE04pn6Nrj0
         6PQi3jBLGL8lNnLiyDWV2CH7nLnZFAmznT9mEQwYWvc6CsLBk+YZ1FBjLU5Sj9bAIoCd
         tNTyruDwYwqNN2qWEmq/40cMYPOnhhmB31nfxeKnqK9AByYLlrPavnpxcghOevmgLxqL
         vMu44ptT98lEb2905YmyN3SS9XodGIMYzwGzAw0POip8AwNqw0x5exmM/IWGG7yYVfxk
         Og39y2CgWb26Yg8jpsMYK4zgminN6M28NFTaEjEPlAEeJynzbxmD/PSr6hWxWqawsq46
         2O2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734992; x=1689326992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPrT3ttDEW0ibwC0zywV0hPPEHCBdg2aDWRgN9V5ZsU=;
        b=IGSuVgVdcixpKjT3CqPewzyWXPViVhB0RoOtouVaFrHhdzqQyccCuqghNbvApnF4IG
         50fRI3xbQ/fmFgZQVzw4H/2EF0d0wgO/SBcy/tR/WfI5whCq9vND/VT600jjkxzpzJIZ
         cmHyipfqHxReny1ZDbt0R1o0pfpcugcdJBGs2YaRlXWDhr1qR5fCZI/nyXbdonc5St1E
         t5LY+9CoyBWiLgqgOJJYqcv3P2HgJm8fhpUyg6A+uydRnnGT+jCKZIfve0GFSMdXTO2R
         YVGtqXQjnxuxEhdhP77RMCIRhM9Jj5VbOrKFaFQS+sezwFRhnFJRQ2yl4Mwe4fVQO/bS
         IsZg==
X-Gm-Message-State: AC+VfDwIyYZ8F0sBzfrzilp7WzP0yqUELNu3/VhQzFZNY9Q+NMFvlD6Y
	oMvOvl3QudZlB/Jvg9gyWt23NWa3tEk=
X-Google-Smtp-Source: ACHHUZ6h0/NEeqdkGSoZUIk/uK0tvbmISLaPZyGNHf7PC401vrtOud8kgM3fL9Rz0myCDvA/EXAcag==
X-Received: by 2002:a17:907:a46:b0:977:e916:9b83 with SMTP id be6-20020a1709070a4600b00977e9169b83mr15198326ejc.8.1686734992605;
        Wed, 14 Jun 2023 02:29:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 46/55] shaderc: upgrade 2023.2 -> 2023.4
Date: Wed, 14 Jun 2023 11:29:09 +0200
Message-Id: <20230614092918.4065570-46-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182791

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...isable-building-external-dependencies.patch | 18 ++++++++----------
 .../{shaderc_2023.2.bb => shaderc_2023.4.bb}   |  2 +-
 2 files changed, 9 insertions(+), 11 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.2.bb => shaderc_2023.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index cc9a4000281..35855bd8326 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,7 +1,7 @@
-From 071a9d71bea91bbefcf15e061fc87e53568f3188 Mon Sep 17 00:00:00 2001
+From d3fbd6b9427f29606540528d17fe02930cd78d0c Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
-Subject: [PATCH 1/3] cmake: disable building external dependencies
+Subject: [PATCH] cmake: disable building external dependencies
 
 - add cmake option to disable the build of the third_party dependencies
 - change the update_build_version.py to use pkg-config when third_party dependencies not found
@@ -9,24 +9,25 @@ Subject: [PATCH 1/3] cmake: disable building external dependencies
 Upstream-Status: Inappropriate [OE-core specific]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
  CMakeLists.txt                | 13 ++++++++++---
  utils/update_build_version.py | 22 +++++++++++++++-------
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5c74cd8..b358f6b 100644
+index 633c244..75b01da 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -41,6 +41,7 @@ else()
+@@ -67,6 +67,7 @@ else()
  endif()
  
  option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
 +option(BUILD_EXTERNAL "Build external dependencies in /third_party" ON)
  
- set (CMAKE_CXX_STANDARD 11)
+ set (CMAKE_CXX_STANDARD 17)
  
-@@ -101,8 +102,14 @@ endif(MSVC)
+@@ -129,8 +130,14 @@ endif(MSVC)
  
  
  # Configure subdirectories.
@@ -43,7 +44,7 @@ index 5c74cd8..b358f6b 100644
  
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
-@@ -112,7 +119,7 @@ add_subdirectory(examples)
+@@ -142,7 +149,7 @@ endif()
  add_custom_target(build-version
    ${PYTHON_EXECUTABLE}
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/update_build_version.py
@@ -104,6 +105,3 @@ index 5785390..f72b762 100755
      mkdir_p(os.path.dirname(output_file))
  
      if os.path.isfile(output_file):
--- 
-2.30.1
-
diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.2.bb b/meta/recipes-graphics/shaderc/shaderc_2023.4.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.2.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.4.bb
index 07fae0bb7ec..739e7ae81c9 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "55f4bbd993de3a3cad34cb41cd07b82fa1c77dd6"
+SRCREV = "7a8b3da0583425cf511336cf3afbdcf2ebc8b36b"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.30.2


