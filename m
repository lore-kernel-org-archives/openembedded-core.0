Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0436BC44536
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2902.1784568226887465504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GCYoB0ZE;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso12150065e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568225; x=1785173025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sAO6CyqYgqRsvW8ITtRSfMMxQELK4vJtVHEotc4N/u4=;
        b=GCYoB0ZEGVIanLWc+gr2BW3df2pPzZoJ0Ft+/XcSbYx2RHAx392muo1xEB5nHgGZCx
         woNVAR0uq3LFgVpN0P5L/ExhuNxvO0wkUHtt+p2Xv7NQz4w3C1Ub+Paovm1JrddT816e
         5Sv8UWFzNp0TpE/5qlFxK1Uyo1xf6PlN/DPrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568225; x=1785173025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sAO6CyqYgqRsvW8ITtRSfMMxQELK4vJtVHEotc4N/u4=;
        b=RyARFAL28TYCImVi7MnTODfdEkBNOUyCslHolO2X9dagOlgij62WlJIbKZaJkTjR5u
         8AMqJJktSsdrKJS1oeX4eLo5NXofqixlWTJdVmasTyxvx4PAR1eisk/+XL55nxNpKGXM
         ck6/dUoHjkGZE4QSsq2IawEtDj6hFLdyXJZRa8tQ4tRQ0nS1B44suqRSIsPOKBD6yR7a
         MAlcVudkA7qL44OmFZqcfhKpUL8brCiRFW5vF9ruGVCE4VokGsK+L3mJ7RQZdyw4SEbe
         oB8wGSaC5R5Yr3IoGi3stYyi2KBBriAeQba8vkd5zqeBgJSheESEYIdIj9kZcuZHMgO8
         rrfg==
X-Gm-Message-State: AOJu0YybOOzm42I67PonvMqFWjZMEnk3MNoqW4HJrdTiX5xcafjJolak
	UEKXn8fGcXe1YmpkSJNdJPElY0bF7sDHnbvEWzdCgIDdIGEIUsPlc3+7IZk3XHEjIsegLKAE52b
	H/vmtp5Q=
X-Gm-Gg: AfdE7clHO9cr3k59jn1IDpE2c83mMXOa3wJiyqsjGll50/g/+QkSx58MM7lX6qB0y3A
	iI+qy+ptd4UYzDQrs8Oko5WJIn1cPkxC5CTkqkkDAje/JNhiWO5Ozho7apAadVHiEbYyf096TIP
	zztIKNPjozadhkD2E9RE+a14VHVkLlY4soilmkerCbVk5NT/sd4zeJCOrHEdMvJ0HApK2fFV6MZ
	zO2M3uq91ycUfOJx34MTT6/F81oRmes6aslUkLr5Sl3UeD3CEG+4fLUlCA25E9t9R1ZldQRRX0w
	6knq9xfQSec7GpxfRwKH9x34QgVABKLxnTSufGESFcmjja0NdkuIQKwxxOBA1JTl39vcoxqAOny
	KC5IvRZCLu8ZNGVdTSHKIUAMBtwVDu3wVwgNMl/V3IDeE2qpNUfL9Z0S+s/0wE2muGokfoQkpTR
	m2h7u8DL7QPww4XbGeqQDf5goXtHb5C9u4QXNESkdd1akuSxFpbyvhmoDKCUmd3B3Z0ZEQyTET3
	iwsx4sR
X-Received: by 2002:a05:600c:6d82:b0:495:4072:4194 with SMTP id 5b1f17b1804b1-4954a40c4acmr116040575e9.28.1784568225067;
        Mon, 20 Jul 2026 10:23:45 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/33] python3-urllib3: fix CVE-2026-44431
Date: Mon, 20 Jul 2026 19:22:56 +0200
Message-ID: <efbd9dab40e72374b064f848cb9d0b3f0f97efc8.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241457

From: Sudhir Dumbhare <sudumbha@cisco.com>

Applies the upstream fix [1] referenced in [2] and addresses the
sensitive-header redirect handling issue in proxied low-level urllib3 requests.

[1] https://github.com/urllib3/urllib3/commit/5ec0de499b9166ca71c65ab04f2a7e4eb0d66fcc
[2] https://ubuntu.com/security/CVE-2026-44431

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-44431

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-urllib3/CVE-2026-44431.patch      | 163 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch
new file mode 100644
index 00000000000..042b46f47a2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch
@@ -0,0 +1,163 @@
+From d5517b0ab50030a8f389757b3ba648633c504cbc Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Thu, 7 May 2026 18:40:31 +0300
+Subject: [PATCH] Merge commit from fork
+
+* Remove sensitive headers in proxy pools too
+
+* Add a changelog entry
+
+* Check retries history in tests
+
+CVE: CVE-2026-44431
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/5ec0de499b9166ca71c65ab04f2a7e4eb0d66fcc]
+
+Co-authored-by: Copilot <copilot@github.com>
+
+---------
+
+Co-authored-by: Copilot <copilot@github.com>
+(cherry picked from commit 5ec0de499b9166ca71c65ab04f2a7e4eb0d66fcc)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ changelog/GHSA-qccp-gfcp-xxvc.bugfix.rst      |  3 +
+ dummyserver/asgi_proxy.py                     |  1 +
+ src/urllib3/connectionpool.py                 | 12 ++++
+ .../test_proxy_poolmanager.py                 | 72 +++++++++++++++++++
+ 4 files changed, 88 insertions(+)
+ create mode 100644 changelog/GHSA-qccp-gfcp-xxvc.bugfix.rst
+
+diff --git a/changelog/GHSA-qccp-gfcp-xxvc.bugfix.rst b/changelog/GHSA-qccp-gfcp-xxvc.bugfix.rst
+new file mode 100644
+index 00000000..bac765ea
+--- /dev/null
++++ b/changelog/GHSA-qccp-gfcp-xxvc.bugfix.rst
+@@ -0,0 +1,3 @@
++Fixed HTTP pools created using ``ProxyManager.connection_from_url`` to strip
++sensitive headers specified in ``Retry.remove_headers_on_redirect`` when
++redirecting to a different host.
+diff --git a/dummyserver/asgi_proxy.py b/dummyserver/asgi_proxy.py
+index 107c5e0a..094807cd 100755
+--- a/dummyserver/asgi_proxy.py
++++ b/dummyserver/asgi_proxy.py
+@@ -52,6 +52,7 @@ class ProxyApp:
+             client_response = await client.request(
+                 method=scope["method"],
+                 url=scope["path"],
++                params=scope["query_string"].decode(),
+                 headers=list(scope["headers"]),
+                 content=await _read_body(receive),
+             )
+diff --git a/src/urllib3/connectionpool.py b/src/urllib3/connectionpool.py
+index a2c3cf60..f64ee2f8 100644
+--- a/src/urllib3/connectionpool.py
++++ b/src/urllib3/connectionpool.py
+@@ -898,6 +898,18 @@ class HTTPConnectionPool(ConnectionPool, RequestMethods):
+                 body = None
+                 headers = HTTPHeaderDict(headers)._prepare_for_method_change()
+ 
++            # Strip headers marked as unsafe to forward to the redirected location.
++            # Check remove_headers_on_redirect to avoid a potential network call within
++            # self.is_same_host() which may use socket.gethostbyname() in the future.
++            if retries.remove_headers_on_redirect and not self.is_same_host(
++                redirect_location
++            ):
++                new_headers = headers.copy()  # type: ignore[union-attr]
++                for header in headers:
++                    if header.lower() in retries.remove_headers_on_redirect:
++                        new_headers.pop(header, None)
++                headers = new_headers
++
+             try:
+                 retries = retries.increment(method, url, response=response, _pool=self)
+             except MaxRetryError:
+diff --git a/test/with_dummyserver/test_proxy_poolmanager.py b/test/with_dummyserver/test_proxy_poolmanager.py
+index 397181a9..a0b11726 100644
+--- a/test/with_dummyserver/test_proxy_poolmanager.py
++++ b/test/with_dummyserver/test_proxy_poolmanager.py
+@@ -37,6 +37,7 @@ from urllib3.exceptions import (
+     SSLError,
+ )
+ from urllib3.poolmanager import ProxyManager, proxy_from_url
++from urllib3.util.retry import RequestHistory
+ from urllib3.util.ssl_ import create_urllib3_context
+ from urllib3.util.timeout import Timeout
+ 
+@@ -299,6 +300,77 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
+             assert r._pool is not None
+             assert r._pool.host != self.http_host_alt
+ 
++    _sensitive_headers = {
++        "Authorization": "foo",
++        "Proxy-Authorization": "bar",
++        "Cookie": "foo=bar",
++    }
++
++    @pytest.mark.parametrize(
++        "sensitive_headers",
++        (_sensitive_headers, {k.lower(): v for k, v in _sensitive_headers.items()}),
++        ids=("capitalized", "lowercase"),
++    )
++    def test_cross_host_redirect_remove_headers_via_proxy_manager(
++        self, sensitive_headers: dict[str, str]
++    ) -> None:
++        headers_url = f"{self.http_url_alt}/headers"
++        initial_url = f"{self.http_url}/redirect?target={headers_url}"
++        with proxy_from_url(self.proxy_url) as proxy_mgr:
++            r = proxy_mgr.request(
++                "GET", initial_url, headers=sensitive_headers, retries=1
++            )
++            assert r.status == 200
++            assert r.retries is not None
++            assert r.retries.history == (
++                RequestHistory(
++                    method="GET",
++                    url=initial_url,
++                    error=None,
++                    status=303,
++                    redirect_location=headers_url,
++                ),
++            )
++            data = r.json()
++            for header in sensitive_headers:
++                assert header not in data
++
++    @pytest.mark.parametrize(
++        "sensitive_headers",
++        (_sensitive_headers, {k.lower(): v for k, v in _sensitive_headers.items()}),
++        ids=("capitalized", "lowercase"),
++    )
++    def test_cross_host_redirect_remove_headers_via_pool(
++        self, sensitive_headers: dict[str, str]
++    ) -> None:
++        headers_url = f"{self.http_url_alt}/headers"
++        initial_url = f"{self.http_url}/redirect?target={headers_url}"
++        with proxy_from_url(self.proxy_url) as proxy_mgr:
++            pool = proxy_mgr.connection_from_url(self.http_url)
++            r = pool.urlopen(
++                "GET",
++                initial_url,
++                headers=sensitive_headers,
++                retries=1,
++                redirect=True,
++                assert_same_host=False,
++                preload_content=True,
++            )
++            assert r.status == 200
++            assert r.retries is not None
++            assert r.retries.history == (
++                RequestHistory(
++                    method="GET",
++                    url=initial_url,
++                    error=None,
++                    status=303,
++                    redirect_location=headers_url,
++                ),
++            )
++            data = r.json()
++            for header in sensitive_headers:
++                assert header not in data
++
+     def test_cross_protocol_redirect(self) -> None:
+         with proxy_from_url(self.proxy_url, ca_certs=DEFAULT_CA) as http:
+             cross_protocol_location = f"{self.https_url}/echo?a=b"
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
index f6ac8f89cad..b77dd5297d3 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
     file://CVE-2025-66418.patch \
     file://CVE-2025-66471.patch \
     file://CVE-2026-21441.patch \
+    file://CVE-2026-44431.patch \
 "
 
 RDEPENDS:${PN} += "\

