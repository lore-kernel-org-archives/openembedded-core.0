Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F855CD98D0
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33482.1781132127441091381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Zpf3MJQ/;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-460662fcb4eso129186f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132126; x=1781736926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bByv8hoKVVBWt07k0wkvzNkg0Rs9zm4lW3vnGlNBdI=;
        b=Zpf3MJQ/EqkNML4yl+3vguQWTGzwNG/W3/3ntj0IDim65atloQHFqo/yZwBfamK8rc
         5LUcj57xlNJjHS7xkcp1uSh28ZerOs59EdiR0JFR5cPZ2z3+ODLNtI8icU6/8QdzXMca
         3zCEsW4RQ4rRTYQIdWqfnZDWmJ9kuRznY8BtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132126; x=1781736926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+bByv8hoKVVBWt07k0wkvzNkg0Rs9zm4lW3vnGlNBdI=;
        b=HAvKyeRiZx98I+gixvLAoOyqZLEHDf3St3lRfnP2rBOZdXBHMD6XL9IXuv7dExOr7H
         01LRWOM/NuaxTiUaWayLyYFJgAGs/j6rMDp+mMkJgDuQerSqcfc7p7kwB0B8+VfIXhbq
         zgLclbV/MIQw+bCUj2u/YRfPVFbMcVuJbI0xUGBiPgk4gRNVGW4Hor2mIci1cuYqM2LR
         gMYxpNEkOJ6KJQUsGjBkIMaia4hTak6Daz25dz9PSfbw8xOUJ0IyRhHVcJhCQHXXjm4O
         qnPw8MYv9vSvVAKjP+5FLP4+S+ef8fy3FDxhcEoG4HM5sS/aWnTxhOIx+BU90AdgJB12
         gjZw==
X-Gm-Message-State: AOJu0YyXEkBFxwbsRaDYBn9UKhiCbS4gcL4BjZ1qFG7qW4UGfvQDF4mr
	9tUMgthlaZqT+Cu6zq6U7nS4n3CMIY90EyEHlicy7OQALMWW0rqnJJcjXmqk/aJ+TEsCHMM0RcY
	F/jkS
X-Gm-Gg: Acq92OGuo1MURYgjDdY8YC6g8xGSB546JbburHyJkvSPqnEtdJuxmQ9SBqPeGFhBVif
	p2ktsemH1eCt8F0XvvrOhGaXIXdQjXhOx2HKfI7gu5TZX8HoFMEeSdfvarIH7PU7Gx7w48jir+k
	ImQlQy+dL7hQDI5Y92yi+MIKsvotFAYEZsCkV/A/dNo1cxeUxN7ZAnkil3PE+vlX/vG56OO+OsK
	QYt6D76mjsU3oHwvnPrFW/eRkvPivCOwpboVJxVLh+Z0MEV8sw+an2Bb1mnkH1wX/t1U39Msodc
	sT29FaBllfnyUNM9ZqRTxdtMhaqKe7piawWkMi+2eIsJ3oQsEXFy3qk9IeXz8b1t2xUTcbbW2IB
	YfHZbas+NxzQlojeXeyh1xPNDi7wlFs0hYUN9OHMb3yn7glBEp1mOKit47nyxW6S6Ceq/Fl6Z6G
	BFmbF9/qPGZaz+iJPby5B3AbNYUi5NAABopUxW9ogWda6L8LMh9w+gRnIdEL+/ZCO+J2ukFE3VQ
	9i9NUn05/KTgr69B9YpuC3UnkQMw3v5Wv3yCOrFgQb7zQkI7w==
X-Received: by 2002:a05:6000:480b:b0:45e:ebec:2542 with SMTP id ffacd0b85a97d-460677d4dfamr235771f8f.30.1781132125701;
        Wed, 10 Jun 2026 15:55:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/21] python3: Fix ThreadingMock call_count race condition
Date: Thu, 11 Jun 2026 00:55:08 +0200
Message-ID: <8e4051bd56be7f399e51fbc7def518fa1270303c.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238413

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

(From OE-Core rev: 6f7af3f76c8ce0a77ddc779a850071a714caff33)

Signed-off-by: Sai Sneha <saisneha196@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...eadingMock-call-count-race-condition.patch | 37 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.5.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch b/meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
new file mode 100644
index 00000000000..aba3188a59a
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
index b5c1d6fb3e8..9e6738997d6 100644
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

