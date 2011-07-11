Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgJVN-0004d2-AH
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 18:38:45 +0200
Received: by wwi18 with SMTP id 18so3329552wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 09:34:48 -0700 (PDT)
Received: by 10.227.29.27 with SMTP id o27mr4570839wbc.16.1310402088721;
	Mon, 11 Jul 2011 09:34:48 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fc2sm2756830wbb.35.2011.07.11.09.34.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 09:34:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1310399860.20015.980.camel@rex>
Date: Mon, 11 Jul 2011 18:34:41 +0200
Message-Id: <164DA52B-98AF-47AA-A42D-1DE7FA9A1200@dominion.thruhere.net>
References: <1310399860.20015.980.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC PATCH 2/3] conf/machine: Overhaul tune include files
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
X-List-Received-Date: Mon, 11 Jul 2011 16:38:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 jul 2011, om 17:57 heeft Richard Purdie het volgende geschreven:

> There is currently considerable confusion over how the tune files
> operate and hwo these interact with the rest of the build system.
>=20
> This update/overhaul changes things so the tune files are primarily
> responsible for setting:
>=20
> TUNE_ARCH - What was formerly set as TARGET_ARCH and is the value
> that represents the architecture we're targetting.
>=20
> TUNE_PKGARCH - The value that represents the tune configuration that
> this set of tune parameters results in.
>=20
> The tune files continue to be responsible for setting the compiler
> flags as previously.
>=20
> To determine the values for these fields, the tune code looks at
> the values set in TUNE_FEATURES. Possible values that can be included
> in this variable for a given tune file are shown in the TUNEVALID
> variable.
>=20
> This code allows several significant improvements:
>=20
> 1) The core can now always determine the target architecture value,
> even when TARGET_ARCH needs to be reset to something different.
>=20
> 2) The tune code can allow for the definition of multilib =
configurations
> which can be enabled in the TUNE_FEATURES variable by the multilib =
class.
>=20
> 3) Distros can easily configure/override specific tunable values
> that they're specifically interested in.
>=20
> 4) Several versions of partial and buggy architecture support can be
> rolled into one good implementation (e.g. the arm endianness support).
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta-yocto/conf/machine/beagleboard.conf         |    1 -
> meta/conf/bitbake.conf                           |   11 +++++++----
> meta/conf/machine/include/tune-arm1136jf-s.inc   |    2 ++
> meta/conf/machine/include/tune-arm920t.inc       |    2 ++
> meta/conf/machine/include/tune-arm926ejs.inc     |    2 ++
> meta/conf/machine/include/tune-arm9tdmi.inc      |    2 ++
> meta/conf/machine/include/tune-armv7.inc         |   16 =
++++++++++++----
> meta/conf/machine/include/tune-atom.inc          |    8 ++++++--
> meta/conf/machine/include/tune-cortexa8.inc      |   10 +++++++---
> meta/conf/machine/include/tune-strongarm1100.inc |    2 ++
> meta/conf/machine/include/tune-thumb.inc         |   22 =
++++------------------
> meta/conf/machine/qemux86.conf                   |    3 ++-
> 12 files changed, 48 insertions(+), 33 deletions(-)

> diff --git a/meta/conf/machine/include/tune-armv7.inc =
b/meta/conf/machine/include/tune-armv7.inc
> index 979d6fe..6f7062f 100644
> --- a/meta/conf/machine/include/tune-armv7.inc
> +++ b/meta/conf/machine/include/tune-armv7.inc
> @@ -1,7 +1,15 @@
> +require conf/machine/include/arch-arm.inc

Where does that file live?

> +TUNE_PKGARCH =3D "armv7"
> +TUNE_FEATURES_tune-armv7 ??=3D "hard-fpu"
> +
> # valid options for -march: `armv7', `armv7-a', `armv7-r', `armv7-m'
> # valid option for -mtune: `cortex-a8', `cortex-r4', `cortex-m3', =
`cortex-m1'
> # This will NOT compile programs in 'ARM' mode, which is what you =
really want
> -TARGET_CC_ARCH =3D "-march=3Darmv7 -mfpu=3Dvfp -mfloat-abi=3Dsoftfp"
> -FEED_ARCH =3D "armv7"
> -PACKAGE_EXTRA_ARCHS =3D "arm armv4 armv4t armv5te armv6 armv7"
> -BASE_PACKAGE_ARCH =3D "armv7"
> +TARGET_CC_ARCH +=3D "-march=3Darmv7"
> +TARGET_CC_ARCH +=3D "-mfpu=3Dvfp -mfloat-abi=3Dsoftfp"
> +
> +TARGET_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "hard-fpu", =
"hard", "soft" ,d)}"

So the above takes care of the softfp calling conventions with hardware =
support or not, this doesn't take care of the hardfp calling conventions =
(mfloat-abi=3Dhard)

> +PACKAGE_EXTRA_ARCHS =3D "${TUNE_ARCH} armv4${ENDSUFX} =
armv4t${ENDSUFX} armv5te${ENDSUFX} armv6${ENDSUFX} armv7${ENDSUFX}"

> diff --git a/meta/conf/machine/include/tune-cortexa8.inc =
b/meta/conf/machine/include/tune-cortexa8.inc
> index a5b982a..74c1e9e 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -1,3 +1,8 @@
> +require conf/machine/include/arch-arm.inc
> +
> +TUNE_PKGARCH =3D "armv7a"
> +TUNE_FEATURES_tune-armv7a ??=3D "hard-fpu"
> +
> # Instead of using -mfpu=3Dvfp[2] we can use -mfpu=3Dneon to make use =
of gcc intrinsics[1] and vectorize loops with -ftree-vectorize[3]
> # [1] http://gcc.gnu.org/onlinedocs/gcc/ARM-NEON-Intrinsics.html
> # [2] http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html=20
> @@ -8,6 +13,5 @@ TARGET_CC_ARCH =3D "-march=3Darmv7-a -mtune=3Dcortex-a8=
 -mfpu=3Dneon -mfloat-abi=3Dsoftfp

And here you set mfpu=3Dneon, while it's optional in both the cortex-a8 =
and armv7a standards. It also shows that we're messing with hardware =
option (neon, vfp) and software option (softp) in one line.=20

> # Other potentially useful options
> #-ftree-vectorize -ffast-math -fno-omit-frame-pointer
>=20
> -FEED_ARCH =3D "armv7a"
> -BASE_PACKAGE_ARCH =3D "armv7a"
> -PACKAGE_EXTRA_ARCHS =3D "arm armv4 armv4t armv5te armv6 armv7 armv7a"
> +PACKAGE_EXTRA_ARCHS =3D "${TUNE_ARCH} armv4${ENDSUFX} =
armv4t${ENDSUFX} armv5te${ENDSUFX} armv6${ENDSUFX} armv7${ENDSUFX} =
armv7a${ENDSUFX}"

Taking armv7a as an example with my angstrom hat on I need the following =
knobs:

1) softp or hardfp calling conventions, resulting in a different package =
arch (e.g. armv7a vs armv7ahf) (link incompatible)
2) neon or not, resulting in a different packagearch (e.g armv7a vs =
armv7a-vfponly) (link compatible)
3) Thumb2 or arm mode, no direct need for different packagearch, they =
are compatible
4) use FPU fw or not (TARGET_PFU) (slightly different from 2.)

Do you have any examples on how the package arch will look with this =
patchset?

regards,

Koen=


