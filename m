Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1QrPpD-0000J8-Dt
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 09:37:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Aug 2011 00:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,355,1309762800"; d="scan'208";a="37355648"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 11 Aug 2011 00:32:27 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 11 Aug 2011 15:31:20 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Thu, 11 Aug 2011 15:31:19 +0800
From: "Xu, Jiajun" <jiajun.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 15:31:17 +0800
Thread-Topic: [OE-core] [PATCH 1/1] libsdl: Add libSDL.so into Sato image
Thread-Index: AcxXWmhXfLUarNQHTtSRL/uwNZ0CGgAnMKww
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D70F765D@shsmsx501.ccr.corp.intel.com>
References: <cover.1312523858.git.jiajun.xu@intel.com>
	<c9f3ca9552ecf8d0c3bd1128ee7a915bfb7776f6.1312523858.git.jiajun.xu@intel.com>
	<1312979842.14274.370.camel@rex>
In-Reply-To: <1312979842.14274.370.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] libsdl: Add libSDL.so into Sato image
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
X-List-Received-Date: Thu, 11 Aug 2011 07:37:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for your suggestions, Richard, Phil.
Just want to double confirm, is it OK if I add a check for "opengl" in DIST=
RO_FEATURES in libsdl.bb? If it's set, we could add virtual/libgl into DEPE=
NDS and RDEPENDS_virtclass-nativesdk, and enable opengl in EXTRA_OECONF.

> Hi Jiajun,
>=20
> On Fri, 2011-08-05 at 14:11 +0800, Jiajun Xu wrote:
>> [YOCTO #883]
>> Some graphics 3D game(urbanterror, openarena) tests need libSDL.so.
>> Change libsdl-nativesdk to libsdl and add it into Sato image.
>>=20
>> Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
>> ---
>>  ...libsdl-nativesdk_1.2.11.bb =3D> libsdl_1.2.11.bb} |   24
>>  ++++++++++++++----- meta/recipes-sato/tasks/task-core-x11-sato.bb    =20
>>  |    3 +- 2 files changed, 19 insertions(+), 8 deletions(-)  rename
>> meta/recipes-graphics/libsdl/{libsdl-nativesdk_1.2.11.bb =3D>
>> libsdl_1.2.11.bb} (67%)
>>=20
>> diff --git a/meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb
>> b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
>> similarity index 67%
>> rename from meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb
>> rename to meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
>> index e64a62e..244b0d8 100644
>> --- a/meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb
>> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
>> @@ -1,23 +1,31 @@
>> -DESCRIPTION =3D "Simple DirectMedia Layer - native Edition"
>> +SUMMARY =3D "Simple DirectMedia Layer"
>> +DESCRIPTION =3D "Simple DirectMedia Layer is a cross-platform
>> +multimedia \ library designed to provide low level access to audio,
>> +keyboard, mouse, \ joystick, 3D hardware via OpenGL, and 2D video
> framebuffer."
>>  HOMEPAGE =3D "http://www.libsdl.org"
>> +BUGTRACKER =3D "http://bugzilla.libsdl.org/"
>> +
>>  SECTION =3D "libs"
>> -LICENSE =3D "LGPLv2.1" -DEPENDS =3D "libx11-nativesdk libxext-nativesdk
>> libxrandr-nativesdk libxrender-nativesdk" -RDEPENDS_${PN} =3D
>> "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk
>> libxext-nativesdk" -PR =3D "r5"
>>=20
>> +LICENSE =3D "LGPLv2.1"
>>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D27818cd7fd83877a8e3ef82b82798ef4"
>>=20
>> +DEPENDS =3D "virtual/libx11 libxext libxrandr libxrender"
>> +RDEPENDS_virtclass-nativesdk =3D "libx11-nativesdk +libxrandr-nativesdk
>> libxrender-nativesdk libxext-nativesdk" + +PR =3D "r6" +
>=20
> As Phil mentioned, we need to ensure we depend on GL here (and only if
> GL is enabled in distro features). The patch is otherwise good.
>=20
> Perhaps resubmit this without the enabling GL but adding the nativesdk
> version, then we can enable GL in a follow up patch?
>=20
> Cheers,
>=20
> Richard
>=20
>>  SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \ 	 =20
>>  file://acinclude.m4 \ 	   file://configure_tweak.patch;patch=3D1 \ 	 =20
>>  file://kernel-asm-page.patch;patch=3D1 " + S =3D "${WORKDIR}/SDL-${PV}"
>> =20
>>  SRC_URI[md5sum] =3D "418b42956b7cd103bfab1b9077ccc149"
>>  SRC_URI[sha256sum] =3D
> "6985823287b224b57390b1c1b6cbc54cc9a7d7757fbf9934ed20754b4cd23730"
>>=20
>> -inherit autotools binconfig pkgconfig nativesdk
>> +inherit autotools binconfig pkgconfig
>>=20
>>  EXTRA_OECONF =3D "--disable-static --disable-debug --disable-cdrom
> --enable-threads --enable-timers --enable-endian \
>>                  --enable-file --disable-oss --disable-alsa
>> --disable-esd --disable-arts \ @@ -25,7 +33,7 @@ EXTRA_OECONF =3D
> "--disable-static --disable-debug --disable-cdrom --enable-thread
>>                  --disable-mintaudio --disable-nasm
>> --enable-video-x11
> --disable-video-dga \
>>                  --disable-video-fbcon --disable-video-directfb
>>                  --disable-video-ps2gs \ --disable-video-xbios
>>                  --disable-video-gem
> --disable-video-dummy \
>> -                --disable-video-opengl --enable-input-events
>> --enable-pthreads \ +                --enable-input-events
>> --enable-pthreads \
>>  		--disable-video-svga \
>>                  --disable-video-picogui --disable-video-qtopia
> --enable-dlopen"
>>=20
>> @@ -34,3 +42,5 @@ PARALLEL_MAKE =3D ""
>>  do_configure_prepend() {
>>  	cp ${WORKDIR}/acinclude.m4 ${S}/acinclude.m4  }
>> +
>> +BBCLASSEXTEND =3D "nativesdk"
>> diff --git a/meta/recipes-sato/tasks/task-core-x11-sato.bb
>> b/meta/recipes-sato/tasks/task-core-x11-sato.bb
>> index cd71077..ed43075 100644
>> --- a/meta/recipes-sato/tasks/task-core-x11-sato.bb
>> +++ b/meta/recipes-sato/tasks/task-core-x11-sato.bb
>> @@ -6,7 +6,7 @@ DESCRIPTION =3D "Sato Tasks for Poky"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
>>=20
> file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de
> 20420"
>> -PR =3D "r30"
>> +PR =3D "r31"
>>=20
>>  PACKAGES =3D "\
>>      task-core-x11-sato \ @@ -33,4 +33,5 @@ RDEPENDS_task-core-x11-sato
>>      =3D "\ gtk-sato-engine \ gthumb \ x11vnc \ +    libsdl \
>>      ${NETWORK_MANAGER}"
>> --
>> 1.7.1
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor
>> e
>=20
>=20
>=20
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Best Regards,
Jiajun



