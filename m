Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 517B16067C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 06:33:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAQ6Xmqq009349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 25 Nov 2015 22:33:48 -0800
Received: from [128.224.162.175] (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 25 Nov 2015 22:33:47 -0800
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1447249213-28910-1-git-send-email-ross.burton@intel.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <5656A7C8.7080001@windriver.com>
Date: Thu, 26 Nov 2015 14:33:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447249213-28910-1-git-send-email-ross.burton@intel.com>
X-Originating-IP: [128.224.162.175]
Subject: Re: [PATCH] libsdl2: require GLES when building Wayland support
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
X-List-Received-Date: Thu, 26 Nov 2015 06:33:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross,

I tested this patch and found it also need to add libxkbcommon as a 
dependency in PACKAGECONFIG[wayland]. Otherwise the wayland support 
would skip if libxkbcommon is not built before even if we already enable 
video-wayland.

Reproduce steps:
bitbake libxkbcommon -c clean
bitbake libsdl2 -c cleansstate && bitbake libsdl2

config.log:
[snip]
configure:19347: checking for Wayland support
configure:19357: result: no
[snip]

Thanks,
Yi

在 2015年11月11日 21:40, Ross Burton 写道:
> The Wayland support requires GLES2 to be enabled as otherwise the EGL support
> code in SDL2 isn't enabled.
>
> | In file included from .../SDL2-2.0.3/src/video/wayland/SDL_waylandvideo.c:34:0:
> | .../SDL2-2.0.3/src/video/wayland/SDL_waylandvideo.c: In function 'Wayland_CreateDevice':
> | .../SDL2-2.0.3/src/video/wayland/SDL_waylandopengles.h:38:38: error: 'SDL_EGL_GetSwapInterval' undeclared (first use in this function)
> |  #define Wayland_GLES_GetSwapInterval SDL_EGL_GetSwapInterval
>
> Solve this by adding gles2 to the Wayland PACKAGECONFIG option.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
> index 97f64f3..f138f97 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
> @@ -39,7 +39,7 @@ PACKAGECONFIG ??= " \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>   "
>   PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"


