Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C3FC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 19:19:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.1604.1701458371662577366
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 11:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lRnOpnMo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93B921BF203;
	Fri,  1 Dec 2023 19:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701458369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bk1PaBitnuZLOi2ukaSu+CMnauQtNFZYjRYUNWtZleA=;
	b=lRnOpnMo9rp23EK5F2RpsPBNxnlhmKpnnoWyRqasYINMvVEVGCme7+a2HnE5Sg8GmpNVid
	YuPhKvNlaL92HS0BWQBPx512Q+ieJdPZbB2RMRvRsi0Wf6OKaslaxZxT7Eeb/R1AXbM0+g
	AjJ8VMcSDXmiZ+C2j7lMW6RkYvl3KasKrUILrjIRx0X8k5Zt9NLZVjWZi3JfSVfe8QXAep
	M5atwDTBe3+UwnBQ79LxwDVFM/ttLHVWsabtkC/2vWif8dk3TzTDCcYJDYTtWqaE0ftZ1F
	cpTOgTezMj7kWC+3rbNJev1cdOChtb1/76scSUaxEdlNOq1lNONMrEf4Q+jTVw==
Date: Fri, 1 Dec 2023 20:19:29 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv3] pciutils: add packageconfigs for options
Message-ID: <202312011919297a11b0a6@mail.local>
References: <20231127070746.3199347-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127070746.3199347-1-f_l_k@t-online.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 19:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191688

This breaks most of the AB builds because of missing libpci:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6271

In particular:
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4017/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/8258/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/8240/steps/11/logs/stdio

I would appreciate more testing on your side...

On 27/11/2023 08:07:46+0100, Markus Volk wrote:
> My motivation for this is to get zlib support selectable, because
> libosinfo requires the pci.ids file uncompressed. Add packageconfigs for
> the other options as well to avoid autoselect.
> 
> Configuration stays the same besides zlib is deselected by default.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-bsp/pciutils/pciutils_3.10.0.bb | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
> index e27cfd4ced..351dd94778 100644
> --- a/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
> +++ b/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  # Can drop make-native when all systems have make 4.3
>  # https://git.savannah.gnu.org/cgit/make.git/commit/?id=b90fabc8d6f34fb37d428dc0fb1b8b1951a9fbed
>  # causes space issues in lib/libpci.pc
> -DEPENDS = "zlib kmod make-native"
> +DEPENDS = "make-native"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
>             file://configure.patch"
> @@ -18,10 +18,11 @@ SRC_URI[sha256sum] = "238a2e27166730e53a17fe07bfad229e07fa39b618117e5944b6d7eda9
>  
>  inherit multilib_header pkgconfig update-alternatives
>  
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)} dns kmod"
>  PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
> -
> -PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes STRIP= LIBDIR=${libdir}"
> +PACKAGECONFIG[zlib] = "ZLIB=yes,ZLIB=no,zlib"
> +PACKAGECONFIG[kmod] = "LIBKMOD=yes,LIBKMOD=no,kmod"
> +PACKAGECONFIG[dns] = "DNS=yes,DNS=no"
>  
>  # see configure.patch
>  do_configure () {
> @@ -29,7 +30,7 @@ do_configure () {
>  	  cd lib && \
>  	  # PACKAGECONFIG_CONFARGS for this recipe could only possibly contain 'HWDB=yes/no',
>  	  # so we put it before ./configure
> -	  ${PCI_CONF_FLAG} ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
> +	  ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
>  	)
>  }
>  
> @@ -38,7 +39,7 @@ export SBINDIR = "${sbindir}"
>  export SHAREDIR = "${datadir}"
>  export MANDIR = "${mandir}"
>  
> -EXTRA_OEMAKE = "-e MAKEFLAGS= ${PCI_CONF_FLAG}"
> +EXTRA_OEMAKE = "-e MAKEFLAGS='SHARED=yes STRIP= LIBDIR=${libdir}'"
>  
>  ASNEEDED = ""
>  
> -- 
> 2.42.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191260): https://lists.openembedded.org/g/openembedded-core/message/191260
> Mute This Topic: https://lists.openembedded.org/mt/102824927/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

