Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TerDO-0002oA-3Y
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Dec 2012 18:50:58 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so591608eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2012 09:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rCxrCmEupFeimjAFvvsSzeh/71z01h2KIPt8sswzMNk=;
	b=rFlthmD2iu++AN/T2ckcIrwPy3eqUzuFQx/49jLfpdHEDC8h5i7sRe6THZVnlwzTjW
	IPGeYJDvs/ZUD0wy1+63yAUkwlZKParszUi4dTnywD42ypM+Plm22z60G2UUVJDI7iqn
	+VqaUylFIGRYJmmbhmcyn0Z8lq7Zl+lZO+FVM0GXysFuA7RnnaQGzpaZ27O2OuUWtVvx
	jDQ1BrXGYQSzRpnvo8EvAIckoyLd84RAL/0+6LNDtfokjlXph2myJoKnEmGfbFrUAC7h
	l3v4ljk3HcU90kViXr57vIi89z4Uyum9lneRlYJUesykHJAeo2QValeCbpZJrnDanpJd
	d54A==
Received: by 10.14.221.5 with SMTP id q5mr17633016eep.33.1354383399409;
	Sat, 01 Dec 2012 09:36:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 43sm18859923eed.10.2012.12.01.09.36.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 01 Dec 2012 09:36:38 -0800 (PST)
Date: Sat, 1 Dec 2012 18:36:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121201173643.GO3436@jama.jama.net>
References: <20121130163855.GG3436@jama.jama.net> <1354372477.5970.2.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1354372477.5970.2.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: some variables not expanded corectly before BUILDCFG_VARS are shown
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
X-List-Received-Date: Sat, 01 Dec 2012 17:50:58 -0000
X-Groupsio-MsgNum: 32053
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="de1H0RjRxOSdb4we"
Content-Disposition: inline

--de1H0RjRxOSdb4we
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 01, 2012 at 02:34:37PM +0000, Richard Purdie wrote:
> On Fri, 2012-11-30 at 17:40 +0100, Martin Jansa wrote:
> > Hi,
> >=20
> > when testing tune files I've noticed that TUNE_FEATURES are always shown
> > the same, even when build uses different value set from local.conf:
> >=20
> > I've added DEFAULTTUNE to BUILDCFG_VARS to be sure:
> > BUILDCFG_VARS =3D "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACH=
INE
> > DISTRO DISTRO_VERSION TUNE_FEATURES DEFAULTTUNE TARGET_FPU"
> >=20
> > I was changing DEFAULTTUNE with machine override in local.conf or .inc
> > file required from local.conf.
> >=20
> > $ grep DEFAULTTUNE conf/local.conf=20
> > DEFAULTTUNE_om-gta02 =3D "arm920t"
> > DEFAULTTUNE_nokia900 =3D "cortexa8t-neon"
> > DEFAULTTUNE_tuna =3D "cortexa9t-neon"
> >=20
> > But the output at the beginning of build log was still the same.=20
> > 1st is without any change to DEFAULTTUNE (so correctly armv4t and armv7=
a-neon)
> > 2nd is with DEFAULTTUNE set in conf/local.conf with machine override
> > 3rd is with default DEFAULTTUNE changed in tune-* file
> >=20
> > 2nd and 3rd correctly uses cortexa9t-neon/cortexa8t-neon/arm920t tune, =
but only 3rd shows it:
> > nokia900/20121130041857.log:DEFAULTTUNE       =3D "armv7a-neon"
> > nokia900/20121130041857.log:TUNE_FEATURES     =3D "armv7a vfp neon"
> > nokia900/20121130101904.log:DEFAULTTUNE       =3D "armv7a-neon"
> > nokia900/20121130101904.log:TUNE_FEATURES     =3D "armv7a vfp neon"
> > nokia900/20121130135815.log:DEFAULTTUNE       =3D "cortexa8t-neon"
> > nokia900/20121130135815.log:TUNE_FEATURES     =3D "armv7a vfp thumb neo=
n cortexa8"
> > om-gta02/20121130042112.log:DEFAULTTUNE       =3D "armv4t"
> > om-gta02/20121130042112.log:TUNE_FEATURES     =3D "armv4 thumb"
> > om-gta02/20121130102310.log:DEFAULTTUNE       =3D "armv4t"
> > om-gta02/20121130102310.log:TUNE_FEATURES     =3D "armv4 thumb"
> > om-gta02/20121130140126.log:DEFAULTTUNE       =3D "arm920t"
> > om-gta02/20121130140126.log:TUNE_FEATURES     =3D "armv4 thumb arm920t"
> > tuna/20121130041547.log:DEFAULTTUNE       =3D "armv7a-neon"
> > tuna/20121130041547.log:TUNE_FEATURES     =3D "armv7a vfp neon"
> > tuna/20121130101500.log:DEFAULTTUNE       =3D "armv7a-neon"
> > tuna/20121130101500.log:TUNE_FEATURES     =3D "armv7a vfp neon"
> > tuna/20121130135506.log:DEFAULTTUNE       =3D "cortexa8t-neon"
> > tuna/20121130135506.log:TUNE_FEATURES     =3D "armv7a vfp thumb neon co=
rtexa8"
> >=20
> > What's even more strange is that "thumb" override get applied in differ=
ent order in 3rd build:
> > $ bitbake-diffsigs  tmp-eglibc/sstate-diff/13542[78]*/nokia900/cor*/lib=
mad*/*do_con*
> > basehash changed from 8ad5d9c1803fed09a89e626c07581cb1 to 7e316bb3c389f=
e3cda6652ac1476a883
> > Variable EXTRA_OECONF value changed from=20
> > -enable-speed --enable-shared --enable-fpm=3Darm --disable-aso --enable=
-fpm=3Ddefault=20
> > to=20
> > -enable-speed --enable-shared --disable-aso --enable-fpm=3Ddefault --en=
able-fpm=3Darm
> > # because libmad has:
> > # The ASO's don't take any account of thumb...
> > EXTRA_OECONF_append_thumb =3D " --disable-aso --enable-fpm=3Ddefault"
> > EXTRA_OECONF_append_arm =3D " --enable-fpm=3Darm"
> > But both 2srd and 3rd got --mtune=3Dcortexa8.
> >=20
> > buildhistory.bbclass seems to read the same TUNE_PKGARCH (armv4t),=20
> > all other builds are in arm920tt-oe-linux-gnueabi:
> > $ find ~/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi
> > /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi
> > /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers
> > /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0
> > /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/bb=
layers-1.0
> > /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/te=
mp
> > /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/te=
mp/run.buildhistory_commit.4401
> > /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/te=
mp/run.buildhistory_commit.6566
> > /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/te=
mp/run.buildhistory_commit.11843
> >=20
> > Any idea what is causing that?
>=20
> Was this with or without the recent bitbake patch "data_smart: Improve
> get_hash to account for overrides and key expansion" ? if without,
> please see if that helps...

It was without this patch, only current master, but with this patch it
looks the same in log (I haven't checked if thumb/arm overrides are
still applied in different order, but output of=20
bitbake -e | grep OVERRIDES is the same for all 3 cases also with or=20
without this patch).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--de1H0RjRxOSdb4we
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC6QCsACgkQN1Ujt2V2gBwgrgCfRhg1cJhuTxKX5w/u6/hW+pgt
8sgAn1Ht8fQ+pbtxQOdJ3vXYgKqWnmYc
=/nRP
-----END PGP SIGNATURE-----

--de1H0RjRxOSdb4we--
