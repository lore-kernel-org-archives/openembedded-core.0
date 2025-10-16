Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3670BCCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 16:11:58 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.1489.1760631117296338200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 09:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=g4UhF81g;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202510161611551e6fff75ad00020796-4ifehk@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202510161611551e6fff75ad00020796
        for <openembedded-core@lists.openembedded.org>;
        Thu, 16 Oct 2025 18:11:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XUs67b4e8/rtwkMk3t3ZiVXvA6pVJHQ/HWQC9Uk9/po=;
 b=g4UhF81gSWcGzRgF6KnCZAWA7j5J7eu5XrSNu7UJNB51nz+xkXreP4Y7YFnyb36Dhec69z
 pt2evG+3/Rd2nwIzcOExpXmujFQ4nopq3RbkhsYcDO1RebV5ffoycZdLe4JQdrkbvysxz8jx
 p14wvYU4W46j1r9MdvE8+4K5yVRgJvIGbAZFHxJdbONeRtedE98VyHCMzpazFQ9LVyacg/AC
 RukM83A0Nfw/q+X7ANGPhMKLJ+zNNBol6+V3/IBo55J6ItgYrNUPI1A/u/JGqXMJSEcfZhUm
 ZBmDu1fGT0+rkrpb8UUdAQJ/he9qurOA+ZAhh7JfBBexCIhfUQDRIegg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] python3: upgrade 3.12.11 -> 3.12.12
Date: Thu, 16 Oct 2025 18:11:53 +0200
Message-Id: <20251016161153.7730-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 16:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224978

From: Peter Marko <peter.marko@siemens.com>

Drop upstreamed patch and refresh remaining patches.

Release information:
* https://www.python.org/downloads/release/python-31212/
* The release you're looking at is Python 3.12.12, a security bugfix
  release for the legacy 3.12 series.

Handles CVE-2025-59375.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   2 +-
 .../python/python3/CVE-2025-8194.patch        | 219 ------------------
 ...{python3_3.12.11.bb => python3_3.12.12.bb} |   3 +-
 3 files changed, 2 insertions(+), 222 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch
 rename meta/recipes-devtools/python/{python3_3.12.11.bb => python3_3.12.12.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index 1cffdd6e05d..98b3aa42d21 100644
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
index b8243a67f64..00000000000
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
index 1c310773207..9a957c59bca 100644
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

