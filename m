Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5936FFC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 21:14:26 +0000 (UTC)
Received: by pfv76 with SMTP id 76so1167991pfv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=JH90yOa2gcYbwDbR2aTTpqtA/6XlWeqs2yjjcLqGznk=;
	b=ArhQRu44C7UpkuvMLBrA2lab67SHrl+IMxy/zp17AYiM3+xTgXhKzpeNT6Vg+4jwoY
	jdVsZLN99t3gt0j8H8mPs+5amIe+F4Mmmyxzd+27u2s9e1ueikb3iZhUhQNwara/UuIb
	NPeVMcQtwUttwZwBGA2ZBv2fYdFv8B+9bztuGSK9dIju+Pl5DAB41ykmXprjeTskFqjC
	hev1Z/rtx4rm4NEjKfOwiRsSyqLupDfqnS1nsEmmLE2ScOZ3IPVq2i5wioJ9Y8Gesqig
	MJSJVeWEqhC+clln/0m6b13do5il0BZIHf5OUBz+O3Nu8cP5LWkI5Bz7klGtdWX6JIqm
	4jaQ==
X-Received: by 10.98.12.205 with SMTP id 74mr9951358pfm.53.1449782067254;
	Thu, 10 Dec 2015 13:14:27 -0800 (PST)
Received: from ?IPv6:2601:647:4c02:370d:8808:cc68:7cdd:e1d?
	([2601:647:4c02:370d:8808:cc68:7cdd:e1d])
	by smtp.gmail.com with ESMTPSA id
	v64sm20402028pfi.50.2015.12.10.13.14.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Dec 2015 13:14:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1350437f19e20de76f98bcda866b2f0239ee7f9d.1449754344.git.Martin.Jansa@gmail.com>
Date: Thu, 10 Dec 2015 13:14:25 -0800
Message-Id: <CBD4B6C1-4663-467C-943A-05779F2C94C6@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
	<cover.1449754344.git.Martin.Jansa@gmail.com>
	<1350437f19e20de76f98bcda866b2f0239ee7f9d.1449754344.git.Martin.Jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][master][RESEND 11/15] feature-arm-{neon, vfp}.inc: refactor and fix issues
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
X-List-Received-Date: Thu, 10 Dec 2015 21:14:26 -0000
X-Groupsio-MsgNum: 74625
Content-Type: multipart/signed;
	boundary="Apple-Mail=_76061437-8F47-4170-91D1-FDC20709A88C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_76061437-8F47-4170-91D1-FDC20709A88C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 10, 2015, at 5:48 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> * respect all 4 vfp options ('vfp', 'vfpv3d16', 'vfpv3', 'vfpv4') when
>  setting -mfloat-abi and ARMPKGSFX_EABI, without this change it wasn't
>  possible to use call-convention hard together with vfpv4
> * move 'vfpv3d16', 'vfpv3', 'vfpv4' support from
>  feature-arm-vfp.inc
>  to
>  feature-arm-neon.inc

may be this should be other way around semantically, what does vip file =
has

>  the main difference is that feature-arm-vfp.inc is included in
>  arch-armv5.inc while feature-arm-neon.inc only in armv7*.inc, so
>  these options should be added to TUNEVALID also only for armv7*
>  MACHINEs.
> * support vfpv4 with or without neon
>  when both vfpv4 and neon are in TUNE_FEATURES we want to set only one
>  -mfpu parameter and to neon-vfpv4
> * prevent multiple appends to ARMPKGSFX_FPU, we don't want to include
>  e.g. -vfp as well as -vfpv4 when both "vfp" and "vfpv4" are in
>  TUNE_FEATURES
> * add -mfpu=3Dvfp for tunes with "vfp" in TUNE_FEATURES - before that =
we
>  were only adding -vfp to ARMPKGSFX_FPU
> * add TUNE_CCARGS_MFPU variable which is used to set -mfpu parameter =
as
>  well as ARMPKGSFX_FPU suffix in TUNE_PKGARCH, all enabled values are
>  appended to it based on TUNE_FEATURES and then the last one is used
>  in the actual param and suffix
> * this prevents multiple -mfpu options in TUNE_CCARGS
>=20
> * !!!
>  This means we need to change TUNE_PKGARCH and PACKAGE_EXTRA_ARCHS for
>  vfpv4, vfpv3d16, vfpv3 tunes, because the -vfp* isn't prependend
>  multiple times. If you're using one of these new DEFAULTTUNES (which
>  were at least partially broken anyway) and depend on working binary
>  package feed upgrade-path, then don't forget to migrate PR service
>  database to new TUNE_PKGARCH.
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta/conf/machine/include/arm/arch-armv7a.inc      | 64 =
+++++++++++-----------
> meta/conf/machine/include/arm/feature-arm-neon.inc | 19 ++++++-
> meta/conf/machine/include/arm/feature-arm-vfp.inc  | 22 +++-----
> meta/conf/machine/include/tune-cortexa15.inc       |  8 +--
> meta/conf/machine/include/tune-cortexa17.inc       |  8 +--
> meta/conf/machine/include/tune-cortexa5.inc        |  8 +--
> meta/conf/machine/include/tune-cortexa7.inc        | 12 ++--
> meta/conf/machine/include/tune-cortexa8.inc        |  8 +--
> meta/conf/machine/include/tune-cortexa9.inc        |  8 +--
> 9 files changed, 84 insertions(+), 73 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc =
b/meta/conf/machine/include/arm/arch-armv7a.inc
> index 0c6e755..1f2e071 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -32,14 +32,14 @@ TUNE_FEATURES_tune-armv7a-neon-vfpv4  =3D =
"${TUNE_FEATURES_tune-armv7a-neon}  vfpv
> TUNE_FEATURES_tune-armv7at-neon-vfpv4 =3D =
"${TUNE_FEATURES_tune-armv7at-neon} vfpv4"
> PACKAGE_EXTRA_ARCHS_tune-armv7a             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6}  armv7a armv7a-vfp"
> PACKAGE_EXTRA_ARCHS_tune-armv7at            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a armv7a-vfp armv7at2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16    =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfp-vfpv3d16"
> -PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16   =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-vfpv3d16 =
armv7at2-vfp-vfpv3d16"
> -PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16}  armv7a-vfp-vfpv3d16-vfpv3"
> -PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfp-vfpv3d16-vfpv3 =
armv7at2-vfp-vfpv3d16-vfpv3"
> -PACKAGE_EXTRA_ARCHS_tune-armv7a-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7at-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  armv7a-vfp-neon-vfpv4"
> -PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} armv7a-vfp-neon-vfpv4 =
armv7at2-vfp-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16    =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16   =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfpv3d16 armv7at2-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16}  armv7a-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfpv3 =
armv7at2-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-armv7a-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7at-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-neon armv7at2-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  armv7a-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} armv7a-neon-vfpv4 =
armv7at2-neon-vfpv4"
>=20
> # HF Tunes
> AVAILTUNES +=3D "armv7ahf armv7athf armv7ahf-vfpv3d16 =
armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3 armv7ahf-neon =
armv7athf-neon armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4"
> @@ -65,14 +65,14 @@ TUNE_FEATURES_tune-armv7ahf-neon-vfpv4  =3D =
"${TUNE_FEATURES_tune-armv7a-neon-vfpv
> TUNE_FEATURES_tune-armv7athf-neon-vfpv4 =3D =
"${TUNE_FEATURES_tune-armv7at-neon-vfpv4} callconvention-hard"
> PACKAGE_EXTRA_ARCHS_tune-armv7ahf             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6hf}  armv7ahf-vfp"
> PACKAGE_EXTRA_ARCHS_tune-armv7athf            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16    =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfp-vfpv3d16"
> -PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16   =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-vfpv3d16 =
armv7at2hf-vfp-vfpv3d16"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16}  =
armv7ahf-vfp-vfpv3d16-vfpv3"
> -PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} =
armv7ahf-vfp-vfpv3d16-vfpv3 armv7at2hf-vfp-vfpv3d16-vfpv3"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon =
armv7at2hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  armv7ahf-vfp-neon-vfpv4"
> -PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-neon-vfpv4 =
armv7at2hf-vfp-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16    =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16   =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfpv3d16 =
armv7at2hf-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16}  armv7ahf-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfpv3 =
armv7at2hf-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-neon armv7at2hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  armv7ahf-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-neon-vfpv4 =
armv7at2hf-neon-vfpv4"
>=20
> # Big Endian
> AVAILTUNES +=3D "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16 =
armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon armv7atb-neon =
armv7ab-neon-vfpv4 armv7atb-neon-vfpv4"
> @@ -98,14 +98,14 @@ TUNE_FEATURES_tune-armv7ab-neon-vfpv4  =3D =
"${TUNE_FEATURES_tune-armv7a-neon-vfpv4
> TUNE_FEATURES_tune-armv7atb-neon-vfpv4 =3D =
"${TUNE_FEATURES_tune-armv7at-neon-vfpv4} bigendian"
> PACKAGE_EXTRA_ARCHS_tune-armv7ab             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6b}  armv7ab-vfp"
> PACKAGE_EXTRA_ARCHS_tune-armv7atb            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7ab-vfp armv7at2b-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16    =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfp-vfpv3d16"
> -PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16   =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfp-vfpv3d16 =
armv7at2b-vfp-vfpv3d16"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16}  =
armv7ab-vfp-vfpv3d16-vfpv3"
> -PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16} =
armv7ab-vfp-vfpv3d16-vfpv3 armv7at2b-vfp-vfpv3d16-vfpv3"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfp-neon =
armv7at2b-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon-vfpv4  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon}  armv7ab-vfp-neon-vfpv4"
> -PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon-vfpv4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon} armv7ab-vfp-neon-vfpv4 =
armv7at2b-vfp-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16    =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16   =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfpv3d16 =
armv7at2b-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16}  armv7ab-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16} armv7ab-vfpv3 =
armv7at2b-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-neon armv7at2b-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon-vfpv4  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon}  armv7ab-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon-vfpv4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon} armv7ab-neon-vfpv4 =
armv7at2b-neon-vfpv4"
>=20
> # Big Endian + HF
> AVAILTUNES +=3D "armv7ahfb armv7athfb armv7ahfb-vfpv3d16 =
armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3 armv7ahfb-neon =
armv7athfb-neon armv7ahfb-neon-vfpv4 armv7athfb-neon-vfpv4"
> @@ -131,11 +131,11 @@ TUNE_FEATURES_tune-armv7ahfb-neon-vfpv4  =3D =
"${TUNE_FEATURES_tune-armv7ahf-neon-v
> TUNE_FEATURES_tune-armv7athfb-neon-vfpv4 =3D =
"${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} bigendian"
> PACKAGE_EXTRA_ARCHS_tune-armv7ahfb             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}  armv7ahfb-vfp"
> PACKAGE_EXTRA_ARCHS_tune-armv7athfb            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16    =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfp-vfpv3d16"
> -PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16   =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-vfpv3d16 =
armv7at2hfb-vfp-vfpv3d16"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16}  =
armv7ahfb-vfp-vfpv3d16-vfpv3"
> -PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16} =
armv7ahfb-vfp-vfpv3d16-vfpv3 armv7at2hfb-vfp-vfpv3d16-vfpv3"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon =
armv7at2hfb-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon-vfpv4  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon}  armv7ahfb-vfp-neon-vfpv4"
> -PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon-vfpv4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon} armv7ahfb-vfp-neon-vfpv4 =
armv7at2hfb-vfp-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16    =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16   =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfpv3d16 =
armv7at2hfb-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16}  armv7ahfb-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16} armv7ahfb-vfpv3 =
armv7at2hfb-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-neon armv7at2hfb-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon-vfpv4  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon}  armv7ahfb-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon-vfpv4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon} armv7ahfb-neon-vfpv4 =
armv7at2hfb-neon-vfpv4"
> diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc =
b/meta/conf/machine/include/arm/feature-arm-neon.inc
> index e9351f9..50d9175 100644
> --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
> @@ -1,3 +1,18 @@
> +# GCC supports following options:
> +# 'vfp', 'vfpv3', 'vfpv3-fp16', 'vfpv3-d16', 'vfpv3-d16-fp16', =
'vfpv3xd', 'vfpv3xd-fp16', 'neon', 'neon-fp16', 'vfpv4', 'vfpv4-d16', =
'fpv4-sp-d16', 'neon-vfpv4', 'fpv5-d16', 'fpv5-sp-d16', 'fp-armv8', =
'neon-fp-armv8', and 'crypto-neon-fp-armv8'
> +
> +# Only some combinations are supported here.
> +# 'vfp', -mfloat-abi parameter and 'hf' suffix is implemented in =
feature-arm-vfp.inc
> +
> TUNEVALID[neon] =3D "Enable Neon SIMD accelerator unit."
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neon', =
bb.utils.contains('TUNE_FEATURES', 'vfpv4', ' -mfpu=3Dneon-vfpv4', ' =
-mfpu=3Dneon', d), '' , d)}"
> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neon', =
'-neon', '', d)}"
> +TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neon', =
' neon', '', d)}"
> +
> +TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with =
16 registers (vfpv3-d16) unit."
> +TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'vfpv3d16', ' vfpv3d16', '', d)}"
> +
> +TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32 =
registers (vfpv3) unit."
> +TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', =
' vfpv3', '' , d)}"
> +
> +TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv4) =
unit."
> +TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', =
' vfpv4', '', d)}"
> +TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', [ =
'vfpv4', 'neon' ], ' neon-vfpv4', '', d)}"
> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc =
b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> index e23d377..1b39488 100644
> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> @@ -1,17 +1,13 @@
> -TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', =
'-vfp', '' ,d)}"
> -
> -TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with =
16 registers (vfpv3-d16) unit."
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', ' =
-mfpu=3Dvfpv3-d16', '', d)}"
> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', =
'-vfpv3d16', '' ,d)}"
> +# This is only for VFPv1 or VFPv2, other vfp* tunes are defined in
> +# feature-arm-neon.inc, because they are available only for armv7*
> +# and this .inc file is included from armv5
>=20
> -TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32 =
registers (vfpv3) unit."
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' =
-mfpu=3Dvfpv3', '', d)}"
> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', =
'-vfpv3', '' ,d)}"
> +TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
> +TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' =
vfp', '', d)}"
>=20
> -TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv4) =
unit."
> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', =
'-vfpv4', '' ,d)}"
> +TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s ' % d.getVar('TUNE_CCARGS_MFPU', =
True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else =
''}"
> +ARMPKGSFX_FPU =3D "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', =
True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else =
''}"
>=20
> TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call =
convention, requires VFP."
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', =
bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' =
-mfloat-abi=3Dhard', ' -mfloat-abi=3Dsoftfp', d), '' ,d)}"
> -ARMPKGSFX_EABI .=3D "${@bb.utils.contains('TUNE_FEATURES', [ =
'callconvention-hard', 'vfp' ], 'hf', '', d)}"
> +TUNE_CCARGS   .=3D "${@ bb.utils.contains('TUNE_FEATURES', =
'callconvention-hard', ' -mfloat-abi=3Dhard', ' -mfloat-abi=3Dsoftfp', =
d) if (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else '' }"
> +ARMPKGSFX_EABI =3D "${@ bb.utils.contains('TUNE_FEATURES', =
'callconvention-hard', 'hf',                '',                    d) if =
(d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else '' }"
> diff --git a/meta/conf/machine/include/tune-cortexa15.inc =
b/meta/conf/machine/include/tune-cortexa15.inc
> index b4a693d..7e597f3 100644
> --- a/meta/conf/machine/include/tune-cortexa15.inc
> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> @@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa15-neon        =3D =
"${TUNE_FEATURES_tune-armv7a-neon}
> TUNE_FEATURES_tune-cortexa15t-neon       =3D =
"${TUNE_FEATURES_tune-armv7at-neon}       cortexa15"
> PACKAGE_EXTRA_ARCHS_tune-cortexa15             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa15-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa15t            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa15-vfp =
cortexa15-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp =
cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa15-vfp cortexa15-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-neon =
cortexa15t2-vfp cortexa15t2-neon"
>=20
> # HF Tunes
> AVAILTUNES +=3D "cortexa15hf cortexa15thf cortexa15hf-neon =
cortexa15thf-neon"
> @@ -32,5 +32,5 @@ TUNE_FEATURES_tune-cortexa15hf-neon        =3D =
"${TUNE_FEATURES_tune-armv7ahf-neon
> TUNE_FEATURES_tune-cortexa15thf-neon       =3D =
"${TUNE_FEATURES_tune-armv7athf-neon}       cortexa15"
> PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa15hf-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp =
cortexa15t2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp =
cortexa15hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp =
cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp =
cortexa15hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp =
cortexa15hf-neon cortexa15t2hf-vfp cortexa15t2hf-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa17.inc =
b/meta/conf/machine/include/tune-cortexa17.inc
> index 69232d0..5cc4567 100644
> --- a/meta/conf/machine/include/tune-cortexa17.inc
> +++ b/meta/conf/machine/include/tune-cortexa17.inc
> @@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa17-neon        =3D =
"${TUNE_FEATURES_tune-armv7a-neon}
> TUNE_FEATURES_tune-cortexa17t-neon       =3D =
"${TUNE_FEATURES_tune-armv7at-neon}       cortexa17"
> PACKAGE_EXTRA_ARCHS_tune-cortexa17             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa17-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa17t            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa17-vfp cortexa17t2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa17-vfp =
cortexa17-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp =
cortexa17-vfp-neon cortexa17t2-vfp cortexa17t2-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa17-vfp cortexa17-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp cortexa17-neon =
cortexa17t2-vfp cortexa17t2-neon"
>=20
> # HF Tunes
> AVAILTUNES +=3D "cortexa17hf cortexa17thf cortexa17hf-neon =
cortexa17thf-neon"
> @@ -32,5 +32,5 @@ TUNE_FEATURES_tune-cortexa17hf-neon        =3D =
"${TUNE_FEATURES_tune-armv7ahf-neon
> TUNE_FEATURES_tune-cortexa17thf-neon       =3D =
"${TUNE_FEATURES_tune-armv7athf-neon}       cortexa17"
> PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa17hf-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa17hf-vfp =
cortexa17t2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa17hf-vfp =
cortexa17hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa17hf-vfp =
cortexa17hf-vfp-neon cortexa17t2hf-vfp cortexa17t2hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa17hf-vfp =
cortexa17hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa17hf-vfp =
cortexa17hf-neon cortexa17t2hf-vfp cortexa17t2hf-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa5.inc =
b/meta/conf/machine/include/tune-cortexa5.inc
> index b649641..0d82854 100644
> --- a/meta/conf/machine/include/tune-cortexa5.inc
> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> @@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa5-neon        =3D =
"${TUNE_FEATURES_tune-armv7a-neon}
> TUNE_FEATURES_tune-cortexa5t-neon       =3D =
"${TUNE_FEATURES_tune-armv7at-neon}       cortexa5"
> PACKAGE_EXTRA_ARCHS_tune-cortexa5             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa5-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa5t            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa5-vfp =
cortexa5-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-vfp-neon =
cortexa5t2-vfp cortexa5t2-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa5-vfp cortexa5-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-neon =
cortexa5t2-vfp cortexa5t2-neon"
>=20
> # HF Tunes
> AVAILTUNES +=3D "cortexa5hf cortexa5thf cortexa5hf-neon =
cortexa5thf-neon"
> @@ -32,5 +32,5 @@ TUNE_FEATURES_tune-cortexa5hf-neon        =3D =
"${TUNE_FEATURES_tune-armv7ahf-neon}
> TUNE_FEATURES_tune-cortexa5thf-neon       =3D =
"${TUNE_FEATURES_tune-armv7athf-neon}       cortexa5"
> PACKAGE_EXTRA_ARCHS_tune-cortexa5hf             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa5hf-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa5thf            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa5hf-vfp =
cortexa5hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp =
cortexa5hf-vfp-neon cortexa5t2hf-vfp cortexa5t2hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa5hf-vfp =
cortexa5hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp =
cortexa5hf-neon cortexa5t2hf-vfp cortexa5t2hf-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa7.inc =
b/meta/conf/machine/include/tune-cortexa7.inc
> index 23f2ff6..133ce38 100644
> --- a/meta/conf/machine/include/tune-cortexa7.inc
> +++ b/meta/conf/machine/include/tune-cortexa7.inc
> @@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa7-neon        =3D =
"${TUNE_FEATURES_tune-armv7a-neon}
> TUNE_FEATURES_tune-cortexa7t-neon       =3D =
"${TUNE_FEATURES_tune-armv7at-neon}       cortexa7"
> PACKAGE_EXTRA_ARCHS_tune-cortexa7             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa7-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa7t            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa7-vfp =
cortexa7-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon =
cortexa7t2-vfp cortexa7t2-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa7-vfp cortexa7-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-neon =
cortexa7t2-vfp cortexa7t2-neon"
>=20
> # HF Tunes
> AVAILTUNES +=3D "cortexa7hf cortexa7thf cortexa7hf-neon =
cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
> @@ -36,7 +36,7 @@ TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  =3D =
"${TUNE_FEATURES_tune-armv7ahf-neon-
> TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 =3D =
"${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa7"
> PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa7hf-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa7hf-vfp =
cortexa7hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp =
cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa7hf-vfp =
cortexa7hf-vfp-neon cortexa7hf-vfp-vfpv4-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp =
cortexa7hf-vfp-neon cortexa7hf-vfp-vfpv4-neon cortexa7t2hf-vfp =
cortexa7t2hf-vfp-neon cortexa7t2hf-vfp-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa7hf-vfp =
cortexa7hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp =
cortexa7hf-neon cortexa7t2hf-vfp cortexa7t2hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa7hf-vfp =
cortexa7hf-neon cortexa7hf-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp =
cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon =
cortexa7t2hf-neon-vfpv4"
> diff --git a/meta/conf/machine/include/tune-cortexa8.inc =
b/meta/conf/machine/include/tune-cortexa8.inc
> index 71706e4..1daaf83 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa8-neon        =3D =
"${TUNE_FEATURES_tune-armv7a-neon}
> TUNE_FEATURES_tune-cortexa8t-neon       =3D =
"${TUNE_FEATURES_tune-armv7at-neon}       cortexa8"
> PACKAGE_EXTRA_ARCHS_tune-cortexa8             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa8-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa8t            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa8-vfp =
cortexa8-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-vfp-neon =
cortexa8t2-vfp cortexa8t2-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa8-vfp cortexa8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-neon =
cortexa8t2-vfp cortexa8t2-neon"
>=20
> # HF Tunes
> AVAILTUNES +=3D "cortexa8hf cortexa8thf cortexa8hf-neon =
cortexa8thf-neon"
> @@ -32,5 +32,5 @@ TUNE_FEATURES_tune-cortexa8hf-neon        =3D =
"${TUNE_FEATURES_tune-armv7ahf-neon}
> TUNE_FEATURES_tune-cortexa8thf-neon       =3D =
"${TUNE_FEATURES_tune-armv7athf-neon}       cortexa8"
> PACKAGE_EXTRA_ARCHS_tune-cortexa8hf             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa8hf-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa8thf            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa8hf-vfp =
cortexa8hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp =
cortexa8hf-vfp-neon cortexa8t2hf-vfp cortexa8t2hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa8hf-vfp =
cortexa8hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp =
cortexa8hf-neon cortexa8t2hf-vfp cortexa8t2hf-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa9.inc =
b/meta/conf/machine/include/tune-cortexa9.inc
> index ddd6f77..29e6651 100644
> --- a/meta/conf/machine/include/tune-cortexa9.inc
> +++ b/meta/conf/machine/include/tune-cortexa9.inc
> @@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa9-neon        =3D =
"${TUNE_FEATURES_tune-armv7a-neon}
> TUNE_FEATURES_tune-cortexa9t-neon       =3D =
"${TUNE_FEATURES_tune-armv7at-neon}       cortexa9"
> PACKAGE_EXTRA_ARCHS_tune-cortexa9             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa9-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa9t            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa9-vfp =
cortexa9-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-vfp-neon =
cortexa9t2-vfp cortexa9t2-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa9-vfp cortexa9-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-neon =
cortexa9t2-vfp cortexa9t2-neon"
>=20
> # HF Tunes
> AVAILTUNES +=3D "cortexa9hf cortexa9thf cortexa9hf-neon =
cortexa9thf-neon"
> @@ -32,5 +32,5 @@ TUNE_FEATURES_tune-cortexa9hf-neon        =3D =
"${TUNE_FEATURES_tune-armv7ahf-neon}
> TUNE_FEATURES_tune-cortexa9thf-neon       =3D =
"${TUNE_FEATURES_tune-armv7athf-neon}       cortexa9"
> PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa9hf-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa9hf-vfp =
cortexa9hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp =
cortexa9hf-vfp-neon cortexa9t2hf-vfp cortexa9t2hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa9hf-vfp =
cortexa9hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp =
cortexa9hf-neon cortexa9t2hf-vfp cortexa9t2hf-neon"
> --
> 2.6.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_76061437-8F47-4170-91D1-FDC20709A88C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZp6zEACgkQuwUzVZGdMxR26gCeLumziqoiWOEKsiImAs/G3+dE
+tAAoIcvseVBQM0TFsjlsCWC/yhuRXOn
=NuKv
-----END PGP SIGNATURE-----

--Apple-Mail=_76061437-8F47-4170-91D1-FDC20709A88C--
