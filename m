Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC0BC25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 20:02:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.210567.1698350545470240151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 13:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ERuq+ads;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25D1E40006;
	Thu, 26 Oct 2023 20:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698350543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Fmky6DcEAPmk3CLKFMDUTrmGr3P9CKHQTR/axDOCm4=;
	b=ERuq+adsjWnRwTHDoXt9FHzMBJ18z+CUDLNrKfgRHAxZdZBZdxwmK9foZvAxZrYTiZp5DT
	ExiA2pNRMNDtun5W1G3qWvg1ZVlfRRAMCWTbbzWXF3AL1/7h/V5iPn950vUfeoKm6MdJ5y
	AKwxTsYGXCkx9OvQFNpv9152aKyGibEBwejH/HzRRZv5V4PPXINZ653mrjMG4LXH8/V32q
	nDa7NLpToLescPNIsxvmTbSF3+kiJv7ZSk0HABlbyc8p4ecJbc3GY/DyeIMK9siXETXkdw
	KzYrM4SQGgeMHL9+dO6WXWSCpLzN/QQQ/3QM4v9+NawoEukHlQ/TuvbB4qq2Kw==
Date: Thu, 26 Oct 2023 22:02:21 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
Message-ID: <20231026220221.23f75433@booty>
In-Reply-To: <20231026103320.2751277-1-alex@linutronix.de>
References: <20231026103320.2751277-1-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 20:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189737

Hello Alex,

On Thu, 26 Oct 2023 12:33:18 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> 'bitbake -S printdiff' is a useful diagnostic facility for finding out
> why sstate is not being reused, but until now it had no tests that would
> ensure it works. This commit adds three basic scenarios:
> 
> 1. make a change in a really basic, common recipe that is at the very root
> of dependency trees (quilt-native), and ensure that change is correctly discovered when
> building an image.
> 
> 2. make a change in gcc-source recipe, which is somewhat special
> (operates in work-shared), and ensure that gcc-runtime builds track
> that down as well.
> 
> 3. make a change in base_do_configure() definition from base.bbclass,
> which is not recipe-specific, but affects many basic recipes, and ensure that
> is correctly reported as well.
> 
> The test itself actually runs twice:
> - first against a fully populated build directory, where
> the printdiff code is guaranteed to find the correct previous
> stamp that can be compared with in a predictable manner.
> 
> - then in an empty build directory where the printdiff code
> goes to look in the sstate cache, and so the existence of the
> previous signature can be tested, but not the difference with it
> (what the exact difference would be is unpredictable as the
> sstate cache is indeed shared between many builds).
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../base-do-configure-modified.bbclass        |   3 +
>  .../gcc-source/gcc-source_%.bbappend          |   2 +
>  .../quilt-native/quilt-native_%.bbappend      |   2 +
>  meta/lib/oeqa/selftest/cases/sstatetests.py   | 113 ++++++++++++++++++

Is this different from the series you sent on the 23rd? There is no
vN tag and no ChangeLog, so it's not obvious.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

