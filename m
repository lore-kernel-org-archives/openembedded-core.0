Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A85C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 14:22:24 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.16807.1668694943270554022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 06:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TjRaCnRA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C3F6F1C0007;
	Thu, 17 Nov 2022 14:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668694941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b9aEdNvzONVTJ7KMS260x7vqXQcoZSyfj1hiF5N2kq8=;
	b=TjRaCnRAcuqcir4beg8ipoNO8485Dd3k0LowQr2z4pQ7P9oFJJ6Xm46li0rUniSqlXGvVH
	3zCIoBEYjaTbGfMhSX9WnEI9ez8k5/dQWxsbpFygA1K7m+8F512Usa0frO/eEVejPsZxlj
	zCtfQXFHBEvvZs1gRtasWuFOjPMz7Qlm3R04NDTC5L7+R8yPWlLyYxjDvRLttve+W9W9Kk
	qH+Ya7WD02XfFDxmMsPSVl9y2ziez9SVrEPO5ggZP4qhg3Rk51L8fV/OmXiAbjWPAleVe5
	eGGSFipizdM2B7lrXlav41rKHup0rmOGwgm5LOIkUNPUDg+ti0gr+GJh1JhM4g==
Date: Thu, 17 Nov 2022 15:22:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
Message-ID: <Y3ZDnOCC+mzyjdEl@mail.local>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117071223.107064-1-mikko.rapeli@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 14:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173425

Hello,

With this two patches, I have multiple new warnings on the autobuilders
for qemuarm and qemuarm-alt

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6185/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/5064/steps/12/logs/stdio

On 17/11/2022 09:12:21+0200, Mikko Rapeli wrote:
> Many runtime tests would need customization for different
> machines and images. Currently some tests like parselogs.py are hard
> coding machine specific exceptions into the test itself. I think these
> machine specific exceptions fit better as image specific ones, since a
> single machine config can generate multiple images which behave
> differently. Thus create a "testimage_data.json" file format which image
> recipes can deploy. This is then used by tests like parselogs.py to find
> the image specific exception list.
> 
> Same approach would fit other runtime tests too. For example systemd
> tests could include a test case which checks that an image specific list of
> services are running.
> 
> I don't know how this data storage would be used with SDK or selftests,
> but maybe it could work there too with some small tweaks.
> 
> Mikko Rapeli (2):
>   oeqa: add utils/data.py with get_data() function
>   oeqa parselogs.py: use get_data() to fetch image specific error list
> 
>  meta/lib/oeqa/runtime/cases/parselogs.py | 17 +++++++---
>  meta/lib/oeqa/utils/data.py              | 41 ++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 4 deletions(-)
>  create mode 100644 meta/lib/oeqa/utils/data.py
> 
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173404): https://lists.openembedded.org/g/openembedded-core/message/173404
> Mute This Topic: https://lists.openembedded.org/mt/95085492/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

