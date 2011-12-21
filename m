Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RdUxo-00064X-Jr
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 23:48:44 +0100
Received: by eeit10 with SMTP id t10so3843845eei.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 14:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kWhXzRNs8QxAJWIPxWjyd0DnA+v5BFlnsa8d+Oq+vGE=;
	b=FxEa74X/pmLVuF0gVNPy4GRz/AVtpAxcXgLTV5HmS7IewX7+7wn+aPwD4nl2ojcQ60
	gXq4DTM7Rf6HtXE01+Uy+DFjf+pqONgeYQa65rxATSTHSInTpYQ11a2rTYbMKLY9JTjC
	dnaK2mqIGy8SAiTgPBMy98VPLL/4BCYQW/LMg=
Received: by 10.14.39.15 with SMTP id c15mr3207030eeb.31.1324507298177;
	Wed, 21 Dec 2011 14:41:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x12sm26043454eef.9.2011.12.21.14.41.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 14:41:37 -0800 (PST)
Date: Wed, 21 Dec 2011 23:41:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111221224125.GG12791@jama.jama.net>
References: <cover.1324495514.git.nitin.a.kamble@intel.com>
	<16df1bc176ad96d8fbe36701a40314bdc5a487dc.1324495514.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <16df1bc176ad96d8fbe36701a40314bdc5a487dc.1324495514.git.nitin.a.kamble@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/3] binutils: fix building on distros with matching binutils version
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
X-List-Received-Date: Wed, 21 Dec 2011 22:48:44 -0000
X-Groupsio-MsgNum: 14612
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qxfKREH7IwbezJ+T"
Content-Disposition: inline

--qxfKREH7IwbezJ+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2011 at 11:27:14AM -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> x86_64 opensuse 11.4 has bintuils version 2.21, and when
> binutils_2.21 recipe is built for x86_64 target then, the invocation
> of distro gcc fails with errors like this:
>=20
> /usr/lib64/gcc/x86_64-suse-linux/4.5/../../../../x86_64-suse-linux/bin/as:
> symbol lookup error: /usr/lib64/gcc/x86_64-suse-linux/4.5/..
> make[2]: *** [sysinfo.o] Error 1
>=20
> The issue rootcaused as incompatible LD_LIBRARY_PATH while running
> the distro gcc.
>=20
> As per Martin Jansa gentoo also sees similar issue with binutils 2.22
> recipe.

I can confirm that with similar patch based on your fix for 2.21 in
poky-contrib/nitin/bugfix I was able to build binutils for qemux86-64
for first time without manual fix :).

Cheers,

> This commit fixes the issue by clearing the LD_LIBRARY_PATH for
> distro gcc (CC_FOR_BUILD)
>=20
> This Fixes bug: [YOCTO #1833]
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../binutils/binutils-cross-canadian_2.22.bb       |    2 +-
>  .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
>  meta/recipes-devtools/binutils/binutils.inc        |    2 +-
>  meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.=
bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
> index e91e7dc..a49aded 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
> @@ -1,3 +1,3 @@
>  require binutils_${PV}.bb
>  require binutils-cross-canadian.inc
> -PR =3D "r1"
> +PR =3D "r2"
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb b/m=
eta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
> index 21289cd..0e8b6e4 100644
> --- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
> +++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
> @@ -4,7 +4,7 @@ inherit crosssdk
> =20
>  PROVIDES =3D "virtual/${TARGET_PREFIX}binutils-crosssdk"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  do_configure_prepend () {
>  	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNA=
TIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 5cb2cc9..30a0416 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -76,7 +76,7 @@ export RANLIB_FOR_TARGET =3D "${TARGET_PREFIX}ranlib"
>  export CC_FOR_HOST =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
>  export CXX_FOR_HOST =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
> =20
> -export CC_FOR_BUILD =3D "${BUILD_CC}"
> +export CC_FOR_BUILD =3D "LD_LIBRARY_PATH=3D ${BUILD_CC}"
>  export CPP_FOR_BUILD =3D "${BUILD_CPP}"
>  export CFLAGS_FOR_BUILD =3D "${BUILD_CFLAGS}"
> =20
> diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recip=
es-devtools/binutils/binutils_2.22.bb
> index f1e7e12..41a30ee 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.22.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
> @@ -1,6 +1,6 @@
>  require binutils.inc
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  LIC_FILES_CHKSUM=3D"\
>      file://src-release;endline=3D17;md5=3D4830a9ef968f3b18dd5e9f2c00db2d=
35\
> --=20
> 1.7.6.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qxfKREH7IwbezJ+T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7yYJUACgkQN1Ujt2V2gBybDgCfVKVVCoUNZdb5QJY0ygUAGYKM
CREAoKgbFkju6iwzc3J/ZRLWy76t1FSt
=lNka
-----END PGP SIGNATURE-----

--qxfKREH7IwbezJ+T--
