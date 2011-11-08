Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrFM-0002TB-82
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:22:12 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Nov 2011 11:15:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="82531353"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 08 Nov 2011 11:15:56 -0800
Message-ID: <4EB97FEC.3020602@linux.intel.com>
Date: Tue, 08 Nov 2011 11:15:56 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320675529.git.Martin.Jansa@gmail.com>
	<66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
In-Reply-To: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe-core 1/6] libsdl: enable cdrom, alsa and tslib, disable rpath and add few fixes from meta-oe
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
X-List-Received-Date: Tue, 08 Nov 2011 19:22:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2011 06:19 AM, Martin Jansa wrote:
> * virtual/libsdl is used in sdl.bbclass but nothing was providing it
> * rpath disabled because otherwise libtool and ld try to link against
>    ${libdir}/libdl.so.2 on the host
>    (see OE-classic commit af1a2e0e7626e372f22afbcabf08d9ae6b0d7b01)
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   18 ++++++++++++------
>   1 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> index 6b23344..17a3103 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> @@ -10,10 +10,12 @@ SECTION = "libs"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>
> -DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender"
> +PROVIDES = "virtual/libsdl"
> +
> +DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender alsa-lib tslib"
>   DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
>
Shouldn't the enabling of alsa be based on the DISTRO_FEATURE of alsa?

Sau!

> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
>   	   file://configure_tweak.patch \
> @@ -26,25 +28,29 @@ SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642
>
>   inherit autotools binconfig pkgconfig
>
> -EXTRA_OECONF = "--disable-static --disable-debug --disable-cdrom --enable-threads --enable-timers --enable-endian \
> -                --enable-file --disable-oss --disable-alsa --disable-esd --disable-arts \
> +EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
> +                --enable-file --disable-oss --enable-alsa --disable-esd --disable-arts \
>                   --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
>                   --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
>                   --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
>                   --disable-video-xbios --disable-video-gem --disable-video-dummy \
> -                --enable-input-events --enable-pthreads \
> +                --enable-input-events --enable-input-tslib --enable-pthreads \
>   		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
>   		--disable-video-svga \
> -                --disable-video-picogui --disable-video-qtopia --enable-dlopen"
> +                --disable-video-picogui --disable-video-qtopia --enable-dlopen \
> +                --disable-rpath"
>
>   PARALLEL_MAKE = ""
>
> +EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
> +
>   do_configure_prepend() {
>           # Remove old libtool macros.
>           MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
>           for i in ${MACROS}; do
>                  rm -f acinclude/$i
>           done
> +        export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
>   }
>
>   BBCLASSEXTEND = "nativesdk"


