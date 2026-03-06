Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6EDF3D33E
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64471.1772781788094105545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YvI3Ysd1;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483a233819aso87452125e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781786; x=1773386586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrS3aVqQ4eOCKDHjwft9zzOB09AzueoltfUMxxOZT4Y=;
        b=YvI3Ysd1UBSgRIOHVDFPDhBzmNASQUMcIzGXJ/qkKz2jOCbcnKBCbyD36/3qHKVzLE
         NK1/bcBypYb+HQYxBgv9BXn8dc2RiXsZKE3jNyG1w4BowyuxsKTxByjA8E7238YXObCM
         PUyIbsYNCPr+E745ECJ1huwQ4CS4hodDxVhIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781786; x=1773386586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YrS3aVqQ4eOCKDHjwft9zzOB09AzueoltfUMxxOZT4Y=;
        b=Xr1egNlcZeyCMCfETYBS71YnPP3710ge5GG+yqNC+zRYya/YwHYCzjdjdSvMqZICPR
         Of51HyQ/DxpgfeKKdY25j2DwprZSATmoVrBPhOydxeMomCg5RqXFtkfO0bx9it1+T5lA
         zvkRmt/D4Y4lwpp2KI4Dy53E63DKLSP5pVHN9ssvkZ/8fy2p942qMyIDEzVxsBtctB3V
         OkV6eS80YFWILeyZVM4rf9vE3oWi2XYwNwj369F5Evh6pRjzhike/qufSb0DP1Jg4h2m
         AAtpocXM1uAvv1lFMX+KfbnILbvFtkionP8kQYnJ9pd+8BqQu6EkxXEoLjNCTtN6j6iH
         ZK0g==
X-Gm-Message-State: AOJu0YyPL+Rd4Vwqi+FSsLCRIA04ZG9oXBGitH+PcHviCzfhhuvwsr7T
	qHoBrJvpNk/bm78HiC8o9r1jJXMB2F1P3UDZDXAoDppoI6c+NZ3tcaLB2A5MaLTThOcnZYMzAW4
	ShhnO
X-Gm-Gg: ATEYQzzQO+aO9Ej3b/uxNxDD4adJk3bZf3P4j+sM4ALD/GFxFixj72oYSyGovBJU4k9
	Zux4ysCpxoNywuSkggCz5rXjb1WOJEBVMM9pi5AuxZKh65w/ro9bvVI1HkSfIMfEhyIXW1NeX0m
	yxhGwpI5wBiGrGTTzSRWwjfT2/6+3DvaMvX5E65JxNfQ/DDibyc13YbB8cSv27h78+cQnuzGMEp
	cSNXxx/f/nxqeb7pj53jGE+d1302FibZUZt2OA9Wd14X6W25U/MnFxtchv4njqNyAI2ps+vo25p
	Rx0pIkrhwJSd4WzAE5ddIjLw71rfrOJ8B9XezTBb+Xa1efD5ayiGYSmKJVowU1TPfXtiJXOixAH
	4e2Wpo4NT0FkJFPAsqlg8ALDbNe6hAK1q7rBG9ccKVI++B290RCCa4Z4h83XPvAhor2l7+EnyBx
	mU0BHLW1Ime15o9UCt6DSbjrqbCW4PBMgMZHAybZzVhaP2EYDDqSQXvcF0LXXkIrgMUNTug3NFL
	yrsBdGBS/AfOHPmZUYFMnp4zPe7
X-Received: by 2002:a05:600c:a41:b0:483:c35d:367f with SMTP id 5b1f17b1804b1-48526957c15mr15941955e9.21.1772781786184;
        Thu, 05 Mar 2026 23:23:06 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 12/16] python3: skip flaky test_default_timeout test
Date: Fri,  6 Mar 2026 08:22:12 +0100
Message-ID: <37e47ac47f24b4c1392e7c9465be65a6712b42d7.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232551

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

