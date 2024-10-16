Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A4ED1AD52
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 12:26:06 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.21775.1729081561298770319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 05:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UseYX5jO;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: workjagadeesh@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso1057143b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729081560; x=1729686360; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFOfVvzWy2BaiXxALYLcMelXpVtGo1MLuSOiXNMUmA4=;
        b=UseYX5jOCLh2WgSbznJxD3dz5uW09oJ8F2msSdo+gLvn6KIVkoh8Pm4rw6WB+AmVhc
         SfYhLdAjj12+i9Wy/96a6H7Cjjv01r5V6XGg8uzLuuSwtAZ12HoXZamb/rhmFlKmuHvW
         RYTWxLvsENoEkhzPQCf69GlDJMLZztVxrXVDj9AdMpi60lBf6DflJdE8wDL7iQhgnDCj
         DoGYYvCTAgKZn6jm7PKJf9AAN94t8D8T357nmzpK1DzEum24ciEFvGw6ApzONbbLorvz
         gBb4HSg1dkv7ks5oru3SneipiC56rCWNMlGDE4/a4aw38dMQazXZx/RlpAVhLAQN5LIf
         QRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729081560; x=1729686360;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFOfVvzWy2BaiXxALYLcMelXpVtGo1MLuSOiXNMUmA4=;
        b=PFNwwnptLZPQgJtPqJ1uMqNL8lVTcwUi0pjMW02598L3SooKeLSDMl6yp60etev4cp
         80eiorpvCoGHs3J78eKHwoNknEqTgb0bohiy6I7ypN/YuaWr5J26a8L4b8K2wRBGiYca
         2mEDoPOXXdpXYUFIbRYtR5+DHlDkHzpIkEGAtPEWESeFwbjczzVd4ETQPOj42FDv3mWl
         oV1lUaSW5Yz/6ihFmM8SoprASC0f915GLLxsu+DINpg+L+EhHrCPJgoMaz2ZATEQ9qq6
         VY2TMb7aIlU5+8vYJnmqK6CKs/NT4YDRpD6afYcWnwSVJsI6TvcrGhzyRWzm1bXF62Rx
         tl/A==
X-Gm-Message-State: AOJu0YxM4TwLIffV2gz9+W3aHXNEk5/1Tem4Hh6ggOChgz3ntJMeEHLm
	hKjfOTIPoOVNb2CUOMm1vUEcUVXIeijQpMlJDWA26b5ABWKEgx4IDVTF3vN4
X-Google-Smtp-Source: AGHT+IFw2sRos6Wd6RijNk3PxoU98cTqopZqk5Ndrjh8wOQBAEIGFzAf6MvWHiZJRyaWwvE0t6irQw==
X-Received: by 2002:a05:6a00:3cca:b0:71d:eb7d:20d5 with SMTP id d2e1a72fcca58-71e7da25185mr6282095b3a.8.1729081560429;
        Wed, 16 Oct 2024 05:26:00 -0700 (PDT)
Received: from localhost.localdomain ([14.195.28.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773a2e79sm2947621b3a.66.2024.10.16.05.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:26:00 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH] tune-cortexa32: set tune feature as armv8a
Date: Wed, 16 Oct 2024 17:55:55 +0530
Message-Id: <20241016122555.21496-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 12:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205965

Cortexa32 is a 32-bit armv8a architecture processor, so set the tune feature
as armv8a instead of aarch64 which is 64-bit armv8a architecture.

It solves the following build error while compiling libgcc-initial
and libssp-nonshared.
-- snip --
aarch64-poky-linux-musl-gcc: error: unrecognized command-line option '-mfpu=neon'
aarch64-poky-linux-musl-gcc: error: unrecognized command-line option '-mfloat-abi=hard'
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
index 25bdf12b18..0eb938a240 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
@@ -10,7 +10,7 @@ AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH:tune-cortexa32             = "cortexa32"
 ARMPKGARCH:tune-cortexa32-crypto      = "cortexa32"
 # We do not want -march since -mcpu is added above to cover for it
-TUNE_FEATURES:tune-cortexa32          = "aarch64 cortexa32 crc callconvention-hard neon"
+TUNE_FEATURES:tune-cortexa32          = "armv8a cortexa32 crc callconvention-hard neon"
 TUNE_FEATURES:tune-cortexa32-crypto   = "${TUNE_FEATURES:tune-cortexa32} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa32 cortexa32hf-neon"
 PACKAGE_EXTRA_ARCHS:tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa32 cortexa32hf-neon cortexa32hf-neon-crypto"
-- 
2.17.1


