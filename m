Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C575C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 11:55:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6214.1750938922980564237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 04:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8272b03fd5=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q54jMH021319
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 11:55:22 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqanfxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 11:55:21 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 26 Jun 2025 04:55:16 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/2] python3-urllib3: fix CVE-2025-50181
Date: Thu, 26 Jun 2025 17:24:58 +0530
Message-ID: <20250626115459.686159-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: ZXytA8zEBVmyEu_6cNU9fIBaAMuAJAGW
X-Proofpoint-GUID: ZXytA8zEBVmyEu_6cNU9fIBaAMuAJAGW
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685d3529 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=PGACxGb0oCUiWzFi3T4A:9 a=s5zKW874KtQA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5OSBTYWx0ZWRfX8RpBABTGLyB+ LvDO9+d8pC5rc0gaGxC43qA5+Oz0u/p7C7JtC/3wNSXSaYpMgVBF+v+58qLIzZPK/jRyHvGAAEv /jBRO7dEjc56MiEqRxVuiUxMS3ie3i46Z2vDPU7OMj0bgvABwEm/Ooyhc7eWutK+GtOmVoAD+CN
 aklc2cTjtvOnQfSGhtL7U2LJywm0y8eWhqBYpdnMQzM4Yt9BMIcEEDjba4/iAl7XVgGvvLOCQS0 gXYntoBHrjXy61lIR+cUXCpc5dveMsMyvcYryZY0bFn/MhojnCKyEhhLKxJ1lUC7mlqvIcWh9A9 66f1f7dk4up1mmd12bP0cywH7xCauBETBIDW3pe3kPmnG7SSqY6UOfg2Y39Jj+zPJIqJi+M2UIn
 VfrTXzojqtkXKwyiL90ISAyvci5IM7brwxqCgeyM4z75SK4TaX3nr2Bd6AlWly+oOw6IiIzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506260099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 11:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219350

From: Yogita Urade <yogita.urade@windriver.com>

urllib3 is a user-friendly HTTP client library for Python. Prior to
2.5.0, it is possible to disable redirects for all requests by
instantiating a PoolManager and specifying retries in a way that
disable redirects. By default, requests and botocore users are not
affected. An application attempting to mitigate SSRF or open redirect
vulnerabilities by disabling redirects at the PoolManager level will
remain vulnerable. This issue has been patched in version 2.5.0.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-50181

Upstream patch:
https://github.com/urllib3/urllib3/commit/f05b1329126d5be6de501f9d1e3e36738bc08857

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../python3-urllib3/CVE-2025-50181.patch      | 283 ++++++++++++++++++
 .../python/python3-urllib3_2.3.0.bb           |   4 +
 2 files changed, 287 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
new file mode 100644
index 0000000000..a8cea0a020
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
@@ -0,0 +1,283 @@
+From f05b1329126d5be6de501f9d1e3e36738bc08857 Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Wed, 18 Jun 2025 16:25:01 +0300
+Subject: [PATCH] Merge commit from fork
+
+* Apply Quentin's suggestion
+
+Co-authored-by: Quentin Pradet <quentin.pradet@gmail.com>
+
+* Add tests for disabled redirects in the pool manager
+
+* Add a possible fix for the issue with not raised `MaxRetryError`
+
+* Make urllib3 handle redirects instead of JS when JSPI is used
+
+* Fix info in the new comment
+
+* State that redirects with XHR are not controlled by urllib3
+
+* Remove excessive params from new test requests
+
+* Add tests reaching max non-0 redirects
+
+* Test redirects with Emscripten
+
+* Fix `test_merge_pool_kwargs`
+
+* Add a changelog entry
+
+* Parametrize tests
+
+* Drop a fix for Emscripten
+
+* Apply Seth's suggestion to docs
+
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+
+* Use a minor release instead of the patch one
+
+---------
+
+Co-authored-by: Quentin Pradet <quentin.pradet@gmail.com>
+Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
+
+CVE: CVE-2025-50181
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/f05b1329126d5be6de501f9d1e3e36738bc08857]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ docs/reference/contrib/emscripten.rst      |   2 +-
+ dummyserver/app.py                         |   1 +
+ src/urllib3/poolmanager.py                 |  18 +++-
+ test/contrib/emscripten/test_emscripten.py |  16 ++++
+ test/test_poolmanager.py                   |   5 +-
+ test/with_dummyserver/test_poolmanager.py  | 101 +++++++++++++++++++++
+ 6 files changed, 139 insertions(+), 4 deletions(-)
+
+diff --git a/docs/reference/contrib/emscripten.rst b/docs/reference/contrib/emscripten.rst
+index 99fb20f..a8f1cda 100644
+--- a/docs/reference/contrib/emscripten.rst
++++ b/docs/reference/contrib/emscripten.rst
+@@ -65,7 +65,7 @@ Features which are usable with Emscripten support are:
+ * Timeouts
+ * Retries
+ * Streaming (with Web Workers and Cross-Origin Isolation)
+-* Redirects
++* Redirects (determined by browser/runtime, not restrictable with urllib3)
+ * Decompressing response bodies
+
+ Features which don't work with Emscripten:
+diff --git a/dummyserver/app.py b/dummyserver/app.py
+index 97b1b23..0eeb93f 100644
+--- a/dummyserver/app.py
++++ b/dummyserver/app.py
+@@ -227,6 +227,7 @@ async def encodingrequest() -> ResponseReturnValue:
+
+
+ @hypercorn_app.route("/redirect", methods=["GET", "POST", "PUT"])
++@pyodide_testing_app.route("/redirect", methods=["GET", "POST", "PUT"])
+ async def redirect() -> ResponseReturnValue:
+     "Perform a redirect to ``target``"
+     values = await request.values
+diff --git a/src/urllib3/poolmanager.py b/src/urllib3/poolmanager.py
+index 085d1db..5763fea 100644
+--- a/src/urllib3/poolmanager.py
++++ b/src/urllib3/poolmanager.py
+@@ -203,6 +203,22 @@ class PoolManager(RequestMethods):
+         **connection_pool_kw: typing.Any,
+     ) -> None:
+         super().__init__(headers)
++        if "retries" in connection_pool_kw:
++            retries = connection_pool_kw["retries"]
++            if not isinstance(retries, Retry):
++                # When Retry is initialized, raise_on_redirect is based
++                # on a redirect boolean value.
++                # But requests made via a pool manager always set
++                # redirect to False, and raise_on_redirect always ends
++                # up being False consequently.
++                # Here we fix the issue by setting raise_on_redirect to
++                # a value needed by the pool manager without considering
++                # the redirect boolean.
++                raise_on_redirect = retries is not False
++                retries = Retry.from_int(retries, redirect=False)
++                retries.raise_on_redirect = raise_on_redirect
++                connection_pool_kw = connection_pool_kw.copy()
++                connection_pool_kw["retries"] = retries
+         self.connection_pool_kw = connection_pool_kw
+
+         self.pools: RecentlyUsedContainer[PoolKey, HTTPConnectionPool]
+@@ -456,7 +472,7 @@ class PoolManager(RequestMethods):
+             kw["body"] = None
+             kw["headers"] = HTTPHeaderDict(kw["headers"])._prepare_for_method_change()
+
+-        retries = kw.get("retries")
++        retries = kw.get("retries", response.retries)
+         if not isinstance(retries, Retry):
+             retries = Retry.from_int(retries, redirect=redirect)
+
+diff --git a/test/contrib/emscripten/test_emscripten.py b/test/contrib/emscripten/test_emscripten.py
+index 9317a09..5eaa674 100644
+--- a/test/contrib/emscripten/test_emscripten.py
++++ b/test/contrib/emscripten/test_emscripten.py
+@@ -944,6 +944,22 @@ def test_retries(
+     pyodide_test(selenium_coverage, testserver_http.http_host, find_unused_port())
+
+
++def test_redirects(
++    selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
++) -> None:
++    @run_in_pyodide  # type: ignore[misc]
++    def pyodide_test(selenium_coverage: typing.Any, host: str, port: int) -> None:
++        from urllib3 import request
++
++        redirect_url = f"http://{host}:{port}/redirect"
++        response = request("GET", redirect_url)
++        assert response.status == 200
++
++    pyodide_test(
++        selenium_coverage, testserver_http.http_host, testserver_http.http_port
++    )
++
++
+ def test_insecure_requests_warning(
+     selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
+ ) -> None:
+diff --git a/test/test_poolmanager.py b/test/test_poolmanager.py
+index ab5f203..b481a19 100644
+--- a/test/test_poolmanager.py
++++ b/test/test_poolmanager.py
+@@ -379,9 +379,10 @@ class TestPoolManager:
+
+     def test_merge_pool_kwargs(self) -> None:
+         """Assert _merge_pool_kwargs works in the happy case"""
+-        p = PoolManager(retries=100)
++        retries = retry.Retry(total=100)
++        p = PoolManager(retries=retries)
+         merged = p._merge_pool_kwargs({"new_key": "value"})
+-        assert {"retries": 100, "new_key": "value"} == merged
++        assert {"retries": retries, "new_key": "value"} == merged
+
+     def test_merge_pool_kwargs_none(self) -> None:
+         """Assert false-y values to _merge_pool_kwargs result in defaults"""
+diff --git a/test/with_dummyserver/test_poolmanager.py b/test/with_dummyserver/test_poolmanager.py
+index af77241..7f163ab 100644
+--- a/test/with_dummyserver/test_poolmanager.py
++++ b/test/with_dummyserver/test_poolmanager.py
+@@ -84,6 +84,89 @@ class TestPoolManager(HypercornDummyServerTestCase):
+             assert r.status == 200
+             assert r.data == b"Dummy server!"
+
++    @pytest.mark.parametrize(
++        "retries",
++        (0, Retry(total=0), Retry(redirect=0), Retry(total=0, redirect=0)),
++    )
++    def test_redirects_disabled_for_pool_manager_with_0(
++        self, retries: typing.Literal[0] | Retry
++    ) -> None:
++        """
++        Check handling redirects when retries is set to 0 on the pool
++        manager.
++        """
++        with PoolManager(retries=retries) as http:
++            with pytest.raises(MaxRetryError):
++                http.request("GET", f"{self.base_url}/redirect")
++
++            # Setting redirect=True should not change the behavior.
++            with pytest.raises(MaxRetryError):
++                http.request("GET", f"{self.base_url}/redirect", redirect=True)
++
++            # Setting redirect=False should not make it follow the redirect,
++            # but MaxRetryError should not be raised.
++            response = http.request("GET", f"{self.base_url}/redirect", redirect=False)
++            assert response.status == 303
++
++    @pytest.mark.parametrize(
++        "retries",
++        (
++            False,
++            Retry(total=False),
++            Retry(redirect=False),
++            Retry(total=False, redirect=False),
++        ),
++    )
++    def test_redirects_disabled_for_pool_manager_with_false(
++        self, retries: typing.Literal[False] | Retry
++    ) -> None:
++        """
++        Check that setting retries set to False on the pool manager disables
++        raising MaxRetryError and redirect=True does not change the
++        behavior.
++        """
++        with PoolManager(retries=retries) as http:
++            response = http.request("GET", f"{self.base_url}/redirect")
++            assert response.status == 303
++
++            response = http.request("GET", f"{self.base_url}/redirect", redirect=True)
++            assert response.status == 303
++
++            response = http.request("GET", f"{self.base_url}/redirect", redirect=False)
++            assert response.status == 303
++
++    def test_redirects_disabled_for_individual_request(self) -> None:
++        """
++        Check handling redirects when they are meant to be disabled
++        on the request level.
++        """
++        with PoolManager() as http:
++            # Check when redirect is not passed.
++            with pytest.raises(MaxRetryError):
++                http.request("GET", f"{self.base_url}/redirect", retries=0)
++            response = http.request("GET", f"{self.base_url}/redirect", retries=False)
++            assert response.status == 303
++
++            # Check when redirect=True.
++            with pytest.raises(MaxRetryError):
++                http.request(
++                    "GET", f"{self.base_url}/redirect", retries=0, redirect=True
++                )
++            response = http.request(
++                "GET", f"{self.base_url}/redirect", retries=False, redirect=True
++            )
++            assert response.status == 303
++
++            # Check when redirect=False.
++            response = http.request(
++                "GET", f"{self.base_url}/redirect", retries=0, redirect=False
++            )
++            assert response.status == 303
++            response = http.request(
++                "GET", f"{self.base_url}/redirect", retries=False, redirect=False
++            )
++            assert response.status == 303
++
+     def test_cross_host_redirect(self) -> None:
+         with PoolManager() as http:
+             cross_host_location = f"{self.base_url_alt}/echo?a=b"
+@@ -138,6 +221,24 @@ class TestPoolManager(HypercornDummyServerTestCase):
+             pool = http.connection_from_host(self.host, self.port)
+             assert pool.num_connections == 1
+
++        # Check when retries are configured for the pool manager.
++        with PoolManager(retries=1) as http:
++            with pytest.raises(MaxRetryError):
++                http.request(
++                    "GET",
++                    f"{self.base_url}/redirect",
++                    fields={"target": f"/redirect?target={self.base_url}/"},
++                )
++
++            # Here we allow more retries for the request.
++            response = http.request(
++                "GET",
++                f"{self.base_url}/redirect",
++                fields={"target": f"/redirect?target={self.base_url}/"},
++                retries=2,
++            )
++            assert response.status == 200
++
+     def test_redirect_cross_host_remove_headers(self) -> None:
+         with PoolManager() as http:
+             r = http.request(
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
index fe913e6b73..218a226431 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
@@ -7,6 +7,10 @@ SRC_URI[sha256sum] = "f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96
 
 inherit pypi python_hatchling
 
+SRC_URI += " \
+    file://CVE-2025-50181.patch \
+"
+
 DEPENDS += " \
     python3-hatch-vcs-native \
 "
-- 
2.40.0


