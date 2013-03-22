Received: from mail-gh0-f177.google.com ([209.85.160.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UJ24m-0005Vb-3Y
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 14:32:08 +0100
Received: by mail-gh0-f177.google.com with SMTP id g22so83061ghb.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 06:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=viQeSdOrSv1TG0n+u51FulJJMM7W97W2TgCm64+0CEY=;
	b=RY3niyr3hWVAMGlThZoS08rtiMqbLxEo1xjsBlypJZyfyLreSMJw2zOnAk/iU+Id0U
	4Xgf3rV0Zx1fHxr61UfFZ17fQNRdPNy69mFIaxHrevtP2cAx+mg3Ysfl3KpHxTNgMVAT
	ra/xlvEkEiPK3WX68G3EjnPWTVactrF5rce0f8PNXeINbRj82QUfo000SpjsaQXPJjxm
	9Ehm7kkic0LnkZJsJwNXMtE7Ee08zV/H/7hlzmZe58rp3/2BICtO2Saein2+iyjRFx4q
	Ogs6vrj1d0+S2H1YuS4Wb1qZoj8O4nXSQN/lySbn7R2BJCUO/Wplh7M/fPq/HDw8ujtV
	g/hw==
X-Received: by 10.236.70.1 with SMTP id o1mr929100yhd.4.1363958114043;
	Fri, 22 Mar 2013 06:15:14 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id q69sm2679407yhe.15.2013.03.22.06.15.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 06:15:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Mar 2013 10:21:00 -0300
Message-Id: <1363958460-32570-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] linux-firmware: Package Broadcom firmwares
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
X-List-Received-Date: Fri, 22 Mar 2013 13:32:09 -0000

Adds specific packages for bcm4329, bcm4330 and bcm4334, including
handling of symbolic link for the needed firmware filename.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes for v2:
- Fix shortlog typo

 .../linux-firmware/linux-firmware_git.bb           | 39 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 0bf5a08..b9e00fc 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
+                    file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
                    "
 
 SRCREV = "c530a75c1e6a472b0eb9558310b518f0dfcd8860"
@@ -27,7 +28,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware
 
 S = "${WORKDIR}/git"
 
-inherit allarch
+inherit allarch update-alternatives
 
 do_compile() {
 	:
@@ -48,7 +49,9 @@ do_install() {
 	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
 }
 
-PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce linux-firmware-rtl8192su ${PN}-wl12xx"
+PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-rtl8192cu \
+             ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-wl12xx \
+             ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334"
 
 LICENSE_${PN}-ralink = "Firmware-ralink"
 FILES_${PN}-ralink = " \
@@ -85,4 +88,36 @@ FILES_${PN}-wl12xx = " \
   /lib/firmware/ti-connectivity \
 "
 
+# WARNING: The ALTERNATIVE_* variables are not using ${PN} because of
+# a bug in bitbake; when this is fixed and bitbake learns how to proper
+# pass variable flags with expansion we can rework this patch.
+
+ALTERNATIVE_LINK_NAME[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac-sdio.bin"
+
+LICENSE_${PN}-bcm4329 = "Firmware-bcm4329"
+FILES_${PN}-bcm4329 = " \
+  /lib/firmware/brcm/brcmfmac4329.bin \
+  /lib/firmware/LICENCE.broadcom_bcm43xx \
+"
+ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329.bin"
+
+LICENSE_${PN}-bcm4330 = "Firmware-bcm4330"
+FILES_${PN}-bcm4330 = " \
+  /lib/firmware/brcm/brcmfmac4330.bin \
+  /lib/firmware/LICENCE.broadcom_bcm43xx \
+"
+
+ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330.bin"
+
+LICENSE_${PN}-bcm4334 = "Firmware-bcm4334"
+FILES_${PN}-bcm4334 = " \
+  /lib/firmware/brcm/brcmfmac4334.bin \
+  /lib/firmware/LICENCE.broadcom_bcm43xx \
+"
+
+ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334.bin"
+
 FILES_${PN} += "/lib/firmware/*"
-- 
1.8.1



