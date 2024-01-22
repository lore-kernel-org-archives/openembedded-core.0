Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBF7C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 08:18:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.68753.1705911537353970124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 00:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U/L6cVjv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A145F240005;
	Mon, 22 Jan 2024 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705911535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y/kjI1w4KMSyyQibfpd2veFsrRxZOiJsanTEjrrCj9o=;
	b=U/L6cVjv6bWocVo+J2R2qk52Lo4GY5TSHKxa793/GIov6jerM3GIj1WtbJXe+DPLUEEPUb
	MsQxWSch5+A1qDH/jxcCzuojiPj5o/IJNJvrHom/FYUHZMRlPH2F9jcMwR7Z6zXc4r5x26
	AT6a+iI3B299DUdYxxtKXZPgsHI2hnot1553V3a1RTriyuzOh/yWP5mkJ1TPlvDzhFdx4+
	b9F688xL4JFdtpN6yfhO45nP7h5u9o7O8kX3zf9HlwvIpv03mvNuPT5va0jHEZ4ht+vHuu
	oo0aUIgkzWDmv5DRLzI3rQCkDzrlU2PjvwVHBHpL3C02Qdb7UiCDnUbfmgG31w==
Date: Mon, 22 Jan 2024 09:18:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Message-ID: <2024012208185452e26e37@mail.local>
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2968be9a-c13d-5d98-e1be-d291d0b5b008@windriver.com>
 <2024011918132485b9ba7f@mail.local>
 <202401191814434c0685e2@mail.local>
 <ff3ec5f6-13fc-0468-9a07-09c3226c300b@windriver.com>
 <20240122080452ba0f7ee7@mail.local>
 <78b1e91b-d681-2031-55a3-b622bccb211d@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78b1e91b-d681-2031-55a3-b622bccb211d@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194122

On 22/01/2024 16:15:41+0800, ChenQi wrote:
> On 1/22/24 16:04, Alexandre Belloni wrote:
> > On 22/01/2024 12:38:15+0800, ChenQi wrote:
> > > On 1/20/24 02:14, Alexandre Belloni wrote:
> > > > On 19/01/2024 19:13:25+0100, Alexandre Belloni wrote:
> > > > > On 19/01/2024 11:09:20+0800, Chen Qi via lists.openembedded.org wrote:
> > > > > > What's the status of this patch series?
> > > > > > Is there any issue or concern that I missed?
> > > > > I'm glad you asked, I got this today:
> > > > > 
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466/steps/26/logs/warnings
> > > > and I know you sent a patch for this but it didn't make it yet.
> > > I just double checked with the following settings from the "Sysvinit with
> > > systemd" entry in config.json, there's no warning.
> > > 
> > > DISTRO_FEATURES:append = ' systemd usrmerge'
> > > ROOT_HOME = '/root'
> > > VIRTUAL-RUNTIME_init_manager = 'sysvinit'
> > > 
> > > So I further checked the build's settings.
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466
> > > 
> > > In the second step, "Fetch yocto-autobuilder-helper", I can see the
> > > following logs:
> > > 
> > > HEAD is now at ebb7e65 config.json: Fix syntax errors
> > > 
> > > So the build is not using the latest repo. The latest commit is:
> > This is not correct, it was using the latest commit at the time, the
> > patch was applied after my email.
> > 
> > 
> OK... Do you mean that the warning appeared in autobuilder, and then you
> applied the patch to yocto-autobuilder-helper to make the warning disappear?
> I thought you meant that the warning continued to exist even with the patch.
> 
> To clarify, we can now wait for autobuiler's results and I don't need to do
> anything more, right?

I confirm, no action is needed on your side.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

