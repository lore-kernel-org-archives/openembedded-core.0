Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AF62A6E650
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:27:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 10 Oct 2017 05:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,505,1500966000"; d="scan'208";a="1204217661"
Received: from summit.tm.intel.com ([10.237.55.128])
	by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2017 05:27:52 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Oct 2017 15:27:06 +0300
Message-Id: <20171010122706.6975-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] linux-firmware: make i.MX SDMA split complete
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
X-List-Received-Date: Tue, 10 Oct 2017 12:27:52 -0000

The commit to split i.MX SDMA firmware blobs in their
own packages was not complete and results in a failure
when trying to install full linux-firmware:

 * Solver encountered 1 problem(s):
 * Problem 1/1:
 *   - nothing provides linux-firmware-imx-sdma-license needed
 *     by linux-firmware-1:0.0+git0+a61ac5cf83-r0.all
 *
 * Solution 1:
 *   - do not ask to install a package providing linux-firmware

Make the split complete by installing the license in
${PN}-imx-sdma-license and have the blob packages depend on it.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 3cf432e83a..0338ba8ac2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -563,7 +563,9 @@ FILES_${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
 RDEPENDS_${PN}-bnx2-mips += "${PN}-whence-license"
 
 # For imx-sdma
-LICENSE_${PN}-imx-sdma          = "Firmware-imx-sdma_firmware"
+LICENSE_${PN}-imx-sdma-imx6q       = "Firmware-imx-sdma_firmware"
+LICENSE_${PN}-imx-sdma-imx7d       = "Firmware-imx-sdma_firmware"
+LICENSE_${PN}-imx-sdma-license       = "Firmware-imx-sdma_firmware"
 
 FILES_${PN}-imx-sdma-imx6q = "${nonarch_base_libdir}/firmware/imx/sdma/sdma-imx6q.bin"
 
@@ -573,6 +575,11 @@ RCONFLICTS_${PN}-imx-sdma-imx6q = "firmware-imx-sdma-imx6q"
 
 FILES_${PN}-imx-sdma-imx7d = "${nonarch_base_libdir}/firmware/imx/sdma/sdma-imx7d.bin"
 
+FILES_${PN}-imx-sdma-license = "${nonarch_base_libdir}/firmware/LICENSE.sdma_firmware"
+
+RDEPENDS_${PN}-imx-sdma-imx6q += "${PN}-imx-sdma-license"
+RDEPENDS_${PN}-imx-sdma-imx7d += "${PN}-imx-sdma-license"
+
 # For iwlwifi
 LICENSE_${PN}-iwlwifi           = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-135-6     = "Firmware-iwlwifi_firmware"
-- 
2.11.0


