Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15230E7E0A3
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:37 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44204.1770629371128998371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EwT64iKx;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-435f177a8f7so2807561f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629369; x=1771234169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3lovjTVcvH7bRG8Yxoh93/2wj5Ut7q0ZKMA3J5resk=;
        b=EwT64iKxfz79JOUYTWYVUsLMCVMbtVB8YxCG61xu9vlZ39sdPFzaF0ZsLKsh3SrQRb
         SAZAC8gX/AM/R2XOmX89c+ufSc6VhfPUlWgO2ZJmj0pAapR6FylRUZhOVpBSZP958OI2
         lITu1AL+Fh1kWpLmRDOYm00IEJMJghxB5ya+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629369; x=1771234169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y3lovjTVcvH7bRG8Yxoh93/2wj5Ut7q0ZKMA3J5resk=;
        b=HK7Xwo6XmZ1JzQuMSsGM1LPWwChLR6U0GOz9OJn005+Qp8S0MgBACIXr/06u+nFq/G
         BoEd6br4erMMBM6h0/P5aGHEw/OWv/Q+laRswByAR+W2uQRlxYy0xBpxwr5RhiXrfJ83
         68TzxGWVTgvFEvqGzXw4PkN5nqGS24TRCegm+9qK2sAptH7Gl0QYnoY8qyvgqj3jZxu/
         ePr1e0SZ96iwDsF+ioZYDOQ9m8xWSVluOsVAseYqhQhXOP5x/fZ94ONv7PkJtV8LgDdL
         RMoK36pmOZdmXaPWvjaTxzz6ufD4Kd5HEiHMD1Zk11f1qYxrNqI1JKrWSwJRLKk/F3of
         DZiQ==
X-Gm-Message-State: AOJu0YzagdkapIMHWr1WFxfF01ZwOL0YHCgZuNNhkyFMbPZT1+oklwAC
	sPEvK1ykF9n6Oo/wwzNgnNbP6EEBc+lI2I038aVXzRersSjGlJK24Akfqec7r0yy1p7P0X/xUN4
	UmdHKklo=
X-Gm-Gg: AZuq6aIVuqLF1rR4DhwtSWunhpWQJqF98wyEHdRjW4beWxH3vzY6CjfMwp70Kyrdn/0
	XotrDTnbzNyBLx8NP2/PwkjJ/wzVnjXp/p0WX8uHe3Af6pO33E97TEkNw7G5Yd4leLdYcdybhCh
	Y0QPJ6961d5ToKYhiWHcBBn3XGjO1ZFQ47GlwKOJay2PeHIkrrsCj3B9xWcV/JSoWckFUqDcn0+
	RyDfVdTMB2M/h5zJlIZqxmrKJMIoRxvD7ttD5UFlvk1BnTMmT+hO22XOHsXwlVUYfZXuTjEidek
	82KCxFnvfIpJNRrhRo4TXPF2sdnqNLSgdMzQBxxlIgJsq86Oi5HazyjuvO2g4S38/OGwisj8TFj
	05vGDqCGFcWJRA35uWzceLk4u38Qnu3DW2bmR6tr/xHR1hCaSTVNFZ56sGuzzEIUIvbcQ/m+ss3
	TRS/oAOpeTavWyGirQFwhavJsXguE5uX14ItHjrsHYmfEh9ldBu87UAaxpcw/kgQTaQku6naNU2
	PaTLvM8bhB/1lU=
X-Received: by 2002:a5d:52cf:0:b0:436:173c:b8e3 with SMTP id ffacd0b85a97d-436293865d9mr12866056f8f.29.1770629369141;
        Mon, 09 Feb 2026 01:29:29 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/25] python3: patch CVE-2025-13837
Date: Mon,  9 Feb 2026 10:28:57 +0100
Message-ID: <cf51cc986fc5f4aba34f31d045e54a96b287ed5f.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230765

From: Peter Marko <peter.marko@siemens.com>

Pick patch from 3.12 branch per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2025-13837.patch       | 162 ++++++++++++++++++
 .../python/python3_3.12.12.bb                 |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-13837.patch b/meta/recipes-devtools/python/python3/CVE-2025-13837.patch
new file mode 100644
index 00000000000..0f2e06a4912
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
+@@ -841,8 +841,7 @@ class TestPlistlib(unittest.TestCase):
+ 
+ class TestBinaryPlistlib(unittest.TestCase):
+ 
+-    @staticmethod
+-    def decode(*objects, offset_size=1, ref_size=1):
++    def build(self, *objects, offset_size=1, ref_size=1):
+         data = [b'bplist00']
+         offset = 8
+         offsets = []
+@@ -854,7 +853,11 @@ class TestBinaryPlistlib(unittest.TestCase):
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
+@@ -963,6 +966,34 @@ class TestBinaryPlistlib(unittest.TestCase):
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
diff --git a/meta/recipes-devtools/python/python3_3.12.12.bb b/meta/recipes-devtools/python/python3_3.12.12.bb
index 280d98424a5..ce2c830655d 100644
--- a/meta/recipes-devtools/python/python3_3.12.12.bb
+++ b/meta/recipes-devtools/python/python3_3.12.12.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2025-6075.patch \
            file://CVE-2025-12084.patch \
            file://CVE-2025-13836.patch \
+           file://CVE-2025-13837.patch \
            "
 
 SRC_URI:append:class-native = " \

