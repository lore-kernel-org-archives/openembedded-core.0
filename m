Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwYW8-0005SY-FX
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:59:12 +0200
Received: by wgbdr1 with SMTP id dr1so6116634wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fjc4LOWzR7V8XrJg663D0zmoRPqvrO6cmNtkCi16vz8=;
	b=sjLGeUEe118RPvlEfaYkCGA8ZBMUaXgXTtnNrW1Ej0UAxc+wiE7bZEmzZWlNgYIzkA
	EiBzLZYUCKkKzzDZm7pCcJrgUEvDlDnEDtG6Ocb+CHg3qcudRmh3wB4gDK+VtDQPrlp+
	jbezjPcGAETeAyc7V2S5iL5mX9Ehe/KhKW4RV6xfchGTuvvfETyyjUosL/P5h2np8mW+
	DDHHL7lKDdvEqiJOgLQkerbh96Z4sBp4Gusel5A5LnfBliLyqxhVz3Sajo+smTNvHbow
	gu3yZSBv7wv+HQwlR0DcTTR9ZYBlDfmTARyfJXdxoHVn6mrh1q7ru0vExf0lZn4Bdwy6
	qCBQ==
Received: by 10.217.3.7 with SMTP id q7mr2604764wes.47.1343825254324;
	Wed, 01 Aug 2012 05:47:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm27784786wix.9.2012.08.01.05.47.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:47:33 -0700 (PDT)
Date: Wed, 1 Aug 2012 14:47:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801124730.GF16306@jama.jama.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<7edce29ef75deb6486f9d40235d3060a5665b663.1343823907.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <7edce29ef75deb6486f9d40235d3060a5665b663.1343823907.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 09/12] mesa: respect x11 DISTRO_FEATURE
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
X-List-Received-Date: Wed, 01 Aug 2012 12:59:12 -0000
X-Groupsio-MsgNum: 26636
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vKFfOv5t3oGVpiF+"
Content-Disposition: inline

--vKFfOv5t3oGVpiF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 01:31:15PM +0100, Ross Burton wrote:
> Patch originally by Damien Lespiau <damien.lespiau@intel.com>.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa-8.0.4.inc          |    1 +
>  meta/recipes-graphics/mesa/mesa-common.inc         |   10 ++++---
>  meta/recipes-graphics/mesa/mesa-dri.inc            |    3 +-
>  meta/recipes-graphics/mesa/mesa-git.inc            |    2 ++
>  ...-gross-hack-to-prevent-from-install-libgl.patch |   29 ++++++++++++++=
++++++
>  5 files changed, 40 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-pr=
event-from-install-libgl.patch
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-8.0.4.inc b/meta/recipes-gra=
phics/mesa/mesa-8.0.4.inc
> index d9d17bb..9afb35d 100644
> --- a/meta/recipes-graphics/mesa/mesa-8.0.4.inc
> +++ b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
> @@ -5,6 +5,7 @@ SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/Mes=
aLib-${PV}.tar.bz2 \
>             file://0002-cross-compile.patch \
>             file://0003-fix-for-x32.patch \
>             "
> +SRC_URI +=3D "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://000=
4-gross-hack-to-prevent-from-install-libgl.patch', d)}"
> =20
>  S =3D "${WORKDIR}/Mesa-${PV}"
> =20
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-gr=
aphics/mesa/mesa-common.inc
> index 7963896..e5e91a3 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -12,14 +12,16 @@ SECTION =3D "x11"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D03ccdc4c379c4289aec=
fb8892c546f67"
> =20
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
>  PE =3D "2"
> =20
> =20
>  PROTO_DEPS =3D "xf86driproto glproto"
> -LIB_DEPS =3D "virtual/libx11 libxext libxxf86vm libxdamage libxfixes lib=
xml2-native"
> +LIB_DEPS +=3D "${@base_contains('DISTRO_FEATURES', 'x11', \
> +             'virtual/libx11 libxext libxxf86vm libxdamage libxfixes', '=
', d)}"
> =20
> -DEPENDS =3D "makedepend-native python-native flex-native bison-native ${=
PROTO_DEPS} ${LIB_DEPS}"
> +DEPENDS =3D "libxml2-native makedepend-native python-native flex-native =
bison-native ${LIB_DEPS}"
> +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'x11', '${PROTO_DEPS}'=
, '', d)}"
> =20
>  PROVIDES =3D "virtual/libgl virtual/libgles2 virtual/egl"
> =20
> @@ -31,8 +33,8 @@ inherit autotools pkgconfig pythonnative
>  EXTRA_OECONF =3D "--enable-glu \
>                  --disable-glw \
>                  --disable-glut \
> -                --enable-glx-tls \
>                  --enable-shared-glapi"
> +EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'x11', '--enable-=
glx-tls', '--disable-glx', d)}"

again DEPENDS + OECONF should be handled by PACKAGECONFIG

>  # Multiple virtual/gl providers being built breaks staging
>  EXCLUDE_FROM_WORLD =3D "1"
> diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graph=
ics/mesa/mesa-dri.inc
> index 0c5682c..4e025a0 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> @@ -8,7 +8,8 @@ DRIDRIVERS =3D "swrast"
>  DRIDRIVERS_append_x86 =3D ",i915,i965"
>  DRIDRIVERS_append_x86-64 =3D ",i915,i965"
> =20
> -EGL_PLATFORMS  =3D "drm,x11"
> +EGL_PLATFORMS  =3D "drm"
> +EGL_PLATFORMS .=3D"${@base_contains('DISTRO_FEATURES', 'x11', ',x11', ''=
, d)}"
> =20
>  EXTRA_OECONF +=3D "--disable-gallium --without-gallium-drivers"
>  EXTRA_OECONF +=3D "--enable-dri --with-dri-drivers=3D${DRIDRIVERS}"
> diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graph=
ics/mesa/mesa-git.inc
> index 32b1d96..7910eb6 100644
> --- a/meta/recipes-graphics/mesa/mesa-git.inc
> +++ b/meta/recipes-graphics/mesa/mesa-git.inc
> @@ -11,6 +11,8 @@ SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/mes=
a;protocol=3Dgit \
>             file://0002-cross-compile.patch \
>             file://0003-fix-for-x32.patch \
>             "
> +SRC_URI +=3D "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://000=
4-gross-hack-to-prevent-from-install-libgl.patch', d)}"
> +
>  S =3D "${WORKDIR}/git"
> =20
>  do_configure_prepend() {
> diff --git a/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-f=
rom-install-libgl.patch b/meta/recipes-graphics/mesa/mesa/0004-gross-hack-t=
o-prevent-from-install-libgl.patch
> new file mode 100644
> index 0000000..cf9dee2
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-ins=
tall-libgl.patch
> @@ -0,0 +1,29 @@
> +gross hack to prevent from install libgl
> +
> +This patch is not suitable for upstream. This is only needed for the 8.0=
=2Ex
> +branch, master (8.1.x) has a largely different build system (using autom=
ake)
> +and does not need it. It is fully expected to drop the patch with the ne=
xt bump
> +to a stable version based on 8.1.x.
> +
> +Upstream-Status: Inappropriate
> +
> +---
> + src/mesa/Makefile |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/mesa/Makefile b/src/mesa/Makefile
> +index 0e15d61..a0a2cb5 100644
> +--- a/src/mesa/Makefile
> ++++ b/src/mesa/Makefile
> +@@ -166,7 +166,7 @@ install: default $(DRICORE_INSTALL_TARGET)
> + 	            else \
> + 	              $(MAKE) install-osmesa || exit 1 ; \
> + 	            fi ;; \
> +-	    dri)    $(MAKE) install-libgl install-dri || exit 1 ;; \
> ++	    dri)    $(MAKE) install-dri || exit 1 ;; \
> + 	    *)      $(MAKE) install-libgl || exit 1 ;; \
> + 	  esac ; \
> + 	done
> +--=20
> +1.7.10.4
> +
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vKFfOv5t3oGVpiF+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAZJWIACgkQN1Ujt2V2gBzIxgCaAlttq4zOnu1gAfzmN1T1n4BG
vcwAniAxp1g0A/7ZusCA1HkQUZ//jf+e
=w+ph
-----END PGP SIGNATURE-----

--vKFfOv5t3oGVpiF+--
