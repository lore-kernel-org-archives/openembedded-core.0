Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4534C60017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:15:00 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id k10so2208387eaj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BMNslzBLh6vzh1kDnZ65iQrBD0zxTvDM1qVUsabX6Xs=;
	b=C2zfPTnteizpXAKXyuuFL80okbu7Vp3mVkrbPA03X43tDWIt3fVzI2817VJ9PXEMUM
	kOCmwcvNwr9zCXQnPHpLOwjdiS0AqpXEpFkOk3JNGGcY5HcSHmJ4CyE+oJ+gg+WWlw8H
	G1PFKSSKsbtIFA0guyI6geP2MW3jREgM3KzXh+Oq6yj3Zaij36sVuuuKJak7IOQ7bAt/
	kaAU2rAgq1T2WjTYpVvE12wdNLCr9DMcE5ScDlPq85iNy+zDNJWDI3Qe+JejMbHK+mjO
	fahif5EYlqkejy3MWgK9Gz6pTKFDzU4kriMF9VQ+HyWIhzUepqlt4k/ZIMhUnaFIZNJR
	G6Vg==
X-Received: by 10.14.221.4 with SMTP id q4mr15760040eep.47.1393539300386;
	Thu, 27 Feb 2014 14:15:00 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm2648325eeh.13.2014.02.27.14.14.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 14:14:59 -0800 (PST)
Date: Thu, 27 Feb 2014 23:15:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140227221501.GE26981@jama>
References: <1393532438-20847-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393532438-20847-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH] pango: Fix postinst
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
X-List-Received-Date: Thu, 27 Feb 2014 22:15:02 -0000
X-Groupsio-MsgNum: 50689
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lhhpAkuygu+L0poz"
Content-Disposition: inline

--lhhpAkuygu+L0poz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2014 at 09:20:38PM +0100, Martin Jansa wrote:
> * do_split_packages was appending call to
>   ${bindir}/${MLPREFIX}pango-querymodules
>   without $D prefix or test if $D is empty, so it was always
>   failing on buildhostis without pango-querymodules and such
>   failure is fatal when rootfs is read-only (do_rootfs fails
>   because some packages weren't configured)

Something is wrong, in theory the
if [ "x$D" !=3D "x" ]; then
case should always exit with 0 or 1 before it reaches the call added by
do_split_packages so it has to be qemu_run_binary call failing and
causing exit 1

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/pango/pango.inc | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphic=
s/pango/pango.inc
> index 17006d3..5fddff9 100644
> --- a/meta/recipes-graphics/pango/pango.inc
> +++ b/meta/recipes-graphics/pango/pango.inc
> @@ -42,21 +42,25 @@ EXTRA_OECONF =3D "--disable-introspection \
>  LEAD_SONAME =3D "libpango-1.0*"
>  LIBV =3D "1.8.0"
> =20
> -postinst_prologue() {
> +pango_postinst() {
>  if ! [ -e $D${sysconfdir}/pango ] ; then
>  	mkdir -p $D${sysconfdir}/pango
>  fi
> =20
> -if [ "x$D" !=3D "x" ]; then
> +if [ -n "$D" ]; then
>  	${@qemu_run_binary(d, '$D','${bindir}/${MLPREFIX}pango-querymodules')} \
>  		$D${libdir}/pango/${LIBV}/modules/*.so \
>  		> $D${sysconfdir}/pango/${MLPREFIX}pango.modules 2>/dev/null
> =20
> -	[ $? -ne 0 ] && exit 1
> +	if [ $? -ne 0 ] ; then
> +		echo "qemu_run_binary call ${bindir}/${MLPREFIX}pango-querymodules $D$=
{libdir}/pango/${LIBV}/modules/*.so > $D${sysconfdir}/pango/${MLPREFIX}pang=
o.modules failed"
> +		exit 1
> =20
>  	sed -i -e "s:$D::" $D${sysconfdir}/pango/${MLPREFIX}pango.modules
> =20
>  	exit 0
> +else
> +	${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.m=
odules
>  fi
>  }
> =20
> @@ -68,11 +72,11 @@ do_install_append () {
> =20
> =20
>  python populate_packages_prepend () {
> -    prologue =3D d.getVar("postinst_prologue", True)
> +    pango_postinst =3D d.getVar("pango_postinst", True)
> =20
>      modules_root =3D d.expand('${libdir}/pango/${LIBV}/modules')
> =20
> -    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module=
-%s', 'Pango module %s', prologue + '${bindir}/${MLPREFIX}pango-querymodule=
s > /etc/pango/${MLPREFIX}pango.modules')
> +    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module=
-%s', 'Pango module %s', pango_postinst)
>  }
> =20
>  FILES_${PN} =3D "${sysconfdir}/pango/* ${bindir}/* ${libdir}/libpango*${=
SOLIBS}"
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lhhpAkuygu+L0poz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMPuOUACgkQN1Ujt2V2gBzHPACgjW8B4iMsvTZ/aam3ua/X62OH
L20Anj1RPNNrWH9g7yjhQq1yKotFmlLW
=lu6t
-----END PGP SIGNATURE-----

--lhhpAkuygu+L0poz--
