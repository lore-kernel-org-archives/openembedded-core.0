Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DC5C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 21:58:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.1388.1709675921824466594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 13:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1rhco3-000728-Ua; Tue, 05 Mar 2024 22:58:39 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1rhco2-004cr9-VJ; Tue, 05 Mar 2024 22:58:38 +0100
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1rhco2-000s7U-2y;
	Tue, 05 Mar 2024 22:58:38 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 2/2] cml1: prompt location of updated .config after do_menuconfig()
Date: Tue,  5 Mar 2024 22:57:28 +0100
Message-Id: <20240305215728.207879-2-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305215728.207879-1-ejo@pengutronix.de>
References: <20240305215728.207879-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 21:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196652

When modifying the kernel config by invoking '-c menuconfig' manually, a
sensible next step is to persist this changed configuration somewhere.

A way to do this is to copy the generated .config back to the original
config location.

For this purpose, emit a copy+pasteable printout of the saved .config
path similar to what we have for the fragment location in the
'diffconfig' task already.

Example output:

| Changed configuration saved at:
|  /path/to/bsp/build/tmp/work/my-machine-oe-linux/linux-custom/6.6.4/build/.config
| Recompile will be forced

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/classes-recipe/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 2da19cb4cf..03e5fe6f47 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -67,7 +67,7 @@ python do_menuconfig() {
         newmtime = 0
 
     if newmtime > mtime:
-        bb.note("Configuration changed, recompile will be forced")
+        bb.plain("Changed configuration saved at:\n %s\nRecompile will be forced" % config)
         bb.build.write_taint('do_compile', d)
 }
 do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
-- 
2.39.2


