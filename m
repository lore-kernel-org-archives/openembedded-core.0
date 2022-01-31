Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21000C433F5
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 09:39:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.29951.1643621973156178831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 01:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=AOv6wi5U;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A1E5680202;
	Mon, 31 Jan 2022 10:39:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643621970;
	bh=0ABRlme/cy4eJ1oltkW2ZgCr3PLhzafJpI2avUsu6xQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AOv6wi5UHehj2M9sp+mIWnf04zitX7aLlWWm4XCVbW2lxW6omyvqiQvTqP5p1Pphp
	 EudlDDHRmgm3OQZkf/7gko/5DGzbH7BYUVhULYgD2q0Ukd1gtK9FejLEW+iAlqx7uV
	 dqOO4te5SmVS+3+YiaWmsJ8vri8NRIHeERBgpm9N7iOr1wHoLej3Lv+V6aSYFXwTM/
	 V4xNy4ho662vTB9d/eMH+A/Iw+HR9chsi7akXIfAnOg+aMP20UCpmTEXOMnoHrUsGr
	 fsItwPW2mU0dFFo4TtzLhKdiPp7WfX3bUiXqg7aBTVNrsFddpCj/5M87xrOiS8cSKI
	 meZL6jV1wn9wA==
Message-ID: <251fe11a-7348-086f-364b-b9940fff3d68@denx.de>
Date: Mon, 31 Jan 2022 10:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] Revert "featimage: refactor style"
Content-Language: en-US
To: "Valek, Andrej" <andrej.valek@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <20220129002907.84534-1-marex@denx.de>
 <93bb78f01d7c44c1b5918e1576f2a804@axis.com>
 <315161c5-6b68-2b4c-37fc-3d10459fdbf8@denx.de>
 <53514b34002e424584e20150b6b725a7@axis.com>
 <cd82c692-f11c-0e1d-4b53-950121e0b3bc@denx.de>
 <c864b18a0e354116059c25ddf03096c90cf8bbca.camel@siemens.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c864b18a0e354116059c25ddf03096c90cf8bbca.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 09:39:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161120

On 1/31/22 08:01, Valek, Andrej wrote:
> Hi,

Hello Andrej,

(please avoid top-posting)

> Sorry, but personally I don't like your idea. What's the benefit of
> reverting this? I would keep the ${} for bitbake and $ for shell. The
> {} has to be placed only for variables like $a${b}c.

That's exactly the benefit of using ${} in shell scripts consistently -- 
you don't have to worry about variable names being accidentally 
conflated with surrounding strings, either due to your own mistake, or 
some automated transformation that was applied incorrectly .

> We should respect the workflow on all recipes otherwise we're braking
> the "unwritten" rules.

The workflow on all recipes ? What does this mean ?

The "unwritten" rules ? If they are unwritten, of course they will be 
broken by people. Better update the documentation.

There is one technical counter-argument to this revert from Peter, quote:
"
There is actually a technical reason to not use ${foo} for shell
variables unless necessary in bitbake files and it is because
bitbake will treat them all as potential bitbake variables. This
means they are unnecessarily included in the taskhashes that
bitbake calculates.
"

But the patch being reverted here addresses the problem only partly, 
because it still contains remnants like this:
"
conf_desc="$conf_desc${sep}setup"
"

[...]

>>>> third alternative ? I mean, besides rewriting the fitimage
>>>> generation into python, which might make it more flexible too.
>>>
>>> Replacing shell code that has grown beyond a couple of hundred
>>> (tens?) lines with something written in a better language is
>>> almost always a good idea.
>>
>> It's grown to almost 800 LoC, so maybe it is time to reevaluate the
>> python conversion then.

So a rewrite into something more suitable might be a good idea ^ , 
probably python in this case.

