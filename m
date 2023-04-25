Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAF8C6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 16:20:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.84389.1682439643075143842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 09:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D34EB40C21;
	Tue, 25 Apr 2023 16:20:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2DZnPqz3E8q; Tue, 25 Apr 2023 16:20:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AE7AA406B5;
	Tue, 25 Apr 2023 16:20:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 12103163840; Tue, 25 Apr 2023 12:20:00 -0400 (EDT)
Date: Tue, 25 Apr 2023 12:20:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Petr =?utf-8?B?S3ViaXrFiMOhaw==?= - 2N <Kubiznak@2n.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] devicetree.bbclass: Allow selection of dts
 files to build
Message-ID: <20230425161959.GH9226@denix.org>
References: <20230421152325.3327461-1-kubiznak@2n.com>
 <20230422220701.GD9226@denix.org>
 <DB4PR02MB10030466D2D61356D80758E22E2679@DB4PR02MB10030.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB4PR02MB10030466D2D61356D80758E22E2679@DB4PR02MB10030.eurprd02.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 16:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180390

On Mon, Apr 24, 2023 at 08:48:24AM +0000, Petr Kubiz=C5=88=C3=A1k - 2N wr=
ote:
> Hi Denys,
>=20
> > Any examples of this being used? Not really clear from the descriptio=
n what's
> > this really used for...
>=20
> I'm not sure what is unclear to you - just the commit message, or the p=
atch itself?
>=20
> An example could be beaglebone-yocto.conf. If someone decides to move t=
he=20
> device tree files from kernel to a standalone repository, then it is en=
ough=20
> (e.g.) to rename KERNEL_DEVICETREE to EXTERNAL_DEVICETREE in the machin=
e=20
> conf, and make an assignment DT_FILES =3D "${EXTERNAL_DEVICETREE}" in t=
he=20
> devicetree recipe.
>=20
> So how about to replace the unclear sentence by:

> To make DT_FILES consistent with KERNEL_DEVICETREE, the list works with=
 both=20
> dts and dtb files.

Thanks, this sounds much better, I believe.


> Would that make more sense to you? Or do you think the example should b=
e=20
> part of that commit message, too?
>=20
> Cheers,
> Petr
>=20
> ________________________________________
> From: Denys Dmytriyenko <denis@denix.org>
> Sent: Sunday, April 23, 2023 12:07 AM
> To: Petr Kubiz=C5=88=C3=A1k - 2N
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH v3] devicetree.bbclass: Allow selection of=
 dts files to build
>=20
> On Fri, Apr 21, 2023 at 05:23:25PM +0200, Petr Kubiz=C5=88=C3=A1k wrote=
:
> > Add DT_FILES variable to allow the user of the class to select specif=
ic
> > dts files to build. This is useful for packages featuring dts files
> > for multiple machines.
> >
> > Since many machine configs contain a list of dtb files
> > (e.g. KERNEL_DEVICETREE), DT_FILES works with both dts and dtb files.
>=20
> Any examples of this being used? Not really clear from the description =
what's
> this really used for...
>=20
>=20
> > Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> > ---
> >  meta/classes-recipe/devicetree.bbclass | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-re=
cipe/devicetree.bbclass
> > index ed2a92e447..bd50d7fa1d 100644
> > --- a/meta/classes-recipe/devicetree.bbclass
> > +++ b/meta/classes-recipe/devicetree.bbclass
> > @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D " \
> >
> >  DT_INCLUDE[doc] =3D "Search paths to be made available to both the d=
evice tree compiler and preprocessor for inclusion."
> >  DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> > -DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to=
 select dts files that are not in source (e.g. generated)."
> > +DT_FILES_PATH[doc] =3D "Path to the directory containing dts files t=
o build. Defaults to source directory."
> >  DT_FILES_PATH ?=3D "${S}"
> > +DT_FILES[doc] =3D "Space-separated list of dts or dtb files (relativ=
e to DT_FILES_PATH) to build. If empty, all dts files are built."
> > +DT_FILES ?=3D ""
> >
> >  DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, u=
sed as extra space typically for additional properties during boot."
> >  DT_PADDING_SIZE ??=3D "0x3000"
> > @@ -125,9 +127,12 @@ def devicetree_compile(dtspath, includes, d):
> >      subprocess.run(dtcargs, check =3D True, stdout=3Dsubprocess.PIPE=
, stderr=3Dsubprocess.STDOUT)
> >
> >  python devicetree_do_compile() {
> > +    import re
> >      includes =3D expand_includes("DT_INCLUDE", d)
> > +    dtfiles =3D d.getVar("DT_FILES").split()
> > +    dtfiles =3D [ re.sub(r"\.dtbo?$", ".dts", dtfile) for dtfile in =
dtfiles ]
> >      listpath =3D d.getVar("DT_FILES_PATH")
> > -    for dts in os.listdir(listpath):
> > +    for dts in dtfiles or os.listdir(listpath):
> >          dtspath =3D os.path.join(listpath, dts)
> >          try:
> >              if not(os.path.isfile(dtspath)) or not(dts.endswith(".dt=
s") or devicetree_source_is_overlay(dtspath)):
> > --
> > 2.30.2

