Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C6AE748F6
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:45 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.62152.1696176042637342570
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RqOIE6w0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c364fb8a4cso142607775ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176042; x=1696780842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0l1JoFz7GU2UC59oKyrpeicIRe8iMiDDlto5v7eO8Mk=;
        b=RqOIE6w0gMMpRPnCBOA6gj0kwhhwtcbMCpBM5H04RHs1NV/1wfx2DBx7IZcs+x4aK6
         e/sipIMsBYI+7kapqO6CeBhIBfDm7d2Pluw2mawa1b7O2HzKSZJyJ/Y46InmERjPfpSl
         kEqU/FfDjgHTJevxbVmjwN/z1JijYAzzfPwuZxXO6hK+mQQVz28+30/Er8aS79b2+6ef
         TyF5YSVwS2t93D1EXyRdstj+PFHGMpNa4D2EvHRkO5EKaSRh2gA0sQ98Zl+BmTlkT8p8
         vB2n/G2IMqnmU8UmJz6LmPwMSichsphhW3/cS7dZe6HAeYNXRGh0uQavYYj09hoDWseu
         TU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176042; x=1696780842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0l1JoFz7GU2UC59oKyrpeicIRe8iMiDDlto5v7eO8Mk=;
        b=e00rkEhqGIPKIt2GlzzGswM9u2K/ON2AcQdIAOHxMyG59fqSHRH1OepXkdHSreKHRn
         uoCk1wK73Zj146glvrwgV3BU13UaZa4EL9rcicbXTvl9dD/+CXAJuhLEMXfysyVwGM9H
         wXgwZl8rLfKv+pKyEgfCdOwV+lY1zAN1Ow9HgfK+ruwm7iYZ8YQPPQoKQW2z9dmMog4o
         Ndk58F1gCcSQIFSPeBcXSEq58LeCf6Et3dd4XfogCziY39HOoobXg1I0fY9lOOCz37qN
         ksg3a8Z8mt5+pK5CkLxlv4cFXEGEdEIRF23TEbx8xDEtgxhlwuGgrlUppxEQiLy9FkGR
         5fhg==
X-Gm-Message-State: AOJu0YzTXFEF7tq1KxNaBcnZ1zmy/xx0PMqsXBxi4TT0DpT2iHL0nJaJ
	Uo2sEfO11I20HkI3TJ4quEwvRfFxPp3n99IjdbHFQg==
X-Google-Smtp-Source: AGHT+IGX2JZ/0tkZLsNB7zLvPPTRrmPAd1ny79GuTpg+KyUlJr8Zxb6zfn9QuRifMROamI+S2vKP4g==
X-Received: by 2002:a17:903:22d2:b0:1c7:245a:7fea with SMTP id y18-20020a17090322d200b001c7245a7feamr12909973plg.58.1696176041606;
        Sun, 01 Oct 2023 09:00:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/23] linux-firmware: add firmware files for NXP BT chipsets
Date: Sun,  1 Oct 2023 06:00:00 -1000
Message-Id: <d9b6e764f0dc2f68c79026ffff8d883ecee47a88.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188502

From: Tom Hochstein <tom.hochstein@nxp.com>

These BT only firmware files are submitted for NXP chips.

88w8997-bt:
uartuart8997_bt_v4.bin version: 16.92.21.p81
helper_uart_3000000.bin version: 16.92.21.p81

88w8987-bt:
uartuart8987_bt.bin version: 16.92.21.p76.5

88w9098-bt:
uartuart9098_bt_v1.bin version: 17.92.1.p136.24

iw416-bt:
uartiw416_bt_v0.bin version: 16.92.21.p81

iw611-bt / iw612-bt:
uartspi_n61x_v1.bin.se version: 18.99.1.p154.40

These firmware files are downloaded over UART interface. The
helper_uart_3000000.bin needs to be downloaded before
uartuart8997_bt_v4.bin for 88w8997 chip to set download baudrate
to 3000000.

The above commit message is copied from the source commit message:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/nxp?id=1f82dd25c3ea59b6bed80ee685d860f0c5f19875

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a6cf0b53346262872dd82a55d69a93a8d2e2cce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230804.bb | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index d761673db3..ee14630ce0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -41,6 +41,7 @@ LICENSE = "\
     & Firmware-myri10ge_firmware \
     & Firmware-netronome \
     & Firmware-nvidia \
+    & Firmware-nxp \
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
@@ -107,6 +108,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
                     file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
                     file://LICENCE.NXP;md5=58bb8ba632cd729b9ba6183bc6aed36f \
+                    file://LICENSE.nxp;md5=cca321ca1524d6a1e4fed87486cd82dc \
                     file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
                     file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
                     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
@@ -177,6 +179,7 @@ NO_GENERIC_LICENSE[Firmware-moxa] = "LICENCE.moxa"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] = "LICENCE.myri10ge_firmware"
 NO_GENERIC_LICENSE[Firmware-netronome] = "LICENCE.Netronome"
 NO_GENERIC_LICENSE[Firmware-nvidia] = "LICENCE.nvidia"
+NO_GENERIC_LICENSE[Firmware-nxp] = "LICENSE.nxp"
 NO_GENERIC_LICENSE[Firmware-OLPC] = "LICENCE.OLPC"
 NO_GENERIC_LICENSE[Firmware-ath9k-htc] = "LICENCE.open-ath9k-htc-firmware"
 NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
@@ -312,6 +315,16 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
              ${PN}-nvidia-gpu \
+             ${PN}-nxp-license \
+             ${PN}-nxp8987-sdio \
+             ${PN}-nxp8997-common \
+             ${PN}-nxp8997-pcie \
+             ${PN}-nxp8997-sdio \
+             ${PN}-nxp9098-common \
+             ${PN}-nxp9098-pcie \
+             ${PN}-nxp9098-sdio \
+             ${PN}-nxpiw416-sdio \
+             ${PN}-nxpiw612-sdio \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
@@ -547,6 +560,42 @@ FILES:${PN}-netronome = " \
 
 RDEPENDS:${PN}-netronome += "${PN}-netronome-license"
 
+# For NXP
+LICENSE:${PN}-nxp8987-sdio = "Firmware-nxp"
+LICENSE:${PN}-nxp8997-common = "Firmware-nxp"
+LICENSE:${PN}-nxp8997-pcie = "Firmware-nxp"
+LICENSE:${PN}-nxp8997-sdio = "Firmware-nxp"
+LICENSE:${PN}-nxp9098-common = "Firmware-nxp"
+LICENSE:${PN}-nxp9098-pcie = "Firmware-nxp"
+LICENSE:${PN}-nxp9098-sdio = "Firmware-nxp"
+LICENSE:${PN}-nxpiw416-sdio = "Firmware-nxp"
+LICENSE:${PN}-nxpiw612-sdio = "Firmware-nxp"
+LICENSE:${PN}-nxp-license = "Firmware-nxp"
+
+FILES:${PN}-nxp8987-sdio = "${nonarch_base_libdir}/firmware/nxp/*8987*"
+FILES:${PN}-nxp8997-common = " \
+    ${nonarch_base_libdir}/firmware/nxp/uartuart8997_bt_v4.bin \
+    ${nonarch_base_libdir}/firmware/nxp/helper_uart_3000000.bin \
+"
+ALLOW_EMPTY:${PN}-nxp8997-pcie = "1"
+ALLOW_EMPTY:${PN}-nxp8997-sdio = "1"
+FILES:${PN}-nxp9098-common = "${nonarch_base_libdir}/firmware/nxp/uartuart9098_bt_v1.bin"
+ALLOW_EMPTY:${PN}-nxp9098-pcie = "1"
+ALLOW_EMPTY:${PN}-nxp9098-sdio = "1"
+FILES:${PN}-nxpiw416-sdio = "${nonarch_base_libdir}/firmware/nxp/*iw416*"
+FILES:${PN}-nxpiw612-sdio = "${nonarch_base_libdir}/firmware/nxp/uartspi_n61x_v1.bin.se"
+FILES:${PN}-nxp-license = "${nonarch_base_libdir}/firmware/LICENSE.nxp"
+
+RDEPENDS:${PN}-nxp8987-sdio += "${PN}-nxp-license"
+RDEPENDS:${PN}-nxp8997-common += "${PN}-nxp-license"
+RDEPENDS:${PN}-nxp8997-pcie += "${PN}-nxp8997-common"
+RDEPENDS:${PN}-nxp8997-sdio += "${PN}-nxp8997-common"
+RDEPENDS:${PN}-nxp9098-common += "${PN}-nxp-license"
+RDEPENDS:${PN}-nxp9098-pcie += "${PN}-nxp9098-common"
+RDEPENDS:${PN}-nxp9098-sdio += "${PN}-nxp9098-common"
+RDEPENDS:${PN}-nxpiw416-sdio += "${PN}-nxp-license"
+RDEPENDS:${PN}-nxpiw612-sdio += "${PN}-nxp-license"
+
 # For Nvidia
 LICENSE:${PN}-nvidia-gpu = "Firmware-nvidia"
 LICENSE:${PN}-nvidia-tegra = "Firmware-nvidia"
@@ -1132,6 +1181,7 @@ LICENSE:${PN} = "\
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
     & Firmware-nvidia \
+    & Firmware-nxp \
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
-- 
2.34.1


