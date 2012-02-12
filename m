Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rweik-0007PH-EO
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Feb 2012 20:04:22 +0100
Received: by eaal10 with SMTP id l10so1281018eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2012 10:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C7S2yfhrLyPotBmEIYc+P4AZMk486KSG7WAqRbohhVo=;
	b=nLZMfHZFvaV/hn+hOPj9g2Maw9UlUjW+isSIp9N+fs7gsJp2vDFtI4Equf8fje9ogO
	tl8bXnxJQbbY4+JHFxCVIs7b2nusExiMC9OkeBdTZxchKGgwf1NoSfZF4y1wqH2YvG2p
	EO8cmYYCnkY2uNv3tXxIIP7twxuSmMme2AOhg=
Received: by 10.213.35.135 with SMTP id p7mr2195281ebd.131.1329072973816;
	Sun, 12 Feb 2012 10:56:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n58sm51673268een.10.2012.02.12.10.56.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Feb 2012 10:56:12 -0800 (PST)
Date: Sun, 12 Feb 2012 19:56:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120212185610.GH10322@jama.jama.net>
References: <1328888467-31364-1-git-send-email-Martin.Jansa@gmail.com>
	<20120211020527.GD2095@sakrah.homelinux.org>
MIME-Version: 1.0
In-Reply-To: <20120211020527.GD2095@sakrah.homelinux.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] zlib: export LDCONFIG = true to disable runnig host's ldconfig
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
X-List-Received-Date: Sun, 12 Feb 2012 19:04:22 -0000
X-Groupsio-MsgNum: 17454
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QDd5rp1wjxlDmy9q"
Content-Disposition: inline

--QDd5rp1wjxlDmy9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2012 at 06:05:27PM -0800, Khem Raj wrote:
> On (10/02/12 16:41), Martin Jansa wrote:
> > * it's called from install-libs target and when /etc/ld.so.cache is wri=
teable by user running bitbake
> >   then it creates invalid cache (in my case libstdc++.so cannot be foun=
d after building zlib(-native)
> >   and I have to call touch */libstdc++.so && /sbin/ldconfig to fix it
>=20
> hmm does it happen only with native or with both ?
>=20

for both

> i think we need to fix zlib install in this case.

So should I just send patch which removes ldconfig call from install-libs?

Cheers,

> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/zlib/zlib_1.2.6.bb |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/z=
lib/zlib_1.2.6.bb
> > index a220773..dcdc16f 100644
> > --- a/meta/recipes-core/zlib/zlib_1.2.6.bb
> > +++ b/meta/recipes-core/zlib/zlib_1.2.6.bb
> > @@ -11,6 +11,9 @@ SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2=
 \
> >  SRC_URI[md5sum] =3D "dc2cfa0d2313ca77224b4d932b2911e9"
> >  SRC_URI[sha256sum] =3D "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f04380=
21c4bbb5db1b918c8e"
> > =20
> > +# disable calling ldconfig on host, it breaks /etc/ld.so.cache if it's=
 writeable by user running bitbake
> > +export LDCONFIG =3D "true"
> > +
> >  do_configure (){
> >  	./configure --prefix=3D${prefix} --shared --libdir=3D${libdir}
> >  }
> > --=20
> > 1.7.8.4
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> -Khem
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QDd5rp1wjxlDmy9q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk84C0oACgkQN1Ujt2V2gBxVIQCePniitGNJFNnzDIElUMgv+8gm
/ssAmgMvtsH2xvp9afDQq6FR1zUmkDut
=GOwp
-----END PGP SIGNATURE-----

--QDd5rp1wjxlDmy9q--
