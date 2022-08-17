Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8078CC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 17:24:36 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.31517.1660757073728847392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 10:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A69PSeZ/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 87078240004;
	Wed, 17 Aug 2022 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660757071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fy5dJoVH27Uajpil2alih/f1YQoQiuFRVpXt1cxgga0=;
	b=A69PSeZ/RJI46h4EYfp4y9pqSC/VKsgnEHXnlup02klNkB7EQjqhF9+ZpKsGbiqdvV2ggx
	xlpo39qtIhcUq5jH4vgX4KgItgOw5ByeYx53PgzQVfJsJtGyldurP7pgPyoA60ULc/xRqF
	13x9kIl0uToUkK1Jj9jdLkuJEthFNwzumcISufzBL6No0s6UHxlU7Jc/5wa5XXMRJtDXv3
	ZsxEFiGD+/hf4nahLtkPSxYqnQjgt40rsacjuthKrNkwbNw22MyYssqqmlGHTlQhmSUNgK
	NASvwNEyUheOZJXLZydQ5n4+jmvyGVOjbY38NQcAuZBIivE3eEcMUEfvm39EfQ==
Date: Wed, 17 Aug 2022 19:24:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: yang.xu@mediatek.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] insane.bbclass: Skip patches not in oe-core
 by full path
Message-ID: <Yv0kTr/PBCFaj2k8@mail.local>
References: <20220815053935.15950-1-yang.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815053935.15950-1-yang.xu@mediatek.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 17:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169496

Hello,

This doesn't seem to work as expected:

https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/1599/steps/12/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/3296/steps/12/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#builders/128/builds/495/steps/13/logs/stdio

On 15/08/2022 05:39:35+0000, Yang Xu via lists.openembedded.org wrote:
> The full path of patch may contain '/meta/' but not in oe-core, skip
> patches by checking it starts with oe-core full path or not.
> 
> Signed-off-by: Yang Xu <yang.xu@mediatek.com>
> ---
>  meta/classes-global/insane.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index 46ea41e271..42daf4388e 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1214,11 +1214,12 @@ python do_qa_patch() {
>      import re
>      from oe import patch
>  
> +    coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta/')
>      for url in patch.src_patches(d):
>         (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
>  
>         # skip patches not in oe-core
> -       if '/meta/' not in fullpath:
> +       if not os.path.abspath(fullpath).startswith(os.path.abspath(coremeta_path)):
>             continue
>  
>         kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169350): https://lists.openembedded.org/g/openembedded-core/message/169350
> Mute This Topic: https://lists.openembedded.org/mt/93030817/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

