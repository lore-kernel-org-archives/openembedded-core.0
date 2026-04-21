Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E7FF89256
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 10:42:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21821.1776767335382176761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 03:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cQatknPs;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891f625344so21404845e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 03:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776767333; x=1777372133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/RfwrppZ5/uZ1q0klgEETnYxMNySn8ycfMmKElIDHM=;
        b=cQatknPsNN8eSON1h4g0hpBD7xIWIT7kSzAmGwgijUcjBgArwj8u34qN24AVK6/dsV
         eUTedW0NRcJUwNVxoTxE6u6Sw1ac31yrOkVnCiqGW9gXmhaRnqj9QqSt5capOSrnReVs
         KPMd/fxY6g63aL5IhpTPlfOBJPecu/WlfSVTejJs96qVOrKsRoS1UsVd34cyr4WSaF/G
         GTBZHiVBj2jl2EI9a8/DFtBrgAE9Vr1Ehpu5NjcOPjAkVN5G4WH9u9FDTe/VkoaeM7II
         bn03T5vvzmaVFAQM/nLLsFJVkMLDfK1Q5JcIzpzhJbcZYgBgAmkExBrs6Ui4gHN3u7xB
         hV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767333; x=1777372133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/RfwrppZ5/uZ1q0klgEETnYxMNySn8ycfMmKElIDHM=;
        b=MbJoTBSbw+dl4L2EMRSxgs5JYWe4DD3kYM/8YrBaEyL1f5qhoTeLin4voxSCJ/06PY
         SVPzPJatU/O6P7nwr9I4YlYAt2eSJ8ghvuSQQMp7UnQcg0KI0zC+hs0GCbsbEQ0skDKs
         JzhI5zq2lteKhWwmdLinKDWgRTuGcJMarJ809DFood7+bMGUKyiH87ZzuqYBsK/Kreum
         BaEezsMWx+DkA1krifbA+fs4Emd8pJre1pqsgJqhqWVpNDyCO5gVDvES4z0hLUh6X/Nz
         C/tE55oLhlI/9PAgncfPrlZp+yVXr8gj3nC7YcvovEHPyXCa53jeoW8cB6zJulcpj0+o
         w9/A==
X-Gm-Message-State: AOJu0YwaUnido0UGtN2Dui9MwvgEPAhjLczNup7ycdkoTxzBNHAFW387
	GWT9hfTIk8x2aJhf2bIMZgiNejHgEafeU6tXD8s71fQUvLnbzAliXIJ/GXY87ZXp
X-Gm-Gg: AeBDieutbz9PJ9FkMsIGUuNycwWEFSJTn4Q7Iz3g2FZoAxBld980I1/mJaz8UUYbsd6
	62NGFiOsgPqRdNjgINfsEP75IxMmjazUo9hCyGv66E+LBCy4CJU7Y9BEpElcezguTFBE1MYocym
	i4fTX8j+TAQSw0IvfsQdW427sWv/LMiRaAS/AH3tgtEFiQZ5z/5dpUtZM1FLzaEoQyz97m8Ogd5
	qdk8Ht/RWF+10pLT313qaVuaf8I34kVO6o4Roua1vo7dzyAjfAJpuVN7VwM9Qa0M1QApCsIH8LZ
	n7C909QpC04t1PelSxctZpgD6fum44d7IaRKc+2YSHuSlwtDYQiAfcxHkrWg8Q+/Axy0uXnV/Tl
	VnR/lA51on2zYu1Io7rGg13AgUU6aGRbp6ZbLrqJ2IHHXQqvj7tMyFH2KfFj73JTZJ8d+WAUAfl
	7VXj9VKgi/aTrrOLkJgt8u3wU//6mwzONulX/21Wcx6BTWHkqGVVqihZFxGwyKvBdMCplytxa82
	JROb5U=
X-Received: by 2002:a05:600c:c112:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-488fb896910mr188892405e9.7.1776767333396;
        Tue, 21 Apr 2026 03:28:53 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([79.123.125.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm328752475e9.12.2026.04.21.03.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:28:53 -0700 (PDT)
From: "Sam Kent" <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH 2/2] oe/package: add unit tests for kernel module detection helpers
Date: Tue, 21 Apr 2026 11:28:45 +0100
Message-Id: <20260421102845.292954-3-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421102845.292954-1-sam.john.kent@gmail.com>
References: <20260421102845.292954-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 10:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235668

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


