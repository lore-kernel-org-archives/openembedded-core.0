Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PzUMP-0006eE-IJ
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 14:32:29 +0100
Received: by ywg8 with SMTP id 8so227300ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=XCKV9/ZvE9WT/Rr6moZAOuinIyGDYh7aH799ZOu/Fuc=;
	b=weZVeXTSKwP7YUdOmgwZn4mh1D8WLFl4jdLyyfOzZarCH/uRipvr2Fu9NQpfRxjEt3
	Vnv+TIDNRWgu9L96fJXt4/SRplJIO0v/bpAUpsMVNXS2TqmgTONwt62qYgaCPSd5Gsfg
	yWO2XZD5jGvytpHLPAHzymNuTr9jlE+usdK5U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=qOC40t6xV9YUcu5BjJgxEJjcD38lwKdjTHVTDW0T87Ux7e0w2PrryUyVJhK8JKQ4Vv
	ZONHT6TOI70gpZS3565ybcSbeUWS2prLfntatvvLI6qpaLFZDpfVHgs3zsbrTp3dSPlh
	iAKWNLBCnbnr05jQC6ET3cjfwb91p4dCwo8oU=
Received: by 10.236.125.138 with SMTP id z10mr8187880yhh.185.1300195846272;
	Tue, 15 Mar 2011 06:30:46 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id y21sm6131926yhc.18.2011.03.15.06.30.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 06:30:45 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2011 08:30:41 -0500
Message-Id: <1300195841-21137-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH][angstrom-layers] u-boot.inc: allow variable make targets
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
X-List-Received-Date: Tue, 15 Mar 2011 13:32:29 -0000

* Later versions of u-boot sometimes have top level make targets
  such as u-boot.imx, u-boot.kwb, and for upcoming TI devices
  u-boot.ti.
* These targets define different calls to the mkimage tool to
  change the images created, such as changing the load address.
* This change allows recipes to change the default make target
  of "all" to something like u-boot.ti or u-boot.imx by setting
  the UBOOT_MAKE_TARGET variable.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 BSP/TI/recipes-bsp/u-boot/u-boot.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/BSP/TI/recipes-bsp/u-boot/u-boot.inc b/BSP/TI/recipes-bsp/u-boot/u-boot.inc
index 3859a4c..3a9a72f 100644
--- a/BSP/TI/recipes-bsp/u-boot/u-boot.inc
+++ b/BSP/TI/recipes-bsp/u-boot/u-boot.inc
@@ -18,6 +18,7 @@ UBOOT_MACHINE ?= "${MACHINE}_config"
 UBOOT_BINARY ?= "u-boot.bin"
 UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
 UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
+UBOOT_MAKE_TARGET ?= "all"
 
 do_configure () {
 	oe_runmake ${UBOOT_MACHINE}
@@ -27,7 +28,7 @@ do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
 	unset CPPFLAGS
-	oe_runmake all
+	oe_runmake ${UBOOT_MAKE_TARGET}
 	oe_runmake tools env
 }
 
-- 
1.7.0.4



