Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44E1C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 07:59:05 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.8393.1708502344434252348
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 23:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q1oVZFBL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A623E4000C;
	Wed, 21 Feb 2024 07:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708502342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHuW7QUzFFsWrOZuLvCshEdfUpXetj1bw7/IECgxgAk=;
	b=Q1oVZFBL65Yxi/kWEvC0Xp0nNooaucBJcl6YAc4nWnHU2Qww+UHnxwGMNVP3aV/JswgI28
	ekf+PowAvHoNKpay4UyAlzyJaZPvPdzVEqbUwcERylg6sY9Sv/5mgv9R0S7zM6C2RQ0QZn
	d5jM3qahBTAHmYP0NTNTHItIVMwkg6NXrmaD84DVgIhcaNxtD6Fo0a0Cepu1s8o3eH68e0
	m7Re0dZ5CC12w5gWR99DDMnZinlAIAZ6aiUND2anrrzq+DmflUxvdWYTZicltCVzorTpJV
	wiYhi3OypN2b4LryunmMGxpwQLQC4YfYiWM2TmCyopkYFVjbJ+MCxGCrSRJRTw==
Message-ID: <450b61f0-4b69-45cd-9277-6ac29bc76738@bootlin.com>
Date: Wed, 21 Feb 2024 08:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH 1/4] testimage: create a list of failed test post
 actions
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240220200159.13419-1-alexis.lothore@bootlin.com>
 <20240220200159.13419-2-alexis.lothore@bootlin.com>
 <a57a3202b513da93b8b3a9571de922787a455328.camel@linuxfoundation.org>
 <3be76c2c-463d-4125-8182-93113ab6efa7@bootlin.com>
 <60459a98fdb89d62ea4a33f3dfd1d71f54aeca4b.camel@linuxfoundation.org>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <60459a98fdb89d62ea4a33f3dfd1d71f54aeca4b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 07:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195962

On 2/21/24 08:56, Richard Purdie wrote:
> On Wed, 2024-02-21 at 08:53 +0100, Alexis Lothoré wrote:
>> On 2/21/24 08:34, Richard Purdie wrote:
>>> On Tue, 2024-02-20 at 21:01 +0100, Alexis Lothoré via
>>> lists.openembedded.org wrote:
>>>> From: Alexis Lothoré <alexis.lothore@bootlin.com>
>>
>> [...]
>>
>>>> +################################################################
>>>> ##
>>>> +# General post actions runner
>>>> +################################################################
>>>> ##
>>>> +
>>>> +def run_failed_tests_post_actions(d, tc):
>>>> +    post_actions=[
>>>> +        list_and_fetch_failed_tests_artifacts
>>>> +    ]
>>>> +
>>>> +    for action in post_actions:
>>>> +        action(d, tc)
>>>
>>> Rather than create a bbclass class of python functions, these
>>> should
>>> move to lib/oe and become a proper python library file?
>>
>> ACK, I will do that and create a proper python file for this.
>>
>>> Moving functions out of the class files is on my long term todo
>>> list so
>>> this seems like an idea opportunity.
>>
>> So should this series take the opportunity to move all already
>> existing python
>> functions from testimage to a lib ? I can certainly do that if that's
>> your point :)
> 
> I'm saying over time I think many of the python functions need to move.
> This close to feature freeze may not be the best time, I just wanted to
> give a clear view of my intent.
> 
> Sometimes the variable dependencies don't work the same way from the
> python library so we need to be careful.

Ok, thanks for the clarification. I will then only fix my series to not create a
new bbclass but a lib for now.

> Cheers,
> 
> Richard
> 
> 
> 

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


