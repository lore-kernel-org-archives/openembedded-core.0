Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BDAC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 12:50:21 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29929.1785156615658549929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 05:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=qg53l47Y;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=GruLlLhW;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id F20351D00268;
	Mon, 27 Jul 2026 08:50:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 27 Jul 2026 08:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785156614; x=1785243014; bh=QMTVBaX4zE
	L3GlxWc5n7TKs5wSB1C8KShajCdqP6TmU=; b=qg53l47Y+rlRMeXjWujEMFX+X9
	0bp2xelUPEYx4md/+2ouE+RMO2xujn8QhzjoWbjwlzSviFUE6nPBi4l+6y0QNpPL
	HVe0/GG3orzS3lDa+F4pPu4XDalOAXi4Mqs4iljxDJsTni0xfK8XrbpDzIbCQHHO
	VNvooZdE+W/s8R+X+7Xa+ySyA4AfmS8X7BwdmqfbkVi4lpOjLgLcf1wre9+cmlIQ
	0fJlsk/hQh6q67nmYPLZ2rBk7QQKYyQSJ9aVpXKXybC4aqqvMs1dx7SzleipC0jF
	jLYF0a54qrztcImBxLU1u2mRRWfKGC1yXs9tav27iZxisstGBZw/vuemtGUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785156614; x=1785243014; bh=QMTVBaX4zEL3GlxWc5n7TKs5wSB1C8KShaj
	CdqP6TmU=; b=GruLlLhWXoxCB0YJQKYoonaIbLIuxkL+zSBhyU7FM6FFeH6rFeP
	N97SGXLmpKDtUNLwPnXizxOM8PPnhW405PukNy94BnTF06h5YW8Iy0xvk6c+J1AV
	lgJnbNYCtI0ffrQ0629av44Q30WwerfHlRm/3S2bLbGoSZQuQllqsh2sCdz/YM1K
	AabAbvER79RdDxxM/JXCCHO4Ibo3ivbUSjB3YVHeAppDNwueNRpAYSO2BDS/n+60
	IP1HgG6SxH23UKr9cuRaPVBIiaSpQC/YLDnkTiYGTZUOXepQuJC7Ae83PgUzBIP0
	QB9jeF1QW+3/zvpWD8+PrhRjOdGRDy/c/qg==
X-ME-Sender: <xms:BlRnaq8ZB02YIO9i8UopifY3VcdjDvyYcAhLLuBl22phRiZsPPCQJQ>
    <xme:BlRnagvJAHWpg6dEN1O-O6eBx4_Ohl4e1UQmIQjruicDxS9hwCMIvOEPOQpO5iui4
    zh2hfF8iewyPnnEPqCJ3Elw7OqDIXXmBDpvXFP4L4GK5LpqdXg31AQ>
X-ME-Received: <xmr:BlRnatpxYpoRe1p4Pq68OHW-hWqczzqAbAe5jh69vDqKInk3UDQzj59ogs3UMwRrYKC7FmfI5n5u7ajtilg3KQaEfFul60TjzuutTZVrG2AD>
X-ME-Proxy-Cause: dmFkZTEk6ruK2XtS37vpamjehzu3G6S6AevjguRG8tjia54fzokzbKtaD474clZ9UGutzG
    69cBDkrqE7EPG/pRa4R6Xxcfog/V3/7FTIpdUPYGiK1DvGyOTzIzOSqg4VA2fa2lqfc3WR
    zEsXn7M+B3rBCSecNHGoQYgcuCLGezV3bw1NKc5zUxh2Oo/qyYIgByQKcx3Ln6/wnXvvzp
    oWRSJsyVkoMHc+kQ8vzbop5gTUHfhFD3YIJWiIPtXc3u6xyTcMYqEFpD6Gp0R6Zww1PUJE
    EW4YHcMhRd+xg7ueTJMYftSi9KjmwuNxyWqMeDcgZRYDz7uxTviF3YmZNh3cOjVkus0NGT
    FyUKZ6I802jJpMKrey6GJY2/SrkhAPs5Eia/cWD4Ua6lQXpldsv/Y9KaIcOBeCGMVHWo+9
    5LtEP4TKpdYyJEqYG68aw1F/freGWF6/1Fa5SGUkQBmnZk+Q37lFWjWYQJb70mqL3yAM2R
    33SVBb9ctQSZUBzNG4mIUmJvdMNUmYwALahylr9u5rCBORlnfXJVVR26IPk4y3cW+igk1p
    nYmCvTMycPfmEXmKZT6XsGAOuK4IbCsCQH7Vc6H4cyXWReDBcMsbP4WRWv0qZHXy83s/j7
    kccxpFb8XBUL0krK4MeksOcUPOzUrpQBLQymyANi0HXF205rGKTo9S5YTJNQ
X-ME-Proxy: <xmx:BlRnatmeBleFuxMMBgBOfnJXWeHXWgtGMAZdWWWlxgONVKCJgSS29w>
    <xmx:BlRnahwWW4j4l5D55OBpUrurpF5_3gUef8fet7JqToIqrXKq_eAfSg>
    <xmx:BlRnall9DSxd-gW_woiJkhom7JS8ZYm5vww22jMdMTRf91mo8w_PLg>
    <xmx:BlRnaqcH_XcX2LufuIvQrxQQCUzbw-NzuxbEtBQj9dFKlGX_kiHKow>
    <xmx:BlRnarsdrpxxULelMmVQ878g3ddAas5-8Oi0YKWdA92IQDv8_jszJ4eh>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 08:50:14 -0400 (EDT)
Message-ID: <c2a720b2ece56ec5463957fadb990128b947c8fa.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose][PATCH v3 1/2] curl: fix CVE-2026-4873
From: Paul Barker <paul@pbarker.dev>
To: deeratho@cisco.com, openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2026 13:50:11 +0100
In-Reply-To: <20260727120136.3147887-1-deeratho@cisco.com>
References: <20260720113041.2479444-1-deeratho@cisco.com>
	 <20260727120136.3147887-1-deeratho@cisco.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Ymd1DhZzuBh/Q+hTzGKg"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 12:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242096


--=-Ymd1DhZzuBh/Q+hTzGKg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-27 at 17:31 +0530, Deepak Rathore via
lists.openembedded.org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>=20
> This patch applies the upstream backport for CVE-2026-4873.
> The upstream fix commit is referenced in [1], and the public
> CVE advisory is referenced in [2].
>=20
> [1] https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a6=
6e7d865
> [2] https://curl.se/docs/CVE-2026-4873.html
>=20
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> - Changes from v2 to v3:
> - Updated the patch to include the fixed commit instead of CVE_STATUS as =
per Paul's suggestion.
>  .../curl/curl/CVE-2026-4873.patch             | 32 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch
>=20
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-4873.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-4873.patch
> new file mode 100644
> index 0000000000..cd9d81a25f
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
> @@ -0,0 +1,32 @@
> +From 507e7be573b0a76fca597b75ff7cb27a66e7d865 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 24 Mar 2026 08:35:08 +0100
> +Subject: [PATCH] url: do not reuse a non-tls starttls connection if new
> + requires TLS
> +
> +Reported-by: Arkadi Vainbrand
> +
> +Closes #21082
> +
> +CVE: CVE-2026-4873
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/507e7be57=
3b0a76fca597b75ff7cb27a66e7d865]
> +
> +(cherry picked from commit 507e7be573b0a76fca597b75ff7cb27a66e7d865)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/url.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index ec0457b..cc60468 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -748 +748 @@ struct url_conn_match {
> +-
> ++  BIT(req_tls); /* require TLS use from a clear-text start */
> +@@ -899,0 +900,3 @@ static bool url_match_ssl_use(struct connectdata *co=
nn,
> ++  else if(m->req_tls)
> ++    /* a clear-text STARTTLS protocol with required TLS */
> ++    return FALSE;
> +@@ -1357,0 +1361 @@ static bool url_attach_existing(struct Curl_easy *da=
ta,
> ++  match.req_tls =3D data->set.use_ssl >=3D CURLUSESSL_CONTROL;

Hi Deepak,

This patch file has no context lines, which makes it brittle. Please
send a v3 with the usual 3 lines of context (that should be the default
for git format-patch).

Best regards,

--=20
Paul Barker


--=-Ymd1DhZzuBh/Q+hTzGKg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCamdUAxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0boKUAP44RHtLjVzsR/m9C3IQhxnjmH5NDqUiHRKE
upKujovV3wD+K5DwAg6Tskk39P4vVXCASfsLLETyPu+Zedk2wEwcwgk=
=P2hJ
-----END PGP SIGNATURE-----

--=-Ymd1DhZzuBh/Q+hTzGKg--

