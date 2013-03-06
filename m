Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UD81o-00058S-KG; Wed, 06 Mar 2013 07:40:41 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so5532183pbb.27
	for <multiple recipients>; Tue, 05 Mar 2013 22:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CTNBxzyS/LlJYO8tSdYnDbjVWk/NhXz88zMqTzHNdPo=;
	b=J+xX3qpp9ekLGsW4jjdgJy2qBrIGDelUcnXqVMQHfhYBF1yeA4OFfpsahnZ+5KKItI
	GOm1QbyJIt9YVoi0U14z9lAdc+lNxwB7Rjk09Bqksyh2dbQodkGAfk2dRIFkXjjYmnUw
	9pVLGFLrMsTwv3CNdXwDZjFBL4prY1nzh4VbdUIf5iTCUfNFB+fe/41iKnZrw68QiMlQ
	K5R66yKHlDtrYca+zFUqs10w3Wdl6N+VU3SCmkI7E3eWTcfcaK9jFKY/tqVAzv5Gqw8R
	oVk1LtIXUw/wJOZxdTGkVi+NHSh/2CN9GWzcAEJ7O3l8YjOlBytyowbHS7TAQ/re7297
	Lu5A==
X-Received: by 10.68.125.169 with SMTP id mr9mr43065462pbb.74.1362551049179;
	Tue, 05 Mar 2013 22:24:09 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id rl3sm29919360pbb.28.2013.03.05.22.24.05
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Mar 2013 22:24:08 -0800 (PST)
Date: Wed, 6 Mar 2013 07:23:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	MiLo <milo-software@users.sourceforge.net>
Message-ID: <20130306062358.GC14869@jama>
References: <20130228231551.3998F5022B@opal>
MIME-Version: 1.0
In-Reply-To: <20130228231551.3998F5022B@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] MiLo : util-linux: Add package for libmount
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2013 06:40:46 -0000
X-Groupsio-MsgNum: 36275
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline

--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2013 at 11:15:51PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 2e79110e31da940728d42411cad3d019d570fc31
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D2e79110e31da940728d42411cad3d019d570fc31
>=20
> Author: MiLo <milo-software@users.sourceforge.net>
> Date:   Tue Feb 19 18:23:15 2013 +0100
>=20
> util-linux: Add package for libmount
>=20
> The libmount shared library was part of util-linux. This caused
> util-linux-mount to RDEPEND on util-linux, so including that would
> also drag in all of util-linux and all its recommendations.
>=20
> To break this circular dependency, add a libmount package that holds
> the libmount.so.* files, just like the other libraries built by util-
> linux.

Breaks upgrade path:

 * check_data_file_clashes: Package libmount1 wants to install file
 * /lib/libmount.so.1.1.0
        But that file is already provided by package  * util-linux
 * check_data_file_clashes: Package libmount1 wants to install file
 * /lib/libmount.so.1
        But that file is already provided by package  * util-linux

RREPLACES is probably needed.

>=20
> Signed-off-by: MiLo <milo-software@users.sourceforge.net>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-core/util-linux/util-linux.inc       |    3 +++
>  meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
>  2 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 10439c0..bd7b089 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -31,6 +31,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
>  PACKAGES =3D+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util=
-linux-sfdisk \
>               util-linux-swaponoff util-linux-losetup util-linux-umount \
>               util-linux-mount util-linux-readprofile util-linux-libblkid=
 \
> +             util-linux-libmount util-linux-libmount-dev \
>               util-linux-libblkid-dev util-linux-libuuid util-linux-libuu=
id-dev \
>               util-linux-uuidgen util-linux-lscpu util-linux-fsck util-li=
nux-blkid \
>               util-linux-mkfs util-linux-mcookie util-linux-reset"
> @@ -64,6 +65,8 @@ FILES_util-linux-reset =3D "${base_bindir}/reset"
> =20
>  FILES_util-linux-libblkid =3D "${base_libdir}/libblkid.so.*"
>  FILES_util-linux-libblkid-dev =3D "${base_libdir}/libblkid.so ${base_lib=
dir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
> +FILES_util-linux-libmount =3D "${base_libdir}/libmount.so.*"
> +FILES_util-linux-libmount-dev =3D "${base_libdir}/libmount.so ${base_lib=
dir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
>  FILES_util-linux-libuuid =3D "${base_libdir}/libuuid.so.*"
>  FILES_util-linux-libuuid-dev =3D "${base_libdir}/libuuid.so ${base_libdi=
r}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
>  FILES_util-linux-lscpu =3D "${bindir}/lscpu"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.22.2.bb
> index dd95573..f91784b 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> @@ -1,5 +1,5 @@
>  MAJOR_VERSION =3D "2.22"
> -PR =3D "r0"
> +PR =3D "r1"
>  require util-linux.inc
> =20
>  # note that `lscpu' is under GPLv3+
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE24P4ACgkQN1Ujt2V2gBxWcQCgjljNBz7ZzcvFxt6wsmNh2cdV
/1wAmwYVjWAOL5T/sqrEadITd35FJTQi
=JSxk
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
