Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQG4P-0006hp-Qt
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 13:21:21 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2016941wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TRzrLOKm2dks6OSDBYxGSIZKaGpS/xHjg5fPBgHb9g8=;
	b=xseGhPn72/dwp9EB0LvE2NIqRE2nB/5689OiamOdGlSFjhyiuMpFTPXSFEpqIQp8fS
	fvvifjDIu4d/p+FSV14VATnTr4eEpd0EhusXnHL8AEo/7MM4b8P8a5k+eBUk6TAcjsdj
	QbNuuFwJCZKEmNlJ3ZIwKuc0gmbvtHke92k5rD6eJhEXIVoD6vXK400HmYcuDFWzR2JR
	yMh9FrL64f+ftjZWNn/XdjujYZusivxLxjpuVOMdjj/9DJ2vZOefaCKHZHhI2CUDDbsq
	P5dtjNBXs7Q6SWKO4I55zGa6RcWI96OZ9rv6HU43lRhrHhuAmJElIXlHyT7AjG5Rlp7N
	GMxw==
Received: by 10.216.194.38 with SMTP id l38mr5167344wen.80.1350904077179;
	Mon, 22 Oct 2012 04:07:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p4sm21327608wix.0.2012.10.22.04.07.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 04:07:55 -0700 (PDT)
Date: Mon, 22 Oct 2012 13:08:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121022110809.GF3269@jama.jama.net>
References: <1350658135.2520.29.camel@ted>
	<20121022104442.GD3269@jama.jama.net>
	<1350903508.2520.77.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1350903508.2520.77.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Improve handling of machine specific manifests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 11:21:21 -0000
X-Groupsio-MsgNum: 30799
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jkO+KyKz7TfD21mV"
Content-Disposition: inline

--jkO+KyKz7TfD21mV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 11:58:28AM +0100, Richard Purdie wrote:
> On Mon, 2012-10-22 at 12:44 +0200, Martin Jansa wrote:
> > On Fri, Oct 19, 2012 at 03:48:55PM +0100, Richard Purdie wrote:
> > > Now do_package isn't machine specific, we're only left with do_popula=
te_sysroot as a
> > > machine specific task. This change marks only the machine specific ma=
nifests as machine
> > > specific, defaulting to PACKAGE_ARCH for everything else.
> > >=20
> > > This means we do less work where there are multiple machines using th=
e same
> > > core package architecture and we can start to clean up the sstate dup=
licate files
> > > whitelist.
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > > index d2a120b..dee84bf 100644
> > > --- a/meta/classes/sstate.bbclass
> > > +++ b/meta/classes/sstate.bbclass
> > > @@ -17,10 +17,7 @@ SSTATE_EXTRAPATH   =3D ""
> > >  SSTATE_EXTRAPATHWILDCARD =3D ""
> > >  SSTATE_PATHSPEC   =3D "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${=
SSTATE_PKGSPEC}"
> > > =20
> > > -# In theory we should be using:
> > > -# SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licens=
es/ ${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/all/ ${T=
MPDIR}/pkgdata/all${TARGET_VENDOR}-${TARGET_OS}"
> > > -# However until do_package is not machine specific, we'll have to ma=
ke do with all of deploy/pkgdata.
> > > -SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR}/ ${TMPDIR}/pkgdata/"
> > > +SSTATE_DUPWHITELIST =3D "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses=
/"
> >=20
> > Looks like warnings are back :/
> >=20
> > WARNING: The recipe attr is trying to install files into a shared area =
when those files already exist. Those files are:
> >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-l=
ocale-de_2.4.46-r4_armv7a-vfp-neon.ipk
> >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-d=
bg_2.4.46-r4_armv7a-vfp-neon.ipk
> >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-l=
ocale-sv_2.4.46-r4_armv7a-vfp-neon.ipk
> > ...
> >=20
> > and new warnings from pkgdata
> > WARNING: The recipe bison is trying to install files into a shared area=
 when those files already exist. Those files are:
> >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-=
gnueabi/bison
> >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-=
gnueabi/runtime/bison-locale-nl.packaged
> >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-=
gnueabi/runtime/bison-dbg.packaged
> >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-=
gnueabi/runtime/bison-doc
> >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-=
gnueabi/runtime/bison-locale-th.packaged
> > ...
>=20
> The question is why as they shouldn't be, these changes were meant to
> fix this properly. Initially I wondered if this was another
> manifestation of https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3219
> but I'm not so sure.

Probably not as this happens on builder with 2 machines using the same
tune and the same CCARGS.

> Can you figure out which two recipes are trying to install these sets of
> files?

I'll try to compare them with scripts/sstate-diff.sh again to see if
checksums are the same between those 2 machines, but those warnings are
shown already when building 1 machine.
=20
> Or perhaps this is a one off transition issue I didn't see here when
> testing this? Does a build from a clean tmp do this?

Yes I've removed tmp-eglibc before starting this build (kept only
sstate-cache) and it's building first machine.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jkO+KyKz7TfD21mV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFKRkACgkQN1Ujt2V2gBxNAACgnxelJYhILCuasPzToP/KHM1e
NX8AniqIdC/YUn1fissk0YzDEKyS3Do9
=a5Xk
-----END PGP SIGNATURE-----

--jkO+KyKz7TfD21mV--
