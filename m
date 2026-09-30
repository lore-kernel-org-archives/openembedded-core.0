Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AF5CA5FC3
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8563.1790756211900557665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=f+T+GjLC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 32B1F1A107C
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F386160749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4F5D1032986C;
	Wed, 30 Sep 2026 10:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756209; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ubyBU1mmeHA5B62Pfjefi7ghaEOgXzP2wEBHaxYJW6E=;
	b=f+T+GjLC4ENEX2l7wPcsFhlpLC6wdi/TqyK85KHCAITjPVThU1j95+daHkb5STpJKeMwRM
	yT/QRy//yFOgAEqoPOYGRg2Xv2vz0FgR5wzH8wcbD1NXrq7J32vw0ZInuIwNlb/mHmSiVr
	iG14gvZthGVW5RODYjCTBNGDp51H2RXycMPq8d6JUaZTzXUWd03o4RQd8zDM3tZBztdCca
	DQTku+80vwQCWSOJEDSzLQi5Vrooj8viz4bm5Q9FZmLaFRkOLjnCZlsrggN5QS1vkEVTh+
	O3zlnz7tNhORWTEEdr5qjF/h0cUeSLpqBVAJD+hTX2l6A638v3q04MDyVDR81g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:31 +0200
Subject: [PATCH 06/24] repo: upgrade 2.67 -> 2.68.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-6-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1248;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=asg1VuAFwl/+BFJx47L1iVnMGIdj2RTyvUoxmhFTmkk=;
 b=Fyu8F35iUb3+F1c5iyr3m3/WUUrFSdgMnPB08qHQ/eFlTZsIsahJEaAS6sZUavw8hPt7kpF/z
 j79ShHo3e7pAsbQIigSEv7zVqk8jUr2oHgsSioqFtpgZyl84+vi0TcO
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246930

Changelog:
- project: don't plan a stateless prune without a worktree
- sync: skip the bloat check for projects without a worktree
- project: don't rerun git status after a failed snapshot
- Fix fail in test_repo_trace if trace is disabled

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-devtools/repo/{repo_2.68.bb => repo_2.68.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/repo/repo_2.68.bb b/meta/recipes-devtools/repo/repo_2.68.1.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.68.bb
rename to meta/recipes-devtools/repo/repo_2.68.1.bb
index ee448583ab9c..053f1cabcfad 100644
--- a/meta/recipes-devtools/repo/repo_2.68.bb
+++ b/meta/recipes-devtools/repo/repo_2.68.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "8c7e0a683e88cf23f2c4765b26cfa1c917b660f4"
+SRCREV = "e1e215a14ea5373419acb8753b6865de19d1f122"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 

-- 
2.47.3


