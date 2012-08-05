Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71K-0004kU-Ej
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:51 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1834570wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ac99AXDpYjORohj0NZnKHi5bOvXOBniWQsSzkrtsowE=;
	b=K2WXtRm3Ebm6DBxgi23njBF7xuJ98iVSP3Wwt+64ExTZJ7ZpvcCYfQXwuIW9AUlShS
	r/flH2dzHGJHncd2z4LsLd/WGVPl8938vNDJ/GJ8dZxgrFbk2lXwJItfyxRAPS+Oylad
	B5T9vwWZ1ntJj2H9ERA4EcIKDmbEmWo1CRKouJIRThX8UnMQrNloEgm0/LlniuPr1h26
	okNPbLe+LzG3ArbxqOgzaUC+X5hs4lJjkT4sOzWmNbHTY9J1I51r+3ndES0G+B0CI1gm
	1zar4APRf95p5iFr6Yj1wFB2eyBNU4LYQS4K4zxDZqucknQ1J15wbXZ5ztDyS1qP1EYO
	CWcw==
Received: by 10.216.233.25 with SMTP id o25mr4679623weq.130.1344196209027;
	Sun, 05 Aug 2012 12:50:09 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:08 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:45 +0200
Message-Id: <1344196136-7643-18-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQmWT4V0l0lMPEjkF2gSktnLWX/i1MkOjQq0/9+DVVAXncWaaKlrC8FlWK0sMRHxpygX37bz
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 17/28] linux-firware: use ${base_libdir} instead of /lib for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:52 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../linux-firmware/linux-firmware_git.bb           |   36 ++++++++++----------
 1 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index a7e4ed6..5b93975 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
 SRCREV = "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
 PE = "1"
 PV = "0.0+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git"
 
@@ -35,50 +35,50 @@ do_compile() {
 }
 
 do_install() {
-	install -d  ${D}/lib/firmware/
-	cp -r * ${D}/lib/firmware/
+	install -d  ${D}${base_libdir}/firmware/
+	cp -r * ${D}${base_libdir}/firmware/
 
 	# Libertas sd8686
-	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
-	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
+	ln -sf libertas/sd8686_v9.bin ${D}${base_libdir}/firmware/sd8686.bin
+	ln -sf libertas/sd8686_v9_helper.bin ${D}${base_libdir}/firmware/sd8686_helper.bin
 
 	# Realtek rtl8192* 
-	install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}/lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt
+	install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}${base_libdir}/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt
 
 	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
-	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
+	( cd ${D}${base_libdir}/firmware ; ln -sf ti-connectivity/* . )
 }
 
 PACKAGES =+ "${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su ${PN}-wl12xx"
 
 LICENSE_${PN}-sd8686 = "Firmware:LICENSE.libertas"
 FILES_${PN}-sd8686 = " \
-  /lib/firmware/libertas/sd8686_v9* \
-  /lib/firmware/sd8686* \
-  /lib/firmware/LICENCE.libertas \
+  ${base_libdir}/firmware/libertas/sd8686_v9* \
+  ${base_libdir}/firmware/sd8686* \
+  ${base_libdir}/firmware/LICENCE.libertas \
 "
 
 LICENSE_${PN}-rtl8192cu = "Firmware:LICENCE.rtlwifi_firmware"
 FILES_${PN}-rtl8192cu = " \
-  /lib/firmware/rtlwifi/rtl8192cufw.bin \
-  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
+  ${base_libdir}/firmware/rtlwifi/rtl8192cufw.bin \
+  ${base_libdir}/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
 "
 
 LICENSE_${PN}-rtl8192ce = "Firmware:LICENCE.rtlwifi_firmware"
 FILES_${PN}-rtl8192ce = " \
-  /lib/firmware/rtlwifi/rtl8192cfw.bin \
+  ${base_libdir}/firmware/rtlwifi/rtl8192cfw.bin \
 "
 
 LICENSE_${PN}-rtl8192su = "Firmware:LICENCE.rtlwifi_firmware"
 FILES_${PN}-rtl8192su = " \
-  /lib/firmware/rtlwifi/rtl8712u.bin \
+  ${base_libdir}/firmware/rtlwifi/rtl8712u.bin \
 "
 
 FILES_${PN}-wl12xx = " \
-  /lib/firmware/wl12* \
-  /lib/firmware/TI* \
-  /lib/firmware/ti-connectivity \
+  ${base_libdir}/firmware/wl12* \
+  ${base_libdir}/firmware/TI* \
+  ${base_libdir}/firmware/ti-connectivity \
 "
 
-FILES_${PN} += "/lib/firmware/*"
+FILES_${PN} += "${base_libdir}/firmware/*"
 
-- 
1.7.7.6



