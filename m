Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3191ECCA47B
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:29 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.7313.1654699224628944417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=idh8vDLA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id u2so18531516pfc.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=65nrhbu6a1KFVgN7Y5JG/h1/IiTKfGK6ZzfXH/jPV4Q=;
        b=idh8vDLAeo/a7KPbq2pcQghEBtkUTYdDJyPwTk05oIVq6Aukzrh/iCFOisrnK3rBnM
         LjRfz6GJBJunnwb1qA5B1kI8QsPOvhZf3yVbjIyXnoxOTKcAZYrnWFL18w/v2Wj3ELeQ
         8ljqIO990C52tTJfSnoo+9bFMbTZdoF8tSWWhKH/3hocAeKIc9pUsdhVv4+BxHrGOQ9F
         Hwb46XMfNGvurgM9UYyR/wDEh3ewgp+6DZvQRaNI6TEMlK7SmWRAiAongyvlgpY/ZYgz
         NtwaV6+GXs1kLSdbr6exTU04zBOYilMjtobhoC8t+TWmnqIpfu2wGuwrlyZpbyMzQ0xZ
         snyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=65nrhbu6a1KFVgN7Y5JG/h1/IiTKfGK6ZzfXH/jPV4Q=;
        b=zzOYCYxvJwOF+cOOQrUJMbQtlM4sJPOW/la86x/i7lSKyKRUm0XfxpPUdlf7Sa/3Or
         uR+2627z2f2upMbQ3T1j/qrC6Sw/OmPH1qabNAXLUqk28WzDBIl31lNME2fpXjEtpPSw
         qlLSlTlAuqDqGqeoumE16kzp8gNSpiQpQbJo2kMXqAeEYsr3J0rb/gb9wMnQlgZiiMhI
         TCb06IVEqaMeaXl9HnZl5q5eliyr12vF0fyGSKJdjj3yFCNlKkX8ms7yxp/Buz/LkpDv
         9+RB7f9r+Gr/drTS3bQabV6TgOxLvIs2T2y+h+tuD1u4hRecMqR9YwQ+PLGKS1/E2dCP
         xudw==
X-Gm-Message-State: AOAM530H0RStJbhK0ooI/OSklpz2mGNRxewXSrXQzDWu0DCWgb7zVd/f
	YSt/qfygbAxPTZUNCgbnfQyDz85H16qccHU5
X-Google-Smtp-Source: 
 ABdhPJyn6Kp8lHoIBwoUAcjWpdyhK2drxOQOdJINIfz4ekmc7HuLcVgkGSx0fm7kPD4yBWFts/J7BQ==
X-Received: by 2002:a05:6a00:1ad4:b0:51c:7852:2bd1 with SMTP id
 f20-20020a056a001ad400b0051c78522bd1mr797426pfv.2.1654699223578;
        Wed, 08 Jun 2022 07:40:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/22] linux-firmware: split ath3k firmware
Date: Wed,  8 Jun 2022 04:39:25 -1000
Message-Id: 
 <324e4f598c0e59ba2376d5fd76068eedac17b0d3.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166723

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Atheros AR3011 Bluetooth devices require special ath3k-1.fw firmware
file. Package it separately from the main linux-firmware package to
allow deploying this firmware on embedded devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit a12a5606f4c7003d9a90c493380c656ee557dea5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20220509.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index 7da5eca893..6e328e5726 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -270,7 +270,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm4373 \
              ${PN}-bcm43xx \
              ${PN}-bcm43xx-hdr \
-             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
+             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-gplv2-license ${PN}-carl9170 \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
              \
@@ -320,6 +320,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
 
 # For atheros
 LICENSE:${PN}-ar9170 = "Firmware-atheros_firmware"
+LICENSE:${PN}-ath3k = "Firmware-atheros_firmware"
 LICENSE:${PN}-ath6k = "Firmware-atheros_firmware"
 LICENSE:${PN}-ath9k = "Firmware-atheros_firmware"
 LICENSE:${PN}-atheros-license = "Firmware-atheros_firmware"
@@ -328,6 +329,9 @@ FILES:${PN}-atheros-license = "${nonarch_base_libdir}/firmware/LICENCE.atheros_f
 FILES:${PN}-ar9170 = " \
   ${nonarch_base_libdir}/firmware/ar9170*.fw \
 "
+FILES:${PN}-ath3k = " \
+  ${nonarch_base_libdir}/firmware/ath3k*fw \
+"
 FILES:${PN}-ath6k = " \
   ${nonarch_base_libdir}/firmware/ath6k \
 "
-- 
2.25.1


