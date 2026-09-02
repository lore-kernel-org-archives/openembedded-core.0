Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D573C624DE
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:46:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.335.1788364009325295256
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iVId2YTw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A26131A195F
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7573B6053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B057511C7996E;
	Wed,  2 Sep 2026 17:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788364007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=49dx0tJ3yzRluPppas+J2FPkeDJa7D4zlz/aCx8iO0U=;
	b=iVId2YTwQ8KOSxt3jmFaWODEyasRGytfxGkh/YMADMwVKusFVg7g2O/KuAXU/Wwf95YQB5
	8fYDdgVqqX5xMLhjB3eCZygbryuC3jOmrRDH0+gszweCXBxnxFKmgH2WBnYtET3kItUTM6
	58WKGN7lgIVs5p5M9PD/rA9WnaCOBFxLgHwUWx/JTBBrw3tutkdrO216f4Lw9xNfSsv9Ym
	BUAKYLOsrlRRCizJ8EmPG9i612lQ05LzSS5DHNaexk+5bOcdBo1r2y08F9q4UeP0JpH/Pf
	nxAILk/moj2K1CZo0COgIyr0YfYTgeS8Yj4Ng8v0XWz6LKmspx/SvMRA3dzNeQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 17:46:44 +0200
Subject: [PATCH 2/8] python3-uv-build: upgrade 0.12.8 -> 0.12.9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-updates-2026-09-02-v1-2-039b74833ec7@bootlin.com>
References: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
In-Reply-To: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788364004; l=2231;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=5h81iv6sj7JX6sDusiqOQecH9/G1qkMQ5KUkUTFjmyQ=;
 b=4HDkx6F2ot1odLlY2XvQe4dGj9oGdtt4oLDyXyCCkQ5AX4FQ9CEAQCoABMC8HexuAtVx10PPO
 pQBfNhmqB7oAtOkDO/np0xUsc4t4n7pw5IWGxPM2K7Zdsc5OA20OJgK
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244973

Changelog:

- Python
  - Add CPython 3.15.0rc2
- Enhancements
  - Add --no-locked and --no-frozen to disable lock modes enabled by
    UV_LOCKED and UV_FROZEN for a single invocation
  - Report the exact command-line lock-mode flag in warnings and errors
- Performance
  - Speed up cold wheel installs by extracting each streaming ZIP
    archive in a single blocking task and reusing buffers across files
- Bug fixes
  - Update async_http_range_reader to 0.11.1 to address a potential
    memory-safety issue when reading metadata ranges from untrusted
    wheels
  - Remove sensitive headers when redirects cross authentication realms,
    including same-host redirects that change URL schemes
  - Redact secrets in signed URLs from retry diagnostics, including
    nested request errors
  - Give --locked, --frozen, --check, and --check-exists precedence over
    conflicting UV_LOCKED and UV_FROZEN values
  - Prevent concurrent uv processes from redundantly extracting the same
    local or source-built wheel

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-uv-build_0.12.8.bb => python3-uv-build_0.12.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.8.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.9.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.8.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.9.bb
index c711bc265db6..db313f57578a 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.8.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "6604ea05bc47d69f187896e579eb5c80fff349aa1b886c67cd2da68801ccfff0"
+SRC_URI[sha256sum] = "5811820c072a3f7489133594028f451eea7d65ad94e97f58bff70da1b1a5970d"
 
 require ${BPN}-crates.inc
 

-- 
2.47.3


