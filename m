Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.13870.1614959535798169013
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 07:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=US7XG5mg;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614959536;
  x=1646495536;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HusiQMjBzUnbXrFOt8GWqp5Dv4MtEIpxr3BSeOhZcJg=;
  b=US7XG5mgsAeYQ6pjdCMxp0GgVj19QaiVK0qbO8c+m8FTWfouYyXE45YQ
   nelgOip6mTV3zHAkM++XMkZZm4QYx1RBEnCEH8F/3zmobetHAC91hD410
   88H+ThSaUzAnxzEeYM5EGY3FcdZor7ptQPrBHavLRor6lx8KkSr0USzo0
   arCD35IFvARCIbm/RBg9uYec7FBbOck/N9eCdGWsTQpF44Q2Wz2QyONi2
   PxhPgDgf15nKsb6Aa6qf1Kg6rvuODH20JAhPTNFkFGbz1iHtR0k+OFbFQ
   LwXdUgSYPLnU5eYywdEqLM33ZFTFN3vCLRccuYYQCgXXekVYQZd8uRAhg
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "anibal.limon@linaro.org"
	<anibal.limon@linaro.org>, "geoffhp@gmail.com" <geoffhp@gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
Thread-Topic: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
Thread-Index: AQHXD5xPurcQ4I2XYE+3ZHRfllSLwap1OySggAAHIVD///lSAIAAU8YQ
Date: Fri, 5 Mar 2021 15:52:13 +0000
Message-ID: <38592c5c6824461687563ed1a52913eb@XBOX03.axis.com>
References: <20210302193229.175044-1-Martin.Jansa@gmail.com>
 <16696CDA6651CD2C.16425@lists.openembedded.org>
 <0c5fb27d35c142d488642d21d24a37c4@XBOX03.axis.com>
 <20210305115050.chhf5zf357wns3xl@jama>
In-Reply-To: <20210305115050.chhf5zf357wns3xl@jama>
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
> From: Martin Jansa <martin.jansa@gmail.com>
> Sent: den 5 mars 2021 12:51
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-core@lists.openembedded.org; anibal.limon@linaro.org;
> geoffhp@gmail.com
> Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
>=20
> On Fri, Mar 05, 2021 at 11:20:11AM +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > Sent: den 5 mars 2021 11:54
> > > To: Martin Jansa <Martin.Jansa@gmail.com>; openembedded-
> core@lists.openembedded.org
> > > Cc: anibal.limon@linaro.org; geoffhp@gmail.com
> > > Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on
> THISDIR
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Martin Jansa
> > > > Sent: den 2 mars 2021 20:32
> > > > To: openembedded-core@lists.openembedded.org
> > > > Cc: anibal.limon@linaro.org; geoffhp@gmail.com; Martin Jansa
> <Martin.Jansa@gmail.com>
> > > > Subject: [OE-core] [PATCH] glib-2.0: call os.path.normpath on
> THISDIR
> > > >
> > > > * some build environments have relative paths in THISDIR, e.g. from
> OEROOT set in:
> > > >   https://github.com/96boards/oe-rpb-
> manifest/blob/1e3345c26c56f77f3a15a3978f412a25955d2606/conf/bblayers.conf=
#
> L4
> > > >   and then the paths in filename normalized in:
> > > >   filename =3D os.path.normpath(os.path.join(path, meson.cross.d,
> element))
> > > >   don't match.
> > > >
> > > > * COREBASE used here before didn't have this issue because the valu=
e
> is already
> > > >   normalized when set in:
> > > >   meta/conf/layer.conf:COREBASE =3D
> > > '${@os.path.normpath("${LAYERDIR}/../")}'
> > >
> > > That is not the only problem with the change to use ${THISDIR}. We ge=
t
> > > a million errors because we have bbappend files for glib-2.0. This is
> > > because bitbake will now give an error for any potential cross-files
> > > from those layers, regardless if they exist or not (they don't).
> > >
> > > I will send a patch that I believe solves this in a way that also
> > > avoids the need for the bb.error().
> > >
> > > //Peter
> >
> > Actually, thinking a bit more on this, I believe that with my patch
> > applied, this patch should _not_ be applied. That is because it makes
> > the paths relative to thisdir, but then uses ${THISDIR} when using
> > them. Thus if thisdir is normalized, it may no longer match ${THISDIR}
> > and the relative paths will not work as intended.
>=20
> I'm sorry I've tested and wrote that part of commit message when I had
> if os.path.exists(filename):
> at the beginning of this whole section, which I've then re-wrote to just
> store only existing filenames in files as a list instead of a map (to
> simplify the rest of this function as well), but then I was wondering
> why Ross used the map in the initial implementation here:
> https://git.openembedded.org/openembedded-
> core/commit/?id=3D5acd9cbc9d5c6355010775250fb25f043441c5cd
> and assumed it was needed to get all possible filenames in
> do_configure[file-checksums] in case they are created later.
>=20
> So I've removed all my cleanups and returned to smallest change to just
> replace COREBASE with THISDIR.
>=20
> What about checking the existence before showing the error, that will
> show an error only when matching file exists while keeping all
> not-skipped paths in do_configure[file-checksums] even when they don't
> exist yet.
>=20
> Will send a patch for this shortly.

Any objections to my patch, where there is no need for the bb.error()=20
in the first place?
=09
//Peter

