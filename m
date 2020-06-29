Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.19189.1593438600747941363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 06:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49wTPw6Tm6z5tlV;
	Mon, 29 Jun 2020 15:49:56 +0200 (CEST)
Date: Mon, 29 Jun 2020 15:49:55 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Pankaj Vinadrao Joshi <pankaj.vj@exaleapsemi.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Error while building image for core-image-sato for raspberrypi4
Message-ID: <20200629134955.vg322agnlm7jqbdw@qschulz>
References: <DzEc.1593438289211123367.xTUF@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <DzEc.1593438289211123367.xTUF@lists.openembedded.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vinadrao,

On Mon, Jun 29, 2020 at 06:44:49AM -0700, Pankaj  Vinadrao Joshi wrote:
> Hi,
> i am trying build an image for RPI4 using openembedded-core i have added all the necessary layers into buit when i am trying to build an image i am getting following error
> 
> pankaj@exaleap-Inspiron-3584:~/Oe-Raspberrypi4$ bitbake core-image-sato
> NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
> Parsing recipes: 100% |######################################################################################################################################################################| Time: 0:06:47
> Parsing of 2279 .bb files complete (0 cached, 2279 parsed). 3439 targets, 213 skipped, 0 masked, 0 errors.
> ERROR: Nothing PROVIDES 'core-image-sato'
> core-image-sato was skipped: 'hwcodecstools-debug' in IMAGE_FEATURES is not a valid image feature. Valid features: allow-empty-password allow-root-login bash-completion-pkgs dbg-pkgs debug-tweaks dev-pkgs doc doc-pkgs eclipse-debug empty-root-password hwcodecs nfs-client nfs-server package-management post-install-logging ptest-pkgs read-only-rootfs splash src-pkgs ssh-server-dropbear ssh-server-openssh stateless-rootfs staticdev-pkgs tools-debug tools-profile tools-sdk tools-testapps x11 x11-base x11-sato
> 

You probably have a IMAGE_FEATURES_append = "hwcodecs" or _prepend
somewhere. Basically bitbake is concatenating hwcodecs and tools-debug
wrongly (a missing space, for _append a leading space, for _prepend a
trailing one).

So you need to find where this _append or _prepend is and fix it. To
help you with that, use:
bitbake core-image-sato -e

and search for the line starting with IMAGE_FEATURES and read the lines
above, that'll tell you what's being done for this variable and in which
file.

Quentin
