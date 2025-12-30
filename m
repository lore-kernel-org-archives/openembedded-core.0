Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBDCEE4997
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 17:48:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68902.1767116878397264755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 09:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ytqM7HTZ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE09C4E41E87
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 17:47:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 988ED6072C
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 17:47:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9666113B062C;
	Tue, 30 Dec 2025 18:47:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767116876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OefSNUq1W54utxrl7NTro2Ac81+45fOEwnn9sggUZtk=;
	b=ytqM7HTZgTuR9eJag4vmlxKYkfTRH1xo6M6AncHcLB+rlqE+ZMycelLWTDL7ndMKzW3byA
	pIZniUYCXV6vBN2P+F8YhJzU4nTcCehONNp1Vxj6WGjje/JIeraDqkzIcVIox8XS3bc0pm
	ceX6EcihbSxI4CFH8w3AcpkzAJWfXtz6mNJKJDb4/hLijNi+s74/7pD5lAPqJgzsRfi6Ov
	ljmJWH8CW8ew1zrYClucYxPekNFoMGpNUGi4gi3zzZlJqkmAxlYkerilfws8QiqsSWTgzE
	N9w3ZbtK9FvLX0AQRxA4w3rzONrE/c7u10c0TR9m+swVN7xPjrhJiqLjxYyjUQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 30 Dec 2025 18:47:48 +0100
Subject: [PATCH 1/2] oeqa/gitarchive: Fix git push URL parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mathieu-fix-15696-v1-1-b4de13efebc0@bootlin.com>
References: <20251230-mathieu-fix-15696-v1-0-b4de13efebc0@bootlin.com>
In-Reply-To: <20251230-mathieu-fix-15696-v1-0-b4de13efebc0@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767116874; l=1490;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=O8ZVtjeptCVYDZWv+owqViocP0r3vl8z3Jo27EQGO0Y=;
 b=olxcgklh3U6u5xWniW+aQfdg+TmgFz8CQb1/b1oEugJUE+E7Xed5SXPzGT8fMiKGBJCQbD5Ed
 mb8rwRVZAvoD6NF9MvZygbzEZNtj3LRL0CzxPLxSxDkqpJQTIRMI3rn
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 17:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228688

The gitarchive() function takes a `push` parameter than can be either a
boolean or a string. But this parameter is then passed to
expand_tag_strings(), which clearly expect it to be a string if it is
defined: make sure to pass either a string or None.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/utils/gitarchive.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 7e1d5057482f..25d337d9246b 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -175,11 +175,15 @@ def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_ms
     commit_msg += '\n\n' + format_str(commit_msg_body, keywords)
     branch_name = format_str(branch_name, keywords)
     tag_name = None
+
+    # push is either a boolean or a git remote URL string
+    push_url = push if isinstance(push, str) else None
+
     if not no_tag and tagname:
         tag_name, tag_msg = expand_tag_strings(data_repo, tagname,
                                                tag_msg_subject,
                                                tag_msg_body,
-                                               push, log, keywords)
+                                               push_url, log, keywords)
 
     # Commit data
     commit = git_commit_data(data_repo, data_dir, branch_name,

-- 
2.47.3


