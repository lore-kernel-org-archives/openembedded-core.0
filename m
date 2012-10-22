Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TQFxV-0006XA-Vs; Mon, 22 Oct 2012 13:14:14 +0200
Received: by mail-ea0-f175.google.com with SMTP id c1so748249eaa.6
	for <multiple recipients>; Mon, 22 Oct 2012 04:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j590ylth8EfjPLP1wNDygkhVacd0ZK3mq1cQPJxrOUc=;
	b=KUL7JUEmicRRjW5H1XJeYuXsl4hzoHcjOHgUMwWG1732mftfL3O5VcQcgblLGQqK2Y
	BivIRHX57UqVPWhmEaM4EXUUqLUGh0tlsZk17hMOhYR4fIjfim+eO9q/wNW5v4eHn7X3
	2dePl51+q8oKdVmZm+HJA+/jwkkU6Cj5Yx9YmfTUUvYQ0Kk/wNcaN/woxANhYSTIf2vv
	CdN+OnY0h2hS2TSoP0eOryVg02zahtKvIrh7AIy13tEUoHQkocfF8uvpCwFL1mNWOpBT
	OhJcY5v3A+RSICnhZZErPZC2o8UrfwLiKchePBLz0hY0nIdL5ScSbimCes2v4yGyOx3G
	tXkw==
Received: by 10.14.203.69 with SMTP id e45mr11421842eeo.38.1350903649120;
	Mon, 22 Oct 2012 04:00:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z43sm15421969een.16.2012.10.22.04.00.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 04:00:48 -0700 (PDT)
Date: Mon, 22 Oct 2012 13:01:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121022110103.GE3269@jama.jama.net>
References: <20121019163541.436A0103AB@opal>
	<20121022083441.GA3269@jama.jama.net>
	<1350902949.2520.72.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1350902949.2520.72.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : perl: fix dependecies
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
X-List-Received-Date: Mon, 22 Oct 2012 11:14:14 -0000
X-Groupsio-MsgNum: 30798
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Content-Disposition: inline

--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 11:49:09AM +0100, Richard Purdie wrote:
> On Mon, 2012-10-22 at 10:34 +0200, Martin Jansa wrote:
> > >  # 5.10.1 has Module::Build built-in
> > >  PROVIDES +=3D "libmodule-build-perl"
> > > @@ -243,7 +243,13 @@ perl_package_preprocess () {
> > > =20
> > >  PACKAGES =3D "perl-dbg perl perl-misc perl-dev perl-pod perl-doc per=
l-lib \
> > >              perl-module-cpan perl-module-cpanplus perl-module-unicor=
e"
> > > -FILES_${PN} =3D "${bindir}/perl ${bindir}/perl${PV}"
> > > +FILES_${PN} =3D "${bindir}/perl ${bindir}/perl${PV} \
> > > +               ${libdir}/perl/${PV}/Config.pm \
> > > +               ${libdir}/perl/${PV}/strict.pm \
> > > +               ${libdir}/perl/${PV}/warnings.pm \
> > > +               ${libdir}/perl/${PV}/warnings \
> > > +               ${libdir}/perl/${PV}/vars.pm \
> > > +              "
> >=20
> > I think this breaks at least automake, tiobench and libtimedate-perl
> >=20
> > OE @ ~/openembedded-core $ git grep perl-module-strict
> > meta/recipes-devtools/automake/automake_1.12.3.bb:    perl-module-stric=
t \
> > meta/recipes-extended/perl/libtimedate-perl_1.20.bb:RDEPENDS_${PN} +=3D=
 "perl-module-carp perl-module-exporter perl-module-strict perl-module-time=
-local"
> > OE @ ~/meta-openembedded $ git grep perl-module-strict
> > meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb:    perl-module-st=
rict \
> > OE @ ~/openembedded-core $ git grep perl-module-vars
> > meta/recipes-devtools/automake/automake_1.12.3.bb:    perl-module-vars "
> >=20
> > perl-module-strict and perl-module-vars are not created now, probably e=
mpty.
> >=20
>=20
> It does, the autobuilder also noticed this and I pushed in a fix this
> morning:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D072a6d352f55bbe481=
b04db02aa6d9cde7d90057

What about using something like world-image target? I'm using something
like that to test that all recipes in my feed are not only buildable,
but also able to install in do_rootfs. Only problem with this could be
that more packages need to be excluded because some recipes are can be
built together, but not installed in same images (packages with RCONFLICTS).

It should help find those issues on autobuilder.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFJ24ACgkQN1Ujt2V2gBxU+wCcCIGszSO0kOtvLwz6fWJDvmpU
IZQAn2fBHgn0kb8vRH1Lnnxb2UqIqZmU
=v/Rd
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
