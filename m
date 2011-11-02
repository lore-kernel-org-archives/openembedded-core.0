Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLWFK-0002hm-RG
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 09:32:30 +0100
Received: by faas16 with SMTP id s16so164700faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Qafeu+kMUj/u5HKgPxALWPPYsW8HpW3mLfLShW2gdSU=;
	b=YNGCsQSVJym9BBTQVC8tDkx16723mSA/PvEbFmQsSJUfmSLwC25sCQ0InVAfIzANtu
	oFbdZkz5j7FDa4Ynpqu0vVmksqU72fqRR6BJxO8ONVPaVR8BEXjr2MViueaV78IYWCGw
	WEgE9qLWQZSDf1SPwCY0+nnzsOTrWJTIKqMh0=
Received: by 10.223.81.196 with SMTP id y4mr6971785fak.6.1320222380992;
	Wed, 02 Nov 2011 01:26:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm4077327fab.8.2011.11.02.01.26.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 01:26:20 -0700 (PDT)
Date: Wed, 2 Nov 2011 09:26:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111102082613.GC9949@jama.jama.net>
References: <1320185290-18117-1-git-send-email-morphis@gravedo.de>
MIME-Version: 1.0
In-Reply-To: <1320185290-18117-1-git-send-email-morphis@gravedo.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] meta: glib-2.0: don't apply qsort_r test removable patch for native version
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
X-List-Received-Date: Wed, 02 Nov 2011 08:32:30 -0000
X-Groupsio-MsgNum: 11807
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Content-Disposition: inline

--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2011 at 11:08:10PM +0100, Simon Busch wrote:
> On some buildhosts with an older version of native glib-2.0 installed (in=
 this case
> 2.16.6) the qsort_r test removable patch leads to a compilation error:
>=20
> | ./.libs/libglib-2.0.so: undefined reference to `qsort_r'
> | collect2: ld returned 1 exit status
>=20
> This patch fixes this so the patch gets only applied for the native versi=
on of this
> recipe.
>=20
> Signed-off-by: Simon Busch <morphis@gravedo.de>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.30.0.bb
> index 566355d..0efce40 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
> @@ -1,6 +1,6 @@
>  require glib.inc
> =20
> -PR =3D "r2"
> +PR =3D "r3"
>  PE =3D "1"
> =20
>  DEPENDS +=3D "libffi python-argparse-native"
> @@ -9,11 +9,14 @@ DEPENDS_virtclass-nativesdk +=3D "libffi-nativesdk pyth=
on-argparse-native zlib-nat
> =20
>  SHRT_VER =3D "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getV=
ar('PV',d,1).split('.')[1]}"
> =20
> +QSORT_PATCH =3D "file://remove.test.for.qsort_r.patch"
> +QSORT_PATCH_virtclass-native =3D ""
> +
>  SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
>             file://configure-libtool.patch \
>             file://60_wait-longer-for-threads-to-die.patch \
>             file://g_once_init_enter.patch \
> -           file://remove.test.for.qsort_r.patch \
> +           ${QSORT_PATCH} \
>            "
>  SRC_URI[md5sum] =3D "fee101d9d7daa8ddfbae00325f307f3b"
>  SRC_URI[sha256sum] =3D "ca9c731017ab370859e847f8b70079bc6dcf389dc0ccb0d0=
419925aff81b9687"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6w/qUACgkQN1Ujt2V2gBx4LwCgghgvVMu1atWqj+tLzzf1r+nC
MDwAmQGXZ+XXxfWQl8jIBgDMT3egAyqp
=tbYA
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
