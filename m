Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.5191.1592861906772528414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 14:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MuLQTB2N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id y20so1082649wmi.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 14:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F8j6HNBnOt+jB4zJX3yacGdHapbLiqZJ9CteU8X0mbQ=;
        b=MuLQTB2NhHXqX230uUZpMdhg5NBPp+pQTBWJ15/WFQbGABC+SpYbrhV3uG40Dmj8P6
         Cg+0FeeIK4s1jsswCHqq4XHhv41zXIy2sFkkjkvPmcQ/Wiw6tNF+ADrp+bJw9tZqieb9
         R9tpa39Dx6YM1xApa4O71gL/NyT5tylUYNjvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F8j6HNBnOt+jB4zJX3yacGdHapbLiqZJ9CteU8X0mbQ=;
        b=QKcrbYD254oXTK7WpyHN+9b3lA2ln/5FrQ6nk+AMTfyvg61DgGfDL35rs2e21jO8hk
         IkhKRzVShNFzeOykKhAewZFpZ8bDPAd13PtmZXo4q4B7CBdv+WOsZlceJWksrUQekmSs
         9qcH0TJtgY4faOv28E6sr14z4gXpDvDHJ3jbqbjPHhDAYJOLAJ1m1tN361lLz7wl9mU7
         tu1TRIBc3K57tvJTb2E8n6QcpC2dv1mh2+4syjSNel/s7Pxyt32FZFk2XP+9YpV9YGWg
         XHv2/KpJBmOkB4aCbyaQMynos8r9rkyWdedNGLu7kKiBawrx3hbKKzuntbmCN5GoiyDN
         IXfw==
X-Gm-Message-State: AOAM530qDVQeQWjrJN6JF++QstcSKQnWSbDEjlVYIZxicjr7kS5Vc5b/
	8Wt2QeEUbEfeZfGnz556tKZsmpGSnu1/Uw==
X-Google-Smtp-Source: ABdhPJyHpzsmaZ/mwX2L0HjkQOE8leOVtEvn8Su+EjJkpghKMDkxDQGIUIBdcwZ7pa3OVbrkGsgxBQ==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr5158833wma.76.1592861904810;
        Mon, 22 Jun 2020 14:38:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l8sm19386911wrq.15.2020.06.22.14.38.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 14:38:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/runcmd: Add better debug for thread count mismatch failures
Date: Mon, 22 Jun 2020 22:38:23 +0100
Message-Id: <20200622213823.575962-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index 3755764ee71..a5ef1ea95fa 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -81,7 +81,7 @@ class RunCmdTests(OESelftestTestCase):
         self.assertEqual(result.status, -signal.SIGTERM)
         end = time.time()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
-        self.assertEqual(numthreads, threading.active_count())
+        self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
 
     def test_timeout_split(self):
         numthreads = threading.active_count()
@@ -91,13 +91,14 @@ class RunCmdTests(OESelftestTestCase):
         self.assertEqual(result.status, -signal.SIGTERM)
         end = time.time()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
-        self.assertEqual(numthreads, threading.active_count())
+        self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
 
     def test_stdin(self):
         numthreads = threading.active_count()
         result = runCmd("cat", data=b"hello world", timeout=self.TIMEOUT)
         self.assertEqual("hello world", result.output)
-        self.assertEqual(numthreads, threading.active_count())
+        self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
+        self.assertEqual(numthreads, 1)
 
     def test_stdin_timeout(self):
         numthreads = threading.active_count()
@@ -106,7 +107,7 @@ class RunCmdTests(OESelftestTestCase):
         self.assertEqual(result.status, -signal.SIGTERM)
         end = time.time()
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
-        self.assertEqual(numthreads, threading.active_count())
+        self.assertEqual(numthreads, threading.active_count(), msg="Thread counts were not equal before (%s) and after (%s), active threads: %s" % (numthreads, threading.active_count(), threading.enumerate()))
 
     def test_log(self):
         log = MemLogger()
-- 
2.25.1

