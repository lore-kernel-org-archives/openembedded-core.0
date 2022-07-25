Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA4BC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 10:47:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.26673.1658746066928528769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 03:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NK43R03d;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A8881C0006;
	Mon, 25 Jul 2022 10:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658746064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FT5cAnZyvyliYlhZhaNoWgUrHezNtmXK+48pvw9gZJ4=;
	b=NK43R03dQb6hVEHPPe/07CcpvqwLtuaL9/9vQX5bEcP3VEYVl5/CHGt8C40sHg6HVh7Ndx
	BMNnbZHboQFk9RFvnCFnKunfOgRx42LQESZNm2JBdW82mPOwkSf27Mkd3sB/psMoOuCP3h
	ROCY8Pk86JnQWPcZCmCy+8s/d2VEA8g2Gu5piQ1pVZSz+C8OxTV8I3h6YfaBxRVR6C09Dj
	uNaqOUEf2Fz9911BCRuM+1NaE0bE857SGdTwJTWfjPXmGSrUhvrO0Xmi76GbcwDBJcVcIG
	u/SwjHMnmiaO4beoTK/BsPSVwXu7ytrnY3S8cZeUSv7llE0mnYKW2QffvCXUFg==
Date: Mon, 25 Jul 2022 12:47:42 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Ross Burton" <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH] zlib: remove historical movement of libz.so
 to /lib
Message-ID: <20220725124742.0e221c53@booty>
In-Reply-To: <20220722111301.2143531-1-ross.burton@arm.com>
References: <20220722111301.2143531-1-ross.burton@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 10:47:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168478

Hi Ross,

On Fri, 22 Jul 2022 12:13:01 +0100
"Ross Burton" <ross.burton@arm.com> wrote:

> Historically there's been a split between /lib for early boot and
> /usr/lib for everything else, but with modern systems this split is
> meaningless and incomplete. If a minimal system for early boot is
> needed, it should be a full minimal system in a initramfs.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

This patch is breaking oe-selftest:

  ERROR: Unable to find any package producing path /lib/libz.so.1
  ...
  AssertionError: False is not true : Could not find zlib library file
 /lib/libz.so.1.* in libz1 package file list: ['/usr/lib/libz.so.1', '/usr/lib/libz.so.1.2.12']

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3880/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3872/steps/14/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

