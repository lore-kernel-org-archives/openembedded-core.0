Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC9ECD8CA7
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 21:57:14 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66302.1780955827524370947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 14:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=heO5zXJ0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202606082157058f93f0571000020714-xbkayu@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202606082157058f93f0571000020714
        for <openembedded-core@lists.openembedded.org>;
        Mon, 08 Jun 2026 23:57:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ikGSvFYQ1gtlUxFLnlvpAQ1q6Lo8QuDbl7ND+u0lnvE=;
 b=heO5zXJ0JpU66qdhoflaMovLGXMQV+FhMbLUfoJ7fJExSxaFAdbpHLA+URO7r9BGYe9Q2I
 6CmKrQsV2K5Hov5EBG5fD2pqLufkhZdoo0RWRduduLtxESy0gNUf/lhZGmX0S3ZXB9JU4Nbt
 as+fikimhlYt/WsTvkF77CBdywsOkGfdMjNkRaBxG0uBCNI1n5+IY2dcsmcr8kWzsVaGKUQF
 YnIA9H6Rw5uMRK7n0fL6j3eE70MOq0H27emfEVIPfXIz5nstpm7k27VfHCBDh2Ulot8eh9/0
 rJkIejcgepJCtVNd2LdVoFQQquk0/AKBsldAL13LgcClQaCQj72llaYw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 2/6] python3: Fix ThreadingMock call_count race condition
Date: Mon,  8 Jun 2026 23:56:48 +0200
Message-ID: <20260608215654.3664494-1-peter.marko@siemens.com>
In-Reply-To: <20260608215354.3664441-1-peter.marko@siemens.com>
References: <20260608215354.3664441-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 21:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238260

From: Sai Sneha <saisneha196@gmail.com>

ThreadingMock._increment_mock_call() was not thread-safe causing
intermittent ptest failures on qemuarm64:

  FAIL: test_call_count_thread_safe
  AssertionError: 983 != 1000

Each time a mock is called, Python reads the call_count, adds 1,
and writes it back. When multiple threads do this simultaneously,
some increments get lost because two threads can read the same
value before either writes back.

The fix adds a lock around this operation in ThreadingMock so
only one thread can update call_count at a time.

Reproduction and testing:
- x86 stress test (50 threads x 10000 calls x 30 runs):
    Before fix: 23/30 failures, missing up to 42095 calls
    After fix:  0/30 failures
- qemuarm64 (10 threads x 100 calls x 20 runs):
    Before fix: 3/20 failures, missing up to 49 calls
    After fix:  0/20 failures
- All 19 existing ThreadingMock tests pass

Upstream fix merged into CPython main:
https://github.com/python/cpython/pull/150176

Fixes [YOCTO #16213]

Signed-off-by: Sai Sneha <saisneha196@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 6f7af3f76c8ce0a77ddc779a850071a714caff33)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...eadingMock-call-count-race-condition.patch | 37 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.5.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch b/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
new file mode 100644
index 0000000000..aba3188a59
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
@@ -0,0 +1,37 @@
+From 388e023fe1197c1ffed374520ed45df4ac72b8f5 Mon Sep 17 00:00:00 2001
+From: Sai Sneha <saisneha196@gmail.com>
+Date: Thu, 21 May 2026 13:08:07 +0530
+Subject: [PATCH] Fix ThreadingMock call_count race condition
+
+ThreadingMock._increment_mock_call() was not thread-safe.
+Multiple threads calling the mock simultaneously could lose
+increments due to race conditions on call_count and other
+attributes.
+
+Fix by overriding _increment_mock_call in ThreadingMixin
+and wrapping it with the existing _mock_calls_events_lock.
+
+Upstream-Status: Backport [https://github.com/python/cpython/pull/150176]
+
+Signed-off-by: Sai Sneha <saisneha196@gmail.com>
+---
+ Lib/unittest/mock.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Lib/unittest/mock.py b/Lib/unittest/mock.py
+index 16f3699e89..56cdc37942 100644
+--- a/Lib/unittest/mock.py
++++ b/Lib/unittest/mock.py
+@@ -3113,6 +3113,10 @@ def _mock_call(self, *args, **kwargs):
+ 
+         return ret_value
+ 
++    def _increment_mock_call(self, /, *args, **kwargs):
++        with self._mock_calls_events_lock:
++            super()._increment_mock_call(*args, **kwargs)
++
+     def wait_until_called(self, *, timeout=_timeout_unset):
+         """Wait until the mock object is called.
+ 
+-- 
+2.34.1
diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index b5c1d6fb3e..9e6738997d 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
            file://0001-prefer-valid-entrypoints.patch \
+           file://0001-Fix-ThreadingMock-call-count-race-condition.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \

