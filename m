Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2306B72B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:15:29 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so4502281eek.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0O4pzMw8dlEy4dUohQOzSh5wq4zuMdggbRYQt0MJqaw=;
	b=pbJAGv/Omsb9ThpM/F3P/ZgM2niSv2pCEoc5AiFhnMYY/tiHEPSvy5LBdcmV+xM1jv
	0x9ovU525dXLdStMArOuqmuaR5UDeoWgFOzA906RjjwDuD78C3wF2Y9o4Gq7N2qTNa2q
	a7cRwITf6dVe5PYxgC6Uka4icrgAdiSIB8lBNCHSMDl1SaDX3U32himRCUl1J5qgSM3J
	LfA0Zz33vDSFNIhPTvonZNoeUeRiWCbiOdK8KT6Ig3WPm+ugeYmDLH23LgdUE3cQ3U5n
	xuxmt/L3ncnBFMwpxexPusluDCJePZtJBpTBG2v2RLw2EK6EiLAsfgzJJS5N4qE8AcD/
	O/Sw==
X-Received: by 10.14.204.199 with SMTP id h47mr51190254eeo.48.1395674130503;
	Mon, 24 Mar 2014 08:15:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s46sm33777508ees.3.2014.03.24.08.15.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Mar 2014 08:15:29 -0700 (PDT)
Date: Mon, 24 Mar 2014 16:15:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20140324151537.GD29998@jama>
References: <5330220F.8050504@dresearch-fe.de> <1395664516.24232.56.camel@ted>
	<533029C5.1000406@dresearch-fe.de> <1395665593.24232.58.camel@ted>
	<53303FAB.5020907@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <53303FAB.5020907@dresearch-fe.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: complex versioning scenario
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
X-List-Received-Date: Mon, 24 Mar 2014 15:15:33 -0000
X-Groupsio-MsgNum: 51519
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline

--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 03:22:35PM +0100, Steffen Sledz wrote:
> On 24.03.2014 13:53, Richard Purdie wrote:
> > On Mon, 2014-03-24 at 13:49 +0100, Steffen Sledz wrote:
> >> On 24.03.2014 13:35, Richard Purdie wrote:
> >>> On Mon, 2014-03-24 at 13:16 +0100, Steffen Sledz wrote:
> >>>> We've a complex versioning scenario here which leads me to my limits=
=2E :(
> >>>>
> >>>> There are two recipes. One for a shared library and one for an appli=
cation using this library.
> >>>>
> >>>> Both use GNU autotools (so they have internal version information). =
For continuous integration purposes both use AUTOREV.
> >>>>
> >>>> At the moment the recipes look like this:
> >>>>
> >>>>
> >>>> ------------ libfoo_git.bb -------------
> >>>> PR =3D "r7"
> >>>> PE =3D "2"
> >>>> SRCREV=3D"${AUTOREV}"
> >>>> PV =3D "gitr${SRCPV}"
> >>>> ...
> >>>>
> >>>>
> >>>> ------------ app_git.bb ----------------
> >>>> DEPENDS =3D "... libfoo ..."
> >>>> PR =3D "r10"
> >>>> PE =3D "1"
> >>>> SRCREV=3D"${AUTOREV}"
> >>>> PV =3D "gitr${SRCPV}"
> >>>> ...
> >>>>
> >>>>
> >>>> Now we have the following problem. libfoo has some incompatible
> >>>> changes in its interface (a new internal major version).
> >>>>
> >>>> In my opinion this should find its represenation in the package
> >>>> versioning in a way that the dependency checker can guarantee that t=
he
> >>>> library and the application package match each other.
> >>>
> >>> It is generally impossible to directly compare two git hashes and dec=
ide
> >>> whether one is "greater" than the other. This is why most git recipes
> >>> have PV =3D "0.0+git${SRCPV}" so that you can change 0.0 when somethi=
ng
> >>> major changes. That way you can put a constraint in the second recipe.
> >>>
> >>> This is a fundamental problem with git versioning and not something we
> >>> can fix generically.
> >>
> >> To have an order in the git based versions we use the PRSERV method. T=
his works well.
> >>
> >> But this does not help here. The change in the library interface leads
> >> directly to a new version of the library package itself (e.g. from
> >> libfoo0_gitr100+somehash to libfoo0_gitr101+someotherhash). But i need
> >> something i can write into the DEPENDS list of the application. :(
> >>
> >> Steffen
> >>
> >> BTW: Where comes the 0 in libfoo0 from?
> >=20
> > debian.bbclass (debian package naming) which I believe in turn is
> > derived from the actual library version.
> >=20
> > Its a class specific implementation so you can't depend on it in version
> > information though.
>=20
> But where does it come from? A bb variable?

SONAME header in library

so if you're using debian.bbclass and change ABI then you should just
increase major version in SONAME (that way your foo will rdepend on
libfoo0 until it's rebuilt against newer libfoo1).

> > I still think your only solution here is to inject a real version into
> > PV...
>=20
> I tried this:
>=20
> change libfoo recipe to PV =3D "1.0+gitr${SRCPV}"
> leads to libfoo0_1.0+gitr102+someotherhash....ipk
>=20
> then
>=20
> change app recipe to DEPENDS =3D "... libfoo-1.0 ..."
> leads to: "ERROR: Nothing PROVIDES 'libfoo-1.0'" :(
>=20
> change app recipe to DEPENDS =3D "... libfoo0-1.0 ..."
> leads to: "ERROR: Nothing PROVIDES 'libfoo0-1.0'" :(
>=20
> change app recipe to DEPENDS =3D "... libfoo0_1.0 ..."
> leads to: "ERROR: Nothing PROVIDES 'libfoo0_1.0'" :(
>=20
> Where's the mistake?

it provides only the full P libfoo-1.0+gitr102+someotherhash so you
would need to add own PROVIDES value in libfoo.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMwTBkACgkQN1Ujt2V2gBwOjACffj3kQg5dnLslRmXsy5BHEgMb
eyMAoLVUwm0YwI0wLzDMMPT9PWPgSEDz
=Caox
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
