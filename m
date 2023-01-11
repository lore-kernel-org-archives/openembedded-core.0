Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1885C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 11:12:59 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.21106.1673435572156192875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 03:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Mi/RAhqk;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EAD4B240004;
	Wed, 11 Jan 2023 11:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673435570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3oB6Ekdb6Fu7U+exSd0fxScNaLKx9fxiDlLtdOi2FNQ=;
	b=Mi/RAhqkvRoOaGRQH/E/HuKbmbqTX/uPGHCIidoOZN3/JSo78Mubpd6u5hw0zxPXNgzji7
	5fGkYRQS1x4pAoTx6IT8DRdl9YGiRmh4SVY3U2dbE7P8Rz6D1LiE+tg/3FssCPvsEXQS9M
	b7powmFDLnoNseFIi6TCXoIxGoVnUIDYPuAKg2EGE32kfiH1l18Kt/s2gjZJgaVbnk5OFV
	4ohwjZq/V6wvktdnfCLi1LwncHIfOaksHLrzIMXfkBQRQtiytChWe8UD/wQg6TXUm8hWU6
	rSHn9yv0bdSDZw1ZXLjbGcTLJosdsWaWxj+4FjShwMpNHnc2n1k/IzBCkfi6VQ==
Date: Wed, 11 Jan 2023 12:12:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] libpng: Enable NEON for aarch64 to enensure
 consistency with arm32.
Message-ID: <Y76ZsYiogumc4V51@mail.local>
References: <1673321469-27718-1-git-send-email-leimaohui@fujitsu.com>
 <Y76ZdCXWCTG2q97I@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y76ZdCXWCTG2q97I@mail.local>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175731

On 11/01/2023 12:11:49+0100, Alexandre Belloni wrote:
> v1 has already been applied and you didn't specify what changed since
> then. Can you rebase?

I'm mistaken, I'll handle this patch.

> 
> On 10/01/2023 11:31:09+0800, leimaohui wrote:
> > NEON is enabled for aarch64 by default, so, to ensure consistency with
> > arm32, reference to libpng-1.6.38/configure, added
> > enable_hardware_optimizations option for aarch64.
> > 
> > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > ---
> >  meta/recipes-multimedia/libpng/libpng_1.6.39.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
> > index d9dcf37..a6c229f 100644
> > --- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
> > +++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
> > @@ -22,7 +22,9 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
> >  inherit autotools binconfig-disabled pkgconfig
> >  
> >  # Work around missing symbols
> > -EXTRA_OECONF:append:class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
> > +ARMNEON = "${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
> > +ARMNEON:aarch64 = "--enable-hardware-optimizations=on"
> > +EXTRA_OECONF += "${ARMNEON}"
> >  
> >  PACKAGES =+ "${PN}-tools"
> >  
> > -- 
> > 1.8.3.1
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#175704): https://lists.openembedded.org/g/openembedded-core/message/175704
> > Mute This Topic: https://lists.openembedded.org/mt/96170221/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

