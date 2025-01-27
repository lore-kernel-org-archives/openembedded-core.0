Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E42FC0218A
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 15:40:31 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.54588.1737992428609449238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 07:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tcRDm-0005qm-SD; Mon, 27 Jan 2025 16:40:18 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tcRDm-0029F5-0z;
	Mon, 27 Jan 2025 16:40:18 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tcRDm-002qYN-0p;
	Mon, 27 Jan 2025 16:40:18 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2 1/2] barebox: drop patch file left over during last upgrade
Date: Mon, 27 Jan 2025 16:39:43 +0100
Message-Id: <20250127153944.676370-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 15:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210303

The patch was removed from SRC_URI but not deleted from the directory
tree.

Fixes: 3291a8fa ("barebox: upgrade 2024.10.0 -> 2024.12.0")
Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 ...0001-lib-lz4-use-lz4-instead-of-lz4c.patch | 35 -------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 meta/recipes-bsp/barebox/barebox/0001-lib-lz4-use-lz4-instead-of-lz4c.patch

diff --git a/meta/recipes-bsp/barebox/barebox/0001-lib-lz4-use-lz4-instead-of-lz4c.patch b/meta/recipes-bsp/barebox/barebox/0001-lib-lz4-use-lz4-instead-of-lz4c.patch
deleted file mode 100644
index 55d4a4556b..0000000000
--- a/meta/recipes-bsp/barebox/barebox/0001-lib-lz4-use-lz4-instead-of-lz4c.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 24839df617aef8099e4d1ba3fc47a04c52c0cf75 Mon Sep 17 00:00:00 2001
-From: Justin Bronder <jsbronder@cold-front.org>
-Date: Wed, 6 Nov 2024 11:59:40 -0500
-Subject: [PATCH] lib: lz4: use lz4 instead of lz4c
-
-lz4c has been considered deprecated by upstream since at least 2018 [1]
-and has been disabled by default recently [2].  openSUSE Tumbleweed is
-no longer packaging the deprecated version and others will likely
-follow.
-
-Going back as far as Ubuntu 16.04/Fedora 25, both lz4 and lz4c are
-installed as part of the same package so switching should be safe.
-
-1. https://github.com/lz4/lz4/pull/553
-2. https://github.com/lz4/lz4/pull/1479
-
-Upstream-Status: Submitted [http://lists.infradead.org/pipermail/barebox/2024-November/048491.html]
-Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
----
- scripts/Makefile.lib | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
-index 1881e3c1..1052bcee 100644
---- a/scripts/Makefile.lib
-+++ b/scripts/Makefile.lib
-@@ -492,7 +492,7 @@ cmd_lzo = (cat $(filter-out FORCE,$^) | \
- 
- quiet_cmd_lz4 = LZ4     $@
- cmd_lz4 = (cat $(filter-out FORCE,$^) | \
--	lz4c -l -c1 stdin stdout && $(call size_append, $(filter-out FORCE,$^))) > $@ || \
-+	lz4 -l --best stdin stdout && $(call size_append, $(filter-out FORCE,$^))) > $@ || \
- 	(rm -f $@ ; false)
- 
- %.lz4: %
-- 
2.39.5


