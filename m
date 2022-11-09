Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CF4C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:48:37 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.233.1668026910346105813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LaTflS2Q;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EBAF2100003;
	Wed,  9 Nov 2022 20:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668026908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxR7/tjw16O2GaQepSRw6Wd+uw28W6vgC+LqzIH1dsk=;
	b=LaTflS2QPCi2nkzCpHXI2pZSYBntDlMMn9yjonMVZ/mh4P9xseLb+JjhyKCdezq4Ir1f9+
	MJwpqUZqjX8yNQycg7K65GjA1t6yluWX1HI9XzdNK014WZgFmm1TePas8YkSabQd0uTxLz
	rE4cCVH/0k/16AJxZ/vq+XTEK3es4E/D4djm56dD4zElSb0YERhhYWf1UdTA/4p6rXB2sg
	ha1LlTQmueceqGo3qR3VPX9xh4vYywBn9dL1Ryq2V+WKB9fUCLqTCKVUc4RK1RCY/EiH4N
	h8R+DmYvvjgPvhJ2KSYt242HT0vbG/RVI+ZcnUahA0IWzTrlwyBGbWQ+aZQabQ==
Date: Wed, 9 Nov 2022 21:48:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maxime =?iso-8859-1?Q?Roussin-B=E9langer?= <maxime.roussinbelanger@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] mesa: fix runpath with native llvm-config in
 target sysroot
Message-ID: <Y2wSG33M67Rgxf/s@mail.local>
References: <20221109030444.2414546-1-maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221109030444.2414546-1-maxime.roussinbelanger@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 20:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173057

Hello,

On 08/11/2022 22:04:44-0500, Maxime Roussin-B�langer wrote:
> From: Maxime Roussin-B�langer <maxime.roussinbelanger@gmail.com>
> 
> llvm-config is copied from native to target sysroot, it shouldn't be
> allowed to use target shared libraries when it loads.
> 
> Remove all runpath so it uses shared library from host system since
> native llvm-config is compiled with hosttools compiler.
> 

I believe this is the cause of:
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/6139/steps/32/logs/stdio

I'm currently checking

> Signed-off-by: Maxime Roussin-B�langer <maxime.roussinbelanger@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 67cfb4f6c1..abc2c3f4c4 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -61,6 +61,7 @@ do_configure:prepend () {
>  	if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ]; then
>  		cp ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_BINDIR}
>  		cp ${STAGING_BINDIR_NATIVE}/llvm-config ${STAGING_BINDIR}
> +		chrpath -d ${STAGING_BINDIR}/llvm-config
>  	fi
>  }
>  
> -- 
> 2.36.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173009): https://lists.openembedded.org/g/openembedded-core/message/173009
> Mute This Topic: https://lists.openembedded.org/mt/94906155/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

