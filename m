Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6A2C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 16:02:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.18273.1693238565513335134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 09:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V6UOif/2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB56C24000E;
	Mon, 28 Aug 2023 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693238563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YFrShlohPQpnQL1GW4Aa3f5wl4lmJMy/bTzO5IcdYM=;
	b=V6UOif/2zMbmXUCEocxtMxljBacc0jmDLF6XBSFc1rdmmwg7yisCDd7TT/nrisWn6+MQNI
	zUOArQbhpQiRBsfFAq17t0Qw1eyc148jXpg56nSVmp4KYzojARp6kKdFWksmpfWFi3rqjF
	sMNzcpWBDe0Z/Ybidvc872p48lGcl8viQ4G8rCpX5temBPDZ76NoVzo8BJze4skktY2uMT
	BSM9wi71i6STO+ODJ+jkMFlq2YlArhQdJNf5Xk1am+AZMI+HWoDxK1xgppzdvHAdH6agAH
	Mnp2UnmpxcdgRna3SYswRA/r5JjR7Vcj9ARAU7+pXrJpgWe7quWHNLPV61w/tg==
Date: Mon, 28 Aug 2023 18:02:41 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Ross Burton" <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH] libtraceevent: build with Meson
Message-ID: <20230828180241.6d322d91@booty>
In-Reply-To: <20230827195744.3451852-1-ross.burton@arm.com>
References: <20230827195744.3451852-1-ross.burton@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 16:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186836

Hello,

On Sun, 27 Aug 2023 20:57:44 +0100
"Ross Burton" <ross.burton@arm.com> wrote:

> From: Ross Burton <ross.burton@arm.com>
> 
> After what I presume is the recent kernel upgrade, perf started to fail
> to configure.  This was actually due to libtraceevent racing during its
> build and failing to put one of the .o files into the .so (reminder:
> Make is terrible). This doesn't cause the libtraceevent build to fail so
> once the broken .so is in sstate, it causes all future perf builds to
> fail.
> 
> Instead of rewriting the Makefile rules to fix this race it's easier to
> switch to Meson which doesn't have this sort of problem. However the
> Meson support is pretty new and has some rough edges, so we need a patch
> to make it do the right thing.
> 
> I will submit the libtraceevent fixes upstream shortly.
> 
> [ YOCTO #15201 ]
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

The build I had run and that had been consistently failing has succeeded
after applying this patch!

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

