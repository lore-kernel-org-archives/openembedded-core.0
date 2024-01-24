Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36627C48260
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:29:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.23942.1706106581978069953
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k2SUVHR2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 599A7240009;
	Wed, 24 Jan 2024 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706106580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTjyJfCfTSnmKjgf6UNYvbogz6dFfmKThDMoQXC88L8=;
	b=k2SUVHR2g/++inuiekagaRHAQwazs+Yxu7d2MrcSp+VyOX8RsZXWUOz7hGrenlCmVDonme
	F4Fe/vgvdiC61VsDeQXFLt3zhSL999jjLUOhA9yIztCHkJ+2U4n6B0rIkcZF18Cow5pGMT
	ztEh8GVTgicc2wfHgi07XbLq/VetT8AxGVTZTCoUe5tSX0IXK0NCu8RU4TVMay7JzoIlCg
	V26n7qsKEj/8lDHvPTbjOT4/VT3LmgO0JfWl9GAYJD/x4cxkCI0N9peMAahZrDchWkYJ7A
	usaQOGmcoi5FuKNfyIvMMkHAw33NU9eXwA7fZKGOA4L20/VNTXWYkl8CHh3nlQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [OE-Core][PATCH 1/2] testimage: move TESTIMAGE_FAILED_QA_ARTIFACTS default value to core-image-minimal
Date: Wed, 24 Jan 2024 15:29:29 +0100
Message-ID: <20240124142930.1038759-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20240124142930.1038759-1-alexis.lothore@bootlin.com>
References: <20240124142930.1038759-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194290

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
core-image-minimal.
While doing so, set it as a default value instead of a weak default value.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/classes-recipe/testimage.bbclass          | 9 ---------
 meta/recipes-core/images/core-image-minimal.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)

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
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 84343adcd8e2..8f5fb0d2ae51 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -10,3 +10,11 @@ inherit core-image
 
 IMAGE_ROOTFS_SIZE ?= "8192"
 IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
+
+# When any test fails, TESTIMAGE_FAILED_QA ARTIFACTS will be parsed and for
+# each entry in it, if artifact pointed by path description exists on target,
+# it will be retrieved onto host
+TESTIMAGE_FAILED_QA_ARTIFACTS ?= "\
+    ${localstatedir}/log \
+    ${sysconfdir}/version \
+    ${sysconfdir}/os-release"
\ No newline at end of file
-- 
2.42.1


