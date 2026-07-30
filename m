Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1664DC55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:22:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11668.1785417749266611080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 06:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gXsLn9XI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso9529745e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785417747; x=1786022547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gflyjF47aoOOXQ9b0qsbGiGTLTWzl4hvdFADlEFpSsY=;
        b=gXsLn9XI1ctQow65Z4v+h1rkwDhKZIGbx+1vJnDfFG2d+84ZTcaV19AMB0zMMqmBZy
         p7xqPdcbAC6TS/oIJjxKQBjLSnrP2YUQ5S23QBc48gAW/wF+EXSv6YZlKm8n3YcpDGzA
         i5bPue3iqwCaSDSlF0YAuBvt24Y5olrHiSAXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417747; x=1786022547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gflyjF47aoOOXQ9b0qsbGiGTLTWzl4hvdFADlEFpSsY=;
        b=seZU7Fgn7IIw6LUYELjgKMQy4RyED5gAlWErJ1ooV4fielAjNUnCF930UUaA6gDyrr
         I4gAl1RKMxTq09yCmnSw4NluuLl9WDagDdYbevRHBdon/mqsGtJHeA2Y62kvIOGBpX6B
         f+1yKP0FfynDs/nNQ7zx47Uuw+l/BJxNkRh9NootpUEDunETqyxfqA98nWxK8zS8kZE7
         2OwvbJPJ82Kp0JoxgFRNCTMUm/BK9KTWrH4bv1wJ2dzxI8gQcny/gzzy9m/JOJe8flZK
         ZGTy4Q//Hggfn8Nx2LtT8JBzvTjyEPxz/BKfvr3kYSp7PoCdcCMx+VyTX3Q0nnvE146g
         C6Rw==
X-Gm-Message-State: AOJu0Yz/NTPjw8Sw46BKXGtc+LEx0f/dN6wOA8IzYbF2dyKzaugCOL7w
	+hj8OQkUfzQ5g0bqWQGuIT7gzshN0XGjUkw06OwFM7+qopOuwTkdujMSHbNPchBK4W3WHc4OLN5
	3JLhZK+8=
X-Gm-Gg: AR+sD12+lqM+tdkkX173XiNHxtdls0Bidn/opbB4Y9KfrGXTeEdf1XRynopVngvJiLq
	n+rFNVa+0Rxt/pN3RWWNDRQYbXIz4hj/0YNMWksnzfLXuCKqxvJcWifPgsygOgg0g4IodnYNxlu
	Ahl/iMrRD8bIpaZVPd4N5E2F2U4SOzfaKJyaq5euO5m4Eus6h4ZFcSyL+38h88vHNzBFKxn8Qo4
	TaABNAs14WJNSQve9eI3Pjnka5pVOR73TWS5IPbqITHxkJ0Y1Vx/mPJOqBNIHGeP0ZXD9dnqria
	t/3riSdsteCS854JwnBUtAKwdtVrSRAP/NKVGeskPzCWFuY92OhlMUi22K05Zjori3vyr7MyRAL
	W4yLz3e2WNhVVR+Ztcb5cc33eCfAi41qM/CKTrNnZwPeuDxxI+uHFd3Cl1Cfk5OqlAKYDf9DBYI
	/M7H+GW7vUvgZcoFXjnEr1gwWpeJj4hsH6JlxxwLJDwkzxORLTihhLpIVpNTCnybN6i+R3sUxfj
	Q2LHqoKR5s10y5b
X-Received: by 2002:a05:600c:3514:b0:497:ff4c:246 with SMTP id 5b1f17b1804b1-49804c27ebbmr5940475e9.16.1785417747291;
        Thu, 30 Jul 2026 06:22:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800e6f11fsm1885315e9.1.2026.07.30.06.22.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:22:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] vulkan*: Upgrade 1.4.250.1 -> 1.4.357.0
Date: Thu, 30 Jul 2026 14:22:25 +0100
Message-ID: <20260730132225.66059-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 13:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242355

Upgrade the rest of vulkan to match the other upgrades

License-Update: vulkan-validation-layers added BSD-2-Clause and an LLVM exception
to the Apache 2.0 license as additions to the license file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...kan-loader_1.4.350.1.bb => vulkan-loader_1.4.357.0.bb} | 2 +-
 ...ulkan-tools_1.4.350.1.bb => vulkan-tools_1.4.357.0.bb} | 2 +-
 ...1.4.350.1.bb => vulkan-utility-libraries_1.4.357.0.bb} | 2 +-
 ...1.4.350.1.bb => vulkan-validation-layers_1.4.357.0.bb} | 8 ++++----
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.350.1.bb => vulkan-loader_1.4.357.0.bb} (97%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.350.1.bb => vulkan-tools_1.4.357.0.bb} (96%)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.350.1.bb => vulkan-utility-libraries_1.4.357.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.350.1.bb => vulkan-validation-layers_1.4.357.0.bb} (87%)

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
similarity index 87%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.357.0.bb
index 163fe0beea4..5a35e9797b9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.357.0.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-ValidationLayers"
 SECTION = "libs"
 
-LICENSE = "Apache-2.0 AND BSL-1.0 AND MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
+LICENSE = "Apache-2.0 AND BSL-1.0 AND MIT AND BSD-2-Clause AND (Apache-2.0 WITH LLVM-exception)"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=15158583155fe4efc33ea65c1370a177"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.350;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "b9d4f9ead8d97c1bb0d174ea07d8aed8273818a5"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.357;protocol=https;tag=vulkan-sdk-${PV}"
+SRCREV = "f4874eee15c78d7bdb2b7e60659d539f14741500"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 

