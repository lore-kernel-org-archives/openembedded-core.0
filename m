Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62115CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:13:51 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5854.1780337625573725119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 11:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dQNYzCqw;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7252; q=dns/txt;
  s=iport01; t=1780337625; x=1781547225;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qk8xWLk8LBFOed56upOrwbYRkvhMyzHCcztIayppto4=;
  b=dQNYzCqwZRwk6HHSRI16Qjad04s51y3ZLYly567NRUQeOdKLr5kvVnme
   YhRAdNBh7gsgSZq5DE4qHm9qTmzuRssm7xBpWMyLa13rG4n07xI23pkc9
   ApRH1qno1fKic/wZbdJuPJ8ffj5FTLlNkm/4kIfvmm8lP2M/zCJ/urU9F
   AXE/7fBSD/jCPiD6hhg3RlddqhkMlUWG/lcLIHO8W+PUE5Wv3VErrBXhj
   WfiAPm+HOEnX90Dbd9oavytcQlt7z+rrCu3xOfEQxfc9DB581TvayuXKg
   BeUjbAIoE15Y2J0Ly3XiGB+0Dbd4hMbj/fz6qpCJUauMvikiaGOujnPQu
   Q==;
X-CSE-ConnectionGUID: ihA+B65nQ6ufXh2ghwltpg==
X-CSE-MsgGUID: FQCNyB+BSNeHHuKeuzbd5g==
X-IPAS-Result: =?us-ascii?q?A0BFAgAuyh1q/5X/Ja1aHgEBCxIMggULgldyX0JJA5Qng?=
 =?us-ascii?q?iGBFopRkjeBfg8BAQEPRA0EAQGEQI16AiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBLQsBGAFZAwECTwsjIYMCAYI6AzYCARG1I?=
 =?us-ascii?q?4F5M4EBgygBPwJDUNhIDYJTAQsUAYE4hT+CeoUjWxgBhHsnGxuBcoEVgnJ2g?=
 =?us-ascii?q?QWBGkIBAYgkBIIiehKBXR5ngiSKUkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBCxsHBYFKgVVqgQKFGCMfAzmBF4F/gStsMQMLGA1IESw3FBsEPm4Hi?=
 =?us-ascii?q?0kXD4I1ATBKEwEqAQQcgUgVL5MRJpI/oB1xCiiDdIwhjz6FfBozhVulEAuYe?=
 =?us-ascii?q?44JhAmRdlCEaIFoPIFHCwdwFTuCZwlKGQ+OOINrgX+DZcNeJDUCCQMvAQEHA?=
 =?us-ascii?q?gcOAwuBaJF9AQE?=
IronPort-Data: A9a23:rZA4w65untn/7DSgYpXmSAxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mIaDTiDOv+LMGujfYtzbY+z9U5TsZDQxt5kSwBt+CszZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxMsvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ePI0xucwpXGd3q
 +EWGDBXYRCcg/6uz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEeUrsUIMpWcOOAnWTzbjhSqFu9rqss6G+Vxwt0uFToGIaKJoTVGpULxy50o
 Eroxk/fEztZHue5xBql71Ghm/3FkX70Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:JcTcYKzPq8hyDxFAwAMzKrPwHL1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTn/Asi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbfK8nnHBzD08PJb2O
 NLdqhzD8C1MH1B5PyKhTVR170bsb66GGfCv5a780tQ
X-Talos-CUID: =?us-ascii?q?9a23=3AmRkic2sqiGJ8SFnEbYWrXXNx6IskclSe5imNJXb?=
 =?us-ascii?q?mFGhZSOeaSUCU5Ltrxp8=3D?=
X-Talos-MUID: 9a23:mm8LFASGP5XLcDJzRXTCvRpEJe0ryZ+IBWAtjLYLptuOOXF/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,181,1774310400"; 
   d="scan'208";a="474077861"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Jun 2026 18:13:44 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 85A6618000247
	for <openembedded-core@lists.openembedded.org>; Mon,  1 Jun 2026 18:13:44 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 2C433CB6A93; Mon,  1 Jun 2026 11:13:44 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] python3-urllib3: fix CVE-2026-44431
Date: Mon,  1 Jun 2026 11:11:58 -0700
Message-Id: <20260601181157.3221502-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 18:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237984

From: Sudhir Dumbhare <sudumbha@cisco.com>

Applies the upstream fix [1] referenced in [2] and addresses the
sensitive-header redirect handling issue in proxied low-level urllib3 requests.

[1] https://github.com/urllib3/urllib3/commit/5ec0de499b9166ca71c65ab04f2a7e4eb0d66fcc
[2] https://ubuntu.com/security/CVE-2026-44431

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-44431

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../python3-urllib3/CVE-2026-44431.patch      | 163 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch
new file mode 100644
index 0000000000..042b46f47a
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
index f6ac8f89ca..b77dd5297d 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
     file://CVE-2025-66418.patch \
     file://CVE-2025-66471.patch \
     file://CVE-2026-21441.patch \
+    file://CVE-2026-44431.patch \
 "
 
 RDEPENDS:${PN} += "\
-- 
2.35.6


