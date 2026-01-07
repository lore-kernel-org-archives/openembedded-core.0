Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF0CCF6C0A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1455.1767773366839479881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n6fpZSE8;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so11614625e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773365; x=1768378165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHafy9j+mZ0MzYgcmymxBohQ4/HzrCMk0FMd5B0Q9qI=;
        b=n6fpZSE8oSNEWb0lylh6bSfRP9BrEWe9T+MaJNUXAmEi9iKrUt8sGi/P1PmaiICJHM
         EE2hMHrm7f45Dvcdll0MQL7rXld7PFdKWukyqlvDaVyK1JJJmHw4hzzyNImPByhnA1+R
         DVVfPTSn+I7RMoqtfGqSUSWF0UPLR3kPGAkAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773365; x=1768378165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZHafy9j+mZ0MzYgcmymxBohQ4/HzrCMk0FMd5B0Q9qI=;
        b=neiI/TcyS3EP2tv5H0/e0XyvVmqYP5YIsDWGOu4T7Ul+8J0+G1q8mAMlV36Uoh5iyh
         jMMIfrsXDlNshKrt9j7+WRdNzn34kkh+XMQmlH4WBKbV3A+YBTxQXtNOq+i5GwqH2yyc
         MsuFnNyVnGrRqOjeZD5MAuIQb9+yB3xujQjacWyQsh3W6QJdIm6PMj06xaPP4tJAftaz
         3jAC0f15Mm5truth/+chOEMmOTo4zVii6DhBQEC0HKNqXh72YTyKuUGNhH/+c9R1XCK0
         1s4mAw2IX5y09IhmMqLOiwz9fYTaIdadL2nhoXQHRBHI2i4ug+rXggMHENN+vdE47cqY
         bfAQ==
X-Gm-Message-State: AOJu0YwYcYn9nQtjc3QhiOPo/bjadyg0vEv75FmIH1nBekwKzr2jrO//
	QNZYVsGSoisbqfuoGY+dzZiXVDvObiZjLCfplj2MD+YLiKo9p3RGlSFT8Qx8/UF52NH0tU7n3wm
	N3A/z
X-Gm-Gg: AY/fxX4Df4apLMeA1EwLwqleM1ACY9sLTrRs+nvOtGfrlT+6UjCLI13zPAdbOmWXqTj
	Pp0i/CEehYGSKRvstCE8ITVM9BSwjOtj0gVlj/08y4zcF8SNuQ3AozyRAOHlxR0x8qeztoYHopl
	lXRcL0DofIq0denx5jp7gZu7a9+Kw/C/vVR8okvjfTgyy6h+XT1ncCA7ml2anHrdBNnr7lU0NFh
	3iG/COKmBns7L8bvLwWsNPW+uWTrJ0Q9Hdv/AJY7v6fGiqkzMgyjzP/sFSOVa1TeEQy6jneJyek
	b3Cj7KGFGGIpA08DTqnrp6W1ugX8FL+F5r9pnSwp8CoHM7DTvD9YduIAluMZZRlOurDvbE6KmYo
	+r6SHn04oEBfmvPO2BJ64d8i2P6RLgHsUQ0rMG5IObv0gwo3rQ6MqF0kINDqrGfdD5U6WaMQ8sz
	xHoOusRU4ZiD3IVGeNXNmRpQvsOfWSiALHoXJUwZ0vfKxkp6+SXBpGu/iGbY1b36vqX/fCZmLo9
	EveEhLppitjAb4=
X-Google-Smtp-Source: AGHT+IHIytnieGtFUowEgcK8L6pJWix+Ta1xHi9g9bZORHmhh4Vp0RDxFpn1KM4/7dH9+zwoS86FuQ==
X-Received: by 2002:a05:600c:1d14:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-47d849c7aa8mr15875345e9.0.1767773364432;
        Wed, 07 Jan 2026 00:09:24 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:23 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 04/11] python3-urllib3: patch CVE-2025-66471
Date: Wed,  7 Jan 2026 09:08:53 +0100
Message-ID: <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228952

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-66471

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-urllib3/CVE-2025-66471.patch      | 930 ++++++++++++++++++
 .../python/python3-urllib3_2.5.0.bb           |   1 +
 2 files changed, 931 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
new file mode 100644
index 0000000000..2f8bc4fc92
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
@@ -0,0 +1,930 @@
+From c19571de34c47de3a766541b041637ba5f716ed7 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/c19571de34c47de3a766541b041637ba5f716ed7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ CHANGES.rst             |  22 ++++
+ docs/advanced-usage.rst |   3 +-
+ docs/user-guide.rst     |   4 +-
+ pyproject.toml          |   5 +-
+ src/urllib3/response.py | 278 ++++++++++++++++++++++++++++++++++------
+ test/test_response.py   | 269 +++++++++++++++++++++++++++++++++++++-
+ 6 files changed, 532 insertions(+), 49 deletions(-)
+
+diff --git a/CHANGES.rst b/CHANGES.rst
+index add194eb..345476f3 100644
+--- a/CHANGES.rst
++++ b/CHANGES.rst
+@@ -1,3 +1,25 @@
++2.6.0 (TBD)
++==================
++
++Bugfixes
++--------
++
++- Fixed a security issue where streaming API could improperly handle highly
++  compressed HTTP content ("decompression bombs") leading to excessive resource
++  consumption even when a small amount of data was requested. Reading small
++  chunks of compressed data is safer and much more efficient now.
++
++.. caution::
++  - If urllib3 is not installed with the optional `urllib3[brotli]` extra, but
++    your environment contains a Brotli/brotlicffi/brotlipy package anyway, make
++    sure to upgrade it to at least Brotli 1.2.0 or brotlicffi 1.2.0.0 to
++    benefit from the security fixes and avoid warnings. Prefer using
++    `urllib3[brotli]` to install a compatible Brotli package automatically.
++
++  - If you use custom decompressors, please make sure to update them to
++    respect the changed API of ``urllib3.response.ContentDecoder``.
++
++
+ 2.5.0 (2025-06-18)
+ ==================
+ 
+diff --git a/docs/advanced-usage.rst b/docs/advanced-usage.rst
+index ff773662..3ab4fcf3 100644
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
+index c9aa6d13..45538a6e 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -41,8 +41,8 @@ dynamic = ["version"]
+ 
+ [project.optional-dependencies]
+ brotli = [
+-  "brotli>=1.0.9; platform_python_implementation == 'CPython'",
+-  "brotlicffi>=0.8.0; platform_python_implementation != 'CPython'"
++  "brotli>=1.2.0; platform_python_implementation == 'CPython'",
++  "brotlicffi>=1.2.0.0; platform_python_implementation != 'CPython'"
+ ]
+ # Once we drop support for Python 3.13 this extra can be removed.
+ # We'll need a deprecation period for the 'zstandard' module support
+@@ -160,6 +160,7 @@ filterwarnings = [
+     '''default:ssl\.PROTOCOL_TLSv1_1 is deprecated:DeprecationWarning''',
+     '''default:ssl\.PROTOCOL_TLSv1_2 is deprecated:DeprecationWarning''',
+     '''default:ssl NPN is deprecated, use ALPN instead:DeprecationWarning''',
++    '''default:Brotli >= 1.2.0 is required to prevent decompression bombs\.:urllib3.exceptions.DependencyWarning''',
+     # https://github.com/SeleniumHQ/selenium/issues/13328
+     '''default:unclosed file <_io\.BufferedWriter name='/dev/null'>:ResourceWarning''',
+     # https://github.com/SeleniumHQ/selenium/issues/14686
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index 3df98184..4ba42136 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -33,6 +33,7 @@ from .connection import BaseSSLError, HTTPConnection, HTTPException
+ from .exceptions import (
+     BodyNotHttplibCompatible,
+     DecodeError,
++    DependencyWarning,
+     HTTPError,
+     IncompleteRead,
+     InvalidChunkLength,
+@@ -52,7 +53,11 @@ log = logging.getLogger(__name__)
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
+@@ -62,30 +67,57 @@ class ContentDecoder:
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
+@@ -101,27 +133,61 @@ class GzipDecoder(ContentDecoder):
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
+@@ -136,9 +202,35 @@ if brotli is not None:
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
+@@ -156,16 +248,46 @@ try:
+         def __init__(self) -> None:
+             self._obj = zstd.ZstdDecompressor()
+ 
+-        def decompress(self, data: bytes) -> bytes:
+-            if not data:
++        def decompress(self, data: bytes, max_length: int = -1) -> bytes:
++            if not data and not self.has_unconsumed_tail:
+                 return b""
+-            data_parts = [self._obj.decompress(data)]
+-            while self._obj.eof and self._obj.unused_data:
+-                unused_data = self._obj.unused_data
++            if self._obj.eof:
++                data = self._obj.unused_data + data
+                 self._obj = zstd.ZstdDecompressor()
+-                data_parts.append(self._obj.decompress(unused_data))
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
++                unused_data = self._obj.unused_data
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
+             if not self._obj.eof:
+                 raise DecodeError("Zstandard data is incomplete")
+@@ -236,10 +358,35 @@ class MultiDecoder(ContentDecoder):
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
+@@ -272,9 +419,6 @@ class BytesQueueBuffer:
+ 
+      * self.buffer, which contains the full data
+      * the largest chunk that we will copy in get()
+-
+-    The worst case scenario is a single chunk, in which case we'll make a full copy of
+-    the data inside get().
+     """
+ 
+     def __init__(self) -> None:
+@@ -296,6 +440,10 @@ class BytesQueueBuffer:
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
+@@ -502,7 +650,11 @@ class BaseHTTPResponse(io.IOBase):
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
+@@ -515,9 +667,12 @@ class BaseHTTPResponse(io.IOBase):
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
+@@ -984,6 +1139,14 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -991,7 +1154,11 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1008,7 +1175,12 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1016,7 +1188,12 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1051,6 +1228,20 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1066,7 +1257,9 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1097,7 +1290,11 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1260,7 +1457,10 @@ class HTTPResponse(BaseHTTPResponse):
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
+diff --git a/test/test_response.py b/test/test_response.py
+index c97fdff0..9592fdd9 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -1,6 +1,7 @@
+ from __future__ import annotations
+ 
+ import contextlib
++import gzip
+ import http.client as httplib
+ import socket
+ import ssl
+@@ -43,6 +44,26 @@ def zstd_compress(data: bytes) -> bytes:
+     return zstd.compress(data)  # type: ignore[no-any-return]
+ 
+ 
++def deflate2_compress(data: bytes) -> bytes:
++    compressor = zlib.compressobj(6, zlib.DEFLATED, -zlib.MAX_WBITS)
++    return compressor.compress(data) + compressor.flush()
++
++
++if brotli:
++    try:
++        brotli.Decompressor().process(b"", output_buffer_limit=1024)
++        _brotli_gte_1_2_0_available = True
++    except (AttributeError, TypeError):
++        _brotli_gte_1_2_0_available = False
++else:
++    _brotli_gte_1_2_0_available = False
++try:
++    zstd_compress(b"")
++    _zstd_available = True
++except ModuleNotFoundError:
++    _zstd_available = False
++
++
+ class TestBytesQueueBuffer:
+     def test_single_chunk(self) -> None:
+         buffer = BytesQueueBuffer()
+@@ -118,12 +139,19 @@ class TestBytesQueueBuffer:
+ 
+         assert len(get_func(buffer)) == 10 * 2**20
+ 
++    @pytest.mark.parametrize(
++        "get_func",
++        (lambda b: b.get(len(b)), lambda b: b.get_all()),
++        ids=("get", "get_all"),
++    )
+     @pytest.mark.limit_memory("10.01 MB", current_thread_only=True)
+-    def test_get_all_memory_usage_single_chunk(self) -> None:
++    def test_memory_usage_single_chunk(
++        self, get_func: typing.Callable[[BytesQueueBuffer], bytes]
++    ) -> None:
+         buffer = BytesQueueBuffer()
+         chunk = bytes(10 * 2**20)  # 10 MiB
+         buffer.put(chunk)
+-        assert buffer.get_all() is chunk
++        assert get_func(buffer) is chunk
+ 
+ 
+ # A known random (i.e, not-too-compressible) payload generated with:
+@@ -426,7 +454,26 @@ class TestResponse:
+         assert r.data == b"foo"
+ 
+     @onlyZstd()
+-    def test_decode_multiframe_zstd(self) -> None:
++    @pytest.mark.parametrize(
++        "read_amt",
++        (
++            # Read all data at once.
++            None,
++            # Read one byte at a time, data of frames will be returned
++            # separately.
++            1,
++            # Read two bytes at a time, the second read should return
++            # data from both frames.
++            2,
++            # Read three bytes at a time, the whole frames will be
++            # returned separately in two calls.
++            3,
++            # Read four bytes at a time, the first read should return
++            # data from the first frame and a part of the second frame.
++            4,
++        ),
++    )
++    def test_decode_multiframe_zstd(self, read_amt: int | None) -> None:
+         data = (
+             # Zstandard frame
+             zstd_compress(b"foo")
+@@ -441,8 +488,57 @@ class TestResponse:
+         )
+ 
+         fp = BytesIO(data)
+-        r = HTTPResponse(fp, headers={"content-encoding": "zstd"})
+-        assert r.data == b"foobar"
++        result = bytearray()
++        r = HTTPResponse(
++            fp, headers={"content-encoding": "zstd"}, preload_content=False
++        )
++        total_length = 6
++        while len(result) < total_length:
++            chunk = r.read(read_amt, decode_content=True)
++            if read_amt is None:
++                assert len(chunk) == total_length
++            else:
++                assert len(chunk) == min(read_amt, total_length - len(result))
++            result += chunk
++        assert bytes(result) == b"foobar"
++
++    @onlyZstd()
++    def test_decode_multiframe_zstd_with_max_length_close_to_compressed_data_size(
++        self,
++    ) -> None:
++        """
++        Test decoding when the first read from the socket returns all
++        the compressed frames, but then it has to be decompressed in a
++        couple of read calls.
++        """
++        data = (
++            # Zstandard frame
++            zstd_compress(b"x" * 1024)
++            # skippable frame (must be ignored)
++            + bytes.fromhex(
++                "50 2A 4D 18"  # Magic_Number (little-endian)
++                "07 00 00 00"  # Frame_Size (little-endian)
++                "00 00 00 00 00 00 00"  # User_Data
++            )
++            # Zstandard frame
++            + zstd_compress(b"y" * 1024)
++        )
++
++        fp = BytesIO(data)
++        r = HTTPResponse(
++            fp, headers={"content-encoding": "zstd"}, preload_content=False
++        )
++        # Read the whole first frame.
++        assert r.read(1024) == b"x" * 1024
++        assert len(r._decoded_buffer) == 0
++        # Read the whole second frame in two reads.
++        assert r.read(512) == b"y" * 512
++        assert len(r._decoded_buffer) == 0
++        assert r.read(512) == b"y" * 512
++        assert len(r._decoded_buffer) == 0
++        # Ensure no more data is left.
++        assert r.read() == b""
++        assert len(r._decoded_buffer) == 0
+ 
+     @onlyZstd()
+     def test_chunked_decoding_zstd(self) -> None:
+@@ -535,6 +631,169 @@ class TestResponse:
+             decoded_data += part
+         assert decoded_data == data
+ 
++    _test_compressor_params: list[
++        tuple[str, tuple[str, typing.Callable[[bytes], bytes]] | None]
++    ] = [
++        ("deflate1", ("deflate", zlib.compress)),
++        ("deflate2", ("deflate", deflate2_compress)),
++        ("gzip", ("gzip", gzip.compress)),
++    ]
++    if _brotli_gte_1_2_0_available:
++        _test_compressor_params.append(("brotli", ("br", brotli.compress)))
++    else:
++        _test_compressor_params.append(("brotli", None))
++    if _zstd_available:
++        _test_compressor_params.append(("zstd", ("zstd", zstd_compress)))
++    else:
++        _test_compressor_params.append(("zstd", None))
++
++    @pytest.mark.parametrize("read_method", ("read", "read1"))
++    @pytest.mark.parametrize(
++        "data",
++        [d[1] for d in _test_compressor_params],
++        ids=[d[0] for d in _test_compressor_params],
++    )
++    def test_read_with_all_data_already_in_decompressor(
++        self,
++        request: pytest.FixtureRequest,
++        read_method: str,
++        data: tuple[str, typing.Callable[[bytes], bytes]] | None,
++    ) -> None:
++        if data is None:
++            pytest.skip(f"Proper {request.node.callspec.id} decoder is not available")
++        original_data = b"bar" * 1000
++        name, compress_func = data
++        compressed_data = compress_func(original_data)
++        fp = mock.Mock(read=mock.Mock(return_value=b""))
++        r = HTTPResponse(fp, headers={"content-encoding": name}, preload_content=False)
++        # Put all data in the decompressor's buffer.
++        r._init_decoder()
++        assert r._decoder is not None  # for mypy
++        decoded = r._decoder.decompress(compressed_data, max_length=0)
++        if name == "br":
++            # It's known that some Brotli libraries do not respect
++            # `max_length`.
++            r._decoded_buffer.put(decoded)
++        else:
++            assert decoded == b""
++        # Read the data via `HTTPResponse`.
++        read = getattr(r, read_method)
++        assert read(0) == b""
++        assert read(2500) == original_data[:2500]
++        assert read(500) == original_data[2500:]
++        assert read(0) == b""
++        assert read() == b""
++
++    @pytest.mark.parametrize(
++        "delta",
++        (
++            0,  # First read from socket returns all compressed data.
++            -1,  # First read from socket returns all but one byte of compressed data.
++        ),
++    )
++    @pytest.mark.parametrize("read_method", ("read", "read1"))
++    @pytest.mark.parametrize(
++        "data",
++        [d[1] for d in _test_compressor_params],
++        ids=[d[0] for d in _test_compressor_params],
++    )
++    def test_decode_with_max_length_close_to_compressed_data_size(
++        self,
++        request: pytest.FixtureRequest,
++        delta: int,
++        read_method: str,
++        data: tuple[str, typing.Callable[[bytes], bytes]] | None,
++    ) -> None:
++        """
++        Test decoding when the first read from the socket returns all or
++        almost all the compressed data, but then it has to be
++        decompressed in a couple of read calls.
++        """
++        if data is None:
++            pytest.skip(f"Proper {request.node.callspec.id} decoder is not available")
++
++        original_data = b"foo" * 1000
++        name, compress_func = data
++        compressed_data = compress_func(original_data)
++        fp = BytesIO(compressed_data)
++        r = HTTPResponse(fp, headers={"content-encoding": name}, preload_content=False)
++        initial_limit = len(compressed_data) + delta
++        read = getattr(r, read_method)
++        initial_chunk = read(amt=initial_limit, decode_content=True)
++        assert len(initial_chunk) == initial_limit
++        assert (
++            len(read(amt=len(original_data), decode_content=True))
++            == len(original_data) - initial_limit
++        )
++
++    # Prepare 50 MB of compressed data outside of the test measuring
++    # memory usage.
++    _test_memory_usage_decode_with_max_length_params: list[
++        tuple[str, tuple[str, bytes] | None]
++    ] = [
++        (
++            params[0],
++            (params[1][0], params[1][1](b"A" * (50 * 2**20))) if params[1] else None,
++        )
++        for params in _test_compressor_params
++    ]
++
++    @pytest.mark.parametrize(
++        "data",
++        [d[1] for d in _test_memory_usage_decode_with_max_length_params],
++        ids=[d[0] for d in _test_memory_usage_decode_with_max_length_params],
++    )
++    @pytest.mark.parametrize("read_method", ("read", "read1", "read_chunked", "stream"))
++    # Decoders consume different amounts of memory during decompression.
++    # We set the 10 MB limit to ensure that the whole decompressed data
++    # is not stored unnecessarily.
++    #
++    # FYI, the following consumption was observed for the test with
++    # `read` on CPython 3.14.0:
++    #   - deflate: 2.3 MiB
++    #   - deflate2: 2.1 MiB
++    #   - gzip: 2.1 MiB
++    #   - brotli:
++    #     - brotli v1.2.0: 9 MiB
++    #     - brotlicffi v1.2.0.0: 6 MiB
++    #     - brotlipy v0.7.0: 105.8 MiB
++    #   - zstd: 4.5 MiB
++    @pytest.mark.limit_memory("10 MB", current_thread_only=True)
++    def test_memory_usage_decode_with_max_length(
++        self,
++        request: pytest.FixtureRequest,
++        read_method: str,
++        data: tuple[str, bytes] | None,
++    ) -> None:
++        if data is None:
++            pytest.skip(f"Proper {request.node.callspec.id} decoder is not available")
++
++        name, compressed_data = data
++        limit = 1024 * 1024  # 1 MiB
++        if read_method in ("read_chunked", "stream"):
++            httplib_r = httplib.HTTPResponse(MockSock)  # type: ignore[arg-type]
++            httplib_r.fp = MockChunkedEncodingResponse([compressed_data])  # type: ignore[assignment]
++            r = HTTPResponse(
++                httplib_r,
++                preload_content=False,
++                headers={"transfer-encoding": "chunked", "content-encoding": name},
++            )
++            next(getattr(r, read_method)(amt=limit, decode_content=True))
++        else:
++            fp = BytesIO(compressed_data)
++            r = HTTPResponse(
++                fp, headers={"content-encoding": name}, preload_content=False
++            )
++            getattr(r, read_method)(amt=limit, decode_content=True)
++
++        # Check that the internal decoded buffer is empty unless brotli
++        # is used.
++        # Google's brotli library does not fully respect the output
++        # buffer limit: https://github.com/google/brotli/issues/1396
++        # And unmaintained brotlipy cannot limit the output buffer size.
++        if name != "br" or brotli.__name__ == "brotlicffi":
++            assert len(r._decoded_buffer) == 0
++
+     def test_multi_decoding_deflate_deflate(self) -> None:
+         data = zlib.compress(zlib.compress(b"foo"))
+ 
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
index c39e9676e8..dcdf45439a 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
@@ -9,6 +9,7 @@ inherit pypi python_hatchling
 
 SRC_URI += "\
     file://CVE-2025-66418.patch \
+    file://CVE-2025-66471.patch \
 "
 
 DEPENDS += "python3-hatch-vcs-native"

