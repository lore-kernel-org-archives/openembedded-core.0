Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEECD5B86D
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 09:39:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.11045.1730281135205982844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 02:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=T6o/YQha;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46D67E0005;
	Wed, 30 Oct 2024 09:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730281133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E79D1tP7kraX4XE3V5snGGBVywpXPn6MbAfwla88V6A=;
	b=T6o/YQhaB4nqXHrhWeMWqmdSHUwpCPX6WyripCAqiKoN5AMdV4bZTGHp1iX4aIZymOWgrm
	zYA7KaE1pSZJWoeC/aotUkdyqr8B2tRtffMkLbYVg3qeSG95yvZ9cgngVCAvVSTz6L8l5z
	tjEyNQB0Tad7j7dZXpJ77QWTc4ZdT4mvIkfFkn6wNs/6lbBGRDTGEdv+UgvL1G68XSUX5y
	AAACCSy+NM2JnRufWFwCEAQlL6Dj3jroBZIwLFvtqydnWPZFdih7Vl/Na2VSbEWQvcvbP+
	ZaNHIJZelR1ECcWTHZuqcKqE/YrRE9/j9Lkq6AdRcQsFBCi21SHa5nxTim1Rgg==
Date: Wed, 30 Oct 2024 10:38:51 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lib/package: cleanup objdump invocation when
 scanning for library dependencies
Message-ID: <ZyH-q9xosoqu6FIp@bootlin-mathieu>
Mail-Followup-To: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
References: <20241029161548.2662190-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029161548.2662190-1-ross.burton@arm.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 09:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206546

On Tue, Oct 29, 2024 at 04:15:48PM +0000, Ross Burton wrote:
> Instead of using os.popen() directly, and passing a string then having
> to quote the arguments, use subprocess.run() and pass a list of arguments.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

It seems this breaks a lot of things on the autobuilder, I get lot of
fails like:
FileNotFoundError: [Errno 2] No such file or directory:
'x86_64-poky-linux-objdump'

https://valkyrie.yoctoproject.org/#/builders/78/builds/347/steps/13/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/50/builds/366/steps/11/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/64/builds/306/steps/12/logs/stdio

Can you have a look please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

