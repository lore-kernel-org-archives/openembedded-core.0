Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFD9C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 17:24:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.13846.1647365045230470613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: afa@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <afa@pengutronix.de>)
	id 1nUAtu-0007mM-Ev; Tue, 15 Mar 2022 18:24:02 +0100
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1nUAtt-000umw-Bo; Tue, 15 Mar 2022 18:24:01 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [OE-core][PATCH] kernel-fitimage: allow overriding FIT configuration
 prefix
Date: Tue, 15 Mar 2022 18:23:53 +0100
Message-Id: <20220315172352.217149-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 17:24:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163308

The prefix was recently changed to play ball with the CVE-2021-27138
workaround in U-Boot. Already deployed bootloaders though may still
expect a configuration name containing @ or they may not be affected
by this issue.

Also, uses may want to customize it beyond the [@-] issue: When
device trees are built from a recipe using kernel-devicetree.bbclass
the configuration nodes will contain the parent directories, e.g.

KERNEL_DEVICETREE = "freescale/imx8mm-myboard.dtb"

will become "conf-freescale_imx8mm-myboard.dtb". When moving to
devicetree.bbclass, this prefix go away. With this change here,
users can restore it easily by setting FIT_CONF_PREFIX =
"conf-freescale_", ensuring backwards compatibility.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 meta/classes/kernel-fitimage.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index c16977c477eb..8a9b195d6ee2 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -64,6 +64,9 @@ FIT_DESC ?= "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 # Sign individual images as well
 FIT_SIGN_INDIVIDUAL ?= "0"
 
+FIT_CONF_PREFIX ?= "conf-"
+FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
+
 # Keys used to sign individually image nodes.
 # The keys to sign image nodes must be different from those used to sign
 # configuration nodes, otherwise the "required" property, from
@@ -358,7 +361,7 @@ fitimage_emit_section_config() {
 	# Test if we have any DTBs at all
 	sep=""
 	conf_desc=""
-	conf_node="conf-"
+	conf_node="${FIT_CONF_PREFIX}"
 	kernel_line=""
 	fdt_line=""
 	ramdisk_line=""
@@ -407,9 +410,9 @@ fitimage_emit_section_config() {
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
 		if [ -n "$dtb_image" ]; then
-			default_line="default = \"conf-$dtb_image\";"
+			default_line="default = \"${FIT_CONF_PREFIX}$dtb_image\";"
 		else
-			default_line="default = \"conf-$kernel_id\";"
+			default_line="default = \"${FIT_CONF_PREFIX}$kernel_id\";"
 		fi
 	fi
 
-- 
2.30.2


