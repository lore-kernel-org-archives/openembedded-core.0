Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B144C4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 16:56:25 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.16974.1669827377985688987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 08:56:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cNjisMzD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5155040003;
	Wed, 30 Nov 2022 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669827376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x10lypkCNK8Ai1gjRpUYpWaVPQI60/BIAh0g/BJ1u+Q=;
	b=cNjisMzDM+bguqjBuYlBjDe2GUox6HnfQsLkxUBW76HBGSe77dt/j/oSCsVmqIIDZUDdc0
	NCG+gQTHjdkJR+upo9oaITKkL3bBI3L+GPpAWN1/OCcn2nQJOvcMyGghPy/JLkA3GBx95h
	zx4B0Nb4a4J1SRGEJFN4y0t2QPU9YlBn9d/m1gDt+nx6dT8z97PxZBS7BSlozhe7ybjeWI
	sz/VJXbWYxpcqGfHz+OtvqUpzARFXJBXQQtRF+qJflb+L4ObzCL26DTRA7AP3pRSzOrX95
	7vN6n0DZuThUZV6Dc5casAVe2uu7tZXzutcZerGNv0LyfMxSQE3PgbCOpt/dCA==
Date: Wed, 30 Nov 2022 17:56:14 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Lukasz Majewski <lukma@denx.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [OE-core] [Openembedded-architecture] Y2038 proposal
Message-ID: <Y4eLLpnUKLz+YiwM@mail.local>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
 <bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
 <20221130143604.5a6659dc@wsk>
 <ad2adc6af5026edc201cd3ab3a7b1f129cfdbd57.camel@linuxfoundation.org>
 <D8DC7E4C-58C5-4102-A5B0-20D95FC0C3A9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8DC7E4C-58C5-4102-A5B0-20D95FC0C3A9@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 16:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174026

On 30/11/2022 16:46:17+0000, Ross Burton wrote:
> On 30 Nov 2022, at 14:20, Richard Purdie via lists.yoctoproject.org <richard.purdie=linuxfoundation.org@lists.yoctoproject.org> wrote:
> >>> * Could we optionally disable some of the glibc 32 bit function calls
> >>> to ensure they're not being used? 
> >> 
> >> Could you be more specific here? Would you like to disable some
> >> syscalls?
> > 
> > I'm meaning disabling the 32 bit glibc time functions.
> 
> Some time ago I filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=6803 as Debian has a nice sanity check where it warns if non-LFS glibc functions are used.  I imagine the same logic could be used to check for 32-bit time_t use.
> 

We can simply disable COMPAT_32BIT_TIME in the kernel config.

> Ross

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#58682): https://lists.yoctoproject.org/g/yocto/message/58682
> Mute This Topic: https://lists.yoctoproject.org/mt/95357621/3617179
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

