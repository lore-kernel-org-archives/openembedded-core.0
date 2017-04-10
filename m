Return-Path: <wei.tee.ng@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A2BC46010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 09:09:57 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 10 Apr 2017 02:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,181,1488873600"; d="scan'208";a="85508392"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga005.jf.intel.com with ESMTP; 10 Apr 2017 02:09:57 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Apr 2017 18:58:44 -0700
Message-Id: <1491789524-26109-4-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491789524-26109-1-git-send-email-wei.tee.ng@intel.com>
References: <1491789524-26109-1-git-send-email-wei.tee.ng@intel.com>
Subject: [PATCH v3 3/3] linux-firmware: Fix build failure when update SRCREV to latest HEAD
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
X-List-Received-Date: Mon, 10 Apr 2017 09:09:57 -0000

From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>

When we update the SRCREV to latest, we will encouter the following
bitbake error.

Build error message:
| Requires(rpmlib): rpmlib(CompressedFileNames) <= 3.0.4-1 rpmlib(PayloadFilesHavePrefix) <= 4.0-1
| error: Arch dependent binaries in noarch package
|
|
| RPM build errors:
|     Missing build-id in /home/phoongst/work2/test00/tmp/work/all-poky-linux/linux-firmware/1_0.0+gitAUTOINC+44d8e8d4fd-r0/package/lib/firmware/netronome/nic_AMDA0081-0001_1x40.nffw
|     Missing build-id in /home/phoongst/work2/test00/tmp/work/all-poky-linux/linux-firmware/1_0.0+gitAUTOINC+44d8e8d4fd-r0/package/lib/firmware/netronome/nic_AMDA0099-0001_2x25.nffw
|     Missing build-id in /home/phoongst/work2/test00/tmp/work/all-poky-linux/linux-firmware/1_0.0+gitAUTOINC+44d8e8d4fd-r0/package/lib/firmware/netronome/nic_AMDA0097-0001_8x10.nffw
|     Missing build-id in /home/phoongst/work2/test00/tmp/work/all-poky-linux/linux-firmware/1_0.0+gitAUTOINC+44d8e8d4fd-r0/package/lib/firmware/netronome/nic_AMDA0081-0001_4x10.nffw
|     Missing build-id in /home/phoongst/work2/test00/tmp/work/all-poky-linux/linux-firmware/1_0.0+gitAUTOINC+44d8e8d4fd-r0/package/lib/firmware/netronome/nic_AMDA0097-0001_4x10_1x40.nffw
|     Missing build-id in /home/phoongst/work2/test00/tmp/work/all-poky-linux/linux-firmware/1_0.0+gitAUTOINC+44d8e8d4fd-r0/package/lib/firmware/netronome/nic_AMDA0099-0001_2x10.nffw
|     Missing build-id in /home/phoongst/work2/test00/tmp/work/all-poky-linux/linux-firmware/1_0.0+gitAUTOINC+44d8e8d4fd-r0/package/lib/firmware/netronome/nic_AMDA0097-0001_2x40.nffw
|     Missing build-id in /home/phoongst/work2/test00/tmp/work/all-poky-linux/linux-firmware/1_0.0+gitAUTOINC+44d8e8d4fd-r0/package/lib/firmware/netronome/nic_AMDA0096-0001_2x10.nffw
|     Deprecated external dependency generator is used!
|     Arch dependent binaries in noarch package
| WARNING: exit code 1 from a shell command.

This is due to netronome firmware is not included in noarch package.
Hence we removed the netronome firmware before it is packaged,
until the rpm issue is resolved.

Signed-off-by: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 7b43c25..be5bdbd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -112,7 +112,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=4c56371b1c0d9e75f7620563c652b566 \
+    file://WHENCE;md5=ad12d0618287e8c10ae3da05fa0edcfb \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -172,7 +172,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "a4dde74b504522d239e8521617b53b03f393ed6a"
+SRCREV = "b14134583c2a15d4404695f72cb523daedb877ab"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
@@ -216,6 +216,9 @@ do_install() {
 
         # Copy the iwlwifi ucode
         cp ${WORKDIR}/iwlwifi-8000C-19.ucode ${D}${nonarch_base_libdir}/firmware/
+
+	# TODO: Remove netronome firmware until RPM packaging issue is resolved
+	rm -r ${D}${nonarch_base_libdir}/firmware/netronome/
 }
 
 
-- 
2.7.4


