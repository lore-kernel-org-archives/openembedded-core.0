Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C3EFA373C
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 12:11:28 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4017.1767355879575779588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 04:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XeV7IQo3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260102121117e1afe5c98000020727-uos3mv@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260102121117e1afe5c98000020727
        for <openembedded-core@lists.openembedded.org>;
        Fri, 02 Jan 2026 13:11:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6LAwawHyEfUaFztaVFVKhb6cWIXiDJfucWeGQke472M=;
 b=XeV7IQo3/W3yeLSE6+qoOXOlevsMne6+PEEIeEuxfIQ2sb39GId0QUcOvDYcOGSnW+J0/6
 gHT0i8hNH8mCz6N6gcsa/QZIXcWt5oO6ux4xANadQjeN4sC5uAj//gCm0/eF4GK3M6VPXHlq
 XBANGi9tyKuWlqhx5GzH2jPl6hxZk6ak6n1gLKAulPfNRDig9PVehTSL5PoaFi6O5oFN72pU
 8FaE5qPbMdzBHhLwxt24VPtmipBjkyRK/zgf9uYoU4Xvm688aXt47AT2Zn8LOTzMxkWie2Vx
 4/ZobE01IlJH5Kj06wlcaUFf+B2zE2HJ/EyvHQYE4TJUo0YqQC9aXexw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 3/4] python3-urllib3: patch CVE-2025-66418
Date: Fri,  2 Jan 2026 13:10:58 +0100
Message-Id: <20260102121059.2321111-3-peter.marko@siemens.com>
In-Reply-To: <20260102121059.2321111-1-peter.marko@siemens.com>
References: <20260102121059.2321111-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 12:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228839

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-66418

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-urllib3/CVE-2025-66418.patch      | 74 +++++++++++++++++++
 .../python/python3-urllib3_2.5.0.bb           |  4 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
new file mode 100644
index 0000000000..71fc44e4f9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
@@ -0,0 +1,74 @@
+From 24d7b67eac89f94e11003424bcf0d8f7b72222a8 Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Fri, 5 Dec 2025 16:41:33 +0200
+Subject: [PATCH] Merge commit from fork
+
+* Add a hard-coded limit for the decompression chain
+
+* Reuse new list
+
+CVE: CVE-2025-66418
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/24d7b67eac89f94e11003424bcf0d8f7b72222a8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
+index 4ba42136..069f726c 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -220,8 +220,18 @@ class MultiDecoder(ContentDecoder):
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
+index 9592fdd9..d824ae70 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -584,6 +584,16 @@ class TestResponse:
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
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
index 62fdf8e345..c39e9676e8 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
@@ -7,6 +7,10 @@ SRC_URI[sha256sum] = "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbf
 
 inherit pypi python_hatchling
 
+SRC_URI += "\
+    file://CVE-2025-66418.patch \
+"
+
 DEPENDS += "python3-hatch-vcs-native"
 
 PACKAGECONFIG ??= ""

