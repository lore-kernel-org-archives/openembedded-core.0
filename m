Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F809C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 15:42:15 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.10.1668008525039262664
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 07:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bE6qxuMS;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9D0AD24000A;
	Wed,  9 Nov 2022 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668008522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SMt0ajMb3lJ9TJkxD2hDdR+WhKyqsEA0xqXnep/uQXA=;
	b=bE6qxuMSl+A6ekXPl047OADqNLOLC6BJ/PoVEgIPn4g9xjgUfzDvkHtwgZLxEN9VH0Cosf
	emcqr3ribqObrNS5JKXcZc2++jOEC7wRscCuKK1R1Oq9nm6Oo+G6xRe90SIoOnfnM3TrZE
	vDqYAOcp8vRY36g4lLSkCOqPffvY9HsAZMCy6Y58u6JEsMnYCvoGkBdgG1v3oBkXz8nQoP
	qcWkPM0fZjuJfcqhIpg3KT57lyCFONjuGzVdV/7YNjZh0Uq1xu/Fiw/5aemdZXWVYx8EU6
	Sl4RpbOom2WWvWHzLj4PUk9pUdU/zUM4u0mHqyqBBUA2H5TfrsDdZfXsiXz7mA==
Date: Wed, 9 Nov 2022 16:42:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ola x Nilsson <ola.x.nilsson@axis.com>,
	Niko Mauno <niko.mauno@vaisala.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit
 glibc
Message-ID: <Y2vKSQoHb+7DMHcz@mail.local>
References: <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
 <5e84a23b-1111-470c-11fa-a8cc9d32dcf0@vaisala.com>
 <CANNYZj_EO7LRfzGb86D1s=YMB1Vz=1VYVropJo7VGPvsq5_FsA@mail.gmail.com>
 <a0ba0394-c43e-b21a-1a2b-e5a7ea016404@vaisala.com>
 <17259B3874804FB3.24550@lists.openembedded.org>
 <CANNYZj_CZaKxkhmHL3h7sW5i9QNZpAfwnc8ZbcX24oDw82=5dg@mail.gmail.com>
 <jwqcz9xsdah.fsf@axis.com>
 <1725A47F2FC9966F.2170@lists.openembedded.org>
 <jwq4jv9s4zi.fsf@axis.com>
 <CANNYZj8wUXkx2c9zvVEds+FvrA0hGvHyDACsjLRy4zzr28ne-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8wUXkx2c9zvVEds+FvrA0hGvHyDACsjLRy4zzr28ne-g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 15:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173031

On 08/11/2022 19:38:06+0100, Alexander Kanavin wrote:
> Thanks. But: face, meet palm.
> 
> "If _TIME_BITS is undefined, the bit size of time_t is architecture
> dependent. Currently it defaults to 64 bits on most architectures.
> Although it defaults to 32 bits on some traditional architectures
> (i686, ARM), this is planned to change and applications should not
> rely on this. "
> 
> No one needs to know or care about this, they should just set it to 64
> for all targets, break all the badly written userspace and move on.
> 

Note that this may build but not run properly as there is no way to know
whether userspace stores a time_t in an int at some point.

> Anyway, rather than add exceptions all over the core layers, I'd
> suggest that you set it to 64, 'bitbake world' with all of meta-oe,
> then send fixes upstream for everything that breaks. Rinse, repeat.
> Then when the 'planned to change' actually happens we should be ready
> for it.
> 

So we may not be ready unless the rinse/repeat also includes runtime
testing.

On Monday, I was suggesting to RP that we should probably have a poky
distro with _TIME_BITS set to 64 and run that on the autobuilders.
I don't think we can just add the flag and be done and this is a flag
day and may break existing users.
I'm usually getting customers to define their own distro and stop
depending on poky but it is not the case of everyone.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

