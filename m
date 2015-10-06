Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4A052605D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 14:28:54 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so162021522wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 07:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IJPlpOBJejDLi998uXdx9K9YUjPlUpgJ/AalzFluums=;
	b=dm1BFrLViXaiKSzSOJLrOkICNTrGyMqrZLtCQBSTMp3xhnt968lCnOo4GS+IjDeOZ3
	wKWnysZh2R2+7GXejHH2fmWKb0eKrlFeUbt8Yi0nTAZg+DMWXa7GYDgcDPR5WPo0NpJP
	fO3oLfQwTz3lW54UhyKnXHaKFR+B7GWIKX3aCE+k1kPfLizShfqbDZ3S0E/863YOYhjt
	IdpIfilsJcrQHFqgbKkdHaCJfrVKT0kuhppuxfdOgsUfK1I9mWkxaM7dunKeMJIsUvIl
	9kTiQlORn3aOzshGcqMzYd91H3+I6SbOTtX3l+pW8YSMfGeh2lGttsplMC2Q1LjEK7MS
	UO7g==
X-Received: by 10.194.7.232 with SMTP id m8mr36761049wja.56.1444141734236;
	Tue, 06 Oct 2015 07:28:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hd7sm20084327wib.23.2015.10.06.07.28.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 07:28:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Oct 2015 16:28:57 +0200
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20151006142857.GA2383@jama>
References: <1444138615-5618-1-git-send-email-Martin.Jansa@gmail.com>
	<1444139541.10310.4.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1444139541.10310.4.camel@pbcl.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] cortexa{7,15,17}: add VFPv4 tunes
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
X-List-Received-Date: Tue, 06 Oct 2015 14:28:57 -0000
X-Groupsio-MsgNum: 71949
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2015 at 02:52:21PM +0100, Phil Blundell wrote:
> On Tue, 2015-10-06 at 15:36 +0200, Martin Jansa wrote:
> >=20
> > * we should also update Cortex-A7 and Cortex-A15, to use=20
> > -march=3Darmv7ve,
> >   but the problem is that oe-core has gcc-4.[89] and gcc-5.2 and gcc
> > -4.8
> >   doesn't support it yet,
>=20
> Or you could make it use -mcpu=3Dcortex-a15, which works for all gcc
> versions within living memory.  I've been using this change locally for
> some months and it seems to work reasonably well:

Thanks for comment.

Yes, that's what we're doing now for our MACHINEs (dropping -march while ad=
ding -mcpu).

But on current tunes I liked how hierarchical they are, so dropping
common armv7a (or armv7ve) seems a bit strange in current design.

> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/c=
onf/machine/include/arm/feature-arm-thumb.inc
> index a94386f..22291dc 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -12,6 +12,7 @@ ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATU=
RES', 'armv6',  't',  '', d
>  ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', '=
t2', '', d)}"
>  ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', '=
t2', '', d)}"
>  ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', '=
t2', '', d)}"
> +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15'=
, 't2', '', d)}"
> =20
>  # If the device supports ARM, then respect ARM_THUMB_OPT (which can be "=
arm" or "thumb")
>  # If the defice doesn't support ARM, then always set "thumb" even when
> diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/mac=
hine/include/tune-cortexa15.inc
> index 5529777..f6c7d80 100644
> --- a/meta/conf/machine/include/tune-cortexa15.inc
> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> @@ -3,7 +3,9 @@ DEFAULTTUNE ?=3D "armv7a-neon"
>  require conf/machine/include/arm/arch-armv7a.inc
> =20
>  TUNEVALID[cortexa15] =3D "Enable Cortex-A15 specific processor optimizat=
ions"
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", " -=
mtune=3Dcortex-a15", "", d)}"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", " -=
mcpu=3Dcortex-a15", "", d)}"
> +
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "cortexa15"=
, "cortexa15:armv7a:", "" ,d)}"
> =20
>  # Little Endian base configs
>  AVAILTUNES +=3D "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
> @@ -11,10 +13,10 @@ ARMPKGARCH_tune-cortexa15 =3D "cortexa15"
>  ARMPKGARCH_tune-cortexa15t =3D "cortexa15"
>  ARMPKGARCH_tune-cortexa15-neon =3D "cortexa15"
>  ARMPKGARCH_tune-cortexa15t-neon =3D "cortexa15"
> -TUNE_FEATURES_tune-cortexa15 =3D "${TUNE_FEATURES_tune-armv7a} cortexa15"
> -TUNE_FEATURES_tune-cortexa15t =3D "${TUNE_FEATURES_tune-armv7at} cortexa=
15"
> -TUNE_FEATURES_tune-cortexa15-neon =3D "${TUNE_FEATURES_tune-armv7a-neon}=
 cortexa15"
> -TUNE_FEATURES_tune-cortexa15t-neon =3D "${TUNE_FEATURES_tune-armv7at-neo=
n} cortexa15"
> +TUNE_FEATURES_tune-cortexa15 =3D "arm vfp cortexa15"
> +TUNE_FEATURES_tune-cortexa15t =3D "arm vftp thumb cortexa15"
> +TUNE_FEATURES_tune-cortexa15-neon =3D "arm vfp neon cortexa15"
> +TUNE_FEATURES_tune-cortexa15t-neon =3D "arm vfp neon thumb cortexa15"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa15 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7=
a} cortexa15-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa15t =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
7at} cortexa15-vfp cortexa15t2-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
>=20
> p.
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYT2pUACgkQN1Ujt2V2gByZKACePm1xoihzxGrsnWwfBq1IOjY4
FY0An1zYvrlgUqRdArY8uFarvOaLVSOq
=ajKg
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
