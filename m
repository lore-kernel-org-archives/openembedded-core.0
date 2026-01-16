Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1DBC98308
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 22:25:29 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156.1768602319062588212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 14:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WXGEJp1p;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026011622251697f72176be0002076b-zn6f5t@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026011622251697f72176be0002076b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 16 Jan 2026 23:25:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hzSBVvCob96Yl6331ki6zcZbjWfVKVoski4KTgkiHVs=;
 b=WXGEJp1p/kJ00ifEmP4jeebOcXow27Q4h1juo2Zydhqfb1Ysu5Af20mo6JpM91y/tGqNZp
 /o4GpuScWnW3ZsQWOkkbv5gx8uzGRmChV3hchvNMJaROjY2qCr/0rdVGvZsuTfN2xmL3JNGX
 OtifGgMdO0CiOVFJgZhXM60h3nltKy0NvlYgHsLjD3RpfW5D5riLytZKe8QRFATLL/ObLLWp
 72gQUEiR5Uso2ypAvKosc07LtxEmGGNnGxoK2rnHhSuD6md2L7gKXZI7/VRMet508Ngk/bjj
 bbECEpNkmwPSifNQuUojz8nu5vwx2Z7KK5FUI4SKiRFup8BeFHn1vqgg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] python3-urllib3: patch CVE-2026-21441
Date: Fri, 16 Jan 2026 23:25:14 +0100
Message-Id: <20260116222514.269653-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 22:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229569

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-urllib3/CVE-2026-21441.patch      | 111 ++++++++++++++++++
 .../python/python3-urllib3_2.5.0.bb           |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
new file mode 100644
index 0000000000..f3a6013817
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
@@ -0,0 +1,111 @@
+From 8864ac407bba8607950025e0979c4c69bc7abc7b Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Wed, 7 Jan 2026 18:07:30 +0200
+Subject: [PATCH] Merge commit from fork
+
+* Stop decoding response content during redirects needlessly
+
+* Rename the new query parameter
+
+* Add a changelog entry
+
+CVE: CVE-2026-21441
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/8864ac407bba8607950025e0979c4c69bc7abc7b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ CHANGES.rst                                  | 13 +++++++++++++
+ dummyserver/app.py                           |  8 +++++++-
+ src/urllib3/response.py                      |  6 +++++-
+ test/with_dummyserver/test_connectionpool.py | 19 +++++++++++++++++++
+ 4 files changed, 44 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGES.rst b/CHANGES.rst
+index 2de9f016..4c0b9cea 100644
+--- a/CHANGES.rst
++++ b/CHANGES.rst
+@@ -1,3 +1,16 @@
++(TBD)
++==================
++
++Bugfixes
++--------
++
++- Fixed a high-severity security issue where decompression-bomb safeguards of
++  the streaming API were bypassed when HTTP redirects were followed.
++  (`GHSA-38jv-5279-wg99 <https://github.com/urllib3/urllib3/security/advisories/GHSA-38jv-5279-wg99>`__)
++
++TODO: add other entries.
++
++
+ 2.5.0 (2025-06-18)
+ ==================
+ 
+diff --git a/dummyserver/app.py b/dummyserver/app.py
+index 0eeb93f7..5b82e932 100644
+--- a/dummyserver/app.py
++++ b/dummyserver/app.py
+@@ -233,10 +233,16 @@ async def redirect() -> ResponseReturnValue:
+     values = await request.values
+     target = values.get("target", "/")
+     status = values.get("status", "303 See Other")
++    compressed = values.get("compressed") == "true"
+     status_code = status.split(" ")[0]
+ 
+     headers = [("Location", target)]
+-    return await make_response("", status_code, headers)
++    if compressed:
++        headers.append(("Content-Encoding", "gzip"))
++        data = gzip.compress(b"foo")
++    else:
++        data = b""
++    return await make_response(data, status_code, headers)
+ 
+ 
+ @hypercorn_app.route("/redirect_after")
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index f6266f1a..ff6d1f49 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -687,7 +687,11 @@ class HTTPResponse(BaseHTTPResponse):
+         Unread data in the HTTPResponse connection blocks the connection from being released back to the pool.
+         """
+         try:
+-            self.read()
++            self.read(
++                # Do not spend resources decoding the content unless
++                # decoding has already been initiated.
++                decode_content=self._has_decoded_content,
++            )
+         except (HTTPError, OSError, BaseSSLError, HTTPException):
+             pass
+ 
+diff --git a/test/with_dummyserver/test_connectionpool.py b/test/with_dummyserver/test_connectionpool.py
+index ce165e24..8d6107ae 100644
+--- a/test/with_dummyserver/test_connectionpool.py
++++ b/test/with_dummyserver/test_connectionpool.py
+@@ -508,6 +508,25 @@ class TestConnectionPool(HypercornDummyServerTestCase):
+             assert r.status == 200
+             assert r.data == b"Dummy server!"
+ 
++    @mock.patch("urllib3.response.GzipDecoder.decompress")
++    def test_no_decoding_with_redirect_when_preload_disabled(
++        self, gzip_decompress: mock.MagicMock
++    ) -> None:
++        """
++        Test that urllib3 does not attempt to decode a gzipped redirect
++        response when `preload_content` is set to `False`.
++        """
++        with HTTPConnectionPool(self.host, self.port) as pool:
++            # Three requests are expected: two redirects and one final / 200 OK.
++            response = pool.request(
++                "GET",
++                "/redirect",
++                fields={"target": "/redirect?compressed=true", "compressed": "true"},
++                preload_content=False,
++            )
++        assert response.status == 200
++        gzip_decompress.assert_not_called()
++
+     def test_303_redirect_makes_request_lose_body(self) -> None:
+         with HTTPConnectionPool(self.host, self.port) as pool:
+             response = pool.request(
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
index c39e9676e8..7892fc0874 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
@@ -9,6 +9,7 @@ inherit pypi python_hatchling
 
 SRC_URI += "\
     file://CVE-2025-66418.patch \
+    file://CVE-2026-21441.patch \
 "
 
 DEPENDS += "python3-hatch-vcs-native"

