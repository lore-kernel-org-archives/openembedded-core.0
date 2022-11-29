Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99983C4167B
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 14:43:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.151550.1669732979711250568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 06:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g8Xt3tRJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2ATEgtOC025229;
	Tue, 29 Nov 2022 08:42:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669732975;
	bh=iNu0bfV4SM2218aZjdJbu5+Yv0edaZHNsSkd4rzBknw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=g8Xt3tRJh1Lhtwy/RIe22vBfEBKOKJnfW/kOOpXPRhRuqB4OTtGMeGtWw6inRAdZ2
	 m7fCFr5Z1aZqlblXGI9BlrxKZK8EuW+pKHYobQPV9v4yYhCnvAK2uPVirWusgNZHik
	 2RCkyWGtb6/+zGUSYcmcoHB+m+hwMKkLpvbqc+uQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2ATEgtbN023830
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Nov 2022 08:42:55 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 29
 Nov 2022 08:42:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 29 Nov 2022 08:42:55 -0600
Received: from [10.249.37.150] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2ATEgtoA106578;
	Tue, 29 Nov 2022 08:42:55 -0600
Message-ID: <4b9cf683-b93c-b395-73b8-9b36d586c76c@ti.com>
Date: Tue, 29 Nov 2022 08:42:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [OE-core] [PATCH v2][master] go: Update reproducibility patch to
 fix panic errors
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>, <raj.khem@gmail.com>,
        <openembedded-core@lists.openembedded.org>
References: <20221129122302.14589-1-reatmon@ti.com>
 <c9c1630165f51411750d4ca7715bfb4c625916e1.camel@linuxfoundation.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <c9c1630165f51411750d4ca7715bfb4c625916e1.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 14:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173975



On 11/29/2022 8:15, Richard Purdie wrote:
> On Tue, 2022-11-29 at 06:23 -0600, Ryan Eatmon via
> lists.openembedded.org wrote:
>> Based on a discussion on the mailing list [1], there are panic
>> errors that occur on a few platforms caused by the patch.  We
>> cannot simply remove the original patch due to the
>> reproducibility issues that it addresses, so this patch on the
>> original patch fixes the cause of the panic errors.
>>
>> The previous version of this patch was a little too aggressive
>> in cleaning up the environment.  Some of the variables impacted
>> by the filerCompilerFlags() function require at least one value
>> to remain in the array.  In this case, the values for ccExe,
>> cxxExe, and fcExe require a value or later code that access
>> them result in a panic related to accessing a value out of range.
>>
>> This updated patch adds a flag that requires keeping the first
>> value so that at least one thing remains and the assignments
>> for the Exes set that flag to true.  The first item in the
>> array should be the executable name, so leaving it should be
>> safe.
>>
>> I have run the oe-selftest and everything passed in my setup.
>>
>> There is a bug report [2] filed for the issue that this patch
>> addresses.
>>
>> [1] https://lists.openembedded.org/g/openembedded-core/topic/94022663
>> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14976
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   ...ent-based-hash-generation-less-pedan.patch | 30 ++++++++++---------
>>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> If I remember rightly, the filter function removes anything starting
> with -m. Are you saying you found a case where the executable itself
> was called -m<something?
> 
> I'd like to understand what this was stripping out which was valid?

The function in the patch actually did the opposite.  It only keeps 
values that start with -m.  I think what it was trying to strip out was 
anything with a path.

Personally I think the way the original patch was implemented is like a 
sledge hammer.  Which may be ok with how go integrates into OE, but 
feels like overkill to me.


> Cheers,
> 
> Richard
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

