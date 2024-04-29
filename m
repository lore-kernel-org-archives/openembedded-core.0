Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8035C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 15:21:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.24126.1714404105421957708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 08:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RCixkz9D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF90C240004;
	Mon, 29 Apr 2024 15:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714404103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ieo+NHoNaE72/d923PjVKtNIW0aV4gNI7/akjgAMewI=;
	b=RCixkz9DhZH+jGKZGberQfKQFMuFXba0HeHUE1RC/KDoGQSrJs4iCnpFxaIMQNDSlKzWTt
	d1J4Xl94NS1Q+5h4d/GYhp4qz/o8UxdmZL6SdlBY/p3Uh5DHYlZJF2aByWyJSk2bR4VMVb
	n86UUL8vQDBynRNr+yfDubm4LQ+J1G91JdxM6MMjaXbuLj0RXOi5u5QYe6NJwIkBhaaJa0
	prvEvrQmT0WqeokoEU9ZtlcX6UPlZsteB/3rBkVsm/dlwVPoDPDA+L6G/hRf4C2Rla7Dc7
	c/Y5s1j5aphqQ1V/24GO1DcPN50eF6EtdTnO48hdK4WpKYDzEKJoGLSQxSD+hQ==
Message-ID: <5a6d6cce-e996-47ef-bb3e-92c66939395a@bootlin.com>
Date: Mon, 29 Apr 2024 17:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC][PATCH] oeqa/runtime/cases: new image_upgrade test
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240425154607.566716-1-michael.opdenacker@bootlin.com>
 <34a52efaf6a38753f773d5dd6b3cc4d6fe3c91ec.camel@linuxfoundation.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <34a52efaf6a38753f773d5dd6b3cc4d6fe3c91ec.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 15:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198745

Hi Richard,

Many thanks for your feedback.
I started by implementing Alex Kanavin's suggestions, which are a little 
more specific to get started ;-)

On 4/25/24 at 22:40, Richard Purdie wrote:
> Hi Michael,
>
> At least at a first read and without running it, this does look like a
> reasonable direction. I suspect that anyone else looking at this would
> have a lot of questions about why we'd do it this way but given the
> various constraints, it does make sense to me.
>
> What we do need to think about is how someone else would reuse this as
> currently it is very poky specific. Our aim is to make it easy for
> others to use too. With that in mind:
>
> * We probably want to "tag" this test with something so we can exclude
> it from the normal oe-selftest runs on the autobuilder and allow it to
> run on a per machine basis. There are other oe-selftests we already do
> this with (like toolchain testing or machine specific environment file
> tests).
>
> * The configuration about what to test probably needs to come from the
> distro (i.e. which DISTRO/MACHINE/image combinations).
>
> * We probably need to parameterise it so that a list of images can be
> tested rather than just a single one. I did wonder if we could have it
> dynamically add tests for each image configured.
>
> * We don't want to test on all MACHINE (e.g. qemumips and qemuppc are
> not going to be included).
>
> * We need to find a better way to share the code with autobuilder-
> helper, I don't like duplicating code.

Is there example code somewhere doing something similar, i.e. importing 
code from an external repository?

>
> * The image url code is also highly poky specific. That probably needs
> to come from the poky repository alongside the configuration.

I'm going to submit a new version that doesn't assume any specific URL 
scheme.
More soon.

Thanks,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


