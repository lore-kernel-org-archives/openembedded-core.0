Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597B8C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:49:17 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.9920.1701211749997833595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1r86t8-0004Vj-8f; Tue, 28 Nov 2023 23:49:06 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1r86t7-00CGye-9e; Tue, 28 Nov 2023 23:49:05 +0100
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1r86t7-00C34N-0l;
	Tue, 28 Nov 2023 23:49:05 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	mfe@pengutronix.de
Subject: [PATCH] json-c: fix icecc compilation
Date: Tue, 28 Nov 2023 23:47:44 +0100
Message-Id: <20231128224743.2854095-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191394

Skip -Werror to make it possible to compile this recipe with ICECC else
all fallthrough comments will be removed since we pre-process the files
on the host before sending them to the compile nodes which then cause
errors because of default -Werror switch.

Fixes: caf64f85b5c5 ("json-c: update 0.13.1 - > 0.14")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

I'm not familar with the stable material but IMHO this would be somthing
for kirkstone.

Regards,
  Marco

 meta/recipes-devtools/json-c/json-c_0.17.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c_0.17.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
index f4b7a32cea01..20bcece7685d 100644
--- a/meta/recipes-devtools/json-c/json-c_0.17.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
@@ -17,6 +17,9 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
+# Required for ICECC builds
+EXTRA_OECMAKE = "-DDISABLE_WERROR=ON"
+
 inherit cmake ptest
 
 do_install_ptest() {
-- 
2.39.2


