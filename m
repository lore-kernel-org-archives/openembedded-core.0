Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934CBC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:56:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6042.1676537791662920267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dfKm/BNT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ED63D20012;
	Thu, 16 Feb 2023 08:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676537789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWvZsCoTwsZ52Db4TQwsY1dF4jiXzbxQ1R1465jDojQ=;
	b=dfKm/BNTycEFF79oxMofYr8B5vzpftZ8jk/zb30rQMOnaQyI2wME//AHqj/grlsKkArV7u
	LECxS+Jv2+t/C0KixQCFR0vWlpBzrqmpy5iSRP9aephV+jQfaxUj8fZDIjhbBUpTzUROOM
	oS+8MSNwY9sMtjtEJBi/RHkarT/oRnYpNa41KanC01x2GkP+1O2RCF/wlNxK0Foh0O91My
	iLMFcGph17ubvgoE/4uP8uhbLwqmVvD+wCGF1wsgXI6DeqCPJOqSDi08Grg48/4fCVWioz
	1yjDjHwtGNE+fX+vQgI8neW/mGz6fRB7FIJrh4bvfSnulceOyF1hYMbsnPlQbg==
Message-ID: <407f3fd1-199b-9d65-cbf3-66bee54d4cf2@bootlin.com>
Date: Thu, 16 Feb 2023 09:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [OE-core] [PATCH v2 0/4] scripts/resulttool/regression: add
 metadata filtering
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
References: <20230214165309.63527-1-alexis.lothore@bootlin.com>
 <124b9c9667b038b8502f6457ba7d894fc4ef3c58.camel@linuxfoundation.org>
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <124b9c9667b038b8502f6457ba7d894fc4ef3c58.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 08:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177278

On 2/16/23 01:02, Richard Purdie wrote:
> On Tue, 2023-02-14 at 17:53 +0100, Alexis Lothoré via
> lists.openembedded.org wrote:
>> From: Alexis Lothoré <alexis.lothore@bootlin.com>
>> * this serie prioritize retro-compatibility: if the base test is older (ie: it
>> does not have the needed metadata), it will consider tests as "comparable"
>> * additionally to tests added in oeqa test cases, some "best effort" manual
>> testing has been done, with the following cases:
>>   - run a basic test (e.g: `oeselftest -r tinfoils`), collect test result, break
>>     test, collect result, ensure tests are compared. Change oeselftest
>>     parameters, ensure tests are not compared
>>   - collect base and target tests results from 4.2_M2 regression report,
>>     manually add new metadata to some tests, replay regression report, ensure
>>     that regressions are kept or discarded depending on the metadata
> 
> I think this is heading in the right direction. Firstly, can we put
> some kind of test script into OE-Core for making debugging/testing this
> easier?
> 
> I'm wondering if we can take some of the code from qa_send_email and
> move it into OE-Core such that I could do something like:
> 
> show-regression-report 4.2_M1 4.2_M2
> 
> which would then resolve those two tags to commits, find the
> testresults repo, fetch the data depth1 then call resulttool regression
> on them.

That totally makes sense, it will make future change easier to test, thanks for
the suggestion. I will think about how I can rework/transfer some code to do
that. I feel that one thing could still be troublesome to do so: since there
will be linked modification in yocto-autobuilder-helper and openembedded, do you
know if yocto-autobuilder-helper is fetched on same branch family as all
repositories needed for build ? From a quick reading, I see that it is by
default on "master" in config.py in yocto-autobuilder2 repository, so I think it
is always on master, which will be an issue to solve ?

> 
> I did that manually to experiment. I realised that if we do something
> like:
> 
>     if "MACHINE" in base_configuration and "MACHINE" in target_configuration:
>         if base_configuration["MACHINE"] != target_configuration["MACHINE"]:
>             print("Skipping")
>             return False
> 
> in metadata_matches() we can skip a lot of mismatched combinations even
> with the older test results.

Indeed, comparing MACHINE when present on both results can help too. I may have
skipped this because of confusion about our previous discussion on some tests
being "cross-compared" while other are "strictly" compared ! I will ensure that
most of scenarios allow comparing MACHINE, and if so, I will add it in
metadata_matches to be checked first (because cheap to test), and if it matches,
check OESELFTEST_METADATA too (more expensive)

> I think we also should be able to use some
> pattern matching to generate a dummy OESELFTEST_METADATA section for
> older data which doesn't have it. For example, the presence of meta_ide
> tests indicates one particular type of test. Combined with the MACHINE
> match, this should let us compare old and new data? That would mean
> metadata_matches() would need to see into the actual results too.

I thought about this possibility while starting to work on this (checking for
existing metadata to kind of generate/guess test configuration), but I have felt
that it would need too much "business logic" encoding in resulttool scripts,
which could easily break if we want to change some tests configuration. I mean,
if someone changes some parameters passed to oe-selftest in builders
configuration, he will very probably not remember to update some "guess" filters
in resulttool.

I will start working on new revision of this series based on your comments

Kind regards,

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


