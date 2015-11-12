Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id DA97F7723C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 19:14:44 +0000 (UTC)
Received: by wmww144 with SMTP id w144so609485wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y1FnIMFGNrfgoATkvwW399OMPiSdVWNOvJ5uomY+ruU=;
	b=rRVhGW557tzQCLDL0I0cTcgG+Ay7nwv5QFt/UNuy17ZYYfNzoeQJ/d0QNE4XWdZX9n
	Y+O1ETfK0KsomCnztGJrTL5fBc9hHIhgYaVCCmSPAgU1fQxYRlu0vMMIMe5eFNeZrY+e
	QOHsoPeB/SJxeCsvrZgbDR5WSMsgNFwXe8iuEEMmgmwxoA/pUi+APVeae17ch+ubFeUx
	Hmrk574TwMByarJ7oHQ8deDbQS8Q1fcynik5N/ustDGEQhJKbm3QYDd7hBpKZkU+QlkL
	4QMUJVz7q8qDp1M2xfeQQ6zSPVLwEtVW4HwzjT9KXgySkl8R62SDeFmPsvFq9Cne6Ofo
	rNpA==
X-Received: by 10.194.3.39 with SMTP id 7mr18034191wjz.20.1447355684480;
	Thu, 12 Nov 2015 11:14:44 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wx10sm15939289wjb.40.2015.11.12.11.14.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 11:14:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 20:15:00 +0100
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20151112191500.GM2574@jama>
References: <1447351617-7516-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1447351617-7516-1-git-send-email-alexandre.belloni@free-electrons.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-cortexa5.inc: Allow tuning for vfpv3d16, vfpv3 and neon-vfpv4
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
X-List-Received-Date: Thu, 12 Nov 2015 19:14:46 -0000
X-Groupsio-MsgNum: 73310
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jB+02Y6wHc2pEa2x"
Content-Disposition: inline

--jB+02Y6wHc2pEa2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 07:06:57PM +0100, Alexandre Belloni wrote:
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Please check
http://lists.openembedded.org/pipermail/openembedded-core/2015-October/1113=
18.html
thread and following discussion.

> ---
>  meta/conf/machine/include/tune-cortexa5.inc | 34 +++++++++++++++++++++++=
++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/mach=
ine/include/tune-cortexa5.inc
> index 139e65c8285d..56ea93e81d5e 100644
> --- a/meta/conf/machine/include/tune-cortexa5.inc
> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> @@ -6,31 +6,61 @@ TUNEVALID[cortexa5] =3D "Enable Cortex-A5 specific proc=
essor optimizations"
>  TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa5", " -m=
tune=3Dcortex-a5", "", d)}"
> =20
>  # Little Endian base configs
> -AVAILTUNES +=3D "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
> +AVAILTUNES +=3D "cortexa5 cortexa5t cortexa5-vfpv3d16 cortexa5t-vfpv3d16=
 cortexa5-vfpv3 cortexa5t-vfpv3 cortexa5-neon cortexa5t-neon cortexa5-neon-=
vfpv4 cortexa5t-neon-vfpv4"
>  ARMPKGARCH_tune-cortexa5 =3D "cortexa5"
>  ARMPKGARCH_tune-cortexa5t =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5-vfpv3d16 =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5t-vfpv3d16 =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5-vfpv3 =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5t-vfpv3 =3D "cortexa5"
>  ARMPKGARCH_tune-cortexa5-neon =3D "cortexa5"
>  ARMPKGARCH_tune-cortexa5t-neon =3D "cortexa5"
>  TUNE_FEATURES_tune-cortexa5 =3D "${TUNE_FEATURES_tune-armv7a} cortexa5"
>  TUNE_FEATURES_tune-cortexa5t =3D "${TUNE_FEATURES_tune-armv7at} cortexa5"
> +TUNE_FEATURES_tune-cortexa5-vfpv3d16 =3D "${TUNE_FEATURES_tune-armv7a-vf=
pv3d16} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t-vfpv3d16 =3D "${TUNE_FEATURES_tune-armv7at-=
vfpv3d16} cortexa5"
> +TUNE_FEATURES_tune-cortexa5-vfpv3 =3D "${TUNE_FEATURES_tune-armv7a-vfpv3=
} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t-vfpv3 =3D "${TUNE_FEATURES_tune-armv7at-vfp=
v3} cortexa5"
>  TUNE_FEATURES_tune-cortexa5-neon =3D "${TUNE_FEATURES_tune-armv7a-neon} =
cortexa5"
>  TUNE_FEATURES_tune-cortexa5t-neon =3D "${TUNE_FEATURES_tune-armv7at-neon=
} cortexa5"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7a=
} cortexa5-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5t =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7=
at} cortexa5-vfp cortexa5t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5-vfpv3d16 =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv7a-vfpv3d16} cortexa5-vfp cortexa5-vfp-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t-vfpv3d16 =3D "${PACKAGE_EXTRA_ARCHS_t=
une-armv7at-vfpv3d16} cortexa5-vfp cortexa5-vfp-vfpv3d16 cortexa5t2-vfp cor=
texa5t2-vfp-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5-vfpv3 =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv7a-vfpv3} cortexa5-vfp cortexa5-vfp-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t-vfpv3 =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7at-vfpv3} cortexa5-vfp cortexa5-vfp-vfpv3 cortexa5t2-vfp cortexa5t2-v=
fp-vfpv3"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-a=
rmv7a-neon} cortexa5-vfp cortexa5-vfp-neon"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv7at-neon} cortexa5-vfp cortexa5-vfp-neon cortexa5t2-vfp cortexa5t2-vfp-=
neon"
> =20
>  # VFP Tunes
> -AVAILTUNES +=3D "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon"
> +AVAILTUNES +=3D "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon=
 cortexa5hf-vfpv3d16 cortexa5thf-vfpv3d16 cortexa5hf-vfpv3 cortexa5thf-vfpv=
3 cortexa5hf-neon-vfpv4 cortexa5thf-neon-vfpv4"
>  ARMPKGARCH_tune-cortexa5hf =3D "cortexa5"
>  ARMPKGARCH_tune-cortexa5thf =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5hf-vfpv3d16 =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5thf-vfpv3d16 =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5hf-vfpv3 =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5thf-vfpv3 =3D "cortexa5"
>  ARMPKGARCH_tune-cortexa5hf-neon =3D "cortexa5"
>  ARMPKGARCH_tune-cortexa5thf-neon =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5hf-neon-vfpv4 =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5thf-neon-vfpv4 =3D "cortexa5"
>  TUNE_FEATURES_tune-cortexa5hf ?=3D "${TUNE_FEATURES_tune-armv7ahf} corte=
xa5"
>  TUNE_FEATURES_tune-cortexa5thf ?=3D "${TUNE_FEATURES_tune-armv7athf} cor=
texa5"
> +TUNE_FEATURES_tune-cortexa5hf-vfpv3d16 ?=3D "${TUNE_FEATURES_tune-armv7a=
hf-vfpv3d16} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf-vfpv3d16 ?=3D "${TUNE_FEATURES_tune-armv7=
athf-vfpv3d16} cortexa5"
> +TUNE_FEATURES_tune-cortexa5hf-vfpv3 ?=3D "${TUNE_FEATURES_tune-armv7ahf-=
vfpv3} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf-vfpv3 ?=3D "${TUNE_FEATURES_tune-armv7ath=
f-vfpv3} cortexa5"
>  TUNE_FEATURES_tune-cortexa5hf-neon ?=3D "${TUNE_FEATURES_tune-armv7ahf-n=
eon} cortexa5"
>  TUNE_FEATURES_tune-cortexa5thf-neon ?=3D "${TUNE_FEATURES_tune-armv7athf=
-neon} cortexa5"
> +TUNE_FEATURES_tune-cortexa5hf-neon-vfpv4 ?=3D "${TUNE_FEATURES_tune-armv=
7ahf-neon-vfpv4} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf-neon-vfpv4 ?=3D "${TUNE_FEATURES_tune-arm=
v7athf-neon-vfpv4} cortexa5"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5hf =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
7ahf} cortexa5hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5thf =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-vfpv3d16 =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv7ahf-vfpv3d16} cortexa5hf-vfp cortexa5hf-vfp-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-vfpv3d16 =3D "${PACKAGE_EXTRA_ARCHS=
_tune-armv7athf-vfpv3d16} cortexa5hf-vfp cortexa5hf-vfp-vfpv3d16 cortexa5t2=
hf-vfp cortexa5t2hf-vfp-vfpv3d16"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-vfpv3 =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv7ahf-vfpv3} cortexa5hf-vfp cortexa5hf-vfp-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-vfpv3 =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv7athf-vfpv3} cortexa5hf-vfp cortexa5hf-vfp-vfpv3 cortexa5t2hf-vfp co=
rtexa5t2hf-vfp-vfpv3"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv7athf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp corte=
xa5t2hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon-vfpv4 =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv7ahf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5hf-v=
fp-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon-vfpv4 =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7athf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2=
hf-vfp cortexa5t2hf-vfp-neon cortexa5hf-vfp-vfpv4-neon cortexa5t2hf-vfp-vfp=
v4-neon"
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jB+02Y6wHc2pEa2x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZE5TQACgkQN1Ujt2V2gBz47ACcDqm8PmNgYQG9gLE4so0vx8wJ
07sAmwSCdZp1t3RHkMJk/LHkEqhRhuSE
=eGyH
-----END PGP SIGNATURE-----

--jB+02Y6wHc2pEa2x--
