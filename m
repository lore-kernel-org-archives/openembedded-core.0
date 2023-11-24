Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC63C636CB
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:31:57 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.134525.1700829115177634602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ycEXtkhb;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c88b7e69dfso22729241fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829113; x=1701433913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ec0g3dxqEsMB491AFNkLCKAQUsbT/As5MzSdPohWnJs=;
        b=ycEXtkhblm2TJMcZtTtqngWiVLe5m/5rGQduZSDwL6ATfZp4Fk1rDBCObtcjQZtQAT
         l2bSHppHoj0LV9U+QXc3m/YLjuhswEqaVKRtUBKf2Hjrq1wope324tr/Xx+VXK0MlYmk
         ji447Pa6QpUI3yBAYqS/gf8+ifjBtWo3LBE1zSSTJphOPIInr+RSeF2aO0QghX2sitNl
         HleZtvks/4JMWQTt+EIDIgJlPNZfqR+n1Kh0SzmrXmHwF8hB7n6/SKa+WqSkhaAZFHVm
         4nFT92YqAM4TAKoaq0ZI+vrwtwFVQ+QKOJjcufJ6OPzkBpWb9VptBispcUOjCgE9RAhg
         JuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829113; x=1701433913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ec0g3dxqEsMB491AFNkLCKAQUsbT/As5MzSdPohWnJs=;
        b=EDwxNDG0oiRJBcFQgYNWuFK9/rXDHUm9lBV/kDMTMzTo/fGMx68BxJjirzBqfjgIQU
         YBhJsHdlB+dQbQ1AflVfmVqCMzqGMWLQmJKKYGV9/KPtqPPYFhHOrkGlzXd7r3mGC9mm
         Zo1YDYp0rkVdQ6XrR37jMXecIlyzpHEHwWszEgy9ld4H1Dzx4FkUQaEwuJecsmWMwFcy
         nWyAkoscl2kdjh+4PldxNxkp5J8VbUobPUbvue5xIoUaqfIhvYbRR2wxqGDGlHYV4pdT
         E3VMZtjy7MnCY5dz3zDwSBDWuzrHUoyVKVWh/h9yeD3bJXVl97On6z8hRzJ8fXB7IOJH
         6tnw==
X-Gm-Message-State: AOJu0YxAeXvikMgu7KbSiREkR3Bpnl7emUSGAUmN/uUQajo9UZ4lA/MR
	uleBbF8PH9Ss/Kbzx0NEBW8bVu6yk3dI4aRArzg=
X-Google-Smtp-Source: AGHT+IG1YF1xYbBLCBa+wpKKcaXO/EnR9nZg4nzY4B3PMZwWw+UUVE5RbI6GmBtA393Yzh5pu5lTfg==
X-Received: by 2002:a2e:3e13:0:b0:2c6:f945:d95a with SMTP id l19-20020a2e3e13000000b002c6f945d95amr1714582lja.36.1700829113037;
        Fri, 24 Nov 2023 04:31:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Fahad Arslan <fahad.arslan@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [nanbield][PATCH 01/10] linux-firmware: create separate packages
Date: Fri, 24 Nov 2023 15:31:42 +0300
Message-Id: <20231124123151.1091665-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
References: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191184

From: Fahad Arslan <fahad.arslan@gmail.com>

This is in continuation of earlier commit:
3ddddfc14f805fe7572bba129605869fb848fed4
linux-firmware: create separate package for cirrus and cnm firmwares

And creates separate sub packages for firmwares corresponding to following list of
licenses:
LICENSE.amphion_vpu
LICENCE.cw1200
LICENSE.ice_enhanced
LICENCE.mediatek
LICENCE.microchip
LICENCE.moxa
LICENSE.nxp_mc_firmware
LICENCE.OLPC
LICENCE.phanfw
LICENCE.qla2xxx
LICENCE.ti-keystone
LICENCE.wl1251
LICENCE.xc4000
LICENCE.xc5000
LICENCE.xc5000c

Signed-off-by: Fahad Arslan <fahad.arslan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c110e5708465a6becc611acf97f166302a17ebdf)
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20230804.bb | 232 +++++++++++++++++-
 1 file changed, 228 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 1dbe8374bc5c..0e8005bfc90a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -12,6 +12,7 @@ LICENSE = "\
     & Firmware-amdgpu \
     & Firmware-amd-ucode \
     & Firmware-amlogic_vdec \
+    & Firmware-amphion_vpu \
     & Firmware-atheros_firmware \
     & Firmware-atmel \
     & Firmware-broadcom_bcm43xx \
@@ -32,6 +33,7 @@ LICENSE = "\
     & Firmware-i915 \
     & Firmware-ibt_firmware \
     & Firmware-ice \
+    & Firmware-ice_enhanced \
     & Firmware-it913x \
     & Firmware-iwlwifi_firmware \
     & Firmware-IntcSST2 \
@@ -39,11 +41,14 @@ LICENSE = "\
     & Firmware-linaro \
     & Firmware-Lontium \
     & Firmware-Marvell \
+    & Firmware-mediatek \
+    & Firmware-microchip \
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
     & Firmware-netronome \
     & Firmware-nvidia \
     & Firmware-nxp \
+    & Firmware-nxp_mc_firmware \
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
@@ -78,6 +83,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.amdgpu;md5=a2589a05ea5b6bd2b7f4f623c7e7a649 \
                     file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
+                    file://LICENSE.amphion_vpu;md5=2bcdc00527b2d0542bd92b52aaec2b60 \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
                     file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
@@ -99,6 +105,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
                     file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
                     file://LICENSE.ice;md5=742ab4850f2670792940e6d15c974b2f \
+                    file://LICENSE.ice_enhanced;md5=f305cfc31b64f95f774f9edd9df0224d \
                     file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
                     file://LICENCE.iwlwifi_firmware;md5=2ce6786e0fc11ac6e36b54bb9b799f1b \
@@ -107,12 +114,14 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
                     file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
+                    file://LICENCE.microchip;md5=db753b00305675dfbf120e3f24a47277 \
                     file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
                     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
                     file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
                     file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
                     file://LICENCE.NXP;md5=58bb8ba632cd729b9ba6183bc6aed36f \
                     file://LICENSE.nxp;md5=cca321ca1524d6a1e4fed87486cd82dc \
+                    file://LICENSE.nxp_mc_firmware;md5=9dc97e4b279b3858cae8879ae2fe5dd7 \
                     file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
                     file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
                     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
@@ -152,6 +161,7 @@ NO_GENERIC_LICENSE[Firmware-agere] = "LICENCE.agere"
 NO_GENERIC_LICENSE[Firmware-amdgpu] = "LICENSE.amdgpu"
 NO_GENERIC_LICENSE[Firmware-amd-ucode] = "LICENSE.amd-ucode"
 NO_GENERIC_LICENSE[Firmware-amlogic_vdec] = "LICENSE.amlogic_vdec"
+NO_GENERIC_LICENSE[Firmware-amphion_vpu] = "LICENSE.amphion_vpu"
 NO_GENERIC_LICENSE[Firmware-atheros_firmware] = "LICENCE.atheros_firmware"
 NO_GENERIC_LICENSE[Firmware-atmel] = "LICENSE.atmel"
 NO_GENERIC_LICENSE[Firmware-broadcom_bcm43xx] = "LICENCE.broadcom_bcm43xx"
@@ -173,6 +183,7 @@ NO_GENERIC_LICENSE[Firmware-hfi1_firmware] = "LICENSE.hfi1_firmware"
 NO_GENERIC_LICENSE[Firmware-i915] = "LICENSE.i915"
 NO_GENERIC_LICENSE[Firmware-ibt_firmware] = "LICENCE.ibt_firmware"
 NO_GENERIC_LICENSE[Firmware-ice] = "LICENSE.ice"
+NO_GENERIC_LICENSE[Firmware-ice_enhanced] = "LICENSE.ice_enhanced"
 NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
@@ -181,11 +192,13 @@ NO_GENERIC_LICENSE[Firmware-linaro] = "LICENCE.linaro"
 NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
 NO_GENERIC_LICENSE[Firmware-mediatek] = "LICENCE.mediatek"
+NO_GENERIC_LICENSE[Firmware-microchip] = "LICENCE.microchip"
 NO_GENERIC_LICENSE[Firmware-moxa] = "LICENCE.moxa"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] = "LICENCE.myri10ge_firmware"
 NO_GENERIC_LICENSE[Firmware-netronome] = "LICENCE.Netronome"
 NO_GENERIC_LICENSE[Firmware-nvidia] = "LICENCE.nvidia"
 NO_GENERIC_LICENSE[Firmware-nxp] = "LICENSE.nxp"
+NO_GENERIC_LICENSE[Firmware-nxp_mc_firmware] = "LICENSE.nxp_mc_firmware"
 NO_GENERIC_LICENSE[Firmware-OLPC] = "LICENCE.OLPC"
 NO_GENERIC_LICENSE[Firmware-ath9k-htc] = "LICENCE.open-ath9k-htc-firmware"
 NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
@@ -240,14 +253,22 @@ do_install() {
 }
 
 
-PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
+PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
+             ${PN}-cw1200-license ${PN}-cw1200 \
+             ${PN}-ralink-license ${PN}-ralink \
              ${PN}-mt7601u-license ${PN}-mt7601u \
+             ${PN}-mt7650-license ${PN}-mt7650 \
+             ${PN}-mt76x2-license ${PN}-mt76x2 \
              ${PN}-radeon-license ${PN}-radeon \
              ${PN}-amdgpu-license ${PN}-amdgpu \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
+             ${PN}-mediatek-license ${PN}-mediatek \
+             ${PN}-microchip-license ${PN}-microchip \
+             ${PN}-moxa-license ${PN}-moxa \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
              ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx ${PN}-wl18xx \
+             ${PN}-ti-keystone-license ${PN}-ti-keystone \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rs9113 ${PN}-rs9116 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
@@ -291,7 +312,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm43xx-hdr \
              ${PN}-cirrus-license ${PN}-cirrus \
              ${PN}-cnm-license ${PN}-cnm \
-             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
+             ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-gplv2-license ${PN}-carl9170 \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
              \
@@ -317,6 +338,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-ibt-misc \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-ice-license ${PN}-ice \
+             ${PN}-ice-enhanced-license ${PN}-ice-enhanced \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
              ${PN}-liquidio \
@@ -333,7 +355,10 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-nxp9098-sdio \
              ${PN}-nxpiw416-sdio \
              ${PN}-nxpiw612-sdio \
+             ${PN}-nxp-mc-license ${PN}-nxp-mc \
              ${PN}-netronome-license ${PN}-netronome \
+             ${PN}-olpc-license ${PN}-olpc \
+             ${PN}-phanfw-license ${PN}-phanfw \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
@@ -350,13 +375,38 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
+             ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-lt9611uxc ${PN}-lontium-license \
              ${PN}-whence-license \
+             ${PN}-wl1251-license ${PN}-wl1251 \
+             ${PN}-xc4000-license ${PN}-xc4000 \
+             ${PN}-xc5000-license ${PN}-xc5000 \
+             ${PN}-xc5000c-license ${PN}-xc5000c \
              ${PN}-license \
              "
 
+# For Amphion VPU
+LICENSE:${PN}-amphion-vpu = "Firmware-amphion_vpu"
+LICENSE:${PN}-amphion-vpu-license = "Firmware-amphion_vpu"
+
+FILES:${PN}-amphion-vpu = "${nonarch_base_libdir}/firmware/amphion/*"
+FILES:${PN}-amphion-vpu-license = " \
+  ${nonarch_base_libdir}/firmware/LICENSE.amphion_vpu \
+"
+RDEPENDS:${PN}-amphion-vpu += "${PN}-amphion-vpu-license"
+
+# For cw1200
+LICENSE:${PN}-cw1200 = "Firmware-cw1200"
+LICENSE:${PN}-cw1200-license = "Firmware-cw1200"
+
+FILES:${PN}-cw1200 = "${nonarch_base_libdir}/firmware/wsm_22.bin"
+FILES:${PN}-cw1200-license = "${nonarch_base_libdir}/firmware/LICENCE.cw1200"
+
+RDEPENDS:${PN}-cw1200 += "${PN}-cw1200-license"
+
 # For atheros
+LICENSE:${PN}-ar5523 = "Firmware-atheros_firmware"
 LICENSE:${PN}-ar9170 = "Firmware-atheros_firmware"
 LICENSE:${PN}-ath3k = "Firmware-atheros_firmware"
 LICENSE:${PN}-ath6k = "Firmware-atheros_firmware"
@@ -364,6 +414,9 @@ LICENSE:${PN}-ath9k = "Firmware-atheros_firmware"
 LICENSE:${PN}-atheros-license = "Firmware-atheros_firmware"
 
 FILES:${PN}-atheros-license = "${nonarch_base_libdir}/firmware/LICENCE.atheros_firmware"
+FILES:${PN}-ar5523 = " \
+  ${nonarch_base_libdir}/firmware/ar5523.bin \
+"
 FILES:${PN}-ar9170 = " \
   ${nonarch_base_libdir}/firmware/ar9170*.fw \
 "
@@ -382,6 +435,7 @@ FILES:${PN}-ath9k = " \
   ${nonarch_base_libdir}/firmware/ath9k_htc/htc_9271-1.4.0.fw \
 "
 
+RDEPENDS:${PN}-ar5523 += "${PN}-atheros-license"
 RDEPENDS:${PN}-ar9170 += "${PN}-atheros-license"
 RDEPENDS:${PN}-ath6k += "${PN}-atheros-license"
 RDEPENDS:${PN}-ath9k += "${PN}-atheros-license"
@@ -445,11 +499,73 @@ LICENSE:${PN}-mt7601u-license = "Firmware-ralink_a_mediatek_company_firmware"
 FILES:${PN}-mt7601u-license = "${nonarch_base_libdir}/firmware/LICENCE.ralink_a_mediatek_company_firmware"
 FILES:${PN}-mt7601u = " \
   ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin \
+  ${nonarch_base_libdir}/firmware/mt7601u.bin \
 "
-
 RDEPENDS:${PN}-mt7601u += "${PN}-mt7601u-license"
 
+# For MediaTek Bluetooth USB driver 7650
+LICENSE:${PN}-mt7650 = "Firmware-ralink_a_mediatek_company_firmware"
+LICENSE:${PN}-mt7650-license = "Firmware-ralink_a_mediatek_company_firmware"
+
+FILES:${PN}-mt7650-license = " \
+  ${nonarch_base_libdir}/firmware/LICENCE.ralink_a_mediatek_company_firmware \
+"
+FILES:${PN}-mt7650 = " \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7650.bin \
+  ${nonarch_base_libdir}/firmware/mt7650.bin \
+"
+RDEPENDS:${PN}-mt7650 += "${PN}-mt7650-license"
+
+# For MediaTek MT76x2 Wireless MACs
+LICENSE:${PN}-mt76x2 = "Firmware-ralink_a_mediatek_company_firmware"
+LICENSE:${PN}-mt76x2-license = "Firmware-ralink_a_mediatek_company_firmware"
+
+FILES:${PN}-mt76x2-license = " \
+  ${nonarch_base_libdir}/firmware/LICENCE.ralink_a_mediatek_company_firmware \
+"
+FILES:${PN}-mt76x2 = " \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7662.bin \
+  ${nonarch_base_libdir}/firmware/mt7662.bin \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7662_rom_patch.bin \
+  ${nonarch_base_libdir}/firmware/mt7662_rom_patch.bin \
+"
+RDEPENDS:${PN}-mt76x2 += "${PN}-mt76x2-license"
+
+# For MediaTek
+LICENSE:${PN}-mediatek = "Firmware-mediatek"
+LICENSE:${PN}-mediatek-license = "Firmware-mediatek"
+
+FILES:${PN}-mediatek = " \
+  ${nonarch_base_libdir}/firmware/mediatek/* \
+  ${nonarch_base_libdir}/firmware/vpu_d.bin \
+  ${nonarch_base_libdir}/firmware/vpu_p.bin \
+"
+FILES:${PN}-mediatek-license = " \
+  ${nonarch_base_libdir}/firmware/LICENCE.mediatek \
+"
+RDEPENDS:${PN}-mediatek += "${PN}-mediatek-license"
+
+# For Microchip
+LICENSE:${PN}-microchip = "Firmware-microchip"
+LICENSE:${PN}-microchip-license = "Firmware-microchip"
+
+FILES:${PN}-microchip = "${nonarch_base_libdir}/firmware/microchip/*"
+FILES:${PN}-microchip-license = " \
+  ${nonarch_base_libdir}/firmware/LICENCE.microchip \
+"
+RDEPENDS:${PN}-microchip += "${PN}-microchip-license"
+
+# For MOXA
+LICENSE:${PN}-moxa = "Firmware-moxa"
+LICENSE:${PN}-moxa-license = "Firmware-moxa"
+
+FILES:${PN}-moxa = "${nonarch_base_libdir}/firmware/moxa"
+FILES:${PN}-moxa-license = "${nonarch_base_libdir}/firmware/LICENCE.moxa"
+
+RDEPENDS:${PN}-moxa += "${PN}-moxa-license"
+
 # For radeon
+
 LICENSE:${PN}-radeon = "Firmware-radeon"
 LICENSE:${PN}-radeon-license = "Firmware-radeon"
 
@@ -604,6 +720,16 @@ RDEPENDS:${PN}-nxp9098-sdio += "${PN}-nxp9098-common"
 RDEPENDS:${PN}-nxpiw416-sdio += "${PN}-nxp-license"
 RDEPENDS:${PN}-nxpiw612-sdio += "${PN}-nxp-license"
 
+# For nxp-mc
+LICENSE:${PN}-nxp-mc = "Firmware-nxp_mc_firmware"
+LICENSE:${PN}-nxp-mc-license = "Firmware-nxp_mc_firmware"
+
+FILES:${PN}-nxp-mc= "${nonarch_base_libdir}/firmware/dpaa2/mc/*"
+FILES:${PN}-nxp-mc-license = " \
+  ${nonarch_base_libdir}/firmware/LICENSE.nxp_mc_firmware \
+"
+RDEPENDS:${PN}-nxp-mc += "${PN}-nxp-mc-license"
+
 # For Nvidia
 LICENSE:${PN}-nvidia-gpu = "Firmware-nvidia"
 LICENSE:${PN}-nvidia-tegra = "Firmware-nvidia"
@@ -626,6 +752,37 @@ RDEPENDS:${PN}-nvidia-gpu += "${PN}-nvidia-license"
 RDEPENDS:${PN}-nvidia-tegra += "${PN}-nvidia-license"
 RDEPENDS:${PN}-nvidia-tegra-k1 += "${PN}-nvidia-license"
 
+# For OLPC
+LICENSE:${PN}-olpc = "Firmware-OLPC"
+LICENSE:${PN}-olpc-license = "Firmware-OLPC"
+
+FILES:${PN}-olpc = " \
+  ${nonarch_base_libdir}/firmware/libertas/lbtf_sdio.bin	\
+  ${nonarch_base_libdir}/firmware/lbtf_usb.bin			\
+  ${nonarch_base_libdir}/firmware/libertas/usb8388_olpc.bin	\
+"
+FILES:${PN}-olpc-license = "${nonarch_base_libdir}/firmware/LICENCE.OLPC"
+
+RDEPENDS:${PN}-olpc += "${PN}-olpc-license"
+
+# For phanfw
+LICENSE:${PN}-phanfw = "Firmware-phanfw"
+LICENSE:${PN}-phanfw-license = "Firmware-phanfw"
+
+FILES:${PN}-phanfw = "${nonarch_base_libdir}/firmware/phanfw.bin"
+FILES:${PN}-phanfw-license = "${nonarch_base_libdir}/firmware/LICENCE.phanfw"
+
+RDEPENDS:${PN}-phanfw += "${PN}-phanfw-license"
+
+# For qla2xxx
+LICENSE:${PN}-qla2xxx = "Firmware-qla2xxx"
+LICENSE:${PN}-qla2xxx-license = "Firmware-qla2xxx"
+
+FILES:${PN}-qla2xxx = "${nonarch_base_libdir}/firmware/ql2*"
+FILES:${PN}-qla2xxx-license = "${nonarch_base_libdir}/firmware/LICENCE.qla2xxx"
+
+RDEPENDS:${PN}-qla2xxx += "${PN}-qla2xxx-license"
+
 # For RSI RS911x WiFi
 LICENSE:${PN}-rs9113 = "WHENCE"
 LICENSE:${PN}-rs9116 = "WHENCE"
@@ -691,6 +848,18 @@ RDEPENDS:${PN}-rtl8761 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8822 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8168 += "${PN}-whence-license"
 
+# For TI wl1251
+LICENSE:${PN}-wl1251 = "Firmware-wl1251"
+LICENSE:${PN}-wl1251-license = "Firmware-wl1251"
+
+FILES:${PN}-wl1251 = " \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1251-fw.bin         \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1251-nvs.bin        \
+"
+FILES:${PN}-wl1251-license = "${nonarch_base_libdir}/firmware/LICENCE.wl1251"
+
+RDEPENDS:${PN}-wl1251 += "${PN}-wl1251-license"
+
 # For ti-connectivity
 LICENSE:${PN}-wlcommon = "Firmware-ti-connectivity"
 LICENSE:${PN}-wl12xx = "Firmware-ti-connectivity"
@@ -720,6 +889,16 @@ FILES:${PN}-wl18xx = " \
 RDEPENDS:${PN}-wl12xx = "${PN}-ti-connectivity-license ${PN}-wlcommon"
 RDEPENDS:${PN}-wl18xx = "${PN}-ti-connectivity-license ${PN}-wlcommon"
 
+# For ti-keystone
+LICENSE:${PN}-ti-keystone = "Firmware-ti-keystone"
+LICENSE:${PN}-ti-keystone-license = "Firmware-ti-keystone"
+
+FILES:${PN}-ti-keystone = "${nonarch_base_libdir}/firmware/ti-keystone/*"
+FILES:${PN}-ti-keystone-license = " \
+  ${nonarch_base_libdir}/firmware/LICENCE.ti-keystone \
+"
+RDEPENDS:${PN}-ti-keystone += "${PN}-ti-keystone-license"
+
 # For vt6656
 LICENSE:${PN}-vt6656 = "Firmware-via_vt6656"
 LICENSE:${PN}-vt6656-license = "Firmware-via_vt6656"
@@ -731,6 +910,35 @@ FILES:${PN}-vt6656 = " \
 
 RDEPENDS:${PN}-vt6656 = "${PN}-vt6656-license"
 
+# For xc4000
+LICENSE:${PN}-xc4000 = "Firmware-xc4000"
+LICENSE:${PN}-xc4000-license = "Firmware-xc4000"
+
+FILES:${PN}-xc4000 = "${nonarch_base_libdir}/firmware/dvb-fe-xc4000-1.4.1.fw"
+FILES:${PN}-xc4000-license = "${nonarch_base_libdir}/firmware/LICENCE.xc4000"
+
+RDEPENDS:${PN}-xc4000 += "${PN}-xc4000-license"
+
+# For xc5000
+LICENSE:${PN}-xc5000 = "Firmware-xc5000"
+LICENSE:${PN}-xc5000-license = "Firmware-xc5000"
+
+FILES:${PN}-xc5000 = "${nonarch_base_libdir}/firmware/dvb-fe-xc5000-1.6.114.fw"
+FILES:${PN}-xc5000-license = "${nonarch_base_libdir}/firmware/LICENCE.xc5000"
+
+RDEPENDS:${PN}-xc5000 += "${PN}-xc5000-license"
+
+# For xc5000c
+LICENSE:${PN}-xc5000c = "Firmware-xc5000c"
+LICENSE:${PN}-xc5000c-license = "Firmware-xc5000c"
+
+FILES:${PN}-xc5000c = " \
+  ${nonarch_base_libdir}/firmware/dvb-fe-xc5000c-4.1.30.7.fw \
+"
+FILES:${PN}-xc5000c-license = "${nonarch_base_libdir}/firmware/LICENCE.xc5000c"
+
+RDEPENDS:${PN}-xc5000c += "${PN}-xc5000c-license"
+
 # For broadcom
 
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do pkg=`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "             \${PN}-$pkg \\"; done  | sort -u
@@ -1053,10 +1261,26 @@ FILES:${PN}-i915-license = "${nonarch_base_libdir}/firmware/LICENSE.i915"
 FILES:${PN}-i915         = "${nonarch_base_libdir}/firmware/i915"
 RDEPENDS:${PN}-i915      = "${PN}-i915-license"
 
+# For ice-enhanced
+LICENSE:${PN}-ice-enhanced         = "Firmware-ice_enhanced"
+LICENSE:${PN}-ice-enhanced-license = "Firmware-ice_enhanced"
+
+FILES:${PN}-ice-enhanced           = " \
+  ${nonarch_base_libdir}/firmware/intel/ice/ddp-comms/* \
+  ${nonarch_base_libdir}/firmware/intel/ice/ddp-wireless_edge/* \
+"
+FILES:${PN}-ice-enhanced-license   = " \
+  ${nonarch_base_libdir}/firmware/LICENSE.ice_enhanced \
+"
+RDEPENDS:${PN}-ice-enhanced        = "${PN}-ice-enhanced-license"
+
 LICENSE:${PN}-ice       = "Firmware-ice"
 LICENSE:${PN}-ice-license = "Firmware-ice"
 FILES:${PN}-ice-license = "${nonarch_base_libdir}/firmware/LICENSE.ice"
-FILES:${PN}-ice         = "${nonarch_base_libdir}/firmware/intel/ice"
+FILES:${PN}-ice         = " \
+  ${nonarch_base_libdir}/firmware/intel/ice/ddp/* \
+  ${nonarch_base_libdir}/firmware/intel/ice/ddp-lag/* \
+"
 RDEPENDS:${PN}-ice      = "${PN}-ice-license"
 
 FILES:${PN}-adsp-sst-license      = "${nonarch_base_libdir}/firmware/LICENCE.adsp_sst"
-- 
2.39.2


