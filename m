Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159ECD3B7E8
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:49:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4946.1765187375776009287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 01:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=WNxQG+1j;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C01FF4E41AE9
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Dec 2025 09:49:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F35F60707;
	Mon,  8 Dec 2025 09:49:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B306102F2443;
	Mon,  8 Dec 2025 10:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765187373; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=uz+/7n8+F5met9qQnpBB8Aa01P7HLwloxxrUmR/98cM=;
	b=WNxQG+1j159jHoLjD1IwjxnDEa0nZZffCDRN2rWST9S1VK3Nm6xdjoosAvkjUaXBX3mqdi
	XObQxXpGuSeyFAbsMjHtgTDlJxvFG6f2HetE+E4FAkk12iONLbF17397BPUzSn9RLu5F1r
	S3fL+PdBSutQ8FKt7dBwAB31bimIea98+5NfJpZJS1Yi+joZI3ETPAGQ+nKSYQ0WMXDCKz
	qqty1eRULPYzYmQa+yO+oBXXtEFsYpjiICe6sY7pqAF9Z13dutC1DZBR9E9gArVHp3Wvm+
	gLBs82hgO5wGxRRuRFenYTi0/WlO3Kk7W4PZgB0Yra27m4X1t5oQlYA7qnjKMw==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH v5 0/3] spdx3: Add optional support for exporting build-time configuration metadata
Date: Mon,  8 Dec 2025 10:49:26 +0100
Message-ID: <20251208094929.46495-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 09:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227383

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Hello,

This v5 addresses feedback from the previous iteration and includes the
following changes since v4:

  - Rebased on current master
  - Fixed test_packageconfig_spdx to explicitly inherit the create-spdx
    class, ensuring the test runs correctly
  - Tested with `oe-selftest -r spdx`

The series adds optional support for exporting build-time configuration
metadata to SPDX 3.0 documents:

  - Kernel configuration export via SPDX_INCLUDE_KERNEL_CONFIG
  - PACKAGECONFIG feature export via SPDX_INCLUDE_PACKAGECONFIG
  - Selftests for both features

For full context about this series, please see [1].

[1] https://lists.openembedded.org/g/openembedded-core/message/222245

Kamel Bouhara (Schneider Electric) (3):
  kernel.bbclass: Add task to export kernel configuration to SPDX
  spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX
  oeqa/selftest: oe-selftest: Add SPDX tests for kernel config and
    PACKAGECONFIG

 meta/classes-recipe/kernel.bbclass   | 64 ++++++++++++++++++++++++++++
 meta/classes/create-spdx-3.0.bbclass | 11 +++++
 meta/lib/oe/spdx30_tasks.py          | 20 +++++++++
 meta/lib/oeqa/selftest/cases/spdx.py | 58 +++++++++++++++++++++++++
 4 files changed, 153 insertions(+)

--
2.43.0


