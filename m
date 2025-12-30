Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B3EEE4992
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 17:48:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69020.1767116878938042910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 09:47:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uvdcT0ny;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 65A274E41E88
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 17:47:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EC386072C
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 17:47:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7428113B0755;
	Tue, 30 Dec 2025 18:47:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767116876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zHXSB1s0D5cGU5GljpNokr2mw4nWwRu+wtrGEtn5MpE=;
	b=uvdcT0nyx5IBrT6AbJjW/+XGkNJ7uAeZhDgimKMPUnG0MmKAv7N9wBjvdVJO0aKdGeSpbX
	AKdJJKbqpT/vDwn759k5JmgrULLWJEd4f2hsIjSZOorxJf51NCLBBjLqgzUaDdIN24zOGX
	L5sLUm89aVuRHdifCWU9wclnZhUrrXEuwVq8ZsFE9GfTLwP3oIU/8PKWJitlEI2C9Zl+q2
	WDlTMnEcwle+J1tJoaiItk3Ry574cBHArlJCyfDkX57yTxeRcAsMcjo8tcRbbXUgeJVgYO
	fFCX9jHePljtxF27L9hIYX3rBfmpziTI+DSzC4kVu8ceibc/bOaiUNRV9+BcQA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 30 Dec 2025 18:47:49 +0100
Subject: [PATCH 2/2] oeqa/gitarchive: Push tag before copying log files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mathieu-fix-15696-v1-2-b4de13efebc0@bootlin.com>
References: <20251230-mathieu-fix-15696-v1-0-b4de13efebc0@bootlin.com>
In-Reply-To: <20251230-mathieu-fix-15696-v1-0-b4de13efebc0@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767116874; l=1766;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=GwI5UDR5CMOc/nnaEfNYtwpxty8Wd7l7opS96JX8o/0=;
 b=SRi0dz6PPgtfBXRSKzMbgZ6doHA5iqM+ZnD23ovQohwz0TDiCTDLvUo7BfxfLlj7LjTeNZkWx
 2vv9uxCpZXAApDtHko/3u/ZMTCMRgnk3arwjdDTtdrzPprJ3M60aOg7
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 17:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228689

Resulttool creates a git tag in the yocto-testresults git and then
copies log files to a newly created folder on the NFS share, whose name
is controlled by the name of this git tag. As tags are unique, the
folder name is also unique, preventing any clash between different
builds.

Today, the tag is pushed after the folder is copied, which can lead to
some issues if for any reason the tag is not pushed. This might also
lead to some race condition. Push the tag before coying data, in order
to prevent these issues.

Fixes [YOCTO #15696]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 scripts/lib/resulttool/store.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index b143334e699d..da3fac39ea8d 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -78,11 +78,12 @@ def store(args, logger):
             if args.logfile_archive:
                 excludes = ['*.log', "*.log.zst"]
 
+            push_tag = args.logfile_archive
             tagname = gitarchive.gitarchive(tempdir, args.git_dir, False, False,
                                   "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
                                   False, "{branch}/{commit_count}-g{commit}/{tag_number}",
                                   'Test run #{tag_number} of {branch}:{commit}', '',
-                                  excludes, [], False, keywords, logger)
+                                  excludes, [], push_tag, keywords, logger)
 
             if args.logfile_archive:
                 logdir = args.logfile_archive + "/" + tagname

-- 
2.47.3


