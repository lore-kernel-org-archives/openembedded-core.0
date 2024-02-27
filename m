Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99E2C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 17:09:42 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.17481.1709053776056469430
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 09:09:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1rf0xS-0008EV-0t; Tue, 27 Feb 2024 18:09:34 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1rf0xR-003F7z-8C; Tue, 27 Feb 2024 18:09:33 +0100
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1rf0xR-00FdPL-0f;
	Tue, 27 Feb 2024 18:09:33 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 2/3] kernel-yocto.bblass: run kernel_version_sanity_check after do_patch
Date: Tue, 27 Feb 2024 18:09:01 +0100
Message-Id: <20240227170902.3718203-2-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227170902.3718203-1-ejo@pengutronix.de>
References: <20240227170902.3718203-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 17:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196280

The kernel patches may modify the kernel version, thus wait for do_patch
before running the version check.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/classes-recipe/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 108b7e6752..854e4681d5 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -729,6 +729,6 @@ python () {
 }
 
 # extra tasks
-addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
+addtask kernel_version_sanity_check after do_patch before do_compile
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
-- 
2.39.2


