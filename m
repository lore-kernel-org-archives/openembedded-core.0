Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TG89Y-00021U-5T; Mon, 24 Sep 2012 14:52:48 +0200
Received: by wgbds1 with SMTP id ds1so2602651wgb.0
	for <multiple recipients>; Mon, 24 Sep 2012 05:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=ZFM44UQyShd7wRUFt/ryEB/bid9kVBDo79MMFryi29Q=;
	b=qjfpJPrdiclrCCIVhia9OcA2PoIYHJJhEHrsPWF0GptkGhkTRGBRS6zgxTVXaD/iVb
	poygD2u7lBanumJw4ybNEP3WVc+2cHqW4mjHlmql48E8jmpUwQkCRSOn+3t4otKOPZq0
	3NgmKV5+DYa3sx1aL7k3GA/wNih07qU9IijDaJqWEKZgRYnJh2g1DzJFC3d15k3ffSo+
	VTkVRVjMT0kUbYg/UDFaXGSXFG2or7+N//zgJEy4PBxZWstw+aB500aYLKkbxpfZaWZW
	4rS7nv3yQZ7wFT7EvAptd3X4d6k7yUeVrOM1BGPhkGb8F3WZs8hGDkHQZ2xg8nxoHtYD
	h/7g==
Received: by 10.216.28.213 with SMTP id g63mr1361845wea.42.1348490400451;
	Mon, 24 Sep 2012 05:40:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f10sm11544292wiy.9.2012.09.24.05.39.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 05:39:58 -0700 (PDT)
Date: Mon, 24 Sep 2012 14:40:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: philb@gnu.org
Message-ID: <20120924124003.GB3295@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120924103550.D93CE10378@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Phil Blundell : util-linux: Ensure that ${sbindir} is respected
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
X-List-Received-Date: Mon, 24 Sep 2012 12:52:48 -0000
X-Groupsio-MsgNum: 29779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 10:35:50AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 6fdca45ec85e226f570917d2d1aaa2aa39ab6b42
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6fdca45ec85e226f570917d2d1aaa2aa39ab6b42
>=20
> Author: Phil Blundell <philb@gnu.org>
> Date:   Mon Sep 24 07:24:51 2012 +0100
>=20
> util-linux: Ensure that ${sbindir} is respected
>=20
> The configure script uses a hard-coded value for ${usrsbin_execdir},
> which is the path that we know as ${sbindir}.  Adjust configure to take
> this from the environment if it's set there, and have do_configure()
> pass it in.
>=20
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/util-linux/util-linux.inc        |    4 +++-
>  .../util-linux/util-linux/configure-sbindir.patch  |   18 ++++++++++++++=
++++
>  meta/recipes-core/util-linux/util-linux_2.21.2.bb  |    3 ++-
>  3 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 79e0608..2c5267f 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -38,7 +38,9 @@ EXTRA_OECONF =3D "--libdir=3D${base_libdir} --disable-u=
se-tty-group \
>                  --enable-kill --enable-last --enable-mesg --enable-partx=
 \
>                  --enable-raw --enable-rdev --enable-reset --disable-logi=
n-utils \
>                  --enable-write --enable-arch --enable-mount --with-fspro=
be=3Dbuiltin \
> -                --enable-libuuid --enable-libblkid --enable-fsck --witho=
ut-udev"
> +                --enable-libuuid --enable-libblkid --enable-fsck --witho=
ut-udev \
> +		usrsbin_execdir=3D'${sbindir}' \
> +"

Please don't mix tabs and spaces for multiline indentation.
Use spaces (http://www.openembedded.org/index.php?title=3DStyleguide)

Cheers,

> =20
>  FILES_${PN}-doc +=3D "${datadir}/getopt/getopt-*.*"
> =20
> diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.pa=
tch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> new file mode 100644
> index 0000000..f1f5ef4
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> @@ -0,0 +1,18 @@
> +util-linux: take ${sbindir} from the environment if it is set there
> +
> +Signed-off-by: Phil Blundell <pb@pbcl.net>
> +Upstream-Status: Inappropriate [configuration]
> +
> +--- util-linux-2.21.2/configure.ac~	2012-09-22 09:29:12.354215377 +0100
> ++++ util-linux-2.21.2/configure.ac	2012-09-22 16:47:14.713628946 +0100
> +@@ -67,7 +67,9 @@
> + usrbin_execdir=3D'${exec_prefix}/bin'
> + AC_SUBST([usrbin_execdir])
> +=20
> +-usrsbin_execdir=3D'${exec_prefix}/sbin'
> ++if [ -z "$usrsbin_execdir" ]; then
> ++   usrsbin_execdir=3D'${exec_prefix}/sbin'
> ++fi
> + AC_SUBST([usrsbin_execdir])
> +=20
> + usrlib_execdir=3D'${exec_prefix}/'$libdirname
> diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.21.2.bb
> index 6ef3163..e8f00fc 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
> @@ -1,5 +1,5 @@
>  MAJOR_VERSION =3D "2.21"
> -PR =3D "r2"
> +PR =3D "r3"
>  require util-linux.inc
> =20
>  # note that `lscpu' is under GPLv3+
> @@ -8,6 +8,7 @@ LICENSE_${PN}-lscpu =3D "GPLv3+"
>  SRC_URI +=3D "file://util-linux-ng-replace-siginterrupt.patch \
>              file://util-linux-ng-2.16-mount_lock_path.patch \
>              file://uclibc-__progname-conflict.patch \
> +	    file://configure-sbindir.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "b75b3cfecb943f74338382fde693c2c3"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBgVKMACgkQN1Ujt2V2gBy18wCfTQKVzHGFkGOzQgwaVhfpJJOd
y8gAniLolbi8LtWwviOkfGDZ1Fk0nk4Y
=LIlU
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
