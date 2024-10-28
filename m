Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B3BD1359B
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:30:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.46745.1730104216191259109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8g-0000iN-0r; Mon, 28 Oct 2024 09:30:14 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-000om3-23;
	Mon, 28 Oct 2024 09:30:13 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-001oCc-1q;
	Mon, 28 Oct 2024 09:30:13 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [PATCH v2 0/9] busybox: cleanup and fix config fragments
Date: Mon, 28 Oct 2024 09:29:04 +0100
Message-Id: <20241028082913.418505-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206429

Most of the busybox config fragments are useless since the respective options
were accidentally enabled in the 'defconfig' file during the defconfig update
to busybox 1.33.0 [1].

This is redundant and confusing and takes the ability to disable options by
removing the respective fragment file from the SRC_URI.

While cleaning this up, some minor inconsistencies were found and fixed.

The series starts with a defconfig sync to the current defaults to have a clear
base to work on.

The final .config for qemux86-64 is identical (empty diff) between a run on
master and a run based on these patches.

[1] 4335cd24 ("busybox: refresh the defconfig from 1.33.0")

-- 

v1 -> v2:

* rebase, regenerate, and adapt changes and commit messages to busybox 1.37
  * adapt to changes in sha1sum.cfg/sha256sum.cfg/sha_accel.cfg
  * adapt to dependency changes in CONFIG_HWCLOK/CONFIG_LONG_OPTS
* add missing deactivation of CONFIG_GETOPT in defconfig
* add missing deactivation of CONFIG_LOGREAD in defconfig
* reworked and fixed some long option issues
* added some required changes to existing fragments
* fix a few typos in commit messages

Enrico Jörns (9):
  busybox: sync config for busybox 1.37
  busybox: disable defconfig options from simpler fragments
  busybox: disable defconfig options from syslog.cfg
  busybox: mdev.cfg: remove CONFIG_SETSID
  busybox: disable defconfig options from login-utilities.cfg
  busybox: disable defconfig options from unicode.cfg
  busybox: disable defconfig options from getopts.cfg and move long opts
  busybox: disable long options in defconfig
  busybox: disable defconfig options from mount-via-label.cfg

 meta/recipes-core/busybox/busybox/defconfig   | 121 +++++++++---------
 meta/recipes-core/busybox/busybox/getopts.cfg |   2 -
 .../busybox/busybox/login-utilities.cfg       |   3 +
 .../recipes-core/busybox/busybox/longopts.cfg |   1 +
 meta/recipes-core/busybox/busybox/mdev.cfg    |   1 -
 .../busybox/busybox/mount-via-label.cfg       |   1 +
 6 files changed, 65 insertions(+), 64 deletions(-)

-- 
2.39.5


