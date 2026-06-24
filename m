Return-Path: <m.tretter@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7E1CDB481
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:31:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8555.1782311496461861161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: m.tretter@pengutronix.de)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wcOda-0006SA-8m; Wed, 24 Jun 2026 16:31:34 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH] busybox: fdisk: enable GPT support
Date: Wed, 24 Jun 2026 16:31:34 +0200
Message-ID: <20260624143134.2398886-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239519

busybox' fdisk has optional support for GPT partitions. Since GPT
support is currently disabled in openembedded-core, fdisk cannot be used
to inspect the GPT partition table on block devices on the target.

Make fdisk useful on systems with GPT partitions by enabling
CONFIG_FEATURE_GPT_LABEL.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/fdisk-gpt.cfg | 1 +
 meta/recipes-core/busybox/busybox_1.38.0.bb     | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/fdisk-gpt.cfg

diff --git a/meta/recipes-core/busybox/busybox/fdisk-gpt.cfg b/meta/recipes-core/busybox/busybox/fdisk-gpt.cfg
new file mode 100644
index 000000000000..686eb99d1433
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/fdisk-gpt.cfg
@@ -0,0 +1 @@
+CONFIG_FEATURE_GPT_LABEL=y
diff --git a/meta/recipes-core/busybox/busybox_1.38.0.bb b/meta/recipes-core/busybox/busybox_1.38.0.bb
index 48b5e687b8ab..5ae58ce37f3b 100644
--- a/meta/recipes-core/busybox/busybox_1.38.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.38.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://unicode.cfg \
            file://rev.cfg \
            file://pgrep.cfg \
+           file://fdisk-gpt.cfg \
            file://rcS \
            file://rcK \
            file://makefile-libbb-race.patch \
-- 
2.47.3


