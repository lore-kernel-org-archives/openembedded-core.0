Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6586C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 17:10:18 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.2603.1715188217695933270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 10:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=YrfzmGSl;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-792b8bca915so57849285a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715188216; x=1715793016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyqr6otg8fLh+GlG4Ng8E7HyY6TB5eAHC4xjpdW/cDs=;
        b=YrfzmGSl0TVdVYpGKOQCN8l8GzanbzA/H0QzGutLnw/JJ81cXtjGVfOOoExRz8MrrA
         EVNydWnxklDtK6j9w+FGoj3VZv24kliQRvt5a6AFGDPlq//E1InDm+Gku0St7dVNKIY4
         jjBtjtfbxKuMyYbJQATZWE3g04MzTP9jDkfSlfXMljh1H/uApGq3RMC32NeiK2GydzX+
         XJm7rpfOjOQfsUencTdj1evb+cs/WO/AzN5qJhbDbKzuhTWpnygtafuRvyM2YGslKQXG
         dw2QefczQ/2B7I6pbh8WeanPYs3n/Y5iuERNSDyIYF3SvTZhG7uU3Q4bG8nbtwxXBZ/A
         E7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715188216; x=1715793016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyqr6otg8fLh+GlG4Ng8E7HyY6TB5eAHC4xjpdW/cDs=;
        b=iwayQ5ClEgMdp35lRrfN0h+DZch8zgD6Nm8UHoD5TKOOSIX8MEQqQDs2vuMUSAPoAm
         9fuTLTrT/tlEfrtFJfpUf96b0MNAwpNLZDH4wtqyX9h+o2B2QOlCJgy3mi0M24loah8I
         qCEdoVwDYEp8ZDn2clq9n85W8aS9z3yC0UVEqyjGLGRw4QEhPwQYoLw9GlVvIaXYOmkx
         OjMoW4PyUtg8XLwHIQNuL+8Uhs/dz8YpNZs+9UoM9DSeLSv1uHNBF0hbfiRN8/Q8NiLW
         a9bUvCEQaCmentLHZo6vl91mSQCx3PvBflP0YVFfUbTlOkcfQiZvvdfXW72cj6HKNrgr
         Ysig==
X-Gm-Message-State: AOJu0Yyct8+d9zc6RSZsnNDlBe0I+zgX3FrU2U+mZB+QJdg2whb7mbSO
	lOEGLQt4ojCWTFB5iB+tAGFHM1QfpPwTyMO81mNjo1kPsq9uP3T6pLuNhznHnRytPG+W3CogR2o
	T
X-Google-Smtp-Source: AGHT+IGbBB1EBvSRpAw0HRzHjixqbosKcX9wpdf1wNDNBUYvsN+uUjo0jP1KZwEFow1Z6zLTFVeL8w==
X-Received: by 2002:a37:e31a:0:b0:790:f387:c2bb with SMTP id af79cd13be357-792b275c3c5mr355756685a.14.1715188216196;
        Wed, 08 May 2024 10:10:16 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ay10-20020a05620a178a00b0078d677e72f3sm6094165qkb.118.2024.05.08.10.10.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:10:15 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: skip test_concurrent_futures/test_shutdown
Date: Wed,  8 May 2024 13:10:14 -0400
Message-ID: <20240508171014.2679217-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 17:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199129

These tests are causing hangs on the Autobuilder, so disable them for
now.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...-test_shutdown-skip-problematic-test.patch | 46 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.3.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
new file mode 100644
index 00000000000..1d4cda18b16
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
@@ -0,0 +1,46 @@
+From 9d4cdbde100798ba9fa1cf3f82dbaf18fd10a543 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Wed, 8 May 2024 11:58:09 -0400
+Subject: [PATCH] test_shutdown: skip problematic test
+
+This test hangs frequently when run on the Autobuilder. Disable it in
+testing until the cause can be determined.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_concurrent_futures/test_shutdown.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Lib/test/test_concurrent_futures/test_shutdown.py b/Lib/test/test_concurrent_futures/test_shutdown.py
+index 7a4065afd4..6b878a48bf 100644
+--- a/Lib/test/test_concurrent_futures/test_shutdown.py
++++ b/Lib/test/test_concurrent_futures/test_shutdown.py
+@@ -20,6 +20,7 @@ def sleep_and_print(t, msg):
+     sys.stdout.flush()
+ 
+ 
++@unittest.skip("skipping problematic test")
+ class ExecutorShutdownTest:
+     def test_run_after_shutdown(self):
+         self.executor.shutdown()
+@@ -156,6 +157,7 @@ def timeout(_signum, _frame):
+             signal.signal(signal.SIGALRM, old_handler)
+ 
+ 
++@unittest.skip("skipping problematic test")
+ class ThreadPoolShutdownTest(ThreadPoolMixin, ExecutorShutdownTest, BaseTestCase):
+     def test_threads_terminate(self):
+         def acquire_lock(lock):
+@@ -252,6 +254,7 @@ def test_cancel_futures_wait_false(self):
+         self.assertIn(out.strip(), [b"apple", b""])
+ 
+ 
++@unittest.skip("skipping problematic test")
+ class ProcessPoolShutdownTest(ExecutorShutdownTest):
+     def test_processes_terminate(self):
+         def acquire_lock(lock):
+-- 
+2.45.0
+
diff --git a/meta/recipes-devtools/python/python3_3.12.3.bb b/meta/recipes-devtools/python/python3_3.12.3.bb
index 04558a64634..93709b207ce 100644
--- a/meta/recipes-devtools/python/python3_3.12.3.bb
+++ b/meta/recipes-devtools/python/python3_3.12.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
+           file://0001-test_shutdown-skip-problematic-test.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.45.0


