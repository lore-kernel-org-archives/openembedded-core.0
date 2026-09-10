Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8550DC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 11:04:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11271.1789038263803190845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 04:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H6fLHFVU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 75B17C2C672
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:05:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D4FD602B8
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4332911C78B69;
	Thu, 10 Sep 2026 13:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789038257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=79HkdjWTfZTPfyEocOWDosIRldFGa6UXmZgNpcTYdAY=;
	b=H6fLHFVUJPEXwNCIuMeRE+H8TshSTrMBZGqTO89Rkan4UzwlCBc8t/18j8tUQPgbCVJy22
	cQsQ9C3qjiSic88gdsaRCYsenTKCXbbhXUdjCuC7MqcDk9m00crU13+Kg0xrHglty4W8BX
	oq/T6Fv5jDqCCBm55a4lzPiOJdWYwEAKiWqii+1RtdYkQ4VWQfg5R/HaBunsgOn2zv1OIE
	qgtN54MBd/oc9oKKXK62/Qfz/wRLHWFFxlvn6s5aKfxqV9/MgFp3fI0z2xOy1suuS8Ay8K
	0vpD47w8eMrHonLFtxZO2sfZje2Yh5Wd5EBbsq2pYkX2Jz2DyCOe3IWCAgsSJA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 10 Sep 2026 13:03:56 +0200
Subject: [PATCH 3/7] repo: upgrade 2.66.1 -> 2.67
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-mathieu-updates-2026-09-10-v1-3-da1b555eace9@bootlin.com>
References: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
In-Reply-To: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789038241; l=2287;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=SN9cMK3bKbJTH4dkU/RgYIjdYhVD82okr7eY3jCsnYA=;
 b=akxPDlOfoVnRPeY9u6n4q5xwQjtkJkBU1/ab51yFhRzfFrniWYLSzdyBp8yendmjH13msICih
 ker9nX+gT4oBU/n+1lO4BbnjTYJqj/Gz3thqgkajX6TTi2CLjuKMaiZ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245553

Changelog:

- project: check upstream ref ancestry for non-shallow clones
- project: gate the default-branch query by Git version
- git_superproject: resolve one negotiation ref directly
- upload: reuse the worker current-branch result
- version: read describe and date in one Git call
- cherry_pick: resolve and read commits in one process
- rebase: delegate automatic stashing to Git
- git_config: recognize only complete object IDs
- sync: tell apart same-path submanifest projects
- project: carry current state from the ref snapshot
- project: reuse ref OIDs in branch maintenance
- project: centralize safe branch and commit resolution
- project: reuse loaded refs when resolving HEAD
- git_refs: load HEAD with the ref snapshot on Git 2.45
- upload: prune ref scans for untouched projects and specific branches
- project: read HEAD directly in-memory to avoid subprocesses
- sync: skip submodules removed from their parent
- sync: fetch submodules after their parent repository
- sync: check out submodules at the parent's new revision
- project: don't use dest-branch or tags as SHA-1 upstream fallback
- hooks: add --fix option to auto-apply hook fixes
- Add detailed upload context to Trace2 telemetry
- project: allow re-reading submodule gitlinks

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-devtools/repo/{repo_2.66.1.bb => repo_2.67.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/repo/repo_2.66.1.bb b/meta/recipes-devtools/repo/repo_2.67.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.66.1.bb
rename to meta/recipes-devtools/repo/repo_2.67.bb
index 32c7a38a9431..948a9a775c04 100644
--- a/meta/recipes-devtools/repo/repo_2.66.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.67.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "b85886fa9f5b4e2189cc5b2f40bd0a80459d4c77"
+SRCREV = "d27d6829a84f488b7253ea693dcc429076c33914"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 

-- 
2.47.3


