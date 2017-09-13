Return-Path: <california.l.sullivan@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B487177B39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 23:06:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 13 Sep 2017 16:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,390,1500966000"; d="scan'208";a="1014193624"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 13 Sep 2017 16:05:59 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 16:05:49 -0700
Message-Id: <20170913230549.27953-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
Cc: stefan.agner@toradex.com, dominik.sliwa@toradex.com, saul.wold@intel.com
Subject: [PATCH v2] linux-firmware: bump to latest linux-firmware git revision
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
X-List-Received-Date: Wed, 13 Sep 2017 23:06:01 -0000

From: Stefan Agner <stefan.agner@toradex.com>

This requires MD5 sum updates for
- LICENSE.QualcommAtheros_ath10k: year change
- WHENCE: various version updates and addition of new firmwares

The new firmware for Qualcom Venus causes a QA error:
  QA Issue: linux-firmware: Recipe inherits the allarch class, but has packaged architecture-specific binaries

Since firmware typically do not run on the CPU, the architecture of
the firmware file is independent from the CPU architecture the image
will be running on. Disable the QA check for the linux-firmware
package by default.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
Hi Stefan,
In interest of getting this into 2.4 (freezes Monday, and it turns out
we also need this latest bump), I went ahead and fixed it up as per
Ross' suggestion. Ross was quick and already added the required
functionality to INSANE_SKIP.

If this isn't acceptable please let me know.

Thanks,
Cal

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 20d140c..6798ace 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -98,7 +98,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
     file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
     file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
-    file://LICENSE.QualcommAtheros_ath10k;md5=b5fe244fb2b532311de1472a3bc06da5 \
+    file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8 \
     file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
     file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16 \
     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
@@ -114,7 +114,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=ad12d0618287e8c10ae3da05fa0edcfb \
+    file://WHENCE;md5=08f6d4371353cac5f6fc271d5407c63e \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -175,7 +175,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "b14134583c2a15d4404695f72cb523daedb877ab"
+SRCREV = "a61ac5cf8374edbfe692d12f805a1b194f7fead2"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
@@ -744,5 +744,6 @@ python populate_packages_prepend () {
     d.appendVar('RDEPENDS_linux-firmware-ibt', ' ' + ' '.join(ibt_pkgs))
 }
 
-# Netronome binaries has ELF headers and therefore triggers an arch-specific error.
-INSANE_SKIP_${PN}-netronome = "arch"
+# Firmware files are generally not ran on the CPU, so they can be
+# allarch despite being architecture specific
+INSANE_SKIP = "arch"
-- 
2.9.5


