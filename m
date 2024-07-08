Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43C8C3DA41
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 21:11:03 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.5158.1720473055835558603
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 14:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f+fc8EUU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42F701BF208;
	Mon,  8 Jul 2024 21:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720473054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwbTgp6Fnh50SQYLnbP9IjmLLuf9vfC6Wyw42PAi7RU=;
	b=f+fc8EUUuPbHc3/cjUdMkkLYiciN6gGu4QxVqfmxkNXNTX/kqSkZFbZSRZrAKDXl4pXR/6
	Rk/ZKlEaY1xJX6SdljmY6BopfXo4lbQqfFTJXDr7mVpQ/4wqSuWlHFb/giwgcDXbLmjR3q
	sisKW9gFIqcNC2Xcs2w0MeJ3wkU+2fqw10n1Y1iIrBNT+mYuFY8M7B3SA/hNmgpxHypKkF
	pVew64x4rqWO2UhmeLtlTlc9z1Wnw9hhrTu+iiNCtYZtesQO4hfglEq85LTVDk1MIw5CjC
	qlU6LvJlipHXXS0SJCkcLAi1LzleZobKL8JqOPfKiIzijuVDL+4IZc1c0LuEgg==
Message-ID: <e5e4514e-5db0-4d0b-a20a-11e2d786a543@bootlin.com>
Date: Mon, 8 Jul 2024 23:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] oeqa/utils/postactions: transfer whole
 archive over ssh instead of doing individual copies
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240705144638.441976-1-alexis.lothore@bootlin.com>
 <20240705144638.441976-3-alexis.lothore@bootlin.com>
 <dd50f7eea15a500e7f6334d043b0dfe9c4620675.camel@linuxfoundation.org>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Language: en-US
In-Reply-To: <dd50f7eea15a500e7f6334d043b0dfe9c4620675.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 21:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201638

Hello Richard,

On 7/7/24 10:10, Richard Purdie wrote:
> On Fri, 2024-07-05 at 16:46 +0200, Alexis Lothoré via lists.openembedded.org wrote:
>> From: Alexis Lothoré <alexis.lothore@bootlin.com>
>> +    try:
>> +        cmd = f"tar zcf - {" ".join(artifacts_list)}"
> 
> Thanks for the patch. The syntax above causes failures:
> 
> https://valkyrie.yoctoproject.org/#/builders/95/builds/59/steps/14/logs/stdio
> 
> I've put a fix on master-next which I can squash in but it does make me
> wonder how it was tested.

Sorry about that. This error made me doubt about my testing setup, so I ran new
tests, and I confirm that this line is being executed and returns a correct tar
command on my machine, which confused me even more because it indeed looks broken.

My best guess about those differences is a mismatch on python versions between
the autobuilder and my machine. I am running python 3.12, and it appears that it
has brought many improvements to python f-strings, especially "quote reuse",
which makes python not raise an exception anymore when the expression inside an
f-string reuses the same kind of quotes as for the parent f-string (see [1]). I
ran a quick test with Python 3.11 instead of 3.12, and I now I see the exception.

I guess it would be better for me to keep working with the same python version
as in the autobuilder. I see mentions of python 3.6 in README-WALKTHROUGHS.md
from the autobuilder2 repository, but I am not sure how up-to-date it is. Could
you please confirm whether this is the correct version or not?

Thanks,

Alexis

[1]
https://docs.python.org/3/whatsnew/3.12.html#pep-701-syntactic-formalization-of-f-strings

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


