Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B77E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:53:27 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.32695.1725810805521452054
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LFx1690F;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7cd8d2731d1so2484429a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 08:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725810805; x=1726415605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DS9ewEiHjnbRE1+xE0qM3ubRlZafQwwP62h3G+HvDY=;
        b=LFx1690FdJkGJpu4PcgT7PeiYtCFINu0CHgW1lhQYjILRNUgm5rlVCRrT/hUGzj+hf
         hu5hIWp9jOWWgB6+V5s3Sa0kDA2+xbrEUvyrRnUteayxZBDLjK1E7Twd6F3iW06hUYPt
         1mFPtb8CDKGlyFnTMos5yRI496dPrDD3g6ieid0CiMAsBFilzAZm37Z4tR2tUfIuHVbD
         6ReMn2Ewn7xLoy3Z6KHuh3cd5d+Av522fPv5jXhOvTa0nBwyGlf3RZCh5DaDjdeu5NSo
         6rAgLjOOcuTvnmJwxrnbZyUskNEV+R60yAS4JQnIx1gLKurveSGOlf0I8r5ka0exfXXO
         v45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725810805; x=1726415605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DS9ewEiHjnbRE1+xE0qM3ubRlZafQwwP62h3G+HvDY=;
        b=d1kem+x4grl09TypanPWDPIDUM/6KcpK0uS2EWUWy703OA1ygUL+1u6nrSuCxwX6Bn
         Auqn7mLl0ROrGssDVgN+Ydu4SML37oi6nNWak13HKvi9yIP4oBvZbfXLiNh0IF0B2J96
         vEYoHk7l4u+rh5FVaKK5SD5dCAWKUplC2l0Fi+zVGeD3kAjeCT5EjkBObJm4eX79ENhn
         WP4e0XDT94/qtsvD8w+xUckg7e+W5MNNONV0MPU0UwSirDshgvaPLghjqwQp7dMmR4CK
         ktxzo+/9bEyoY43KYC9/NphwJ2/3PRhwUmz94hRAww5T5JBXsaXxBfBgG1X+nbap8jBK
         7qjg==
X-Gm-Message-State: AOJu0YwOF4ULEVaH6dZZKJeNFR3nOskls9Jg+zQkCMMtZhLYFVWIOAM2
	zoFU64w903zGEtKS+EHN82LdAlXzpqcIjl5RIFMzMOsCx+7OWiOHt4QVFfar
X-Google-Smtp-Source: AGHT+IFCWAt5K56pQsOx20XxCQUdQPdhpoZDG8lFAg6gBVklv76HZWd3gEMoU/gZ18n0pIzkXcDewA==
X-Received: by 2002:a17:902:e891:b0:202:13ca:d73e with SMTP id d9443c01a7336-206f0518deemr77231325ad.28.1725810804056;
        Sun, 08 Sep 2024 08:53:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4cdb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f326b0sm21225405ad.247.2024.09.08.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 08:53:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python: Backport fix for regex DoS when parsing TarFile headers
Date: Sun,  8 Sep 2024 08:53:21 -0700
Message-ID: <20240908155321.1476802-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 15:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204302

Fixes CVE-2024-6232

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3/CVE-2024-6232.patch        | 522 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.5.bb |   1 +
 2 files changed, 523 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-6232.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2024-6232.patch b/meta/recipes-devtools/python/python3/CVE-2024-6232.patch
new file mode 100644
index 00000000000..313b9e25383
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-6232.patch
@@ -0,0 +1,522 @@
+From abb1b033b2fc7454002dc601dc387a78edede31c Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Tue, 2 Jul 2024 13:36:30 -0500
+Subject: [PATCH 1/8] Remove backtracking when parsing tarfile headers
+
+CVE: CVE-2024-6232
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/python/cpython/pull/121286]
+---
+ Lib/tarfile.py                                | 46 +++++++++++++------
+ ...-07-02-13-39-20.gh-issue-121285.hrl-yI.rst |  2 +
+ 2 files changed, 35 insertions(+), 13 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index d5d8a469779f50..5797c9d645a69a 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1422,7 +1422,7 @@ def _proc_pax(self, tarfile):
+            POSIX.1-2008.
+         """
+         # Read the header information.
+-        buf = tarfile.fileobj.read(self._block(self.size))
++        buf: bytes = tarfile.fileobj.read(self._block(self.size))
+ 
+         # A pax header stores supplemental information for either
+         # the following file (extended) or all following files
+@@ -1437,9 +1437,15 @@ def _proc_pax(self, tarfile):
+         # these fields are UTF-8 encoded but since POSIX.1-2008 tar
+         # implementations are allowed to store them as raw binary strings if
+         # the translation to UTF-8 fails.
+-        match = re.search(br"\d+ hdrcharset=([^\n]+)\n", buf)
+-        if match is not None:
+-            pax_headers["hdrcharset"] = match.group(1).decode("utf-8")
++        if (
++            # Statement is both a contains check (!=-1) and a bounds check (>0)
++            (hdrcharset_offset := buf.find(b" hdrcharset=") - 1) > -1
++            # Check that the character before is a digit (0x30-0x39 is 0-9)
++            and 0x30 <= buf[hdrcharset_offset] <= 0x39
++        ):
++            match = re.match(br"^\d{1,20} hdrcharset=([^\n]+)\n", buf[hdrcharset_offset:])
++            if match is not None:
++                pax_headers["hdrcharset"] = match.group(1).decode("utf-8")
+ 
+         # For the time being, we don't care about anything other than "BINARY".
+         # The only other value that is currently allowed by the standard is
+@@ -1454,14 +1460,14 @@ def _proc_pax(self, tarfile):
+         # "%d %s=%s\n" % (length, keyword, value). length is the size
+         # of the complete record including the length field itself and
+         # the newline. keyword and value are both UTF-8 encoded strings.
+-        regex = re.compile(br"(\d+) ([^=]+)=")
++        regex = re.compile(br"^(\d{1,20}) ([^=]+)=")
+         pos = 0
+-        while match := regex.match(buf, pos):
++        while match := regex.match(buf[pos:]):
+             length, keyword = match.groups()
+             length = int(length)
+             if length == 0:
+                 raise InvalidHeaderError("invalid header")
+-            value = buf[match.end(2) + 1:match.start(1) + length - 1]
++            value = buf[match.end(2) + pos + 1:match.start(1) + pos + length - 1]
+ 
+             # Normally, we could just use "utf-8" as the encoding and "strict"
+             # as the error handler, but we better not take the risk. For
+@@ -1520,12 +1526,26 @@ def _proc_pax(self, tarfile):
+     def _proc_gnusparse_00(self, next, pax_headers, buf):
+         """Process a GNU tar extended sparse header, version 0.0.
+         """
+-        offsets = []
+-        for match in re.finditer(br"\d+ GNU.sparse.offset=(\d+)\n", buf):
+-            offsets.append(int(match.group(1)))
+-        numbytes = []
+-        for match in re.finditer(br"\d+ GNU.sparse.numbytes=(\d+)\n", buf):
+-            numbytes.append(int(match.group(1)))
++        def finditer_without_backtracking(buf, needle: bytes) -> list[int]:
++            values = []
++            regex = re.compile(br"^\d{1,20}%s(\d+)\n" % (needle,))
++            while True:
++                if (
++                    # Statement is both a contains check (!=-1) and a bounds check (>0)
++                    (needle_offset := buf.find(needle) - 1) > -1
++                    # Check that the character before is a digit (0x30-0x39 is 0-9)
++                    and 0x30 <= buf[needle_offset] <= 0x39
++                ):
++                    match = regex.match(buf[needle_offset:])
++                    if match is not None:
++                        values.append(int(match.group(1)))
++                    buf = buf[needle_offset + len(needle):]  # Skip over to the match.
++                else:
++                    break
++            return values
++
++        offsets = finditer_without_backtracking(buf, b" GNU.sparse.offset=")
++        numbytes = finditer_without_backtracking(buf, b" GNU.sparse.numbytes=")
+         next.sparse = list(zip(offsets, numbytes))
+ 
+     def _proc_gnusparse_01(self, next, pax_headers):
+diff --git a/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
+new file mode 100644
+index 00000000000000..4499d7c72ba8c5
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
+@@ -0,0 +1,2 @@
++Remove backtracking from tarfile header parsing for `hdrcharset`, PAX, and
++GNU sparse headers.
+
+From 647f4ef484343bcc77a9be8bd163d50f2daa06ff Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <sethmichaellarson@gmail.com>
+Date: Tue, 2 Jul 2024 13:44:19 -0500
+Subject: [PATCH 2/8] Update
+ Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
+
+Co-authored-by: Kirill Podoprigora <kirill.bast9@mail.ru>
+---
+ .../Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst     | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
+index 4499d7c72ba8c5..81f918bfe2b255 100644
+--- a/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
++++ b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI.rst
+@@ -1,2 +1,2 @@
+-Remove backtracking from tarfile header parsing for `hdrcharset`, PAX, and
++Remove backtracking from tarfile header parsing for ``hdrcharset``, PAX, and
+ GNU sparse headers.
+
+From 0b5341b66a8cea891608fc4deab026aaa14a1307 Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Tue, 2 Jul 2024 14:17:48 -0500
+Subject: [PATCH 3/8] Remove type hints
+
+---
+ Lib/tarfile.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 5797c9d645a69a..426e2da0181d84 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1422,7 +1422,7 @@ def _proc_pax(self, tarfile):
+            POSIX.1-2008.
+         """
+         # Read the header information.
+-        buf: bytes = tarfile.fileobj.read(self._block(self.size))
++        buf = tarfile.fileobj.read(self._block(self.size))
+ 
+         # A pax header stores supplemental information for either
+         # the following file (extended) or all following files
+@@ -1526,7 +1526,7 @@ def _proc_pax(self, tarfile):
+     def _proc_gnusparse_00(self, next, pax_headers, buf):
+         """Process a GNU tar extended sparse header, version 0.0.
+         """
+-        def finditer_without_backtracking(buf, needle: bytes) -> list[int]:
++        def finditer_without_backtracking(buf, needle):
+             values = []
+             regex = re.compile(br"^\d{1,20}%s(\d+)\n" % (needle,))
+             while True:
+
+From 9a6cc59f6ddbeac7fc5de8b84e40dc8ccb58230e Mon Sep 17 00:00:00 2001
+From: "Gregory P. Smith" <greg@krypto.org>
+Date: Wed, 3 Jul 2024 14:32:13 -0700
+Subject: [PATCH 4/8] match up to 20 digits in _proc_gnusparse_00
+
+this is used as an offset/length value, it doesn't need to be longer.  the \d+ prefix on the lines is not treated as an int so it's length bound is not important.
+---
+ Lib/tarfile.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 426e2da0181d84..6f9751e89386ad 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1528,7 +1528,7 @@ def _proc_gnusparse_00(self, next, pax_headers, buf):
+         """
+         def finditer_without_backtracking(buf, needle):
+             values = []
+-            regex = re.compile(br"^\d{1,20}%s(\d+)\n" % (needle,))
++            regex = re.compile(br"^\d+%s(\d{1,20})\n" % (needle,))
+             while True:
+                 if (
+                     # Statement is both a contains check (!=-1) and a bounds check (>0)
+
+From 39a419cbc6e345da202546af3af4d1be08aeb0a7 Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Tue, 9 Jul 2024 12:34:12 -0500
+Subject: [PATCH 5/8] Rewrite PAX header parsing to be stricter
+
+---
+ Lib/tarfile.py           | 78 ++++++++++++++++++++++------------------
+ Lib/test/test_tarfile.py | 42 ++++++++++++++++++++++
+ 2 files changed, 85 insertions(+), 35 deletions(-)
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 6f9751e89386ad..753a55f93e353f 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -845,6 +845,9 @@ def data_filter(member, dest_path):
+ # Sentinel for replace() defaults, meaning "don't change the attribute"
+ _KEEP = object()
+ 
++# Header length is digits followed by a space.
++_header_length_prefix_re = re.compile(br"([0-9]{1,20}) ")
++
+ class TarInfo(object):
+     """Informational class which holds the details about an
+        archive member given by a tar header block.
+@@ -1432,43 +1435,49 @@ def _proc_pax(self, tarfile):
+         else:
+             pax_headers = tarfile.pax_headers.copy()
+ 
+-        # Check if the pax header contains a hdrcharset field. This tells us
+-        # the encoding of the path, linkpath, uname and gname fields. Normally,
+-        # these fields are UTF-8 encoded but since POSIX.1-2008 tar
+-        # implementations are allowed to store them as raw binary strings if
+-        # the translation to UTF-8 fails.
+-        if (
+-            # Statement is both a contains check (!=-1) and a bounds check (>0)
+-            (hdrcharset_offset := buf.find(b" hdrcharset=") - 1) > -1
+-            # Check that the character before is a digit (0x30-0x39 is 0-9)
+-            and 0x30 <= buf[hdrcharset_offset] <= 0x39
+-        ):
+-            match = re.match(br"^\d{1,20} hdrcharset=([^\n]+)\n", buf[hdrcharset_offset:])
+-            if match is not None:
+-                pax_headers["hdrcharset"] = match.group(1).decode("utf-8")
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
+-        regex = re.compile(br"^(\d{1,20}) ([^=]+)=")
++        # the newline.
+         pos = 0
+-        while match := regex.match(buf[pos:]):
+-            length, keyword = match.groups()
+-            length = int(length)
+-            if length == 0:
++        encoding = "utf-8"
++        raw_headers = []
++        while len(buf) > pos and buf[pos] != 0x00:
++            if not (match := _header_length_prefix_re.match(buf, pos)):
++                raise InvalidHeaderError("invalid header")
++            try:
++                length = int(match.group(1))
++            except ValueError:
++                raise InvalidHeaderError("invalid header")
++            # Headers must be at least 3 bytes, one for each of keyword, '=', and '\n'.
++            # Value is allowed to be empty.
++            if length < 3:
+                 raise InvalidHeaderError("invalid header")
+-            value = buf[match.end(2) + pos + 1:match.start(1) + pos + length - 1]
++            if pos + length > len(buf):
++                raise InvalidHeaderError("invalid header")
++
++            keyword_and_value = buf[match.end(1) + 1:match.start(1) + length - 1]
++            raw_keyword, equals, raw_value = keyword_and_value.partition(b"=")
++
++            # Check the framing of the header. The last character must be '\n' (0x0A)
++            if not raw_keyword or equals != b"=" or buf[match.start(1) + length - 1] != 0x0A:
++                raise InvalidHeaderError("invalid header")
++            raw_headers.append((length, raw_keyword, raw_value))
++
++            # Check if the pax header contains a hdrcharset field. This tells us
++            # the encoding of the path, linkpath, uname and gname fields. Normally,
++            # these fields are UTF-8 encoded but since POSIX.1-2008 tar
++            # implementations are allowed to store them as raw binary strings if
++            # the translation to UTF-8 fails. For the time being, we don't care about
++            # anything other than "BINARY". The only other value that is currently
++            # allowed by the standard is "ISO-IR 10646 2000 UTF-8" in other words UTF-8.
++            if raw_keyword == b"hdrcharset" and raw_value == b"BINARY":
++                encoding = tarfile.encoding
+ 
++            pos += length
++
++        # After parsing the raw headers we can decode them to text.
++        for length, raw_keyword, raw_value in raw_headers:
+             # Normally, we could just use "utf-8" as the encoding and "strict"
+             # as the error handler, but we better not take the risk. For
+             # example, GNU tar <= 1.23 is known to store filenames it cannot
+@@ -1476,17 +1485,16 @@ def _proc_pax(self, tarfile):
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
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index f715940de1d584..f2695dca110747 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -1268,6 +1268,48 @@ def test_pax_number_fields(self):
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
++                with self.assertRaisesRegex(tarfile.ReadError, "method tar: ReadError\('invalid header'\)"):
++                    tarfile.open(tmpname, encoding="iso8859-1")
++
+ 
+ class WriteTestBase(TarTest):
+     # Put all write tests in here that are supposed to be tested
+
+From 4d04f3bc24f2f3e679722f8a06dee801bcff64ed Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Tue, 9 Jul 2024 12:49:05 -0500
+Subject: [PATCH 6/8] Optimize parsing of GNU extended sparse headers v0.0
+
+---
+ Lib/tarfile.py | 37 ++++++++++++++++---------------------
+ 1 file changed, 16 insertions(+), 21 deletions(-)
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 753a55f93e353f..97f9bda25e5a6a 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1509,7 +1509,7 @@ def _proc_pax(self, tarfile):
+ 
+         elif "GNU.sparse.size" in pax_headers:
+             # GNU extended sparse format version 0.0.
+-            self._proc_gnusparse_00(next, pax_headers, buf)
++            self._proc_gnusparse_00(next, raw_headers)
+ 
+         elif pax_headers.get("GNU.sparse.major") == "1" and pax_headers.get("GNU.sparse.minor") == "0":
+             # GNU extended sparse format version 1.0.
+@@ -1531,29 +1531,24 @@ def _proc_pax(self, tarfile):
+ 
+         return next
+ 
+-    def _proc_gnusparse_00(self, next, pax_headers, buf):
++    def _proc_gnusparse_00(self, next, raw_headers):
+         """Process a GNU tar extended sparse header, version 0.0.
+         """
+-        def finditer_without_backtracking(buf, needle):
+-            values = []
+-            regex = re.compile(br"^\d+%s(\d{1,20})\n" % (needle,))
+-            while True:
+-                if (
+-                    # Statement is both a contains check (!=-1) and a bounds check (>0)
+-                    (needle_offset := buf.find(needle) - 1) > -1
+-                    # Check that the character before is a digit (0x30-0x39 is 0-9)
+-                    and 0x30 <= buf[needle_offset] <= 0x39
+-                ):
+-                    match = regex.match(buf[needle_offset:])
+-                    if match is not None:
+-                        values.append(int(match.group(1)))
+-                    buf = buf[needle_offset + len(needle):]  # Skip over to the match.
+-                else:
+-                    break
+-            return values
++        offsets = []
++        numbytes = []
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
+ 
+-        offsets = finditer_without_backtracking(buf, b" GNU.sparse.offset=")
+-        numbytes = finditer_without_backtracking(buf, b" GNU.sparse.numbytes=")
+         next.sparse = list(zip(offsets, numbytes))
+ 
+     def _proc_gnusparse_01(self, next, pax_headers):
+
+From 6ca6329d1cca1dd25cd6ab8cf2a498bbe2a9154e Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Mon, 26 Aug 2024 11:47:13 -0500
+Subject: [PATCH 7/8] Address review feedback
+
+---
+ Lib/tarfile.py | 24 +++++++++++++++++-------
+ 1 file changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 31fa8c357fac0e..1475b3da2d3293 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1440,7 +1440,7 @@ def _proc_pax(self, tarfile):
+         # of the complete record including the length field itself and
+         # the newline.
+         pos = 0
+-        encoding = "utf-8"
++        encoding = None
+         raw_headers = []
+         while len(buf) > pos and buf[pos] != 0x00:
+             if not (match := _header_length_prefix_re.match(buf, pos)):
+@@ -1449,18 +1449,19 @@ def _proc_pax(self, tarfile):
+                 length = int(match.group(1))
+             except ValueError:
+                 raise InvalidHeaderError("invalid header")
+-            # Headers must be at least 3 bytes, one for each of keyword, '=', and '\n'.
++            # Headers must be at least 5 bytes, shortest being '5 x=\n'.
+             # Value is allowed to be empty.
+-            if length < 3:
++            if length < 5:
+                 raise InvalidHeaderError("invalid header")
+             if pos + length > len(buf):
+                 raise InvalidHeaderError("invalid header")
+ 
+-            keyword_and_value = buf[match.end(1) + 1:match.start(1) + length - 1]
++            header_value_end_offset = match.start(1) + length - 1  # Last byte of the header
++            keyword_and_value = buf[match.end(1) + 1:header_value_end_offset]
+             raw_keyword, equals, raw_value = keyword_and_value.partition(b"=")
+ 
+             # Check the framing of the header. The last character must be '\n' (0x0A)
+-            if not raw_keyword or equals != b"=" or buf[match.start(1) + length - 1] != 0x0A:
++            if not raw_keyword or equals != b"=" or buf[header_value_end_offset] != 0x0A:
+                 raise InvalidHeaderError("invalid header")
+             raw_headers.append((length, raw_keyword, raw_value))
+ 
+@@ -1471,11 +1472,20 @@ def _proc_pax(self, tarfile):
+             # the translation to UTF-8 fails. For the time being, we don't care about
+             # anything other than "BINARY". The only other value that is currently
+             # allowed by the standard is "ISO-IR 10646 2000 UTF-8" in other words UTF-8.
+-            if raw_keyword == b"hdrcharset" and raw_value == b"BINARY":
+-                encoding = tarfile.encoding
++            # Note that we only follow the initial 'hdrcharset' setting to preserve
++            # the initial behavior of the 'tarfile' module.
++            if raw_keyword == b"hdrcharset" and encoding is None:
++                if raw_value == b"BINARY":
++                    encoding = tarfile.encoding
++                else:  # This branch ensures only the first 'hdrcharset' header is used.
++                    encoding = "utf-8"
+ 
+             pos += length
+ 
++        # If no explicit hdrcharset is set, we use UTF-8 as a default.
++        if encoding is None:
++            encoding = "utf-8"
++
+         # After parsing the raw headers we can decode them to text.
+         for length, raw_keyword, raw_value in raw_headers:
+             # Normally, we could just use "utf-8" as the encoding and "strict"
+
+From b5c45111f588a900c058f5d030c828820031e3a6 Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Mon, 26 Aug 2024 13:33:28 -0500
+Subject: [PATCH 8/8] Fix invalid escape sequence
+
+---
+ Lib/test/test_tarfile.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 6589d72781b655..54d329a15d4d25 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -1300,7 +1300,7 @@ def test_pax_header_bad_formats(self):
+                     f.truncate()
+                     f.write(data)
+ 
+-                with self.assertRaisesRegex(tarfile.ReadError, "method tar: ReadError\('invalid header'\)"):
++                with self.assertRaisesRegex(tarfile.ReadError, r"method tar: ReadError\('invalid header'\)"):
+                     tarfile.open(tmpname, encoding="iso8859-1")
+ 
+ 
diff --git a/meta/recipes-devtools/python/python3_3.12.5.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
index 29b02ef510f..337d6685d1f 100644
--- a/meta/recipes-devtools/python/python3_3.12.5.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2024-7592.patch \
+           file://CVE-2024-6232.patch \
            "
 
 SRC_URI:append:class-native = " \

