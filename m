Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C0DCE7A86
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 20:37:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.8032.1695415056221841568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 13:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Io4yxFzI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38MKbYfs097520;
	Fri, 22 Sep 2023 15:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695415055;
	bh=OkQKaU7Xj/xZzddUFNTWm2yOR2YbWNU1NodPhijD8vs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Io4yxFzIX45cBXZZ9gMpY/O9HKm9k4ef1u+YoKowQHLnbcyJC4JLgjZ0QshcBHnJH
	 bf84OMIS80MzrqjFOzK1foEUrVvquC5M7Rw2lbsyHGSW6KsWWlZHcfxlADETftt72j
	 eZk1qmGWgFFmnRsBJohS8PWl1pTOiKZkvu/Octek=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38MKbYDC033782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Sep 2023 15:37:34 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 22
 Sep 2023 15:37:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 22 Sep 2023 15:37:34 -0500
Received: from [10.249.36.233] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38MKbYM3021012;
	Fri, 22 Sep 2023 15:37:34 -0500
Message-ID: <72bfd39a-6395-4bc3-b24d-3f0bcdedd5c4@ti.com>
Date: Fri, 22 Sep 2023 15:37:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] classes/create-spdx-2.2: Add missing import
 oe.packagedata
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
References: <20230920153049.13833-1-reatmon@ti.com>
 <a4899d3917743e55691974ff5d20515ba9a82520.camel@linuxfoundation.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <a4899d3917743e55691974ff5d20515ba9a82520.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 20:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188132



On 9/22/2023 1:47 AM, Richard Purdie wrote:
> On Wed, 2023-09-20 at 10:30 -0500, Ryan Eatmon via
> lists.openembedded.org wrote:
>> Add missing import statement to fix build failures:
>>
>> File: '/scratch/jenkins_builds/arago-master-wip/build/sources/oe-core/meta/classes/create-spdx-2.2.bbclass', lineno: 722, function: collect_package_providers
>>       0718:    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME")))
>>       0719:
>>       0720:    for dep_pn, dep_hashfn in deps:
>>       0721:        localdata = d
>>   *** 0722:        recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
>>       0723:        if not recipe_data:
>>       0724:            localdata = bb.data.createCopy(d)
>>       0725:            localdata.setVar("PKGDATA_DIR", "${PKGDATA_DIR_SDK}")
>>       0726:            recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
>> Exception: AttributeError: module 'oe' has no attribute 'packagedata'
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta/classes/create-spdx-2.2.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
>> index 9b28d124c7..ff319207f7 100644
>> --- a/meta/classes/create-spdx-2.2.bbclass
>> +++ b/meta/classes/create-spdx-2.2.bbclass
>> @@ -708,6 +708,7 @@ def collect_package_providers(d):
>>       from pathlib import Path
>>       import oe.sbom
>>       import oe.spdx
>> +    import oe.packagedata
>>       import json
>>   
>>       deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
> 
> We've realised that packagedata is missing in BBIMPORTS in
> meta/lib/oe/__init__.py which should fix this but also add missing
> dependency information so I'm likely to go with that change and this
> one shouldn't be needed. Let me know if that isn't the case.

Your fix is better as it should cover all cases and not just this one.


> Cheers,
> 
> Richard

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

