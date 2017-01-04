Return-Path: <amarnath.valluri@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id F3FB86FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 11:57:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 04 Jan 2017 03:57:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,459,1477983600"; d="scan'208";a="1079063592"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2017 03:57:43 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 13:58:24 +0200
Message-Id: <1483531104-32135-2-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483531104-32135-1-git-send-email-amarnath.valluri@intel.com>
References: <1483531104-32135-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 2/2] linux-firmware: Modify firmware installation path
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
X-List-Received-Date: Wed, 04 Jan 2017 11:57:44 -0000

Install firmware files under ${base_libdir}/firmware instead of hardcoded
/lib/firmare.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 180 ++++++++++-----------
 1 file changed, 90 insertions(+), 90 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 1d881d7..6f915b4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -195,27 +195,27 @@ do_compile() {
 }
 
 do_install() {
-	install -d  ${D}/lib/firmware/
-	cp -r * ${D}/lib/firmware/
+	install -d  ${D}${base_libdir}/firmware/
+	cp -r * ${D}${base_libdir}/firmware/
 
 	# Avoid Makefile to be deployed
-	rm ${D}/lib/firmware/Makefile
+	rm ${D}${base_libdir}/firmware/Makefile
 
 	# Remove unbuild firmware which needs cmake and bash
-	rm ${D}/lib/firmware/carl9170fw -rf
+	rm ${D}${base_libdir}/firmware/carl9170fw -rf
 
 	# Remove pointless bash script
-	rm ${D}/lib/firmware/configure
+	rm ${D}${base_libdir}/firmware/configure
 
 	# Libertas sd8686
-	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
-	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
+	ln -sf libertas/sd8686_v9.bin ${D}${base_libdir}/firmware/sd8686.bin
+	ln -sf libertas/sd8686_v9_helper.bin ${D}${base_libdir}/firmware/sd8686_helper.bin
 
 	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
-	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
+	( cd ${D}${base_libdir}/firmware ; ln -sf ti-connectivity/* . )
 
         # Copy the iwlwifi ucode
-        cp ${WORKDIR}/iwlwifi-8000C-19.ucode ${D}/lib/firmware/
+        cp ${WORKDIR}/iwlwifi-8000C-19.ucode ${D}${base_libdir}/firmware/
 }
 
 
@@ -252,21 +252,21 @@ LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
 LICENSE_${PN}-ath9k = "Firmware-atheros_firmware"
 LICENSE_${PN}-atheros-license = "Firmware-atheros_firmware"
 
-FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
+FILES_${PN}-atheros-license = "${base_libdir}/firmware/LICENCE.atheros_firmware"
 FILES_${PN}-ar9170 = " \
-  /lib/firmware/ar9170*.fw \
+  ${base_libdir}/firmware/ar9170*.fw \
 "
 FILES_${PN}-carl9170 = " \
-  /lib/firmware/carl9170*.fw \
+  ${base_libdir}/firmware/carl9170*.fw \
 "
 FILES_${PN}-ath6k = " \
-  /lib/firmware/ath6k \
+  ${base_libdir}/firmware/ath6k \
 "
 FILES_${PN}-ath9k = " \
-  /lib/firmware/ar9271.fw \
-  /lib/firmware/ar7010*.fw \
-  /lib/firmware/htc_9271.fw \
-  /lib/firmware/htc_7010.fw \
+  ${base_libdir}/firmware/ar9271.fw \
+  ${base_libdir}/firmware/ar7010*.fw \
+  ${base_libdir}/firmware/htc_9271.fw \
+  ${base_libdir}/firmware/htc_7010.fw \
 "
 
 RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
@@ -280,14 +280,14 @@ LICENSE_${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE_${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
 LICENSE_${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
 
-FILES_${PN}-ar3k-license = "/lib/firmware/LICENSE.QualcommAtheros_ar3k"
+FILES_${PN}-ar3k-license = "${base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
 FILES_${PN}-ar3k = " \
-  /lib/firmware/ar3k \
+  ${base_libdir}/firmware/ar3k \
 "
 
-FILES_${PN}-ath10k-license = "/lib/firmware/LICENSE.QualcommAtheros_ath10k"
+FILES_${PN}-ath10k-license = "${base_libdir}/firmware/LICENSE.QualcommAtheros_ath10k"
 FILES_${PN}-ath10k = " \
-  /lib/firmware/ath10k \
+  ${base_libdir}/firmware/ath10k \
 "
 
 RDEPENDS_${PN}-ar3k += "${PN}-ar3k-license"
@@ -297,9 +297,9 @@ RDEPENDS_${PN}-ath10k += "${PN}-ath10k-license"
 LICENSE_${PN}-ralink = "Firmware-ralink-firmware"
 LICENSE_${PN}-ralink-license = "Firmware-ralink-firmware"
 
-FILES_${PN}-ralink-license = "/lib/firmware/LICENCE.ralink-firmware.txt"
+FILES_${PN}-ralink-license = "${base_libdir}/firmware/LICENCE.ralink-firmware.txt"
 FILES_${PN}-ralink = " \
-  /lib/firmware/rt*.bin \
+  ${base_libdir}/firmware/rt*.bin \
 "
 
 RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
@@ -308,9 +308,9 @@ RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
 LICENSE_${PN}-radeon = "Firmware-radeon"
 LICENSE_${PN}-radeon-license = "Firmware-radeon"
 
-FILES_${PN}-radeon-license = "/lib/firmware/LICENSE.radeon"
+FILES_${PN}-radeon-license = "${base_libdir}/firmware/LICENSE.radeon"
 FILES_${PN}-radeon = " \
-  /lib/firmware/radeon \
+  ${base_libdir}/firmware/radeon \
 "
 
 RDEPENDS_${PN}-radeon += "${PN}-radeon-license"
@@ -322,20 +322,20 @@ LICENSE_${PN}-sd8787 = "Firmware-Marvell"
 LICENSE_${PN}-sd8797 = "Firmware-Marvell"
 LICENSE_${PN}-marvell-license = "Firmware-Marvell"
 
-FILES_${PN}-marvell-license = "/lib/firmware/LICENCE.Marvell"
+FILES_${PN}-marvell-license = "${base_libdir}/firmware/LICENCE.Marvell"
 FILES_${PN}-sd8686 = " \
-  /lib/firmware/libertas/sd8686_v9* \
-  /lib/firmware/sd8686* \
+  ${base_libdir}/firmware/libertas/sd8686_v9* \
+  ${base_libdir}/firmware/sd8686* \
 "
 FILES_${PN}-sd8688 = " \
-  /lib/firmware/libertas/sd8688* \
-  /lib/firmware/mrvl/sd8688* \
+  ${base_libdir}/firmware/libertas/sd8688* \
+  ${base_libdir}/firmware/mrvl/sd8688* \
 "
 FILES_${PN}-sd8787 = " \
-  /lib/firmware/mrvl/sd8787_uapsta.bin \
+  ${base_libdir}/firmware/mrvl/sd8787_uapsta.bin \
 "
 FILES_${PN}-sd8797 = " \
-  /lib/firmware/mrvl/sd8797_uapsta.bin \
+  ${base_libdir}/firmware/mrvl/sd8797_uapsta.bin \
 "
 
 RDEPENDS_${PN}-sd8686 += "${PN}-marvell-license"
@@ -353,25 +353,25 @@ LICENSE_${PN}-rtl8821 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl-license = "Firmware-rtlwifi_firmware"
 
 FILES_${PN}-rtl-license = " \
-  /lib/firmware/LICENCE.rtlwifi_firmware.txt \
+  ${base_libdir}/firmware/LICENCE.rtlwifi_firmware.txt \
 "
 FILES_${PN}-rtl8188 = " \
-  /lib/firmware/rtlwifi/rtl8188*.bin \
+  ${base_libdir}/firmware/rtlwifi/rtl8188*.bin \
 "
 FILES_${PN}-rtl8192cu = " \
-  /lib/firmware/rtlwifi/rtl8192cufw*.bin \
+  ${base_libdir}/firmware/rtlwifi/rtl8192cufw*.bin \
 "
 FILES_${PN}-rtl8192ce = " \
-  /lib/firmware/rtlwifi/rtl8192cfw*.bin \
+  ${base_libdir}/firmware/rtlwifi/rtl8192cfw*.bin \
 "
 FILES_${PN}-rtl8192su = " \
-  /lib/firmware/rtlwifi/rtl8712u.bin \
+  ${base_libdir}/firmware/rtlwifi/rtl8712u.bin \
 "
 FILES_${PN}-rtl8723 = " \
-  /lib/firmware/rtlwifi/rtl8723*.bin \
+  ${base_libdir}/firmware/rtlwifi/rtl8723*.bin \
 "
 FILES_${PN}-rtl8821 = " \
-  /lib/firmware/rtlwifi/rtl8821*.bin \
+  ${base_libdir}/firmware/rtlwifi/rtl8821*.bin \
 "
 
 RDEPENDS_${PN}-rtl8188 += "${PN}-rtl-license"
@@ -386,16 +386,16 @@ LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
 LICENSE_${PN}-wl18xx = "Firmware-ti-connectivity"
 LICENSE_${PN}-ti-connectivity-license = "Firmware-ti-connectivity"
 
-FILES_${PN}-ti-connectivity-license = "/lib/firmware/LICENCE.ti-connectivity"
+FILES_${PN}-ti-connectivity-license = "${base_libdir}/firmware/LICENCE.ti-connectivity"
 FILES_${PN}-wl12xx = " \
-  /lib/firmware/wl12* \
-  /lib/firmware/TI* \
-  /lib/firmware/ti-connectivity \
+  ${base_libdir}/firmware/wl12* \
+  ${base_libdir}/firmware/TI* \
+  ${base_libdir}/firmware/ti-connectivity \
 "
 FILES_${PN}-wl18xx = " \
-  /lib/firmware/wl18* \
-  /lib/firmware/TI* \
-  /lib/firmware/ti-connectivity \
+  ${base_libdir}/firmware/wl18* \
+  ${base_libdir}/firmware/TI* \
+  ${base_libdir}/firmware/ti-connectivity \
 "
 
 RDEPENDS_${PN}-wl12xx = "${PN}-ti-connectivity-license"
@@ -405,9 +405,9 @@ RDEPENDS_${PN}-wl18xx = "${PN}-ti-connectivity-license"
 LICENSE_${PN}-vt6656 = "Firmware-via_vt6656"
 LICENSE_${PN}-vt6656-license = "Firmware-via_vt6656"
 
-FILES_${PN}-vt6656-license = "/lib/firmware/LICENCE.via_vt6656"
+FILES_${PN}-vt6656-license = "${base_libdir}/firmware/LICENCE.via_vt6656"
 FILES_${PN}-vt6656 = " \
-  /lib/firmware/vntwusb.fw \
+  ${base_libdir}/firmware/vntwusb.fw \
 "
 
 RDEPENDS_${PN}-vt6656 = "${PN}-vt6656-license"
@@ -428,47 +428,47 @@ LICENSE_${PN}-bcm4354 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-broadcom-license = "Firmware-broadcom_bcm43xx"
 
 FILES_${PN}-broadcom-license = " \
-  /lib/firmware/LICENCE.broadcom_bcm43xx \
+  ${base_libdir}/firmware/LICENCE.broadcom_bcm43xx \
 "
 FILES_${PN}-bcm4329 = " \
-  /lib/firmware/brcm/brcmfmac4329-sdio.bin \
+  ${base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin \
 "
 FILES_${PN}-bcm4330 = " \
-  /lib/firmware/brcm/brcmfmac4330-sdio.bin \
+  ${base_libdir}/firmware/brcm/brcmfmac4330-sdio.bin \
 "
 FILES_${PN}-bcm4334 = " \
-  /lib/firmware/brcm/brcmfmac4334-sdio.bin \
+  ${base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin \
 "
 FILES_${PN}-bcm43340 = " \
-  /lib/firmware/brcm/brcmfmac43340-sdio.bin \
+  ${base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin \
 "
 FILES_${PN}-bcm4339 = " \
-  /lib/firmware/brcm/brcmfmac4339-sdio.bin \
+  ${base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin \
 "
 FILES_${PN}-bcm43430 = " \
-  /lib/firmware/brcm/brcmfmac43430-sdio.bin \
+  ${base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin \
 "
 FILES_${PN}-bcm4354 = " \
-  /lib/firmware/brcm/brcmfmac4354-sdio.bin \
+  ${base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
 "
 
-ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac-sdio.bin"
+ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "${base_libdir}/firmware/brcm/brcmfmac-sdio.bin"
 
 ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "${base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin"
 ALTERNATIVE_linux-firmware-bcm43340 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm43340[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac43340-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm43340[brcmfmac-sdio.bin] = "${base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin"
 ALTERNATIVE_linux_firmware-bcm4354 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4354[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4354-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4354[brcmfmac-sdio.bin] = "${base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin"
 ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "${base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin"
 ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "${base_libdir}/firmware/brcm/brcmfmac4330-sdio.bin"
 ALTERNATIVE_linux-firmware-bcm4339 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4339-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "${base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin"
 ALTERNATIVE_PRIORITY_linux-firmware-bcm4339[brcmfmac-sdio.bin] = "20"
 ALTERNATIVE_linux-firmware-bcm43430 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm43430[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac43430-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm43430[brcmfmac-sdio.bin] = "${base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin"
 
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
@@ -486,8 +486,8 @@ RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"
 LICENSE_${PN}-bnx2-mips = "WHENCE"
 LICENSE_${PN}-whence-license = "WHENCE"
 
-FILES_${PN}-bnx2-mips = "/lib/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
-FILES_${PN}-whence-license = "/lib/firmware/WHENCE"
+FILES_${PN}-bnx2-mips = "${base_libdir}/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
+FILES_${PN}-whence-license = "${base_libdir}/firmware/WHENCE"
 
 RDEPENDS_${PN}-bnx2-mips += "${PN}-whence-license"
 
@@ -513,24 +513,24 @@ LICENSE_${PN}-iwlwifi-misc      = "Firmware-iwlwifi_firmware"
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
+FILES_${PN}-iwlwifi-license = "${base_libdir}/firmware/LICENCE.iwlwifi_firmware"
+FILES_${PN}-iwlwifi-135-6 = "${base_libdir}/firmware/iwlwifi-135-6.ucode"
+FILES_${PN}-iwlwifi-3160-7 = "${base_libdir}/firmware/iwlwifi-3160-7.ucode"
+FILES_${PN}-iwlwifi-3160-8 = "${base_libdir}/firmware/iwlwifi-3160-8.ucode"
+FILES_${PN}-iwlwifi-3160-9 = "${base_libdir}/firmware/iwlwifi-3160-9.ucode"
+FILES_${PN}-iwlwifi-6000-4 = "${base_libdir}/firmware/iwlwifi-6000-4.ucode"
+FILES_${PN}-iwlwifi-6000g2a-5 = "${base_libdir}/firmware/iwlwifi-6000g2a-5.ucode"
+FILES_${PN}-iwlwifi-6000g2a-6 = "${base_libdir}/firmware/iwlwifi-6000g2a-6.ucode"
+FILES_${PN}-iwlwifi-6000g2b-5 = "${base_libdir}/firmware/iwlwifi-6000g2b-5.ucode"
+FILES_${PN}-iwlwifi-6000g2b-6 = "${base_libdir}/firmware/iwlwifi-6000g2b-6.ucode"
+FILES_${PN}-iwlwifi-6050-4 = "${base_libdir}/firmware/iwlwifi-6050-4.ucode"
+FILES_${PN}-iwlwifi-6050-5 = "${base_libdir}/firmware/iwlwifi-6050-5.ucode"
+FILES_${PN}-iwlwifi-7260   = "${base_libdir}/firmware/iwlwifi-7260-*.ucode"
+FILES_${PN}-iwlwifi-7265   = "${base_libdir}/firmware/iwlwifi-7265-*.ucode"
+FILES_${PN}-iwlwifi-7265d   = "${base_libdir}/firmware/iwlwifi-7265D-*.ucode"
+FILES_${PN}-iwlwifi-8000c   = "${base_libdir}/firmware/iwlwifi-8000C-*.ucode"
+FILES_${PN}-iwlwifi-8265   = "${base_libdir}/firmware/iwlwifi-8265-*.ucode"
+FILES_${PN}-iwlwifi-misc   = "${base_libdir}/firmware/iwlwifi-*.ucode"
 
 RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
@@ -569,14 +569,14 @@ RCONFLICTS_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}
 
 LICENSE_${PN}-i915       = "Firmware-i915"
 LICENSE_${PN}-i915-license = "Firmware-i915"
-FILES_${PN}-i915-license = "/lib/firmware/LICENSE.i915"
-FILES_${PN}-i915         = "/lib/firmware/i915"
+FILES_${PN}-i915-license = "${base_libdir}/firmware/LICENSE.i915"
+FILES_${PN}-i915         = "${base_libdir}/firmware/i915"
 RDEPENDS_${PN}-i915      = "${PN}-i915-license"
 
-FILES_${PN}-adsp-sst-license      = "/lib/firmware/LICENCE.adsp_sst"
+FILES_${PN}-adsp-sst-license      = "${base_libdir}/firmware/LICENCE.adsp_sst"
 LICENSE_${PN}-adsp-sst            = "Firmware-adsp_sst"
 LICENSE_${PN}-adsp-sst-license    = "Firmware-adsp_sst"
-FILES_${PN}-adsp-sst              = "/lib/firmware/intel/dsp_fw*"
+FILES_${PN}-adsp-sst              = "${base_libdir}/firmware/intel/dsp_fw*"
 RDEPENDS_${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
 # For other firmwares
@@ -628,8 +628,8 @@ LICENSE_${PN} = "\
     & WHENCE \
 "
 
-FILES_${PN}-license += "/lib/firmware/LICEN*"
-FILES_${PN} += "/lib/firmware/*"
+FILES_${PN}-license += "${base_libdir}/firmware/LICEN*"
+FILES_${PN} += "${base_libdir}/firmware/*"
 RDEPENDS_${PN} += "${PN}-license"
 RDEPENDS_${PN} += "${PN}-whence-license"
 
-- 
2.7.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


