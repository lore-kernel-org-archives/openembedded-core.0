Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9D17E79496
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 06:32:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id 20-v6so3572782wrb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 23:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xcl/wh0c340U+Smbv7jswlU1R1QDKkZKiaVbNbpWaQc=;
	b=EO8R4958IIxkj2ZMgiqEUrkxx9sk8/DdG77brQN8snVBhJUGaOOoCRI82ZJOtnpgBH
	RfWC72N5SGdqtjReWsKJ+Ub6gm7wJVtSCZcC8dLix3X+RQrur6klwY0r9mxbWpgmcvvG
	qZsOemu6/75P3/qSANf9UoFCtp/Eyz+c0jYFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xcl/wh0c340U+Smbv7jswlU1R1QDKkZKiaVbNbpWaQc=;
	b=nJvN4V8/NhDhwWIsExDScQoKqTZtpd0xNFQIGNNpHb/fL4lnr9h4AzJo0CjffrD2Sl
	MuVtzyPGTSJ0rwYpUwW5F5x78QDtPDmSebNWS3NY83AaaTy41L/pDnEEiqGTfWbuhois
	N6kj6d+r/gUBuyt9nyiglcf75zRiBzMJvORPrMPR4oq7UHRSuNNEWC2ZywGPXtW+TnIz
	6zRryihAgBrwrrGGaPJdUBmRdwxYLn3K2/xenGQ+29+JiNda0Rn2ds/73KK7w4sanzJQ
	b4uGCulTi7EsCMfw9OKVC7Rk+APaqVLGCjbbqXnKky1wHGv1uOkMxr6BnpK552IVkAQx
	Ppog==
X-Gm-Message-State: AOUpUlFHuCqqJP0hvO0bHbOF/8rWDxBnmiz83evjYJ2Gh4jqd5OiPaEB
	oN02ljTIShvHgKpjnSul4d819vZNWU0=
X-Google-Smtp-Source: ANB0VdbTwk6sjIzW56a35T8Oeq/JDuKWO6Tvz/xMpZHgt5jd2zDhjagzDKec9SQm6LEDooub95CQlQ==
X-Received: by 2002:adf:9ae5:: with SMTP id
	a92-v6mr10843460wrc.125.1535005939132; 
	Wed, 22 Aug 2018 23:32:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x125-v6sm4456779wmg.27.2018.08.22.23.32.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Aug 2018 23:32:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 07:32:15 +0100
Message-Id: <20180823063215.24514-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180823063215.24514-1-richard.purdie@linuxfoundation.org>
References: <20180823063215.24514-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] oeqa/runner: Print any errors/failures early
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
X-List-Received-Date: Thu, 23 Aug 2018 06:32:18 -0000

Its a pain to have to wait until oe-selftest finishes to see the
failures for example.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 73f41d9f1cf..eeb625b7ff7 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -56,6 +56,14 @@ class OETestResult(_TestResult):
         if test.id() in self.progressinfo:
             self.tc.logger.info(self.progressinfo[test.id()])
 
+        # Print the errors/failures early to aid/speed debugging, its a pain
+        # to wait until selftest finishes to see them.
+        for t in ['failures', 'errors', 'skipped', 'expectedFailures']:
+            for (scase, msg) in getattr(self, t):
+                if test.id() == scase.id():
+                    self.tc.logger.info(str(msg))
+                    break
+
     def logSummary(self, component, context_msg=''):
         elapsed_time = self.tc._run_end_time - self.tc._run_start_time
         self.tc.logger.info("SUMMARY:")
-- 
2.17.1


