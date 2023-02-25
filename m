Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5B0C6FA8E
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 16:00:08 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.46434.1677340801342235385
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 08:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZJEmkt0h;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 55F9B40003;
	Sat, 25 Feb 2023 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677340798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j46VFcbJrKoJV0/0uaNkkJtc2LvLOH+oMu2PGz+d2oc=;
	b=ZJEmkt0hDShUGt5KZTzTnL2aeZETDnCFH7grOApBuLyfW+ZGdGZX1vKG119R+Hje7Ix+kG
	7M3rGXxyfLKlhFoeJVDMLNsG4arpgjWBFcGHzrBkMU3FZpHsh1AtmIH5Qk7IEUhjgJXIOZ
	W0JpX46gT7uGZzs71f4HeLJoM8kmhsJfZDW3DOGuBTQUv1EC+Vv7/SgycEKzwANYjav/MK
	MPbibV8r2Zq4WMTUyOARjeMacU8d0wjGydz4ybXhggrsXoOgrgSkSGsraDIfFWgZzEwHHE
	mbW/KVXixUNbfHt0X0cY5ARghlNdBMvZSYG0UxJLnOOi3jb/Aw9Tk5s8sue1kA==
Message-ID: <684f07d3-6ae3-9932-26e6-edab46bb0ec7@bootlin.com>
Date: Sat, 25 Feb 2023 16:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH v3 0/6] scripts/resulttool/regression: add
 metadata filtering
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
 <1746D4E8592324E9.29542@lists.openembedded.org>
 <1747067DAE80068A.29542@lists.openembedded.org>
 <4560f34639cc5c794b0f15edae10aeba0da5e570.camel@linuxfoundation.org>
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <4560f34639cc5c794b0f15edae10aeba0da5e570.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177719

Hello Richard,
as usual, thanks for the prompt feedback !

On 2/25/23 13:32, Richard Purdie wrote:
> On Sat, 2023-02-25 at 09:15 +0000, Richard Purdie via
> lists.openembedded.org wrote:
>> On Fri, 2023-02-24 at 18:06 +0000, Richard Purdie via
>> lists.openembedded.org wrote:
>>> Hi Alexis,
>>>
>>> Firstly, this looks very much improved, thanks. It is great to start to
>>> see some meaningful data from this.
>>>
>>> On Fri, 2023-02-24 at 17:45 +0100, Alexis Lothoré via
>>> lists.openembedded.org wrote:
>>>> After manual inspection on some entries, the remaining oeselftest regression
>>>> raised in the report seems valid. There are still some issues to tackle:
>>>> - it seems that now one major remaining source of noise is on the "runtime"
>>>>   tests (comparison to tests not run on "target" results)
>>>> - when a ptest managed by oe-selftest fails, I guess the remaining tests are not
>>>>   run, so when 1 failure is logged, we have many "PASSED->None" transitions in
>>>>   regression report, we should probably silence it.
>>>> - some transitions appear as regression while those are in fact improvements
>>>>   (e.g: "UNRESOLVED->PASSED")
>>>
>>> I had quick play. Firstly, if I try "yocto_testresults_query.py
>>> regression-report 4.2_M1 4.2_M2" in an openembedded-core repository
>>> instead of poky, it breaks. That isn't surprising but we should either
>>> make it work or show a sensible error.

Oh right, I am working in a Poky build configuration, so I have assumed that this
would be the unique use case.
Since the test results commits are tightly coupled to revisions in poky (so not
oecore), I plan to merely log an error about not found revision (and suggesting
the user to check that the repository is poky and not oecore).
But please let me know if I miss a major use case here and that a smarter
fallback plan (shallow-clone poky if we are running in oecore ?) is needed


>> I think I might be tempted to merge this series and then we can change
>> the code to improve from here as this is clearly a vast improvement on
>> where we were! Improvements can be incremental on top of these changes.

I am in favor of this :) If it is OK for you, I will just re-submit a series with
the fix for the proper error logging when running the tool from oecore and not poky.

Next we could introduce all the suggestions you have suggested, but I feel that
with the quick increase of "hotfixes" count to support issues with older test
results, and for the sake of maintainability of resulttool and its submodules,
those specific hotfixes need to be properly isolated (and documented), like in a
"regression_quirks.py" or something like that. What do you think ?

Alexis

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


