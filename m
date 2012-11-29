Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Te33M-0007Cu-UY
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 13:17:17 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so7930667eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 04:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MbszFt4U7gRbeHWj+5MymvfQebaQXxuuQrc/Eo45H9c=;
	b=uHYbangQVB/ySeJyttIO3/h3bQYf0QUc6fTjTIVA7T98ayOpKuy3r/+boDIUzXESow
	8JHTJeqxxnFoQExmYAwzKjktWBYnBH+CWbr6H9lnOHcR8FTDDSC6OWyf1qypA2uL1XA6
	igPvf0GmLKXh6xV00rCKlr0SmHDDP2LAVrUewN7Zo/MoLlay3vMd/U1g/Lay+LJUHy+n
	TvTY+1fkm5+7B+LSmUrlxJIc5Nm9NQ0FX1AVbfgQB5VdJJEkFPZzRfNS7ZVdmdAII1w6
	XZ0tNqom9m8Kuku2/KAfDDoBelwYhePs/PJ6Iy74QJ5Sx/0qPCicNh5DWr3x8F234shz
	Rp+g==
Received: by 10.14.193.136 with SMTP id k8mr81252800een.30.1354190581246;
	Thu, 29 Nov 2012 04:03:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm3183807eeg.4.2012.11.29.04.02.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 04:03:00 -0800 (PST)
Date: Thu, 29 Nov 2012 13:02:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20121129120257.GF3477@jama.jama.net>
References: <50B6546E.5070308@mlbassoc.com>
	<20121128214208.GE3477@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121128214208.GE3477@jama.jama.net>
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
X-List-Received-Date: Thu, 29 Nov 2012 12:17:17 -0000
X-Groupsio-MsgNum: 31930
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Content-Disposition: inline

--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2012 at 10:42:08PM +0100, Martin Jansa wrote:
> On Wed, Nov 28, 2012 at 11:14:06AM -0700, Gary Thomas wrote:
> > I build for an OMAP4 platform using
> >    DEFAULTTUNE =3D "cortexa9hf-neon"
> >=20
> > This has been working fine, but after updating to the latest master, I'=
m getting this error
> >=20
> >      Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (c=
ortexa9hf-neonhf-vfp-neon).
> >      PACKAGE_ARCHS =3D (all any noarch armv5hf-vfp armv5ehf-vfp armv6hf=
-vfp armv7ahf-vfp armv7ahf-vfp-neon cobra4430p82)
> >=20
> > (I added the print of the expanded PACKAGE_ARCHS for clarity)
> >=20
> > I bisected change this to this commit (Poky/Yocto tree):
> >=20
> > commit c5b670e4c9f020ed951d5499a888c50b1d703b62
> > Author: Martin Jansa <Martin.Jansa@gmail.com>
> > Date:   Tue Oct 2 17:22:00 2012 +0000
> >=20
> >      arm/arch-arm*: define ARMPKGARCH_tune-* for default tunes
> >=20
> >      * tune-foo is not valid override, for it to work I had to add
> >        ARMPKGARCH =3D "${ARMPKGARCH_tune-${DEFAULTTUNE}}"
> >        but that doesn't work without value defined for every supported
> >        DEFAULTTUNE value, otherwise it's expanded like this
> >        TUNE_PKGARCH (${ARMPKGARCH_tune-armv5te}te).
> >=20
> >      (From OE-Core rev: 31e4f2dee990ee7f5d7491b65565e71d7d580209)
> >=20
> >      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > Any ideas how I can fix this?
>=20
> I've noticed the same problem today and I'm working on fix. No idea why
> I haven't seen this with my tests done with contrib/jansa/tune2-test
> branch.
>=20
> First part of fix is:
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/t=
une-fix&id=3Da63f9cc754b16a9ac35a1952f70960ec118d6b80

FYI:

I've extended my branch for testing tune files:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune2-=
test
to test not only DEFAULTTUNE with fake MACHINES but all combinations of
MACHINES and DEFAULTTUNEs.

Script is still running but I've already found some old issues like
1) missing thumb in armv5te-vfp (and higher)
2) little endian PACKAGE_ARCHs included in big endian tunes

And while I was there I've added some possibly usefull tunes like
cortexa8t-neon and armv6 without vfp (we had patch for this for almost a
year).

I'll send pull request for this branch
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune-f=
ix
after finishing testing.

I also plan to compare AVAILTUNEs on cortexa9 device with "openssl speed",
like hrw did:
http://marcin.juszkiewicz.com.pl/2012/11/28/lets-compare-some-cpu

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC3TvEACgkQN1Ujt2V2gBzkkgCfcLgQZ83nOr5DSj1EVDRtlmBB
aXMAnidAa9UnpDRrLKL7Q+hQtQKmrn9Y
=WMr4
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
