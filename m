Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11927C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 15:14:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.38125.1702048437309043017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 07:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SYLH0AHs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40E1260006;
	Fri,  8 Dec 2023 15:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702048435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRFdW5VSxwr1XFnEFeFXCiR1xCFMq2uGogIGzcYXnAc=;
	b=SYLH0AHs2hYWc2rJ2CHt3i85qy4I+MEQvrAe6PBANex5EtAUlPjQ+r/sMKcSwevgy9BEeg
	7PFqgyWUDTD8CCxAJb8Ttk36rSsZgNV2wLvK3PtxFcyWXFR0Te5u/2xYhkTmQF9jL1Bcz1
	l+PljghKA0FBiILBFsGjH5HJrGrWdeb0beSRmLnrCgWVXJlLR8+54zdLVAwVDmDQQFIUb4
	teB5LYtNK9dA32p887UqpydO+Xe9G5OEf6nkP3ETc3B7KiQPVQV3Q+tSg3gyxm6GAalSaK
	a3srKtA5iwRZXFoQa9uAWtgr+fHDvBV+SzyrrXqlLXDtcCiiPvz90XTT657NNw==
Date: Fri, 8 Dec 2023 16:13:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] recipetool: limit added checksums
Message-ID: <202312081513545549110e@mail.local>
References: <PR2PR09MB3100441110E563C11000C461A887A@PR2PR09MB3100.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PR2PR09MB3100441110E563C11000C461A887A@PR2PR09MB3100.eurprd09.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 15:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192077

Hello,

I realized I didn't reply but this was causing failures on the
autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6088/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6138/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6153/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6143/steps/14/logs/stdio

And we now have another submission doing the same thing (that I also
fixed later on).

On 03/12/2023 10:36:14+0000, Konrad Weihmann wrote:
> to the same values that are used in bb.fetch.
> Currently that would only add sha256sum to the created recipe,
> which is the preferred choice over md5
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  scripts/lib/recipetool/create.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
> index 293198d1c8..0016be3e7b 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -677,7 +677,10 @@ def create_recipe(args):
>      if not srcuri:
>          lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
>      lines_before.append('SRC_URI = "%s"' % srcuri)
> +    checksums_shown_list = ["%ssum" % x for x in bb.fetch2.SHOWN_CHECKSUM_LIST]
>      for key, value in sorted(checksums.items()):
> +        if key not in checksums_shown_list:
> +            continue
>          lines_before.append('SRC_URI[%s] = "%s"' % (key, value))
>      if srcuri and supports_srcrev(srcuri):
>          lines_before.append('')
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191708): https://lists.openembedded.org/g/openembedded-core/message/191708
> Mute This Topic: https://lists.openembedded.org/mt/102949370/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

