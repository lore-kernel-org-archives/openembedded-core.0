Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC717C5AD7B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 17:56:14 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34977.1786382961813331719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 10:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DfIYVhVH;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: umair.uashah@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so21716631fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786382960; x=1786987760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUBuw/040i16dKgYWrQlN830g+amwyemFLZb4w723yY=;
        b=DfIYVhVHQGVmIRkzYABxIcUz9x7N/xPsJH5bV7zwjQ3s3clDAI9DglMSUODkXZCNOo
         9cyOaR8LG4Nd/bQuH/c6LQI0c3aD0Z4x/mMBPU4e40LQmZfqrn3dvTux9grfpRed0r3x
         JM+LNoptz3nK7iZfAZK+7K4zSisXabcWtoqA47+5x8mShGA7I3/UmxwpUSi9G01XeLkt
         z9PYBvX8DpPfYQHwlslWobtgSMnspdf3J10MRG2NV9zDGHhQFoOuaS++mxBxPuC9wI5m
         yTrKXMCjNuTcxUdNNqRAv/VdJDQNnB1qcjhTuUbESeYd+hhgCeUtYg9KcrrSW/zdpqZ/
         bdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382960; x=1786987760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oUBuw/040i16dKgYWrQlN830g+amwyemFLZb4w723yY=;
        b=nYgbLu8qP48U2qTu2GhjSf6iiYGpO9FbTGGogNn5vEuqeJIaa8lzgRAuGP55BgQzHe
         ItW76pu45Uw9hHYheFSzt0v0wyf2jMwUc0HrEvlIATXvA2cEtJhBi2wYmntslBdierF3
         dXPFFGxzszYbhZvRqOnn17oS0pTGsphENJaq5yI5Ik6F7V+jDe5vm36eec6sQgZoqsQV
         FB3d0GKBH/wW2Qy8HM79AED7QH/PSSuwFbdUCv12c383Aul1Lq0gH+utt+79A8oUC0BY
         bb1i9Ed6Kr/Oxu3HxrIzC2SPoRjeP7iol7+e5MMy6lM+CZ4LKRUO1vHpho8XFUhqVolE
         9XBQ==
X-Gm-Message-State: AOJu0Yyc31FcxcUMJmngqE2A44scTTjczUIwGWD5vgQldZDWaZFW7DW6
	1WCeSTGZ6kfZdJGN8/H8WKwG0A/aWQnz+iIbXegRy3R5rybsfHNziIanbfPwyg==
X-Gm-Gg: AR+sD112BJjdsMsWtEzeYYLYN58wQKqCEgGJDIxkajKOmHuRhbSl+rOa4djkLczysfk
	VTYK/r8bqSZpo3WdAE4TPY3GdcYNWIozHwAUbbNdbeF84T3FbHpXJH1IL2RoU0rixoOwiLUS/kt
	SLiZKNzGBlruJkNB0bDLQz4xWeFKWoCJMgXz1W8RohcDsaqaHFGk7/fTIIiOsjdibbglAqq0qlI
	KluAdsuZG0AJa5kZ4x28gOBeHu+BL6g2JvkQZsdWOEp1L1T+dyT4LX8+RugU0JKY4JC9ltDBIjq
	zYZJZPM6xLX9TWbtjYBXRPODzxxLE1iaSEGZXWFlbojcWJnb2TgOHiNovp7hS0NDKa9O0ry+Phk
	CzMERuHuLlxlfm+RY441lGCAV8AwTwgBU37DObl0Ewi+i3vQWLFcIikX3mEjVRMT94R3EmTGhrZ
	KXuf2F0mMx7nFWSjZxf0TT+gTV4AYPDaam7JFWf8fm2XSr1sEXiuTHunGdGUvyJ8gO3VQk7PTbu
	sV0H16UnUKXDCLw9CI0uOdTxtTVXmxw5witfyi7CR9vprCp7EumdYrKMatrANZS+ZS5
X-Received: by 2002:a05:600c:608a:b0:499:730d:eea9 with SMTP id 5b1f17b1804b1-499730deeefmr41125075e9.6.1786382541542;
        Mon, 10 Aug 2026 10:22:21 -0700 (PDT)
Received: from Ubuntu2404.ithinx.io ([2a02:8071:57d0:9c40:234e:2321:4de:e1bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499740c5e0esm6031755e9.6.2026.08.10.10.22.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:22:20 -0700 (PDT)
From: Umair Ahmed Shah <umair.uashah@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package: extract debug sources from signed kernel modules
Date: Mon, 10 Aug 2026 19:17:41 +0200
Message-ID: <20260810171741.1864438-1-umair.uashah@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243142

splitdebuginfo() returns early for signed kernel modules so that they are
not stripped, since the signature is appended outside the ELF container
and does not survive stripping. That early return also skips the
source_info() call later in the function, so every signed module ends up
with an empty debug source list.

Reading the debug sources does not modify the module: dwarfsrcfiles only
parses its DWARF sections and the appended signature is untouched. Only
the stripping has to be skipped.

The empty list ends up in the pkgdata debugsources, in the SPDX output
when SPDX_INCLUDE_COMPILED_SOURCES is set, and from there in
scripts/contrib/improve_kernel_cve_report.py, which uses the compiled
source list to decide whether a kernel CVE applies. CVEs in module code
are then reported as not-applicable-config because their sources look
uncompiled, which lowers the reported CVE count with no warning.

Collect the debug sources before returning, so signed modules keep their
source list while still being left unstripped.

Introduced in 6859226652 ("package.bbclass: Avoid stripping signed kernel
modules in splitdebuginfo"), which applied the runstrip() signed module
check to splitdebuginfo() as well, where it additionally disables the
source extraction that runstrip() does not perform.

AI-Generated: claude-code/claude-opus-5
Signed-off-by: Umair Ahmed Shah <umair.uashah@gmail.com>
---

Notes for reviewers (not part of the commit message):

I checked that the data is actually available rather than assuming it:
dwarfsrcfiles on a real signed bluetooth.ko exits 0 and returns 1546 lines
covering 21 distinct net/bluetooth/*.c files, so the appended signature does
not obstruct the read at all.

On the build where I found this (aarch64, 6.18.x, 1357 signed modules) every
.ko in the pkgdata debugsources had an empty source list while vmlinux had
7428 entries. Feeding that SPDX into improve_kernel_cve_report.py suppressed
77 kernel CVEs whose affected files are in module code - Bluetooth L2CAP,
brcmfmac, mac80211/cfg80211, fuse and openvswitch among them. I confirmed
those files really are compiled by checking the kernel build tree's object
files directly, independently of SPDX.

Test evidence, against 24905528a09e7a6b2df9cba342b5f9ba6b8bcf3e:

  pristine master, test applied but fix not:
    test_signed_module_keeps_debug_sources ... FAIL
      AssertionError: Expected 'source_info' to be called once. Called 0 times.

  full patch applied:
    Ran 6 tests in 0.021s
    OK          (the 4 pre-existing copydebugsources tests included)

The new tests are hermetic - no build, no objcopy, no dwarfsrcfiles. A signed
module is synthesised by appending the 28 byte kernel signature marker, which
is what is_kernel_module_signed() looks for, and source_info() is mocked so
the test asserts control flow only. They check that the source list is
populated and that the module is byte-for-byte unchanged.

Note that the same early return also precedes the objcopy calls, so no split
debug file is produced for a signed module either. I have deliberately not
asserted that in the test: I have not compared against an otherwise identical
unsigned build and cannot tell whether it is intended, so it did not seem
right to lock it in. Please say if you would like it covered.

I have also not run this through a full signed-kernel image build. The change
is covered by the unit tests above and by the fact that source_info() only
reads the file.

Also worth flagging for the in-flight proposal to have
improve_kernel_cve_report consume debugsources instead of SPDX: it would
inherit this same empty list unless this is fixed first.

 meta/lib/oe/package.py                        |  4 ++
 meta/lib/oeqa/selftest/cases/oelib/package.py | 70 ++++++++++++++++++-
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d047e41..0ba2597 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -813,6 +813,10 @@ def splitdebuginfo(file, dvar, dv, d):
     if file.endswith(".ko") and file.find("/lib/modules/") != -1:
         if oe.package.is_kernel_module_signed(file):
             bb.debug(1, "Skip strip on signed module %s" % file)
+            # Extracting the debug sources only reads the file, so it is still
+            # safe to do for a module we must not strip.
+            if dv["srcdir"]:
+                sources = source_info(file, d)
             return (file, sources)
 
     # Split the file...
diff --git a/meta/lib/oeqa/selftest/cases/oelib/package.py b/meta/lib/oeqa/selftest/cases/oelib/package.py
index 16e13ae..d7d53f9 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/package.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/package.py
@@ -7,10 +7,11 @@
 import os
 import shutil
 import tempfile
+import unittest.mock
 from unittest.case import TestCase
 
 import oe.path
-from oe.package import copydebugsources
+from oe.package import copydebugsources, splitdebuginfo
 
 
 class FakeDataStore:
@@ -270,3 +271,70 @@ class TestCopyDebugSources(TestCase):
             with open(copied_source) as f:
                 self.assertEqual(f.read(), "real\n")
             self.assertFalse(os.path.exists(relocation))
+
+
+class TestSplitDebugInfoSignedModule(TestCase):
+    # The kernel appends this exact 28 byte marker to a signed module, which is
+    # what oe.package.is_kernel_module_signed() looks for.
+    SIGNATURE = b"~Module signature appended~\n"
+
+    def _make_module(self, pkgd, signed):
+        module = os.path.join(pkgd, "usr", "lib", "modules", "1.0",
+                              "kernel", "net", "testmod", "testmod.ko")
+        os.makedirs(os.path.dirname(module))
+        with open(module, "wb") as f:
+            f.write(b"\x7fELF" + b"\x00" * 64)
+            if signed:
+                f.write(self.SIGNATURE)
+        return module
+
+    def _dv(self):
+        return {
+            "libdir": "/usr/lib/debug",
+            "dir": "/.debug",
+            "append": "",
+            "srcdir": "/usr/src/debug",
+        }
+
+    def test_signed_module_keeps_debug_sources(self):
+        with tempfile.TemporaryDirectory(prefix="oe-test-package-") as tmpdir:
+            pkgd = os.path.join(tmpdir, "pkgd")
+            os.makedirs(pkgd)
+            module = self._make_module(pkgd, signed=True)
+            dv = self._dv()
+
+            self.assertTrue(oe.package.is_kernel_module_signed(module),
+                            "test module was not recognised as signed")
+
+            with open(module, "rb") as f:
+                before = f.read()
+
+            d = FakeDataStore({"PKGD": pkgd, "OBJCOPY": "objcopy"})
+            expected = ["/usr/src/debug/testmod/1.0/testmod.c"]
+            with unittest.mock.patch("oe.package.source_info",
+                                     return_value=expected) as source_info:
+                _, sources = splitdebuginfo(module, pkgd, dv, d)
+
+            # The debug sources must still be collected, even though the
+            # module itself is left alone.
+            source_info.assert_called_once_with(module, d)
+            self.assertEqual(sources, expected)
+
+            # The module must be untouched so that its signature stays valid.
+            with open(module, "rb") as f:
+                self.assertEqual(f.read(), before)
+
+    def test_signed_module_without_srcdir_collects_nothing(self):
+        with tempfile.TemporaryDirectory(prefix="oe-test-package-") as tmpdir:
+            pkgd = os.path.join(tmpdir, "pkgd")
+            os.makedirs(pkgd)
+            module = self._make_module(pkgd, signed=True)
+            dv = self._dv()
+            dv["srcdir"] = ""
+
+            d = FakeDataStore({"PKGD": pkgd, "OBJCOPY": "objcopy"})
+            with unittest.mock.patch("oe.package.source_info") as source_info:
+                _, sources = splitdebuginfo(module, pkgd, dv, d)
+
+            source_info.assert_not_called()
+            self.assertEqual(sources, [])
-- 
2.43.0


