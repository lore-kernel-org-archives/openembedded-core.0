Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1755.1617241559504751113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 18:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C982440C1C;
	Thu,  1 Apr 2021 01:45:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zyc5NvQczoCP; Thu,  1 Apr 2021 01:45:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A331E40429;
	Thu,  1 Apr 2021 01:45:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 61F22174567; Wed, 31 Mar 2021 21:45:56 -0400 (EDT)
Date: Wed, 31 Mar 2021 21:45:56 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-gl: Use swrast gallium driver
Message-ID: <20210401014556.GQ23013@denix.org>
References: <20210331225051.3823769-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210331225051.3823769-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Khem,

Doesn't seem to help for i.MX platforms (I'm aware of[1][2]).
Which machines have you tried with this fix?

[1] https://github.com/Freescale/meta-freescale/issues/699
[2] https://github.com/Freescale/meta-freescale/pull/702


On Wed, Mar 31, 2021 at 03:50:51PM -0700, Khem Raj wrote:
> Fixes
> ../mesa-21.0.0/meson.build:21:0: ERROR: Options "swrast" are not in allowed choices: "auto, i915, i965, r100, r200, nouveau"
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> index e50782be1c..fc8b4f7504 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> @@ -12,4 +12,4 @@ PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x1
>  PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
>  
>  # When NOT using X11, we need to make sure we have swrast available.
> -DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
> +GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
