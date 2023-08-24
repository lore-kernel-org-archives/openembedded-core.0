Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A923CC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 09:17:46 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.6894.1692868662459057551
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 02:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YtOh/b89;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF0EC1BF207;
	Thu, 24 Aug 2023 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692868660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Aqx0ksbaP3UW8WnCkOuS3DYYZgW+T8bJtr1mWnSxfQ=;
	b=YtOh/b89IEAOXel1SXeWYbPXgRtzDkF2DkoFalftzTgOVJxDSs8zLWl9J7pjevOZldtWub
	wbluNtBrIpfUKzr+kDt6BWyvGUkDVV+G16YKyo2i1zAbf6TXGGC8RQfmurVOi8y1fIIla0
	yLYtK8ydlAj6xP+f3nZE52V4oFiRpYRX3kitUH3gnbpQSP5Tlrk+sxLnp7QFA/7q2UqoxO
	GbvTB6QGqReRDVpwTFbF86Pu45qDHlUBVgD85p9jNVC3fEj6unyOisqdZPOGippOxCWoHU
	WYk/JpzMlHcLpqcef6VA+lKV0w8S1EpKo7lHwjOaPEUBQ+3dshtC5MDJNNcNVw==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH] oeqa/utils/gitarchive: replace warning with info when reading local tags
Date: Thu, 24 Aug 2023 11:18:10 +0200
Message-ID: <20230824091810.1795629-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 09:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186652

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Whenever a script needs to list tags, if it falls back to the third method
(reading local tags only), it emits a warning. While this warning is useful
for future diagnostic if some tagging issues re-appear, it makes buildperf
autobuilds status as "Passed with warnings", which is not desirable

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
See [1]: buildperf build has completed without any major issue, but is
still flaggued as "Passed with warnings" because of the log.warning in
gitarchive

[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/133/builds/2135
---
 meta/lib/oeqa/utils/gitarchive.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index ac36ecb3a9ca..64448f47d94e 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -128,7 +128,7 @@ def get_tags(repo, log, pattern=None, url=None):
             tags_refs = repo.run_cmd(cmd)
             tags = ["".join(d.split()[1].split('/', 2)[2:]) for d in tags_refs.splitlines()]
         else:
-            log.warning("Read local tags only, some remote tags may be missed")
+            log.info("Read local tags only, some remote tags may be missed")
             cmd = ["tag"]
             if pattern:
                 cmd += ["-l", pattern]
-- 
2.41.0


