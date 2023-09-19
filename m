Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB951CD5BAA
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:40:42 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.7424.1695127240465653815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 05:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=DTXlL0FL;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id D6AE267D;
	Tue, 19 Sep 2023 14:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695127237;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	l=2669; bh=xEO1JP9q3AMolPUGsmtlGmi1TpceyDCvBrsOHBjU/8A=;
	b=DTXlL0FL1LOfEO4QU66T/xPTnHD6lxjcqRyAZ2jvaeT0OmgVpGUyeo71ywVzPnK+
	uBU/yO2ED4V70Q3JwHtWLAqyA3AA+AgmUKLcTC01WICg/ijFqq85pRu18wqDM/icARN
	CjPgY1yhLrE+JcIwnHWVd4OSSKrKL56Akm23BtQk66dG9WhGFB7YF7Y9JLfaNAGa3/A
	4s+0oM/CZTECfiADf7p1JboX6Zo4lhG+dfxqAKbKqkySxljYsLpsg/aBStzlXaBAMhQ
	eRG5su8kCrOy+NXTKa3CON1jjV7y7x3czam4lI2hpDL61wAZsa36y12bp2NDBQU9MRV
	tWTZ+MSJWQ==
Received: by smtp.mailfence.com with ESMTPSA ; Tue, 19 Sep 2023 14:40:34 +0200 (CEST)
Message-ID: <919339d4-a7cf-44b1-952e-d37cdd972075@redrectangle.org>
Date: Tue, 19 Sep 2023 05:40:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] curl: Update from 8.2.1 to 8.3.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230918015735.391442-1-robert.joslyn@redrectangle.org>
 <a91ac1e923426bcd1848a54f8aeec34155ffa13a.camel@linuxfoundation.org>
Content-Language: en-US
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <a91ac1e923426bcd1848a54f8aeec34155ffa13a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ContactOffice-Account: com:454140407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 12:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187861

On 9/18/23 4:59 AM, Richard Purdie wrote:
> On Sun, 2023-09-17 at 18:57 -0700, Robert Joslyn via
> lists.openembedded.org wrote:
>> NSS support was removed, so adjust PACKAGECONFIG options.
>>
>> The --enable-crypto-auth option was removed and split into separate
>> options for basic-auth, bearer-auth, digest-auth, kerberos-auth,
>> negotiate-auth, and aws. Enable basic, bearer, digest, and negotiate by
>> default as these are probably the most common.
>>
>> Disable test 1279 since this requires libcurl and hangs the tests.
>>
>> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
>> ---
>>   meta/recipes-support/curl/curl/disable-tests       |  1 +
>>   .../curl/{curl_8.2.1.bb => curl_8.3.0.bb}          | 14 +++++++++-----
>>   2 files changed, 10 insertions(+), 5 deletions(-)
>>   rename meta/recipes-support/curl/{curl_8.2.1.bb => curl_8.3.0.bb} (88%)
>>
>> diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
>> index b687b2bb76..fdac795662 100644
>> --- a/meta/recipes-support/curl/curl/disable-tests
>> +++ b/meta/recipes-support/curl/curl/disable-tests
>> @@ -21,6 +21,7 @@
>>   # This test is scanning the source tree
>>   1222
>>   # These CRL tests need --libcurl option to be enabled
>> +1279
>>   1400
>>   1401
>>   1402
> Thanks for the patch. Unfortunately there were warnings generated on
> the autobuilder test run for this:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5452
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5631

I'm not very familiar with the autobuilder infrastructure, but it looks 
to be running something like "bitbake core-image-ptest-curl -c 
testimage". When I run this, I do get a warning:

WARNING: core-image-ptest-curl-1.0-r0 do_testimage: There were failing 
ptests.

Unfortunately, I don't see any failing tests. When running the tests 
manually (called runqemu, then ptest-runner curl in the VM) there are 
some tests that print an error about not finding a library and get 
skipped. I removed those test cases as well, but I still get the warning 
about failing ptests.

What's the ptest code looking for to trigger a test failure? I should 
have some more time to look at this later today, I'm probably just 
missing something obvious.

>
> I'd also wondered if you'd mind setting your from address correctly for
> patches please? For more info see:
>
> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixing-your-from-identity

Thanks, for this, hopefully it's fixed now. My email provider recently 
changed, which does have DMARC enabled.


Thanks,

Robert


