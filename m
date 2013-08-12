Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6C061222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 17:52:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2013 10:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,863,1367996400"; d="scan'208";a="361480034"
Received: from unknown (HELO [10.255.14.176]) ([10.255.14.176])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2013 10:52:27 -0700
Message-ID: <520920DA.7020506@linux.intel.com>
Date: Mon, 12 Aug 2013 10:52:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1376316560-10880-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1376316560-10880-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cogl: GL/GLX feature cleanup
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
X-List-Received-Date: Mon, 12 Aug 2013 17:52:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2013 07:09 AM, Ross Burton wrote:
> Separate GL and GLX flags don't make sense, as on Linux GL means GLX and GLX
> means GL.
>
> So, default to GLESv2 and GLX if X11 is enabled.  EGL on X11 doesn't have
> feature parity yet so leave it disabled by default.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/cogl/cogl-1.0.inc |   17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
> index c0d410e..c189e95 100644
> --- a/meta/recipes-graphics/cogl/cogl-1.0.inc
> +++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
> @@ -28,16 +28,17 @@ EDEPENDS_WAYLAND = "wayland"
>   ERDEPENDS_GL    = "libgl"
>   ERDEPENDS_GLES2 = "libgles2"
>
> ++# GLESv1 is rarely tested, so disable it

Seems to be a patch issue here with the ++

Sau!


>   EXTRA_OECONF += "--disable-introspection	\
>   	       	 --enable-examples-install	\
>   	       	 --enable-debug		 	\
>   	       	 --disable-gles1		\
>   	    	"
>
> -PACKAGECONFIG[cogl-pango] = "--enable-cogl-pango,--disable-cogl-pango,pango"
> +# OpenGL/GLX
> +PACKAGECONFIG[glx] = "--enable-gl --enable-glx,--disable-gl --disable-glx,${EDEPENDS_GL} ${EDEPENDS_X11},${ERDEPENDS_GL}"
>
> -# GL flavours
> -PACKAGECONFIG[gl] = "--enable-gl,--disable-gl,${EDEPENDS_GL},${ERDEPENDS_GL}"
> +# GLESv2
>   PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,${EDEPENDS_GLES2}, ${ERDEPENDS_GLES2}"
>
>   # EGL backends
> @@ -46,15 +47,15 @@ PACKAGECONFIG[egl-null] = "--enable-null-egl-platform,--disable-null-egl-platfor
>   PACKAGECONFIG[egl-x11] = "--enable-xlib-egl-platform,--disable-xlib-egl-platform,${EDEPENDS_X11}"
>   PACKAGECONFIG[egl-wayland] = "--enable-wayland-egl-platform,--disable-wayland-egl-platform,${EDEPENDS_WAYLAND}"
>
> -# GLX
> -PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,${EDEPENDS_GL} ${EDEPENDS_X11}"
> -
> -# Wayland server-side
> +# Wayland (server-side)
>   PACKAGECONFIG[wayland-server] = "--enable-wayland-egl-server,--disable-wayland-egl-server,${EDEPENDS_WAYLAND}"
>
> +# Support rendering text directly with Pango
> +PACKAGECONFIG[cogl-pango] = "--enable-cogl-pango,--disable-cogl-pango,pango"
> +
>   # Respect the DISTRO_FEATURES to pull in GLX or Wayland as appropriate by
>   # default.
> -PACKAGECONFIG ??= "cogl-pango gl \
> +PACKAGECONFIG ??= "cogl-pango gles2 \
>                      ${@base_contains('DISTRO_FEATURES', 'wayland', 'egl-wayland', '', d)} \
>                      ${@base_contains('DISTRO_FEATURES', 'x11', 'glx', '', d)}"
>
>

