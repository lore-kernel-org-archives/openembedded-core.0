Return-Path: <pabigot@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id ECF9B6BA53
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:49:34 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id e14so6052471iej.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RyvGjTys7jRBiHL5hsi8Kj1X5P3kvL+mu7Xt8sWCKD8=;
	b=z+x7ZrrIns+3vZpH2oQxrPT4pnVtY2kXCLlVXae35Hz1XnalcgI8NuMpMhaloBVFa7
	gNGsy8xa/nRiC7hgs5Xy77C+RadxyXhlMlTHkXm77CboKwokCfHOEZYIaFTmBGsPMEnS
	Cd40t0nInM1QY3iN7PNqcKEge0GRaT38+ItV3U+qvDPnwHfhGQyjvYYTQvgah5fTrL6h
	lkcQzRxmapKHOovu4cd/e8NmPHvpZHBjr2RyQX3wOBx1mVphmx8lWCfSCdWx3Rq3t5Jq
	ycZqMf9bnJTsU4EFpprBaJ8wZryz3G5Q66MR5FehVascoDj2H6S4Z0UEzNLn9Gb4ihIm
	86qA==
X-Received: by 10.50.73.41 with SMTP id i9mr8007350igv.30.1377553775727;
	Mon, 26 Aug 2013 14:49:35 -0700 (PDT)
Received: from llc.pab (c-66-41-60-82.hsd1.mn.comcast.net. [66.41.60.82])
	by mx.google.com with ESMTPSA id p5sm20263354igj.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 14:49:35 -0700 (PDT)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2013 16:49:29 -0500
Message-Id: <1377553769-21608-2-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1377553769-21608-1-git-send-email-pab@pabigot.com>
References: <1377553769-21608-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 2/2] linux-firmware: package Marvell SD8787 firmware
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
X-List-Received-Date: Mon, 26 Aug 2013 21:49:35 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

Also split out Marvell license as separate package.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 .../linux-firmware/linux-firmware_git.bb           |   14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 42f6ce0..0c69ee4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -55,7 +55,9 @@ do_install() {
 }
 
 
-PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx ${PN}-vt6656 \
+PACKAGES =+ "${PN}-ralink \
+             ${PN}-Marvell-license ${PN}-sd8686 ${PN}-sd8787 \
+             ${PN}-wl12xx ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k \
@@ -96,12 +98,20 @@ FILES_${PN}-ralink = " \
   /lib/firmware/LICENCE.ralink-firmware.txt \
 "
 
+FILES_${PN}-Marvell-license = "/lib/firmware/LICENCE.Marvell"
+
 LICENSE_${PN}-sd8686 = "Firmware-Marvell"
 FILES_${PN}-sd8686 = " \
   /lib/firmware/libertas/sd8686_v9* \
   /lib/firmware/sd8686* \
-  /lib/firmware/LICENCE.Marvell \
 "
+RDEPENDS_${PN}-sd8686 += "${PN}-Marvell-license"
+
+LICENSE_${PN}-sd8787 = "Firmware-Marvell"
+FILES_${PN}-sd8787 = " \
+  /lib/firmware/mrvl/sd8787_uapsta.bin \
+"
+RDEPENDS_${PN}-sd8787 += "${PN}-Marvell-license"
 
 FILES_${PN}-rtl-license = " \
   /lib/firmware/LICENCE.rtlwifi_firmware.txt \
-- 
1.7.9.5


