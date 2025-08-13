Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F55CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 21:29:03 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.7853.1755120541688878414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 14:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q4phZ8iZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4716fb8e74so188679a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 14:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755120541; x=1755725341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UF5YpVJW2iWfngezdiat8oAssnGEthXkwN13iyaQMA=;
        b=Q4phZ8iZIiO6DT5F868g6tlMAcQS4QojAB6B25lGAx4WCj/ZIeTJk8IkSxR9sNlcwA
         Xsk+/T2emAiV19hDdN3W/taPeAjRo31ZbRHO42XgcX9led39B2t4MfYjVM3rTBj2M1yq
         oCBKHgIyHQ8Zep720mvdxqH/HJqU3TUGdqlXHvaNvnpeBy6u2Dvbb43fmUXwdkO+c305
         tzYtYM5nxACH9OlPwVMSuWRcBO8spu2dbTNegYCy611qM0yD2QbbkGgPG0xeiS1cDn8B
         hyU9NuHzl9S+jwpuHTj3Ct38HZ/TlbnUnzC3jx5+MKQF1qUsRdL5XyH3Jq1peJMaKvjT
         Znag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120541; x=1755725341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UF5YpVJW2iWfngezdiat8oAssnGEthXkwN13iyaQMA=;
        b=laoCFu5/9ygKPkHGyScoSQy+RYT45h+ljDjbDGGOf6BmlWQkm7++KXB7goc6AvFgrT
         0Pd81kZe6Ku44h6kPJQ1D8k4PaSM7OIpuJpvZWOqXcXuTENW646B5L9Dtr27EsqY15RL
         DRkjmVKzIArMqajOs4XAiVrJZT9FjxN4hElNyvv+dxw53NfIfYqXiUX1hUMik8Ah2Ql4
         6Pvp32U+BtKh5p2kx+T/FDYjCA6IQQqH3bgGguDk+JaBOCOUdbCsQFse8FZFcpQFBbWR
         GOmouPcGig1LesrozQzzwCzPRoymn1Lkzv5x9UmdwqWtTZ27vYyFLlYG6vC0gaGbJeRI
         KlMg==
X-Gm-Message-State: AOJu0Yxl8V6Y3r28Lc4oHM31hWAtrX2JuraidKBzbtIZ2qObhPe1RSxm
	IfxpAx88vz4fi0aHBcCUwcdjjfWm/Vr/woT7qT2MvIwyM2HeJ7kNk3zHo1IZsrjvRUdasUZHoUc
	BGZ/2
X-Gm-Gg: ASbGncvyKwMZDvPciJGkJHU2I5UHwWKcYn+2YRFYS9ZngH7t0Eb51RM48sJyshZ0YEx
	cMXTE+o3HLV5CB85gUqw9EYkHxJr9uvwNXDwiHvFGa8fWpdGT3lTp4o7TgrlQcg03y6wH34cvdg
	WRdlmZAhHZ/D2DTDkoUw0UInp7x4BBWVQ+syeVkohjXpMjN0MUEZMWzRFgbh3xy7XCmLQ2MBKwu
	b62FmfU52dOtyQSvsZqaDAgQQ4tQ5nvsG16DUCeS+A/m6zvfYY3HAaSXqaWTq/DIOetk0VedjG1
	Xezz0kkOe8vfO5c8kJRN3AHxensndU6Zi7rax2CJQYvln5UTElhPiPOfVT2HTsadVKOiJ3xfMfm
	y+0GNk8bJRvngX6OI0o1hZSeP
X-Google-Smtp-Source: AGHT+IHdvq/LIUqNJozesttiuBu6GMf1fLpE/h/baZ871nLU8uvL9qEpx4FcJ29CiFJY7QhXrkxuEw==
X-Received: by 2002:a17:903:11c6:b0:23f:c760:fdf0 with SMTP id d9443c01a7336-244586dddaamr9077245ad.45.1755120540870;
        Wed, 13 Aug 2025 14:29:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:38b9:9a51:8a43:9529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a48esm336178545ad.114.2025.08.13.14.29.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 14:29:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] python3: patch CVE-2025-8194
Date: Wed, 13 Aug 2025 14:28:44 -0700
Message-ID: <4ae9daf3d05530952a8b002257dd9afda2e077e4.1755102550.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755102550.git.steve@sakoman.com>
References: <cover.1755102550.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221834

From: Peter Marko <peter.marko@siemens.com>

Pick commit from 3.12 branch mentioned in NVD report.
https://nvd.nist.gov/vuln/detail/CVE-2025-8194

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2025-8194.patch        | 219 ++++++++++++++++++
 .../python/python3_3.10.18.bb                 |   7 +-
 2 files changed, 223 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-8194.patch b/meta/recipes-devtools/python/python3/CVE-2025-8194.patch
new file mode 100644
index 0000000000..44ada01133
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-8194.patch
@@ -0,0 +1,219 @@
+From c9d9f78feb1467e73fd29356c040bde1c104f29f Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 4 Aug 2025 13:45:06 +0200
+Subject: [PATCH] [3.12] gh-130577: tarfile now validates archives to ensure
+ member offsets are non-negative (GH-137027) (#137171)
+
+(cherry picked from commit 7040aa54f14676938970e10c5f74ea93cd56aa38)
+
+Co-authored-by: Alexander Urieles <aeurielesn@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+
+CVE: CVE-2025-8194
+Upstream-Status: Backport [https://github.com/python/cpython/commit/c9d9f78feb1467e73fd29356c040bde1c104f29f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Lib/tarfile.py                                |   3 +
+ Lib/test/test_tarfile.py                      | 156 ++++++++++++++++++
+ ...-07-23-00-35-29.gh-issue-130577.c7EITy.rst |   3 +
+ 3 files changed, 162 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 9999a99d54..59d3f6e5cc 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1613,6 +1613,9 @@ class TarInfo(object):
+         """Round up a byte count by BLOCKSIZE and return it,
+            e.g. _block(834) => 1024.
+         """
++        # Only non-negative offsets are allowed
++        if count < 0:
++            raise InvalidHeaderError("invalid offset")
+         blocks, remainder = divmod(count, BLOCKSIZE)
+         if remainder:
+             blocks += 1
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index a184ba75a8..759fa03ead 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -49,6 +49,7 @@ bz2name = os.path.join(TEMPDIR, "testtar.tar.bz2")
+ xzname = os.path.join(TEMPDIR, "testtar.tar.xz")
+ tmpname = os.path.join(TEMPDIR, "tmp.tar")
+ dotlessname = os.path.join(TEMPDIR, "testtar")
++SPACE = b" "
+ 
+ sha256_regtype = (
+     "e09e4bc8b3c9d9177e77256353b36c159f5f040531bbd4b024a8f9b9196c71ce"
+@@ -4273,6 +4274,161 @@ class TestExtractionFilters(unittest.TestCase):
+             self.expect_exception(TypeError)  # errorlevel is not int
+ 
+ 
++class OffsetValidationTests(unittest.TestCase):
++    tarname = tmpname
++    invalid_posix_header = (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, space, null terminator: 8 bytes
++        + b"000755" + SPACE + tarfile.NUL
++        # uid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0011407" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # magic: 6 bytes, version: 2 bytes
++        + tarfile.POSIX_MAGIC
++        # uname: 32 bytes
++        + tarfile.NUL * 32
++        # gname: 32 bytes
++        + tarfile.NUL * 32
++        # devmajor, space, null terminator: 8 bytes
++        + tarfile.NUL * 6 + SPACE + tarfile.NUL
++        # devminor, space, null terminator: 8 bytes
++        + tarfile.NUL * 6 + SPACE + tarfile.NUL
++        # prefix: 155 bytes
++        + tarfile.NUL * tarfile.LENGTH_PREFIX
++        # padding: 12 bytes
++        + tarfile.NUL * 12
++    )
++    invalid_gnu_header = (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, null terminator: 8 bytes
++        + b"0000755" + tarfile.NUL
++        # uid, null terminator: 8 bytes
++        + b"0000001" + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"0000001" + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0011327" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # magic: 8 bytes
++        + tarfile.GNU_MAGIC
++        # uname: 32 bytes
++        + tarfile.NUL * 32
++        # gname: 32 bytes
++        + tarfile.NUL * 32
++        # devmajor, null terminator: 8 bytes
++        + tarfile.NUL * 8
++        # devminor, null terminator: 8 bytes
++        + tarfile.NUL * 8
++        # padding: 167 bytes
++        + tarfile.NUL * 167
++    )
++    invalid_v7_header = (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, space, null terminator: 8 bytes
++        + b"000755" + SPACE + tarfile.NUL
++        # uid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0010070" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # padding: 255 bytes
++        + tarfile.NUL * 255
++    )
++    valid_gnu_header = tarfile.TarInfo("filename").tobuf(tarfile.GNU_FORMAT)
++    data_block = b"\xff" * tarfile.BLOCKSIZE
++
++    def _write_buffer(self, buffer):
++        with open(self.tarname, "wb") as f:
++            f.write(buffer)
++
++    def _get_members(self, ignore_zeros=None):
++        with open(self.tarname, "rb") as f:
++            with tarfile.open(
++                mode="r", fileobj=f, ignore_zeros=ignore_zeros
++            ) as tar:
++                return tar.getmembers()
++
++    def _assert_raises_read_error_exception(self):
++        with self.assertRaisesRegex(
++            tarfile.ReadError, "file could not be opened successfully"
++        ):
++            self._get_members()
++
++    def test_invalid_offset_header_validations(self):
++        for tar_format, invalid_header in (
++            ("posix", self.invalid_posix_header),
++            ("gnu", self.invalid_gnu_header),
++            ("v7", self.invalid_v7_header),
++        ):
++            with self.subTest(format=tar_format):
++                self._write_buffer(invalid_header)
++                self._assert_raises_read_error_exception()
++
++    def test_early_stop_at_invalid_offset_header(self):
++        buffer = self.valid_gnu_header + self.invalid_gnu_header + self.valid_gnu_header
++        self._write_buffer(buffer)
++        members = self._get_members()
++        self.assertEqual(len(members), 1)
++        self.assertEqual(members[0].name, "filename")
++        self.assertEqual(members[0].offset, 0)
++
++    def test_ignore_invalid_archive(self):
++        # 3 invalid headers with their respective data
++        buffer = (self.invalid_gnu_header + self.data_block) * 3
++        self._write_buffer(buffer)
++        members = self._get_members(ignore_zeros=True)
++        self.assertEqual(len(members), 0)
++
++    def test_ignore_invalid_offset_headers(self):
++        for first_block, second_block, expected_offset in (
++            (
++                (self.valid_gnu_header),
++                (self.invalid_gnu_header + self.data_block),
++                0,
++            ),
++            (
++                (self.invalid_gnu_header + self.data_block),
++                (self.valid_gnu_header),
++                1024,
++            ),
++        ):
++            self._write_buffer(first_block + second_block)
++            members = self._get_members(ignore_zeros=True)
++            self.assertEqual(len(members), 1)
++            self.assertEqual(members[0].name, "filename")
++            self.assertEqual(members[0].offset, expected_offset)
++
++
+ def setUpModule():
+     os_helper.unlink(TEMPDIR)
+     os.makedirs(TEMPDIR)
+diff --git a/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+new file mode 100644
+index 0000000000..342cabbc86
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+@@ -0,0 +1,3 @@
++:mod:`tarfile` now validates archives to ensure member offsets are
++non-negative.  (Contributed by Alexander Enrique Urieles Nieto in
++:gh:`130577`.)
diff --git a/meta/recipes-devtools/python/python3_3.10.18.bb b/meta/recipes-devtools/python/python3_3.10.18.bb
index 875b52cde9..89036ff3b8 100644
--- a/meta/recipes-devtools/python/python3_3.10.18.bb
+++ b/meta/recipes-devtools/python/python3_3.10.18.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
+           file://CVE-2025-8194.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -170,7 +171,7 @@ do_install:append:class-native() {
         # when they're only used for python called with -O or -OO.
         #find ${D} -name *opt-*.pyc -delete
         # Remove all pyc files. There are a ton of them and it is probably faster to let
-        # python create the ones it wants at runtime rather than manage in the sstate 
+        # python create the ones it wants at runtime rather than manage in the sstate
         # tarballs and sysroot creation.
         find ${D} -name *.pyc -delete
 
@@ -206,7 +207,7 @@ do_install:append() {
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
 
-        # Similar to the above, we're getting reproducibility issues with 
+        # Similar to the above, we're getting reproducibility issues with
         # /usr/lib/python3.10/__pycache__/traceback.cpython-310.pyc
         # so remove it too
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.cpython*
@@ -266,7 +267,7 @@ py_package_preprocess () {
         cd -
 
         mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
-        
+
         #Remove the unneeded copy of target sysconfig data
         rm -rf ${PKGD}/${libdir}/python-sysconfigdata
 }
-- 
2.43.0


