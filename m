Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id EB51579DA8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:39 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b5so1670621plr.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CZF6dJDKlt1kKSul/w4MuEBZZuejjJStx9EbrN4LnXs=;
	b=lfGwfHivlcmSjCsTm+eeLM4V9qtFXS0f/4Ypbf3ljHkykU+uOg/GzYAtCllW0YPfch
	h9dGZAynDUddG/VfDgnGMy2Fb55Er+6WDpxEc+WLWji36GKK6xggpTVjXoiPAGEGQLi+
	yj6UVgZ6N7DK6koDy5tGQqJp7sRzO/r68t9C1L7or1wL9Ep4XvpSemTxLzULEHAsvtvx
	TRrNfN8vj+M7S35npVAyzXCS3+46PtlvaFbjA/WI/BlPGTkztNHyADbKI1mIbaHC91wh
	fcUDPXUlJj60PFiQREgb9vAxBnXePLFB1eBebcefuKdV8RT4LDX13V98u5Sv4t4npSwn
	VroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CZF6dJDKlt1kKSul/w4MuEBZZuejjJStx9EbrN4LnXs=;
	b=LLhGn4POZ0QM0PPJPJw7aQZic+yhExtx2MZVFX2TLpjIQ2y3pZ4uRHvnF1x7X1fo4t
	8IXUy7bjvFA/PH7RykRM/hPCHg6cu3+K+I5wNX1oyXZQ3hq/FFU6t/f47X1DHzYwENhL
	e/UFBgD7bKZobU57qTRynQsKCkxtWzY0UnLbZeZSSRBlHefVEU9gw4eFCnVQ/Ye05D+S
	GfVWg+tDZc+DJ6XyjPGJ2W4DL4QpVkn4yEPUOUvNujJxw5j+tPrfG7r3+kEsq1a5VhXf
	rcI/CXr1Uh6a8yf7WFRCDce121Lj2HEJMCj4ySl6Mv10Gw4X6VCQfvLvBHbSByDI+7zP
	/rjQ==
X-Gm-Message-State: AA+aEWaMzvbB0jGX8rvmgsmJFHKFeFDLIBVO5/rnBqKXLe2X008vsrAr
	Q1boXsWd/VH29BalFq8ETObcE63Z
X-Google-Smtp-Source: AFSGD/WnrC9zH0GAXCFRi5MeRzj3nwfzLrlzofX8loKull/2e3qLcXNDPZqRHQd/pxCcywPqbnCkfA==
X-Received: by 2002:a17:902:6e0f:: with SMTP id
	u15mr412999plk.175.1544737181065; 
	Thu, 13 Dec 2018 13:39:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:41 -0800
Message-Id: <9c5f70fbc13a7d3198310998eab1719b8441388e.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 33/45] oeqa/runner: Always show a summary of success/fail/error/skip counts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2018 21:39:40 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its useful to have the counts of success/failure/error/skipped at the end of the
results to allow for easier human reading of what happened.

(From OE-Core rev: 5942318a261ce7a885f351e214669068ff9d8931)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 9a64e49..0cb1a95 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -61,9 +61,7 @@ class OETestResult(_TestResult):
             msg = "%s - OK - All required tests passed" % component
         else:
             msg = "%s - FAIL - Required tests failed" % component
-        skipped = len(self.skipped)
-        if skipped:
-            msg += " (skipped=%d)" % skipped
+        msg += " (successes=%d, skipped=%d, failures=%d, errors=%d)" % (len(self.successes), len(self.skipped), len(self.failures), len(self.errors))
         self.tc.logger.info(msg)
 
     def _getTestResultDetails(self, case):
-- 
2.7.4


