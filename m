Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2FC37199F
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 21:14:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0JLEgXs012397
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 13:14:43 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 Jan 2017 13:14:42 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2017 13:14:40 -0800
Message-ID: <20170119211441.126457-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 1/2] Revert "linux-firmware: Modify firmware installation path"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2017 21:14:43 -0000
Content-Type: text/plain

This reverts commit a46a23fed9acd097ecc8ab3985d18688abe7b065.

The 64bit/32bit multilib builds break because the kernel's
firmware loader cannot find the firmware because it
gets placed int the wrong directory.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 168 ++++++++++-----------
 1 file changed, 82 insertions(+), 86 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 5942997fda..4fedcfbc67 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -195,27 +195,27 @@ do_compile() {
 }
 
 do_install() {
-	install -d  ${D}${base_libdir}/firmware/
-	cp -r * ${D}${base_libdir}/firmware/
+	install -d  ${D}/lib/firmware/
+	cp -r * ${D}/lib/firmware/
 
 	# Avoid Makefile to be deployed
-	rm ${D}${base_libdir}/firmware/Makefile
+	rm ${D}/lib/firmware/Makefile
 
 	# Remove unbuild firmware which needs cmake and bash
-	rm ${D}${base_libdir}/firmware/carl9170fw -rf
+	rm ${D}/lib/firmware/carl9170fw -rf
 
 	# Remove pointless bash script
-	rm ${D}${base_libdir}/firmware/configure
+	rm ${D}/lib/firmware/configure
 
 	# Libertas sd8686
-	ln -sf libertas/sd8686_v9.bin ${D}${base_libdir}/firmware/sd8686.bin
-	ln -sf libertas/sd8686_v9_helper.bin ${D}${base_libdir}/firmware/sd8686_helper.bin
+	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
+	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
 
 	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
-	( cd ${D}${base_libdir}/firmware ; ln -sf ti-connectivity/* . )
+	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
 
         # Copy the iwlwifi ucode
-        cp ${WORKDIR}/iwlwifi-8000C-19.ucode ${D}${base_libdir}/firmware/
+        cp ${WORKDIR}/iwlwifi-8000C-19.ucode ${D}/lib/firmware/
 }
 
 
@@ -252,21 +252,21 @@ LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
 LICENSE_${PN}-ath9k = "Firmware-atheros_firmware"
 LICENSE_${PN}-atheros-license = "Firmware-atheros_firmware"
 
-FILES_${PN}-atheros-license = "${base_libdir}/firmware/LICENCE.atheros_firmware"
+FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
 FILES_${PN}-ar9170 = " \
-  ${base_libdir}/firmware/ar9170*.fw \
+  /lib/firmware/ar9170*.fw \
 "
 FILES_${PN}-carl9170 = " \
-  ${base_libdir}/firmware/carl9170*.fw \
+  /lib/firmware/carl9170*.fw \
 "
 FILES_${PN}-ath6k = " \
-  ${base_libdir}/firmware/ath6k \
+  /lib/firmware/ath6k \
 "
 FILES_${PN}-ath9k = " \
-  ${base_libdir}/firmware/ar9271.fw \
-  ${base_libdir}/firmware/ar7010*.fw \
-  ${base_libdir}/firmware/htc_9271.fw \
-  ${base_libdir}/firmware/htc_7010.fw \
+  /lib/firmware/ar9271.fw \
+  /lib/firmware/ar7010*.fw \
+  /lib/firmware/htc_9271.fw \
+  /lib/firmware/htc_7010.fw \
 "
 
 RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
@@ -280,14 +280,14 @@ LICENSE_${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE_${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
 LICENSE_${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
 
-FILES_${PN}-ar3k-license = "${base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
+FILES_${PN}-ar3k-license = "/lib/firmware/LICENSE.QualcommAtheros_ar3k"
 FILES_${PN}-ar3k = " \
-  ${base_libdir}/firmware/ar3k \
+  /lib/firmware/ar3k \
 "
 
-FILES_${PN}-ath10k-license = "${base_libdir}/firmware/LICENSE.QualcommAtheros_ath10k"
+FILES_${PN}-ath10k-license = "/lib/firmware/LICENSE.QualcommAtheros_ath10k"
 FILES_${PN}-ath10k = " \
-  ${base_libdir}/firmware/ath10k \
+  /lib/firmware/ath10k \
 "
 
 RDEPENDS_${PN}-ar3k += "${PN}-ar3k-license"
@@ -297,9 +297,9 @@ RDEPENDS_${PN}-ath10k += "${PN}-ath10k-license"
 LICENSE_${PN}-ralink = "Firmware-ralink-firmware"
 LICENSE_${PN}-ralink-license = "Firmware-ralink-firmware"
 
-FILES_${PN}-ralink-license = "${base_libdir}/firmware/LICENCE.ralink-firmware.txt"
+FILES_${PN}-ralink-license = "/lib/firmware/LICENCE.ralink-firmware.txt"
 FILES_${PN}-ralink = " \
-  ${base_libdir}/firmware/rt*.bin \
+  /lib/firmware/rt*.bin \
 "
 
 RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
@@ -308,9 +308,9 @@ RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
 LICENSE_${PN}-radeon = "Firmware-radeon"
 LICENSE_${PN}-radeon-license = "Firmware-radeon"
 
-FILES_${PN}-radeon-license = "${base_libdir}/firmware/LICENSE.radeon"
+FILES_${PN}-radeon-license = "/lib/firmware/LICENSE.radeon"
 FILES_${PN}-radeon = " \
-  ${base_libdir}/firmware/radeon \
+  /lib/firmware/radeon \
 "
 
 RDEPENDS_${PN}-radeon += "${PN}-radeon-license"
@@ -322,20 +322,20 @@ LICENSE_${PN}-sd8787 = "Firmware-Marvell"
 LICENSE_${PN}-sd8797 = "Firmware-Marvell"
 LICENSE_${PN}-marvell-license = "Firmware-Marvell"
 
-FILES_${PN}-marvell-license = "${base_libdir}/firmware/LICENCE.Marvell"
+FILES_${PN}-marvell-license = "/lib/firmware/LICENCE.Marvell"
 FILES_${PN}-sd8686 = " \
-  ${base_libdir}/firmware/libertas/sd8686_v9* \
-  ${base_libdir}/firmware/sd8686* \
+  /lib/firmware/libertas/sd8686_v9* \
+  /lib/firmware/sd8686* \
 "
 FILES_${PN}-sd8688 = " \
-  ${base_libdir}/firmware/libertas/sd8688* \
-  ${base_libdir}/firmware/mrvl/sd8688* \
+  /lib/firmware/libertas/sd8688* \
+  /lib/firmware/mrvl/sd8688* \
 "
 FILES_${PN}-sd8787 = " \
-  ${base_libdir}/firmware/mrvl/sd8787_uapsta.bin \
+  /lib/firmware/mrvl/sd8787_uapsta.bin \
 "
 FILES_${PN}-sd8797 = " \
-  ${base_libdir}/firmware/mrvl/sd8797_uapsta.bin \
+  /lib/firmware/mrvl/sd8797_uapsta.bin \
 "
 
 RDEPENDS_${PN}-sd8686 += "${PN}-marvell-license"
@@ -353,25 +353,25 @@ LICENSE_${PN}-rtl8821 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl-license = "Firmware-rtlwifi_firmware"
 
 FILES_${PN}-rtl-license = " \
-  ${base_libdir}/firmware/LICENCE.rtlwifi_firmware.txt \
+  /lib/firmware/LICENCE.rtlwifi_firmware.txt \
 "
 FILES_${PN}-rtl8188 = " \
-  ${base_libdir}/firmware/rtlwifi/rtl8188*.bin \
+  /lib/firmware/rtlwifi/rtl8188*.bin \
 "
 FILES_${PN}-rtl8192cu = " \
-  ${base_libdir}/firmware/rtlwifi/rtl8192cufw*.bin \
+  /lib/firmware/rtlwifi/rtl8192cufw*.bin \
 "
 FILES_${PN}-rtl8192ce = " \
-  ${base_libdir}/firmware/rtlwifi/rtl8192cfw*.bin \
+  /lib/firmware/rtlwifi/rtl8192cfw*.bin \
 "
 FILES_${PN}-rtl8192su = " \
-  ${base_libdir}/firmware/rtlwifi/rtl8712u.bin \
+  /lib/firmware/rtlwifi/rtl8712u.bin \
 "
 FILES_${PN}-rtl8723 = " \
-  ${base_libdir}/firmware/rtlwifi/rtl8723*.bin \
+  /lib/firmware/rtlwifi/rtl8723*.bin \
 "
 FILES_${PN}-rtl8821 = " \
-  ${base_libdir}/firmware/rtlwifi/rtl8821*.bin \
+  /lib/firmware/rtlwifi/rtl8821*.bin \
 "
 
 RDEPENDS_${PN}-rtl8188 += "${PN}-rtl-license"
@@ -386,16 +386,16 @@ LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
 LICENSE_${PN}-wl18xx = "Firmware-ti-connectivity"
 LICENSE_${PN}-ti-connectivity-license = "Firmware-ti-connectivity"
 
-FILES_${PN}-ti-connectivity-license = "${base_libdir}/firmware/LICENCE.ti-connectivity"
+FILES_${PN}-ti-connectivity-license = "/lib/firmware/LICENCE.ti-connectivity"
 FILES_${PN}-wl12xx = " \
-  ${base_libdir}/firmware/wl12* \
-  ${base_libdir}/firmware/TI* \
-  ${base_libdir}/firmware/ti-connectivity \
+  /lib/firmware/wl12* \
+  /lib/firmware/TI* \
+  /lib/firmware/ti-connectivity \
 "
 FILES_${PN}-wl18xx = " \
-  ${base_libdir}/firmware/wl18* \
-  ${base_libdir}/firmware/TI* \
-  ${base_libdir}/firmware/ti-connectivity \
+  /lib/firmware/wl18* \
+  /lib/firmware/TI* \
+  /lib/firmware/ti-connectivity \
 "
 
 RDEPENDS_${PN}-wl12xx = "${PN}-ti-connectivity-license"
@@ -405,18 +405,14 @@ RDEPENDS_${PN}-wl18xx = "${PN}-ti-connectivity-license"
 LICENSE_${PN}-vt6656 = "Firmware-via_vt6656"
 LICENSE_${PN}-vt6656-license = "Firmware-via_vt6656"
 
-FILES_${PN}-vt6656-license = "${base_libdir}/firmware/LICENCE.via_vt6656"
+FILES_${PN}-vt6656-license = "/lib/firmware/LICENCE.via_vt6656"
 FILES_${PN}-vt6656 = " \
-  ${base_libdir}/firmware/vntwusb.fw \
+  /lib/firmware/vntwusb.fw \
 "
 
 RDEPENDS_${PN}-vt6656 = "${PN}-vt6656-license"
 
 # For broadcom
-#
-# WARNING: The ALTERNATIVE_* variables are not using ${PN} because of
-# a bug in bitbake; when this is fixed and bitbake learns how to proper
-# pass variable flags with expansion we can rework this patch.
 
 LICENSE_${PN}-bcm4329 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4330 = "Firmware-broadcom_bcm43xx"
@@ -428,28 +424,28 @@ LICENSE_${PN}-bcm4354 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-broadcom-license = "Firmware-broadcom_bcm43xx"
 
 FILES_${PN}-broadcom-license = " \
-  ${base_libdir}/firmware/LICENCE.broadcom_bcm43xx \
+  /lib/firmware/LICENCE.broadcom_bcm43xx \
 "
 FILES_${PN}-bcm4329 = " \
-  ${base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin \
+  /lib/firmware/brcm/brcmfmac4329-sdio.bin \
 "
 FILES_${PN}-bcm4330 = " \
-  ${base_libdir}/firmware/brcm/brcmfmac4330-sdio.bin \
+  /lib/firmware/brcm/brcmfmac4330-sdio.bin \
 "
 FILES_${PN}-bcm4334 = " \
-  ${base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin \
+  /lib/firmware/brcm/brcmfmac4334-sdio.bin \
 "
 FILES_${PN}-bcm43340 = " \
-  ${base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin \
+  /lib/firmware/brcm/brcmfmac43340-sdio.bin \
 "
 FILES_${PN}-bcm4339 = " \
-  ${base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin \
+  /lib/firmware/brcm/brcmfmac4339-sdio.bin \
 "
 FILES_${PN}-bcm43430 = " \
-  ${base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin \
+  /lib/firmware/brcm/brcmfmac43430-sdio.bin \
 "
 FILES_${PN}-bcm4354 = " \
-  ${base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
+  /lib/firmware/brcm/brcmfmac4354-sdio.bin \
 "
 
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
@@ -468,8 +464,8 @@ RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"
 LICENSE_${PN}-bnx2-mips = "WHENCE"
 LICENSE_${PN}-whence-license = "WHENCE"
 
-FILES_${PN}-bnx2-mips = "${base_libdir}/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
-FILES_${PN}-whence-license = "${base_libdir}/firmware/WHENCE"
+FILES_${PN}-bnx2-mips = "/lib/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
+FILES_${PN}-whence-license = "/lib/firmware/WHENCE"
 
 RDEPENDS_${PN}-bnx2-mips += "${PN}-whence-license"
 
@@ -495,24 +491,24 @@ LICENSE_${PN}-iwlwifi-misc      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
 
-FILES_${PN}-iwlwifi-license = "${base_libdir}/firmware/LICENCE.iwlwifi_firmware"
-FILES_${PN}-iwlwifi-135-6 = "${base_libdir}/firmware/iwlwifi-135-6.ucode"
-FILES_${PN}-iwlwifi-3160-7 = "${base_libdir}/firmware/iwlwifi-3160-7.ucode"
-FILES_${PN}-iwlwifi-3160-8 = "${base_libdir}/firmware/iwlwifi-3160-8.ucode"
-FILES_${PN}-iwlwifi-3160-9 = "${base_libdir}/firmware/iwlwifi-3160-9.ucode"
-FILES_${PN}-iwlwifi-6000-4 = "${base_libdir}/firmware/iwlwifi-6000-4.ucode"
-FILES_${PN}-iwlwifi-6000g2a-5 = "${base_libdir}/firmware/iwlwifi-6000g2a-5.ucode"
-FILES_${PN}-iwlwifi-6000g2a-6 = "${base_libdir}/firmware/iwlwifi-6000g2a-6.ucode"
-FILES_${PN}-iwlwifi-6000g2b-5 = "${base_libdir}/firmware/iwlwifi-6000g2b-5.ucode"
-FILES_${PN}-iwlwifi-6000g2b-6 = "${base_libdir}/firmware/iwlwifi-6000g2b-6.ucode"
-FILES_${PN}-iwlwifi-6050-4 = "${base_libdir}/firmware/iwlwifi-6050-4.ucode"
-FILES_${PN}-iwlwifi-6050-5 = "${base_libdir}/firmware/iwlwifi-6050-5.ucode"
-FILES_${PN}-iwlwifi-7260   = "${base_libdir}/firmware/iwlwifi-7260-*.ucode"
-FILES_${PN}-iwlwifi-7265   = "${base_libdir}/firmware/iwlwifi-7265-*.ucode"
-FILES_${PN}-iwlwifi-7265d   = "${base_libdir}/firmware/iwlwifi-7265D-*.ucode"
-FILES_${PN}-iwlwifi-8000c   = "${base_libdir}/firmware/iwlwifi-8000C-*.ucode"
-FILES_${PN}-iwlwifi-8265   = "${base_libdir}/firmware/iwlwifi-8265-*.ucode"
-FILES_${PN}-iwlwifi-misc   = "${base_libdir}/firmware/iwlwifi-*.ucode"
+FILES_${PN}-iwlwifi-license = "/lib/firmware/LICENCE.iwlwifi_firmware"
+FILES_${PN}-iwlwifi-135-6 = "/lib/firmware/iwlwifi-135-6.ucode"
+FILES_${PN}-iwlwifi-3160-7 = "/lib/firmware/iwlwifi-3160-7.ucode"
+FILES_${PN}-iwlwifi-3160-8 = "/lib/firmware/iwlwifi-3160-8.ucode"
+FILES_${PN}-iwlwifi-3160-9 = "/lib/firmware/iwlwifi-3160-9.ucode"
+FILES_${PN}-iwlwifi-6000-4 = "/lib/firmware/iwlwifi-6000-4.ucode"
+FILES_${PN}-iwlwifi-6000g2a-5 = "/lib/firmware/iwlwifi-6000g2a-5.ucode"
+FILES_${PN}-iwlwifi-6000g2a-6 = "/lib/firmware/iwlwifi-6000g2a-6.ucode"
+FILES_${PN}-iwlwifi-6000g2b-5 = "/lib/firmware/iwlwifi-6000g2b-5.ucode"
+FILES_${PN}-iwlwifi-6000g2b-6 = "/lib/firmware/iwlwifi-6000g2b-6.ucode"
+FILES_${PN}-iwlwifi-6050-4 = "/lib/firmware/iwlwifi-6050-4.ucode"
+FILES_${PN}-iwlwifi-6050-5 = "/lib/firmware/iwlwifi-6050-5.ucode"
+FILES_${PN}-iwlwifi-7260   = "/lib/firmware/iwlwifi-7260-*.ucode"
+FILES_${PN}-iwlwifi-7265   = "/lib/firmware/iwlwifi-7265-*.ucode"
+FILES_${PN}-iwlwifi-7265d   = "/lib/firmware/iwlwifi-7265D-*.ucode"
+FILES_${PN}-iwlwifi-8000c   = "/lib/firmware/iwlwifi-8000C-*.ucode"
+FILES_${PN}-iwlwifi-8265   = "/lib/firmware/iwlwifi-8265-*.ucode"
+FILES_${PN}-iwlwifi-misc   = "/lib/firmware/iwlwifi-*.ucode"
 
 RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
@@ -551,14 +547,14 @@ RCONFLICTS_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}
 
 LICENSE_${PN}-i915       = "Firmware-i915"
 LICENSE_${PN}-i915-license = "Firmware-i915"
-FILES_${PN}-i915-license = "${base_libdir}/firmware/LICENSE.i915"
-FILES_${PN}-i915         = "${base_libdir}/firmware/i915"
+FILES_${PN}-i915-license = "/lib/firmware/LICENSE.i915"
+FILES_${PN}-i915         = "/lib/firmware/i915"
 RDEPENDS_${PN}-i915      = "${PN}-i915-license"
 
-FILES_${PN}-adsp-sst-license      = "${base_libdir}/firmware/LICENCE.adsp_sst"
+FILES_${PN}-adsp-sst-license      = "/lib/firmware/LICENCE.adsp_sst"
 LICENSE_${PN}-adsp-sst            = "Firmware-adsp_sst"
 LICENSE_${PN}-adsp-sst-license    = "Firmware-adsp_sst"
-FILES_${PN}-adsp-sst              = "${base_libdir}/firmware/intel/dsp_fw*"
+FILES_${PN}-adsp-sst              = "/lib/firmware/intel/dsp_fw*"
 RDEPENDS_${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
 # For other firmwares
@@ -610,8 +606,8 @@ LICENSE_${PN} = "\
     & WHENCE \
 "
 
-FILES_${PN}-license += "${base_libdir}/firmware/LICEN*"
-FILES_${PN} += "${base_libdir}/firmware/*"
+FILES_${PN}-license += "/lib/firmware/LICEN*"
+FILES_${PN} += "/lib/firmware/*"
 RDEPENDS_${PN} += "${PN}-license"
 RDEPENDS_${PN} += "${PN}-whence-license"
 
-- 
2.11.0


