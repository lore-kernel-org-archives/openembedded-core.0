Return-Path: <sam.john.kent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17CBFF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 12:45:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10331.1777466748913056513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 05:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m6ar/AFi;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ba840146so112008625e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 05:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777466747; x=1778071547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWyhzVHkxYx4vi7DJmjCoDTQIufTHceXy+tKkIjZxeg=;
        b=m6ar/AFiBN8vHrV5cULaHXMSZpipiNNo9bcCiGugm1cAtZo0xoRqEOyzy9aG/n6qJe
         uM0AFtUf9UR4gjE8CzFJp7ITpd/KCvvcuQsm+AqyoDxKLsTFfS4QwFL7HyJVV2RLJAjY
         hY02OhBEql7OKcJgk5a6U6J0xUoqhbXn/fHDc9u7dEnuF8s3ngsFdnjqf6trN9M/52hQ
         qPP/Ffo7R4RRjZLcv9eAfN+jER3/LfImux3zt2d6nd/C+yuxVNfFPF7LDzIA3AhHZpDd
         KQHvm4rz0EPQf7aVhoy89bBFDafQLOiKOjJMdoqXNHcoWZhYL2b9qc9UjidrfFh1mY6E
         7CZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466747; x=1778071547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QWyhzVHkxYx4vi7DJmjCoDTQIufTHceXy+tKkIjZxeg=;
        b=mE6qIerGBx7RDR9GHgIPtbPSdIGqyF3UD8B7vLOWuAif5qt4t2XdiGGLA/rT82OsrC
         0mTmtyNSkPv1x9+0oRs3m2+biAG1jw7Yvc/GQlNuJWCGVyCR/0axYr1KYYsmdzjIxmPk
         05y+l6zwtI6jQUN2ILr4X90WwZQtT4on5KYiwd32Yy8OmbTqt12WHK1pUiukw1uxr3Yj
         MULfxtDm4SxWZSyeHfb8PT52vvgsw13rABZlmYSEk6ui/9TO+KI+96Nkii73y8OyiPsY
         8xyxtOCgbSww0XApA3sSJCy0xMMwYDv/d9wgM/JeuF95Oa5D+cJiYyrP8vsxuBvWLe9E
         Hbyg==
X-Gm-Message-State: AOJu0YxQk/L/5N8Du+E5hmFGnkT+KtDVAgwlgtkWrcp0/YjUQ+OtA5Kn
	RaqJoXthcP3SasZHyBgqtklvNfCzoDyNqQzygZJiv33U2ftVajOmKqo4aKXt/Du2S5g=
X-Gm-Gg: AeBDietSpIs86CITT+qlWrXZclvzPq6TYlMmixzgYpEL/D2g9gLIgv/yNNIWQFkAc6s
	i7RdXw6RjY4F1jcc/NWdMcDc3/joLfAydkHx1KA2w51iJZEpkXaO/N3/wlPUjlmPth14vtcROhH
	FMXaY7KuXtB3vPz2bXyGgAkR6d1Kidt02WOGvbsKEM6RXuykPYOqyXOwJyQekJ/MtRQSDwcqfM8
	7D2DVXs02SKBmWPpHqG9u/L7HCjUdrZWXbQPnEUrC6d0o2XepaCvn3oJeDayCFaWNwcN7m9Ai4W
	xsdlXGrEs7rL8xdAlhSdSang+w99pclWNIIHCtHcySImJ0QdNLJCa63flzVliS89x2o7O9oEZEp
	anzCnwSuPVUsCYxRz/XojnNvbGWbrJMiRz8n4aLGiHWWEneIzhh0ZB9scCYHcqESHbp8mkBmPig
	jm0A2XrhHgkwIFBZ41Qh+55aHpjOZW9MYAhBojLYFwQh9jfpc4AHaJw5vue4LNOwRO+6Clklx9h
	u6ZDyn28mAcX1rDx8cwatlbI7wehVINFMYfIGV4o5FmHZNo9neSAIK0Ng==
X-Received: by 2002:a05:600c:6814:b0:488:a977:8d6 with SMTP id 5b1f17b1804b1-48a77b1dac1mr125096965e9.19.1777466746685;
        Wed, 29 Apr 2026 05:45:46 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud (ec2-52-18-17-49.eu-west-1.compute.amazonaws.com. [52.18.17.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc1cb91sm55291405e9.6.2026.04.29.05.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:45:45 -0700 (PDT)
From: Sam Kent <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v3 1/2] oelib: add unit tests for kernel module detection helpers
Date: Wed, 29 Apr 2026 13:45:23 +0100
Message-Id: <20260429124524.2890648-1-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260428081046.1660101-1-sam.john.kent@gmail.com>
References: <20260428081046.1660101-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 12:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236099

Add tests for the filename pre-filter logic, is_kernel_module(), and
is_kernel_module_signed() to meta/lib/oeqa/selftest/cases/oelib/

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
---
 meta/lib/oeqa/selftest/cases/oelib/package.py | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/package.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/package.py b/meta/lib/oeqa/selftest/cases/oelib/package.py
new file mode 100644
index 0000000..5751057
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/package.py
@@ -0,0 +1,108 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import mmap
+import os
+import tempfile
+from unittest.case import TestCase
+
+
+class TestKernelModuleFilenameFilter(TestCase):
+    """
+    The pre-filter in process_split_and_strip_files() selects candidates to
+    pass to is_elf(). It must use f.endswith(".ko"), not ".ko" in f, to avoid
+    false-positives on compressed modules (.ko.xz, .ko.gz).
+    """
+
+    ko_files = [
+        "driver.ko",
+        "net/foo.ko",
+    ]
+
+    not_ko_files = [
+        "driver.ko.xz",
+        "driver.ko.gz",
+        "driver.ko2",
+        "myko.c",
+        "vmlinux",
+    ]
+
+    def test_endswith_matches_ko(self):
+        for f in self.ko_files:
+            with self.subTest(f=f):
+                self.assertTrue(f.endswith(".ko"))
+
+    def test_endswith_rejects_non_ko(self):
+        for f in self.not_ko_files:
+            with self.subTest(f=f):
+                self.assertFalse(f.endswith(".ko"))
+
+    def test_old_predicate_had_false_positives(self):
+        # The previous check (".ko" in f) matched compressed modules — this is
+        # the regression the fix addresses.
+        false_positives = [f for f in self.not_ko_files if ".ko" in f]
+        self.assertEqual(false_positives, ["driver.ko.xz", "driver.ko.gz", "driver.ko2"])
+
+
+class TestIsKernelModule(TestCase):
+    """
+    is_kernel_module() detects kernel modules by searching for the
+    "vermagic=" string, which is always present in genuine .ko files.
+    """
+
+    def setUp(self):
+        from oe.package import is_kernel_module
+        self.is_kernel_module = is_kernel_module
+        self._tmpfile = None
+
+    def tearDown(self):
+        if self._tmpfile and os.path.exists(self._tmpfile):
+            os.unlink(self._tmpfile)
+
+    def _make_tmp(self, content):
+        f = tempfile.NamedTemporaryFile(delete=False, suffix=".ko")
+        f.write(content)
+        f.close()
+        return f.name
+
+    def test_detects_vermagic(self):
+        self._tmpfile = self._make_tmp(b"\x7fELF\x00" * 10 + b"vermagic=5.15.0" + b"\x00" * 10)
+        self.assertTrue(self.is_kernel_module(self._tmpfile))
+
+    def test_rejects_plain_elf(self):
+        self._tmpfile = self._make_tmp(b"\x7fELF\x00" * 50)
+        self.assertFalse(self.is_kernel_module(self._tmpfile))
+
+
+class TestIsKernelModuleSigned(TestCase):
+    """
+    is_kernel_module_signed() detects the "Module signature appended" tail
+    that the kernel's modsign infrastructure writes.
+    """
+
+    def setUp(self):
+        from oe.package import is_kernel_module_signed
+        self.is_kernel_module_signed = is_kernel_module_signed
+        self._tmpfile = None
+
+    def tearDown(self):
+        if self._tmpfile and os.path.exists(self._tmpfile):
+            os.unlink(self._tmpfile)
+
+    def _make_tmp(self, content):
+        f = tempfile.NamedTemporaryFile(delete=False, suffix=".ko")
+        f.write(content)
+        f.close()
+        return f.name
+
+    def test_detects_signed(self):
+        tail = b"Module signature appended\n\x00\x00"
+        self._tmpfile = self._make_tmp(b"\x00" * 64 + tail)
+        self.assertTrue(self.is_kernel_module_signed(self._tmpfile))
+
+    def test_rejects_unsigned(self):
+        self._tmpfile = self._make_tmp(b"\x7fELF\x00" * 20)
+        self.assertFalse(self.is_kernel_module_signed(self._tmpfile))
-- 
2.34.1


