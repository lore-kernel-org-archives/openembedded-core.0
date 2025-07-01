Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB708C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:23 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.10922.1751377099063489485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0YuwYTUq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso4738059a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377098; x=1751981898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvGtmwQmLsBQXj+t9m9mMnglLO8sQ2taEy3HBceBgt4=;
        b=0YuwYTUq85y3DTgC5w415NhQbafNXdOqpFM5WwuP8nrMldzNwzFPCthCSH3J40f635
         W6R127ChHBzsAMFT1DwvTkjdojNhGHT41Zp2xhtCGQhXYLhfeSgJJRZ8ayNPmvxTYlJF
         TfahQb32TQh6ySwksJma5LXWRdBgNxEPqqdBZLDLN6cHWEHRqdSBB/6eX8OLySTTCQYD
         8VPmCfSQcvY8/o4W6bP02BhEbaWJpscIjFuD5SpTR1dE5+6rkA2PbBswBE5vIncL0tJJ
         Yv3hi/X7J1dPoEKRDDk2nX3PjGmDON6z7H5w/PACIutw4WznlyAeIBbwg0IdH0wTtfvD
         Gedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377098; x=1751981898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvGtmwQmLsBQXj+t9m9mMnglLO8sQ2taEy3HBceBgt4=;
        b=aDzLrbUIBvJQXivwZXe6fY0BoECsxHvQNHYfosyCAoB+qXW2LJHxy3XGGapvvBtKzw
         UAiVlX5XWgRPNq757C49RtTMsaTw/GH5ZPnutygJxVfPlZTqDZ3BdpLFy7WCJ4JWgJp1
         NcqRrM3j3OmJnkMOEZKAdqw8ivbuqUBPIDgwWtDVfJuggLZqB5l0S3Myh8usm8FFxS4x
         okuNoXH5yf7x7qxkSGW/eE9BZRpMYOn08yFPsY0pFJbfQa/ZFpQADkzUiiQ+A3fOhiWw
         F/tJdVbWKYojJA0vkSv1R2dGrD5sSUTXUEo7ZedJBpnYGIfaX6X2Ndy1RrrbEQyQAI4/
         4hug==
X-Gm-Message-State: AOJu0YyQyvMO5ADJGJxUIS2siREJnsdkwGfqcbw5D/7icYiSvMXbU5VE
	QfhUeaUFrNecE3dGaRkvIEIeu97BDbOMPOADK8SqUbhOf+2gv1WSe3meiVs1JJT8Ltub9dI918M
	fVLPb
X-Gm-Gg: ASbGnct2Q8UGkCcFi0pNlno2WUzwa+Iforh9O+UpWRXpwMA5fP+SUnar+oVeRQbOFgo
	4OkUQ4D3F5moDx/Dwkdo9HrNyC7nb5nBKmcOFzuCIrSrMgdvkS2nBMqNGKV+WMxi3G66JYxftvN
	FyARwbEs3dkuDJyYhK4vbsPR3nqwfgmFxG584r74op6Iao5MSoH7fbfnZhJkGyfHhNd3p8zg8e+
	vkK6atPG/IVL21TXLevufln0H8xLFJ1BywGOjfc+T/fBdIucPCLZPSLojiFTgSq56cUElrVGVSs
	k9a/ED/pGhiHXSx5NLb+Uic8gakrLJtuaBumdzAFHN9c++cyqAlopA==
X-Google-Smtp-Source: AGHT+IES1whkIZitP3idr6RFaP7TaQUZWetjuuUWp6A9g/aG06HAXWsZEIfSxW5/4/oCY1vXR9a+3g==
X-Received: by 2002:a17:90b:2785:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-318c8ed8542mr31418179a91.12.1751377097755;
        Tue, 01 Jul 2025 06:38:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/11] python3-urllib3: fix CVE-2025-50181
Date: Tue,  1 Jul 2025 06:37:59 -0700
Message-ID: <819273b5b8b9279c01035cb72377fd8cbb51a198.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219572

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


