Return-Path: <maciej.pijanowski@3mdeb.com>
Received: from cloudserver096301.home.net.pl (cloudserver096301.home.net.pl
	[79.96.179.35])
	by mail.openembedded.org (Postfix) with ESMTP id 1955F72F91
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:23:03 +0000 (UTC)
Received: from 87-207-30-9.dynamic.chello.pl (87.207.30.9) (HELO
	localhost.localdomain)
	by serwer1539010.home.pl (79.96.179.35) with SMTP (IdeaSmtpServer 0.82)
	id a6321f25be5e3560; Sat, 19 Aug 2017 12:23:04 +0200
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 12:22:57 +0200
Message-Id: <1503138177-8419-2-git-send-email-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503138177-8419-1-git-send-email-maciej.pijanowski@3mdeb.com>
References: <1503138177-8419-1-git-send-email-maciej.pijanowski@3mdeb.com>
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [PATCH 2/2] linux-firmware: package ibt-firmware
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
X-List-Received-Date: Sat, 19 Aug 2017 10:23:04 -0000

ibt-firmware was not packaged separately and was part of big linux-firmware
package. Packaging allows to install it separately, according to requirements.

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 2ef56da014b7..396bd4ef12d6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -250,6 +250,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-7265 \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-iwlwifi-misc \
+             ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
+             ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
@@ -628,6 +630,30 @@ RPROVIDES_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-
 RREPLACES_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7260-9"
 RCONFLICTS_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7260-9"
 
+# For ibt
+LICENSE_${PN}-ibt-license = "Firmware-ibt_firmware"
+LICENSE_${PN}-ibt-hw-37-7 = "Firmware-ibt_firmware"
+LICENSE_${PN}-ibt-hw-37-8 = "Firmware-ibt_firmware"
+LICENSE_${PN}-ibt-11-5    = "Firmware-ibt_firmware"
+LICENSE_${PN}-ibt-12-16   = "Firmware-ibt_firmware"
+LICENSE_${PN}-ibt-misc    = "Firmware-ibt_firmware"
+
+FILES_${PN}-ibt-license = "${nonarch_base_libdir}/firmware/LICENCE.ibt_firmware"
+FILES_${PN}-ibt-hw-37-7 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.7*.bseq"
+FILES_${PN}-ibt-hw-37-8 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.8*.bseq"
+FILES_${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi /lib/firmware/intel/ibt-11-5.ddc"
+FILES_${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi /lib/firmware/intel/ibt-12-16.ddc"
+FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/ibt-*"
+
+RDEPENDS_${PN}-ibt-hw-37-7 = "${PN}-ibt-license"
+RDEPENDS_${PN}-ibt-hw-37.8 = "${PN}-ibt-license"
+RDEPENDS_${PN}-ibt-11-5    = "${PN}-ibt-license"
+RDEPENDS_${PN}-ibt-12-16   = "${PN}-ibt-license"
+RDEPENDS_${PN}-ibt-misc    = "${PN}-ibt-license"
+
+ALLOW_EMPTY_${PN}-ibt= "1"
+ALLOW_EMPTY_${PN}-ibt-misc = "1"
+
 LICENSE_${PN}-i915       = "Firmware-i915"
 LICENSE_${PN}-i915-license = "Firmware-i915"
 FILES_${PN}-i915-license = "${nonarch_base_libdir}/firmware/LICENSE.i915"
@@ -695,12 +721,16 @@ RDEPENDS_${PN} += "${PN}-whence-license"
 
 # Make linux-firmware depend on all of the split-out packages.
 # Make linux-firmware-iwlwifi depend on all of the split-out iwlwifi packages.
+# Make linux-firmware-ibt depend on all of the split-out ibt packages.
 python populate_packages_prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
     d.appendVar('RDEPENDS_linux-firmware', ' ' + ' '.join(firmware_pkgs))
 
     iwlwifi_pkgs = filter(lambda x: x.find('-iwlwifi-') != -1, firmware_pkgs)
     d.appendVar('RDEPENDS_linux-firmware-iwlwifi', ' ' + ' '.join(iwlwifi_pkgs))
+
+    ibt_pkgs = filter(lambda x: x.find('-ibt-') != -1, firmware_pkgs)
+    d.appendVar('RDEPENDS_linux-firmware-ibt', ' ' + ' '.join(ibt_pkgs))
 }
 
 # Netronome binaries has ELF headers and therefore triggers an arch-specific error.
-- 
2.7.4


