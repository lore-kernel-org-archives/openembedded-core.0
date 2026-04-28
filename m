Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68013FF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:00:09 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8388.1777363919081073274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 01:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=phxNbNFI;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfbd17589so8689984f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 01:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777363917; x=1777968717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/RfwrppZ5/uZ1q0klgEETnYxMNySn8ycfMmKElIDHM=;
        b=phxNbNFIATpKx6BVNtw2PhK1gvVIXGXfZErcJu/HGiClRbSkrHPWjMAewo3zAoEaoM
         4FaGu/qAGnJahSMn7Ju9KQ+DVnIw1jvwlxTwRPmEup1l1F4EmzCDYXTdLEt/LFUklLdl
         o1pA3dl66FfQbM1dkJMyIXRctsn0gjJ1AcCE//t93ntG3wgSoApZBLnlLPe2DvAR7zmD
         +sJkjVc9lM4q57pRA5rzJjX2WHUDjfosFZn1BQosViUBuy9cPm+NTbS7tqBncp4WiSzp
         rp7pC7oKw/9MaJ8Q2szkd+QssPMXeW8Pj5U5AKCdWcsu4pxZDPKIgcTcgeIudOiObvVl
         Rcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363917; x=1777968717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/RfwrppZ5/uZ1q0klgEETnYxMNySn8ycfMmKElIDHM=;
        b=Uips8cIaU/Pmr6e6b+9/UjUKVkLdKP7nv1L8zzNByvIzmeNXZUSpoO6Hss6k/Oanhw
         uvQfS7ewY6lupWBiw99aKKCZrLeL9EIHKV4TnaSKk1TKM9qUqLoTbY12KkRl0vXEYzTR
         l/dNl1OXNbMlX/JNz7oYoddrQbtY29vPG5utdvgTMNoQCjOHxxabkpi/LCJOzt/sgNZj
         NYnpeR2NOt41r0CPE2rZ0Cvh2VPIdfOwB8eTReVd57vf7TRC7BaZskLx7khLeXnNu0U6
         5BXQHmTilxjJSYVoz6AC57egfbVCQRoyQcjfzXsixY7cMqLTHPiv7EhSyeQ7LPWUJVcC
         g4nA==
X-Gm-Message-State: AOJu0YxZ0QALHaK+U0Xq9StFHdiPqa+E98XtR52ojqxwrfqJeC9PAraL
	MoboGd3krRbYVcU2st2s4fJBnwzmsG0zKVdBMdQr+tHMR2XkdqLb6+vkGCqBznpEE6c=
X-Gm-Gg: AeBDievd+s8ycxu2Gt4Iz8trherxJBH5xXwGjvT/iaOeB6XxtEd/BneADL/3aDpJR1F
	+9xo7GIQDaMoCfrg3IabmnM4+uzl1BN9NElPeHT6KupBYrtdCLe0SX1ON5/zH00ZYne40L/mzjj
	Z5oY1/mutrkn642nxVyrNhFXfsSnZhLGO7NaIugPnsaKRA2xgaDK5XZmnWmk44vCwm7TkAlvJ5R
	SLWCZoDqLb1WoT2A1D6sLfpZhDnwZd2Nh7kjSRRxrImKHc0JDoMUzr3pIigoM3eLCTvzX27YDIe
	q/v1gxW9g8AO5WRBccBIRDgqnIJifFVbUqQq1tAPBoCaX6QiYvYB7ON9D/si7pgiVMNmvxWNAlU
	NQbm9sv1Heosgd0tPmU56CZBeruv4bkzw4cT7xgk6UtqIMSk38ZUGxM0m/sW2qSgIeehbhaaG/0
	mJGyt3m2dQOD8CrqTmlUcUHUDONnRHW/hp7IHUV/cdisKkH1j5CPLYfwO2CccHR6ON6OESJaN1H
	ci0sqg=
X-Received: by 2002:a5d:5c84:0:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-44649ba18ffmr3663638f8f.35.1777363916998;
        Tue, 28 Apr 2026 01:11:56 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([79.123.125.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c07a2sm4588351f8f.20.2026.04.28.01.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:11:56 -0700 (PDT)
From: "Sam Kent" <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v2 2/3] oe/package: add unit tests for kernel module detection helpers
Date: Tue, 28 Apr 2026 09:10:45 +0100
Message-Id: <20260428081046.1660101-3-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260428081046.1660101-1-sam.john.kent@gmail.com>
References: <20260428081046.1660101-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 09:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236049

Add unit tests for the filename pre-filter logic, is_kernel_module(),
and the is_kernel_module_signed() detection.

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
---
 meta/lib/oe/tests/__init__.py     |   0
 meta/lib/oe/tests/test_package.py | 121 ++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 meta/lib/oe/tests/__init__.py
 create mode 100644 meta/lib/oe/tests/test_package.py

diff --git a/meta/lib/oe/tests/__init__.py b/meta/lib/oe/tests/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oe/tests/test_package.py b/meta/lib/oe/tests/test_package.py
new file mode 100644
index 0000000..29e393c
--- /dev/null
+++ b/meta/lib/oe/tests/test_package.py
@@ -0,0 +1,121 @@
+#!/usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import mmap
+import os
+import tempfile
+import unittest
+
+
+# Copied from oe/package.py to allow standalone execution without bitbake.
+def is_kernel_module(path):
+    with open(path) as f:
+        return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
+
+def is_kernel_module_signed(path):
+    with open(path, "rb") as f:
+        f.seek(-28, 2)
+        module_tail = f.read()
+        return "Module signature appended" in "".join(chr(c) for c in bytearray(module_tail))
+
+
+class TestKernelModuleFilenameFilter(unittest.TestCase):
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
+        # Demonstrate that the previous check (".ko" in f) matched compressed
+        # modules — this is the regression the fix addresses.
+        false_positives = [f for f in self.not_ko_files if ".ko" in f]
+        self.assertEqual(false_positives, ["driver.ko.xz", "driver.ko.gz", "driver.ko2"])
+
+
+class TestIsKernelModule(unittest.TestCase):
+    """
+    is_kernel_module() detects kernel modules by searching for the
+    "vermagic=" string, which is always present in genuine .ko files.
+    """
+
+    def _make_tmp(self, content: bytes) -> str:
+        f = tempfile.NamedTemporaryFile(delete=False, suffix=".ko")
+        f.write(content)
+        f.close()
+        return f.name
+
+    def tearDown(self):
+        # Clean up any temp files created during the test.
+        for attr in ("_tmpfile",):
+            path = getattr(self, attr, None)
+            if path and os.path.exists(path):
+                os.unlink(path)
+
+    def test_detects_vermagic(self):
+        self._tmpfile = self._make_tmp(b"\x7fELF\x00" * 10 + b"vermagic=5.15.0" + b"\x00" * 10)
+        self.assertTrue(is_kernel_module(self._tmpfile))
+
+    def test_rejects_plain_elf(self):
+        self._tmpfile = self._make_tmp(b"\x7fELF\x00" * 50)
+        self.assertFalse(is_kernel_module(self._tmpfile))
+
+
+class TestIsKernelModuleSigned(unittest.TestCase):
+    """
+    is_kernel_module_signed() detects the "Module signature appended" tail
+    that the kernel's modsign infrastructure writes.
+    """
+
+    def _make_tmp(self, content: bytes) -> str:
+        f = tempfile.NamedTemporaryFile(delete=False, suffix=".ko")
+        f.write(content)
+        f.close()
+        return f.name
+
+    def tearDown(self):
+        for attr in ("_tmpfile",):
+            path = getattr(self, attr, None)
+            if path and os.path.exists(path):
+                os.unlink(path)
+
+    def test_detects_signed(self):
+        # Pad to >28 bytes so the seek(-28, 2) works; place the magic at the end.
+        tail = b"Module signature appended\n\x00\x00"
+        self._tmpfile = self._make_tmp(b"\x00" * 64 + tail)
+        self.assertTrue(is_kernel_module_signed(self._tmpfile))
+
+    def test_rejects_unsigned(self):
+        self._tmpfile = self._make_tmp(b"\x7fELF\x00" * 20)
+        self.assertFalse(is_kernel_module_signed(self._tmpfile))
+
+
+if __name__ == "__main__":
+    unittest.main()
-- 
2.34.1


