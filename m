Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416F1C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 09:24:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.41750.1674120267877346237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 01:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=acrI80zr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E26841BF206;
	Thu, 19 Jan 2023 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674120265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyWKwvHh6XLkDk4kENFauhYmdcTeRmJ3/BImAXxxJR4=;
	b=acrI80zrqDIa/Qbjx1/yq6uvqwAjmAxN1PSzykmlbPMzhw3yfeC2tFyADsjz+krBou8PQG
	0BHJ0qax1HIaTuIYN2yJeZhCwBO6eNfZWAR/NQHMhbawWYeRk2hLckz0KtTfpue/LQVSDQ
	bhvhEwZ9Vym84XPKUsmwmdnqD065O++FyW4gkcrl+/j0gyb/WmHmffO9DeWMAdrL/Aj2Uh
	19i7ZlQ5zFDldbW6Wh3o+2QYQtmjB2+uBPJ4XQNMmnpirrFDq0tCalq6QW3bZyYS9D6iXN
	I+JHLTf5ZdLVh3dcKpdsqxifX6PUOK0saZ0i9nHIjaYqTjzOjg/R+PTJCLpqww==
Date: Thu, 19 Jan 2023 10:24:23 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>, Jan-Simon
 =?UTF-8?Q?M=C3=B6ller?= <jsmoeller@linuxfoundation.org>, Anuj Mittal
 <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
Message-ID: <20230119102423.3493565d@booty>
In-Reply-To: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 09:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176128

Hello Richard,

On Wed, 18 Jan 2023 14:22:19 +0000
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> Currently, whilst patch errors or warnings are shown, the errors don't stop builds.
> The configuration isn't very configurable from WARN_QA and ERROR_QA either.
> 
> This patch:
>  * Uses the standard mechanisms to handle the patch fuzz warnings/errors
>  * Makes Upstream-Status checking configurable from WARN/ERROR_QA
>  * Allows that checking to be used with non-core layers
>  * Makes patch-fuzz an error by default
>  * Enables warnings for missing Upstream-Status in non-core layer patches by default
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/insane.bbclass | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index ada8a7ef4e4..e1295f85392 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -29,11 +29,12 @@
>  WARN_QA ?= " libdir xorg-driver-abi buildpaths \
>              textrel incompatible-license files-invalid \
>              infodir build-deps src-uri-bad symlink-to-sysroot multilib \
> -            invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
> +            invalid-packageconfig host-user-contaminated uppercase-pn \
>              mime mime-xdg unlisted-pkg-lics unhandled-features-check \
>              missing-update-alternatives native-last missing-ptest \
>              license-exists license-no-generic license-syntax license-format \
>              license-incompatible license-file-missing obsolete-license \
> +            patch-status-noncore \

AB testing with this patch applied revealed a few Upstream-Status
warnings:

- 5 in meta-agl-core:
  https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/2272/steps/13/logs/stdio

- 3 in meta-intel:
  https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/3968/steps/13/logs/stdio

Jan-Simon, Anuj, can you look at those patches and maybe fix the Upstream-Status?

Richard, this patch didn't trigger any problems in my test branch. Now
I'm going to remove it from my testing branch in order to avoid
warnings on issues we already know, unless you prefer me too keep it
and ignore the above mentioned warnings until they are fixed in the
respective layers.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

