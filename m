Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id A41BD6077F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 11:32:06 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so980037eek.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 03:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m8/TyirMWtJdQ47mFT7N5Kvt4YaOaoGgiwLhkxah/y8=;
	b=lLEvFRpl4N8/pKagjNTlkrb6h+y7icJrc/x+LZR4hZC/qTzZM6laeb46f8a4zipf4g
	1lQNcGQRuEBJVqgzQZCAIGIM6Og1CpxX2gLCjGLfeVPZxe3Qa1wivuxBl6gyi9tUMesH
	yDb+taUs//X5Qe5lxsC9eaDVKoCyvxTcB1yMqu/xcP1Veqrg5BYehtdyLkas0eOHmQ1Q
	h/1Egb2zbNVJen8B3wZndG0msTsypJl10ezfDeLBirzUDapJaSn/r+VfxYYf57P+xVjY
	RyfEUtAI2PzrZb0JmFjJSROc1X95BpWTUsQ8IDVemEZrk9jyYyJjUSG1kJK2ct5Dz0Rx
	qJWA==
X-Received: by 10.14.212.69 with SMTP id x45mr2324832eeo.69.1387539126930;
	Fri, 20 Dec 2013 03:32:06 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a45sm17750884eem.6.2013.12.20.03.32.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Dec 2013 03:32:06 -0800 (PST)
Date: Fri, 20 Dec 2013 12:32:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
Message-ID: <20131220113238.GU3706@jama>
References: <1387534224-16453-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1387534224-16453-1-git-send-email-joaohf@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boot-directdisk: fix the support of vmdk
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
X-List-Received-Date: Fri, 20 Dec 2013 11:32:07 -0000
X-Groupsio-MsgNum: 48356
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i6WX/W6h5xa4jqsd"
Content-Disposition: inline

--i6WX/W6h5xa4jqsd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2013 at 08:10:24AM -0200, Joao Henrique Ferreira de Freitas=
 wrote:
> Previous change (086ce22b88f5ef5f75a83119a32c8b3fdcfa296d) broke
> the creating of vmdk images. This protects shell expansion variables
> and let dd generate the image to be transformed to vmdk by image-vmdk.cla=
ss.
> ---
>  meta/classes/boot-directdisk.bbclass | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-dir=
ectdisk.bbclass
> index 3277666..4f26f47 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -88,10 +88,10 @@ build_boot_dd() {
>  		grubefi_hddimg_populate $HDDDIR
>  	fi
> =20
> -	if [ ${IMAGE_FSTYPE} =3D "vmdk" ]; then
> -		if [ x${AUTO_SYSLINUXMENU} =3D x1 ] ; then
> +	if [ "${IMAGE_FSTYPES}" =3D "vmdk" ]; then
> +		if [ "x${AUTO_SYSLINUXMENU}" =3D "x1" ] ; then

IMAGE_FSTYPE looks really as typo, but what if there are multiple
entries in IMAGE_FSTYPES?

OE @ ~/openembedded-core $ git grep IMAGE_FSTYPE | grep -v IMAGE_FSTYPES
meta/classes/boot-directdisk.bbclass:   if [ ${IMAGE_FSTYPE} =3D "vmdk" ]; =
then
meta/classes/boot-directdisk.bbclass:   if [ ${IMAGE_FSTYPE} !=3D "vmdk" ];=
 then
meta/classes/boot-directdisk.bbclass:   if [ ${IMAGE_FSTYPE} !=3D "vmdk" ];=
 then

Maybe you can use this variable instead:
meta/classes/image.bbclass:IMAGE_TYPE_vmdk =3D '${@base_contains("IMAGE_FST=
YPES", "vmdk", "image-vmdk", "", d)}'

>  			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu=
=2Ec32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
> -			if [ x${SYSLINUX_SPLASH} !=3D x ] ; then
> +			if [ "x${SYSLINUX_SPLASH}" !=3D "x" ] ; then
>  				install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR}${SYSLINUXDIR}/splash.lss
>  			fi
>  		fi
> @@ -129,9 +129,7 @@ build_boot_dd() {
>  	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
>  	parted $IMAGE set 1 boot on=20
> =20
> -	if [ ${IMAGE_FSTYPE} !=3D "vmdk" ]; then
> -		parted $IMAGE print
> -	fi
> +	parted $IMAGE print
> =20
>  	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | past=
e -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
>  		dd of=3D$IMAGE bs=3D1 seek=3D440 conv=3Dnotrunc
> @@ -141,10 +139,8 @@ build_boot_dd() {
>  		dd if=3D${STAGING_DATADIR}/syslinux/mbr.bin of=3D$IMAGE conv=3Dnotrunc
>  	fi
> =20
> -	if [ ${IMAGE_FSTYPE} !=3D "vmdk" ]; then
> -		dd if=3D$HDDIMG of=3D$IMAGE conv=3Dnotrunc seek=3D1 bs=3D512
> -		dd if=3D${ROOTFS} of=3D$IMAGE conv=3Dnotrunc seek=3D$OFFSET bs=3D512=
=09
> -	fi
> +	dd if=3D$HDDIMG of=3D$IMAGE conv=3Dnotrunc seek=3D1 bs=3D512
> +	dd if=3D${ROOTFS} of=3D$IMAGE conv=3Dnotrunc seek=3D$OFFSET bs=3D512
> =20
>  	cd ${DEPLOY_DIR_IMAGE}
>  	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i6WX/W6h5xa4jqsd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlK0KtYACgkQN1Ujt2V2gBxICwCfSf+UVishj3kuyumWl1w+pBXt
SQIAn0zLq8JT9oJEYf5PVSHqslrfe+N7
=z/P1
-----END PGP SIGNATURE-----

--i6WX/W6h5xa4jqsd--
