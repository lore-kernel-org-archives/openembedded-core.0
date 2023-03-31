Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E479BC6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 10:40:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.51525.1680259240422936052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 03:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1piCBS-0002IM-EK; Fri, 31 Mar 2023 12:40:38 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piCBR-007yU7-8j; Fri, 31 Mar 2023 12:40:37 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piCBP-006DmN-8l; Fri, 31 Mar 2023 12:40:35 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	alexandre.belloni@bootlin.com
Subject: [PATCH v2 3/9] barebox: set default BAREBOX_CONFIG for qemu machines
Date: Fri, 31 Mar 2023 12:40:19 +0200
Message-Id: <20230331104025.1478393-4-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331104025.1478393-1-ejo@pengutronix.de>
References: <20230331104025.1478393-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 10:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179427

These are set in the barebox recipe rather in the corresponding machines
(where they would belong otherwise) to keep the impact of barebox to
oe-core minimal for now.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/recipes-bsp/barebox/barebox.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/barebox/barebox.inc
index a6c790b84b..4827f7b3a4 100644
--- a/meta/recipes-bsp/barebox/barebox.inc
+++ b/meta/recipes-bsp/barebox/barebox.inc
@@ -48,6 +48,11 @@ EXTRA_OEMAKE = " \
 BAREBOX_CONFIG[doc] = "The barebox kconfig defconfig file. Not used if a file called defconfig is added to the SRC_URI."
 BAREBOX_CONFIG ?= ""
 
+# set defaults for oe-core MACHINEs to allow building barebox
+BAREBOX_CONFIG:qemuarm = "vexpress_defconfig"
+BAREBOX_CONFIG:qemuarm64 = "qemu_virt64_defconfig"
+BAREBOX_CONFIG:qemux86-64 = "efi_defconfig"
+
 do_configure() {
         if [ -e ${WORKDIR}/defconfig ]; then
                 cp ${WORKDIR}/defconfig ${B}/.config
-- 
2.39.2


