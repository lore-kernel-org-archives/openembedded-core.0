Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A967C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 23:26:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.33773.1671665195283535191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 15:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W0dpEWMz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id r126-20020a1c4484000000b003d6b8e8e07fso2492880wma.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 15:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Dpqo+FOiJihn+JHkDoZJY8kjC9IFOsGB5YcGgvjF+M=;
        b=W0dpEWMzfg0ZPoRNlcyy9wjKfNrunFvTbAe7J+OokWWWPq1Zsib7lCkqFRzjjQHmz8
         NhoIcGrWlnZkgrrW+MjhblO9/i1ldvOI2eBRq1Tg2qAveY54V3WjOtQegrcTB+LZXUQx
         nWO807+7+nRlK60EO/xDCwSlXYjrcdxUUHBpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Dpqo+FOiJihn+JHkDoZJY8kjC9IFOsGB5YcGgvjF+M=;
        b=6LT4wL5fC9ocjphmc868KoVgByHMmyYGE5tDi+OWoXHdIupFeV+h5v0df3mY494wv/
         SgSp6Dv1/CfIgG3fbDSh4EkTBlfXzs+mnHXDmuZb70szUeWAbd+AT1uCtdX6s3VFmQ5K
         lT8iwYMFSPkA9706btnthZIV29r20ld2Q0GGFnHnOvMs8sLDD9sakcxUL720PlEeP365
         yQ1nVKxwZqsJcLkrNLKGTFNOjTXNwh75DeIjL2CAN6KE65Wp+D7qYZTduFGNOJv/Iq0G
         uwed513P3taItOWVFQzL4vI6Z1DSET5oBPi8qofugm8eTWsIEDWz+Ddz6qbM9y7sr5p9
         e3/w==
X-Gm-Message-State: AFqh2kpm1uzlF0vWxMO9aCYUWnEipDZ9uxjNjmff0J+u6oLeCf1YXG6y
	rTGSqWWWcmFXf1lH7FMvt+5U6JVtO5TfxqcD
X-Google-Smtp-Source: AMrXdXsZQNBpkS/mIMOuVZY7fv5OM3IKuh95OLYG1IwxZDYPEcr/d8olZICwSYfowU0/bL0ZSQNfzQ==
X-Received: by 2002:a05:600c:3844:b0:3d2:191d:2420 with SMTP id s4-20020a05600c384400b003d2191d2420mr2903049wmr.7.1671665193291;
        Wed, 21 Dec 2022 15:26:33 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a8db:6d5d:f54f:c6b2])
        by smtp.gmail.com with ESMTPSA id s8-20020a7bc388000000b003cf894dbc4fsm3590846wmj.25.2022.12.21.15.26.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 15:26:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/concurrencytest: Add number of failures to summary output
Date: Wed, 21 Dec 2022 23:26:31 +0000
Message-Id: <20221221232631.518273-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 23:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174953

When running oe-selftest and seeing the end of a running log, it is
extremely helpful to know if there have been failures or not to save
looking at the rest of the log. Add the number of failures to the summary
line so that people monitoring builds have an easier time before the end
totals are printed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 383479c9597..4f77589b005 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -59,6 +59,7 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
         self.outputbuf = output
         self.finalresult = finalresult
         self.finalresult.buffer = True
+        self.target = target
 
     def _add_result_with_semaphore(self, method, test, *args, **kwargs):
         self.semaphore.acquire()
@@ -67,13 +68,14 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
                 self.result.starttime[test.id()] = self._test_start.timestamp()
                 self.result.threadprogress[self.threadnum].append(test.id())
                 totalprogress = sum(len(x) for x in self.result.threadprogress.values())
-                self.result.progressinfo[test.id()] = "%s: %s/%s %s/%s (%ss) (%s)" % (
+                self.result.progressinfo[test.id()] = "%s: %s/%s %s/%s (%ss) (%s failed) (%s)" % (
                     self.threadnum,
                     len(self.result.threadprogress[self.threadnum]),
                     self.totalinprocess,
                     totalprogress,
                     self.totaltests,
                     "{0:.2f}".format(time.time()-self._test_start.timestamp()),
+                    self.target.failed_tests,
                     test.id())
         finally:
             self.semaphore.release()
-- 
2.37.2


