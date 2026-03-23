Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EAAFC72CA
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 23:20:33 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8521.1774308023519607749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 16:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1w4oZJ-0003b4-FU; Tue, 24 Mar 2026 00:20:21 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1w4oZI-001nws-0u;
	Tue, 24 Mar 2026 00:20:20 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1w4oZI-0000000EVAW-0w6c;
	Tue, 24 Mar 2026 00:20:20 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH] devtool: prevent 'devtool modify -n' from corrupting kernel Git repos
Date: Tue, 24 Mar 2026 00:19:31 +0100
Message-ID: <20260323232008.3456362-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 23:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233769

Running 'devtool modify -n' on a kernel recipe that inherits
'kernel-yocto' can unintentionally corrupt an existing Git repo or
worktree.

The work-shared optimization introduced in 3c3a9bae ("devtool/standard.py:
Update devtool modify to copy source from work-shared if its already
downloaded") is not skipped when '--no-extract' ('args.no_extract') is set.

As a result, for kernel builds where STAGING_KERNEL_DIR was already
populated when running 'devtool modify -n', the existing source tree is
overwritten (via oe.path.copyhardlinktree()) with the contents of
STAGING_KERNEL_DIR.

Fix by adding 'and not args.no_extract' to the kernel-yocto guard
condition.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 scripts/lib/devtool/standard.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b706d9c7a1..42fb13872d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -801,7 +801,8 @@ def modify(args, config, basepath, workspace):
         commits = {}
         check_commits = False
 
-        if bb.data.inherits_class('kernel-yocto', rd):
+        if bb.data.inherits_class('kernel-yocto', rd) and not args.no_extract:
+
             # Current set kernel version
             kernelVersion = rd.getVar('LINUX_VERSION')
             srcdir = rd.getVar('STAGING_KERNEL_DIR')
-- 
2.47.3


