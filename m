Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9EB60438
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 07:31:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,580,1400018400"; d="scan'208";a="54129209"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 01 Jul 2014 09:31:05 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 1 Jul 2014 09:31:05 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.28]) by
	COSNADEXC12.usr.ingenico.loc ([10.31.4.212]) with mapi id
	14.03.0174.001; Tue, 1 Jul 2014 09:31:05 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] libav: add PACKAGECONFIG for theora,
	libvorbis, speex and openssl
Thread-Index: AQHPlIIChEbEbkHfX0ujM6KFnictOpuK0YeA
Date: Tue, 1 Jul 2014 07:31:05 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050BA1F8247E@COSNADEXC13.usr.ingenico.loc>
References: <1404138201-22662-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<20140630164039.GC2437@jama>
In-Reply-To: <20140630164039.GC2437@jama>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH v2] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
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
X-List-Received-Date: Tue, 01 Jul 2014 07:31:14 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

To summarize the situation:

This v2 patch works fine with an "old" bitbake (keeping the default PACKAGE=
CONFIG).

But if user change PACKAGECONFIG  and adds "faac" or "openssl" (but not bot=
h),
the USE_NONFREE test will fail, so there will be a configure error.

Maybe could I add a comment inside the recipe ?

Regards,
M


-----Message d'origine-----
De=A0: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Envoy=E9=A0: lundi 30 juin 2014 18:41
=C0=A0: Matthieu CRAPET
Cc=A0: openembedded-core@lists.openembedded.org
Objet=A0: Re: [OE-core] [PATCH v2] libav: add PACKAGECONFIG for theora, lib=
vorbis, speex and openssl

On Mon, Jun 30, 2014 at 04:23:21PM +0200, Matthieu Crapet wrote:
> Dropped libvorvis dependency because there is already a (better) builtin =
vorbis codec.
> Don't confuse codec names: "vorbis" (builtin) and "libvorbis" (using exte=
rnal library).
> Changes:
> - add --enable-nonfree when faac or openssl are used
> - add DESCRIPTION
> - sort PACKAGECONFIG entries
>=20
> Tested with libav-0.8.11 & libav-9.13.
>=20
> Note: Be sure to have a recent version of bitbake (2014-06-11 or better) =
including this:
> http://cgit.openembedded.org/bitbake/commit/?id=3D2e742c03e8dfdfa67899e7
> f5d579ed14bd87e139 It affects behavior of bb.utils.contains_any
>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta/recipes-multimedia/libav/libav.inc | 30=20
> ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/libav/libav.inc=20
> b/meta/recipes-multimedia/libav/libav.inc
> index a05a2a6..1d617a2 100644
> --- a/meta/recipes-multimedia/libav/libav.inc
> +++ b/meta/recipes-multimedia/libav/libav.inc
> @@ -1,6 +1,12 @@
> -SUMMARY =3D "A complete, cross-platform solution to record, convert and =
stream audio and video"
> +SUMMARY =3D "Open source audio and video processing tools and librairies=
"
> +DESCRIPTION =3D "Libav is a friendly and community-driven effort to prov=
ide its users \
> +               with a set of portable, functional and high-performance l=
ibraries for \
> +               dealing with multimedia formats of all sorts. It originat=
es from the \
> +               FFmpeg codebase, but goes its own way these days, providi=
ng its users \
> +               with reliable releases and a clear vision how to go forwa=
rd."
>  HOMEPAGE =3D "http://libav.org/"
>  SECTION =3D "libs"
> +
>  LICENSE =3D "GPLv2+"
>  LICENSE_FLAGS =3D "commercial"
> =20
> @@ -9,7 +15,7 @@ PROVIDES =3D "ffmpeg"
> =20
>  ARM_INSTRUCTION_SET =3D "arm"
> =20
> -DEPENDS =3D "zlib libogg libvorbis libtheora yasm-native"
> +DEPENDS =3D "zlib libogg yasm-native"
> =20
>  INC_PR =3D "r8"
> =20
> @@ -23,21 +29,29 @@ BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
>  EXTRA_FFCONF_armv7a =3D "--cpu=3Dcortex-a8"
>  EXTRA_FFCONF ?=3D ""
> =20
> -PACKAGECONFIG ??=3D "bzip2 x264 ${@bb.utils.contains('DISTRO_FEATURES', =
'x11', 'x11', '', d)}"
> -PACKAGECONFIG[jack] =3D "--enable-indev=3Djack,--disable-indev=3Djack,ja=
ck"
> +PACKAGECONFIG ??=3D "bzip2 x264 theora ${@bb.utils.contains('DISTRO_FEAT=
URES', 'x11', 'x11', '', d)}"
>  PACKAGECONFIG[bzip2] =3D "--enable-bzlib,--disable-bzlib,bzip2"
> -PACKAGECONFIG[schroedinger] =3D "--enable-libschroedinger,--disable-libs=
chroedinger,schroedinger"
> +PACKAGECONFIG[faac] =3D "--enable-libfaac,--disable-libfaac,faac"
>  PACKAGECONFIG[gsm] =3D "--enable-libgsm,--disable-libgsm,libgsm"
> -PACKAGECONFIG[x264] =3D "--enable-libx264,--disable-libx264,x264"
> -PACKAGECONFIG[vpx] =3D "--enable-libvpx,--disable-libvpx,libvpx"
> +PACKAGECONFIG[jack] =3D "--enable-indev=3Djack,--disable-indev=3Djack,ja=
ck"
> +PACKAGECONFIG[libvorbis] =3D "--enable-libvorbis,--disable-libvorbis,lib=
vorbis"
>  PACKAGECONFIG[mp3lame] =3D "--enable-libmp3lame,--disable-libmp3lame,lam=
e"
> -PACKAGECONFIG[faac] =3D "--enable-libfaac,--disable-libfaac,faac"
> +PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
> +PACKAGECONFIG[schroedinger] =3D "--enable-libschroedinger,--disable-libs=
chroedinger,schroedinger"
> +PACKAGECONFIG[speex] =3D "--enable-libspeex,--disable-libspeex,speex"
> +PACKAGECONFIG[theora] =3D "--enable-libtheora,--disable-libtheora,libthe=
ora"
> +PACKAGECONFIG[vpx] =3D "--enable-libvpx,--disable-libvpx,libvpx"
>  PACKAGECONFIG[x11] =3D "--enable-x11grab,--disable-x11grab,virtual/libx1=
1 libxfixes libxext xproto virtual/libsdl"
> +PACKAGECONFIG[x264] =3D "--enable-libx264,--disable-libx264,x264"
> +
> +# Check codecs that require --enable-nonfree USE_NONFREE =3D=20
> +"${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes',=
 '', d)}"
> =20
>  EXTRA_OECONF =3D " \
>      --enable-shared \
>      --enable-pthreads \
>      --enable-gpl \
> +    ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree',=20
> + '', d)} \

cannot you just pass --enable-nonfree in faac and openssl PACKAGECONFIG?
In worse case when both are enabled the option will be added twice.

>      --enable-avfilter \
>      \
>      --cross-prefix=3D${TARGET_PREFIX} \
> --
> 2.0.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

