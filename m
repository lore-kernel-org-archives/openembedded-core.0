Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D925E6FE3E
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:36:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.22947.1695393396580301900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d3qhdgni;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-401b393ddd2so23000395e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695393395; x=1695998195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXMAd4rP1T9gODN5348NTFHbz2wKi52g6KLJPLCl76A=;
        b=d3qhdgni5BgMl6LBYVjpUOe7N9HVs+CrFh2i+twUtKzSQ0pcVAsZtiG+jid3FMIQHb
         KaKpKtHwgpYpVhNzbmy+1sRCYWO1CUdbrewxSKFd8Zj1UvxS2/7iVaO5C0kELJhdKwpd
         eFrZz4kswcVs3eylbaPYbcha+Hu6co+JBUGws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695393395; x=1695998195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vXMAd4rP1T9gODN5348NTFHbz2wKi52g6KLJPLCl76A=;
        b=KpiM/ZatF3Lj3PLvwsi//NIjPfn7vqPLsR4mO/9KascJdInMUU3HpLcOb5G66uVD94
         muNenC/YFweUAzoQseYgyouYJjPh2/PLzZnbwURmXQwAzQH4zl2vrB6chBW0zXf5+OKZ
         8+XzUiHD0ZiJtJBiTfk0b42H+LG82/RhMnRrcS0jVnLFwAtQe0x4E2LrhSE1gFjJM32x
         KnDN+ZiWxg0O2QbMFlt9f7Kj1BGQWxO741+qwyK89dmHYlFsEQkTGawvB6MHyRhG7TqU
         xPpoM3i1tVzRc4CVz3ERqauICW34u9Au6TwDZE98bJlp79MXelIpZUwZQ/V/1obH/0M1
         Ed8g==
X-Gm-Message-State: AOJu0YzQjpqUjpY63u77dbnhBeRnWMVZIUVC22czX3fl/VRhIqLG9GaA
	UOY1HwFMwOl6Fab+tBJ5PCOVFepLjAR5k5EoESo=
X-Google-Smtp-Source: AGHT+IFxhMxQhHt4SHMcofoxQQ9nOhIee09/b+gp3vqSPDUQ/0XXz2yWMYcott9LYXxL3w290rKoCQ==
X-Received: by 2002:a1c:7c1a:0:b0:401:d947:c8a9 with SMTP id x26-20020a1c7c1a000000b00401d947c8a9mr9252332wmc.19.1695393394584;
        Fri, 22 Sep 2023 07:36:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm7675025wml.4.2023.09.22.07.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 07:36:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runner: Ensure class setup errors are shown to bitbake logging
Date: Fri, 22 Sep 2023 15:36:33 +0100
Message-Id: <20230922143633.1468118-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188102

This took a bit of digging but failure messages from testimage are shown to bitbake's
logging through stopTest. In the case of a setUpClass failure stopTest is never
called and the bitbake logging never sees the error. It would still be in the task
logfile. Add some code+comment to ensure logs not shown to the user mid stream are shown
at the end.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 5077eb8e3e3..a86a706bd96 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -44,6 +44,7 @@ class OETestResult(_TestResult):
         self.endtime = {}
         self.progressinfo = {}
         self.extraresults = {}
+        self.shownmsg = []
 
         # Inject into tc so that TestDepends decorator can see results
         tc.results = self
@@ -74,6 +75,7 @@ class OETestResult(_TestResult):
             for (scase, msg) in getattr(self, t):
                 if test.id() == scase.id():
                     self.tc.logger.info(str(msg))
+                    self.shownmsg.append(test.id())
                     break
 
     def logSummary(self, component, context_msg=''):
@@ -169,7 +171,6 @@ class OETestResult(_TestResult):
 
     def logDetails(self, json_file_dir=None, configuration=None, result_id=None,
             dump_streams=False):
-        self.tc.logger.info("RESULTS:")
 
         result = self.extraresults
         logs = {}
@@ -193,6 +194,10 @@ class OETestResult(_TestResult):
             report = {'status': status}
             if log:
                 report['log'] = log
+                # Class setup failures wouldn't enter stopTest so would never display
+                if case.id() not in self.shownmsg:
+                    self.tc.logger.info("Failure (%s) for %s:\n" % (status, case.id()) + log)
+
             if duration:
                 report['duration'] = duration
 
@@ -215,6 +220,7 @@ class OETestResult(_TestResult):
                 report['stderr'] = stderr
             result[case.id()] = report
 
+        self.tc.logger.info("RESULTS:")
         for i in ['PASSED', 'SKIPPED', 'EXPECTEDFAIL', 'ERROR', 'FAILED', 'UNKNOWN']:
             if i not in logs:
                 continue
-- 
2.39.2


