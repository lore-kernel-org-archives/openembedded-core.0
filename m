Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F15C48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 19:22:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.2963.1707160965715121989
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 11:22:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Dy2B49MS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D96F41BF209;
	Mon,  5 Feb 2024 19:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707160963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=804F5cv3E1OkJ/39q7zLkEKHKMPk8LdbIZGHuzpaag0=;
	b=Dy2B49MS81zllVHYD+ZGqY3GVPJZgopUG6ST20uJfhrcPFJIcdE550rvmw/q4rTUy+R/cW
	pw7BlMpRDSIQloHda+pMQ0YRdBntLAz0SkytB333CoOyujfzbGPCqFQTGE+Qoe73J1kJ/E
	2UQdlicQYiYYAYVd7s50xth5KBwT6ChV1ue9+5wO5ufPoPWn2fEgLV64D2sBLEa1XJfYqK
	cNE309BJbqNiqHvoSrvPVyiyn+nLX3bqvhmKg/8J4uU6x/ojKFDCBwGPCIOrprEFIs1JVr
	yCQwk18KbgIJOGVWFJVVVVcyPilMQW795iv9bIusqG5okOa/LB3j8mrwMrypbg==
Message-ID: <93350237-c4ea-4859-93fa-113a3ccc0452@bootlin.com>
Date: Mon, 5 Feb 2024 20:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: Re: [OE-Core][PATCH v3 1/2] testimage: move
 TESTIMAGE_FAILED_QA_ARTIFACTS default to core-image
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20240205143757.81826-1-alexis.lothore@bootlin.com>
 <20240205143757.81826-2-alexis.lothore@bootlin.com>
 <5358961809135d87d89ec9004c7f4bc164c82fe2.camel@linuxfoundation.org>
Content-Language: en-US
In-Reply-To: <5358961809135d87d89ec9004c7f4bc164c82fe2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 19:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194967

Hello Richard, thanks for the fast review

On 2/5/24 16:08, Richard Purdie wrote:
> On Mon, 2024-02-05 at 15:37 +0100, Alexis Lothoré via
> lists.openembedded.org wrote:

[...]

>> -TESTIMAGE_FAILED_QA_ARTIFACTS ??= "\
>> -    ${localstatedir}/log \
>> -    ${sysconfdir}/version \
>> -    ${sysconfdir}/os-release"
>> -
>>  # You can set (or append to) TEST_SUITES in local.conf to select the tests
>>  # which you want to run for your target.
>>  # The test names are the module names in meta/lib/oeqa/runtime/cases.
> 
> I can imagine why ??= breaks if you use +=.
> 
> Does this work if you change it from ??= to just = ?

I've indeed given a try to this before moving TESTIMAGE_FAILED_QA_ARTIFACTS to
core-image, but when using "=" instead of "?=" or "??=", I observe that the part
affecting TESTIMAGE_FAILED_QA_ARTIFACTS in core-image-ptest is not taken, so we
are missing the ptests artifacts (but we still get the generic artifacts defined
in testimage.bbclass). So to summarize:
- "??=" or "?=" : we only get ptests artifacts, not the "generic" one
(/etc/version, /var/log, etc)
- "=": we only get the generic artifacts, not the ptests one.
It is not clear for me why the second one fails, and
TESTIMAGE_FAILED_QA_ARTIFACTS does not appear at all in 'bitbake -e" output,
which makes it even more cryptic to me.

> I'd really prefer to keep this in testimage.bbclass.Recipes should be
> able to use += if it is set with = and the addition is after the class
> inherit.

Based on my understanding of bitbake manual, I theoretically agree with you,
yet, as mentioned above this is not the behavior I observe, so I may be missing
something important here. Maybe the parsing order is not the one I think I am
observing, maybe its multiconfig, maybe something else.
I can try to dig this further and clarify why it does not work as expected with "="

Alexis

> 
> Cheers,
> 
> Richard
> 
> 

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


