Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED427C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 23:29:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.34395.1705447757514727481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 15:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YyPzkez7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56ED41C0003;
	Tue, 16 Jan 2024 23:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705447755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2tYCvzhl+2lzGhA1A6UB8lfqLpeg0SN0dJENOuisEGQ=;
	b=YyPzkez7vbbsS+13D9k4Smvt8bGdDWYIRvhqe88hzgRuHwpuKCO2cm6BX/GfCSM1ECOOry
	a9chCQXVtraia5LFfGkzMqSi7SchwKEEKV98Tfguu4HJ6B65L8Si53DvFU+udDjO/zdoR+
	ecI9VfluTNEM6c7fw87urfUyRkC0pVNbXziz7yrAELkoG8yaY0XaEl95dl3xzlsVTF+jDJ
	+GWG835v8jBpaSCafKxvsQ9i9/iej2y01oiddOPgtjdezxxu7zYqkMm0tSH3j8DuI1KmKK
	RmkKQdA6wgS9LxbcaSgouithD75uCDpa1SfB0/puLRaBXumO9Ah/CVyvEygRWw==
Date: Wed, 17 Jan 2024 00:29:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Simone =?iso-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] classes-global/insane: Add check for
 "virtual/" in RPROVIDES and RDEPENDS
Message-ID: <202401162329150cb039e3@mail.local>
References: <20240114171903.10264-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240114171903.10264-1-simone.p.weiss@posteo.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 23:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193879

Hello,

This causes warnings for meta-aws:

https://autobuilder.yoctoproject.org/typhoon/#/builders/122/builds/3840/steps/12/logs/warnings

On 14/01/2024 17:19:03+0000, Simone Wei� wrote:
> From: Simone Wei� <simone.p.weiss@posteo.com>
> 
> Fixes [YOCTO #14538]
> 
> Recipes shouldn't use "virtual/" in RPROVIDES and RDEPENDS. This was
> addressed already in recipes in meta-oe and oe-core. Add a test for
> this in insane.bbclass to ensure no regressions occur.
> 
> Signed-off-by: Simone Wei� <simone.p.weiss@posteo.com>
> ---
>  meta/classes-global/insane.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index d625fd82f7..9e8e35e0f7 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1606,6 +1606,12 @@ python () {
>      if (d.getVar(d.expand('DEPENDS:${PN}'))):
>          oe.qa.handle_error("pkgvarcheck", "recipe uses DEPENDS:${PN}, should use DEPENDS", d)
>  
> +    # virtual/ is meaningless for those variables
> +    for k in ['RDEPENDS', 'RPROVIDES']:
> +        for var in bb.utils.explode_deps(d.getVar(k + ':' + pn) or ""):
> +            if var.startswith("virtual/"):
> +                bb.warn("%s is set to %s, the substring 'virtual/' holds no meaning in this context. It is suggested to use the 'virtual-' instead." % (k, var))
> +
>      issues = []
>      if (d.getVar('PACKAGES') or "").split():
>          for dep in (d.getVar('QADEPENDS') or "").split():
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193617): https://lists.openembedded.org/g/openembedded-core/message/193617
> Mute This Topic: https://lists.openembedded.org/mt/103722088/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

