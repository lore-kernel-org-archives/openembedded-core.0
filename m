Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.4942.1596803120456535137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 05:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gV6Py6cI;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id m20so1141780eds.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2cFPiHq+pO8a4SlCgzEB/ot/csizoDz+6EG3InlgwJo=;
        b=gV6Py6cIIMUONGA9U0hIM2OJZfMskvynUB+0ANUBBISQUnNj/Ne11eEu/GGknnO+if
         SGmbt9nwK2UtsU7wI5Wuj6YsXFvAajBiyOOxnzQ+SWtF1ZqHLLalYRVEEo1JNJtm1zyz
         QacsRJ+6lfo2qFQ2D3rDHBre7vAqFDizZFxYL2yRvOkk5JsYAYP1SSx53xFhea92LTv4
         BEQudvlb81cnlyRU/zjMjJQSRAzMpoV21Jdzw4VAuduyYr10SBGrs8WnCr5aBzu6vtRs
         5w/g7rLXbwzihTA56ghbQW6YIsIiQwiJn6QwNLHtLSQlFYrnZ18VMMBT7NRyzyhry1Tn
         2Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2cFPiHq+pO8a4SlCgzEB/ot/csizoDz+6EG3InlgwJo=;
        b=oMzDJ/eUVtFpqIfsqpwEAx8yl6vrZtfZrnWzLXjw6hiO3edxSifTrao6vIp7k4Jyjd
         ztqccLo6EpemP0BXco4RiTRKznBp+cZDuCmuYQLRJ3ByLT7y/vYHmWF2DWXaUxEiFJDe
         H2r+smMUUs3HWsW5xENevGUFHFn2AfWsSjq9HFm9rMRwBqfmoelFLbuSRmr0vNWA/Fxv
         uFF0Q77eRRxK6WdG+8y0hqVfDvk0XYdqFPUctf43jw3kKoIyUpPNgt+5khrsxERQCdjT
         KPoqs7KFqEzGtqtY1pYq2f9G6rIp7G+gGYHD4YPcWYdZH4sSPmnwQnk4vH3CjVFNK1hb
         OkMw==
X-Gm-Message-State: AOAM533LjygSIbqbXBoDjUyaDlphsZvuw9YV4bBznoVACRAHmHw7uX/Y
	uq4vqZQVsXDLPCqd99pWUNFMgoxD
X-Google-Smtp-Source: ABdhPJxafRcy/vM5eo6DhZ89AdCjuqyZ3B7waeZVOVHV4j6HDic+X9W9UGDMJ7oBjVrGHE1BqR1X8w==
X-Received: by 2002:aa7:d1cc:: with SMTP id g12mr8788291edp.385.1596803118470;
        Fri, 07 Aug 2020 05:25:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id k6sm583698ejj.41.2020.08.07.05.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 05:25:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] oeqa: write @OETestTag content into json test reports for each case
Date: Fri,  7 Aug 2020 14:24:54 +0200
Message-Id: <20200807122454.29750-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows using these tags for classification and filtering of test results
according to various organization-specific criteria, such as teams
responsible for the test, internal test ids, feature domains and so on.

Test name itself meanwhile can stay short and human-readable.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
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
2.28.0

