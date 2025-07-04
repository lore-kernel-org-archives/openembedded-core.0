Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04BBC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:29:08 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.14857.1751642947385086911
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jtpMAR2d;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7490acf57b9so845398b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751642946; x=1752247746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+rntfSZnTEPOC87os16XidX80sbGb8hHFq8WXEf9mQ=;
        b=jtpMAR2dj9rVa6jKdfHTlhr9a69czm4syQDJsRzZG6Ao1Hg1zXDQd7dg0c8k5oYmre
         ahGYA9+dtL5aFZSJ1Kjvgd8ADPWPFnI9yDqDQuktZvbDfylAXv07hCDxSLdud0+Zd7vA
         /sc/i+wB5pzqLnhoP89v4XwIIu2vXe+uP1AFgA6bZ1CO5TeXY6TAt9fIjR3DGGID6NBA
         GwXe1SBcyjMN42086sy28BRErHXzIKKuPq5uzpAhWH1wiNj+HFExribBZvfwCKSKdL44
         lM8qOh9BqUGmz6jOPQhcjKzVAj/y6Ojxa3BA1xIJSK0llnsXnrISOWyJoh3orK3qyHMA
         A5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642946; x=1752247746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+rntfSZnTEPOC87os16XidX80sbGb8hHFq8WXEf9mQ=;
        b=IPZDVR9GNJY/oKMWdD9HXHOBENslcpyME8Q35kxmsquo5oLp98cxPV5GBxoe3355yg
         9SII04Zpcn33YtBDiHz1Sv/UmnzLRF/ZjjSqIiEImQo2VgDob6FpoRUnKdXAcy0GcERy
         GlwnDhYtWBDff7w8eR2kMPIJ91i9K1b0gLtYzL3OTWGZeUuWRXMoVFfpSUEkWR1MrvQl
         b2FkqeMOc5oWMhabypLbOh1HUsSlNShIQaGf6hwvM+YrXcit1L/T3qAY2jdTPMIwSnXY
         /zqKh0jM9xjrEhxZRvp3vw9hIZW4dL8nz18ljOyevWHaslND5quKMHGV/e24CpPQLZiF
         0Ktg==
X-Gm-Message-State: AOJu0YyARDyxQb/jifCFON2q1J2U3qUONOalWC4/Ft0z95uTNO1STJIX
	+6t9h+c99qIuqJ8Rmx8nEoYp+09tBnKvvfXm66riUjaSBIt4ZZ0ghPJ03jZ/lNyQA11yL8Du5Bj
	+dhyi
X-Gm-Gg: ASbGncuSRByKDtt/z2Zo5nGJrv7ea7XFzqMJe+qmslmu61AmSbA8woMaLLLcxTddQ1/
	uTtffZGyVK3omLmZm6PoFAIM83x1+wWFpM4IwY0+Uy3T5m/CvHSBLIekzIMaDBb2npXp50ZE0XD
	AAuRb2GEeMYUBEA1hx0KKkLGZ9oVaa+jP/PGMOmqz0gQrauvL5/JQ3QfTOSUYHlXIhxuXI5jy2a
	RPvcu+iRN5LDZ4rxbRyUyzs+np4Nx2vim2Oz3LRBk8NSdQdlpdYWApgV0TJq5J2QZavsUVG9naH
	0U+xK7+kJIiskTEVMHtygR2WmqHEJLQttMAbRV+nzydjYQLDuYj7Jw==
X-Google-Smtp-Source: AGHT+IHPihw/VZUmq41mzf4xj7giQL3G2Pcn/VFlJJosP6UrItLWUzYWIamN/D47yjFELVgssxLgqA==
X-Received: by 2002:a05:6a00:3a28:b0:749:156e:f2ff with SMTP id d2e1a72fcca58-74ce64184e6mr4660618b3a.7.1751642946437;
        Fri, 04 Jul 2025 08:29:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a1ca0sm2424232b3a.138.2025.07.04.08.29.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:29:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] python3-urllib3: fix CVE-2025-50181
Date: Fri,  4 Jul 2025 08:28:49 -0700
Message-ID: <574146765ea3f9b36532abf4ebc8bd2976396f0b.1751641924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641924.git.steve@sakoman.com>
References: <cover.1751641924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219942

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
 .../python3-urllib3/CVE-2025-50181.patch      | 214 ++++++++++++++++++
 .../python/python3-urllib3_1.26.18.bb         |   4 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
new file mode 100644
index 0000000000..61bdcc3e62
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
@@ -0,0 +1,214 @@
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
+Changes:
+- skip docs/reference/contrib/emscripten.rst, dummyserver/app.py and
+test/contrib/emscripten/test_emscripten.py files which are not presented.
+
+CVE: CVE-2025-50181
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/f05b1329126d5be6de501f9d1e3e36738bc08857]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/urllib3/poolmanager.py                |  18 +++-
+ test/with_dummyserver/test_poolmanager.py | 101 ++++++++++++++++++++++
+ 2 files changed, 118 insertions(+), 1 deletion(-)
+
+diff --git a/src/urllib3/poolmanager.py b/src/urllib3/poolmanager.py
+index fb51bf7..a8de7c6 100644
+--- a/src/urllib3/poolmanager.py
++++ b/src/urllib3/poolmanager.py
+@@ -170,6 +170,22 @@ class PoolManager(RequestMethods):
+
+     def __init__(self, num_pools=10, headers=None, **connection_pool_kw):
+         RequestMethods.__init__(self, headers)
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
+         self.pools = RecentlyUsedContainer(num_pools)
+
+@@ -389,7 +405,7 @@ class PoolManager(RequestMethods):
+             kw["body"] = None
+             kw["headers"] = HTTPHeaderDict(kw["headers"])._prepare_for_method_change()
+
+-        retries = kw.get("retries")
++        retries = kw.get("retries", response.retries)
+         if not isinstance(retries, Retry):
+             retries = Retry.from_int(retries, redirect=redirect)
+
+diff --git a/test/with_dummyserver/test_poolmanager.py b/test/with_dummyserver/test_poolmanager.py
+index 509daf2..f84f169 100644
+--- a/test/with_dummyserver/test_poolmanager.py
++++ b/test/with_dummyserver/test_poolmanager.py
+@@ -82,6 +82,89 @@ class TestPoolManager(HTTPDummyServerTestCase):
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
+     def test_cross_host_redirect(self):
+         with PoolManager() as http:
+             cross_host_location = "%s/echo?a=b" % self.base_url_alt
+@@ -136,6 +219,24 @@ class TestPoolManager(HTTPDummyServerTestCase):
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
+     def test_redirect_cross_host_remove_headers(self):
+         with PoolManager() as http:
+             r = http.request(
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
index d384b5eb2f..b26c9ad2fa 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
@@ -7,6 +7,10 @@ SRC_URI[sha256sum] = "f8ecc1bba5667413457c529ab955bf8c67b45db799d159066261719e32
 
 inherit pypi setuptools3
 
+SRC_URI += " \
+    file://CVE-2025-50181.patch \
+"
+
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-certifi \
     ${PYTHON_PN}-cryptography \
-- 
2.43.0


