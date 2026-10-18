Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83E9CCF2C4
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 13:18:35 +0000 (UTC)
Subject: Re: [wrynose][PATCH] curl: fix CVE-2026-80230
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 155
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 06:18:34 -0700
References: <20261016134019.52968-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261016134019.52968-1-jaipaul.cheernam@est.tech>
Message-ID: <2398061.1792329514407910312@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="y3fPQbs32sszXDKtH37I"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 13:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248107

--y3fPQbs32sszXDKtH37I
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann, Jaipaul,

I=E2=80=99m preparing a six-patch curl CVE fix series for Wrynose. One of t=
he patches addresses CVE-2026-80230 using the same upstream fix and curl 8.=
19.0 adaptation as Jaipaul=E2=80=99s submission here. The other five patche=
s address additional CVEs.

Would you prefer that I submit the complete series with the overlap noted i=
n the cover letter, or omit the CVE-2026-80230 patch and submit the remaini=
ng five based on Jaipaul=E2=80=99s change?

Thanks,
Darsh

On Fri, Oct 16, 2026 at 07:10 PM, Jaipaul Cheernam wrote:

>=20
> Backport the upstream fix [1] as mentioned in [2]
>=20
> [1] https://github.com/curl/curl/commit/5267ed859d545534d0c21
> [2] https://curl.se/docs/CVE-2026-80230.html
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> Note: SRC_URI indentation is corrected by devtool
>=20
> .../curl/curl/CVE-2026-80230.patch | 68 +++++++++++++++++++
> meta/recipes-support/curl/curl_8.19.0.bb | 62 ++++++++---------
> 2 files changed, 99 insertions(+), 31 deletions(-)
> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80230.patch
>=20
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-80230.patch
> b/meta/recipes-support/curl/curl/CVE-2026-80230.patch
> new file mode 100644
> index 0000000000..5a6bb35986
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-80230.patch
> @@ -0,0 +1,68 @@
> +From 7d34e6397166b10600c2ced93f95641d5e7c1575 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 24 Aug 2026 23:37:49 +0200
> +Subject: [PATCH] openssl: no server cert is only okay if also not pinned
> +
> +Reported-by: Stanislav Fort
> +Closes #22660
> +
> +CVE: CVE-2026-80230
> +Upstream-Status: Backport [ https://github.com/curl/curl/commit/5267ed85=
9d545534d0c21675a2b70af5a3b6e3ef
> ]
> +
> +Note: CURL_EASY_STR() macro does not exist in 8.19.0, so the pinned()
> +accesses data->set.str[] directly instead.
> +
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + lib/vtls/openssl.c | 26 +++++++++++++++-----------
> + 1 file changed, 15 insertions(+), 11 deletions(-)
> +
> +diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
> +index 1cf357c..cb6fcc4 100644
> +--- a/lib/vtls/openssl.c
> ++++ b/lib/vtls/openssl.c
> +@@ -4607,21 +4607,24 @@ out:
> + return result;
> + }
> +
> +-static CURLcode ossl_check_pinned_key(struct Curl_cfilter *cf,
> +- struct Curl_easy *data,
> +- X509 *server_cert)
> ++static const char *pinned(struct Curl_cfilter *cf,
> ++ struct Curl_easy *data)
> + {
> +- const char *ptr;
> +- CURLcode result =3D CURLE_OK;
> +-
> + (void)cf;
> ++ return
> + #ifndef CURL_DISABLE_PROXY
> +- ptr =3D Curl_ssl_cf_is_proxy(cf) ?
> ++ Curl_ssl_cf_is_proxy(cf) ?
> + data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY] :
> +- data->set.str[STRING_SSL_PINNEDPUBLICKEY];
> +-#else
> +- ptr =3D data->set.str[STRING_SSL_PINNEDPUBLICKEY];
> + #endif
> ++ data->set.str[STRING_SSL_PINNEDPUBLICKEY];
> ++}
> ++
> ++static CURLcode ossl_check_pinned_key(struct Curl_cfilter *cf,
> ++ struct Curl_easy *data,
> ++ X509 *server_cert)
> ++{
> ++ CURLcode result =3D CURLE_OK;
> ++ const char *ptr =3D pinned(cf, data);
> + if(ptr) {
> + result =3D ossl_pkp_pin_peer_pubkey(data, server_cert, ptr);
> + if(result)
> +@@ -4803,7 +4806,8 @@ CURLcode Curl_ossl_check_peer_cert(struct
> Curl_cfilter *cf,
> + server_cert =3D SSL_get1_peer_certificate(octx->ssl);
> + if(!server_cert) {
> + /* no verification at all, this maybe acceptable */
> +- if(!(conn_config->verifypeer || conn_config->verifyhost))
> ++ if(!(conn_config->verifypeer || conn_config->verifyhost) &&
> ++ !pinned(cf, data))
> + goto out;
> +
> + failf(data, "SSL: could not get peer certificate");
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb
> b/meta/recipes-support/curl/curl_8.19.0.bb
> index 0573e08ea4..c2697d6dd8 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -9,37 +9,37 @@ SECTION =3D "console/network"
> LICENSE =3D "curl"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0515352b285b9c3f66464b135c9c0f=
dc"
>=20
> -SRC_URI =3D " \
> - https://curl.se/download/ ${BP}.tar.xz \
> - file://run-ptest \
> - file://disable-tests \
> - file://no-test-timeout.patch \
> - file://CVE-2026-6276.patch \
> - file://CVE-2026-5773.patch \
> - file://mbedtls.patch \
> - file://CVE-2026-5545.patch \
> - file://CVE-2026-6253.patch \
> - file://CVE-2026-6429-dependent.patch \
> - file://CVE-2026-6429.patch \
> - file://CVE-2026-7168.patch \
> - file://CVE-2026-4873.patch \
> - file://CVE-2026-8286.patch \
> - file://CVE-2026-8927.patch \
> - file://CVE-2026-8932-dependent.patch \
> - file://CVE-2026-8932.patch \
> - file://CVE-2026-11352.patch \
> - file://CVE-2026-11586.patch \
> - file://CVE-2026-7009.patch \
> - file://CVE-2026-8925.patch \
> - file://CVE-2026-9080.patch \
> - file://CVE-2026-9545-01.patch \
> - file://CVE-2026-9545-02.patch \
> - file://CVE-2026-9079.patch \
> - file://CVE-2026-13608.patch \
> - file://CVE-2026-80229.patch \
> - file://CVE-2026-9546-01.patch \
> - file://CVE-2026-9546-02.patch \
> -"
> +SRC_URI =3D " https://curl.se/download/ ${BP}.tar.xz \
> + file://run-ptest \
> + file://disable-tests \
> + file://no-test-timeout.patch \
> + file://CVE-2026-6276.patch \
> + file://CVE-2026-5773.patch \
> + file://mbedtls.patch \
> + file://CVE-2026-5545.patch \
> + file://CVE-2026-6253.patch \
> + file://CVE-2026-6429-dependent.patch \
> + file://CVE-2026-6429.patch \
> + file://CVE-2026-7168.patch \
> + file://CVE-2026-4873.patch \
> + file://CVE-2026-8286.patch \
> + file://CVE-2026-8927.patch \
> + file://CVE-2026-8932-dependent.patch \
> + file://CVE-2026-8932.patch \
> + file://CVE-2026-11352.patch \
> + file://CVE-2026-11586.patch \
> + file://CVE-2026-7009.patch \
> + file://CVE-2026-8925.patch \
> + file://CVE-2026-9080.patch \
> + file://CVE-2026-9545-01.patch \
> + file://CVE-2026-9545-02.patch \
> + file://CVE-2026-9079.patch \
> + file://CVE-2026-13608.patch \
> + file://CVE-2026-80229.patch \
> + file://CVE-2026-9546-01.patch \
> + file://CVE-2026-9546-02.patch \
> + file://CVE-2026-80230.patch \
> + "
>=20
> SRC_URI:append:class-nativesdk =3D " \
> file://environment.d-curl.sh \

--y3fPQbs32sszXDKtH37I
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p data-pm-slice=3D"1 1 []">Hi Yoann, Jaipaul,<br /><br />I&rsquo;m prepari=
ng a six-patch curl CVE fix series for Wrynose. One of the patches addresse=
s CVE-2026-80230 using the same upstream fix and curl 8.19.0 adaptation as =
Jaipaul&rsquo;s submission here. The other five patches address additional =
CVEs.<br /><br />Would you prefer that I submit the complete series with th=
e overlap noted in the cover letter, or omit the CVE-2026-80230 patch and s=
ubmit the remaining five based on Jaipaul&rsquo;s change?<br /><br />Thanks=
,<br />Darsh</p>
<br />On Fri, Oct 16, 2026 at 07:10 PM, Jaipaul Cheernam wrote:</div>
<div>
<blockquote>Backport the upstream fix [1] as mentioned in [2]<br /><br />[1=
] <a href=3D"https://github.com/curl/curl/commit/5267ed859d545534d0c21" tar=
get=3D"_blank" rel=3D"noopener">https://github.com/curl/curl/commit/5267ed8=
59d545534d0c21</a><br />[2] <a href=3D"https://curl.se/docs/CVE-2026-80230.=
html" target=3D"_blank" rel=3D"noopener">https://curl.se/docs/CVE-2026-8023=
0.html</a><br /><br />Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@=
est.tech&gt;<br />---<br />Note: SRC_URI indentation is corrected by devtoo=
l<br /><br />.../curl/curl/CVE-2026-80230.patch | 68 +++++++++++++++++++<br=
 />meta/recipes-support/curl/curl_8.19.0.bb | 62 ++++++++---------<br />2 f=
iles changed, 99 insertions(+), 31 deletions(-)<br />create mode 100644 met=
a/recipes-support/curl/curl/CVE-2026-80230.patch<br /><br />diff --git a/me=
ta/recipes-support/curl/curl/CVE-2026-80230.patch b/meta/recipes-support/cu=
rl/curl/CVE-2026-80230.patch<br />new file mode 100644<br />index 000000000=
0..5a6bb35986<br />--- /dev/null<br />+++ b/meta/recipes-support/curl/curl/=
CVE-2026-80230.patch<br />@@ -0,0 +1,68 @@<br />+From 7d34e6397166b10600c2c=
ed93f95641d5e7c1575 Mon Sep 17 00:00:00 2001<br />+From: Daniel Stenberg &l=
t;daniel@haxx.se&gt;<br />+Date: Mon, 24 Aug 2026 23:37:49 +0200<br />+Subj=
ect: [PATCH] openssl: no server cert is only okay if also not pinned<br />+=
<br />+Reported-by: Stanislav Fort<br />+Closes #22660<br />+<br />+CVE: CV=
E-2026-80230<br />+Upstream-Status: Backport [<a href=3D"https://github.com=
/curl/curl/commit/5267ed859d545534d0c21675a2b70af5a3b6e3ef" target=3D"_blan=
k" rel=3D"noopener">https://github.com/curl/curl/commit/5267ed859d545534d0c=
21675a2b70af5a3b6e3ef</a>]<br />+<br />+Note: CURL_EASY_STR() macro does no=
t exist in 8.19.0, so the pinned()<br />+accesses data-&gt;set.str[] direct=
ly instead.<br />+<br />+Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheern=
am@est.tech&gt;<br />+---<br />+ lib/vtls/openssl.c | 26 +++++++++++++++---=
--------<br />+ 1 file changed, 15 insertions(+), 11 deletions(-)<br />+<br=
 />+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c<br />+index 1cf357=
c..cb6fcc4 100644<br />+--- a/lib/vtls/openssl.c<br />++++ b/lib/vtls/opens=
sl.c<br />+@@ -4607,21 +4607,24 @@ out:<br />+ return result;<br />+ }<br /=
>+ <br />+-static CURLcode ossl_check_pinned_key(struct Curl_cfilter *cf,<b=
r />+- struct Curl_easy *data,<br />+- X509 *server_cert)<br />++static con=
st char *pinned(struct Curl_cfilter *cf,<br />++ struct Curl_easy *data)<br=
 />+ {<br />+- const char *ptr;<br />+- CURLcode result =3D CURLE_OK;<br />=
+-<br />+ (void)cf;<br />++ return<br />+ #ifndef CURL_DISABLE_PROXY<br />+=
- ptr =3D Curl_ssl_cf_is_proxy(cf) ?<br />++ Curl_ssl_cf_is_proxy(cf) ?<br =
/>+ data-&gt;set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY] :<br />+- data-&gt;s=
et.str[STRING_SSL_PINNEDPUBLICKEY];<br />+-#else<br />+- ptr =3D data-&gt;s=
et.str[STRING_SSL_PINNEDPUBLICKEY];<br />+ #endif<br />++ data-&gt;set.str[=
STRING_SSL_PINNEDPUBLICKEY];<br />++}<br />++<br />++static CURLcode ossl_c=
heck_pinned_key(struct Curl_cfilter *cf,<br />++ struct Curl_easy *data,<br=
 />++ X509 *server_cert)<br />++{<br />++ CURLcode result =3D CURLE_OK;<br =
/>++ const char *ptr =3D pinned(cf, data);<br />+ if(ptr) {<br />+ result =
=3D ossl_pkp_pin_peer_pubkey(data, server_cert, ptr);<br />+ if(result)<br =
/>+@@ -4803,7 +4806,8 @@ CURLcode Curl_ossl_check_peer_cert(struct Curl_cfi=
lter *cf,<br />+ server_cert =3D SSL_get1_peer_certificate(octx-&gt;ssl);<b=
r />+ if(!server_cert) {<br />+ /* no verification at all, this maybe accep=
table */<br />+- if(!(conn_config-&gt;verifypeer || conn_config-&gt;verifyh=
ost))<br />++ if(!(conn_config-&gt;verifypeer || conn_config-&gt;verifyhost=
) &amp;&amp;<br />++ !pinned(cf, data))<br />+ goto out;<br />+ <br />+ fai=
lf(data, "SSL: could not get peer certificate");<br />diff --git a/meta/rec=
ipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb=
<br />index 0573e08ea4..c2697d6dd8 100644<br />--- a/meta/recipes-support/c=
url/curl_8.19.0.bb<br />+++ b/meta/recipes-support/curl/curl_8.19.0.bb<br /=
>@@ -9,37 +9,37 @@ SECTION =3D "console/network"<br />LICENSE =3D "curl"<br=
 />LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0515352b285b9c3f66464b135c9c0=
fdc"<br /><br />-SRC_URI =3D " \<br />- <a href=3D"https://curl.se/download=
/" target=3D"_blank" rel=3D"noopener">https://curl.se/download/</a>${BP}.ta=
r.xz \<br />- file://run-ptest \<br />- file://disable-tests \<br />- file:=
//no-test-timeout.patch \<br />- file://CVE-2026-6276.patch \<br />- file:/=
/CVE-2026-5773.patch \<br />- file://mbedtls.patch \<br />- file://CVE-2026=
-5545.patch \<br />- file://CVE-2026-6253.patch \<br />- file://CVE-2026-64=
29-dependent.patch \<br />- file://CVE-2026-6429.patch \<br />- file://CVE-=
2026-7168.patch \<br />- file://CVE-2026-4873.patch \<br />- file://CVE-202=
6-8286.patch \<br />- file://CVE-2026-8927.patch \<br />- file://CVE-2026-8=
932-dependent.patch \<br />- file://CVE-2026-8932.patch \<br />- file://CVE=
-2026-11352.patch \<br />- file://CVE-2026-11586.patch \<br />- file://CVE-=
2026-7009.patch \<br />- file://CVE-2026-8925.patch \<br />- file://CVE-202=
6-9080.patch \<br />- file://CVE-2026-9545-01.patch \<br />- file://CVE-202=
6-9545-02.patch \<br />- file://CVE-2026-9079.patch \<br />- file://CVE-202=
6-13608.patch \<br />- file://CVE-2026-80229.patch \<br />- file://CVE-2026=
-9546-01.patch \<br />- file://CVE-2026-9546-02.patch \<br />-"<br />+SRC_U=
RI =3D "<a href=3D"https://curl.se/download/" target=3D"_blank" rel=3D"noop=
ener">https://curl.se/download/</a>${BP}.tar.xz \<br />+ file://run-ptest \=
<br />+ file://disable-tests \<br />+ file://no-test-timeout.patch \<br />+=
 file://CVE-2026-6276.patch \<br />+ file://CVE-2026-5773.patch \<br />+ fi=
le://mbedtls.patch \<br />+ file://CVE-2026-5545.patch \<br />+ file://CVE-=
2026-6253.patch \<br />+ file://CVE-2026-6429-dependent.patch \<br />+ file=
://CVE-2026-6429.patch \<br />+ file://CVE-2026-7168.patch \<br />+ file://=
CVE-2026-4873.patch \<br />+ file://CVE-2026-8286.patch \<br />+ file://CVE=
-2026-8927.patch \<br />+ file://CVE-2026-8932-dependent.patch \<br />+ fil=
e://CVE-2026-8932.patch \<br />+ file://CVE-2026-11352.patch \<br />+ file:=
//CVE-2026-11586.patch \<br />+ file://CVE-2026-7009.patch \<br />+ file://=
CVE-2026-8925.patch \<br />+ file://CVE-2026-9080.patch \<br />+ file://CVE=
-2026-9545-01.patch \<br />+ file://CVE-2026-9545-02.patch \<br />+ file://=
CVE-2026-9079.patch \<br />+ file://CVE-2026-13608.patch \<br />+ file://CV=
E-2026-80229.patch \<br />+ file://CVE-2026-9546-01.patch \<br />+ file://C=
VE-2026-9546-02.patch \<br />+ file://CVE-2026-80230.patch \<br />+ "<br />=
<br />SRC_URI:append:class-nativesdk =3D " \<br />file://environment.d-curl=
.sh \</blockquote>
</div>

--y3fPQbs32sszXDKtH37I--

