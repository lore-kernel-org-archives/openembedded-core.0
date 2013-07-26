Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id AB11A6A960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 09:27:46 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so1456565eak.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 02:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1TNDrDwaafKGplbV1bI3IGyg2I3/n6URLTeIrLmGil0=;
	b=f6pVWD8smebeXc7PQEKIMJaaovjnf7IitLmOWMNLnKVgdQSeG9mpojXPgwrTkbPV33
	hliRw2Cvtyl4iOXISQEx9aBrR88F9NdczfTc0SryFFzpF8EP6kqpa1ubayXkCQ6Xr5ab
	LOqvS7qCwGl7pm8SLeEkVzRpbpEQyOA0IQDTgBYHO50fmnFpVHaVTbclREaiVlTVMCyJ
	M9EBdqPD+mBiIOsAxzb5BiHGlYyuItgWTOyc11z4l7jywLtAPLe6XobTc9EKz0S74oTZ
	ajQb1AJI+oIOWiePCNT8po7NYmowl9dAJBZlrN4OAdwNyaWzqMM5Z9o5ynYdotymISHV
	v3/w==
X-Received: by 10.15.26.199 with SMTP id n47mr46822871eeu.88.1374830866832;
	Fri, 26 Jul 2013 02:27:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm79670635eeo.14.2013.07.26.02.27.45 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Jul 2013 02:27:46 -0700 (PDT)
Date: Fri, 26 Jul 2013 11:28:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20130726092812.GD3280@jama>
References: <cover.1374642547.git.Qi.Chen@windriver.com>
	<5dc3be245a9757c51dadd7ce446c5116ce79496d.1374642547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5dc3be245a9757c51dadd7ce446c5116ce79496d.1374642547.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] Generate ssh keys at rootfs creation time in case of a read-only rootfs
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
X-List-Received-Date: Fri, 26 Jul 2013 09:27:47 -0000
X-Groupsio-MsgNum: 42491
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OROCMA9jn6tkzFBc"
Content-Disposition: inline

--OROCMA9jn6tkzFBc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2013 at 03:39:36PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> To avoid generating ssh keys every time a system with read-only rootfs
> starts, we generate ssh keys at rootfs creation time.
>=20
> This change only has effect for systems with read-only rootfs.

I'm not sure if having the same keys on all devices installed from the
same image is always desired behavior, imho it should be controlled by
another variable, because some people want read-only rootfs and keys
generated in some other write-able partition.

> [YOCTO #4103]
> [YOCTO #4887]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass                         |   15 +++++++++++++++
>  meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   10 +++++++---
>  meta/recipes-core/dropbear/dropbear.inc            |    6 +++++-
>  meta/recipes-core/dropbear/dropbear/init           |   19 ++------------=
-----
>  4 files changed, 29 insertions(+), 21 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 3bc57d3..9a0692a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -263,6 +263,21 @@ read_only_rootfs_hook () {
>  		if [ -x ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
>  			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
>  		fi
> +	        # Generate ssh keys at rootfs time
> +		if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
> +			[ -r ${IMAGE_ROOTFS}/etc/default/dropbear ] && . ${IMAGE_ROOTFS}/etc/=
default/dropbear
> +			DROPBEAR_RSAKEY_DEFAULT=3D"/etc/dropbear/dropbear_rsa_host_key"
> +			DROPBEAR_DSSKEY_DEFAULT=3D"/etc/dropbear/dropbear_dss_host_key"
> +			test -n "$DROPBEAR_RSAKEY" || DROPBEAR_RSAKEY=3D$DROPBEAR_RSAKEY_DEFA=
ULT
> +			test -n "$DROPBEAR_DSSKEY" || DROPBEAR_DSSKEY=3D$DROPBEAR_DSSKEY_DEFA=
ULT
> +			dropbearkey -t rsa -f ${IMAGE_ROOTFS}$DROPBEAR_RSAKEY
> +			dropbearkey -t dss -f ${IMAGE_ROOTFS}$DROPBEAR_DSSKEY
> +		fi
> +		if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
> +			ssh-keygen -q -f ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key -N '' -t rsa
> +			ssh-keygen -q -f ${IMAGE_ROOTFS}/etc/ssh/ssh_host_ecdsa_key -N '' -t =
ecdsa
> +			ssh-keygen -q -f ${IMAGE_ROOTFS}/etc/ssh/ssh_host_dsa_key -N '' -t dsa
> +		fi
>  	fi
>  }
> =20
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/re=
cipes-connectivity/openssh/openssh_6.2p2.bb
> index ab2eefb..40dc4ca 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> @@ -9,7 +9,8 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3De326045657e842=
541d3f35aada442507"
> =20
>  PR =3D "r0"
> =20
> -DEPENDS =3D "zlib openssl"
> +DEPENDS =3D "zlib openssl openssh-native"
> +DEPENDS_class-native =3D "zlib-native openssl-native"
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> =20
>  RPROVIDES_${PN}-ssh =3D "ssh"
> @@ -41,7 +42,7 @@ INITSCRIPT_PACKAGES =3D "${PN}-sshd"
>  INITSCRIPT_NAME_${PN}-sshd =3D "sshd"
>  INITSCRIPT_PARAMS_${PN}-sshd =3D "defaults 9"
> =20
> -PACKAGECONFIG ??=3D "tcp-wrappers"
> +PACKAGECONFIG_class-target ??=3D "tcp-wrappers"
>  PACKAGECONFIG[tcp-wrappers] =3D "--with-tcp-wrappers,,tcp-wrappers"
> =20
>  inherit autotools
> @@ -49,6 +50,7 @@ inherit autotools
>  # LFS support:
>  CFLAGS +=3D "-D__FILE_OFFSET_BITS=3D64"
>  export LD =3D "${CC}"
> +export LD_class-native =3D "${CC}"
> =20
>  EXTRA_OECONF =3D "--with-rand-helper=3Dno \
>                  ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam',=
 '--without-pam', d)} \
> @@ -74,7 +76,7 @@ do_compile_append () {
>  	install -m 0644 ${WORKDIR}/ssh_config ${S}/
>  }
> =20
> -do_install_append () {
> +do_install_append_class-target () {
>  	for i in ${DISTRO_FEATURES};
>  	do
>  		if [ ${i} =3D "pam" ];  then
> @@ -102,6 +104,7 @@ FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
> =20
>  RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>  RDEPENDS_${PN}-sshd +=3D "${PN}-keygen"
> +RDEPENDS_${PN}_class-native =3D ""
> =20
>  CONFFILES_${PN}-sshd =3D "${sysconfdir}/ssh/sshd_config"
>  CONFFILES_${PN}-ssh =3D "${sysconfdir}/ssh/ssh_config"
> @@ -110,3 +113,4 @@ ALTERNATIVE_PRIORITY =3D "90"
>  ALTERNATIVE_${PN}-scp =3D "scp"
>  ALTERNATIVE_${PN}-ssh =3D "ssh"
> =20
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/=
dropbear/dropbear.inc
> index be93d60..381b8aa 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -9,11 +9,13 @@ INC_PR =3D "r1"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3a5b0c2f0d0c49dfde9558ae20366=
83c"
> =20
> -DEPENDS =3D "zlib"
> +DEPENDS =3D "zlib dropbear-native"
>  RPROVIDES_${PN} =3D "ssh sshd"=20
> =20
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> =20
> +DEPENDS_class-native =3D "zlib-native"
> +
>  SRC_URI =3D "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar=
=2Ebz2 \
>             file://0001-urandom-xauth-changes-to-options.h.patch \
>             file://0002-static_build_fix.patch \
> @@ -88,3 +90,5 @@ pkg_postrm_append_${PN} () {
>          rm ${sysconfdir}/dropbear/dropbear_dss_host_key
>    fi
>  }
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-core/dropbear/dropbear/init b/meta/recipes-core=
/dropbear/dropbear/init
> index e8fed3f..5140b0b 100755
> --- a/meta/recipes-core/dropbear/dropbear/init
> +++ b/meta/recipes-core/dropbear/dropbear/init
> @@ -28,23 +28,8 @@ test "$NO_START" =3D "0" || exit 0
>  test -x "$DAEMON" || exit 0
>  test ! -h /var/service/dropbear || exit 0
> =20
> -readonly_rootfs=3D0
> -for flag in `awk '{ if ($2 =3D=3D "/") { split($4,FLAGS,",") } }; END { =
for (f in FLAGS) print FLAGS[f] }' </proc/mounts`; do
> -  case $flag in
> -   ro)
> -     readonly_rootfs=3D1
> -     ;;
> -  esac
> -done
> -
> -if [ $readonly_rootfs =3D "1" ]; then
> -  mkdir -p /var/lib/dropbear
> -  DROPBEAR_RSAKEY_DEFAULT=3D"/var/lib/dropbear/dropbear_rsa_host_key"
> -  DROPBEAR_DSSKEY_DEFAULT=3D"/var/lib/dropbear/dropbear_dss_host_key"
> -else
> -  DROPBEAR_RSAKEY_DEFAULT=3D"/etc/dropbear/dropbear_rsa_host_key"
> -  DROPBEAR_DSSKEY_DEFAULT=3D"/etc/dropbear/dropbear_dss_host_key"
> -fi
> +DROPBEAR_RSAKEY_DEFAULT=3D"/etc/dropbear/dropbear_rsa_host_key"
> +DROPBEAR_DSSKEY_DEFAULT=3D"/etc/dropbear/dropbear_dss_host_key"
> =20
>  test -z "$DROPBEAR_BANNER" || \
>    DROPBEAR_EXTRA_ARGS=3D"$DROPBEAR_EXTRA_ARGS -b $DROPBEAR_BANNER"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OROCMA9jn6tkzFBc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHyQSwACgkQN1Ujt2V2gByc2wCguKUKYcCy7OWvdzNiFOFPTqYx
6JUAn2u+kf0GqdZdviwQX9zf/CbEni5k
=3gcP
-----END PGP SIGNATURE-----

--OROCMA9jn6tkzFBc--
