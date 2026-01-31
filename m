Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BE1D7974A
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5104.1769846221471795042
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B+t3z4F/;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso12905755e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846219; x=1770451019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42ylXkdUGfq8kHAqdH2LLApxmlGycZrLoYuwTTyDTYM=;
        b=B+t3z4F/Xt/o45eWz2MGNlpFfxWFhwS7CWgjmXNWGmDDvASVXyTaGnsWyNs0u3+yU9
         F48xg8R0PXa89vza7NwGKp7RzBFJm4mn+MzM/GcLuLr/u/QQOlsh/IN9avAop0cmRFdn
         wowQKD0B0EOgcd2w+W2b2OGDb9SOAZdWEQ4tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846219; x=1770451019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42ylXkdUGfq8kHAqdH2LLApxmlGycZrLoYuwTTyDTYM=;
        b=PfMtgwuqRn4BjhF1nlT3XcDnPckbe3gdiL8vo8tmZuGtz2j6Y7PsIV1930wzQIyVf3
         a1FFm58OJ2e/dVUleeKK8kSByZHsBk7OtY5d4Ob7htWa0bUCdibWwM6RJs76nEyg1aqK
         7O82ZYfyGoF8o5YHbuTK0YwTr5f0R9ACmKJOaMfyD5yk6Iu/z46B0/eUMrEOwD4IM4nD
         Bgn6+ESYGmIY//eIaas2p/7c2yp9lL25mKbZtoHansFBq0WwrkZPV0GuQgr61etYPHqS
         XlJyvfuEPgGMX5WwiJ26UDTFAOejsVoVKzOaqvsS5Vl8Zpt0yCpL4lJ4zcPjVl4vDm7a
         Leng==
X-Gm-Message-State: AOJu0Yx+mHOR1BrmEC7FhxFjOPZlSwtXDjjvFLkfKImHXmH1rqaXjo6E
	CkoM/7dAHvq61E7d/IjfC31atXxht+zglWplrnMtJBpKKEcYgQTsdKiUQOy/F86jsDl9QmALDPf
	ssZmgTqM=
X-Gm-Gg: AZuq6aLUbODMgp6Du958RZ9KVxjPBIQYv5UwpxxyH3rU3TRw6NsQLjpOJEfQlB/tHLH
	T4gtjMD272/iUR+Pc2JD/nw50Z4jW+yNFTzYmuIF1qDs/RTo4ZkGItHHq7tYolT1WlYM7brQVj+
	W9onx5qU6RUsAiJ+kEFasRSqfrV04Q5PWMKgmBv1gj2wcuzkzEHP6gcPOdrXCxoP1g8FRck/GH1
	Sft61CzcYN58pypBB3F6/e+VdcBa0x476lzkT4rxjHCIifEoax55ckkeueVQB7E272atQ071AQ8
	e6PbK2M5EiSmK21W+lXSWW+nUZxGVfDsWpN0veCJFINnKymt+IZhCWUffZli51ZzOTDw8YtCVyu
	k3ud7otUT+DgOew/q4G94OqfQDPA/csuWqSDlRr+GVOCplR9bB057d2ffcDWhbOs4k8OkWOZVI3
	nsYQ2ClKtYUuCcC/ftsvZI2iWVRyi5SYUIMtAeczIAW7lSFgwt0CQcSAO3aO5gFwozaQhSqX9Uw
	FuSSb1NZHbH2tGJ
X-Received: by 2002:a05:600c:1da8:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-482db493ff1mr68899885e9.3.1769846219510;
        Fri, 30 Jan 2026 23:56:59 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.56.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 08/22] python3-urllib3: patch CVE-2026-21441
Date: Sat, 31 Jan 2026 08:56:19 +0100
Message-ID: <f7b4ebfcdac7a402e1a80e8896dab80c5685fbc8.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230213

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

