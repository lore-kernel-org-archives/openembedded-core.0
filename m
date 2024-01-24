Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB381C47E49
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 16:55:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.28135.1706115352434350560
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 08:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RLGtoHLA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49E78C0009;
	Wed, 24 Jan 2024 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706115349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LOCBC/LLHsBAvJ4el8TvgexeRXRPhvr22IglPR4SArA=;
	b=RLGtoHLA7puXpJunAsJtJLwlj9Jdv6I0s90M763qax3i9J9cRHGLTVesC9M/+6/EAqTrIY
	uWT4mPE9LSezGPEoRJ0nZjoyNy4fCk4Hhgvp6yx3HONsG4gEKJyJlmEciBCGGhCynNRPyJ
	mVAgAyd8lVastbb+DWWVReGsNuI2FiSQFCbjDNIGlu32qS4/cUgh3ER0t/ZWd4QMBWJ+/h
	Scq8QGzjc19wpHXpTCI7dI3bcfWdy2KDRKO7j5D8FyUM7oEsbVtw9k6rNx7jyXahKimEUI
	1jAJKl/Du/Ihnmwe6ToofWFTqXnYHc+hg7rNqIpwdJRhRJxh6GrOEDXUYZIxpQ==
Message-ID: <005cba4e-5bac-4960-925e-74d1e7901f3f@bootlin.com>
Date: Wed, 24 Jan 2024 17:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH 1/2] testimage: move
 TESTIMAGE_FAILED_QA_ARTIFACTS default value to core-image-minimal
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20240124142930.1038759-1-alexis.lothore@bootlin.com>
 <20240124142930.1038759-2-alexis.lothore@bootlin.com>
 <8b8c3138d4cc63eec5e72b46bbe7553615cb34d1.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <8b8c3138d4cc63eec5e72b46bbe7553615cb34d1.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 16:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194297

On 1/24/24 17:20, Richard Purdie wrote:
> On Wed, 2024-01-24 at 15:29 +0100, Alexis Lothoré via
> lists.openembedded.org wrote:
>> From: Alexis Lothoré <alexis.lothore@bootlin.com>

[...]

>> +
>> +# When any test fails, TESTIMAGE_FAILED_QA ARTIFACTS will be parsed and for
>> +# each entry in it, if artifact pointed by path description exists on target,
>> +# it will be retrieved onto host
>> +TESTIMAGE_FAILED_QA_ARTIFACTS ?= "\
>> +    ${localstatedir}/log \
>> +    ${sysconfdir}/version \
>> +    ${sysconfdir}/os-release"
>> \ No newline at end of file
> 
> I'm a little puzzled by this. Doesn't this mean it won't work for any
> image that isn't based upon minimal (which is most of them)?

Arg, I may have made wrong assumptions there. I focused on ptest images (ptest
fast and ptest all), observed that at some point they inherited from minimal,
and assumed it would be the case for any image used for runtime tests.

Checking autobuilder config.json, I see indeed that a lot of runtime tests are
for example done on core-image-sato, which does not depend on
core-image-minimal.So indeed this default value needs to move elsewhere, maybe
remain in testimage (but I will have to find a fix for issues mentioned in the
commit). I'll check how to properly fix this.

Thanks,

Alexis

> 
> Cheers,
> 
> Richard
> 

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


