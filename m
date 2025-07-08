Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6978DC83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:43:34 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.20606.1751985807705684431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A0KoOCti;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so6072308a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751985806; x=1752590606; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVtyekvjk3Xb2oHbrfTZ0NDo74yYxyK4aU0k7g04W+A=;
        b=A0KoOCti7OWtFoiBl7gon2fectTSbMbb/NkR7D+sTYm7IZL++vNtG9C5D0dRnKjCYD
         b6OCZykAkl2BqTo3ENOlke8gLANr99jRnplTtYOE+0oLeZfF3t+7zhDcUZAUExJEoEPm
         VKHJlNwOqhyiHuPj8yVa3hnYk76tEWQ/VlggvfFJIcRrItuEW7phZzz/Q2PRCwUgltJQ
         /+WheRH4kMUlnferk087sIiCAA6tpmkh0/6/jqnFXgS515yW+bf39b7jwY8HKJLFw55u
         I/qChUzaNYdfk6Ootm00MvjdQd76QnwdGE3YuCTwnxckGUaZS1ZJWpqQd9q0RjkrwJ30
         CohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985806; x=1752590606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVtyekvjk3Xb2oHbrfTZ0NDo74yYxyK4aU0k7g04W+A=;
        b=UsT2SNQIwpfNj2TYzYub8hmSrfNc9UOZRqeHl5ghMtYKUsf5u0DjnzI0N7sULFEKdl
         gYCdBGibx+57agfS3r+IsGJxeZwqs2JIQnozHmWgZDfMOcBwwyl6QGLY99kpxVAbWUar
         44DP6fyRqAV0uQK4fR3gM3Xx7geCVGRHkdIoyJYV3cGABDX2JlnD5CvnZhH+j0/SwjBl
         zqYzO6WZzpyCr7G6TqzSesIAj+eGb1J5fcmVb/ifDP6yc1poONhJoYc38+zrhvWgR5qC
         FjUMy6Rq+QDixQtnb3aWsFvCY++xSS9QtXiSG/qfQ8VJO0YSQXo/6u7uLh/WcspJmWwN
         lELw==
X-Forwarded-Encrypted: i=1; AJvYcCVgS22hH4oz2DUuYjAW/AlWmAZjVIxlGb3Q4c8tpQ2NsdZpPPDGzcHENdE4F4o+2jsrEOecztJ5A2C2J1R82++cQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy1cp7Pmkckvn5Nu1gfPUyrP7lgFenm1VucEMssN4LGbuKMNwt8
	ujc2/hjqaXhGTkn9MA+ErnJ8soBH+XNoTkTwkChQEhnK1njcd4+/bXaz
X-Gm-Gg: ASbGncvY5i+EB7iLm46DQWZtn/Aq/PkXVhVbWYp0CIp7yk+72PIHIwQO3tH74fwjUSj
	l6Qv9EMEY3wJpPZXmsr7v8sPtK0V9M88vPWa4rfXM8NwqULakh/sgktbGz3wO54idylouiHgUab
	WtXk+tQ8dSIhLMnBaMEuyYw45AmncwOyAink+EjOJbV0mc4o3ivy9iKLnvtBTPsEYVFhy93g6Hq
	7xOXFO700SA8dEY39I0rdvIvRJVrmfmdBGUyfXIfIbXeke0AQ46RkLSySfBFuyjaAPzHA2EdQZI
	REN6ef/tMrBjRzS1YKFkQ26LmOD0FTbaZy+cbR3Tq7rlOiL/w9R/L5MudSn/PtcggTbPKBZuCOS
	2pieI
X-Google-Smtp-Source: AGHT+IGtiivIiCRAkfmJlpP5VIM/zxbRGCuyHkxQCG60QBuiXeudxs6EnUd+G/qRwmU9NGu00P76qg==
X-Received: by 2002:a05:6402:42d2:b0:602:e46:638 with SMTP id 4fb4d7f45d1cf-60fd6d970b0mr14019769a12.26.1751985805175;
        Tue, 08 Jul 2025 07:43:25 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca66e566sm7293264a12.11.2025.07.08.07.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:43:24 -0700 (PDT)
Message-ID: <51bec7bc-6782-45cd-8c13-2ae3005d23d8@gmail.com>
Date: Tue, 8 Jul 2025 16:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH 1/2] python3-urllib3: fix
 CVE-2025-50181
To: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org,
 steve@sakoman.com
References: <20250704103539.265785-1-yogita.urade@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250704103539.265785-1-yogita.urade@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220043

Steve,

I see in patchwork that this patch has been also rejected, along with
its pair in the series.

If this was because of my remark about CVE-2025-50182, then I would like
to mention that my comment was only about the second patch, and I think
that this one, for CVE-2025-50181, looks correct and useful.

Thanks

On 7/4/25 12:35, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> urllib3 is a user-friendly HTTP client library for Python. Prior to
> 2.5.0, it is possible to disable redirects for all requests by
> instantiating a PoolManager and specifying retries in a way that
> disable redirects. By default, requests and botocore users are not
> affected. An application attempting to mitigate SSRF or open redirect
> vulnerabilities by disabling redirects at the PoolManager level will
> remain vulnerable. This issue has been patched in version 2.5.0.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2025-50181
>
> Upstream patch:
> https://github.com/urllib3/urllib3/commit/f05b1329126d5be6de501f9d1e3e36738bc08857
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../python3-urllib3/CVE-2025-50181.patch      | 283 ++++++++++++++++++
>  .../python/python3-urllib3_2.2.2.bb           |   4 +
>  2 files changed, 287 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
>
> diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
> new file mode 100644
> index 0000000000..d4f6e98cc1
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
> @@ -0,0 +1,283 @@
> +From f05b1329126d5be6de501f9d1e3e36738bc08857 Mon Sep 17 00:00:00 2001
> +From: Illia Volochii <illia.volochii@gmail.com>
> +Date: Wed, 18 Jun 2025 16:25:01 +0300
> +Subject: [PATCH] Merge commit from fork
> +
> +* Apply Quentin's suggestion
> +
> +Co-authored-by: Quentin Pradet <quentin.pradet@gmail.com>
> +
> +* Add tests for disabled redirects in the pool manager
> +
> +* Add a possible fix for the issue with not raised `MaxRetryError`
> +
> +* Make urllib3 handle redirects instead of JS when JSPI is used
> +
> +* Fix info in the new comment
> +
> +* State that redirects with XHR are not controlled by urllib3
> +
> +* Remove excessive params from new test requests
> +
> +* Add tests reaching max non-0 redirects
> +
> +* Test redirects with Emscripten
> +
> +* Fix `test_merge_pool_kwargs`
> +
> +* Add a changelog entry
> +
> +* Parametrize tests
> +
> +* Drop a fix for Emscripten
> +
> +* Apply Seth's suggestion to docs
> +
> +Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
> +
> +* Use a minor release instead of the patch one
> +
> +---------
> +
> +Co-authored-by: Quentin Pradet <quentin.pradet@gmail.com>
> +Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
> +
> +CVE: CVE-2025-50181
> +Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/f05b1329126d5be6de501f9d1e3e36738bc08857]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + docs/reference/contrib/emscripten.rst      |   2 +-
> + dummyserver/app.py                         |   1 +
> + src/urllib3/poolmanager.py                 |  18 +++-
> + test/contrib/emscripten/test_emscripten.py |  16 ++++
> + test/test_poolmanager.py                   |   5 +-
> + test/with_dummyserver/test_poolmanager.py  | 101 +++++++++++++++++++++
> + 6 files changed, 139 insertions(+), 4 deletions(-)
> +
> +diff --git a/docs/reference/contrib/emscripten.rst b/docs/reference/contrib/emscripten.rst
> +index 9e85629..c88e422 100644
> +--- a/docs/reference/contrib/emscripten.rst
> ++++ b/docs/reference/contrib/emscripten.rst
> +@@ -68,7 +68,7 @@ Features which are usable with Emscripten support are:
> + * Timeouts
> + * Retries
> + * Streaming (with Web Workers and Cross-Origin Isolation)
> +-* Redirects
> ++* Redirects (determined by browser/runtime, not restrictable with urllib3)
> + * Decompressing response bodies
> +
> + Features which don't work with Emscripten:
> +diff --git a/dummyserver/app.py b/dummyserver/app.py
> +index 9fc9d1b..96e0dab 100644
> +--- a/dummyserver/app.py
> ++++ b/dummyserver/app.py
> +@@ -228,6 +228,7 @@ async def encodingrequest() -> ResponseReturnValue:
> +
> +
> + @hypercorn_app.route("/redirect", methods=["GET", "POST", "PUT"])
> ++@pyodide_testing_app.route("/redirect", methods=["GET", "POST", "PUT"])
> + async def redirect() -> ResponseReturnValue:
> +     "Perform a redirect to ``target``"
> +     values = await request.values
> +diff --git a/src/urllib3/poolmanager.py b/src/urllib3/poolmanager.py
> +index 085d1db..5763fea 100644
> +--- a/src/urllib3/poolmanager.py
> ++++ b/src/urllib3/poolmanager.py
> +@@ -203,6 +203,22 @@ class PoolManager(RequestMethods):
> +         **connection_pool_kw: typing.Any,
> +     ) -> None:
> +         super().__init__(headers)
> ++        if "retries" in connection_pool_kw:
> ++            retries = connection_pool_kw["retries"]
> ++            if not isinstance(retries, Retry):
> ++                # When Retry is initialized, raise_on_redirect is based
> ++                # on a redirect boolean value.
> ++                # But requests made via a pool manager always set
> ++                # redirect to False, and raise_on_redirect always ends
> ++                # up being False consequently.
> ++                # Here we fix the issue by setting raise_on_redirect to
> ++                # a value needed by the pool manager without considering
> ++                # the redirect boolean.
> ++                raise_on_redirect = retries is not False
> ++                retries = Retry.from_int(retries, redirect=False)
> ++                retries.raise_on_redirect = raise_on_redirect
> ++                connection_pool_kw = connection_pool_kw.copy()
> ++                connection_pool_kw["retries"] = retries
> +         self.connection_pool_kw = connection_pool_kw
> +
> +         self.pools: RecentlyUsedContainer[PoolKey, HTTPConnectionPool]
> +@@ -456,7 +472,7 @@ class PoolManager(RequestMethods):
> +             kw["body"] = None
> +             kw["headers"] = HTTPHeaderDict(kw["headers"])._prepare_for_method_change()
> +
> +-        retries = kw.get("retries")
> ++        retries = kw.get("retries", response.retries)
> +         if not isinstance(retries, Retry):
> +             retries = Retry.from_int(retries, redirect=redirect)
> +
> +diff --git a/test/contrib/emscripten/test_emscripten.py b/test/contrib/emscripten/test_emscripten.py
> +index 17264d8..0e107fa 100644
> +--- a/test/contrib/emscripten/test_emscripten.py
> ++++ b/test/contrib/emscripten/test_emscripten.py
> +@@ -949,6 +949,22 @@ def test_retries(
> +     pyodide_test(selenium_coverage, testserver_http.http_host, find_unused_port())
> +
> +
> ++def test_redirects(
> ++    selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
> ++) -> None:
> ++    @run_in_pyodide  # type: ignore[misc]
> ++    def pyodide_test(selenium_coverage: typing.Any, host: str, port: int) -> None:
> ++        from urllib3 import request
> ++
> ++        redirect_url = f"http://{host}:{port}/redirect"
> ++        response = request("GET", redirect_url)
> ++        assert response.status == 200
> ++
> ++    pyodide_test(
> ++        selenium_coverage, testserver_http.http_host, testserver_http.http_port
> ++    )
> ++
> ++
> + @install_urllib3_wheel()
> + def test_insecure_requests_warning(
> +     selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
> +diff --git a/test/test_poolmanager.py b/test/test_poolmanager.py
> +index ab5f203..b481a19 100644
> +--- a/test/test_poolmanager.py
> ++++ b/test/test_poolmanager.py
> +@@ -379,9 +379,10 @@ class TestPoolManager:
> +
> +     def test_merge_pool_kwargs(self) -> None:
> +         """Assert _merge_pool_kwargs works in the happy case"""
> +-        p = PoolManager(retries=100)
> ++        retries = retry.Retry(total=100)
> ++        p = PoolManager(retries=retries)
> +         merged = p._merge_pool_kwargs({"new_key": "value"})
> +-        assert {"retries": 100, "new_key": "value"} == merged
> ++        assert {"retries": retries, "new_key": "value"} == merged
> +
> +     def test_merge_pool_kwargs_none(self) -> None:
> +         """Assert false-y values to _merge_pool_kwargs result in defaults"""
> +diff --git a/test/with_dummyserver/test_poolmanager.py b/test/with_dummyserver/test_poolmanager.py
> +index af77241..7f163ab 100644
> +--- a/test/with_dummyserver/test_poolmanager.py
> ++++ b/test/with_dummyserver/test_poolmanager.py
> +@@ -84,6 +84,89 @@ class TestPoolManager(HypercornDummyServerTestCase):
> +             assert r.status == 200
> +             assert r.data == b"Dummy server!"
> +
> ++    @pytest.mark.parametrize(
> ++        "retries",
> ++        (0, Retry(total=0), Retry(redirect=0), Retry(total=0, redirect=0)),
> ++    )
> ++    def test_redirects_disabled_for_pool_manager_with_0(
> ++        self, retries: typing.Literal[0] | Retry
> ++    ) -> None:
> ++        """
> ++        Check handling redirects when retries is set to 0 on the pool
> ++        manager.
> ++        """
> ++        with PoolManager(retries=retries) as http:
> ++            with pytest.raises(MaxRetryError):
> ++                http.request("GET", f"{self.base_url}/redirect")
> ++
> ++            # Setting redirect=True should not change the behavior.
> ++            with pytest.raises(MaxRetryError):
> ++                http.request("GET", f"{self.base_url}/redirect", redirect=True)
> ++
> ++            # Setting redirect=False should not make it follow the redirect,
> ++            # but MaxRetryError should not be raised.
> ++            response = http.request("GET", f"{self.base_url}/redirect", redirect=False)
> ++            assert response.status == 303
> ++
> ++    @pytest.mark.parametrize(
> ++        "retries",
> ++        (
> ++            False,
> ++            Retry(total=False),
> ++            Retry(redirect=False),
> ++            Retry(total=False, redirect=False),
> ++        ),
> ++    )
> ++    def test_redirects_disabled_for_pool_manager_with_false(
> ++        self, retries: typing.Literal[False] | Retry
> ++    ) -> None:
> ++        """
> ++        Check that setting retries set to False on the pool manager disables
> ++        raising MaxRetryError and redirect=True does not change the
> ++        behavior.
> ++        """
> ++        with PoolManager(retries=retries) as http:
> ++            response = http.request("GET", f"{self.base_url}/redirect")
> ++            assert response.status == 303
> ++
> ++            response = http.request("GET", f"{self.base_url}/redirect", redirect=True)
> ++            assert response.status == 303
> ++
> ++            response = http.request("GET", f"{self.base_url}/redirect", redirect=False)
> ++            assert response.status == 303
> ++
> ++    def test_redirects_disabled_for_individual_request(self) -> None:
> ++        """
> ++        Check handling redirects when they are meant to be disabled
> ++        on the request level.
> ++        """
> ++        with PoolManager() as http:
> ++            # Check when redirect is not passed.
> ++            with pytest.raises(MaxRetryError):
> ++                http.request("GET", f"{self.base_url}/redirect", retries=0)
> ++            response = http.request("GET", f"{self.base_url}/redirect", retries=False)
> ++            assert response.status == 303
> ++
> ++            # Check when redirect=True.
> ++            with pytest.raises(MaxRetryError):
> ++                http.request(
> ++                    "GET", f"{self.base_url}/redirect", retries=0, redirect=True
> ++                )
> ++            response = http.request(
> ++                "GET", f"{self.base_url}/redirect", retries=False, redirect=True
> ++            )
> ++            assert response.status == 303
> ++
> ++            # Check when redirect=False.
> ++            response = http.request(
> ++                "GET", f"{self.base_url}/redirect", retries=0, redirect=False
> ++            )
> ++            assert response.status == 303
> ++            response = http.request(
> ++                "GET", f"{self.base_url}/redirect", retries=False, redirect=False
> ++            )
> ++            assert response.status == 303
> ++
> +     def test_cross_host_redirect(self) -> None:
> +         with PoolManager() as http:
> +             cross_host_location = f"{self.base_url_alt}/echo?a=b"
> +@@ -138,6 +221,24 @@ class TestPoolManager(HypercornDummyServerTestCase):
> +             pool = http.connection_from_host(self.host, self.port)
> +             assert pool.num_connections == 1
> +
> ++        # Check when retries are configured for the pool manager.
> ++        with PoolManager(retries=1) as http:
> ++            with pytest.raises(MaxRetryError):
> ++                http.request(
> ++                    "GET",
> ++                    f"{self.base_url}/redirect",
> ++                    fields={"target": f"/redirect?target={self.base_url}/"},
> ++                )
> ++
> ++            # Here we allow more retries for the request.
> ++            response = http.request(
> ++                "GET",
> ++                f"{self.base_url}/redirect",
> ++                fields={"target": f"/redirect?target={self.base_url}/"},
> ++                retries=2,
> ++            )
> ++            assert response.status == 200
> ++
> +     def test_redirect_cross_host_remove_headers(self) -> None:
> +         with PoolManager() as http:
> +             r = http.request(
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> index 31a03a60b3..bdb1c7ca8d 100644
> --- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> +++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> @@ -7,6 +7,10 @@ SRC_URI[sha256sum] = "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f
>  
>  inherit pypi python_hatchling
>  
> +SRC_URI += " \
> +    file://CVE-2025-50181.patch \
> +"
> +
>  RDEPENDS:${PN} += "\
>      python3-certifi \
>      python3-cryptography \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219914): https://lists.openembedded.org/g/openembedded-core/message/219914
> Mute This Topic: https://lists.openembedded.org/mt/113981494/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


