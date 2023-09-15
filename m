Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1217EED605
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:21:55 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.23346.1694791309457401125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xuRSa7Fv;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-76ef6d98d7eso145724785a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694791308; x=1695396108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9HD+mPXNzXQttKSL8ynd1wZjHX2T8mwPNtCtc8VtH4E=;
        b=xuRSa7Fv5SIDvcoDRKU27NihgftKfF9CLc8S6G9kdYWLlngaxKTpF+4opT5DBatwJx
         l+KqabG+gBUoPAdI9CbqyU2d9P/m7jkpLm1Azj3/kclIZ5U8X08344rHXvW6YeBqf9aw
         0HzweBo9VD5TJIC0Nc4bQyi7RcCIsjGxv2wK58PwzOQlCyxZuXgXCC63yUFt0S8PYVq+
         nO9BeFnink6xzzydWmrZVga1dU3YEI4JxZqNhF/qa9KC2LH9iJrOShO1zMj/y0/6S1Uq
         ws7ff4zvuLJ+/7ChFNnPq9QAMHNib/Qp4dTtZ76folVNg2ECs/RKPyf/kvpPVhdFijSH
         bf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791308; x=1695396108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HD+mPXNzXQttKSL8ynd1wZjHX2T8mwPNtCtc8VtH4E=;
        b=MHesJEnbhM9dRowRqqAmxwtBegsipvYsYqZCcxx2xsDP3T22BHG+1vBe1dP5R9w0dz
         5orWGimrSivLtS24l/5r8/zsaqbF1CGK5/xKtaOgHq1yVfhmYRtMWMf84EBD5ZYmbYzQ
         YOYFkAoLkD4qQHAvraE3TfGfeBX4nUa1dCnV4H/UMo4hytIkGs8VEzISIjkgxi+b3ITR
         jnckemMVqxoS7Xd8In7L9StKbCSUZdgkQbwgo5ncKDsMLgM85QHe8tgzxxAEFX+I5L1X
         q3m0YX4xI78aRNz2OUu/ZRAF2h+FhxEPBqWPY//pWZwWVQoOGXGV8Y9h/agAnbzVbyRb
         LrUA==
X-Gm-Message-State: AOJu0YyutHseRur//laXqKnj+LGdSci7JMhPMurMfpXrhDZgKx2eR5el
	DLbzU+uQ0woIlgmzEdkeTSZyTVl7Z/MMHMxjdDP/hQ==
X-Google-Smtp-Source: AGHT+IH95Q+0xQbNMvk8hn3OCRIMmapF7O+zqhSJPMzS159YwYFj7Nt0wzn1xDBc8sWMKXNxrp+/3A==
X-Received: by 2002:a05:620a:25d0:b0:76c:c055:aa32 with SMTP id y16-20020a05620a25d000b0076cc055aa32mr2099079qko.24.1694791308395;
        Fri, 15 Sep 2023 08:21:48 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id ou19-20020a05620a621300b0076cf49bcb50sm1299641qkn.37.2023.09.15.08.21.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:21:48 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3-ptest: skip test_input_no_stdout_fileno
Date: Fri, 15 Sep 2023 11:21:46 -0400
Message-ID: <20230915152147.66413-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187667

[YOCTO #15210]

test_input_no_stdout_fileno has been seen failing on AB workers under
heavy load. Skip it while leaving the rest of the test_builtin suite
alone.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 clarifies that this is a fix for python3-ptest, not python3.
 ..._fileno-test-due-to-load-variability.patch | 32 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.11.5.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch

diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
new file mode 100644
index 0000000000..ff695a4091
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -0,0 +1,32 @@
+From 564d8f117fec7e573cbc10323655acefb12d143f Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 15 Sep 2023 08:48:33 -0400
+Subject: [PATCH] skip no_stdout_fileno test due to load variability
+
+Skip test_input_no_stdout_fileno so that it doesn't fail on systems
+under heavy load.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+[YOCTO #15210]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_builtin.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
+index 9078c409cc..615955c057 100644
+--- a/Lib/test/test_builtin.py
++++ b/Lib/test/test_builtin.py
+@@ -2247,6 +2247,7 @@ def test_input_tty_non_ascii_unicode_errors(self):
+         # Check stdin/stdout error handler is used when invoking PyOS_Readline()
+         self.check_input_tty("prompté", b"quux\xe9", "ascii")
+ 
++    @unittest.skip("Test may fail under heavy load")
+     def test_input_no_stdout_fileno(self):
+         # Issue #24402: If stdin is the original terminal but stdout.fileno()
+         # fails, do not use the original stdout file descriptor
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/python/python3_3.11.5.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
index f5d97311d7..6c624c9d3d 100644
--- a/meta/recipes-devtools/python/python3_3.11.5.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
+           file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.41.0


