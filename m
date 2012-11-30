Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeTr8-0008US-VA
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 17:54:28 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so392783eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 08:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=2abbkBF8odtj9VXZ16jTeeiqcsZ8xO4CeDC+8TCZtoI=;
	b=vNkLrJZJD4V87NZLP0S2HyLVb1DVp8/NAPq/SLGdZhf+iIrLBcv7ascOnNlByxRkjb
	Rkxi96ft/2C+pog4cBaQkWLUnKo/XPPoIlFgRNnhZekdvD3mzwrgcqwX11TfT8bmiDMY
	T4YWwq9MLtk/pErujseXwv0pTPUb26aIm5kGFeS/IJHBFPcrrw5F0IeGLV8wIXspGTEM
	0PWz9WiT/bF/FtuoJ8919ceiARMpNkHeJ15kHbO83bdX5aHv4VTzd6dJXPnHtSFKEOzI
	VXOjJFy/f37sCxzW/ol9ly7fN/EfOLKKuNsmUyELP2DxwQY8JbFU/zEnIHwjlhz4ugkl
	ohag==
Received: by 10.14.178.7 with SMTP id e7mr6196220eem.44.1354293609700;
	Fri, 30 Nov 2012 08:40:09 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm11458936eem.3.2012.11.30.08.40.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 08:40:09 -0800 (PST)
Date: Fri, 30 Nov 2012 17:40:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121130163855.GG3436@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: some variables not expanded corectly before BUILDCFG_VARS are shown
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
X-List-Received-Date: Fri, 30 Nov 2012 16:54:28 -0000
X-Groupsio-MsgNum: 32030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ZmrHH5cGjskQnY1"
Content-Disposition: inline

--+ZmrHH5cGjskQnY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

when testing tune files I've noticed that TUNE_FEATURES are always shown
the same, even when build uses different value set from local.conf:

I've added DEFAULTTUNE to BUILDCFG_VARS to be sure:
BUILDCFG_VARS =3D "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE
DISTRO DISTRO_VERSION TUNE_FEATURES DEFAULTTUNE TARGET_FPU"

I was changing DEFAULTTUNE with machine override in local.conf or .inc
file required from local.conf.

$ grep DEFAULTTUNE conf/local.conf=20
DEFAULTTUNE_om-gta02 =3D "arm920t"
DEFAULTTUNE_nokia900 =3D "cortexa8t-neon"
DEFAULTTUNE_tuna =3D "cortexa9t-neon"

But the output at the beginning of build log was still the same.=20
1st is without any change to DEFAULTTUNE (so correctly armv4t and armv7a-ne=
on)
2nd is with DEFAULTTUNE set in conf/local.conf with machine override
3rd is with default DEFAULTTUNE changed in tune-* file

2nd and 3rd correctly uses cortexa9t-neon/cortexa8t-neon/arm920t tune, but =
only 3rd shows it:
nokia900/20121130041857.log:DEFAULTTUNE       =3D "armv7a-neon"
nokia900/20121130041857.log:TUNE_FEATURES     =3D "armv7a vfp neon"
nokia900/20121130101904.log:DEFAULTTUNE       =3D "armv7a-neon"
nokia900/20121130101904.log:TUNE_FEATURES     =3D "armv7a vfp neon"
nokia900/20121130135815.log:DEFAULTTUNE       =3D "cortexa8t-neon"
nokia900/20121130135815.log:TUNE_FEATURES     =3D "armv7a vfp thumb neon co=
rtexa8"
om-gta02/20121130042112.log:DEFAULTTUNE       =3D "armv4t"
om-gta02/20121130042112.log:TUNE_FEATURES     =3D "armv4 thumb"
om-gta02/20121130102310.log:DEFAULTTUNE       =3D "armv4t"
om-gta02/20121130102310.log:TUNE_FEATURES     =3D "armv4 thumb"
om-gta02/20121130140126.log:DEFAULTTUNE       =3D "arm920t"
om-gta02/20121130140126.log:TUNE_FEATURES     =3D "armv4 thumb arm920t"
tuna/20121130041547.log:DEFAULTTUNE       =3D "armv7a-neon"
tuna/20121130041547.log:TUNE_FEATURES     =3D "armv7a vfp neon"
tuna/20121130101500.log:DEFAULTTUNE       =3D "armv7a-neon"
tuna/20121130101500.log:TUNE_FEATURES     =3D "armv7a vfp neon"
tuna/20121130135506.log:DEFAULTTUNE       =3D "cortexa8t-neon"
tuna/20121130135506.log:TUNE_FEATURES     =3D "armv7a vfp thumb neon cortex=
a8"

What's even more strange is that "thumb" override get applied in different =
order in 3rd build:
$ bitbake-diffsigs  tmp-eglibc/sstate-diff/13542[78]*/nokia900/cor*/libmad*=
/*do_con*
basehash changed from 8ad5d9c1803fed09a89e626c07581cb1 to 7e316bb3c389fe3cd=
a6652ac1476a883
Variable EXTRA_OECONF value changed from=20
-enable-speed --enable-shared --enable-fpm=3Darm --disable-aso --enable-fpm=
=3Ddefault=20
to=20
-enable-speed --enable-shared --disable-aso --enable-fpm=3Ddefault --enable=
-fpm=3Darm
# because libmad has:
# The ASO's don't take any account of thumb...
EXTRA_OECONF_append_thumb =3D " --disable-aso --enable-fpm=3Ddefault"
EXTRA_OECONF_append_arm =3D " --enable-fpm=3Darm"
But both 2srd and 3rd got --mtune=3Dcortexa8.

buildhistory.bbclass seems to read the same TUNE_PKGARCH (armv4t),=20
all other builds are in arm920tt-oe-linux-gnueabi:
$ find ~/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi
/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi
/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers
/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0
/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/bblaye=
rs-1.0
/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/temp
/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/temp/r=
un.buildhistory_commit.4401
/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/temp/r=
un.buildhistory_commit.6566
/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/temp/r=
un.buildhistory_commit.11843

Any idea what is causing that?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+ZmrHH5cGjskQnY1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC44WcACgkQN1Ujt2V2gBwVtQCgjj0ci5GZim4uPK1mnXu90zta
z/YAoKRE5L6g8IOeJFzRA9bmU6SuXzim
=4kMn
-----END PGP SIGNATURE-----

--+ZmrHH5cGjskQnY1--
