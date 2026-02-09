Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9BAE7E0AD
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44205.1770629372285157870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=P9RXIigB;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so31682795e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629370; x=1771234170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5HRrLlPXRT9uVnFrlc7CErbMFLqWAyUpSxaEJByP3E=;
        b=P9RXIigBgcoWukJgCxzxS85YwUlG9iHvhy/zfOss+641G7IUaXGmRkjqvAyY83xbCG
         YpondSMxUcgiKn2/p/H3rCq9aS1fvuxhpC0Y7LoQxRbI+MFE4487I5S0ZbbRquPmjAx/
         Q2A7JgPVZ9NGWLqXArEO7WbUIdUS6niCo+aSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629370; x=1771234170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/5HRrLlPXRT9uVnFrlc7CErbMFLqWAyUpSxaEJByP3E=;
        b=bbiHjdkQ2bF1gztFs6HZqNyc2bQvl/qodNMnnNTH73g6ySJW46RjJDN8U1w0oiWFzc
         DjTVysxZdu7Djtr86+Nd4MZiE9jRVY77VYeMnShqIhlG52T4AuQUlrqv/JbWhiJQuS+v
         0CfT17mN2JkCwPq5r7ju2xru8nE3vOxiebjT0hwcuHEipfNvL4qmg3axAjImm3rbI4JJ
         xlxZUKeDiQL4omcC2K+E8wpQ0AajMhbiSvG7cyr7pFhuEgtmgCQHaC/0G3O52vIHTvg6
         jmj2CvRn9GXEx0Al+TWrhEgM8Rah/hD+Kod8Xf5apgp8wrTpTMJhI+uyUyA2Ax0PB+LI
         P66Q==
X-Gm-Message-State: AOJu0YxXCnQT47FYZ4rNw1gd06CajJ0v6riLprgUvnHU3NHFhobrQDnu
	XhjCdL4q8aObIT29QkJG2KJWh1f2m9in/DkOjbDPEn19LMMYVmYFE+cDMZqrO+YpIZegLbF7AhI
	djFf1qgE=
X-Gm-Gg: AZuq6aK6kDd149fUKtbIouD8KgfsxQ+YHRgONiNjF+Y7atGv6q8FR46zjDW22R+7Wdu
	cWchcz6uaqz685HwqZ3EPqQAhEBqYPFQFkNUqBLImnIsAB27jz78+L+TDAPyo6nBym+dQw5UEA/
	S/b5EFbTWeNGxvdAGMhrfSsXR2LgkV7btjqlXJCV8lSm8T6+ILWnihr/Cp3S1ntE0HXQ8VNULAi
	HspVRjUylIjP7laIGHixsjZ5WBQ1CH+BwPZMWD6DuefvhfgnayYV9xLtFejojeKiwb15K27813m
	HfUlDDkhx4cCUpu/jDl5HvRXQ6PgIHEzY3pyA9Hm3URd3VxYOtU8KE6N9lYDAROeZMXFKB/yGxz
	rajWBdcuuxy8jHdoB2lYb4WqNjNY4+Qb1TMI0kExB4oErJIveM9VyAC5w7DOq3pL4ytMhlE9ueH
	bsOTu7pbos8szqXIyULBpxOayZMMNbdo+KA3JjYG9Kdx8It1ewbkzb++qg4hCU6MuC1ewDQlB3z
	q3dZkIuJZ30ehg=
X-Received: by 2002:a05:600c:c16d:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-483202146dfmr139479735e9.19.1770629370318;
        Mon, 09 Feb 2026 01:29:30 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/25] python-urllib3: Backport fix for CVE-2026-21441
Date: Mon,  9 Feb 2026 10:28:58 +0100
Message-ID: <bd84db43d5f203725690a724c532678083631c2b.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230766

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report : https://nvd.nist.gov/vuln/detail/CVE-2026-21441
Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-urllib3/CVE-2026-21441.patch      | 105 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
new file mode 100644
index 00000000000..16af67af312
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
@@ -0,0 +1,105 @@
+From 686d2bdd4affd3c86e605f54a72afe53c920f72f Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Wed, 7 Jan 2026 18:07:30 +0200
+Subject: [PATCH] Backport fix CVE-2026-21441 python urllib3
+
+Original commit: 8864ac407bba8607950025e0979c4c69bc7abc7b
+Original-author: Illia Volochii <illia.volochii@gmail.com>
+
+Bugfixes
+--------
+
+- Fixed a high-severity security issue where decompression-bomb safeguards of
+  the streaming API were bypassed when HTTP redirects were followed.
+  (`GHSA-38jv-5279-wg99 <https://github.com/urllib3/urllib3/security/advisories/GHSA-38jv-5279-wg99>`__)
+
+* Stop decoding response content during redirects needlessly
+
+* Rename the new query parameter
+
+* Add a changelog entry
+
+Fixes CVE-2026-21441
+CVE: CVE-2026-21441
+
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/8864ac407bba8607950025e0979c4c69bc7abc7b]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ dummyserver/app.py                           |  8 +++++++-
+ src/urllib3/response.py                      |  6 +++++-
+ test/with_dummyserver/test_connectionpool.py | 19 +++++++++++++++++++
+ 3 files changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/dummyserver/app.py b/dummyserver/app.py
+index 9fc9d1b7..c4978152 100644
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
+index a0273d65..909da62b 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -646,7 +646,11 @@ class HTTPResponse(BaseHTTPResponse):
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
+index 4fbe6a4f..ebcdf9bf 100644
+--- a/test/with_dummyserver/test_connectionpool.py
++++ b/test/with_dummyserver/test_connectionpool.py
+@@ -480,6 +480,25 @@ class TestConnectionPool(HypercornDummyServerTestCase):
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
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
index 620927322a0..f6ac8f89cad 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -11,6 +11,7 @@ SRC_URI += " \
     file://CVE-2025-50181.patch \
     file://CVE-2025-66418.patch \
     file://CVE-2025-66471.patch \
+    file://CVE-2026-21441.patch \
 "
 
 RDEPENDS:${PN} += "\

