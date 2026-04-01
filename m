Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852B510F6FC2
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 15:00:23 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15289.1775055615299289067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 08:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=j5/ETz30;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=jy/X9BRY;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 68EB21D0021F;
	Wed,  1 Apr 2026 11:00:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 01 Apr 2026 11:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775055613; x=1775142013; bh=LCj6FALpgF
	Y6uFXPXp7WfySdqv111anNyAk/e7TAs7w=; b=j5/ETz30sQqucw5YvGoIJ30QJo
	RUQyENp1zMx+uliuq84GQ7XUub7BvEHsYbFfyhikFsKb6x1JCVnAw8RxibEYnHen
	E0tTlCy7IOcHK3FYeXB3gy7dwfVxIfFPdQ2UDuLl8gBvB1pZTZVgJ7oOl54c8FUX
	1kmIOW8ASeKArQ9ZwFCD6rAaHRvsFBr2h/1IfY1KvcA1oQv0aZ2GdffHO0xPMyNz
	sMxdiVk/XOoE+1UQyC5oKQKeL0j8XA2D5cJ6xFa6H6lzShpaiz5kuePI3w+biVjk
	Sk0ofGIc0x33TD95zjySKscr/32mLZJzzIm19HKkzBmOXjaiKWFZKYy8/y5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775055613; x=1775142013; bh=LCj6FALpgFY6uFXPXp7WfySdqv111anNyAk
	/e7TAs7w=; b=jy/X9BRYUKocFcfSjElVEckIT+lEucGbPj/uC5fwu4xaXkpvY7K
	NlpoEFPm104HHd1z22bPb0Yy8uIixU0Aup51kUWS3lfCFyCByEcUBrzb0+sJyY64
	pXLJLMuHoWbvbbnnXCm31IsO2Svmy9HkW6OyEQ1ufrvO2SUhB34fw4nMM4yMlO0Z
	8Wv9zzYW/5YrJ0E8ACiWyRYAW6krOji/bnsHcl4sI3JN5ftHMKgytUTz8MrIc6bG
	p9CJnpXrnLLrIwWuqtL5JHXepVcrddCfX9SkDvENZ182pAw1SHRAF2H2E8hWUdUP
	6jkuNsyAPi2d5pszqpt7Y+kayaBR5J7uwfA==
X-ME-Sender: <xms:_TLNacqXOq0MwUZZotnqQNAymj7U5lx5pkrTwL9fHK30FmDKOfkwAA>
    <xme:_TLNaYq8HVko2_ImpA-QjkPpp7qtk6b1YJcm8KGikIRtdEDWCHG4d58ET3PZh1GvH
    d317DTh7chHffgl4D6Uwqz2GidCmCwfv1mhRsq0CCHXbTEZxxsRfg>
X-ME-Received: <xmr:_TLNae04jlgUgSsxa2B5VigQdlAOn73FvS20c6zSHQZc-hTAX3I965sgWmt2t4w4THE8D6-ysY3GuEqUs7W8IzGIdiesmowiFWzAU-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefgedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhush
    hpvggtthffohhmrghinhculdegledmnecujfgurhepkffuhffvffgjfhgtfgggsehgtder
    redtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeffueehudeigfehjefhhfehledugeduiedt
    keehieejfeffheehfedtteehuddtffenucffohhmrghinhepshhouhhrtggvfhhorhhgvg
    drnhgvthdphihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpd
    hnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrght
    hhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhrtghpth
    htohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggv
    ugguvggurdhorhhg
X-ME-Proxy: <xmx:_TLNafBzCaTnnUz-JLFeL8bHBkhhcf2zjGpgOaIzpVVYKF1CJ2VgJA>
    <xmx:_TLNaed6NkHaBXorZsdCy5sRuvRnxEZO8b7Pp7UzO3fu3Xh9tD1XKA>
    <xmx:_TLNacjJKfOsvFGqE5zaDCsGHFA612OTiWkROPgRFbRhLL7JBKQaog>
    <xmx:_TLNaepMCWS_Spefj9dCZJr20nfsZdfrqHZPEQ1lcaSV9Nz1EftwkQ>
    <xmx:_TLNabNC_0zx_tNJHj_6eV5rMB8Li0RoAYSXcjSttAkzWFol0kOeZuhO>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 11:00:12 -0400 (EDT)
Message-ID: <bce752cba2de4c73f578c9e4cc82c64b1f5cd4e0.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2 2/4] meta: Support opting out of any distro
 features
From: Paul Barker <paul@pbarker.dev>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Apr 2026 16:00:07 +0100
In-Reply-To: <DHHW9Z7VY9QK.21JDBWP884LXH@bootlin.com>
References: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
	 <20260331-default-features-v2-2-f73b43d8bd57@pbarker.dev>
	 <DHHW9Z7VY9QK.21JDBWP884LXH@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qDTTHP8ri21ZUN79vPlI"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 15:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234442


--=-qDTTHP8ri21ZUN79vPlI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-04-01 at 16:40 +0200, Mathieu Dubois-Briand wrote:
> On Tue Mar 31, 2026 at 9:29 PM CEST, Paul Barker wrote:
> > Add default values to DISTRO_FEATURES using the new
> > filter_default_features() function.
> >=20
> > This change obsoletes the variables DISTRO_FEATURES_BACKFILL and
> > DISTRO_FEATURES_BACKFILL_CONSIDERED. Instead, all defaults are added vi=
a
> > DISTRO_FEATURES_DEFAULTS and users can opt out of any of these using
> > DISTRO_FEATURES_OPTED_OUT. Hopefully the variable naming here is easier
> > for people to understand and remember.
> >=20
> > Migration notes:
> >=20
> > - If you have previously assigned DISTRO_FEATURES without using
> >   DISTRO_FEATURES_DEFAULT, you will now get the default features added
> >   automatically. You will need to review these and add any features you
> >   do not want to use to DISTRO_FEATURES_OPTED_OUT.
> >=20
> > - DISTRO_FEATURES_DEFAULT is now unused, the new variable name is
> >   slighlty different to ensure that it is not accidentally used if a
> >   layer hasn't been modified to adapt to the new naming.
> >=20
> > - If you previously set DISTRO_FEATURES_BACKFILL_CONSIDERED, use the ne=
w
> >   variable DISTRO_FEATURES_OPTED_OUT instead.
> >=20
> > - If you previously modified DISTRO_FEATURES_BACKFILL, don't do that.
> >=20
> > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > ---
>=20
> Hi Paul,
>=20
> I believe this is failing in some cases:
>=20
> ERROR: libtasn1-4.21.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-=
worker/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/libtasn1=
/4.21.0/temp/run.do_compile.3668072' failed with exit code 1
> ...
> > gtkdoc-mkhtml 2>&1 --help | grep  >/dev/null "\--path"; \
> > if test "$?" =3D "0"; then \
> >   mkhtml_options=3D"$mkhtml_options --path=3D\"/srv/pokybuild/yocto-wor=
ker/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/libtasn1/4.=
21.0/build/../sources/libtasn1-4.21.0/doc/reference\""; \
> > fi; \
> > cd html && gtkdoc-mkhtml $mkhtml_options  libtasn1 ../libtasn1-docs.xml
> > warning: failed to load external entity "http://docbook.sourceforge.net=
/release/xsl/current/html/chunk.xsl"
> > compilation error: file /srv/pokybuild/yocto-worker/qemux86-world-alt/b=
uild/build/tmp/work/x86-64-v3-poky-linux/libtasn1/4.21.0/recipe-sysroot-nat=
ive/usr/share/gtk-doc/data/gtk-doc.xsl line 11 element import
> > xsl:import : unable to load http://docbook.sourceforge.net/release/xsl/=
current/html/chunk.xsl
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3345
>=20
> Can you have a look at the issue?

Hi Mathieu,

Thanks for the heads up.

I saw some issues in an oe-selftest run after sending the patches, I
have a fix for that. I'll run a qemux86-world-alt build to confirm I've
also fixed the errors you saw.

Best regards,

--=20
Paul Barker



--=-qDTTHP8ri21ZUN79vPlI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCac0y9xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0biCwAQCXZET0oN1t1vOtl7tzZ0WkL7cyViE8kIpZ
nku9bAzyAgD+LqSMo17xKeNU8yKGAkRG1fkg7Xl+l2epZKEAl71ELQE=
=F5io
-----END PGP SIGNATURE-----

--=-qDTTHP8ri21ZUN79vPlI--

