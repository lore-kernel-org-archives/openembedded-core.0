Return-Path: <rhi@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E570BC43334
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 23:53:46 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.12087.1658620418036785144
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 16:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: rhi@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rhi@pengutronix.de>)
	id 1oFOwB-00016p-TD; Sun, 24 Jul 2022 01:53:35 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1oFOwA-002o45-DJ; Sun, 24 Jul 2022 01:53:34 +0200
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <rhi@pengutronix.de>)
	id 1oFOw9-006jry-Ln; Sun, 24 Jul 2022 01:53:33 +0200
From: Roland Hieber <rhi@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Roland Hieber <rhi@pengutronix.de>
Subject: [PATCH] devtool: error out when workspace is using old override
 syntax
Date: Sun, 24 Jul 2022 01:51:19 +0200
Message-Id: <20220723235118.1605943-1-rhi@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 23:53:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168448

When the workspace bbappends are still using the old override syntax
with EXTERNALSRC_pn-*, externalsrc_re will not match, and pn will never
be assigned, leading to a nondescript UnboundLocalError being raised on
the user's terminal. Try to detect that situation and give the user a
hint how to solve it.

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
Poky maintainers: this should apply to kirkstone and honister as well.
---
 scripts/devtool | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index af4811b9221b..20d785c7f79c 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -104,6 +104,7 @@ def read_workspace():
     for fn in glob.glob(os.path.join(config.workspace_path, 'appends', '*.bbappend')):
         with open(fn, 'r') as f:
             pnvalues = {}
+            pn = None
             for line in f:
                 res = externalsrc_re.match(line.rstrip())
                 if res:
@@ -123,6 +124,9 @@ def read_workspace():
                 elif line.startswith('# srctreebase: '):
                     pnvalues['srctreebase'] = line.split(':', 1)[1].strip()
             if pnvalues:
+                if not pn:
+                    raise DevtoolError("Found *.bbappend in %s, but could not determine EXTERNALSRC:pn-*. "
+                            "Maybe still using old syntax?" % config.workspace_path)
                 if not pnvalues.get('srctreebase', None):
                     pnvalues['srctreebase'] = pnvalues['srctree']
                 logger.debug('Found recipe %s' % pnvalues)
@@ -314,10 +318,10 @@ def main():
 
     args = parser.parse_args(unparsed_args, namespace=global_args)
 
-    if not getattr(args, 'no_workspace', False):
-        read_workspace()
-
     try:
+        if not getattr(args, 'no_workspace', False):
+            read_workspace()
+
         ret = args.func(args, config, basepath, workspace)
     except DevtoolError as err:
         if str(err):
-- 
2.30.2


