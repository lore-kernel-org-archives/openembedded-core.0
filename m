Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DF1F483CA
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 16:18:18 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21668.1774282691150440220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 09:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UWtIjlNB;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cb38e86cf2so418429085a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774282689; x=1774887489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oc/2rlgvMcuQETPLcEzytfrtc4h/fP/c/fA07ODzDCQ=;
        b=UWtIjlNBtf+XtLQ9pbvo4kMnIIP1EtORwSu6pjH9e5c9E349cXcgxa+wPRvX4vM1rS
         xw8YBUWGMMAi7H+T4NGkB5JbxEVXQ5cAeBeFeX8Noyu9NH8sokA9EIKo5WW/HukwjrFk
         /2zaKS65bbKOAKfAYBE1s89+CjoKs4zal7sL0+o4li98ZrqUuAZibvQV2ZoLyB3P3YWi
         4fkd4FVeOkrJgbyLuE0+nAuT+ZIz+SsHfmbg/EfOKF5XTLcxjIfr6/V2MYlnq3UW6PIu
         QfdTAElNSSvG7l6okUdx9FnRuPT2w72KkH2MFjKj9Aj92dje2g3RoLmxiZOIvk0EwmFP
         PmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282689; x=1774887489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oc/2rlgvMcuQETPLcEzytfrtc4h/fP/c/fA07ODzDCQ=;
        b=Du51hu0RQ0GZeFpa0wICa8fcert80GUS2uVFwUr/pTBAdEyiHQrxmnjlgIuf6UiRK1
         B5gnnJsOF1fojM7mTrKXF6F9MS2vuHTPRapiFrGOl+vNn0+9sRPdOvnAh9d/ymB5IXd4
         +fw1v34y9IZ6qOtYyDHAgqF17XZejameedMi/RTlpUpD4gLsilZpboOF2vyeNRrhaaeC
         OrQWqQoldNsQvcTqEmE/Ohbz7Oq31OYBJKfv5A4kMDQc3QFewNt2XevSwwkEfPCvHVP6
         SfaPUFsFz76OGcJfyVfKPOh4eo/MKZvzKbcQg3g3ElnK9iaeEwJdzHIFZZZtXeMbndko
         A0gg==
X-Gm-Message-State: AOJu0YwCuc9IiSkbo4BmL7duO3wbzoyWcOYLx1tksYho6IJayxR8g5Va
	dxijO7zZ1xotZX/BgHU2KHXEb0e+IbpLiWNPGS3i106LJl33wMgKVj6k9R17mGd/NNUBRJUoFgM
	cjoex70U=
X-Gm-Gg: ATEYQzxNFwAgFKggqYz9FP2/Ap/XzZe6PNzC9LZOfWbQDYxwu+PWMcF+S5PILWEq1BF
	oOIZjBWluENuS87G5UpQrS4djr8+bmfPa3Y3eEkFlPlHzWgwU+NedrwoYaNM8OVYaQ4ziHR80lz
	oSAKE+BG5bMukilnpiuPKa4z0nzN/kFxB2ESYw/dCLprnr4GtF4DOSPAc34tNozeM5wdw2Ml2xs
	IrB2qihEUuAyjjTSgzZ+iO/B3fzbOPAMFE/XreSvX7ZcvCq3L6iH8U5nzf7IYZWyb+5LEvBUCPn
	cEdlpr5S0qpiw8KWnl8JOjH30/xBw3aPR9QTKYBNBMGzMnAOkk8+8QTOLrBqlVBfjl1MkN5wzwC
	LCwsqLM3UtUdWjGP1av3L/vzpuoPj49iGflyFh/Mj+uDkMeYaDBy/qsrgtD9zp2hP3JeZDR4V0C
	FWc6PJB2VyIUZz2OsrVGYYG58UvkA=
X-Received: by 2002:a05:620a:4005:b0:8ca:305b:748e with SMTP id af79cd13be357-8cfc7f6c0cfmr1904073485a.57.1774282689169;
        Mon, 23 Mar 2026 09:18:09 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85361ac2sm88939296d6.41.2026.03.23.09.18.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:18:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: skip test_repl_eio test, fix whitespace
Date: Mon, 23 Mar 2026 12:18:06 -0400
Message-ID: <20260323161806.29118-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 16:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233749

This is failing intermittently on the Autobuilder. Disable it for now.

With this change, we see this in the ptest log:

|PASS: test_simple_addition (test.test_pyrepl.test_unix_console.TestConsole.test_simple_addition)
|PASS: test_wrap (test.test_pyrepl.test_unix_console.TestConsole.test_wrap)
|test_eio_error_handling_in_restore (test.test_pyrepl.test_unix_console.TestUnixConsoleEIOHandling.test_eio_error_handling_in_restore) ... ^[[?2004h^[[?2004l^[[?1h^[=^[[?1l^[k
|SKIP: test_repl_eio (test.test_pyrepl.test_unix_console.TestUnixConsoleEIOHandling.test_repl_eio) 'skipping problematic test'
|PASS: test_gen_colors_keyword_highlighting (test.test_pyrepl.test_utils.TestUtils.test_gen_colors_keyword_highlighting)

Also fix some inconsistent whitespace in the SRC_URI list.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...001-test_pyrepl-skip-test_pyrepl_eio.patch | 29 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.3.bb |  7 +++--
 2 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_pyrepl_eio.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_pyrepl_eio.patch b/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_pyrepl_eio.patch
new file mode 100644
index 0000000000..9fa441014a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_pyrepl_eio.patch
@@ -0,0 +1,29 @@
+From 79cc5e15edb5ae67832dce5dfa9e114b8740489f Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Sat, 21 Mar 2026 13:14:51 -0400
+Subject: [PATCH] test_pyrepl: skip test_pyrepl_eio
+
+Upstream-Status: Inappropriate [oe-specific]
+
+This test fails intermittently on the Autobuilder, so skip it for now.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_pyrepl/test_unix_console.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_pyrepl/test_unix_console.py b/Lib/test/test_pyrepl/test_unix_console.py
+index 680adbc2d96..2cc69e7807e 100644
+--- a/Lib/test/test_pyrepl/test_unix_console.py
++++ b/Lib/test/test_pyrepl/test_unix_console.py
+@@ -370,6 +370,7 @@ def test_eio_error_handling_in_restore(self, mock_tcgetattr, mock_tcsetattr):
+         # EIO error should be handled gracefully in restore()
+         console.restore()
+ 
++    @unittest.skip("skipping problematic test")
+     @unittest.skipUnless(sys.platform == "linux", "Only valid on Linux")
+     def test_repl_eio(self):
+         # Use the pty-based approach to simulate EIO error
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index 7a1ad1e386..90863a42a1 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -30,11 +30,12 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-test_cmd-skip-bang-completion-test.patch \
-	   file://0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch \
-	   file://0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch \
+           file://0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch \
+           file://0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch \
-	   file://0001-test_only_active_thread-skip-problematic-test.patch \
+           file://0001-test_only_active_thread-skip-problematic-test.patch \
+           file://0001-test_pyrepl-skip-test_pyrepl_eio.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
-- 
2.53.0


