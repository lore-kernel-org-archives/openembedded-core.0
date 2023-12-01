Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29692C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 07:48:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.17833.1701416885613198748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 23:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wav/Plxv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3021E24000C;
	Fri,  1 Dec 2023 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701416883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kh15Zy7cKTOm6BNbdeZUnOPkA7Flt58mStxzv2nV7y8=;
	b=Wav/PlxvxFvHHAfQemYztywG8L2ZS1tDC3ExT06yPoN+cBgp6iU5LK6tLH7AYAAQnTglUN
	qmsK3cVtaxkaooqT5rNb3NwcwOzw+IxhgH8slZdctrdRahgusYDReeAPZjYGp2W763VBND
	hFz8YOwQSjBRo8grcE4iIwwSHDUjON0q6CP1vzN1uSjQRWYQnY0sIfqMxtHudXszD6y8Yz
	idcQJKDJlBZ+D78Nf6/J2QAz3ECGSLxLIu2suNmijzMt2TiUP8XmXPYYsJNtDC98vmk2AD
	UCasRWl6rvc2fOoFNi+w5vk4D4BVD7hURzHjfVfUyButztTE3uMjT4IojBmu4g==
Date: Fri, 1 Dec 2023 08:48:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH v11] vte: Separate out gtk4 pieces of vte into
 individual packages
Message-ID: <2023120107480246bc6385@mail.local>
References: <20231128000701.3180126-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128000701.3180126-1-raj.khem@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 07:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191560

Hello Khem,

The vte upgrade causes librsvg to fail on qemux86-64-x32:
https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/8077/steps/11/logs/stdio

I'm not sure how and I was suspecting other rust changes but I confirmed
this is the 3 patches series as this one was successful:
https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/8083


On 27/11/2023 16:07:01-0800, Khem Raj wrote:
> This avoids adding gtk4 dependencies when image may only desire the gtk3
> pieces of vte.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
> v11: Package Vte-3.91.gir into ${PN}-gtk4-dev
> 
>  meta/recipes-support/vte/vte_0.74.1.bb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/vte/vte_0.74.1.bb b/meta/recipes-support/vte/vte_0.74.1.bb
> index 8a7054a13cd..071f6684644 100644
> --- a/meta/recipes-support/vte/vte_0.74.1.bb
> +++ b/meta/recipes-support/vte/vte_0.74.1.bb
> @@ -36,7 +36,16 @@ PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
>  PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
>  PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
>  
> -PACKAGES =+ "libvte ${PN}-prompt"
> +PACKAGES =+ "libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-prompt"
> +FILES:libvte-gtk4 = "${libdir}/lib*gtk4.so.* ${libdir}/girepository-1.0/Vte-3.91.typelib"
> +FILES:${PN}-gtk4 ="${bindir}/vte-2.91-gtk4"
> +FILES:${PN}-gtk4-dev = "${libdir}/lib*gtk4.so \
> +                        ${libdir}/pkgconfig/vte-2.91-gtk4.pc \
> +                        ${datadir}/gir-1.0/Vte-3.91.gir \
> +                        ${datadir}/vala/vapi/vte-2.91-gtk4.deps \
> +                        ${datadir}/vala/vapi/vte-2.91-gtk4.vapi \
> +                        ${includedir}/vte-2.91-gtk4 \
> +                        "
>  FILES:${PN} +="${systemd_user_unitdir}"
>  FILES:libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
>  FILES:${PN}-prompt = " \
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191330): https://lists.openembedded.org/g/openembedded-core/message/191330
> Mute This Topic: https://lists.openembedded.org/mt/102841833/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

