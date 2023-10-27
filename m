Return-Path: <fahad.arslan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FE0C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 14:18:56 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.8052.1698416330293686556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 07:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KFMBHIYZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: fahad.arslan@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54115c72f78so691738a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698416328; x=1699021128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/sRg5td+JSmQ5IskyNXukxEeKuVkopPPWY+yDlInoo=;
        b=KFMBHIYZ5TVthXonfErXGtrhigNUalDkVe3hazU8dojMMZSBisYoPC9vMcomVrRPOd
         Uy0xKWDHvlOrvn3vi9Lx/79tPMWC3prr6G0S2bTCfZaq/+P0kUdXsbF+0Bw8dJ5SfkcC
         ssv2XGZENnPBGt3o8LMAiLpYYGVrfL/X8Myuu6kn6qedJBlgczdhbdKH7iZI9miHu8bM
         APbOWpOqk/6pFNN3Hqk67zuNXHGS3Hu0kLwVlDdopfz9CAQ+NT46nYl1DbIb+vW3J/FW
         sQNXRFCzETzKWFWmuMneRbRmqLCCYxOreIppl4Oqz99+EF7PGjjp3ufOBgmFFIrGeJvv
         Z2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698416328; x=1699021128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/sRg5td+JSmQ5IskyNXukxEeKuVkopPPWY+yDlInoo=;
        b=XSbO/j1lNPa2qQ+J5WLQxjZmTbIfY7aBMplT6kmOVsFMf19fRHvx9HRN5INOLTxUYf
         i9YGqXDW5wg3x1qNxy/CWobqDZG8Rqvs6W9jtBiAPHIgOZ2OmMwfHdTg7XVw6+2wDaHT
         96f2ZR0KSvFVzBn5GjjZYlM+E8HpOVRsYAzPZAbJ26hA+e8lIsQsyjy1oapEQwrpQd5o
         aCP8WD6viKu6nK0pVQVYA9b3cOQ/NjNVosUd8sKREKxQM2WpyIj27SHkGgVDYNzj6daw
         2W50ASgz82nPYvEgRi4vKsYd1W95LF7qgZTfjbSPxPsileND8ML8wnNmG9DKcU+x2q9n
         3row==
X-Gm-Message-State: AOJu0Yzh2xZoOl75JlnbSr3x0Mc0RddBUEiflfv3Q/Tb3ovGjYfkrT/c
	tfxwVUl53lCPXwQoFEJHgxfIRK83Fzo7lQ==
X-Google-Smtp-Source: AGHT+IGwHgIqYcL0f7S5CODcuRbuHma4DCYOasq5UAeuEC1lFtTxccL5jQEA6kf0ul/OFXSnnWiW/g==
X-Received: by 2002:a05:6402:f02:b0:542:2fb:aac5 with SMTP id i2-20020a0564020f0200b0054202fbaac5mr2493262eda.4.1698416327809;
        Fri, 27 Oct 2023 07:18:47 -0700 (PDT)
Received: from localhost.localdomain ([39.48.43.13])
        by smtp.gmail.com with ESMTPSA id x13-20020a50ba8d000000b0054018a76825sm1312626ede.8.2023.10.27.07.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 07:18:47 -0700 (PDT)
From: Fahad Arslan <fahad.arslan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fahad Arslan <fahad.arslan@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/2] linux-firmware: create separate package for cirrus and cnm firmwares
Date: Fri, 27 Oct 2023 19:17:47 +0500
Message-Id: <20231027141748.981427-1-fahad.arslan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 14:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189745

From: Fahad Arslan <fahad.arslan@siemens.com>

This is cherry-pick of commit 3ddddfc14f805fe7572bba129605869fb848fed4 from
poky master.

Some licenses only allow usage of corresponding firmwares when a specific
hardware is present. This requires split of such firmwares from linux-firmware
package to firmware specific sub package. As this split is based off of
licensing, it makes sense to group firmware blobs having the same license in the
same package. This commit is a first step in this direction, and creates
separate packages for cirrus and cnm firmware.

(From OE-Core rev: 53d9d8789efc701609a5a1e985287344c2209d62)

Signed-off-by: Fahad Arslan <fahad.arslan@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../linux-firmware/linux-firmware_20230804.bb | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 4defab434d..d87f30b8d9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -18,6 +18,8 @@ LICENSE = "\
     & Firmware-ca0132 \
     & Firmware-cavium \
     & Firmware-chelsio_firmware \
+    & Firmware-cirrus \
+    & Firmware-cnm \
     & Firmware-cw1200 \
     & Firmware-cypress \
     & Firmware-dib0700 \
@@ -81,6 +83,8 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
                     file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
                     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
+                    file://LICENSE.cirrus;md5=bb18d943382abf8e8232a9407bfdafe0 \
+                    file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0 \
                     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
@@ -151,6 +155,8 @@ NO_GENERIC_LICENSE[Firmware-ca0132] = "LICENCE.ca0132"
 NO_GENERIC_LICENSE[Firmware-cadence] = "LICENCE.cadence"
 NO_GENERIC_LICENSE[Firmware-cavium] = "LICENCE.cavium"
 NO_GENERIC_LICENSE[Firmware-chelsio_firmware] = "LICENCE.chelsio_firmware"
+NO_GENERIC_LICENSE[Firmware-cirrus] = "LICENSE.cirrus"
+NO_GENERIC_LICENSE[Firmware-cnm] = "LICENCE.cnm"
 NO_GENERIC_LICENSE[Firmware-cw1200] = "LICENCE.cw1200"
 NO_GENERIC_LICENSE[Firmware-cypress] = "LICENCE.cypress"
 NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
@@ -277,6 +283,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm4373 \
              ${PN}-bcm43xx \
              ${PN}-bcm43xx-hdr \
+             ${PN}-cirrus-license ${PN}-cirrus \
+             ${PN}-cnm-license ${PN}-cnm \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-gplv2-license ${PN}-carl9170 \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
@@ -826,6 +834,24 @@ FILES:${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
 
 RDEPENDS:${PN}-bnx2-mips += "${PN}-whence-license"
 
+# For cirrus
+LICENSE:${PN}-cirrus = "Firmware-cirrus"
+LICENSE:${PN}-cirrus-license = "Firmware-cirrus"
+
+FILES:${PN}-cirrus = "${nonarch_base_libdir}/firmware/cirrus/*"
+FILES:${PN}-cirrus-license = "${nonarch_base_libdir}/firmware/LICENSE.cirrus"
+
+RDEPENDS:${PN}-cirrus += "${PN}-cirrus-license"
+
+# For cnm
+LICENSE:${PN}-cnm = "Firmware-cnm"
+LICENSE:${PN}-cnm-license = "Firmware-cnm"
+
+FILES:${PN}-cnm = "${nonarch_base_libdir}/firmware/cnm/wave521c_k3_codec_fw.bin"
+FILES:${PN}-cnm-license = "${nonarch_base_libdir}/firmware/LICENCE.cnm"
+
+RDEPENDS:${PN}-cnm += "${PN}-cnm-license"
+
 # For imx-sdma
 LICENSE:${PN}-imx-sdma-imx6q       = "Firmware-imx-sdma_firmware"
 LICENSE:${PN}-imx-sdma-imx7d       = "Firmware-imx-sdma_firmware"
@@ -1111,6 +1137,8 @@ LICENSE:${PN} = "\
     & Firmware-ca0132 \
     & Firmware-cavium \
     & Firmware-chelsio_firmware \
+    & Firmware-cirrus \
+    & Firmware-cnm \
     & Firmware-cw1200 \
     & Firmware-dib0700 \
     & Firmware-e100 \
-- 
2.25.1


