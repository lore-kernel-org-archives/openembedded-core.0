Return-Path: <komar@komar.bionik.tu-berlin.de>
X-Greylist: delayed 730 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 31 Jan 2019 09:38:22 UTC
Received: from mo4-p05-ob.smtp.rzone.de (mo4-p05-ob.smtp.rzone.de
	[85.215.255.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2414371B1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1548927502;
	s=strato-dkim-0002; d=evologics.de;
	h=In-Reply-To:References:Reply-To:Message-ID:Subject:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=X0ksNtUI9HgTbpeCU/K9gyy8LoWGt4jJfQUjfUhdOJI=;
	b=WPxyjtbcjsI2m5GZuVSXxgLs8c78k8qg4vHveIQjFkIddEq5Nl5dncwGlRxanZz1jo
	O03hlr6PJ+GYrMniq//4uIjz5LrWom3WR7VshDrcAivBGxHU8UWY4MHUa7hAWne4RxXr
	ZxJ6oj+3LYmY77FR5FWquZUxSmRSidSE+lZLpJY7YVcrwt6wwBrs0tB5PfegKE825VmR
	tNUdVGSHEnK0nVoq03dyqo8stk8nFIdcBFxKrhlosFr6eAW2LoT7P5iigDDu6vDiENA3
	qa4vN9QLvx8RW2nxjuR4l7NbNhRsbyYqxQrz1lPEmGAMWvWqQh6ZZ8nGUIx8OYngd2Iv
	uM7g==
X-RZG-AUTH: ":J2MJdFKIfukmJ5nsom3zZ+ltBBdf17KM5HzjHmp4NmADxfPX8Dr7rqYKTooAxquaF9JVog=="
X-RZG-CLASS-ID: mo05
Received: from komar.lab.evologics.de by smtp.strato.de (RZmta 44.9 AUTH)
	with ESMTPSA id 30a531v0V9QDZfs
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 10:26:13 +0100 (CET)
Received: from komar by komar.lab.evologics.de with local (Exim 4.89)
	(envelope-from <komar@komar.lab.evologics.de>) id 1gp8bs-0005vq-Uw
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2019 10:26:12 +0100
Date: Thu, 31 Jan 2019 10:26:12 +0100
From: Maksym Komar <komar@evologics.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190131092612.GA20357@komar.lab.evologics.de>
Reply-To: Maksym Komar <komar@evologics.de>
Mail-Followup-To: Maksym Komar <komar@evologics.de>,
	openembedded-core@lists.openembedded.org
References: <20181029090423.25375-1-komar@evologics.de>
MIME-Version: 1.0
In-Reply-To: <20181029090423.25375-1-komar@evologics.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [PATCH] image_types.bbclass: add support for multiply ubifs volumes in ubi image
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
X-List-Received-Date: Thu, 31 Jan 2019 09:38:22 -0000
X-Groupsio-MsgNum: 120729
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 29, 2018 at 10:04:23AM +0100, Maksym Komar wrote:

Request for feedback, please :)

> Add the ability to create additional ubifs volumes inside ubi volume.
>=20
> For example this code create empty 2MiB volume named "config".
> =3D=3D=3D
> MKUBIFS_ARGS =3D "-m 1 -e 65408 -c 958 -F"
> UBINIZE_ARGS =3D "-m 1 -p 64KiB"
>=20
> MKUBIFS_VOLUMES=3D"config rootfs"
> MKUBIFS_VOLUME_SIZE[config] =3D "2MiB"
> MKUBIFS_VOLUME_ARGS[config] =3D "-m 1 -e 65408 -c 22 -F"
> =3D=3D=3D
> As result system will be have /dev/ubi0_0 as "config" and
> /dev/ubi0_1 as "rootfs".
>=20
> Can be used with FSTYPE ubi and multiubi
>=20
> Signed-off-by: Maksym Komar <komar@evologics.de>
> ---
>  meta/classes/image_types.bbclass | 67 +++++++++++++++++++++++++-------
>  1 file changed, 53 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index e881d0cc2d..726760d99b 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -174,28 +174,67 @@ multiubi_mkfs() {
>  		local vname=3D"_$3"
>  	fi
> =20
> -	echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
> -	echo mode=3Dubi >> ubinize${vname}-${IMAGE_NAME}.cfg
> -	echo image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.=
ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
> -	echo vol_id=3D0 >> ubinize${vname}-${IMAGE_NAME}.cfg
> -	echo vol_type=3Ddynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
> -	echo vol_name=3D${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
> -	echo vol_flags=3Dautoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
> -	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}$=
{IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
> -	ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ub=
i ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
> +	if [ -z "$4" ]; then
> +		MKUBIFS_VOLUMES=3D"rootfs"
> +	fi
> +
> +	local vol_id=3D0
> +	echo -n > ubinize${vname}-${IMAGE_NAME}.cfg
> +	for volume in ${MKUBIFS_VOLUMES}; do
> +		echo \[${volume}\] >> ubinize${vname}-${IMAGE_NAME}.cfg
> +		echo mode=3Dubi >> ubinize${vname}-${IMAGE_NAME}.cfg
> +		echo vol_id=3D$vol_id >> ubinize${vname}-${IMAGE_NAME}.cfg
> +		echo vol_type=3Ddynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
> +
> +		# workaround to get Variable Flag MKUBIFS_VOLUME_SIZE[volume_name]
> +		eval ${@' '.join(['size_' + k + '=3D\\"' + v + '\\"' for k,v in d.getV=
arFlags('MKUBIFS_VOLUME_SIZE').items()])}
> +		eval size=3D\"\$size_$volume\"
> +
> +		if [ -z "$size" ]; then
> +			echo vol_flags=3Dautoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
> +		else
> +			echo vol_size=3D$size >> ubinize${vname}-${IMAGE_NAME}.cfg
> +		fi
> +
> +		if [ "${volume}" =3D "rootfs" ]; then
> +			echo image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX=
}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
> +			echo vol_name=3D${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
> +			mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname=
}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
> +		else
> +			echo image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.${volume}.ubifs >>=
 ubinize${vname}-${IMAGE_NAME}.cfg
> +			echo vol_name=3D${volume} >> ubinize${vname}-${IMAGE_NAME}.cfg
> +
> +			# workaround to get Variable Flag MKUBIFS_VOLUME_ARGS[volume_name]
> +			eval ${@' '.join(['args_' + k + '=3D\\"' + v + '\\"' for k,v in d.get=
VarFlags('MKUBIFS_VOLUME_ARGS').items()])}
> +			eval args=3D\"\$args_$volume\"
> +
> +	        # create empty volume
> +			mkdir -p empty
> +			mkfs.ubifs -r empty -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.${volume=
}.ubifs $args
> +			rmdir empty
> +		fi
> +		vol_id=3D$(expr $vol_id + 1)
> +	done
> +
> +	# if variable IMAGE_NAME_SUFFIX is weak, set suffix with names of all v=
olumes
> +	image_name_suffix=3D$IMAGE_NAME_SUFFIX
> +	if [ -n "${MKUBIFS_VOLUMES}" -a -z "${@d.getVar('IMAGE_NAME_SUFFIX', no=
weakdefault=3DTrue) or ''}" ]; then
> +		image_name_suffix=3D${@'.' + '-'.join(d.getVar('MKUBIFS_VOLUMES').spli=
t())}
> +	fi
> +	ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${image_name_suffix}.ub=
i ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
> =20
>  	# Cleanup cfg file
>  	mv ubinize${vname}-${IMAGE_NAME}.cfg ${IMGDEPLOYDIR}/
> =20
>  	# Create own symlinks for 'named' volumes
> -	if [ -n "$vname" ]; then
> +	if [ -n "$vname" -o "${IMAGE_NAME_SUFFIX}" !=3D "${image_name_suffix}" =
]; then
>  		cd ${IMGDEPLOYDIR}
>  		if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ]; then
>  			ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs \
>  			${IMAGE_LINK_NAME}${vname}.ubifs
>  		fi
> -		if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ]; then
> -			ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi \
> +		if [ -e ${IMAGE_NAME}${vname}${image_name_suffix}.ubi ]; then
> +			ln -sf ${IMAGE_NAME}${vname}${image_name_suffix}.ubi \
>  			${IMAGE_LINK_NAME}${vname}.ubi
>  		fi
>  		cd -
> @@ -208,12 +247,12 @@ IMAGE_CMD_multiubi () {
>  		eval local mkubifs_args=3D\"\$MKUBIFS_ARGS_${name}\"
>  		eval local ubinize_args=3D\"\$UBINIZE_ARGS_${name}\"
> =20
> -		multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}"
> +		multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}" "${MKUBIFS=
_VOLUMES}"
>  	done
>  }
> =20
>  IMAGE_CMD_ubi () {
> -	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
> +	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}" "" "${MKUBIFS_VOLUMES=
}"
>  }
> =20
>  IMAGE_CMD_ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${=
IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
> --=20
> 2.19.1

--=20
EvoLogics GmbH
Ackerstra=C3=9Fe 76, 13355 Berlin
Tel.: + 49- (0) 30- 46 06 82 26
Fax:  + 49- (0) 30- 46 06 82 15
Gesch=C3=A4ftsf=C3=BChrer: Dr. Rudolf Bannasch, Dr. Kostyantyn Kebkal
Amtsgericht Berlin, Charlottenburg (unter der) Nummer HR B 77787
Steuer- Nr.: 37/296/20446

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQgGA5yhGXIzJqDWXwMBtLYV2NSggUCXFK/NAAKCRAMBtLYV2NS
gh6bAKDL994LwMVCiPeaVymDAVZJJzzukwCfYT1wL0X6ceXQFmFZOTbQhemHi9g=
=SI+9
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
