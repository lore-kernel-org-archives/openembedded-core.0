Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29F1EE3F31
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 21:06:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.1964.1694552783765296806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 14:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ye6R8ZYD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 473CAFF802;
	Tue, 12 Sep 2023 21:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694552781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m3OPWVbzMRkKAzDl8Bizopqi7e9GhcyU5HnCW87Y2ZQ=;
	b=Ye6R8ZYDYUHvSitvI7unXHKdBrx0i0BBQ32COV9Db+aaDOe1wTUih4J+0KPog3FfD9qyxY
	qUBmJKJLiCQzWbql1s+svhCCfrq0cvcOuCWFxhPY/lozISvreRgL+DR3utXjZRHSwR7rrI
	ruKeLDOfYCxTU9+qC+7IN/7PduEcmyZlyHWvm4q3Xd5xCQYeupej5GYlMwmek+HaGYiY7a
	IziieErQJehIFJG77lKN0y1BSj98lJV0QRDxdnVUFf0R8i4QYg8cmym9zQ6EMaXXNkJQUg
	BNjh/3DBuKLaREag1XW+Z5+f0EI4yrqVR98kiigwDYKRNKVy7TOZ10Yxc5bQ5w==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] scripts/yocto_testresults_query.py: ensure tag is fetched
Date: Tue, 12 Sep 2023 23:06:18 +0200
Message-ID: <20230912210618.464769-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 21:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187547

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Ensure we fetch the tag before listing the first commit.

[ YOCTO #15193 ]

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 scripts/yocto_testresults_query.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto_testresults_query.py b/scripts/yocto_testresults_query.py
index a5073736aab5..cc591177bb2a 100755
--- a/scripts/yocto_testresults_query.py
+++ b/scripts/yocto_testresults_query.py
@@ -31,7 +31,8 @@ def create_workdir():
 
 def get_sha1(pokydir, revision):
     try:
-        rev = subprocess.check_output(["git", "rev-list", "-n", "1", revision], cwd=pokydir).decode('utf-8').strip()
+        subprocess.check_call(["git", "fetch", "--depth", "1", "origin", revision], cwd=pokydir)
+        rev = subprocess.check_output(["git", "rev-list", "-n", "1", "FETCH_HEAD"], cwd=pokydir).decode('utf-8').strip()
         logger.info(f"SHA-1 revision for {revision} in {pokydir} is {rev}")
         return rev
     except subprocess.CalledProcessError:
-- 
2.25.1


