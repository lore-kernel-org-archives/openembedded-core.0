Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3EEC47DA9
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 07:00:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.13177.1706598050964914778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 23:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mUls5akY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DE7E1BF204;
	Tue, 30 Jan 2024 07:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706598048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jVOK2ST1SWSldkal0kVGay9Wv5Y0d72P13hgGSROfTk=;
	b=mUls5akYsIERg9vBaJajMzJCQqYLKlrgV1LxP6VPUMzr2HHmNeN/uUuqzPvZR18K/cH+ql
	nQidhPwdz342+S7aUgvD/QpPJ2MdRjzAHJhiKmiFmxAYCeUZgVWfuDtaNSEuA6dYsGkPXK
	/che7tydVHmLBVGLrwhOAKbdIs2T6N6D0T4t7tnr6C05KxooUd2/5ethgUWnPuXt/nFwF/
	qzatSrwNd75sMiFjGYYCdzqPXDQnUsfHsIpyBoo7eX4YYwydjZLG1+KuEcrQtqjR7HILlK
	qrD8Nj2I3c4h7YRzactU91BSyu2K+fvCtH8NK3dNeIevtCHs7n+dP18RbjkrgA==
Message-ID: <65063f5859d84c50d01c5c8427b6fc998d4bcea7.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] opensbi: skip ldflags QA
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jan 2024 08:00:47 +0100
In-Reply-To: <CAMKF1sramDULktY1P_wtNSitiLHbaU=JVN6haPEfKRNe2kjtQw@mail.gmail.com>
References: <20240129100659.107901-1-thomas.perrot@bootlin.com>
	 <CAMKF1sramDULktY1P_wtNSitiLHbaU=JVN6haPEfKRNe2kjtQw@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qNQ9iw1QscbJXg6H6lm7"
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 07:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194487


--=-qNQ9iw1QscbJXg6H6lm7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

On Mon, 2024-01-29 at 09:16 -0800, Khem Raj wrote:
> On Mon, Jan 29, 2024 at 2:07=E2=80=AFAM Thomas Perrot via
> lists.openembedded.org
> <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> >=20
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > Quiet the following GNU_HASH error:
> > ERROR: opensbi-1.4-r0 do_package_qa: QA Issue: File
> > /share/opensbi/lp64/generic/firmware/fw_dynamic.elf in package
> > opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?)
> > File /share/opensbi/lp64/generic/firmware/fw_payload.elf in package
> > opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?)
> > File /share/opensbi/lp64/generic/firmware/fw_jump.elf in package
> > opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
> >=20
> > [YOCTO #15370] --
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15370
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0meta/recipes-bsp/opensbi/opensbi_1.4.bb | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/recipes-bsp/opensbi/opensbi_1.4.bb
> > b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
> > index fd18c03cfbc4..e36ada081428 100644
> > --- a/meta/recipes-bsp/opensbi/opensbi_1.4.bb
> > +++ b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
> > @@ -43,3 +43,5 @@ FILES:${PN} +=3D
> > "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
> >=20
> > =C2=A0COMPATIBLE_HOST =3D "(riscv64|riscv32).*"
> > =C2=A0INHIBIT_PACKAGE_STRIP =3D "1"
> > +
> > +INSANE_SKIP:${PN} =3D "ldflags"
>=20
> hmmm I wonder if we should pass the OE ldflags, and test it out
> before
> disabling this QA warning
> try something like TARGET_CC_ARCH +=3D "${LDFLAGS}"

Thank you that solves the issue, I submitted another patch.

Kind regards,
Thomas Perrot

>=20
> > --
> > 2.43.0
> >=20
> >=20
> >=20
> >=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194469):
> https://lists.openembedded.org/g/openembedded-core/message/194469
> Mute This Topic: https://lists.openembedded.org/mt/104028517/5443093
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> thomas.perrot@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-qNQ9iw1QscbJXg6H6lm7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmW4np8ACgkQn8ALBXH+
Cu1AdAwArGiO3wLBsGqwucQX0V3AtbTp6enkKoHtwSoTC9wEUI63p0q5FFCetZZS
zSAN+Bd+V9zZzWfYk73akrR6oqKfg8763YUgEPbTfJwGY2jmmA64+21jgBk1hH5+
FUMDciGEWDg9ZtYAbylHz9iqBx0h4ovNHFG+sRvcS8mfd2bI8yBRltIrr8P3eUdK
AtlraffZMfQ+HW1ey6Gho/reB20KRKZJiFBkAGtFYpaxHgvKgugCJvPq0nxP/Dpt
ZZzXJKvVvMqXhbqjrsW3BU56FG4iftqZzXd9LT25fYBgIIb2S9wNDugSAqcAxo+8
a+Vwlep85csrsZ8kHiUb/Er0NNqhoVePevmeP/KzQn5vcOOgyfgZ17hhKiqUoGRe
xKXw3fQY5c6AakgbE3gjecqTqRMJc1g6J1FhQ0X3zkkxUNpvVh5DClEWvIYvszmA
5/Wds1VVKW2M/1Lh9WcMNC7v9GOF8SXlkqH+N58O26eFTWMXb9iwWqNEqci9m547
b6oCQc3y
=emRe
-----END PGP SIGNATURE-----

--=-qNQ9iw1QscbJXg6H6lm7--

