Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D5ED743EE
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 23:01:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1417.1732143662165338031
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 15:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5F6FC40C1E;
	Wed, 20 Nov 2024 23:01:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MVi2adOa4RWu; Wed, 20 Nov 2024 23:01:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3554140B13;
	Wed, 20 Nov 2024 23:00:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E4D6B1640DF; Wed, 20 Nov 2024 18:00:58 -0500 (EST)
Date: Wed, 20 Nov 2024 18:00:58 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH 1/2] libdisplay-info: add recipe
Message-ID: <20241120230058.GW20070@denix.org>
References: <20241120203005.1802141-1-hiagofranco@gmail.com>
 <20241120203005.1802141-2-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120203005.1802141-2-hiagofranco@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 23:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207491

On Wed, Nov 20, 2024 at 05:30:04PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> libdisplay-info is a EDID and DisplayID library. Goals:
> 
> - Provide a set of high-level, easy-to-use, opinionated functions as
>   well as low-level functions to access detailed information.
> - Simplicity and correctness over performance and resource usage.
> - Well-tested and fuzzed.
> 
> Since commit a16598b038b2 ("backend-drm: make libdisplay-info
> mandatory") from Weston, this library is now mandatory in order to
> build weston 14.0.1 and newer.
> 
> This recipe depends on hwdata-native, which support has been submitted to
> meta-openembedded layer at [1].

OE-Core cannot depend on meta-openembedded and based on the changes being 
submitted, it is a hard dependency and is not optional. If it cannot be made 
optional, hwdata will need to be moved to OE-Core...


> Therefore, add this recipe.
> 
> [1] https://lore.kernel.org/all/20241120160005.8473-1-hiagofranco@gmail.com/
> 
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  meta/conf/distro/include/maintainers.inc             |  1 +
>  .../libdisplay-info/libdisplay-info_0.2.0.bb         | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index d61b88f7de6c..81989506e19c 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -324,6 +324,7 @@ RECIPE_MAINTAINER:pn-libcomps = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-libdaemon = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-libdazzle = "Alexander Kanavin <alex.kanavin@gmail.com>"
> +RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
>  RECIPE_MAINTAINER:pn-libdnf = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
>  RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
> diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
> new file mode 100644
> index 000000000000..b98d2e4452a8
> --- /dev/null
> +++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "EDID and DisplayID library."

A minor nitpick - SUMMARY shouldn't normally have a trailing dot, as the 
default DESCRIPTION will end up with two dots...


> +HOMEPAGE = "https://gitlab.freedesktop.org/emersion/libdisplay-info"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e4426409957080ee0352128354cea2de"
> +DEPENDS = "hwdata-native"
> +
> +SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https"
> +SRCREV = "66b802d05b374cd8f388dc6ad1e7ae4f08cb3300"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig
> -- 
> 2.39.5

