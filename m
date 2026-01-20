Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078C9D2ECE9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:52:57 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6773.1768917169126081871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DjN+Yf00;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202601201352461adbb9b22f000207e0-6c8hhj@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202601201352461adbb9b22f000207e0
        for <openembedded-core@lists.openembedded.org>;
        Tue, 20 Jan 2026 14:52:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5WDdrhr4rkPhxIFDRN2Qj9/nOm6ndbuytNlwqWfsWV8=;
 b=DjN+Yf00Jk1pJGf3az9c9bpeLHxqH9J/+WXwKbypIfQ/Ex6ppQWaXINY2rznkFrTgw68NG
 UVVv8JXCEFCe+6JHq7uUXM9cTZgicG4FShkTnmS6Hl5iIiJnlqDanaylCTAEX81J7r7wG0Uc
 Bjfryh4t4jUmawpYDcHTdHCClUlk31s0UzzoxmqNBar4rcpYpdmR13eUVQTsXL50DMfxPmrk
 MdxAgJaDMD2eW2En4ALtiOHRcDXBrYH6CU9n8xWwhkxSlo6EGQgN3J1KfK8afCotj95VtxvU
 ZeJgrXnzg7j2xK3J1BskPSqfQn/oiqZprIqap1tiXxCEWfIVX8isX+Rw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH v2] python3-urllib3: patch CVE-2025-66418
Date: Tue, 20 Jan 2026 14:52:43 +0100
Message-Id: <20260120135243.2125879-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229735

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-66418

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-urllib3/CVE-2025-66418.patch      | 74 +++++++++++++++++++
 .../python/python3-urllib3_1.26.20.bb         |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
new file mode 100644
index 00000000000..b490019d877
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
+@@ -135,8 +135,18 @@ class MultiDecoder(object):
+         they were applied.
+     """
+ 
++    # Maximum allowed number of chained HTTP encodings in the
++    # Content-Encoding header.
++    max_decode_links = 5
++
+     def __init__(self, modes):
+-        self._decoders = [_get_decoder(m.strip()) for m in modes.split(",")]
++        encodings = [m.strip() for m in modes.split(",")]
++        if len(encodings) > self.max_decode_links:
++            raise DecodeError(
++                "Too many content encodings in the chain: "
++                f"{len(encodings)} > {self.max_decode_links}"
++            )
++        self._decoders = [_get_decoder(e) for e in encodings]
+ 
+     def flush(self):
+         return self._decoders[0].flush()
+diff --git a/test/test_response.py b/test/test_response.py
+index 9592fdd9..d824ae70 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -295,6 +295,16 @@ class TestResponse(object):
+ 
+         assert r.data == b"foo"
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
+     def test_body_blob(self):
+         resp = HTTPResponse(b"foo")
+         assert resp.data == b"foo"
diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
index 58988e42055..1f1132d5b5d 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.20.bb
@@ -9,6 +9,7 @@ inherit pypi setuptools3
 
 SRC_URI += " \
     file://CVE-2025-50181.patch \
+    file://CVE-2025-66418.patch \
 "
 
 RDEPENDS:${PN} += "\

