Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52853C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 19:33:30 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5200.1782761595760021301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 12:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=jLoxO9tO;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=HNnpsOGv;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id B82CDEC00F3;
	Mon, 29 Jun 2026 15:33:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 29 Jun 2026 15:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1782761594; x=1782847994; bh=VrsTgKkd2HDUCBIpGX7tdFsFSTtb2nwR
	qIRBK9Q+SSY=; b=jLoxO9tOYTglELT5DVMPX1k1uUET7iMQrhqy0+aMQQH9bmKb
	e3sszVUZ28MHA5JGBLqI16nlIrVuvnAeONlqXIsXNkzLixtOTmLAK1HTMAkQ+5O2
	tfqadoLG928ST6XwTArxGEU7fOTHs3YuqWHktWRyDz285ei7/y8an6cURgUsq3fg
	9TNVXY9GcIt4D5X7VXvArb86Opowg2lsiI39WkvWXdI66GZmru9Ckg8axjLwb7Zx
	b8WY6NU/AQBa1BcR6UflSMt4GfomfQnDfoGQ2dmSeZ91ZW8SBioY1Ccu6PtzxV1r
	GPXdg1KdKJuUY+mkUP/ES25eKXWmOpBOBT/kBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782761594; x=
	1782847994; bh=VrsTgKkd2HDUCBIpGX7tdFsFSTtb2nwRqIRBK9Q+SSY=; b=H
	NnpsOGvi1BYhCWwoVPfZz7usVG5KMg0Uz1eDIWhmXBFlK98vMpv2LDywdLBf1Syj
	jL+xDjJJsdKRVVMUE+rHYfeEG6kucav5W4/88XlLD+72eLWM9jmFChTKOXKIAezY
	7MfBepJekO6eBNJK8Bbkd9RbRLWXzGMAMXDxQ0/Kcwip11Qrk6v/+FJPH2IDPj+H
	vwcImR0IEIMR41uUDvL7nffYi1DgEu7GnR9RZp8O1PI9JT7nJvun5VFU5U21rsx/
	7csQSYUABJUXMs2XgLoDd8vS8VLV5yltSlfK8ysdAkOMq/LMdBZPnVIrivf/zrPP
	h5Z1vEbNq20Niq+PNidKQ==
X-ME-Sender: <xms:eshCaoLOIoAdDvoKQ4gwZesIe7SujzNGoxr-i33JUqA0yXEjlJloHg>
    <xme:eshCaoQ6xPo-ocsyVTM5hcrOfF4BME0GTNhLLjtfjDJUQ1G5sLFk-v9RQW-2Up3BA
    83THDa9xOE6kQ_yUreiiIWycZmmQien8TsYGee_-h6EARBX08kWz9w>
X-ME-Received: <xmr:eshCagqMoukCYNgL_3Q0D7QcJZrcnHIQWRN6djDhS5ZBD00dntXO1fCWQXwOPD6ZdEflENQth8U3ORMaEdYe7j6TdjbbsEyZzNuFr0KsjPOV>
X-ME-Proxy-Cause: dmFkZTEch/UdIqCSl3iOOV1WImcVs2RRAhCVLoSp3C21CEc2fJtoTExUxnhftV2GUZF8pF
    55214FAJl9eai2kf+4uBUcDimCoUBxM24q+jNdaoTlZP7t4lyKdE+jC8JfjZ+GnWBbeLSY
    T0kySNpGeSXFeVtnpiZgeOetWgagAOILvSuDpL+3gyvtWm8MsII4SBTrs5J/81SIcwxj2g
    2DwZqwR8JL/2tGfLZsqXRuqFX8cDQKhRn4WIVhUsR0zvNfmpwsGDbCmN5q9AZsgxXYXAHi
    ITxxwy/bHQ5NxcUK+JSohsMlp6tZcQ+NJbG1cGAeFCPGAJFnjc1y78O41g3H9E+Ux1Idbu
    fiuLG1LJGcuSyxQ8Mo8WNbNtV4qfx47uFbbHfnBMQzeJAF+F27rM7TF8NkzLWPqjsMQGug
    EqqoBpO51tJEBmTDyr8qpd4nWDcDx7VCh5zZ45oO6stlbNkTEhX7HH49mgWRRCjrKWP199
    /9v946WPW2Hz+tegcgcsQgPPZDFWXR6dJGNx/7wbKCLf0+HMaWoCpyKUS5wq8P1PmFHn3A
    zmOHeuHsfCVYkY6gGSrJKHdrSz8HnGcP1/gdK+GBTJlqF8zyLm1ICctjstfk0DFWCBcL9u
    cBeN58fdrwH9hcMqEJ2hD2nVf/m1F50SUb/y+lDh2iDNYoit8WXTsc56ui0A
X-ME-Proxy: <xmx:eshCatpcbay1dVwKp1cFE8DbYpjwtkm__S6KDWfIewzkKWr2616UxQ>
    <xmx:eshCaqNy3r59GFWU9sUj_Svg76U0x08VFtMnfPvSI9hxFJN3mzbFQQ>
    <xmx:eshCamxPGQFwDoMbT0m2GAivZ9COKwxaTPwBvqUaYSPXIaJujPDzZA>
    <xmx:eshCarsO88Gxv0CmQt9_X9iqZYB556uAtNn12FZ1Yzx_uTbXzeImEg>
    <xmx:eshCarCim53W36ywfb5JUzTuzMAEXFf8PYKvzddDksxUZZ82UkvHuXjh>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jun 2026 15:33:13 -0400 (EDT)
Message-ID: <4ac849a706feb16688020d5bcc3e74aececd63cf.camel@pbarker.dev>
Subject: linux-yocto CVEs in need of triage
From: Paul Barker <paul@pbarker.dev>
To: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>, linux-yocto@lists.yoctoproject.org
Date: Mon, 29 Jun 2026 20:33:10 +0100
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-0XEesQ6whmklxQQjMezh"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 19:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239823


--=-0XEesQ6whmklxQQjMezh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

We would appreciate help triaging the following CVEs filed against the
Linux Kernel, which therefore affect linux-yocto.

Each of these is missing an upstream fix version in the CVE data, so
they show as unresolved in our CVE metrics. However, they may well be
fixed already in the kernel versions that we ship. So we need some help
to determine the appropriate upstream fix versions.

For each CVE, at a minimum we need to know if they are resolved in the
mainline kernel, and if so then which release they were resolved in. A
pointer to the exact upstream commit resolving the issue would be
preferred. This may involve a bit of investigation, so please share the
information you find that proves that a CVE is resolved in a particular
kernel version.

Once you've investigated a particular CVE, if it is resolved upstream
then please send a patch to update the linux-yocto cve-exclusion.inc
file with the appropriate information. See recent commits to this file
for examples of what we need, e.g:
    https://git.openembedded.org/openembedded-core/commit/?id=3Dded28ca69b3=
26e51ac5cf363f06c6f0931a9c1bd

Once we've got patches merged into the master branch, we can look at
backporting to wrynose & scarthgap as appropriate.

The open linux-yocto CVEs lacking an upstream fix version and not
currently tracked in cve-exclusion.inc are:

- CVE-2019-14899
- CVE-2021-3714
- CVE-2021-3864
- CVE-2022-0400
- CVE-2022-1247
- CVE-2022-4543
- CVE-2023-3397
- CVE-2023-3640
- CVE-2023-4010
- CVE-2023-6238
- CVE-2023-6240

Best regards,

--=20
Paul Barker


--=-0XEesQ6whmklxQQjMezh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCakLIdhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkNtAQD9hQerlmRpBQwUSQc6EMfranRD7L4DHbGX
yek6XnvHBAD/d8EmSza+X85R0Zc31rD4QVRD2ONw7Hs64qJxTtjNggI=
=wGkH
-----END PGP SIGNATURE-----

--=-0XEesQ6whmklxQQjMezh--

