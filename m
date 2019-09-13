Return-Path: <denis@denix.org>
X-Greylist: delayed 358 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Sep 2019 20:45:05 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id A66DE7ECC7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 20:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 41D6140BFA;
	Fri, 13 Sep 2019 20:39:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zwXVPP_KlRh3; Fri, 13 Sep 2019 20:39:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7B0E540BD4;
	Fri, 13 Sep 2019 20:39:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A7C2173BBA; Fri, 13 Sep 2019 16:39:05 -0400 (EDT)
Date: Fri, 13 Sep 2019 16:39:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Andrew F. Davis" <afd@ti.com>
Message-ID: <20190913203905.GG30018@denix.org>
References: <20190913193614.4882-1-afd@ti.com>
	<20190913193614.4882-4-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190913193614.4882-4-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] weston: Set depends to the virtual needed not explicitly on Mesa
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
X-List-Received-Date: Fri, 13 Sep 2019 20:45:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 13, 2019 at 03:36:14PM -0400, Andrew F. Davis via Openembedded-core wrote:
> The dependency is for EGL and GLES2 libraries. On some systems these
> are not provided by Mesa, list what is actually needed so the system
> can choose the correct provider.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Thanks, we've been carrying a similar change locally for years.

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/recipes-graphics/wayland/weston_7.0.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb b/meta/recipes-graphics/wayland/weston_7.0.0.bb
> index 5d2a9336f3..d17b8391a4 100644
> --- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
> @@ -36,9 +36,9 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
>  # Compositor choices
>  #
>  # Weston on KMS
> -PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/mesa virtual/libgbm mtdev"
> +PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/egl virtual/gles2 virtual/libgbm mtdev"
>  # Weston on Wayland (nested Weston)
> -PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/mesa"
> +PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/egl virtual/gles2"
>  # Weston on X11
>  PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb libxcursor cairo"
>  # Headless Weston
> -- 
> 2.17.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

