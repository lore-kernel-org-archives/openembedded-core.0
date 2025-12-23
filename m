Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FBEE6FE3A
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:22:56 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109342.1766524969531410140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KHM++qPQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d52768ccso66721625ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524969; x=1767129769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5zDMuLAwqyZI1Q6QDozpvXRbvgIODTVeloGxxgJXLc=;
        b=KHM++qPQZQMV5EC+EirnHJBkSanGWtnqBJVt3Ytinhw/8kvJOZ83k40MnVxywHZa0M
         Ojk8LtgY0jSo0dr2q85tV+9eRLzAvVZFb165N0CkHqJGR8/0vFYBlku2awRrnjRBJ4e3
         zd5lUYg6RhMnc+WyI8g+i/N2FQDjylxREC8I0EEqn3qi2zcAiiOT9XIYvpg6hMj37LeX
         6lWAjBh5wyCUNc4KcDy/nGuNmAlVybXof5TywVdfXN/xAVWquMttfZIkdeADXNtekK7B
         yz6IiLOSe5v80iKtB7JljZoXvYXPYhRkqwkly01RuPBFoIz5RhvNZKPcv5cwaxiE5//7
         1y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524969; x=1767129769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C5zDMuLAwqyZI1Q6QDozpvXRbvgIODTVeloGxxgJXLc=;
        b=GgSk7lT4Z2jMdRJgayWAWhLijcOLcoZDo976FHDLWH2Gj6n5x2Kid+FeR/ZUudFFCF
         ISxrnX+YjhYGprFgeRyhFFZTBi/fKQYHKutCrfAxL9sHC38pO3fxYyAzkEncdGxG/zY+
         JHhw9nv9sXedcjpfPkqqFMBLuGGNsFCe8LzfBgpwnHY4XaOZM8dUaMcbkIZSjKPHcLVJ
         qqBYEwVE1C3Y6DROWO9wzc8JJZqF3ur2wWFJDNMP5Ro5N9QJkUwmV3w/BLIj2wmSwuUu
         jcWpclwProPo8OgoKw+xdTBUXd/ckLBetNTbd/qpwPte0ER4ShgiUz4oEpnE41fYikam
         5iPA==
X-Gm-Message-State: AOJu0Yyk0yM1FWq3IX+OX4vWWXP6ehbDlMyM2ycDQiQS3X7/ZPXwx/TJ
	xcnDykS3Yd2EzihRRYZbHS8blgb3MLKsTeoStvF52Kqim8EVHle2T4f4Kfg5rWK6V6XN7jhRRHl
	vGO+p
X-Gm-Gg: AY/fxX7w3uFLTzXn6+dt1eFx3/5EikdUXKgTvU+EHwxQ5rcCE9ZES6OxisVNEEAxX+V
	wjjzy6wx6vN/bjMTE7urOSMbNYa1aQASwCIrdP1fYPYLgcf3tseaJDFTLY8KW+8ZuvOahKREqCT
	fdVmkIequFlC7ZosS1wlEcfQpAj4x4KAJ4qkh6rgIKXvOUFJkX3c3sPHMTDy21899tOAUbK4Rhz
	67tWgQsyvX5Z1k29DgfHDG9AceSQo4rPfZ4hGCxm3xdeNtsRFDsoGJ048R7SKqio65HPc4Jczu9
	H5ito4za4/dfeKLluEs3X+ClKUXRZPMRx3WXZrdKosG0bPn5PErVMOkIkazPe/FvuVkcFcpBL1J
	Gd31fHp8fNia7HTLEVFGyP2sIESmmw2KqkIzEXZlAHOPoRSuUMBOrGSTgMVrmaTthnfmNTR+aC0
	RJPQ==
X-Google-Smtp-Source: AGHT+IFepmz8zc30SfvGKq+WxP4+8XVDjo6mVQVAMROXQENjBxRq209+fXEkkn5jB/WiObISaFGfzg==
X-Received: by 2002:a17:903:2f87:b0:295:59ef:809e with SMTP id d9443c01a7336-2a2f232db53mr137116405ad.24.1766524968513;
        Tue, 23 Dec 2025 13:22:48 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.22.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:22:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/18] python3-urllib3: fix CVE-2025-66418 CVE-2025-66471
Date: Tue, 23 Dec 2025 13:22:11 -0800
Message-ID: <d9f52c5f86bcc4716e384fe5c01c03d386d60446.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228479

From: Jiaying Song <jiaying.song.cn@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-66418
https://nvd.nist.gov/vuln/detail/CVE-2025-66471

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-urllib3/CVE-2025-66418.patch      |  80 +++
 .../python3-urllib3/CVE-2025-66471.patch      | 585 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   2 +
 3 files changed, 667 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
new file mode 100644
index 0000000000..5d39b36afc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
@@ -0,0 +1,80 @@
+From 3bf7db860ef730e828b68264e88210190120cacf Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Fri, 5 Dec 2025 16:41:33 +0200
+Subject: [PATCH] Merge commit from fork
+
+* Add a hard-coded limit for the decompression chain
+
+* Reuse new list
+
+CVE: CVE-2025-66418
+
+Upstream-Status: Backport
+[https://github.com/urllib3/urllib3/commit/24d7b67eac89f94e11003424bcf0d8f7b72222a8]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ changelog/GHSA-gm62-xv2j-4w53.security.rst |  4 ++++
+ src/urllib3/response.py                    | 12 +++++++++++-
+ test/test_response.py                      | 10 ++++++++++
+ 3 files changed, 25 insertions(+), 1 deletion(-)
+ create mode 100644 changelog/GHSA-gm62-xv2j-4w53.security.rst
+
+diff --git a/changelog/GHSA-gm62-xv2j-4w53.security.rst b/changelog/GHSA-gm62-xv2j-4w53.security.rst
+new file mode 100644
+index 00000000..6646eaa3
+--- /dev/null
++++ b/changelog/GHSA-gm62-xv2j-4w53.security.rst
+@@ -0,0 +1,4 @@
++Fixed a security issue where an attacker could compose an HTTP response with
++virtually unlimited links in the ``Content-Encoding`` header, potentially
++leading to a denial of service (DoS) attack by exhausting system resources
++during decoding. The number of allowed chained encodings is now limited to 5.
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index a0273d65..b8e8565c 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -194,8 +194,18 @@ class MultiDecoder(ContentDecoder):
+         they were applied.
+     """
+ 
++    # Maximum allowed number of chained HTTP encodings in the
++    # Content-Encoding header.
++    max_decode_links = 5
++
+     def __init__(self, modes: str) -> None:
+-        self._decoders = [_get_decoder(m.strip()) for m in modes.split(",")]
++        encodings = [m.strip() for m in modes.split(",")]
++        if len(encodings) > self.max_decode_links:
++            raise DecodeError(
++                "Too many content encodings in the chain: "
++                f"{len(encodings)} > {self.max_decode_links}"
++            )
++        self._decoders = [_get_decoder(e) for e in encodings]
+ 
+     def flush(self) -> bytes:
+         return self._decoders[0].flush()
+diff --git a/test/test_response.py b/test/test_response.py
+index c0062771..0e8abd93 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -581,6 +581,16 @@ class TestResponse:
+         assert r.read(9 * 37) == b"foobarbaz" * 37
+         assert r.read() == b""
+ 
++    def test_read_multi_decoding_too_many_links(self) -> None:
++        fp = BytesIO(b"foo")
++        with pytest.raises(
++            DecodeError, match="Too many content encodings in the chain: 6 > 5"
++        ):
++            HTTPResponse(
++                fp,
++                headers={"content-encoding": "gzip, deflate, br, zstd, gzip, deflate"},
++            )
++
+     def test_body_blob(self) -> None:
+         resp = HTTPResponse(b"foo")
+         assert resp.data == b"foo"
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
new file mode 100644
index 0000000000..5329e26272
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
@@ -0,0 +1,585 @@
+From f25c0d11e1b640e3c7e0addb66a1ff50730be508 Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Fri, 5 Dec 2025 16:40:41 +0200
+Subject: [PATCH] Merge commit from fork
+
+* Prevent decompression bomb for zstd in Python 3.14
+
+* Add experimental `decompress_iter` for Brotli
+
+* Update changes for Brotli
+
+* Add `GzipDecoder.decompress_iter`
+
+* Test https://github.com/python-hyper/brotlicffi/pull/207
+
+* Pin Brotli
+
+* Add `decompress_iter` to all decoders and make tests pass
+
+* Pin brotlicffi to an official release
+
+* Revert changes to response.py
+
+* Add `max_length` parameter to all `decompress` methods
+
+* Fix the `test_brotlipy` session
+
+* Unset `_data` on gzip error
+
+* Add a test for memory usage
+
+* Test more methods
+
+* Fix the test for `stream`
+
+* Cover more lines with tests
+
+* Add more coverage
+
+* Make `read1` a bit more efficient
+
+* Fix PyPy tests for Brotli
+
+* Revert an unnecessarily moved check
+
+* Add some comments
+
+* Leave just one `self._obj.decompress` call in `GzipDecoder`
+
+* Refactor test params
+
+* Test reads with all data already in the decompressor
+
+* Prevent needless copying of data decoded with `max_length`
+
+* Rename the changed test
+
+* Note that responses of unknown length should be streamed too
+
+* Add a changelog entry
+
+* Avoid returning a memory view from `BytesQueueBuffer`
+
+* Add one more note to the changelog entry
+
+CVE: CVE-2025-66471
+
+Upstream-Status: Backport
+[https://github.com/urllib3/urllib3/commit/c19571de34c47de3a766541b041637ba5f716ed7]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ docs/advanced-usage.rst |   3 +-
+ docs/user-guide.rst     |   4 +-
+ pyproject.toml          |   5 +-
+ src/urllib3/response.py | 278 ++++++++++++++++++++++++++++++++++------
+ 4 files changed, 246 insertions(+), 44 deletions(-)
+
+diff --git a/docs/advanced-usage.rst b/docs/advanced-usage.rst
+index 36a51e67..a12c7143 100644
+--- a/docs/advanced-usage.rst
++++ b/docs/advanced-usage.rst
+@@ -66,7 +66,8 @@ When using ``preload_content=True`` (the default setting) the
+ response body will be read immediately into memory and the HTTP connection
+ will be released back into the pool without manual intervention.
+ 
+-However, when dealing with large responses it's often better to stream the response
++However, when dealing with responses of large or unknown length,
++it's often better to stream the response
+ content using ``preload_content=False``. Setting ``preload_content`` to ``False`` means
+ that urllib3 will only read from the socket when data is requested.
+ 
+diff --git a/docs/user-guide.rst b/docs/user-guide.rst
+index 5c78c8af..1d9d0bbd 100644
+--- a/docs/user-guide.rst
++++ b/docs/user-guide.rst
+@@ -145,8 +145,8 @@ to a byte string representing the response content:
+     print(resp.data)
+     # b"\xaa\xa5H?\x95\xe9\x9b\x11"
+ 
+-.. note:: For larger responses, it's sometimes better to :ref:`stream <stream>`
+-    the response.
++.. note:: For responses of large or unknown length, it's sometimes better to
++    :ref:`stream <stream>` the response.
+ 
+ Using io Wrappers with Response Content
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+diff --git a/pyproject.toml b/pyproject.toml
+index 1fe82937..58a2c2db 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -40,8 +40,8 @@ dynamic = ["version"]
+ 
+ [project.optional-dependencies]
+ brotli = [
+-  "brotli>=1.0.9; platform_python_implementation == 'CPython'",
+-  "brotlicffi>=0.8.0; platform_python_implementation != 'CPython'"
++  "brotli>=1.2.0; platform_python_implementation == 'CPython'",
++  "brotlicffi>=1.2.0.0; platform_python_implementation != 'CPython'"
+ ]
+ zstd = [
+   "zstandard>=0.18.0",
+@@ -95,6 +95,7 @@ filterwarnings = [
+     '''default:ssl\.PROTOCOL_TLSv1_1 is deprecated:DeprecationWarning''',
+     '''default:ssl\.PROTOCOL_TLSv1_2 is deprecated:DeprecationWarning''',
+     '''default:ssl NPN is deprecated, use ALPN instead:DeprecationWarning''',
++     '''default:Brotli >= 1.2.0 is required to prevent decompression bombs\.:urllib3.exceptions.DependencyWarning''',
+     '''default:Async generator 'quart\.wrappers\.response\.DataBody\.__aiter__\.<locals>\._aiter' was garbage collected.*:ResourceWarning''',  # https://github.com/pallets/quart/issues/301
+     '''default:unclosed file <_io\.BufferedWriter name='/dev/null'>:ResourceWarning''',  # https://github.com/SeleniumHQ/selenium/issues/13328
+ ]
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index b8e8565c..4304133e 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -49,6 +49,7 @@ from .connection import BaseSSLError, HTTPConnection, HTTPException
+ from .exceptions import (
+     BodyNotHttplibCompatible,
+     DecodeError,
++    DependencyWarning,
+     HTTPError,
+     IncompleteRead,
+     InvalidChunkLength,
+@@ -68,7 +69,11 @@ log = logging.getLogger(__name__)
+ 
+ 
+ class ContentDecoder:
+-    def decompress(self, data: bytes) -> bytes:
++    def decompress(self, data: bytes, max_length: int = -1) -> bytes:
++        raise NotImplementedError()
++
++    @property
++    def has_unconsumed_tail(self) -> bool:
+         raise NotImplementedError()
+ 
+     def flush(self) -> bytes:
+@@ -78,30 +83,57 @@ class ContentDecoder:
+ class DeflateDecoder(ContentDecoder):
+     def __init__(self) -> None:
+         self._first_try = True
+-        self._data = b""
++        self._first_try_data = b""
++        self._unfed_data = b""
+         self._obj = zlib.decompressobj()
+ 
+-    def decompress(self, data: bytes) -> bytes:
+-        if not data:
++    def decompress(self, data: bytes, max_length: int = -1) -> bytes:
++        data = self._unfed_data + data
++        self._unfed_data = b""
++        if not data and not self._obj.unconsumed_tail:
+             return data
++        original_max_length = max_length
++        if original_max_length < 0:
++            max_length = 0
++        elif original_max_length == 0:
++            # We should not pass 0 to the zlib decompressor because 0 is
++            # the default value that will make zlib decompress without a
++            # length limit.
++            # Data should be stored for subsequent calls.
++            self._unfed_data = data
++            return b""
+ 
++        # Subsequent calls always reuse `self._obj`. zlib requires
++        # passing the unconsumed tail if decompression is to continue.
+         if not self._first_try:
+-            return self._obj.decompress(data)
++            return self._obj.decompress(
++                self._obj.unconsumed_tail + data, max_length=max_length
++            )
+ 
+-        self._data += data
++        # First call tries with RFC 1950 ZLIB format.
++        self._first_try_data += data
+         try:
+-            decompressed = self._obj.decompress(data)
++            decompressed = self._obj.decompress(data, max_length=max_length)
+             if decompressed:
+                 self._first_try = False
+-                self._data = None  # type: ignore[assignment]
++                self._first_try_data = b""
+             return decompressed
++        # On failure, it falls back to RFC 1951 DEFLATE format.
+         except zlib.error:
+             self._first_try = False
+             self._obj = zlib.decompressobj(-zlib.MAX_WBITS)
+             try:
+-                return self.decompress(self._data)
++                return self.decompress(
++                    self._first_try_data, max_length=original_max_length
++                )
+             finally:
+-                self._data = None  # type: ignore[assignment]
++                self._first_try_data = b""
++
++    @property
++    def has_unconsumed_tail(self) -> bool:
++        return bool(self._unfed_data) or (
++            bool(self._obj.unconsumed_tail) and not self._first_try
++        )
+ 
+     def flush(self) -> bytes:
+         return self._obj.flush()
+@@ -117,27 +149,61 @@ class GzipDecoder(ContentDecoder):
+     def __init__(self) -> None:
+         self._obj = zlib.decompressobj(16 + zlib.MAX_WBITS)
+         self._state = GzipDecoderState.FIRST_MEMBER
++        self._unconsumed_tail = b""
+ 
+-    def decompress(self, data: bytes) -> bytes:
++    def decompress(self, data: bytes, max_length: int = -1) -> bytes:
+         ret = bytearray()
+-        if self._state == GzipDecoderState.SWALLOW_DATA or not data:
++        if self._state == GzipDecoderState.SWALLOW_DATA:
+             return bytes(ret)
++
++        if max_length == 0:
++            # We should not pass 0 to the zlib decompressor because 0 is
++            # the default value that will make zlib decompress without a
++            # length limit.
++            # Data should be stored for subsequent calls.
++            self._unconsumed_tail += data
++            return b""
++
++        # zlib requires passing the unconsumed tail to the subsequent
++        # call if decompression is to continue.
++        data = self._unconsumed_tail + data
++        if not data and self._obj.eof:
++            return bytes(ret)
++
+         while True:
+             try:
+-                ret += self._obj.decompress(data)
++                ret += self._obj.decompress(
++                    data, max_length=max(max_length - len(ret), 0)
++                )
+             except zlib.error:
+                 previous_state = self._state
+                 # Ignore data after the first error
+                 self._state = GzipDecoderState.SWALLOW_DATA
++                self._unconsumed_tail = b""
+                 if previous_state == GzipDecoderState.OTHER_MEMBERS:
+                     # Allow trailing garbage acceptable in other gzip clients
+                     return bytes(ret)
+                 raise
+-            data = self._obj.unused_data
++
++            self._unconsumed_tail = data = (
++                self._obj.unconsumed_tail or self._obj.unused_data
++            )
++            if max_length > 0 and len(ret) >= max_length:
++                break
++
+             if not data:
+                 return bytes(ret)
+-            self._state = GzipDecoderState.OTHER_MEMBERS
+-            self._obj = zlib.decompressobj(16 + zlib.MAX_WBITS)
++            # When the end of a gzip member is reached, a new decompressor
++            # must be created for unused (possibly future) data.
++            if self._obj.eof:
++                self._state = GzipDecoderState.OTHER_MEMBERS
++                self._obj = zlib.decompressobj(16 + zlib.MAX_WBITS)
++
++        return bytes(ret)
++
++    @property
++    def has_unconsumed_tail(self) -> bool:
++        return bool(self._unconsumed_tail)
+ 
+     def flush(self) -> bytes:
+         return self._obj.flush()
+@@ -152,9 +218,35 @@ if brotli is not None:
+         def __init__(self) -> None:
+             self._obj = brotli.Decompressor()
+             if hasattr(self._obj, "decompress"):
+-                setattr(self, "decompress", self._obj.decompress)
++                setattr(self, "_decompress", self._obj.decompress)
+             else:
+-                setattr(self, "decompress", self._obj.process)
++                setattr(self, "_decompress", self._obj.process)
++
++        # Requires Brotli >= 1.2.0 for `output_buffer_limit`.
++        def _decompress(self, data: bytes, output_buffer_limit: int = -1) -> bytes:
++            raise NotImplementedError()
++
++        def decompress(self, data: bytes, max_length: int = -1) -> bytes:
++            try:
++                if max_length > 0:
++                    return self._decompress(data, output_buffer_limit=max_length)
++                else:
++                    return self._decompress(data)
++            except TypeError:
++                # Fallback for Brotli/brotlicffi/brotlipy versions without
++                # the `output_buffer_limit` parameter.
++                warnings.warn(
++                    "Brotli >= 1.2.0 is required to prevent decompression bombs.",
++                    DependencyWarning,
++                )
++                return self._decompress(data)
++
++        @property
++        def has_unconsumed_tail(self) -> bool:
++            try:
++                return not self._obj.can_accept_more_data()
++            except AttributeError:
++                return False
+ 
+         def flush(self) -> bytes:
+             if hasattr(self._obj, "flush"):
+@@ -168,16 +260,46 @@ if HAS_ZSTD:
+         def __init__(self) -> None:
+             self._obj = zstd.ZstdDecompressor().decompressobj()
+ 
+-        def decompress(self, data: bytes) -> bytes:
+-            if not data:
++        def decompress(self, data: bytes, max_length: int = -1) -> bytes:
++            if not data and not self.has_unconsumed_tail:
+                 return b""
+-            data_parts = [self._obj.decompress(data)]
+-            while self._obj.eof and self._obj.unused_data:
++            if self._obj.eof:
++                data = self._obj.unused_data + data
++                self._obj = zstd.ZstdDecompressor()
++            part = self._obj.decompress(data, max_length=max_length)
++            length = len(part)
++            data_parts = [part]
++            # Every loop iteration is supposed to read data from a separate frame.
++            # The loop breaks when:
++            #   - enough data is read;
++            #   - no more unused data is available;
++            #   - end of the last read frame has not been reached (i.e.,
++            #     more data has to be fed).
++            while (
++                self._obj.eof
++                and self._obj.unused_data
++                and (max_length < 0 or length < max_length)
++            ):
+                 unused_data = self._obj.unused_data
+-                self._obj = zstd.ZstdDecompressor().decompressobj()
+-                data_parts.append(self._obj.decompress(unused_data))
++                if not self._obj.needs_input:
++                    self._obj = zstd.ZstdDecompressor()
++                part = self._obj.decompress(
++                    unused_data,
++                    max_length=(max_length - length) if max_length > 0 else -1,
++                )
++                if part_length := len(part):
++                    data_parts.append(part)
++                    length += part_length
++                elif self._obj.needs_input:
++                    break
+             return b"".join(data_parts)
+ 
++        @property
++        def has_unconsumed_tail(self) -> bool:
++            return not (self._obj.needs_input or self._obj.eof) or bool(
++                self._obj.unused_data
++            )
++
+         def flush(self) -> bytes:
+             ret = self._obj.flush()  # note: this is a no-op
+             if not self._obj.eof:
+@@ -210,10 +332,35 @@ class MultiDecoder(ContentDecoder):
+     def flush(self) -> bytes:
+         return self._decoders[0].flush()
+ 
+-    def decompress(self, data: bytes) -> bytes:
+-        for d in reversed(self._decoders):
+-            data = d.decompress(data)
+-        return data
++    def decompress(self, data: bytes, max_length: int = -1) -> bytes:
++        if max_length <= 0:
++            for d in reversed(self._decoders):
++                data = d.decompress(data)
++            return data
++
++        ret = bytearray()
++        # Every while loop iteration goes through all decoders once.
++        # It exits when enough data is read or no more data can be read.
++        # It is possible that the while loop iteration does not produce
++        # any data because we retrieve up to `max_length` from every
++        # decoder, and the amount of bytes may be insufficient for the
++        # next decoder to produce enough/any output.
++        while True:
++            any_data = False
++            for d in reversed(self._decoders):
++                data = d.decompress(data, max_length=max_length - len(ret))
++                if data:
++                    any_data = True
++                # We should not break when no data is returned because
++                # next decoders may produce data even with empty input.
++            ret += data
++            if not any_data or len(ret) >= max_length:
++                return bytes(ret)
++            data = b""
++
++    @property
++    def has_unconsumed_tail(self) -> bool:
++        return any(d.has_unconsumed_tail for d in self._decoders)
+ 
+ 
+ def _get_decoder(mode: str) -> ContentDecoder:
+@@ -246,9 +393,6 @@ class BytesQueueBuffer:
+ 
+      * self.buffer, which contains the full data
+      * the largest chunk that we will copy in get()
+-
+-    The worst case scenario is a single chunk, in which case we'll make a full copy of
+-    the data inside get().
+     """
+ 
+     def __init__(self) -> None:
+@@ -270,6 +414,10 @@ class BytesQueueBuffer:
+         elif n < 0:
+             raise ValueError("n should be > 0")
+ 
++        if len(self.buffer[0]) == n and isinstance(self.buffer[0], bytes):
++            self._size -= n
++            return self.buffer.popleft()
++
+         fetched = 0
+         ret = io.BytesIO()
+         while fetched < n:
+@@ -473,7 +621,11 @@ class BaseHTTPResponse(io.IOBase):
+                     self._decoder = _get_decoder(content_encoding)
+ 
+     def _decode(
+-        self, data: bytes, decode_content: bool | None, flush_decoder: bool
++        self,
++        data: bytes,
++        decode_content: bool | None,
++        flush_decoder: bool,
++        max_length: int | None = None,
+     ) -> bytes:
+         """
+         Decode the data passed in and potentially flush the decoder.
+@@ -486,9 +638,12 @@ class BaseHTTPResponse(io.IOBase):
+                 )
+             return data
+ 
++        if max_length is None or flush_decoder:
++            max_length = -1
++
+         try:
+             if self._decoder:
+-                data = self._decoder.decompress(data)
++                data = self._decoder.decompress(data, max_length=max_length)
+                 self._has_decoded_content = True
+         except self.DECODER_ERROR_CLASSES as e:
+             content_encoding = self.headers.get("content-encoding", "").lower()
+@@ -953,6 +1108,14 @@ class HTTPResponse(BaseHTTPResponse):
+         elif amt is not None:
+             cache_content = False
+ 
++            if self._decoder and self._decoder.has_unconsumed_tail:
++                decoded_data = self._decode(
++                    b"",
++                    decode_content,
++                    flush_decoder=False,
++                    max_length=amt - len(self._decoded_buffer),
++                )
++                self._decoded_buffer.put(decoded_data)
+             if len(self._decoded_buffer) >= amt:
+                 return self._decoded_buffer.get(amt)
+ 
+@@ -960,7 +1123,11 @@ class HTTPResponse(BaseHTTPResponse):
+ 
+         flush_decoder = amt is None or (amt != 0 and not data)
+ 
+-        if not data and len(self._decoded_buffer) == 0:
++        if (
++            not data
++            and len(self._decoded_buffer) == 0
++            and not (self._decoder and self._decoder.has_unconsumed_tail)
++        ):
+             return data
+ 
+         if amt is None:
+@@ -977,7 +1144,12 @@ class HTTPResponse(BaseHTTPResponse):
+                     )
+                 return data
+ 
+-            decoded_data = self._decode(data, decode_content, flush_decoder)
++            decoded_data = self._decode(
++                data,
++                decode_content,
++                flush_decoder,
++                max_length=amt - len(self._decoded_buffer),
++            )
+             self._decoded_buffer.put(decoded_data)
+ 
+             while len(self._decoded_buffer) < amt and data:
+@@ -985,7 +1157,12 @@ class HTTPResponse(BaseHTTPResponse):
+                 # For example, the GZ file header takes 10 bytes, we don't want to read
+                 # it one byte at a time
+                 data = self._raw_read(amt)
+-                decoded_data = self._decode(data, decode_content, flush_decoder)
++                decoded_data = self._decode(
++                    data,
++                    decode_content,
++                    flush_decoder,
++                    max_length=amt - len(self._decoded_buffer),
++                )
+                 self._decoded_buffer.put(decoded_data)
+             data = self._decoded_buffer.get(amt)
+ 
+@@ -1020,6 +1197,20 @@ class HTTPResponse(BaseHTTPResponse):
+                     "Calling read1(decode_content=False) is not supported after "
+                     "read1(decode_content=True) was called."
+                 )
++            if (
++                self._decoder
++                and self._decoder.has_unconsumed_tail
++                and (amt is None or len(self._decoded_buffer) < amt)
++            ):
++                decoded_data = self._decode(
++                    b"",
++                    decode_content,
++                    flush_decoder=False,
++                    max_length=(
++                        amt - len(self._decoded_buffer) if amt is not None else None
++                    ),
++                )
++                self._decoded_buffer.put(decoded_data)
+             if len(self._decoded_buffer) > 0:
+                 if amt is None:
+                     return self._decoded_buffer.get_all()
+@@ -1035,7 +1226,9 @@ class HTTPResponse(BaseHTTPResponse):
+         self._init_decoder()
+         while True:
+             flush_decoder = not data
+-            decoded_data = self._decode(data, decode_content, flush_decoder)
++            decoded_data = self._decode(
++                data, decode_content, flush_decoder, max_length=amt
++            )
+             self._decoded_buffer.put(decoded_data)
+             if decoded_data or flush_decoder:
+                 break
+@@ -1066,7 +1259,11 @@ class HTTPResponse(BaseHTTPResponse):
+         if self.chunked and self.supports_chunked_reads():
+             yield from self.read_chunked(amt, decode_content=decode_content)
+         else:
+-            while not is_fp_closed(self._fp) or len(self._decoded_buffer) > 0:
++            while (
++                not is_fp_closed(self._fp)
++                or len(self._decoded_buffer) > 0
++                or (self._decoder and self._decoder.has_unconsumed_tail)
++            ):
+                 data = self.read(amt=amt, decode_content=decode_content)
+ 
+                 if data:
+@@ -1218,7 +1415,10 @@ class HTTPResponse(BaseHTTPResponse):
+                     break
+                 chunk = self._handle_chunk(amt)
+                 decoded = self._decode(
+-                    chunk, decode_content=decode_content, flush_decoder=False
++                    chunk,
++                    decode_content=decode_content,
++                    flush_decoder=False,
++                    max_length=amt,
+                 )
+                 if decoded:
+                     yield decoded
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
index bdb1c7ca8d..620927322a 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -9,6 +9,8 @@ inherit pypi python_hatchling
 
 SRC_URI += " \
     file://CVE-2025-50181.patch \
+    file://CVE-2025-66418.patch \
+    file://CVE-2025-66471.patch \
 "
 
 RDEPENDS:${PN} += "\
-- 
2.43.0


