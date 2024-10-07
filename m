Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34393CFB442
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 12:10:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.51434.1728303002548190470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 05:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYq-0004Z2-4h; Mon, 07 Oct 2024 14:10:00 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYp-0007YE-EE; Mon, 07 Oct 2024 14:09:59 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYp-0047Oi-1E;
	Mon, 07 Oct 2024 14:09:59 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 8/9] busybox: disable long options in defconfig and fix longopts.cfg
Date: Mon,  7 Oct 2024 14:09:49 +0200
Message-Id: <20241007120950.975803-9-ejo@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205270

LONG_OPTS was always enabled in defconfig, despite in
68dd1a54 ("busybox: Enable long options for enabled applets"),
an explicit fragment was introduced.

But the fragment did not set the global 'LONG_OPTS' but only activated
the individual options. However, these options are all 'default y' if
LONG_OPTS is enabled.

Re-generated longopts.cfg fragment buy disabling LONG_OPTS in defconfig
and running

  bitbake busybox -c menuconfig

Then re-enabled LONG_OTPS and ran

  bitbake busybox -c diffconfig

and copied back the generated fragment.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig    | 14 +++++++-------
 meta/recipes-core/busybox/busybox/longopts.cfg | 11 ++++++-----
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index defe60c2ab..25dfbe5c97 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -12,7 +12,7 @@ CONFIG_HAVE_DOT_CONFIG=y
 # CONFIG_EXTRA_COMPAT is not set
 # CONFIG_FEDORA_COMPAT is not set
 # CONFIG_INCLUDE_SUSv2 is not set
-CONFIG_LONG_OPTS=y
+# CONFIG_LONG_OPTS is not set
 CONFIG_SHOW_USAGE=y
 # CONFIG_FEATURE_VERBOSE_USAGE is not set
 CONFIG_FEATURE_COMPRESS_USAGE=y
@@ -148,7 +148,7 @@ CONFIG_FEATURE_SEAMLESS_Z=y
 # CONFIG_UNCOMPRESS is not set
 CONFIG_GUNZIP=y
 CONFIG_ZCAT=y
-CONFIG_FEATURE_GUNZIP_LONG_OPTIONS=y
+# CONFIG_FEATURE_GUNZIP_LONG_OPTIONS is not set
 CONFIG_BUNZIP2=y
 CONFIG_BZCAT=y
 # CONFIG_UNLZMA is not set
@@ -278,7 +278,7 @@ CONFIG_FEATURE_LS_WIDTH=y
 CONFIG_FEATURE_LS_SORTFILES=y
 CONFIG_FEATURE_LS_TIMESTAMPS=y
 CONFIG_FEATURE_LS_USERNAME=y
-CONFIG_FEATURE_LS_COLOR=y
+# CONFIG_FEATURE_LS_COLOR is not set
 # CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
 CONFIG_MD5SUM=y
 # CONFIG_SHA1SUM is not set
@@ -399,10 +399,10 @@ CONFIG_SETCONSOLE=y
 #
 # CONFIG_PIPE_PROGRESS is not set
 CONFIG_RUN_PARTS=y
-CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
+# CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS is not set
 # CONFIG_FEATURE_RUN_PARTS_FANCY is not set
 CONFIG_START_STOP_DAEMON=y
-CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
+# CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS is not set
 CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
 CONFIG_WHICH=y
 
@@ -636,7 +636,7 @@ CONFIG_FLOCK=y
 # CONFIG_FSFREEZE is not set
 CONFIG_FSTRIM=y
 CONFIG_GETOPT=y
-CONFIG_FEATURE_GETOPT_LONG=y
+# CONFIG_FEATURE_GETOPT_LONG is not set
 CONFIG_HEXDUMP=y
 # CONFIG_HD is not set
 # CONFIG_XXD is not set
@@ -997,7 +997,7 @@ CONFIG_TRACEROUTE=y
 # CONFIG_FEATURE_TUNCTL_UG is not set
 # CONFIG_VCONFIG is not set
 CONFIG_WGET=y
-CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+# CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
 CONFIG_FEATURE_WGET_STATUSBAR=y
 CONFIG_FEATURE_WGET_FTP=y
 CONFIG_FEATURE_WGET_AUTHENTICATION=y
diff --git a/meta/recipes-core/busybox/busybox/longopts.cfg b/meta/recipes-core/busybox/busybox/longopts.cfg
index dcfab99919..fa9b0bda33 100644
--- a/meta/recipes-core/busybox/busybox/longopts.cfg
+++ b/meta/recipes-core/busybox/busybox/longopts.cfg
@@ -1,15 +1,16 @@
+CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_GUNZIP_LONG_OPTIONS=y
 CONFIG_FEATURE_GZIP_LONG_OPTIONS=y
 CONFIG_FEATURE_TAR_LONG_OPTIONS=y
+CONFIG_FEATURE_TAR_TO_COMMAND=y
 CONFIG_FEATURE_CHOWN_LONG_OPTIONS=y
 CONFIG_FEATURE_CP_LONG_OPTIONS=y
-CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
+CONFIG_FEATURE_CP_REFLINK=y
+CONFIG_FEATURE_LS_COLOR=y
+CONFIG_FEATURE_LS_COLOR_IS_DEFAULT=y
 CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS=y
 CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
 CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
 CONFIG_FEATURE_DIFF_LONG_OPTIONS=y
-CONFIG_FEATURE_BC_LONG_OPTIONS=y
-CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS=y
-CONFIG_FEATURE_IPCALC_LONG_OPTIONS=y
-CONFIG_FEATURE_NSLOOKUP_LONG_OPTIONS=y
+CONFIG_FEATURE_GETOPT_LONG=y
 CONFIG_FEATURE_WGET_LONG_OPTIONS=y
-- 
2.39.5


