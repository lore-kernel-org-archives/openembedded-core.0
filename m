Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdpcJ-0005mA-2R
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 22:56:27 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5353535eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 13:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7Vp0l5XYdPmpF3vEa2lLq+i6G6MVt/b+FyJZ8sMa8oE=;
	b=kcTPK/C9S/ZG7fCQPaLnNWCTy5XRDnfGNC0tRcqdF36r3DtMIyopmxPJ0s9xVvfu6i
	1Q/PEWC4VUgfSOS3G6gUujxpXgKqBHPh1gEp/1LIjtAXyfOjXkOh+xb0FLeD0R+lpbiY
	/8O70cuRpG/lWtWjAs8RJjrixQhjhWwbukKxdlAeOrUZkBLQAFUT4VdXkUm0pssSdCS9
	SkfQsbbrmmL6JC8R0yh/Lxsn0hf/8nt6KQDIaM9jlCHe55vbx2utEgRe1RHNcbOd6GrD
	5hpvrfUzZ6M8l4ZyEt+y8Ye9UZX82ieGo1MmnF/4sgI2wKDfwJyyBjt3GklGwqSr6vOx
	/6ZQ==
Received: by 10.14.194.4 with SMTP id l4mr24908490een.42.1354138932146;
	Wed, 28 Nov 2012 13:42:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n7sm31891068eeo.2.2012.11.28.13.42.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 13:42:11 -0800 (PST)
Date: Wed, 28 Nov 2012 22:42:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20121128214208.GE3477@jama.jama.net>
References: <50B6546E.5070308@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <50B6546E.5070308@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: New ARM error
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
X-List-Received-Date: Wed, 28 Nov 2012 21:56:27 -0000
X-Groupsio-MsgNum: 31897
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline

--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2012 at 11:14:06AM -0700, Gary Thomas wrote:
> I build for an OMAP4 platform using
>    DEFAULTTUNE =3D "cortexa9hf-neon"
>=20
> This has been working fine, but after updating to the latest master, I'm =
getting this error
>=20
>      Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (cor=
texa9hf-neonhf-vfp-neon).
>      PACKAGE_ARCHS =3D (all any noarch armv5hf-vfp armv5ehf-vfp armv6hf-v=
fp armv7ahf-vfp armv7ahf-vfp-neon cobra4430p82)
>=20
> (I added the print of the expanded PACKAGE_ARCHS for clarity)
>=20
> I bisected change this to this commit (Poky/Yocto tree):
>=20
> commit c5b670e4c9f020ed951d5499a888c50b1d703b62
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Tue Oct 2 17:22:00 2012 +0000
>=20
>      arm/arch-arm*: define ARMPKGARCH_tune-* for default tunes
>=20
>      * tune-foo is not valid override, for it to work I had to add
>        ARMPKGARCH =3D "${ARMPKGARCH_tune-${DEFAULTTUNE}}"
>        but that doesn't work without value defined for every supported
>        DEFAULTTUNE value, otherwise it's expanded like this
>        TUNE_PKGARCH (${ARMPKGARCH_tune-armv5te}te).
>=20
>      (From OE-Core rev: 31e4f2dee990ee7f5d7491b65565e71d7d580209)
>=20
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Any ideas how I can fix this?

I've noticed the same problem today and I'm working on fix. No idea why
I haven't seen this with my tests done with contrib/jansa/tune2-test
branch.

First part of fix is:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/tun=
e-fix&id=3Da63f9cc754b16a9ac35a1952f70960ec118d6b80

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC2hTAACgkQN1Ujt2V2gBycpQCgsKzMrJP8o1obEyb3AdWgT9Bi
vvAAmwbstRyvMaNLSoEeaEDLOW13e03g
=Do95
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
