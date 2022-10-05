Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5895C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 14:57:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.24537.1664981837962164048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 07:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Tpe6VDPR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A1249E0003;
	Wed,  5 Oct 2022 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664981836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MreEbY4wBL34nwLSUaJSsaQsZo+32Nwfruj+b5rfcng=;
	b=Tpe6VDPRBXHb2r3+VZlSy9SrdjJ6q2pmNW8wQbduI6FM94imJXXCXlxPx7ZSLuXlUsJum+
	aKyTrbUrQnTd8/3BFDWDhFcTOsfOeHglU7nVl/PlHWVtNZKxW5oL2Rx03KHum4It8f0W+1
	v95IoV/JRahIHJEexhrXYSFejgb2XQSafemt7jBGiLr/337eEoFGRV28p0OOTm2IJ6kgOj
	Ec1hCfcs/MKDCUmaovdUE2j+VBLizF84fD+/1JYboKHkvaHUQ1fKW2CfssOfzYFUR6FZJD
	7eIWwPJBZYOJQumt3Ctt7/7j7ZQTACJKK5/pxtv7dmEuTDWTL4CJE4JRI4zZcg==
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] psplash: add psplash-default in rdepends
Date: Wed,  5 Oct 2022 16:57:12 +0200
Message-Id: <20221005145712.2528771-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 14:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171460

Otherwise when the installation of recommended packages is prevented
(NO_RECOMMENDATIONS = "1"), then splash screen will not be cast.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index edc0ac1d8961..9532ed1534a6 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -58,7 +58,7 @@ python __anonymous() {
         d.setVarFlag("ALTERNATIVE_TARGET_%s" % ep, 'psplash', '${bindir}/%s' % p)
         d.appendVar("RDEPENDS:%s" % ep, " %s" % pn)
         if p == "psplash-default":
-            d.appendVar("RRECOMMENDS:%s" % pn, " %s" % ep)
+            d.appendVar("RDEPENDS:%s" % pn, " %s" % ep)
 }
 
 S = "${WORKDIR}/git"
-- 
2.37.3


