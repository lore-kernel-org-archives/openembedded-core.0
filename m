Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2498ACA5FC3
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8573.1790756228818759254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JBAm2QJ2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2483A1A107E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED81060749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFF47103298BC;
	Wed, 30 Sep 2026 10:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DWiuWwYkD1/7vzEEDc0vA0bjOSoR9DjF8tYUYgHhJQk=;
	b=JBAm2QJ2oL7M7gOLwau5o/30lVo10wp2JHVn2O1Xdqlmf9nhayvS+TrPruHpzRRmz0yCFC
	UgknYvKnSl5bWH52XInY3RTv35OCDt1rRzKKW8wEAmfddXnxIRpMACCnIdTpPn2XnLIabx
	URrPNPX2AK9uMVVVyKl6RpWIHEbwGPpwAYL5REwULfcArtBsZqHPYfs9WCa43lyDx4YLoD
	Y0RBlh7SikXi0kLo1BmqQMfNKuHIeiGQSgp9x2QHheJ71LvIbMhYBhmlZHkwlc22M/HygF
	IyxrNQnlDM+Y16Xb5ibnHRs2yKa1y6plWSLRyB1ht7AYLNfpkVTKsnzhx5DOCg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:47 +0200
Subject: [PATCH 22/24] libpcre2: upgrade 10.48 -> 10.49
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-22-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1794;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=zKXZRlUawn6cQJ5I7QesgCH9PRzSPNQojmvb86lCoiE=;
 b=GxwPw7l6QUAwlU3f+aCK95E/OgrfajSOouKiOkzXmRP6Nza6XXTtsG90lY+OBsLJ9d21G7dvM
 KSojdhqXkVVARmELbGRPkFY/J0UW38wH38Qsvj9LkJcQwKoeUvdYZQA
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246946

Version 10.49 28-September-2026
-------------------------------

This is a security-only release, to address GHSA-r9hj-j2rw-4q3m.

Compared to 10.48, this release has only a minimal code change to prevent an
out-of-bounds write with arbitrary data. An attacker-controlled regex pattern
is required, and applications are only affected if using the
pcre2_jit_stack_create() and pcre2_jit_stack_assign() APIs to provide a growable
JIT stack, and then matching against a pattern with unusually high JIT stack
usage, such as a large number of capturing groups.

The implications of an out-of-bounds write could include arbitrary code
execution.

The issue is not a regression and affects releases 10.48 and earlier.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-support/libpcre/{libpcre2_10.48.bb => libpcre2_10.49.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.48.bb b/meta/recipes-support/libpcre/libpcre2_10.49.bb
similarity index 96%
rename from meta/recipes-support/libpcre/libpcre2_10.48.bb
rename to meta/recipes-support/libpcre/libpcre2_10.49.bb
index 56791171c238..5fa7c3db3b4c 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.48.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.49.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed"
+SRC_URI[sha256sum] = "53c156e1ba416a20da8e65395daa132da0d80e76910424caca3fcdae7831d384"
 
 CVE_PRODUCT = "pcre2"
 

-- 
2.47.3


