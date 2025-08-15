Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BFDCA0EEA
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:45:16 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.16481.1755276309442744294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OLoxpJWx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b4717554c29so1433996a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755276309; x=1755881109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNwT7REF/tu8fEsiVJn196VkxgidXV3Am0oUbsvVXVQ=;
        b=OLoxpJWx4wyO6tWhU4Eo4fsbOcb0lU05FZp7zhKWVMn/ouSODCby+Hibrcoio8QAfP
         4lGUKdFlfwhZt08B53+cgkJ2ERdhO8ZWXxkgQNoGsbXvunooipK27PmlXKOtA0eFTOhq
         czeIl79L2pJkgCap5CyGIGck12TxLKN+LcrW+rRm59KoFr03yRFNMOyCkc82+y612Fij
         YVnQ5JGTVitPVYmygs6TMh96QOoWKXZAQ23yCSneK/0OFOV/acj4LIIjsoqrFC8TMc+I
         qXQsJSCIfkhfQPc2I3GtFiuwjUJb8auOKY4SCPpNN2ce4ngvraqHvyU+VyI25qxvdShJ
         PYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276309; x=1755881109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNwT7REF/tu8fEsiVJn196VkxgidXV3Am0oUbsvVXVQ=;
        b=FvR0VCmr9QJonGGizOC2GKlI9XaaImTgQe7kMUd3z1OTWwz3uzHtB/sJ8mbeFPEDBC
         AUFwUURoKxeK7XNpe0DbDC+W7+YldywO0So8erTuvyLN+EZoWLTwVEhJp3L9kfR6wnfs
         bpn3g8su4ygc9PlQf5zoLqdIal4E+j3nNiEj30ixe//2hccdGa5zu+j3LT8EmNiFDNr8
         tX+3azaVoV86CUAuOoYIUEwHVjHNzVqBKn0YynVXdRFfZ3mD+WmByYHQM0qie3OR9Xlj
         50icJD0AlUfPsMejUSI6BBZjlDjbgsA6e5RT1FMNkjE+Hrxm+wlw5+EAoMIoHZvJflg1
         FE4w==
X-Gm-Message-State: AOJu0YxfXjWnJ0rqG0l3HB7ndRZNPfoOJApIacL7oTr4+juWmdWaQJzL
	FgjEXV6NIQgMeFRFFrVm9Zqww26hD8hUPYO3kGsCz0B5cX6JYBhGYG/7JJO3KLLxu+RaYByyvr7
	bhBlK
X-Gm-Gg: ASbGnctqX5LTqktPvToo67bI3zqVZfIChqQzJByoTHSWmfjLWZou1eTBy/FmuY5nwBl
	zhs7ngimdfET+oEgWGYa3j77WgfnOhWj1mblU3I7a3N0O+1Ky50n5l4Binp89dR4kYjrfPVvQ0P
	g0a5fbSy0h0T6tRWj/XDxDEgyAdCMr4vrKqPkKVmtBgJWr9nISnIM86tkrIJ6XnEujw0sRFU0In
	3adIH4BcNIQgdG+eV58EV4UQaDiSkrn0UdyyNqDZPqfSypt4GUHFFUZerUhcM4WqdjYgiOTWOtk
	+btMkRQS1x37XOY7/dmUywbaj+uNOXvae3SOpL7JNElsdTjTKNI7U8lf4se26DhPV9Ucy9k5Nub
	MdkWRaGGC98OUReebwX93rjl/
X-Google-Smtp-Source: AGHT+IHnA6CLyvq9FdF8UDmj3rAN2TBQcH361BrqU4IsV+PtkIuK6TszeofVIBsr8dpTGV7xZboJDw==
X-Received: by 2002:a17:90b:1c02:b0:31e:3d06:739c with SMTP id 98e67ed59e1d1-3234218472fmr3629999a91.31.1755276308487;
        Fri, 15 Aug 2025 09:45:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ec5:7840:3390:1caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c9ab2asm1554476a91.30.2025.08.15.09.45.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:45:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/9] python3: patch CVE-2025-8194
Date: Fri, 15 Aug 2025 09:44:53 -0700
Message-ID: <34f1b4877a0601d2057453c159c76a54754f229a.1755276097.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755276097.git.steve@sakoman.com>
References: <cover.1755276097.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221982

From: Peter Marko <peter.marko@siemens.com>

Pick commit from 3.12 branch mentioned in NVD report.
https://nvd.nist.gov/vuln/detail/CVE-2025-8194

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2025-8194.patch        | 219 ++++++++++++++++++
 .../python/python3_3.12.11.bb                 |   9 +-
 2 files changed, 224 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-8194.patch b/meta/recipes-devtools/python/python3/CVE-2025-8194.patch
new file mode 100644
index 0000000000..b8243a67f6
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
+@@ -1615,6 +1615,9 @@ class TarInfo(object):
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
+@@ -50,6 +50,7 @@ bz2name = os.path.join(TEMPDIR, "testtar.tar.bz2")
+ xzname = os.path.join(TEMPDIR, "testtar.tar.xz")
+ tmpname = os.path.join(TEMPDIR, "tmp.tar")
+ dotlessname = os.path.join(TEMPDIR, "testtar")
++SPACE = b" "
+ 
+ sha256_regtype = (
+     "e09e4bc8b3c9d9177e77256353b36c159f5f040531bbd4b024a8f9b9196c71ce"
+@@ -4488,6 +4489,161 @@ class OverwriteTests(archiver_tests.OverwriteTests, unittest.TestCase):
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
+index 0000000000..342cabbc86
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+@@ -0,0 +1,3 @@
++:mod:`tarfile` now validates archives to ensure member offsets are
++non-negative.  (Contributed by Alexander Enrique Urieles Nieto in
++:gh:`130577`.)
diff --git a/meta/recipes-devtools/python/python3_3.12.11.bb b/meta/recipes-devtools/python/python3_3.12.11.bb
index 84c4f74158..1c31077320 100644
--- a/meta/recipes-devtools/python/python3_3.12.11.bb
+++ b/meta/recipes-devtools/python/python3_3.12.11.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://CVE-2025-8194.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -184,14 +185,14 @@ do_install:append:class-native() {
         # when they're only used for python called with -O or -OO.
         #find ${D} -name *opt-*.pyc -delete
         # Remove all pyc files. There are a ton of them and it is probably faster to let
-        # python create the ones it wants at runtime rather than manage in the sstate 
+        # python create the ones it wants at runtime rather than manage in the sstate
         # tarballs and sysroot creation.
         find ${D} -name *.pyc -delete
 
         # Nothing should be looking into ${B} for python3-native
         sed -i -e 's:${B}:/build/path/unavailable/:g' \
                 ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
-        
+
         # disable the lookup in user's site-packages globally
         sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
 
@@ -226,7 +227,7 @@ do_install:append() {
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
 
-        # Similar to the above, we're getting reproducibility issues with 
+        # Similar to the above, we're getting reproducibility issues with
         # /usr/lib/python3.10/__pycache__/traceback.cpython-310.pyc
         # so remove it too
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.cpython*
@@ -303,7 +304,7 @@ py_package_preprocess () {
         cd -
 
         mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
-        
+
         #Remove the unneeded copy of target sysconfig data
         rm -rf ${PKGD}/${libdir}/python-sysconfigdata
 }
-- 
2.43.0


