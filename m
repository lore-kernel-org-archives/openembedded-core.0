Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3DDC6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 15:42:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.67792.1677426136555612457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 07:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XFJvn6OH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2CD5640004;
	Sun, 26 Feb 2023 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677426134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KzV37rxQD3bJApzsvdfToBESoUAuJyFcH+nRxk0Qvac=;
	b=XFJvn6OHux9ZND2CaTNyEwiQajDIb5MEQ1kVDRZasLH9hoUTiknhiXMS6PjnfOdXjSQPVb
	0C4jtN4Wd59yJfkFDzJVLpg9N4khUuIgYy6cHNJo6cgyAckk4At0berRHVUnGqYLjLQ5Fz
	EhfPgHV7NQ3EfGU9wmwIlm40yzJ/2IwwiiwUvQ2C2aa2sqdD3TTy0EyQmC4k9Ah462wLeg
	WX7Rp7KaWqT7DEmL/GQLZvft0zd+jFJPiGEsEOuiMvxz9aNNKKC/+1vwsrnHtZ+P9an4Qt
	7Os6Bm0A1rynWSbfthBfCKfosGpSN2nSQFq/BycY3MttHtpO5duVWbChQ2vBHQ==
Message-ID: <3070708a-ac01-a3a9-31c8-e319027fb44b@bootlin.com>
Date: Sun, 26 Feb 2023 16:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH v3 0/6] scripts/resulttool/regression: add
 metadata filtering
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
 <1746D4E8592324E9.29542@lists.openembedded.org>
 <1747067DAE80068A.29542@lists.openembedded.org>
 <4560f34639cc5c794b0f15edae10aeba0da5e570.camel@linuxfoundation.org>
 <684f07d3-6ae3-9932-26e6-edab46bb0ec7@bootlin.com>
 <e40c7fea9d2d3ec508c5b5a73315a8429422e2cf.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <e40c7fea9d2d3ec508c5b5a73315a8429422e2cf.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 15:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177737

Hello Richard,
On 2/26/23 13:15, Richard Purdie wrote:
> On Sat, 2023-02-25 at 16:59 +0100, Alexis Lothoré wrote:
>> Hello Richard,
>> as usual, thanks for the prompt feedback !
>>
>> On 2/25/23 13:32, Richard Purdie wrote:
>>> On Sat, 2023-02-25 at 09:15 +0000, Richard Purdie via
>>> lists.openembedded.org wrote:
>>>> On Fri, 2023-02-24 at 18:06 +0000, Richard Purdie via
>>>> lists.openembedded.org wrote:
>>>>> Hi Alexis,
>>>>>
>>>>> Firstly, this looks very much improved, thanks. It is great to start to
>>>>> see some meaningful data from this.
>>>>>
>>>>> On Fri, 2023-02-24 at 17:45 +0100, Alexis Lothoré via
>>>>> lists.openembedded.org wrote:
>>>>>> After manual inspection on some entries, the remaining oeselftest regression
>>>>>> raised in the report seems valid. There are still some issues to tackle:
>>>>>> - it seems that now one major remaining source of noise is on the "runtime"
>>>>>>   tests (comparison to tests not run on "target" results)
>>>>>> - when a ptest managed by oe-selftest fails, I guess the remaining tests are not
>>>>>>   run, so when 1 failure is logged, we have many "PASSED->None" transitions in
>>>>>>   regression report, we should probably silence it.
>>>>>> - some transitions appear as regression while those are in fact improvements
>>>>>>   (e.g: "UNRESOLVED->PASSED")
>>>>>
>>>>> I had quick play. Firstly, if I try "yocto_testresults_query.py
>>>>> regression-report 4.2_M1 4.2_M2" in an openembedded-core repository
>>>>> instead of poky, it breaks. That isn't surprising but we should either
>>>>> make it work or show a sensible error.
>>
>> Oh right, I am working in a Poky build configuration, so I have assumed that this
>> would be the unique use case.
>> Since the test results commits are tightly coupled to revisions in poky (so not
>> oecore), I plan to merely log an error about not found revision (and suggesting
>> the user to check that the repository is poky and not oecore).
>> But please let me know if I miss a major use case here and that a smarter
>> fallback plan (shallow-clone poky if we are running in oecore ?) is needed
> 
> I'm happy to for it just to give an human readable error, someone can
> add this functionality if they need/want it.

ACK

>>>> I think I might be tempted to merge this series and then we can change
>>>> the code to improve from here as this is clearly a vast improvement on
>>>> where we were! Improvements can be incremental on top of these changes.
>>
>> I am in favor of this :) If it is OK for you, I will just re-submit a series with
>> the fix for the proper error logging when running the tool from oecore and not poky.
>>
>> Next we could introduce all the suggestions you have suggested, but I feel that
>> with the quick increase of "hotfixes" count to support issues with older test
>> results, and for the sake of maintainability of resulttool and its submodules,
>> those specific hotfixes need to be properly isolated (and documented), like in a
>> "regression_quirks.py" or something like that. What do you think ?
> 
> I'm hoping we don't have many of these quirks. We have a huge history
> at this point so it would be sad if the tool can't work with it. From
> what I've seen so far, we can manage with the code in the regression
> module itself. I've tried to add some comments.
> 
> I wondered what to do with this series since I needed to get M3 built.
> Since this series was available and mostly usable, it would be better
> to have a nicer report this time, it is a good test of the code.
> 
> In the end I've merged most of it, along with my two tweaks to handle
> LTP and the bigger ptest results issue. I couldn't take one set of the
> selftests since they simply don't work. This will give us a useful
> realworld test of the M3 report.

Ok, great. For the selftest failing, my bad, adding proper logging was one of
those "one last change before sending", and obviously I did forget to re-run the
tests before sending.
> 
> I'm working on the assumption you'll send a follow up series with the
> tests, the oe-core check and some of the other issues I've mentioned in
> other emails?

Absolutely. Besides the tests, oecore check and the improvements mentioned in
this mail thread, the next thing I was keeping in mind is fixing the report
generation against "master-next" branches you have mentioned a few weeks ago.

Regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


