Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QmL3Y-0008LJ-1A
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 09:30:58 +0200
Received: by fxg11 with SMTP id 11so1088936fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mBaYkR20wMGQVPzhMTgB/dOQ8WT9BM4Auxv67c0ikX8=;
	b=SettOxRcg36FR4kURwTBKGQLwiBURPErGMta3xbWkJcy7CE7XFEaBdIVU+SFmmEhOZ
	5ye5rKsHNgaaD2pXkwcnj4ft0vTZYZ1R7SJ+/wpJfk1AHEgIqRLeOAThkFzy0yrih/e+
	BHP8dSsysCbXyb+auPszdJUW8cmWrAtZKlb2E=
Received: by 10.223.15.138 with SMTP id k10mr921650faa.101.1311837899590;
	Thu, 28 Jul 2011 00:24:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j19sm302818faa.41.2011.07.28.00.24.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 00:24:57 -0700 (PDT)
Date: Thu, 28 Jul 2011 09:24:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110728072450.GE15286@jama.jama.net>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311777255.30326.347.camel@phil-desktop>
	<4E302785.9070705@windriver.com>
	<1311780347.30326.376.camel@phil-desktop>
	<4E30489A.100@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4E30489A.100@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Thu, 28 Jul 2011 07:30:58 -0000
X-Groupsio-MsgNum: 6941
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline

--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2011 at 12:19:22PM -0500, Mark Hatle wrote:
> On 7/27/11 10:25 AM, Phil Blundell wrote:
> > On Wed, 2011-07-27 at 09:58 -0500, Mark Hatle wrote:
> >> For the tune names..  armv5 means I want classic ARM instructions, whi=
le armv5t
> >> means I was thumb instructions.
> >>
> >> So armv5 and armv5t are distinct in the contents of the tunings.
> >=20
> > Ah, I see.  Does that go for v4t too?  I can imagine cases where you
> > would want to say "select the v4T ISA but generate ARM code not Thumb".
>=20
> Yes, for all of them, the TUNENAME selects the features that you want to =
use to
> compile, and suggests the other information like compatible architectures.
>=20
> In the case where you want to build primarily one, and optionally the oth=
er the
> tunename makes it easy..
>=20
> Say you want all of your system thumb, except for a few specific programs=
=2E.
>=20
> TUNENAME =3D "armv4t"
>=20
> TUNENAME_pn-mysql =3D "armv4"
>=20
> In the opposite case, where you want everything ARM, except for a few thu=
mb:
>=20
> TUNENAME =3D "armv7"
> TUNENAME_pn-bash =3D "armv7t"
>=20
> PACKAGE_EXTRA_ARCHS_tune-armv7 =3D ${PACKAGE_EXTRA_ARCHS_tune-armv7t}

We've discussed this yesterday on #yocto and there is problem with this

Before tune-* overhaul we had ARM_INSTRUCTION_SET option to force arm
mode from recipe even for architectures supporting thumb (ie armv4t).

Mark is right that if we have PACKAGE_ARCH =3D "armv4t" and we force
no-thumb with ARM_INSTRUCTION_SET =3D "arm" then PACKAGE_ARCH should be
switched to "armv4" only to indicate that.

But ARM_INSTRUCTION_SET worked for all ARM architectures, but now I
would need to set
TUNENAME_pn-eglibc =3D "armv4" in openembedded-core/meta/conf/machine/inclu=
de/arm/arch-armv4.inc
TUNENAME_pn-eglibc =3D "armv5" in openembedded-core/meta/conf/machine/inclu=
de/arm/arch-armv5.inc
TUNENAME_pn-eglibc =3D "armv6" in openembedded-core/meta/conf/machine/inclu=
de/arm/arch-armv6.inc
TUNENAME_pn-eglibc =3D "armv7" in openembedded-core/meta/conf/machine/inclu=
de/arm/arch-armv7.inc
etc.. because I cannot disable thumb (while keeping thumb-interwork
enabled) from recipe globally for all as=20
openembedded-core/meta/conf/machine/include/tune-thumb.inc
does, but that's not used and=20
ARM_THUMB_M_OPT =3D "${@['-mno-thumb','-mthumb'][bb.data.getVar('ARM_INSTRU=
CTION_SET', d, 1) =3D=3D 'thumb']}"
is not respected anymore in
openembedded-core/meta/conf/machine/include/arm/feature-arm-thumb.inc

ARM_INSTRUCTION_SET =3D "arm" is used in some recipes because with thumb
enabled it fails to build and maybe such recipes can be fixed
(ie eglibc now fails for armv4t and armv7a)
and for some recipes it's set because it's producing faster code (where
binary size was more important).

Another problem with setting TUNENAME_pn-foo for every arch is when
foo_1.0.bb is in some obscure layer somewhere and maintainer of that
layer would need to alter all arch-armv[4567]*.inc files to keep foo
=66rom using thumb. Maybe something like this in recipe should work?
TUNENAME_pn-eglibc_armv4t =3D "armv4"
TUNENAME_pn-eglibc_armv5t =3D "armv5"

And scale of ARM_INSTRUCTION_SET now ignored with oe-core:
OE om-gta02@shr ~/shr-core/openembedded-core $ git grep ARM_INSTRUCTION_SET
meta/classes/qt4e.bbclass:ARM_INSTRUCTION_SET =3D "arm"
meta/classes/qt4x11.bbclass:ARM_INSTRUCTION_SET =3D "arm"
meta/conf/machine/include/tune-thumb.inc:ARM_INSTRUCTION_SET ?=3D "arm"
meta/conf/machine/include/tune-thumb.inc:OVERRIDE_THUMB =3D "${@['', ':thum=
b'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) =3D=3D 'thumb']}"
meta/conf/machine/include/tune-thumb.inc:ARM_THUMB_M_OPT =3D "${@['-mno-thu=
mb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) =3D=3D 'thumb']=
}"
meta/recipes-core/eglibc/eglibc.inc:ARM_INSTRUCTION_SET =3D "arm"
meta/recipes-core/glib-2.0/glib.inc:ARM_INSTRUCTION_SET =3D "arm"
meta/recipes-core/glibc/glibc.inc:ARM_INSTRUCTION_SET =3D "arm"
meta/recipes-core/glibc/glibc_2.10.1.bb:ARM_INSTRUCTION_SET =3D "arm"
meta/recipes-core/uclibc/uclibc.inc:                ${@["","s,.*COMPILE_IN_=
THUMB_MODE.*,COMPILE_IN_THUMB_MODE=3Dy,;"][bb.data.getVar("ARM_INSTRUCTION_=
SET", d, 1) !=3D "arm"]} \
meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc:ARM_INSTRUCTION_SET =3D "a=
rm"
meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc:ARM_INSTRUCTION_SET =
=3D "arm"
meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb:ARM_INSTRUCTION_SET =3D "=
arm"
meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb:ARM_INSTRUCTIO=
N_SET =3D "arm"
meta/recipes-multimedia/libmad/libmad_0.15.1b.bb:ARM_INSTRUCTION_SET =3D "a=
rm"
meta/recipes-multimedia/tremor/tremor_20101121.bb:ARM_INSTRUCTION_SET =3D "=
arm"
meta/recipes-qt/qt4/qt4_arch.inc:ARM_INSTRUCTION_SET =3D "arm"
meta/recipes-support/boost/boost-36.inc:ARM_INSTRUCTION_SET =3D "arm"
meta/recipes-support/gmp/gmp.inc:ARM_INSTRUCTION_SET =3D "arm"
meta/recipes-support/libgcrypt/libgcrypt.inc:ARM_INSTRUCTION_SET =3D "arm"
meta/recipes-support/liboil/liboil_0.3.17.bb:ARM_INSTRUCTION_SET =3D "arm"

OE om-gta02@shr ~/shr-core/meta-openembedded $ git grep ARM_INSTRUCTION_SET
meta-efl/classes/e-base.bbclass:ARM_INSTRUCTION_SET =3D "arm"
meta-efl/recipes-efl/webkit/webkit-efl_svn.bb:ARM_INSTRUCTION_SET =3D "arm"
meta-oe/recipes-core/glib-2.0/glib.inc:ARM_INSTRUCTION_SET =3D "arm"
meta-oe/recipes-devtools/gcc/gcc-4.5.inc:ARM_INSTRUCTION_SET =3D "arm"
meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc:ARM_INSTRUCTION_SET =3D "ar=
m"
meta-oe/recipes-support/postgresql/postgresql.inc:ARM_INSTRUCTION_SET =3D "=
arm"

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4xDsIACgkQN1Ujt2V2gBwhogCdGNUr6Y+BWYdKVkro1rLM4WAZ
gWgAnRRjAB+ikrW+NTrmfqxoIhrDonVc
=DXo8
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
