Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813E6EEF332
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:56:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39964.1772700956608718234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Y+Fwu9bo;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48378136adcso46369325e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700955; x=1773305755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrS3aVqQ4eOCKDHjwft9zzOB09AzueoltfUMxxOZT4Y=;
        b=Y+Fwu9boXv/QTU9o3sT2YmHNcr7lHPWp5usBTMpBdKKkAjHB8ZAcV3IJL6SQ721Vff
         O93noRRubZFjrpuAa2T2u1VtqluZJWTUCFaxzDLKlB/eHMWsAnDE1xzIelVF9B6EvsiV
         wH6SiQYB247wu8Um0fzoiknRDfMotyJ75ae74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700955; x=1773305755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YrS3aVqQ4eOCKDHjwft9zzOB09AzueoltfUMxxOZT4Y=;
        b=pt5DN1U1Q4ZevrRhplWYqMxPZ58Ej15jYPuWeiw4CRmj4NO2BugrzL3or+FaOv+u88
         1gG+oALXq5R44YBkemwxOT3VWekgLIORtBPiVPSBgAqwq8nQv4ha3piGTAHwWEz22/ka
         YUpjxhLxnmiT2Iuc9yephAJP9Pox7QvicOBQYnwH3ncGXmiYhd/2ffh/wwCUAzKQw6xB
         27r80tAgk7fo7WCKF8W47XbQnGgRIg0PZuWMKdD6oY+vj+7WpB/RYhfFG3Ol4yKP+FYz
         JQTyr+oPrfQjalotNWbst8Ne3rrvCyo2UWSrgTfi/dqaLa5wRVZQMoa5O29+BhangS62
         avXw==
X-Gm-Message-State: AOJu0Yy0JBoUfKiVOIceC4l7aIdxVIWhE0kU2GEGa+oXmqGd+XJY4XTn
	36+3VItcVvag+Ei3NjrOnN2TMG/zDnzo0VN6h+7/wdVQZdyi7OoVF0m4BsCy/kXF0RyDosG8QLr
	p2MTO
X-Gm-Gg: ATEYQzygOx7OHFEAylkEROr0hruOPuRoZf/0dtryvf/z3vwNuqvSK8Usc9VdIjmRLXp
	SBNg+RYZKN6XW0qM4J8mAyrJEgpiLLuTI6V1sJjnk1ho4nP6kWn+7FzhT43ldhFOdnWp4jrhvsd
	VVoCQCAAq/9uBxros4zyC7J2R/YwewJS9D0Xk/gdQPAa8eMGYase7UMFw0huMzQAN1TRsIZg6+m
	QIc4lxLWk6CwD1kTLh/Rhloj1GHm82D3m1GgrLU8Kr1/R28m555Tiv5aeJHRDKwDZmWwRHuiplf
	kaYLu9PAqsfuCqv7E/swSLr3rs/3QGECI4fo2rzStUQw4PuT5wOm6A3Wr5dOmtWsXbrjlc6wFuF
	/CQMgF2jxSDeTOg32stE4bj4gQaCuh77KaJr0Xtb0e6/47Fdrot7fa1P4xmn2IkQ1HnGM9N8HEf
	+11lqsOW7m7N5DbJOM786E1VCJ103g3/GOfELk8qkHe0EVVm12czcikGdKkxiEPG+9SGeA7BPCb
	7tyBuqZsgMREmH9ty662Ki6qydw
X-Received: by 2002:a05:600c:34d1:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-48519888c4amr84421235e9.22.1772700954568;
        Thu, 05 Mar 2026 00:55:54 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 12/12] python3: skip flaky test_default_timeout test
Date: Thu,  5 Mar 2026 09:55:01 +0100
Message-ID: <2542c55501b4fe6e8655e15e18bc5d2b34f23f23.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232464

From: Antonin Godard <antonin.godard@bootlin.com>

We have been observing intermittent issues with this test on the Autobuilder:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15885

This is probably due to the Autobuilder being heavily loaded at the time
of the test.

The logs on the ticket above do not allow us to know which of the two
"test_default_timeout" tests is failing, so disable both with
self.skipTest().

Excerpt from `ptest-runner python3`:

  test_default_timeout (test.test_multiprocessing_fork.test_manager.WithManagerTestBarrier.test_default_timeout)
  SKIP: Test the barrier's default timeout 'skip flaky timeout test'

[YOCTO #15885]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9382dee2a59a359f38e03179d01fce47c2d86372)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...kip-flaky-test_default_timeout-tests.patch | 49 +++++++++++++++++++
 .../python/python3_3.13.11.bb                 |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch b/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
new file mode 100644
index 00000000000..4e1bd833b46
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
@@ -0,0 +1,49 @@
+From baf2dda48e51fcb17a716e52cc5c4e162a6bb7d3 Mon Sep 17 00:00:00 2001
+From: Antonin Godard <antonin.godard@bootlin.com>
+Date: Mon, 19 Jan 2026 11:38:36 +0100
+Subject: [PATCH] Skip flaky test_default_timeout tests
+
+We have been observing issues with this test on the Autobuilder:
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=15885
+
+The logs on the ticket above do not allow us to know which of the two
+"test_default_timeout" tests is failing, so disable both with
+self.skipTest().
+
+Excerpt from `ptest-runner python3`:
+
+  test_default_timeout (test.test_multiprocessing_fork.test_manager.WithManagerTestBarrier.test_default_timeout)
+  SKIP: Test the barrier's default timeout 'skip flaky timeout test'
+
+Upstream-Status: Inappropriate [OE specific, but might be related to https://github.com/python/cpython/issues/129266#issuecomment-2613058866]
+
+Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
+---
+ Lib/test/_test_multiprocessing.py | 1 +
+ Lib/test/lock_tests.py            | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
+index e8064e7..9ab1f9e 100644
+--- a/Lib/test/_test_multiprocessing.py
++++ b/Lib/test/_test_multiprocessing.py
+@@ -2259,6 +2259,7 @@ class _TestBarrier(BaseTestCase):
+         """
+         Test the barrier's default timeout
+         """
++        self.skipTest('skip flaky timeout test')
+         barrier = self.Barrier(self.N, timeout=0.5)
+         results = self.DummyList()
+         self.run_threads(self._test_default_timeout_f, (barrier, results))
+diff --git a/Lib/test/lock_tests.py b/Lib/test/lock_tests.py
+index 8c8f890..43e9b90 100644
+--- a/Lib/test/lock_tests.py
++++ b/Lib/test/lock_tests.py
+@@ -1165,6 +1165,7 @@ class BarrierTests(BaseTestCase):
+         """
+         Test the barrier's default timeout
+         """
++        self.skipTest('skip flaky timeout test')
+         timeout = 0.100
+         barrier = self.barriertype(2, timeout=timeout)
+         def f():
diff --git a/meta/recipes-devtools/python/python3_3.13.11.bb b/meta/recipes-devtools/python/python3_3.13.11.bb
index 2fcfd4aba19..2bc2389b7e4 100644
--- a/meta/recipes-devtools/python/python3_3.13.11.bb
+++ b/meta/recipes-devtools/python/python3_3.13.11.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
+           file://0001-Skip-flaky-test_default_timeout-tests.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \

