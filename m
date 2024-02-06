Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857ECC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:29:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.24240.1707233358977445130
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 07:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cLcC9AWl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EA2C1BF204;
	Tue,  6 Feb 2024 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DATRT1DITrOr/D/oqvM9iRt7OhWgc/abEgzsbtqmpa8=;
	b=cLcC9AWlqLzFg3aXrI5saASjXE8ZOS4s2Mx83jUuaJMMSFwUOQDeG0JefJh6SC+UyuMb30
	QELRVnACCnKnIujfxnOe5RIOWryIy95Drl7xTcMdNvOeUIKm1Vi5pMqsuL3evcc+aB7pRs
	Tt4XDc1CSgwVRpLAv3DN0/mRF3uxPIujyYHt5i/QzKl5mDYcnQtBJ4ryNe/i8No60hC2fr
	UA8kfV3J1QizU4NeaQGX+aYsUI37reQMzvkpQb7x/HGdNchjVk4vBubp0RBePmEi49RPiY
	2bzI7tUeITomTTtCxpDeIBMMab9aseplhLS5dWoymQpOJqeDqSLOURjeYzJVWw==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [OE-Core][PATCH v4] testimage: retrieve ptests directory when ptests fail
Date: Tue,  6 Feb 2024 16:29:10 +0100
Message-ID: <20240206152910.436447-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 15:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194998

From: Alexis Lothoré <alexis.lothore@bootlin.com>

TESTIMAGE_FAILED_QA_ARTIFACTS is set with a default, minimal list of files
to retrieve whenever a runtime test fails.
Add ptests directory to the list so we can get ptests artifacts (eg: logs)
whenever a ptest fails. By appending the ptest directory with the
multiconfig component in the path, only failing ptests will lead to
corresponding ptest artifacts retrieval, instead of all ptests artifacts
retrieval. While doing this addition, reinforce default value using "="
operator to make sure to get the default list in any case.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
This series is now self-contained in a single patch. After going back and
forth on where and how to properly add the ptests artifacts, only testimage
is finally affected. Additionally to Richard's suggestion in [1], the
ptests directory is added conditionally: otherwise, non-ptests images would
try to scp a non-existing directory (and it would fail silently)

Link to v3: [1]

Changes in v4:
- keep ptests artifacts addition in testimage.bbclass to avoid parsing
  order issues
- check for DISTRO_FEATURES to know if ptests artifacts should be retrieved
  in case of failure

Changes in v3:
- slightly reword commit message body

Changes in v1 (since being picked in new series)
- use += instead of append syntax

[1] https://lore.kernel.org/openembedded-core/20240205143757.81826-1-alexis.lothore@bootlin.com/
---
 meta/classes-recipe/testimage.bbclass        | 5 ++++-
 meta/recipes-core/images/core-image-ptest.bb | 1 -
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index f36d9418914f..281de4784f31 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -22,11 +22,14 @@ TESTIMAGE_AUTO ??= "0"
 # each entry in it, if artifact pointed by path description exists on target,
 # it will be retrieved onto host
 
-TESTIMAGE_FAILED_QA_ARTIFACTS ??= "\
+TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${localstatedir}/log \
     ${sysconfdir}/version \
     ${sysconfdir}/os-release"
 
+# If some ptests are run and fail, retrieve corresponding directories
+TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/${MCNAME}/ptest', '', d)}"
+
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
 # The test names are the module names in meta/lib/oeqa/runtime/cases.
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index b6f5c2fd6049..862e44f5e67c 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -42,4 +42,3 @@ python () {
     if not d.getVar("MCNAME"):
         raise bb.parse.SkipRecipe("No class extension set")
 }
-
-- 
2.43.0


