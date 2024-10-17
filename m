Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB2ED37495
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:39:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.49116.1729172380281643704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 06:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BcNISy0E;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48950240005;
	Thu, 17 Oct 2024 13:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729172378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H0aUMCl0RnwBXF2EpWCTdcrP5MUz/C2BMSc5erMp0JY=;
	b=BcNISy0Ee+aAeVfeZ1H/jgE/EcAHKBFtXG0rMr366uReIidotmcLqUa8lR1fS9cOk/kd7g
	kmJQJ94kK8LLS81rIHHPYyWcwd+7/SUh+J24DL682PaUBIkZBlt+7NOpmUYCgn2/NCBS3C
	IYHeJQfQq00pS04gtAQ7hZt37e3MbyJLBFKYbRe+83MmjPkm0gouywsunN3V0UjYN2QPW1
	MJugeWejRvzN5AuV9hdOt4XOml96fXJUw5egya20mL/WO/xk09+LxdYYS7848HTBk0xebJ
	ytB9vOMPaiq4291ZSMXjinx+j2Qv9uVADn83R9m/g+A82+A9LjABvg9upP8yNA==
Date: Thu, 17 Oct 2024 15:39:36 +0200
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Jinfeng.Wang.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] tzdata&tzcode-native: upgrade 2024a -> 2024b
Message-ID: <ZxESzm1S7pE5c1Xp@bootlin-mathieu>
Mail-Followup-To: Jinfeng.Wang.CN@windriver.com,
	openembedded-core@lists.openembedded.org
References: <20241016084538.3146229-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016084538.3146229-1-jinfeng.wang.cn@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 13:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206026

On Wed, Oct 16, 2024 at 04:45:38PM +0800, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
> From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> 
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>  meta/recipes-extended/timezone/timezone.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Hi Jinfeng,

I tried to apply your patch and got a ptest failure on the autobuilder.
It seems to be related to this timezone update.

AssertionError: 
Failed ptests:
{'glib-2.0': ['glib/gdatetime.test']}

https://valkyrie.yoctoproject.org/#/builders/73/builds/239/steps/13/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/61/builds/240/steps/12/logs/stdio

Looking at the log, I can see this:

GLib:ERROR:/usr/src/debug/glib-2.0/2.82.1/glib/tests/gdatetime.c:2960:test_posix_parse:
assertion failed (g_time_zone_get_abbreviation (tz, 0) == "PST"): ("LMT"
== "PST")
not ok /GTimeZone/posix-parse -
GLib:ERROR:/usr/src/debug/glib-2.0/2.82.1/glib/tests/gdatetime.c:2960:test_posix_parse:
assertion failed (g_time_zone_get_abbreviation (tz, 0) == "PST"): ("LMT"
== "PST")
Bail out!
FAIL: glib/gdatetime.test (Child process killed by signal 6)

https://valkyrie.yocto.io/pub/non-release/20241016-109/testresults/qemux86-64-ptest/glib-2.0.log

Can you have a look please ?

-- 
Mathieu Dubois-briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

