Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FD2C48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 14:39:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.64334.1707143945859516649
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 06:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jiJ5lyiP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 087E7C0003;
	Mon,  5 Feb 2024 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707143944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mi3fCDvSP3R+ofFlIWOyLcJ//r9aBvsWfHXjJsq3tSY=;
	b=jiJ5lyiPsMqr4/bFCTr9u0mawVDzHIr0eLKJITcWZHZp/PKEbhqtaTTEkyRiQS3D2pRgj8
	vUChR0M/P+E2eewrYcaldzzLdQK6gF8+97Vazgul/ow2vaNelj26xvMmx4mqxWohyIc9qv
	gsnn+cMFRuftmGtgLWhcZuW/juxoH91Vf51t+OtwaCjO/gcjGQqLmS0a6RWDYonXN8wy2U
	d8+Q9KLwnQrKwlEPX0dV7DN4Tcey1jCLjUtAk+bqvnzsJJOeob2uNbwGAGyBksL31jTCXB
	1WWgwSAYzSMo9wWe9xEbypCa5CvEpcloRawEZG/6aCL6orGJGdzAARlY7MyAOw==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [OE-Core][PATCH v3 1/2] testimage: move TESTIMAGE_FAILED_QA_ARTIFACTS default to core-image
Date: Mon,  5 Feb 2024 15:37:56 +0100
Message-ID: <20240205143757.81826-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205143757.81826-1-alexis.lothore@bootlin.com>
References: <20240205143757.81826-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 14:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194940

From: Alexis Lothoré <alexis.lothore@bootlin.com>

TESTIMAGE_FAILED_QA_ARTIFACTS currently sets a default list of files to be
saved whenever some tests fail. Unfortunately, this default value is very
easily discarded, because TESTIMAGE_FAILED_QA_ARTIFACTS is expected to be
enriched by some core recipes (example: ptest images) which are often
parsed before testimage.bbclass. Those core recipes could still manage to
get the default value AND add some files by using override syntax, but then
it makes it difficult for downstream recipes or bbappend files to tune this
variable.

Allow to set this default value and make sure it is not overwritten by
recipes wanting to tune it, by setting the default value in core-image,
which is parsed early enough. While doing so, set it as a default value
instead of a weak default value.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes in v3:
- fix commit subject length and content

Changes in v2:
- set the default value in core-image instead of core-image-minimal
---
 meta/classes-recipe/core-image.bbclass | 8 ++++++++
 meta/classes-recipe/testimage.bbclass  | 9 ---------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/core-image.bbclass
index 40fc15cb04f2..8ca64a95a318 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -83,4 +83,12 @@ CORE_IMAGE_EXTRA_INSTALL ?= ""
 
 IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
 
+# When any test fails, TESTIMAGE_FAILED_QA_ARTIFACTS will be parsed and for
+# each entry in it, if artifact pointed by path description exists on target,
+# it will be retrieved onto host
+TESTIMAGE_FAILED_QA_ARTIFACTS ?= "\
+    ${localstatedir}/log \
+    ${sysconfdir}/version \
+    ${sysconfdir}/os-release"
+
 inherit image
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index f36d9418914f..cfda5b631ba8 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -18,15 +18,6 @@ inherit image-artifact-names
 
 TESTIMAGE_AUTO ??= "0"
 
-# When any test fails, TESTIMAGE_FAILED_QA ARTIFACTS will be parsed and for
-# each entry in it, if artifact pointed by path description exists on target,
-# it will be retrieved onto host
-
-TESTIMAGE_FAILED_QA_ARTIFACTS ??= "\
-    ${localstatedir}/log \
-    ${sysconfdir}/version \
-    ${sysconfdir}/os-release"
-
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
 # The test names are the module names in meta/lib/oeqa/runtime/cases.
-- 
2.43.0


