Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3373CCFB441
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 12:10:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.51435.1728303002609680369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 05:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYq-0004Yt-4h; Mon, 07 Oct 2024 14:10:00 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYp-0007Y3-AO; Mon, 07 Oct 2024 14:09:59 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYp-0047OC-0t;
	Mon, 07 Oct 2024 14:09:59 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 0/9] busybox: cleanup and fix config fragments
Date: Mon,  7 Oct 2024 14:09:41 +0200
Message-Id: <20241007120950.975803-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 12:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205271

Most of the busybox config fragments are useless since the respective options
were accidentally enabled in the 'defconfig' file during the defconfig update
to busybox 1.33.0 [1].

This is redundant and confusing and takes the ability to disable options by
removing the respective fragment file from the SRC_URI.

While cleaning this up, some other inconsistencies were found and fixed.

The series starts with a defconfig sync to the current defaults to have a clear
base to work on.

[1] 4335cd24 ("busybox: refresh the defconfig from 1.33.0")


Enrico Jörns (9):
  busybox: sync config for busybox 1.36.1
  busybox: disable defconfig options from simpler fragments
  busybox: disable defconfig options from syslogd.cfg
  busybox: mdev.cfg: remove CONFIG_SETSID
  busybox: disable defconfig options from login-utilities.cfg
  busybox: disable defconfig options from unicode.cfg
  busybox: getopts.cfg: disable long options
  busybox: disable long options in defconfig and fix longopts.cfg
  busybox: disable defconfig options from mount-via-label.cfg

 meta/recipes-core/busybox/busybox/defconfig   | 124 +++++++++---------
 meta/recipes-core/busybox/busybox/getopts.cfg |   2 -
 .../recipes-core/busybox/busybox/longopts.cfg |  11 +-
 meta/recipes-core/busybox/busybox/mdev.cfg    |   1 -
 4 files changed, 68 insertions(+), 70 deletions(-)

-- 
2.39.5


