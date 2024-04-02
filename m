Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F94C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 22:08:14 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.1003.1712095691296449678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 15:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RTnKvV6O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13B8FE0004;
	Tue,  2 Apr 2024 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712095689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IFrvtMIKl2SzUI4j1AxLtHQLSEoIfj+9xrNbdxEHrr0=;
	b=RTnKvV6OqhVw1wNtBdAJSD9bPbuQDrz8j9eQ/ZWy5yfEbBk16jg2NbrtI605I1DQ6EsCZ2
	t6slyqW3LbnfRhnAw8eR9AZfKf3rIcot8JJXHmFP7noNdys3NNK8CIeMqwqnFeA1XLerkh
	nak23j8JAUgWv6TEl78wOARZnCJgtoHGEN61i9KFIzLi95NL597YhwVa5rTiE0GI07ll4v
	75E/Gtbg9py0/Auv8r2mSI3S3VckpdFgOSo9XX/+gKBAVK4BsmAeaYokIGwJ3+csJZufI4
	8vBa6UfF5MQQrk6Rt1En19B5liY4baXAfm+7PC8xXhpRagdBjAaLGc1kkExuGQ==
Date: Wed, 3 Apr 2024 00:08:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
	Sundeep.Kokkonda@windriver.com
Subject: Re: [OE-core] [PATCH v2 1/3] binutils-cross-canadian: add gprofng
 package as runtime dependency
Message-ID: <20240402220808fdb5c468@mail.local>
References: <20240329145507.415122-1-Harish.Sadineni@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329145507.415122-1-Harish.Sadineni@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 22:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197882

I believe this causes these failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/8798/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/9202/steps/12/logs/stdio

On 29/03/2024 07:55:05-0700, Sadineni, Harish via lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> 
> In SDK, while running "x86_64-poky-linux-gp-collect-app ./exe" fails to create 'test.1.er' due to missing gprofng configure file in sysconfdir and aborting with below error while generating the profiling data.
> - configuration error: can not find libgp-collector.so. run aborted
> 
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> index 62ebb3f5bc..7f2699089e 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> @@ -30,3 +30,4 @@ do_install () {
>  }
>  
>  BBCLASSEXTEND = ""
> +RDEPENDS:${PN} = "nativesdk-gprofng"
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197632): https://lists.openembedded.org/g/openembedded-core/message/197632
> Mute This Topic: https://lists.openembedded.org/mt/105216924/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

