Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2257DC4167B
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 16:26:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.153652.1698683192558653098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 09:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cTK1Tegh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E32E1BF209;
	Mon, 30 Oct 2023 16:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698683189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ie3Y2lkgOt8P1l7O3ZMatvbzmCJ6yAtnFkiy/BQURmM=;
	b=cTK1Tegh7Do+dJWxyG2ktLP6WjXqhiAzY9ioYouiYmYD/WMsqH2IDjidkNzxgOOQCKI5Wv
	DPNb13+iQzmedI8b3TXXwCA0lnJzQPnKQZCp6LqoYNNFaIvmNuY5zNlsg9j+ovXitrz5L2
	Uw6ScJGMWc49rj/dsqWAGLj02qWQZOvNxQmtowrXU1SYYu3A/Lz2ktJMoQW0ejFjp9xRHb
	y+5MWGkGjee496mSJOUDYO5Zpl4jg+CUzGvr+8Hx5u11VJJAYfKL47rIKroSnB3RIPBCpO
	7tJ8aDR7OXwkKopeefoYD2uX0/bt7ytUFBSqRI7mqXQD2jXWw+ZKlX9FYCt4kQ==
Message-ID: <a216f1f9-ced6-49a0-8d04-0f22c112541c@bootlin.com>
Date: Mon, 30 Oct 2023 17:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, nd@arm.com
Subject: Re: [OE-core] [PATCH 3/5] meta-yocto-bsp/conf/machine: remove
 SERIAL_CONSOLES_CHECK
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
References: <20231010123653.166806-1-ross.burton@arm.com>
 <20231010123653.166806-3-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231010123653.166806-3-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 16:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189801

Greetings,

On 10.10.23 at 14:36, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> There's no need for this variable anymore, as all consoles listed in
> SERIAL_CONSOLES are checked for their existence before a getty is
> started.
> ---
>   meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 1 -
>   meta-yocto-bsp/conf/machine/genericx86-64.conf    | 1 -
>   2 files changed, 2 deletions(-)
>
> diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> index 8b67cefef70..9f389711b3b 100644
> --- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> +++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
> @@ -18,7 +18,6 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image kernel-devicetree"
>   do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot virtual/bootloader:do_deploy"
>   
>   SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"
> -SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   
>   PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>   PREFERRED_VERSION_linux-yocto ?= "6.1%"
> diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-yocto-bsp/conf/machine/genericx86-64.conf
> index 14913ea1f15..f19a1c1527c 100644
> --- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
> +++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
> @@ -6,6 +6,5 @@ DEFAULTTUNE ?= "core2-64"
>   require conf/machine/include/x86/tune-core2.inc
>   require conf/machine/include/genericx86-common.inc
>   
> -SERIAL_CONSOLES_CHECK = "ttyS0"
>   #For runqemu
>   QB_SYSTEM_NAME = "qemu-system-x86_64"


Oops, this patch hasn't been taken yet in poky-contrib. Any reason why?
Getting rid of SERIAL_CONSOLES_CHECK for good would allow me to remove 
it from the documentation.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


