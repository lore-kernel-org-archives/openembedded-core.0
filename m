Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0F9CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:36:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6198.1790926592794547832
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mo0G6bZN;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C5864E4110C
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0648603DC
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47CAA1032843B;
	Fri,  2 Oct 2026 09:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790926590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zOMx01fXPJuytB/u7XgxKxlADnZZDwsivm7WQBHxOVw=;
	b=mo0G6bZNh71RaWw1KSlH1o79pHs0WQ/ZSIUmKOKM/bT7XnRX3uJRexH8sjqb8k4sM9LrFl
	q5kPExn5fEdQKqzh9p6taA7Vnr/SWQUbjX6dz1jygrVgiE9o2vYJrHmSSt+4Hfj597biJx
	pyZ9sUrfIW814eHNpcHFN9pu+tEfVrd0MmF/+Dep7xPU2vQkEIDID41O5bmS0LP2dgRIMw
	T/aFq4qbiElzIGQR5JFFpFluxD4fu5cUykNY0bitkFFWEChwwCiKuX53dXOjGRBTPFZnPS
	hcWgtYVDdLN6sE/h8pfhkb9/OTAPCl1cyIbC8STyhsIhOu0pb3arRucJr7+PxQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 02 Oct 2026 09:36:11 +0200
Subject: [PATCH 8/9] spirv-llvm-translator: upgrade 23.1.1 -> 23.1.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-mathieu-2026-10-01-upgrades-v1-8-3fdeab391403@bootlin.com>
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
In-Reply-To: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790926581; l=1510;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=cjwVUNt7roMnjfUURNkwOUl57VrIdTRKxEaKIphRcu8=;
 b=ftpQ6FFGjDkquu8HdK4iy6ad9rMwFQmwg3KmMswh71qCzpVkWunFy11tFr5BhDvONPLsZXB0A
 y9CrVcbVviTBkWrV6roVcQo2t2mAbxJwOynEwMCJFKsw3bsd3xvlKai
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247081

[Backport to 23] Fix FPRoundingMode decoration handling on mini-float
conversions (#4021)
[Backport to 23] Make the error handling kind selectable through TranslatorOpts
[Backport to 23] Support new OpTypeVectorIdEXT op with constant instructions in
Reader (#3951)
[Backport to 23] Mangle `OpUMulExtended` builtin arguments as unsigned (#3963)

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...{spirv-llvm-translator_23.1.1.bb => spirv-llvm-translator_23.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.1.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.2.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_23.1.1.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_23.1.2.bb
index 42e3236b38c0..a428d559bfd8 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.1.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_230"
-SRCREV = "c808623558686b7b285cabfa71542a93a5390f55"
+SRCREV = "e65dde28ce8f12ef7245914fa2850260328669e4"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH};tag=v${PV} \
 "

-- 
2.47.3


