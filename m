Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.9203.1592987657401981609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 01:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49sGdx3FG1z5tlM;
	Wed, 24 Jun 2020 10:34:12 +0200 (CEST)
Date: Wed, 24 Jun 2020 10:34:11 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [V2][PATCH] xinit: add rxvt-unicode in RDEPENDS
Message-ID: <20200624083411.vkpks4x6eprheb2d@qschulz>
References: <20200624011700.1451586-1-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200624011700.1451586-1-changqing.li@windriver.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Jun 24, 2020 at 09:17:00AM +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix below error:
> /etc/X11/xinit/xinitrc: line 55: exec: xterm: not found
> 
> by default, xinit will generate /etc/X11/xinit/xinitrc,
> and have below config in it:
> XTERM -geometry 80x50+494+51 &
> XTERM -geometry 80x20+494-0 &
> exec XTERM -geometry 80x66+0+0 -name login
> 
> the default XTERM is xterm, but xterm is in meta-oe,
> use rxvt instead
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-graphics/xorg-app/xinit_1.4.1.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> index c9e28d9bba..ed11830cf2 100644
> --- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> +++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> @@ -19,4 +19,7 @@ SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa
>  
>  EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
>  
> -RDEPENDS_${PN} += "util-linux-mcookie"
> +PACKAGECONFIG ??= "rxvt"
> +PACKAGECONFIG[rxvt] = "--with-xterm=rxvt,,,rxvt-unicode,"

IIRC, no need for the last comma.

> +
> +RDEPENDS_${PN} += "util-linux-mcookie rxvt-unicode"

No need for that last line. If rxvt PACKAGECONFIG is picked, then rxvt-unicode
will be added to RDEPENDS automagically.

Quentin
