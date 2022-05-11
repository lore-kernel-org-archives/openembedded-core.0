Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CBCC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 07:38:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8642.1652254679262191184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 00:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U8xw7v2+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 08C3E2000F;
	Wed, 11 May 2022 07:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652254677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wekl6JzXo7zlc3lWjzn5vsqzxsEhcqge/+W9laoVetE=;
	b=U8xw7v2+U4RXSESY3P78OGOEj9rv0QjUNQ27GD3FoSZoTaHdUqcLW4YHsp4eZlq2AuIBbD
	BfK7kChgld2Xe+rni+tDr0/vCYFVx5g3s9Dj82MdveMvHXQ1Kl8ws/QY033YKA8ThU5LAE
	eUFOgCV3S05AFBalJYbA6By8EYDwhQto7P3QeXrU5ARupBdIg1G96Js6T2pJBA3En+Uaeo
	6cGe3FsyVzu3fE4D2yTAHIMrwkNyxK2tBcWXv75RmuG8mmpbkJg10lxCIhSiKzSQ2sqT/J
	SrTFXtKO1VruEjOk3f0RDB06mUQ9Kea0+gq9c15hdGTRYItWR0HFTvVLkAiKtw==
Date: Wed, 11 May 2022 09:37:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] image.bbclass: allow overriding dependency
 on virtual/kernel:do_deploy
Message-ID: <20220511093756.6b0db279@melee>
In-Reply-To: <20220510154327.2436624-1-dmitry.baryshkov@linaro.org>
References: <20220510154327.2436624-1-dmitry.baryshkov@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 07:38:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165489

Hi Dmitry,

Il giorno Tue, 10 May 2022 18:43:27 +0300
"Dmitry Baryshkov" <dbaryshkov@gmail.com> ha scritto:

> From: Dmitry Baryshkov <dbaryshkov@gmail.com>
> 
> Since the commit fe26b2379ecd ("image.bbclass: Depend on
> virtual/kernel:do_deploy"), the image.bbclass made building images
> depend on virtual/kernel. For some images, including small initramfs,
> this is not the case. Allow overriding this dependency in case
> developers knows what they are doing.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
>  - Use the same variable in both lines
>  - Change the var name to KERNEL_DEPLOY_DEPEND as suggested in the
>    revert message.
> 
> ---
>  meta/classes/image.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 7f1f6f80a464..c4051961c030 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -132,7 +132,12 @@ def rootfs_variables(d):
>  
>  do_rootfs[vardeps] += "${@rootfs_variables(d)}"
>  
> -do_build[depends] += "virtual/kernel:do_deploy"
> +# This is needed to have kernel image in DEPLOY_DIR.
> +# This follow many common usecases and user expectations.

Typo: follow -> follows.

I'm taking this patch for testing and I fixed the typo while doing
that. Please fix it on your side in case you need to send another
version.

Kind regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

