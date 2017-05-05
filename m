Return-Path: <wei.tee.ng@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 674AA77D60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 09:14:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 02:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,291,1491289200"; d="scan'208";a="1126762656"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2017 02:14:41 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 May 2017 19:04:58 -0700
Message-Id: <1493949898-38657-3-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493949898-38657-1-git-send-email-wei.tee.ng@intel.com>
References: <1493949898-38657-1-git-send-email-wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com
Subject: [PATCH 2/2] linux-firmware: enable netronome firmware
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
X-List-Received-Date: Fri, 05 May 2017 09:14:41 -0000

From: Ng Wei Tee <wei.tee.ng@intel.com>

It was previously disabled, as rpm refused to package it into noarch
package, due to the firmware being considered arch-specific. This
check is disabled in rpm now.

The netronome binaries has ELF headers which will trigger an
arch-specific error. INSANE_SKIP variable is used to skip some
package_qa check usage.

Signed-off-by: Ng Wei Tee <wei.tee.ng@intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 25 +++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index be5bdbd..a1b7065 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -31,6 +31,7 @@ LICENSE = "\
     & Firmware-Marvell \
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
+    & Firmware-netronome \
     & Firmware-nvidia \
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
@@ -88,6 +89,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
     file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
+    file://LICENCE.Netronome;md5=cd2a3e6effe3cdf42731575b8e9477ed \
     file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
     file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
     file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
@@ -146,6 +148,7 @@ NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
 NO_GENERIC_LICENSE[Firmware-moxa] = "LICENCE.moxa"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] = "LICENCE.myri10ge_firmware"
+NO_GENERIC_LICENSE[Firmware-netronome] = "LICENCE.Netronome"
 NO_GENERIC_LICENSE[Firmware-nvidia] = "LICENCE.nvidia"
 NO_GENERIC_LICENSE[Firmware-OLPC] = "LICENCE.OLPC"
 NO_GENERIC_LICENSE[Firmware-ath9k-htc] = "LICENCE.open-ath9k-htc-firmware"
@@ -216,9 +219,6 @@ do_install() {
 
         # Copy the iwlwifi ucode
         cp ${WORKDIR}/iwlwifi-8000C-19.ucode ${D}${nonarch_base_libdir}/firmware/
-
-	# TODO: Remove netronome firmware until RPM packaging issue is resolved
-	rm -r ${D}${nonarch_base_libdir}/firmware/netronome/
 }
 
 
@@ -246,6 +246,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
+             ${PN}-netronome-license ${PN}-netronome \
              ${PN}-whence-license \
              ${PN}-license \
              "
@@ -371,6 +372,21 @@ RDEPENDS_${PN}-sd8801 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8887 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8897 += "${PN}-marvell-license"
 
+# For netronome
+LICENSE_${PN}-netronome = "Firmware-netronome"
+
+FILES_${PN}-netronome-license = " \
+  ${nonarch_base_libdir}/firmware/LICENCE.Netronome \
+"
+FILES_${PN}-netronome = " \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0081*.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0096*.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0097*.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0099*.nffw \
+"
+
+RDEPENDS_${PN}-netronome += "${PN}-netronome-license"
+
 # For rtl
 LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
@@ -647,3 +663,6 @@ python populate_packages_prepend () {
     iwlwifi_pkgs = filter(lambda x: x.find('-iwlwifi-') != -1, firmware_pkgs)
     d.appendVar('RDEPENDS_linux-firmware-iwlwifi', ' ' + ' '.join(iwlwifi_pkgs))
 }
+
+# Netronome binaries has ELF headers and therefore triggers an arch-specific error.
+INSANE_SKIP_${PN}-netronome = "arch"
-- 
2.7.4


