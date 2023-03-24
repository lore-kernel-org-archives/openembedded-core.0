Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C9BC6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 13:41:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.101755.1679665270390698050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 06:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bu35MMlH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A5A5FE000F;
	Fri, 24 Mar 2023 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679665267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qjx5SIOTzT6wpKoApJLqWRFq5KDEWD8mxfM9Es+hf3M=;
	b=bu35MMlHjpJAiKr8pkP3iA5DzO8R/tnr00zXLD4/AF471m3LURMRqB0iVOAasUY2cHhJxS
	8ktoiljTujNeRNzBzRzBCEdcR0TCYRRuKo+qit7Q9WxY9XLuF+mze9QzzfUljb7gRrhbsg
	VrqPcAOQsjV9KDKibaEIz57OIxif1DpjrYUM/4EsImCusocTjKnXSe+8r4sYLftniDM1ea
	MnZm5GCTqFUbTkNult5pEnAc88QFhbEn8T03Os0DX24UN5/+gQcjQNS7uEUaYoRxE8Aad/
	TDwIxgBsq0hSrYT4QwUI7wdQVXJFZIrFCoA9igGn+8qNHhiEDvMbelHkVD3iwA==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH] scripts/yocto_testresults_query.py: fix regression reports for branches with slashes
Date: Fri, 24 Mar 2023 14:41:09 +0100
Message-Id: <20230324134109.12784-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 13:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179035

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Regression reports are not generated on some integration branches because
yocto_testresults_query.py truncates branches names with slashes when it passes
it to resulttool. For example, "abelloni/master-next" is truncated to "abelloni"

Fix this unwanted branch truncation by fix tag parsing in yocto-testresults

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/yocto_testresults_query.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/yocto_testresults_query.py b/scripts/yocto_testresults_query.py
index 4df339c92eb..a5073736aab 100755
--- a/scripts/yocto_testresults_query.py
+++ b/scripts/yocto_testresults_query.py
@@ -41,7 +41,7 @@ def get_sha1(pokydir, revision):
 def get_branch(tag):
     # The tags in test results repository, as returned by git rev-list, have the following form:
     # refs/tags/<branch>/<count>-g<sha1>/<num>
-    return tag.split("/")[2]
+    return '/'.join(tag.split("/")[2:-2])
 
 def fetch_testresults(workdir, sha1):
     logger.info(f"Fetching test results for {sha1} in {workdir}")
-- 
2.40.0


