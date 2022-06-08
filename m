Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C6DC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 15:02:19 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.7610.1654700529113830494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 08:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YOa02/N1;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 34404100003;
	Wed,  8 Jun 2022 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654700527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w5JvCWKHLvyyLOYHmQOKVrl/R1eNGsL2VRwoZ/GKiKw=;
	b=YOa02/N16SpSQy11UMb1wOw2rmJlDACLsZlRfNNUlZ/Iiuuh83VhGXVt4DtUWRPVxJnPyz
	Lmo/U/+ajJ/AtqfZTRlVgMN22HdkZkemfPo+S2DF7wY9o5mMYrPvm2zTaUgkWNHF4oICM8
	r8Fs2/0W+w2GJluyErB8CCFxL5kXQlhXTfuV8zQ8p8AIGemOTXw9/Z8jHYbwegwqQxt0Gl
	Tn7xj8xubVIunneFYVkQeRRS16UUdiXxKljBD8FZy5FVbMa3GLIVk0ZbGZ0LuyH/IycNbh
	l+A9QGNfJEWQMDzIZLZtRAcnJR5NlD/F3JKtnII2yqSNzIONY3kQzI1JLnJcIQ==
Date: Wed, 8 Jun 2022 17:02:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Paulo Neves" <ptsneves@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 4/5] oeqa/selftest: Add test for shebang
 overflow
Message-ID: <20220608170204.6f40dcd2@booty>
In-Reply-To: <03c367d5-4983-f4cc-1417-4377df3a0ca1@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
	<20220607151123.3588947-1-ptsneves@gmail.com>
	<20220607151123.3588947-4-ptsneves@gmail.com>
	<20220608145305.4be602f2@booty>
	<03c367d5-4983-f4cc-1417-4377df3a0ca1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 15:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166751

On Wed, 8 Jun 2022 16:45:20 +0200
"Paulo Neves" <ptsneves@gmail.com> wrote:

> On 6/8/22 14:53, Luca Ceresoli wrote:
> > Hi Paulo,
> >
> > On Tue,  7 Jun 2022 17:11:22 +0200
> > "Paulo Neves" <ptsneves@gmail.com> wrote:
> >  
> >> Make sure we do not stage any executable with a bigger shebang
> >> than 128. Fixes [1]
> >>
> >> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053
> >>
> >> Signed-off-by: Paulo Neves <ptsneves@gmail.com>  
> > This check seems to be working very well!! It triggered a huge amount
> > of build failures on the autobuilders due to libcheck having a shebang
> > too long in the checkmk script, e.g.:
> >
> > #! /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/x86_64-linux/libcheck-native/0.15.2-r0/recipe-sysroot-native/usr/bin/gawk -f
> >
> > Here are a few logs:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5367/steps/14/logs/errors
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5367/steps/11/logs/errors
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5689/steps/11/logs/errors
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5340/steps/12/logs/errors  
> 
> I am not seeing an immediate way to fix this optimally. The go-to 
> solution to this class of issues is to just make
> the #!/usr/bin/env <interpreter>. The issue is that there is an extra 
> -f, which with /usr/bin/env, will not work. The awk manual also implies 
> this is not optional for standalone scripts. I think we can create a 
> wrapper, or maybe we already have such a wrapper?
> >
> > It would be great if you could add another patch to your series to fix
> > libcheck, and also to do 'bitbake world' to test as many packages as
> > possible before discovering from the autobuilders.  
> It takes quite a while on my computer and often i get out of disk space. 
> I tried asking the linaro guys for a tuxsuite token but no answer yet. 
> If you have some way of getting resources to make builds let me know.

Did you enable rm_work?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

