Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37AFE668A3
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 10:51:52 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.16275.1732531908088416323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 02:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tFWh0-0004O3-Kf; Mon, 25 Nov 2024 11:51:46 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tFWgz-00046x-2A;
	Mon, 25 Nov 2024 11:51:46 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tFWh0-005deD-1F;
	Mon, 25 Nov 2024 11:51:46 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2 3/3] barebox: move version checksum to common .inc
Date: Mon, 25 Nov 2024 11:51:32 +0100
Message-Id: <20241125105132.1338770-3-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125105132.1338770-1-ejo@pengutronix.de>
References: <20241125105132.1338770-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 10:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207736

This makes it more obvious to update barebox and barebox-tools together
and should help the AUH to update both.

Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb | 3 ++-
 meta/recipes-bsp/barebox/barebox-version.inc        | 1 +
 meta/recipes-bsp/barebox/barebox_2024.10.0.bb       | 3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/barebox/barebox-version.inc

diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
index 386656f7ad..25d6a5c062 100644
--- a/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 DEPENDS = "bison-native flex-native libusb1"
 
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"
+
+require barebox-version.inc
 
 S = "${WORKDIR}/barebox-${PV}"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/barebox/barebox-version.inc b/meta/recipes-bsp/barebox/barebox-version.inc
new file mode 100644
index 0000000000..d008c49f28
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox-version.inc
@@ -0,0 +1 @@
+SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"
diff --git a/meta/recipes-bsp/barebox/barebox_2024.10.0.bb b/meta/recipes-bsp/barebox/barebox_2024.10.0.bb
index c886fcfba3..aa63be4080 100644
--- a/meta/recipes-bsp/barebox/barebox_2024.10.0.bb
+++ b/meta/recipes-bsp/barebox/barebox_2024.10.0.bb
@@ -14,4 +14,5 @@ inherit barebox
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2 \
            file://0001-lib-lz4-use-lz4-instead-of-lz4c.patch \
            "
-SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"
+
+require barebox-version.inc
-- 
2.39.5


