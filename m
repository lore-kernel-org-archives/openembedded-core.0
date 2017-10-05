Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A1A2777CF6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 18:00:15 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d13so26282196qta.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 11:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=85H0nkkJ6gO0KC4pGysdu07dtrCm08YfjegL12WYT8g=;
	b=OmbjxZ3c6bEbA99HaBX+YUiR0E0PF/HnKpOKaVfvxwDlgrJKYMWWokT0OqfVh+Bces
	ZI9h0l50MpwS9JW2liCdrQj6mb6PtfyoJYdtltFUfJk59ZJrsDcsp6TCWKxFfUVZi/z4
	69xsrIVRK4cR4ZNNBQJr+Q/2JPsgxMt0zgMMVQ8QGpcSH0g3UoWjD8q/ckgjUH/gNHih
	G92Ks7prxVz5Z3DItyR8zDAeg/nZh69C+XBbDqM5ybaAmYJ2QscS1CPcBqc/BByoJtAT
	JTM+AkTC6kph/TpNorDB8Rs8ieZpZIhS9RhHLwbagjEMDBd8ZegFfdgWbPz5cLmRSNXJ
	nCYg==
X-Gm-Message-State: AMCzsaWIMb5STUnnpDEuB1QEFMFxyDqiRLf2/s+L+bhUy6BhiKoaGno+
	Wy92U1UiMyxCUypbzuxgX3KVIw==
X-Google-Smtp-Source: AOwi7QBLjPDMmNYx7ddPE9FEgva//srK66Hl21XXpmX04IsdewxxRux7GrgO++ImGVJ1Six9pBTDow==
X-Received: by 10.200.3.14 with SMTP id q14mr35970329qtg.336.1507226416055;
	Thu, 05 Oct 2017 11:00:16 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	k24sm11965766qtk.89.2017.10.05.11.00.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Oct 2017 11:00:15 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 05 Oct 2017 15:00:07 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  5 Oct 2017 15:00:06 -0300
Message-Id: <20171005180006.2956-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-firmware: Split i.MX SDMA firmwares
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
X-List-Received-Date: Thu, 05 Oct 2017 18:00:15 -0000

This splits out the i.MX SDMA firmwares for i.MX6 and i.MX7 SoCs. This
also includes the required runtime provides, conflicts and replaces
for the old firmware-imx which was provided by NXP BSP layer.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../recipes-kernel/linux-firmware/linux-firmware_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 6798ace639..cb923e8a7b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -46,6 +46,7 @@ LICENSE = "\
     & Firmware-ralink_a_mediatek_company_firmware \
     & Firmware-ralink-firmware \
     & Firmware-rtlwifi_firmware \
+    & Firmware-imx-sdma_firmware \
     & Firmware-siano \
     & Firmware-tda7706-firmware \
     & Firmware-ti-connectivity \
@@ -104,6 +105,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
+    file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
     file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e \
     file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
@@ -164,6 +166,7 @@ NO_GENERIC_LICENSE[Firmware-ralink_a_mediatek_company_firmware] = "LICENCE.ralin
 NO_GENERIC_LICENSE[Firmware-ralink-firmware] = "LICENCE.ralink-firmware.txt"
 NO_GENERIC_LICENSE[Firmware-rtlwifi_firmware] = "LICENCE.rtlwifi_firmware.txt"
 NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
+NO_GENERIC_LICENSE[Firmware-imx-sdma_firmware] = "LICENSE.sdma_firmware"
 NO_GENERIC_LICENSE[Firmware-tda7706-firmware] = "LICENCE.tda7706-firmware.txt"
 NO_GENERIC_LICENSE[Firmware-ti-connectivity] = "LICENCE.ti-connectivity"
 NO_GENERIC_LICENSE[Firmware-ti-keystone] = "LICENCE.ti-keystone"
@@ -239,6 +242,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-gplv2-license ${PN}-carl9170 \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-qca \
              \
+             ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
+             \
              ${PN}-iwlwifi-license ${PN}-iwlwifi \
              ${PN}-iwlwifi-135-6 \
              ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-iwlwifi-3160-9 \
@@ -550,6 +555,17 @@ FILES_${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
 
 RDEPENDS_${PN}-bnx2-mips += "${PN}-whence-license"
 
+# For imx-sdma
+LICENSE_${PN}-imx-sdma          = "Firmware-imx-sdma_firmware"
+
+FILES_${PN}-imx-sdma-imx6q = "${nonarch_base_libdir}/firmware/imx/sdma/sdma-imx6q.bin"
+
+RPROVIDES_${PN}-imx-sdma-imx6q = "firmware-imx-sdma-imx6q"
+RREPLACES_${PN}-imx-sdma-imx6q = "firmware-imx-sdma-imx6q"
+RCONFLICTS_${PN}-imx-sdma-imx6q = "firmware-imx-sdma-imx6q"
+
+FILES_${PN}-imx-sdma-imx7d = "${nonarch_base_libdir}/firmware/imx/sdma/sdma-imx7d.bin"
+
 # For iwlwifi
 LICENSE_${PN}-iwlwifi           = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-135-6     = "Firmware-iwlwifi_firmware"
@@ -713,6 +729,7 @@ LICENSE_${PN} = "\
     & Firmware-radeon \
     & Firmware-ralink_a_mediatek_company_firmware \
     & Firmware-ralink-firmware \
+    & Firmware-imx-sdma_firmware \
     & Firmware-siano \
     & Firmware-tda7706-firmware \
     & Firmware-ti-connectivity \
-- 
2.14.2


