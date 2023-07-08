Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93982C0015E
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:17 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.344.1688831768170936859
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Bf/LPCGv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-262e3c597b9so2162949a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831767; x=1691423767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwNFE5OtSJVXxMhggnLOIPwBVMc2N1TI5YUWhzpsSVk=;
        b=Bf/LPCGvOk+DNY53YYwVG6cSUcWBw4yny0+1ZJSeSgPXJOm3ADOTBDtil10yvwCylI
         Xe05/HSGHH7/3K5BaLVQpj460NF+V0NXnWaDpvWq5cqqMcmBR56rC7QnY/Lhrknp2NQD
         o/8oOwivcFazF9Ea+Tx+XC/tRhuiYqmNW8p+G+XChDUTwaF3i/BP07mWGfcfLzEsL5R8
         JY6WSFtHwOKEFNdSmqJK+HtvHAt8Ytcxrc1AskdcjTokwuxC21CsUX9bAYjuzvApIQYg
         HlqiYUyP9rI9yxvSgcKXGtxcJXMS4AOrNU5SgmXmJI17qBwGw7EPLulJ0EslvM0Fw8bx
         6pNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831767; x=1691423767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwNFE5OtSJVXxMhggnLOIPwBVMc2N1TI5YUWhzpsSVk=;
        b=RAa3dviCdYc1f6QwrevZ95z43WRRqerkPwkK4JOp9YYwe0bRlLnR7RyT9724ZnPXLs
         hhP0k5vtzbGNkrAvcvINpX+mk5XEYywss1JxXBEYi5lfhKMLGc6NkkE4u2JfD/9fMDW0
         JpyjyJ0mRGhpPnT+Dbz2Uzozc2edEmtDDqW0cqVBm0rgqDdvYx4yWQcFdftoRsZ5mto1
         3FOnreGd1FD4+mMriNW2LrRZi0st2f4ku4BvmiiQFEprSxMUCz7kUggiZ1mryhb9lrC8
         dUz3P7BII2fAQ582CpfkuLJIJJ4SsGGrxbqXz7vY6/MHm3wN3LwnsymiJSDWv3BNEUEb
         pVAQ==
X-Gm-Message-State: ABy/qLbnBeCQCLDUA+focXiogXPQbG7FnnEtYXu3iDhBs4Bsz49DWvth
	9mmm5O8juycMG0AjJjfsx2AsY2N79x4wk8cNfus=
X-Google-Smtp-Source: APBJJlHog99SeJW0M+tsV/P1X7aI8/QXR6XlDNSjpA+s/sCF2mqyFHQ4ueRlo2g66+6CGkp4/G6j+Q==
X-Received: by 2002:a17:90a:a182:b0:263:6e10:7cdd with SMTP id t2-20020a17090aa18200b002636e107cddmr8004103pjp.38.1688831766873;
        Sat, 08 Jul 2023 08:56:06 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/17] python3: upgrade to 3.8.17
Date: Sat,  8 Jul 2023 05:55:38 -1000
Message-Id: <01a1f016a6558566a36098a993adaf4b40e30c78.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184024

From: Chee Yang Lee <chee.yang.lee@intel.com>

License-Update: update year to 2023
https://github.com/python/cpython/commit/30afa75ad8deca57a2bd0218f8fd6b3437c89507

Release Notes for 3.8.15:
Security content in this release
CVE-2022-40674: bundled libexpat was upgraded from 2.4.7 to 2.4.9 which
fixes a heap use-after-free vulnerability in function doContent
gh-97616: a fix for a possible buffer overflow in list *= int
gh-97612: a fix for possible shell injection in the example script
get-remote-certificate.py (this issue originally had a CVE assigned to
it, which its author withdrew)
gh-96577: a fix for a potential buffer overrun in msilib

https://www.python.org/downloads/release/python-3815/

Release Notes for 3.8.16:
Security content in this release
gh-98739: Updated bundled libexpat to 2.5.0 to fix CVE-2022-43680 (heap
use-after-free).
gh-98517: Port XKCP’s fix for the buffer overflows in SHA-3 to fix
CVE-2022-37454.
gh-98433: The IDNA codec decoder used on DNS hostnames by socket or
asyncio related name resolution functions no longer involves a quadratic
algorithm to fix CVE-2022-45061. This prevents a potential CPU denial of
service if an out-of-spec excessive length hostname involving
bidirectional characters were decoded. Some protocols such as urllib
http 3xx redirects potentially allow for an attacker to supply such a
name.
gh-68966: The deprecated mailcap module now refuses to inject unsafe
text (filenames, MIME types, parameters) into shell commands to address
CVE-2015-20107. Instead of using such text, it will warn and act as if a
match was not found (or for test commands, as if the test failed).
gh-100001: python -m http.server no longer allows terminal control
characters sent within a garbage request to be printed to the stderr
server log.
gh-87604: Avoid publishing list of active per-interpreter audit hooks
via the gc module.

https://www.python.org/downloads/release/python-3816/

Release Notes for 3.8.17:
Security content in this release
gh-103142: The version of OpenSSL used in Windows and Mac installers has
been upgraded to 1.1.1u to address CVE-2023-2650, CVE-2023-0465,
CVE-2023-0466, CVE-2023-0464, as well as CVE-2023-0286, CVE-2022-4303,
and CVE-2022-4303 fixed previously in 1.1.1t (gh-101727).
gh-102153: urllib.parse.urlsplit() now strips leading C0 control and
space characters following the specification for URLs defined by WHATWG
in response to CVE-2023-24329.
gh-99889: Fixed a security in flaw in uu.decode() that could allow for
directory traversal based on the input if no out_file was specified.
gh-104049: Do not expose the local on-disk location in directory indexes
produced by http.client.SimpleHTTPRequestHandler.
gh-103935: trace.__main__ now uses io.open_code() for files to be
executed instead of raw open().
gh-101283: subprocess.Popen now uses a safer approach to find cmd.exe
when launching with shell=True.
gh-102953: The extraction methods in tarfile, and
shutil.unpack_archive(), have a new filter argument that allows limiting
tar features than may be surprising or dangerous, such as creating files
outside the destination directory. See Extraction filters for details.

https://www.python.org/downloads/release/python-3817/

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/files/CVE-2022-45061.patch         | 100 -----------------
 .../python/python3/CVE-2022-37454.patch       | 105 ------------------
 .../{python3_3.8.14.bb => python3_3.8.17.bb}  |   8 +-
 3 files changed, 3 insertions(+), 210 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/files/CVE-2022-45061.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2022-37454.patch
 rename meta/recipes-devtools/python/{python3_3.8.14.bb => python3_3.8.17.bb} (98%)

diff --git a/meta/recipes-devtools/python/files/CVE-2022-45061.patch b/meta/recipes-devtools/python/files/CVE-2022-45061.patch
deleted file mode 100644
index 647bf59908..0000000000
--- a/meta/recipes-devtools/python/files/CVE-2022-45061.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 064ec20bf7a181ba5fa961aaa12973812aa6ca5d Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 7 Nov 2022 18:57:10 -0800
-Subject: [PATCH] [3.11] gh-98433: Fix quadratic time idna decoding. (GH-99092)
- (GH-99222)
-
-There was an unnecessary quadratic loop in idna decoding. This restores
-the behavior to linear.
-
-(cherry picked from commit d315722564927c7202dd6e111dc79eaf14240b0d)
-
-(cherry picked from commit a6f6c3a3d6f2b580f2d87885c9b8a9350ad7bf15)
-
-Co-authored-by: Miss Islington (bot) <31488909+miss-islington@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-
-CVE: CVE-2022-45061
-Upstream-Status: Backport [https://github.com/python/cpython/pull/99231/commits/064ec20bf7a181ba5fa961aaa12973812aa6ca5d]
-Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
-
----
- Lib/encodings/idna.py                         | 32 +++++++++----------
- Lib/test/test_codecs.py                       |  6 ++++
- ...2-11-04-09-29-36.gh-issue-98433.l76c5G.rst |  6 ++++
- 3 files changed, 27 insertions(+), 17 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
-
-diff --git a/Lib/encodings/idna.py b/Lib/encodings/idna.py
-index ea4058512fe3..bf98f513366b 100644
---- a/Lib/encodings/idna.py
-+++ b/Lib/encodings/idna.py
-@@ -39,23 +39,21 @@ def nameprep(label):
- 
-     # Check bidi
-     RandAL = [stringprep.in_table_d1(x) for x in label]
--    for c in RandAL:
--        if c:
--            # There is a RandAL char in the string. Must perform further
--            # tests:
--            # 1) The characters in section 5.8 MUST be prohibited.
--            # This is table C.8, which was already checked
--            # 2) If a string contains any RandALCat character, the string
--            # MUST NOT contain any LCat character.
--            if any(stringprep.in_table_d2(x) for x in label):
--                raise UnicodeError("Violation of BIDI requirement 2")
--
--            # 3) If a string contains any RandALCat character, a
--            # RandALCat character MUST be the first character of the
--            # string, and a RandALCat character MUST be the last
--            # character of the string.
--            if not RandAL[0] or not RandAL[-1]:
--                raise UnicodeError("Violation of BIDI requirement 3")
-+    if any(RandAL):
-+        # There is a RandAL char in the string. Must perform further
-+        # tests:
-+        # 1) The characters in section 5.8 MUST be prohibited.
-+        # This is table C.8, which was already checked
-+        # 2) If a string contains any RandALCat character, the string
-+        # MUST NOT contain any LCat character.
-+        if any(stringprep.in_table_d2(x) for x in label):
-+            raise UnicodeError("Violation of BIDI requirement 2")
-+        # 3) If a string contains any RandALCat character, a
-+        # RandALCat character MUST be the first character of the
-+        # string, and a RandALCat character MUST be the last
-+        # character of the string.
-+        if not RandAL[0] or not RandAL[-1]:
-+            raise UnicodeError("Violation of BIDI requirement 3")
- 
-     return label
- 
-diff --git a/Lib/test/test_codecs.py b/Lib/test/test_codecs.py
-index d1faf0126c1e..37ade7d80d02 100644
---- a/Lib/test/test_codecs.py
-+++ b/Lib/test/test_codecs.py
-@@ -1532,6 +1532,12 @@ def test_builtin_encode(self):
-         self.assertEqual("pyth\xf6n.org".encode("idna"), b"xn--pythn-mua.org")
-         self.assertEqual("pyth\xf6n.org.".encode("idna"), b"xn--pythn-mua.org.")
- 
-+    def test_builtin_decode_length_limit(self):
-+        with self.assertRaisesRegex(UnicodeError, "too long"):
-+            (b"xn--016c"+b"a"*1100).decode("idna")
-+        with self.assertRaisesRegex(UnicodeError, "too long"):
-+            (b"xn--016c"+b"a"*70).decode("idna")
-+
-     def test_stream(self):
-         r = codecs.getreader("idna")(io.BytesIO(b"abc"))
-         r.read(3)
-diff --git a/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst b/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
-new file mode 100644
-index 000000000000..5185fac2e29d
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
-@@ -0,0 +1,6 @@
-+The IDNA codec decoder used on DNS hostnames by :mod:`socket` or :mod:`asyncio`
-+related name resolution functions no longer involves a quadratic algorithm.
-+This prevents a potential CPU denial of service if an out-of-spec excessive
-+length hostname involving bidirectional characters were decoded. Some protocols
-+such as :mod:`urllib` http ``3xx`` redirects potentially allow for an attacker
-+to supply such a name.
diff --git a/meta/recipes-devtools/python/python3/CVE-2022-37454.patch b/meta/recipes-devtools/python/python3/CVE-2022-37454.patch
deleted file mode 100644
index a41cc301e2..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2022-37454.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 948c6794711458fd148a3fa62296cadeeb2ed631 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Fri, 28 Oct 2022 03:07:50 -0700
-Subject: [PATCH] [3.8] gh-98517: Fix buffer overflows in _sha3 module
- (GH-98519) (#98527)
-
-This is a port of the applicable part of XKCP's fix [1] for
-CVE-2022-37454 and avoids the segmentation fault and the infinite
-loop in the test cases published in [2].
-
-[1]: https://github.com/XKCP/XKCP/commit/fdc6fef075f4e81d6b1bc38364248975e08e340a
-[2]: https://mouha.be/sha-3-buffer-overflow/
-
-Regression test added by: Gregory P. Smith [Google LLC] <greg@krypto.org>
-(cherry picked from commit 0e4e058602d93b88256ff90bbef501ba20be9dd3)
-
-Co-authored-by: Theo Buehler <botovq@users.noreply.github.com>
-
-CVE: CVE-2022-37454
-Upstream-Status: Backport [https://github.com/python/cpython/commit/948c6794711458fd148a3fa62296cadeeb2ed631]
-Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
----
- Lib/test/test_hashlib.py                          |  9 +++++++++
- .../2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst |  1 +
- Modules/_sha3/kcp/KeccakSponge.inc                | 15 ++++++++-------
- 3 files changed, 18 insertions(+), 7 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
-
-diff --git a/Lib/test/test_hashlib.py b/Lib/test/test_hashlib.py
-index 8b53d23ef525..e6cec4e306e5 100644
---- a/Lib/test/test_hashlib.py
-+++ b/Lib/test/test_hashlib.py
-@@ -434,6 +434,15 @@ def test_case_md5_huge(self, size):
-     def test_case_md5_uintmax(self, size):
-         self.check('md5', b'A'*size, '28138d306ff1b8281f1a9067e1a1a2b3')
- 
-+    @unittest.skipIf(sys.maxsize < _4G - 1, 'test cannot run on 32-bit systems')
-+    @bigmemtest(size=_4G - 1, memuse=1, dry_run=False)
-+    def test_sha3_update_overflow(self, size):
-+        """Regression test for gh-98517 CVE-2022-37454."""
-+        h = hashlib.sha3_224()
-+        h.update(b'\x01')
-+        h.update(b'\x01'*0xffff_ffff)
-+        self.assertEqual(h.hexdigest(), '80762e8ce6700f114fec0f621fd97c4b9c00147fa052215294cceeed')
-+
-     # use the three examples from Federal Information Processing Standards
-     # Publication 180-1, Secure Hash Standard,  1995 April 17
-     # http://www.itl.nist.gov/div897/pubs/fip180-1.htm
-diff --git a/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
-new file mode 100644
-index 000000000000..2d23a6ad93c7
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
-@@ -0,0 +1 @@
-+Port XKCP's fix for the buffer overflows in SHA-3 (CVE-2022-37454).
-diff --git a/Modules/_sha3/kcp/KeccakSponge.inc b/Modules/_sha3/kcp/KeccakSponge.inc
-index e10739deafa8..cf92e4db4d36 100644
---- a/Modules/_sha3/kcp/KeccakSponge.inc
-+++ b/Modules/_sha3/kcp/KeccakSponge.inc
-@@ -171,7 +171,7 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
-     i = 0;
-     curData = data;
-     while(i < dataByteLen) {
--        if ((instance->byteIOIndex == 0) && (dataByteLen >= (i + rateInBytes))) {
-+        if ((instance->byteIOIndex == 0) && (dataByteLen-i >= rateInBytes)) {
- #ifdef SnP_FastLoop_Absorb
-             /* processing full blocks first */
- 
-@@ -199,10 +199,10 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
-         }
-         else {
-             /* normal lane: using the message queue */
--
--            partialBlock = (unsigned int)(dataByteLen - i);
--            if (partialBlock+instance->byteIOIndex > rateInBytes)
-+            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
-                 partialBlock = rateInBytes-instance->byteIOIndex;
-+            else
-+                partialBlock = (unsigned int)(dataByteLen - i);
-             #ifdef KeccakReference
-             displayBytes(1, "Block to be absorbed (part)", curData, partialBlock);
-             #endif
-@@ -281,7 +281,7 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
-     i = 0;
-     curData = data;
-     while(i < dataByteLen) {
--        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen >= (i + rateInBytes))) {
-+        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen-i >= rateInBytes)) {
-             for(j=dataByteLen-i; j>=rateInBytes; j-=rateInBytes) {
-                 SnP_Permute(instance->state);
-                 SnP_ExtractBytes(instance->state, curData, 0, rateInBytes);
-@@ -299,9 +299,10 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
-                 SnP_Permute(instance->state);
-                 instance->byteIOIndex = 0;
-             }
--            partialBlock = (unsigned int)(dataByteLen - i);
--            if (partialBlock+instance->byteIOIndex > rateInBytes)
-+            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
-                 partialBlock = rateInBytes-instance->byteIOIndex;
-+            else
-+                partialBlock = (unsigned int)(dataByteLen - i);
-             i += partialBlock;
- 
-             SnP_ExtractBytes(instance->state, curData, instance->byteIOIndex, partialBlock);
diff --git a/meta/recipes-devtools/python/python3_3.8.14.bb b/meta/recipes-devtools/python/python3_3.8.17.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.14.bb
rename to meta/recipes-devtools/python/python3_3.8.17.bb
index 960e41aced..ba5f564d8e 100644
--- a/meta/recipes-devtools/python/python3_3.8.14.bb
+++ b/meta/recipes-devtools/python/python3_3.8.17.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSF-2.0 & BSD-0-Clause"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c84eccf626bb6fde43e6ea5e28d8feb5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=07fc4b9a9c0c0e48050ed38a5e72552b"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -34,8 +34,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://makerace.patch \
-           file://CVE-2022-45061.patch \
-           file://CVE-2022-37454.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -44,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "78710eed185b71f4198d354502ff62c9"
-SRC_URI[sha256sum] = "5d77e278271ba803e9909a41a4f3baca006181c93ada682a5e5fe8dc4a24c5f3"
+SRC_URI[md5sum] = "70223497e664524303ca2364208647e1"
+SRC_URI[sha256sum] = "2e54b0c68191f16552f6de2e97a2396540572a219f6bbb28591a137cecc490a9"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


