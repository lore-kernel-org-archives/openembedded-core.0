Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LFRGq0Lviur3RiOodgMXiAGongjO8TeF6+l3co+FI5MHElLUt2cadH51hcQ6bGu7+h8KfhqgWS
 8SHaJqf4m/eA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467931"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467931"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:51 -0700
IronPort-SDR: /UclFmYahvU50BIX0zvZYl5Qyq73JK4U4A2mXr3z80TeZDT2KE5wHy05kZqXYctfFjuIJaoint
 sTSWued49y/w==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809120"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:50 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/18] linux-firmware: Fix packaging
Date: Mon, 12 Apr 2021 17:08:20 +0800
Message-Id: <0e7feade706a4a88181a45ca4999051994a5aaab.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Trensch <mtrensch@hilscher.com>

Upstream directory layout has changed after update in commit 3c2f8b750ab9c53773fb5a9a1a874e475740b4ee, resulting in some package to pull in linux-firmware base package.
This may cause an image size increase of approximately 700MB.

See log.do_packaging:
DEBUG: linux-firmware-bcm43340 contains dangling link /lib/firmware/cypress/cyfmac43340-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43362 contains dangling link /lib/firmware/cypress/cyfmac43362-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4339 contains dangling link /lib/firmware/cypress/cyfmac4339-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43430 contains dangling link /lib/firmware/cypress/cyfmac43430-sdio.clm_blob
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43430 contains dangling link /lib/firmware/cypress/cyfmac43430-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43455 contains dangling link /lib/firmware/cypress/cyfmac43455-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43455 contains dangling link /lib/firmware/cypress/cyfmac43455-sdio.clm_blob
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4354 contains dangling link /lib/firmware/cypress/cyfmac4354-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4356 contains dangling link /lib/firmware/cypress/cyfmac4356-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4356-pcie contains dangling link /lib/firmware/cypress/cyfmac4356-pcie.clm_blob
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4356-pcie contains dangling link /lib/firmware/cypress/cyfmac4356-pcie.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43570 contains dangling link /lib/firmware/cypress/cyfmac43570-pcie.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4373 contains dangling link /lib/firmware/cypress/cyfmac4373-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0099-0001_2x10.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0099-0001_2x25.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0081-0001_4x10.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0097-0001_8x10.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0099-0001_1x10_1x25.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0097-0001_2x40.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0096-0001_2x10.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0097-0001_4x10_1x40.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0081-0001_1x40.nffw
DEBUG: target found in linux-firmware

Signed-off-by: Michael Trensch <mtrensch@hilscher.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd273c611b03bd5972da8bf4accaba247f7c9c62)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux-firmware/linux-firmware_20210208.bb | 41 +++++++++++++++----
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 59ce4d5124..69672c85f6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -492,6 +492,13 @@ FILES_${PN}-netronome = " \
   ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0096*.nffw \
   ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0097*.nffw \
   ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0099*.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0058-0011_2x40.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0058-0012_2x40.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0078-0011_1x100.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/bpf \
+  ${nonarch_base_libdir}/firmware/netronome/flower \
+  ${nonarch_base_libdir}/firmware/netronome/nic \
+  ${nonarch_base_libdir}/firmware/netronome/nic-sriov \
 "
 
 RDEPENDS_${PN}-netronome += "${PN}-netronome-license"
@@ -618,7 +625,9 @@ FILES_${PN}-bcm4329 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bi
 FILES_${PN}-bcm4330 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.*"
 FILES_${PN}-bcm4334 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin"
 FILES_${PN}-bcm4335 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4335-sdio.bin"
-FILES_${PN}-bcm4339 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin"
+FILES_${PN}-bcm4339 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4339-sdio.bin \
+"
 FILES_${PN}-bcm43241b0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b0-sdio.bin"
 FILES_${PN}-bcm43241b4 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b4-sdio.bin"
 FILES_${PN}-bcm43241b5 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b5-sdio.bin"
@@ -627,12 +636,18 @@ FILES_${PN}-bcm43143 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43143.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin \
 "
 FILES_${PN}-bcm43430a0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430a0-sdio.*"
-FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.*"
+FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43455-sdio.* \
+"
 FILES_${PN}-bcm4350c2 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350c2-pcie.bin"
 FILES_${PN}-bcm4350 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350-pcie.bin"
-FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.bin"
+FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.bin \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.bin \
+"
 FILES_${PN}-bcm43569 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43569.bin"
-FILES_${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin"
+FILES_${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43570-pcie.bin \
+"
 FILES_${PN}-bcm4358 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4358-pcie.bin"
 FILES_${PN}-bcm43602 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.ap.bin \
@@ -703,13 +718,21 @@ LICENSE_${PN}-cypress-license = "Firmware-cypress"
 FILES_${PN}-cypress-license = "${nonarch_base_libdir}/firmware/LICENCE.cypress"
 
 FILES_${PN}-bcm-0bb4-0306 = "${nonarch_base_libdir}/firmware/brcm/BCM-0bb4-0306.hcd"
-FILES_${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.*"
-FILES_${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.*"
-FILES_${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.*"
-FILES_${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin"
-FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.*"
+FILES_${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43340-sdio.*"
+FILES_${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43362-sdio.*"
+FILES_${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43430-sdio.*"
+FILES_${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.bin \
+"
+FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-pcie.* \
+"
 FILES_${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin \
 "
 
 LICENSE_${PN}-bcm-0bb4-0306 = "Firmware-cypress"
-- 
2.30.2

