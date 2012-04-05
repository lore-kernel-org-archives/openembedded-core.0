Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1SFkHw-0001Ca-7Q
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 12:51:36 +0200
Received: from localhost.localdomain (hanuta.TechFak.Uni-Bielefeld.DE
	[129.70.129.229])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id 8F434B2;
	Thu,  5 Apr 2012 12:37:18 +0200 (CEST)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 12:36:58 +0200
Message-Id: <1333622218-5230-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] linux-firmware: keep version string in libertas firmware
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
X-List-Received-Date: Thu, 05 Apr 2012 10:51:36 -0000

Recent Linux kernel tries to load the libertas firmware with the version
string in its name first. This results in a delayed firmware load on
system boot. Keep the default libertas firmware name and add a link for
older driver versions.

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 .../linux-firmware/linux-firmware_git.bb           |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 52929fa..3675978 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -38,8 +38,8 @@ do_install() {
 	cp -r * ${D}/lib/firmware/
 
 	# Libertas sd8686
-	install -m 0644 libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
-	install -m 0644 libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
+	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
+	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
 
 	# Realtek rtl8192* 
 	install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}/lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt
@@ -51,7 +51,11 @@ do_install() {
 PACKAGES =+ "${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su ${PN}-wl12xx"
 
 LICENSE_${PN}-sd8686 = "Firmware:LICENSE.libertas"
-FILES_${PN}-sd8686 = "/lib/firmware/sd8686* /lib/firmware/LICENCE.libertas"
+FILES_${PN}-sd8686 = " \
+  /lib/firmware/libertas/sd8686_v9* \
+  /lib/firmware/sd8686* \
+  /lib/firmware/LICENCE.libertas \
+"
 
 LICENSE_${PN}-rtl8192cu = "Firmware:LICENCE.rtlwifi_firmware"
 FILES_${PN}-rtl8192cu = " \
-- 
1.7.0.4



