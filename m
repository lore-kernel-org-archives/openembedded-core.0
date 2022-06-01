Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E237C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 06:39:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.4379.1654065570108415321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 23:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HJcZ5AF1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A27DA6000E;
	Wed,  1 Jun 2022 06:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654065567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q89XWiiz7Ae5CSzsa+aY+PcRtQuHg3zS3rmy+twqLpk=;
	b=HJcZ5AF1UXbZ5yZCpB+uZ/OIheVcDcaKNmIhapl2O+24PuMlxh/kQA7Z+QjP2nXaXo1Qvd
	Gb3XBgjFHXsR5kgEIRiweJzAnQY6i9tUQ84nEeei3d50nUivnetxjbns3boU/Ae6/PS/xg
	CwKz01obGF0Cs1AZRR0m4tBcOoWJjUxmgLmEgugv/veJDn4YIvknv9OdUV+pr4nJSmg3sI
	7egRRPwG14lrx6NInKl1eB9AEqmlU8x5pUEjQCfPqJNxn/qP6cTupBAQJRoc002HiArM6+
	HQkP1mmcH6rdkyVAFnUAA1GEpZwWV13eJ+d8UDryU3l6rrZ8Zw/wG1bdbFezhA==
Date: Wed, 1 Jun 2022 08:39:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: sean.anderson@seco.com
Cc: openembedded-core@lists.openembedded.org, Christophe Chapuis
 <chris.chapuis@gmail.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Martin Jansa
 <Martin.Jansa@gmail.com>, Saul Wold <sgw@linux.intel.com>
Subject: Re: [OE-core] [PATCH] rootfs.py: find .ko.zst kernel modules
Message-ID: <20220601083925.0e12b211@melee>
In-Reply-To: <20220531151052.3667079-1-sean.anderson@seco.com>
References: <20220531151052.3667079-1-sean.anderson@seco.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 06:39:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166354

Hi Sean,

Il giorno Tue, 31 May 2022 11:10:52 -0400
"Sean Anderson via lists.openembedded.org"
<sean.anderson=seco.com@lists.openembedded.org> ha scritto:

> With CONFIG_MODULE_COMPRESS_ZSTD enabled, kernel modules will have a
> .ko.zst extension. This fixes depmod not being run.
> 
> Fixes: 1b696a45ddb ("rootfs.py: Add check for kernel modules before running depmod")

We can't blame this commit done in 2015 for not having implemented
MODULE_COMPRESS_ZSTD, added in the kernel in 2021.

And actually I don't think there is anything to fix here, but rather we
have a feature that was non-existing in the past, now it exists and we
want to support it.

So I'm taking this patch in my testing branch with the 'Fixes:' line
removed.

> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
>  meta/lib/oe/rootfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 98cf3f244d4..61ccf369f12 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -311,7 +311,7 @@ class Rootfs(object, metaclass=ABCMeta):
>      def _check_for_kernel_modules(self, modules_dir):
>          for root, dirs, files in os.walk(modules_dir, topdown=True):
>              for name in files:
> -                found_ko = name.endswith((".ko", ".ko.gz", ".ko.xz"))
> +                found_ko = name.endswith((".ko", ".ko.gz", ".ko.xz", ".ko.zst"))
>                  if found_ko:
>                      return found_ko
>          return False



-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

