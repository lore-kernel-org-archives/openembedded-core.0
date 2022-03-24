Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4419AC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 16:24:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.13149.1648139038952870683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: afa@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <afa@pengutronix.de>)
	id 1nXQFg-0001af-7u; Thu, 24 Mar 2022 17:23:56 +0100
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1nXQFf-00BZyt-7A; Thu, 24 Mar 2022 17:23:55 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Michael Olbrich <m.olbrich@pengutronix.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [OE-core][PATCH] kernel.bbclass: avoid config changes based on the
 availability of pahole
Date: Thu, 24 Mar 2022 17:23:51 +0100
Message-Id: <20220324162351.2759862-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 16:24:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163619

From: Michael Olbrich <m.olbrich@pengutronix.de>

CONFIG_PAHOLE_HAS_SPLIT_BTF shows up in the config only when pahole is
installed on the host system. As a result, the config changes depending on
whether pahole is installed or not.

Set PAHOLE=false to ensure that it is never found.

If this is actually needed in the future, then we can add an option for
it and create a host package for pahole.

Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
[afa: ported from PTXdist 0c0cec2288 to OE-core]
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4f304eb9c7ae..b3bbd3b27684 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -234,7 +234,7 @@ UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 KERNEL_EXTRA_ARGS ?= ""
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
-EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}""
+EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false"
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
@@ -639,7 +639,7 @@ addtask savedefconfig after do_configure
 
 inherit cml1
 
-KCONFIG_CONFIG_COMMAND:append = " LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
+KCONFIG_CONFIG_COMMAND:append = " PAHOLE=false LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
 
 EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs do_install do_configure
 
-- 
2.30.2


