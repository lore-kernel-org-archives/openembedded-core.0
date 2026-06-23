Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290F0CDE000
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20455.1782220481046041156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n5nZXsCn;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso9844605e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220479; x=1782825279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FztXDc0Ggh+2S1cZPE/sTwbrlJIo+v4a+px6yXZO+4s=;
        b=n5nZXsCnq2ozkKYO2+h2Bjmq3TNwpPFBOv4AjcIx9psysPRzDgvZ89iF2RDiElzaN+
         Abi3JeWMLzj99EIwpjNqVTFPrsQeoJb2yg8kwVpMlD0Nky7IhmvSst5pefdvHWmfA8pM
         nbhNg50xrNWwB02kN3eHXNlmcR3DTHUz154mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220479; x=1782825279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FztXDc0Ggh+2S1cZPE/sTwbrlJIo+v4a+px6yXZO+4s=;
        b=H3om9jVbbvhE+ZruVup8CjAyNL9mFGAMc43D0W0oQsgku8zpYWEIr1duuPUNMcTKLK
         HY48PL6Upe2fAwiKVt1JU8Rm+9DCZNjEfvJf5EQ2WA+TXj4gnS2E/hJ7324SGgFfv4Mi
         7pEkU9Qv0M5tP/kmnYm+Oth89vxex459C5aOmJscDZXiD9/FO2YxpnnoP77EWaDZdD8j
         tW4ZXK+Xe6FyD+EFzBuJdxFVDoO8yiLFe1xuuOOXQwUDcoRpnEq8IGtYspSWepZ68y+L
         ix5SUNxefi9spORToHTPGDeJzHQE97DRjaFt9KlEejhGbCn8lhFp3ar3OokrAmIzBSqj
         0V9g==
X-Gm-Message-State: AOJu0YzwDYL0i7ZXl24UisZq4RT2OdVi3MA7Y1cprfPPr3PapGft2Lcj
	GEX8FJg5phXPCktyfkHy3OeG1vGGWOQ4lxQjTHlk3M+fSTb3LIO196DOpsuAR8m28q7tfQIBEJE
	1H/Hv
X-Gm-Gg: AfdE7cmUpsDcrL7n8LrEo45FbYmp/HJqVS3Nkh4+JU/Cp/ltD8BZ7k2lc4yLl/sKRtj
	MbXEewRcKO07+Qir/BE3w8XJN9BJj/Z/fkVQ91bH6EZiutW2VnB1CZ9ApBj451UHZ1m2UGfxN4q
	mWsne+d49e/P8Jvxz2IpGwF0p7KuelRUng7EFmsrgIaO8XrCqtH8Rl+pktiozMFsT5B49IBzRb1
	Mhm7TbpMPi8ETJUikP97IndDuIdZjZ1orjKT3lPfkCYq6S05sjlYMXgYbzvSSiPVJ7xM4UmNFRx
	C1Oed1TZREoDnckRBhvzluFLBZPoc8P9iW9X196k2J6EIDAlvegGVkTKx4asAd/muXn7BvNY1B8
	auRQHOvaW3j6M5xP0FKJA3/slrDC/aYJt8k3UpeZzuVN1uD0m5pdvWib5FIsq4cJ4l64a5BY0kJ
	/aVC3ymrsvA3gudyYgA562F9bDioZzRfSmjC3BcWCtPz6GM1DbeN5nbx+I/jeYpcyL2YlFTNA+W
	xjJ0d1KDiPRLztIjw==
X-Received: by 2002:a05:600c:5287:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-4925a0a775dmr47833035e9.5.1782220479308;
        Tue, 23 Jun 2026 06:14:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/26] oeqa/core/runner: stub addDuration in OETestResult
Date: Tue, 23 Jun 2026 15:13:59 +0200
Message-ID: <9105e2bbf3245bfa02d2f4c55a010a7d2c3da6c2.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239384

From: Ross Burton <ross.burton@arm.com>

We have a custom TestResult implementation, and Python 3.12 added a new
method addDuration() to the TestResult interface.  This would be useful
to implement correctly, but for now stub it out to silence the warning
when running under Python 3.12:

/usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no addDuration method
  warnings.warn("TestResult has no addDuration method",

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d6fff81b34476b890f6943997615fbf8d3d133f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/core/runner.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index b683d9b80a7..0d2bc3a3ed0 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -78,6 +78,10 @@ class OETestResult(_TestResult):
                     self.shownmsg.append(test.id())
                     break
 
+    # Python 3.12 added this, stub it out for now
+    def addDuration(self, test, elapsed):
+         pass
+
     def logSummary(self, component, context_msg=''):
         elapsed_time = self.tc._run_end_time - self.tc._run_start_time
         self.tc.logger.info("SUMMARY:")

