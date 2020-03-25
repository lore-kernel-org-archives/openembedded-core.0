Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.19474.1585160493610879404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 11:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D236740B37;
	Wed, 25 Mar 2020 18:21:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1viPqtbdRCC4; Wed, 25 Mar 2020 18:21:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6197740AEE;
	Wed, 25 Mar 2020 18:21:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BEB261718E8; Wed, 25 Mar 2020 14:21:29 -0400 (EDT)
Date: Wed, 25 Mar 2020 14:21:29 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: ross.burton@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
Message-ID: <20200325182129.GD1578@denix.org>
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
MIME-Version: 1.0
In-Reply-To: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2020 at 01:14:47PM -0500, Mark Hatle wrote:
> Trying to build mesa-gl without X11 enabled, results in numerous errors
> about being incorrectly configured, such as:
> 
>   ERROR: Problem encountered: building dri drivers require at least one windowing system or classic osmesa
> 
> After consulting with the author of this recipe, it was clear that it
> was only intended for the X11 use-case, so requring X11 should avoid the
> error message above.

Hmm. That's not good. There are embedded devices that provide EGL/GLES support 
through own stack, but fall back on MESA for full desktop GL support. That's 
been working to some extent even with Wayland and w/o X11. With your change 
that won't be possible any more...

-- 
Denys


> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> index d4b1c1c454..5674c6b1fe 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> @@ -6,5 +6,7 @@ PROVIDES = "virtual/libgl virtual/mesa"
>  
>  S = "${WORKDIR}/mesa-${PV}"
>  
> -PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> -PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +REQUIRED_DISTRO_FEATURE = "x11"
> +
> +PACKAGECONFIG ??= "opengl dri x11"
> +PACKAGECONFIG_class-target = "opengl dri x11"
> -- 
> 2.17.1
> 

> 

