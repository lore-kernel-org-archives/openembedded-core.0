Return-Path: <fahad.arslan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066B0E93700
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 10:30:27 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.12134.1696501818446352343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 03:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=krCxD/4x;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: fahad.arslan@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53636bc91a8so255242a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 03:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696501816; x=1697106616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FxGAYdgi+EUgkqtv+naT8rO3jnSewZEU79z6cAceWAs=;
        b=krCxD/4xPbaLsz918fB1CSJnUcESF6VS9XIu/ZEY9wOA0Uw+/TvDUDxdGrroy4eKGj
         x2v+PJ5KEpCFxCY7yQYb1hLzqFFVAyHb/AAFCVAAe230FAt4Sk7w4oBgZ2tuiHLUuuH4
         FTP0NThVB3SC4Ssuiw+/CkF+JQpQVHn/VH20IGqTJ/SHNB8xlVnMAfWw3H67dzhAruta
         im+qwYan+3zHj57P2EblDBDjRzOsoN1FbCpkqc3P5YQsnGTF1aBEIoinST4GCSlvsK7V
         ZH2QUraC4EmTC7jy2GcWYbR4yMmg9WaMDIGHGhlGiytDMh9Gwk2YrcDJX+BkZ9iWdJhh
         V6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696501816; x=1697106616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxGAYdgi+EUgkqtv+naT8rO3jnSewZEU79z6cAceWAs=;
        b=E+4o7DADChfDDG0eaFsYaLyLX+C/9E3B2mOYyRFvGfI3ju+69XMfWMwl1GdGpqXIyR
         1MbEHZTVZAtJ9U8KnfRvci9MwUaJqGBsHw6II70SF7AS83BI9A3YjLrzsyQgWEihxUMJ
         /9J5K6RU71LVa6UTf8S7UwBP+vL9ReyYJryNHPXYZyt09I1hJfRJi0B69vyfmRdio8Tm
         VQxI1FaRtn8bDU/fKlefBwQaazWrr7/U0M/lY1/m7rxKrYCcgO0NTCI32EB3rzLnM1ya
         v5j3W4Hpq3A7spiqO7TO7eOZGRVa7j6xE7teWbaRDBLHfyB0v0HuLDIzLf8Cgrfb6uqH
         GLFw==
X-Gm-Message-State: AOJu0Yx5KoKk74kDt8Cn0DuSfphxRjjcrc+4KdT83WoYCIMshpaNmhzO
	T1oyYXOf2Fv9Ywnj3pjp4IFOZd948V6BgQ==
X-Google-Smtp-Source: AGHT+IGCCZyIHZ7JqKqqDNYfluwDsL2avJwStysfUatpOrHJLXIgOWM7d40omzVUGrPganvO7vHA7g==
X-Received: by 2002:a17:906:100c:b0:99c:5711:3187 with SMTP id 12-20020a170906100c00b0099c57113187mr3530063ejm.6.1696501816044;
        Thu, 05 Oct 2023 03:30:16 -0700 (PDT)
Received: from localhost.localdomain ([39.48.43.13])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709061b4b00b0097404f4a124sm971829ejg.2.2023.10.05.03.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 03:30:15 -0700 (PDT)
From: Fahad Arslan <fahad.arslan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: fahad.arslan@siemens.com
Subject: [PATCH] linux-firmware: create separate package for cirrus and cnm firmwares
Date: Thu,  5 Oct 2023 15:29:14 +0500
Message-Id: <20231005102914.1319276-1-fahad.arslan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 10:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188714

From: Fahad Arslan <fahad.arslan@siemens.com>

Some licenses only allow usage of corresponding firmwares when a specific
hardware is present. This requires split of such firmwares from linux-firmware
package to firmware specific sub package. As this split is based off of
licensing, it makes sense to group firmware blobs having the same license in the
same package. This commit is a first step in this direction, and creates
separate packages for cirrus and cnm firmware.

Signed-off-by: Fahad Arslan <fahad.arslan@siemens.com>
---
 .../linux-firmware/linux-firmware_20230804.bb | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index ee14630ce0..1dbe8374bc 100644
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
@@ -83,6 +85,8 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
                     file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
                     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
+                    file://LICENSE.cirrus;md5=bb18d943382abf8e8232a9407bfdafe0 \
+                    file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0 \
                     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
@@ -155,6 +159,8 @@ NO_GENERIC_LICENSE[Firmware-ca0132] = "LICENCE.ca0132"
 NO_GENERIC_LICENSE[Firmware-cadence] = "LICENCE.cadence"
 NO_GENERIC_LICENSE[Firmware-cavium] = "LICENCE.cavium"
 NO_GENERIC_LICENSE[Firmware-chelsio_firmware] = "LICENCE.chelsio_firmware"
+NO_GENERIC_LICENSE[Firmware-cirrus] = "LICENSE.cirrus"
+NO_GENERIC_LICENSE[Firmware-cnm] = "LICENCE.cnm"
 NO_GENERIC_LICENSE[Firmware-cw1200] = "LICENCE.cw1200"
 NO_GENERIC_LICENSE[Firmware-cypress] = "LICENCE.cypress"
 NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
@@ -283,6 +289,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm4373 \
              ${PN}-bcm43xx \
              ${PN}-bcm43xx-hdr \
+             ${PN}-cirrus-license ${PN}-cirrus \
+             ${PN}-cnm-license ${PN}-cnm \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-gplv2-license ${PN}-carl9170 \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
@@ -879,6 +887,24 @@ FILES:${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
 
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
@@ -1167,6 +1193,8 @@ LICENSE:${PN} = "\
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


