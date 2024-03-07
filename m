Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4935C54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 12:05:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21594.1709813131040006296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 04:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCE431FB
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Mar 2024 04:06:07 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F65E3F762
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Mar 2024 04:05:30 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-firmware: remove pointless -license packages
Date: Thu,  7 Mar 2024 12:05:26 +0000
Message-Id: <20240307120526.774895-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307120526.774895-1-ross.burton@arm.com>
References: <20240307120526.774895-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 12:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196789

From: Ross Burton <ross.burton@arm.com>

The linux-firmware recipe goes to a lot of effort to attempt to package
the license texts into separate packages, and add dependencies so that
installing a piece of firmware will also ship the relevant license text.

However, licence.bbclass can already do this, because the requirement to
ship license texts alongside binaries isn't specific to the firmware.

This class will collate the licenses (extended by NON_GENERIC_LICENSE
assignments) and optionally put the license texts into a -lic package.
These packages can be automatically installed into any image by adding
lic-pkgs to IMAGE_FEATURES.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-firmware/linux-firmware_20231211.bb | 412 ++----------------
 1 file changed, 41 insertions(+), 371 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index b6b98628f3f..bb949bc5040 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -258,33 +258,30 @@ do_compile() {
=20
 do_install() {
         oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_base_libdir=
}/firmware' ${PACKAGECONFIG_CONFARGS}
-        cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
=20
=20
-PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
-             ${PN}-cw1200-license ${PN}-cw1200 \
-             ${PN}-ralink-license ${PN}-ralink \
-             ${PN}-mt76x-license ${PN}-mt7601u ${PN}-mt7650 ${PN}-mt76x2=
 \
-             ${PN}-radeon-license ${PN}-radeon \
-             ${PN}-amdgpu-license ${PN}-amdgpu \
-             ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
-             ${PN}-mediatek-license ${PN}-mediatek \
-             ${PN}-microchip-license ${PN}-microchip \
-             ${PN}-moxa-license ${PN}-moxa \
+PACKAGES =3D+ "${PN}-amphion-vpu \
+             ${PN}-cw1200 \
+             ${PN}-ralink \
+             ${PN}-mt7601u ${PN}-mt7650 ${PN}-mt76x2 \
+             ${PN}-radeon \
+             ${PN}-amdgpu \
+             ${PN}-pcie8897 ${PN}-pcie8997 \
+             ${PN}-mediatek \
+             ${PN}-microchip \
+             ${PN}-moxa \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-s=
d8801 \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
-             ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx $=
{PN}-wl18xx \
-             ${PN}-ti-keystone-license ${PN}-ti-keystone \
-             ${PN}-vt6656-license ${PN}-vt6656 \
+             ${PN}-wlcommon ${PN}-wl12xx ${PN}-wl18xx \
+             ${PN}-ti-keystone \
+             ${PN}-vt6656 \
              ${PN}-rs9113 ${PN}-rs9116 \
-             ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl81=
92ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
+             ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192=
su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8761 \
              ${PN}-rtl8168 \
              ${PN}-rtl8822 \
              ${PN}-rtl-nic \
-             ${PN}-cypress-license \
-             ${PN}-broadcom-license \
              ${PN}-bcm-0bb4-0306 \
              ${PN}-bcm43143 \
              ${PN}-bcm43236b \
@@ -318,15 +315,13 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amph=
ion-vpu \
              ${PN}-bcm4373 \
              ${PN}-bcm43xx \
              ${PN}-bcm43xx-hdr \
-             ${PN}-cirrus-license ${PN}-cirrus \
-             ${PN}-cnm-license ${PN}-cnm \
-             ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k=
 ${PN}-ath9k ${PN}-ath3k \
+             ${PN}-cirrus \
+             ${PN}-cnm \
+             ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath=
3k \
              ${PN}-carl9170 \
-             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-at=
h10k ${PN}-ath11k ${PN}-qca \
-             \
-             ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-=
imx7d \
-             \
-             ${PN}-iwlwifi-license ${PN}-iwlwifi \
+             ${PN}-ar3k ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
+             ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
+             ${PN}-iwlwifi \
              ${PN}-iwlwifi-135-6 \
              ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-iwlwifi-316=
0-9 \
              ${PN}-iwlwifi-3160-10 ${PN}-iwlwifi-3160-12 ${PN}-iwlwifi-3=
160-13 \
@@ -339,23 +334,21 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amph=
ion-vpu \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 =
\
              ${PN}-iwlwifi-9000 \
              ${PN}-iwlwifi-misc \
-             ${PN}-ibt-license ${PN}-ibt \
+             ${PN}-ibt \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-=
hw-37-8 \
              ${PN}-ibt-17 \
              ${PN}-ibt-20 \
              ${PN}-ibt-misc \
-             ${PN}-i915-license ${PN}-i915 \
-             ${PN}-ice-license ${PN}-ice \
-             ${PN}-ice-enhanced-license ${PN}-ice-enhanced \
-             ${PN}-adsp-sst-license ${PN}-adsp-sst \
+             ${PN}-i915 \
+             ${PN}-ice \
+             ${PN}-ice-enhanced \
+             ${PN}-adsp-sst \
              ${PN}-bnx2 \
              ${PN}-bnx2x \
              ${PN}-liquidio \
              ${PN}-mellanox \
-             ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
              ${PN}-nvidia-gpu \
-             ${PN}-nxp-license \
              ${PN}-nxp8987-sdio \
              ${PN}-nxp8997-common \
              ${PN}-nxp8997-pcie \
@@ -365,15 +358,14 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amph=
ion-vpu \
              ${PN}-nxp9098-sdio \
              ${PN}-nxpiw416-sdio \
              ${PN}-nxpiw612-sdio \
-             ${PN}-nxp-mc-license ${PN}-nxp-mc \
-             ${PN}-netronome-license ${PN}-netronome \
-             ${PN}-olpc-license ${PN}-olpc \
-             ${PN}-phanfw-license ${PN}-phanfw \
-             ${PN}-powervr-license ${PN}-powervr \
+             ${PN}-nxp-mc \
+             ${PN}-netronome \
+             ${PN}-olpc \
+             ${PN}-phanfw \
+             ${PN}-powervr \
              ${PN}-prestera \
-             ${PN}-qat ${PN}-qat-license \
+             ${PN}-qat \
              ${PN}-qed \
-             ${PN}-qcom-license ${PN}-qcom-yamato-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-=
5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-ad=
reno-a4xx ${PN}-qcom-adreno-a530 \
@@ -392,36 +384,26 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amph=
ion-vpu \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom=
-sm8250-compute \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
-             ${PN}-qla2xxx ${PN}-qla2xxx-license \
-             ${PN}-rockchip-license ${PN}-rockchip-dptx \
-             ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
-             ${PN}-lt9611uxc ${PN}-lontium-license \
-             ${PN}-whence-license \
-             ${PN}-wl1251-license ${PN}-wl1251 \
-             ${PN}-xc4000-license ${PN}-xc4000 \
-             ${PN}-xc5000-license ${PN}-xc5000 \
-             ${PN}-xc5000c-license ${PN}-xc5000c \
-             ${PN}-license \
+             ${PN}-qla2xxx \
+             ${PN}-rockchip-dptx \
+             ${PN}-amlogic-vdec \
+             ${PN}-lt9611uxc \
+             ${PN}-wl1251 \
+             ${PN}-xc4000 \
+             ${PN}-xc5000 \
+             ${PN}-xc5000c \
              "
=20
 # For Amphion VPU
 LICENSE:${PN}-amphion-vpu =3D "Firmware-amphion_vpu"
-LICENSE:${PN}-amphion-vpu-license =3D "Firmware-amphion_vpu"
=20
 FILES:${PN}-amphion-vpu =3D "${nonarch_base_libdir}/firmware/amphion/*"
-FILES:${PN}-amphion-vpu-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENSE.amphion_vpu \
-"
-RDEPENDS:${PN}-amphion-vpu +=3D "${PN}-amphion-vpu-license"
=20
 # For cw1200
 LICENSE:${PN}-cw1200 =3D "Firmware-cw1200"
-LICENSE:${PN}-cw1200-license =3D "Firmware-cw1200"
=20
 FILES:${PN}-cw1200 =3D "${nonarch_base_libdir}/firmware/wsm_22.bin"
-FILES:${PN}-cw1200-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
cw1200"
=20
-RDEPENDS:${PN}-cw1200 +=3D "${PN}-cw1200-license"
=20
 # For atheros
 LICENSE:${PN}-ar5523 =3D "Firmware-atheros_firmware"
@@ -429,9 +411,7 @@ LICENSE:${PN}-ar9170 =3D "Firmware-atheros_firmware"
 LICENSE:${PN}-ath3k =3D "Firmware-atheros_firmware"
 LICENSE:${PN}-ath6k =3D "Firmware-atheros_firmware"
 LICENSE:${PN}-ath9k =3D "Firmware-atheros_firmware"
-LICENSE:${PN}-atheros-license =3D "Firmware-atheros_firmware"
=20
-FILES:${PN}-atheros-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.atheros_firmware"
 FILES:${PN}-ar5523 =3D " \
   ${nonarch_base_libdir}/firmware/ar5523.bin \
 "
@@ -453,11 +433,6 @@ FILES:${PN}-ath9k =3D " \
   ${nonarch_base_libdir}/firmware/ath9k_htc/htc_9271-1.4.0.fw \
 "
=20
-RDEPENDS:${PN}-ar5523 +=3D "${PN}-atheros-license"
-RDEPENDS:${PN}-ar9170 +=3D "${PN}-atheros-license"
-RDEPENDS:${PN}-ath6k +=3D "${PN}-atheros-license"
-RDEPENDS:${PN}-ath9k +=3D "${PN}-atheros-license"
-
 # For carl9170
=20
 FILES:${PN}-carl9170 =3D " \
@@ -467,17 +442,13 @@ LICENSE:${PN}-carl9170 =3D "GPL-2.0-or-later"
=20
 # For QualCommAthos
 LICENSE:${PN}-ar3k =3D "Firmware-qualcommAthos_ar3k & Firmware-atheros_f=
irmware"
-LICENSE:${PN}-ar3k-license =3D "Firmware-qualcommAthos_ar3k"
 LICENSE:${PN}-ath10k =3D "Firmware-qualcommAthos_ath10k"
-LICENSE:${PN}-ath10k-license =3D "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca =3D "Firmware-qualcommAthos_ath10k"
=20
-FILES:${PN}-ar3k-license =3D "${nonarch_base_libdir}/firmware/LICENSE.Qu=
alcommAtheros_ar3k"
 FILES:${PN}-ar3k =3D " \
   ${nonarch_base_libdir}/firmware/ar3k \
 "
=20
-FILES:${PN}-ath10k-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
QualcommAtheros_ath10k"
 FILES:${PN}-ath10k =3D " \
   ${nonarch_base_libdir}/firmware/ath10k \
 "
@@ -490,33 +461,19 @@ FILES:${PN}-qca =3D " \
   ${nonarch_base_libdir}/firmware/qca \
 "
=20
-RDEPENDS:${PN}-ar3k +=3D "${PN}-ar3k-license ${PN}-atheros-license"
-RDEPENDS:${PN}-ath10k +=3D "${PN}-ath10k-license"
-RDEPENDS:${PN}-ath11k +=3D "${PN}-ath10k-license"
-RDEPENDS:${PN}-qca +=3D "${PN}-ath10k-license"
-
 # For ralink
 LICENSE:${PN}-ralink =3D "Firmware-ralink-firmware"
-LICENSE:${PN}-ralink-license =3D "Firmware-ralink-firmware"
=20
-FILES:${PN}-ralink-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
ralink-firmware.txt"
 FILES:${PN}-ralink =3D " \
   ${nonarch_base_libdir}/firmware/rt*.bin \
 "
=20
-RDEPENDS:${PN}-ralink +=3D "${PN}-ralink-license"
-
-# For mediatek MT7601U
-LICENSE:${PN}-mt76x-license =3D "Firmware-ralink_a_mediatek_company_firm=
ware"
-FILES:${PN}-mt76x-license =3D "${nonarch_base_libdir}/firmware/LICENCE.r=
alink_a_mediatek_company_firmware"
-
 LICENSE:${PN}-mt7601u =3D "Firmware-ralink_a_mediatek_company_firmware"
=20
 FILES:${PN}-mt7601u =3D " \
   ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin \
   ${nonarch_base_libdir}/firmware/mt7601u.bin \
 "
-RDEPENDS:${PN}-mt7601u +=3D "${PN}-mt76x-license"
=20
 # For MediaTek Bluetooth USB driver 7650
 LICENSE:${PN}-mt7650 =3D "Firmware-ralink_a_mediatek_company_firmware"
@@ -525,7 +482,6 @@ FILES:${PN}-mt7650 =3D " \
   ${nonarch_base_libdir}/firmware/mediatek/mt7650.bin \
   ${nonarch_base_libdir}/firmware/mt7650.bin \
 "
-RDEPENDS:${PN}-mt7650 +=3D "${PN}-mt76x-license"
=20
 # For MediaTek MT76x2 Wireless MACs
 LICENSE:${PN}-mt76x2 =3D "Firmware-ralink_a_mediatek_company_firmware"
@@ -536,68 +492,43 @@ FILES:${PN}-mt76x2 =3D " \
   ${nonarch_base_libdir}/firmware/mediatek/mt7662_rom_patch.bin \
   ${nonarch_base_libdir}/firmware/mt7662_rom_patch.bin \
 "
-RDEPENDS:${PN}-mt76x2 +=3D "${PN}-mt76x-license"
=20
 # For MediaTek
 LICENSE:${PN}-mediatek =3D "Firmware-mediatek"
-LICENSE:${PN}-mediatek-license =3D "Firmware-mediatek"
=20
 FILES:${PN}-mediatek =3D " \
   ${nonarch_base_libdir}/firmware/mediatek/* \
   ${nonarch_base_libdir}/firmware/vpu_d.bin \
   ${nonarch_base_libdir}/firmware/vpu_p.bin \
 "
-FILES:${PN}-mediatek-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.mediatek \
-"
-RDEPENDS:${PN}-mediatek +=3D "${PN}-mediatek-license"
=20
 # For Microchip
 LICENSE:${PN}-microchip =3D "Firmware-microchip"
-LICENSE:${PN}-microchip-license =3D "Firmware-microchip"
=20
 FILES:${PN}-microchip =3D "${nonarch_base_libdir}/firmware/microchip/*"
-FILES:${PN}-microchip-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.microchip \
-"
-RDEPENDS:${PN}-microchip +=3D "${PN}-microchip-license"
=20
 # For MOXA
 LICENSE:${PN}-moxa =3D "Firmware-moxa"
-LICENSE:${PN}-moxa-license =3D "Firmware-moxa"
=20
 FILES:${PN}-moxa =3D "${nonarch_base_libdir}/firmware/moxa"
-FILES:${PN}-moxa-license =3D "${nonarch_base_libdir}/firmware/LICENCE.mo=
xa"
-
-RDEPENDS:${PN}-moxa +=3D "${PN}-moxa-license"
=20
 # For radeon
=20
 LICENSE:${PN}-radeon =3D "Firmware-radeon"
-LICENSE:${PN}-radeon-license =3D "Firmware-radeon"
-
-FILES:${PN}-radeon-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
radeon"
 FILES:${PN}-radeon =3D " \
   ${nonarch_base_libdir}/firmware/radeon \
 "
=20
-RDEPENDS:${PN}-radeon +=3D "${PN}-radeon-license"
-
 # For amdgpu
 LICENSE:${PN}-amdgpu =3D "Firmware-amdgpu"
-LICENSE:${PN}-amdgpu-license =3D "Firmware-amdgpu"
=20
-FILES:${PN}-amdgpu-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
amdgpu"
 FILES:${PN}-amdgpu =3D " \
   ${nonarch_base_libdir}/firmware/amdgpu \
 "
=20
-RDEPENDS:${PN}-amdgpu +=3D "${PN}-amdgpu-license"
-
 # For lontium
 LICENSE:${PN}-lt9611uxc =3D "Firmware-Lontium"
=20
-FILES:${PN}-lontium-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.Lontium"
 FILES:${PN}-lt9611uxc =3D "${nonarch_base_libdir}/firmware/lt9611uxc_fw.=
bin"
=20
 # For marvell
@@ -612,9 +543,7 @@ LICENSE:${PN}-sd8887 =3D "Firmware-Marvell"
 LICENSE:${PN}-sd8897 =3D "Firmware-Marvell"
 LICENSE:${PN}-sd8997 =3D "Firmware-Marvell"
 LICENSE:${PN}-usb8997 =3D "Firmware-Marvell"
-LICENSE:${PN}-marvell-license =3D "Firmware-Marvell"
=20
-FILES:${PN}-marvell-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.Marvell"
 FILES:${PN}-pcie8897 =3D " \
   ${nonarch_base_libdir}/firmware/mrvl/pcie8897_uapsta.bin \
 "
@@ -659,22 +588,9 @@ FILES:${PN}-usb8997 =3D " \
   ${nonarch_base_libdir}/firmware/mrvl/usbusb8997_combo_v4.bin \
 "
=20
-RDEPENDS:${PN}-sd8686 +=3D "${PN}-marvell-license"
-RDEPENDS:${PN}-sd8688 +=3D "${PN}-marvell-license"
-RDEPENDS:${PN}-sd8787 +=3D "${PN}-marvell-license"
-RDEPENDS:${PN}-sd8797 +=3D "${PN}-marvell-license"
-RDEPENDS:${PN}-sd8801 +=3D "${PN}-marvell-license"
-RDEPENDS:${PN}-sd8887 +=3D "${PN}-marvell-license"
-RDEPENDS:${PN}-sd8897 +=3D "${PN}-marvell-license"
-RDEPENDS:${PN}-sd8997 +=3D "${PN}-marvell-license"
-RDEPENDS:${PN}-usb8997 +=3D "${PN}-marvell-license"
-
 # For netronome
 LICENSE:${PN}-netronome =3D "Firmware-netronome"
=20
-FILES:${PN}-netronome-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.Netronome \
-"
 FILES:${PN}-netronome =3D " \
   ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0081*.nffw \
   ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0096*.nffw \
@@ -689,8 +605,6 @@ FILES:${PN}-netronome =3D " \
   ${nonarch_base_libdir}/firmware/netronome/nic-sriov \
 "
=20
-RDEPENDS:${PN}-netronome +=3D "${PN}-netronome-license"
-
 # For NXP
 LICENSE:${PN}-nxp8987-sdio =3D "Firmware-nxp"
 LICENSE:${PN}-nxp8997-common =3D "Firmware-nxp"
@@ -701,7 +615,6 @@ LICENSE:${PN}-nxp9098-pcie =3D "Firmware-nxp"
 LICENSE:${PN}-nxp9098-sdio =3D "Firmware-nxp"
 LICENSE:${PN}-nxpiw416-sdio =3D "Firmware-nxp"
 LICENSE:${PN}-nxpiw612-sdio =3D "Firmware-nxp"
-LICENSE:${PN}-nxp-license =3D "Firmware-nxp"
=20
 FILES:${PN}-nxp8987-sdio =3D "${nonarch_base_libdir}/firmware/nxp/*8987*=
"
 FILES:${PN}-nxp8997-common =3D " \
@@ -715,33 +628,21 @@ ALLOW_EMPTY:${PN}-nxp9098-pcie =3D "1"
 ALLOW_EMPTY:${PN}-nxp9098-sdio =3D "1"
 FILES:${PN}-nxpiw416-sdio =3D "${nonarch_base_libdir}/firmware/nxp/*iw41=
6*"
 FILES:${PN}-nxpiw612-sdio =3D "${nonarch_base_libdir}/firmware/nxp/uarts=
pi_n61x_v1.bin.se"
-FILES:${PN}-nxp-license =3D "${nonarch_base_libdir}/firmware/LICENSE.nxp=
"
=20
-RDEPENDS:${PN}-nxp8987-sdio +=3D "${PN}-nxp-license"
-RDEPENDS:${PN}-nxp8997-common +=3D "${PN}-nxp-license"
 RDEPENDS:${PN}-nxp8997-pcie +=3D "${PN}-nxp8997-common"
 RDEPENDS:${PN}-nxp8997-sdio +=3D "${PN}-nxp8997-common"
-RDEPENDS:${PN}-nxp9098-common +=3D "${PN}-nxp-license"
 RDEPENDS:${PN}-nxp9098-pcie +=3D "${PN}-nxp9098-common"
 RDEPENDS:${PN}-nxp9098-sdio +=3D "${PN}-nxp9098-common"
-RDEPENDS:${PN}-nxpiw416-sdio +=3D "${PN}-nxp-license"
-RDEPENDS:${PN}-nxpiw612-sdio +=3D "${PN}-nxp-license"
=20
 # For nxp-mc
 LICENSE:${PN}-nxp-mc =3D "Firmware-nxp_mc_firmware"
-LICENSE:${PN}-nxp-mc-license =3D "Firmware-nxp_mc_firmware"
=20
 FILES:${PN}-nxp-mc=3D "${nonarch_base_libdir}/firmware/dpaa2/mc/*"
-FILES:${PN}-nxp-mc-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENSE.nxp_mc_firmware \
-"
-RDEPENDS:${PN}-nxp-mc +=3D "${PN}-nxp-mc-license"
=20
 # For Nvidia
 LICENSE:${PN}-nvidia-gpu =3D "Firmware-nvidia"
 LICENSE:${PN}-nvidia-tegra =3D "Firmware-nvidia"
 LICENSE:${PN}-nvidia-tegra-k1 =3D "Firmware-nvidia"
-LICENSE:${PN}-nvidia-license =3D "Firmware-nvidia"
=20
 FILES:${PN}-nvidia-gpu =3D "${nonarch_base_libdir}/firmware/nvidia"
 FILES:${PN}-nvidia-tegra =3D " \
@@ -753,51 +654,31 @@ FILES:${PN}-nvidia-tegra-k1 =3D " \
   ${nonarch_base_libdir}/firmware/nvidia/tegra124 \
   ${nonarch_base_libdir}/firmware/nvidia/gk20a \
 "
-FILES:${PN}-nvidia-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
nvidia"
-
-RDEPENDS:${PN}-nvidia-gpu +=3D "${PN}-nvidia-license"
-RDEPENDS:${PN}-nvidia-tegra +=3D "${PN}-nvidia-license"
-RDEPENDS:${PN}-nvidia-tegra-k1 +=3D "${PN}-nvidia-license"
=20
 # For OLPC
 LICENSE:${PN}-olpc =3D "Firmware-OLPC"
-LICENSE:${PN}-olpc-license =3D "Firmware-OLPC"
=20
 FILES:${PN}-olpc =3D " \
   ${nonarch_base_libdir}/firmware/libertas/lbtf_sdio.bin	\
   ${nonarch_base_libdir}/firmware/lbtf_usb.bin			\
   ${nonarch_base_libdir}/firmware/libertas/usb8388_olpc.bin	\
 "
-FILES:${PN}-olpc-license =3D "${nonarch_base_libdir}/firmware/LICENCE.OL=
PC"
=20
-RDEPENDS:${PN}-olpc +=3D "${PN}-olpc-license"
=20
 # For phanfw
 LICENSE:${PN}-phanfw =3D "Firmware-phanfw"
-LICENSE:${PN}-phanfw-license =3D "Firmware-phanfw"
=20
 FILES:${PN}-phanfw =3D "${nonarch_base_libdir}/firmware/phanfw.bin"
-FILES:${PN}-phanfw-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
phanfw"
-
-RDEPENDS:${PN}-phanfw +=3D "${PN}-phanfw-license"
=20
 # For PowerVR
 LICENSE:${PN}-powervr =3D "Firmware-powervr"
-LICENSE:${PN}-powervr-license =3D "Firmware-powervr"
=20
 FILES:${PN}-powervr =3D "${nonarch_base_libdir}/firmware/powervr"
-FILES:${PN}-powervr-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.powervr"
-
-RDEPENDS:${PN}-powervr +=3D "${PN}-powervr-license"
=20
 # For qla2xxx
 LICENSE:${PN}-qla2xxx =3D "Firmware-qla2xxx"
-LICENSE:${PN}-qla2xxx-license =3D "Firmware-qla2xxx"
=20
 FILES:${PN}-qla2xxx =3D "${nonarch_base_libdir}/firmware/ql2*"
-FILES:${PN}-qla2xxx-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.qla2xxx"
-
-RDEPENDS:${PN}-qla2xxx +=3D "${PN}-qla2xxx-license"
=20
 # For RSI RS911x WiFi
 LICENSE:${PN}-rs9113 =3D "WHENCE"
@@ -806,9 +687,6 @@ LICENSE:${PN}-rs9116 =3D "WHENCE"
 FILES:${PN}-rs9113 =3D " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps=
 "
 FILES:${PN}-rs9116 =3D " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps=
 "
=20
-RDEPENDS:${PN}-rs9113 +=3D "${PN}-whence-license"
-RDEPENDS:${PN}-rs9116 +=3D "${PN}-whence-license"
-
 # For rtl
 LICENSE:${PN}-rtl8188 =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8192cu =3D "Firmware-rtlwifi_firmware"
@@ -818,13 +696,9 @@ LICENSE:${PN}-rtl8723 =3D "Firmware-rtlwifi_firmware=
"
 LICENSE:${PN}-rtl8761 =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8821 =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8822 =3D "Firmware-rtlwifi_firmware"
-LICENSE:${PN}-rtl-license =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl-nic =3D "WHENCE"
 LICENSE:${PN}-rtl8168 =3D "WHENCE"
=20
-FILES:${PN}-rtl-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.rtlwifi_firmware.txt \
-"
 FILES:${PN}-rtl8188 =3D " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8188*.bin \
 "
@@ -859,36 +733,19 @@ FILES:${PN}-rtl-nic =3D " \
   ${nonarch_base_libdir}/firmware/rtl_nic/*.fw \
 "
=20
-RDEPENDS:${PN}-rtl8188 +=3D "${PN}-rtl-license"
-RDEPENDS:${PN}-rtl8192ce +=3D "${PN}-rtl-license"
-RDEPENDS:${PN}-rtl8192cu +=3D "${PN}-rtl-license"
-RDEPENDS:${PN}-rtl8192su =3D "${PN}-rtl-license"
-RDEPENDS:${PN}-rtl8723 +=3D "${PN}-rtl-license"
-RDEPENDS:${PN}-rtl8821 +=3D "${PN}-rtl-license"
-RDEPENDS:${PN}-rtl8761 +=3D "${PN}-rtl-license"
-RDEPENDS:${PN}-rtl8822 +=3D "${PN}-rtl-license"
-RDEPENDS:${PN}-rtl8168 +=3D "${PN}-whence-license"
-RDEPENDS:${PN}-rtl-nic +=3D "${PN}-whence-license"
-
 # For TI wl1251
 LICENSE:${PN}-wl1251 =3D "Firmware-wl1251"
-LICENSE:${PN}-wl1251-license =3D "Firmware-wl1251"
=20
 FILES:${PN}-wl1251 =3D " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl1251-fw.bin         =
\
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl1251-nvs.bin        =
\
 "
-FILES:${PN}-wl1251-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
wl1251"
-
-RDEPENDS:${PN}-wl1251 +=3D "${PN}-wl1251-license"
=20
 # For ti-connectivity
 LICENSE:${PN}-wlcommon =3D "Firmware-ti-connectivity"
 LICENSE:${PN}-wl12xx =3D "Firmware-ti-connectivity"
 LICENSE:${PN}-wl18xx =3D "Firmware-ti-connectivity"
-LICENSE:${PN}-ti-connectivity-license =3D "Firmware-ti-connectivity"
=20
-FILES:${PN}-ti-connectivity-license =3D "${nonarch_base_libdir}/firmware=
/LICENCE.ti-connectivity"
 # wl18xx optionally needs wl1271-nvs.bin (which itself is a symlink to
 # wl127x-nvs.bin) - see linux/drivers/net/wireless/ti/wlcore/sdio.c
 # and drivers/net/wireless/ti/wlcore/spi.c.
@@ -908,66 +765,42 @@ FILES:${PN}-wl18xx =3D " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl18* \
 "
=20
-RDEPENDS:${PN}-wl12xx =3D "${PN}-ti-connectivity-license ${PN}-wlcommon"
-RDEPENDS:${PN}-wl18xx =3D "${PN}-ti-connectivity-license ${PN}-wlcommon"
+RDEPENDS:${PN}-wl12xx =3D "${PN}-wlcommon"
+RDEPENDS:${PN}-wl18xx =3D "${PN}-wlcommon"
=20
 # For ti-keystone
 LICENSE:${PN}-ti-keystone =3D "Firmware-ti-keystone"
-LICENSE:${PN}-ti-keystone-license =3D "Firmware-ti-keystone"
=20
 FILES:${PN}-ti-keystone =3D "${nonarch_base_libdir}/firmware/ti-keystone=
/*"
-FILES:${PN}-ti-keystone-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.ti-keystone \
-"
-RDEPENDS:${PN}-ti-keystone +=3D "${PN}-ti-keystone-license"
=20
 # For vt6656
 LICENSE:${PN}-vt6656 =3D "Firmware-via_vt6656"
-LICENSE:${PN}-vt6656-license =3D "Firmware-via_vt6656"
=20
-FILES:${PN}-vt6656-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
via_vt6656"
 FILES:${PN}-vt6656 =3D " \
   ${nonarch_base_libdir}/firmware/vntwusb.fw \
 "
=20
-RDEPENDS:${PN}-vt6656 =3D "${PN}-vt6656-license"
-
 # For xc4000
 LICENSE:${PN}-xc4000 =3D "Firmware-xc4000"
-LICENSE:${PN}-xc4000-license =3D "Firmware-xc4000"
=20
 FILES:${PN}-xc4000 =3D "${nonarch_base_libdir}/firmware/dvb-fe-xc4000-1.=
4.1.fw"
-FILES:${PN}-xc4000-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
xc4000"
-
-RDEPENDS:${PN}-xc4000 +=3D "${PN}-xc4000-license"
=20
 # For xc5000
 LICENSE:${PN}-xc5000 =3D "Firmware-xc5000"
-LICENSE:${PN}-xc5000-license =3D "Firmware-xc5000"
=20
 FILES:${PN}-xc5000 =3D "${nonarch_base_libdir}/firmware/dvb-fe-xc5000-1.=
6.114.fw"
-FILES:${PN}-xc5000-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
xc5000"
-
-RDEPENDS:${PN}-xc5000 +=3D "${PN}-xc5000-license"
=20
 # For xc5000c
 LICENSE:${PN}-xc5000c =3D "Firmware-xc5000c"
-LICENSE:${PN}-xc5000c-license =3D "Firmware-xc5000c"
=20
 FILES:${PN}-xc5000c =3D " \
   ${nonarch_base_libdir}/firmware/dvb-fe-xc5000c-4.1.30.7.fw \
 "
-FILES:${PN}-xc5000c-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.xc5000c"
-
-RDEPENDS:${PN}-xc5000c +=3D "${PN}-xc5000c-license"
=20
 # For broadcom
=20
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do=
 pkg=3D`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_h=
dr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "             \${PN}-$pkg \\"=
; done  | sort -u
=20
-LICENSE:${PN}-broadcom-license =3D "Firmware-broadcom_bcm43xx"
-FILES:${PN}-broadcom-license =3D "${nonarch_base_libdir}/firmware/LICENC=
E.broadcom_bcm43xx"
-
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do=
 pkg=3D`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_h=
dr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo "$i - $pkg"; echo -e "FILES:\${P=
N}-$pkg =3D \"\${nonarch_base_libdir}/firmware/brcm/$i\""; done | grep ^F=
ILES
=20
 FILES:${PN}-bcm43xx =3D "${nonarch_base_libdir}/firmware/brcm/bcm43xx-0.=
fw"
@@ -1013,63 +846,34 @@ FILES:${PN}-bcm4371 =3D "${nonarch_base_libdir}/fi=
rmware/brcm/brcmfmac4371-pcie.bi
 # Currently 1st one and last 6 have cypress LICENSE
=20
 LICENSE:${PN}-bcm43xx =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43xx +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43xx-hdr =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43xx-hdr +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4329-fullmac =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4329-fullmac +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43236b =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43236b +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4329 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4329 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4330 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4330 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4334 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4334 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4335 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4335 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4339 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4339 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43241b0 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43241b0 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43241b4 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43241b4 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43241b5 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43241b5 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43242a =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43242a +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43143 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43143 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43430a0 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43430a0 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43455 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43455 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4350c2 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4350c2 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4350 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4350 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4356 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4356 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43569 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43569 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43570 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43570 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4358 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4358 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm43602 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm43602 +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4366b =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4366b +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4366c =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4366c +=3D "${PN}-broadcom-license"
 LICENSE:${PN}-bcm4371 =3D "Firmware-broadcom_bcm43xx"
-RDEPENDS:${PN}-bcm4371 +=3D "${PN}-broadcom-license"
=20
 # For broadcom cypress
=20
-LICENSE:${PN}-cypress-license =3D "Firmware-cypress"
-FILES:${PN}-cypress-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.cypress"
-
 FILES:${PN}-bcm-0bb4-0306 =3D "${nonarch_base_libdir}/firmware/brcm/BCM-=
0bb4-0306.hcd"
 FILES:${PN}-bcm43340 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3340-sdio.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac43340-sdio.*"
@@ -1091,19 +895,12 @@ FILES:${PN}-bcm4373 =3D "${nonarch_base_libdir}/fi=
rmware/brcm/brcmfmac4373-sdio.bi
 "
=20
 LICENSE:${PN}-bcm-0bb4-0306 =3D "Firmware-cypress"
-RDEPENDS:${PN}-bcm-0bb4-0306 +=3D "${PN}-cypress-license"
 LICENSE:${PN}-bcm43340 =3D "Firmware-cypress"
-RDEPENDS:${PN}-bcm43340 +=3D "${PN}-cypress-license"
 LICENSE:${PN}-bcm43362 =3D "Firmware-cypress"
-RDEPENDS:${PN}-bcm43362 +=3D "${PN}-cypress-license"
 LICENSE:${PN}-bcm43430 =3D "Firmware-cypress"
-RDEPENDS:${PN}-bcm43430 +=3D "${PN}-cypress-license"
 LICENSE:${PN}-bcm4354 =3D "Firmware-cypress"
-RDEPENDS:${PN}-bcm4354 +=3D "${PN}-cypress-license"
 LICENSE:${PN}-bcm4356-pcie =3D "Firmware-cypress"
-RDEPENDS:${PN}-bcm4356-pcie +=3D "${PN}-cypress-license"
 LICENSE:${PN}-bcm4373 =3D "Firmware-cypress"
-RDEPENDS:${PN}-bcm4373 +=3D "${PN}-cypress-license"
=20
 # For Broadcom bnx2
 #
@@ -1111,45 +908,31 @@ RDEPENDS:${PN}-bcm4373 +=3D "${PN}-cypress-license=
"
 # license is contained in the shared WHENCE file.
=20
 LICENSE:${PN}-bnx2 =3D "WHENCE"
-LICENSE:${PN}-whence-license =3D "WHENCE"
=20
 FILES:${PN}-bnx2 =3D " \
     ${nonarch_base_libdir}/firmware/bnx2/bnx2-mips*.fw \
     ${nonarch_base_libdir}/firmware/bnx2/bnx2-rv2p*.fw \
 "
-FILES:${PN}-whence-license =3D "${nonarch_base_libdir}/firmware/WHENCE"
=20
-RDEPENDS:${PN}-bnx2 +=3D "${PN}-whence-license"
 RPROVIDES:${PN}-bnx2 =3D "${PN}-bnx2-mips"
=20
 LICENSE:${PN}-bnx2x =3D "WHENCE"
=20
 FILES:${PN}-bnx2x =3D "${nonarch_base_libdir}/firmware/bnx2x/bnx2x*.fw"
=20
-RDEPENDS:${PN}-bnx2x +=3D "${PN}-whence-license"
-
 # For cirrus
 LICENSE:${PN}-cirrus =3D "Firmware-cirrus"
-LICENSE:${PN}-cirrus-license =3D "Firmware-cirrus"
=20
 FILES:${PN}-cirrus =3D "${nonarch_base_libdir}/firmware/cirrus/*"
-FILES:${PN}-cirrus-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
cirrus"
-
-RDEPENDS:${PN}-cirrus +=3D "${PN}-cirrus-license"
=20
 # For cnm
 LICENSE:${PN}-cnm =3D "Firmware-cnm"
-LICENSE:${PN}-cnm-license =3D "Firmware-cnm"
=20
 FILES:${PN}-cnm =3D "${nonarch_base_libdir}/firmware/cnm/wave521c_k3_cod=
ec_fw.bin"
-FILES:${PN}-cnm-license =3D "${nonarch_base_libdir}/firmware/LICENCE.cnm=
"
-
-RDEPENDS:${PN}-cnm +=3D "${PN}-cnm-license"
=20
 # For imx-sdma
 LICENSE:${PN}-imx-sdma-imx6q       =3D "Firmware-imx-sdma_firmware"
 LICENSE:${PN}-imx-sdma-imx7d       =3D "Firmware-imx-sdma_firmware"
-LICENSE:${PN}-imx-sdma-license       =3D "Firmware-imx-sdma_firmware"
=20
 FILES:${PN}-imx-sdma-imx6q =3D "${nonarch_base_libdir}/firmware/imx/sdma=
/sdma-imx6q.bin"
=20
@@ -1159,11 +942,6 @@ RCONFLICTS:${PN}-imx-sdma-imx6q =3D "firmware-imx-s=
dma-imx6q"
=20
 FILES:${PN}-imx-sdma-imx7d =3D "${nonarch_base_libdir}/firmware/imx/sdma=
/sdma-imx7d.bin"
=20
-FILES:${PN}-imx-sdma-license =3D "${nonarch_base_libdir}/firmware/LICENS=
E.sdma_firmware"
-
-RDEPENDS:${PN}-imx-sdma-imx6q +=3D "${PN}-imx-sdma-license"
-RDEPENDS:${PN}-imx-sdma-imx7d +=3D "${PN}-imx-sdma-license"
-
 # For iwlwifi
 LICENSE:${PN}-iwlwifi           =3D "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-135-6     =3D "Firmware-iwlwifi_firmware"
@@ -1189,10 +967,8 @@ LICENSE:${PN}-iwlwifi-8000c     =3D "Firmware-iwlwi=
fi_firmware"
 LICENSE:${PN}-iwlwifi-8265      =3D "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-9000      =3D "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-misc      =3D "Firmware-iwlwifi_firmware"
-LICENSE:${PN}-iwlwifi-license   =3D "Firmware-iwlwifi_firmware"
=20
=20
-FILES:${PN}-iwlwifi-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.iwlwifi_firmware"
 FILES:${PN}-iwlwifi-135-6 =3D "${nonarch_base_libdir}/firmware/iwlwifi-1=
35-6.ucode"
 FILES:${PN}-iwlwifi-3160-7 =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
3160-7.ucode"
 FILES:${PN}-iwlwifi-3160-8 =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
3160-8.ucode"
@@ -1220,30 +996,6 @@ FILES:${PN}-iwlwifi-misc   =3D " \
     ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm \
 "
=20
-RDEPENDS:${PN}-iwlwifi-135-6     =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-3160-7    =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-3160-8    =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-3160-9    =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-3160-10   =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-3160-12   =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-3160-13   =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-3160-16   =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-3160-17   =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-6000-4    =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-6000g2a-5 =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-6000g2a-6 =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-6000g2b-5 =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-6000g2b-6 =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-6050-4    =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-6050-5    =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-7260      =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-7265      =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-7265d     =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-8000c     =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-8265      =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-9000      =3D "${PN}-iwlwifi-license"
-RDEPENDS:${PN}-iwlwifi-misc      =3D "${PN}-iwlwifi-license"
-
 # -iwlwifi-misc is a "catch all" package that includes all the iwlwifi
 # firmwares that are not already included in other -iwlwifi- packages.
 # -iwlwifi is a virtual package that depends upon all iwlwifi packages.
@@ -1262,7 +1014,6 @@ RREPLACES:${PN}-iwlwifi-7260 =3D "${PN}-iwlwifi-726=
0-7 ${PN}-iwlwifi-7260-8 ${PN}-
 RCONFLICTS:${PN}-iwlwifi-7260 =3D "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-72=
60-8 ${PN}-iwlwifi-7260-9"
=20
 # For ibt
-LICENSE:${PN}-ibt-license =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-hw-37-7 =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-hw-37-8 =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-11-5    =3D "Firmware-ibt_firmware"
@@ -1271,7 +1022,6 @@ LICENSE:${PN}-ibt-17 =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-20 =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-misc    =3D "Firmware-ibt_firmware"
=20
-FILES:${PN}-ibt-license =3D "${nonarch_base_libdir}/firmware/LICENCE.ibt=
_firmware"
 FILES:${PN}-ibt-hw-37-7 =3D "${nonarch_base_libdir}/firmware/intel/ibt-h=
w-37.7*.bseq"
 FILES:${PN}-ibt-hw-37-8 =3D "${nonarch_base_libdir}/firmware/intel/ibt-h=
w-37.8*.bseq"
 FILES:${PN}-ibt-11-5    =3D "${nonarch_base_libdir}/firmware/intel/ibt-1=
1-5.sfi ${nonarch_base_libdir}/firmware/intel/ibt-11-5.ddc"
@@ -1280,64 +1030,37 @@ FILES:${PN}-ibt-17 =3D "${nonarch_base_libdir}/fi=
rmware/intel/ibt-17-*.sfi ${nonar
 FILES:${PN}-ibt-20 =3D "${nonarch_base_libdir}/firmware/intel/ibt-20-*.s=
fi ${nonarch_base_libdir}/firmware/intel/ibt-20-*.ddc"
 FILES:${PN}-ibt-misc    =3D "${nonarch_base_libdir}/firmware/intel/ibt-*=
"
=20
-RDEPENDS:${PN}-ibt-hw-37-7 =3D "${PN}-ibt-license"
-RDEPENDS:${PN}-ibt-hw-37.8 =3D "${PN}-ibt-license"
-RDEPENDS:${PN}-ibt-11-5    =3D "${PN}-ibt-license"
-RDEPENDS:${PN}-ibt-12-16   =3D "${PN}-ibt-license"
-RDEPENDS:${PN}-ibt-17 =3D "${PN}-ibt-license"
-RDEPENDS:${PN}-ibt-20 =3D "${PN}-ibt-license"
-RDEPENDS:${PN}-ibt-misc    =3D "${PN}-ibt-license"
-
 ALLOW_EMPTY:${PN}-ibt=3D "1"
 ALLOW_EMPTY:${PN}-ibt-misc =3D "1"
=20
 LICENSE:${PN}-i915       =3D "Firmware-i915"
-LICENSE:${PN}-i915-license =3D "Firmware-i915"
-FILES:${PN}-i915-license =3D "${nonarch_base_libdir}/firmware/LICENSE.i9=
15"
 FILES:${PN}-i915         =3D "${nonarch_base_libdir}/firmware/i915"
-RDEPENDS:${PN}-i915      =3D "${PN}-i915-license"
=20
 # For ice-enhanced
 LICENSE:${PN}-ice-enhanced         =3D "Firmware-ice_enhanced"
-LICENSE:${PN}-ice-enhanced-license =3D "Firmware-ice_enhanced"
=20
 FILES:${PN}-ice-enhanced           =3D " \
   ${nonarch_base_libdir}/firmware/intel/ice/ddp-comms/* \
   ${nonarch_base_libdir}/firmware/intel/ice/ddp-wireless_edge/* \
 "
-FILES:${PN}-ice-enhanced-license   =3D " \
-  ${nonarch_base_libdir}/firmware/LICENSE.ice_enhanced \
-"
-RDEPENDS:${PN}-ice-enhanced        =3D "${PN}-ice-enhanced-license"
=20
 LICENSE:${PN}-ice       =3D "Firmware-ice"
-LICENSE:${PN}-ice-license =3D "Firmware-ice"
-FILES:${PN}-ice-license =3D "${nonarch_base_libdir}/firmware/LICENSE.ice=
"
 FILES:${PN}-ice         =3D " \
   ${nonarch_base_libdir}/firmware/intel/ice/ddp/* \
   ${nonarch_base_libdir}/firmware/intel/ice/ddp-lag/* \
 "
-RDEPENDS:${PN}-ice      =3D "${PN}-ice-license"
=20
-FILES:${PN}-adsp-sst-license      =3D "${nonarch_base_libdir}/firmware/L=
ICENCE.adsp_sst"
 LICENSE:${PN}-adsp-sst            =3D "Firmware-adsp_sst"
-LICENSE:${PN}-adsp-sst-license    =3D "Firmware-adsp_sst"
 FILES:${PN}-adsp-sst              =3D "${nonarch_base_libdir}/firmware/i=
ntel/dsp_fw*"
-RDEPENDS:${PN}-adsp-sst           =3D "${PN}-adsp-sst-license"
=20
 # For QAT
 LICENSE:${PN}-qat         =3D "Firmware-qat"
-LICENSE:${PN}-qat-license =3D "Firmware-qat"
-FILES:${PN}-qat-license   =3D "${nonarch_base_libdir}/firmware/LICENCE.q=
at_firmware"
 FILES:${PN}-qat           =3D "${nonarch_base_libdir}/firmware/qat*.bin"
-RDEPENDS:${PN}-qat        =3D "${PN}-qat-license"
=20
 LICENSE:${PN}-qed         =3D "WHENCE"
 FILES:${PN}-qed           =3D "${nonarch_base_libdir}/firmware/qed/*"
=20
 # For QCOM VPU/GPU and SDM845
-LICENSE:${PN}-qcom-license =3D "Firmware-qcom"
-LICENSE:${PN}-qcom-yamato-license =3D "Firmware-qcom-yamato"
 LICENSE:${PN}-qcom-venus-1.8 =3D "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-4.2 =3D "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.2 =3D "Firmware-qcom"
@@ -1381,8 +1104,6 @@ LICENSE:${PN}-qcom-sm8250-adreno =3D "Firmware-qcom=
"
 LICENSE:${PN}-qcom-sm8250-compute =3D "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors =3D "Firmware-qcom"
=20
-FILES:${PN}-qcom-license   =3D "${nonarch_base_libdir}/firmware/LICENSE.=
qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
-FILES:${PN}-qcom-yamato-license =3D "${nonarch_base_libdir}/firmware/LIC=
ENSE.qcom_yamato"
 FILES:${PN}-qcom-venus-1.8 =3D "${nonarch_base_libdir}/firmware/qcom/ven=
us-1.8/*"
 FILES:${PN}-qcom-venus-4.2 =3D "${nonarch_base_libdir}/firmware/qcom/ven=
us-4.2/*"
 FILES:${PN}-qcom-venus-5.2 =3D "${nonarch_base_libdir}/firmware/qcom/ven=
us-5.2/*"
@@ -1427,49 +1148,6 @@ FILES:${PN}-qcom-sm8250-audio =3D "${nonarch_base_=
libdir}/firmware/qcom/sm8250/ads
 FILES:${PN}-qcom-sm8250-compute =3D "${nonarch_base_libdir}/firmware/qco=
m/sm8250/cdsp*.*"
 FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors =3D "${nonarch_base_libd=
ir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
=20
-RDEPENDS:${PN}-qcom-venus-1.8 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-venus-4.2 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-venus-5.2 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-venus-5.4 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-venus-6.0 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-vpu-1.0 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-vpu-2.0 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-a2xx =3D "${PN}-qcom-license ${PN}-qcom-yamat=
o-license"
-RDEPENDS:${PN}-qcom-adreno-a3xx =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-a4xx =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-a530 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-a630 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-a650 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-a660 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-a702 =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-apq8016-modem =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-apq8016-wifi =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-apq8096-adreno =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-apq8096-audio =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-apq8096-modem =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qcm2290-adreno =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qcm2290-audio =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qcm2290-modem =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qcm2290-wifi =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qrb4210-adreno =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qrb4210-audio =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qrb4210-compute =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qrb4210-modem =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qrb4210-wifi =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute =3D "${PN}-qcom-license=
"
-RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors =3D "${PN}-qcom-license=
"
-RDEPENDS:${PN}-qcom-sdm845-adreno =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sdm845-audio =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sdm845-compute =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sdm845-modem =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors =3D "${PN}-qcom-li=
cense"
-RDEPENDS:${PN}-qcom-sm8250-adreno =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sm8250-audio =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sm8250-compute =3D "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors =3D "${PN}-qcom-licen=
se"
-
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio =3D "${PN}-qcom-sc8280=
xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno =3D "${PN}-qcom-sc828=
0xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute =3D "${PN}-qcom-sc82=
80xp-lenovo-x13s-compat"
@@ -1483,19 +1161,14 @@ FILES:${PN}-mellanox =3D "${nonarch_base_libdir}/=
firmware/mellanox"
=20
 LICENSE:${PN}-prestera =3D "Firmware-Marvell"
 FILES:${PN}-prestera =3D "${nonarch_base_libdir}/firmware/mrvl/prestera"
-RDEPENDS:${PN}-prestera =3D "${PN}-marvell-license"
=20
 # For Rockchip
 LICENSE:${PN}-rockchip-dptx =3D "Firmware-rockchip"
-FILES:${PN}-rockchip-license =3D "${nonarch_base_libdir}/firmware/LICENC=
E.rockchip"
 FILES:${PN}-rockchip-dptx =3D "${nonarch_base_libdir}/firmware/rockchip/=
dptx.bin"
-RDEPENDS:${PN}-rockchip-dptx =3D "${PN}-rockchip-license"
=20
 # For Amlogic VDEC
 LICENSE:${PN}-amlogic-vdec =3D "Firmware-amlogic_vdec"
-FILES:${PN}-amlogic-vdec-license =3D "${nonarch_base_libdir}/firmware/LI=
CENSE.amlogic_vdec"
 FILES:${PN}-amlogic-vdec =3D "${nonarch_base_libdir}/firmware/meson/vdec=
/*"
-RDEPENDS:${PN}-amlogic-vdec =3D "${PN}-amlogic-vdec-license"
=20
 # For other firmwares
 # Maybe split out to separate packages when needed.
@@ -1549,10 +1222,7 @@ LICENSE:${PN} =3D "\
     & WHENCE \
 "
=20
-FILES:${PN}-license +=3D "${nonarch_base_libdir}/firmware/LICEN*"
 FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/*"
-RDEPENDS:${PN} +=3D "${PN}-license"
-RDEPENDS:${PN} +=3D "${PN}-whence-license"
=20
 # Make linux-firmware depend on all of the split-out packages.
 # Make linux-firmware-iwlwifi depend on all of the split-out iwlwifi pac=
kages.
--=20
2.34.1


