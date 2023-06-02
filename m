Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A38AC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 12:15:08 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10995.1685708098389292871
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 05:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kgXhTDIv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685708095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VslDx5XPaJx2K86QwTIRrJQFssOiWc4DvZBIcE2K9tc=;
	b=kgXhTDIvxroP+9/ylkN0+uSNE+hJHtdD9+x58+JsPpNSpL2+1rZ1GuJjJ8y321PLrOBgDI
	L8yeZD04g5+1RI4L8Xp6GYQ2w635D4Fp8tjJbEaKXKJdry6JPKDpsogZlupn8IHeUdKJkh
	OG2ZQ5ix3iQWKXyAFUEp5HpKTgXabWez5TRALc0xAlGlg1xB5bv+q1pDzAHidD7atIFnbU
	yLHqmRqiL5FpEeDqXoN7pmjjLpXWlQ7/MBga8OlohmvWf+aaq01KhKoI7GhZ1JB9aY+EZh
	jTnPRHiNxNTWtpYh6i3nBEc78CocGjHNxR+32l1j4zv4/vdoIKnmfC9g9lXEcQ==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29DA74000A;
	Fri,  2 Jun 2023 12:14:55 +0000 (UTC)
Message-ID: <228e247a-2121-d1c6-95bf-51f18ec95e03@bootlin.com>
Date: Fri, 2 Jun 2023 14:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [OE-Core][RFC][PATCH 3/3] testimage: implement test artifacts
 retriever for failing tests
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Openembedded-core@lists.openembedded.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
 <20230602095037.97981-4-alexis.lothore@bootlin.com>
 <CANNYZj8vV1=GOacn_vHpfeJ1h29AdLNJsO6X-wXPrW9vahc_5Q@mail.gmail.com>
 <ZHnYGjE3ahdytp+g@nuoska>
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <ZHnYGjE3ahdytp+g@nuoska>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 12:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182311

Hello Alexander, Mikko,

On 6/2/23 13:52, Mikko Rapeli wrote:
> Hi,
> 
> On Fri, Jun 02, 2023 at 01:46:03PM +0200, Alexander Kanavin wrote:
>> On Fri, 2 Jun 2023 at 11:50, Alexis Lothoré via lists.openembedded.org
>> <alexis.lothore=bootlin.com@lists.openembedded.org> wrote:
>>> +# When any test fails, if path to an artifacts configuration (listing
>>> +# files/directories to retrieve on target) has been provided, all listed
>>> +# elements will be downloaded from target before shutting it down
>>> +
>>> +ARTIFACTS_LIST_PATH ??= ""
>>
>> I think this should be simplified further by simply specifying the
>> default list directly instead:
>>
>> TESTIMAGE_FAILED_QA_ARTIFACTS ?= "${libdir}/*/ptest/ /var/log/ /etc/version"

I wondered about this possibility while adding this variable, and at this time I
thought it would encode to much "CI logic" in testimage class. But since you
raise the suggestion, I can update to pass directly the file list, which could
indeed be overridden by CI tests runners. We can start with those three paths in
the default value.

Another point raised by your example is the lack of wildcards management in
artifacts path, which would clearly ease the listing, especially for ptests.
I'll see if I can come up with something better for this
> 
> Try fetching /etc/os-release too, please.

ACK, will add it to default list
> 
> I like this patch, thanks!
> 
> Cheers,
> 
> -Mikko
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182307): https://lists.openembedded.org/g/openembedded-core/message/182307
> Mute This Topic: https://lists.openembedded.org/mt/99283034/7394887
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexis.lothore@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


