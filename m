Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.13422.1619796885129256588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=d6uy6ivT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id v20so9524258plo.10
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oUi+EOqHTQya0lo8iey56+hwWij33RvUVMXIaEtpaKc=;
        b=d6uy6ivTje3tzl7tHPLgZTrp/Y+NCyEwtyuAnZNM4Q29ApmYZmS1TL9xZ+DcNrbuxn
         jtorB/M+3F4nggvYybyBxT5D/judJsEkpBq75VeIKUL6PIVwh4zFj+SF+k7hzxFIftg1
         C2uNwPDEzYL2kdC/dormIPtgl7v1jPU+8oZPNJ1u6DlgsgPaNHFKwtCYC7M5dhYIDkzx
         y7QbYXq4q7X1baytbPf3AF8jkZLrWGEepEKRsbNyU5cj+0Mzd3VoCDYn+xupyUc7xBem
         6Isl2TdyGzKkaW/a6JP4CLupR0jw1a9DADqEciLkPYkx6PFCxDE8CsvRjpXsSUfAQ+s7
         ueSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oUi+EOqHTQya0lo8iey56+hwWij33RvUVMXIaEtpaKc=;
        b=llz9KJ2jQhumhJo8rR6B8PbPunhsRRv3MMc71EuzASNTCSxOVre1N26J6MMLT8lZZy
         G6OMP4WzJudhcQbNnd7nauMb+ZXbr34jb/smZr9dhzDwSu6YenYuynAg9z6scnBZdkJm
         GUE50yIqD4uMAL8yB3Pp+T13ggdT5vvIlJGjGb63/E/PvUjE7dZuvSTF2dgkpb4oEqFh
         T+EcXWsN4no2eA+Mq784n2JDHIzLxmesgVQV9Kj6L3DZrUdCCprV1PFO+vyEQ/ATgfrE
         lUzSuMd4fSne2aJgfEv2g0/xhzGGmo1E5ZpMXSYlnlKvdZkr0pu+PHXUlMiym4EFSkyC
         na+w==
X-Gm-Message-State: AOAM531EwOsZUKE3Muu3sItXcJ8QvVvX/oBvX8n/EjDYhJdnwAKs20We
	9T92ok7u6w95rBlmr8bNDda/UkZBHCLXrsaE
X-Google-Smtp-Source: ABdhPJwT2NGVHFJxCVIDpYOEJbSvzw1bJzPi9lYHoL369Ojt5GpTYGHTZIeLXd7r1RoSMo6crgyKLg==
X-Received: by 2002:a17:90b:4a04:: with SMTP id kk4mr6282221pjb.68.1619796884211;
        Fri, 30 Apr 2021 08:34:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.34.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:34:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] oeqa: tear down oeqa decorators if one of them raises an exception in setup
Date: Fri, 30 Apr 2021 05:33:43 -1000
Message-Id: <d004c39ae70077c2c6f59afcfdecb6e9378cf692.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Some of the decorators need proper cleanup, such as OETimeout
which sets a signal handler that needs to be cleared via teardown.
If this is not done then the signal gets called later with unpredictable effects.

This can be seen if there's a test that is skipped via a decorator and sets a timeout
at the same time: the timeout isn't cleared, and is invoked later in a
completely unrelated context. The test case for this is added in the
next commit.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f42a08e1aabf1ca57e0c09d69fb69cc717c7f156)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/case.py                | 9 +++++++--
 meta/lib/oeqa/core/decorator/oetimeout.py | 5 +++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index aae451fef2..bc4446a938 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -43,8 +43,13 @@ class OETestCase(unittest.TestCase):
         clss.tearDownClassMethod()
 
     def _oeSetUp(self):
-        for d in self.decorators:
-            d.setUpDecorator()
+        try:
+            for d in self.decorators:
+                d.setUpDecorator()
+        except:
+            for d in self.decorators:
+                d.tearDownDecorator()
+            raise
         self.setUpMethod()
 
     def _oeTearDown(self):
diff --git a/meta/lib/oeqa/core/decorator/oetimeout.py b/meta/lib/oeqa/core/decorator/oetimeout.py
index df90d1c798..5e6873ad48 100644
--- a/meta/lib/oeqa/core/decorator/oetimeout.py
+++ b/meta/lib/oeqa/core/decorator/oetimeout.py
@@ -24,5 +24,6 @@ class OETimeout(OETestDecorator):
 
     def tearDownDecorator(self):
         signal.alarm(0)
-        signal.signal(signal.SIGALRM, self.alarmSignal)
-        self.logger.debug("Removed SIGALRM handler")
+        if hasattr(self, 'alarmSignal'):
+            signal.signal(signal.SIGALRM, self.alarmSignal)
+            self.logger.debug("Removed SIGALRM handler")
-- 
2.25.1

