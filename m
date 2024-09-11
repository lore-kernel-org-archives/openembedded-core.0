Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F87FEE57E1
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:37 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.35221.1726097008952666193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S9JJicb6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-718e11e4186so277604b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097008; x=1726701808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MB+xsx4KaSemGzNpP1f0VK8p9ZssIlpu2/aN7+q4Llw=;
        b=S9JJicb6ib68Eo7OC1htu5Nq9XhOq86sibY0UbldR9TP0AeT0VsAdyv4YQ26ztWseg
         Lmz7JKmqDxDTaJjOrCaq65o2PWx0o7vXipr1Q/1i2WoxoCCC419E0HeALn1eMqA9w5Sv
         acnh+TYU3FG5ExDv8en23tgMC2giIVY+U1aumrC9cUCsUiZ92YgiZCfZn9FrUqViZ4og
         XMgJvix6hJMq5yq9EyCg5+2BLRf94kteesQ0yQl4TuKrgqGCSVPh3+nxtN6A9v2J6ob5
         u3MWXHH+l249vsc4o2XUnSGKmC8rE8ioLJqV9PadECpIIk5U/yB6VoDwK99MyYcEhYPd
         JyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097008; x=1726701808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MB+xsx4KaSemGzNpP1f0VK8p9ZssIlpu2/aN7+q4Llw=;
        b=IKxChQfViYIFr5hgIsoQkAOusr597bvZ/D7g3ZUAG9LyrjDuPrbs67jBtZ39Iir6W0
         C8JEAudw9vk1/Ive1NQ9gSuaFrF1AJv0KQ78nQXvvnEHRDO5f5EEwnOraWRbm9RVfnad
         0cYUpZCtKH/A7RjCdJUedDL8rf7FUX1hZIiOfNLla6rWQKcb8xxxB2kn2HOJqPnfua86
         ZtS0KTdaxb0gqkFCQBIjcyPsW4/o7u6ZQDI1hnz9uJHCQLRiLZi5rgvSJL0WkPGH6cvE
         jT4CfMvCR71Q7voAT/EG6IuBA1c+NGkJvvugnDBAk86vMQTKFuOprdZyLyKrkg8MQVsr
         hsaA==
X-Gm-Message-State: AOJu0Yz94povC6J6cI2sgA/WAuUuZ14Jir4OcR+0MWGKUy2Zj9d2OuND
	Hh/m1Z07hL0ufSVOq2WtJnlh9SsPZoR9AfGY6KKn8QkRBYaMf/kngHuNNfhrDjfNwYldLrBs9La
	+
X-Google-Smtp-Source: AGHT+IHMzqOUFOReTty1yt3U8Qm11rs07wrmuI/IAIDA5PQYvmbb2rLxqtLVAEWbmSNNDF1xK0D/nA==
X-Received: by 2002:a05:6a21:458b:b0:1cc:e3a1:b9e3 with SMTP id adf61e73a8af0-1cf75f2a66cmr1255092637.25.1726097007794;
        Wed, 11 Sep 2024 16:23:27 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/22] python3: CVE-2024-6232 CVE-2024-7592 fixes
Date: Wed, 11 Sep 2024 16:22:58 -0700
Message-Id: <3e5697687c8fb0aa6312773b233442b8df974feb.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204395

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://github.com/python/cpython/commit/b2f11ca7667e4d57c71c1c88b255115f16042d9a
Upstream-Status: Backport from https://github.com/python/cpython/commit/743acbe872485dc18df4d8ab2dc7895187f062c4

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2024-6232.patch        | 251 ++++++++++++++++++
 .../python/python3/CVE-2024-7592.patch        | 140 ++++++++++
 .../python/python3_3.10.14.bb                 |   2 +
 3 files changed, 393 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-6232.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2024-6232.patch b/meta/recipes-devtools/python/python3/CVE-2024-6232.patch
new file mode 100644
index 0000000000..874cbfe40c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-6232.patch
@@ -0,0 +1,251 @@
+From 3a22dc1079be5a75750d24dc6992956e7b84b5a0 Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Tue, 3 Sep 2024 10:07:53 -0500
+Subject: [PATCH 2/2] [3.10] gh-121285: Remove backtracking when parsing
+ tarfile headers (GH-121286) (#123640)
+
+* Remove backtracking when parsing tarfile headers
+* Rewrite PAX header parsing to be stricter
+* Optimize parsing of GNU extended sparse headers v0.0
+
+(cherry picked from commit 34ddb64d088dd7ccc321f6103d23153256caa5d4)
+
+Upstream-Status: Backport from https://github.com/python/cpython/commit/743acbe872485dc18df4d8ab2dc7895187f062c4
+CVE: CVE-2024-6232
+
+Co-authored-by: Kirill Podoprigora <kirill.bast9@mail.ru>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ Lib/tarfile.py                                | 105 +++++++++++-------
+ Lib/test/test_tarfile.py                      |  42 +++++++
+ ...-07-02-13-39-20.gh-issue-121285.hrl-yI.rst |   2 +
+ 3 files changed, 111 insertions(+), 38 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 495349f08f9..3ab6811d633 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -841,6 +841,9 @@ def data_filter(member, dest_path):
+ # Sentinel for replace() defaults, meaning "don't change the attribute"
+ _KEEP = object()
+ 
++# Header length is digits followed by a space.
++_header_length_prefix_re = re.compile(br"([0-9]{1,20}) ")
++
+ class TarInfo(object):
+     """Informational class which holds the details about an
+        archive member given by a tar header block.
+@@ -1410,41 +1413,59 @@ def _proc_pax(self, tarfile):
+         else:
+             pax_headers = tarfile.pax_headers.copy()
+ 
+-        # Check if the pax header contains a hdrcharset field. This tells us
+-        # the encoding of the path, linkpath, uname and gname fields. Normally,
+-        # these fields are UTF-8 encoded but since POSIX.1-2008 tar
+-        # implementations are allowed to store them as raw binary strings if
+-        # the translation to UTF-8 fails.
+-        match = re.search(br"\d+ hdrcharset=([^\n]+)\n", buf)
+-        if match is not None:
+-            pax_headers["hdrcharset"] = match.group(1).decode("utf-8")
+-
+-        # For the time being, we don't care about anything other than "BINARY".
+-        # The only other value that is currently allowed by the standard is
+-        # "ISO-IR 10646 2000 UTF-8" in other words UTF-8.
+-        hdrcharset = pax_headers.get("hdrcharset")
+-        if hdrcharset == "BINARY":
+-            encoding = tarfile.encoding
+-        else:
+-            encoding = "utf-8"
+-
+         # Parse pax header information. A record looks like that:
+         # "%d %s=%s\n" % (length, keyword, value). length is the size
+         # of the complete record including the length field itself and
+-        # the newline. keyword and value are both UTF-8 encoded strings.
+-        regex = re.compile(br"(\d+) ([^=]+)=")
++        # the newline.
+         pos = 0
+-        while True:
+-            match = regex.match(buf, pos)
+-            if not match:
+-                break
++        encoding = None
++        raw_headers = []
++        while len(buf) > pos and buf[pos] != 0x00:
++            if not (match := _header_length_prefix_re.match(buf, pos)):
++                raise InvalidHeaderError("invalid header")
++            try:
++                length = int(match.group(1))
++            except ValueError:
++                raise InvalidHeaderError("invalid header")
++            # Headers must be at least 5 bytes, shortest being '5 x=\n'.
++            # Value is allowed to be empty.
++            if length < 5:
++                raise InvalidHeaderError("invalid header")
++            if pos + length > len(buf):
++                raise InvalidHeaderError("invalid header")
+ 
+-            length, keyword = match.groups()
+-            length = int(length)
+-            if length == 0:
++            header_value_end_offset = match.start(1) + length - 1  # Last byte of the header
++            keyword_and_value = buf[match.end(1) + 1:header_value_end_offset]
++            raw_keyword, equals, raw_value = keyword_and_value.partition(b"=")
++
++            # Check the framing of the header. The last character must be '\n' (0x0A)
++            if not raw_keyword or equals != b"=" or buf[header_value_end_offset] != 0x0A:
+                 raise InvalidHeaderError("invalid header")
+-            value = buf[match.end(2) + 1:match.start(1) + length - 1]
++            raw_headers.append((length, raw_keyword, raw_value))
++
++            # Check if the pax header contains a hdrcharset field. This tells us
++            # the encoding of the path, linkpath, uname and gname fields. Normally,
++            # these fields are UTF-8 encoded but since POSIX.1-2008 tar
++            # implementations are allowed to store them as raw binary strings if
++            # the translation to UTF-8 fails. For the time being, we don't care about
++            # anything other than "BINARY". The only other value that is currently
++            # allowed by the standard is "ISO-IR 10646 2000 UTF-8" in other words UTF-8.
++            # Note that we only follow the initial 'hdrcharset' setting to preserve
++            # the initial behavior of the 'tarfile' module.
++            if raw_keyword == b"hdrcharset" and encoding is None:
++                if raw_value == b"BINARY":
++                    encoding = tarfile.encoding
++                else:  # This branch ensures only the first 'hdrcharset' header is used.
++                    encoding = "utf-8"
++
++            pos += length
+ 
++        # If no explicit hdrcharset is set, we use UTF-8 as a default.
++        if encoding is None:
++            encoding = "utf-8"
++
++        # After parsing the raw headers we can decode them to text.
++        for length, raw_keyword, raw_value in raw_headers:
+             # Normally, we could just use "utf-8" as the encoding and "strict"
+             # as the error handler, but we better not take the risk. For
+             # example, GNU tar <= 1.23 is known to store filenames it cannot
+@@ -1452,17 +1473,16 @@ def _proc_pax(self, tarfile):
+             # hdrcharset=BINARY header).
+             # We first try the strict standard encoding, and if that fails we
+             # fall back on the user's encoding and error handler.
+-            keyword = self._decode_pax_field(keyword, "utf-8", "utf-8",
++            keyword = self._decode_pax_field(raw_keyword, "utf-8", "utf-8",
+                     tarfile.errors)
+             if keyword in PAX_NAME_FIELDS:
+-                value = self._decode_pax_field(value, encoding, tarfile.encoding,
++                value = self._decode_pax_field(raw_value, encoding, tarfile.encoding,
+                         tarfile.errors)
+             else:
+-                value = self._decode_pax_field(value, "utf-8", "utf-8",
++                value = self._decode_pax_field(raw_value, "utf-8", "utf-8",
+                         tarfile.errors)
+ 
+             pax_headers[keyword] = value
+-            pos += length
+ 
+         # Fetch the next header.
+         try:
+@@ -1477,7 +1497,7 @@ def _proc_pax(self, tarfile):
+ 
+         elif "GNU.sparse.size" in pax_headers:
+             # GNU extended sparse format version 0.0.
+-            self._proc_gnusparse_00(next, pax_headers, buf)
++            self._proc_gnusparse_00(next, raw_headers)
+ 
+         elif pax_headers.get("GNU.sparse.major") == "1" and pax_headers.get("GNU.sparse.minor") == "0":
+             # GNU extended sparse format version 1.0.
+@@ -1499,15 +1519,24 @@ def _proc_pax(self, tarfile):
+ 
+         return next
+ 
+-    def _proc_gnusparse_00(self, next, pax_headers, buf):
++    def _proc_gnusparse_00(self, next, raw_headers):
+         """Process a GNU tar extended sparse header, version 0.0.
+         """
+         offsets = []
+-        for match in re.finditer(br"\d+ GNU.sparse.offset=(\d+)\n", buf):
+-            offsets.append(int(match.group(1)))
+         numbytes = []
+-        for match in re.finditer(br"\d+ GNU.sparse.numbytes=(\d+)\n", buf):
+-            numbytes.append(int(match.group(1)))
++        for _, keyword, value in raw_headers:
++            if keyword == b"GNU.sparse.offset":
++                try:
++                    offsets.append(int(value.decode()))
++                except ValueError:
++                    raise InvalidHeaderError("invalid header")
++
++            elif keyword == b"GNU.sparse.numbytes":
++                try:
++                    numbytes.append(int(value.decode()))
++                except ValueError:
++                    raise InvalidHeaderError("invalid header")
++
+         next.sparse = list(zip(offsets, numbytes))
+ 
+     def _proc_gnusparse_01(self, next, pax_headers):
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index cfc13bccb20..007c3e94acb 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -1139,6 +1139,48 @@ def test_pax_number_fields(self):
+         finally:
+             tar.close()
+ 
++    def test_pax_header_bad_formats(self):
++        # The fields from the pax header have priority over the
++        # TarInfo.
++        pax_header_replacements = (
++            b" foo=bar\n",
++            b"0 \n",
++            b"1 \n",
++            b"2 \n",
++            b"3 =\n",
++            b"4 =a\n",
++            b"1000000 foo=bar\n",
++            b"0 foo=bar\n",
++            b"-12 foo=bar\n",
++            b"000000000000000000000000036 foo=bar\n",
++        )
++        pax_headers = {"foo": "bar"}
++
++        for replacement in pax_header_replacements:
++            with self.subTest(header=replacement):
++                tar = tarfile.open(tmpname, "w", format=tarfile.PAX_FORMAT,
++                                   encoding="iso8859-1")
++                try:
++                    t = tarfile.TarInfo()
++                    t.name = "pax"  # non-ASCII
++                    t.uid = 1
++                    t.pax_headers = pax_headers
++                    tar.addfile(t)
++                finally:
++                    tar.close()
++
++                with open(tmpname, "rb") as f:
++                    data = f.read()
++                    self.assertIn(b"11 foo=bar\n", data)
++                    data = data.replace(b"11 foo=bar\n", replacement)
++
++                with open(tmpname, "wb") as f:
++                    f.truncate()
++                    f.write(data)
++
++                with self.assertRaisesRegex(tarfile.ReadError, r"method tar: ReadError\('invalid header'\)"):
++                    tarfile.open(tmpname, encoding="iso8859-1")
++
+ 
+ class WriteTestBase(TarTest):
+     # Put all write tests in here that are supposed to be tested
+diff --git a/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
+new file mode 100644
+index 00000000000..81f918bfe2b
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
+@@ -0,0 +1,2 @@
++Remove backtracking from tarfile header parsing for ``hdrcharset``, PAX, and
++GNU sparse headers.
+-- 
+2.46.0
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch b/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
new file mode 100644
index 0000000000..7303a41e20
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
@@ -0,0 +1,140 @@
+From 3c15b8437f57fe1027171b34af88bf791cf1868c Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 4 Sep 2024 17:50:36 +0200
+Subject: [PATCH 1/2] [3.10] gh-123067: Fix quadratic complexity in parsing
+ "-quoted cookie values with backslashes (GH-123075) (#123106)
+
+This fixes CVE-2024-7592.
+(cherry picked from commit 44e458357fca05ca0ae2658d62c8c595b048b5ef)
+
+Upstream-Status: Backport from https://github.com/python/cpython/commit/b2f11ca7667e4d57c71c1c88b255115f16042d9a
+CVE: CVE-2024-7592
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ Lib/http/cookies.py                           | 34 ++++-------------
+ Lib/test/test_http_cookies.py                 | 38 +++++++++++++++++++
+ ...-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst |  1 +
+ 3 files changed, 47 insertions(+), 26 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
+
+diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
+index 35ac2dc6ae2..2c1f021d0ab 100644
+--- a/Lib/http/cookies.py
++++ b/Lib/http/cookies.py
+@@ -184,8 +184,13 @@ def _quote(str):
+         return '"' + str.translate(_Translator) + '"'
+ 
+ 
+-_OctalPatt = re.compile(r"\\[0-3][0-7][0-7]")
+-_QuotePatt = re.compile(r"[\\].")
++_unquote_sub = re.compile(r'\\(?:([0-3][0-7][0-7])|(.))').sub
++
++def _unquote_replace(m):
++    if m[1]:
++        return chr(int(m[1], 8))
++    else:
++        return m[2]
+ 
+ def _unquote(str):
+     # If there aren't any doublequotes,
+@@ -205,30 +210,7 @@ def _unquote(str):
+     #    \012 --> \n
+     #    \"   --> "
+     #
+-    i = 0
+-    n = len(str)
+-    res = []
+-    while 0 <= i < n:
+-        o_match = _OctalPatt.search(str, i)
+-        q_match = _QuotePatt.search(str, i)
+-        if not o_match and not q_match:              # Neither matched
+-            res.append(str[i:])
+-            break
+-        # else:
+-        j = k = -1
+-        if o_match:
+-            j = o_match.start(0)
+-        if q_match:
+-            k = q_match.start(0)
+-        if q_match and (not o_match or k < j):     # QuotePatt matched
+-            res.append(str[i:k])
+-            res.append(str[k+1])
+-            i = k + 2
+-        else:                                      # OctalPatt matched
+-            res.append(str[i:j])
+-            res.append(chr(int(str[j+1:j+4], 8)))
+-            i = j + 4
+-    return _nulljoin(res)
++    return _unquote_sub(_unquote_replace, str)
+ 
+ # The _getdate() routine is used to set the expiration time in the cookie's HTTP
+ # header.  By default, _getdate() returns the current time in the appropriate
+diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
+index 6072c7e15e9..644e75cd5b7 100644
+--- a/Lib/test/test_http_cookies.py
++++ b/Lib/test/test_http_cookies.py
+@@ -5,6 +5,7 @@
+ import unittest
+ from http import cookies
+ import pickle
++from test import support
+ 
+ 
+ class CookieTests(unittest.TestCase):
+@@ -58,6 +59,43 @@ def test_basic(self):
+             for k, v in sorted(case['dict'].items()):
+                 self.assertEqual(C[k].value, v)
+ 
++    def test_unquote(self):
++        cases = [
++            (r'a="b=\""', 'b="'),
++            (r'a="b=\\"', 'b=\\'),
++            (r'a="b=\="', 'b=='),
++            (r'a="b=\n"', 'b=n'),
++            (r'a="b=\042"', 'b="'),
++            (r'a="b=\134"', 'b=\\'),
++            (r'a="b=\377"', 'b=\xff'),
++            (r'a="b=\400"', 'b=400'),
++            (r'a="b=\42"', 'b=42'),
++            (r'a="b=\\042"', 'b=\\042'),
++            (r'a="b=\\134"', 'b=\\134'),
++            (r'a="b=\\\""', 'b=\\"'),
++            (r'a="b=\\\042"', 'b=\\"'),
++            (r'a="b=\134\""', 'b=\\"'),
++            (r'a="b=\134\042"', 'b=\\"'),
++        ]
++        for encoded, decoded in cases:
++            with self.subTest(encoded):
++                C = cookies.SimpleCookie()
++                C.load(encoded)
++                self.assertEqual(C['a'].value, decoded)
++
++    @support.requires_resource('cpu')
++    def test_unquote_large(self):
++        n = 10**6
++        for encoded in r'\\', r'\134':
++            with self.subTest(encoded):
++                data = 'a="b=' + encoded*n + ';"'
++                C = cookies.SimpleCookie()
++                C.load(data)
++                value = C['a'].value
++                self.assertEqual(value[:3], 'b=\\')
++                self.assertEqual(value[-2:], '\\;')
++                self.assertEqual(len(value), n + 3)
++
+     def test_load(self):
+         C = cookies.SimpleCookie()
+         C.load('Customer="WILE_E_COYOTE"; Version=1; Path=/acme')
+diff --git a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
+new file mode 100644
+index 00000000000..6a234561fe3
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst
+@@ -0,0 +1 @@
++Fix quadratic complexity in parsing ``"``-quoted cookie values with backslashes by :mod:`http.cookies`.
+-- 
+2.46.0
+
diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recipes-devtools/python/python3_3.10.14.bb
index 14ab3f6155..c337dfe450 100644
--- a/meta/recipes-devtools/python/python3_3.10.14.bb
+++ b/meta/recipes-devtools/python/python3_3.10.14.bb
@@ -37,6 +37,8 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
 	   file://CVE-2024-8088.patch \
+           file://CVE-2024-7592.patch \
+           file://CVE-2024-6232.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


