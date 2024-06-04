Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCE7C25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:06:59 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.16376.1717488404054575992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1sEPBp-00004r-NY; Tue, 04 Jun 2024 10:06:41 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1sEPBp-000BLE-At; Tue, 04 Jun 2024 10:06:41 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1sEPBp-007uUu-0w;
	Tue, 04 Jun 2024 10:06:41 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 2/2] wic: bootimg-efi: fix error handling
Date: Tue,  4 Jun 2024 10:06:21 +0200
Message-Id: <20240604080621.1885249-2-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240604080621.1885249-1-ejo@pengutronix.de>
References: <20240604080621.1885249-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200303

If we check for empty variables, it does not make sense to print their
content in case they are empty.

Additionally, the error message in the 'kernel' check attempted to print
the wrong variable ('target') which was not even defined, yet.

Also, raising WicError doesn't require an extra newline.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 13a9cddf4e..7cc5131541 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -428,10 +428,10 @@ class BootimgEFIPlugin(SourcePlugin):
             elif source_params['loader'] == 'uefi-kernel':
                 kernel = get_bitbake_var("KERNEL_IMAGETYPE")
                 if not kernel:
-                    raise WicError("Empty KERNEL_IMAGETYPE %s\n" % target)
+                    raise WicError("Empty KERNEL_IMAGETYPE")
                 target = get_bitbake_var("TARGET_SYS")
                 if not target:
-                    raise WicError("Unknown arch (TARGET_SYS) %s\n" % target)
+                    raise WicError("Empty TARGET_SYS")
 
                 if re.match("x86_64", target):
                     kernel_efi_image = "bootx64.efi"
-- 
2.39.2


