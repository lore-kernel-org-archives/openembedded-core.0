Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1799E6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 02:17:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3D2HMEI001202
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 19:17:22 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 12 Apr 2015 19:17:21 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2015 10:17:21 +0800
Message-ID: <fe64a98fd7e856d38b38dc9e9cd217d04fa0190f.1428891074.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428891074.git.jackie.huang@windriver.com>
References: <cover.1428891074.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] linux-firmware: fix the mess of licenses
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
X-List-Received-Date: Mon, 13 Apr 2015 02:17:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Each firmware has their own license, it was a kind of a mess to
leave the license as Proprietary and we got a lot warnings like:

WARNING: The license listed Firmware-atheros_firmware was not in the
licenses collected for linux-firmware

To fix this and make it more clear:
- Fix some incorrect license names.
- Add all license files into common-licenses in previous commit.
- Add all licenses and their md5 values in alphabetical order.
- Add pn-*-license to split up per firmware package and pn-license for others.
- Re-order the codes for each split-out firmware as:
  LICENSE_*, FILES_*, RDEPENDS_*

[YOCTO #7539]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 308 +++++++++++++++------
 1 file changed, 219 insertions(+), 89 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 16ebf6a..52c6825 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -1,28 +1,83 @@
 SUMMARY = "Firmware files for use with Linux kernel"
 SECTION = "kernel"
-# Notes:
-# This is kind of a mess. Each bit of firmware has their own license. Some free
-# some not. Leaving this as Proprietary for now, but this recipe should be probably
-# be rethought out a bit more around how it deals with licenses.
-
-LICENSE = "Proprietary"
-
-LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=07b0c31777bd686d8e1609c6940b5e74\
-                    file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
-                    file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
-                    file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
-                    file://LICENCE.qla2xxx;md5=f5ce8529ec5c17cb7f911d2721d90e91 \
-                    file://LICENCE.iwlwifi_firmware;md5=5106226b2863d00d8ed553221ddf8cd2 \
-                    file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
-                    file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
-                    file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
-                    file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
-                    file://LICENCE.ti-connectivity;md5=186e7a43cf6c274283ad81272ca218ea \
-                    file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
-                    file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
-                    file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
-                   "
+
+LICENSE = "\
+    Firmware-Abilis \
+    & Firmware-agere \
+    & Firmware-amd-ucode \
+    & Firmware-atheros_firmware \
+    & Firmware-broadcom_bcm43xx \
+    & Firmware-ca0132 \
+    & Firmware-chelsio_firmware \
+    & Firmware-cw1200 \
+    & Firmware-dib0700 \
+    & Firmware-ene_firmware \
+    & Firmware-fw_sst_0f28 \
+    & Firmware-go7007 \
+    & Firmware-i2400m \
+    & Firmware-ibt_firmware \
+    & Firmware-it913x \
+    & Firmware-iwlwifi_firmware \
+    & Firmware-Marvell \
+    & Firmware-mwl8335 \
+    & Firmware-myri10ge_firmware \
+    & Firmware-OLPC \
+    & Firmware-phanfw \
+    & Firmware-qat_dh895xcc_firmware \
+    & Firmware-qla2xxx \
+    & Firmware-r8a779x_usb3 \
+    & Firmware-radeon \
+    & Firmware-ralink_a_mediatek_company_firmware \
+    & Firmware-ralink-firmware \
+    & Firmware-rtlwifi_firmware \
+    & Firmware-tda7706-firmware \
+    & Firmware-ti-connectivity \
+    & Firmware-ueagle-atm4-firmware \
+    & Firmware-via_vt6656 \
+    & Firmware-wl1251 \
+    & Firmware-xc4000 \
+    & Firmware-xc5000 \
+    & Firmware-xc5000c \
+"
+
+LIC_FILES_CHKSUM = "\
+    file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
+    file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
+    file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
+    file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
+    file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198 \
+    file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
+    file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
+    file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
+    file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293 \
+    file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
+    file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
+    file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
+    file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
+    file://LICENCE.iwlwifi_firmware;md5=5106226b2863d00d8ed553221ddf8cd2 \
+    file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
+    file://LICENCE.mwl8335;md5=9a6271ee0e644404b2ff3c61fd070983 \
+    file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
+    file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
+    file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
+    file://LICENCE.qat_dh895xcc_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
+    file://LICENCE.qla2xxx;md5=f5ce8529ec5c17cb7f911d2721d90e91 \
+    file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
+    file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
+    file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
+    file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
+    file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e \
+    file://LICENCE.ti-connectivity;md5=186e7a43cf6c274283ad81272ca218ea \
+    file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
+    file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
+    file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b \
+    file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
+    file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
+    file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
+    file://LICENSE.amd-ucode;md5=81bff4eaa247896f54dd273ce0982611 \
+    file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
+    file://LICENSE.radeon;md5=07b0c31777bd686d8e1609c6940b5e74 \
+"
 
 SRCREV = "0e5f63771d0df6d7859f7c4100a74d737c62ac88"
 PE = "1"
@@ -62,174 +117,199 @@ do_install() {
 }
 
 
-PACKAGES =+ "${PN}-ralink \
-             ${PN}-radeon \
+PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
+             ${PN}-radeon-license ${PN}-radeon \
              ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 ${PN}-sd8797 \
-             ${PN}-wl12xx ${PN}-wl18xx ${PN}-vt6656 \
+             ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
+             ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k \
+             \
              ${PN}-iwlwifi-license ${PN}-iwlwifi-135-6 \
              ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-iwlwifi-3160-9 \
-             ${PN}-iwlwifi-6000-4 ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2a-6 ${PN}-iwlwifi-6000g2b-5 ${PN}-iwlwifi-6000g2b-6 \
+             ${PN}-iwlwifi-6000-4 ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2a-6 \
+             ${PN}-iwlwifi-6000g2b-5 ${PN}-iwlwifi-6000g2b-6 \
              ${PN}-iwlwifi-6050-4 ${PN}-iwlwifi-6050-5 \
              ${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7260-9 \
              ${PN}-iwlwifi-7265-8 ${PN}-iwlwifi-7265-9 \
+             \
+             ${PN}-license \
              "
 
-FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
+# For atheros
+LICENSE_${PN}-ar9170 = "Firmware-atheros_firmware"
+LICENSE_${PN}-ar3k = "Firmware-atheros_firmware"
+LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
+LICENSE_${PN}-ath9k = "Firmware-atheros_firmware"
 
-LICENSE_${PN}-9170 = "Firmware-atheros_firmware"
+FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
 FILES_${PN}-ar9170 = " \
   /lib/firmware/ar9170*.fw \
 "
-RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
-
-LICENSE_${PN}-ar3k = "Firmware-atheros_firmware"
 FILES_${PN}-ar3k = " \
   /lib/firmware/ar3k \
 "
-RDEPENDS_${PN}-ath6k += "${PN}-atheros-license"
-
-LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
 FILES_${PN}-ath6k = " \
   /lib/firmware/ath6k \
 "
-RDEPENDS_${PN}-ath6k += "${PN}-atheros-license"
-
-LICENSE_${PN}-ath9k = "Firmware-atheros_firmware"
 FILES_${PN}-ath9k = " \
   /lib/firmware/ar9271.fw \
   /lib/firmware/ar7010*.fw \
   /lib/firmware/htc_9271.fw \
   /lib/firmware/htc_7010.fw \
 "
+
+RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
+RDEPENDS_${PN}-ar3k += "${PN}-atheros-license"
+RDEPENDS_${PN}-ath6k += "${PN}-atheros-license"
 RDEPENDS_${PN}-ath9k += "${PN}-atheros-license"
 
-LICENSE_${PN}-ralink = "Firmware-ralink"
+# For ralink
+LICENSE_${PN}-ralink = "Firmware-ralink-firmware"
+
+FILES_${PN}-ralink-license = "/lib/firmware/LICENCE.ralink-firmware.txt"
 FILES_${PN}-ralink = " \
   /lib/firmware/rt*.bin \
-  /lib/firmware/LICENCE.ralink-firmware.txt \
 "
 
+RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
+
+# For radeon
 LICENSE_${PN}-radeon = "Firmware-radeon"
+
+FILES_${PN}-radeon-license = "/lib/firmware/LICENSE.radeon"
 FILES_${PN}-radeon = " \
   /lib/firmware/radeon \
-  /lib/firmware/LICENCE.radeon \
 "
 
-FILES_${PN}-marvell-license = "/lib/firmware/LICENCE.Marvell"
+RDEPENDS_${PN}-radeon += "${PN}-radeon-license"
 
+# For marvell
 LICENSE_${PN}-sd8686 = "Firmware-Marvell"
+LICENSE_${PN}-sd8787 = "Firmware-Marvell"
+LICENSE_${PN}-sd8797 = "Firmware-Marvell"
+
+FILES_${PN}-marvell-license = "/lib/firmware/LICENCE.Marvell"
 FILES_${PN}-sd8686 = " \
   /lib/firmware/libertas/sd8686_v9* \
   /lib/firmware/sd8686* \
 "
-RDEPENDS_${PN}-sd8686 += "${PN}-marvell-license"
-
-LICENSE_${PN}-sd8787 = "Firmware-Marvell"
 FILES_${PN}-sd8787 = " \
   /lib/firmware/mrvl/sd8787_uapsta.bin \
 "
-RDEPENDS_${PN}-sd8787 += "${PN}-marvell-license"
-
-LICENSE_${PN}-sd8797 = "Firmware-Marvell"
 FILES_${PN}-sd8797 = " \
   /lib/firmware/mrvl/sd8797_uapsta.bin \
 "
+
+RDEPENDS_${PN}-sd8686 += "${PN}-marvell-license"
+RDEPENDS_${PN}-sd8787 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8797 += "${PN}-marvell-license"
 
+# For rtl
+LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
+LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi_firmware"
+LICENSE_${PN}-rtl8192su = "Firmware-rtlwifi_firmware"
+
 FILES_${PN}-rtl-license = " \
   /lib/firmware/LICENCE.rtlwifi_firmware.txt \
 "
-
-LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192cu = " \
   /lib/firmware/rtlwifi/rtl8192cufw.bin \
 "
-RDEPENDS_${PN}-rtl8192cu += "${PN}-rtl-license"
-
-LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192ce = " \
   /lib/firmware/rtlwifi/rtl8192cfw.bin \
 "
-RDEPENDS_${PN}-rtl8192ce += "${PN}-rtl-license"
-
-
-LICENSE_${PN}-rtl8192su = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192su = " \
   /lib/firmware/rtlwifi/rtl8712u.bin \
 "
 
+RDEPENDS_${PN}-rtl8192ce += "${PN}-rtl-license"
+RDEPENDS_${PN}-rtl8192cu += "${PN}-rtl-license"
+RDEPENDS_${PN}-rtl8192su = "${PN}-rtl-license"
+
+# For ti-connectivity
 LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
+LICENSE_${PN}-wl18xx = "Firmware-ti-connectivity"
+
+FILES_${PN}-ti-connectivity-license = "/lib/firmware/LICENCE.ti-connectivity"
 FILES_${PN}-wl12xx = " \
   /lib/firmware/wl12* \
   /lib/firmware/TI* \
   /lib/firmware/ti-connectivity \
 "
-
-LICENSE_${PN}-wl18xx = "Firmware-ti-connectivity"
 FILES_${PN}-wl18xx = " \
   /lib/firmware/wl18* \
   /lib/firmware/TI* \
   /lib/firmware/ti-connectivity \
 "
 
+RDEPENDS_${PN}-wl12xx = "${PN}-ti-connectivity-license"
+RDEPENDS_${PN}-wl18xx = "${PN}-ti-connectivity-license"
+
+# For vt6656
 LICENSE_${PN}-vt6656 = "Firmware-via_vt6656"
+
+FILES_${PN}-vt6656-license = "/lib/firmware/LICENCE.via_vt6656"
 FILES_${PN}-vt6656 = " \
   /lib/firmware/vntwusb.fw \
 "
 
+RDEPENDS_${PN}-vt6656 = "${PN}-vt6656-license"
+
+# For broadcom
+#
 # WARNING: The ALTERNATIVE_* variables are not using ${PN} because of
 # a bug in bitbake; when this is fixed and bitbake learns how to proper
 # pass variable flags with expansion we can rework this patch.
 
-ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac-sdio.bin"
+LICENSE_${PN}-bcm4329 = "Firmware-broadcom_bcm43xx"
+LICENSE_${PN}-bcm4330 = "Firmware-broadcom_bcm43xx"
+LICENSE_${PN}-bcm4334 = "Firmware-broadcom_bcm43xx"
 
 FILES_${PN}-broadcom-license = " \
   /lib/firmware/LICENCE.broadcom_bcm43xx \
 "
-
-LICENSE_${PN}-bcm4329 = "Firmware-bcm4329"
 FILES_${PN}-bcm4329 = " \
   /lib/firmware/brcm/brcmfmac4329-sdio.bin \
 "
-RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
-ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329-sdio.bin"
-
-LICENSE_${PN}-bcm4330 = "Firmware-bcm4330"
 FILES_${PN}-bcm4330 = " \
   /lib/firmware/brcm/brcmfmac4330-sdio.bin \
 "
-RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
-ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330-sdio.bin"
-
-LICENSE_${PN}-bcm4334 = "Firmware-bcm4334"
 FILES_${PN}-bcm4334 = " \
   /lib/firmware/brcm/brcmfmac4334-sdio.bin \
 "
-RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
+
+ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac-sdio.bin"
+
 ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334-sdio.bin"
+ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329-sdio.bin"
+ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330-sdio.bin"
 
-RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-3160-8    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-3160-9    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-6000-4    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-6000g2a-6 = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-6050-4    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-6050-5    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7260-7    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7260-8    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7260-9    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7265-8    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7265-9    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
+RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
+RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
+
+# For iwlwifi
+LICENSE_${PN}-iwlwifi-135-6     = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-3160-7    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-3160-8    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-3160-9    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-6000-4    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-6000g2a-5 = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-6000g2a-6 = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-6000g2a-5 = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-6000g2b-6 = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-6050-4    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-6050-5    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-7260-7    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-7260-8    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-7260-9    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-7265-8    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-7265-9    = "Firmware-iwlwifi_firmware"
 
 FILES_${PN}-iwlwifi-license = "/lib/firmware/LICENCE.iwlwifi_firmware"
 FILES_${PN}-iwlwifi-135-6 = "/lib/firmware/iwlwifi-135-6.ucode"
@@ -249,7 +329,57 @@ FILES_${PN}-iwlwifi-7260-9 = "/lib/firmware/iwlwifi-7260-9.ucode"
 FILES_${PN}-iwlwifi-7265-8 = "/lib/firmware/iwlwifi-7265-8.ucode"
 FILES_${PN}-iwlwifi-7265-9 = "/lib/firmware/iwlwifi-7265-9.ucode"
 
+RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-8    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-9    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6000-4    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6000g2a-6 = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6050-4    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6050-5    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7260-7    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7260-8    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7260-9    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7265-8    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7265-9    = "${PN}-iwlwifi-license"
+
+# For other firmwares
+# Maybe split out to separate packages when needed.
+LICENSE_${PN} = "\
+    Firmware-Abilis \
+    & Firmware-agere \
+    & Firmware-amd-ucode \
+    & Firmware-ca0132 \
+    & Firmware-chelsio_firmware \
+    & Firmware-cw1200 \
+    & Firmware-dib0700 \
+    & Firmware-ene_firmware \
+    & Firmware-fw_sst_0f28 \
+    & Firmware-go7007 \
+    & Firmware-i2400m \
+    & Firmware-ibt_firmware \
+    & Firmware-it913x \
+    & Firmware-mwl8335 \
+    & Firmware-myri10ge_firmware \
+    & Firmware-OLPC \
+    & Firmware-phanfw \
+    & Firmware-qat_dh895xcc_firmware \
+    & Firmware-qla2xxx \
+    & Firmware-r8a779x_usb3 \
+    & Firmware-ralink_a_mediatek_company_firmware \
+    & Firmware-tda7706-firmware \
+    & Firmware-ueagle-atm4-firmware \
+    & Firmware-wl1251 \
+    & Firmware-xc4000 \
+    & Firmware-xc5000 \
+    & Firmware-xc5000c \
+"
+FILES_${PN}-license += "/lib/firmware/LICEN*"
 FILES_${PN} += "/lib/firmware/*"
+RDEPENDS_${PN} += "${PN}-license"
 
 # Make linux-firmware depend on all of the split-out packages.
 python populate_packages_prepend () {
-- 
1.9.1


