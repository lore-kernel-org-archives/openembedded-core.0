Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DF6E7FDD6
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13485.1770113969161220376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oUfcFSoM;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43590777e22so3379222f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113967; x=1770718767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42ylXkdUGfq8kHAqdH2LLApxmlGycZrLoYuwTTyDTYM=;
        b=oUfcFSoMLYR0k8kdVQLvjbttVc9Rj/DvH+BdGNV9m+buldQo6sFNgtC3x82W5QMVpZ
         BeVlpjkIORwVnED7iYJ0QwVItNqDVgLrFZiuuBKi4GEcPE+Er4KaG55yM0RqroFXd97y
         m9b9hFBHIhPMdciKpx5nM/cju0Am9zw+zv7+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113967; x=1770718767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42ylXkdUGfq8kHAqdH2LLApxmlGycZrLoYuwTTyDTYM=;
        b=d2KnsDCrQt9yhvEHCnQ8uUnSdmfkLZiBic6mdMo1c428dEVGmSe9XP8HY1TnBjcHqK
         X5p/1Zwt1YKqjswYwo2JGYwtiF2pFPTYBni+VJ+iFlMQ0iL8v88au4qIw3AFX/02sUPe
         5B3aGWkAl1dCITbyH2tjul+8v5eBOSuaq84QaPIoApD6ThZSuee3HVC3Ls7pIYkIrrXU
         9KburvD3EINHU94k2GxezNoYMyTBFsuMC9s0qtx1wgY14KwohqjY6GrWRIl6SVzuzW1c
         9kXjBUzudyFd4IzAvGDuwjdaHyHZL2Uo8cTWOaxjWP6lQRannVVoCuKtS7a8FdeSeqeB
         ww9Q==
X-Gm-Message-State: AOJu0YwaJJjtf72R4NEbLKpLdQ6OyOi9u8KjSvKWuixrs4RbqGtVoQm1
	W5M40CoIdOTZ9EcWfwdqQKrZHpvyyYxehImip40Ar17dddQ70wvjNgQbpZn4m/p9rsmZOMkRcpZ
	6LDs47nY=
X-Gm-Gg: AZuq6aLZqp++FRnkwtR/teaVFBYHo4kNrmtQdq5eSstl5IosOWA5vX5abtTdqKJtpqa
	Nc15ksnv5mVgbep5W02n7kCOoL4Xvy90cVHcSUcX9q5sCcf1+JGq94JX/+GSmc+Ap+p9lNox91s
	5w1wpQr/MaRlNDBy/arl5mgSY+Y/iLcwqY3uGCcaTtqvfHBRL7QAcMZ/V9v+qjI2FnAJ5sA2Oww
	lpXkWkh0as3hU5A3mMxJFCA6LFw+mUMr7Q0IoIVbIipcappC7xVVE6f6CJBQimI0i3Z9ENzX68P
	G+6JHmKQSaCAPSrF/zzjOo7UaaO/1IUhwEwtRynOEGkh4SBw+zennayk5qec6EH7WqSohxJWD5G
	UlLUy9rMZEJ+AN1izNdKE+fRiA8zgToiReSe6uoYNGGw2yft13kCHPMdDsOe3vzLD3J2y5PAqm4
	xQrFx9qcVkwEeS0docnW1vdQU/W/PdM/HK48H4DOhOPtW7jybylDbFCSfTo64yV4cR/UPyJhCpv
	pc0lVQ2G+9oe00=
X-Received: by 2002:a5d:5848:0:b0:435:bdc0:48e9 with SMTP id ffacd0b85a97d-435f3ab4bdcmr20203901f8f.55.1770113967129;
        Tue, 03 Feb 2026 02:19:27 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 07/22] python3-urllib3: patch CVE-2026-21441
Date: Tue,  3 Feb 2026 11:16:36 +0100
Message-ID: <2e0f5c85a1c4b75358fd697db7c2829d87bbba15.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230435

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-urllib3/CVE-2026-21441.patch      | 111 ++++++++++++++++++
 .../python/python3-urllib3_2.5.0.bb           |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
new file mode 100644
index 00000000000..f3a60138177
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
index c39e9676e89..7892fc0874e 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
@@ -9,6 +9,7 @@ inherit pypi python_hatchling
 
 SRC_URI += "\
     file://CVE-2025-66418.patch \
+    file://CVE-2026-21441.patch \
 "
 
 DEPENDS += "python3-hatch-vcs-native"

