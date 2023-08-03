Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A69EB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 17:47:32 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.858.1691084847066575667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 10:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=jVICLlxO;
 spf=pass (domain: baylibre.com, ip: 209.85.222.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76c9334baedso82520285a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691084845; x=1691689645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GaNewZqIuv3iI2jq2IrnZ9kXur4mnQOfuCz/yHgifiQ=;
        b=jVICLlxOyQ9EMspfSgMuf3S7YTuki+uBkpc0EZXpV2ef8De55Fovhs4maEYEJZfIc5
         Pm+9HviGd8KccE9eUAuFw0BQmKZhMRk7KvJSxp32ryx2WMEcRgRQ7xeMiOTZsj1OSWTg
         dmQMusx4RWId+pcrYexw98BAr5U/pLSPe6q+GJlIW+pZH4l65EIPdS14thmr/ZAxvMOp
         WSA2q6WIbvOb6JcgxX4lQyz6Vi1N1Ql0p+Xy6FsPPSWD89U1YYHj5bLsJnhWRMr26s8A
         yOSQjflgxitNYvdIpTwVFnXLud4EotQbVGHJc3Rw8snjSXszpqtLzTjavns2uUkGonib
         eqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691084845; x=1691689645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GaNewZqIuv3iI2jq2IrnZ9kXur4mnQOfuCz/yHgifiQ=;
        b=YW5po4eXrWdqxb4XLJ/NxKGe2G/9zbopL6/mR81EIRuoqJ+0Qg/T7gvDuYJOhLhmXs
         bRMv1ERw75robnjuSKf07bPOWRaECh0yRc1/7HHkR/9ufsLdsdqdQYd20L3N+cYC8D+m
         m0/VfkePzo2vBo8pAwTZat7X6ChfnjRuj0RMXdjTzExh4fLWbR+7AVVfYA4HVfFsmiu3
         5ACinu9fiKQLomJdaAbhBetamzAU4/5UzMvqPwIH9XnNE8RJAEnFf05sW971KKnhVXtL
         FjlQBQC+9BHn69Ze85vZWna/tTVpAgndBEghuouL68rBFLIMxHcciF62cvk7IOkuChln
         Pd0g==
X-Gm-Message-State: ABy/qLbg4OJE7o0ALDEJMyYD/fD1Ft02NzJ8k6UiXNqvsKSX7nLf9it0
	qs4fBf+UOqTgJtJXjJlheIUS4O9AByJZJvHrUuk=
X-Google-Smtp-Source: APBJJlFgwgbAgnwbSyrA6RIHbZP+PCoaVu5V4PQlEBfPfKTN4wT3WeLmYgutyZs/4/jrc6RjOwrBzQ==
X-Received: by 2002:a05:620a:1a06:b0:76c:d4be:7c93 with SMTP id bk6-20020a05620a1a0600b0076cd4be7c93mr5526560qkb.20.1691084845274;
        Thu, 03 Aug 2023 10:47:25 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id y4-20020a37e304000000b0076827ce13f6sm74167qki.10.2023.08.03.10.47.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:47:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: add additional timing-related test skips
Date: Thu,  3 Aug 2023 13:47:24 -0400
Message-ID: <20230803174724.1107094-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 17:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185490

The following tests have been seen failing intermittently on the
autobuilder:

test.test_multiprocessing_forkserver.WithManagerTestBarrier.test_timeout
test.test_time.TimeTestCase.test_thread_time

Since these could be affected by AB systems under heavy load, disable
them. New test outputs:

test_timeout (test.test_multiprocessing_fork.WithProcessesTestBarrier.test_timeout)
SKIP: Test wait(timeout) 'timing related test, dependent on load'
...
SKIP: test_thread_time (test.test_time.TimeTestCase.test_thread_time) 'timing related test, dependent on load'

[YOCTO # 15131]
[YOCTO # 15177]

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...sts-due-to-load-variability-on-YP-AB.patch | 43 +++++++++++++++----
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 61dd4a5bc0..a7d37266ef 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From 01e02fb4720ecbbc44c694ee1b7fb6d5d95b5fe2 Mon Sep 17 00:00:00 2001
+From 0c8002d12149fdfbbcd9a9215876d474f157eb9c Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -11,16 +11,22 @@ Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 
+Skip two additional tests due to suspected load variability failures.
+
+[YOCTO #15131]
+[YOCTO #15177]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- Lib/test/_test_multiprocessing.py | 2 ++
- Lib/test/test_time.py             | 1 +
- 2 files changed, 3 insertions(+)
+ Lib/test/_test_multiprocessing.py | 3 +++
+ Lib/test/test_time.py             | 2 ++
+ 2 files changed, 5 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 599c3f2..23328be 100644
+index b50a154320..b8b2c4204d 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -618,6 +618,7 @@ class _TestProcess(BaseTestCase):
+@@ -618,6 +618,7 @@ def test_close(self):
  
          close_queue(q)
  
@@ -28,7 +34,15 @@ index 599c3f2..23328be 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -4890,6 +4891,7 @@ class TestWait(unittest.TestCase):
+@@ -2003,6 +2004,7 @@ def _test_timeout_f(cls, barrier, results):
+         except threading.BrokenBarrierError:
+             results.append(True)
+ 
++    @unittest.skip('timing related test, dependent on load')
+     def test_timeout(self):
+         """
+         Test wait(timeout)
+@@ -4890,6 +4892,7 @@ def signal_and_sleep(cls, sem, period):
          sem.release()
          time.sleep(period)
  
@@ -37,10 +51,10 @@ index 599c3f2..23328be 100644
          from multiprocessing.connection import wait
  
 diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
-index 884b142..542e980 100644
+index 884b14231f..8f0638c0d7 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -492,6 +492,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -492,6 +492,7 @@ def test_perf_counter(self):
      @unittest.skipIf(
          support.is_wasi, "process_time not available on WASI"
      )
@@ -48,3 +62,14 @@ index 884b142..542e980 100644
      def test_process_time(self):
          # process_time() should not include time spend during a sleep
          start = time.process_time()
+@@ -505,6 +506,7 @@ def test_process_time(self):
+         self.assertTrue(info.monotonic)
+         self.assertFalse(info.adjustable)
+ 
++    @unittest.skip('timing related test, dependent on load')
+     def test_thread_time(self):
+         if not hasattr(time, 'thread_time'):
+             if sys.platform.startswith(('linux', 'win')):
+-- 
+2.41.0
+
-- 
2.41.0


