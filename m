Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 14E046F73E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 15:10:19 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id p61so4797428wes.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ObYgRWQWD/igMc/6ZBwYTH9Gzd2VfM/FOcv0rdnn8Z4=;
	b=Ar2nzkRkAdJiSPBhpTNfpUMpQc3VrGJiF02HHSqwv/EkQZxRFh0ufwdaONuG0UhkSW
	n0gdJRDe3te2n0VIivni64UcQWYmep6gE7GtNt6DZDnOQwEMkQGIQxhbmqD96q6XmmnV
	cptLQdJuSDU/QoJuznmw6vx8JViLpO6Rm+mdvA1+4ROWs7SyDm5gd8+5J1DeWy2rTX2I
	iJ3uSaQAby6fAlZPQPEGSR4nvXFXNRz2O1PbOxFBVlwB3U9Q1Yv0y3ZT7RBtKJ0bviuc
	gPELIpoyC2wL3DsaSjw+hD7rL0QoIV1WU9jUffKTClXgyd57lN+DsKAd82r1cUTiYSJZ
	TV5g==
X-Received: by 10.180.188.130 with SMTP id ga2mr5194603wic.18.1396278619756;
	Mon, 31 Mar 2014 08:10:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm33652225eew.19.2014.03.31.08.10.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 08:10:18 -0700 (PDT)
Date: Mon, 31 Mar 2014 17:10:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Message-ID: <20140331151018.GG2425@jama>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
	<1396275649-32352-2-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1396275649-32352-2-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Mon, 31 Mar 2014 15:10:23 -0000
X-Groupsio-MsgNum: 51925
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAgJxtfIS94j9H4T"
Content-Disposition: inline

--uAgJxtfIS94j9H4T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 10:20:49PM +0800, Kai Kang wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> When native package is built, use the uname to return the kernel version.
>=20
> When target is built, read kernel version from ${STAGING_KERNEL_DIR}/kern=
el-abiversion
> to avoid to use the hardcode kernel version.

Doesn't it make nss MACHINE_ARCH like most virtual/kernel providers are?

> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-support/nss/nss.inc | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/=
nss.inc
> index 404decc..f24da68 100644
> --- a/meta/recipes-support/nss/nss.inc
> +++ b/meta/recipes-support/nss/nss.inc
> @@ -26,6 +26,7 @@ SRC_URI_append_class-target =3D "\
>  inherit siteinfo
>  PR =3D "r0"
>  DEPENDS =3D "sqlite3 nspr zlib nss-native"
> +DEPENDS_append_class-target +=3D "virtual/kernel"
>  DEPENDS_class-native =3D "sqlite3-native nspr-native zlib-native"
>  RDEPENDS_${PN} =3D "perl"
> =20
> @@ -37,12 +38,24 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
>  do_compile_prepend_class-native() {
>      export NSPR_INCLUDE_DIR=3D${STAGING_INCDIR_NATIVE}
>      export NSPR_LIB_DIR=3D${STAGING_LIBDIR_NATIVE}
> +    export OS_RELEASE=3D`uname -r`
>  }
> =20
>  do_compile_prepend_class-nativesdk() {
>      export LDFLAGS=3D""
>  }
> =20
> +do_compile_prepend_class-target() {
> +    export OS_RELEASE=3D`cat ${STAGING_KERNEL_DIR}/kernel-abiversion|sed=
 's/-.*//'`
> +}
> +
> +do_install_prepend_class-native() {
> +    export OS_RELEASE=3D`uname -r`
> +}
> +
> +do_install_prepend_class-target() {
> +    export OS_RELEASE=3D`cat ${STAGING_KERNEL_DIR}/kernel-abiversion|sed=
 's/-.*//'`
> +}
>  do_compile() {
>      export CROSS_COMPILE=3D1
>      export NATIVE_CC=3D"gcc"
> @@ -57,7 +70,6 @@ do_compile() {
>      export NSS_USE_SYSTEM_SQLITE=3D1
>      export NSS_ENABLE_ECC=3D1
> =20
> -    export OS_RELEASE=3D3.4
>      export OS_TARGET=3DLinux
>      export OS_ARCH=3DLinux
> =20
> @@ -97,7 +109,6 @@ do_install() {
>      export NSS_USE_SYSTEM_SQLITE=3D1
>      export NSS_ENABLE_ECC=3D1
> =20
> -    export OS_RELEASE=3D3.4
>      export OS_TARGET=3DLinux
>      export OS_ARCH=3DLinux
> =20
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uAgJxtfIS94j9H4T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM5hVoACgkQN1Ujt2V2gBwG2wCfZRrMT9ETdURZ8bNpmXMEYgyh
QWgAn1B1jiP5Om/tPY98u+eGL+xE3lv4
=RO90
-----END PGP SIGNATURE-----

--uAgJxtfIS94j9H4T--
