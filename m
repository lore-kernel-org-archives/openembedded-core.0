Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwgeL-0004KB-3o
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 23:40:13 +0200
Received: by wibhm11 with SMTP id hm11so3884428wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 14:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XaASh6Cd16xlcWdJMR+MkrDPtqsC91vAA6sQ+x9QaQo=;
	b=dEanmYaDVYYvD1KYLVf6bJlsIh5q5ZveEPdz/yevsNM4/ro5YvJqxTim7odV39R5Tl
	HRE0y1B4rjaxezrVyzSUfI3k+324+PUIv0Okqxx7yaRjMJ3Mr/ZyZpGyHEv0KZdWfhh8
	pv/mpvFaCvWxNxOOFl4lc7dGOIb91jfOpwzTqtLY1nVRl12g2NtEuXHGAqe3i4IBosmN
	pCNJLw68BnFn5AcF/pGs3QP71QnQIKfZ6JlxvYcNPrdBnYw+VTQqhDh8WNjSZHFvI1+e
	5Bne1T7F6/HLZfm1NxCgTLKzCTydegqGHaJOTvFDUzc86xpLixVxv8FvRiAs8QLqzR8m
	PBpw==
Received: by 10.216.237.149 with SMTP id y21mr9746832weq.102.1343856514337;
	Wed, 01 Aug 2012 14:28:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm11706778wiz.9.2012.08.01.14.28.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 14:28:33 -0700 (PDT)
Date: Wed, 1 Aug 2012 23:28:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20120801212835.GK16306@jama.jama.net>
References: <cover.1343835237.git.ross.burton@intel.com>
	<3eb1f36bdbb11d0094a86f865a3b8c910897c9c2.1343835237.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <3eb1f36bdbb11d0094a86f865a3b8c910897c9c2.1343835237.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/11] mesa: respect x11 DISTRO_FEATURE
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
X-List-Received-Date: Wed, 01 Aug 2012 21:40:13 -0000
X-Groupsio-MsgNum: 26722
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F55Y67F01HNW3AgB"
Content-Disposition: inline

--F55Y67F01HNW3AgB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 04:36:36PM +0100, Ross Burton wrote:
> Patch originally by Damien Lespiau <damien.lespiau@intel.com>.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa-8.0.4.inc          |    1 +
>  meta/recipes-graphics/mesa/mesa-common.inc         |   16 ++++++-----
>  meta/recipes-graphics/mesa/mesa-dri.inc            |    4 +--
>  meta/recipes-graphics/mesa/mesa-git.inc            |    2 ++
>  ...-gross-hack-to-prevent-from-install-libgl.patch |   29 ++++++++++++++=
++++++
>  5 files changed, 43 insertions(+), 9 deletions(-)
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
> index e5eb28c..661e76e 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -12,14 +12,10 @@ SECTION =3D "x11"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D03ccdc4c379c4289aec=
fb8892c546f67"
> =20
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
>  PE =3D "2"
> =20
> -
> -PROTO_DEPS =3D "xf86driproto glproto"
> -LIB_DEPS =3D "virtual/libx11 libxext libxxf86vm libxdamage libxfixes lib=
xml2-native"
> -
> -DEPENDS =3D "makedepend-native python-native flex-native bison-native ${=
PROTO_DEPS} ${LIB_DEPS}"
> +DEPENDS =3D "libxml2-native makedepend-native python-native flex-native =
bison-native"
> =20
>  PROVIDES =3D "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/eg=
l"
> =20
> @@ -31,8 +27,14 @@ inherit autotools pkgconfig pythonnative
>  EXTRA_OECONF =3D "--enable-glu \
>                  --disable-glw \
>                  --disable-glut \
> -                --enable-glx-tls \
>                  --enable-shared-glapi"
> +EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'x11', '--enable-=
glx-tls', '--disable-glx', d)}"

^ this line was replaced by PACKAGECONFIG

> +
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'egl', 'egl', '=
', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '',=
 d)}"
> +
> +X11_DEPS =3D "xf86driproto glproto virtual/libx11 libxext libxxf86vm lib=
xdamage libxfixes"
> +PACKAGECONFIG[x11] =3D "--enable-glx-tls,--disable-glx,${X11_DEPS}"
> =20
>  # Multiple virtual/gl providers being built breaks staging
>  EXCLUDE_FROM_WORLD =3D "1"
> diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graph=
ics/mesa/mesa-dri.inc
> index d558f06..35d17a4 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> @@ -8,14 +8,14 @@ DRIDRIVERS =3D "swrast"
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
>  EXTRA_OECONF +=3D "--enable-gles1 --enable-gles2"
>  EXTRA_OECONF +=3D "--enable-gbm"
> =20
> -PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'egl', 'egl', '=
', d)}"

Maybe swap order of x11 DISTRO_FEATURE patch and egl patch for easier revie=
w.

>  PACKAGECONFIG[egl] =3D "--enable-egl --with-egl-platforms=3D${EGL_PLATFO=
RMS}", "--disable-egl"
> =20
>  python populate_packages_prepend() {
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

--F55Y67F01HNW3AgB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAZn4MACgkQN1Ujt2V2gBwW4wCfYnF/lk/QTlFWhSWPRUeRZGIF
bTgAoJihMR6PoFwr1Bufe8lLnRiiMnu/
=qskB
-----END PGP SIGNATURE-----

--F55Y67F01HNW3AgB--
