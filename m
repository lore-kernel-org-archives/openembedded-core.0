Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BECDCCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 18:40:15 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.800.1762195209072793493
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 10:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=R0YKaFpv;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=kZz8W9T4;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F2CB67A040B;
	Mon,  3 Nov 2025 13:40:07 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 03 Nov 2025 13:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1762195207; x=1762281607; bh=TMe1fJfCip
	i+Lh+mJA9z0omtvIpZg9j/Wb4vbFt9gXw=; b=R0YKaFpvOeuQMJXdZzmI0xPRe7
	CS+c6J6aFvZKzOEIY5Py/rKiJjfy7kBeEkIVWovQzJxsGC82hJhp4TRDyzJmgL6x
	kxnV2B++QcOElLvu3q9Gn229NJ8QxypXxKaM9oWxGH9XymGvmnh+5rD7k9fxPiYe
	1fAlCrHBjAomvmzo+9+MKyEU80cmmrH4zwcXTgPVv/AW6xYAy0aFVpkMTo11qQO0
	ZpDMGS+eJtWeeoYqH2GWJeQblaqlKxk7VMuWjfhYv8kzECh4EYGtEJPlPu//h+Zc
	srej5bpnZK7+oFPeCNL1TlQS+JYH1XsDg5E6k3/oZUp0QfjpGlqCsLahUQDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762195207; x=1762281607; bh=TMe1fJfCipi+Lh+mJA9z0omtvIpZg9j/Wb4
	vbFt9gXw=; b=kZz8W9T4Vo2Wv7XfERu+hg9SqMsnKoPe4+SOgBhEVjrwz/VG8Zb
	2XzPMQWWzZ47FEo/Lf79OJByGfNlR+7wOhpEZ2Kb3MAZwLE01kbb9d/R/JNFYXsN
	uIeadmzghBuJ0Lb1J+A2FF8klnYVMpPrRAAbK+UKiA2N+l/3QwJw0W0kNd5bigE+
	47c4UjOlqrVQ+rwOhOX3WTdcfulM7JJgmj6XbcyRwIaMwr2IRy3xj3KmZNV82q1S
	uQKjENMS/54A/Gf1Un5lnztPprCOmF0A8LxMrhauI9tP5WJr3vA4j96BGplROOC3
	3JLFNgqag+zwMMLXDrFaIEtJncCeFipVdVQ==
X-ME-Sender: <xms:B_cIaVHEmhsmSDefTLpHLwSfKrNILIb3bdAN8gfhn-jaT0OiBulYug>
    <xme:B_cIaRxUxLdXGqo2JEBBMfWK_PmPRMzjxpKmHD9euKiaZT0Oas7h0l9BBRw8IfcHL
    ANRzIj-xMmJuIJolYYzbjdlk0HTNk_7t3_FLILePyPsY0951ltL>
X-ME-Received: <xmr:B_cIaUgAd6hqPikHlOaCuNrWtImab5Y18jWQqoil9GcElbBFrKvEGrRNrOVhlaydhpgwh0puXf2eNky7u7zcFwlvCqvsSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeekkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephffgtdevhffgffeuteevffekjeehvefffeefhedvheetfedufeelheetvdetvedvnecu
    ffhomhgrihhnpedugedrsggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthho
    peefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghrrdhmrghrkhhose
    hsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhr
    vgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprghlvg
    igrdhkrghnrghvihhnsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:B_cIaUxSFkBbLBfg3okdf-ijk_-NQrcykqF17nVdH-vozbwp1dHSUA>
    <xmx:B_cIafLN4ofAk6-wZGqyD4tcL8r7Nu5elBEUrnBVnF1m1rtNQdhhbA>
    <xmx:B_cIaTSdQmK0CIT4xxsQ0345CxzsymxQ8Bjd1Rxlcdzsdibi-Co1sg>
    <xmx:B_cIafqwXCEQa4ij6PvKTYKNdDo7XQ84Eots1DOoety6WR8DeOJWtQ>
    <xmx:B_cIaVy5fa1QxEO26tDft2yaz_s1BDUWgaBqmuqgjYfaSkpZtBAEZXwg>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Nov 2025 13:40:06 -0500 (EST)
Message-ID: <40ce73594b181aae5b257455efea360186b35ec0.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] pseudo: Add hard sstate dependencies for
 pseudo-native
From: Paul Barker <paul@pbarker.dev>
To: "Marko, Peter" <Peter.Marko@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 03 Nov 2025 18:40:00 +0000
In-Reply-To: <AS1PR10MB569703DA3934BF136F05AF3BFDFDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251016-fix-pseudo-native-v1-1-7c42af094122@pbarker.dev>
	 <AS1PR10MB569703DA3934BF136F05AF3BFDFDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-upd2J5gj+5LPmDZL5mMZ"
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 18:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225690


--=-upd2J5gj+5LPmDZL5mMZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-10-28 at 14:02 +0000, Marko, Peter wrote:
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Paul Barker
> > Sent: Thursday, October 16, 2025 21:11
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>; Paul Barker
> > <paul@pbarker.dev>
> > Subject: [OE-core] [PATCH] pseudo: Add hard sstate dependencies for pse=
udo-
> > native
> >=20
> > Where a task (such as do_package) runs under fakeroot, the correspondin=
g
> > setscene task (do_package_setscene) will also run under fakeroot when
> > restoring from sstate. Assuming pseudo is used as the fakeroot
> > implementation, we need pseudo-native and all its runtime dependencies
> > to be available in the sysroot before running any setscene tasks under
> > fakeroot.
> >=20
> > We already add a hard dependency from all do_package_setscene tasks to
> > virtual/fakeroot-native:do_populate_sysroot in base.bbclass, but this
> > does not cover transitive dependencies. So, extend the dependencies of
> > pseudo-native:do_populate_sysroot_setscene to ensure that the sqlite3
> > library and attr binaries are also available in the sysroot before
> > running fakeroot setscene tasks.
> >=20
> > [YOCTO #15963]
> >=20
> > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > ---
> >  meta/recipes-devtools/pseudo/pseudo.inc | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-
> > devtools/pseudo/pseudo.inc
> > index 22c934977d9b..82499cdd74da 100644
> > --- a/meta/recipes-devtools/pseudo/pseudo.inc
> > +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> > @@ -155,3 +155,10 @@ do_install:append:class-nativesdk () {
> >  }
> >=20
> >  BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +# Setscene tasks which run under fakeroot must not be executed before
> > +# pseudo-native and *all* its runtime dependencies are available in th=
e
> > +# sysroot.
> > +PSEUDO_SETSCENE_DEPS =3D ""
> > +PSEUDO_SETSCENE_DEPS:class-native =3D "sqlite3-native:do_populate_sysr=
oot
> > attr-native:do_populate_sysroot"
>=20
> I have a doubt here.
>=20
> $ grep -rI 'setscene[[]depends[]]'
> bitbake/lib/bb/tests/runqueue-tests/recipes/d1.bb:do_package_setscene[dep=
ends] =3D "a1:do_populate_sysroot_setscene"
> bitbake/lib/bb/runqueue.py:    # e.g. do_sometask_setscene[depends] =3D "=
targetname:do_someothertask_setscene"
> meta/classes/useradd.bbclass:do_package_setscene[depends] +=3D "${USERADD=
SETSCENEDEPS}"
> meta/classes/useradd.bbclass:do_populate_sysroot_setscene[depends] +=3D "=
${USERADDSETSCENEDEPS}"
> meta/recipes-core/sysvinit/sysvinit_3.14.bb:do_package_setscene[depends] =
=3D "${MLPREFIX}base-passwd:do_populate_sysroot"
>=20
> useradd.bbclass with USERADDSETSCENEDEPS also resolves into depending on =
setscene tasks.
>=20
> So tests and useradd depend on setscene which is also documented and hand=
led in requeue.
> To me it looks like sysvinit (where this fix for pseudo was presumable co=
ped from) uses wrong task dependency which works only by chance.
> But this is deep bitbake stuff which may have special nuances.
> What is the difference between using these two variants?

The hard setscene dependency on do_populate_sysroot definitely works, it's =
used
in base.bbclass for do_package_setscene:

    d.appendVarFlag('do_package_setscene', 'depends', ' virtual/fakeroot-na=
tive:do_populate_sysroot')

And looking in runqueue.py in bitbake, there is a line to trim '_setscene' =
off
the end of the task we're depending on if it is present:

    deptid =3D depfn + ":" + idependtask.replace("_setscene", "")

So both variants work and result in the same hard dependencies within bitba=
ke.
As "_setscene" is removed if present, I'd say it's slightly more correct to
specify the dependency without it.

Thanks,

--=20
Paul Barker

--=-upd2J5gj+5LPmDZL5mMZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaQj3ABEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhFSAPwLOnQti1lvacX4Sg4J7ewj1nWJbwvnf1Gw
lYP5LU8ZuwD9HngfgroEGzt1jK2N3h6cQBk2P757LoyJGyBSx8Re/QI=
=x0a/
-----END PGP SIGNATURE-----

--=-upd2J5gj+5LPmDZL5mMZ--

