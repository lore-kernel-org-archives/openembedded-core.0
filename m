Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B2EC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 07:23:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.7705.1686295431903836588
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 00:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CYOe7bHk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686295429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6i7gvNk5MS+6pBlZe+etaKimnCd87vMfNIIHTdt+mmU=;
	b=CYOe7bHkWOiiGRhIxh6tj+XBABrzlHUHoRjIcx6htRBvgjtmsXxrGVDWd2JuYEUcpCy/p1
	uNX60bC914ERyljP++BtO1QW4KZbl84gCD6IwLCHbfORL6N+ERdMl0vaEIe8ndAasuIs+U
	WEDHd3lKgEVSbbV/kOYxPJziH2J1GZlxd/+LqCpXcSh/5nYTeK5TY1lTGYbtZi03d1eB2m
	R3YMsLEJNsqUM87g/caJv/Ed5exs//zL1vS5Wwe69/yj0RrSBzk5QVHnYfbWLJOrWsqRk+
	dndK3twojj0/E+2X1wb2dYBRxZl1vjZmyXFmpK/Geuuohcqvq06P8qmtnf4AKA==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFD68240007;
	Fri,  9 Jun 2023 07:23:48 +0000 (UTC)
Message-ID: <212cdfaa-12a2-e292-ea51-7432efaef913@bootlin.com>
Date: Fri, 9 Jun 2023 09:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [OE-Core][PATCH v3 4/4] core-image-ptest: append ptest directory
 to artifacts list
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Openembedded-core@lists.openembedded.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
 <20230609064802.11777-5-alexis.lothore@bootlin.com> <ZILME/DYo6hUkXv0@nuoska>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <ZILME/DYo6hUkXv0@nuoska>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 07:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182541

Hi Mikko,

On 6/9/23 08:52, Mikko Rapeli wrote:
> Hi,
> 
> On Fri, Jun 09, 2023 at 08:48:02AM +0200, Alexis Lothoré via lists.openembedded.org wrote:
>> From: Alexis Lothoré <alexis.lothore@bootlin.com>
>>
>> TESTIMAGE_FAILED_QA_ARTIFACTS is defined in testimage.bbclass with a
>> minimal list of files to retrieve when a test fail. By appending the ptest
>> directory only in core-image-ptest.bb, thanks to multiconfig feature used
>> in the recipe, only failing ptests will lead to corresponding ptest
>> artifacts retrieval, instead of all ptests artifacts retrieval.
>>
>> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
>> ---
>>  meta/recipes-core/images/core-image-ptest.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
>> index 90c26641ba3a..e1be81bb2666 100644
>> --- a/meta/recipes-core/images/core-image-ptest.bb
>> +++ b/meta/recipes-core/images/core-image-ptest.bb
>> @@ -28,6 +28,7 @@ QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
>>  QB_MEM:virtclass-mcextend-python3-cryptography = "-m 4096"
>>  
>>  TEST_SUITES = "ping ssh parselogs ptest"
>> +TESTIMAGE_FAILED_QA_ARTIFACTS:append=" ${libdir}/${MCNAME}/ptest"
> 
> Why not += ? Also, spaces around =.
> 
> If :append is used, bbappend in other layers can not easily override
> this variable.

Good catch, thanks, I'll wait a bit for any more reviews and send a new version
with this point fixed.

Thanks,
Alexis

> 
> Cheers,
> 
> -Mikko
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182538): https://lists.openembedded.org/g/openembedded-core/message/182538
> Mute This Topic: https://lists.openembedded.org/mt/99423382/7394887
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexis.lothore@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


