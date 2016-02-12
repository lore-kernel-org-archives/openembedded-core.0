Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 7F81C6FF97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 15:05:32 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1CF5WS9021263; Fri, 12 Feb 2016 09:05:32 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021209053233-938092 ;
	Fri, 12 Feb 2016 09:05:32 -0600 
Date: Fri, 12 Feb 2016 17:05:12 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160212170512.72f80444@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <20160212142501.GD2607@jama>
References: <1455203936-28150-1-git-send-email-adrian.ratiu@ni.com>
	<20160211164154.GB2595@jama>
	<20160212155857.759685c6@adi-pc-linux.emea.corp.natinst.com>
	<20160212142501.GD2607@jama>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/12/2016 09:05:32 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/12/2016 09:05:32 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-12_07:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] tune-cortexa9.inc: add vfpv3 tunes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Feb 2016 15:05:32 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Feb 2016 15:25:01 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Feb 12, 2016 at 03:58:57PM +0200, Ioan-Adrian Ratiu wrote:
> > Hello
> >=20
> > On Thu, 11 Feb 2016 17:41:54 +0100
> > Martin Jansa <martin.jansa@gmail.com> wrote:
> >  =20
> > > On Thu, Feb 11, 2016 at 05:18:56PM +0200, Ioan-Adrian Ratiu wrote: =20
> > > > From: Richard Tollerton <rich.tollerton@ni.com>
> > > >=20
> > > > Define tunnings to enable 32 register VFPv3 for cortexa9 processor =
cores   =20
> > >=20
> > > Can you execute the test from:
> > > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/=
tune2-test
> > > just to verify that all these new combinations work ok and to update =
the
> > > test results for next person modifying the tune files? =20
> >=20
> >  I've tested with that script and everything looks ok (it took a while =
for all those openssl builds to run the first time). =20
>=20
> Thanks, it doesn't build them, only parses.
>=20
> > I also had to modify that hardcoded path to the openembedded-core locat=
ion in the script. I asume this test script was created for the poky layout=
? =20
>=20
> No I don't use poky, but the layout isn't set in stone, I'm not
> surprised you're using different.
>=20
> > (also I've done a  grep "\(-vfpv3\)" on the AVAILTUNES var, but I don't=
 think it matters that much though, run the test without it also) =20
>=20
> You mean in this line:
> AVAILTUNES=3D`grep '^AVAILTUNES=3D' ${TUNE=5FTEST=5FDIR}/env.${M} | sed '=
s/^[^"]*"\([^"]*\)"/\1/g' | tr ' ' '\n'`;
>=20
> to restrict the testing only to new -vfpv3 tune?

Yes, at the commit pointed by the URL in your previous mail the line had a =
grep neon-vfpv4 appended:

AVAILTUNES=3D`grep '^AVAILTUNES=3D' ${TUNE=5FTEST=5FDIR}/env.${M} | sed 's/=
^[^"]*"\([^"]*\)"/\1/g' | tr ' ' '\n' | grep "\(neon-vfpv4\)"`;

>=20
> > There is also a discrepancy between the value of TUNE=5FPKGARCH =3D=3D =
armv7athf and the file name from the env.fake-cortexa9.armv7athf-vfpv3. I b=
elieve there may be a typo in one of the tunes, ommited the "t" for thumb. =
=20
>=20
> I'm not sure where the typo is, can you push your results somewhere? So
> it's easy to see the diff with latest jansa/tune2-test ?

I did some more digging and that divergence seems to be caused by the follo=
wing line in arch-armv7a.inc:

PACKAGE=5FEXTRA=5FARCHS=5Ftune-armv7athf            =3D "${PACKAGE=5FEXTRA=
=5FARCHS=5Ftune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"=20

Shouldn't it be the following: (add a t for thumb)?

PACKAGE=5FEXTRA=5FARCHS=5Ftune-armv7athf            =3D "${PACKAGE=5FEXTRA=
=5FARCHS=5Ftune-armv6thf} armv7athf-vfp armv7at2hf-vfp"=20

The same applies to other armv7athf tunes like armv7athf-vfpv3d16, they all=
 seem to be missing a t.

>=20
> Regards,
>=20
> > > > More details: http://www.arm.com/products/processors/technologies/v=
ector-floating-point.php
> > > >=20
> > > > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> > > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > > ---
> > > >  meta/conf/machine/include/tune-cortexa9.inc | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >=20
> > > > diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/con=
f/machine/include/tune-cortexa9.inc
> > > > index 965f2d9..3d8dc1d 100644
> > > > --- a/meta/conf/machine/include/tune-cortexa9.inc
> > > > +++ b/meta/conf/machine/include/tune-cortexa9.inc
> > > > @@ -34,3 +34,18 @@ PACKAGE=5FEXTRA=5FARCHS=5Ftune-cortexa9hf       =
      =3D "${PACKAGE=5FEXTRA=5FARCHS=5Ftune-ar
> > > >  PACKAGE=5FEXTRA=5FARCHS=5Ftune-cortexa9thf            =3D "${PACKA=
GE=5FEXTRA=5FARCHS=5Ftune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
> > > >  PACKAGE=5FEXTRA=5FARCHS=5Ftune-cortexa9hf-neon        =3D "${PACKA=
GE=5FEXTRA=5FARCHS=5Ftune-armv7ahf-neon}  cortexa9hf-vfp cortexa9hf-neon"
> > > >  PACKAGE=5FEXTRA=5FARCHS=5Ftune-cortexa9thf-neon       =3D "${PACKA=
GE=5FEXTRA=5FARCHS=5Ftune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-neon co=
rtexa9t2hf-vfp cortexa9t2hf-neon"
> > > > +
> > > > +# VFPv3 Tunes
> > > > +AVAILTUNES +=3D "cortexa9-vfpv3 cortexa9t-vfpv3 cortexa9hf-vfpv3 c=
ortexa9thf-vfpv3"
> > > > +ARMPKGARCH=5Ftune-cortexa9-vfpv3          =3D "cortexa9"
> > > > +ARMPKGARCH=5Ftune-cortexa9t-vfpv3         =3D "cortexa9"
> > > > +ARMPKGARCH=5Ftune-cortexa9hf-vfpv3        =3D "cortexa9"
> > > > +ARMPKGARCH=5Ftune-cortexa9thf-vfpv3       =3D "cortexa9"
> > > > +TUNE=5FFEATURES=5Ftune-cortexa9-vfpv3           =3D "${TUNE=5FFEAT=
URES=5Ftune-armv7a-vfpv3}          cortexa9"
> > > > +TUNE=5FFEATURES=5Ftune-cortexa9t-vfpv3          =3D "${TUNE=5FFEAT=
URES=5Ftune-armv7at-vfpv3}         cortexa9"
> > > > +TUNE=5FFEATURES=5Ftune-cortexa9hf-vfpv3         =3D "${TUNE=5FFEAT=
URES=5Ftune-armv7ahf-vfpv3}        cortexa9"
> > > > +TUNE=5FFEATURES=5Ftune-cortexa9thf-vfpv3        =3D "${TUNE=5FFEAT=
URES=5Ftune-armv7athf-vfpv3}       cortexa9"
> > > > +PACKAGE=5FEXTRA=5FARCHS=5Ftune-cortexa9-vfpv3           =3D "${PAC=
KAGE=5FEXTRA=5FARCHS=5Ftune-armv7a-vfpv3}  cortexa9-vfp cortexa9-vfpv3"
> > > > +PACKAGE=5FEXTRA=5FARCHS=5Ftune-cortexa9t-vfpv3          =3D "${PAC=
KAGE=5FEXTRA=5FARCHS=5Ftune-armv7at-vfpv3} cortexa9-vfp cortexa9-vfpv3 cort=
exa9t2-vfp cortexa9t2-vfpv3"
> > > > +PACKAGE=5FEXTRA=5FARCHS=5Ftune-cortexa9hf-vfpv3         =3D "${PAC=
KAGE=5FEXTRA=5FARCHS=5Ftune-armv7ahf-vfpv3}  cortexa9hf-vfp cortexa9hf-vfpv=
3"
> > > > +PACKAGE=5FEXTRA=5FARCHS=5Ftune-cortexa9thf-vfpv3        =3D "${PAC=
KAGE=5FEXTRA=5FARCHS=5Ftune-armv7athf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv=
3 cortexa9t2hf-vfp cortexa9t2hf-vfpv3"
> > > > --=20
> > > > 2.7.0
> > > >=20
> > > > --=20
> > > > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core   =
=20
> > >  =20
> >  =20
>=20


