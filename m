Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.37306.1597028425966157584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=R4JzNCtV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id g33so4104903pgb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rNRNNdhAzp6mSzE89l3fzApAdgGvzgjxElZ8NgJ2rZ0=;
        b=R4JzNCtVSDZFmhLZsPQqMPMVT9nlMqkTsEmNSmZasYRO4r1QkzHITfxAppHJyuXHru
         fkpzIWVn0VzImScKaB0x+2efjupTLKL2OwxOjW7s+vRTzzoGv7vKJIH0JhKkCoqqA3yV
         CWE1aPfe0kSBtcJz2FAO6YS8AqbEbButKRZQ+akp20ljFsY1ietUYC8svolXmseC5hxu
         wSWYfrUAKmem9FsmGD+h1RbFPZRWC+lp5YmRUleqoKPHlGHtTSUGvmJblpKU4DI6fzqC
         4r1U2yFD1Mkfkr+ORuI45QJdOPpwL5zC5ZKfqT3dbI4zo5BloCYx2KAWpkvUS6+5iRLO
         EOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rNRNNdhAzp6mSzE89l3fzApAdgGvzgjxElZ8NgJ2rZ0=;
        b=nWevMgOh2TohaRO74HJGfLWVjBrQ7fgZpCQgF2bqV0GHw6A7uFvjC4nVEpLvxO2O/E
         hRyoO+tJRn0dTWCcyLYDBhVLYVtJmPRwBpRf0Jj1O7Tbo86OYpS/2FXqKwegQTybVuvx
         arMiiufupm1380/MW+2gr4FY3gnzrnrnqVBhTGAuvx7iK2rt8Y61a5xclCOGsPb7ECIC
         mc/+EuThZ+aTeuESsG86pPuHrVmKK0keawm+/XiLx2X0gHjD1D9h4nQTN9c8dn/r78h6
         mOLjJLE6wYlWYQSlTKetYCZpIMPKU8Gt9PDSv82NxWo6w8weMf2tfO75MS0tmfHvZGzn
         JnnQ==
X-Gm-Message-State: AOAM533wNggq9gFBbwd4BFFRppZ+0qAs2x8kzSJtEqvjl3Ev/YmOxBqK
	8VZHVISSk9PV8HXENoserzSje2BgRXFrxg==
X-Google-Smtp-Source: ABdhPJwX3wY5iJC1HHPU9zvzDx4EEv4R1erc/qSyIw7rokOkZaMG6F3NQznHepvc5oAlJExKpO/5ow==
X-Received: by 2002:a65:60cb:: with SMTP id r11mr20684498pgv.131.1597028425158;
        Sun, 09 Aug 2020 20:00:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/19] oeqa: write @OETestTag content into json test reports for each case
Date: Sun,  9 Aug 2020 16:59:24 -1000
Message-Id: <9eaf11657cc8304af5cb75f98decbc64cca37801.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This allows using these tags for classification and filtering of test results
according to various organization-specific criteria, such as teams
responsible for the test, internal test ids, feature domains and so on.

Test name itself meanwhile can stay short and human-readable.

(From OE-Core rev: 3801b126eb52cd46efe417111afcd27f05d8f72b)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/runner.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 00b7d0bb12..d50690ab37 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -195,6 +195,20 @@ class OETestResult(_TestResult):
                 report['log'] = log
             if duration:
                 report['duration'] = duration
+
+            alltags = []
+            # pull tags from the case class
+            if hasattr(case, "__oeqa_testtags"):
+                alltags.extend(getattr(case, "__oeqa_testtags"))
+            # pull tags from the method itself
+            test_name = case._testMethodName
+            if hasattr(case, test_name):
+                method = getattr(case, test_name)
+                if hasattr(method, "__oeqa_testtags"):
+                    alltags.extend(getattr(method, "__oeqa_testtags"))
+            if alltags:
+                report['oetags'] = alltags
+
             if dump_streams and case.id() in self.logged_output:
                 (stdout, stderr) = self.logged_output[case.id()]
                 report['stdout'] = stdout
-- 
2.17.1

