Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C506CCD1A4
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:40:14 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.3153.1760733611037057431
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yxq7Q+Gf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so2294759b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733610; x=1761338410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL0KRka7xId/ZynaqQAT7PQv6mQwDjZ7A+7+GF4/Au4=;
        b=yxq7Q+GfOM6sipKI8unf0WNGcXpjfobRaT3y+QmkzpC2fXpU2IOVNiqSyp27oabLj3
         aWJW1rGYjB6n2bw8/HD+XfZ93V13pfgDKAPVzv1n74vHwTJerPkqIG+cNRvEf+68rbTW
         BXh59fNbVP0wDvy0Tj14K0yuwkivwp747XNXAZbZhxQlMf/eyGptbQ6TtOxOUMD/Zjdj
         QBMzR6INOsZkeOzHVHqiQrynNn1J3dlRzr3VaPGb5bWMndZ2Q+cdPtRX2AzHNh0GBgal
         9hF7EE7et1GYtwxg/ITFTDGxQfA0UPdYz1b3TEUIqk2mZZXM8iYT6A+59JIR5Ve4HNmU
         EsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733610; x=1761338410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL0KRka7xId/ZynaqQAT7PQv6mQwDjZ7A+7+GF4/Au4=;
        b=VkTESMru5wgLtu0TuJzMED6rscGvhZN11dtV3C4eTZU50tUhGXcJi2vM6mgosUfWFL
         bhUPtdMehF1pZHIn1rn5/Dw5Gj0dnEseJFw3Le7P4Umw8NgUiHrGloPRAJV2gNiTtaBx
         E8aqLbSDkKa8+lLYVVDA7ls52Jinc+T3JMwl4aMsKLKfklJHrtwaLrn19SGps4H2RqSr
         wrMMfK1LJAhR78TuVkk02ZQPYihdHf68MF88++RUFfJ1WRJOr12u0jYLscEU3WPCyWjE
         ZgodtE2uPGs9+ogi+APMLS2myB3G67QpIyz/vwdt1xosNrvsi51CuLMzWpMwVDdS2oeV
         ib8A==
X-Gm-Message-State: AOJu0Ywk5NG7d3VnxlNKKdH+/s4dLiClwooqB4R13jq+f/Wzq28MC9wB
	5rXVki2AJflK6cue5eEpkvR/lP+HtwPOu/j3no7+ABvhu7R8vvpvZ2i8wXsvaDQVCD2koeGj1P9
	yv9gH9YY=
X-Gm-Gg: ASbGnctxKrkJ3fe3wNHqNyq6TH7RRj2A2PPkQYE65g2lt81FQYASVunm82w6l5/k738
	PA37hprU6/lqTp5Bl2wh7P8EiiusN4Cf6xsjxVMGgYyezDfVAvjDKcTwPJ1RLwJjtgdh8l3HF3O
	IOoNBmFup1egDNB0/P1lpcO8magh7EGmXK89UL0kmVcFQiqcnEsLKusfvXEG5YQQqt2e2yBE3jq
	OtkuwWLw3KbW+qXKxV+k7+UQCQZ8KZ+kQW3nIoVyITQE6qLOR9Ba6YApQpmcoCG7NaYP6+Oax2k
	DOmDmnSkLa3g/K0U8iX3wh3va/sVP7g+YqvRXkx+yMIICkRxje65kl6DY78Ze6jXieQCrAKE3KI
	K3D7cIrWP633uyVGr0wvnBqC71G3ph2o3KDf6EP9Rzf6UVjHlj/i7SJ3qpRqljG1QgHGNrSoH9q
	oq
X-Google-Smtp-Source: AGHT+IEbS3faaVm0OsswlrUz9NxdICsp3s9qWIULzwGI5E4tr7PoEHBW5W1MzNBojYLirktqkpGmzA==
X-Received: by 2002:a05:6a00:b8f:b0:77e:4534:7f1c with SMTP id d2e1a72fcca58-7a21f76888amr6424302b3a.0.1760733610164;
        Fri, 17 Oct 2025 13:40:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.40.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:40:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/26] python3: upgrade 3.12.11 -> 3.12.12
Date: Fri, 17 Oct 2025 13:39:07 -0700
Message-ID: <f1234b8451ba843b5f9ec1d2066c21f54d6bc3b8.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225058

From: Peter Marko <peter.marko@siemens.com>

Drop upstreamed patch and refresh remaining patches.

Release information:
* https://www.python.org/downloads/release/python-31212/
* The release you're looking at is Python 3.12.12, a security bugfix
  release for the legacy 3.12 series.

Handles CVE-2025-59375.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   2 +-
 .../python/python3/CVE-2025-8194.patch        | 219 ------------------
 ...{python3_3.12.11.bb => python3_3.12.12.bb} |   3 +-
 3 files changed, 2 insertions(+), 222 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch
 rename meta/recipes-devtools/python/{python3_3.12.11.bb => python3_3.12.12.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index 1cffdd6e05..98b3aa42d2 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -16,7 +16,7 @@ diff --git a/Lib/tarfile.py b/Lib/tarfile.py
 index 0a0f31e..4dfb67d 100755
 --- a/Lib/tarfile.py
 +++ b/Lib/tarfile.py
-@@ -2685,7 +2685,8 @@ class TarFile(object):
+@@ -2688,7 +2688,8 @@ class TarFile(object):
                      os.lchown(targetpath, u, g)
                  else:
                      os.chown(targetpath, u, g)
diff --git a/meta/recipes-devtools/python/python3/CVE-2025-8194.patch b/meta/recipes-devtools/python/python3/CVE-2025-8194.patch
deleted file mode 100644
index b8243a67f6..0000000000
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
-@@ -1615,6 +1615,9 @@ class TarInfo(object):
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
-@@ -50,6 +50,7 @@ bz2name = os.path.join(TEMPDIR, "testtar.tar.bz2")
- xzname = os.path.join(TEMPDIR, "testtar.tar.xz")
- tmpname = os.path.join(TEMPDIR, "tmp.tar")
- dotlessname = os.path.join(TEMPDIR, "testtar")
-+SPACE = b" "
- 
- sha256_regtype = (
-     "e09e4bc8b3c9d9177e77256353b36c159f5f040531bbd4b024a8f9b9196c71ce"
-@@ -4488,6 +4489,161 @@ class OverwriteTests(archiver_tests.OverwriteTests, unittest.TestCase):
-         ar.extractall(self.testdir, filter='fully_trusted')
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
diff --git a/meta/recipes-devtools/python/python3_3.12.11.bb b/meta/recipes-devtools/python/python3_3.12.12.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.11.bb
rename to meta/recipes-devtools/python/python3_3.12.12.bb
index 1c31077320..9a957c59bc 100644
--- a/meta/recipes-devtools/python/python3_3.12.11.bb
+++ b/meta/recipes-devtools/python/python3_3.12.12.bb
@@ -34,14 +34,13 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
-           file://CVE-2025-8194.patch \
            "
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "c30bb24b7f1e9a19b11b55a546434f74e739bb4c271a3e3a80ff4380d49f7adb"
+SRC_URI[sha256sum] = "fb85a13414b028c49ba18bbd523c2d055a30b56b18b92ce454ea2c51edc656c4"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


