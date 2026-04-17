Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1519FF433D6
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:00:05 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39708.1776412802862165246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vLKg8kNl;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso4580675e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 01:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776412801; x=1777017601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cif0DX8OzDxMajHxCzvNiMZHH88aBJhJ5t8yFgop+dM=;
        b=vLKg8kNlvns9Lv0fAGuh5HJN2ZAinQ7GWTgmngtXvjZ2FCVMQoL2DqBK+Nx3C4ZFqi
         XnCvXfh1M0lRT4gum9Epo5vvhMyPNCBNhN6kvnSU2scGfRHMRqNWNY6eAbR9T7ohfV2A
         Ckr5oYQ6jl3s5Egk60FYD8o76AoNikvFqKUuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776412801; x=1777017601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cif0DX8OzDxMajHxCzvNiMZHH88aBJhJ5t8yFgop+dM=;
        b=SWZeqDQpTZ3+OZFCqXBW+mgS1gmVo/w3sV1wrqg3DaaRJLG2OpodTd1Sjt+d834khR
         8/ZjzEaPFypaPslMpuq/QPOBzUs47szAD5H4v4CEtFX5ILQp7vT6O0hNELNG7Z7QMLrd
         bkUwg+R7/TUFWBbHhu1bioYH3ghqEEA7i+FXCJ2f1ifr4P9PAOqpbvDNBN+6MykBp1+S
         kH2mAYvxQwZFoNaVJ9ytJ5sgNUM21sVonFQXBVUW2jprFujEo9yBrZTSxL/eq5a1ecR7
         z7MQJthpRuqYxIese/7TlAnx6fDhCep2noflHmpeA877/fOED2NVPqXRBTHVi9uBZ9x+
         4bVg==
X-Gm-Message-State: AOJu0Yx0IJN1vQsIQm0JcbTMwOnh9VjiSftAC80johBHDZ5Z9LDOLz8u
	zXanYbgWhhBEhjKlBHXFJSYirLVh4GavAV+0gkabi7FPrs07GeJi9oniEhfps6Tgx8tO033g/Gu
	iw8Y6xSn9N0fj
X-Gm-Gg: AeBDiesFxjtb5FI6rUc/SE5GDE1lZqHMl/YFca786lUw/jcNxirtQCgcLLq6QqLYg1P
	8KrkKV5+MA0YiZvlhr6a5ANvKBLD+3TYMfIRQdClNHdkJ3o4JUP5r2pKKq5wg0wyIEoRBCBjKAY
	pemRlP0+tuJg8bW4fd+avTN6AWMg96xR7LEgez91udWll9lap2aq/sLVv1EwEvhQYWVDybJSpmV
	SdADlurVIBJp05o2y6/ryTTuK1kfhkZi4WfBhE4Tqm3ngAeWZ6m1tQzaMy1kGIt6oY5MB5SkA8s
	roAb7HDTTZgEZjNg3DRiZrUUfw/kuwhnTOTT9ZZ3RrC3g6gIvZ7i61yUfHZcxE4rkCkLhMhq0f7
	5aUViar02rPJCKh0nJB5bi8LUiNebnRKCMnqsX6EmeIClQE8ij3IVMWs+LOkjOk760C+RnnKGqJ
	JZco7LEOawU7UzG+a4YLugrERwpDnm0sjyiJLinXN6swktxlDrj6650hJr4d35HYJb6MDVIAaBc
	kmdtA2j8yhCQSIaZvSCGSE+NPjv1mvXg40ieA==
X-Received: by 2002:a05:600c:4fc7:b0:488:dbcb:ca08 with SMTP id 5b1f17b1804b1-488fb787a62mr22575565e9.30.1776412800910;
        Fri, 17 Apr 2026 01:00:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm2629275f8f.37.2026.04.17.01.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:00:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [whinlatter][PATCH] python3: Fix test under ptest-runner 2.5.1
Date: Fri, 17 Apr 2026 09:59:43 +0200
Message-ID: <20260417075943.1398549-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235484

From: Yoann Congal <yoann.congal@smile.fr>

test_cmd_line.test_non_interactive_output_buffering assumes a buffered
stdio. But since ptest-runner 2.5.0, PYTHONUNBUFFERED=1 is used, stdio
is not buffered and the test fails.

Backport a patch to skip this test when PYTHONUNBUFFERED=1.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...est_cmd_line.test_non_interactive_ou.patch | 31 +++++++++++++++++++
 .../python/python3_3.13.12.bb                 |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-128377-Skip-test_cmd_line.test_non_interactive_ou.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-128377-Skip-test_cmd_line.test_non_interactive_ou.patch b/meta/recipes-devtools/python/python3/0001-gh-128377-Skip-test_cmd_line.test_non_interactive_ou.patch
new file mode 100644
index 00000000000..9604a3c8402
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-128377-Skip-test_cmd_line.test_non_interactive_ou.patch
@@ -0,0 +1,31 @@
+From 8d02dc113f4498ca7142c17a8698b8b276cd8a5b Mon Sep 17 00:00:00 2001
+From: Yan Yanchii <yyanchiy@gmail.com>
+Date: Sun, 12 Jan 2025 09:27:28 +0100
+Subject: [PATCH] gh-128377: Skip
+ `test_cmd_line.test_non_interactive_output_buffering` when
+ `PYTHONUNBUFFERED=1` (#128378)
+
+
+The `test_cmd_line.test_non_interactive_output_buffering` test assumes a buffered `stdio`
+without checking the `PYTHONUNBUFFERED` value. Instead of changing the environment
+variable for the duration of the test, it is better to simply skip it.
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/30268b5d2fbb1a5e6c876f0cdc4cbdb5d93315e6]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ Lib/test/test_cmd_line.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Lib/test/test_cmd_line.py b/Lib/test/test_cmd_line.py
+index dc420f33c23..ef24866972a 100644
+--- a/Lib/test/test_cmd_line.py
++++ b/Lib/test/test_cmd_line.py
+@@ -334,6 +334,8 @@ class CmdLineTest(unittest.TestCase):
+         self.assertEqual(stdout, expected)
+         self.assertEqual(p.returncode, 0)
+ 
++    @unittest.skipIf(os.environ.get("PYTHONUNBUFFERED", "0") != "0",
++                     "Python stdio buffering is disabled.")
+     def test_non_interactive_output_buffering(self):
+         code = textwrap.dedent("""
+             import sys
diff --git a/meta/recipes-devtools/python/python3_3.13.12.bb b/meta/recipes-devtools/python/python3_3.13.12.bb
index e30acebe20d..854d8341354 100644
--- a/meta/recipes-devtools/python/python3_3.13.12.bb
+++ b/meta/recipes-devtools/python/python3_3.13.12.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
+           file://0001-gh-128377-Skip-test_cmd_line.test_non_interactive_ou.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \

