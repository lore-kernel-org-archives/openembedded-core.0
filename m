Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18979D44C50
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 13:53:44 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36097.1768485221954063052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 05:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=f4AK98mC;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=AmpB2tzg;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1F0C37A0124;
	Thu, 15 Jan 2026 08:53:41 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 15 Jan 2026 08:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768485220; x=1768571620; bh=OTyWMMaRa6
	KGYqhrF/+cIdGUgQa6FNQISkAfPKP3mJQ=; b=f4AK98mCsQIsPeBKzcshlTT0uv
	QxyWLgtO583RcqNRy1GdhDdttZgIJH6l0D6HAWaXwCJ5RNruhUCTDmHNCzO1AiK3
	VENdyDCBTUIxo6zJPVFT+5mEY28PLXb7wo1ygzLxw2EzKVuPEBozbYwndUQEOglJ
	U0Dr6ffy7rGYspzwgIdlR3O2Wf239RAOM4eLHTZHKJtkHZgsCk74zDC/ppICeQAl
	sf8QUZJe72DQQCl76n2NdsqECF1IR8AKZagEKxBzMaiqQK7C5n5ECf/PwHLFZJ8s
	LvE0XtblQ8tawIo1+4Trp0VQq95TJzIIGv7yLrN+Fk2qK6DcP3zVArabHpVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768485220; x=1768571620; bh=OTyWMMaRa6KGYqhrF/+cIdGUgQa6FNQISkA
	fPKP3mJQ=; b=AmpB2tzggQJAgHfNVfPaZp6OYE/5tqb0ddCZCjjzrhROPxc7kpv
	vA9c9avLkt5LAwBrM3XvbI5mw0jePICJEvY+YCQ8Wz+j00xK7UTHHuqB3iz5XCFO
	oRdmefGy3GSjf9jo3wVGk/XGo7tl6lNwjSa2b+hCR+qkP1jn2rWTFKkwjYPIRwvD
	MgGzoC64FcOujKZkdW8lovAPXSiHpzKQlEv6ukTD1FIB3mkO8JSlt090qnLLz/Z5
	sKCUfUt90VSh/KWQ74KbdsVKLELXfOdsvPfMgeTK0hYnZ/AuMCdjWp+KmP32pKh9
	W7gY04YhEOUJQsJ2smaRzeA7AprhNpbOK+Q==
X-ME-Sender: <xms:ZPFoaaMs3B8wMCwSDvV-jy_JaqfDT79YNOakgS-3mk0fEanoT5p_ug>
    <xme:ZPFoae8Ssbk8uXUJTgzWoXoqkth25-doZUA9MSqYzsd7Xf_6_D8EmnCFL09EWAk99
    xFTHbzbCWrbvjrSovaTXVa9pM-j1UnvkYUzdfp5ObgaR-8EB-bi1Ws>
X-ME-Received: <xmr:ZPFoae6_BBKrUR9XNRstR5RMrj2PBJR3NWGgSaF5Idk_KzC5m3C2mV5d4makLufjKl1x9YcYX3NBQMFh8Jl_wg0Tf_YDIjqLxKEwrTnoXYBC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeivdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepheefffelieelleevudevjeegtdevfeeggfefte
    ekkefhueegffelffejgfdviedtnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpshgvlhhfthgvshhtrdgtrghsvgdpuggvtghorhgrthhorhdruggrthgrnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehp
    sggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehuvhhvrdhmrghilhesghhmrghilhdrtghomhdprhgtphhtthhopeho
    phgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvug
    drohhrgh
X-ME-Proxy: <xmx:ZPFoaV3Vt2vV6uOGRyfETDLiUtfrf4h60wOLJErz_yn0iNFZFJntrg>
    <xmx:ZPFoaVDkeUiDRFWIEeaZ1m7TuT0y7zHUzzh9AUL4pAN0yUxyehB_bg>
    <xmx:ZPFoaX0BXtahuPR-hHI6_BgaExpraPFP7KTbTbWG6nkCyqKF-_p0JQ>
    <xmx:ZPFoafuiLVwe-4fEg7AN1BFcwXWMNQxnzwZSqvIp6eQXDJkQHqOXNQ>
    <xmx:ZPFoaXdKFO-Banl5Te3puksw6cPk1pE_g-1zJjZafQVEe9sKaObNTVOS>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 08:53:40 -0500 (EST)
Message-ID: <b06c5771c4f1405605db5aa21937a12d0ad73d2d.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v3 2/3] oe-selftest: overlayfs: Make the test
 more deterministic
From: Paul Barker <paul@pbarker.dev>
To: uvv.mail@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2026 13:53:37 +0000
In-Reply-To: <20260114185508.380709-3-uvv.mail@gmail.com>
References: <20260114185508.380709-1-uvv.mail@gmail.com>
	 <20260114185508.380709-3-uvv.mail@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ICrnb69G2FvrqCNqM9jD"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 13:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229412


--=-ICrnb69G2FvrqCNqM9jD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-14 at 18:54 +0000, Vyacheslav Yurkov via
lists.openembedded.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>=20
> The test orignally was written under assumption that poky distro is
> used. When poky-altcft is used for example, then systemd is already set
> in DISTRO_FETURES, which the test did not expect.

Hi,

The commit title here still talks about determinism. The test case was
deterministic though - previously it would always fail if systemd was
already in DISTRO_FEATURES. I think I misunderstood a little last time,
but this still needs renaming.

I also wonder why we're testing this here. Perhaps this can be turned
into a more generic test that REQUIRED_DISTRO_FEATURES behaves as
expected - we can use the overlayfs bbclass as part of that as we know
it sets REQUIRED_DISTRO_FEATURES.

>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/overlayfs.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/se=
lftest/cases/overlayfs.py
> index 580fbdcb9c..3e55e97927 100644
> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -5,7 +5,7 @@
>  #
> =20
>  from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
> +from oeqa.utils.commands import bitbake, runqemu, get_bb_vars, get_bb_va=
r
>  from oeqa.core.decorator import OETestTag
>  from oeqa.core.decorator.data import skipIfNotMachine
> =20
> @@ -46,7 +46,8 @@ inherit overlayfs
>          res =3D bitbake('core-image-minimal', ignore_status=3DTrue)
>          line =3D getline(res, "overlayfs-user was skipped: missing requi=
red distro features")
>          self.assertTrue("overlayfs" in res.output, msg=3Dres.output)
> -        self.assertTrue("systemd" in res.output, msg=3Dres.output)
> +        if not "systemd" in get_bb_var('DISTRO_FEATURES'):
> +            self.assertTrue("systemd" in res.output, msg=3Dres.output)
>          self.assertTrue("ERROR: Required build target 'core-image-minima=
l' has no buildable providers." in res.output, msg=3Dres.output)
> =20
>      def test_not_all_units_installed(self):

Best regards,

--=20
Paul Barker


--=-ICrnb69G2FvrqCNqM9jD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaWjxYREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bpFDAQCScpM8CV9ffH1GNEAvqi9H15DhUIWpUJsq
QL1686Et6QEAztcF1+FVcPM3XofK2gEjEHkF//LdOfrLHfDfISVHOA8=
=riXh
-----END PGP SIGNATURE-----

--=-ICrnb69G2FvrqCNqM9jD--

