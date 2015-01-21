Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5CC60670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 19:22:02 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIJ007UJKGNFH61@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 21 Jan 2015 13:22:00 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Kc1larcG c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=6ohNodAXAAAA:8 a=Q4-j1AaZAAAA:8
	a=d2NdlCup5o22426ANDkA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9C5682018E; Wed,
	21 Jan 2015 14:21:59 -0500 (EST)
Date: Wed, 21 Jan 2015 14:21:58 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chunrong Guo <B40290@freescale.com>
Message-id: <20150121192158.GI20639@denix.org>
References: <1418268755-19969-1-git-send-email-B40290@freescale.com>
MIME-version: 1.0
In-reply-to: <1418268755-19969-1-git-send-email-B40290@freescale.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 1/2] uboot-config.bbclass: Allow multiple U-Boot config for machine
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
X-List-Received-Date: Wed, 21 Jan 2015 19:22:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Dec 11, 2014 at 11:32:35AM +0800, Chunrong Guo wrote:
>   This adds support to build multiple U-Boot configs for a machine; this
>   is useful when we have support for different media boots which require
>   different U-Boot configuration (e.g: eMMC and NAND).

Any examples how to use this?

-- 
Denys


> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/classes/uboot-config.bbclass | 37 ++++++++++++++-----------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
> index b467659..cb061af 100644
> --- a/meta/classes/uboot-config.bbclass
> +++ b/meta/classes/uboot-config.bbclass
> @@ -31,28 +31,19 @@ python () {
>          return
>  
>      ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
> -    if len(ubootconfig) > 1:
> -        raise bb.parse.SkipPackage('You can only have a single default for UBOOT_CONFIG.')
> +    if len(ubootconfig) > 0:
> +        for config in ubootconfig:
> +            for f, v in ubootconfigflags.items():
> +                if config == f: 
> +                    items = v.split(',')
> +                    if items[0] and len(items) > 2:
> +                        raise bb.parse.SkipPackage('Only config,images can be specified!')
> +                    d.appendVar('UBOOT_MACHINE', ' ' + items[0])
> +                    # IMAGE_FSTYPES appending
> +                    if len(items) > 1 and items[1]:
> +                        bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
> +                        d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
> +                    break
>      elif len(ubootconfig) == 0:
> -        raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
> -    ubootconfig = ubootconfig[0]
> -
> -    for f, v in ubootconfigflags.items():
> -        items = v.split(',')
> -        if items[0] and len(items) > 2:
> -            raise bb.parse.SkipPackage('Only config,images can be specified!')
> -
> -        if ubootconfig == f:
> -            bb.debug(1, "Setting UBOOT_MACHINE to %s." % items[0])
> -            d.setVar('UBOOT_MACHINE', items[0])
> -
> -            # IMAGE_FSTYPES appending
> -            if len(items) > 1 and items[1]:
> -                bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
> -                d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
> -
> -            # Go out as we found a match!
> -            break
> -    else:
> -        raise bb.parse.SkipPackage("UBOOT_CONFIG %s is not supported" % ubootconfig)
> +       raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
>  }
> -- 
> 1.9.2
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

