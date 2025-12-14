Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEFFD59D99
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 20:25:59 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32607.1765743951223805917
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Dec 2025 12:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HnDulAWt;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7f1243792f2so1748739b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Dec 2025 12:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765743950; x=1766348750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uC7ozzZhUgPBxZWHdFwLVVeqmcuHTrA1cw4TVqEaznI=;
        b=HnDulAWtiYP0dmwsjrT2E3x9tXqa8ANJlHGyM5tQ5dNtfA1xKsYT5ONXjtLgljB/wS
         DyJQ63U0i0dw+X9h48+iZtsQBGRSc2RGkIAmsRmBNnN8dl68TKGsRT9jvLpSXSBNjS1m
         2Ye0XuBE/suWXvGbW7FRCl6PA0A+97AtiM02Lar7FT8mgklwTJ0naRrIQpcCRsI9FUkv
         W8BWnAeHEYUaz9bG0F14RnqZhQJbHkjdhLuF0l51J5tDYbse77qdmRXwcrBLo42d9WKY
         M2LWuJC9lA6JAikyBBZoihCtxFNn8/WNGqfXVA8WosWvmFrwf/zb4wFICDwYYl0uHKCb
         hzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765743950; x=1766348750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uC7ozzZhUgPBxZWHdFwLVVeqmcuHTrA1cw4TVqEaznI=;
        b=Z1zI20VvVvuC6eS8xPW2OahjrGjZcf4QZUBY2egVTdDcqzK2QpvvPuTfcAcrSdSEzC
         DMikarx3lomLxmjqT3M11i+PE7OO6lEmVfUTa5y/khbb7qHth4525iC8tCQ8oQ/R1Ikd
         Nu4GOzZSkxFO30WiF/jIW3yF7oXczOAxiDCzwSTSSJCdVc+Mx6NI+/U6S0djdoWjbmlv
         dybpN9rKgi06x4tVOSJKkwZMzZ/Ad+qGEQ3YdAIhwJIYNrgCTsoagNtCneTlVrTq8J+3
         eBqzz6jQ0S0qPqKeIM0WeMdxXQ3Bp5sC+ri0jotsFFBcmg3SSg64h4vbYHyuRVOgP17j
         0UEw==
X-Gm-Message-State: AOJu0Yxf6rjWlxMD2hdzH6YNjegP7mbPhp3PqWxrLDrkPNflD6KorFy7
	kPrI9xgxbWC9cp3xXRlsAt024yyZCNClLXs8cfrtQjHw2Tjl1sQruhhpUYHIjkgu
X-Gm-Gg: AY/fxX695zeFMbQ/Ql9h+ldXin1qSWFQLbq1bOnZli0sJexevSsNW+9FroI5/yWHF3+
	i1IO806gMgx/N8T9Kd+cMYLpFV6/vM02cce+qC7kAl5jqKZz96panjmSoPD0O120pzeM6/StM+C
	WoscRdXjT80lG8CTCzT8q6SpvxtyzG36LcrqCYRoxnrtKfGejxrP+svgpvW7csASdzzfAX6TYpt
	dh4Yrd9czj41nulPFPQ1kbRQPpXy7IIpDQFOMTwvFE5QBnZFmmpKqCbLfxYN07/4YdSuGG0wCJB
	sgLqxuP+6qJ9a1v9VvU+Wf98GVSsdAWBQYyycGAUFDtjM/lsk8GJAXTrCVX/3/sCy7xe/TXFCWV
	qiT6U2sVxF5yH/YGDwtlesaifmYk3BdKMu6mnFXXApSFOSSywXRnDeVHLsNNewUYuo3R6EnAdW+
	gZhYP74pTiRp+vgXMgNRR3gR2u+Av1ybvzSL4x1ZIhHojVglKHTd0K++WRcRlPPw/yThwfONhg/
	4TQqmGDrqYpS59MlMbeEkgXbaHkoAcx
X-Google-Smtp-Source: AGHT+IETQF1SaPmUlSx9D5lBuZ3dfxSsE9Bod9w94cky93+zxymNja+n/S7OSi1cAHQXz4jUxoUhbw==
X-Received: by 2002:a05:7022:f318:b0:11b:9e5e:1a66 with SMTP id a92af1059eb24-11f34bee619mr4711266c88.14.1765743950028;
        Sun, 14 Dec 2025 12:25:50 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b46f5sm37720117c88.5.2025.12.14.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 12:25:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] spirv-tools,spirv-headers: Upgrade to 1.4.335 release
Date: Sun, 14 Dec 2025 12:25:47 -0800
Message-ID: <20251214202547.3918638-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Dec 2025 20:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227697

New Vulkan APIs added to headers e.g. OpFmaKHR is needed by latest
spirv translator.

new capabilities e.g. Legacy Detection, vulkan configurator

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{spirv-headers_1.4.328.1.bb => spirv-headers_1.4.335.0.bb} | 4 ++--
 .../{spirv-tools_1.4.328.1.bb => spirv-tools_1.4.335.0.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.328.1.bb => spirv-headers_1.4.335.0.bb} (89%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.328.1.bb => spirv-tools_1.4.335.0.bb} (95%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
similarity index 89%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
index 2b750e4b92..c42aaa2c28 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT & CC-BY-4.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "01e0577914a75a2569c846778c2f93aa8e6feddd"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=vulkan-sdk-1.4.328 \
+SRCREV = "b824a462d4256d720bebb40e78b9eb8f78bbb305"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=vulkan-sdk-1.4.335 \
 "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.335.0.bb
similarity index 95%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.335.0.bb
index e5aedb1620..3b67da60f7 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.335.0.bb
@@ -7,8 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "7f2d9ee926f98fc77a3ed1e1e0f113b8c9c49458"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=vulkan-sdk-1.4.328;protocol=https \
+SRCREV = "262bdab48146c937467f826699a40da0fdfc0f1a"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=vulkan-sdk-1.4.335;protocol=https \
            "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:

