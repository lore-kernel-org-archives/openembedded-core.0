Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBBBC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 06:47:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.7420.1686293271159675657
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 23:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I302UlRX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686293269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3F2gl06ox/sSuq5WQgpKO4sWduQzKIa9KmcJedgpIDI=;
	b=I302UlRXZla3ire7nbCaxmK38AzJILoFKKApXzu0qYfYDzfZmuAFK1Tb/4bua1NnSXcJp7
	IOOmlH98Q+Fqo+7BQa/9hrj71SuLNsRkRWzGhihpS12tADWLa9gn43ayR7id4y2Xp7Z7BA
	ogHl5efmDQdrks4UXe5J0HECMNvLIoEPoahcos99/qZGem4oMCVrAPujzLkBJjQIM7BHzR
	F9pBUew4ukwEmuxuc/uLfmGAG973UZ+fxbco9A47Von2uEtBgObNK8xWi5qW+fZtnF0LSw
	yFUsk6Cv5JDZnWn7yd5Ot0/aGIGr3ulCMyiCHRP39M/wAEUmJm+gO5c888dofw==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84DCD60005;
	Fri,  9 Jun 2023 06:47:49 +0000 (UTC)
From: alexis.lothore@bootlin.com
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [OE-Core][PATCH v3 4/4] core-image-ptest: append ptest directory to artifacts list
Date: Fri,  9 Jun 2023 08:48:02 +0200
Message-Id: <20230609064802.11777-5-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609064802.11777-1-alexis.lothore@bootlin.com>
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 06:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182536

From: Alexis Lothoré <alexis.lothore@bootlin.com>

TESTIMAGE_FAILED_QA_ARTIFACTS is defined in testimage.bbclass with a
minimal list of files to retrieve when a test fail. By appending the ptest
directory only in core-image-ptest.bb, thanks to multiconfig feature used
in the recipe, only failing ptests will lead to corresponding ptest
artifacts retrieval, instead of all ptests artifacts retrieval.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/recipes-core/images/core-image-ptest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 90c26641ba3a..e1be81bb2666 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -28,6 +28,7 @@ QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 4096"
 
 TEST_SUITES = "ping ssh parselogs ptest"
+TESTIMAGE_FAILED_QA_ARTIFACTS:append=" ${libdir}/${MCNAME}/ptest"
 
 # Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
 PTEST_EXPECT_FAILURE = "1"
-- 
2.40.1


