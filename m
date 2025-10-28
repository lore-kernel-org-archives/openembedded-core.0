Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AAECCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 07:36:26 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.3160.1761636981085272577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 00:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1vDeFf-00055M-K4; Tue, 28 Oct 2025 08:36:19 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1vDeFf-005q2p-1Q;
	Tue, 28 Oct 2025 08:36:19 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1vDeFf-0000000Ctmy-1cYK;
	Tue, 28 Oct 2025 08:36:19 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH] barebox.bbclass: set KBUILD_OUTPUT
Date: Tue, 28 Oct 2025 08:36:01 +0100
Message-ID: <20251028073608.3074369-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.47.3
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
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 07:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225381

Sets KBUILD_OUTPUT to the build directory to ensure using the valid
path in e.g. menuconfig or devshell.

An externally set KBUILD_OUTPUT could otherwise confuse the build
process and create the .config from an invalid folder.

This is what the kernel recipes also do.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/classes-recipe/barebox.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index ece8fb6485..73615999aa 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -16,6 +16,8 @@ DEPENDS += "bison-native flex-native lz4-native"
 
 S = "${UNPACKDIR}/barebox-${PV}"
 B = "${WORKDIR}/build"
+KBUILD_OUTPUT = "${B}"
+OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
 
 require conf/image-uefi.conf
 
-- 
2.47.3


