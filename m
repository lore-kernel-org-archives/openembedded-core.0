Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883BFC25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:06:49 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.16115.1717488404011595200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1sEPBp-00004q-NQ; Tue, 04 Jun 2024 10:06:41 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1sEPBp-000BLD-Aa; Tue, 04 Jun 2024 10:06:41 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1sEPBp-007uUr-0t;
	Tue, 04 Jun 2024 10:06:41 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 1/2] wic: engine.py: use raw string for escape sequence
Date: Tue,  4 Jun 2024 10:06:20 +0200
Message-Id: <20240604080621.1885249-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
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
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200302

Fixes:

| poky/scripts/lib/wic/engine.py:362: SyntaxWarning: invalid escape sequence '\/'

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 674ccfc244..ce7e6c5d75 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -359,7 +359,7 @@ class Disk:
         Remove files/dirs and their contents from the partition.
         This only applies to ext* partition.
         """
-        abs_path = re.sub('\/\/+', '/', path)
+        abs_path = re.sub(r'\/\/+', '/', path)
         cmd = "{} {} -wR 'rm \"{}\"'".format(self.debugfs,
                                             self._get_part_image(pnum),
                                             abs_path)
-- 
2.39.2


