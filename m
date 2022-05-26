Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52F1C433EF
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 07:35:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.17133.1653550506783871533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 00:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kkmTAL9s;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 68680240005;
	Thu, 26 May 2022 07:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653550504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXrM3lc4/fsT3oVJUZyBVNf1auJvAY07ElOs83BH6qo=;
	b=kkmTAL9stnRkbljAKnhM1mVX09AcKRXcF2Jp3M/D+2t6ZW7UBONIZ+zIeLKOY1aV1P30dY
	VYpfG9/qC6zYg2pZ1F9VOrvRMCMbCxZ8zdOgD3F3gn0fQNajX6QtGMwgQRW67Mi9yNGnzc
	sWHHM2jFZQqalQnBuVWpqRlkA3CMM4unGnLzL8rzyDWWs/MR6KRaEVAl7boHApmPmsTZkr
	KFzC3ywQgT0JGvvLdiMoovod2pd4BC1ido0aV8bnHI1KQP+aju+oNTW9d8R0bIzRo2j99r
	SCUR3DVgmBK0iaKP+S90yEF2gdglVluHcGy0S32gaPEBe2MpFM2XSyEuw5e1Kg==
Date: Thu, 26 May 2022 09:35:01 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-numpy: upgrade 1.22.3 -> 1.22.4
Message-ID: <20220526093501.196960ae@melee>
In-Reply-To: <1653461133-12463-2-git-send-email-wangmy@fujitsu.com>
References: <1653461133-12463-1-git-send-email-wangmy@fujitsu.com>
	<1653461133-12463-2-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 07:35:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166176

Hi wangmy,

Il giorno Wed, 25 May 2022 14:45:31 +0800
"wangmy" <wangmy@fujitsu.com> ha scritto:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

Reproducible builds are failing with this patch applied:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/908/steps/12/logs/stdio

And the reason can be found from here (thanks to Richard for pointing
out):

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220525-95en0ud1/packages/diff-html/

This is because of this line in the numpy code:

https://github.com/numpy/numpy/blob/0eaa40db3a2f6bef26c0d7cc28eacf4f6d461917/numpy/core/code_generators/generate_umath.py#L1220

which leaks the full path to the file.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

