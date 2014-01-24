Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D405B6E8C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 22:21:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jan 2014 14:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,715,1384329600"; d="scan'208";a="444284401"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by orsmga001.jf.intel.com with ESMTP; 24 Jan 2014 14:21:32 -0800
Message-ID: <52E2E76B.4000301@linux.intel.com>
Date: Fri, 24 Jan 2014 14:21:31 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	openembedded-core@lists.openembedded.org
References: <1390478526-12041-1-git-send-email-nicolas.dechesne@linaro.org>
	<1390478526-12041-2-git-send-email-nicolas.dechesne@linaro.org>
In-Reply-To: <1390478526-12041-2-git-send-email-nicolas.dechesne@linaro.org>
Cc: patches@linaro.org
Subject: Re: [PATCH 1/2] libsdl: add PACKAGECONFIG for opengl
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
X-List-Received-Date: Fri, 24 Jan 2014 22:21:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2014 04:02 AM, Nicolas Dechesne wrote:
> As discussed in [1], SDL recipe makes the wrong assumption that
> 'opengl' in DISTRO_FEATURES implies GL/GLX. However 'opengl' could
> also mean GLES/EGL, and the recipe fails to build in such
> situations. So we add a PACKAGECONFIG option for opengl so that the
> build can be made to work on gles/egl with a simple .bbappend.
>
> The default PACKAGECONFIG is set to the same value as previously,
> e.g. 'gl' is enabled if 'opengl' is found in DISTRO_FEATURES.
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2014-January/088735.html
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>   meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> index 4b4ff63..492e228 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>   PROVIDES = "virtual/libsdl"
>
>   DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> -           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
>              ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
>              tslib"
>   DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
> @@ -40,15 +39,22 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
>                   --disable-xbios --disable-gem --disable-video-dummy \
>                   --enable-input-events --enable-input-tslib --enable-pthreads \
>                   ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
> -                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
>                   ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
>                   --disable-video-svga \
>                   --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
>                   --disable-rpath \
>                   --disable-pulseaudio"
>
> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
> +PACKAGECONFIG ??= " \
> +    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
> +"
> +
May need to have PACKAGECONFIG_class-target since this is causing and 
interesting virtual/nativesdk-nativesdk-libsdl  dependency somehow, have 
not looked into it any further yet.

I think the same issue will be in libsdl2

> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libgl' (but virtual:nativesdk:/srv/hdd/poky/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb DEPENDS on or otherwise requires it). Close matches:
>   virtual/nativesdk-libsdl
>   virtual/nativesdk-libc
>   virtual/nativesdk-libintl
> NOTE: Runtime target 'nativesdk-qemu' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['nativesdk-qemu', 'nativesdk-libsdl', 'virtual/nativesdk-nativesdk-libgl']
> NOTE: Runtime target 'nativesdk-packagegroup-sdk-host' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['nativesdk-packagegroup-sdk-host', 'nativesdk-qemu', 'nativesdk-libsdl', 'virtual/nativesdk-nativesdk-libgl']
> ERROR: Required build target 'core-image-minimal' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-minimal', 'nativesdk-packagegroup-sdk-host', 'nativesdk-qemu', 'nativesdk-libsdl', 'virtual/nativesdk-nativesdk-libgl']


Sau!


>   PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
> +# SDL wrongly assumes that opengl means GL/GLX, when using GLES/EGL, do:
> +# PACKAGECONFIG_remove = "gl" in .bbappend
> +# or PACKAGECONFIG_remove_pn-libdsl = "gl" in .conf
> +PACKAGECONFIG[gl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
>
>   PARALLEL_MAKE = ""
>
>

