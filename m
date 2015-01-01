Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id D91FE601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jan 2015 01:54:23 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id v10so21696137pde.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 17:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=oxcid1j5Fx6VCkuj+7ycBjqNwB6/IyHiPiZrSUSaBdM=;
	b=oTf5PyKhVLoNdelb0uUDquwkjBwgjD5KZMykWt3eXRumWty0zvBZw4KW745C9ZfEXK
	EwOIb9J4O9uftGFe+JlGRcScD2YiTpUdMkoDX2VefCJg8f8WOOv/2Bq3v2qWWwt22+5q
	Iu0EbPT4nefkooFBlwLiiHLKqxlwtMBNmUHvKr4b66BsUTfSf+pCiRMJ5AS+AcIUjc+3
	dExjykJ7DlfeLJtsgnJdJixilOU46WbAUp3C3LLpB6VLPRcjl5oMqpn4VCLK/EeWZAP+
	YUmGpHGW1qXpfbSoqgIz0UbSjTD3PwBTALr4X0ZRkGK/3H64gDMmhxG3WBxLRTTKQASH
	r5uQ==
X-Received: by 10.70.45.17 with SMTP id i17mr111982134pdm.13.1420077264127;
	Wed, 31 Dec 2014 17:54:24 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:57d:8d0:eedc:6d7a?
	([2601:9:3580:84c:57d:8d0:eedc:6d7a])
	by mx.google.com with ESMTPSA id
	bx13sm42435932pdb.19.2014.12.31.17.54.23
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Dec 2014 17:54:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <ac1f0f1165f32e886f7c6ffa5ebe304416db1d95.1418885581.git.kai.kang@windriver.com>
Date: Wed, 31 Dec 2014 17:54:22 -0800
Message-Id: <FD445EB2-CED3-445A-8888-4839F76F3FA2@gmail.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
	<ac1f0f1165f32e886f7c6ffa5ebe304416db1d95.1418885581.git.kai.kang@windriver.com>
To: Kai Kang <kai.kang@windriver.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 18/19] aarch-arm64: Update tune files
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
X-List-Received-Date: Thu, 01 Jan 2015 01:54:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 18, 2014, at 12:51 AM, Kai Kang <kai.kang@windriver.com> wrote:
>=20
> From: Mark Hatle <mark.hatle@windriver.com>
>=20
> arch-arm64 is the base tune file for aarch64.  Update this to allow =
the
> system to work with both aarch32 and aarch64 (multilib).
>=20
> arch-armv8 is for compatibility, it simply uses the base config for =
now.
>=20
> feature-arm-thumb was updated, since aarch64 mode does NOT have thumb =
support.
> We should only be processing warnings and additional arguments if =
thumb
> support is enabled on the processor core.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> meta/conf/machine/include/arm/arch-arm64.inc       | 36 =
++++++++++++++++++++++
> meta/conf/machine/include/arm/arch-armv8.inc       | 21 +------------
> .../conf/machine/include/arm/feature-arm-thumb.inc | 10 ++++--
> 3 files changed, 44 insertions(+), 23 deletions(-)
> create mode 100644 meta/conf/machine/include/arm/arch-arm64.inc
>=20
> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc =
b/meta/conf/machine/include/arm/arch-arm64.inc
> new file mode 100644
> index 0000000..5376b87
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> @@ -0,0 +1,36 @@
> +DEFAULTTUNE ?=3D "aarch64"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> +
> +TUNEVALID[aarch64] =3D "Enable instructions for aarch64"
> +
> +MACHINEOVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"aarch64", ":aarch64", "" ,d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "aarch64 aarch64_be"
> +ARMPKGARCH_tune-aarch64 ?=3D "aarch64"
> +ARMPKGARCH_tune-aarch64_be ?=3D "aarch64_be"
> +TUNE_FEATURES_tune-aarch64 ?=3D "aarch64"
> +TUNE_FEATURES_tune-aarch64_be ?=3D "${TUNE_FEATURES_tune-aarch64} =
bigendian"
> +BASE_LIB_tune-aarch64 =3D "lib64"
> +BASE_LIB_tune-aarch64_be =3D "lib64"
> +
> +PACKAGE_EXTRA_ARCHS_tune-aarch64 =3D "aarch64"
> +PACKAGE_EXTRA_ARCHS_tune-aarch64_be =3D "aarch64_be"
> +
> +ARMPKGSFX_ENDIAN_64 =3D "${@bb.utils.contains("TUNE_FEATURES", =
"bigendian", "_be", "", d)}"
> +TUNE_ARCH_64 =3D "aarch64${ARMPKGSFX_ENDIAN_64}"
> +TUNE_PKGARCH_64 =3D "aarch64${ARMPKGSFX_ENDIAN_64}"
> +ABIEXTENSION_64 =3D ""
> +TARGET_FPU_64 =3D ""
> +
> +# Duplicated from arch-arm.inc
> +TUNE_ARCH_32 =3D "${@bb.utils.contains("TUNE_FEATURES", "bigendian", =
"armeb", "arm", d)}"
> +TUNE_PKGARCH_32 =3D =
"${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGS=
FX_ENDIAN}${ARMPKGSFX_FPU}"
> +ABIEXTENSION_32 =3D "eabi"
> +TARGET_FPU_32 =3D "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or =
'soft'}"
> +
> +TUNE_ARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "aarch64", =
"${TUNE_ARCH_64}", "${TUNE_ARCH_32}" ,d)}"
> +TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "aarch64", =
"${TUNE_PKGARCH_64}", "${TUNE_PKGARCH_32}" ,d)}"
> +ABIEXTENSION =3D "${@bb.utils.contains("TUNE_FEATURES", "aarch64", =
"${ABIEXTENSION_64}", "${ABIEXTENSION_32}" ,d)}"
> +TARGET_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "aarch64", =
"${TARGET_FPU_64}", "${TARGET_FPU_32}" ,d)}"
> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc =
b/meta/conf/machine/include/arm/arch-armv8.inc
> index c86142a..5e832fa 100644
> --- a/meta/conf/machine/include/arm/arch-armv8.inc
> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
> @@ -1,20 +1 @@
> -DEFAULTTUNE ?=3D "aarch64"
> -
> -ARMPKGARCH ?=3D "aarch64"
> -
> -TUNEVALID[aarch64] =3D "Enable instructions for aarch64"
> -TUNEVALID[bigendian] =3D "Enable big-endian mode."
> -TUNECONFLICTS[aarch64] =3D ""
> -MACHINEOVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"aarch64", ":aarch64", "" ,d)}"
> -
> -# Little Endian base configs
> -AVAILTUNES +=3D "aarch64 aarch64_be"
> -TUNE_FEATURES_tune-aarch64 ?=3D "aarch64"
> -TUNE_FEATURES_tune-aarch64_be ?=3D "${TUNE_FEATURES_tune-aarch64} =
bigendian"
> -
> -ARMPKGSFX_ENDIAN =3D "${@bb.utils.contains("TUNE_FEATURES", =
"bigendian", "_be", "", d)}"
> -
> -TUNE_ARCH =3D "aarch64${ARMPKGSFX_ENDIAN}"
> -TUNE_PKGARCH =3D "aarch64${ARMPKGSFX_ENDIAN}"
> -
> -PACKAGE_EXTRA_ARCHS =3D "aarch64${ARMPKGSFX_ENDIAN}"
> +require conf/machine/include/arm/arch-arm64.inc

may be it should be merged with patch 02/19=20

> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc =
b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> index a94386f..8e6619d 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -18,6 +18,8 @@ ARM_THUMB_SUFFIX .=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d
> # some recipe explicitly sets ARM_INSTRUCTION_SET to "arm"
> ARM_M_OPT =3D "${@bb.utils.contains('TUNE_FEATURES', 'arm', =
'${ARM_THUMB_OPT}', 'thumb', d)}"
> python () {
> +    if bb.utils.contains('TUNE_FEATURES', 'thumb', 'False', 'True', =
d):
> +        return

won=E2=80=99t this regress the configurations which enabled thumb as =
default but some applications are built in arm mode

>     selected =3D d.getVar('ARM_INSTRUCTION_SET', True)
>     if selected =3D=3D None:
>         return
> @@ -37,8 +39,10 @@ ARMPKGSFX_THUMB .=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_
> # arm system and vice versa. It is strongly recommended that DISTROs =
not
> # turn this off - the actual cost is very small.
> TUNEVALID[no-thumb-interwork] =3D "Disable mixing of thumb and ARM =
functions"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'no-thumb-interwork', ' -mno-thumb-interwork', ' -mthumb-interwork', =
d)}"
> -OVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'no-thumb-interwork', ':thumb-interwork', '', d)}"
> +THUMB_TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'no-thumb-interwork', ' -mno-thumb-interwork', ' -mthumb-interwork', =
d)}"
> +THUMB_OVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'no-thumb-interwork', ':thumb-interwork', '', d)}"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' =
${THUMB_TUNE_CCARGS}', '', d)}"
> +OVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' =
${THUMB_OVERRIDES}', '', d)}"
>=20
> # what about armv7m devices which don't support -marm (e.g. =
Cortex-M3)?
> -TARGET_CC_KERNEL_ARCH +=3D "-mno-thumb-interwork -marm"
> +TARGET_CC_KERNEL_ARCH +=3D "${@bb.utils.contains('TUNE_FEATURES', =
'thumb', '-mno-thumb-interwork -marm', '', d)}"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


