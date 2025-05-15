Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAC5C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 22:54:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.661.1747349660961561838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 15:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 12A0B40800;
	Thu, 15 May 2025 22:54:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhJFzcN8JwCF; Thu, 15 May 2025 22:54:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 779B9407E5;
	Thu, 15 May 2025 22:54:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3A30A168393; Thu, 15 May 2025 18:54:08 -0400 (EDT)
Date: Thu, 15 May 2025 18:54:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: mathieu.dubois-briand@bootlin.com, richard.purdie@linuxfoundation.org,
	ross.burton@arm.com, alex@linutronix.de, otavio@ossystems.com.br,
	kexin.hao@windriver.com, afd@ti.com, detheridge@ti.com,
	reatmon@ti.com, openembedded-core@lists.openembedded.org,
	vijayp@ti.com
Subject: Re: [oe-core][PATCHv4 1/5] libx11: create tmpfile dir for x11
 domain socket
Message-ID: <20250515225408.GW18383@denix.org>
References: <20250515214919.1404453-1-rs@ti.com>
 <20250515214919.1404453-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515214919.1404453-2-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 22:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216715

On Thu, May 15, 2025 at 04:49:15PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Register a tmpfile.d or volatile directory entry for the x11 domain
> socket so this will always be created with the correct permissions.
> 
> Currently some x11 related applications will create this directory if it
> doesn't already exist, but this is not true for everything. In addition,
> if the application in question isn't started as root, it's possible this
> directory can be owned by a non-root user. This isn't an issue by
> itself, but it can potentially lead to problems in a multi-user
> environment.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
> index 5ce5481743..59df95291a 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
> @@ -36,6 +36,19 @@ PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
>  
>  PACKAGES =+ "${PN}-xcb"
>  
> +do_install:append() {
> +	# temporary directory required for x11 domain sockets
> +	if ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'true', 'false', d)}; then
> +		install -d ${D}${libdir}/tmpfiles.d
> +		echo "D! /tmp/.X11-unix 1777 root root 10d" \
> +			> ${D}${libdir}/tmpfiles.d/x11.conf
> +	else
> +		install -d ${D}${sysconfdir}/default/volatiles
> +		echo "d root root 1777 /tmp/.X11-unix none" \
> +			> ${D}${sysconfdir}/default/volatiles/99_x11
> +	fi

Hmm, can we have these as actual files and install them accordingly, instead 
of generating them on the fly? Otherwise it gets harder to modify or adjust 
them downstream.


> +}
> +
>  FILES:${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/Xcms.txt"
>  FILES:${PN}-xcb += "${libdir}/libX11-xcb.so.*"
>  FILES:${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
> -- 
> 2.49.0

