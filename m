Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5D3C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:32:54 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156717.1783359165518453206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=j6rwbGbn;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6823; q=dns/txt;
  s=iport01; t=1783359165; x=1784568765;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oq5hw7jhfcVwyptXod9gUa+ZKvHp8XXbFuX6UWCJV1k=;
  b=j6rwbGbnnqMkf80D6ZEHh6MFw2LzcxDK4A2ekEML8dFSPihwo2K3uRrk
   H0Eg3r8+klnEIlbRjKMZQ1Bv9kCzW4i+It/H2W2cNqQVQ9eW83eq8ryj6
   CKaufGNgRuYp/yyvdtG5NnfJBUJSxU4d2sAY4XMlup6/WBgETG68TWJXN
   Lw4N3MXNt6O/QL1Ip+N60CgNfNc9zV/CIdHD7ZtHafUk/3zWDMPgYkiU8
   Ugoqz6SYIiTBWro0GIF/cxsayZ0yZ6bw77jkXrR/ZSMiTaU/WTmkPEOBs
   jyXiJwBEcglo9A8zkUoRVFGXw7yBMl2m/D06Fsa+wAE6zVNIWGh2wKQFv
   w==;
X-CSE-ConnectionGUID: UGwIUpYVR/6adcEfdTu7GQ==
X-CSE-MsgGUID: qOB2eWezSGi8eTTJ4xchrw==
X-IPAS-Result: =?us-ascii?q?A0BFAgBb5ktq/4r/Ja1aHgEBCxIMggULgld0X0JJA5Qng?=
 =?us-ascii?q?iGBFopRkjcUgWoPAQEBD0QNBAEBhECOFQImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAS0LARgBWQMBAk8LIyGDAgGCOgM2AgERu?=
 =?us-ascii?q?XiBeTOBAYMoAT8CQ1DYSQ2CVgELFAGBOIU/gnyFI1sYAYR8JxsbgXKBFYJzd?=
 =?us-ascii?q?oEFgRpCAQGBKwESAYZmBIIigQyBWh5QgVCNB0iBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDBsHBYEdgWuBAoR5Ix8DOX+BMHVKeS2BAxIeCoFSgSkDC?=
 =?us-ascii?q?xgNSBEsNxQbBD5uB4x7Fw+CPQEwDD4TASoBBByBSBUvkxEmkj+gHnEKKIN1j?=
 =?us-ascii?q?CGPPoV8GjOFW6URC5h9jgqECZF3UIRogWg8aV4LB3AVO4JnCUoZD444g2uBf?=
 =?us-ascii?q?4NlyHYkNQIJAy8BAQcCBw4DC4FokX0BAQ?=
IronPort-Data: A9a23:2UEgc6kluWZrhK697xfyItHo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfCmuHbKyCMWGnf49+Odm3/UgDu8DTyN9kTFZorXoxQltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLs/zb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbA35cdKGVBwz
 7tGITwGQx6Pu//p74vuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaj/7C7pm9AusrmLifyBdolKcjaE2+GPUigd21dABNfKIIoHaG5kNwh/wS
 mTu5kPTWBwlOc6k5jvV/06QpLPfliPhR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:Bsx1tq5tff9wEfRJtQPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I++rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: 9a23:j4ume2x9P+TO0i8rS1/iBgUpNd8ET2Xs8k2XfUa0AktnRIGIFnCprfY=
X-Talos-MUID: 9a23:FypCOgiHWw1znDDgodnb0cMpLeBCuamRBVI2vpRWtvW4F3BgMDeHk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,151,1779148800"; 
   d="scan'208";a="505864041"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 17:32:23 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 384BC180001CD
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Jul 2026 17:32:23 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id D2BA1CB6A93; Mon,  6 Jul 2026 10:32:22 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] python3-urllib3: Fix CVE-2026-44431
Date: Mon,  6 Jul 2026 10:31:52 -0700
Message-ID: <20260706173151.4036559-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240334

From: Sudhir Dumbhare <sudumbha@cisco.com>

Applies the upstream fix [1] referenced in [2] and addresses the
sensitive-header redirect handling issue in proxied low-level urllib3 requests.

[1] https://github.com/urllib3/urllib3/commit/5ec0de499b9166ca71c65ab04f2a7e4eb0d66fcc
[2] https://ubuntu.com/security/CVE-2026-44431

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-44431

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../python3-urllib3/CVE-2026-44431.patch      | 157 ++++++++++++++++++
 .../python/python3-urllib3_2.6.3.bb           |   4 +
 2 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch
new file mode 100644
index 0000000000..d7063b136a
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
index e63791a8f4..c8b8b5ce84 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -19,6 +19,10 @@ do_install:append() {
     fi
 }
 
+SRC_URI += " \
+    file://CVE-2026-44431.patch \
+"
+
 RDEPENDS:${PN} += "\
     python3-idna \
     python3-email \
-- 
2.35.6


