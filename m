Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AC1D59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 08:59:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44201.1765789158808938676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 00:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UFoIj2ya;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4444ab7235=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF78m1s2118555
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 08:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Viv6RTFE4hdm2ZkvD94n
	6jFcKblgXHGAArTDQcOMWhk=; b=UFoIj2yaUImTCnyhX6q6fXZBAZKWIZhDiMOg
	NbsveKljwDSgJQzQ7OVNwBAxf4EMsn62e0bT4DQmD/cMO9vNJi3bWi2gvskxCajj
	ubdsADrASceV904s2A4Ybn5mPeDlQTrej0CDfw91eCVhk5JF0dNrttQYdgdrZRNA
	JgxYbfVu8AGcj/Up/sUdW0o6kLLcpl5YXTmaU1WgD3lhiPbnSg36T1K8moZSOH16
	DY/VDt464tAs31mAzp7y1/wjUZoYbOwxhmwgaHmj3UCatf1EpTbIDNLQEz8nSNdp
	s3TX6WzSPnuOR4IW8Y1tXFcU3xsvq2BrCPXE48HP+yFgUlA/yA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y489krt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 08:59:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 15 Dec 2025 00:59:16 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 15 Dec 2025 00:59:15 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] python3-urllib3: fix CVE-2025-66418 CVE-2025-66471
Date: Mon, 15 Dec 2025 16:59:14 +0800
Message-ID: <20251215085914.1904593-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3NSBTYWx0ZWRfX0nhftBXdTEAG
 D8I0EMDwAGADXPahENELaoVsXjH+yRkahGWtZVX3j86ldPLLJEs/2gSVdYylCi16YfO9o7CmkMo
 SUuthdUcycafwO5ylC+PedQM5+HS6hv9Vgy8NvT7nFNhBeoYdESgcduwC9iuDZCf/kym1q6SPSf
 YmAlWnAx5de6P9sqTDxJfaNDGOpcC2ZKM50GyOaWRPEHcyuxoPjyQtJtQnB5V+CbFEWHH6wMiZt
 rW0NmFikTIO14N3zUW2h2cZrlJf7Ge/chasyM8qmuK/ly2yA9OwQrYm3ZLSCNa6o9ZZvaATp3ME
 PiG7a9pf1ZuC+WlFQugFywsVFqyfnFqJuE3OaJX1gWoomt6rqbQXGEsfdkzIIe3NLcgGu7bnmKy
 u9VnFcXgqLG2eFmSkbFbv9EN1QLAYg==
X-Proofpoint-GUID: Er4WPAnOq7AyBrJ24jWikxfZpASSYNpf
X-Proofpoint-ORIG-GUID: Er4WPAnOq7AyBrJ24jWikxfZpASSYNpf
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=693fcde5 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=XMRqTxP2aceiMuGKqTEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 08:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227702

From: Jiaying Song <jiaying.song.cn@windriver.com>

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2025-66471
https://nvd.nist.gov/vuln/detail/CVE-2025-66418

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python3-urllib3/CVE-2025-66418.patch      |  68 ++
 .../python3-urllib3/CVE-2025-66471.patch      | 914 ++++++++++++++++++
 .../python/python3-urllib3_2.3.0.bb           |   2 +
 3 files changed, 984 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
new file mode 100644
index 0000000000..cd0e7c60c6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
@@ -0,0 +1,68 @@
+From 0970fbb64f8eaf3cd8ea37f91f7134c21ef62e61 Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Mon, 15 Dec 2025 11:01:41 +0800
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
+ src/urllib3/response.py | 12 +++++++++++-
+ test/test_response.py   | 10 ++++++++++
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index 66c6a687..575e7ce7 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -195,8 +195,18 @@ class MultiDecoder(ContentDecoder):
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
+index 3eec0aba..53606e10 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -590,6 +590,16 @@ class TestResponse:
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
index 0000000000..df6d3f6dbb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
@@ -0,0 +1,914 @@
+From d3088ae998dcdc0bf7c6ce33200fd5f360137597 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2024-47081
+
+Upstream-Status: Backport
+[https://github.com/urllib3/urllib3/commit/c19571de34c47de3a766541b041637ba5f716ed7]
+
+---
+ docs/advanced-usage.rst |   3 +-
+ docs/user-guide.rst     |   4 +-
+ pyproject.toml          |   5 +-
+ src/urllib3/response.py | 278 +++++++++++++++++++++++++++++++++------
+ test/test_response.py   | 279 +++++++++++++++++++++++++++++++++++++++-
+ 5 files changed, 518 insertions(+), 51 deletions(-)
+
+diff --git a/docs/advanced-usage.rst b/docs/advanced-usage.rst
+index f6ab70bd..9295577b 100644
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
+index b40f6cff..8d1f98a9 100644
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
+@@ -104,6 +104,7 @@ filterwarnings = [
+     '''default:ssl\.PROTOCOL_TLSv1_1 is deprecated:DeprecationWarning''',
+     '''default:ssl\.PROTOCOL_TLSv1_2 is deprecated:DeprecationWarning''',
+     '''default:ssl NPN is deprecated, use ALPN instead:DeprecationWarning''',
++    '''default:Brotli >= 1.2.0 is required to prevent decompression bombs\.:urllib3.exceptions.DependencyWarning''',
+     # https://github.com/SeleniumHQ/selenium/issues/13328
+     '''default:unclosed file <_io\.BufferedWriter name='/dev/null'>:ResourceWarning''',
+     # https://github.com/SeleniumHQ/selenium/issues/14686
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index 575e7ce7..a79304ce 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -50,6 +50,7 @@ from .connection import BaseSSLError, HTTPConnection, HTTPException
+ from .exceptions import (
+     BodyNotHttplibCompatible,
+     DecodeError,
++    DependencyWarning,
+     HTTPError,
+     IncompleteRead,
+     InvalidChunkLength,
+@@ -69,7 +70,11 @@ log = logging.getLogger(__name__)
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
+@@ -79,30 +84,57 @@ class ContentDecoder:
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
+@@ -118,27 +150,61 @@ class GzipDecoder(ContentDecoder):
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
+@@ -153,9 +219,35 @@ if brotli is not None:
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
+@@ -169,16 +261,46 @@ if HAS_ZSTD:
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
+@@ -211,10 +333,35 @@ class MultiDecoder(ContentDecoder):
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
+@@ -247,9 +394,6 @@ class BytesQueueBuffer:
+ 
+      * self.buffer, which contains the full data
+      * the largest chunk that we will copy in get()
+-
+-    The worst case scenario is a single chunk, in which case we'll make a full copy of
+-    the data inside get().
+     """
+ 
+     def __init__(self) -> None:
+@@ -271,6 +415,10 @@ class BytesQueueBuffer:
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
+@@ -477,7 +625,11 @@ class BaseHTTPResponse(io.IOBase):
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
+@@ -490,9 +642,12 @@ class BaseHTTPResponse(io.IOBase):
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
+@@ -959,6 +1114,14 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -966,7 +1129,11 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -983,7 +1150,12 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -991,7 +1163,12 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1026,6 +1203,20 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1041,7 +1232,9 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1072,7 +1265,11 @@ class HTTPResponse(BaseHTTPResponse):
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
+@@ -1231,7 +1428,10 @@ class HTTPResponse(BaseHTTPResponse):
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
+index 53606e10..ae701950 100644
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
+@@ -35,6 +36,33 @@ from urllib3.util.response import is_fp_closed
+ from urllib3.util.retry import RequestHistory, Retry
+ 
+ 
++def zstd_compress(data: bytes) -> bytes:
++    if sys.version_info >= (3, 14):
++        from compression import zstd
++    else:
++        from backports import zstd
++    return zstd.compress(data)
++
++
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
+ class TestBytesQueueBuffer:
+     def test_single_chunk(self) -> None:
+         buffer = BytesQueueBuffer()
+@@ -110,12 +138,19 @@ class TestBytesQueueBuffer:
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
+@@ -420,9 +455,27 @@ class TestResponse:
+         assert r.data == b"foo"
+ 
+     @onlyZstd()
+-    def test_decode_multiframe_zstd(self) -> None:
+-        import zstandard as zstd
+-
++    
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
+             zstd.compress(b"foo")
+@@ -437,8 +490,57 @@ class TestResponse:
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
+@@ -541,6 +643,169 @@ class TestResponse:
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
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
index c5e3751255..e1eacf9efd 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
@@ -10,6 +10,8 @@ inherit pypi python_hatchling
 SRC_URI += " \
     file://CVE-2025-50181.patch \
     file://CVE-2025-50182.patch \
+    file://CVE-2025-66418.patch \
+    file://CVE-2025-66471.patch \
 "
 
 DEPENDS += " \
-- 
2.34.1


