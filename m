Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9B0C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 16:55:18 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.103])
 by mx.groups.io with SMTP id smtpd.web08.824.1647881717010689758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 09:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=jDngU34N;
 spf=pass (domain: outlook.com, ip: 40.92.91.103,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxWpF3mwaWUyMVYnMns3y3zXQNoRu2BTYnBZKfsa0wkge4zLNac8P0HmYhgGTnoLSLGJSt/aBpqkjyaaauIm/MEIPF4OyrA/yw8W4FCkkPB1+s8Tmpf3vyF+bIuflo1ZSr35kSmsfn5hcdfSK4pESP5GoWd+C4ccRMvXEQPbFu3cbzm/U6xtoxv2fdBqNWONnKyruu6ZTKCEPwxHEy7Sv5gZuyYVum+zZHVJvpw5DTc7Ebb0qBAKDBm3gL1gG9IWuL9AJAK1snN8IJKLaP7KVmUpz5rNN05ZXyeN5zjmybvDTeKXb+h11pd6nKkAshDqloLRtxPSvQI3xQJQ3azyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lclMTiiyfJ/7fdq05fvjVMzGrTX/hSvI+94o6/IbRM=;
 b=IRTHbyyB4zLM9EJEZlQHlLG6+Q8C44mq2zdealwxS6Go6jR+4gLfEEDLGMS0gb0UaJOcGonK8tfhKe3RARNgNift5Uh8iPrqc8RzuR+q6ZLj1fBviiW1c9gA/3austjnWMgp9qZH3yLJ2++Fxzhg/291Kg3cwzf3ndVpn5gTi2ZXIK0jqo9vAOha2IXvFgDJezpuxww+vi1J7KIZ9L9tVTLX1FmRsHcR1gOtkJmaxQZuxJcHneOXlcHxqR0Su+qDj51tUoyWaZN9i81fOxoTXKvsorMvwjJ/zM9WK8LrHgVlESYibkXUDI1oM2fq+8BNhxPTJMDdWRAYvy9l8jUjgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lclMTiiyfJ/7fdq05fvjVMzGrTX/hSvI+94o6/IbRM=;
 b=jDngU34NPahoOH+xqihj1VjmCLQ6KHoXCDmtP+ibKEhLB42mQra4XTyPpkvKHXsiD20b6hUutHjG/cJJrBx/mvuUDPLAbQroTxDUpZi1D+EGU4A8Jpxfa2aNmstbxfzo5FZ+e/0uxhokOTKzhq+K1QBXZe8mY0KychRgTYLDYgBqtHN4kD//bMUES1lVN38x/Fhw2Ooh12IXy5Af6YqhxQvobbB8F6quo4lVNvkePok3yZoOIpq53CnYT2Qt0Ay0AFk0gqjxD3w2iKRDc1GcrV0pLa2KiEzGVQ9A4O/VcbRpQgzN0Zck2N6gAd2nEOsTv4OPtys1uiCdNzwqQ7+GlQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM7PR09MB3749.eurprd09.prod.outlook.com (2603:10a6:20b:108::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 16:55:14 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::1da9:c6cd:dc79:5d26]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::1da9:c6cd:dc79:5d26%5]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 16:55:14 +0000
Message-ID: 
 <AM9PR09MB46422FC5B67AED3F7908F055A8169@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 21 Mar 2022 17:55:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/2] cve-check: get_cve_info should open the
 database read-only
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220223125432.2733396-1-ross.burton@arm.com>
 <AM9PR09MB4642A596E4D70E846363B638A8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTsttmQuKcXYcgyfV1wQyptEsZThpYQ3Oa8h6WZsPW9xjw@mail.gmail.com>
 <AM9PR09MB4642C795688931840887DC06A8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTs3QP5zDqpPvGHx1TpyhyTg43k5eguiaK81VH9deR5h5g@mail.gmail.com>
 <AM9PR09MB464236CC1D57B2C351A8C0D2A8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTvYcCkDUUKRWKAtfDJG3U+jPEeKwirdi=r7uOTEiRF8EA@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAAnfSTvYcCkDUUKRWKAtfDJG3U+jPEeKwirdi=r7uOTEiRF8EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [z7xK7dw0DmLBwgov94m03B/0zAHYQ5xY7stSkabj83W6yAOBMBngi0LNQA+J8ThN]
X-ClientProxiedBy: AS9PR06CA0345.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::7) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <142822d9-e16d-63cf-eb90-3377b684286a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28918336-1f58-444d-7572-08da0b5b919d
X-MS-TrafficTypeDiagnostic: AM7PR09MB3749:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x+FuVbhTTypWnrfL+fEJJ+1HCwI3bb02uEozQuMewn18mAmxXr1wKquf+YNCe9BnZU7BZBUeTSQ8MufVYo3nxIjrJ1pznqk6bar8gxuRD/hhEZF6TKRKMut8US6Jnv7mCPHd6nk73d5jyc6tlPD7hqf/41uaHiWyGdGjb2mqLLGbvAzpcZNKkv6FujBTPdHhQWQJhTc/bw/RScte3u+MsZmA2zF20RwimblRZucYKwDW4B/GFdmqlVG2+QonJgUocIzklG7X6iV6FyaTBAHqLM9ZMR5+kKCbEO1Ic9qkkVBKk+Mx7GDH2se+rsPKgkRiwwuPtcVJ23Sz2zXgYPWyyVfWwL6++dKKczR9V6zMwcTjQF1Cvcgnyg+9y8x/616fSffUqHYhI8Q4nF1xEj3G9oHTnJiaRRQ+HEBf+ekKmjvDi7MmYI3yVnhW2mwrErvMFHYhpCAdEHkLBrLHdzgpwIQSN0hiJFYR43qMOgkMcD2/7BwraWgy/eembZSorNBFdUUaG5gdAJr1ebYIAsutopM1s5OJ+z5dOfXJdc3VQfoFnpAj71qiQM67iyPA3/rDkN1yVJCZhxPL6Ud4V/4r7w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a01sSUFQSEMrRTlsQTFGdkRNU3dZRGl4N2RnQkJyUkRJSHlKZ1U1Y0FTOURN?=
 =?utf-8?B?WTBFaEVDK2M3QmNTTDd6VUhDN28xc2VaL1hPUHhqODNFeUhRZmtRZFVBcXg0?=
 =?utf-8?B?RjBPVGVNSnhxM1Z3YkF0S1VQOElYQ0t2N0UrNjF1RFZpZzlMR0I5Y1ZGZmsz?=
 =?utf-8?B?NG9BM3ZRUW1ieng0TGtpNmk3azROQkpwZlUzYVJCd05ZNjR6dk10UHBzTlFI?=
 =?utf-8?B?dldaZkZ1Y0VxMys4OFZndFBIemlKZ0N1bUt2dDlrenIreVIxL1EwdEdtcEwz?=
 =?utf-8?B?QlIza1dKL0VUMWNFTnVqWnp5Z1B3UVpNYUtCMlFkdnladjl2YUpYVGdSdkpT?=
 =?utf-8?B?cThONjFFallETHVRdlJFRi9WMGxQSEFXNWtsNDRpUGV0Q0ZWYk5ONmtCUnh6?=
 =?utf-8?B?SkJIcUZvWVhNR2xoYWFSaUtsVmRzcFJkdXlrbmNZTmluV0lRUEprNVQ0MFE3?=
 =?utf-8?B?UlZyNEJ3RmFnOXRPR2FOSzE3em8vVThhUFBYTmdBQkFlK2tZQlR3TmwrbHA3?=
 =?utf-8?B?MTA0bHBobmVWeEo4Z1dRZzBtZFZxSHYxQmJxZ1MvZWk3Nmo0TkdCTnJHL3pj?=
 =?utf-8?B?NWVWK2k4OTQrSnlZWTBML1lONE1NdjkweFE0dzJ0ZVFrZmsyWC9OZGpkS2pa?=
 =?utf-8?B?NnZmK3FKOTFjQ01MTDVnVGJuaWd4ZFdrYnZCaS9RTk85WVg4MlBsaFQ4UlF5?=
 =?utf-8?B?cHZicjdjL3FPTDFnM0gxMTZhbzRYLzlZaUtOelE1YTZIWG1GSXlibmxRWEUw?=
 =?utf-8?B?TDA2c0QvUVBBUE1VVmpxU3JJeStlMkNuOVpWSzBoRnBMODY0anlSU255RFJj?=
 =?utf-8?B?WUJvNlNhMTh4djR3RHMzVEJHVjQxNlF3Tk1GQ3ZCLzY1cmwxUFo3Z1NweXdI?=
 =?utf-8?B?SS8zZmhpSENFQ2N5MU5JRlZsa0J2clBnWlpDVFBNcTczaXJoUEtjSmU5Y1dX?=
 =?utf-8?B?NVFyREdtSVJIaHJhQjBKU1JPZU1DQ0lMMFlqYi9zejlTbEhDNnRwR2FONXZZ?=
 =?utf-8?B?TzF5aGxSYTFsY2dDWGxNZHBhajhlNG5KbW1RMXVCY2owTVYxczJYTDFqd3E1?=
 =?utf-8?B?by9KakhlT0ZnQUswVG5qQ3o4c0NLVTZBVEtKTjRKVDRVSHdMWmw4TFFvc0ZZ?=
 =?utf-8?B?QUJnYndIVStIQ0lBQjhGaEpaSG9jSnBab2ljZFpjREtNWW45cWhPRTY4N2hB?=
 =?utf-8?B?MnNVZCtiWnB0ZnI2Mi92SXNaNUJhNTYrZVlWNmpYdlovU09WSFhnNWRFZ2ds?=
 =?utf-8?B?R2JtSnBkcGlkTDFocE5ydUhORlFSZDBDdGlpVkEyTnp0R0JKQ1JQcmgvenZD?=
 =?utf-8?B?RXpCYzZTWjA4Vm5tSG9iM2E4TnlzQXlwSDB3ZGQwSUd4L1p2RkhwR3QwTUN6?=
 =?utf-8?B?OWhTWkIraGYwbXRhbzh0VVl2V1B5SUJ2SVpsZ0tzWWN1VU9PN0F5Vk9Oc2xV?=
 =?utf-8?B?SmpQS1RuZ29iRk9sNzgwYnd1YXN6eDFKczRldnZsdktNNmd5SFpWSWpLcW1u?=
 =?utf-8?B?am1hUWlhQUdJUHQ3YVhBTm9ablFIYTlSbkZOcHRhaDBXNjZmRnNzY1MvRk0w?=
 =?utf-8?B?NXZTTzByL2ZhK1RydjBYZldISFFwWFpzYXFyR3ZHd3hsekpydHcxRHp5cG51?=
 =?utf-8?B?NzF0SDhLS044ODdoNGUyNFZUZ0V3SHc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 28918336-1f58-444d-7572-08da0b5b919d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 16:55:14.2416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB3749
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 16:55:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163511



On 21.03.22 14:43, Ross Burton wrote:
> On Thu, 3 Mar 2022 at 11:43, Konrad Weihmann <kweihmann@outlook.com> wrote:
>> After scrolling through the log that I can get from a github pipeline
>> (sorry no runner log available) - I noticed
>>
>> 2022-03-03T05:39:23.2334189Z WARNING: cve-update-db-native-1.0-r0
>> do_fetch: Failed to fetch CVE data ([Errno 99] Cannot assign requested
>> address)
>> 2022-03-03T05:39:23.2569941Z NOTE: recipe cve-update-db-native-1.0-r0:
>> task do_fetch: Succeeded
> 
> That's... special.
> 
>> and then do_cve_check run on that recipe
>>
>> 2022-03-03T05:39:56.6239005Z NOTE: Running task 4428 of 5120
>> (/opt/build/sources/poky/meta/recipes-core/meta/cve-update-db-native.bb:do_cve_check)
>>
>> before failing with 2022-03-03T05:39:56.8063851Z Exception:
>> sqlite3.OperationalError: attempt to write a readonly database
>>
>> this doesn't look right to me - maybe there's something special about my
>> settings - I will try to recreate that locally
> 
> Have you managed to reproduce this failure since?

I tried, but without success - but I did a bit of reading on the 
reported Error 99, which seems to be related to using containers (in the 
pipeline itself a container based on ubuntu 18.04 is used) to run the build.

looking at the code block from cve-update-db-native:do_fetch

             try:
                 response = urllib.request.urlopen(meta_url)
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, Unable to 
fetch CVE data.\n\n')
                 bb.warn("Failed to fetch CVE data (%s)" % e.reason)
                 return

I'm not a 100% sure, if the sudden return doesn't leave the 
pre-populated DB file in a limbo state.
I at least would expect a flush + close of the DB file here, or even 
better a recreation of an empty DB + flush and close - but I'm not sure 
what to do in the case the network stack of the OS fails us

But as I mentioned a couple of times, this issue is hard to reproduce 
and just hits me in on those mentioned GH pipelines every now and then.

BTW just one idea for improvement would be to globally exclude 
cve-update-db-native from running do_cve_check... as this doesn't make 
much sense to me - guess setting CVE_CHECK_SKIP_RECIPE = 
"cve-update-db-native" as a sane default in cve-check class should do it 
- any thoughts?

> 
> Ross

