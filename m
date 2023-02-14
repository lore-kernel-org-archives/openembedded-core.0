Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCC2C6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 10:27:03 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.3470.1676370415307599341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 02:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pRsWT-0001bW-AF; Tue, 14 Feb 2023 11:26:53 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pRsWQ-004rJS-24; Tue, 14 Feb 2023 11:26:51 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pRsWQ-00EEA8-D1; Tue, 14 Feb 2023 11:26:50 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] kernel-yocto: fix kernel-meta data detection
Date: Tue, 14 Feb 2023 11:26:46 +0100
Message-Id: <20230214102646.3390984-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 10:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177137

Fixes: 7ef7af5c03ba ("kernel-yocto: restore kernel-meta data detection for SRC_URI elements")
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/classes-recipe/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 1a6695ba7e35..7de99cff5642 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -212,7 +212,7 @@ do_kernel_metadata() {
 	# SRC_URI. If they were supplied, we convert them into include directives
 	# for the update part of the process
 	for f in ${feat_dirs}; do
-		if [ -d "${WORKDIR}/$f/meta" ]; then
+		if [ -d "${WORKDIR}/$f/kernel-meta" ]; then
 			includes="$includes -I${WORKDIR}/$f/kernel-meta"
 		elif [ -d "${WORKDIR}/../oe-local-files/$f" ]; then
 			includes="$includes -I${WORKDIR}/../oe-local-files/$f"
-- 
2.30.2


