Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286EBC46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 23:09:24 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.60979.1674169757680837977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 15:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IelBvQyk;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E9DD1100003;
	Thu, 19 Jan 2023 23:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674169755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HrlFljgil+XmYUZG+DbDLgNxm878il8n1CNnyPan1Eo=;
	b=IelBvQyk8CY/VyVFrYKq6jGlnZqOO4Wrn2YyeqwH4alKHHOtFq76q7zBpnLrpTvQLqWZMu
	Uzcs0oz9xawNX6V108q6828g2lkew6m9ry3IbcRR+X6NpUhRq0MtNT0Ti7yA1VWpVvMda0
	Hep5ci/vkCglnKiiPBTZFLYXCHsuRrzidlLmMikwESvMmkjeX1JYvNxbC7I1PxZuuvNPDl
	pFFJDBUyLm/hF9lHjhmbrXlO5Cp6VU8q0faKaSAMY0T7p/nrbSRV2xQ2buxiGSJU0Gi25m
	P9skmjTJwgnz2r/2fbKTGBcYCSt5TOErQuHmeH4SeHXUzYjdNp9MEmeQe9R4gA==
Date: Fri, 20 Jan 2023 00:09:13 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: luca.ceresoli@bootlin.com, "Peter Kjellerstedt"
 <peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
 GObject Introspection is enabled
Message-ID: <20230120000913.3cec96a7@booty>
In-Reply-To: <173BABCA291B8E2A.14781@lists.openembedded.org>
References: <20230118112759.3909741-1-pkj@axis.com>
	<20230118172227.28bdb930@booty>
	<2c4678f5a769445f90b4759a6d6dd259@axis.com>
	<173BABCA291B8E2A.14781@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 23:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176167

Hi Peter,

On Thu, 19 Jan 2023 10:29:26 +0100
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> Hello Peter,
> 
> On Wed, 18 Jan 2023 22:22:22 +0000
> "Peter Kjellerstedt" <peter.kjellerstedt@axis.com> wrote:
> 
> > > -----Original Message-----
> > > From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Sent: den 18 januari 2023 17:22
> > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > Cc: openembedded-core@lists.openembedded.org; Richard Purdie
> > > <richard.purdie@linuxfoundation.org>
> > > Subject: Re: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
> > > GObject Introspection is enabled
> > > 
> > > Hello Peter,
> > > 
> > > On Wed, 18 Jan 2023 12:27:59 +0100
> > > "Peter Kjellerstedt" <peter.kjellerstedt@axis.com> wrote:
> > >     
> > > > This avoids the following error:
> > > >
> > > >   configure: error: Vala bindings require GObject Introspection
> > > >
> > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>    
> > > 
> > > A different patch [0] to address the same bug is already in my testing
> > > branch and is possibly being merged soon on master by Richard. Can you
> > > please check whether your think your patch is better and let us know?    
> > 
> > I had not seen that patch when I sent mine. I think mine is a little better 
> > since it defines and uses a PACKAGECONFIG for the vala support, which should 
> > make it easier for anyone wanting to, e.g., disable the vala support even if 
> > it is enabled by default.  
> 
> Indeed. I'm replacing Alex's patch with yours in my testing branch in
> order to have both tested. None is on master at the moment.
> 

I'm afraid testing with this patch applied caused lots of autobuilder
failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/6553/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/6551/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/6443/steps/12/logs/stdio
...and more

So I removed it from my testing branch and got the patch by Alex again.
You'd be welcome to send a fixed version of your patch.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

