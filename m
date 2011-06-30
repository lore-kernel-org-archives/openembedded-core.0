Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QcLjo-00047i-Bo
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 20:13:16 +0200
Received: by fxh10 with SMTP id 10so2783184fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 11:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ox6rKxdpHkO5qbh4ukNMU0NrkuoMbBIeJ2CytmID1OI=;
	b=Nqo+ZY4xNOVo3x30vqghk0OxLyWnA/EdRAdhubiXO7XacYdq9fVucpWJWyWfKZXT8n
	f7TqXdDzROU2+NK/95p1lXMG0fAn4UUefGH88WOPDG0D2tenZ4g7T9EXRZq6dbjTVMS/
	kPhl7r+KVvSJrVDBHt/gqkfEaJ5WMnJltBAW8=
Received: by 10.223.93.196 with SMTP id w4mr383525fam.44.1309457372817;
	Thu, 30 Jun 2011 11:09:32 -0700 (PDT)
Received: from localhost.localdomain
	(85-127-149-243.dynamic.xdsl-line.inode.at [85.127.149.243])
	by mx.google.com with ESMTPS id f15sm602756fai.46.2011.06.30.11.09.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 11:09:32 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 20:09:11 +0200
Message-Id: <1309457351-6103-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] linux-firmware: Add Realtex rt8192* firmwares
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2011 18:13:16 -0000

This patch adds the firmware files for:
 * rt8192cu
 * rt8192ce
 * rt8192su

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../linux-firmware/linux-firmware_git.bb           |   39 +++++++++++++++++++-
 1 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 3d822c5..bdeb264 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -2,6 +2,9 @@ DESCRIPTION = "Firmware files for use with Linux kernel"
 SECTION = "kernel"
 LICENSE = "Proprietary"
 LICENSE_${PN}-sd8686 = "Firmware:LICENSE.libertas"
+LICENSE_${PN}-rtl8192cu = "Firmware:LICENCE.rtlwifi_firmware"
+LICENSE_${PN}-rtl8192ce = "Firmware:LICENCE.rtlwifi_firmware"
+LICENSE_${PN}-rtl8192su = "Firmware:LICENCE.rtlwifi_firmware"
 
 LIC_FILES_CHKSUM = "file://LICENSE.radeon_rlc;md5=4c243f7854d2884b483abda991adef43 \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
@@ -14,12 +17,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon_rlc;md5=4c243f7854d2884b483abda991adef
                     file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
                     file://LICENCE.atheros_firmware;md5=62748c8fecfa12010fd76409db4b5459 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
+                    file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                    "
 
-PROVIDES += "linux-firmware-sd8686"
+PROVIDES += "linux-firmware-sd8686 linux-firmware-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su"
 
 SRCREV = "40c0f950be7040614dc45df54e25e54d00e3b73b"
 PV = "0.0+git${SRCPV}"
+PR = "r1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git;protocol=git"
 
@@ -35,12 +40,42 @@ do_install() {
 	install -m 0666 libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
 	install -m 0666 libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
 	install -m 0666 LICENCE.libertas ${D}/lib/firmware/
+	# Realtek rtl8192* 
+	install -d ${D}/lib/firmware/rtlwifi/
+	install -m 0666 rtlwifi/rtl8192cufw.bin ${D}/lib/firmware/rtlwifi/rtl8192cufw.bin
+	install -m 0666 rtlwifi/rtl8192cfw.bin ${D}/lib/firmware/rtlwifi/rtl8192cfw.bin
+	install -m 0666 rtlwifi/rtl8712u.bin ${D}/lib/firmware/rtlwifi/rtl8712u.bin	
+	install -m 0666 LICENCE.rtlwifi_firmware.txt ${D}/lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt
 }
 
-PACKAGES = "${PN}-sd8686"
+PACKAGES = "${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su"
 
 FILES_${PN}-sd8686 = "/lib/firmware/sd8686* /lib/firmware/LICENCE.libertas"
 
 RPROVIDES_${PN}-sd8686 = "${PN}-sd8686"
 
+FILES_${PN}-rtl8192cu = " \
+  /lib/firmware/rtlwifi/rtl8192cufw.bin \
+  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
+"
+RPROVIDES_${PN}-rtl8192cu = "${PN}-rtl8192cu"
+
+FILES_${PN}-rtl8192cu = " \
+  /lib/firmware/rtlwifi/rtl8192cufw.bin \
+  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
+"
+RPROVIDES_${PN}-rtl8192cu = "${PN}-rtl8192cu"
+
+FILES_${PN}-rtl8192ce = " \
+  /lib/firmware/rtlwifi/rtl8192cfw.bin \
+  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
+"
+RPROVIDES_${PN}-rtl8192ce = "${PN}-rtl8192ce"
+
+FILES_${PN}-rtl8192su = " \
+  /lib/firmware/rtlwifi/rtl8712u.bin \
+  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
+"
+RPROVIDES_${PN}-rtl8192su = "${PN}-rtl8192su"
+
 PACKAGE_ARCH = "all"
-- 
1.7.3.4



