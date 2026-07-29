Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127F3C55161
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:14:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21941.1785359689665165700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 14:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MNPlQ2ry;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954d383e64so9061515e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785359688; x=1785964488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p1sh2A+0s4ucezR2soZUljCpGDz8u/7f6AufcGxNGQs=;
        b=MNPlQ2ry9nzuUdPJOQ9njzYup309Cy1mlk3qvC5IsJ3OnukaIAyni0fvPAA3A0n7ev
         8KrSuaaE3WkehLwlik7qsQb3ZX6lmbjRDN1Wp1TpGdbNfbRlQiS3SEXqWr9/1iAYo+Y2
         /ksT9wGLmqzFyjL2CtOiOYf8JHfbqUMkLDpPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359688; x=1785964488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p1sh2A+0s4ucezR2soZUljCpGDz8u/7f6AufcGxNGQs=;
        b=OIIIhg5K8Zbsh0QJyLjeO0dowvxw9TDd3a/IhVhA5XEvFgngUls+eTR552+jrPo2Fj
         p6RvPaweVZHVeXr5qx6Tch1iw9Na5QE4SoWsX+uKor4Ztp7rjivErlW8JOMRSgxaSXis
         v2X7UomAHvPW4UEU8Bcf4481N5/v3o8iN370RzPfO1ixL+6kkDrVRU0ANM3kJ/a+bFJi
         /7F2+CAKnQD1rhWofv8VUdAl6YwtiborenDTqcHZhgqnXAMxekTaLsc5Wv3Acn58t6z7
         ybDam9oHvp+05NdcFJxffY/O8cumi/bLi0jAoNI5gpEdXAWfgIjNYCxp1Z59tFviQ20H
         cxuQ==
X-Gm-Message-State: AOJu0YyfTcnrJIVo6F9V8WKEGlXm0IA1HqT+ttkEWgSlhZYz4opWJ9fW
	NKzaHFT3/jcO5aNA6f0nJkZfIT09lj0CG6EVKmqxGmVitwWyHwW3SH3IAcd+9lsiIyONi9xpukE
	cNTvG9qc=
X-Gm-Gg: AR+sD11/RZzUaZ2AzHOMeQC3daMbUyXZcdpjukXYL3CMdPfApvI3A2ki9NZDttwvDVf
	ZY+mqFAwqak8gdZKq2O9JZhZ2pjKfKtj06EtLx2/TuWVNshFKg2NvfOVPYwTny9H1ccyVMX1hBA
	zMbhV/H0Rgn97O26SsXPt2x0HjjfId/OaRloJrfiJkXX6Gbuk95jYG0VgGcptLNif3pHYxD09gJ
	CxZSmRZGQ5I352kM7R6RjbL7sAZnxmYC0TTb+b6gvDiKcnO2VTQ7I4DS9Zz+9HtyAzQOjiO5dcX
	jcJh0utVAQnjndhX+kyz+e7E/OAH2Z0eu6KFV1v7zcRTdYMcWmldj78mKJgbkzFsqzJE0tF5PbP
	QytI4TSgdPO/P5iN6l62D68Lmzs3BuuZe31TgXfI35RbMVQChocWlSFD4mSk9NECX6BmQhfctDH
	NLEVCcD+qJWg5gE8R4Fj4WCXladv8Q85M0ZHdbp6RApkKKzWri2pRyBEUC/LXqe3Sj1snvlIyUD
	eOrVRDnmONDiYXdbg==
X-Received: by 2002:a05:6000:25c1:b0:47f:8480:4abd with SMTP id ffacd0b85a97d-47fc666c4d5mr457300f8f.29.1785359687698;
        Wed, 29 Jul 2026 14:14:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3647:86f2:68ea:efc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a94sm11277116f8f.8.2026.07.29.14.14.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:14:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] vulkan*: Upgrade 1.4.250.1 -> 1.4.357.0
Date: Wed, 29 Jul 2026 22:14:37 +0100
Message-ID: <20260729211437.3394641-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
References: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 21:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242293

Upgrade the rest of vulkan to match the other upgrades

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{vulkan-loader_1.4.350.1.bb => vulkan-loader_1.4.357.0.bb} | 2 +-
 .../{vulkan-tools_1.4.350.1.bb => vulkan-tools_1.4.357.0.bb}  | 2 +-
 ...ies_1.4.350.1.bb => vulkan-utility-libraries_1.4.357.0.bb} | 2 +-
 ...ers_1.4.350.1.bb => vulkan-validation-layers_1.4.357.0.bb} | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.350.1.bb => vulkan-loader_1.4.357.0.bb} (97%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.350.1.bb => vulkan-tools_1.4.357.0.bb} (96%)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.350.1.bb => vulkan-utility-libraries_1.4.357.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.350.1.bb => vulkan-validation-layers_1.4.357.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb
similarity index 97%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb
index 1180cdc91c7..1c21bea5e9a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "a9e72c66d5cb79911eb9a9063bf4016dd0a3a123"
+SRCREV = "5f157b62e333c63260d05d81bf66faa216ab0fb8"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb
index ece9961c713..cafd3e7a0a2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "1cb3a319969cf0d3e2315b0a87a27447f55b4167"
+SRCREV = "286299bb6b732e4b22771cfb9d7d421542d40501"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb
index 600d88dcea4..c750428d094 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "a96bd4933c6adfc21329d15e9999791a0153bbf3"
+SRCREV = "e9585c3e3d41ab608ee3b098ce4721d357308fc8"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.357.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.357.0.bb
index 163fe0beea4..8697023c1e3 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.357.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 AND BSL-1.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.350;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "b9d4f9ead8d97c1bb0d174ea07d8aed8273818a5"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.357;protocol=https;tag=vulkan-sdk-${PV}"
+SRCREV = "f4874eee15c78d7bdb2b7e60659d539f14741500"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 

