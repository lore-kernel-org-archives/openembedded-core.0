Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RELUE-0007gv-5P
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 15:38:14 +0200
Received: by bkat8 with SMTP id t8so579161bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YBUpVtfQRN/aqjH5yiaJYh1n5o6xSDhkMCbibjAkhnM=;
	b=MsEZkJkCe9YobIftpFM1JIhL2WFAJ1OzoVc1dtraUvFvYCoV8Z1bC6m/WwYjosybLs
	8BzHdj2S2EPLXQM4uJLF367iyNLVvacBPeTU6uqYzxf+izsMY/YhnpO27reaGuwhMPHz
	XFFEU8S93et+9ZuLBtGeyNbuOKIpluyvSEukU=
Received: by 10.204.153.24 with SMTP id i24mr2771788bkw.86.1318512750343;
	Thu, 13 Oct 2011 06:32:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm3706200bks.1.2011.10.13.06.32.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 06:32:29 -0700 (PDT)
Date: Thu, 13 Oct 2011 15:32:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111013133221.GC28525@jama.jama.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<c30a13301850b76b1e7362b99322ffad72598612.1318505196.git.Martin.Jansa@gmail.com>
	<1318512243.23801.217.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1318512243.23801.217.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core 14/20] mesa-dri: introduce MACHINE_DRI_MODULES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 13:38:14 -0000
X-Groupsio-MsgNum: 10936
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline

--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 02:23:54PM +0100, Richard Purdie wrote:
> On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
> > * not everybody needs i915, i965
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa-dri.inc     |    4 ++++
> >  meta/recipes-graphics/mesa/mesa-dri_7.11.bb |    2 --
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-gra=
phics/mesa/mesa-dri.inc
> > index 603438e..be6905c 100644
> > --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> > +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> > @@ -6,6 +6,10 @@ DEFAULT_PREFERENCE =3D "-1"
> > =20
> >  EXTRA_OECONF +=3D "--with-driver=3Ddri --disable-egl --disable-gallium=
 --without-gallium-drivers"
> > =20
> > +MACHINE_DRI_MODULES ?=3D ""
> > +PACKAGE_ARCH =3D "${@['${MACHINE_ARCH}','${TUNE_PKGARCH}'][bb.data.get=
Var('MACHINE_DRI_MODULES',d,1) =3D=3D '']}"
> > +EXTRA_OECONF +=3D "--with-dri-drivers=3Dswrast,${MACHINE_DRI_MODULES}"
> > +
> >  python populate_packages_prepend() {
> >  	import os.path
>=20
> Whilst I understand the problem, I don't like this solution.
> Particularly, it means that the meas-dri package needs to be marked as
> machine specific which I don't like the idea of at all.
>=20
> How about we do this on a per architecture basis?

taken from cover-letter:
but maybe we can use it as distro variable and keep it with default arch.
But then we cannot just add ie glamo dri module from meta-openmoko like thi=
s:
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Db50c=
8d00cf764c276b0792c0623b8eda3d18d343
without distro (setting MACHINE_DRI_MODULES) depending on such bsp layer.

per architecture has same problem as distro basis

btw: in old recipes there was --with-dri-drivers with only one -, so maybe =
it=20
wasn't actually working even for i915, i965 before or configure has benevol=
ent syntax

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6W6GUACgkQN1Ujt2V2gBzLBQCfc8Cj/SgEVHqKUb9ZeyCodpTl
BEYAoIQCyrzXwTItrm4MyQF2g5eICawp
=0KdQ
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
