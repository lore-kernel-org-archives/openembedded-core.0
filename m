Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D86C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 15:14:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.48880.1723475652843296825
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 08:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YyyT0nHi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0230D240007;
	Mon, 12 Aug 2024 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723475651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnjEZvrIKfWma3zNtA3xjriNRbZ92H5Y+9RFGvFsns0=;
	b=YyyT0nHiG7s2YcCjHQI+KH7EWIhGveLB0Kr7TCWHwsL3hqsEjv6RRM6vKIWOrs1IYqs7ET
	sq4Eu2Ip6Z0JuZ7xR5nqdDxbo28YqpwXr/gkH/Oq0zxYvi8Js+NrktOTVeR1yG+TvIaLrr
	LqDPbrXtN8gO6nr3fn0SuxcH8Ir6psdUur8sZXsQXlrdDe5qjllwhd8h+zn3U6b8wKTDKJ
	9Er9rSNlL3z2cll9qAA7S+YVzOe8vfVQRKJhEHVSinsOdfNmE3tTxTbFUAmqYnZpsWDp2t
	UUfr446hrc592B4AOoS8RnOC/sF9t3cxr4PUuQqKpy3WArOPZ7kyeeguF/LZ8A==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] oeqa/postactions: fix exception handling
Date: Mon, 12 Aug 2024 17:14:03 +0200
Message-ID: <20240812151404.134030-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812151404.134030-1-alexis.lothore@bootlin.com>
References: <20240812151404.134030-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 15:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203228

From: Alexis Lothoré <alexis.lothore@bootlin.com>

The current exception handler in list_and_fetch_failed_tests_artifacts
expects a non-exisiting variable and then fail to display the original
exception message since it raises a new one. The issue has been introduced
with commit 6e80b2ab660e ("oeqa/utils/postactions: transfer whole archive
over ssh instead of doing individual copies"). Now that tests artifacts are
now handled individually, there's no point of trying to print individual
names in the exception.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/utils/postactions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 2de2d18328ea..3b537146c50a 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -70,7 +70,7 @@ def list_and_fetch_failed_tests_artifacts(d, tc, artifacts_list, outputdir):
             raise Exception("Error while fetching compressed artifacts")
         p = subprocess.run(["tar", "zxf", "-", "-C", outputdir], input=output)
     except Exception as e:
-        bb.warn(f"Can not retrieve {artifact_path} from test target: {e}")
+        bb.warn(f"Can not retrieve artifacts from test target: {e}")
 
 
 ##################################################################
-- 
2.46.0


