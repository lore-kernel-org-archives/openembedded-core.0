Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F60D13597
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:30:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.46763.1730104216312747653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8g-0000iO-0q; Mon, 28 Oct 2024 09:30:14 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-000om4-2F;
	Mon, 28 Oct 2024 09:30:13 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-001oCh-23;
	Mon, 28 Oct 2024 09:30:13 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [PATCH v2 1/9] busybox: sync config for busybox 1.37
Date: Mon, 28 Oct 2024 09:29:05 +0100
Message-Id: <20241028082913.418505-2-ejo@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206434

Done by disabling all current cfg fragments in SRC_URI, running

  bitbake -c configure busybox

and copying the generated .config back to the defconfig file.
Changes to CONFIG_EXTRA_CFLAGS were omitted.

CONFIG_SHA1_HWACCEL and CONFIG_SHA256_HWACCEL are disabled explicitly in
the respective fragments (sha1sum.cfg, sha256sum.cfg), thus it makes
sense they've been enabled by default.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index d172ec46e9..6c5a8764ce 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -93,6 +93,9 @@ CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
 # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
 CONFIG_PASSWORD_MINLEN=6
 CONFIG_MD5_SMALL=1
+CONFIG_SHA1_SMALL=3
+CONFIG_SHA1_HWACCEL=y
+CONFIG_SHA256_HWACCEL=y
 CONFIG_SHA3_SMALL=1
 CONFIG_FEATURE_NON_POSIX_CP=y
 # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
@@ -884,6 +887,7 @@ CONFIG_FEATURE_HWIB=y
 CONFIG_HOSTNAME=y
 CONFIG_DNSDOMAINNAME=y
 # CONFIG_HTTPD is not set
+CONFIG_FEATURE_HTTPD_PORT_DEFAULT=0
 # CONFIG_FEATURE_HTTPD_RANGES is not set
 # CONFIG_FEATURE_HTTPD_SETUID is not set
 # CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
@@ -977,6 +981,7 @@ CONFIG_FEATURE_TELNET_AUTOLOGIN=y
 CONFIG_FEATURE_TELNET_WIDTH=y
 # CONFIG_TELNETD is not set
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
+CONFIG_FEATURE_TELNETD_PORT_DEFAULT=0
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 CONFIG_TFTP=y
 # CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
@@ -1015,6 +1020,7 @@ CONFIG_UDHCPC=y
 CONFIG_FEATURE_UDHCPC_ARPING=y
 CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+CONFIG_UDHCPC6_DEFAULT_SCRIPT=""
 # CONFIG_UDHCPC6 is not set
 # CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
 # CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
@@ -1024,6 +1030,7 @@ CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 #
 # Common options for DHCP applets
 #
+CONFIG_UDHCPC_DEFAULT_INTERFACE="eth0"
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-- 
2.39.5


