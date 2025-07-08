Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94F1C83F0A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 15:56:34 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.22361.1751990186810129155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 08:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hpqnHLsi;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e77831d68so40066997b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 08:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751990186; x=1752594986; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81/Kn3Kp1KAGMSiD/FXPhdUp7JqjBk92LoOeL26Xaoo=;
        b=hpqnHLsi+hqbHhTGP9L+LKk7mizHWK/p0x6CA+BI3iwZEOZKoroXipRyPe6zBrJ4Xi
         AHv3ERpnY8yQyA169g4cHN9ZLAAep4/8y2Hm/JJljaY++CMZ6HiiKMuePGLUS3UTw513
         +OzLSzmy/TjQs0/ZLj+pEvxyDtycGJHfTYLSOnfxa7dg+tFsBtSYmU9uv1ZlXgfJbxkP
         fjxMFyEdQAQsdYEtLJGfz/S3J4v9HEDsSuuYWYIH96ccYsqb+u+FxgQjIhQWTwOly7kW
         f8ZDlxBsJqFQHk08/SNIZGb+1vwO64Qugt4gL41boFNL81qQ9DIxJybFIABYVgrYVeH6
         5s3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751990186; x=1752594986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81/Kn3Kp1KAGMSiD/FXPhdUp7JqjBk92LoOeL26Xaoo=;
        b=tjHQ2NRcQk031UMB+DiBNsgaRi7Nh2ds2QDM8lhuhb5OZPTSvjGBQ/19ufp8Yf8WwV
         2QhNQfyp2d3A2VDMhAfsMDCRZq3Bl5VZdR9PhGRZsca4uCWg03p0vp8yieqjJKsZjei9
         mdSFLpMs3w2AJOCyJ5de4P/+8dkLe7TdZiXCJmuQCIFyXyLtszN8PZAUHroOwBMr4Gu9
         sVG2vxW8jjD8p2hPKzhudjoHDp9Zy6xENBJID72eUScDP4wE4I3r0Yltce/ozTg17o0y
         1OUy33rIdGcox2UvVxH/DcnmawCdarpgIFARiyODmpwll8d+o9i4hFbm69kktceBD2+K
         S2DA==
X-Forwarded-Encrypted: i=1; AJvYcCVck39sr/yU64zysXH/ONNCEQc5rIs7So2rCRqeliJFYEBXGdSW6kaRXm67wjK3AntR9ktsHwuF4sCZCytesd65ig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtwhCAAtUEN1sQmRUqW672h499E0V6thvUJCiiHhVrwKGZs73z
	7YyMbMVwNLW9yYMnYVzejJULEj2l2UTywfUVj3c1aQowBouwXWh2LqWOguyARHdyu4BuWwO0UEY
	Sjzq5587aHocRrivN+TV+cqm7kLZ7jOSp6RTkIzgydw==
X-Gm-Gg: ASbGncuAH8SiZ6HHiEIMpqBnHWepMPgrUqs3Spzeg64D9sKRQiXce5q9PQswta8vna6
	sK5P8Zb/f5mHEZfbwKfWD8N78rcgNCN0iLk/F9t2TAas871lsLQzhSgnpvqyIMcqYldzdmjpCMi
	P4sQFScW8ZWdfgu8e/vNnX8y86v2kTT3cCtYs7jqdQoUBY8Rebj8zNpoR4CfpFpDToeizOkHjXk
	cmpgAMc1INNgA==
X-Google-Smtp-Source: AGHT+IH+1DBiWWnhdSU0xRYIP03tSN9vUOC0Ml24NOd2BrGti29YOeNibvSB6cxtOODl+8bbOHwbIn6vNHzHdLnQBjk=
X-Received: by 2002:a05:690c:64c5:b0:70e:731f:d4c7 with SMTP id
 00721157ae682-71668c0e7femr207532407b3.8.1751990185697; Tue, 08 Jul 2025
 08:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250704103539.265785-1-yogita.urade@windriver.com> <51bec7bc-6782-45cd-8c13-2ae3005d23d8@gmail.com>
In-Reply-To: <51bec7bc-6782-45cd-8c13-2ae3005d23d8@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 8 Jul 2025 08:56:14 -0700
X-Gm-Features: Ac12FXxTXC94A8xBRt95XR8Py5pX8wVPEFbiBzY-lC1fnXI3cGtJ65-03H_Eq6Y
Message-ID: <CAOSpxdbpXPKA5wb2P6hqqZYsxNMRu_7wkUd0-WOA0HmQYjAomQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] python3-urllib3: fix CVE-2025-50181
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 15:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220050

On Tue, Jul 8, 2025 at 7:43=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:

> I see in patchwork that this patch has been also rejected, along with
> its pair in the series.
>
> If this was because of my remark about CVE-2025-50182, then I would like
> to mention that my comment was only about the second patch, and I think
> that this one, for CVE-2025-50181, looks correct and useful.

Thanks for the clarification.  I'll add this patch to my test queue.

Steve

> On 7/4/25 12:35, Urade, Yogita via lists.openembedded.org wrote:
> > From: Yogita Urade <yogita.urade@windriver.com>
> >
> > urllib3 is a user-friendly HTTP client library for Python. Prior to
> > 2.5.0, it is possible to disable redirects for all requests by
> > instantiating a PoolManager and specifying retries in a way that
> > disable redirects. By default, requests and botocore users are not
> > affected. An application attempting to mitigate SSRF or open redirect
> > vulnerabilities by disabling redirects at the PoolManager level will
> > remain vulnerable. This issue has been patched in version 2.5.0.
> >
> > Reference:
> > https://nvd.nist.gov/vuln/detail/CVE-2025-50181
> >
> > Upstream patch:
> > https://github.com/urllib3/urllib3/commit/f05b1329126d5be6de501f9d1e3e3=
6738bc08857
> >
> > Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > ---
> >  .../python3-urllib3/CVE-2025-50181.patch      | 283 ++++++++++++++++++
> >  .../python/python3-urllib3_2.2.2.bb           |   4 +
> >  2 files changed, 287 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-20=
25-50181.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-5018=
1.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
> > new file mode 100644
> > index 0000000000..d4f6e98cc1
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
> > @@ -0,0 +1,283 @@
> > +From f05b1329126d5be6de501f9d1e3e36738bc08857 Mon Sep 17 00:00:00 2001
> > +From: Illia Volochii <illia.volochii@gmail.com>
> > +Date: Wed, 18 Jun 2025 16:25:01 +0300
> > +Subject: [PATCH] Merge commit from fork
> > +
> > +* Apply Quentin's suggestion
> > +
> > +Co-authored-by: Quentin Pradet <quentin.pradet@gmail.com>
> > +
> > +* Add tests for disabled redirects in the pool manager
> > +
> > +* Add a possible fix for the issue with not raised `MaxRetryError`
> > +
> > +* Make urllib3 handle redirects instead of JS when JSPI is used
> > +
> > +* Fix info in the new comment
> > +
> > +* State that redirects with XHR are not controlled by urllib3
> > +
> > +* Remove excessive params from new test requests
> > +
> > +* Add tests reaching max non-0 redirects
> > +
> > +* Test redirects with Emscripten
> > +
> > +* Fix `test_merge_pool_kwargs`
> > +
> > +* Add a changelog entry
> > +
> > +* Parametrize tests
> > +
> > +* Drop a fix for Emscripten
> > +
> > +* Apply Seth's suggestion to docs
> > +
> > +Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
> > +
> > +* Use a minor release instead of the patch one
> > +
> > +---------
> > +
> > +Co-authored-by: Quentin Pradet <quentin.pradet@gmail.com>
> > +Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
> > +
> > +CVE: CVE-2025-50181
> > +Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/f=
05b1329126d5be6de501f9d1e3e36738bc08857]
> > +
> > +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > +---
> > + docs/reference/contrib/emscripten.rst      |   2 +-
> > + dummyserver/app.py                         |   1 +
> > + src/urllib3/poolmanager.py                 |  18 +++-
> > + test/contrib/emscripten/test_emscripten.py |  16 ++++
> > + test/test_poolmanager.py                   |   5 +-
> > + test/with_dummyserver/test_poolmanager.py  | 101 ++++++++++++++++++++=
+
> > + 6 files changed, 139 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/docs/reference/contrib/emscripten.rst b/docs/reference/co=
ntrib/emscripten.rst
> > +index 9e85629..c88e422 100644
> > +--- a/docs/reference/contrib/emscripten.rst
> > ++++ b/docs/reference/contrib/emscripten.rst
> > +@@ -68,7 +68,7 @@ Features which are usable with Emscripten support ar=
e:
> > + * Timeouts
> > + * Retries
> > + * Streaming (with Web Workers and Cross-Origin Isolation)
> > +-* Redirects
> > ++* Redirects (determined by browser/runtime, not restrictable with url=
lib3)
> > + * Decompressing response bodies
> > +
> > + Features which don't work with Emscripten:
> > +diff --git a/dummyserver/app.py b/dummyserver/app.py
> > +index 9fc9d1b..96e0dab 100644
> > +--- a/dummyserver/app.py
> > ++++ b/dummyserver/app.py
> > +@@ -228,6 +228,7 @@ async def encodingrequest() -> ResponseReturnValue=
:
> > +
> > +
> > + @hypercorn_app.route("/redirect", methods=3D["GET", "POST", "PUT"])
> > ++@pyodide_testing_app.route("/redirect", methods=3D["GET", "POST", "PU=
T"])
> > + async def redirect() -> ResponseReturnValue:
> > +     "Perform a redirect to ``target``"
> > +     values =3D await request.values
> > +diff --git a/src/urllib3/poolmanager.py b/src/urllib3/poolmanager.py
> > +index 085d1db..5763fea 100644
> > +--- a/src/urllib3/poolmanager.py
> > ++++ b/src/urllib3/poolmanager.py
> > +@@ -203,6 +203,22 @@ class PoolManager(RequestMethods):
> > +         **connection_pool_kw: typing.Any,
> > +     ) -> None:
> > +         super().__init__(headers)
> > ++        if "retries" in connection_pool_kw:
> > ++            retries =3D connection_pool_kw["retries"]
> > ++            if not isinstance(retries, Retry):
> > ++                # When Retry is initialized, raise_on_redirect is bas=
ed
> > ++                # on a redirect boolean value.
> > ++                # But requests made via a pool manager always set
> > ++                # redirect to False, and raise_on_redirect always end=
s
> > ++                # up being False consequently.
> > ++                # Here we fix the issue by setting raise_on_redirect =
to
> > ++                # a value needed by the pool manager without consider=
ing
> > ++                # the redirect boolean.
> > ++                raise_on_redirect =3D retries is not False
> > ++                retries =3D Retry.from_int(retries, redirect=3DFalse)
> > ++                retries.raise_on_redirect =3D raise_on_redirect
> > ++                connection_pool_kw =3D connection_pool_kw.copy()
> > ++                connection_pool_kw["retries"] =3D retries
> > +         self.connection_pool_kw =3D connection_pool_kw
> > +
> > +         self.pools: RecentlyUsedContainer[PoolKey, HTTPConnectionPool=
]
> > +@@ -456,7 +472,7 @@ class PoolManager(RequestMethods):
> > +             kw["body"] =3D None
> > +             kw["headers"] =3D HTTPHeaderDict(kw["headers"])._prepare_=
for_method_change()
> > +
> > +-        retries =3D kw.get("retries")
> > ++        retries =3D kw.get("retries", response.retries)
> > +         if not isinstance(retries, Retry):
> > +             retries =3D Retry.from_int(retries, redirect=3Dredirect)
> > +
> > +diff --git a/test/contrib/emscripten/test_emscripten.py b/test/contrib=
/emscripten/test_emscripten.py
> > +index 17264d8..0e107fa 100644
> > +--- a/test/contrib/emscripten/test_emscripten.py
> > ++++ b/test/contrib/emscripten/test_emscripten.py
> > +@@ -949,6 +949,22 @@ def test_retries(
> > +     pyodide_test(selenium_coverage, testserver_http.http_host, find_u=
nused_port())
> > +
> > +
> > ++def test_redirects(
> > ++    selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
> > ++) -> None:
> > ++    @run_in_pyodide  # type: ignore[misc]
> > ++    def pyodide_test(selenium_coverage: typing.Any, host: str, port: =
int) -> None:
> > ++        from urllib3 import request
> > ++
> > ++        redirect_url =3D f"http://{host}:{port}/redirect"
> > ++        response =3D request("GET", redirect_url)
> > ++        assert response.status =3D=3D 200
> > ++
> > ++    pyodide_test(
> > ++        selenium_coverage, testserver_http.http_host, testserver_http=
.http_port
> > ++    )
> > ++
> > ++
> > + @install_urllib3_wheel()
> > + def test_insecure_requests_warning(
> > +     selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
> > +diff --git a/test/test_poolmanager.py b/test/test_poolmanager.py
> > +index ab5f203..b481a19 100644
> > +--- a/test/test_poolmanager.py
> > ++++ b/test/test_poolmanager.py
> > +@@ -379,9 +379,10 @@ class TestPoolManager:
> > +
> > +     def test_merge_pool_kwargs(self) -> None:
> > +         """Assert _merge_pool_kwargs works in the happy case"""
> > +-        p =3D PoolManager(retries=3D100)
> > ++        retries =3D retry.Retry(total=3D100)
> > ++        p =3D PoolManager(retries=3Dretries)
> > +         merged =3D p._merge_pool_kwargs({"new_key": "value"})
> > +-        assert {"retries": 100, "new_key": "value"} =3D=3D merged
> > ++        assert {"retries": retries, "new_key": "value"} =3D=3D merged
> > +
> > +     def test_merge_pool_kwargs_none(self) -> None:
> > +         """Assert false-y values to _merge_pool_kwargs result in defa=
ults"""
> > +diff --git a/test/with_dummyserver/test_poolmanager.py b/test/with_dum=
myserver/test_poolmanager.py
> > +index af77241..7f163ab 100644
> > +--- a/test/with_dummyserver/test_poolmanager.py
> > ++++ b/test/with_dummyserver/test_poolmanager.py
> > +@@ -84,6 +84,89 @@ class TestPoolManager(HypercornDummyServerTestCase)=
:
> > +             assert r.status =3D=3D 200
> > +             assert r.data =3D=3D b"Dummy server!"
> > +
> > ++    @pytest.mark.parametrize(
> > ++        "retries",
> > ++        (0, Retry(total=3D0), Retry(redirect=3D0), Retry(total=3D0, r=
edirect=3D0)),
> > ++    )
> > ++    def test_redirects_disabled_for_pool_manager_with_0(
> > ++        self, retries: typing.Literal[0] | Retry
> > ++    ) -> None:
> > ++        """
> > ++        Check handling redirects when retries is set to 0 on the pool
> > ++        manager.
> > ++        """
> > ++        with PoolManager(retries=3Dretries) as http:
> > ++            with pytest.raises(MaxRetryError):
> > ++                http.request("GET", f"{self.base_url}/redirect")
> > ++
> > ++            # Setting redirect=3DTrue should not change the behavior.
> > ++            with pytest.raises(MaxRetryError):
> > ++                http.request("GET", f"{self.base_url}/redirect", redi=
rect=3DTrue)
> > ++
> > ++            # Setting redirect=3DFalse should not make it follow the =
redirect,
> > ++            # but MaxRetryError should not be raised.
> > ++            response =3D http.request("GET", f"{self.base_url}/redire=
ct", redirect=3DFalse)
> > ++            assert response.status =3D=3D 303
> > ++
> > ++    @pytest.mark.parametrize(
> > ++        "retries",
> > ++        (
> > ++            False,
> > ++            Retry(total=3DFalse),
> > ++            Retry(redirect=3DFalse),
> > ++            Retry(total=3DFalse, redirect=3DFalse),
> > ++        ),
> > ++    )
> > ++    def test_redirects_disabled_for_pool_manager_with_false(
> > ++        self, retries: typing.Literal[False] | Retry
> > ++    ) -> None:
> > ++        """
> > ++        Check that setting retries set to False on the pool manager d=
isables
> > ++        raising MaxRetryError and redirect=3DTrue does not change the
> > ++        behavior.
> > ++        """
> > ++        with PoolManager(retries=3Dretries) as http:
> > ++            response =3D http.request("GET", f"{self.base_url}/redire=
ct")
> > ++            assert response.status =3D=3D 303
> > ++
> > ++            response =3D http.request("GET", f"{self.base_url}/redire=
ct", redirect=3DTrue)
> > ++            assert response.status =3D=3D 303
> > ++
> > ++            response =3D http.request("GET", f"{self.base_url}/redire=
ct", redirect=3DFalse)
> > ++            assert response.status =3D=3D 303
> > ++
> > ++    def test_redirects_disabled_for_individual_request(self) -> None:
> > ++        """
> > ++        Check handling redirects when they are meant to be disabled
> > ++        on the request level.
> > ++        """
> > ++        with PoolManager() as http:
> > ++            # Check when redirect is not passed.
> > ++            with pytest.raises(MaxRetryError):
> > ++                http.request("GET", f"{self.base_url}/redirect", retr=
ies=3D0)
> > ++            response =3D http.request("GET", f"{self.base_url}/redire=
ct", retries=3DFalse)
> > ++            assert response.status =3D=3D 303
> > ++
> > ++            # Check when redirect=3DTrue.
> > ++            with pytest.raises(MaxRetryError):
> > ++                http.request(
> > ++                    "GET", f"{self.base_url}/redirect", retries=3D0, =
redirect=3DTrue
> > ++                )
> > ++            response =3D http.request(
> > ++                "GET", f"{self.base_url}/redirect", retries=3DFalse, =
redirect=3DTrue
> > ++            )
> > ++            assert response.status =3D=3D 303
> > ++
> > ++            # Check when redirect=3DFalse.
> > ++            response =3D http.request(
> > ++                "GET", f"{self.base_url}/redirect", retries=3D0, redi=
rect=3DFalse
> > ++            )
> > ++            assert response.status =3D=3D 303
> > ++            response =3D http.request(
> > ++                "GET", f"{self.base_url}/redirect", retries=3DFalse, =
redirect=3DFalse
> > ++            )
> > ++            assert response.status =3D=3D 303
> > ++
> > +     def test_cross_host_redirect(self) -> None:
> > +         with PoolManager() as http:
> > +             cross_host_location =3D f"{self.base_url_alt}/echo?a=3Db"
> > +@@ -138,6 +221,24 @@ class TestPoolManager(HypercornDummyServerTestCas=
e):
> > +             pool =3D http.connection_from_host(self.host, self.port)
> > +             assert pool.num_connections =3D=3D 1
> > +
> > ++        # Check when retries are configured for the pool manager.
> > ++        with PoolManager(retries=3D1) as http:
> > ++            with pytest.raises(MaxRetryError):
> > ++                http.request(
> > ++                    "GET",
> > ++                    f"{self.base_url}/redirect",
> > ++                    fields=3D{"target": f"/redirect?target=3D{self.ba=
se_url}/"},
> > ++                )
> > ++
> > ++            # Here we allow more retries for the request.
> > ++            response =3D http.request(
> > ++                "GET",
> > ++                f"{self.base_url}/redirect",
> > ++                fields=3D{"target": f"/redirect?target=3D{self.base_u=
rl}/"},
> > ++                retries=3D2,
> > ++            )
> > ++            assert response.status =3D=3D 200
> > ++
> > +     def test_redirect_cross_host_remove_headers(self) -> None:
> > +         with PoolManager() as http:
> > +             r =3D http.request(
> > +--
> > +2.40.0
> > diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/me=
ta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> > index 31a03a60b3..bdb1c7ca8d 100644
> > --- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> > +++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> > @@ -7,6 +7,10 @@ SRC_URI[sha256sum] =3D "dd505485549a7a552833da5e606363=
9d0d177c04f23bc3864e41e5dc5f
> >
> >  inherit pypi python_hatchling
> >
> > +SRC_URI +=3D " \
> > +    file://CVE-2025-50181.patch \
> > +"
> > +
> >  RDEPENDS:${PN} +=3D "\
> >      python3-certifi \
> >      python3-cryptography \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#219914): https://lists.openembedded.org/g/openembed=
ded-core/message/219914
> > Mute This Topic: https://lists.openembedded.org/mt/113981494/6084445
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

