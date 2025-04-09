Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876E6C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 16:38:34 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.13545.1744216707052463021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 09:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 539GWIjl019225;
	Wed, 9 Apr 2025 11:32:19 -0500
Received: from [192.168.2.185] ([192.168.2.185])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 539GWGlB010528;
	Wed, 9 Apr 2025 11:32:16 -0500
Message-ID: <e0b73eab-4ae3-4873-92b6-8ecb55836c62@kernel.crashing.org>
Date: Wed, 9 Apr 2025 11:32:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] cve-update-nvd2-native: add workaround for json5
 style list
Content-Language: en-US
To: peter.marko@siemens.com,
        "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        Marta Rybczynska <rybczynska@gmail.com>,
        Steve Sakoman <steve@sakoman.com>, Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250407093557.50424-1-peter.marko@siemens.com>
 <AS1PR10MB5697B414A3E675C3F69476A5FDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <AS1PR10MB5697B414A3E675C3F69476A5FDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 16:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214594

We're definitely seeing the same failures now.  So we would like some sort of a 
solution back to scarthgap at least.

This hack can work, or a backport of the newer code.  For now I'm going to have 
to go with the hack for my own products (thanks for that), but I'd that we get a 
longer term solution for the LTS releases.

--Mark

On 4/7/25 4:45 AM, Peter Marko via lists.openembedded.org wrote:
> Dear community,
> 
> It looks like NVD introduces new bug in their API 2.0 responses every week.
> (e.g. last week https://git.openembedded.org/openembedded-core/commit/?id=8ce06538c9cde0f09909a5a2e61ec10b0d35df49)
> 
> I know that this is an ugly patch, but I propose it anyway.
> We probably don't want to invest large effort in redesigning to json5 without official statement from NVD.
> 
> For master this is a minor issue as it has already switched to FKIE as the default source.
> But scarthgap/kirkstone this is currently the only source for cve-check feature.
> Shall we consider backporting the FKIE to LTS branches?
> And meanwhile backport this patch so that cve-check works again?
> 
> Peter
> 
>> -----Original Message-----
>> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>> Sent: Monday, April 7, 2025 11:36
>> To: openembedded-core@lists.openembedded.org
>> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>> Subject: [OE-core][PATCH] cve-update-nvd2-native: add workaround for json5
>> style list
>>
>> From: Peter Marko <peter.marko@siemens.com>
>>
>> NVD responses changed to an invalid json between:
>> * April 5, 2025 at 3:03:44 AM GMT+2
>> * April 5, 2025 at 4:19:48 AM GMT+2
>>
>> The last response is since then in format
>> {
>>    "resultsPerPage": 625,
>>    "startIndex": 288000,
>>    "totalResults": 288625,
>>    "format": "NVD_CVE",
>>    "version": "2.0",
>>    "timestamp": "2025-04-07T07:17:17.534",
>>    "vulnerabilities": [
>>      {...},
>>      ...
>>      {...},
>>    ]
>> }
>>
>> Json does not allow trailing , in responses, that is json5 format.
>> So cve-update-nvd2-native do_Fetch task fails with log backtrace ending:
>>
>> ...
>> File: '/builds/ccp/meta-siemens/projects/ccp/../../poky/meta/recipes-core/meta/cve-
>> update-nvd2-native.bb', lineno: 234, function: update_db_file
>>       0230:            if raw_data is None:
>>       0231:                # We haven't managed to download data
>>       0232:                return False
>>       0233:
>>   *** 0234:            data = json.loads(raw_data)
>>       0235:
>>       0236:            index = data["startIndex"]
>>       0237:            total = data["totalResults"]
>>       0238:            per_page = data["resultsPerPage"]
>> ...
>> File: '/usr/lib/python3.11/json/decoder.py', lineno: 355, function: raw_decode
>>       0351:        """
>>       0352:        try:
>>       0353:            obj, end = self.scan_once(s, idx)
>>       0354:        except StopIteration as err:
>>   *** 0355:            raise JSONDecodeError("Expecting value", s, err.value) from
>> None
>>       0356:        return obj, end
>> Exception: json.decoder.JSONDecodeError: Expecting value: line 1 column
>> 1442633 (char 1442632)
>> ...
>>
>> There was no announcement about json format of API v2.0 by nvd.
>> Also this happens only if whole database is queried (database update is
>> fine, even when multiple pages as queried).
>> And lastly it's only the cve list, all other lists inside are fine.
>> So this looks like a bug in NVD 2.0 introduced with some update.
>>
>> Patch this with simple character deletion for now and let's monitor the
>> situation and possibly switch to json5 in the future.
>> Note that there is no native json5 support in python, we'd have to use
>> one of external libraries for it.
>>
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> ---
>>   meta/recipes-core/meta/cve-update-nvd2-native.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-
>> core/meta/cve-update-nvd2-native.bb
>> index b9c18bf6b6..32a14a932b 100644
>> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> @@ -229,6 +229,11 @@ def update_db_file(db_tmp_file, d, database_time):
>>                   # We haven't managed to download data
>>                   return False
>>
>> +            # hack for json5 style responses
>> +            if raw_data[-3:] == ',]}':
>> +                bb.note("Removing trailing ',' from nvd response")
>> +                raw_data = raw_data[:-3] + ']}'
>> +
>>               data = json.loads(raw_data)
>>
>>               index = data["startIndex"]
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#214428): https://lists.openembedded.org/g/openembedded-core/message/214428
>> Mute This Topic: https://lists.openembedded.org/mt/112129465/3616948
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

