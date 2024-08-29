Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA0AC87FD2
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 19:38:17 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.30058.1724960293096121280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 12:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=e+dmS4PA;
 spf=pass (domain: siemens.com, ip: 185.136.64.226, mailfrom: alexander.sverdlin@siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202408291938096decf7085f5f15514e
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Aug 2024 21:38:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eFVaO6vgu3QemeDWHDL3HK5ltG4edsVu8GrQZQRcLms=;
 b=e+dmS4PA0MQrbWcyU061GfQdReW0mQ08B/N6Pb7rdg8G5KcWqkcZjEkv/DOXurwEFamVFM
 XFXt6LGm8tdFRKj+4m9fSNsSvIGeczsi+72BbhylNDIOWvNS2/zk56CXKeSJSD0dz0vQXrsA
 uCHQKdki36iW692FTUVsVehmM7OjXgovk9CQILoZEo7lSB2amaibJcC2j/Kp5e7KLjmPpNMM
 /eWKVaqEnWc89js0HtQ4YK0KJWIQq6m+EZcKP0/j924uTJFuyJJdlZLTuPYFyx0UeLNGhSgZ
 DPeM9fbcqTCeTvcCE6WRMsoFr+gC/iLIxgv++9SsNYBoAWpAinIGoRVQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH] linux-firmware: Move Silabs wfx firmware to a separate package
Date: Thu, 29 Aug 2024 21:36:33 +0200
Message-ID: <20240829193633.749278-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 19:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203945

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Separate 300KB wfx firmware from the rest of linux-firmware package.
With this change the wfx/LICENCE.wf200 is really packaged, before the
change it didn't fall into copying wildcard.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 .../linux-firmware/linux-firmware_20240811.bb   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index 7a9c2b2b238..ab22bc83bbe 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -72,6 +72,7 @@ LICENSE = "\
     & Firmware-ti-keystone \
     & Firmware-ueagle-atm4-firmware \
     & Firmware-via_vt6656 \
+    & Firmware-wfx \
     & Firmware-wl1251 \
     & Firmware-xc4000 \
     & Firmware-xc5000 \
@@ -152,6 +153,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
+                    file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
                     file://WHENCE;md5=${WHENCE_CHKSUM} \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
@@ -227,6 +229,7 @@ NO_GENERIC_LICENSE[Firmware-ti-connectivity] = "LICENCE.ti-connectivity"
 NO_GENERIC_LICENSE[Firmware-ti-keystone] = "LICENCE.ti-keystone"
 NO_GENERIC_LICENSE[Firmware-ueagle-atm4-firmware] = "LICENCE.ueagle-atm4-firmware"
 NO_GENERIC_LICENSE[Firmware-via_vt6656] = "LICENCE.via_vt6656"
+NO_GENERIC_LICENSE[Firmware-wfx] = "wfx/LICENCE.wf200"
 NO_GENERIC_LICENSE[Firmware-wl1251] = "LICENCE.wl1251"
 NO_GENERIC_LICENSE[Firmware-xc4000] = "LICENCE.xc4000"
 NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
@@ -263,6 +266,7 @@ do_compile() {
 do_install() {
         oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' ${PACKAGECONFIG_CONFARGS}
         cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
+        cp wfx/LICEN[CS]E.* ${D}${nonarch_base_libdir}/firmware/wfx/
 }
 
 
@@ -407,6 +411,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-lt9611uxc ${PN}-lontium-license \
+             ${PN}-wfx-license ${PN}-wfx \
              ${PN}-whence-license \
              ${PN}-wl1251-license ${PN}-wl1251 \
              ${PN}-xc4000-license ${PN}-xc4000 \
@@ -893,6 +898,18 @@ RDEPENDS:${PN}-rtl8822 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8168 += "${PN}-whence-license"
 RDEPENDS:${PN}-rtl-nic += "${PN}-whence-license"
 
+# For Silabs
+LICENSE:${PN}-wfx = "Firmware-wfx"
+LICENSE:${PN}-wfx-license = "Firmware-wfx"
+
+FILES:${PN}-wfx = " \
+  ${nonarch_base_libdir}/firmware/wfx/*.pds         \
+  ${nonarch_base_libdir}/firmware/wfx/*.sec         \
+"
+FILES:${PN}-wfx-license = "${nonarch_base_libdir}/firmware/wfx/LICENCE.wf200"
+
+RDEPENDS:${PN}-wfx += "${PN}-wfx-license"
+
 # For TI wl1251
 LICENSE:${PN}-wl1251 = "Firmware-wl1251"
 LICENSE:${PN}-wl1251-license = "Firmware-wl1251"
-- 
2.46.0


