Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACDCCE8D7A
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 12:07:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.17986.1726747621696355615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 05:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1srFw4-00026L-2W; Thu, 19 Sep 2024 14:07:00 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1srFw3-0000iZ-Gz; Thu, 19 Sep 2024 14:06:59 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1srFw3-0006D2-1Z;
	Thu, 19 Sep 2024 14:06:59 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v7 0/7] Add barebox bootloader support (and testing)
Date: Thu, 19 Sep 2024 14:06:33 +0200
Message-Id: <20240919120640.19714-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 12:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204677

This adds support for the barebox bootloader (and tools) to oe-core.

In order to have proper testing, this extends oe-selftest to allow
basic testing of bootloaders. While at it, cover both u-boot and barebox.

v7:
* add missing HOMEPAGE to barebox recipe
* ignore barebox for maintainers check since the recipe is skipped
  during parsing (because of PREFERRED_PROVIDER mechanism).

Enrico Jorns (5):
  barebox: set default BAREBOX_CONFIG for qemu machines
  oeqa/utils/qemurunner: support ignoring vt100 escape sequences
  oeqa: support passing custom boot patterns to runqemu
  oeqa/selftest/cases: add basic u-boot test
  oeqa/selftest/cases: add basic barebox tests

Marco Felsch (2):
  barebox: add initial support
  barebox-tools: add initial barebox tools support

 meta/classes-recipe/barebox.bbclass           | 160 ++++++++++++++++++
 meta/conf/distro/include/maintainers.inc      |   2 +
 meta/conf/machine/qemuarm.conf                |   1 +
 meta/conf/machine/qemuarm64.conf              |   1 +
 meta/conf/machine/qemux86-64.conf             |   1 +
 meta/lib/oeqa/selftest/cases/barebox.py       |  43 +++++
 meta/lib/oeqa/selftest/cases/distrodata.py    |   2 +-
 meta/lib/oeqa/selftest/cases/uboot.py         |  42 +++++
 meta/lib/oeqa/targetcontrol.py                |   5 +-
 meta/lib/oeqa/utils/commands.py               |   5 +-
 meta/lib/oeqa/utils/qemurunner.py             |   6 +-
 .../barebox/barebox-tools_2024.08.0.bb        |  59 +++++++
 meta/recipes-bsp/barebox/barebox_2024.08.0.bb |  15 ++
 13 files changed, 335 insertions(+), 7 deletions(-)
 create mode 100644 meta/classes-recipe/barebox.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/barebox.py
 create mode 100644 meta/lib/oeqa/selftest/cases/uboot.py
 create mode 100644 meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb
 create mode 100644 meta/recipes-bsp/barebox/barebox_2024.08.0.bb

-- 
2.39.5


