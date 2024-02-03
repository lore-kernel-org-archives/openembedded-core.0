Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8422CC4828D
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 09:26:00 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.14118.1706952351240900935
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 01:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BojRxe/P;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75A7240006;
	Sat,  3 Feb 2024 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706952349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z1r4DuWZNB/fOVx6WlbUL2zNE8ZodRsRQ9pe2+H5KYI=;
	b=BojRxe/P6y6Qi1C1iQJX1RNU+8YMzho5r3vYheQFVsHE212HAaw3pLzRJN1NijLvdoHCV4
	7mu7ys4bXlX2Ui0E1MMrn5lMcfhjpcl+9EHWvjHXEcwZkB/pdi9hv3FdfW8Laowzh9GUsI
	YCI6/fAxNtIb+cGVBqzaVDuD6fKanPK1H8ACtNFrYPonlScgpmpDcBgl0EPjSdVi4tPdPs
	znrZXOpfQC4tGxSA6GkLPK7lx0+vnPvy6US37/vmBYdDMEulVc44Jkzm2v+b83mGDCRAA1
	upMdQph0rw2eVXJZxQX6wNIInTc+A3cDZ9C9XmtKeFoRvpIJaArtcoFzRLLk6A==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [OE-Core][PATCH v2 1/2] testimage: move TESTIMAGE_FAILED_QA_ARTIFACTS default value to core-image-minimal
Date: Sat,  3 Feb 2024 10:25:37 +0100
Message-ID: <20240203092538.5491-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240203092538.5491-1-alexis.lothore@bootlin.com>
References: <20240203092538.5491-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 09:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194840

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
recipes wanting to tune it, by setting the default value in
core-image.
While doing so, set it as a default value instead of a weak default value.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
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


