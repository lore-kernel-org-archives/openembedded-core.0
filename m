Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RQy3v-00064s-5p for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 10:15:15 +0100
Received: from f053033195.adsl.alicedsl.de ([78.53.33.195]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RQxxq-0001vc-Kg for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 09:08:59 +0000
Message-ID: <1321520914.3998.7.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 10:08:34 +0100
In-Reply-To: <1321488805.18905.5.camel@ted>
References: <1321488805.18905.5.camel@ted>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] libtool-cross: Upbreak and actually use more of it
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
X-List-Received-Date: Thu, 17 Nov 2011 09:15:15 -0000
X-Groupsio-MsgNum: 12563
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-7CDof/BOwzNjR2Vtkm4N"

--=-7CDof/BOwzNjR2Vtkm4N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Richard,


Am Donnerstag, den 17.11.2011, 00:13 +0000 schrieb Richard Purdie:


unfortunately I could not find the meaning of upbreak here.

> We should be using libtool-cross for cross compiling but
> were not.

Is that just a cosmetic thing or did packages break?

> This patch sets datadir so libtoolize ends up
> containing correct paths. It then installs libtoolize.
>=20
> The path ltmain.sh was installed to was incorrect and this is fixed.
>=20
> We also now install all the libtool m4 macros.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/re=
cipes-devtools/libtool/libtool-cross_2.4.bb
> index 596528a..4e6e3f2 100644
> --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> @@ -1,10 +1,13 @@
>  require libtool-${PV}.inc
> =20
> -PR =3D "r5"
> +PR =3D "r7"

Increase just by one?

>  PACKAGES =3D ""
>  SRC_URI +=3D "file://prefix.patch"
>  SRC_URI +=3D "file://fixinstall.patch"
> =20
> +target_datadir :=3D "${datadir}"

Is not already defined this way in `bitbake.conf`?

$ git grep target_d ./meta/conf/bitbake.conf
meta/conf/bitbake.conf:target_datadir :=3D "${datadir}"

> +datadir =3D "${STAGING_DIR_TARGET}${target_datadir}"
> +
>  do_configure_prepend () {
>  	# Remove any existing libtool m4 since old stale versions would break
>  	# any upgrade
> @@ -13,20 +16,21 @@ do_configure_prepend () {
>  }
> =20
>  do_install () {
> -	install -d ${D}${bindir}/
> -	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
> -	install -d ${D}${datadir}/libtool/
> -	install -d ${D}${datadir}/aclocal/
> -	install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/
> -	install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/
> -	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool=
/
> -	install -c -m 0644 ${S}/libltdl/m4/libtool.m4 ${D}${datadir}/aclocal/
> -	install -c -m 0644 ${S}/libltdl/m4/ltdl.m4 ${D}${datadir}/aclocal/
> +	install -d ${D}${bindir_crossscripts}/
> +	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir_crossscripts}/${HOST_S=
YS}-libtool
> +	install -d ${D}${bindir_crossscripts}/
> +	install -m 0755 libtoolize ${D}${bindir_crossscripts}/
> +	install -d ${D}${target_datadir}/libtool/config/
> +	install -d ${D}${target_datadir}/aclocal/
> +	install -c ${S}/libltdl/config/config.guess ${D}${target_datadir}/libto=
ol/
> +	install -c ${S}/libltdl/config/config.sub ${D}${target_datadir}/libtool=
/
> +	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${target_datadir}/=
libtool/config/
> +	install -c -m 0644 ${S}/libltdl/m4/*.m4 ${D}${target_datadir}/aclocal/
>  }
> =20
>  SYSROOT_PREPROCESS_FUNCS +=3D "libtoolcross_sysroot_preprocess"
> =20
>  libtoolcross_sysroot_preprocess () {
> -	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> -	install -m 755 ${D}${bindir}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${bi=
ndir_crossscripts}/${HOST_SYS}-libtool
> +	sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir=
_crossscripts}
> +	sysroot_stage_dir ${D}${target_datadir} ${SYSROOT_DESTDIR}${target_data=
dir}
>  }


Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-7CDof/BOwzNjR2Vtkm4N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7EzxMACgkQPX1aK2wOHVjSagCeKaIfHfV9zy3UC8WwhjgV/jXW
tagAn0seDdZ6lBugAWbWujm0c24ttuvD
=+2oM
-----END PGP SIGNATURE-----

--=-7CDof/BOwzNjR2Vtkm4N--
