Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91F3C4167D
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 02:21:28 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.140931.1698632482841161142
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 19:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sblsvaM/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6bd73395bceso2761118b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 19:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698632482; x=1699237282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08SEeGZfUzbhRA1HHm2Fxax6UvhIDfunszIJZa7foe0=;
        b=sblsvaM/WHeFoKwM8e3BB3OgCZe8pmeOgUqrHx7s3f12p5KIrAYg+Iz8qztWDkz4Mc
         Oluff0xIt4DlAB3frPBfZvoVJTyJEfnBCAN6BnBBFcpOZlDvBe+ooaHQuvlyMiOJeb+W
         RX1R6nX2eSvBW5avZyESCxmorRiBNsIr3IW1HZghuJ3yNidQt6YcgQ+bjWHe1B9aAW77
         NwL7RraQX9vEP2i4NO0yJUbonIURS1g7a5zUrohA0oWF9KLS7cwvCRN1PuZTX/imOlOr
         4wIXuLh4ctGrgFRPJesMdrb4VRJ6iLMWfhwcoqei+ZIKIyyRn00AlPySucX/Y0R2dCHZ
         aJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698632482; x=1699237282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08SEeGZfUzbhRA1HHm2Fxax6UvhIDfunszIJZa7foe0=;
        b=gIsexSoStBXvfy0usPEX1jKJvl5R95mHsID7BzeycJsqr5Vr1DAfHPyNGgIj9EOpow
         JAUlz2K4bQ3oAXJkaS7XZjE6ryId3LtLPx1PCR9Rm6krlm4J8tI8/w6eS3+4oS+W8BcQ
         l7fHtdCHban1PKNcjeKKfMF5N34DD/J18JbDHDj7ZlMd+67EUQvW4y5dH+PXgQa5a7LF
         dq3UcWiSxyFSvly2RBSXcCnLjLCIgideBRlKyDYFfuQlWTqaCwrlW1u4rPp2hBavnJvb
         0uPNNRJTyqiNl2HpByOGUswcbQ2vNY274JFeWZSbg6cmOJXFvNN2wMcJehD3itBbs3/O
         x/2Q==
X-Gm-Message-State: AOJu0YxokJJS4azYodWldH/q2JV0s30EjHpG/7Yb8JNNQMf9Gld5ylzB
	LDg1n5A+3KtI9MU9t0BiGifPW5rMPluWiNJ9gTQTbg==
X-Google-Smtp-Source: AGHT+IFE0xsSB1IL+YDKuMwF2qMRQz01r+z2yLGEHSt4UY8QcQOkklqfzoASmCHENabD3CD/b1WwBg==
X-Received: by 2002:a05:6a00:230d:b0:68c:44ed:fb6 with SMTP id h13-20020a056a00230d00b0068c44ed0fb6mr12193175pfh.16.1698632481865;
        Sun, 29 Oct 2023 19:21:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k2-20020a637b42000000b0057412d84d25sm3900046pgn.4.2023.10.29.19.21.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 19:21:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] linux-firmware: create separate package for cirrus and cnm firmwares
Date: Sun, 29 Oct 2023 16:20:57 -1000
Message-Id: <9b556e63ba3e89e83ba6e2647656a1fa6def87a4.1698632320.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698632320.git.steve@sakoman.com>
References: <cover.1698632320.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 02:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189786

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


