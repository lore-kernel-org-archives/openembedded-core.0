Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlhTQ-0004BJ-Bp
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 15:15:00 +0200
Received: by wwi18 with SMTP id 18so434748wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 06:10:47 -0700 (PDT)
Received: by 10.227.200.198 with SMTP id ex6mr5050657wbb.2.1311684375401;
	Tue, 26 Jul 2011 05:46:15 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fn12sm403941wbb.4.2011.07.26.05.46.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 05:46:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
Date: Tue, 26 Jul 2011 14:46:13 +0200
Message-Id: <CC5C3E7A-8844-4653-A734-AB1B2E98DF92@dominion.thruhere.net>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
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
X-List-Received-Date: Tue, 26 Jul 2011 13:15:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Doing a build with this one applied now, will report back later

Op 26 jul. 2011, om 14:44 heeft Richard Purdie het volgende geschreven:

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/conf/machine/include/arm/arch-arm.inc         |   16 +++++-
> meta/conf/machine/include/arm/arch-armv4.inc       |   24 +++++++++
> meta/conf/machine/include/arm/arch-armv5-dsp.inc   |   40 =
++++++++++++++
> meta/conf/machine/include/arm/arch-armv5.inc       |   51 =
++++++++++++++++++
> meta/conf/machine/include/arm/arch-armv6.inc       |   32 +++++++++++
> meta/conf/machine/include/arm/arch-armv7.inc       |   55 =
++++++++++++++++++++
> meta/conf/machine/include/arm/arch-armv7a.inc      |   54 =
+++++++++++++++++++
> meta/conf/machine/include/arm/feature-arm-neon.inc |    3 +
> .../conf/machine/include/arm/feature-arm-thumb.inc |   25 +++++++++
> meta/conf/machine/include/arm/feature-arm-vfp.inc  |    6 ++
> meta/conf/machine/include/tune-arm1136jf-s.inc     |   14 +++---
> meta/conf/machine/include/tune-arm920t.inc         |   14 ++++--
> meta/conf/machine/include/tune-arm926ejs.inc       |   18 ++++---
> meta/conf/machine/include/tune-arm9tdmi.inc        |   14 ++++--
> meta/conf/machine/include/tune-armv7.inc           |    8 +---
> meta/conf/machine/include/tune-cortexa8.inc        |   21 ++++----
> meta/conf/machine/include/tune-cortexm1.inc        |   13 ++++-
> meta/conf/machine/include/tune-cortexm3.inc        |   18 +++++--
> meta/conf/machine/include/tune-cortexr4.inc        |   18 +++++--
> meta/conf/machine/include/tune-ep9312.inc          |   16 ++++--
> meta/conf/machine/include/tune-iwmmxt.inc          |   18 +++++--
> meta/conf/machine/include/tune-strongarm1100.inc   |   13 +++--
> meta/conf/machine/include/tune-xscale.inc          |   18 ++++--
> 23 files changed, 435 insertions(+), 74 deletions(-)
> create mode 100644 meta/conf/machine/include/arm/arch-armv4.inc
> create mode 100644 meta/conf/machine/include/arm/arch-armv5-dsp.inc
> create mode 100644 meta/conf/machine/include/arm/arch-armv5.inc
> create mode 100644 meta/conf/machine/include/arm/arch-armv6.inc
> create mode 100644 meta/conf/machine/include/arm/arch-armv7.inc
> create mode 100644 meta/conf/machine/include/arm/arch-armv7a.inc
> create mode 100644 meta/conf/machine/include/arm/feature-arm-neon.inc
> create mode 100644 meta/conf/machine/include/arm/feature-arm-thumb.inc
> create mode 100644 meta/conf/machine/include/arm/feature-arm-vfp.inc
>=20
> diff --git a/meta/conf/machine/include/arm/arch-arm.inc =
b/meta/conf/machine/include/arm/arch-arm.inc
> index c517df6..4ea8b2b 100644
> --- a/meta/conf/machine/include/arm/arch-arm.inc
> +++ b/meta/conf/machine/include/arm/arch-arm.inc
> @@ -1,3 +1,17 @@
> -TUNE_ARCH =3D "arm"
> +
> +TUNEVALID[bigendian] =3D "Enable big-endian mode."
> +
> +ARMPKGARCH ??=3D "arm"
> +ARMPKGSFX_ENDIAN =3D "${@bb.utils.contains("TUNE_FEATURES", =
"bigendian", "b", "", d)}"
> +ARMPKGSFX_FPU ??=3D ""
> +ARMPKGSFX_DSP ??=3D ""
> +ARMPKGSFX_EABI ??=3D ""
> +ARMPKGSFX_THUMB ??=3D ""
> +
> +TUNE_ARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "bigendian", =
"armeb", "arm", d)}"
> +TUNE_PKGARCH =3D "${@d.getVar('ARMPKGARCH', =
True)}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIA=
N}${ARMPKGSFX_FPU}"
>=20
> ABIEXTENSION =3D "eabi"
> +
> +TARGET_FPU =3D "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or =
'soft'}"
> +
> diff --git a/meta/conf/machine/include/arm/arch-armv4.inc =
b/meta/conf/machine/include/arm/arch-armv4.inc
> new file mode 100644
> index 0000000..c014d20
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv4.inc
> @@ -0,0 +1,24 @@
> +DEFAULTTUNE ?=3D "armv4"
> +
> +ARMPKGARCH ?=3D "armv4"
> +
> +TUNEVALID[armv4] =3D "Enable instructions for ARMv4"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "armv4", =
"-march=3Darmv4${ARMPKGSFX_THUMB}", "", d)}"
> +
> +require conf/machine/include/arm/arch-arm.inc
> +require conf/machine/include/arm/feature-arm-thumb.inc
> +
> +# Little Endian
> +AVAILTUNES +=3D "armv4 armv4t"
> +TUNE_FEATURES_tune-armv4 ?=3D "armv4"
> +TUNE_FEATURES_tune-armv4t ?=3D "armv4 thumb"
> +PACKAGE_EXTRA_ARCHS_tune-armv4 =3D "arm armv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv4t =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4t"
> +
> +# Big Endian
> +AVAILTUNES +=3D "armv4b armv4tb"
> +TUNE_FEATURES_tune-armv4b ?=3D "${TUNE_FEATURES_tune-armv4} =
bigendian"
> +TUNE_FEATURES_tune-armv4tb ?=3D "${TUNE_FEATURES_tune-armv4t} =
bigendian"
> +PACKAGE_EXTRA_ARCHS_tune-armv4b =3D "armeb armv4b"
> +PACKAGE_EXTRA_ARCHS_tune-armv4tb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4tb"
> +
> diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc =
b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
> new file mode 100644
> index 0000000..498a012
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
> @@ -0,0 +1,40 @@
> +ARMPKGSFX_DSP =3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", =
"dsp" ], "e", "", d)}"
> +
> +require conf/machine/include/arm/arch-armv5.inc
> +
> +# Little Endian
> +AVAILTUNES +=3D "armv5e armv5te"
> +TUNE_FEATURES_tune-armv5e ?=3D "armv5 dsp"
> +TUNE_FEATURES_tune-armv5te ?=3D "armv5 dsp thumb"
> +PACKAGE_EXTRA_ARCHS_tune-armv5e =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5e"
> +PACKAGE_EXTRA_ARCHS_tune-armv5te =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5e armv5te"
> +
> +# Little Endian + VFP/DSP
> +AVAILTUNES +=3D "armv5e-vfp armv5te-vfp armv5ehf-vfp armv5tehf-vfp"
> +TUNE_FEATURES_tune-armv5e-vfp ?=3D "armv5 vfp dsp"
> +TUNE_FEATURES_tune-armv5te-vfp ?=3D "armv5 vfp dsp thumb"
> +TUNE_FEATURES_tune-armv5ehf-vfp ?=3D =
"${TUNE_FEATURES_tune-armv5e-vfp} callconvention-hard"
> +TUNE_FEATURES_tune-armv5tehf-vfp ?=3D =
"${TUNE_FEATURES_tune-armv5te-vfp} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp} armv5e armv5e-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp} armv5e armv5te armv5e-vfp =
armv5te-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp} armv5ehf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp} armv5ehf-vfp armv5tehf-vfp"
> +
> +# Big Endian
> +AVAILTUNES +=3D "armv5eb armv5teb"
> +TUNE_FEATURES_tune-armv5eb ?=3D "${TUNE_FEATURES_tune-armv5e} =
bigendian"
> +TUNE_FEATURES_tune-armv5teb ?=3D "${TUNE_FEATURES_tune-armv5te} =
bigendian"
> +PACKAGE_EXTRA_ARCHS_tune-armv5eb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5eb"
> +PACKAGE_EXTRA_ARCHS_tune-armv5teb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5eb armv5teb"
> +
> +# Big Endian + VFP/DSP
> +AVAILTUNES +=3D "armv5eb-vfp armv5teb-vfp armv5ehfb-vfp =
armv5tehfb-vfp"
> +TUNE_FEATURES_tune-armv5eb-vfp ?=3D "${TUNE_FEATURES_tune-armv5e-vfp} =
bigendian"
> +TUNE_FEATURES_tune-armv5teb-vfp ?=3D =
"${TUNE_FEATURES_tune-armv5te-vfp} bigendian"
> +TUNE_FEATURES_tune-armv5ehfb-vfp ?=3D =
"${TUNE_FEATURES_tune-armv5eb-vfp} callconvention-hard"
> +TUNE_FEATURES_tune-armv5tehfb-vfp ?=3D =
"${TUNE_FEATURES_tune-armv5teb-vfp} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5-vfp} armv5eb armv5eb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp} armv5eb armv5teb armv5eb-vfp =
armv5teb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp} armv5ehfb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp} armv5ehfb-vfp armv5tehfb-vfp"
> +
> diff --git a/meta/conf/machine/include/arm/arch-armv5.inc =
b/meta/conf/machine/include/arm/arch-armv5.inc
> new file mode 100644
> index 0000000..55cbe03
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv5.inc
> @@ -0,0 +1,51 @@
> +DEFAULTTUNE ?=3D "armv5"
> +
> +ARMPKGARCH ?=3D "armv5"
> +
> +TUNEVALID[armv5] =3D "Enable instructions for ARMv5"
> +TUNE_CONFLICTS[armv5] =3D "armv4"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "armv5", =
"-march=3Darmv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}"
> +
> +ARMPKGSFX_DSP =3D "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", =
"dsp" ], "e", "", d)}"
> +
> +require conf/machine/include/arm/arch-armv4.inc
> +require conf/machine/include/arm/feature-arm-vfp.inc
> +
> +# Little Endian
> +AVAILTUNES +=3D "armv5 armv5t armv5e armv5te"
> +TUNE_FEATURES_tune-armv5 ?=3D "armv5"
> +TUNE_FEATURES_tune-armv5t ?=3D "armv5 thumb"
> +PACKAGE_EXTRA_ARCHS_tune-armv5 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv4} =
armv5"
> +PACKAGE_EXTRA_ARCHS_tune-armv5t =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5 armv5t"
> +
> +# Little Endian + VFP/DSP
> +AVAILTUNES +=3D "armv5-vfp armv5t-vfp armv5hf-vfp armv5thf-vfp"
> +TUNE_FEATURES_tune-armv5-vfp ?=3D "armv5 vfp"
> +TUNE_FEATURES_tune-armv5t-vfp ?=3D "armv5 vfp"
> +TUNE_FEATURES_tune-armv5hf-vfp ?=3D "${TUNE_FEATURES_tune-armv5-vfp} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv5thf-vfp ?=3D =
"${TUNE_FEATURES_tune-armv5t-vfp} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv5-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5t-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5-vfp armv5t-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5hf-vfp =3D "armv5hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp =3D "armv5hf-vfp armv5thf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vfp} armv5ehf-vfp armv5tehf-vfp"
> +
> +# Big Endian
> +AVAILTUNES +=3D "armv5b armv5tb"
> +TUNE_FEATURES_tune-armv5b ?=3D "${TUNE_FEATURES_tune-armv5} =
bigendian"
> +TUNE_FEATURES_tune-armv5tb ?=3D "${TUNE_FEATURES_tune-armv5t} =
bigendian"
> +PACKAGE_EXTRA_ARCHS_tune-armv5b =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5b"
> +PACKAGE_EXTRA_ARCHS_tune-armv5tb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5b armv5tb"
> +
> +# Big Endian + VFP/DSP
> +AVAILTUNES +=3D "armv5b-vfp armv5tb-vfp armv5hfb-vfp armv5thfb-vfp"
> +TUNE_FEATURES_tune-armv5b-vfp ?=3D "${TUNE_FEATURES_tune-armv5-vfp} =
bigendian"
> +TUNE_FEATURES_tune-armv5tb-vfp ?=3D "${TUNE_FEATURES_tune-armv5t-vfp} =
bigendian"
> +TUNE_FEATURES_tune-armv5hfb-vfp ?=3D =
"${TUNE_FEATURES_tune-armv5b-vfp} callconvention-hard"
> +TUNE_FEATURES_tune-armv5thfb-vfp ?=3D =
"${TUNE_FEATURES_tune-armv5tb-vfp} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv5b-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5b-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5tb-vfp =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5b-vfp armv5tb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5hfb-vfp =3D "armv5hfb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv5thfb-vfp =3D "armv5hfb-vfp =
armv5thfb-vfp"
> +
> +
> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc =
b/meta/conf/machine/include/arm/arch-armv6.inc
> new file mode 100644
> index 0000000..20924c9
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> @@ -0,0 +1,32 @@
> +DEFAULTTUNE ?=3D "armv6"
> +
> +ARMPKGARCH ?=3D "armv6"
> +
> +TUNEVALID[armv6] =3D "Enable instructions for ARMv6"
> +TUNE_CONFLICTS[armv6] =3D "armv4 armv5"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "armv6", =
"-march=3Darmv6", "", d)}"
> +
> +require conf/machine/include/arm/arch-armv5-dsp.inc
> +
> +# Little Endian
> +AVAILTUNES +=3D "armv6 armv6t armv6hf armv6thf"
> +TUNE_FEATURES_tune-armv6 ?=3D "armv6 vfp"
> +TUNE_FEATURES_tune-armv6t ?=3D "armv6 vfp thumb"
> +TUNE_FEATURES_tune-armv6hf ?=3D "${TUNE_FEATURES_tune-armv6} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv6thf ?=3D "${TUNE_FEATURES_tune-armv6t} =
callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv6 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6t =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6-vfp armv6t-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6hf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp} armv6hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6thf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf-vfp"
> +
> +# Big Endian
> +AVAILTUNES +=3D "armv6b armv6tb armv6hfb armv6thfb"
> +TUNE_FEATURES_tune-armv6b ?=3D "${TUNE_FEATURES_tune-armv6} =
bigendian"
> +TUNE_FEATURES_tune-armv6tb ?=3D "${TUNE_FEATURES_tune-armv6t} =
bigendian"
> +TUNE_FEATURES_tune-armv6hfb ?=3D "${TUNE_FEATURES_tune-armv6b} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv6thfb ?=3D "${TUNE_FEATURES_tune-armv6tb} =
callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv6b =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6b-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6tb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6b-vfp armv6tb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6hfb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv6thfb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
> +
> diff --git a/meta/conf/machine/include/arm/arch-armv7.inc =
b/meta/conf/machine/include/arm/arch-armv7.inc
> new file mode 100644
> index 0000000..8bc8d10
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv7.inc
> @@ -0,0 +1,55 @@
> +DEFAULTTUNE ?=3D "armv7"
> +
> +ARMPKGARCH ?=3D "armv7"
> +
> +TUNEVALID[armv7] =3D "Enable instructions for ARMv7"
> +TUNE_CONFLICTS[armv7] =3D "armv4 armv5 armv6"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "armv7", =
"-march=3Darmv7", "", d)}"
> +
> +require conf/machine/include/arm/arch-armv6.inc
> +require conf/machine/include/arm/feature-arm-neon.inc
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "armv7 armv7t armv7-neon armv7t-neon"
> +TUNE_FEATURES_tune-armv7 ?=3D "armv7 vfp"
> +TUNE_FEATURES_tune-armv7t ?=3D "armv7 vfp thumb"
> +TUNE_FEATURES_tune-armv7-neon ?=3D "armv7 vfp neon"
> +TUNE_FEATURES_tune-armv7t-neon ?=3D "armv7 vfp neon thumb"
> +PACKAGE_EXTRA_ARCHS_tune-armv7 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv6} =
armv7-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7t =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7-vfp armv7t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7t-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7-vfp-neon armv7at2-vfp-neon"
> +
> +# VFP Tunes
> +AVAILTUNES +=3D "armv7hf armv7thf armv7hf-neon armv7thf-neon
> +TUNE_FEATURES_tune-armv7hf ?=3D "${TUNE_FEATURES_tune-armv7} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv7thf ?=3D "${TUNE_FEATURES_tune-armv7t} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv7hf-neon ?=3D =
"${TUNE_FEATURES_tune-armv7-neon} callconvention-hard"
> +TUNE_FEATURES_tune-armv7thf-neon ?=3D =
"${TUNE_FEATURES_tune_armv7t-neon} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv7hf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7thf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7hf-vfp armv7t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7hf-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7hf} armv7hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7thf-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7hf-vfp-neon =
armv7at2hf-vfp-neon"
> +
> +# Big Endian
> +AVAILTUNES +=3D "armv7b armv7tb armv7b-neon armv7tb-neon"
> +TUNE_FEATURES_tune-armv7b ?=3D "${TUNE_FEATURES_tune-armv7} =
bigendian"
> +TUNE_FEATURES_tune-armv7tb ?=3D "${TUNE_FEATURES_tune-armv7t} =
bigendian"
> +TUNE_FEATURES_tune-armv7b-neon ?=3D "${TUNE_FEATURES_tune-armv7-neon} =
bigendian"
> +TUNE_FEATURES_tune-armv7tb-neon ?=3D =
"${TUNE_FEATURES_tune-armv7t-neon} bigendian"
> +PACKAGE_EXTRA_ARCHS_tune-armv7b =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7b-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7tb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7b-vfp armv7t2b-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7b-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7b-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7tb-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7b-vfp-neon armv7at2b-vfp-neon"
> +
> +# Big Endian + VFP
> +AVAILTUNES +=3D "armv7hfb armv7thfb armv7hfb-neon armv7thfb-neon"
> +TUNE_FEATURES_tune-armv7hfb ?=3D "${TUNE_FEATURES_tune-armv7b} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv7thfb ?=3D "${TUNE_FEATURES_tune-armv7tb} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv7hfb-neon ?=3D =
"${TUNE_FEATURES_tune-armv7b-neon} callconvention-hard"
> +TUNE_FEATURES_tune-armv7thfb-neon ?=3D =
"${TUNE_FEATURES_tune_armv7tb-neon} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv7hfb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7hfb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7thfb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7hfb-vfp armv7t2hfb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7hfb-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7hfb} armv7hfb-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7thfb-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7hfb-vfp-neon =
armv7at2hfb-vfp-neon"
> +
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc =
b/meta/conf/machine/include/arm/arch-armv7a.inc
> new file mode 100644
> index 0000000..ce9cee5
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -0,0 +1,54 @@
> +DEFAULTTUNE ?=3D "armv7a"
> +
> +ARMPKGARCH ?=3D "armv7a"
> +
> +TUNEVALID[armv7-a] =3D "Enable instructions for ARMv7-a"
> +TUNE_CONFLICTS[armv7a] =3D "armv4 armv5 armv6 armv7"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "armv7a", =
"-march=3Darmv7-a -fno-tree-vectorize", "", d)}"
> +
> +require conf/machine/include/arm/arch-armv7.inc
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "armv7a armv7at armv7a-neon armv7at-neon"
> +TUNE_FEATURES_tune-armv7a ?=3D "armv7a vfp"
> +TUNE_FEATURES_tune-armv7at ?=3D "armv7a vfp thumb"
> +TUNE_FEATURES_tune-armv7a-neon ?=3D "armv7a vfp neon"
> +TUNE_FEATURES_tune-armv7at-neon ?=3D "armv7a vfp neon thumb"
> +PACKAGE_EXTRA_ARCHS_tune-armv7a =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7a-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7at =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a-vfp armv7at2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7at-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
> +
> +# VFP Tunes
> +AVAILTUNES +=3D "armv7hf armv7thf armv7hf-neon armv7thf-neon
> +TUNE_FEATURES_tune-armv7ahf ?=3D "${TUNE_FEATURES_tune-armv7a} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv7athf ?=3D "${TUNE_FEATURES_tune-armv7at} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv7ahf-neon ?=3D =
"${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
> +TUNE_FEATURES_tune-armv7athf-neon ?=3D =
"${TUNE_FEATURES_tune_armv7at-neon} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7hf} armv7ahf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7ahf-vfp armv7at2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon =
armv7at2hf-vfp-neon"
> +
> +# Big Endian
> +AVAILTUNES +=3D "armv7ab armv7atb armv7ab-neon armv7atb-neon"
> +TUNE_FEATURES_tune-armv7ab ?=3D "${TUNE_FEATURES_tune-armv7a} =
bigendian"
> +TUNE_FEATURES_tune-armv7atb ?=3D "${TUNE_FEATURES_tune-armv7at} =
bigendian"
> +TUNE_FEATURES_tune-armv7ab-neon ?=3D =
"${TUNE_FEATURES_tune-armv7a-neon} bigendian"
> +TUNE_FEATURES_tune-armv7atb-neon ?=3D =
"${TUNE_FEATURES_tune-armv7at-neon} bigendian"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ab =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7ab-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7atb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7ab-vfp armv7at2b-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7ab-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7ab-vfp-neon =
armv7at2b-vfp-neon"
> +
> +# Big Endian + VFP
> +AVAILTUNES +=3D "armv7ahfb armv7athfb armv7ahfb-neon armv7athfb-neon"
> +TUNE_FEATURES_tune-armv7ahfb ?=3D "${TUNE_FEATURES_tune-armv7ab} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv7athfb ?=3D "${TUNE_FEATURES_tune-armv7atb} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv7ahfb-neon ?=3D =
"${TUNE_FEATURES_tune-armv7ab-neon} callconvention-hard"
> +TUNE_FEATURES_tune-armv7athfb-neon ?=3D =
"${TUNE_FEATURES_tune_armv7atb-neon} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahfb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7hfb} armv7ahfb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athfb =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7ahfb-vfp armv7at2hfb-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon =
armv7at2hfb-vfp-neon"
> +
> diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc =
b/meta/conf/machine/include/arm/feature-arm-neon.inc
> new file mode 100644
> index 0000000..a7dac03
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
> @@ -0,0 +1,3 @@
> +TUNEVALID[neon] =3D "Enable Neon SIMD accelerator unit."
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "neon", =
"-mfpu=3Dneon", "" ,d)}"
> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "neon", =
"-neon", "" ,d)}"
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc =
b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> new file mode 100644
> index 0000000..9a607c6
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -0,0 +1,25 @@
> +# The instruction set the compiler should use when generating =
application
> +# code. The kernel is always compiled with arm code at present. arm =
code
> +# is the original 32 bit ARM instruction set, thumb code is the 16 =
bit
> +# encoded RISC sub-set. Thumb code is smaller (maybe 70% of the ARM =
size)
> +# but requires more instructions (140% for 70% smaller code) so may =
be
> +# slower.
> +TUNEVALID[thumb] =3D "Use thumb instructions instead of ARM"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", =
"-mthumb", "-mno-thumb", d)}"
> +OVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", =
":thumb", "", d)}"
> +
> +# Note armv7 will hit on armv7a as well
> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv4", "thumb" ], "t", "", d)}"
> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv5", "thumb" ], "t", "", d)}"
> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv6", "thumb" ], "t2", "", d)}"
> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv7", "thumb" ], "t2", "", d)}"
> +
> +# Whether to compile with code to allow interworking between the two
> +# instruction sets. This allows thumb code to be executed on a =
primarily
> +# arm system and vice versa. It is strongly recommended that DISTROs =
not
> +# turn this off - the actual cost is very small.
> +TUNEVALID[no-thumb-interwork] =3D "Disable mixing of thumb and ARM =
functions"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", =
"no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}"
> +OVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"no-thumb-interwork", ":thumb-interwork", "", d)}"
> +
> +TARGET_CC_KERNEL_ARCH +=3D "-mno-thumb-interwork -mno-thumb"
> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc =
b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> new file mode 100644
> index 0000000..29a925c
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> @@ -0,0 +1,6 @@
> +TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", =
"-vfp", "" ,d)}"
> +
> +TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call =
convention, requires VFP."
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", =
bb.utils.contains("TUNE_FEATURES", "callconvention-hard", =
"-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp", d), "" ,d)}"
> +ARMPKGSFX_EABI .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"callconvention-hard", "vfp" ], "hf", "", d)}"
> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc =
b/meta/conf/machine/include/tune-arm1136jf-s.inc
> index 953f0dd..4f4a2eb 100644
> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
> @@ -1,10 +1,10 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?=3D "arm1136jfs"
>=20
> -TUNE_CCARGS =3D "-march=3Darmv6j -mtune=3Darm1136jf-s"
> -TUNE_CCARGS +=3D "${@['', '-mfloat-abi=3Dsoftfp =
-mfpu=3Dvfp'][(bb.data.getVar('TARGET_FPU', d, 1) =3D=3D 'soft') and =
(bb.data.getVar('CPU_FEATURES', d, 1).find('vfp') !=3D -1)]}"
> -TUNE_PKGARCH =3D "armv6"
> +require conf/machine/include/arm/arch-armv6.inc
>=20
> -ARM_INSTRUCTION_SET =3D =
"${@['thumb','arm'][bb.data.getVar('CPU_FEATURES', d, 1).find('thumb') =
=3D=3D -1]}"
> -PACKAGE_EXTRA_ARCHS =3D "arm armv4 armv4t armv5te armv6"
> +TUNEVALID[arm1136jfs] =3D "Enable arm1136jfs specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "arm1136jfs", =
"-mtune=3Darm1136jf-s", "", d)}"
>=20
> -require conf/machine/include/tune-thumb.inc
> +AVAILTUNES +=3D "arm1136jfs"
> +TUNE_FEATURES_tune-arm1136jfs =3D "${TUNE_FEATURES_tune-armv6} =
arm1136jfs"
> +PACKAGE_EXTRA_ARCHS_tune-arm1136jfs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6}"
> diff --git a/meta/conf/machine/include/tune-arm920t.inc =
b/meta/conf/machine/include/tune-arm920t.inc
> index 6c87026..b7584ab 100644
> --- a/meta/conf/machine/include/tune-arm920t.inc
> +++ b/meta/conf/machine/include/tune-arm920t.inc
> @@ -1,5 +1,11 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?=3D "arm920t"
> +
> +require conf/machine/include/arm/arch-armv4.inc
> +
> +TUNEVALID[arm920t] =3D "Enable arm920t specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "arm920t", =
"-mtune=3Darm920t", "", d)}"
> +
> +AVAILTUNES +=3D "arm920t"
> +TUNE_FEATURES_tune-arm920t =3D "${TUNE_FEATURES_tune-armv4t} arm920t"
> +PACKAGE_EXTRA_ARCHS_tune-arm920t =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv4t}"
>=20
> -TUNE_PKGARCH =3D "armv4t"
> -TUNE_CCARGS =3D "-march=3Darmv4t -mtune=3Darm920t"
> -PACKAGE_EXTRA_ARCHS =3D "arm armv4 armv4t"
> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc =
b/meta/conf/machine/include/tune-arm926ejs.inc
> index 543ab62..7f2cc4e 100644
> --- a/meta/conf/machine/include/tune-arm926ejs.inc
> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
> @@ -1,9 +1,11 @@
> -require conf/machine/include/arm/arch-arm.inc
> -
> -TUNE_PKGARCH =3D "armv5te"
> -PACKAGE_EXTRA_ARCHS =3D "arm armv4 armv4t armv5te"
> -# For gcc 3.x you need:
> -#TUNE_CCARGS =3D "-march=3Darmv5te -mtune=3Darm926ejs"
> -# For gcc 4.x you need:
> -TUNE_CCARGS =3D "-march=3Darmv5te -mtune=3Darm926ej-s"
> +DEFAULTTUNE ?=3D "arm926ejs"
> +
> +require conf/machine/include/arm/arch-armv5-dsp.inc
> +
> +TUNEVALID[arm926ejs] =3D "Enable arm926ejs specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", =
"-mtune=3Darm926ej-s", "", d)}"
> +
> +AVAILTUNES +=3D "arm926ejs"
> +TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} =
arm926ejs"
> +PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
>=20
> diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc =
b/meta/conf/machine/include/tune-arm9tdmi.inc
> index f1001ac..0dc5c26 100644
> --- a/meta/conf/machine/include/tune-arm9tdmi.inc
> +++ b/meta/conf/machine/include/tune-arm9tdmi.inc
> @@ -1,5 +1,11 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?=3D "arm9tdmi"
> +
> +require conf/machine/include/arm/arch-armv4.inc
> +
> +TUNEVALID[arm9tdmi] =3D "Enable arm9tdmi specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "arm9tdmi", =
"-mtune=3Darm9tdmi", "", d)}"
> +
> +AVAILTUNES +=3D "arm9tdmi"
> +TUNE_FEATURES_tune-arm9tdmi =3D "${TUNE_FEATURES_tune-armv4t} =
arm9tdmi"
> +PACKAGE_EXTRA_ARCHS_tune-arm9tdmi =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv4t}"
>=20
> -TUNE_PKGARCH =3D "armv4t"
> -PACKAGE_EXTRA_ARCHS =3D "arm armv4 armv4t"
> -TUNE_CCARGS =3D "-mcpu=3Darm9tdmi -mtune=3Darm9tdmi"
> diff --git a/meta/conf/machine/include/tune-armv7.inc =
b/meta/conf/machine/include/tune-armv7.inc
> index 8a68c0a..664c24b 100644
> --- a/meta/conf/machine/include/tune-armv7.inc
> +++ b/meta/conf/machine/include/tune-armv7.inc
> @@ -1,8 +1,2 @@
> -require conf/machine/include/arm/arch-arm.inc
> +require conf/machine/include/arm/arch-armv7.inc
>=20
> -# valid options for -march: `armv7', `armv7-a', `armv7-r', `armv7-m'
> -# valid option for -mtune: `cortex-a8', `cortex-r4', `cortex-m3', =
`cortex-m1'
> -# This will NOT compile programs in 'ARM' mode, which is what you =
really want
> -TUNE_CCARGS =3D "-march=3Darmv7 -mfpu=3Dvfp -mfloat-abi=3Dsoftfp"
> -TUNE_PKGARCH =3D "armv7"
> -PACKAGE_EXTRA_ARCHS =3D "arm armv4 armv4t armv5te armv6 armv7"
> diff --git a/meta/conf/machine/include/tune-cortexa8.inc =
b/meta/conf/machine/include/tune-cortexa8.inc
> index ae50954..b07add4 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -1,15 +1,16 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?=3D "cortexa8-neon"
>=20
> +require conf/machine/include/arm/arch-armv7a.inc
>=20
> -# Instead of using -mfpu=3Dvfp[2] we can use -mfpu=3Dneon to make use =
of gcc intrinsics[1] and vectorize loops with -ftree-vectorize[3]
> -# [1] http://gcc.gnu.org/onlinedocs/gcc/ARM-NEON-Intrinsics.html
> -# [2] http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html=20
> -# [3] https://support.codesourcery.com/GNUToolchain/kbentry29
> +TUNEVALID[cortexa8] =3D "Enable Cortex-A8 specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", =
"-mtune=3Dcortex-a8", "", d)}"
>=20
> -TUNE_CCARGS =3D "-march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon =
-mfloat-abi=3Dsoftfp -fno-tree-vectorize"
> +AVAILTUNES +=3D "cortexa8 cortexa8t"
> +TUNE_FEATURES_tune-cortexa8 =3D "${TUNE_FEATURES_tune-armv7a} =
coretexa8"
> +TUNE_FEATURES_tune-cortexa8t =3D "${TUNE_FEATURES_tune-armv7at} =
coretexa8"
> +TUNE_FEATURES_tune-cortexa8-neon =3D "${TUNE_FEATURES_tune-cortexa8} =
neon"
>=20
> -# Other potentially useful options
> -#-ftree-vectorize -ffast-math -fno-omit-frame-pointer
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8t =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon}"
>=20
> -TUNE_PKGARCH =3D "armv7a"
> -PACKAGE_EXTRA_ARCHS =3D "arm armv4 armv4t armv5te armv6 armv7 armv7a"
> diff --git a/meta/conf/machine/include/tune-cortexm1.inc =
b/meta/conf/machine/include/tune-cortexm1.inc
> index b944db4..493025d 100644
> --- a/meta/conf/machine/include/tune-cortexm1.inc
> +++ b/meta/conf/machine/include/tune-cortexm1.inc
> @@ -1,4 +1,11 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?=3D "cortexm1"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> +
> +TUNEVALID[cortexm1] =3D "Enable Cortex-M1 specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexm1", =
"-mtune=3Dcortex-m1", "", d)}"
> +
> +AVAILTUNES +=3D "cortexm1"
> +TUNE_FEATURES_tune-cortexm1 =3D "${TUNE_FEATURES_tune-armv7a} =
coretexm1"
> +PACKAGE_EXTRA_ARCHS_tune-cortexm1 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
>=20
> -TUNE_CCARGS =3D "-march=3Darmv7 -mtune=3Dcortex-m1 -mfpu=3Dvfp =
-mfloat-abi=3Dsoftfp"
> -TUNE_PKGARCH =3D "armv6"
> diff --git a/meta/conf/machine/include/tune-cortexm3.inc =
b/meta/conf/machine/include/tune-cortexm3.inc
> index a77cbdd..f774fa6 100644
> --- a/meta/conf/machine/include/tune-cortexm3.inc
> +++ b/meta/conf/machine/include/tune-cortexm3.inc
> @@ -1,5 +1,15 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?=3D "cortexm3"
> +ARMPKGARCH ?=3D "armv7m"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> +
> +TUNEVALID[cortexm3] =3D "Enable Cortex-M3 specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexm3", =
"-mtune=3Dcortex-m3", "", d)}"
> +
> +TUNEVALID[armv7m] =3D "Enable Cortex-M3 specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "armv7m", =
"-march=3Darmv7-m", "", d)}"
> +
> +AVAILTUNES +=3D "cortexm3"
> +TUNE_FEATURES_tune-cortexm3 =3D "armv7m vfp coretexm3"
> +PACKAGE_EXTRA_ARCHS_tune-cortexm3 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m"
>=20
> -# valid options for -march: `armv7', `armv7-m'
> -TUNE_CCARGS =3D "-march=3Darmv7-m -mtune=3Dcortex-m3 -mfpu=3Dvfp =
-mfloat-abi=3Dsoftfp"
> -TUNE_PKGARCH =3D "armv7"
> diff --git a/meta/conf/machine/include/tune-cortexr4.inc =
b/meta/conf/machine/include/tune-cortexr4.inc
> index c9193ca..738f5af 100644
> --- a/meta/conf/machine/include/tune-cortexr4.inc
> +++ b/meta/conf/machine/include/tune-cortexr4.inc
> @@ -1,5 +1,15 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?=3D "cortexr4"
> +ARMPKGARCH ?=3D "armv7r"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> +
> +TUNEVALID[cortexr4] =3D "Enable Cortex-R4 specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexr4", =
"-mtune=3Dcortex-r4", "", d)}"
> +
> +TUNEVALID[armv7r] =3D "Enable Cortex-R4 specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "armv7r", =
"-march=3Darmv7-m", "", d)}"
> +
> +AVAILTUNES +=3D "cortexr4"
> +TUNE_FEATURES_tune-cortexr4 =3D "armv7r vfp coretexr4"
> +PACKAGE_EXTRA_ARCHS_tune-cortexr4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r"
>=20
> -# valid options for -march: `armv7', `armv7-r'
> -TUNE_CCARGS =3D "-march=3Darmv7-r -mtune=3Dcortex-r4 -mfpu=3Dvfp =
-mfloat-abi=3Dsoftfp"
> -TUNE_PKGARCH =3D "armv7"
> diff --git a/meta/conf/machine/include/tune-ep9312.inc =
b/meta/conf/machine/include/tune-ep9312.inc
> index e04a00a..f10123f 100644
> --- a/meta/conf/machine/include/tune-ep9312.inc
> +++ b/meta/conf/machine/include/tune-ep9312.inc
> @@ -1,9 +1,13 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?=3D "ep9312"
> +ARMPKGARCH ?=3D "ep9312"
>=20
> -TUNE_CCARGS =3D "-march=3Dep9312 -mtune=3Dep9312 -mcpu=3Dep9312"
> -# add "-mfp=3Dmaverick" for newer gcc versions > 4.0
> +require conf/machine/include/arm/arch-armv4.inc
> +
> +TUNEVALID[ep9312] =3D "Enable Intel PXA27x specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ep9312", =
"-march=3Dep9312 -mtune=3Dep9312", "", d)}"
> +
> +AVAILTUNES +=3D "ep9312"
> +TUNE_FEATURES_tune-ep9312 =3D "thumb ep9312"
> +PACKAGE_EXTRA_ARCHS_tune-ep9312 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv4t} ep9312"
>=20
> -#set arch to ep9312 for all generated packages
> -PACKAGE_EXTRA_ARCHS =3D "arm armv4t ep9312"
> -TUNE_PKGARCH =3D "ep9312"
>=20
> diff --git a/meta/conf/machine/include/tune-iwmmxt.inc =
b/meta/conf/machine/include/tune-iwmmxt.inc
> index 6bb76d5..14f5955 100644
> --- a/meta/conf/machine/include/tune-iwmmxt.inc
> +++ b/meta/conf/machine/include/tune-iwmmxt.inc
> @@ -1,8 +1,16 @@
> -require conf/machine/include/arm/arch-arm.inc
> -
> # Configurations for the Intel PXA27x Appications Processor Family.=20
> # Please use tune-xscale for PXA255/PXA26x based processors.
> -TUNE_CCARGS =3D "-march=3Diwmmxt -mcpu=3Diwmmxt -mtune=3Diwmmxt"
> -PACKAGE_EXTRA_ARCHS =3D "arm armv4 armv4t armv5te iwmmxt"
> -TUNE_PKGARCH =3D "iwmmxt"
> +
> +DEFAULTTUNE ?=3D "iwmmxt"
> +ARMPKGARCH ?=3D "iwmmxt"
> +
> +require conf/machine/include/arm/arch-armv5-dsp.inc
> +
> +TUNEVALID[iwmmxt] =3D "Enable Intel PXA27x specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "iwmmxt", =
"-march=3Diwmmxt -mtune=3Diwmmxt", "", d)}"
> +
> +AVAILTUNES +=3D "iwmmxt"
> +TUNE_FEATURES_tune-iwmmxt =3D "thumb iwmmxt"
> +PACKAGE_EXTRA_ARCHS_tune-iwmmxt =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} iwmmxt"
> +
>=20
> diff --git a/meta/conf/machine/include/tune-strongarm1100.inc =
b/meta/conf/machine/include/tune-strongarm1100.inc
> index 2b76069..66bab8e 100644
> --- a/meta/conf/machine/include/tune-strongarm1100.inc
> +++ b/meta/conf/machine/include/tune-strongarm1100.inc
> @@ -1,9 +1,12 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?=3D "strongarm"
>=20
> -TUNE_PKGARCH =3D "arm"
> +require conf/machine/include/arm/arch-armv4.inc
>=20
> -# This machine lists common configuration options for Strongarm 1100 =
devices
> -# NOTE: The Zaurus Collie also has a Strongarm processor, but uses =
the 1110 type
> +TUNEVALID[strongarm] =3D "Enable Strongarm 1100 series processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "strongarm", =
"-mtune=3Dstrongarm1100", "", d)}"
> +
> +AVAILTUNES +=3D "strongarm"
> +TUNE_FEATURES_tune-strongarm =3D "${TUNE_FEATURES_tune-armv4} =
strongarm"
> +PACKAGE_EXTRA_ARCHS_tune-strongarm =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv4}"
>=20
> -TUNE_CCARGS =3D "-march=3Darmv4 -mtune=3Dstrongarm1100"
>=20
> diff --git a/meta/conf/machine/include/tune-xscale.inc =
b/meta/conf/machine/include/tune-xscale.inc
> index 71dba5b..0303320 100644
> --- a/meta/conf/machine/include/tune-xscale.inc
> +++ b/meta/conf/machine/include/tune-xscale.inc
> @@ -1,11 +1,17 @@
> -require conf/machine/include/arm/arch-arm.inc
> +DEFAULTTUNE ?=3D "xscale"
>=20
> -INHERIT +=3D "siteinfo"
> +require conf/machine/include/arm/arch-armv5-dsp.inc
>=20
> -TUNE_CCARGS =3D "-march=3Darmv5te -mtune=3Dxscale"
> -TARGET_CC_KERNEL_ARCH =3D "-march=3Darmv5te -mtune=3Dxscale"
> -TUNE_PKGARCH =3D "${@['armv5teb', =
'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) =3D=3D 'le']}"
> -PACKAGE_EXTRA_ARCHS =3D "${@['armeb armv4b armv4tb armv5teb', 'arm =
armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) =3D=3D =
'le']}"
> +TUNEVALID[xscale] =3D "Enable PXA255/PXA26x Xscale specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "xscale", =
"-mtune=3Dxscale", "", d)}"
> +
> +AVAILTUNES +=3D "xscale"
> +TUNE_FEATURES_tune-xscale =3D "${TUNE_FEATURES_tune-armv5te} xscale"
> +PACKAGE_EXTRA_ARCHS_tune-xscale =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
> +
> +AVAILTUNES +=3D "xscale-be"
> +TUNE_FEATURES_tune-xscale =3D "${TUNE_FEATURES_tune-armv5teb} xscale"
> +PACKAGE_EXTRA_ARCHS_tune-xscale =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
>=20
> # webkit-gtk has alignment issues with double instructions on armv5 so
> # disable them here
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



