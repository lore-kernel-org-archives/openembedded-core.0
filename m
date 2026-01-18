Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F57DC9832F
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 21:18:06 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22629.1768771080615954163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jan 2026 13:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=EI+pTke8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202601182117589820d2fa2e000207ae-rrrayt@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202601182117589820d2fa2e000207ae
        for <openembedded-core@lists.openembedded.org>;
        Sun, 18 Jan 2026 22:17:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jKNGkkFZxcNGtkSd9zCQkd6fhzTO4wV9wRksDONm6PM=;
 b=EI+pTke8FN91k9NjQihSaSLr/rFDY3/1Uqri+F2Z2yYz5hYjTyHHvhCBGRUYrzd6esU9ph
 0MEiOYNWEBW9bx94t47zZJ0/SbbblTfXlr7eQd3qKtGgvOPy8fWXIpY0IEq5g4OhDProvHNx
 H7U00TqEaaA8Yx3VAg8kMBnYWKNkkemtY9sC2iJdpXrc4Sk6Okl62j6A2rgbQ06wA2dZCmka
 +lXeere+udjOWe/7XtLV4ZQQiKj4AS6KGC4sW2lc2YOUiJJFa8JUPyXuewCSp4TZetjER54U
 mj4XcIhc5g2r5rWGMGRPY+m53/o05DAs9S8aXkGaP2z+loo+vHQsPq2w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] python3: patch CVE-2025-13837
Date: Sun, 18 Jan 2026 22:17:56 +0100
Message-Id: <20260118211756.3870338-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jan 2026 21:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229587

From: Peter Marko <peter.marko@siemens.com>

Pick patch from 3.12 branch per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/python3/CVE-2025-13837.patch       | 162 ++++++++++++++++++
 .../python/python3_3.10.19.bb                 |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13837.patch b/meta/recipes-devtools/python/python3/CVE-2025-13837.patch
new file mode 100644
index 00000000000..36bf75792bb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-13837.patch
@@ -0,0 +1,162 @@
+From 5a8b19677d818fb41ee55f310233772e15aa1a2b Mon Sep 17 00:00:00 2001
+From: Serhiy Storchaka <storchaka@gmail.com>
+Date: Mon, 22 Dec 2025 15:49:44 +0200
+Subject: [PATCH] [3.12] gh-119342: Fix a potential denial of service in
+ plistlib (GH-119343) (#142149)
+
+Reading a specially prepared small Plist file could cause OOM because file's
+read(n) preallocates a bytes object for reading the specified amount of
+data. Now plistlib reads large data by chunks, therefore the upper limit of
+consumed memory is proportional to the size of the input file.
+(cherry picked from commit 694922cf40aa3a28f898b5f5ee08b71b4922df70)
+
+CVE: CVE-2025-13837
+Upstream-Status: Backport [https://github.com/python/cpython/commit/5a8b19677d818fb41ee55f310233772e15aa1a2b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Lib/plistlib.py                               | 31 ++++++++++------
+ Lib/test/test_plistlib.py                     | 37 +++++++++++++++++--
+ ...-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst |  5 +++
+ 3 files changed, 59 insertions(+), 14 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst
+
+diff --git a/Lib/plistlib.py b/Lib/plistlib.py
+index 3292c30d5f..c5554ea1f7 100644
+--- a/Lib/plistlib.py
++++ b/Lib/plistlib.py
+@@ -73,6 +73,9 @@ from xml.parsers.expat import ParserCreate
+ PlistFormat = enum.Enum('PlistFormat', 'FMT_XML FMT_BINARY', module=__name__)
+ globals().update(PlistFormat.__members__)
+ 
++# Data larger than this will be read in chunks, to prevent extreme
++# overallocation.
++_MIN_READ_BUF_SIZE = 1 << 20
+ 
+ class UID:
+     def __init__(self, data):
+@@ -499,12 +502,24 @@ class _BinaryPlistParser:
+ 
+         return tokenL
+ 
++    def _read(self, size):
++        cursize = min(size, _MIN_READ_BUF_SIZE)
++        data = self._fp.read(cursize)
++        while True:
++            if len(data) != cursize:
++                raise InvalidFileException
++            if cursize == size:
++                return data
++            delta = min(cursize, size - cursize)
++            data += self._fp.read(delta)
++            cursize += delta
++
+     def _read_ints(self, n, size):
+-        data = self._fp.read(size * n)
++        data = self._read(size * n)
+         if size in _BINARY_FORMAT:
+             return struct.unpack(f'>{n}{_BINARY_FORMAT[size]}', data)
+         else:
+-            if not size or len(data) != size * n:
++            if not size:
+                 raise InvalidFileException()
+             return tuple(int.from_bytes(data[i: i + size], 'big')
+                          for i in range(0, size * n, size))
+@@ -561,22 +576,16 @@ class _BinaryPlistParser:
+ 
+         elif tokenH == 0x40:  # data
+             s = self._get_size(tokenL)
+-            result = self._fp.read(s)
+-            if len(result) != s:
+-                raise InvalidFileException()
++            result = self._read(s)
+ 
+         elif tokenH == 0x50:  # ascii string
+             s = self._get_size(tokenL)
+-            data = self._fp.read(s)
+-            if len(data) != s:
+-                raise InvalidFileException()
++            data = self._read(s)
+             result = data.decode('ascii')
+ 
+         elif tokenH == 0x60:  # unicode string
+             s = self._get_size(tokenL) * 2
+-            data = self._fp.read(s)
+-            if len(data) != s:
+-                raise InvalidFileException()
++            data = self._read(s)
+             result = data.decode('utf-16be')
+ 
+         elif tokenH == 0x80:  # UID
+diff --git a/Lib/test/test_plistlib.py b/Lib/test/test_plistlib.py
+index fa46050658..229a5a242e 100644
+--- a/Lib/test/test_plistlib.py
++++ b/Lib/test/test_plistlib.py
+@@ -838,8 +838,7 @@ class TestPlistlib(unittest.TestCase):
+ 
+ class TestBinaryPlistlib(unittest.TestCase):
+ 
+-    @staticmethod
+-    def decode(*objects, offset_size=1, ref_size=1):
++    def build(self, *objects, offset_size=1, ref_size=1):
+         data = [b'bplist00']
+         offset = 8
+         offsets = []
+@@ -851,7 +850,11 @@ class TestBinaryPlistlib(unittest.TestCase):
+                            len(objects), 0, offset)
+         data.extend(offsets)
+         data.append(tail)
+-        return plistlib.loads(b''.join(data), fmt=plistlib.FMT_BINARY)
++        return b''.join(data)
++
++    def decode(self, *objects, offset_size=1, ref_size=1):
++        data = self.build(*objects, offset_size=offset_size, ref_size=ref_size)
++        return plistlib.loads(data, fmt=plistlib.FMT_BINARY)
+ 
+     def test_nonstandard_refs_size(self):
+         # Issue #21538: Refs and offsets are 24-bit integers
+@@ -959,6 +962,34 @@ class TestBinaryPlistlib(unittest.TestCase):
+                 with self.assertRaises(plistlib.InvalidFileException):
+                     plistlib.loads(b'bplist00' + data, fmt=plistlib.FMT_BINARY)
+ 
++    def test_truncated_large_data(self):
++        self.addCleanup(os_helper.unlink, os_helper.TESTFN)
++        def check(data):
++            with open(os_helper.TESTFN, 'wb') as f:
++                f.write(data)
++            # buffered file
++            with open(os_helper.TESTFN, 'rb') as f:
++                with self.assertRaises(plistlib.InvalidFileException):
++                    plistlib.load(f, fmt=plistlib.FMT_BINARY)
++            # unbuffered file
++            with open(os_helper.TESTFN, 'rb', buffering=0) as f:
++                with self.assertRaises(plistlib.InvalidFileException):
++                    plistlib.load(f, fmt=plistlib.FMT_BINARY)
++        for w in range(20, 64):
++            s = 1 << w
++            # data
++            check(self.build(b'\x4f\x13' + s.to_bytes(8, 'big')))
++            # ascii string
++            check(self.build(b'\x5f\x13' + s.to_bytes(8, 'big')))
++            # unicode string
++            check(self.build(b'\x6f\x13' + s.to_bytes(8, 'big')))
++            # array
++            check(self.build(b'\xaf\x13' + s.to_bytes(8, 'big')))
++            # dict
++            check(self.build(b'\xdf\x13' + s.to_bytes(8, 'big')))
++            # number of objects
++            check(b'bplist00' + struct.pack('>6xBBQQQ', 1, 1, s, 0, 8))
++
+ 
+ class TestKeyedArchive(unittest.TestCase):
+     def test_keyed_archive_data(self):
+diff --git a/Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst b/Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst
+new file mode 100644
+index 0000000000..04fd8faca4
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2024-05-21-22-11-31.gh-issue-119342.BTFj4Z.rst
+@@ -0,0 +1,5 @@
++Fix a potential memory denial of service in the :mod:`plistlib` module.
++When reading a Plist file received from untrusted source, it could cause
++an arbitrary amount of memory to be allocated.
++This could have led to symptoms including a :exc:`MemoryError`, swapping, out
++of memory (OOM) killed processes or containers, or even system crashes.
diff --git a/meta/recipes-devtools/python/python3_3.10.19.bb b/meta/recipes-devtools/python/python3_3.10.19.bb
index 5140445ad81..b87fc8d9ef2 100644
--- a/meta/recipes-devtools/python/python3_3.10.19.bb
+++ b/meta/recipes-devtools/python/python3_3.10.19.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
            file://CVE-2025-6075.patch \
            file://CVE-2025-13836.patch \
+           file://CVE-2025-13837.patch \
            "
 
 SRC_URI:append:class-native = " \

