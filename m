Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DFAC71133
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 07:39:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.8678.1692949172312587967
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 00:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ol40/wvp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF3BB240006;
	Fri, 25 Aug 2023 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692949169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=El4d26Et/GOMcywiCSDVhuKSCA7YEMwI+DOI03A5jSI=;
	b=Ol40/wvpnz1M+/U0oKLcs0YL7tzU/ejtGcXEH1HrRbyiKouH53cVReNEf/FGEA3T7AfMvI
	Q3Hy5nXnQfLTPgmXZW1q+FavmwZYfax2OyMtHZrvg0Q6vZYO/heRuKoF0T9jSH/oSk28lh
	K/MNCVQ4U7M0gi0WIi8PbOICSXBKN2swb6zPkfPr3X383n1LZ+5iKCwGYXk5X26RBIhpGa
	CfFvUYgMFpfQjRXIcFYTv5A0BrOgvKSOYsfJ7P66hzRk8zRDXozObc74CHLJmRGCtpZO2r
	p+oiRfjdD9294ml7d3IfGE3pnabZVb4jk/g21doqr0kp+RCRLTg/eqwpsXlNkg==
Message-ID: <51fc0222-121e-e551-d514-9a43a788d6ae@bootlin.com>
Date: Fri, 25 Aug 2023 09:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH] oeqa/utils/gitarchive: replace warning with info
 when reading local tags
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230824091810.1795629-1-alexis.lothore@bootlin.com>
 <fa3898c0dffcc1b3d7a1387bd151493a27726143.camel@linuxfoundation.org>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <fa3898c0dffcc1b3d7a1387bd151493a27726143.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 07:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186695

Hi Richard,

On 8/25/23 08:41, Richard Purdie wrote:
> On Thu, 2023-08-24 at 11:18 +0200, Alexis Lothoré via
> lists.openembedded.org wrote:
>> From: Alexis Lothoré <alexis.lothore@bootlin.com>
>>
>> Whenever a script needs to list tags, if it falls back to the third method
>> (reading local tags only), it emits a warning. While this warning is useful
>> for future diagnostic if some tagging issues re-appear, it makes buildperf
>> autobuilds status as "Passed with warnings", which is not desirable
>>
>> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
>> ---
>> See [1]: buildperf build has completed without any major issue, but is
>> still flaggued as "Passed with warnings" because of the log.warning in
>> gitarchive
>>
>> [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/133/builds/2135
>> ---
>>  meta/lib/oeqa/utils/gitarchive.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
>> index ac36ecb3a9ca..64448f47d94e 100644
>> --- a/meta/lib/oeqa/utils/gitarchive.py
>> +++ b/meta/lib/oeqa/utils/gitarchive.py
>> @@ -128,7 +128,7 @@ def get_tags(repo, log, pattern=None, url=None):
>>              tags_refs = repo.run_cmd(cmd)
>>              tags = ["".join(d.split()[1].split('/', 2)[2:]) for d in tags_refs.splitlines()]
>>          else:
>> -            log.warning("Read local tags only, some remote tags may be missed")
>> +            log.info("Read local tags only, some remote tags may be missed")
>>              cmd = ["tag"]
>>              if pattern:
>>                  cmd += ["-l", pattern]
> 
> Thanks for getting to the bottom of this! I merged them directly so we
> could see the effect on the buildperf worker and you looked at the
> results before I managed to report back which was helpful! :

Thanks for the quick merges ! And sorry for the mess of the last days builds

buildperf worker seems indeed to behave correctly again ([1]), but I only took a
look at the build general status since I am not so familiar with those, please
do not hesitate to ping me if I am missing any more specific issue which could
remain regarding the tagging patches.

[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/133/builds/2138
> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186692): https://lists.openembedded.org/g/openembedded-core/message/186692
> Mute This Topic: https://lists.openembedded.org/mt/100932169/7394887
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexis.lothore@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


