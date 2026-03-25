Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53753106B535
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:09:26 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22191.1774444164883707223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=FhHPpZ25;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=AJCEM9ya;
 spf=pass (domain: stwcx.xyz, ip: 202.12.124.155, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id ECC0B7A02AA;
	Wed, 25 Mar 2026 09:09:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 25 Mar 2026 09:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774444163; x=1774530563; bh=oJeAoVPXY0
	A9cYHeKI3YaicTMffOyT4AfkXRxIadgbc=; b=FhHPpZ25vGf0Uh6RaeYjxxYP2O
	y/BKpPJVoCc36r5OQl7+ZHNL2i54aIKgBLAWP1IWIx5lr3lIbMv/D6V6hn6QKdH9
	ut07tvws/kapEemDM3BdhYAEtbyLldDIgj/KiHAUJI6x/8+cGz0uueQk/6tjMTit
	ir+vR1pxM+PWSoNR31uppxwBTvyp//n8PYpdBplnh+PyV8FPMKisHtCuhSfiI8FF
	FB6rpmxDO1hJDMnasacAIM/yyR/jsu3ikeBlRyRsRfG8ctFw4p+vRsKJ3hVejVFJ
	WjDiZ58xFjM+1xCOibjQVU3Gh5AmCZYaWY6m+Krvmgm8F1TdMEzG9pCqVo3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774444163; x=1774530563; bh=oJeAoVPXY0A9cYHeKI3YaicTMffOyT4AfkX
	RxIadgbc=; b=AJCEM9yadIRXdVhI2vvT86UeMYa2FYWW6ukyR4Yv4iaPWnrRV0t
	SvTKYcAIa2dcZirFZyDgRFCOjowI9IsX0y3crazWlOsZcgvAcqke31TjjUczKorf
	JwCTs5i1s3T1AOtQ6wcA6VR+LunqblhA2898vmbV7mXwgC36ZV7a9JlXnrNhcNS+
	lFHpvj591vcsaeWwlnEeE9fdZuYX9LDt0mG+5p0ORDu1WA3sS2p4yxsIy/t3ViW0
	W95EuiZdNlHnRKgbNDG0pkawni+k/QkYPbvZq4stSXN5uXsSXJZhUgKkwzyDB+LY
	03GfPXlvbyJwvKAsH73kDYQkp5ngm34YdXA==
X-ME-Sender: <xms:g97DadUTaJ-qvZIraI8JXnwR92OFV2EPCsnYF9dAid7DS4onUg1c5Q>
    <xme:g97DaTlvETgomHRgGP3UcOU2sLurJZ_7q-jyV1kvmpk_sbYZKkaPCU021cEoOdZjP
    s559fubRYbSEpQqkdZGj60SdOY96A8xqVpkKdqfeIj1M-7LmFaJ9PI>
X-ME-Received: <xmr:g97DaXCHLrQnc31E3cepdlr6dRdx-gSYjA0HD2vHgi8ZiSFGH5i1b2rD8WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredttddu
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeektedvhfevveegkeeiieeijeelgfdt
    jeevfeeileeiheeifeelheekjeefvedtkeenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhphhhoshhphhhorhdquggvfhgruhhlthhsrdhinhgtpdhkvghrnhgvlhdrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
    hitghksehsthiftgigrdighiiipdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunh
    gurghtihhonhdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgv
    sehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:g97DabeTmKhVbyZD7oQZ2Iohbu8tSWSCO4iZJLbhxX_a-So87PyIZg>
    <xmx:g97DaaLMJ6bPHUxuU69VRhcSY22TG8hr322Jet7z7RqUr7y0NIDPmw>
    <xmx:g97DaWeYuz-nPNPK5odR6GwnK-A_0sa5z8q_jff4KOq-cs02FpT1ww>
    <xmx:g97DaZ0gVVqtukINm1E6mXKW4XKfPA2nPqqk7kwCsnYbHVDZyS4Adg>
    <xmx:g97Daf7ESkG_kuO9_nDD6kHFrzd4W51-C-TDosKsWvyQUkcTIddFUdi7>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Mar 2026 09:09:23 -0400 (EDT)
Date: Wed, 25 Mar 2026 09:09:22 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gcc: fix buildpaths QA with LTO
Message-ID: <acPeghejSsdzRunU@heinlein>
References: <20260325113951.1278864-1-patrick@stwcx.xyz>
 <acPLE7KjSfvxXthX@heinlein>
 <9a222b692f97515655dd8dad792246068410d660.camel@linuxfoundation.org>
 <acPYkLXfOoJmv2lm@heinlein>
 <181c419f20d806fea2a81c2b1ee18774fbdd0b2e.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aBe+TQHmCh4eHKcQ"
Content-Disposition: inline
In-Reply-To: <181c419f20d806fea2a81c2b1ee18774fbdd0b2e.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 13:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233909


--aBe+TQHmCh4eHKcQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 12:53:28PM +0000, Richard Purdie wrote:
> On Wed, 2026-03-25 at 08:44 -0400, Patrick Williams wrote:
> > On Wed, Mar 25, 2026 at 12:34:52PM +0000, Richard Purdie wrote:
> > > > > With GCC 15.2 this can be noticed by setting many meson-built pac=
kages,
> > > > > such as systemd, with:
> > > > >=20
> > > > > =A0=A0=A0 EXTRA_OEMESON:append:class-target =3D " -Db_lto=3Dtrue"
> > > > >=20
> > ...
> > >=20
> > > We're not seeing the error with OE-Core today in any of our automated
> > > testing. Reading the above, it implies that we should see some kind of
> > > failure with some components auto-selecting it? Something therefore
> > > isn't adding up.
> >=20
> > I tried to give recreate instructions here.=A0 OE-Core doesn't actually=
 do
> > this so you won't see it unless you enable it.
> >=20
> > OpenBMC has a large number of meson-built packages which are generally
> > safe to enable LTO on (but in the past I've ran into issues with other
> > packages not building with LTO; now with lto.inc I should revisit this).
> >=20
> > We have a global enable for all meson packages:
> > =A0=A0=A0 https://github.com/openbmc/openbmc/blob/47d900012a93d79ab536c=
a172fc01cd89645a0d8/meta-phosphor/conf/distro/include/phosphor-defaults.inc=
#L153
> >=20
> > When I upgraded to an OE core that had 1797741aad02b8bf429fac4b81e30cdd=
a64b5448,
> > almost all of our packages started failing with buildpaths.=A0 I was ab=
le
> > to track it down to this problem.=A0 systemd and libpam are two that are
> > OE or meta-openembedded packages that I saw fail this way, so I gave
> > systemd as a clear example.=A0 Like I said, we have a lot of packages in
> > meta-phosphor[1] that we have enabled LTO on and they're all failing
> > with buildpaths QA failures without a change to pass along
> > DEBUG_PREFIX_MAP.
> >=20
> > If it helps, I can upload the objdump content.=A0 There was DWARF data
> > being inserted by the GIMPLE intermediate which wasn't being stripped by
> > the linker that had my build path in it.
> >=20
> > [1]: https://github.com/openbmc/openbmc/tree/master/meta-phosphor
>=20
> My question still stands though - why don't we see this with systemd or
> libpam in OE-Core?

Because you do not enable LTO on those.

> You're asserting we need to add this to our default config as the
> output is broken. We don't see those failures anywhere in our testing
> (which definitely includes systemd).
>=20
> Are you passing specific config to systemd or libpam to enable lto?

Yes, via a global EXTRA_OEMESON I pointed to above.  I only referred to
those because they are packages you have that can easily show this
symptom.

> I believe that if this breaks when you set certain configs, these
> workaround belong with those configs.

Ok.  We'll just keep it downstream if that's what you want.

I pointed to [1].  I do think this should at least be included in lto.inc
because otherwise lto.inc is similarly broke for everyone.  I'm guessing
you don't have an upstream test that enables lto.inc (yet).

I will argue it is a really bad experience for people though to _not_
have this in the default config.  It took me about 4 hours to track down
what was causing buildpath issues in previously working packages when
upgrading the OE-Core base, including tracking down the underlying gcc
bug.

[1]: https://lore.kernel.org/openembedded-core/20260204052638.284617-1-chan=
gqing.li@windriver.com/

--=20
Patrick Williams

--aBe+TQHmCh4eHKcQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmnD3oEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEKsDR8wtAMEZg+oQAKgCXa0RFPoWmQ9/uBfp
itByzvXungst9aap6Fglx+ZsxN84W5PU08l9CY+R6CVKG45cn3vRIcXUpIO7TCq9
cCC5q9KtdqNVFXPXLzpVMAXCES2IuJKyRIVJFr2R3nrONRlN2AW2BCmPaYM7deq8
UXWoCX4RHh3vt/Ef5lbHLb2tqYaZY5KpoZSL1JZ83/rZ/0Ium2q+Uz5MnnTiUYDH
1/pYY0xuQH+k94uAwFiIbsRk5JcI21YDo7jrl9nJwqavjwz9xjWgJWXtks6m8pNw
jtbLOFQdjElU6B+nCKHVgdwNm4XQzHTo/Dh/6f9fKG5HUDa1t9bk8XoJULAnZkmS
Jl19pHNnUyyDdDdRXm2x0EoC7SfQKtcDE7PUV7rCLP8yjyPkgSqNMJVLQJ/0s+yu
M6ZvTAt619/c7XTz8wgB6mg2L0+9CL1iDFdPiLxQANqKnddp0H2/Htx75ePjV5BV
OAxDep//D8wtkFoGaJRi8F81Mgi3dxks+wTUuZb8g0nPZRwsip52WU44sKiuhWi9
cPuWncgzCiAJp4EbxXFKAhBN9Qw8dwB8TkVMddnLZZ5bPZEmWKzPUVMnRFSDo5bN
ufdsk2BVmRHd3M3MH/tY4cvBqYfoDafydWKnmiltvTJidMPOzHx/HH05FwIICnW2
nh7y+k4FtmhNEONobQ2wXj4w
=20k9
-----END PGP SIGNATURE-----

--aBe+TQHmCh4eHKcQ--

