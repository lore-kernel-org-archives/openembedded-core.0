Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B767FC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 19:19:41 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.12715.1705519172889887104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 11:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=VySs0gYc;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CFBAE240027
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 20:19:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1705519170; bh=LSL6luy2as8oNAT8yZtTgteHnrwDb+PKMM0FfnndqMo=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=VySs0gYcnIdnsNLUB7AyXo46MCF/OvlBMNXRf9ibzPsOAeBAjmI6MXyFGWMveyhQH
	 GFwiw7DIc3wPxL1IdSF8t9HS60Q6fv0lj7GSHdC4QsxvsIttOCAxGyas3BTnXbMWaa
	 mbfLqGccz3ENlWdd8UrlmYOBztglfUuFOXR5WWPBtiENOAhfpqMH2y850Fi8ij+vjD
	 ii49iiyKecXuhfZfD8MlB2dd/tJeQhwg8V6LAIBCLr2W00ln2glBX/mtgBVT1FyQWx
	 A7Y0dd5Z0BH88nvpAOBTbwnSeqytIax/Uh87oQ3HB/K1IM7BBm5Olsbdq/+51T5KIJ
	 Tk+rwTX1Tjozg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TFbKX6xhcz6txv;
	Wed, 17 Jan 2024 20:19:28 +0100 (CET)
Message-ID: <41a612e78d38e7132c2b07a83456e4664ee1b11a.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] classes-global/insane: Add check for
 "virtual/" in RPROVIDES and RDEPENDS
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: alexandre.belloni@bootlin.com, Simone =?ISO-8859-1?Q?Wei=DF?=
	 <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2024 19:19:28 +0000
In-Reply-To: <202401162329150cb039e3@mail.local>
References: <20240114171903.10264-1-simone.p.weiss@posteo.com>
	 <202401162329150cb039e3@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 19:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193945

Hi,
On Wed, 2024-01-17 at 00:29 +0100, Alexandre Belloni via
lists.openembedded.org wrote:
> Hello,
>=20
> This causes warnings for meta-aws:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/122/builds/3840/s=
teps/12/logs/warnings
>=20
> On 14/01/2024 17:19:03+0000, Simone Wei=C3=9F wrote:
> > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> >=20
> > Fixes [YOCTO #14538]
> >=20
> > Recipes shouldn't use "virtual/" in RPROVIDES and RDEPENDS. This
> > was
> > addressed already in recipes in meta-oe and oe-core. Add a test for
> > this in insane.bbclass to ensure no regressions occur.
> >=20
> > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > ---
> > =C2=A0meta/classes-global/insane.bbclass | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-
> > global/insane.bbclass
> > index d625fd82f7..9e8e35e0f7 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -1606,6 +1606,12 @@ python () {
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (d.getVar(d.expand('DEPENDS:${PN}'))):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe.qa.handle_error("pk=
gvarcheck", "recipe uses
> > DEPENDS:${PN}, should use DEPENDS", d)
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 # virtual/ is meaningless for those variables
> > +=C2=A0=C2=A0=C2=A0 for k in ['RDEPENDS', 'RPROVIDES']:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for var in bb.utils.explode=
_deps(d.getVar(k + ':' + pn) or
> > ""):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
var.startswith("virtual/"):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bb.warn("%s is set to %s, the substring 'virtual/'
> > holds no meaning in this context. It is suggested to use the
> > 'virtual-' instead." % (k, var))
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 issues =3D []
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (d.getVar('PACKAGES') or "").split():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for dep in (d.getVar('=
QADEPENDS') or "").split():
> > --=20
> > 2.39.2
> >=20
>=20
> >=20
> >=20
> >=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193879):
> https://lists.openembedded.org/g/openembedded-core/message/193879
> Mute This Topic: https://lists.openembedded.org/mt/103722088/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> simone.p.weiss@posteo.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
I see, the warning is correct and a fix should be applied to meta-
oe/recipes-core/opencl/ocl-icd_2.3.2.bb for this, I will send out a
patch for this as well. Afterwards this should be fixed implicitly.
Just one question: Which branch is tested in the autobuilder for meta-
aws/meta-op? Is it good enough if I just fix it on meta-oes main
branch?

-=C2=A0
Simone =20

