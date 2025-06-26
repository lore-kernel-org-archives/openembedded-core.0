Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7CCC7EE32
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 11:55:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6271.1750938935503744895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 04:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8272b03fd5=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q2JUJW019364
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 04:55:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mn7y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 04:55:34 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 26 Jun 2025 04:55:18 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 2/2] python3-urllib3: fix CVE-2025-50182
Date: Thu, 26 Jun 2025 17:24:59 +0530
Message-ID: <20250626115459.686159-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250626115459.686159-1-yogita.urade@windriver.com>
References: <20250626115459.686159-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEwMCBTYWx0ZWRfXxRJWOjqvsKN9 n2it+B79kYWpDPFtDy6XeZV1GaPGhV2NYL6LV6dziiEWwBWcZ4P9QoAv8tP33ieraoEZFN18i62 O69bugHU8ORVfqg8CI3N/T1yTdD6pwp25OgV1Ppw21hUgwJhpZ2GsW6SN935sPWd/w2L1AuMjnZ
 c526FzaRSXxMj7T8b8tDSoDaArnscPIXqv+u+XtF+JkXjt5koTZv9q/7sEPLPX5qcIHUvsCtBqx wQ4wSZ50AeTPcv0O4ptgF61T0Xo8JuF9cODFz7FhGnaxzq0EDnuUKlmYWuKmx7fCW10kNUuZnmU uxBo2tGYEsAfR7jLrrxdXaQGOi2RWRgErQW+KfBcbHUZ5LIBA6iXsWk1lwbOWjsCG0S8+aLK7P8
 QKEkElYCLmF9qY4DjoQYU+mEH3V2wy9tE9SH57/o3Xo3txIewL5BQBKCSp+EddRKZQgCLmY0
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685d3536 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=uPZiAMpXAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=nmZd6mofGopSOf_wKBoA:9 a=s5zKW874KtQA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Q5KkinmHQz5_D2p1gzxbEPxjhG_A3spS
X-Proofpoint-ORIG-GUID: Q5KkinmHQz5_D2p1gzxbEPxjhG_A3spS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506260100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 11:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219351

From: Yogita Urade <yogita.urade@windriver.com>

urllib3 is a user-friendly HTTP client library for Python. Prior
to 2.5.0, urllib3 does not control redirects in browsers and
Node.js. urllib3 supports being used in a Pyodide runtime utilizing
the JavaScript Fetch API or falling back on XMLHttpRequest. This
means Python libraries can be used to make HTTP requests from a
browser or Node.js. Additionally, urllib3 provides a mechanism to
control redirects, but the retries and redirect parameters are
ignored with Pyodide; the runtime itself determines redirect
behavior. This issue has been patched in version 2.5.0.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-50182

Upstream patch:
https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../python3-urllib3/CVE-2025-50182.patch      | 125 ++++++++++++++++++
 .../python/python3-urllib3_2.3.0.bb           |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
new file mode 100644
index 0000000000..2f6ba478d5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
@@ -0,0 +1,125 @@
+From 7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Wed, 18 Jun 2025 16:30:35 +0300
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2025-50182
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ docs/reference/contrib/emscripten.rst      |  2 +-
+ src/urllib3/contrib/emscripten/fetch.py    | 20 ++++++++++
+ test/contrib/emscripten/test_emscripten.py | 46 ++++++++++++++++++++++
+ 3 files changed, 67 insertions(+), 1 deletion(-)
+
+diff --git a/docs/reference/contrib/emscripten.rst b/docs/reference/contrib/emscripten.rst
+index a8f1cda..4670757 100644
+--- a/docs/reference/contrib/emscripten.rst
++++ b/docs/reference/contrib/emscripten.rst
+@@ -65,7 +65,7 @@ Features which are usable with Emscripten support are:
+ * Timeouts
+ * Retries
+ * Streaming (with Web Workers and Cross-Origin Isolation)
+-* Redirects (determined by browser/runtime, not restrictable with urllib3)
++* Redirects (urllib3 controls redirects in Node.js but not in browsers where behavior is determined by runtime)
+ * Decompressing response bodies
+
+ Features which don't work with Emscripten:
+diff --git a/src/urllib3/contrib/emscripten/fetch.py b/src/urllib3/contrib/emscripten/fetch.py
+index a514306..6695821 100644
+--- a/src/urllib3/contrib/emscripten/fetch.py
++++ b/src/urllib3/contrib/emscripten/fetch.py
+@@ -573,6 +573,11 @@ def send_jspi_request(
+         "method": request.method,
+         "signal": js_abort_controller.signal,
+     }
++    # Node.js returns the whole response (unlike opaqueredirect in browsers),
++    # so urllib3 can set `redirect: manual` to control redirects itself.
++    # https://stackoverflow.com/a/78524615
++    if _is_node_js():
++        fetch_data["redirect"] = "manual"
+     # Call JavaScript fetch (async api, returns a promise)
+     fetcher_promise_js = js.fetch(request.url, _obj_from_dict(fetch_data))
+     # Now suspend WebAssembly until we resolve that promise
+@@ -693,6 +698,21 @@ def has_jspi() -> bool:
+         return False
+
+
++def _is_node_js() -> bool:
++    """
++    Check if we are in Node.js.
++
++    :return: True if we are in Node.js.
++    :rtype: bool
++    """
++    return (
++        hasattr(js, "process")
++        and hasattr(js.process, "release")
++        # According to the Node.js documentation, the release name is always "node".
++        and js.process.release.name == "node"
++    )
++
++
+ def streaming_ready() -> bool | None:
+     if _fetcher:
+         return _fetcher.streaming_ready
+diff --git a/test/contrib/emscripten/test_emscripten.py b/test/contrib/emscripten/test_emscripten.py
+index 5eaa674..fbf89fc 100644
+--- a/test/contrib/emscripten/test_emscripten.py
++++ b/test/contrib/emscripten/test_emscripten.py
+@@ -960,6 +960,52 @@ def test_redirects(
+     )
+
+
++@pytest.mark.with_jspi
++def test_disabled_redirects(
++    selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
++) -> None:
++    """
++    Test that urllib3 can control redirects in Node.js.
++    """
++
++    @run_in_pyodide  # type: ignore[misc]
++    def pyodide_test(selenium_coverage: typing.Any, host: str, port: int) -> None:
++        import pytest
++
++        from urllib3 import PoolManager, request
++        from urllib3.contrib.emscripten.fetch import _is_node_js
++        from urllib3.exceptions import MaxRetryError
++
++        if not _is_node_js():
++            pytest.skip("urllib3 does not control redirects in browsers.")
++
++        redirect_url = f"http://{host}:{port}/redirect"
++
++        with PoolManager(retries=0) as http:
++            with pytest.raises(MaxRetryError):
++                http.request("GET", redirect_url)
++
++            response = http.request("GET", redirect_url, redirect=False)
++            assert response.status == 303
++
++        with PoolManager(retries=False) as http:
++            response = http.request("GET", redirect_url)
++            assert response.status == 303
++
++        with pytest.raises(MaxRetryError):
++            request("GET", redirect_url, retries=0)
++
++        response = request("GET", redirect_url, redirect=False)
++        assert response.status == 303
++
++        response = request("GET", redirect_url, retries=0, redirect=False)
++        assert response.status == 303
++
++    pyodide_test(
++        selenium_coverage, testserver_http.http_host, testserver_http.http_port
++    )
++
++
+ def test_insecure_requests_warning(
+     selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
+ ) -> None:
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
index 218a226431..c5e3751255 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
@@ -9,6 +9,7 @@ inherit pypi python_hatchling
 
 SRC_URI += " \
     file://CVE-2025-50181.patch \
+    file://CVE-2025-50182.patch \
 "
 
 DEPENDS += " \
-- 
2.40.0


