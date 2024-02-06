Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3F8C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 19:11:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1636.1707246703907063631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 11:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AW4L3zWe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70C66C0008;
	Tue,  6 Feb 2024 19:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707246702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y4fsZH0hCYjczIj/lXizNXBAGVd/xvQ5bIhxbQ+hmgU=;
	b=AW4L3zWep4NaRyXf3XNQUUvowkp5hV8tcVsjOxWt3We8CsFjQM/3km4OBjRYAwH356K21B
	ms7W3zCLhPoSByHqanP2QXF9OjQtS+oZErvJT6DCGq3owtzGoWY4NocA+qkjxhzlM2kWIs
	Ly2ysi5TxGwgOHmq/Jr95uu7kCAXm92S+k70QXRJa9NWA3BAtAdKosFLnKnk1QhAZ+9QUn
	LrMXUtZckGwIUywu7qC+7xhHo9XNeuB5ugtg7I00XzzBwvPWgDx0Hxr5EOxQwcFCxbuwGh
	DNwAcyfBFmTEJx/IsUSD8UE793i+1SOjIvINexh7NSpp9pp0AOzbn4Cr5PpWFw==
Date: Tue, 6 Feb 2024 20:11:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joe.slater@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Subject: Re: [oe-core][PATCH 1/1] qemuboot: predictable network interface
 names
Message-ID: <202402061911421ea0ded3@mail.local>
References: <20240205185608.1497595-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205185608.1497595-1-joe.slater@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 19:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195024

I'm pretty sure this is the cause of those failures:
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6396/steps/14/logs/stdio

On 05/02/2024 10:56:08-0800, Joe Slater via lists.openembedded.org wrote:
> From: Joe Slater <joe.slater@windriver.com>
> 
> Allow interface renaming if 'pni-names' is a distro
> feature.
> 
> We do not add QB_NO_PNI to QB_CMDLINE_IP_SLIRP because
> renaming was never suppressed for slirp.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/classes-recipe/qemuboot.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
> index ff32aac902..4a2a6f1ef5 100644
> --- a/meta/classes-recipe/qemuboot.bbclass
> +++ b/meta/classes-recipe/qemuboot.bbclass
> @@ -101,8 +101,11 @@ QB_DEFAULT_FSTYPE ?= "ext4"
>  QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>  QB_OPT_APPEND ?= ""
>  QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
> +
> +QB_NO_PNI ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', '', 'net.ifnames=0', d)}"
>  QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
> -QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8 net.ifnames=0"
> +QB_CMDLINE_IP_TAP ?= "${QB_NO_PNI} ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8"
> +
>  QB_ROOTFS_EXTRA_OPT ?= ""
>  QB_GRAPHICS ?= ""
>  QB_NFSROOTFS_EXTRA_OPT ?= ""
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194963): https://lists.openembedded.org/g/openembedded-core/message/194963
> Mute This Topic: https://lists.openembedded.org/mt/104182965/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

