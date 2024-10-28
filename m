Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72025D1359A
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:30:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.46762.1730104216193255484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8g-0000iU-4z; Mon, 28 Oct 2024 09:30:14 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-000omF-2c;
	Mon, 28 Oct 2024 09:30:13 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-001oDB-2M;
	Mon, 28 Oct 2024 09:30:13 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [PATCH v2 7/9] busybox: disable defconfig options from getopts.cfg and move long opts
Date: Mon, 28 Oct 2024 09:29:11 +0100
Message-Id: <20241028082913.418505-8-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028082913.418505-1-ejo@pengutronix.de>
References: <20241028082913.418505-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206430

This disables getopts.cfg fragment options in the defconfig which were
accidentally enabled in 4335cd24 ("busybox: refresh the defconfig from
1.33.0").

Since there is longopts.cfg for long options, move
CONFIG_FEATURE_GETOPT_LONG there. It was probably not placed there
originally since it does not match the naming scheme of the other long
options.

Note that CONFIG_LONG_OPTS will just be dropped since it is enabled in
defconfig anyway.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig    | 4 ++--
 meta/recipes-core/busybox/busybox/getopts.cfg  | 2 --
 meta/recipes-core/busybox/busybox/longopts.cfg | 1 +
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index a65ae674d8..7481ea2d6b 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -636,8 +636,8 @@ CONFIG_FLOCK=y
 # CONFIG_FSCK_MINIX is not set
 # CONFIG_FSFREEZE is not set
 CONFIG_FSTRIM=y
-CONFIG_GETOPT=y
-CONFIG_FEATURE_GETOPT_LONG=y
+# CONFIG_GETOPT is not set
+# CONFIG_FEATURE_GETOPT_LONG is not set
 CONFIG_HEXDUMP=y
 # CONFIG_HD is not set
 # CONFIG_XXD is not set
diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg b/meta/recipes-core/busybox/busybox/getopts.cfg
index 8db0a4a8f2..26a2e7add9 100644
--- a/meta/recipes-core/busybox/busybox/getopts.cfg
+++ b/meta/recipes-core/busybox/busybox/getopts.cfg
@@ -1,3 +1 @@
 CONFIG_GETOPT=y
-CONFIG_LONG_OPTS=y
-CONFIG_FEATURE_GETOPT_LONG=y
diff --git a/meta/recipes-core/busybox/busybox/longopts.cfg b/meta/recipes-core/busybox/busybox/longopts.cfg
index dcfab99919..3255608f64 100644
--- a/meta/recipes-core/busybox/busybox/longopts.cfg
+++ b/meta/recipes-core/busybox/busybox/longopts.cfg
@@ -13,3 +13,4 @@ CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS=y
 CONFIG_FEATURE_IPCALC_LONG_OPTIONS=y
 CONFIG_FEATURE_NSLOOKUP_LONG_OPTIONS=y
 CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+CONFIG_FEATURE_GETOPT_LONG=y
-- 
2.39.5


