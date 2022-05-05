Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691B2C433FE
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:05:53 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.7215.1651727152275551165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BZKvJOYd;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id y3so6509065ejo.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F6VDRST/rOHB5GKL+bS6YbtjEO5uvlzxbKL9XddfDpo=;
        b=BZKvJOYdIFVDlc2at4fnrH5SPSY6WnlAhOFLhV5/w2dZoGxsP3yTXHWo1WFdwcjY2X
         0QeyyESU3QaInT008WX94UkHmlIk+qjGCVzgvYvyKKkIZBJ9//gx6bFazJnjUvO5uiF1
         hMf31dyu0cOqif79F/VFfdl+1Hckdj6GsLza9jSI9XGfx8peOb/druHUCKV25UQydySU
         YIKn8MHqVAMIJkk5cOSvP05NHmJlv3gBb0mV1wJUTZZEmbcbhheeip8gSerhDPCYKFHU
         yNuNvhojT3bjmFz8oFIa5N43B5XpSyngxDekT5GtJNmL+ZNpaNlXsm82Xh++6UQoH338
         s+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F6VDRST/rOHB5GKL+bS6YbtjEO5uvlzxbKL9XddfDpo=;
        b=LgOMupGxLGxj17rlHvMMwcrXjX3cKzz0G7fpu/CgoLfYJ8clJmZNtLhPcFAbRxbmjI
         MztJWk8lJeS3n+z6WTm9IfvJUl8u5ZLKLWgre4fAS5oGBDjkRamanCXEhA9pIgmts+J6
         XMsnnpVJXqNMZpnAg1J8rmzdbgG0HV6dj8neEWftqgmJgT8PhWXUb2z2Rv9ZLleChjRm
         reeKwAhfMYGabUuzYDM7jb0xxyGgMI0UqiAoiOYMkMWLw96KLm/yopmsIxViaNTGhkCq
         c0tahpw7dLb4ZxydYKUWbNM/LVoijLDvj8rD3ZEGN9ZASyiCFLX+GYjruV2uN9sYDoxo
         qs5A==
X-Gm-Message-State: AOAM532QbDyBypv0CKdMlKOoPLZFeG4crD6taLc/2flgG+9J7qSykZpl
	v7cqbF5KEGZ5QJmve6+JqmbBzmiKvsA=
X-Google-Smtp-Source: 
 ABdhPJxuxlrOZRJ51nEi7zpIxi4kzyVEEuSQgpSdQZRTCvLw3I47E7E899KwkIdN55Tv0KEcHR4PRQ==
X-Received: by 2002:a17:906:8585:b0:6f3:99f0:d061 with SMTP id
 v5-20020a170906858500b006f399f0d061mr23861921ejx.436.1651727150747;
        Wed, 04 May 2022 22:05:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/61] vulkan: upgrade 1.3.204.1 -> 1.3.211.0
Date: Thu,  5 May 2022 07:04:48 +0200
Message-Id: <20220505050544.651895-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:05:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165234

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/{glslang_1.3.204.1.bb => glslang_1.3.211.0.bb}    | 2 +-
 ...{spirv-headers_1.3.204.1.bb => spirv-headers_1.3.211.0.bb} | 2 +-
 .../{spirv-tools_1.3.204.1.bb => spirv-tools_1.3.211.0.bb}    | 4 ++--
 ...ulkan-headers_1.3.204.1.bb => vulkan-headers_1.3.211.0.bb} | 2 +-
 ...{vulkan-loader_1.3.204.1.bb => vulkan-loader_1.3.211.0.bb} | 4 ++--
 .../{vulkan-tools_1.3.204.1.bb => vulkan-tools_1.3.211.0.bb}  | 4 ++--
 6 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.204.1.bb => glslang_1.3.211.0.bb} (95%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.204.1.bb => spirv-headers_1.3.211.0.bb} (92%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.204.1.bb => spirv-tools_1.3.211.0.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.204.1.bb => vulkan-headers_1.3.211.0.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.204.1.bb => vulkan-loader_1.3.211.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.204.1.bb => vulkan-tools_1.3.211.0.bb} (93%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.204.1.bb b/meta/recipes-graphics/glslang/glslang_1.3.211.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_1.3.204.1.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.211.0.bb
index 2af406212f..37dea07a8a 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.204.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.211.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "2742e959347ae2fac58acd0d022c92a0ff1f24bf"
+SRCREV = "9bb8cfffb0eed010e07132282c41d73064a7a609"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb
index 72416b441f..910ba668af 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.211.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "b42ba6d92faf6b4938e6f22ddd186dbdacc98d78"
+SRCREV = "4995a2f2723c401eb0ea3e10c81298906bf1422b"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.204.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.211.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.204.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.211.0.bb
index 4c908d88c0..9804febbcd 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.204.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.211.0.bb
@@ -7,8 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "45dd184c790d6bfc78a5a74a10c37e888b1823fa"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=sdk-1.3.204;protocol=https"
+SRCREV = "7826e1941eab1aa66fbe84c48b95921bff402a96"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb
index 7397f40fb4..c74eb4cf5b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "1dace16d8044758d32736eb59802d171970e9448"
+SRCREV = "76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb
index 8924ca34a6..cb4932ef79 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.204;protocol=https"
-SRCREV = "f3e995134211d3fd663febede48e740e44982e27"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.211;protocol=https"
+SRCREV = "bfb419161602361626e40a7a3af0a63e06bcf204"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb
index ae062f3ee2..3cb4ccc23f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.204;protocol=https"
-SRCREV = "b9a87a24a814e443b1adfc5a6bc2e57243446f6c"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.211;protocol=https"
+SRCREV = "4fdfd2b1187ab44f062d091ba3113c5e3eab5a1b"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


