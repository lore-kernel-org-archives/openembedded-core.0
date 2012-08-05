Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3M1-00084u-Hb
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:57 +0200
Received: by wgbdr1 with SMTP id dr1so1752007wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=SLClRjm4N7ZMu4g9a45VWZiSyup6TlyxQhttfEmFQuQ=;
	b=FtMIVLzf7IekQ0XPL+qS09vn+YgkKMmFKo7y+M4x5kg78JhEBZraBQyI3BgPq960YX
	0k0kF5dYfFYdIZNBeU8Fyk28KRXZCh02b3IZ3P7OLVBDIYuAA2MOigvk9D7NtvWBQq3K
	CYkmWPIsvFeXcc6MCVdQe2hlKjoA1+mxGs/o17CLzoB8tfseaeJxVhAxTEfiAm7C8fp/
	+ufl3eFDx1vYHtBz4ornrqLLElCIGIpm/Yi+AI2m0EDi0FYrmLCTeHFyxQ0Ln7Zzjc5w
	ZS961dilZkhzvUesJqTp/5FLR0QaFI5wyekbc5DS6AfXIs9TZzATFhyJ8u/Yz2XMHQM+
	+WJQ==
Received: by 10.180.100.37 with SMTP id ev5mr11531990wib.5.1344182114317;
	Sun, 05 Aug 2012 08:55:14 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:13 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:04 +0200
Message-Id: <1344182057-15981-18-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQloyO1p+NBWgWVBAVwDe0HIxddlwXxPtzkpmD0EQ3NCLpX0zUnBr2k/JbfOkwa5Fw+AocnP
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/30] linux-firware: use ${base_libdir} instead of /lib for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:58 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../linux-firmware/linux-firmware_git.bb           |   34 ++++++++++----------
 1 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index a7e4ed6..c5ab173 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
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



