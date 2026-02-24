Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901D3E9B275
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21454.1771943096929399950
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OsDxPkgJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483abed83b6so22336095e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943095; x=1772547895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QW1horoQlQsVVx9PW2ZQFt045kErxxOCLH1pyqtx70=;
        b=OsDxPkgJsdUDf2ZKaWoHYT+hTXf96j5nTXMRd8Y3N6jgTv1fJK6pwtyV2ncmoIOcYj
         3c8TwvbnJkZxbQIddL+IH0lRi9HSFBM5nwGFxAmQmQGUioJEvnzep+KqoTdh8pXuV/So
         USTAauAB8y6JjEw7dkf9Mihohlvsq13W/ntts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943095; x=1772547895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2QW1horoQlQsVVx9PW2ZQFt045kErxxOCLH1pyqtx70=;
        b=t12Nu/vkank0CgGpNKmr319s2XkGEj7V4BpK6nvOBXhWBpS3e+/VaPJs1Z08NO69Z8
         TXJYDjBJTQye3y7bDJQVlI+pNtSs6QpLeTcMaFDXV5vtdhnxspY+bVRegplBJ5xIpD2M
         qhKfhM7OjggPjVGjlVY3al2WG5rpxXnsdpTZl8wQ8wLRugX/uKatcyFS12DbODIHkM6O
         LZoNMB8sDSDf2crpj7HSExULRrdWraOmF3N/w/PZr9epPio8GCjFGnfNq5vqOLSLik0w
         NJoyTnEdJkET4VegcS2cMRy+EeHhumejs62RFsPIVspog4+O0mVyWxEyikPsUAbAldG0
         AarA==
X-Gm-Message-State: AOJu0YzUHWlO6jh+uYbCU3M4T4i5g0b+anm8I2oDYxULsHg8Pr5ejAt/
	QRqrTZ2OFKCPo5zS1ldPktd+x05QrxwhwjvarpdG07XzOs8U70jfIlrBsnRD0k/qcMPjn2ohfF/
	AEYOS
X-Gm-Gg: AZuq6aIl4NKJunlUxX4tmAW9bKtE0zBfWVvK8TTG0mmo6UiVmqJBLKftU1cFrLCL/V/
	Rtq4ibJxIvdoQV0+tJzy7PDCHr2HiA77H4m8hDasScQ3PrlROtRFHbFDvxd+TLjJU6cQgg/8Gu4
	mDhGNm+hOc77eVm6Th1CqaKaI02s8VH8tIOvwNS/G0cTFrN6EDI9EXR9rcFlTmOeOaJqWPgy9cs
	Rr2YkRkRyIEv7CQLPqzHfHhU862jJiJ4xyAC8curYoqE5Apckk95LtSow9g7HpoUeyGdf2RRc7p
	ICv3gIznGj9nAS9Ik66Iy5YfeSr69SXfYZIZwHD0b767IDgqy/D4N9zeeRJkxFH3mx0educoSo0
	AfsY0ENDkiH3U1dyhCLYpG6OTIRi8Ws8gZXiTApddSI9fHhURUaLzFBEX25FX5Cpq68DVHv1YmN
	uMKkm3T4rkdtrKG8kBaSrZ9S5adg6248yGupbDSqnOPjFpsxekyQ5V+bWU6JOB1BO9WJtlwYlxq
	bhKc7QoSPDC/bl4UlebsyirHQcQ3FzOqg==
X-Received: by 2002:a05:600c:314a:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-483a95b3e62mr222037135e9.5.1771943094825;
        Tue, 24 Feb 2026 06:24:54 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.24.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:24:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/38] python3: patch CVE-2025-13837
Date: Tue, 24 Feb 2026 15:23:54 +0100
Message-ID: <35018edf45326cb3b83e567e6673e1ec24f2c439.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231768

From: Peter Marko <peter.marko@siemens.com>

Pick patch from 3.12 branch per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

