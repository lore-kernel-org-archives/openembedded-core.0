Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71FFC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 10:03:47 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.5564.1655978622148622370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 03:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VcUQqnhZ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 51E0E20000B;
	Thu, 23 Jun 2022 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655978620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Hqc0UA2vRaHkVVJjfgGYLbLHJFeLFC62fT7y81mrFc=;
	b=VcUQqnhZf5UAN1nUCbv3+fi9M1+s6SZLjPAG7f6UZCvNiqhUWuwwqOVTuHgr2dvsvDOgdu
	kV4u9kpXL9Xrnqy8+3aMjfr6XluBcYN5U8cK2yjRer16ZX+RIClslDoiZczzVudOMBxTM5
	Rm5EnWpOWPc4FnlMfzKxTwQpUl4OaSNtvVXtIP7XNGDKDr3heb3LQSPs48yWlmMqXMGKO+
	SZjLy+kmWLr8WbdCZO3i5j6nJB3m3MNt2nGT5AHh7+NiCh23i3KlDFCZQVD7b5abxSel0z
	hjxfz8UoQKfnnBL+JFmO0LfANxJwnwUCTROiamd0HzKl2EZrt4s3GFGaA1LZpw==
Date: Thu, 23 Jun 2022 12:03:37 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [RFC PATCH 2/6] meta-ide-support: adjust to provide
 (e)SDK experience directly in a yocto build
Message-ID: <20220623120337.28f9cb12@booty>
In-Reply-To: <20220622103312.1098389-3-alex@linutronix.de>
References: <20220622103312.1098389-1-alex@linutronix.de>
	<20220622103312.1098389-3-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 10:03:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167267

Hi Alex,

On Wed, 22 Jun 2022 12:33:08 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> Specifically:
> 1. Add a few more toolchain items to DEPENDS so they're available in the recipe sysroot.
> 2. Use deploy mechanism to place the SDK environment setup file and testdata for testing it
> into the image deploy directory.
> 3. Add ability to run SDK tests via the testsdk class and task. This also requires providing
> a testdata json file.
> 4. Ensure sysroot population always runs, as those items are mean to be picked up
> by 'bitbake build-sysroots' into the unified sysroot.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>


This series is failing on the ABs:

AssertionError: Adding layer meta-mingw changed signatures.
9 signatures changed, initial differences (first hash before, second after):
   meta-ide-support:do_prepare_recipe_sysroot: 8a46421fcb080b73cb27047df1d44a256ccb8115ff5646e8a312a9437d8544dd -> 13c339e339f0e7bd9cd13fcdb28135f37de785dd801e64588e240eced8c1e8c4
      bitbake-diffsigs --task meta-ide-support do_prepare_recipe_sysroot --signature 8a46421fcb080b73cb27047df1d44a256ccb8115ff5646e8a312a9437d8544dd 13c339e339f0e7bd9cd13fcdb28135f37de785dd801e64588e240eced8c1e8c4
      NOTE: Starting bitbake server...
      Taint (by forced/invalidated task) changed from nostamp(uuid4):33106dd5-141b-4115-95b2-69cf0d5d6e2c to nostamp(uuid4):b8a53034-116c-44e6-87a4-744d6c021eb1

Logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/5417/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/5417/steps/17/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

