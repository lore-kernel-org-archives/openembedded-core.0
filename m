Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013DCC54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 09:44:17 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.50968.1673516647581506531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 01:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E6vI5DTk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2DED9240002;
	Thu, 12 Jan 2023 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673516645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w2Z+p8ptqQD33d7xHCf6aS+9J1Vj1e4CMYYo+P1MCGE=;
	b=E6vI5DTkzLSdZFRa3hmfLzb4f9eU9IkElRu1zf2F4GqfrfqfRGUUAYd1M6vmPpI6UYz5Fq
	b659gq9kNTuK8u0+AC5T8ZwPV+KGWPwEn6q+PWt1xPGxCmTU4chMjmZUVviaaFLnRV/3j+
	52Mckt1b5YExumQVrozG0sVFF8UnSFKhF2MCK1VObGdt3v3jP6w689V9pu5/2oHCP7S75I
	rMk8cyBFqeCNWUlME7riX7iCHBHXS6jDZY2DtDyt2zmCcS0ywR65Rjpqu7+V3AvC9J7idM
	c9toWMqFrHbzKNnJHzwOM5XhTa6y5M388il/yCD6ZWYPrtf7vncsCSA3f4IR+A==
Date: Thu, 12 Jan 2023 10:44:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] baremetal-helloworld: Move from skeleton
 to recipes-extended matching what rust-hello-world is doing
Message-ID: <Y7/WZCgHCr+/neFu@mail.local>
References: <20230112043444.900323-1-alejandro@enedino.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112043444.900323-1-alejandro@enedino.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 09:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175789

Hello,

I'm taking that one but please:
 - version your patches properly, this should be v2
 - resend the whole series everytime, else I need to go back and fish
   out the previous patches. This is error prone and time consuming.

Thanks!

On 11/01/2023 21:34:44-0700, Alejandro Hernandez Samaniego wrote:
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  meta/conf/distro/include/maintainers.inc                         | 1 +
>  .../baremetal-example}/baremetal-helloworld_git.bb               | 1 +
>  2 files changed, 2 insertions(+)
>  rename {meta-skeleton/recipes-baremetal/baremetal-examples => meta/recipes-extended/baremetal-example}/baremetal-helloworld_git.bb (99%)
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 508d10e091..8c2201c91b 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -54,6 +54,7 @@ RECIPE_MAINTAINER:pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-babeltrace2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
> +RECIPE_MAINTAINER:pn-baremetal-helloworld = "Alejandro Hernandez <alejandro@enedino.org>"
>  RECIPE_MAINTAINER:pn-base-files = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
> diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> similarity index 99%
> rename from meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> rename to meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> index fede17b0f0..82b2901d51 100644
> --- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> +++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> @@ -8,6 +8,7 @@ SRCREV = "22016ecbb9fb6c5f3a7a06698aea7ff8a701c166"
>  PV = "0.1+git${SRCPV}"
>  
>  SRC_URI = "git://github.com/aehs29/baremetal-helloqemu.git;protocol=https;branch=master"
> +UPSTREAM_VERSION_UNKNOWN="1"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175785): https://lists.openembedded.org/g/openembedded-core/message/175785
> Mute This Topic: https://lists.openembedded.org/mt/96137379/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

