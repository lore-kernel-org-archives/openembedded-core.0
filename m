Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdRv4-0005TC-MM
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 21:38:14 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6968094eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WWLgniOX0FC3FMtn9cL8XVDaffG9wZXCgvBfD1vMOjg=;
	b=sqBpbwAhDN1YyqTkkfhKL2eqZDCPgoDT2A9F/sLwQQErrlUufjRec8db7ScS0ulXo2
	nfFyyI+Y6HEkqa1QQQrflGSCgMMzCSi5GMVReXB487bob8K7LcmLHxnALC1wuWfKyOsR
	ESlUC4RKlIeuNw5yhlkvSdlQ96W6SQz5C6xbJWPzxwKo5T0aG7jvz389iZPH8/AHkdzu
	nuksvz7EJHIxijkz7/fB/S87MrBOMSKxOceRJv6LH8m3t/T2e7pL1BkNyH0GtfngZTHa
	3k98Ti1LPSEDbQCJ1rCa8bc7O1DHOH9ymFRGM46btfXk57Hf9TroLdzQcfMk+Cl9wfpo
	aBcw==
Received: by 10.14.211.135 with SMTP id w7mr62126510eeo.4.1354047841321;
	Tue, 27 Nov 2012 12:24:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm4481401eep.5.2012.11.27.12.24.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:24:00 -0800 (PST)
Date: Tue, 27 Nov 2012 21:23:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121127202356.GJ3692@jama.jama.net>
References: <20121127154129.GC3692@jama.jama.net>
	<1354047102.21863.105.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1354047102.21863.105.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RDEPENDS of packages created by PACKAGES_DYNAMIC not built before image rootfs
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
X-List-Received-Date: Tue, 27 Nov 2012 20:38:14 -0000
X-Groupsio-MsgNum: 31808
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+PbGPm1eXpwOoWkI"
Content-Disposition: inline

--+PbGPm1eXpwOoWkI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2012 at 08:11:42PM +0000, Richard Purdie wrote:
> On Tue, 2012-11-27 at 16:41 +0100, Martin Jansa wrote:
> > Hi,
> >=20
> > pulseaudio has
> > RDEPENDS_pulseaudio-module-console-kit =3D+ "consolekit"
> >=20
> > and pulseaudio-module-console-kit is dynamic package
> > PACKAGES_DYNAMIC +=3D "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse=
-lib.* ^libpulse-module.* "
> >=20
> > If you have image where consolekit is pulled to image only by=20
> > pulseaudio-module-console-kit (e.g. through pulseaudio-server).=20
> > Then consolekit is not built before image do_rootfs is executed and do_=
rootfs fails.
> >=20
> > Easy way to reproduce this is to build e.g. core-image-minimal with=20
> > pulseaudio-module-console-kit or pulseaudio-server added to IMAGE_INSTA=
LL.=20
> > Will fail with:
> >   * satisfy_dependencies_for: Cannot satisfy the following dependencies=
 for pulseaudio-server:
> >   *    consolekit *
> >   * opkg_install_cmd: Cannot install package pulseaudio-server.
> >=20
> >=20
> > Not sure what's proper fix, bitbake probably just checks that right pro=
vider for=20
> > pulseaudio-module-console-kit is pulseaudio because of PACKAGES_DYNAMIC=
, but does not check=20
> > RDEPENDS_pulseaudio-module-console-kit after that.
> >=20
> > We can add consolekit to build time deps like it was before, but that's=
 just=20
> > work around and not correct fix.
> >=20
> > Also filled as
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3498
>=20
> Well, you can't have this both ways :)

IMHO Only one way is correct and that would be enough :).

> Bitbake doesn't know which modules this package will produce since its
> using PACKAGES_DYNAMIC. It does its best effort to try and find DEPENDS
> but it can't take the regexps and come up with
> "pulseaudio-module-console-kit", hence it doesn't see the RDEPENDS.
> There isn't any generic way we can teach it to do that either. If it
> did, it would simply always build consolekit which you say you don't
> want so its not relevant anyway.
>=20
> So basically, you need to decide whether you want consolekit enabled or
> not and build accordingly, there is nothing you can do within bitbake to
> "mind read" what the image is going to want...

No, you know that you will need pulseaudio-module-console-kit because
pulseaudio-server RDEPENDs on it (not on any pulseaudio-module-* but
pulseaudio-module-console-kit exactly). So it's not really mind reading.

If it's not possible with current code-base then we should document it
and add some work around in pulseaudio (I'm fine with building
consolekit even when it's not used later).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+PbGPm1eXpwOoWkI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC1IVwACgkQN1Ujt2V2gBwSwQCfea3ylp/e+K7pOSfAk7nqoSni
GHkAn1ReaMNdKLNmsLkORi0wIV2orcTM
=PW1i
-----END PGP SIGNATURE-----

--+PbGPm1eXpwOoWkI--
