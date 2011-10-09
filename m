Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCqMt-0007WE-2m
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 12:12:27 +0200
Received: by bke11 with SMTP id 11so7199160bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2011 03:06:47 -0700 (PDT)
Received: by 10.223.5.3 with SMTP id 3mr24046584fat.4.1318154807526;
	Sun, 09 Oct 2011 03:06:47 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id y8sm24182377faj.10.2011.10.09.03.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Oct 2011 03:06:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Oct 2011 12:06:41 +0200
Message-Id: <1318154801-28945-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][PATCH] linux-firmware: update, merge in OE classic updates, fix packaging
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
X-List-Received-Date: Sun, 09 Oct 2011 10:12:27 -0000

Update: move to latest SRCREV, use non-kernel.org URI
Merge: wl12xx symlink + packaging, install all firmwares
Fix: * all entries in PACKAGES are in PROVIDES already
     * A package always RPROVIDES itself
     * A file can only get packaged *once* so only one rtlwifi package will get the license

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Both this and the OE classic version give the me "there must be another way" feeling. Anyway, this patch gives me what I want, namely the wilink files. If people want other firmware files subpackaged, respond to the RFC and I'll have a look.

I'd really like the wl12xx packaging (and associated SRCREV bump) to go into the 1.1 release. But as it is with ponies and world peace, we might not all get what we want :)

 .../linux-firmware/linux-firmware_git.bb           |   54 ++++++++-----------
 1 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 660877e..e64ee92 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -1,32 +1,24 @@
 DESCRIPTION = "Firmware files for use with Linux kernel"
 SECTION = "kernel"
 LICENSE = "Proprietary"
-LICENSE_${PN}-sd8686 = "Firmware:LICENSE.libertas"
-LICENSE_${PN}-rtl8192cu = "Firmware:LICENCE.rtlwifi_firmware"
-LICENSE_${PN}-rtl8192ce = "Firmware:LICENCE.rtlwifi_firmware"
-LICENSE_${PN}-rtl8192su = "Firmware:LICENCE.rtlwifi_firmware"
 
 LIC_FILES_CHKSUM = "file://LICENSE.radeon_rlc;md5=4c243f7854d2884b483abda991adef43 \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
                     file://LICENCE.qla2xxx;md5=4005328a134054f0fa077bdc37aa64f2 \
-                    file://LICENCE.mwl8k;md5=9ddea1734a4baf3c78d845151f42a37a \
-                    file://LICENCE.libertas;md5=2d2127d203ac000f1afabfce593659ce \
                     file://LICENCE.iwlwifi_firmware;md5=311cc823df5b1be4f00fbf0f17d96a6b \
                     file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
-                    file://LICENCE.atheros_firmware;md5=62748c8fecfa12010fd76409db4b5459 \
+                    file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                    "
 
-PROVIDES += "linux-firmware-sd8686 linux-firmware-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su"
-
-SRCREV = "40c0f950be7040614dc45df54e25e54d00e3b73b"
+SRCREV = "d543c1d98fc240267ee59fff93f7a0f36d9e2fc3"
 PV = "0.0+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git;protocol=git"
+SRC_URI = "git://git.infradead.org/users/dwmw2/linux-firmware.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
@@ -36,46 +28,46 @@ do_compile() {
 
 do_install() {
 	install -d  ${D}/lib/firmware/
+	cp -RpP * ${D}/lib/firmware/
+
 	# Libertas sd8686
 	install -m 0644 libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
 	install -m 0644 libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
-	install -m 0644 LICENCE.libertas ${D}/lib/firmware/
+
 	# Realtek rtl8192* 
-	install -d ${D}/lib/firmware/rtlwifi/
-	install -m 0644 rtlwifi/rtl8192cufw.bin ${D}/lib/firmware/rtlwifi/rtl8192cufw.bin
-	install -m 0644 rtlwifi/rtl8192cfw.bin ${D}/lib/firmware/rtlwifi/rtl8192cfw.bin
-	install -m 0644 rtlwifi/rtl8712u.bin ${D}/lib/firmware/rtlwifi/rtl8712u.bin	
 	install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}/lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt
+
+	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
+	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
 }
 
-PACKAGES = "${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su"
+PACKAGES =+ "${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su ${PN}-wl12xx"
 
+LICENSE_${PN}-sd8686 = "Firmware:LICENSE.libertas"
 FILES_${PN}-sd8686 = "/lib/firmware/sd8686* /lib/firmware/LICENCE.libertas"
 
-RPROVIDES_${PN}-sd8686 = "${PN}-sd8686"
-
-FILES_${PN}-rtl8192cu = " \
-  /lib/firmware/rtlwifi/rtl8192cufw.bin \
-  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
-"
-RPROVIDES_${PN}-rtl8192cu = "${PN}-rtl8192cu"
-
+LICENSE_${PN}-rtl8192cu = "Firmware:LICENCE.rtlwifi_firmware"
 FILES_${PN}-rtl8192cu = " \
   /lib/firmware/rtlwifi/rtl8192cufw.bin \
   /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
 "
-RPROVIDES_${PN}-rtl8192cu = "${PN}-rtl8192cu"
 
+LICENSE_${PN}-rtl8192ce = "Firmware:LICENCE.rtlwifi_firmware"
 FILES_${PN}-rtl8192ce = " \
   /lib/firmware/rtlwifi/rtl8192cfw.bin \
-  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
 "
-RPROVIDES_${PN}-rtl8192ce = "${PN}-rtl8192ce"
 
+LICENSE_${PN}-rtl8192su = "Firmware:LICENCE.rtlwifi_firmware"
 FILES_${PN}-rtl8192su = " \
   /lib/firmware/rtlwifi/rtl8712u.bin \
-  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
 "
-RPROVIDES_${PN}-rtl8192su = "${PN}-rtl8192su"
+
+FILES_${PN}-wl12xx = " \
+  /lib/firmware/wl12* \
+  /lib/firmware/TI* \
+  /lib/firmware/ti-connectivity \
+"
+
+FILES_${PN} += "/lib/firmware/*"
 
 PACKAGE_ARCH = "all"
-- 
1.6.6.1



