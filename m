Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68992C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 19:02:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.670.1706900563819844160
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 11:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fx2ENii9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE58720004;
	Fri,  2 Feb 2024 19:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706900561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtXxr7/tijCBV9aBd22vntNaSjS2gKpx8YUIXMUyMCw=;
	b=fx2ENii97ZiRMoRY/gPkQTOgZ2MJjLhpNgch0c8zGRvTu+f3RgsXxph04ZEZF/WeZ7B1VH
	fCURgC+RU3jafv9dkR4q+j26/9SpJEZDFFQihUkvSxfgSQtkKkuSGMwnxvSBhxZr6WG4vK
	WrB5dsd+xvbHxMoj+eic7cTDOFYLcDc/A6ycI5K7t7AOLCcFLX7spH3u5N1GiIEm8v+g7R
	Hf01Tik+VhhgWDWY1Ab+rQlUjOV7GQfnnGF4NmLhHlVR7VFnK1VbEGeEokDQa/ltjh/NKZ
	Rim88ZF0fZNlakNbl5L8WDkOUzoa7nrPuP/vTwFwBMlOxtvZp4oFUnT2uowDjg==
Message-ID: <96563fbd-2ffb-44bd-9dbb-c61457560491@bootlin.com>
Date: Fri, 2 Feb 2024 20:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Shouldn't packages for all PACKAGE_CLASSES be
 generated?
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <c0b1cf77-830b-4838-a92c-cd0d70c1bb05@bootlin.com>
 <a2ec9e318bc5e11b0ce42797293735db0b0819e2.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <a2ec9e318bc5e11b0ce42797293735db0b0819e2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 19:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194815

Hi Richard,

Thanks for your answer!

On 2/2/24 at 16:57, Richard Purdie wrote:
> On Thu, 2024-02-01 at 13:47 +0100, Michael Opdenacker via
> lists.openembedded.org wrote:
>> Greetings,
>>
>> I'm surprised by this behavior, which I didn't expect... I'm running
>> "bitbake core-image-cmdline-full; bitbake generate-index" from Poky master.
>>
>> with PACKAGE_CLASSES = "package_ipk package_rpm package_deb"...
>>
>> find tmp/deploy/deb -name *.deb | wc; find tmp/deploy/rpm -name *.rpm |
>> wc; find tmp/deploy/ipk -name *.ipk | wc
>>      1918    1918  129927
>>      1918    1918  135794
>>      5404    5404  393252
>>
>> with PACKAGE_CLASSES = "package_rpm package_deb package_ipk"...
>>
>> find tmp/deploy/deb -name *.deb | wc; find tmp/deploy/rpm -name *.rpm |
>> wc; find tmp/deploy/ipk -name *.ipk | wc
>>      1918    1918  129927
>>      5404    5404  393606
>>      1918    1918  135584
>>
>> with PACKAGE_CLASSES = "package_deb package_ipk package_rpm"...
>>
>> find tmp/deploy/deb -name *.deb | wc; find tmp/deploy/rpm -name *.rpm |
>> wc; find tmp/deploy/ipk -name *.ipk | wc
>>      5404    5404  376187
>>      1918    1918  135794
>>      1918    1918  135584
>>
>> So, more packages are generated to the first item in PACKAGE_CLASSES.
>>
>> It's expected to have the first item in PACKAGE_CLASSES that is used to
>> generate the image, but I expected all packages to be generated for all
>> package types anyway. Isn't this the expected behavior? Otherwise, how
>> would you generate 3 types of feeds (rpm, deb and ipk) at the same time?
> This is expected for various reasons, try adding --runall build to the
> command.


Right, it works and I'm now getting the same number of packages for all 
variants.

By the way, another surprise, ipk packages take more space than deb 
ones, at least in the feeds:

$ du -sh tmp/deploy/*
1.4G    tmp/deploy/deb
2.2G    tmp/deploy/ipk
1.6G    tmp/deploy/rpm

What makes ipk more attractive than deb for embedded cases? I can just 
find the statement that opkg is lightweight and optimized for embedded 
applications (https://git.yoctoproject.org/opkg/tree/README.md).

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


