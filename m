Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398B3CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:44:34 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.3296.1760733868888913811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eXDybQqe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-791c287c10dso2015428b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733868; x=1761338668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1G/xnlcPKvFCDFHsWl1A+K3m//nKVFGzvU3vATkrFs=;
        b=eXDybQqe2BEYPyT6YCRVldOi5O1P6Np+WKSejQoInF5pOxPSm8Cbcijmb5Nem0VCgH
         4OGPwtw2ccF0abkmKBWnW82xTEgd8yWZgTg26RUIrK0SFAWwEBAUlI68rNzTAevuJ42t
         Tp8OxUrs4XbpkwlEcnBYqrDbqK33NEjvuWrFPtebb/RA42OQuw96x9jX8jcnpgZ/Kss3
         Ex4wYc4FzVSpEDjU5ByRxTTKGBCE7h32GIUEWPwPHbjdfgr7LwwANBU44vPWbP+zGPYf
         sRYTEqYII77b8eqpIupv3VZIJNqztaq3gX0dlk/z0O/nXuC7Plcs7zLC5M5/HhtjVMaN
         pulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733868; x=1761338668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1G/xnlcPKvFCDFHsWl1A+K3m//nKVFGzvU3vATkrFs=;
        b=ZWjEgfiDy3aNlZCqzuA9sMZPuXVvqtPE4jNZHqHE9Kq5DR09BZDi2vFvTevSG/vFUo
         6vV8fg+j14wbtsjw4CtPhCuiAcygvyakAZXU5La/yWmo5u0LAMt+NLbOQ0wyS5cVg6fH
         QT4ucdvykzHLDkjgd1jQYuXnlbZ2i7w2usdIgBWCiDq58ieUEmmkl/5oLG8dPATR7CUM
         amHwm89cgu4FLK4giZUyMV1BSug9euNQ6PJ28NVEckFifgYexxu+8AKiulIwdxBO71V1
         4yaEK8U5O/8rcafpkLvsXoMfTzMxJNFn599y4usSfDIAQKz1fePhnR7ven2z9OOXcOKd
         D5aA==
X-Gm-Message-State: AOJu0YwfYRjFTkJ/JG247GniD1ML0xxJaEchBIaTiISF1NPYlC7EqLTq
	e6G0WLGr1SPnfhUDQODf5y8QJEItJCYAJi+fxCWxQLacnspHbzsul990fAqwtU6CaUB7Vw21unH
	VTqwJEZ8=
X-Gm-Gg: ASbGncs+I2CwXKuYHjpmLkICtdxiZdnW9kVWZ4eBdbARQpVVmI2MtiMrymsGeHb/Mci
	AUuYLJJSUQgBJ04Ppmfep917zgt/1S4YYW1X4UdkQ4FZVhukO4VGHcJF1axXm/YnMEKlr9cf3vE
	QtNdwdKy8NxcgyyEIc+qGGfcRY515WbRd0ZuuPBQs4dhQPK+jyzm9D++wXKqbqr9cK7ZLTsVAN7
	/sd4xipbDzJyCF8XtShIqwUWwNFB+5mWfVu+cx+XhIUHTRHng5wc/VM/eREeb3LBwapMxB94QbH
	Qq8P26h7H9RWTuO/kRpnS6I8h0d12TEitrPGqQr9QJUvF/xKFeTFyMGB/hIAp74IZbIXCndmSkG
	jnhNLUdVClSGbnymUxhXJx9PD/VZIWHfHCLqdR57HW66dnnQXg9un2mMIQ/UaaE061tOQjWWI4Y
	H+
X-Google-Smtp-Source: AGHT+IG356akCHrBstrl1KUBzZ4O666Q17Q8fJK/FInZX6kQuY/YxlWtzVDKSxtdk9w6lxfoULt28A==
X-Received: by 2002:a05:6a00:228c:b0:77f:416e:de8e with SMTP id d2e1a72fcca58-7a220b0bf96mr5534216b3a.26.1760733867925;
        Fri, 17 Oct 2025 13:44:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm477066b3a.70.2025.10.17.13.44.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:44:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] python3: upgrade 3.10.18 -> 3.10.19
Date: Fri, 17 Oct 2025 13:44:07 -0700
Message-ID: <9b3dbd691f6ebdbdfe88cef3d3a676ddd1399c63.1760733724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733724.git.steve@sakoman.com>
References: <cover.1760733724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225069

From: Peter Marko <peter.marko@siemens.com>

Drop upstreamed patch and refresh remaining patches.

Release information:
* https://www.python.org/downloads/release/python-31019/
* The release you're looking at is Python 3.10.19, a security bugfix
  release for the legacy 3.10 series.

Handles CVE-2025-59375, CVE-2025-47273 and CVE-2024-6345.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   2 +-
 .../python/python3/CVE-2025-8194.patch        | 219 ------------------
 ...{python3_3.10.18.bb => python3_3.10.19.bb} |   3 +-
 3 files changed, 2 insertions(+), 222 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch
 rename meta/recipes-devtools/python/{python3_3.10.18.bb => python3_3.10.19.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index e6d7778ccd..0c51b038bb 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -16,7 +16,7 @@ diff --git a/Lib/tarfile.py b/Lib/tarfile.py
 index 3bbbcaa..473167d 100755
 --- a/Lib/tarfile.py
 +++ b/Lib/tarfile.py
-@@ -2675,7 +2675,8 @@ class TarFile(object):
+@@ -2678,7 +2678,8 @@ class TarFile(object):
                      os.lchown(targetpath, u, g)
                  else:
                      os.chown(targetpath, u, g)
diff --git a/meta/recipes-devtools/python/python3/CVE-2025-8194.patch b/meta/recipes-devtools/python/python3/CVE-2025-8194.patch
deleted file mode 100644
index 44ada01133..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2025-8194.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From c9d9f78feb1467e73fd29356c040bde1c104f29f Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 4 Aug 2025 13:45:06 +0200
-Subject: [PATCH] [3.12] gh-130577: tarfile now validates archives to ensure
- member offsets are non-negative (GH-137027) (#137171)
-
-(cherry picked from commit 7040aa54f14676938970e10c5f74ea93cd56aa38)
-
-Co-authored-by: Alexander Urieles <aeurielesn@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-
-CVE: CVE-2025-8194
-Upstream-Status: Backport [https://github.com/python/cpython/commit/c9d9f78feb1467e73fd29356c040bde1c104f29f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- Lib/tarfile.py                                |   3 +
- Lib/test/test_tarfile.py                      | 156 ++++++++++++++++++
- ...-07-23-00-35-29.gh-issue-130577.c7EITy.rst |   3 +
- 3 files changed, 162 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 9999a99d54..59d3f6e5cc 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -1613,6 +1613,9 @@ class TarInfo(object):
-         """Round up a byte count by BLOCKSIZE and return it,
-            e.g. _block(834) => 1024.
-         """
-+        # Only non-negative offsets are allowed
-+        if count < 0:
-+            raise InvalidHeaderError("invalid offset")
-         blocks, remainder = divmod(count, BLOCKSIZE)
-         if remainder:
-             blocks += 1
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index a184ba75a8..759fa03ead 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -49,6 +49,7 @@ bz2name = os.path.join(TEMPDIR, "testtar.tar.bz2")
- xzname = os.path.join(TEMPDIR, "testtar.tar.xz")
- tmpname = os.path.join(TEMPDIR, "tmp.tar")
- dotlessname = os.path.join(TEMPDIR, "testtar")
-+SPACE = b" "
- 
- sha256_regtype = (
-     "e09e4bc8b3c9d9177e77256353b36c159f5f040531bbd4b024a8f9b9196c71ce"
-@@ -4273,6 +4274,161 @@ class TestExtractionFilters(unittest.TestCase):
-             self.expect_exception(TypeError)  # errorlevel is not int
- 
- 
-+class OffsetValidationTests(unittest.TestCase):
-+    tarname = tmpname
-+    invalid_posix_header = (
-+        # name: 100 bytes
-+        tarfile.NUL * tarfile.LENGTH_NAME
-+        # mode, space, null terminator: 8 bytes
-+        + b"000755" + SPACE + tarfile.NUL
-+        # uid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # gid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # size, space: 12 bytes
-+        + b"\xff" * 11 + SPACE
-+        # mtime, space: 12 bytes
-+        + tarfile.NUL * 11 + SPACE
-+        # chksum: 8 bytes
-+        + b"0011407" + tarfile.NUL
-+        # type: 1 byte
-+        + tarfile.REGTYPE
-+        # linkname: 100 bytes
-+        + tarfile.NUL * tarfile.LENGTH_LINK
-+        # magic: 6 bytes, version: 2 bytes
-+        + tarfile.POSIX_MAGIC
-+        # uname: 32 bytes
-+        + tarfile.NUL * 32
-+        # gname: 32 bytes
-+        + tarfile.NUL * 32
-+        # devmajor, space, null terminator: 8 bytes
-+        + tarfile.NUL * 6 + SPACE + tarfile.NUL
-+        # devminor, space, null terminator: 8 bytes
-+        + tarfile.NUL * 6 + SPACE + tarfile.NUL
-+        # prefix: 155 bytes
-+        + tarfile.NUL * tarfile.LENGTH_PREFIX
-+        # padding: 12 bytes
-+        + tarfile.NUL * 12
-+    )
-+    invalid_gnu_header = (
-+        # name: 100 bytes
-+        tarfile.NUL * tarfile.LENGTH_NAME
-+        # mode, null terminator: 8 bytes
-+        + b"0000755" + tarfile.NUL
-+        # uid, null terminator: 8 bytes
-+        + b"0000001" + tarfile.NUL
-+        # gid, space, null terminator: 8 bytes
-+        + b"0000001" + tarfile.NUL
-+        # size, space: 12 bytes
-+        + b"\xff" * 11 + SPACE
-+        # mtime, space: 12 bytes
-+        + tarfile.NUL * 11 + SPACE
-+        # chksum: 8 bytes
-+        + b"0011327" + tarfile.NUL
-+        # type: 1 byte
-+        + tarfile.REGTYPE
-+        # linkname: 100 bytes
-+        + tarfile.NUL * tarfile.LENGTH_LINK
-+        # magic: 8 bytes
-+        + tarfile.GNU_MAGIC
-+        # uname: 32 bytes
-+        + tarfile.NUL * 32
-+        # gname: 32 bytes
-+        + tarfile.NUL * 32
-+        # devmajor, null terminator: 8 bytes
-+        + tarfile.NUL * 8
-+        # devminor, null terminator: 8 bytes
-+        + tarfile.NUL * 8
-+        # padding: 167 bytes
-+        + tarfile.NUL * 167
-+    )
-+    invalid_v7_header = (
-+        # name: 100 bytes
-+        tarfile.NUL * tarfile.LENGTH_NAME
-+        # mode, space, null terminator: 8 bytes
-+        + b"000755" + SPACE + tarfile.NUL
-+        # uid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # gid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # size, space: 12 bytes
-+        + b"\xff" * 11 + SPACE
-+        # mtime, space: 12 bytes
-+        + tarfile.NUL * 11 + SPACE
-+        # chksum: 8 bytes
-+        + b"0010070" + tarfile.NUL
-+        # type: 1 byte
-+        + tarfile.REGTYPE
-+        # linkname: 100 bytes
-+        + tarfile.NUL * tarfile.LENGTH_LINK
-+        # padding: 255 bytes
-+        + tarfile.NUL * 255
-+    )
-+    valid_gnu_header = tarfile.TarInfo("filename").tobuf(tarfile.GNU_FORMAT)
-+    data_block = b"\xff" * tarfile.BLOCKSIZE
-+
-+    def _write_buffer(self, buffer):
-+        with open(self.tarname, "wb") as f:
-+            f.write(buffer)
-+
-+    def _get_members(self, ignore_zeros=None):
-+        with open(self.tarname, "rb") as f:
-+            with tarfile.open(
-+                mode="r", fileobj=f, ignore_zeros=ignore_zeros
-+            ) as tar:
-+                return tar.getmembers()
-+
-+    def _assert_raises_read_error_exception(self):
-+        with self.assertRaisesRegex(
-+            tarfile.ReadError, "file could not be opened successfully"
-+        ):
-+            self._get_members()
-+
-+    def test_invalid_offset_header_validations(self):
-+        for tar_format, invalid_header in (
-+            ("posix", self.invalid_posix_header),
-+            ("gnu", self.invalid_gnu_header),
-+            ("v7", self.invalid_v7_header),
-+        ):
-+            with self.subTest(format=tar_format):
-+                self._write_buffer(invalid_header)
-+                self._assert_raises_read_error_exception()
-+
-+    def test_early_stop_at_invalid_offset_header(self):
-+        buffer = self.valid_gnu_header + self.invalid_gnu_header + self.valid_gnu_header
-+        self._write_buffer(buffer)
-+        members = self._get_members()
-+        self.assertEqual(len(members), 1)
-+        self.assertEqual(members[0].name, "filename")
-+        self.assertEqual(members[0].offset, 0)
-+
-+    def test_ignore_invalid_archive(self):
-+        # 3 invalid headers with their respective data
-+        buffer = (self.invalid_gnu_header + self.data_block) * 3
-+        self._write_buffer(buffer)
-+        members = self._get_members(ignore_zeros=True)
-+        self.assertEqual(len(members), 0)
-+
-+    def test_ignore_invalid_offset_headers(self):
-+        for first_block, second_block, expected_offset in (
-+            (
-+                (self.valid_gnu_header),
-+                (self.invalid_gnu_header + self.data_block),
-+                0,
-+            ),
-+            (
-+                (self.invalid_gnu_header + self.data_block),
-+                (self.valid_gnu_header),
-+                1024,
-+            ),
-+        ):
-+            self._write_buffer(first_block + second_block)
-+            members = self._get_members(ignore_zeros=True)
-+            self.assertEqual(len(members), 1)
-+            self.assertEqual(members[0].name, "filename")
-+            self.assertEqual(members[0].offset, expected_offset)
-+
-+
- def setUpModule():
-     os_helper.unlink(TEMPDIR)
-     os.makedirs(TEMPDIR)
-diff --git a/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
-new file mode 100644
-index 0000000000..342cabbc86
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
-@@ -0,0 +1,3 @@
-+:mod:`tarfile` now validates archives to ensure member offsets are
-+non-negative.  (Contributed by Alexander Enrique Urieles Nieto in
-+:gh:`130577`.)
diff --git a/meta/recipes-devtools/python/python3_3.10.18.bb b/meta/recipes-devtools/python/python3_3.10.19.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.18.bb
rename to meta/recipes-devtools/python/python3_3.10.19.bb
index 89036ff3b8..8680c13893 100644
--- a/meta/recipes-devtools/python/python3_3.10.18.bb
+++ b/meta/recipes-devtools/python/python3_3.10.19.bb
@@ -37,7 +37,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
-           file://CVE-2025-8194.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -46,7 +45,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "ae665bc678abd9ab6a6e1573d2481625a53719bc517e9a634ed2b9fefae3817f"
+SRC_URI[sha256sum] = "c8f4a596572201d81dd7df91f70e177e19a70f1d489968b54b5fbbf29a97c076"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


