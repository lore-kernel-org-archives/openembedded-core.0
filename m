Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF2EC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 12:41:22 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.26555.1716813676920742026
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 05:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=VUmFvxWg;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Mkb9ZgsKL1/BEsxmVQ1gscLT5ZLqWTd6MhA7wuyxqeQ=; b=VUmFvxWg152kGACkD0bvhgaw2W
	jwAUtMV6Oaly7nguGdby2Mr59ij/7tuLIZltrkk8aZLdKPK8D+D8FujbK2WJYBtEr8wqC2yqARU+q
	lC5/YizgIJFtHzbe39YBzHWDreLcKckECDVS7jYKDgH3lMkKtOKcX3FJb2WLlalFBorU8mTvPOcJE
	eVjqUJtfYvMzmVe3mstvHE9BRwpUIbPzCLJAhJ0x173yQxWSZfdRSu/1CF6HssVB9sDmuOTfU3MBQ
	eh0OdDg3AJAiXn2a6QRTBVH2KcQuVds1Ch7nW1Ovq8rMrmLQ2F06Wkna5eGWVCKysG8XgKUxARrIM
	zbdD+R+g==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sBZf8-0009ZQ-Jg; Mon, 27 May 2024 14:41:14 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sBZf8-000ApU-2L;
	Mon, 27 May 2024 14:41:14 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH][master][scarthgap] classes: image_types: quote variable assignment needed by dash
Date: Mon, 27 May 2024 14:40:57 +0200
Message-ID: <20240527124059.2978863-1-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27288/Mon May 27 10:29:01 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 12:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199900

The change in commit 39fc503036
("classes: image_types: apply EXTRA_IMAGECMD:squashfs* in oe_mksquashfs()")
assigns $@ to a local variable without quoting it. While this works with
bash, it fails with dash. Here, only the first token of $@ is assigned
to the variable, and the reamining tokens are passed as arguments to the
"local" keyword.

Fix it by adding the missing quotes.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta/classes-recipe/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index b4a83ae284..2f948ecbf8 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -113,7 +113,7 @@ IMAGE_CMD:btrfs () {
 
 oe_mksquashfs () {
     local comp=$1; shift
-    local extra_imagecmd=$@
+    local extra_imagecmd="$@"
 
     if [ "$comp" = "zstd" ]; then
         suffix="zst"
-- 
2.44.0


