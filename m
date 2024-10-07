Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4DECFB447
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 12:10:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.51405.1728303002080260627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 05:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYq-0004Yu-4i; Mon, 07 Oct 2024 14:10:00 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYp-0007Y4-Au; Mon, 07 Oct 2024 14:09:59 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYp-0047OF-0w;
	Mon, 07 Oct 2024 14:09:59 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 1/9] busybox: sync config for busybox 1.36.1
Date: Mon,  7 Oct 2024 14:09:42 +0200
Message-Id: <20241007120950.975803-2-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241007120950.975803-1-ejo@pengutronix.de>
References: <20241007120950.975803-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 12:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205265

Done by disabling all current cfg fragments in SRC_URI, running

  bitbake -c menuconfig busybox

and copying the generated .config back to the defoncfig file.
Changes to CONFIG_EXTRA_CFLAGS were omitted.

For CONFIG_SHA1_HWACCEL and CONFIG_SHA256_HWACCEL there was also an
explicit fragment 'sha_accel.cfg' introduced for disabling these, thus
it makes sense they've been enabled by default.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 8e3b6e480c..3353aac97a 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.36.0
-# Tue Jan  3 14:17:01 2023
+# Busybox version: 1.36.1
+# Thu May 18 22:31:00 2023
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
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
@@ -882,6 +885,7 @@ CONFIG_FEATURE_HWIB=y
 CONFIG_HOSTNAME=y
 CONFIG_DNSDOMAINNAME=y
 # CONFIG_HTTPD is not set
+CONFIG_FEATURE_HTTPD_PORT_DEFAULT=0
 # CONFIG_FEATURE_HTTPD_RANGES is not set
 # CONFIG_FEATURE_HTTPD_SETUID is not set
 # CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
@@ -974,6 +978,7 @@ CONFIG_FEATURE_TELNET_AUTOLOGIN=y
 CONFIG_FEATURE_TELNET_WIDTH=y
 # CONFIG_TELNETD is not set
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
+CONFIG_FEATURE_TELNETD_PORT_DEFAULT=0
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 CONFIG_TFTP=y
 # CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
@@ -1011,6 +1016,7 @@ CONFIG_UDHCPC=y
 CONFIG_FEATURE_UDHCPC_ARPING=y
 CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+CONFIG_UDHCPC6_DEFAULT_SCRIPT=""
 # CONFIG_UDHCPC6 is not set
 # CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
 # CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
@@ -1020,6 +1026,7 @@ CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 #
 # Common options for DHCP applets
 #
+CONFIG_UDHCPC_DEFAULT_INTERFACE="eth0"
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
@@ -1144,6 +1151,7 @@ CONFIG_ASH_EXPAND_PRMT=y
 CONFIG_ASH_ECHO=y
 CONFIG_ASH_PRINTF=y
 CONFIG_ASH_TEST=y
+CONFIG_ASH_SLEEP=y
 CONFIG_ASH_HELP=y
 CONFIG_ASH_GETOPTS=y
 CONFIG_ASH_CMDCMD=y
-- 
2.39.5


