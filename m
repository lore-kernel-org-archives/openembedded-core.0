Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B62C44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1953.1783701429749774725
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hbZQJP1M;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f6de72faso3402705e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701428; x=1784306228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DkRPF5yKHeHYy5EUWsRHqSr4eTaDL4GPxV3DqfWUJfE=;
        b=hbZQJP1MQTxC87w57C+ihfl3txm5NUhtmGFMWwr00NQDibIXVbQcGBFbiziH3G43yX
         Fr5KUWVkQ3ONz8VlJIqcqzLDy26ybM2XXjL9IRjcxonWfu/o8jh9C3a5fBwhkmqw02Cb
         xEMKFRsmVPYOqC9Le08TpBTxAcl9jLfG7OHsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701428; x=1784306228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DkRPF5yKHeHYy5EUWsRHqSr4eTaDL4GPxV3DqfWUJfE=;
        b=d60zZCZQvPGgWkeOmvewRGjfSHITVTwFGUVQnZigzNpcTKb2DLnrDaVLa26ojOFqCU
         Fi1JBzSBLrWjUgg6+f6Qn1vLnfpNLq4LPgVTPh+eTEHdaMwdTghawJnyIjP6VB3lRQ1i
         HmfAcwstnKaC3ZXbDUeutM2kBgXWZk+AVof9j7bDveCv3c3I2XnSQldCpOrzLmzxor+z
         Tu/iYsDJ+3nQIM+EuPNNMkYxF34fvPRtfyZbI9uuiTi0tMSr+M3ofuvv+aQx3SheTg4H
         9G1qHssbGcx0Z3ZEJImef2IfK2F62ZYysCtlNQAVM3FvosCw/CJQDVwRLxUKIPE1mAfM
         ZIbQ==
X-Gm-Message-State: AOJu0YwF/55wHip6sOy9XrzHBB3z+J2t7WKlG3ywHhGtiXqobKsHV1Xf
	OdT+t0OcMzU/996pgaawxdhGXrYrL30AN3LQRy8zcw7BLg48KbqJujH36pK+nBegBIiaGhjVqIV
	aE4yZqu0=
X-Gm-Gg: AfdE7cm4ARqx7Y/vU0pxUOaCQq7TWg1LoboKifUJRK0LFDOkANvt0W8cDeJznd1vxI4
	D8YUH8ewJ5egl0cYZceBb5pQ+71728A1IyBEAFDRBE0OnjHP24iN8vYflk6OhkhrbKRibhz/8J9
	SPpOH7GVeqhqnESnqpGO4oL/RnZA+N8khck38gzfX12aWLzQaPZTAWxWmpgtWUGwqL+eT1Kgf+Q
	UMhsS43pvVz501i5/HBZHAamvig1Pyx49v9BzHYx7My9NbMU5N5A3ItL5TB9vPEzOABJMTmZJ/J
	zW8cfKJydG2L0rdQ1qUQC+j7c0f1O7IyDCwtCk1CYSRp63aHirdHOWAD9nzeNdNxsVogeGt45ea
	a9lcAPQaXJqWfyugcHK/dZMXCBNNRl1C2Z6SzncFTC3WxxtYyRZzUceF5bDYa3b+DeCDHmiwQB/
	uhOgz94UA6HDjcfZWneTCauZlD4eHOg5+UYoh+zd4eO+Xv2ytECvihgUiPnsSBvG1SEAFOWMT6s
	o4Uyr+aQA90mM/eeeU=
X-Received: by 2002:a05:600c:46cd:b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-493f2b3fedcmr41983725e9.15.1783701427855;
        Fri, 10 Jul 2026 09:37:07 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/18] python3-urllib3: Fix CVE-2026-44431
Date: Fri, 10 Jul 2026 18:36:25 +0200
Message-ID: <d46214a3eee440ccc379187524d113d187e0fe11.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240671

From: Sudhir Dumbhare <sudumbha@cisco.com>

Applies the upstream fix [1] referenced in [2] and addresses the
sensitive-header redirect handling issue in proxied low-level urllib3 requests.

[1] https://github.com/urllib3/urllib3/commit/5ec0de499b9166ca71c65ab04f2a7e4eb0d66fcc
[2] https://ubuntu.com/security/CVE-2026-44431

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-44431

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
[YC: moved the new SRC_URI block up following the Recipe Style Guide]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-urllib3/CVE-2026-44431.patch      | 157 ++++++++++++++++++
 .../python/python3-urllib3_2.6.3.bb           |   3 +
 2 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch
new file mode 100644
index 00000000000..d7063b136a8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch
@@ -0,0 +1,157 @@
+From ca72cfc9233edcf886b9e0dd187a9c4bca780f9b Mon Sep 17 00:00:00 2001
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
+Co-authored-by: Copilot <copilot@github.com>
+
+---------
+
+Co-authored-by: Copilot <copilot@github.com>
+
+CVE: CVE-2026-44431
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/5ec0de499b9166ca71c65ab04f2a7e4eb0d66fcc]
+
+Backport Changes:
+- Omitted changelog/GHSA-qccp-gfcp-xxvc.bugfix.rst because it is not
+  present in the current version.
+
+(cherry picked from commit 5ec0de499b9166ca71c65ab04f2a7e4eb0d66fcc)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ dummyserver/asgi_proxy.py                     |  1 +
+ src/urllib3/connectionpool.py                 | 12 ++++
+ .../test_proxy_poolmanager.py                 | 72 +++++++++++++++++++
+ 3 files changed, 85 insertions(+)
+
+diff --git a/dummyserver/asgi_proxy.py b/dummyserver/asgi_proxy.py
+index 00c0a1b8..3ff18673 100755
+--- a/dummyserver/asgi_proxy.py
++++ b/dummyserver/asgi_proxy.py
+@@ -56,6 +56,7 @@ class ProxyApp:
+             client_response = await client.request(
+                 method=scope["method"],
+                 url=scope["path"],
++                params=scope["query_string"].decode(),
+                 headers=list(scope["headers"]),
+                 content=await _read_body(receive),
+             )
+diff --git a/src/urllib3/connectionpool.py b/src/urllib3/connectionpool.py
+index 3a0685b4..0f33863c 100644
+--- a/src/urllib3/connectionpool.py
++++ b/src/urllib3/connectionpool.py
+@@ -896,6 +896,18 @@ class HTTPConnectionPool(ConnectionPool, RequestMethods):
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
+index 4a932c0d..6921bc6d 100644
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
+@@ -300,6 +301,77 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
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
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
index e63791a8f45..5976c5c3b44 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -3,6 +3,9 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
+SRC_URI += " \
+    file://CVE-2026-44431.patch \
+"
 SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
 
 inherit pypi python_hatchling

