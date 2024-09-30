Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C11FCE8345
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 13:30:22 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.54406.1727703012099290350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 06:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1svGTZ-0000N6-ML; Mon, 30 Sep 2024 15:30:09 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1svGTY-002dzz-Q7; Mon, 30 Sep 2024 15:30:08 +0200
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rhi@pengutronix.de>)
	id 1svGTY-004yKz-2S;
	Mon, 30 Sep 2024 15:30:08 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Roland Hieber <rhi@pengutronix.de>
Subject: [PATCH] devtool: modify: don't accidentally override existing source tree
Date: Mon, 30 Sep 2024 15:30:07 +0200
Message-Id: <20240930133007.1184996-1-rhi@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 13:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205118

The 'srctree' argument might point to an existing source directory, and
'devtool modify' without '--no-extract' given (maybe because of the
user's forgetfulness or inexperience) will override its content without
futher warning. Catch this accidental use case, and prompt the user to
specify '--no-extract' if this source tree should be used.

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
Note: this patch was developed on kirkstone and will probably also apply
on scarthgap.

 scripts/lib/devtool/standard.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b2e1a6ca3a5e..5354f298f598 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -790,6 +790,10 @@ def modify(args, config, basepath, workspace):
                             "not exist or is not a directory" %
                             srctree)
 
+        if not args.no_extract and os.path.isdir(srctree):
+            raise DevtoolError("Source path %s already exists. Did you mean to "
+                               "specify --no-extract?" % srctree)
+
         recipefile = rd.getVar('FILE')
         appendfile = recipe_to_append(recipefile, config, args.wildcard)
         if os.path.exists(appendfile):
-- 
2.39.5


