Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D160FC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:39:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.17924.1683117577818826227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UL8obBTL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AADD1FF81C;
	Wed,  3 May 2023 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683117576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vFWHrcNjrZ09HY/3rRRJhxi0Rn89ZSh8uJxg/diXhAM=;
	b=UL8obBTL2WOrRdrLcRJInovzvujU8ZBGCTcXZ9IPDLoVcYiDBM8gxN/19kf1SXzAlFZGwY
	zHS+nG0YFGynRofYLgeAUFE1s7PeoVFOSAr99czMczR4GYL+4WvGawL9yBv8k54Jvi0qkU
	shA7e8GOu/Qol5+EO+IWmlqJTsDJCQ2pcgxvV2Ucv6ldZpEKuYvoZPoCng1vVrWes2NMQM
	+PLdQ28eDY5kdkKCq3nIqcFpOyGP9Qu469UhQ+H5DZsPf+3zwk5WFCj7hfLN/hjMHPmDur
	gUKaoNDi9uOrLO9CJfg9hO509Pg0XPl9hTZctP1XPvx/Jrl90fm3leDyokkZUw==
Message-ID: <fe25f670-5d6a-45a8-fdd8-301c44ee7e7f@bootlin.com>
Date: Wed, 3 May 2023 14:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bitbake.conf: add "xz" to HOSTTOOLS
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230503095239.2487980-1-michael.opdenacker@bootlin.com>
 <b8d70b39c6cfd3127a6871f6666e86de0eaecc77.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <b8d70b39c6cfd3127a6871f6666e86de0eaecc77.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180816


On 03.05.23 at 12:47, Richard Purdie wrote:
> On Wed, 2023-05-03 at 11:52 +0200, Michael Opdenacker via
> lists.openembedded.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> xz is necessary to extract the uninative binary shims
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   meta/conf/bitbake.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index afd9e2f552..2a6aefc01a 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -529,7 +529,7 @@ HOSTTOOLS += " \
>>       python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>>       sha1sum sha224sum sha256sum sha384sum sha512sum \
>>       sleep sort split stat strings strip tail tar tee test touch tr true uname \
>> -    uniq wc wget which xargs zstd \
>> +    uniq wc wget which xargs xz zstd \
>>   "
>>   
>>   # Tools needed to run testimage runtime image testing
> I don't quite understand, how is this working today without this?


At least on Ubuntu, the "xz-utils" package is pulled by 
"build-essential", so everyone on Ubuntu always has "xz".

Then, we I ran my tests on a fresh Fedora container, bitbake didn't warn 
me but "xz" was missing, but this prevented the uninative shim from 
being installed. It seems that at least on Fedora, "xz" isn't pulled by 
the other host tools we install.

I guess most people has "xz" anyway, which could explain why this wasn't 
reported before.

By the way, just wondering... What do we need "perl" for ?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


