Received: from mail-gh0-f172.google.com ([209.85.160.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UJVGf-0005O4-T1
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 21:42:22 +0100
Received: by mail-gh0-f172.google.com with SMTP id z22so270511ghb.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2013 13:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=z7Pv7xKGFP36wclN466AosDdAM8DIXkH8xCxxTsTfAI=;
	b=ciAdgblXZ8Mwfscgsvrnr/K2acHRLMI0fwBzF84/pvQZI7RSOCy5KEE6vswiFvc6fx
	i/Y6ak05nkblxty8ZBub+tyIE4cm79SgqiN70VDXKpazN+MHCSl6/ukA0/kXzUcl8c+3
	ZWQ2ulK6olto7wz1S1PQLuqrq9vskErrBw3Rlaoqvjnbjt4j2K/jgqJtCB3gbWAss0lE
	trA2otuo807MF1kSnuY4KXUxA17yZueNSHo2ao51pz4prT8dwYMzr8Q+yp15xTxlDbvh
	SWvpXgFQo4mDIpcmC869xbwQyc906yuNpK5+x8WjB6Xhi7shXX1v5T/cZ1lA1lSEg9W+
	shJA==
X-Received: by 10.236.132.242 with SMTP id o78mr3729280yhi.71.1364070325939;
	Sat, 23 Mar 2013 13:25:25 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id t47sm10040150yhe.22.2013.03.23.13.25.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 23 Mar 2013 13:25:25 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 23 Mar 2013 17:30:58 -0300
Message-Id: <1364070660-13157-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/4] linux-firmware: Do not deploy license files in packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Mar 2013 20:42:24 -0000

We don't ship license files with packages and firmware packages are no
different; drop them.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 6842738..99c226c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -42,9 +42,6 @@ do_install() {
 	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
 	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
 
-	# Realtek rtl8192* 
-	install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}/lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt
-
 	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
 	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
 }
@@ -56,20 +53,17 @@ PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-rtl8192cu \
 LICENSE_${PN}-ralink = "Firmware-ralink"
 FILES_${PN}-ralink = " \
   /lib/firmware/rt*.bin \
-  /lib/firmware/LICENSE.ralink_firmware.txt \
 "
 
 LICENSE_${PN}-sd8686 = "Firmware-libertas"
 FILES_${PN}-sd8686 = " \
   /lib/firmware/libertas/sd8686_v9* \
   /lib/firmware/sd8686* \
-  /lib/firmware/LICENCE.libertas \
 "
 
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192cu = " \
   /lib/firmware/rtlwifi/rtl8192cufw.bin \
-  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
 "
 
 LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi"
@@ -97,7 +91,6 @@ ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac-sdio.bin
 LICENSE_${PN}-bcm4329 = "Firmware-bcm4329"
 FILES_${PN}-bcm4329 = " \
   /lib/firmware/brcm/brcmfmac4329.bin \
-  /lib/firmware/LICENCE.broadcom_bcm43xx \
 "
 ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329.bin"
@@ -105,7 +98,6 @@ ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/br
 LICENSE_${PN}-bcm4330 = "Firmware-bcm4330"
 FILES_${PN}-bcm4330 = " \
   /lib/firmware/brcm/brcmfmac4330.bin \
-  /lib/firmware/LICENCE.broadcom_bcm43xx \
 "
 
 ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
@@ -114,7 +106,6 @@ ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/br
 LICENSE_${PN}-bcm4334 = "Firmware-bcm4334"
 FILES_${PN}-bcm4334 = " \
   /lib/firmware/brcm/brcmfmac4334.bin \
-  /lib/firmware/LICENCE.broadcom_bcm43xx \
 "
 
 ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
-- 
1.8.1



