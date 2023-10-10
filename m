Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E395BCD6913
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:29:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.87199.1696930157395357652
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YjfiA+i7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C16CFE0007;
	Tue, 10 Oct 2023 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696930155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgroQvfISW2d8VN1NpoW7tH1e1wiVSw7wgJb4WtnDLs=;
	b=YjfiA+i7SxtC7cpFuY9JKzPPgBUwmlO7X0dhmn41KAVfATMQEy3beuDqAAuuj87wpqoDtj
	fYsOP+0FW3DhP45LKCh8yvVZ5HGfRgaW2i7hVc8ajiVeHJ2+wsjs7i/mE44PueLXwVqxCR
	JIg+pXbFzGUqcI09HErDwNzm0C8ZxY0cSbrj/mkixDfLSAPVs5PBZNslrjantyM+cIdq+2
	0Efm2gJphrG3Gldg78o/CxXvjEs0geA7/3uDVv3eYyCjY8S+sc3ULut4wOSn9F/NMXyt1i
	ap69B0zv/0xEDoSGSzYG6wn1JT808c27j931fpbzu3txxoLxMT6pBr44q8nCmw==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 1/2] oeqa/utils/gitarchive: fix tag pattern searching
Date: Tue, 10 Oct 2023 11:30:12 +0200
Message-ID: <20231010093013.16922-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010093013.16922-1-alexis.lothore@bootlin.com>
References: <20231010093013.16922-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188877

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Whenever we ask gitarchive to search for tags, we can provide it with a
pattern (containing glob patterns). However, when searching for example for
tags matching branch master-next, it can find more tags which does not
correspond exactly to branch master-next (e.g. abelloni/master-next tags
will match).

Prevent those additional tags from being fetched by gitarchive by using a
more specific pattern: prefix user-provided pattern with "refs/tags"

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/utils/gitarchive.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index f9c152681db7..2fe48cdcac7f 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -113,7 +113,7 @@ def get_tags(repo, log, pattern=None, url=None):
     # First try to fetch tags from repository configured remote
     cmd.append('origin')
     if pattern:
-        cmd.append(pattern)
+        cmd.append("refs/tags/"+pattern)
     try:
         tags_refs = repo.run_cmd(cmd)
         tags = ["".join(d.split()[1].split('/', 2)[2:]) for d in tags_refs.splitlines()]
-- 
2.42.0


