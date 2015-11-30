Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 04FDB60761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 12:39:44 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so154515868wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 04:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=304R44cM4PS7ILaB2ck83uuchC2XZgMlCCxvjGS2CbQ=;
	b=aIhS9aiM5qFMxA02FRZ6KXHadMzymSFasvlwuRiNB7U9U2IMKM4y3KgPjU13k34ND8
	skzEHF4C8kOhnbbmaxMNfEghVsTUP9lkOc6RnYbeY7C6a0Z7YgvZxb4EG1lzigzii3jx
	EdVtQpdDp81SBpSpgqLDTaLAVz+C3TQPxCe2+N10/Ine4qCymIWZ5y+ZEoOzWzvuVeKX
	IWul+LIJecVm7R3/3kiQFkrxynvgyW/SeI/So2YsjsHJGA3dm3amsTqRcNL+TkToM8LJ
	AtGG4kNVpM2JpczrLDBqziAlJ1dbB/WxblibRPtWs81I3+NQ7Urq5iZBhcPw+kTeCtmA
	2wFA==
X-Received: by 10.28.220.69 with SMTP id t66mr27089216wmg.4.1448887185142;
	Mon, 30 Nov 2015 04:39:45 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gj2sm46457188wjb.40.2015.11.30.04.39.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Nov 2015 04:39:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Nov 2015 13:40:35 +0100
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20151130124035.GA2250@jama>
References: <1448885938-25946-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1448885938-25946-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Mon, 30 Nov 2015 12:39:45 -0000
X-Groupsio-MsgNum: 74123
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2015 at 12:18:58PM +0000, Ross Burton wrote:
> Use PACKAGECONFIG instead of using logic in DEPENDS and EXTRA_OECONF, add=
ing new
> options for PulseAudio, tslib, DirectFB, OpenGL and X11.
>=20
> Disable tslib by default as the kernel event input subsystem is generally=
 used.
>=20
> SDL's OpenGL support requires X11 so check for both x11 and opengl, and m=
erge
> the dependencies.
>=20
> Finally enable native builds.

Why is this needed now?

When it was needed for xbmc it was rejected (and I was carrying this in
my branches since then):
http://patchwork.openembedded.org/patch/63477/
more recently in:
http://patchwork.openembedded.org/patch/105689/

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 31 +++++++++++++--------=
------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes=
-graphics/libsdl/libsdl_1.2.15.bb
> index c0d5c6a..d8a99ef 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -12,13 +12,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7fd8=
3877a8e3ef82b82798ef4"
> =20
>  PROVIDES =3D "virtual/libsdl"
> =20
> -DEPENDS =3D "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'direct=
fb', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/li=
bgl', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx1=
1 libxext libxrandr libxrender', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'libglu=
', '', d)} \
> -           tslib"
> -DEPENDS_class-nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x1=
1', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nati=
vesdk-libxext', '', d)}"
> -
>  PR =3D "r3"
> =20
>  SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
> @@ -42,17 +35,23 @@ EXTRA_OECONF =3D "--disable-static --enable-cdrom --e=
nable-threads --enable-timers
>                  --disable-mintaudio --disable-nasm --disable-video-dga \
>                  --disable-video-fbcon --disable-video-ps2gs --disable-vi=
deo-ps3 \
>                  --disable-xbios --disable-gem --disable-video-dummy \
> -                --enable-input-events --enable-input-tslib --enable-pthr=
eads \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--e=
nable-video-directfb', '--disable-video-directfb', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--ena=
ble-video-opengl', '--disable-video-opengl', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable=
-video-x11', '--disable-video-x11', d)} \
> +                --enable-input-events --enable-pthreads \
>                  --disable-video-svga \
>                  --disable-video-picogui --disable-video-qtopia --enable-=
sdl-dlopen \
> -                --disable-rpath \
> -                --disable-pulseaudio"
> +                --disable-rpath"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'al=
sa', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio',=
 'pulseaudio', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '=
directfb', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'opengl', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',=
 '', d)}"
> =20
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'al=
sa', '', d)}"
> -PACKAGECONFIG[alsa] =3D "--enable-alsa --disable-alsatest,--disable-alsa=
,alsa-lib,"
> +PACKAGECONFIG[alsa] =3D "--enable-alsa --disable-alsatest,--disable-alsa=
,alsa-lib"
> +PACKAGECONFIG[pulseaudio] =3D "--enable-pulseaudio,--disable-pulseaudio,=
pulseaudio"
> +PACKAGECONFIG[tslib] =3D "--enable-input-tslib, --disable-input-tslib, t=
slib"
> +PACKAGECONFIG[directb] =3D "--enable-video-directfb, --disable-video-dir=
ectfb, directfb"
> +PACKAGECONFIG[opengl] =3D "--enable-video-opengl, --disable-video-opengl=
, virtual/libgl libglu"
> +PACKAGECONFIG[x11] =3D "--enable-video-x11, --disable-video-x11, virtual=
/libx11 libxext libxrandr libxrender"
> =20
>  EXTRA_AUTORECONF +=3D "--include=3Dacinclude --exclude=3Dautoheader"
> =20
> @@ -65,4 +64,4 @@ do_configure_prepend() {
>          export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR
>  }
> =20
> -BBCLASSEXTEND =3D "nativesdk"
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZcQ7wACgkQN1Ujt2V2gByB5wCgrZBlMryzniaT2E6FxE92qmWj
AscAn1SrjAbF69hMeDzOcP3Oc9+0LtRl
=7liq
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
