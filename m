Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB75C77B73
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 18:48:19 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.88089.1682448496988889759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 11:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi2-0003kD-W2; Tue, 25 Apr 2023 20:48:15 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi1-00Dl5T-CI; Tue, 25 Apr 2023 20:48:13 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prNi0-00209I-A2; Tue, 25 Apr 2023 20:48:12 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	alexandre.belloni@bootlin.com
Subject: [PATCH v3 0/9] Add barebox bootloader support (and testing)
Date: Tue, 25 Apr 2023 20:47:11 +0200
Message-Id: <20230425184720.456896-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 18:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180392

This adds support for the barebox bootloader (and tools) to oe-core.

In order to have proper testing, this extends oe-selftest to allow
basic testing of bootloaders. While at it, cover both barebox and u-boot.

v3:

* bump to barebox 2023.04.0
* add anonymous python to not act as provider when no config is set
* reasoning for default BAREBOX_CONFIGs in patch description
  and set PREFERRED_PROVIDER_virtual/bootloader to u-boot to avoid
  conflicts
* extend patch description and add comment for vt100 regex
* set CC=${CC} and LD=${LD} in barebox-tools to fix musl builds

Enrico Jorns (7):
  barebox: set default BAREBOX_CONFIG for qemu machines
  oeqa/utils/qemurunner: support ignoring vt100 escape sequences
  oeqa/utils/qemurunner: simplify output parsing and make crlf-compatible
  oeqa/utils/commands: document runqemu context manager
  oeqa: support passing custom boot patterns to runqemu
  oeqa/selftest/cases: add barebox tests
  oeqa/selftest/cases: add basic u-boot test

Marco Felsch (2):
  barebox: add initial support
  barebox-tools: add initial barebox tools support

 meta/conf/distro/include/maintainers.inc      |   2 +
 meta/conf/machine/qemuarm.conf                |   1 +
 meta/conf/machine/qemuarm64.conf              |   1 +
 meta/conf/machine/qemux86-64.conf             |   1 +
 meta/lib/oeqa/selftest/cases/barebox.py       |  72 +++++++++
 meta/lib/oeqa/selftest/cases/uboot.py         |  40 +++++
 meta/lib/oeqa/targetcontrol.py                |   5 +-
 meta/lib/oeqa/utils/commands.py               |  22 ++-
 meta/lib/oeqa/utils/qemurunner.py             |  38 ++---
 .../barebox/barebox-tools_2023.04.0.bb        |  58 +++++++
 meta/recipes-bsp/barebox/barebox.inc          | 149 ++++++++++++++++++
 meta/recipes-bsp/barebox/barebox_2023.04.0.bb |   3 +
 12 files changed, 368 insertions(+), 24 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/barebox.py
 create mode 100644 meta/lib/oeqa/selftest/cases/uboot.py
 create mode 100644 meta/recipes-bsp/barebox/barebox-tools_2023.04.0.bb
 create mode 100644 meta/recipes-bsp/barebox/barebox.inc
 create mode 100644 meta/recipes-bsp/barebox/barebox_2023.04.0.bb

-- 
2.39.2


