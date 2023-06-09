Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34641C7EE37
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 06:47:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.7419.1686293270649314470
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 23:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GNNV5d3m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686293268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBCw1B/O8Hp0O6KVv5y7sU9oxjcHgbOlO/DG8skt1Vs=;
	b=GNNV5d3mHmxtK4RyWDRLMYRE5hPagpXDA5UH1TeIFP4+Lw/2zkKPT8+yO/NtwEFVAw8YhL
	hU1KT7++qs5X43oGcSS/nAwuB93xn4sXDIQIoOtsxnhrs5bC8ve2EmLSEtVEI0Fdso+j8O
	8+eo0Q8H10+8BptUT7W2lE0XU/whbMhtadvi6qq0G9FwqllrSgSNUHHyOIBakoUIjy9LtJ
	WCzP+xxil8GWnsqwSi6wTuxKABjx+deYsrXbY8kz/MINr6sI+F+gVCfV1df+n7zmJXVX3t
	yNOnUQBgXxXRx76sDnyT0t0cvcNJtGB4XLW83wgO+KYMh5+f1qCVBP19zHYLgw==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F13860008;
	Fri,  9 Jun 2023 06:47:48 +0000 (UTC)
From: alexis.lothore@bootlin.com
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [OE-Core][PATCH v3 1/4] oeqa/core/runner: add helper to know about expected failures
Date: Fri,  9 Jun 2023 08:47:59 +0200
Message-Id: <20230609064802.11777-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609064802.11777-1-alexis.lothore@bootlin.com>
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 06:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182537

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Testing framework currently uses the unittest.expectedFailure decorator for
tests that can have intermittent failures (see PTEST_EXPECT_FAILURE = "1")
in core-image-ptest.bb. While it allows upper layers to run tests without
failing on "fragile" tests, it prevents those from knowing more about those
failing tests since they are not accounting as failures (for example we
could want to retrieve some logs about failed tests to improve them, and
eventually to drop expectFailure decorator)

Add a helper to allow upper layers to know about those failures which won't
make global testing session

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/core/runner.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index d50690ab37f8..5077eb8e3e32 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -229,6 +229,10 @@ class OETestResult(_TestResult):
         # Override as we unexpected successes aren't failures for us
         return (len(self.failures) == len(self.errors) == 0)
 
+    def hasAnyFailingTest(self):
+        # Account for expected failures
+        return not self.wasSuccessful() or len(self.expectedFailures)
+
 class OEListTestsResult(object):
     def wasSuccessful(self):
         return True
-- 
2.40.1


