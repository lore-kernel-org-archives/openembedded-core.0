Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 331 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Dec 2016 13:38:08 UTC
Received: from atl4mhfb04.myregisteredsite.com
	(atl4mhfb04.myregisteredsite.com [209.17.115.120])
	by mail.openembedded.org (Postfix) with ESMTP id C927B772BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 13:38:08 +0000 (UTC)
Received: from atl4mhob18.myregisteredsite.com
	(atl4mhob18.myregisteredsite.com [209.17.115.111])
	by atl4mhfb04.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	uBFDWexv032200 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 08:32:40 -0500
Received: from mailpod.hostingplatform.com ([10.30.71.211])
	by atl4mhob18.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	uBFDWb0F033461 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 08:32:37 -0500
Received: (qmail 20273 invoked by uid 0); 15 Dec 2016 13:32:37 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 15 Dec 2016 13:32:36 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:31:57 +0100
Message-Id: <1481808717-26735-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] linux-firmware: Split out Realtek chipsets rtl8188 rtl8723 rtl8821
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
X-List-Received-Date: Thu, 15 Dec 2016 13:38:09 -0000

Add rtl8188 rtl8712 rtl8723 rtl8821 packages to install only firmware for the
corresponding chipset. Uses a rather blunt approach by simply adding all firmware
files with matching prefix, to keep the package count down a bit.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 .../recipes-kernel/linux-firmware/linux-firmware_git.bb | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 8e68ae8..1d881d7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -224,7 +224,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
-             ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
+             ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-carl9170 ${PN}-ath6k ${PN}-ath9k \
              ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license  ${PN}-ath10k  \
@@ -344,14 +344,20 @@ RDEPENDS_${PN}-sd8787 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8797 += "${PN}-marvell-license"
 
 # For rtl
+LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192su = "Firmware-rtlwifi_firmware"
+LICENSE_${PN}-rtl8723 = "Firmware-rtlwifi_firmware"
+LICENSE_${PN}-rtl8821 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl-license = "Firmware-rtlwifi_firmware"
 
 FILES_${PN}-rtl-license = " \
   /lib/firmware/LICENCE.rtlwifi_firmware.txt \
 "
+FILES_${PN}-rtl8188 = " \
+  /lib/firmware/rtlwifi/rtl8188*.bin \
+"
 FILES_${PN}-rtl8192cu = " \
   /lib/firmware/rtlwifi/rtl8192cufw*.bin \
 "
@@ -361,10 +367,19 @@ FILES_${PN}-rtl8192ce = " \
 FILES_${PN}-rtl8192su = " \
   /lib/firmware/rtlwifi/rtl8712u.bin \
 "
+FILES_${PN}-rtl8723 = " \
+  /lib/firmware/rtlwifi/rtl8723*.bin \
+"
+FILES_${PN}-rtl8821 = " \
+  /lib/firmware/rtlwifi/rtl8821*.bin \
+"
 
+RDEPENDS_${PN}-rtl8188 += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8192ce += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8192cu += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8192su = "${PN}-rtl-license"
+RDEPENDS_${PN}-rtl8723 += "${PN}-rtl-license"
+RDEPENDS_${PN}-rtl8821 += "${PN}-rtl-license"
 
 # For ti-connectivity
 LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
-- 
1.9.1


