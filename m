Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CB55F6E6FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:54:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31AsHJb015986; Tue, 1 Apr 2014 11:54:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OBxvz1v35sHI; Tue,  1 Apr 2014 11:54:17 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31AsDCf015983
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 11:54:14 +0100
Message-ID: <1396349647.1432.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 01 Apr 2014 11:54:07 +0100
In-Reply-To: <1396336240-9708-1-git-send-email-armccurdy@gmail.com>
References: <1396336240-9708-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsdl: PACKAGECONFIG conversion
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
X-List-Received-Date: Tue, 01 Apr 2014 10:54:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 00:10 -0700, Andre McCurdy wrote:
> General cleanup + make it easier for distros / machines which
> support OpenGL ES only to prevent attempts to build against libgl.
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 30 ++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> index e19c388..f72f74f 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -12,10 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>  
>  PROVIDES = "virtual/libsdl"
>  
> -DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> -           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
> -           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
> -           tslib"
>  DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"

I have a nasty feeling this will break libsdl-native :(

Cheers,

Richard


>  PR = "r3"
> @@ -38,17 +34,31 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
>                  --disable-mintaudio --disable-nasm --disable-video-dga \
>                  --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
>                  --disable-xbios --disable-gem --disable-video-dummy \
> -                --enable-input-events --enable-input-tslib --enable-pthreads \
> -                ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
> -                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
> -                ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
> -                --disable-video-svga \
> +                --enable-input-events --enable-pthreads --disable-video-svga \
>                  --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
>                  --disable-rpath \
>                  --disable-pulseaudio"
>  
> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
> +PACKAGECONFIG_ALSA ?= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
> +PACKAGECONFIG_DIRECTFB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
> +# Warning: "opengl" in DISTRO_FEATURES implies GL and/or GLES but libsdl supports GL only.
> +PACKAGECONFIG_OPENGL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)}"
> +PACKAGECONFIG_TSLIB ?= "tslib"
> +PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +
> +PACKAGECONFIG ?= " \
> +    ${PACKAGECONFIG_ALSA} \
> +    ${PACKAGECONFIG_DIRECTFB} \
> +    ${PACKAGECONFIG_OPENGL} \
> +    ${PACKAGECONFIG_TSLIB} \
> +    ${PACKAGECONFIG_X11} \
> +    "
> +
>  PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
> +PACKAGECONFIG[directfb] = "--enable-video-directfb,--disable-video-directfb,directfb"
> +PACKAGECONFIG[opengl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl libglu"
> +PACKAGECONFIG[tslib] = "--enable-input-tslib,--disable-input-tslib,tslib"
> +PACKAGECONFIG[x11] = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
>  
>  PARALLEL_MAKE = ""
>  
> -- 
> 1.8.1.2
> 



