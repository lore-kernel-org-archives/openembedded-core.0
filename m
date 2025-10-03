Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD5CCCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:38:43 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.620.1759509518601707089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=agUwG9a3;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 593GcTee3582135;
	Fri, 3 Oct 2025 11:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759509509;
	bh=oPh6o/f9mxYj/3z3hdZ/sUg4cH8HAckTkjIk4jJQvRo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=agUwG9a36Q0+TIVXLguvsFN4dBZJLlY5/xPctW8+Cy/LbGFTj5bX0TJm3M/cCg8xv
	 dyE3swW4zZtbhpHckeog/oJwZX6bqU6xWUwqS6+rLH9+6xIHwKeWcADWrX7iCILZhl
	 GgqyVw2L9Kw1F1I8WZnJm+aHRySnklMEdvP0g7aQ=
Received: from DLEE201.ent.ti.com (dlee201.ent.ti.com [157.170.170.76])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 593GcTLg883098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Oct 2025 11:38:29 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Oct
 2025 11:38:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Oct 2025 11:38:29 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 593GcTeM3652848;
	Fri, 3 Oct 2025 11:38:29 -0500
Message-ID: <7578428f-7eac-44d9-9a5c-2eb0e0bb7427@ti.com>
Date: Fri, 3 Oct 2025 11:38:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] ghostscript: upgrade 10.05.1 -> 10.06.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
References: <20250929104731.19684-1-vanusuri@mvista.com>
 <a177c9f3-ac3d-4c37-9723-60b04e0984ca@ti.com>
 <DD8ROKJ3ZOQU.BJNE39ZC6RYD@bootlin.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DD8ROKJ3ZOQU.BJNE39ZC6RYD@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224399



On 10/3/2025 9:46 AM, Mathieu Dubois-Briand wrote:
> On Fri Oct 3, 2025 at 3:36 PM CEST, Ryan Eatmon via lists.openembedded.org wrote:
>>
>> This was accepted onto master, and we are seeing different a different
>> 32bit build failure:
>>
>> ./brotli/c/dec/decode.c: In function 'PreloadSymbol':
>> ./brotli/c/dec/huffman.h:83:47: error: ISO C90 forbids mixed
>> declarations and code [-Werror=declaration-after-statement]
>>      83 | #define BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(H) uint32_t
>> __fastload_##H = (*H)
>>         |                                               ^~~~~~~~
>> ./brotli/c/dec/decode.c:440:3: note: in expansion of macro
>> 'BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD'
>>     440 |   BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
>>         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
> 
> Hi Ryan,
> 
> Just for reference, this is not the version of the patch that was
> accepted: the v2 was.

Doh!  I didn't see a v2 in my mail client... I'll reply to that thread...


> Message-ID: <20250930153901.246829-1-vanusuri@mvista.com>
> 
> Thanks,
> Mathieu
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

