Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id AAFDD76066
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 00:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4BE0F20BFB;
	Wed, 20 Jun 2018 00:38:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gmviV09jJXEG; Wed, 20 Jun 2018 00:38:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 26CDD2088D;
	Wed, 20 Jun 2018 00:38:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 962E21634BF; Tue, 19 Jun 2018 20:38:53 -0400 (EDT)
Date: Tue, 19 Jun 2018 20:38:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20180620003853.GO19965@denix.org>
References: <20180618100538.7431-1-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180618100538.7431-1-ross.burton@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xf86-video-omap: remove
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
X-List-Received-Date: Wed, 20 Jun 2018 00:38:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 18, 2018 at 11:05:38AM +0100, Ross Burton wrote:
> This driver is dead upstream and doesn't appear to provide any advantage over
> upstream kernel drivers and xserver's modesetting support.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../xorg-driver/xf86-video-omap_0.4.5.bb           | 41 ----------------------
>  1 file changed, 41 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
> 
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
> deleted file mode 100644
> index 0430f67b40e..00000000000
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -require xorg-driver-video.inc
> -
> -SUMMARY = "X.Org X server -- Texas Instruments OMAP framebuffer driver"
> -
> -SUMMARY = "X.Org X server -- TI OMAP integrated graphics chipsets driver"
> -
> -DESCRIPTION = "Open-source X.org graphics driver for TI OMAP graphics \
> -Currently relies on a closed-source submodule for EXA acceleration on \
> -the following chipsets: \
> -  + OMAP3430 \
> -  + OMAP3630 \
> -  + OMAP4430 \
> -  + OMAP4460 \
> -  + OMAP5430 \
> -  + OMAP5432 \
> -\
> -NOTE: this driver is work in progress..  you probably don't want to try \
> -and use it yet.  The API/ABI between driver and kernel, and driver and \
> -acceleration submodules is not stable yet.  This driver requires the \
> -omapdrm kernel driver w/ GEM support. \
> -"
> -
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
> -DEPENDS += "virtual/libx11 libdrm xorgproto"
> -
> -SRC_URI[md5sum] = "3b8ea5e8fba63355c0dc6681c49d5fe5"
> -SRC_URI[sha256sum] = "93e7d42107521e61f61980eaea64fb452e87b7b94272e48938ac8d904ccfab5a"
> -
> -CFLAGS += " -I${STAGING_INCDIR}/xorg "
> -
> -# Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
> -do_compile_prepend_armv7a () {
> -        sed -i -e s:fb1:fb2:g ${S}/src/omap_xv.c
> -}
> -
> -python () {
> -    if not bb.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
> -        raise bb.parse.SkipRecipe("'opengl' not in DISTRO_FEATURES")
> -}
> -
> -- 
> 2.11.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

