Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423DCC021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 09:28:58 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.7144.1740648533608616680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 01:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tnaCK-0005Kc-45; Thu, 27 Feb 2025 10:28:52 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tnaCJ-0036H0-1K;
	Thu, 27 Feb 2025 10:28:51 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tnaCJ-00BbgM-19;
	Thu, 27 Feb 2025 10:28:51 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] barebox.bbclass: use consistent make flags for menuconfig
Date: Thu, 27 Feb 2025 10:28:21 +0100
Message-Id: <20250227092821.2766396-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211985

This change is done similar to the change in the kernel.bbclass of
commit 8c616bc0 ("kernel: Use consistent make flags for menuconfig").

This was discovered since the new CONFIG_GCC_VERSION kconfig symbol
reflected the host GCC version instead of the target ones after running
do_menuconfig.

Reported-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/classes-recipe/barebox.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index 200ba08326..baba0a2965 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -53,6 +53,7 @@ EXTRA_OEMAKE = " \
     PKG_CONFIG=pkg-config-native \
     CROSS_PKG_CONFIG=pkg-config \
 "
+KCONFIG_CONFIG_COMMAND:append = " ${EXTRA_OEMAKE}"
 
 BAREBOX_CONFIG[doc] = "The barebox kconfig defconfig file. Not used if a file called defconfig is added to the SRC_URI."
 BAREBOX_CONFIG ?= ""
-- 
2.39.5


