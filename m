Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9006FEC8748
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 11:57:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.37251.1694174253063492389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 04:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kduuR/Bi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 494D1E0007;
	Fri,  8 Sep 2023 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694174250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8HhoG5raeRspYkIST5H9PB5Ka0tiCm6mi7M05QtY2g=;
	b=kduuR/Biw4oV8fW5TPYDIy4y5yZ6L4YIRlFfA04D5li0RW9F3DjBwgmZhQFO5QwDfKY2du
	1wgAxCgw89uGgz3sbKIKywQg3xc/qpAQTBN34qXl1qZvsPQwp+HW6FfaJmZK2wiHELdsLv
	RilrTGSCoELXP/wCGdzdwx0kiIZJl2dLCb8aBbHD6lBB/I+WPSmyO+MwVMKzbz7WCCjiSF
	Z40XJFcuJmmVc18l/U4Wjio8b2ayb9E32jYXNtsyffeoEd4+W9fw9NP9lx4X0FoAuLNnrj
	iFKS7IhoKlZ9M0nbQi95H+W/8sb/9B9pahBDStK3jwV0i7l9CFL8evY2jFKA4w==
Message-ID: <e501490d-3a35-6408-478b-9fb6203abdb5@bootlin.com>
Date: Fri, 8 Sep 2023 13:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: nd <nd@arm.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] base: improve LICENSE_FLAGS_DETAILS output
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>
References: <20230621142212.985096-1-ross.burton@arm.com>
 <cfe36dd3-a32c-def5-a8be-9011d070ef28@bootlin.com>
 <892BA4D5-B1E8-47E5-9517-E845AEDA0FF1@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <892BA4D5-B1E8-47E5-9517-E845AEDA0FF1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 11:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187415


On 08.09.23 at 13:11, Ross Burton wrote:
> On 8 Sep 2023, at 12:00, Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:
>> Hi Ross,
>>
>> I'm currently writing the doc patch for LICENSE_FLAGS_DETAILS.
>> However, I don't find the current behavior optimal...
>>
>> On 21.06.23 at 16:22, ross.burton@arm.com wrote:
>>> From: Ross Burton <ross.burton@arm.com>
>>> Don't prefix the output of LICENSE_FLAGS_DETAILS with "For further
>>> details, see" so that recipes can put arbitrary text in their license
>>> details instead of being limited to a specific sentence structure.
>>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>>> ---
>>>   meta/classes-global/base.bbclass | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
>>> index 976a2ddee4b..cbda8d12f09 100644
>>> --- a/meta/classes-global/base.bbclass
>>> +++ b/meta/classes-global/base.bbclass
>>> @@ -520,7 +520,7 @@ python () {
>>>                   message = "Has a restricted license '%s' which is not listed in your LICENSE_FLAGS_ACCEPTED." % unmatched
>>>                   details = d.getVarFlag("LICENSE_FLAGS_DETAILS", unmatched)
>>>                   if details:
>>> -                    message += " For further details, see %s." % details
>>> +                    message += details
>> What about
>> message += ' ' + details
>> instead?
>>
>> Otherwise, you have to add a leading space to LICENSE_FLAGS_DETAILS.
>> What do you think?
> Throwing in a newline or a space seems sensible, yes.  Want to send a patch?
>
> FWIW the recipes in meta-arm put a newline at the beginning, so adding a blank line if details is set seems fairly sensible.

Thanks Ross, good idea!
I sent a patch, but been in a rush, forgot to add you to a "Reported-by" 
line.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


