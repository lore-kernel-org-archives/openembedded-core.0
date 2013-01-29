Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U07yw-0005eM-Kp
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 11:00:05 +0100
Received: by mail-we0-f175.google.com with SMTP id x8so159473wey.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 01:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=SWQwTA8dRz9GbIMTR4b/QKtnIZ9bEdUANhx+KCqs5Lw=;
	b=QcXsP7G7n2wUMdsBk+n4vmreP33ZdMDx26W7unYpy1qO5spHtxNuBpJx0FCUL6VI8Y
	XwrDO/hdj5sYsG4yjCG3jw4w34MxhX6j7RCCwb5u4WptMd4xbQHeIPNbG59Nkw70gO8Y
	ZA+uGimiWnj7Kr8fWV94bz2q3NTl8HCr20tXGAnz6Etx9iimw3Fa8WvZrz7xAWa+D7A4
	etLgscoR8rri+gIf0d3ycyjA+h/jScCYdJf6PBvM69sgC9pAqR7Vj7xlDKDzEQpBb483
	srbTdSqOgG4Xljyb8CDXz1lCAreT6qb2zdYTGcMjFnshKnSls2fvz6EwpYmvimPuHanf
	5s+A==
X-Received: by 10.180.97.197 with SMTP id ec5mr808672wib.1.1359452658713;
	Tue, 29 Jan 2013 01:44:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gz3sm2265315wib.2.2013.01.29.01.44.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 01:44:17 -0800 (PST)
Date: Tue, 29 Jan 2013 10:44:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130129094422.GJ16904@jama.palm1.palmone.com>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1301290359260.12134@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: BB_NO_NETWORK = "1" causes fetch to fail for unnecessary u-boot parsing
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
X-List-Received-Date: Tue, 29 Jan 2013 10:00:27 -0000
X-Groupsio-MsgNum: 34619
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bsy/rPjPw3Zgz4JZ"
Content-Disposition: inline

--Bsy/rPjPw3Zgz4JZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 04:08:10AM -0500, Robert P. J. Day wrote:
>=20
>   not sure if this is expected behaviour, but i'm using the meta-ti
> layer to build a core-image-minimal for a am180x-evm.  i'm using
> "own-mirrors" to use my own premirrors directory and i've collected
> all of the necessary tarballs and actually completed the build, after
> which i make sure i have saved all of the tarballs so i don't need
> to download anything for a subsequent build.
>=20
>   as a test, i totally delete my build and start over, but this time
> with
>=20
>   BB_NO_NETWORK =3D "1"
>=20
> which i assumed would still work.  instead, i almost immediately got
> this:
>=20
> $ bitbake -c fetch core-image-minimal
> Pseudo is not present but is required, building this first before the
> main build
> ERROR: ExpansionError during parsing
> /home/rpjday/oe/dist/layers/meta-ti/recipes-bsp/u-boot/u-boot_2013.01.bb:
> Failure expanding variable SRCPV, expression was
> ${@bb.fetch2.get_srcrev(d)} which triggered exception NetworkAccess:
> Network access disabled through BB_NO_NETWORK but access requested
> with command git ls-remote
> git://arago-project.org/git/projects/u-boot-keystone.git
> DEV.MCSDK-03.00.00.06 (for url None)
> ERROR: Command execution failed: Exited with 1

It's using tag instead of hash in SRCREV, so it behaves the same as
SRC_URI =3D "git://.*;tag=3Dfoo" and tries to access upstream repo to
convert tag name to hash (or check if it's still the same hash as when
you've built it last time.

Cheers,

>   that's not even the version of u-boot that's going to be used, as
> "bitbake -s" shows:
>=20
> u-boot  :2009.11+r68+gitr5f16b8551b125f16cd8d58f278cb25b94272fd9f-r68
>=20
> so i'm guessing that what's happening here is that even though the
> u-boot recipe file u-boot_2013.01.bb will contribute nothing to this
> build, its parsing alone requires network access, which makes the
> usage of BB_NO_NETWORK =3D "1" somewhat useless in this context.
>=20
>   am i misreading something?  thoughts?
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bsy/rPjPw3Zgz4JZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEHmfYACgkQN1Ujt2V2gByeEwCfQyndu94b/F8RKdY38C62IvWy
HPcAnjRUUy4/4uJ0NbtmrrM6wTsIgK1L
=AGdB
-----END PGP SIGNATURE-----

--Bsy/rPjPw3Zgz4JZ--
