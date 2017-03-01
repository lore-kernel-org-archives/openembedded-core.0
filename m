Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8738571CAF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 09:44:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 01 Mar 2017 01:44:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,224,1484035200"; d="scan'208";a="829664198"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Mar 2017 01:44:41 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 11:44:45 +0200
Message-Id: <1488361485-12847-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] firmware: use ${nonarch_base_libdir} for firmware installation.
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
X-List-Received-Date: Wed, 01 Mar 2017 09:44:41 -0000

Replace hardcoded '/lib' in kernel firmware installation path with
${nonarch_base_libdir}.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 168 ++++++++++-----------
 1 file changed, 84 insertions(+), 84 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 5547e16..5b5a7a4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -195,27 +195,27 @@ do_compile() {
 }
 
 do_install() {
-	install -d  ${D}/lib/firmware/
-	cp -r * ${D}/lib/firmware/
+	install -d  ${D}${nonarch_base_libdir}/firmware/
+	cp -r * ${D}${nonarch_base_libdir}/firmware/
 
 	# Avoid Makefile to be deployed
-	rm ${D}/lib/firmware/Makefile
+	rm ${D}${nonarch_base_libdir}/firmware/Makefile
 
 	# Remove unbuild firmware which needs cmake and bash
-	rm ${D}/lib/firmware/carl9170fw -rf
+	rm ${D}${nonarch_base_libdir}/firmware/carl9170fw -rf
 
 	# Remove pointless bash script
-	rm ${D}/lib/firmware/configure
+	rm ${D}${nonarch_base_libdir}/firmware/configure
 
 	# Libertas sd8686
-	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
-	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
+	ln -sf libertas/sd8686_v9.bin ${D}${nonarch_base_libdir}/firmware/sd8686.bin
+	ln -sf libertas/sd8686_v9_helper.bin ${D}${nonarch_base_libdir}/firmware/sd8686_helper.bin
 
 	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
-	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
+	( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf ti-connectivity/* . )
 
         # Copy the iwlwifi ucode
-        cp ${WORKDIR}/iwlwifi-8000C-19.ucode ${D}/lib/firmware/
+        cp ${WORKDIR}/iwlwifi-8000C-19.ucode ${D}${nonarch_base_libdir}/firmware/
 }
 
 
@@ -252,23 +252,23 @@ LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
 LICENSE_${PN}-ath9k = "Firmware-atheros_firmware"
 LICENSE_${PN}-atheros-license = "Firmware-atheros_firmware"
 
-FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
+FILES_${PN}-atheros-license = "${nonarch_base_libdir}/firmware/LICENCE.atheros_firmware"
 FILES_${PN}-ar9170 = " \
-  /lib/firmware/ar9170*.fw \
+  ${nonarch_base_libdir}/firmware/ar9170*.fw \
 "
 FILES_${PN}-carl9170 = " \
-  /lib/firmware/carl9170*.fw \
+  ${nonarch_base_libdir}/firmware/carl9170*.fw \
 "
 FILES_${PN}-ath6k = " \
-  /lib/firmware/ath6k \
+  ${nonarch_base_libdir}/firmware/ath6k \
 "
 FILES_${PN}-ath9k = " \
-  /lib/firmware/ar9271.fw \
-  /lib/firmware/ar7010*.fw \
-  /lib/firmware/htc_9271.fw \
-  /lib/firmware/htc_7010.fw \
-  /lib/firmware/ath9k_htc/htc_7010-1.4.0.fw \
-  /lib/firmware/ath9k_htc/htc_9271-1.4.0.fw \
+  ${nonarch_base_libdir}/firmware/ar9271.fw \
+  ${nonarch_base_libdir}/firmware/ar7010*.fw \
+  ${nonarch_base_libdir}/firmware/htc_9271.fw \
+  ${nonarch_base_libdir}/firmware/htc_7010.fw \
+  ${nonarch_base_libdir}/firmware/ath9k_htc/htc_7010-1.4.0.fw \
+  ${nonarch_base_libdir}/firmware/ath9k_htc/htc_9271-1.4.0.fw \
 "
 
 RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
@@ -282,14 +282,14 @@ LICENSE_${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE_${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
 LICENSE_${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
 
-FILES_${PN}-ar3k-license = "/lib/firmware/LICENSE.QualcommAtheros_ar3k"
+FILES_${PN}-ar3k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
 FILES_${PN}-ar3k = " \
-  /lib/firmware/ar3k \
+  ${nonarch_base_libdir}/firmware/ar3k \
 "
 
-FILES_${PN}-ath10k-license = "/lib/firmware/LICENSE.QualcommAtheros_ath10k"
+FILES_${PN}-ath10k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ath10k"
 FILES_${PN}-ath10k = " \
-  /lib/firmware/ath10k \
+  ${nonarch_base_libdir}/firmware/ath10k \
 "
 
 RDEPENDS_${PN}-ar3k += "${PN}-ar3k-license"
@@ -299,9 +299,9 @@ RDEPENDS_${PN}-ath10k += "${PN}-ath10k-license"
 LICENSE_${PN}-ralink = "Firmware-ralink-firmware"
 LICENSE_${PN}-ralink-license = "Firmware-ralink-firmware"
 
-FILES_${PN}-ralink-license = "/lib/firmware/LICENCE.ralink-firmware.txt"
+FILES_${PN}-ralink-license = "${nonarch_base_libdir}/firmware/LICENCE.ralink-firmware.txt"
 FILES_${PN}-ralink = " \
-  /lib/firmware/rt*.bin \
+  ${nonarch_base_libdir}/firmware/rt*.bin \
 "
 
 RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
@@ -310,9 +310,9 @@ RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
 LICENSE_${PN}-radeon = "Firmware-radeon"
 LICENSE_${PN}-radeon-license = "Firmware-radeon"
 
-FILES_${PN}-radeon-license = "/lib/firmware/LICENSE.radeon"
+FILES_${PN}-radeon-license = "${nonarch_base_libdir}/firmware/LICENSE.radeon"
 FILES_${PN}-radeon = " \
-  /lib/firmware/radeon \
+  ${nonarch_base_libdir}/firmware/radeon \
 "
 
 RDEPENDS_${PN}-radeon += "${PN}-radeon-license"
@@ -327,20 +327,20 @@ LICENSE_${PN}-sd8887 = "Firmware-Marvell"
 LICENSE_${PN}-sd8897 = "Firmware-Marvell"
 LICENSE_${PN}-marvell-license = "Firmware-Marvell"
 
-FILES_${PN}-marvell-license = "/lib/firmware/LICENCE.Marvell"
+FILES_${PN}-marvell-license = "${nonarch_base_libdir}/firmware/LICENCE.Marvell"
 FILES_${PN}-sd8686 = " \
-  /lib/firmware/libertas/sd8686_v9* \
-  /lib/firmware/sd8686* \
+  ${nonarch_base_libdir}/firmware/libertas/sd8686_v9* \
+  ${nonarch_base_libdir}/firmware/sd8686* \
 "
 FILES_${PN}-sd8688 = " \
-  /lib/firmware/libertas/sd8688* \
-  /lib/firmware/mrvl/sd8688* \
+  ${nonarch_base_libdir}/firmware/libertas/sd8688* \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8688* \
 "
 FILES_${PN}-sd8787 = " \
-  /lib/firmware/mrvl/sd8787_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8787_uapsta.bin \
 "
 FILES_${PN}-sd8797 = " \
-  /lib/firmware/mrvl/sd8797_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8797_uapsta.bin \
 "
 FILES_${PN}-sd8801 = " \
   /lib/firmware/mrvl/sd8801_uapsta.bin \
@@ -370,25 +370,25 @@ LICENSE_${PN}-rtl8821 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl-license = "Firmware-rtlwifi_firmware"
 
 FILES_${PN}-rtl-license = " \
-  /lib/firmware/LICENCE.rtlwifi_firmware.txt \
+  ${nonarch_base_libdir}/firmware/LICENCE.rtlwifi_firmware.txt \
 "
 FILES_${PN}-rtl8188 = " \
-  /lib/firmware/rtlwifi/rtl8188*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8188*.bin \
 "
 FILES_${PN}-rtl8192cu = " \
-  /lib/firmware/rtlwifi/rtl8192cufw*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192cufw*.bin \
 "
 FILES_${PN}-rtl8192ce = " \
-  /lib/firmware/rtlwifi/rtl8192cfw*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192cfw*.bin \
 "
 FILES_${PN}-rtl8192su = " \
-  /lib/firmware/rtlwifi/rtl8712u.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8712u.bin \
 "
 FILES_${PN}-rtl8723 = " \
-  /lib/firmware/rtlwifi/rtl8723*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin \
 "
 FILES_${PN}-rtl8821 = " \
-  /lib/firmware/rtlwifi/rtl8821*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin \
 "
 
 RDEPENDS_${PN}-rtl8188 += "${PN}-rtl-license"
@@ -403,16 +403,16 @@ LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
 LICENSE_${PN}-wl18xx = "Firmware-ti-connectivity"
 LICENSE_${PN}-ti-connectivity-license = "Firmware-ti-connectivity"
 
-FILES_${PN}-ti-connectivity-license = "/lib/firmware/LICENCE.ti-connectivity"
+FILES_${PN}-ti-connectivity-license = "${nonarch_base_libdir}/firmware/LICENCE.ti-connectivity"
 FILES_${PN}-wl12xx = " \
-  /lib/firmware/wl12* \
-  /lib/firmware/TI* \
-  /lib/firmware/ti-connectivity \
+  ${nonarch_base_libdir}/firmware/wl12* \
+  ${nonarch_base_libdir}/firmware/TI* \
+  ${nonarch_base_libdir}/firmware/ti-connectivity \
 "
 FILES_${PN}-wl18xx = " \
-  /lib/firmware/wl18* \
-  /lib/firmware/TI* \
-  /lib/firmware/ti-connectivity \
+  ${nonarch_base_libdir}/firmware/wl18* \
+  ${nonarch_base_libdir}/firmware/TI* \
+  ${nonarch_base_libdir}/firmware/ti-connectivity \
 "
 
 RDEPENDS_${PN}-wl12xx = "${PN}-ti-connectivity-license"
@@ -422,9 +422,9 @@ RDEPENDS_${PN}-wl18xx = "${PN}-ti-connectivity-license"
 LICENSE_${PN}-vt6656 = "Firmware-via_vt6656"
 LICENSE_${PN}-vt6656-license = "Firmware-via_vt6656"
 
-FILES_${PN}-vt6656-license = "/lib/firmware/LICENCE.via_vt6656"
+FILES_${PN}-vt6656-license = "${nonarch_base_libdir}/firmware/LICENCE.via_vt6656"
 FILES_${PN}-vt6656 = " \
-  /lib/firmware/vntwusb.fw \
+  ${nonarch_base_libdir}/firmware/vntwusb.fw \
 "
 
 RDEPENDS_${PN}-vt6656 = "${PN}-vt6656-license"
@@ -441,28 +441,28 @@ LICENSE_${PN}-bcm4354 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-broadcom-license = "Firmware-broadcom_bcm43xx"
 
 FILES_${PN}-broadcom-license = " \
-  /lib/firmware/LICENCE.broadcom_bcm43xx \
+  ${nonarch_base_libdir}/firmware/LICENCE.broadcom_bcm43xx \
 "
 FILES_${PN}-bcm4329 = " \
-  /lib/firmware/brcm/brcmfmac4329-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin \
 "
 FILES_${PN}-bcm4330 = " \
-  /lib/firmware/brcm/brcmfmac4330-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.bin \
 "
 FILES_${PN}-bcm4334 = " \
-  /lib/firmware/brcm/brcmfmac4334-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin \
 "
 FILES_${PN}-bcm43340 = " \
-  /lib/firmware/brcm/brcmfmac43340-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin \
 "
 FILES_${PN}-bcm4339 = " \
-  /lib/firmware/brcm/brcmfmac4339-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin \
 "
 FILES_${PN}-bcm43430 = " \
-  /lib/firmware/brcm/brcmfmac43430-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin \
 "
 FILES_${PN}-bcm4354 = " \
-  /lib/firmware/brcm/brcmfmac4354-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
 "
 
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
@@ -481,8 +481,8 @@ RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"
 LICENSE_${PN}-bnx2-mips = "WHENCE"
 LICENSE_${PN}-whence-license = "WHENCE"
 
-FILES_${PN}-bnx2-mips = "/lib/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
-FILES_${PN}-whence-license = "/lib/firmware/WHENCE"
+FILES_${PN}-bnx2-mips = "${nonarch_base_libdir}/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
+FILES_${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
 
 RDEPENDS_${PN}-bnx2-mips += "${PN}-whence-license"
 
@@ -508,24 +508,24 @@ LICENSE_${PN}-iwlwifi-misc      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
 
-FILES_${PN}-iwlwifi-license = "/lib/firmware/LICENCE.iwlwifi_firmware"
-FILES_${PN}-iwlwifi-135-6 = "/lib/firmware/iwlwifi-135-6.ucode"
-FILES_${PN}-iwlwifi-3160-7 = "/lib/firmware/iwlwifi-3160-7.ucode"
-FILES_${PN}-iwlwifi-3160-8 = "/lib/firmware/iwlwifi-3160-8.ucode"
-FILES_${PN}-iwlwifi-3160-9 = "/lib/firmware/iwlwifi-3160-9.ucode"
-FILES_${PN}-iwlwifi-6000-4 = "/lib/firmware/iwlwifi-6000-4.ucode"
-FILES_${PN}-iwlwifi-6000g2a-5 = "/lib/firmware/iwlwifi-6000g2a-5.ucode"
-FILES_${PN}-iwlwifi-6000g2a-6 = "/lib/firmware/iwlwifi-6000g2a-6.ucode"
-FILES_${PN}-iwlwifi-6000g2b-5 = "/lib/firmware/iwlwifi-6000g2b-5.ucode"
-FILES_${PN}-iwlwifi-6000g2b-6 = "/lib/firmware/iwlwifi-6000g2b-6.ucode"
-FILES_${PN}-iwlwifi-6050-4 = "/lib/firmware/iwlwifi-6050-4.ucode"
-FILES_${PN}-iwlwifi-6050-5 = "/lib/firmware/iwlwifi-6050-5.ucode"
-FILES_${PN}-iwlwifi-7260   = "/lib/firmware/iwlwifi-7260-*.ucode"
-FILES_${PN}-iwlwifi-7265   = "/lib/firmware/iwlwifi-7265-*.ucode"
-FILES_${PN}-iwlwifi-7265d   = "/lib/firmware/iwlwifi-7265D-*.ucode"
-FILES_${PN}-iwlwifi-8000c   = "/lib/firmware/iwlwifi-8000C-*.ucode"
-FILES_${PN}-iwlwifi-8265   = "/lib/firmware/iwlwifi-8265-*.ucode"
-FILES_${PN}-iwlwifi-misc   = "/lib/firmware/iwlwifi-*.ucode"
+FILES_${PN}-iwlwifi-license = "${nonarch_base_libdir}/firmware/LICENCE.iwlwifi_firmware"
+FILES_${PN}-iwlwifi-135-6 = "${nonarch_base_libdir}/firmware/iwlwifi-135-6.ucode"
+FILES_${PN}-iwlwifi-3160-7 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-7.ucode"
+FILES_${PN}-iwlwifi-3160-8 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-8.ucode"
+FILES_${PN}-iwlwifi-3160-9 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-9.ucode"
+FILES_${PN}-iwlwifi-6000-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6000-4.ucode"
+FILES_${PN}-iwlwifi-6000g2a-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-5.ucode"
+FILES_${PN}-iwlwifi-6000g2a-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-6.ucode"
+FILES_${PN}-iwlwifi-6000g2b-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-5.ucode"
+FILES_${PN}-iwlwifi-6000g2b-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-6.ucode"
+FILES_${PN}-iwlwifi-6050-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-4.ucode"
+FILES_${PN}-iwlwifi-6050-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-5.ucode"
+FILES_${PN}-iwlwifi-7260   = "${nonarch_base_libdir}/firmware/iwlwifi-7260-*.ucode"
+FILES_${PN}-iwlwifi-7265   = "${nonarch_base_libdir}/firmware/iwlwifi-7265-*.ucode"
+FILES_${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.ucode"
+FILES_${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode"
+FILES_${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode"
+FILES_${PN}-iwlwifi-misc   = "${nonarch_base_libdir}/firmware/iwlwifi-*.ucode"
 
 RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
@@ -564,14 +564,14 @@ RCONFLICTS_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}
 
 LICENSE_${PN}-i915       = "Firmware-i915"
 LICENSE_${PN}-i915-license = "Firmware-i915"
-FILES_${PN}-i915-license = "/lib/firmware/LICENSE.i915"
-FILES_${PN}-i915         = "/lib/firmware/i915"
+FILES_${PN}-i915-license = "${nonarch_base_libdir}/firmware/LICENSE.i915"
+FILES_${PN}-i915         = "${nonarch_base_libdir}/firmware/i915"
 RDEPENDS_${PN}-i915      = "${PN}-i915-license"
 
-FILES_${PN}-adsp-sst-license      = "/lib/firmware/LICENCE.adsp_sst"
+FILES_${PN}-adsp-sst-license      = "${nonarch_base_libdir}/firmware/LICENCE.adsp_sst"
 LICENSE_${PN}-adsp-sst            = "Firmware-adsp_sst"
 LICENSE_${PN}-adsp-sst-license    = "Firmware-adsp_sst"
-FILES_${PN}-adsp-sst              = "/lib/firmware/intel/dsp_fw*"
+FILES_${PN}-adsp-sst              = "${nonarch_base_libdir}/firmware/intel/dsp_fw*"
 RDEPENDS_${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
 # For other firmwares
@@ -623,8 +623,8 @@ LICENSE_${PN} = "\
     & WHENCE \
 "
 
-FILES_${PN}-license += "/lib/firmware/LICEN*"
-FILES_${PN} += "/lib/firmware/*"
+FILES_${PN}-license += "${nonarch_base_libdir}/firmware/LICEN*"
+FILES_${PN} += "${nonarch_base_libdir}/firmware/*"
 RDEPENDS_${PN} += "${PN}-license"
 RDEPENDS_${PN} += "${PN}-whence-license"
 
-- 
2.7.4


