Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE545CA0EC0
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 14:44:41 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.7607.1754750672644089170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 07:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ps/uL4Tu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24049d16515so25597915ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754750672; x=1755355472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEXaJz3584lbCVnd/4Cs8gdU1HDTK6tV8dW3t1zDkpw=;
        b=ps/uL4TukJt26Eb82YAuKKpbb+H7QQO5h3rlTtQG+8ByPs4WzlFHljA5RnXFv5PeHQ
         B/QM9nc6LBr1KbIvedJQvcLb6qz6Y/D+COet0Dj0JILH7nzpCojZZDDf9wN0aw4wuOE8
         rDvepTdRB2ElMX8najZZXwu7z3mTMsd+uYyojCOoDE/DxGHplyGe0Sw7cEolNP2lx4Uh
         QLRojEYxfyISdMUINNzjx74qqnWQ729m0eMKjg5+e1bQEaAEady+SUAdCufkD1/qfz8n
         wPBpKpXKwyNNfuo5gv+MHhJPJvaIEvcrdYbOrPqIvzIo0Z9BuLwn49fGTl3UyxjaO8Vh
         IRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754750672; x=1755355472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEXaJz3584lbCVnd/4Cs8gdU1HDTK6tV8dW3t1zDkpw=;
        b=CmSxmGyekY9AUVu6vqBMkVUo5AkFZZSzhbBoUXDLtsbFEiqrUswZUK43jzjcvFI2vy
         1T+Dj7VRvAWZZW9GU+3XOR7UU5kd/SETKABrHr1Hz7CTH53RaV0vdc77h6UCpmWLmF6n
         1Bb14fAwuIbpdw73UZ57SUJq3pQ6JHKPksVzKUntLgznf7WOCadN2n/MBSoHVMe+U9Wv
         enoWHQuQ1+IKBY3kDc6Pjty6RS+hMead8vGZEFxF7k3ax8xejNYxmKLhVJRKgkSiLvZq
         hYwHinPO99+mPRGUA42edybAIgAbntECvmxwP52TbNnaV2H1uOYamqrnhEa91uT33nw0
         hMfA==
X-Gm-Message-State: AOJu0YwwRuDL09FiLJkUiwfAKQ75ItB4xWnUCBZIR5nI20pTXivXTL1/
	qB3aMb4tTubxL8nmv9np8yliFZrVJUPb9iuyhcPKkDDiluljTFTm8kPUdbqmhODJIhm6hZzBfB7
	7XR5J
X-Gm-Gg: ASbGncvKID1k6+4raqxkMSnEnTdlW3a/wUlStvmTFgPA11/8myoKUcn8QTLqsXFI7kG
	aksrmk8dVqM4ucxYgEffTSWyeu5KV6CW92ZGKP3Mi5O45Vih6TrxaW0srTj6jydMfPaBslUYD2Q
	pm9iKPiVLr7pFrQwFRBpbXlRoVXWIP8cOypfjRDwQt21aHMKFzbF2BiK8KU1cGwD7pLpq8irJDE
	xkTECnFuSqoPMmemEe8mrL1ntY+wOyFBAVkboCxnPlV4DRczaYi2eVF2iPdl6ZE1FFNivK51+gl
	a8IRvBk9sLWPcm8C0NJWOM07z5lFURIjACTJteRsHj3BIWhVuS5C+wfhqNzNP55c7P1XVI0qlX8
	N1+cr7VXMih5ACg==
X-Google-Smtp-Source: AGHT+IF/kec/Bq4VvcT6CM7DpfeeDT5VVKAFTt91xFAs0zQBeRycmOovRrce6LwGBnBqdmoNRSX8Zw==
X-Received: by 2002:a17:902:c94a:b0:240:3913:7c84 with SMTP id d9443c01a7336-242c1ecc793mr93876325ad.4.1754750671682;
        Sat, 09 Aug 2025 07:44:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e40b:779f:346e:b2b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b428f4c8639sm5736428a12.43.2025.08.09.07.44.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 07:44:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 3/6] python3: fix CVE-2025-8194
Date: Sat,  9 Aug 2025 07:44:19 -0700
Message-ID: <c0f1143ca3f189fc6346a445a381829aed78aae8.1754750560.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754750560.git.steve@sakoman.com>
References: <cover.1754750560.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 14:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221678

From: Praveen Kumar <praveen.kumar@windriver.com>

There is a defect in the CPython “tarfile” module affecting the
“TarFile” extraction and entry enumeration APIs. The tar implementation
would process tar archives with negative offsets without error,
resulting in an infinite loop and deadlock during the parsing of
maliciously crafted tar archives. This vulnerability can be mitigated
by including the following patch after importing the “tarfile” module:
https://gist.github.com/sethmlarson/1716ac5b82b73dbcbf23ad2eff8b33e1

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8194

Upstream-patch:
https://github.com/python/cpython/commit/cdae923ffe187d6ef916c0f665a31249619193fe

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2025-8194.patch        | 224 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.13.4.bb |   1 +
 2 files changed, 225 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-8194.patch b/meta/recipes-devtools/python/python3/CVE-2025-8194.patch
new file mode 100644
index 0000000000..28653e1843
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-8194.patch
@@ -0,0 +1,224 @@
+From cdae923ffe187d6ef916c0f665a31249619193fe Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 28 Jul 2025 17:59:33 +0200
+Subject: [PATCH] gh-130577: tarfile now validates archives to ensure member
+ offsets are non-negative (GH-137027) (#137170)
+
+gh-130577: tarfile now validates archives to ensure member offsets are non-negative (GH-137027)
+(cherry picked from commit 7040aa54f14676938970e10c5f74ea93cd56aa38)
+
+Co-authored-by: Alexander Urieles <aeurielesn@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+
+CVE: CVE-2025-8194
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/cdae923ffe187d6ef916c0f665a31249619193fe]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ Lib/tarfile.py                                |   3 +
+ Lib/test/test_tarfile.py                      | 156 ++++++++++++++++++
+ ...-07-23-00-35-29.gh-issue-130577.c7EITy.rst |   3 +
+ 3 files changed, 162 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 0980f6a..9ff9df6 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1636,6 +1636,9 @@ class TarInfo(object):
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
+index ac31be0..7024be4 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -50,6 +50,7 @@ bz2name = os.path.join(TEMPDIR, "testtar.tar.bz2")
+ xzname = os.path.join(TEMPDIR, "testtar.tar.xz")
+ tmpname = os.path.join(TEMPDIR, "tmp.tar")
+ dotlessname = os.path.join(TEMPDIR, "testtar")
++SPACE = b" "
+
+ sha256_regtype = (
+     "e09e4bc8b3c9d9177e77256353b36c159f5f040531bbd4b024a8f9b9196c71ce"
+@@ -4578,6 +4579,161 @@ class OverwriteTests(archiver_tests.OverwriteTests, unittest.TestCase):
+         ar.extractall(self.testdir, filter='fully_trusted')
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
+index 0000000..342cabb
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+@@ -0,0 +1,3 @@
++:mod:`tarfile` now validates archives to ensure member offsets are
++non-negative.  (Contributed by Alexander Enrique Urieles Nieto in
++:gh:`130577`.)
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.13.4.bb b/meta/recipes-devtools/python/python3_3.13.4.bb
index 0a2c41cdce..6823a21cc3 100644
--- a/meta/recipes-devtools/python/python3_3.13.4.bb
+++ b/meta/recipes-devtools/python/python3_3.13.4.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
+           file://CVE-2025-8194.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.43.0


