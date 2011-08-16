Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QtEWp-0008Sk-Gv
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 09:57:39 +0200
Received: by wyf19 with SMTP id 19so4404567wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 00:53:02 -0700 (PDT)
Received: by 10.216.90.19 with SMTP id d19mr2906203wef.35.1313481182383;
	Tue, 16 Aug 2011 00:53:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id j11sm4143957wed.42.2011.08.16.00.53.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 00:53:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <34d0c69915195c65e082c2575dc233716bf9ab57.1313413181.git.jiajun.xu@intel.com>
Date: Tue, 16 Aug 2011 09:52:59 +0200
Message-Id: <21E0E8C4-433D-417B-ADAE-F4D444C9B35C@dominion.thruhere.net>
References: <075afb79207fbd6b862f7821cf5077ffbf0b71c8.1313413181.git.jiajun.xu@intel.com>
	<34d0c69915195c65e082c2575dc233716bf9ab57.1313413181.git.jiajun.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 2/2] libsdl: enable opengl for libsdl
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
X-List-Received-Date: Tue, 16 Aug 2011 07:57:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 aug. 2011, om 15:05 heeft Jiajun Xu het volgende geschreven:

> To enable opengl for libsdl, we need DEPENDS on virtual/libgl. Add a =
check for
> "opengl" in DISTRO_FEATURES and when it's set, "--enable-video-opengl"
> and "virtual/libgl" will be added into EXTRA_CONF and DEPENDS.

Is that really a distro feature? Opengl has always been a machine =
feature in OE, so with this the situation gets a lot worse.


>=20
> Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
> Acked-by: Phil Blundell <philb@gnu.org>
> ---
> meta/recipes-graphics/libsdl/libsdl_1.2.11.bb |    7 ++++---
> 1 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb =
b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
> index 7c1c507..f08077d 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
> @@ -10,10 +10,10 @@ SECTION =3D "libs"
> LICENSE =3D "LGPLv2.1"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D27818cd7fd83877a8e3ef82b82798ef4"
>=20
> -DEPENDS =3D "virtual/libx11 libxext libxrandr libxrender"
> +DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'opengl', =
'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender"
> DEPENDS_virtclass-nativesdk =3D "libx11-nativesdk libxrandr-nativesdk =
libxrender-nativesdk libxext-nativesdk"
>=20
> -PR =3D "r6"
> +PR =3D "r7"
>=20
> SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
> 	   file://acinclude.m4 \
> @@ -33,7 +33,8 @@ EXTRA_OECONF =3D "--disable-static --disable-debug =
--disable-cdrom --enable-thread
>                 --disable-mintaudio --disable-nasm --enable-video-x11 =
--disable-video-dga \
>                 --disable-video-fbcon --disable-video-directfb =
--disable-video-ps2gs \
>                 --disable-video-xbios --disable-video-gem =
--disable-video-dummy \
> -                --disable-video-opengl --enable-input-events =
--enable-pthreads \
> +                --enable-input-events --enable-pthreads \
> +		${@base_contains('DISTRO_FEATURES', 'opengl', =
'--enable-video-opengl', '--disable-video-opengl', d)} \
> 		--disable-video-svga \
>                 --disable-video-picogui --disable-video-qtopia =
--enable-dlopen"
>=20
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



