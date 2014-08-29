Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id C74947054E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 10:18:00 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id B3E4423481
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 12:18:01 +0200 (CEST)
Message-ID: <54005359.6010906@pseudoterminal.org>
Date: Fri, 29 Aug 2014 12:18:01 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1409307382-1835-1-git-send-email-dv@pseudoterminal.org>
In-Reply-To: <1409307382-1835-1-git-send-email-dv@pseudoterminal.org>
Subject: Re: [PATCH v2] libsdl: add packageconfigs for x11, directfb, opengl
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
X-List-Received-Date: Fri, 29 Aug 2014 10:18:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Main change from Martin Jansa's patch is the use of bb.utils.contains 
instead of base_contains,
and that tslib is removed from DEPENDS. This is something I am not 100% 
certain of. Is this the right approach?
(Removing tslib from DEPENDS for nativesdk I mean.)

On 08/29/2014 12:16 PM, Carlos Rafael Giani wrote:
> Also adds special treatment of nativesdk versions to avoid build errors
>
> Adapted from openembedded-core-contrib, commit
> cb921237643be39aa8f44ea4c35d3cfd30f782c0
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>   meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> index e544b60..8a30abc 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -12,11 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>   
>   PROVIDES = "virtual/libsdl"
>   
> -DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
> -           tslib"
> -DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
> +DEPENDS = "tslib"
> +# necessary because there is no nativesdk-tslib
> +DEPENDS_class-nativesdk = ""
>   
>   PR = "r3"
>   
> @@ -42,16 +40,23 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
>                   --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
>                   --disable-xbios --disable-gem --disable-video-dummy \
>                   --enable-input-events --enable-input-tslib --enable-pthreads \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
>                   --disable-video-svga \
>                   --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
>                   --disable-rpath \
>                   --disable-pulseaudio"
>   
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
> -PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +# virtual/libgl-nativesdk is not available
> +PACKAGECONFIG_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
> +                                     ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> +                                     ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[directfb] = "--enable-video-directfb,--disable-video-directfb,directfb"
> +PACKAGECONFIG[opengl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl libglu"
> +PACKAGECONFIG[x11] = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
>   
>   PARALLEL_MAKE = ""
>   


