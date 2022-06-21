Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8871EC3F2D4
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:16:56 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.48527.1655842613447796271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fmc6ZzkF;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id sb34so785820ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4e+hXT9K3okQLwHuT1D7ZnTx3G4L/EBjhhHU5Rfw3Xc=;
        b=Fmc6ZzkF3nmEto2xUDLHpTilmmGjHdGVR+keezwcp/gP4GpkZ5XH1H0od8OHqc279x
         PvO3CIv0A/tkb8cESegLYQxvvMSzpg5PjijGBcwlCpJFmLvPWxAZPIZ7Npas1x7KcgUG
         CxU2Wx7m6zK0nu1RfkG95HgGO6oYDCsPkCVPMX3HVtXidyRhHZvEHkf/gIRLofZLnAZC
         EU/0kEjsQwTZvVr886ER3HwDr1QbLwos27xF45ByiEpPCAMnnojSWGOgRfxY26CulOiA
         kJWDDfVfm+PjSDF93XAc49o2myrOUF7F+XGBac+7IZjuc0Ar3ah5413U8CVf2kwgWj7e
         RmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4e+hXT9K3okQLwHuT1D7ZnTx3G4L/EBjhhHU5Rfw3Xc=;
        b=1ek0oGBijodNIAmVoLts6zmjiCTTbgdVUONZWlLLcUk/xz4p81Rd9GZ5rjwuo8wWIS
         cng7UJPuiN0e+GmPlEAnN2TUv+SKP1yns8NKilQaMejd3Oy30yCI853UAi4mhQ9djs1T
         dHK+kJZwuyLVW2SSFTrfwb8W2yF/IxX5PNOakiPUBI7kr0wUKqtJAlj5MFWUBDPfYXL4
         p82OcXxA7qPVWLqqeJYAFs4U8oeRr+tu4L4JkEMgb/70TQuptjCZCCarSmndRQl5FLCj
         m7dm2SUCarLV8P46aDci8JMfFv8TCI5OleQbNU0jrg0GauivUtS7SNR4K6vqfT9hH68N
         N1mw==
X-Gm-Message-State: AJIora9yPqtQs4YgPjje/OAP/GbirqKCg/aktG1XThxfzMdlDe265W1b
	91uMafEG3vC1893dXdzp9w7fhJuHFfuWtg==
X-Google-Smtp-Source: 
 AGRyM1sdt7Ga7zFu6HPNs5Tvf6wQx5wkDUPoRaNYljQu0p0vUsOd9VNWebrSJeGT3+4nC/F9An4LDg==
X-Received: by 2002:a17:907:d24:b0:712:1142:88c7 with SMTP id
 gn36-20020a1709070d2400b00712114288c7mr28664570ejc.435.1655842611945;
        Tue, 21 Jun 2022 13:16:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:16:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/18] vulkan: upgrade 1.3.211.0 -> 1.3.216.0
Date: Tue, 21 Jun 2022 22:16:25 +0200
Message-Id: <20220621201637.1378306-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:16:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167174

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/{glslang_1.3.211.0.bb => glslang_1.3.216.0.bb}    | 2 +-
 ...{spirv-headers_1.3.211.0.bb => spirv-headers_1.3.216.0.bb} | 2 +-
 .../{spirv-tools_1.3.211.0.bb => spirv-tools_1.3.216.0.bb}    | 2 +-
 ...ulkan-headers_1.3.211.0.bb => vulkan-headers_1.3.216.0.bb} | 2 +-
 ...{vulkan-loader_1.3.211.0.bb => vulkan-loader_1.3.216.0.bb} | 4 ++--
 .../{vulkan-tools_1.3.211.0.bb => vulkan-tools_1.3.216.0.bb}  | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.211.0.bb => glslang_1.3.216.0.bb} (95%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.211.0.bb => spirv-headers_1.3.216.0.bb} (92%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.211.0.bb => spirv-tools_1.3.216.0.bb} (96%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.211.0.bb => vulkan-headers_1.3.216.0.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.211.0.bb => vulkan-loader_1.3.216.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.211.0.bb => vulkan-tools_1.3.216.0.bb} (93%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.211.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_1.3.211.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
index 37dea07a8a..69d9a0a84e 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.211.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "9bb8cfffb0eed010e07132282c41d73064a7a609"
+SRCREV = "adbf0d3106b26daa237b10b9bf72b1af7c31092d"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
index 910ba668af..94500a96ba 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "4995a2f2723c401eb0ea3e10c81298906bf1422b"
+SRCREV = "b2a156e1c0434bc8c99aaebba1c7be98be7ac580"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.211.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.211.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
index 9804febbcd..eb907326c4 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.211.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "7826e1941eab1aa66fbe84c48b95921bff402a96"
+SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
index c74eb4cf5b..5f7917ae82 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8"
+SRCREV = "3ef4c97fd6ea001d75a8e9da408ee473c180e456"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
index cb4932ef79..15a079879b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.211;protocol=https"
-SRCREV = "bfb419161602361626e40a7a3af0a63e06bcf204"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.216;protocol=https"
+SRCREV = "322f7e3212b4fd9d70d7f48972963c83d24d06e4"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
index 3cb4ccc23f..e26f4504f1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.211;protocol=https"
-SRCREV = "4fdfd2b1187ab44f062d091ba3113c5e3eab5a1b"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
+SRCREV = "ef9db7a8ec52f6c56158d83f5d57ef388c1abec1"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


