Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id AE51265D35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 15:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4303920B86;
	Fri, 12 May 2017 15:12:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id a2bs6kw8IBDB; Fri, 12 May 2017 15:12:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 165BF207BD;
	Fri, 12 May 2017 15:12:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 952BC1624C1; Fri, 12 May 2017 11:12:26 -0400 (EDT)
Date: Fri, 12 May 2017 11:12:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chunrong Guo <B40290@freescale.com>
Message-ID: <20170512151226.GF28053@denix.org>
References: <1494406033-28833-1-git-send-email-B40290@freescale.com>
	<1494406033-28833-3-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1494406033-28833-3-git-send-email-B40290@freescale.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: chunrong.guo@nxp.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] kernel-fitimage: fix KERNEL_DEVICETREE includes subdirectory issue
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
X-List-Received-Date: Fri, 12 May 2017 15:12:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 10, 2017 at 04:47:13PM +0800, Chunrong Guo wrote:
> From: Chunrong Guo <chunrong.guo@nxp.com>
> 
>     * For example:
>       KERNEL_DEVICETREE ?= "freescale/fsl-ls1046a-rdb.dtb"
> 
>       ${DTB}= "freescale/fsl-ls1046a-rdb.dtb"
> 
>       but only fsl-ls1046a-rdb.dtb  should be used in fit-image.its
> 
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 9fa836f..3171d10 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -346,7 +346,10 @@ fitimage_assemble() {
>  				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
>  				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>  			fi
> -			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
> +                          
> +			DTB=`basename ${DTB}`
> +                        DTB_PATH=`find arch/${ARCH}/boot -name "${DTB}"`

Any way to not use "find" here? Shouldn't KERNEL_DEVICETREE and DTB_PATH 
already give you the full path?


> + 
>  			if [ ! -e "${DTB_PATH}" ]; then
>  				DTB_PATH="arch/${ARCH}/boot/${DTB}"
>  			fi
> -- 
> 1.8.3.2
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

