Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC38C98314
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 06:22:10 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1762.1790230725604237980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 23:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pengutronix.de header.s=20260414 header.b=N7JzpMd2;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: f.pfitzner@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 92AD0200291;
	Thu, 24 Sep 2026 08:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790230191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jC/24qq9GsGGtq++mlx7Af5OY4xFZZ6jMfOoOyMpnTc=;
	b=N7JzpMd29h6ecT6cBeUM0DjJnoSG4sPZ99Pbq2ifZpi841bJyoyuKlr4R0Fv/HwM2t1SLi
	s3Ert0zEisKkNS9AEn/N3j7JV88l/ktwfL1XGdFLLwJl74R6V0fgbWrA6MLwABNAQ0og8v
	XPBd5E3xRzHnOoLcanssp801iiatxeSUhv73LjoR0pYeaHttHaeLxuCoW5s5ikohwUyc0y
	lqjLfTIKr2C961Yd38J3oG5EAVv+0d2lQf91vDcTwBw/F5rF7acyq9G1Qxc+1zKwxhnsxv
	p/zgohceoXCQ7ZSlaImeoe9nCqODP++w2xfgkZtk4uvrTlTHq1JGG8lVsnltsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790230191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jC/24qq9GsGGtq++mlx7Af5OY4xFZZ6jMfOoOyMpnTc=;
	b=VXQfcbswBh1juAte+ZpEM9tURtsgPZlgsWhd6uihsxf1TYxcn4aXV4QLq7LLoGx1j3akHG
	aZu858hMB/uky5m+miIchHZ4h0M59kZfGeqNGuXIOrrJswJYhr/HYBhjrGcRa/JP0qKaUt
	1uKwJBxWZN9MUQCMuZlHqJyjm3hj7g6ZSKG/tNxizVezqmaIYYJb1QTzPpXw8FsavMjKtD
	W3p7xA/5+4EzeE8s2fTadNTDxlOhuM9bhWJiC3v8fF4OVqRXtM+Rq6Gm4d9xJuCE93OuqW
	2yPP/p2A4oucMftT0tHGLPtizsToCPHkCCHsG1E6BhFspBbZKOnVU8oX3wOOOQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790230191; a=rsa-sha256;
	cv=none;
	b=Kdu1Kf+EovpZY2Jat83g+dZQoqlcllkiVaLu4QYNMvLeD1gu/1dOuO8drTvnLfyC35TNTG
	lvBaOgHLwxjkzvW0d1Kvs5iyN4Jyai0I0WsHe7t9mfcwtuhpm5Wt2t8mJ5+oQNkaduS2DZ
	t1Os4cQzVSG1WlIBL3Lq9mzFwykgOaSCO4keVL9wjHlXb8U2mcvboj0HgYQqjP8lowH2nb
	EXcdekFZJLZp8KaK9sLMyIY+DPp5IghROdilXJ20lUooCdD7pEzeGTLWDdR6Gt4XrvKRB1
	oYQkOeLIO74sdUQ0RDi0IDmCPZH+RPlYdgei7lJBsp75XtVSu++XlGSdHHhFUA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.pfitzner@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.pfitzner@pengutronix.de>)
	id 1x9ceV-002WJP-1f;
	Thu, 24 Sep 2026 08:09:51 +0200
From: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Date: Thu, 24 Sep 2026 08:09:50 +0200
Subject: [PATCH] barebox: install generated dtbs
MIME-Version: 1.0
Message-Id: <20260924-barebox-dts-v1-1-9a07c07458e0@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAK6+tGoC/5XOsQ7CIBDG8VcxzGIOKK118j1MB+CuygIGalNj+
 u5iR7VDx++S3z/3YpmSp8xOuxdLNPrsYyhD7HfM3Uy4EvdYNpMga2ih5dYksnHiOGTujghglbb
 QO1bEPVHvp6V26cq++TzE9Fzio/hc/3dGwQU3BoxDBUIqeb5TuD6GFIOfDkif9joE1DVWmsA27
 SYoqt41WqtKS7EJElQWG9mWj/tVKOAXuiMoNIDl1eYbdvM8vwE4O491jwEAAA==
X-Change-ID: 20260909-barebox-dts-c8d00b35b0fc
To: openembedded-core@lists.openembedded.org
Cc: Fabian Pfitzner <f.pfitzner@pengutronix.de>
X-Mailer: b4 0.14.2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 06:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246570

Sometimes it's useful to be able to include the barebox-
generated dtb. An example would be generating a FIP image
for use by TF-A on the stm32mp1:

There, the barebox binary and its device tree need to be provided
separately to the fiptool command.

Add a variable called `BAREBOX_INSTALL_DTB` to control,
whether the dtb files should be installed into the sysroot.

Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
---
 meta/classes-recipe/barebox.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index d8f568594849aa0d17d792a73fabda249617e287..3980849b531028c944fdaec76e6656a38210ec7c 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -48,6 +48,9 @@ BAREBOX_BUILDSYSTEM_VERSION ??= "${@get_layer_rev(os.path.dirname(d.getVar('FILE
 BAREBOX_FIRMWARE_DIR[doc] = "Overwrite barebox' firmware blobs search directory (CONFIG_EXTRA_FIRMWARE_DIR) with this path, default ${B}/firmware"
 BAREBOX_FIRMWARE_DIR ??= "${B}/firmware"
 
+BAREBOX_INSTALL_DTB[doc] = "Install dtb files from barebox into sysroot. By default, this variable is set to '0'."
+BAREBOX_INSTALL_DTB ??= "0"
+
 EXTRA_OEMAKE = " \
     ARCH=${@oe.kernel.map_kernel_arch(d)} CROSS_COMPILE=${TARGET_PREFIX} -C ${S} O=${B} \
     BUILDSYSTEM_VERSION=${BAREBOX_BUILDSYSTEM_VERSION} \
@@ -138,6 +141,10 @@ barebox_do_install () {
                         install -m 644 ${B}/${image} ${D}${BAREBOX_INSTALL_PATH}/
                 done
         fi
+
+        if [ "${BAREBOX_INSTALL_DTB}" = "1" ]; then
+                make dtbs_install INSTALL_DTBS_PATH=${D}/sysroot-only/
+        fi
 }
 FILES:${PN} = "${BAREBOX_INSTALL_PATH}"
 

---
base-commit: c264544ea440477db8ab84ca26fd9a7ab2c7da90
change-id: 20260909-barebox-dts-c8d00b35b0fc

Best regards,
-- 
Fabian Pfitzner <f.pfitzner@pengutronix.de>


