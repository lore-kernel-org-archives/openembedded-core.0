Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582F7C8303C
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:51 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.5572.1752029504392656975
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hGnAeZGf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-236377f00a1so46490785ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029504; x=1752634304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLfySM3wJyXl41L97fvO9hJow3IFh6MgYF0ZdZfhKjw=;
        b=hGnAeZGf88DTRHqARenOpFGmd6vUjBSHSL7aazvnLxdTZaM/I7cRIgLkoVb9/Oubxb
         nlZZa+HZtmsTQNFmL0+QWwPpwz2pXgmGGytR32BFOOlGni3uI2X8xRa2GGpkr7mgNeB7
         tEHstxVEwHJ1s9UAqD+g2I8Bt+7n1SodjyOI4OFaA7DBDVF03DVEbSckl5bTCyc6ANuL
         372ZRqNa77P7F50HSUs0wz9ynBOfiqqEW/BtaZOyBfycLlyetGFXqHj88XUFzK7EMWr1
         MQyAgbQs1azitbyTouqDrGW4tfeBEyNpdgpGxphFAoyB0JpC0ylVSguSbg3AafQxjkqv
         ot6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029504; x=1752634304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLfySM3wJyXl41L97fvO9hJow3IFh6MgYF0ZdZfhKjw=;
        b=j0VXRUvigFk0PgVO/Spg82jZfnOEgHp8Q5Nn0g0yd+fqyoh7KyouYFDGEF+IIA25Iz
         bQGM6aAfTezmM16v74mR/tHCKYLro+v0Ws70vHsWkT29uI+yXEyqrdDB7k1XhdRKNhuR
         5fr1cC1gYQ4YEBJZDvhgO4Gxtihw3se+COEahqFvAAqUMuG5A5wh/pTkinLrSHO3ZvJM
         l0uso7tiCNk6HG9e9r6+GdMTZHCRTdKRZPvNt/hUJMEkGSl8NYqzpWatNDaiD/57Iyeo
         uVDjbSqFjvyayKfg2hH0ij1LUmIgJ08ObZ57VJwFxTXohQ+TiWDoZfxssHz9sv54PEht
         ZYhA==
X-Gm-Message-State: AOJu0Yxm0exUiP6l/0/rrMe2MXlAhI1KruEUgQ8luPNYxLybBS8zr7oP
	+EeWfDwgck35cY1loLFfQqBTT+gsKIdEh2YZzAwLIt6/gtr3zgSuwd0RS1juyDcXjHykMYfMSNE
	GdezF
X-Gm-Gg: ASbGncvF6k5zNwuJwuTXph4rCbD1NUsmFAC/DCKESCYjT4pF07KLptdnK+bfW+CAwKQ
	DzD3325B3iuLHg8MnjoK5wTDulrXgWCckFdbQJVwAaJ05mPYIaxQ5aDE0wfxfu5kcFQgc6I3htb
	TXpy8T64AgQ1cuL6SnlowIZn9nbyskLvDCzhQGsNPpmsiiFGOkEsGZxm9GqTZMqDDzvtN3RvCIt
	jqIQOR2Db+/5mNpX0fF8Y1aHEymwyqgzsXj1iDoj0bCP1vKE3FQ2YI0NAW4SVUMv3zmcQVPgVfl
	qU4DJt+6qgLnGKxQ8aYhef7tfVTKqZWZXrgITBkSOai0Nsr12BXD7A==
X-Google-Smtp-Source: AGHT+IHZbeLEIya/4LH/AunzOHoQudujE8ZCj9LtEUkR1yJlsCWfsW90yhiuEhWEyg6ekch4b2ed3A==
X-Received: by 2002:a17:903:124a:b0:234:a139:11fb with SMTP id d9443c01a7336-23ddb312533mr14211385ad.27.1752029503531;
        Tue, 08 Jul 2025 19:51:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/12] python3-urllib3: fix CVE-2025-50181
Date: Tue,  8 Jul 2025 19:51:19 -0700
Message-ID: <cf10eafb333daf8acfd3b8bfcb42c1fe6c26a8a5.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752029282.git.steve@sakoman.com>
References: <cover.1752029282.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220065

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
 .../python/python3-urllib3_2.2.2.bb           |   4 +
 2 files changed, 287 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
new file mode 100644
index 0000000000..d4f6e98cc1
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
+index 9e85629..c88e422 100644
+--- a/docs/reference/contrib/emscripten.rst
++++ b/docs/reference/contrib/emscripten.rst
+@@ -68,7 +68,7 @@ Features which are usable with Emscripten support are:
+ * Timeouts
+ * Retries
+ * Streaming (with Web Workers and Cross-Origin Isolation)
+-* Redirects
++* Redirects (determined by browser/runtime, not restrictable with urllib3)
+ * Decompressing response bodies
+
+ Features which don't work with Emscripten:
+diff --git a/dummyserver/app.py b/dummyserver/app.py
+index 9fc9d1b..96e0dab 100644
+--- a/dummyserver/app.py
++++ b/dummyserver/app.py
+@@ -228,6 +228,7 @@ async def encodingrequest() -> ResponseReturnValue:
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
+index 17264d8..0e107fa 100644
+--- a/test/contrib/emscripten/test_emscripten.py
++++ b/test/contrib/emscripten/test_emscripten.py
+@@ -949,6 +949,22 @@ def test_retries(
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
+ @install_urllib3_wheel()
+ def test_insecure_requests_warning(
+     selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
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
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
index 31a03a60b3..bdb1c7ca8d 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -7,6 +7,10 @@ SRC_URI[sha256sum] = "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f
 
 inherit pypi python_hatchling
 
+SRC_URI += " \
+    file://CVE-2025-50181.patch \
+"
+
 RDEPENDS:${PN} += "\
     python3-certifi \
     python3-cryptography \
-- 
2.43.0


