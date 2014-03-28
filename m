Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id BA9CB6BC8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 16:15:15 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3500H2FMGIIYA0@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 28 Mar 2014 11:14:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4857320357; Fri,
	28 Mar 2014 12:14:42 -0400 (EDT)
Date: Fri, 28 Mar 2014 12:14:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20140328161441.GE3370@denix.org>
References: <1396015357-27637-1-git-send-email-otavio@ossystems.com.br>
MIME-version: 1.0
In-reply-to: <1396015357-27637-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston : refactor to identify EGL, cairoglesv2 support
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
X-List-Received-Date: Fri, 28 Mar 2014 16:15:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 28, 2014 at 11:02:37AM -0300, Otavio Salvador wrote:
> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> 
> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-graphics/wayland/weston_1.4.0.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb b/meta/recipes-graphics/wayland/weston_1.4.0.bb
> index e0c354d..5213166 100644
> --- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
> @@ -23,13 +23,12 @@ EXTRA_OECONF = "--enable-setuid-install \
>                  --enable-simple-clients \
>                  --enable-clients \
>                  --enable-demo-clients-install \
> -                --disable-simple-egl-clients \
>                  --disable-libunwind \
>                  --disable-rpi-compositor \
>                  --disable-rdp-compositor"
>  
>  
> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland', '', d)} \
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
>                    "
> @@ -39,7 +38,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev way
>  # Weston on KMS
>  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"
>  # Weston on Wayland (nested Weston)
> -PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl --disable-wayland-compositor,virtual/mesa"
> +PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
>  # Weston on X11
>  PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
>  # Headless Weston
> @@ -50,6 +49,10 @@ PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,ude
>  PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam drm"
>  # VA-API desktop recorder
>  PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
> +# Weston with EGL support
> +PACKAGECONFIG[egl] = "--enable-egl --enable-simple-egl-clients,--disable-egl --disable-simple-egl-clients,virtual/egl"
> +# Weston with cairo glesv2 support
> +PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"

Thanks! This was something I was also looking at recently. I'll give it a shot 
in my testing.

-- 
Denys

>  do_install_append() {
>  	# Weston doesn't need the .la files to load modules, so wipe them
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

