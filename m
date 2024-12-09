Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9F4E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 16:46:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.106403.1733762774131955722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 08:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tKgtg-0006PC-Fi; Mon, 09 Dec 2024 17:46:12 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tKgtf-002XwD-1P;
	Mon, 09 Dec 2024 17:46:12 +0100
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tKgtg-00FGOu-0S;
	Mon, 09 Dec 2024 17:46:12 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org,
	yocto@pengutronix.de
Subject: [PATCH] icecc: fix PN 'no-pn' handling
Date: Mon,  9 Dec 2024 17:46:08 +0100
Message-Id: <20241209164608.3595821-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 16:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208488

Since bitbake commit f24bbaaddb36 ("data: Add support for new
BB_HASH_CODEPARSER_VALS for cache optimisation") the
BB_HASH_CODEPARSER_VALS are passed during the bb.build_dependencies()
step.

With PN set to 'no-pn' and the icecc_version() running during
bb.build_dependencies() (due to the 'vardepsexclude') the bb.fatal() is
triggered while parsing target-sdk-provides-dummy.bb albeit it was
already disabled via ICECC_RECIPE_DISABLE.

To fix this use_icecc() need to verify if PN is set to 'no-pn' which
indicates the early bb.build_dependencies() task and return 'no' in that
case.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

this patch should fix the reoprted ICECC bug:

https://lists.yoctoproject.org/g/yocto/topic/icecc_support_broken/103429714

Regards,
  Marco

 meta/classes/icecc.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 159cae20f8ca..df73e31e9514 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -159,6 +159,12 @@ def use_icecc(bb,d):
             bb.debug(1, "%s: bbclass %s found in disable, disable icecc" % (pn, bbclass))
             return "no"
 
+    # PN set to 'no-pn' indicates that bitbake is at the early
+    # bb.build_dependencies() stage and it's not possible to use the value to
+    # decide if icecc can be used.
+    if pn == "no-pn":
+        return "no"
+
     disabled_recipes = (d.getVar('ICECC_RECIPE_DISABLE') or "").split()
     enabled_recipes = (d.getVar('ICECC_RECIPE_ENABLE') or "").split()
 
-- 
2.39.5


