Return-Path: <git@andred.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4CDC4707B
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 15:56:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.21274.1705161401306128698
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jan 2024 07:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: andre.draszik@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e68ca8e27so6348095e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jan 2024 07:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705161400; x=1705766200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqi9yHfMqozV3POVE/AcTZn/dxh1XyXq6ioDKRytiEY=;
        b=RfTefjvJumx4taq5bfBEgoNlyOOmcpcDZrHvr6GR0aEIAt4P81BYSmjdJcTjO56/JK
         clRvdo8XtT9uMuRBz2p2a0KTPNMIOPHd5Vrd0GcaF33IpXj+Kmx7fgD95nllQcK1vLEw
         MqqKuolXxHU3csiQHPWCHyVQnAG3C4cjh+rfurIQmlhGLvdeZaQNN1Xu4MVNPher/7FO
         CsZ3Wl3fLSXqSK9k35c7lGXZ989kp+PSGKsxSL26JqUskKITlkej1KRcoRO2QdIJwlbB
         HpIBZ2OFCEzFrNDiOkpBSoJoD9m68E1wqK5Vc77mmRa/ly6iJHgUqdvMPQT4SQS6pX59
         vl5w==
X-Gm-Message-State: AOJu0Yz3Pxyk+D+8qQOqmA0g0L7qjPH3fCKYnxaX6OuRVw7gSpZsDxwK
	8UIJ0mmpWCRI1AOyxBKfGzKbfDSZRngW+A==
X-Google-Smtp-Source: AGHT+IF3TTy55ISyORf6d+05KEnK9Q/wd7USyzEPo3DX3Ru4AU5poIhnw1iD5uG26W1lePYaHOGJbA==
X-Received: by 2002:a05:600c:4fcb:b0:40e:45c0:ad64 with SMTP id o11-20020a05600c4fcb00b0040e45c0ad64mr1557199wmq.14.1705161399542;
        Sat, 13 Jan 2024 07:56:39 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c445500b0040e3bdff98asm13531876wmn.23.2024.01.13.07.56.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 07:56:38 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] linux-firmware: split out rockchip/dptx firmware
Date: Sat, 13 Jan 2024 15:56:37 +0000
Message-ID: <20240113155637.2401722-1-git@andred.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jan 2024 15:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193601

The dptx firmware is required by the Rockchip Type-C DisplayPort
controller, and we shouldn't have to pull in all of the other firmwares
just for that.

Signed-off-by: André Draszik <git@andred.net>
---
 .../linux-firmware/linux-firmware_20231030.bb          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index b1f52479755a..fc27ebbf688f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -63,6 +63,7 @@ LICENSE = "\
     & Firmware-radeon \
     & Firmware-ralink_a_mediatek_company_firmware \
     & Firmware-ralink-firmware \
+    & Firmware-rockchip \
     & Firmware-rtlwifi_firmware \
     & Firmware-imx-sdma_firmware \
     & Firmware-siano \
@@ -136,6 +137,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16 \
                     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
                     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
+                    file://LICENCE.rockchip;md5=5fd70190c5ed39734baceada8ecced26 \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                     file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
                     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
@@ -213,6 +215,7 @@ NO_GENERIC_LICENSE[Firmware-r8a779x_usb3] = "LICENCE.r8a779x_usb3"
 NO_GENERIC_LICENSE[Firmware-radeon] = "LICENSE.radeon"
 NO_GENERIC_LICENSE[Firmware-ralink_a_mediatek_company_firmware] = "LICENCE.ralink_a_mediatek_company_firmware"
 NO_GENERIC_LICENSE[Firmware-ralink-firmware] = "LICENCE.ralink-firmware.txt"
+NO_GENERIC_LICENSE[Firmware-rockchip] = "LICENCE.rockchip"
 NO_GENERIC_LICENSE[Firmware-rtlwifi_firmware] = "LICENCE.rtlwifi_firmware.txt"
 NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
 NO_GENERIC_LICENSE[Firmware-imx-sdma_firmware] = "LICENSE.sdma_firmware"
@@ -381,6 +384,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
+             ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-lt9611uxc ${PN}-lontium-license \
              ${PN}-whence-license \
@@ -1458,6 +1462,12 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenov
 
 FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
+# For Rockchip
+LICENSE:${PN}-rockchip-dptx = "Firmware-rockchip"
+FILES:${PN}-rockchip-license = "${nonarch_base_libdir}/firmware/LICENCE.rockchip"
+FILES:${PN}-rockchip-dptx = "${nonarch_base_libdir}/firmware/rockchip/dptx.bin"
+RDEPENDS:${PN}-rockchip-dptx = "${PN}-rockchip-license"
+
 # For Amlogic VDEC
 LICENSE:${PN}-amlogic-vdec = "Firmware-amlogic_vdec"
 FILES:${PN}-amlogic-vdec-license = "${nonarch_base_libdir}/firmware/LICENSE.amlogic_vdec"
-- 
2.43.0


