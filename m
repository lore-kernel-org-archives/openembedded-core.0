Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6991DD13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:30:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.46764.1730104216349560720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8g-0000iP-0q; Mon, 28 Oct 2024 09:30:14 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-000om6-2K;
	Mon, 28 Oct 2024 09:30:13 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-001oCq-27;
	Mon, 28 Oct 2024 09:30:13 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [PATCH v2 2/9] busybox: disable defconfig options from simpler fragments
Date: Mon, 28 Oct 2024 09:29:06 +0100
Message-Id: <20241028082913.418505-3-ejo@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206431

This disables options from the defconfig file that are enabled by
explicit config fragments.

Having them enabled in the defconfig renders the fragments useless and
takes away the ability to disable options with

  SRC_URI:remove = "<fragment>.cfg".

The respective options were all deactivated once but got accidentally
enabled in 4335cd24 ("busybox: refresh the defconfig from 1.33.0").

This commit disables the features for:

- sha1sum.cfg
- sha256sum.cfg
- resize.cfg
- pgrep.cfg
- rev.cfg

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 6c5a8764ce..0ec65c65af 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -281,8 +281,8 @@ CONFIG_FEATURE_LS_USERNAME=y
 CONFIG_FEATURE_LS_COLOR=y
 # CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
 CONFIG_MD5SUM=y
-CONFIG_SHA1SUM=y
-CONFIG_SHA256SUM=y
+# CONFIG_SHA1SUM is not set
+# CONFIG_SHA256SUM is not set
 # CONFIG_SHA512SUM is not set
 # CONFIG_SHA3SUM is not set
 
@@ -386,8 +386,8 @@ CONFIG_DEFAULT_SETFONT_DIR=""
 CONFIG_LOADKMAP=y
 CONFIG_OPENVT=y
 CONFIG_RESET=y
-CONFIG_RESIZE=y
-CONFIG_FEATURE_RESIZE_PRINT=y
+# CONFIG_RESIZE is not set
+# CONFIG_FEATURE_RESIZE_PRINT is not set
 CONFIG_SETCONSOLE=y
 # CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
 # CONFIG_SETKEYCODES is not set
@@ -689,7 +689,7 @@ CONFIG_RDATE=y
 # CONFIG_RDEV is not set
 # CONFIG_READPROFILE is not set
 CONFIG_RENICE=y
-CONFIG_REV=y
+# CONFIG_REV is not set
 # CONFIG_RTCWAKE is not set
 # CONFIG_SCRIPT is not set
 # CONFIG_SCRIPTREPLAY is not set
@@ -1070,7 +1070,7 @@ CONFIG_KILLALL=y
 # CONFIG_LSOF is not set
 # CONFIG_MPSTAT is not set
 # CONFIG_NMETER is not set
-CONFIG_PGREP=y
+# CONFIG_PGREP is not set
 # CONFIG_PKILL is not set
 CONFIG_PIDOF=y
 # CONFIG_FEATURE_PIDOF_SINGLE is not set
-- 
2.39.5


