Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74ACC624DA
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:46:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.338.1788364011645461972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xObLdRn7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B29F71A1966
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 812736053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA8CE11C79BD8;
	Wed,  2 Sep 2026 17:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788364009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5qrEUZrlG4rEMjSxkXy3wBkMYsi9pmkLJ5JZAV5XJhQ=;
	b=xObLdRn7iciqfOPHzRSHmxIpiYRJLcANpveyjmTFv/iq2LYg4+3FQg4JLPKsdKC9H7Pcu3
	JWZzE1k6Tfmi0D941tXjJOdauQ9wltouuz4WJ4iaJ8hEwHbqLf0ZT/YdI0tydKClbM/M5D
	XC7JcR1llOrgo1AhTjUiHI5drQtDFJMMP43dDcgVNDAPI1r/OP+nhQS1o6yXYgFya3NSM7
	6ZPfoeqTRUYh2d9rLPZF0MuGTzFeOJGq6X3Y9Bt5Vid1IQhY5TXX1k6wbxvwqAvao3HRWn
	4/sLEONTLvrey6aaHbAbVGCjWurjyLDlRX91CYr2IPYrjOeFNo7xnauGp83dNQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 17:46:47 +0200
Subject: [PATCH 5/8] python3-setuptools-scm: upgrade 10.2.1 -> 10.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-updates-2026-09-02-v1-5-039b74833ec7@bootlin.com>
References: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
In-Reply-To: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788364004; l=1615;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=nvxglfjkaHHtMgx+5gwcoVlG4ia1kqtg/vphOOenDJU=;
 b=UnMVat7Ri65Xn+U4trw3lh6aA8UTeAWMS6oeEz6ccseXQJCVsYFC+v6YFLLtWc6e2mcQr7bnG
 CcN9outqW7YBUEQoY8g46E1OXvTKRaAKTfSCRpO2bGGXOj8vkzOVQNe
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244978

Changelog:
- The `pkginfo` workdir discovery entry point moved to vcs-versioning;
  `vcs-versioning>=2.3.2` is now required (the workspace pin carries a
  `.dev0` suffix so in-tree builds resolve, matching the existing
  convention). `setuptools_scm._integration._discover.discover_pkginfo`
  remains as a re-export.
- Stop shipping a per-package `uv.lock` in the sdist. It could not be
  generated correctly whenever `setuptools-scm` required an unreleased
  `vcs-versioning`, which broke the release proposal workflow.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...ython3-setuptools-scm_10.2.1.bb => python3-setuptools-scm_10.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb
index 608c0ba47f3e..d6f23321d053 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "4fa7dd82cf8c800df59c9a288c90299b1657ff1ecfc3f5cc00287c5dbf5e27a9"
+SRC_URI[sha256sum] = "36b5dcef6bbeee0bc76b7756d1b574b3762e2138611a4f18e898f22f1aaee462"
 
 PYPI_PACKAGE = "setuptools_scm"
 

-- 
2.47.3


