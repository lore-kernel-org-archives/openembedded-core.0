Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.10464.1614943214093439062
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 03:20:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=KQZd9ink;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614943214;
  x=1646479214;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4zeNeEDW1e0HvJ/OCm4cDpfvjoHp2zDy3offRAYgxlo=;
  b=KQZd9inkKkbxttr3VhPGwW6SMF2kQah/Gqm/VqUmd/6GmQjIt4ckutbw
   5YeDqo0/zhtJwvJlHpgra1vfphUbpswD/7EXrfr6jIz+LYEzA8N/B0xIJ
   fHXW3HGKMZFp3mr175rWTGJC5KEgQEBNbSKbAPzMLHO7e0TNFXQmYp/Go
   PYsYeyVTBXKDcKOqw3r/M7neZ/WNJOGlCzTMmZ+cy1UY92q+bUJfjyzQV
   hILVFOtetSKEAWzAtMn6Gl/OlGdy1cEbiHDSH38OPTq3FFrZQ7Tmb4qqU
   Vrjl8EGt7BGnZqhwyL7R+WbPtwDSk0cLhTtmwPXpyvym7W3xuUBSuY4LR
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Martin Jansa <Martin.Jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "anibal.limon@linaro.org" <anibal.limon@linaro.org>, "geoffhp@gmail.com"
	<geoffhp@gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
Thread-Topic: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
Thread-Index: AQHXD5xPurcQ4I2XYE+3ZHRfllSLwap1OySggAAHIVA=
Date: Fri, 5 Mar 2021 11:20:11 +0000
Message-ID: <0c5fb27d35c142d488642d21d24a37c4@XBOX03.axis.com>
References: <20210302193229.175044-1-Martin.Jansa@gmail.com>
 <16696CDA6651CD2C.16425@lists.openembedded.org>
In-Reply-To: <16696CDA6651CD2C.16425@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 5 mars 2021 11:54
> To: Martin Jansa <Martin.Jansa@gmail.com>; openembedded-core@lists.openem=
bedded.org
> Cc: anibal.limon@linaro.org; geoffhp@gmail.com
> Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Martin Jansa
> > Sent: den 2 mars 2021 20:32
> > To: openembedded-core@lists.openembedded.org
> > Cc: anibal.limon@linaro.org; geoffhp@gmail.com; Martin Jansa <Martin.Ja=
nsa@gmail.com>
> > Subject: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
> >
> > * some build environments have relative paths in THISDIR, e.g. from OER=
OOT set in:
> >   https://github.com/96boards/oe-rpb-manifest/blob/1e3345c26c56f77f3a15=
a3978f412a25955d2606/conf/bblayers.conf#L4
> >   and then the paths in filename normalized in:
> >   filename =3D os.path.normpath(os.path.join(path, meson.cross.d, eleme=
nt))
> >   don't match.
> >
> > * COREBASE used here before didn't have this issue because the value is=
 already
> >   normalized when set in:
> >   meta/conf/layer.conf:COREBASE =3D
> '${@os.path.normpath("${LAYERDIR}/../")}'
>=20
> That is not the only problem with the change to use ${THISDIR}. We get=20
> a million errors because we have bbappend files for glib-2.0. This is=20
> because bitbake will now give an error for any potential cross-files=20
> from those layers, regardless if they exist or not (they don't).
>=20
> I will send a patch that I believe solves this in a way that also=20
> avoids the need for the bb.error().
>=20
> //Peter

Actually, thinking a bit more on this, I believe that with my patch=20
applied, this patch should _not_ be applied. That is because it makes=20
the paths relative to thisdir, but then uses ${THISDIR} when using=20
them. Thus if thisdir is normalized, it may no longer match ${THISDIR}=20
and the relative paths will not work as intended.

//Peter

> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> b/meta/recipes-
> > core/glib-2.0/glib-2.0_2.66.7.bb
> > index 882a89da7a..a2fa5345b4 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> > @@ -31,7 +31,7 @@ def find_meson_cross_files(d):
> >      if bb.data.inherits_class('native', d):
> >          return ""
> >
> > -    thisdir =3D d.getVar("THISDIR")
> > +    thisdir =3D os.path.normpath(d.getVar("THISDIR"))
> >      import collections
> >      sitedata =3D siteinfo_data(d)
> >      # filename -> found
> > --
> > 2.30.0

