Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BE7CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 17:36:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.885.1791308189808166986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 10:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7DB5440C85;
	Tue,  6 Oct 2026 17:36:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2m1Q2GrvPKz; Tue,  6 Oct 2026 17:36:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 53229407E5;
	Tue,  6 Oct 2026 17:36:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4935E17EEEC; Tue,  6 Oct 2026 13:36:26 -0400 (EDT)
Date: Tue, 6 Oct 2026 13:36:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][blacksail 04/19] tclibc-baremetal.inc: fix gcc-cross
 EXTRA_OECONF
Message-ID: <20261006173626.GL4190@denix.org>
References: <cover.1791299195.git.yoann.congal@smile.fr>
 <c7176cfee9859ced362f8efea0eff6d830b0b5d5.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7176cfee9859ced362f8efea0eff6d830b0b5d5.1791299195.git.yoann.congal@smile.fr>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 17:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247315

Please don't backport this - there are issues with the change even in master, 
see the original thread.


On Tue, Oct 06, 2026 at 05:45:50PM +0200, Yoann Congal via lists.openembedded.org wrote:
> From: Joerg Vehlow <joerg.vehlow@emlix.com>
> 
> Using EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append created a new override
> for EXTRA_OECONF, which led to almost all EXTRA_OECONF switches to be ignored.
> Furthermore, setting --without-headers here is not required,
> because it is set in gcc-cross.inc.
> 
> Signed-off-by: Joerg Vehlow <joerg.vehlow@emlix.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 020d5f018616bc48eae3a23d5498dec3c78a1386)
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/conf/distro/include/tclibc-baremetal.inc | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
> index abea5a71629..6043cb6654e 100644
> --- a/meta/conf/distro/include/tclibc-baremetal.inc
> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> @@ -18,7 +18,6 @@ USE_NLS ?= "no"
>  IMAGE_LINGUAS = ""
>  LIBC_DEPENDENCIES = ""
>  
> -EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
>  DEPENDS:remove:pn-meta-toolchain = "virtual/libc virtual/compilerlibs"
>  
>  # certain compiler libs cannot be used without libc, avoid the dependence on compilerlibs

