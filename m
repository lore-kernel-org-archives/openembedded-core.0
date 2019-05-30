Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 61EB87E3FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:05:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45F5rT5tbKz43;
	Thu, 30 May 2019 14:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559217946;
	bh=odxP0vOTdwhyc+Yx+KojGfiifwIKbB/W9zf3AYaWHj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HF1yoEL7QR31BupqOQqNiC/HpDOcTewwJ+nOArccb7wEA9jTivflFD6NcaIGyrB4k
	60MoIA8nOtPcFgaAfLYVsBmt/UXn8qH6O+8PeBQzv1HpKnAQNQi8n/REs23HcQ2U7c
	M9ruvSvamA35zYbbjwHiq8yA4ZdTg52b6c5zctv2j9JbUV4tLGM0lplOtOCV0QLIFX
	cwivYTLgFNlOpCXvseZL+2f/fo3IkdxBb3MuEMHlZOmHKbKkTlyVpSEnNh/OtRHWd2
	vRbOg3hWtAlXqHlo9p35JwNJYQbOgfrH769+616q4cqpoMQxcbka8jVioQxlx5AN8W
	RGuRDkRbBbsAYPzPRUsYVV5xKe0d0r5zgTwNFHSb4vujqBuCD6LvKBLlSwqnr/8uMJ
	jzP/nF13oRdxZpzFRXjBSFKp6K/Hsg7G2zTUtTSWUscvWoLqx2RUY+eSQDH5L/tzvk
	tazBxTGY8Io++rB38HoJwh0Ba1x5opb2V4YgJnDIUp7Npjj1Ibg6mu2c0sElBcc2bd
	xH7eWuN5OJhj711yuGZAd2eBP290xPkR1fsQEQ4G3vef5bDkvV/T4inkQBULdz9GZN
	JT/UKaMYoqUYHeOXfWCcsAOc1Cj7DlFgDd82HVFWTqsVJEA6QpU25UMpzbO5jPixYG
	ncL+YL2OdB3dQX1ZkTRiVQGk=
Date: Thu, 30 May 2019 15:05:43 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190530120543.GC20599@localhost>
References: <1559194340-420777-1-git-send-email-changqing.li@windriver.com>
	<20190530111515.GB20599@localhost>
	<67c4faa0f02f1086c7910499ec4e917a12f090f4.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <67c4faa0f02f1086c7910499ec4e917a12f090f4.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2 V2] add rconflict for systemd/tiny-init
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2019 12:05:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 30, 2019 at 12:40:12PM +0100, Richard Purdie wrote:
> On Thu, 2019-05-30 at 14:15 +0300, Adrian Bunk wrote:
> > On Thu, May 30, 2019 at 01:32:18PM +0800, changqing.li@windriver.com
> > wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > 
> > > Changqing Li (2):
> > >   tiny-init: add rconflicts
> > >   systemd: add rconflicts
> > > ...
> > 
> > I wonder whether the conflicts between init systems could be handled
> > with
> >     RCONFLICTS_${PN} = "${VIRTUAL-RUNTIME_init_manager}"
> > 
> > This would avoid the problem that all n init systems would need 
> > RCONFLICTS with all n-1 other init systems.
> > 
> > In my testing this seems to work with all supported package managers
> > (including the self-conflict not causing problems).
> 
> I think we can support multiple init systems within one package feed,
> at least to some degree.

This should work with either solution, or do I miss anything?

> I'm also very nervous about the self-conflict, 
> I'm surprised that works with all the package managers as I thought I'd
> seen that fail.

In Debian that's a common pattern for exactly this purpose,
see the last section of [1].

> Was that with rootfs construction or just building the
> packages?

rootfs construction with opkg/deb/rpm [2]

> Cheers,
> 
> Richard

cu
Adrian

[1] https://www.debian.org/doc/debian-policy/ch-relationships.html#virtual-packages-provides
[2] with tar rootfs construction is generally impossible

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


