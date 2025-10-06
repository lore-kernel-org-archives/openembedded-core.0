Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF80CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 17:08:10 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1048.1759770485796625766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 10:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dRyjkst2;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596H85FO4040048
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Oct 2025 12:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759770485;
	bh=yLdn/K8ikfhL3Sqdzz5rydOmLj787DVZBlHv2VhDOHA=;
	h=From:To:Subject:Date;
	b=dRyjkst2IFUmFm8aWLQCwT5Nbmp+Y7kNNqkhyoOPf7YVMRAcaLRXuh4wTGTEteR8s
	 EfWRByHFUqkguUiMeO//yPdY9C0qww3ulbk/ka6kDpjgRbAB/Lv+NAJ4EhZZEGvkSs
	 L2bhAG147iorAuMxEPe9CCcMegGHPiAIVw6iVhj8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596H85xm2990768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Oct 2025 12:08:05 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 12:08:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 12:08:04 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596H840j4008587
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Oct 2025 12:08:04 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v5ogu-0002XJ-4G
	for openembedded-core@lists.openembedded.org; Mon, 06 Oct 2025 12:08:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] linux-firmware: Move all firmware into sub-packages
Date: Mon, 6 Oct 2025 12:08:04 -0500
Message-ID: <20251006170804.9664-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 17:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224498

A lot of the firmware has already been broken out into sub-packages, but
a good number were still lingering in the base linux-firmware package.

This patch does two things:

1) Move all of the remaining firmware into sub-packages based on the
driver name in the WHENCE file or into existing sub-packages where a
file or two were missed.

2) Create a new REMOVE_UNLICENSED variable and do_install() logic to
allow for marking certain firmware files as something to remove and not
package up.  The intention is that in the WHENCE file, a number of
firmware files have no license information or very questionable
declarations as to what the license is for the firmware.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../linux-firmware/linux-firmware_20250917.bb | 1032 ++++++++++++++++-
 1 file changed, 1016 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
index f6bca28fbc..7e0f875b23 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
@@ -5,9 +5,61 @@ that contains firmware binary blobs necessary for partial or full functionality
 of certain hardware devices."
 SECTION = "kernel"
 
+REMOVE_UNLICENSED = ""
+
+# For acenic - Alteon AceNIC Gigabit Ethernet card
+REMOVE_UNLICENSED += "acenic/tg1.bin acenic/tg2.bin"
+
+# For emi62 - EMI 6|2m USB Audio interface
+REMOVE_UNLICENSED += "emi62/bitstream.fw emi62/loader.fw emi62/midi.fw emi62/spdif.fw"
+
+# For snd-maestro3 - ESS Allegro Maestro3 audio device
+REMOVE_UNLICENSED += "ess/maestro3_assp_kernel.fw ess/maestro3_assp_minisrc.fw"
+
+# For s2255drv
+REMOVE_UNLICENSED += "f2255usb.bin"
+
+# For snd-korg1212 - Korg 1212 IO audio device
+REMOVE_UNLICENSED += "korg/k1212.dsp"
+
+# For lgs8gxx - Legend Silicon GB20600 demodulator driver
+REMOVE_UNLICENSED += "lgs8g75.fw"
+
+# For ti_usb_3410_5052 - Multi-Tech USB cell modems
+REMOVE_UNLICENSED += "mts_cdma.fw mts_gsm.fw mts_edge.fw mts_mt9234mu.fw mts_mt9234zba.fw"
+
+# For myri_sbus - MyriCOM Gigabit Ethernet
+REMOVE_UNLICENSED += "myricom/lanai.bin"
+
+# For qlogicpti - PTI Qlogic, ISP Driver
+REMOVE_UNLICENSED += "qlogic/isp1000.bin"
+
+# For cassini - Sun Cassini
+REMOVE_UNLICENSED += "sun/cassini.bin"
+
+# For dvb-ttusb-budget - Technotrend/Hauppauge Nova-USB devices
+REMOVE_UNLICENSED += "ttusb-budget/dspbootcode.bin"
+
+# For ueagle-atm - Driver for USB ADSL Modems based on Eagle I,II,III
+REMOVE_UNLICENSED += "ueagle-atm/930-fpga.bin ueagle-atm/CMVeiWO.bin ueagle-atm/CMVepFR10.bin ueagle-atm/DSP9p.bin ueagle-atm/eagleIII.fw ueagle-atm/adi930.fw ueagle-atm/CMVep.bin ueagle-atm/CMVepFR.bin ueagle-atm/DSPei.bin ueagle-atm/CMV9i.bin ueagle-atm/CMVepES03.bin ueagle-atm/CMVepIT.bin ueagle-atm/DSPep.bin ueagle-atm/CMV9p.bin ueagle-atm/CMVepES.bin ueagle-atm/CMVepWO.bin ueagle-atm/eagleI.fw ueagle-atm/CMVei.bin ueagle-atm/CMVepFR04.bin ueagle-atm/DSP9i.bin ueagle-atm/eagleII.fw"
+
+# For vicam - USB 3com HomeConnect (aka vicam)
+REMOVE_UNLICENSED += "vicam/firmware.fw"
+
+# For yam - YAM driver for AX.25
+REMOVE_UNLICENSED += "yam/1200.bin yam/9600.bin"
+
+# For snd-wavefront - ISA WaveFront sound card
+REMOVE_UNLICENSED += "yamaha/yss225_registers.bin"
+
+# For snd-ymfpci - Yamaha YMF724/740/744/754 audio devices
+REMOVE_UNLICENSED += "yamaha/ds1_ctrl.fw yamaha/ds1_dsp.fw yamaha/ds1e_ctrl.fw"
+
+
 LICENSE = "\
     Firmware-Abilis \
     & Firmware-adsp_sst \
+    & Firmware-advansys \
     & Firmware-aeonsemi \
     & Firmware-agere \
     & Firmware-airoha \
@@ -29,6 +81,7 @@ LICENSE = "\
     & Firmware-bnx2x \
     & Firmware-broadcom_bcm43xx \
     & Firmware-ca0132 \
+    & Firmware-cadence \
     & Firmware-cavium \
     & Firmware-chelsio_firmware \
     & Firmware-cirrus \
@@ -64,6 +117,7 @@ LICENSE = "\
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
     & Firmware-keyspan \
+    & Firmware-lenovo \
     & Firmware-linaro \
     & Firmware-Lontium \
     & Firmware-mali_csffw \
@@ -122,11 +176,18 @@ LICENSE = "\
     & Firmware-xc5000c \
     & Firmware-xe \
     & WHENCE \
+    & GPL-1.0-only \
     & GPL-2.0-or-later \
+    & GPL-2.0-only \
+    & GPL-3.0-only \
+    & MPL-1.1 \
+    & Apache-2.0 \
+    & MIT \
 "
 
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
+                    file://LICENCE.advansys;md5=bca735476602a7bcb187c7f8bf4a31d5 \
                     file://LICENSE.aeonsemi;md5=521c00bae0077c90d6ffb9ccf66905ae \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
                     file://LICENSE.airoha;md5=fa3dedb960e2673aea51aa509f7b537d \
@@ -184,6 +245,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.ixp4xx;md5=ddc5cd6cbc6745343926fe7ecc2cdeb2 \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
                     file://LICENCE.keyspan;md5=676af26017c45772c972ce4a75d467d9 \
+                    file://LICENCE.lenovo;md5=7f25420b5c27211f7bf33bebb3042ce4 \
                     file://LICENCE.linaro;md5=936d91e71cf9cd30e733db4bf11661cc \
                     file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
                     file://LICENCE.mali_csffw;md5=e064aaec4d21ef856e1b76a6f5dc435f \
@@ -252,6 +314,7 @@ WHENCE_CHKSUM  = "714332457b96406b3ccff321b60680b1"
 # so that the license files will be copied from fetched source
 NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENCE.Abilis"
 NO_GENERIC_LICENSE[Firmware-adsp_sst] = "LICENCE.adsp_sst"
+NO_GENERIC_LICENSE[Firmware-advansys] = "LICENCE.advansys"
 NO_GENERIC_LICENSE[Firmware-aeonsemi] = "LICENSE.aeonsemi"
 NO_GENERIC_LICENSE[Firmware-agere] = "LICENCE.agere"
 NO_GENERIC_LICENSE[Firmware-airoha] = "LICENSE.airoha"
@@ -309,6 +372,7 @@ NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
 NO_GENERIC_LICENSE[Firmware-ixp4xx] = "LICENSE.ixp4xx"
 NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
 NO_GENERIC_LICENSE[Firmware-keyspan] = "LICENCE.keyspan"
+NO_GENERIC_LICENSE[Firmware-lenovo] = "LICENCE.lenovo"
 NO_GENERIC_LICENSE[Firmware-linaro] = "LICENCE.linaro"
 NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
 NO_GENERIC_LICENSE[Firmware-mali_csffw] = "LICENCE.mali_csffw"
@@ -415,6 +479,21 @@ do_install() {
         fi
         cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
         cp wfx/LICEN[CS]E.* ${D}${nonarch_base_libdir}/firmware/wfx/
+
+        # Remove all unlicensed firmware
+        for file in ${REMOVE_UNLICENSED}; do
+                echo "Remove unlicensed firmware: $file"
+                rm ${D}${nonarch_base_libdir}/firmware/$file
+                path_to_file=$(dirname $file)
+                while [ "${path_to_file}" != "." ]; do
+                        num_files=$(ls -A1 ${D}${nonarch_base_libdir}/firmware/$path_to_file | wc -l)
+                        if [ "$num_files" == "0" ]; then
+                                echo "Remove empty dir: $path_to_file"
+                                rm -rf ${D}${nonarch_base_libdir}/firmware/$path_to_file
+                        fi
+                        path_to_file=$(dirname $path_to_file)
+                done
+        done
 }
 
 PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
@@ -455,18 +534,28 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-moxa-license ${PN}-moxa \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
+             ${PN}-cf8381 ${PN}-cf8385 ${PN}-gspi8682 ${PN}-gspi8686 ${PN}-gspi8688 ${PN}-sd8385 ${PN}-sd8682 \
+             ${PN}-usb8388 ${PN}-usb8682 ${PN}-sd8977 ${PN}-usb8766 ${PN}-usb8797 ${PN}-usb8801 ${PN}-usb8897 ${PN}-rvu-cptpf \
+             ${PN}-mwl8k ${PN}-mwlwifi\
              ${PN}-ti-connectivity-license ${PN}-wl1251-license ${PN}-wlcommon ${PN}-wl1251 ${PN}-wl12xx ${PN}-wl18xx ${PN}-cc33xx \
              ${PN}-ti-keystone-license ${PN}-ti-keystone \
+             ${PN}-ti-tspa-license ${PN}-ti-tas2563 ${PN}-ti-tas2781 ${PN}-ti-vpe \
+             ${PN}-ti-usb-3410-5052 \
              ${PN}-vt6656-license ${PN}-vt6656 \
-             ${PN}-rs9113 ${PN}-rs9116 \
+             ${PN}-rs9113 ${PN}-rs9116 ${PN}-rsi-91x \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8761 \
              ${PN}-rtl8168 \
              ${PN}-rtl8822 \
+             ${PN}-rtl8192 ${PN}-rtl8710 ${PN}-rtl8812 \
+             ${PN}-rtl8851 ${PN}-rtl8852 ${PN}-rtl8922 \
+             ${PN}-rtl8703 ${PN}-rtl8814 \
              ${PN}-rtl-nic \
              ${PN}-cypress-license \
              ${PN}-broadcom-license \
              ${PN}-bcm-0bb4-0306 \
+             ${PN}-bcm-0a5c-6410 \
+             ${PN}-bcm43012 \
              ${PN}-bcm43143 \
              ${PN}-bcm43236b \
              ${PN}-bcm43241b0 \
@@ -499,6 +588,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-bcm4373 \
              ${PN}-bcm43xx \
              ${PN}-bcm43xx-hdr \
+             ${PN}-bcm54591 \
              ${PN}-cirrus-license ${PN}-cirrus \
              ${PN}-cnm-license ${PN}-cnm \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
@@ -569,12 +659,12 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-ice-license ${PN}-ice \
              ${PN}-ice-enhanced-license ${PN}-ice-enhanced \
-             ${PN}-adsp-sst-license ${PN}-adsp-sst \
+             ${PN}-adsp-sst-license ${PN}-adsp-sst ${PN}-snd-soc-avs \
              ${PN}-bnx2 \
              ${PN}-bnx2x \
              ${PN}-liquidio \
              ${PN}-linaro-license \
-             ${PN}-mali-csffw-arch108 ${PN}-mali-csffw-license \
+             ${PN}-mali-csffw-arch108 ${PN}-mali-csffw-arch1010 ${PN}-mali-csffw-arch1012 ${PN}-mali-csffw-arch118 ${PN}-mali-csffw-arch128 ${PN}-mali-csffw-arch138 ${PN}-mali-csffw-license \
              ${PN}-mellanox \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
@@ -589,6 +679,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-nxp9098-sdio \
              ${PN}-nxpiw416-sdio \
              ${PN}-nxpiw612-sdio \
+             ${PN}-nxp-sr1xx \
              ${PN}-nxp-mc-license ${PN}-nxp-mc \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-olpc-license ${PN}-olpc \
@@ -646,6 +737,82 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-xc4000-license ${PN}-xc4000 \
              ${PN}-xc5000-license ${PN}-xc5000 \
              ${PN}-xc5000c-license ${PN}-xc5000c \
+             ${PN}-typhoon-license ${PN}-typhoon \
+             ${PN}-intel-license ${PN}-ish-lnlm \
+             ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad-2a17559f \
+             ${PN}-advansys-license ${PN}-advansys \
+             ${PN}-aeonsemi-license ${PN}-as21xxx \
+             ${PN}-agere-license ${PN}-orinoco \
+             ${PN}-airoha-license ${PN}-en8811h ${PN}-airoha-npu \
+             ${PN}-amd-sev-license ${PN}-ccp \
+             ${PN}-amdnpu-license ${PN}-amdxdna \
+             ${PN}-amd-pmf-license ${PN}-amd-pmf \
+             ${PN}-amd-ucode-license ${PN}-microcode-amd \
+             ${PN}-amlogic-license ${PN}-amlogic \
+             ${PN}-abilis-license ${PN}-as102 \
+             ${PN}-starfire \
+             ${PN}-atmel-license ${PN}-wilc1000 ${PN}-wilc3000 \
+             ${PN}-atusb \
+             ${PN}-dvb-ttpci \
+             ${PN}-bmi260-license ${PN}-bmi260 \
+             ${PN}-cadence-license ${PN}-mhdp8546 \
+             ${PN}-cavium-license ${PN}-cnn55xx \
+             ${PN}-bfa-license ${PN}-cbfw ${PN}-ctfw ${PN}-ct2fw \
+             ${PN}-pcnet-cs ${PN}-3c589-cs ${PN}-3c574-cs ${PN}-serial-cs \
+             ${PN}-sw-serial \
+             ${PN}-siano-license ${PN}-smsmdtv \
+             ${PN}-cpia2 \
+             ${PN}-ca0132-license ${PN}-ca0132 \
+             ${PN}-cxgb3-license ${PN}-cxgb3 \
+             ${PN}-chelsio-firmware-license ${PN}-cxgb4 \
+             ${PN}-dabusb-license ${PN}-dabusb \
+             ${PN}-dsp56k \
+             ${PN}-dib0700-license ${PN}-dib0700 \
+             ${PN}-it913x-license ${PN}-it9135 \
+             ${PN}-drxk-license ${PN}-drxk \
+             ${PN}-e100-license ${PN}-e100 \
+             ${PN}-io-ti ${PN}-io-edgeport \
+             ${PN}-emi26-license ${PN}-emi26 \
+             ${PN}-ene-firmware-license ${PN}-ene-ub6250 \
+             ${PN}-snd-maestro3 \
+             ${PN}-go7007-s2250-license ${PN}-go7007-s2250 \
+             ${PN}-go7007-license ${PN}-go7007 \
+             ${PN}-hfi1-license ${PN}-hfi1 \
+             ${PN}-inside-secure-license ${PN}-inside-secure \
+             ${PN}-intcsst2-license ${PN}-snd-soc-catpt \
+             ${PN}-fw-sst-0f28-license ${PN}-snd-intel-sst-core \
+             ${PN}-ivsc-license ${PN}-atomisp ${PN}-intel-ipu6-isys ${PN}-mei-vsc-hw \
+             ${PN}-ipu3-firmware-license ${PN}-ipu3-imgu \
+             ${PN}-intel-ipu7-isys \
+             ${PN}-intel-vpu-license ${PN}-intel-vpu \
+             ${PN}-isci \
+             ${PN}-ixp4xx-license ${PN}-ixp4xx-npe \
+             ${PN}-kaweth-license ${PN}-kaweth \
+             ${PN}-keyspan-license ${PN}-keyspan \
+             ${PN}-keyspan-pda \
+             ${PN}-mga-license ${PN}-mga \
+             ${PN}-myri10ge-firmware-license ${PN}-myri10ge \
+             ${PN}-smc91c92-cs \
+             ${PN}-qla1280-license ${PN}-qla1280 \
+             ${PN}-ib-qib-license ${PN}-ib-qib \
+             ${PN}-r8a779x-usb3-license ${PN}-xhci-rcar \
+             ${PN}-r128 \
+             ${PN}-rt1320-license ${PN}-rt1320 \
+             ${PN}-rp2-license ${PN}-rp2 \
+             ${PN}-s5p-mfc-license ${PN}-s5p-mfc \
+             ${PN}-snd-sb16-csp \
+             ${PN}-alacritech-license ${PN}-slicoss ${PN}-sxg \
+             ${PN}-tehuti-license ${PN}-tehuti \
+             ${PN}-tigon-license ${PN}-tg3 \
+             ${PN}-tlg2300-license ${PN}-tlg2300 \
+             ${PN}-montage-license ${PN}-mont-tsse \
+             ${PN}-ueagle-atm4-firmware-license ${PN}-ueagle-atm \
+             ${PN}-usbdux \
+             ${PN}-conexant-license ${PN}-cx231xx ${PN}-cx23418 ${PN}-cx23885 ${PN}-cx23840 \
+             ${PN}-vxge-license ${PN}-vxge \
+             ${PN}-whiteheat \
+             ${PN}-qualcommatheros-ath10k-license ${PN}-wil6210 \
+             ${PN}-xe-license ${PN}-xe \
              ${PN}-license \
              "
 
@@ -663,7 +830,10 @@ RDEPENDS:${PN}-amphion-vpu += "${PN}-amphion-vpu-license"
 LICENSE:${PN}-cw1200 = "Firmware-cw1200"
 LICENSE:${PN}-cw1200-license = "Firmware-cw1200"
 
-FILES:${PN}-cw1200 = "${nonarch_base_libdir}/firmware/wsm_22.bin*"
+FILES:${PN}-cw1200 = " \
+    ${nonarch_base_libdir}/firmware/sdd_sagrad_1091_1098.bin* \
+    ${nonarch_base_libdir}/firmware/wsm_22.bin* \
+"
 FILES:${PN}-cw1200-license = "${nonarch_base_libdir}/firmware/LICENCE.cw1200"
 
 RDEPENDS:${PN}-cw1200 += "${PN}-cw1200-license"
@@ -1135,12 +1305,32 @@ FILES:${PN}-lontium-license = "${nonarch_base_libdir}/firmware/LICENSE.Lontium"
 FILES:${PN}-lt9611uxc = "${nonarch_base_libdir}/firmware/lt9611uxc_fw.bin*"
 
 # For Arm Mali
-LICENSE:${PN}-mali-csffw-arch108 = "Firmware-mali_csffw"
 FILES:${PN}-mali-csffw-license = "${nonarch_base_libdir}/firmware/LICENCE.mali_csffw"
-FILES:${PN}-mali-csffw-arch108 = "${nonarch_base_libdir}/firmware/arm/mali/arch10.8/mali_csffw.bin*"
 
+LICENSE:${PN}-mali-csffw-arch108 = "Firmware-mali_csffw"
+FILES:${PN}-mali-csffw-arch108 = "${nonarch_base_libdir}/firmware/arm/mali/arch10.8/mali_csffw.bin*"
 RDEPENDS:${PN}-mali-csffw-arch108 += "${PN}-mali-csffw-license"
 
+LICENSE:${PN}-mali-csffw-arch1010 = "Firmware-mali_csffw"
+FILES:${PN}-mali-csffw-arch1010 = "${nonarch_base_libdir}/firmware/arm/mali/arch10.10/mali_csffw.bin*"
+RDEPENDS:${PN}-mali-csffw-arch1010 += "${PN}-mali-csffw-license"
+
+LICENSE:${PN}-mali-csffw-arch1012 = "Firmware-mali_csffw"
+FILES:${PN}-mali-csffw-arch1012 = "${nonarch_base_libdir}/firmware/arm/mali/arch10.12/mali_csffw.bin*"
+RDEPENDS:${PN}-mali-csffw-arch1012 += "${PN}-mali-csffw-license"
+
+LICENSE:${PN}-mali-csffw-arch118 = "Firmware-mali_csffw"
+FILES:${PN}-mali-csffw-arch118 = "${nonarch_base_libdir}/firmware/arm/mali/arch11.8/mali_csffw.bin*"
+RDEPENDS:${PN}-mali-csffw-arch118 += "${PN}-mali-csffw-license"
+
+LICENSE:${PN}-mali-csffw-arch128 = "Firmware-mali_csffw"
+FILES:${PN}-mali-csffw-arch128 = "${nonarch_base_libdir}/firmware/arm/mali/arch12.8/mali_csffw.bin*"
+RDEPENDS:${PN}-mali-csffw-arch128 += "${PN}-mali-csffw-license"
+
+LICENSE:${PN}-mali-csffw-arch138 = "Firmware-mali_csffw"
+FILES:${PN}-mali-csffw-arch138 = "${nonarch_base_libdir}/firmware/arm/mali/arch13.8/mali_csffw.bin*"
+RDEPENDS:${PN}-mali-csffw-arch138 += "${PN}-mali-csffw-license"
+
 # For marvell
 LICENSE:${PN}-pcie8897 = "Firmware-Marvell"
 LICENSE:${PN}-pcie8997 = "Firmware-Marvell"
@@ -1153,6 +1343,23 @@ LICENSE:${PN}-sd8887 = "Firmware-Marvell"
 LICENSE:${PN}-sd8897 = "Firmware-Marvell"
 LICENSE:${PN}-sd8997 = "Firmware-Marvell"
 LICENSE:${PN}-usb8997 = "Firmware-Marvell"
+LICENSE:${PN}-cf8381 = "Firmware-Marvell"
+LICENSE:${PN}-cf8385 = "Firmware-Marvell"
+LICENSE:${PN}-gspi8682 = "Firmware-Marvell"
+LICENSE:${PN}-gspi8686 = "Firmware-Marvell"
+LICENSE:${PN}-gspi8688 = "Firmware-Marvell"
+LICENSE:${PN}-sd8385 = "Firmware-Marvell"
+LICENSE:${PN}-sd8682 = "Firmware-Marvell"
+LICENSE:${PN}-usb8388 = "Firmware-Marvell"
+LICENSE:${PN}-usb8682 = "Firmware-Marvell"
+LICENSE:${PN}-sd8977 = "Firmware-Marvell"
+LICENSE:${PN}-usb8766 = "Firmware-Marvell"
+LICENSE:${PN}-usb8797 = "Firmware-Marvell"
+LICENSE:${PN}-usb8801 = "Firmware-Marvell"
+LICENSE:${PN}-usb8897 = "Firmware-Marvell"
+LICENSE:${PN}-rvu-cptpf = "Firmware-Marvell"
+LICENSE:${PN}-mwl8k = "Firmware-Marvell"
+LICENSE:${PN}-mwlwifi = "Firmware-Marvell"
 LICENSE:${PN}-marvell-license = "Firmware-Marvell"
 
 FILES:${PN}-marvell-license = "${nonarch_base_libdir}/firmware/LICENCE.Marvell"
@@ -1165,8 +1372,7 @@ FILES:${PN}-pcie8997 = " \
   ${nonarch_base_libdir}/firmware/mrvl/pcieusb8997_combo_v4.bin* \
 "
 FILES:${PN}-sd8686 = " \
-  ${nonarch_base_libdir}/firmware/libertas/sd8686_v9* \
-  ${nonarch_base_libdir}/firmware/sd8686* \
+  ${nonarch_base_libdir}/firmware/libertas/sd8686* \
 "
 FILES:${PN}-sd8688 = " \
   ${nonarch_base_libdir}/firmware/libertas/sd8688* \
@@ -1203,6 +1409,23 @@ FILES:${PN}-sd8997 = " \
 FILES:${PN}-usb8997 = " \
   ${nonarch_base_libdir}/firmware/mrvl/usbusb8997_combo_v4.bin* \
 "
+FILES:${PN}-cf8381 = "${nonarch_base_libdir}/firmware/libertas/cf8381*"
+FILES:${PN}-cf8385 = "${nonarch_base_libdir}/firmware/libertas/cf8385*"
+FILES:${PN}-gspi8682 = "${nonarch_base_libdir}/firmware/libertas/gspi8682*"
+FILES:${PN}-gspi8686 = "${nonarch_base_libdir}/firmware/libertas/gspi8686*"
+FILES:${PN}-gspi8688 = "${nonarch_base_libdir}/firmware/libertas/gspi8688*"
+FILES:${PN}-sd8385 = "${nonarch_base_libdir}/firmware/libertas/sd8385*"
+FILES:${PN}-sd8682 = "${nonarch_base_libdir}/firmware/libertas/sd8682*"
+FILES:${PN}-usb8388 = "${nonarch_base_libdir}/firmware/libertas/usb8388*"
+FILES:${PN}-usb8682 = "${nonarch_base_libdir}/firmware/libertas/usb8682*"
+FILES:${PN}-sd8977 = "${nonarch_base_libdir}/firmware/mrvl/sdsd8977*"
+FILES:${PN}-usb8766 = "${nonarch_base_libdir}/firmware/mrvl/usb8766*"
+FILES:${PN}-usb8797 = "${nonarch_base_libdir}/firmware/mrvl/usb8797*"
+FILES:${PN}-usb8801 = "${nonarch_base_libdir}/firmware/mrvl/usb8801*"
+FILES:${PN}-usb8897 = "${nonarch_base_libdir}/firmware/mrvl/usb8897*"
+FILES:${PN}-rvu-cptpf = "${nonarch_base_libdir}/firmware/mrvl/cpt0*"
+FILES:${PN}-mwl8k = "${nonarch_base_libdir}/firmware/mwl8k/*"
+FILES:${PN}-mwlwifi = "${nonarch_base_libdir}/firmware/mwlwifi/*"
 
 RDEPENDS:${PN}-sd8686 += "${PN}-marvell-license"
 RDEPENDS:${PN}-sd8688 += "${PN}-marvell-license"
@@ -1213,6 +1436,23 @@ RDEPENDS:${PN}-sd8887 += "${PN}-marvell-license"
 RDEPENDS:${PN}-sd8897 += "${PN}-marvell-license"
 RDEPENDS:${PN}-sd8997 += "${PN}-marvell-license"
 RDEPENDS:${PN}-usb8997 += "${PN}-marvell-license"
+RDEPENDS:${PN}-cf8381 += "${PN}-marvell-license"
+RDEPENDS:${PN}-cf8385 += "${PN}-marvell-license"
+RDEPENDS:${PN}-gspi8682 += "${PN}-marvell-license"
+RDEPENDS:${PN}-gspi8686 += "${PN}-marvell-license"
+RDEPENDS:${PN}-gspi8688 += "${PN}-marvell-license"
+RDEPENDS:${PN}-sd8385 += "${PN}-marvell-license"
+RDEPENDS:${PN}-sd8682 += "${PN}-marvell-license"
+RDEPENDS:${PN}-usb8388 += "${PN}-marvell-license"
+RDEPENDS:${PN}-usb8682 += "${PN}-marvell-license"
+RDEPENDS:${PN}-sd8977 += "${PN}-marvell-license"
+RDEPENDS:${PN}-usb8766 += "${PN}-marvell-license"
+RDEPENDS:${PN}-usb8797 += "${PN}-marvell-license"
+RDEPENDS:${PN}-usb8801 += "${PN}-marvell-license"
+RDEPENDS:${PN}-usb8897 += "${PN}-marvell-license"
+RDEPENDS:${PN}-rvu-cptpf += "${PN}-marvell-license"
+RDEPENDS:${PN}-mwl8k += "${PN}-marvell-license"
+RDEPENDS:${PN}-mwlwifi += "${PN}-marvell-license"
 
 # For netronome
 LICENSE:${PN}-netronome = "Firmware-netronome"
@@ -1246,6 +1486,7 @@ LICENSE:${PN}-nxp9098-pcie = "Firmware-nxp"
 LICENSE:${PN}-nxp9098-sdio = "Firmware-nxp"
 LICENSE:${PN}-nxpiw416-sdio = "Firmware-nxp"
 LICENSE:${PN}-nxpiw612-sdio = "Firmware-nxp"
+LICENSE:${PN}-nxp-sr1xx = "Firmware-nxp"
 LICENSE:${PN}-nxp-license = "Firmware-nxp"
 
 FILES:${PN}-nxp8987-sdio = "${nonarch_base_libdir}/firmware/nxp/*8987*"
@@ -1260,6 +1501,7 @@ ALLOW_EMPTY:${PN}-nxp9098-pcie = "1"
 ALLOW_EMPTY:${PN}-nxp9098-sdio = "1"
 FILES:${PN}-nxpiw416-sdio = "${nonarch_base_libdir}/firmware/nxp/*iw416*"
 FILES:${PN}-nxpiw612-sdio = "${nonarch_base_libdir}/firmware/nxp/uartspi_n61x_v1.bin.se*"
+FILES:${PN}-nxp-sr1xx = "${nonarch_base_libdir}/firmware/nxp/sr150_fw.bin"
 FILES:${PN}-nxp-license = "${nonarch_base_libdir}/firmware/LICENSE.nxp"
 
 RDEPENDS:${PN}-nxp8987-sdio += "${PN}-nxp-license"
@@ -1271,6 +1513,7 @@ RDEPENDS:${PN}-nxp9098-pcie += "${PN}-nxp9098-common"
 RDEPENDS:${PN}-nxp9098-sdio += "${PN}-nxp9098-common"
 RDEPENDS:${PN}-nxpiw416-sdio += "${PN}-nxp-license"
 RDEPENDS:${PN}-nxpiw612-sdio += "${PN}-nxp-license"
+RDEPENDS:${PN}-nxp-sr1xx += "${PN}-nxp-license"
 
 # For nxp-mc
 LICENSE:${PN}-nxp-mc = "Firmware-nxp_mc_firmware"
@@ -1347,12 +1590,15 @@ RDEPENDS:${PN}-qla2xxx += "${PN}-qla2xxx-license"
 # For RSI RS911x WiFi
 LICENSE:${PN}-rs9113 = "WHENCE"
 LICENSE:${PN}-rs9116 = "WHENCE"
+LICENSE:${PN}-rsi-91x = "WHENCE"
 
 FILES:${PN}-rs9113 = " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps* "
 FILES:${PN}-rs9116 = " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps* "
+FILES:${PN}-rsi-91x = " ${nonarch_base_libdir}/firmware/rsi_91x.fw "
 
 RDEPENDS:${PN}-rs9113 += "${PN}-whence-license"
 RDEPENDS:${PN}-rs9116 += "${PN}-whence-license"
+RDEPENDS:${PN}-rsi-91x += "${PN}-whence-license"
 
 # For rtl
 LICENSE:${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
@@ -1363,6 +1609,14 @@ LICENSE:${PN}-rtl8723 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8761 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8821 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8822 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8192 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8710 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8812 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8851 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8852 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8922 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8703 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8814 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl-license = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl-nic = "WHENCE"
 LICENSE:${PN}-rtl8168 = "WHENCE"
@@ -1389,6 +1643,7 @@ FILES:${PN}-rtl8723 = " \
 "
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
+  ${nonarch_base_libdir}/firmware/rtw88/README \
   ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin* \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*.bin \
 "
@@ -1406,6 +1661,30 @@ FILES:${PN}-rtl8822 = " \
 FILES:${PN}-rtl-nic = " \
   ${nonarch_base_libdir}/firmware/rtl_nic/*.fw* \
 "
+FILES:${PN}-rtl8192 = " \
+    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192* \
+    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8192* \
+"
+FILES:${PN}-rtl8710 = "${nonarch_base_libdir}/firmware/rtlwifi/rtl8710*"
+FILES:${PN}-rtl8812 = " \
+    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8812* \
+    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8812* \
+    ${nonarch_base_libdir}/firmware/rtw88/rtw8812* \
+"
+FILES:${PN}-rtl8851 = " \
+    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8851* \
+    ${nonarch_base_libdir}/firmware/rtw89/rtw8851* \
+"
+FILES:${PN}-rtl8852 = " \
+    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8852* \
+    ${nonarch_base_libdir}/firmware/rtw89/rtw8852* \
+"
+FILES:${PN}-rtl8922 = " \
+    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8922* \
+    ${nonarch_base_libdir}/firmware/rtw89/rtw8922* \
+"
+FILES:${PN}-rtl8703 = "${nonarch_base_libdir}/firmware/rtw88/rtw8703*"
+FILES:${PN}-rtl8814 = "${nonarch_base_libdir}/firmware/rtw88/rtw8814*"
 
 RDEPENDS:${PN}-rtl8188 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8192ce += "${PN}-rtl-license"
@@ -1415,6 +1694,14 @@ RDEPENDS:${PN}-rtl8723 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8821 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8761 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8822 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8192 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8710 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8812 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8851 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8852 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8922 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8703 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8814 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8168 += "${PN}-whence-license"
 RDEPENDS:${PN}-rtl-nic += "${PN}-whence-license"
 
@@ -1487,6 +1774,41 @@ FILES:${PN}-ti-keystone-license = " \
 "
 RDEPENDS:${PN}-ti-keystone += "${PN}-ti-keystone-license"
 
+# For ti-tspa-license
+LICENSE:${PN}-ti-tspa-license = "Firmware-ti-tspa"
+FILES:${PN}-ti-tspa-license = "${nonarch_base_libdir}/firmware/LICENCE.ti-tspa"
+
+# For ti-tas2563 - tas2563 firmware
+LICENSE:${PN}-ti-tas2563 = "Firmware-ti-tspa"
+FILES:${PN}-ti-tas2563 = "\
+    ${nonarch_base_libdir}/firmware/INT8866RCA2.bin \
+    ${nonarch_base_libdir}/firmware/TAS2XXX3870.bin \
+    ${nonarch_base_libdir}/firmware/ti/tas2563/* \
+"
+RDEPENDS:${PN}-ti-tas2563 = "${PN}-ti-tspa-license"
+
+# For ti-tas2781 - tas2781 firmware
+LICENSE:${PN}-ti-tas2781 = "Firmware-ti-tspa"
+FILES:${PN}-ti-tas2781 = "\
+    ${nonarch_base_libdir}/firmware/TAS2XXX*.bin \
+    ${nonarch_base_libdir}/firmware/TIAS2781*.bin \
+    ${nonarch_base_libdir}/firmware/TXNW2781*.bin \
+    ${nonarch_base_libdir}/firmware/ti/tas2781/* \
+"
+RDEPENDS:${PN}-ti-tas2781 = "${PN}-ti-tspa-license"
+
+# For ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
+LICENSE:${PN}-ti-vpe = "Firmware-ti-tspa"
+FILES:${PN}-ti-vpe = "${nonarch_base_libdir}/firmware/ti/vpdma-1b8.bin"
+RDEPENDS:${PN}-ti-vpe = "${PN}-ti-tspa-license"
+
+# For ti_usb_3410_5052 - USB TI 3410/5052 serial device
+LICENSE:${PN}-ti-usb-3410-5052 = "GPL-2.0-or-later"
+FILES:${PN}-ti-usb-3410-5052 = "\
+    ${nonarch_base_libdir}/firmware/ti_3410.fw \
+    ${nonarch_base_libdir}/firmware/ti_5052.fw \
+"
+
 # For vt6656
 LICENSE:${PN}-vt6656 = "Firmware-via_vt6656"
 LICENSE:${PN}-vt6656-license = "Firmware-via_vt6656"
@@ -1548,9 +1870,12 @@ FILES:${PN}-bcm4339 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bi
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4339-sdio.bin* \
 "
 FILES:${PN}-bcm43241b0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b0-sdio.bin*"
-FILES:${PN}-bcm43241b4 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b4-sdio.bin*"
+FILES:${PN}-bcm43241b4 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b4-sdio.*"
 FILES:${PN}-bcm43241b5 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b5-sdio.bin*"
 FILES:${PN}-bcm43242a = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43242a.bin*"
+FILES:${PN}-bcm43012 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43012-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43012-sdio.* \
+"
 FILES:${PN}-bcm43143 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43143.bin* \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin* \
 "
@@ -1564,8 +1889,8 @@ FILES:${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.*
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.* \
 "
 FILES:${PN}-bcm43569 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43569.bin*"
-FILES:${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac43570-pcie.bin* \
+FILES:${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43570-pcie.* \
 "
 FILES:${PN}-bcm4358 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4358-pcie.bin*"
 FILES:${PN}-bcm43602 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.bin* \
@@ -1575,6 +1900,10 @@ FILES:${PN}-bcm4366b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366b-pcie.
 FILES:${PN}-bcm4366c = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366c-pcie.bin*"
 FILES:${PN}-bcm4371 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4371-pcie.bin*"
 
+FILES:${PN}-bcm54591 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac54591-pcie.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac54591-pcie.* \
+"
+
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do pkg=`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "LICENSE:\${PN}-$pkg = \"Firmware-broadcom_bcm43xx\"\nRDEPENDS_\${PN}-$pkg += \"\${PN}-broadcom-license\""; done
 # Currently 1st one and last 6 have cypress LICENSE
 
@@ -1604,6 +1933,8 @@ LICENSE:${PN}-bcm43241b5 = "Firmware-broadcom_bcm43xx"
 RDEPENDS:${PN}-bcm43241b5 += "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43242a = "Firmware-broadcom_bcm43xx"
 RDEPENDS:${PN}-bcm43242a += "${PN}-broadcom-license"
+LICENSE:${PN}-bcm43012 = "Firmware-broadcom_bcm43xx"
+RDEPENDS:${PN}-bcm43012 += "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43143 = "Firmware-broadcom_bcm43xx"
 RDEPENDS:${PN}-bcm43143 += "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43430a0 = "Firmware-broadcom_bcm43xx"
@@ -1630,6 +1961,8 @@ LICENSE:${PN}-bcm4366c = "Firmware-broadcom_bcm43xx"
 RDEPENDS:${PN}-bcm4366c += "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4371 = "Firmware-broadcom_bcm43xx"
 RDEPENDS:${PN}-bcm4371 += "${PN}-broadcom-license"
+LICENSE:${PN}-bcm54591 = "Firmware-broadcom_bcm43xx"
+RDEPENDS:${PN}-bcm54591 += "${PN}-broadcom-license"
 
 # For broadcom cypress
 
@@ -1637,14 +1970,15 @@ LICENSE:${PN}-cypress-license = "Firmware-cypress"
 FILES:${PN}-cypress-license = "${nonarch_base_libdir}/firmware/LICENCE.cypress"
 
 FILES:${PN}-bcm-0bb4-0306 = "${nonarch_base_libdir}/firmware/brcm/BCM-0bb4-0306.hcd*"
+FILES:${PN}-bcm-0a5c-6410 = "${nonarch_base_libdir}/firmware/brcm/BCM-0a5c-6410.hcd*"
 FILES:${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac43340-sdio.*"
 FILES:${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac43362-sdio.*"
 FILES:${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac43430-sdio.*"
-FILES:${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin* \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.bin* \
+FILES:${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.* \
 "
 FILES:${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-pcie.* \
@@ -1658,6 +1992,8 @@ FILES:${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bi
 
 LICENSE:${PN}-bcm-0bb4-0306 = "Firmware-cypress"
 RDEPENDS:${PN}-bcm-0bb4-0306 += "${PN}-cypress-license"
+LICENSE:${PN}-bcm-0a5c-6410 = "Firmware-cypress"
+RDEPENDS:${PN}-bcm-0a5c-6410 += "${PN}-bcm-0bb4-0306"
 LICENSE:${PN}-bcm43340 = "Firmware-cypress"
 RDEPENDS:${PN}-bcm43340 += "${PN}-cypress-license"
 LICENSE:${PN}-bcm43362 = "Firmware-cypress"
@@ -1698,7 +2034,10 @@ RDEPENDS:${PN}-bnx2x += "${PN}-whence-license"
 LICENSE:${PN}-cirrus = "Firmware-cirrus"
 LICENSE:${PN}-cirrus-license = "Firmware-cirrus"
 
-FILES:${PN}-cirrus = "${nonarch_base_libdir}/firmware/cirrus/*"
+FILES:${PN}-cirrus = " \
+    ${nonarch_base_libdir}/firmware/cs42l43.bin \
+    ${nonarch_base_libdir}/firmware/cirrus/* \
+"
 FILES:${PN}-cirrus-license = "${nonarch_base_libdir}/firmware/LICENSE.cirrus"
 
 RDEPENDS:${PN}-cirrus += "${PN}-cirrus-license"
@@ -1707,7 +2046,7 @@ RDEPENDS:${PN}-cirrus += "${PN}-cirrus-license"
 LICENSE:${PN}-cnm = "Firmware-cnm"
 LICENSE:${PN}-cnm-license = "Firmware-cnm"
 
-FILES:${PN}-cnm = "${nonarch_base_libdir}/firmware/cnm/wave521c_k3_codec_fw.bin*"
+FILES:${PN}-cnm = "${nonarch_base_libdir}/firmware/cnm/*"
 FILES:${PN}-cnm-license = "${nonarch_base_libdir}/firmware/LICENCE.cnm"
 
 RDEPENDS:${PN}-cnm += "${PN}-cnm-license"
@@ -1896,9 +2235,14 @@ LICENSE:${PN}-adsp-sst-license    = "Firmware-adsp_sst"
 FILES:${PN}-adsp-sst              = "\
     ${nonarch_base_libdir}/firmware/intel/dsp_fw* \
     ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin \
+    ${nonarch_base_libdir}/firmware/intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin \
 "
 RDEPENDS:${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
+# For snd_soc_avs - Intel AudioDSP driver for cAVS platforms
+LICENSE:${PN}-snd-soc-avs = "Apache-2.0"
+FILES:${PN}-snd-soc-avs = "${nonarch_base_libdir}/firmware/intel/avs/*"
+
 # For QAT
 LICENSE:${PN}-qat         = "Firmware-qat"
 LICENSE:${PN}-qat-license = "Firmware-qat"
@@ -2216,6 +2560,656 @@ FILES:${PN}-amlogic-vdec-license = "${nonarch_base_libdir}/firmware/LICENSE.amlo
 FILES:${PN}-amlogic-vdec = "${nonarch_base_libdir}/firmware/meson/vdec/*"
 RDEPENDS:${PN}-amlogic-vdec = "${PN}-amlogic-vdec-license"
 
+# For 3com typhoon
+LICENSE:${PN}-typhoon-license = "Firmware-typhoon"
+LICENSE:${PN}-typhoon = "Firmware-typhoon"
+FILES:${PN}-typhoon-license = "${nonarch_base_libdir}/firmware/LICENCE.typhoon"
+FILES:${PN}-typhoon = "${nonarch_base_libdir}/firmware/3com/typhoon.bin"
+RDEPENDS:${PN}-typhoon = "${PN}-typhoon-license"
+
+# For ish - Intel Integrated Sensor Hub
+LICENSE:${PN}-intel-license = "Firmware-intel"
+FILES:${PN}-intel-license = "${nonarch_base_libdir}/firmware/LICENSE.intel"
+
+LICENSE:${PN}-ish-lnlm = "Firmware-intel"
+FILES:${PN}-ish-lnlm = "${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm.bin"
+RDEPENDS:${PN}-ish-lnlm = "${PN}-intel-license"
+
+# For LENOVO ish - Intel Integrated Sensor Hub
+LICENSE:${PN}-lenovo-license = "Firmware-lenovo"
+FILES:${PN}-lenovo-license = "${nonarch_base_libdir}/firmware/LICENCE.lenovo"
+
+LICENSE:${PN}-ish-lnlm-53c4ffad-2a17559f = "Firmware-lenovo"
+FILES:${PN}-ish-lnlm-53c4ffad-2a17559f = "\
+    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_53c4ffad_2a17559f.bin \
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_2a17559f.bin \
+"
+RDEPENDS:${PN}-ish-lnlm-53c4ffad-2a17559f = "${PN}-lenovo-license"
+
+# For advansys - AdvanSys SCSI
+LICENSE:${PN}-advansys-license = "Firmware-advansys"
+FILES:${PN}-advansys-license = "${nonarch_base_libdir}/firmware/LICENCE.advansys"
+
+LICENSE:${PN}-advansys = "Firmware-advansys"
+FILES:${PN}-advansys = "${nonarch_base_libdir}/firmware/advansys/*"
+RDEPENDS:${PN}-advansys = "${PN}-advansys-license"
+
+# For as21xxx
+LICENSE:${PN}-aeonsemi-license = "Firmware-aeonsemi"
+FILES:${PN}-aeonsemi-license = "${nonarch_base_libdir}/firmware/LICENSE.aeonsemi"
+
+LICENSE:${PN}-as21xxx = "Firmware-aeonsemi"
+FILES:${PN}-as21xxx = "${nonarch_base_libdir}/firmware/aeonsemi/*"
+RDEPENDS:${PN}-as21xxx = "${PN}-aeonsemi-license"
+
+# For orinoco - Agere/Prism/Symbol Orinoco support
+LICENSE:${PN}-agere-license = "Firmware-agere"
+FILES:${PN}-agere-license = "${nonarch_base_libdir}/firmware/LICENCE.agere"
+
+LICENSE:${PN}-orinoco = "Firmware-agere"
+FILES:${PN}-orinoco = "${nonarch_base_libdir}/firmware/agere_*"
+RDEPENDS:${PN}-orinoco = "${PN}-agere-license"
+
+# For en8811h - Airoha 2.5G Ethernet Phy
+LICENSE:${PN}-airoha-license = "Firmware-airoha"
+FILES:${PN}-airoha-license = "${nonarch_base_libdir}/firmware/LICENSE.airoha"
+
+LICENSE:${PN}-en8811h = "Firmware-airoha"
+FILES:${PN}-en8811h = "${nonarch_base_libdir}/firmware/airoha/EthMD32*"
+RDEPENDS:${PN}-en8811h = "${PN}-airoha-license"
+
+# For airoha-npu - Airoha Network Processor Unit driver
+LICENSE:${PN}-airoha-npu = "Firmware-airoha"
+FILES:${PN}-airoha-npu = "${nonarch_base_libdir}/firmware/airoha/en7581_npu*"
+RDEPENDS:${PN}-airoha-npu = "${PN}-airoha-license"
+
+# For ccp - Platform Security Processor (PSP) device
+LICENSE:${PN}-amd-sev-license = "Firmware-amd-sev"
+FILES:${PN}-amd-sev-license = "${nonarch_base_libdir}/firmware/LICENSE.amd-sev"
+
+LICENSE:${PN}-ccp = "Firmware-amd-sev"
+FILES:${PN}-ccp = "${nonarch_base_libdir}/firmware/amd/amd_sev*"
+RDEPENDS:${PN}-ccp = "${PN}-amd-sev-license"
+
+# For amdxdna - AMD Inference processor
+LICENSE:${PN}-amdnpu-license = "Firmware-amdnpu"
+FILES:${PN}-amdnpu-license = "${nonarch_base_libdir}/firmware/LICENSE.amdnpu"
+
+LICENSE:${PN}-amdxdna = "Firmware-amdnpu"
+FILES:${PN}-amdxdna = "${nonarch_base_libdir}/firmware/amdnpu/*"
+RDEPENDS:${PN}-amdxdna = "${PN}-amdnpu-license"
+
+# For amd_pmf - AMD Platform Management Framework TA
+LICENSE:${PN}-amd-pmf-license = "Firmware-amd_pmf"
+FILES:${PN}-amd-pmf-license = "${nonarch_base_libdir}/firmware/LICENSE.amd_pmf"
+
+LICENSE:${PN}-amd-pmf = "Firmware-amd_pmf"
+FILES:${PN}-amd-pmf = "${nonarch_base_libdir}/firmware/amdtee/*"
+RDEPENDS:${PN}-amd-pmf = "${PN}-amd-pmf-license"
+
+# For microcode_amd - AMD CPU Microcode Update Driver for Linux
+LICENSE:${PN}-amd-ucode-license = "Firmware-amd-ucode"
+FILES:${PN}-amd-ucode-license = "${nonarch_base_libdir}/firmware/LICENSE.amd-ucode"
+
+LICENSE:${PN}-microcode-amd = "Firmware-amd-ucode"
+FILES:${PN}-microcode-amd = "${nonarch_base_libdir}/firmware/amd-ucode/*"
+RDEPENDS:${PN}-microcode-amd = "${PN}-amd-ucode-license"
+
+# For amlogic - Amlogic SoC Firmware
+LICENSE:${PN}-amlogic-license = "Firmware-amlogic"
+FILES:${PN}-amlogic-license = "${nonarch_base_libdir}/firmware/LICENSE.amlogic"
+
+LICENSE:${PN}-amlogic = "Firmware-amlogic"
+FILES:${PN}-amlogic = "${nonarch_base_libdir}/firmware/amlogic/aml_*"
+RDEPENDS:${PN}-amlogic = "${PN}-amlogic-license"
+
+# For starfire - Adaptec Starfire/DuraLAN support
+LICENSE:${PN}-starfire = "GPL-2.0-only"
+FILES:${PN}-starfire = "${nonarch_base_libdir}/firmware/adaptec/starfire*"
+
+# For as102 - Abilis Systems Single DVB-T Receiver
+LICENSE:${PN}-abilis-license = "Firmware-Abilis"
+FILES:${PN}-abilis-license = "${nonarch_base_libdir}/firmware/LICENCE.Abilis"
+
+LICENSE:${PN}-as102 = "Firmware-Abilis"
+FILES:${PN}-as102 = "${nonarch_base_libdir}/firmware/as102_data*_st.hex"
+RDEPENDS:${PN}-as102 = "${PN}-abilis-license"
+
+# For wilc1000 - Atmel 802.11n WLAN driver for WILC1000 & WILC3000
+LICENSE:${PN}-atmel-license = "Firmware-atmel"
+FILES:${PN}-atmel-license = "${nonarch_base_libdir}/firmware/LICENSE.atmel"
+
+LICENSE:${PN}-wilc1000 = "Firmware-atmel"
+FILES:${PN}-wilc1000 = "${nonarch_base_libdir}/firmware/atmel/wilc1000*"
+RDEPENDS:${PN}-wilc1000 = "${PN}-atmel-license"
+
+LICENSE:${PN}-wilc3000 = "Firmware-atmel"
+FILES:${PN}-wilc3000 = "${nonarch_base_libdir}/firmware/atmel/wilc3000*"
+RDEPENDS:${PN}-wilc3000 = "${PN}-atmel-license"
+
+# For atusb - ATUSB IEEE 802.15.4 transceiver driver
+FILES:${PN}-atusb = "${nonarch_base_libdir}/firmware/atusb/*"
+LICENSE:${PN}-atusb = "GPL-2.0-or-later"
+
+# For dvb-ttpci - AV7110 cards
+FILES:${PN}-dvb-ttpci = "${nonarch_base_libdir}/firmware/av7110/*"
+LICENSE:${PN}-dvb-ttpci = "GPL-2.0-or-later"
+
+# For bmi260 - Bosch BMI260 IMU configuration data
+LICENSE:${PN}-bmi260-license = "Firmware-bmi260"
+FILES:${PN}-bmi260-license = "${nonarch_base_libdir}/firmware/LICENSE.bmi260"
+
+LICENSE:${PN}-bmi260 = "Firmware-bmi260"
+FILES:${PN}-bmi260 = "${nonarch_base_libdir}/firmware/bmi260-init-data.fw"
+RDEPENDS:${PN}-bmi260 = "${PN}-bmi260-license"
+
+# For cdns-mhdp - Cadence MHDP8546 DP bridge
+LICENSE:${PN}-cadence-license = "Firmware-cadence"
+FILES:${PN}-cadence-license = "${nonarch_base_libdir}/firmware/LICENCE.cadence"
+
+LICENSE:${PN}-mhdp8546 = "Firmware-cadence"
+FILES:${PN}-mhdp8546 = "${nonarch_base_libdir}/firmware/cadence/mhdp8546.bin"
+RDEPENDS:${PN}-mhdp8546 = "${PN}-cadence-license"
+
+# For nitrox - Cavium CNN55XX crypto driver
+LICENSE:${PN}-cavium-license = "Firmware-cavium"
+FILES:${PN}-cavium-license = "${nonarch_base_libdir}/firmware/LICENCE.cavium"
+
+LICENSE:${PN}-cnn55xx = "Firmware-cavium"
+FILES:${PN}-cnn55xx = "${nonarch_base_libdir}/firmware/cavium/cnn55xx*"
+RDEPENDS:${PN}-cnn55xx = "${PN}-cavium-license"
+
+# For BFA/BNA - QLogic BR-series Adapter FC/FCOE drivers
+LICENSE:${PN}-bfa-license = "Firmware-bfa"
+FILES:${PN}-bfa-license = "${nonarch_base_libdir}/firmware/LICENSE.bfa"
+
+LICENSE:${PN}-cbfw = "Firmware-bfa"
+FILES:${PN}-cbfw = "${nonarch_base_libdir}/firmware/cbfw-3.2.5.1.bin"
+RDEPENDS:${PN}-cbfw = "${PN}-bfa-license"
+
+LICENSE:${PN}-ctfw = "Firmware-bfa"
+FILES:${PN}-ctfw = "${nonarch_base_libdir}/firmware/ctfw-3.2.5.1.bin"
+RDEPENDS:${PN}-ctfw = "${PN}-bfa-license"
+
+LICENSE:${PN}-ct2fw = "Firmware-bfa"
+FILES:${PN}-ct2fw = "${nonarch_base_libdir}/firmware/ct2fw-3.2.5.1.bin"
+RDEPENDS:${PN}-ct2fw = "${PN}-bfa-license"
+
+# For pcnet_cs - NE2000 compatible PCMCIA adapter
+FILES:${PN}-pcnet-cs = " \
+    ${nonarch_base_libdir}/firmware/cis/LA-PCM.cis \
+    ${nonarch_base_libdir}/firmware/cis/PCMLM28.cis \
+    ${nonarch_base_libdir}/firmware/cis/DP83903.cis \
+    ${nonarch_base_libdir}/firmware/cis/NE2K.cis \
+    ${nonarch_base_libdir}/firmware/cis/tamarack.cis \
+    ${nonarch_base_libdir}/firmware/cis/PE-200.cis \
+    ${nonarch_base_libdir}/firmware/cis/PE520.cis \
+"
+LICENSE:${PN}-pcnet-cs = "GPL-2.0-only & MPL-1.1"
+
+# For 3c589_cs - 3Com PCMCIA adapter
+FILES:${PN}-3c589-cs = "${nonarch_base_libdir}/firmware/cis/3CXEM556.cis"
+LICENSE:${PN}-3c589-cs = "GPL-2.0-only & MPL-1.1"
+
+# For 3c574-cs - 3Com PCMCIA adapter
+FILES:${PN}-3c574-cs = "${nonarch_base_libdir}/firmware/cis/3CCFEM556.cis"
+LICENSE:${PN}-3c574-cs = "GPL-2.0-only & MPL-1.1"
+
+# For serial_cs - Serial PCMCIA adapter (pcmcia-cs project)
+FILES:${PN}-serial-cs = " \
+    ${nonarch_base_libdir}/firmware/cis/MT5634ZLX.cis \
+    ${nonarch_base_libdir}/firmware/cis/RS-COM-2P.cis \
+    ${nonarch_base_libdir}/firmware/cis/COMpad2.cis \
+    ${nonarch_base_libdir}/firmware/cis/COMpad4.cis \
+"
+LICENSE:${PN}-serial-cs = "GPL-2.0-only & MPL-1.1"
+
+# For Sierra Wireless serial_cs - Serial PCMCIA adapter
+FILES:${PN}-sw-serial = " \
+    ${nonarch_base_libdir}/firmware/cis/SW_555_SER.cis \
+    ${nonarch_base_libdir}/firmware/cis/SW_7xx_SER.cis \
+    ${nonarch_base_libdir}/firmware/cis/SW_8xx_SER.cis \
+"
+LICENSE:${PN}-sw-serial = "GPL-3.0-only"
+
+# For smsmdtv - Siano MDTV Core module
+LICENSE:${PN}-siano-license = "Firmware-siano"
+FILES:${PN}-siano-license = "${nonarch_base_libdir}/firmware/LICENCE.siano"
+
+LICENSE:${PN}-smsmdtv = "Firmware-siano"
+FILES:${PN}-smsmdtv = " \
+    ${nonarch_base_libdir}/firmware/cmmb_vega_12mhz.inp \
+    ${nonarch_base_libdir}/firmware/cmmb_venice_12mhz.inp \
+    ${nonarch_base_libdir}/firmware/dvb_nova_12mhz.inp \
+    ${nonarch_base_libdir}/firmware/dvb_nova_12mhz_b0.inp \
+    ${nonarch_base_libdir}/firmware/isdbt_nova_12mhz.inp \
+    ${nonarch_base_libdir}/firmware/isdbt_nova_12mhz_b0.inp \
+    ${nonarch_base_libdir}/firmware/isdbt_rio.inp \
+    ${nonarch_base_libdir}/firmware/sms1xxx-hcw-55xxx-dvbt-02.fw \
+    ${nonarch_base_libdir}/firmware/sms1xxx-hcw-55xxx-isdbt-02.fw \
+    ${nonarch_base_libdir}/firmware/sms1xxx-nova-a-dvbt-01.fw \
+    ${nonarch_base_libdir}/firmware/sms1xxx-nova-b-dvbt-01.fw \
+    ${nonarch_base_libdir}/firmware/sms1xxx-stellar-dvbt-01.fw \
+    ${nonarch_base_libdir}/firmware/tdmb_nova_12mhz.inp \
+"
+RDEPENDS:${PN}-smsmdtv = "${PN}-siano-license"
+
+# For cpia2 - cameras based on Vision's CPiA2
+FILES:${PN}-cpia2 = "${nonarch_base_libdir}/firmware/cpia2/*"
+LICENSE:${PN}-cpia2 = "GPL-2.0-or-later"
+
+# For snd-hda-codec-ca0132 - Creative Sound Core3D codec
+LICENSE:${PN}-ca0132-license = "Firmware-ca0132"
+FILES:${PN}-ca0132-license = "${nonarch_base_libdir}/firmware/LICENCE.ca0132"
+
+LICENSE:${PN}-ca0132 = "Firmware-ca0132"
+FILES:${PN}-ca0132 = " \
+    ${nonarch_base_libdir}/firmware/ctefx.bin \
+    ${nonarch_base_libdir}/firmware/ctspeq.bin \
+"
+RDEPENDS:${PN}-ca0132 = "${PN}-ca0132-license"
+
+# For cxgb3 - Chelsio Terminator 3 1G/10G Ethernet adapter
+LICENSE:${PN}-cxgb3-license = "Firmware-cxgb3"
+FILES:${PN}-cxgb3-license = "${nonarch_base_libdir}/firmware/LICENCE.cxgb3"
+
+LICENSE:${PN}-cxgb3 = "Firmware-cxgb3 & GPL-2.0-only"
+FILES:${PN}-cxgb3 = "${nonarch_base_libdir}/firmware/cxgb3/*"
+RDEPENDS:${PN}-cxgb3 = "${PN}-cxgb3-license"
+
+# For cxgb4 - Chelsio Terminator 4/5/6 1/10/25/40/100G Ethernet adapter
+LICENSE:${PN}-chelsio-firmware-license = "Firmware-chelsio_firmware"
+FILES:${PN}-chelsio-firmware-license = "${nonarch_base_libdir}/firmware/LICENCE.chelsio_firmware"
+
+LICENSE:${PN}-cxgb4 = "Firmware-chelsio_firmware"
+FILES:${PN}-cxgb4 = "${nonarch_base_libdir}/firmware/cxgb4/*"
+RDEPENDS:${PN}-cxgb4 = "${PN}-chelsio-firmware-license"
+
+# For dabusb - Digital Audio Broadcasting (DAB) Receiver for USB and Linux
+LICENSE:${PN}-dabusb-license = "Firmware-dabusb"
+FILES:${PN}-dabusb-license = "${nonarch_base_libdir}/firmware/LICENCE.dabusb"
+
+LICENSE:${PN}-dabusb = "Firmware-dabusb"
+FILES:${PN}-dabusb = "${nonarch_base_libdir}/firmware/dabusb/*"
+RDEPENDS:${PN}-dabusb = "${PN}-dabusb-license"
+
+# For dsp56k - Atari DSP56k support
+LICENSE:${PN}-dsp56k = "GPL-2.0-or-later"
+FILES:${PN}-dsp56k = "${nonarch_base_libdir}/firmware/dsp56k/*"
+
+# For dib0700 - DiBcom dib0700 USB DVB bridge driver
+LICENSE:${PN}-dib0700-license = "Firmware-dib0700"
+FILES:${PN}-dib0700-license = "${nonarch_base_libdir}/firmware/LICENSE.dib0700"
+
+LICENSE:${PN}-dib0700 = "Firmware-dib0700"
+FILES:${PN}-dib0700 = "${nonarch_base_libdir}/firmware/dvb-usb-dib0700-1.20.fw"
+RDEPENDS:${PN}-dib0700 = "${PN}-dib0700-license"
+
+# For it9135 - ITEtech IT913x DVB-T USB driver
+LICENSE:${PN}-it913x-license = "Firmware-it913x"
+FILES:${PN}-it913x-license = "${nonarch_base_libdir}/firmware/LICENCE.it913x"
+
+LICENSE:${PN}-it9135 = "Firmware-it913x"
+FILES:${PN}-it9135 = "${nonarch_base_libdir}/firmware/dvb-usb-it9135*"
+RDEPENDS:${PN}-it9135 = "${PN}-it913x-license"
+
+# For drxk - Micronas DRX-K demodulator driver
+LICENSE:${PN}-drxk-license = "Firmware-drxk"
+FILES:${PN}-drxk-license = "${nonarch_base_libdir}/firmware/LICENSE.drxk"
+
+LICENSE:${PN}-drxk = "Firmware-drxk"
+FILES:${PN}-drxk = "${nonarch_base_libdir}/firmware/dvb-usb-terratec-h5-drxk.fw"
+RDEPENDS:${PN}-drxk = "${PN}-drxk-license"
+
+# For e100 - Intel PRO/100 Ethernet NIC
+LICENSE:${PN}-e100-license = "Firmware-e100"
+FILES:${PN}-e100-license = "${nonarch_base_libdir}/firmware/LICENCE.e100"
+
+LICENSE:${PN}-e100 = "Firmware-e100"
+FILES:${PN}-e100 = "${nonarch_base_libdir}/firmware/e100/*"
+RDEPENDS:${PN}-e100 = "${PN}-e100-license"
+
+# For io_ti - USB Inside Out Edgeport Serial Driver (TI Devices)
+LICENSE:${PN}-io-ti = "GPL-2.0-or-later"
+FILES:${PN}-io-ti = "${nonarch_base_libdir}/firmware/edgeport/down3.bin"
+
+# For io_edgeport - USB Inside Out Edgeport Serial Driver
+LICENSE:${PN}-io-edgeport = "GPL-2.0-or-later"
+FILES:${PN}-io-edgeport = "${nonarch_base_libdir}/firmware/edgeport/*"
+
+# For emi26 - EMI 2|6 USB Audio interface
+LICENSE:${PN}-emi26-license = "Firmware-emi26"
+FILES:${PN}-emi26-license = "${nonarch_base_libdir}/firmware/LICENCE.emi26"
+
+LICENSE:${PN}-emi26 = "Firmware-emi26"
+FILES:${PN}-emi26 = "${nonarch_base_libdir}/firmware/emi26/*"
+RDEPENDS:${PN}-emi26 = "${PN}-drxk-license"
+
+# For ene-ub6250 - ENE UB6250 SD card reader driver
+LICENSE:${PN}-ene-firmware-license = "Firmware-ene_firmware"
+FILES:${PN}-ene-firmware-license = "${nonarch_base_libdir}/firmware/LICENCE.ene_firmware"
+
+LICENSE:${PN}-ene-ub6250 = "Firmware-ene_firmware"
+FILES:${PN}-ene-ub6250 = "${nonarch_base_libdir}/firmware/ene-ub6250/*"
+RDEPENDS:${PN}-ene-ub6250 = "${PN}-ene-firmware-license"
+
+# For go7007-s2250
+LICENSE:${PN}-go7007-s2250-license = "Firmware-go7007-s2250"
+FILES:${PN}-go7007-s2250-license = "${nonarch_base_libdir}/firmware/LICENCE.go7007-s2250"
+
+LICENSE:${PN}-go7007-s2250 = "Firmware-go7007-s2250"
+FILES:${PN}-go7007-s2250 = " \
+    ${nonarch_base_libdir}/firmware/go7007/s2250* \
+    ${nonarch_base_libdir}/firmware/s2250* \
+"
+RDEPENDS:${PN}-go7007-s2250 = "${PN}-go7007-s2250-license"
+
+# For go7007
+LICENSE:${PN}-go7007-license = "Firmware-go7007"
+FILES:${PN}-go7007-license = "${nonarch_base_libdir}/firmware/LICENCE.go7007"
+
+LICENSE:${PN}-go7007 = "Firmware-go7007"
+FILES:${PN}-go7007 = "${nonarch_base_libdir}/firmware/go7007/*"
+RDEPENDS:${PN}-go7007 = "${PN}-go7007-license"
+
+# For hfi1 - Intel OPA Gen 1 adapter
+LICENSE:${PN}-hfi1-license = "Firmware-hfi1_firmware"
+FILES:${PN}-hfi1-license = "${nonarch_base_libdir}/firmware/LICENSE.hfi1_firmware"
+
+LICENSE:${PN}-hfi1 = "Firmware-hfi1_firmware"
+FILES:${PN}-hfi1 = "${nonarch_base_libdir}/firmware/hfi1_*"
+RDEPENDS:${PN}-hfi1 = "${PN}-hfi1-license"
+
+# For inside-secure - Inside Secure EIP197 crypto driver
+LICENSE:${PN}-inside-secure-license = "Firmware-inside-secure"
+FILES:${PN}-inside-secure-license = "${nonarch_base_libdir}/firmware/LICENCE.inside-secure"
+
+LICENSE:${PN}-inside-secure = "Firmware-inside-secure"
+FILES:${PN}-inside-secure = "${nonarch_base_libdir}/firmware/inside-secure/*"
+RDEPENDS:${PN}-inside-secure = "${PN}-inside-secure-license"
+
+# For snd_soc_catpt - Intel AudioDSP driver for HSW/BDW platforms
+LICENSE:${PN}-intcsst2-license = "Firmware-IntcSST2"
+FILES:${PN}-intcsst2-license = "${nonarch_base_libdir}/firmware/LICENCE.IntcSST2"
+
+LICENSE:${PN}-snd-soc-catpt = "Firmware-IntcSST2"
+FILES:${PN}-snd-soc-catpt = " \
+    ${nonarch_base_libdir}/firmware/intel/catpt/bdw/dsp_basefw.bin \
+    ${nonarch_base_libdir}/firmware/intel/IntcSST2.bin \
+"
+RDEPENDS:${PN}-snd-soc-catpt = "${PN}-intcsst2-license"
+
+# For snd_intel_sst_core
+LICENSE:${PN}-fw-sst-0f28-license = "Firmware-fw_sst_0f28"
+FILES:${PN}-fw-sst-0f28-license = "${nonarch_base_libdir}/firmware/LICENCE.fw_sst_0f28"
+
+LICENSE:${PN}-snd-intel-sst-core = "Firmware-fw_sst_0f28"
+FILES:${PN}-snd-intel-sst-core = "${nonarch_base_libdir}/firmware/intel/fw_sst_*"
+RDEPENDS:${PN}-snd-intel-sst-core = "${PN}-fw-sst-0f28-license"
+
+# For atomisp - Intel IPU2 (Image Processing Unit 2) driver
+LICENSE:${PN}-ivsc-license = "Firmware-ivsc"
+FILES:${PN}-ivsc-license = "${nonarch_base_libdir}/firmware/LICENSE.ivsc"
+
+LICENSE:${PN}-atomisp = "Firmware-ivsc"
+FILES:${PN}-atomisp = "${nonarch_base_libdir}/firmware/intel/ipu/shisp_240*"
+RDEPENDS:${PN}-atomisp = "${PN}-ivsc-license"
+
+# For intel-ipu6-isys - Intel IPU6 (Image Processing Unit 6) driver
+LICENSE:${PN}-intel-ipu6-isys = "Firmware-ivsc"
+FILES:${PN}-intel-ipu6-isys = "${nonarch_base_libdir}/firmware/intel/ipu/ipu6*"
+RDEPENDS:${PN}-intel-ipu6-isys = "${PN}-ivsc-license"
+
+# For mei-vsc-hw - Intel Visual Sensing Controller
+LICENSE:${PN}-mei-vsc-hw = "Firmware-ivsc"
+FILES:${PN}-mei-vsc-hw = "${nonarch_base_libdir}/firmware/intel/vsc/*"
+RDEPENDS:${PN}-mei-vsc-hw = "${PN}-ivsc-license"
+
+# For ipu3-imgu - Intel IPU3 (3rd Gen Image Processing Unit) driver
+LICENSE:${PN}-ipu3-firmware-license = "Firmware-ipu3_firmware"
+FILES:${PN}-ipu3-firmware-license = "${nonarch_base_libdir}/firmware/LICENSE.ipu3_firmware"
+
+LICENSE:${PN}-ipu3-imgu = "Firmware-ipu3_firmware"
+FILES:${PN}-ipu3-imgu = " \
+    ${nonarch_base_libdir}/firmware/intel/ipu/irci_irci_ecr-master_20161208_0213_20170112_1500.bin \
+    ${nonarch_base_libdir}/firmware/intel/ipu3-fw.bin \
+    ${nonarch_base_libdir}/firmware/intel/irci_irci_ecr-master_20161208_0213_20170112_1500.bin \
+"
+RDEPENDS:${PN}-ipu3-imgu = "${PN}-ipu3-firmware-license"
+
+# For intel-ipu7-isys - Intel IPU7 (Image Processing Unit 7) driver
+LICENSE:${PN}-intel-ipu7-isys = "Firmware-intel"
+FILES:${PN}-intel-ipu7-isys = "${nonarch_base_libdir}/firmware/intel/ipu/ipu7*"
+RDEPENDS:${PN}-intel-ipu7-isys = "${PN}-intel-license"
+
+# For intel_vpu - Intel NPU driver
+LICENSE:${PN}-intel-vpu-license = "Firmware-intel_vpu"
+FILES:${PN}-intel-vpu-license = "${nonarch_base_libdir}/firmware/LICENSE.intel_vpu"
+
+LICENSE:${PN}-intel-vpu = "Firmware-intel_vpu"
+FILES:${PN}-intel-vpu = "${nonarch_base_libdir}/firmware/intel/vpu/*"
+RDEPENDS:${PN}-intel-vpu = "${PN}-intel-vpu-license"
+
+# For isci - Intel C600 SAS controller driver
+LICENSE:${PN}-isci = "GPL-2.0-only"
+FILES:${PN}-isci = "${nonarch_base_libdir}/firmware/isci/*"
+
+# For ixp4xx-npe - Intel IXP4xx XScale Network Processing Engine (NPE) Firmware
+LICENSE:${PN}-ixp4xx-license = "Firmware-ixp4xx"
+FILES:${PN}-ixp4xx-license = "${nonarch_base_libdir}/firmware/LICENSE.ixp4xx"
+
+LICENSE:${PN}-ixp4xx-npe = "Firmware-ixp4xx"
+FILES:${PN}-ixp4xx-npe = "${nonarch_base_libdir}/firmware/ixp4xx/*"
+RDEPENDS:${PN}-ixp4xx-npe = "${PN}-ixp4xx-license"
+
+# For kaweth - USB KLSI KL5USB101-based Ethernet device
+LICENSE:${PN}-kaweth-license = "Firmware-kaweth"
+FILES:${PN}-kaweth-license = "${nonarch_base_libdir}/firmware/LICENCE.kaweth"
+
+LICENSE:${PN}-kaweth = "Firmware-kaweth"
+FILES:${PN}-kaweth = "${nonarch_base_libdir}/firmware/kaweth/*"
+RDEPENDS:${PN}-kaweth = "${PN}-kaweth-license"
+
+# For keyspan - USB Keyspan USA-xxx serial device
+LICENSE:${PN}-keyspan-license = "Firmware-keyspan"
+FILES:${PN}-keyspan-license = "${nonarch_base_libdir}/firmware/LICENCE.keyspan"
+
+LICENSE:${PN}-keyspan = "Firmware-keyspan"
+FILES:${PN}-keyspan = "${nonarch_base_libdir}/firmware/keyspan/*"
+RDEPENDS:${PN}-keyspan = "${PN}-keyspan-license"
+
+# For keyspan_pda - USB Keyspan PDA single-port serial device
+LICENSE:${PN}-keyspan-pda = "GPL-2.0-or-later"
+FILES:${PN}-keyspan-pda = "${nonarch_base_libdir}/firmware/keyspan_pda/*"
+
+# For mga - Matrox G200/G400/G550
+LICENSE:${PN}-mga-license = "Firmware-mga"
+FILES:${PN}-mga-license = "${nonarch_base_libdir}/firmware/LICENSE.mga"
+
+LICENSE:${PN}-mga = "Firmware-mga"
+FILES:${PN}-mga = "${nonarch_base_libdir}/firmware/matrox/*"
+RDEPENDS:${PN}-mga = "${PN}-mga-license"
+
+# For myri10ge - Myri10GE 10GbE NIC driver
+LICENSE:${PN}-myri10ge-firmware-license = "Firmware-myri10ge_firmware"
+FILES:${PN}-myri10ge-firmware-license = "${nonarch_base_libdir}/firmware/LICENCE.myri10ge_firmware"
+
+LICENSE:${PN}-myri10ge = "Firmware-myri10ge_firmware"
+FILES:${PN}-myri10ge = "${nonarch_base_libdir}/firmware/myri10ge_*"
+RDEPENDS:${PN}-myri10ge = "${PN}-myri10ge-firmware-license"
+
+# For smc91c92_cs - SMC 91Cxx PCMCIA
+LICENSE:${PN}-smc91c92-cs = "GPL-1.0-only"
+FILES:${PN}-smc91c92-cs = "${nonarch_base_libdir}/firmware/ositech/Xilinx7OD.bin"
+
+# For qla1280 - Qlogic QLA 1240/1x80/1x160 SCSI support
+LICENSE:${PN}-qla1280-license = "Firmware-qla1280"
+FILES:${PN}-qla1280-license = "${nonarch_base_libdir}/firmware/LICENCE.qla1280"
+
+LICENSE:${PN}-qla1280 = "Firmware-qla1280"
+FILES:${PN}-qla1280 = " \
+    ${nonarch_base_libdir}/firmware/qlogic/1040.bin \
+    ${nonarch_base_libdir}/firmware/qlogic/1280.bin \
+    ${nonarch_base_libdir}/firmware/qlogic/12160.bin \
+"
+RDEPENDS:${PN}-qla1280 = "${PN}-qla1280-license"
+
+# For ib_qib - QLogic Infiniband
+LICENSE:${PN}-ib-qib-license = "Firmware-ib_qib"
+FILES:${PN}-ib-qib-license = "${nonarch_base_libdir}/firmware/LICENSE.ib_qib"
+
+LICENSE:${PN}-ib-qib = "Firmware-ib_qib"
+FILES:${PN}-ib-qib = "${nonarch_base_libdir}/firmware/qlogic/sd7220.fw"
+RDEPENDS:${PN}-ib-qib = "${PN}-ib-qib-license"
+
+# For xhci-rcar - Renesas R-Car Gen2/3 USB 3.0 host controller driver
+LICENSE:${PN}-r8a779x-usb3-license = "Firmware-r8a779x_usb3"
+FILES:${PN}-r8a779x-usb3-license = "${nonarch_base_libdir}/firmware/LICENCE.r8a779x_usb3"
+
+LICENSE:${PN}-xhci-rcar = "Firmware-r8a779x_usb3"
+FILES:${PN}-xhci-rcar = "${nonarch_base_libdir}/firmware/r8a779x_usb3_*"
+RDEPENDS:${PN}-xhci-rcar = "${PN}-r8a779x-usb3-license"
+
+# For r128 - ATI Rage 128
+LICENSE:${PN}-r128 = "MIT"
+FILES:${PN}-r128 = "${nonarch_base_libdir}/firmware/r128/*"
+
+# For rt1320 - Realtek rt1320 ASoC audio driver.
+LICENSE:${PN}-rt1320-license = "Firmware-rt1320"
+FILES:${PN}-rt1320-license = "${nonarch_base_libdir}/firmware/LICENSE.rt1320"
+
+LICENSE:${PN}-rt1320 = "Firmware-rt1320"
+FILES:${PN}-rt1320 = "${nonarch_base_libdir}/firmware/realtek/rt1320/*"
+RDEPENDS:${PN}-rt1320 = "${PN}-rt1320-license"
+
+# For rp2 - Comtrol RocketPort 2 serial driver
+LICENSE:${PN}-rp2-license = "Firmware-rp2"
+FILES:${PN}-rp2-license = "${nonarch_base_libdir}/firmware/LICENSE.rp2"
+
+LICENSE:${PN}-rp2 = "Firmware-rp2"
+FILES:${PN}-rp2 = "${nonarch_base_libdir}/firmware/rp2.fw"
+RDEPENDS:${PN}-rp2 = "${PN}-rp2-license"
+
+# For s5p-mfc - Samsung MFC video encoder/decoder driver
+LICENSE:${PN}-s5p-mfc-license = "Firmware-s5p-mfc"
+FILES:${PN}-s5p-mfc-license = "${nonarch_base_libdir}/firmware/LICENSE.s5p-mfc"
+
+LICENSE:${PN}-s5p-mfc = "Firmware-s5p-mfc"
+FILES:${PN}-s5p-mfc = "${nonarch_base_libdir}/firmware/s5p-mfc*"
+RDEPENDS:${PN}-s5p-mfc = "${PN}-s5p-mfc-license"
+
+# For snd-sb16-csp - Sound Blaster 16/AWE CSP support
+LICENSE:${PN}-snd-sb16-csp = "GPL-2.0-or-later"
+FILES:${PN}-snd-sb16-csp = "${nonarch_base_libdir}/firmware/sb16/*"
+
+# For slicoss - Alacritech IS-NIC products
+LICENSE:${PN}-alacritech-license = "Firmware-alacritech"
+FILES:${PN}-alacritech-license = "${nonarch_base_libdir}/firmware/LICENCE.alacritech"
+
+LICENSE:${PN}-slicoss = "Firmware-alacritech"
+FILES:${PN}-slicoss = "${nonarch_base_libdir}/firmware/slicoss/*"
+RDEPENDS:${PN}-slicoss = "${PN}-alacritech-license"
+
+LICENSE:${PN}-sxg = "Firmware-alacritech"
+FILES:${PN}-sxg = "${nonarch_base_libdir}/firmware/sxg/*"
+RDEPENDS:${PN}-sxg = "${PN}-alacritech-license"
+
+# For tehuti - Tehuti Networks 10G Ethernet
+LICENSE:${PN}-tehuti-license = "Firmware-tehuti"
+FILES:${PN}-tehuti-license = "${nonarch_base_libdir}/firmware/LICENSE.tehuti"
+
+LICENSE:${PN}-tehuti = "Firmware-tehuti"
+FILES:${PN}-tehuti = "${nonarch_base_libdir}/firmware/tehuti/*"
+RDEPENDS:${PN}-tehuti = "${PN}-tehuti-license"
+
+# For tg3 - Broadcom Tigon3 based gigabit Ethernet cards
+LICENSE:${PN}-tigon-license = "Firmware-tigon"
+FILES:${PN}-tigon-license = "${nonarch_base_libdir}/firmware/LICENCE.tigon"
+
+LICENSE:${PN}-tg3 = "Firmware-tigon"
+FILES:${PN}-tg3 = "${nonarch_base_libdir}/firmware/tigon/*"
+RDEPENDS:${PN}-tg3 = "${PN}-tigon-license"
+
+# For tlg2300 - Telgent 2300 V4L/DVB driver.
+LICENSE:${PN}-tlg2300-license = "Firmware-tlg2300"
+FILES:${PN}-tlg2300-license = "${nonarch_base_libdir}/firmware/LICENSE.tlg2300"
+
+LICENSE:${PN}-tlg2300 = "Firmware-tlg2300"
+FILES:${PN}-tlg2300 = "${nonarch_base_libdir}/firmware/tlg2300*"
+RDEPENDS:${PN}-tlg2300 = "${PN}-tlg2300-license"
+
+# For Mont-TSSE - Mont-TSSE(TM) Crypto Algorithm Accelerator Driver
+LICENSE:${PN}-montage-license = "Firmware-montage"
+FILES:${PN}-montage-license = "${nonarch_base_libdir}/firmware/LICENSE.montage"
+
+LICENSE:${PN}-mont-tsse = "Firmware-montage"
+FILES:${PN}-mont-tsse = "${nonarch_base_libdir}/firmware/tsse_firmware.bin"
+RDEPENDS:${PN}-mont-tsse = "${PN}-montage-license"
+
+# For ueagle-atm - Driver for USB ADSL Modems based on Eagle IV Chipset
+LICENSE:${PN}-ueagle-atm4-firmware-license = "Firmware-ueagle-atm4-firmware"
+FILES:${PN}-ueagle-atm4-firmware-license = "${nonarch_base_libdir}/firmware/LICENCE.ueagle-atm4-firmware"
+
+LICENSE:${PN}-ueagle-atm = "Firmware-ueagle-atm4-firmware"
+FILES:${PN}-ueagle-atm = " \
+    ${nonarch_base_libdir}/firmware/ueagle-atm/CMV4p.bin.v2 \
+    ${nonarch_base_libdir}/firmware/ueagle-atm/DSP4p.bin \
+    ${nonarch_base_libdir}/firmware/ueagle-atm/eagleIV.fw \
+"
+RDEPENDS:${PN}-ueagle-atm = "${PN}-ueagle-atm4-firmware-license"
+
+# For usbdux/usbduxfast/usbduxsigma - usbdux data acquisition cards
+LICENSE:${PN}-usbdux = "GPL-2.0-or-later"
+FILES:${PN}-usbdux = "${nonarch_base_libdir}/firmware/usbdux*"
+
+# For cx231xx - Conexant Cx23100/101/102 USB broadcast A/V decoder
+LICENSE:${PN}-conexant-license = "Firmware-conexant"
+FILES:${PN}-conexant-license = "${nonarch_base_libdir}/firmware/LICENSE.conexant"
+
+LICENSE:${PN}-cx231xx = "Firmware-conexant"
+FILES:${PN}-cx231xx = "${nonarch_base_libdir}/firmware/v4l-cx231xx*"
+RDEPENDS:${PN}-cx231xx = "${PN}-conexant-license"
+
+LICENSE:${PN}-cx23418 = "Firmware-conexant"
+FILES:${PN}-cx23418 = "${nonarch_base_libdir}/firmware/v4l-cx23418*"
+RDEPENDS:${PN}-cx23418 = "${PN}-conexant-license"
+
+LICENSE:${PN}-cx23885 = "Firmware-conexant"
+FILES:${PN}-cx23885 = "${nonarch_base_libdir}/firmware/v4l-cx23885*"
+RDEPENDS:${PN}-cx23885 = "${PN}-conexant-license"
+
+LICENSE:${PN}-cx23840 = "Firmware-conexant"
+FILES:${PN}-cx23840 = "${nonarch_base_libdir}/firmware/v4l-cx25840*"
+RDEPENDS:${PN}-cx23840 = "${PN}-conexant-license"
+
+# For vxge - Exar X3100 Series 10GbE PCIe I/O Virtualized Server Adapter
+LICENSE:${PN}-vxge-license = "Firmware-vxge"
+FILES:${PN}-vxge-license = "${nonarch_base_libdir}/firmware/LICENSE.vxge"
+
+LICENSE:${PN}-vxge = "Firmware-vxge"
+FILES:${PN}-vxge = "${nonarch_base_libdir}/firmware/vxge/*"
+RDEPENDS:${PN}-vxge = "${PN}-vxge-license"
+
+# For whiteheat - USB ConnectTech WhiteHEAT serial device
+LICENSE:${PN}-whiteheat = "GPL-2.0-only"
+FILES:${PN}-whiteheat = "${nonarch_base_libdir}/firmware/whiteheat*"
+
+# For wil6210 - Qualcomm Atheros support for 11ad family of chips
+LICENSE:${PN}-qualcommatheros-ath10k-license = "Firmware-qualcommAthos_ath10k"
+FILES:${PN}-qualcommatheros-ath10k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ath10k"
+
+LICENSE:${PN}-wil6210 = "Firmware-qualcommAthos_ath10k"
+FILES:${PN}-wil6210 = "${nonarch_base_libdir}/firmware/wil6210*"
+RDEPENDS:${PN}-wil6210 = "${PN}-qualcommatheros-ath10k-license"
+
+# For xe - Intel Graphics driver
+LICENSE:${PN}-xe-license = "Firmware-xe"
+FILES:${PN}-xe-license = "${nonarch_base_libdir}/firmware/LICENSE.xe"
+
+LICENSE:${PN}-xe = "Firmware-xe"
+FILES:${PN}-xe = "${nonarch_base_libdir}/firmware/xe/*"
+RDEPENDS:${PN}-xe = "${PN}-xe-license"
+
 # For other firmwares
 # Maybe split out to separate packages when needed.
 LICENSE:${PN} = "\
@@ -2268,6 +3262,7 @@ LICENSE:${PN} = "\
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
     & Firmware-keyspan \
+    & Firmware-lenovo \
     & Firmware-mellanox \
     & Firmware-mga \
     & Firmware-montage \
@@ -2311,8 +3306,13 @@ LICENSE:${PN} = "\
     & WHENCE \
 "
 
+# The goal for this recipe is to creata bunch of breakout packages for the
+# firmware so that you can choose which files to include and not have to pull
+# them all in.  To that end, we do want any files to be part of the
+# linux-firmware package.  So set it to "".  Do not change this.
+FILES:${PN} = ""
+
 FILES:${PN}-license += "${nonarch_base_libdir}/firmware/LICEN*"
-FILES:${PN} += "${nonarch_base_libdir}/firmware/*"
 RDEPENDS:${PN} += "${PN}-license"
 RDEPENDS:${PN} += "${PN}-whence-license"
 
-- 
2.17.1


