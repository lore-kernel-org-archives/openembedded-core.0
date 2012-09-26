Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGod5-0002Cx-6p
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 12:14:07 +0200
Received: by wgbdq11 with SMTP id dq11so288999wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1KT6KsFpX7YI37Iylw1NzPJ/P9DPIVQ4BIBr+t2EoMk=;
	b=I4+d9FkARohYAdgkm3ZSwKMWZysqDHNQuYyBbDfOe4dUvrojGF7QTKUU5w8pSuBciH
	3Ff7qlZWk7l8eaPw8Pjh7Py0u+KWN+pppxzdD3o8ft5hulBRwqs0Q4ucs5WyFMrOcZXl
	dowdG8wbHGVRgSm++BpeRJr4y790ug2Zct2SMpq9ZD/T7ZKQiNMjSATAOR4N1L3pBugW
	0Ec1BFSKl97tYUVoBtKWvQY/D0VzIo2diBPR7MdYp1tKFu8Nu0Ei7PAiIT3hLKmlKEIc
	Y0IETeGAHUb7DaDw9TM2sw+v7h60+tVA1EbzjoEylkz3mkpVlcAGtVnRPquhBMxkkWMv
	A42g==
Received: by 10.180.100.101 with SMTP id ex5mr24996657wib.16.1348653677172;
	Wed, 26 Sep 2012 03:01:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f10sm5883612wiy.9.2012.09.26.03.01.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 03:01:16 -0700 (PDT)
Date: Wed, 26 Sep 2012 12:01:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120926100123.GF3313@jama.jama.net>
References: <1348652719.31293.90.camel@phil-desktop>
	<20120926095459.GE3313@jama.jama.net>
	<1348653462.31293.92.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348653462.31293.92.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-cross: factor out --enable-threads argument into ${GCCTHREADS}
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
X-List-Received-Date: Wed, 26 Sep 2012 10:14:07 -0000
X-Groupsio-MsgNum: 29893
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O98KdSgI27dgYlM5"
Content-Disposition: inline

--O98KdSgI27dgYlM5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 10:57:41AM +0100, Phil Blundell wrote:
> On Wed, 2012-09-26 at 11:54 +0200, Martin Jansa wrote:
> > On Wed, Sep 26, 2012 at 10:45:18AM +0100, Phil Blundell wrote:
> > > diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/met=
a/recipes-devtools/gcc/gcc-configure-common.inc
> > > index 908ad3e..504bfaa 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > > @@ -26,12 +26,13 @@ EXTRA_OECONF_INITIAL ?=3D ""
> > >  EXTRA_OECONF_INTERMEDIATE ?=3D ""
> > > =20
> > >  GCCMULTILIB =3D "--disable-multilib"
> > > +GCCTHREADS =3D "posix"
> > > =20
> > >  EXTRA_OECONF =3D "${@['--enable-clocale=3Dgeneric', ''][d.getVar('US=
E_NLS', True) !=3D 'no']} \
> > >                  --with-gnu-ld \
> > >                  --enable-shared \
> > >                  --enable-languages=3D${LANGUAGES} \
> > > -                --enable-threads=3Dposix \
> > > +                --enable-threads=3D${GCCTHREADS} \
> > >                  ${GCCMULTILIB} \
> > >                  --enable-c99 \
> > >                  --enable-long-long \
> > > --=20
> > > 1.7.10.4
> >=20
> > Missing PR bump
>=20
> Does it really need one?  It doesn't have any impact on the value that
> EXTRA_OECONF ends up with, and bumping the PRs on all the various .bb
> files would make the patch about ten times the size.  I can do that if
> you insist but it seems like a bit of a waste of time.

Sorry I haven't noticed that it's the same value as before.=20

But if it causes different sstate checksum than PR bump would be nice to ge=
t new
builddir (well maybe not needed after f15f61af77cc4e52a037f509f8e49e1ea530c=
f35).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O98KdSgI27dgYlM5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBi0nMACgkQN1Ujt2V2gBytAgCbB38tQGsN+3v26zwsONKwEtUq
0+gAn2hbiLhWDzKm9T+J0e/bwwyybqh3
=VPee
-----END PGP SIGNATURE-----

--O98KdSgI27dgYlM5--
