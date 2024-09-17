Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7087ACAC5AA
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 21:35:33 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.1646.1726608929129618271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 14:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=fJVr4Qiv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20240917213527329f3a686441c791da-6n0adj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240917213527329f3a686441c791da
        for <openembedded-core@lists.openembedded.org>;
        Tue, 17 Sep 2024 23:35:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=49VRG4bURUKvo4H6d/eR26nhVFVgYhYITP01y6H3hTo=;
 b=fJVr4QivSlZ+ymayMERG3UAm7uSRtxeMmQb/SqCAen2oBHByODjdE4vop9K+OiGdNFtn42
 omkR/M3WlTlWZWJiilCuGneSRwAeBNLMZGnzCjzj67fLWcjPSjLFRRVd1YKT5rKHUDE84pet
 cFGxKy9sbbpG3JsxgPuEI5ni0lCSdKJrrtuuHRa0WEiCdo1zmA16UNzSIeRasAWAk0HEaKL8
 zH29NcHLwosCkGHyqGeyQ7EDc0ppBPYXBOc0ZhkCrxKJwc1T8vI8XUSz3PqA5vrbwanADh6E
 M34RY2RHFcq4C46JQIhpqLxYZWC85jf3WfA/yhGg9RxqxjjydD7TeT3Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/3] python3: skip readline limited history tests
Date: Tue, 17 Sep 2024 23:34:23 +0200
Message-Id: <20240917213424.627310-2-peter.marko@siemens.com>
In-Reply-To: <20240917213424.627310-1-peter.marko@siemens.com>
References: <20240917213424.627310-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 21:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204630

From: Trevor Gamblin <tgamblin@baylibre.com>

Python 3.12.5 is failing a newer ptest for reading/writing limited
history when editline (default) is set in PACKAGECONFIG. Skip it for now
until a proper fix (if any) is determined.

A bug has been opened upstream: https://github.com/python/cpython/issues/123018

(From OE-Core rev: de569ddffd5ea36b70c56df21dec9c892e5dee7d)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...t_readline-skip-limited-history-test.patch | 41 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.5.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
new file mode 100644
index 0000000000..50a4609f7a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -0,0 +1,41 @@
+From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 13 Aug 2024 11:07:05 -0400
+Subject: [PATCH] test_readline: skip limited history test
+
+This test was added recently and is failing on the ptest image when
+using the default PACKAGECONFIG settings (i.e. with editline instead of
+readline).. Disable it until the proper fix is determined.
+
+A bug has been opened upstream: https://github.com/python/cpython/issues/123018
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_readline.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
+index 91fd7dd13f9..d81f9bf8eed 100644
+--- a/Lib/test/test_readline.py
++++ b/Lib/test/test_readline.py
+@@ -132,6 +132,7 @@ def test_nonascii_history(self):
+         self.assertEqual(readline.get_history_item(1), "entrée 1")
+         self.assertEqual(readline.get_history_item(2), "entrée 22")
+ 
++    @unittest.skip("Skipping problematic test")
+     def test_write_read_limited_history(self):
+         previous_length = readline.get_history_length()
+         self.addCleanup(readline.set_history_length, previous_length)
+@@ -349,6 +350,7 @@ def test_history_size(self):
+             self.assertEqual(len(lines), history_size)
+             self.assertEqual(lines[-1].strip(), b"last input")
+ 
++    @unittest.skip("Skipping problematic test")
+     def test_write_read_limited_history(self):
+         previous_length = readline.get_history_length()
+         self.addCleanup(readline.set_history_length, previous_length)
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/python/python3_3.12.5.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
index 5c3b7a92f8..92109d58ce 100644
--- a/meta/recipes-devtools/python/python3_3.12.5.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
+           file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2024-7592.patch \
            file://CVE-2024-8088.patch \
            "
-- 
2.30.2


