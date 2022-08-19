Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2008C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 09:36:09 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.1117.1660901764406654891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 02:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=jkh7nBH4;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.66] (dslb-002-205-011-086.002.205.pools.vodafone-ip.de
 [2.205.11.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 736CD84B1F;
	Fri, 19 Aug 2022 11:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1660901762;
	bh=ArrreiQbTXmVWVCdQrx0sNqdGAEs04srLtdacTFzjiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jkh7nBH4PH1UMgA4xyw3oFkgzWJw315pxLY2IPP/c1bkRi6O5o41Hn6AcpTgddDmK
	 qjO0YrWzYRRCC9F1zKBtsYuG01Mh18Cyrxui5eiLNH6AMqxZvbschsLTSs4Hmke2FI
	 7vm1BpcIpz+s8rXkXKvfWoSfEuAqjVmzOeQ4Hb76WieIr0GPtZ7fmsuzfYH/RM1GOe
	 GAqt2vL+FTxJUF82HqxjNhc/WzUxN4g1d51z12CsuZSKnVkgKaemG74ZbUdZpd0EZ+
	 XEZ05iu3E2I1wSv+Cy5wUZxZrcbq93hEz5sw5ZmOhuQ/MY4Cvj87Pd5czGsHghHV7Q
	 qdLc8drCiGWnA==
Message-ID: <6d48f3e4-28c9-848d-9b14-cb5f1950c4ca@denx.de>
Date: Fri, 19 Aug 2022 11:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [OE-core][PATCH] rng-tools: Change "Requires" to "WantedBy" for
 dev-hwrng.device
Content-Language: en-US
To: drew.moseley@gmail.com, openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, dragos.panait@windriver.com
References: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
 <20220815182503.2007534-1-drew@moseleynet.net>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: <20220815182503.2007534-1-drew@moseleynet.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 09:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169618

Hi Dew.

On 2022-08-15 20:25, drew.moseley@gmail.com wrote:
> From: Drew Moseley <drew@moseleynet.net>
> 
> The previous change to remove the dependency on systemd-udev-settle
> caused boot delays at least on qemu. It seems that change required
> a hwrng device but that's not necessarily available on all platforms.
> 
> This changes the "Requires" to a "WantedBy" as modeled after the
> version of this file on Ubuntu 20.04.
> 
> Signed-off-by: Drew Moseley <drew@moseleynet.net>
> ---
>   meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> index 0f50890dcb..b013d95932 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> @@ -3,8 +3,6 @@ Description=Hardware RNG Entropy Gatherer Daemon
>   DefaultDependencies=no
>   After=systemd-udev-settle.service
>   Before=sysinit.target shutdown.target
> -Requires=dev-hwrng.device
> -After=dev-hwrng.device
>   Conflicts=shutdown.target
>   
>   [Service]
> @@ -32,3 +30,4 @@ SystemCallFilter=@system-service
>   
>   [Install]
>   WantedBy=sysinit.target
> +WantedBy=dev-hwrng.device

This looses the order. Have you tried just replacing `Requires` with 
`Wants`. So something like this:


```

Before=sysinit.target shutdown.target
Wants=dev-hwrng.device
After=dev-hwrng.device
Conflicts=shutdown.target

```

If that still would cause the long waiting time on qemu?

I haven't investigated the qemu issue, but maybe qemu just doesn't 
provide a hardware random source? If it doesn't provide a hardware 
random source, then installing rng-tools on there might also not make sense.

Alternatively maybe just adding a start timeout might solve it?

regards,
Claudius

