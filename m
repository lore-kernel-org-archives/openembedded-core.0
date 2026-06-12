Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC7CCD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 10:24:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67372.1781259851030050020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 03:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TMpI3CIr;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-460662fcb4eso526955f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 03:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781259849; x=1781864649; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AOYhNC3iW1xIiOhXxVaBKkmPtDchHOis5juDkVGurk=;
        b=TMpI3CIrn2be3LCxX8GbovBTmrQjSv+QS/q8QTN4G3K4MbQDTMNV3eZNgqi9r6IcD2
         aUEAfa/00jRx6zx2puYp8kztaYt8YdXa+bDEh5vyI3IJC/7yfrx/vsa1b3aAecT3n3zD
         bxFyxELr+TnMbw6uSCUguDnEdcMh+nYV+up/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781259849; x=1781864649;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AOYhNC3iW1xIiOhXxVaBKkmPtDchHOis5juDkVGurk=;
        b=EafoLp366dLOaJw9ocmvqPmKE1OA6CGhH/m3l6kmWZRtDsRUMpHBct8SAbrQm11YPZ
         rARGxezNa+QdqkeoRFu+dxyNX/LBG0JmRIHAFdK3QH6kFdW2REGqRN3tdPm1MUNpqKiH
         to5DjAAo6RM8rMkQFFY6eiX738sPRNyGhHS85azPyaBHUPfLXDVUBVZRVFohX5BRFG72
         IK4rlAQK0+FmZ6xmGdyWNj11Wt5G11je9Pf1g+U0rf+bOK/hs5L8aUoZabCOCLQ9qhDD
         OUXBeqSCjsjDKHBFAHtxDbgE7+WrkhodIaXGlWIvRL/2rop5PFmPBW2O8hpK5sWPVHaG
         gwQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jeNHdu+76LK7FCW5hM6k5B7zNuOouKQ3lVfJhfb35zxz1MWnFIlfrfB8+vN5lTyLvhjTS13iogugU+y4tgP+I3g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxxyxJWRWwoTtxxWkShbR2yUNvKSYJYLuEC/Qr7/cTmr3ltO+/e
	gVcTWFLHrqRXF3S0Rt3xFMF6WyF6HjrNuX5U8gIuf7T+hRc+RNDYjJKZrl9G/zgfGw==
X-Gm-Gg: Acq92OHEI6RwLje7KJOTiAQsapNGwuOkSWrz1EuBvTyocucPoacqVo5eLZO/V8uQegE
	kQ91QRrRGbP/UBInLv6CB9jyls1WlBpmDvSQmkBYP6IiY4Qj0ffspnDbnro81pgx06U03uM+PYN
	1BKQyqDTdAS3OFmOWi6OvUUMYJy4DGwqzu47x1VlpCckyZEfPbtoGdKhgdFjHqSlP+80DmpA2TY
	VEja9zTV4vZANofuOaQaFD9mL4KBcRMyjljO9UL/fXgUhB6KuPsZBRPLpk9LJVj+Qg0fRtn5Pmu
	pyBkPs7/9TV60m9jHAB2p+7zEudWlfWdC1yU8qMHruQCpdAYk9lMUVjstVEglxRectLVaTry42C
	i+enrZgXlqnph+oH9bsK0QU1RbkmZirm6kv5+ZB+CGT8c7Fqgaf6aDWXJ+SNS5qP1aqD66gf0h0
	vZArJz9nDtj2I1wiVLducilA==
X-Received: by 2002:a05:6000:71a:b0:45e:eef5:b51e with SMTP id ffacd0b85a97d-4606dbc6752mr3064404f8f.23.1781259849259;
        Fri, 12 Jun 2026 03:24:09 -0700 (PDT)
Received: from localhost ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b1092sm4554150f8f.17.2026.06.12.03.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 03:24:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 12:24:08 +0200
Message-Id: <DJ6ZX1JZMT8S.BM5LO9MCVMTJ@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] python3-urllib3: fix CVE-2026-44431
From: "Jeremy Rosen" <jeremy.rosen@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260601181157.3221502-1-sudumbha@cisco.com>
In-Reply-To: <20260601181157.3221502-1-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 10:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238599

Hello Sudhir

This CVE also affects wrynose and I could not find any submission for
wrynose

please submit for wrynose and once it is affected ping here

Thanks a lot=20
J=C3=A9r=C3=A9my

On Mon Jun 1, 2026 at 8:11 PM CEST, Sudhir Dumbhare via lists.openembedded.=
org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> Applies the upstream fix [1] referenced in [2] and addresses the
> sensitive-header redirect handling issue in proxied low-level urllib3 req=
uests.
>
> [1] https://github.com/urllib3/urllib3/commit/5ec0de499b9166ca71c65ab04f2=
a7e4eb0d66fcc
> [2] https://ubuntu.com/security/CVE-2026-44431
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2026-44431
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---
>  .../python3-urllib3/CVE-2026-44431.patch      | 163 ++++++++++++++++++
>  .../python/python3-urllib3_2.2.2.bb           |   1 +
>  2 files changed, 164 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026=
-44431.patch
>
> diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.=
patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch
> new file mode 100644
> index 0000000000..042b46f47a
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch
> @@ -0,0 +1,163 @@
> +From d5517b0ab50030a8f389757b3ba648633c504cbc Mon Sep 17 00:00:00 2001
> +From: Illia Volochii <illia.volochii@gmail.com>
> +Date: Thu, 7 May 2026 18:40:31 +0300
> +Subject: [PATCH] Merge commit from fork
> +
> +* Remove sensitive headers in proxy pools too
> +
> +* Add a changelog entry
> +
> +* Check retries history in tests
> +
> +CVE: CVE-2026-44431
> +Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/5ec=
0de499b9166ca71c65ab04f2a7e4eb0d66fcc]
> +
> +Co-authored-by: Copilot <copilot@github.com>
> +
> +---------
> +
> +Co-authored-by: Copilot <copilot@github.com>
> +(cherry picked from commit 5ec0de499b9166ca71c65ab04f2a7e4eb0d66fcc)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + changelog/GHSA-qccp-gfcp-xxvc.bugfix.rst      |  3 +
> + dummyserver/asgi_proxy.py                     |  1 +
> + src/urllib3/connectionpool.py                 | 12 ++++
> + .../test_proxy_poolmanager.py                 | 72 +++++++++++++++++++
> + 4 files changed, 88 insertions(+)
> + create mode 100644 changelog/GHSA-qccp-gfcp-xxvc.bugfix.rst
> +
> +diff --git a/changelog/GHSA-qccp-gfcp-xxvc.bugfix.rst b/changelog/GHSA-q=
ccp-gfcp-xxvc.bugfix.rst
> +new file mode 100644
> +index 00000000..bac765ea
> +--- /dev/null
> ++++ b/changelog/GHSA-qccp-gfcp-xxvc.bugfix.rst
> +@@ -0,0 +1,3 @@
> ++Fixed HTTP pools created using ``ProxyManager.connection_from_url`` to =
strip
> ++sensitive headers specified in ``Retry.remove_headers_on_redirect`` whe=
n
> ++redirecting to a different host.
> +diff --git a/dummyserver/asgi_proxy.py b/dummyserver/asgi_proxy.py
> +index 107c5e0a..094807cd 100755
> +--- a/dummyserver/asgi_proxy.py
> ++++ b/dummyserver/asgi_proxy.py
> +@@ -52,6 +52,7 @@ class ProxyApp:
> +             client_response =3D await client.request(
> +                 method=3Dscope["method"],
> +                 url=3Dscope["path"],
> ++                params=3Dscope["query_string"].decode(),
> +                 headers=3Dlist(scope["headers"]),
> +                 content=3Dawait _read_body(receive),
> +             )
> +diff --git a/src/urllib3/connectionpool.py b/src/urllib3/connectionpool.=
py
> +index a2c3cf60..f64ee2f8 100644
> +--- a/src/urllib3/connectionpool.py
> ++++ b/src/urllib3/connectionpool.py
> +@@ -898,6 +898,18 @@ class HTTPConnectionPool(ConnectionPool, RequestMet=
hods):
> +                 body =3D None
> +                 headers =3D HTTPHeaderDict(headers)._prepare_for_method=
_change()
> +=20
> ++            # Strip headers marked as unsafe to forward to the redirect=
ed location.
> ++            # Check remove_headers_on_redirect to avoid a potential net=
work call within
> ++            # self.is_same_host() which may use socket.gethostbyname() =
in the future.
> ++            if retries.remove_headers_on_redirect and not self.is_same_=
host(
> ++                redirect_location
> ++            ):
> ++                new_headers =3D headers.copy()  # type: ignore[union-at=
tr]
> ++                for header in headers:
> ++                    if header.lower() in retries.remove_headers_on_redi=
rect:
> ++                        new_headers.pop(header, None)
> ++                headers =3D new_headers
> ++
> +             try:
> +                 retries =3D retries.increment(method, url, response=3Dr=
esponse, _pool=3Dself)
> +             except MaxRetryError:
> +diff --git a/test/with_dummyserver/test_proxy_poolmanager.py b/test/with=
_dummyserver/test_proxy_poolmanager.py
> +index 397181a9..a0b11726 100644
> +--- a/test/with_dummyserver/test_proxy_poolmanager.py
> ++++ b/test/with_dummyserver/test_proxy_poolmanager.py
> +@@ -37,6 +37,7 @@ from urllib3.exceptions import (
> +     SSLError,
> + )
> + from urllib3.poolmanager import ProxyManager, proxy_from_url
> ++from urllib3.util.retry import RequestHistory
> + from urllib3.util.ssl_ import create_urllib3_context
> + from urllib3.util.timeout import Timeout
> +=20
> +@@ -299,6 +300,77 @@ class TestHTTPProxyManager(HypercornDummyProxyTestC=
ase):
> +             assert r._pool is not None
> +             assert r._pool.host !=3D self.http_host_alt
> +=20
> ++    _sensitive_headers =3D {
> ++        "Authorization": "foo",
> ++        "Proxy-Authorization": "bar",
> ++        "Cookie": "foo=3Dbar",
> ++    }
> ++
> ++    @pytest.mark.parametrize(
> ++        "sensitive_headers",
> ++        (_sensitive_headers, {k.lower(): v for k, v in _sensitive_heade=
rs.items()}),
> ++        ids=3D("capitalized", "lowercase"),
> ++    )
> ++    def test_cross_host_redirect_remove_headers_via_proxy_manager(
> ++        self, sensitive_headers: dict[str, str]
> ++    ) -> None:
> ++        headers_url =3D f"{self.http_url_alt}/headers"
> ++        initial_url =3D f"{self.http_url}/redirect?target=3D{headers_ur=
l}"
> ++        with proxy_from_url(self.proxy_url) as proxy_mgr:
> ++            r =3D proxy_mgr.request(
> ++                "GET", initial_url, headers=3Dsensitive_headers, retrie=
s=3D1
> ++            )
> ++            assert r.status =3D=3D 200
> ++            assert r.retries is not None
> ++            assert r.retries.history =3D=3D (
> ++                RequestHistory(
> ++                    method=3D"GET",
> ++                    url=3Dinitial_url,
> ++                    error=3DNone,
> ++                    status=3D303,
> ++                    redirect_location=3Dheaders_url,
> ++                ),
> ++            )
> ++            data =3D r.json()
> ++            for header in sensitive_headers:
> ++                assert header not in data
> ++
> ++    @pytest.mark.parametrize(
> ++        "sensitive_headers",
> ++        (_sensitive_headers, {k.lower(): v for k, v in _sensitive_heade=
rs.items()}),
> ++        ids=3D("capitalized", "lowercase"),
> ++    )
> ++    def test_cross_host_redirect_remove_headers_via_pool(
> ++        self, sensitive_headers: dict[str, str]
> ++    ) -> None:
> ++        headers_url =3D f"{self.http_url_alt}/headers"
> ++        initial_url =3D f"{self.http_url}/redirect?target=3D{headers_ur=
l}"
> ++        with proxy_from_url(self.proxy_url) as proxy_mgr:
> ++            pool =3D proxy_mgr.connection_from_url(self.http_url)
> ++            r =3D pool.urlopen(
> ++                "GET",
> ++                initial_url,
> ++                headers=3Dsensitive_headers,
> ++                retries=3D1,
> ++                redirect=3DTrue,
> ++                assert_same_host=3DFalse,
> ++                preload_content=3DTrue,
> ++            )
> ++            assert r.status =3D=3D 200
> ++            assert r.retries is not None
> ++            assert r.retries.history =3D=3D (
> ++                RequestHistory(
> ++                    method=3D"GET",
> ++                    url=3Dinitial_url,
> ++                    error=3DNone,
> ++                    status=3D303,
> ++                    redirect_location=3Dheaders_url,
> ++                ),
> ++            )
> ++            data =3D r.json()
> ++            for header in sensitive_headers:
> ++                assert header not in data
> ++
> +     def test_cross_protocol_redirect(self) -> None:
> +         with proxy_from_url(self.proxy_url, ca_certs=3DDEFAULT_CA) as h=
ttp:
> +             cross_protocol_location =3D f"{self.https_url}/echo?a=3Db"
> diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta=
/recipes-devtools/python/python3-urllib3_2.2.2.bb
> index f6ac8f89ca..b77dd5297d 100644
> --- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> +++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> @@ -12,6 +12,7 @@ SRC_URI +=3D " \
>      file://CVE-2025-66418.patch \
>      file://CVE-2025-66471.patch \
>      file://CVE-2026-21441.patch \
> +    file://CVE-2026-44431.patch \
>  "
> =20
>  RDEPENDS:${PN} +=3D "\


