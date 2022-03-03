Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85856C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 11:43:31 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.44])
 by mx.groups.io with SMTP id smtpd.web10.9678.1646307809964369397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 03:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=VV2kMY7m;
 spf=pass (domain: outlook.com, ip: 40.92.91.44,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZA8rI98vQlAJmmX88NJkvXU/fbQ2z+ZlGTCjYlMouqrGuzhJ+mgN/NnQZeg8oxw1ntAfHfiCSWNgzCtrgrzAHqI0Zqvo4yi5mZWLxvAIlyHyXhfgv7N8KJkxM9J850qj5yWf92hg/1grqesnahgjh4Uq9tk+KJEMZBe5AePUQSs0+cnZ7xm/Ca6HZhHNQEqXTGTgDttbf/3W7mHvWA7PiAAG6+HsPU9nNqo+t5ciWs+hz2mgNuW5VYYf03D108/7veBA4Fao8lZOnIsFJoi4cyuY1Y+3qvoFSenzc6XCoPZBocyVtJcpz/3hWgLbC7WRVy1p4h/LDdM7hIwomIV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liiKuz8nBgew0xy/KgSOLi4odDLrgZpVZiDoaj9iEj4=;
 b=iKjjDY3bXi6boinuRTNKDUGHKtyHH11la5VRFqCyQAesF/g4BzVpCq02ODZa+yS6iHSPsrwqVcYXp8QRvhQkOG+MbljBb8JQTfmrYd+vxKKLaeyiK8SqqTDuEjNe8VVKF8yJvr/N66GrH6ge33bCgXPjcF3c1Ppz3QQxVkTxO0JSHDvza2i+rpwif03VZv5o8wwg8AKPEVawjl72azUhyFxsfzUAnbdkSdqb/C19d7drhZsvDpvgQvDztg7nzylRTMDJYgaNHJ4oI6y8HceuGXaFqiN5d4ywY0kERPnOYRpIv+PRVdWKkPX59LyGwWC9m7wnQ0PNYdpd7F4fySYyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liiKuz8nBgew0xy/KgSOLi4odDLrgZpVZiDoaj9iEj4=;
 b=VV2kMY7m2dXq3d17NLNnyAvVWqDu+ZNVq9nNFKLg97bz4dMnRD8VEZak5db+g9uPi+KXn8aJcXKiF4i8TEKW7w/aPLnm4Qg0bTd39WiPWIsExdm5FuXitJ7klxtFQYJgt7hn2T6eThWkU7D/PCYRejhUnHoRe/eF8+SNxcsckdgjNAD2yhukElQtp3avFptr1CAhrWvNyCojfCdlmextnFEyX5uQiBH4aPIRatjOQrGNrtg7inEMeimjEZ6SzFLWfVW+LERIrR4m23Wa/RV8QxF0D1l3xeTb/TzQmehZhHvkmrbtuCh1pxJVPC61RCufnktvdZC2SzEAQlr6uugPJQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by DBBPR09MB4633.eurprd09.prod.outlook.com (2603:10a6:10:207::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 3 Mar
 2022 11:43:22 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 11:43:21 +0000
Message-ID: 
 <AM9PR09MB464236CC1D57B2C351A8C0D2A8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 3 Mar 2022 12:43:20 +0100
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
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAAnfSTs3QP5zDqpPvGHx1TpyhyTg43k5eguiaK81VH9deR5h5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [yPsEob6rEi84DIFyiDcdgKcDtnToWdswylvPa+nJj5ZweVXTHYheJiV3oVRrqYNk]
X-ClientProxiedBy: AM5PR1001CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::27) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <246769d9-90bc-cf78-cfd0-707759cd6319@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65e19284-0169-40da-7d1c-08d9fd0b04ce
X-MS-TrafficTypeDiagnostic: DBBPR09MB4633:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pa68vVvhjPpnhGHSjslDGb6n9nz1JqjdPem2nRy9QAzX7kmHxphCjoAREKNJqvEJ8tA1TKoQdDFDtvJcMMlmZi2G3Jp+RnzKIwgQcgaOod5dZaPbDdON0Kx4kIlUfpNbEp5x6SWjgIPsTxClwdXVw2/KThTiNE2JvToMQaygCZwFK1tkY+gMAteOw8JI6F/QIOeDc8VD+oVX+mXTd0XnehyjtX53RHVCwOaVDfjIz3THw9MsywmlbOmH/go1tk9sSK4/AAJhChzFCHkabOQ//oDJ3KzhMzcrNdY6PKDXs1KyDxBdI9px4NFVgUQQ1VHsedEuy7fnJAGuRUEDkAVYDv875l++k4DMXuVooS7Toyfk5NyzzaNpLadXnIO8txgW9o0K7kkhEuRq3YU3YDGG1epyiGsGyz9O0aCIUSt6ev8GN5J1d2Qp31xuKuwZxfrhe2nzXtr0oymvhdOVWdjf59tRXm2JSOku9KUu+xrOd0OFBWt+aEn9lVZDBMdfRjFL6rHoeCYbjMKcSpx4cIncRtgl3QVYDrZDjAjoA6n59Lbs0lqHjvfONdnb5ZZ6AmvXEWrRUUyAV3uSGidTWKoTZr5tz5GKI7t2DBQfDSOe+yWXBPE0mFb1dUpmG1/ByoBLhpTWPeis7e7jdmWWRjp9jjLaA3ohjT2X5KypzXaQrV4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGVLcm9BZnpEc0NoS0tiN0cvdkpXMWxwQjRLTXp4RWtvT2h6ZlNaQ3VhQXV2?=
 =?utf-8?B?UHZHZkVESkwyendqQS9QcTcrYVdHYmo4enl5YXdkdjdJam1tYWVmQU93eXBQ?=
 =?utf-8?B?MnZvSUZnUFR0UjRRT0dma2FwU3FsdXdvczBGcyticUdzSzV4SlVOSkJJL3Ir?=
 =?utf-8?B?cmZ4SVViSEkxZUdoRWtUaVZuRmJPR1RlbGNBc0lLOGo3SHgvaHBSNkM4RUhw?=
 =?utf-8?B?dDZCYlRhQUIxdTh5eklGMGppTm1MbEs2L1dQT21jUmcwSnJLbGVGc3RnUFI5?=
 =?utf-8?B?OEF6dlBXQ3N1RzJtSnQ3eElGdFBKc2tSS0JOd3ZnUzFQNWllbExndXpOMm9i?=
 =?utf-8?B?SDJOdzNkSUVLdDIyaW5iaXpxQ2FpQUs4WFlUWWp3VWV5S3diaXdGd3NXTk8y?=
 =?utf-8?B?Z0s1SGxJMS9vS1BLSllNRXp2WGtIMCtKM0tTbzdHbVJmakN4YWFBMHY2NEwz?=
 =?utf-8?B?UC9OSi9veTh5c1Y2Z2FNTEN6TmtjTW9JdElTVWVZdXorRGs1NnNsQU10OWdr?=
 =?utf-8?B?aTVka1ZYOFlLS2VkeUhJenhvcTZLMDYrYlduUkI4b2FLUG1Td3pPSExIeXdZ?=
 =?utf-8?B?NENDenp3ZHhEUW1DTUR1eFhqU0tyTG9mLzNMdWVheFVYU0ZSTU9VdDVmbmFQ?=
 =?utf-8?B?ckpBL1FTbmNUQ3dmOHNYMmUwSlVuWGZRcnYrQnJGNUZrWTRiV01pRkk1MXNi?=
 =?utf-8?B?SDlLczFhcU8yZG1hb3hLZHNpckMrTlUwcXdZUkhvMG9jekp4clNXV3dReThE?=
 =?utf-8?B?b0pjUENpdEVMMmNsSDFXaEFYN0RjNVRZd2FveVFPTVpiZ0xvenVaL3J5VW52?=
 =?utf-8?B?MDVtbTQ2SzFtdzNGUGYvQnF1S2g0K2x4amg2QnFVRjl4TWEwR3FEVUtoblk3?=
 =?utf-8?B?VWtFNDdtZVE1YzRoM0VrOERtaVBHVkZkS2theW4vN25EbldnNU9yb2ZUQzFa?=
 =?utf-8?B?Y1Jidk0rVnM5aU9pTWQ3dmJQaloxWFdxeEpxL0YxWG5MS2lUMzRxSWI1VzVC?=
 =?utf-8?B?LzgyMkhpd1NKRnprbFlHMnhkR3UrQndSQno5WTh6dWJvakdhQk1VT2Nzam0r?=
 =?utf-8?B?dXowYjFWRTVybVhuOXkyd0xNK2FhQWpGb21KaG5XYlpJZDN6MXQxVVY5SXJz?=
 =?utf-8?B?TDNFMy9nZUVEYzI5bTRXelVmYW9tUjdtakJEaVQ2bzJ0VFVhVStpUXBobjlZ?=
 =?utf-8?B?SWg4ck9adWUwNVUvRTIwZVlranI1QXY3MzM1UDdZUHlHU2p4Ly82LzgwZmpG?=
 =?utf-8?B?dlVRWkVUcjRhd1ZOOUQ5UVNpWS92SGxIMTNrRGpHV2lGbUJNYkVvL0hEUmdQ?=
 =?utf-8?B?QjFOb1JLWXI4UFNzUGVZWXdjUWhSZU9LVHNBN25ZVmlSdHFGQjJXd1M1WTNU?=
 =?utf-8?B?NkNLTE5nTnZwOEE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 65e19284-0169-40da-7d1c-08d9fd0b04ce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:43:21.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR09MB4633
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 11:43:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162653

This one is odd...

After scrolling through the log that I can get from a github pipeline 
(sorry no runner log available) - I noticed

2022-03-03T05:39:23.2334189Z WARNING: cve-update-db-native-1.0-r0 
do_fetch: Failed to fetch CVE data ([Errno 99] Cannot assign requested 
address)
2022-03-03T05:39:23.2569941Z NOTE: recipe cve-update-db-native-1.0-r0: 
task do_fetch: Succeeded

and then do_cve_check run on that recipe

2022-03-03T05:39:56.6239005Z NOTE: Running task 4428 of 5120 
(/opt/build/sources/poky/meta/recipes-core/meta/cve-update-db-native.bb:do_cve_check)

before failing with 2022-03-03T05:39:56.8063851Z Exception: 
sqlite3.OperationalError: attempt to write a readonly database

this doesn't look right to me - maybe there's something special about my 
settings - I will try to recreate that locally

On 03.03.22 12:27, Ross Burton wrote:
> :tableflip:
> 
> Thanks, I guess!
> 
> Can you share the full bitbake log from that run? I'd like to see what
> jobs are running in parallel.
> 
> Ross
> 
> On Thu, 3 Mar 2022 at 11:10, Konrad Weihmann <kweihmann@outlook.com> wrote:
>>
>> Single from scratch build of core-image-minimal
>>
>> On 03.03.22 12:07, Ross Burton wrote:
>>> What's the scenario where this is happening?  Multiple build
>>> directories using the same DL_DIR? Or was this a single build?
>>>
>>> Ross
>>>
>>> On Thu, 3 Mar 2022 at 08:10, Konrad Weihmann <kweihmann@outlook.com> wrote:
>>>>
>>>> Sadly I encountered this here last night
>>>>
>>>> NOTE: recipe cve-update-db-native-1.0-r0: task do_cve_check: Started
>>>> ERROR: cve-update-db-native-1.0-r0 do_cve_check: Error executing a
>>>> python function in exec_func_python() autogenerated:
>>>>
>>>> The stack trace of python calls that resulted in this exception/failure was:
>>>> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>>>>         0001:
>>>>     *** 0002:do_cve_check(d)
>>>>         0003:
>>>> File: '/opt/build/sources/poky/meta/classes/cve-check.bbclass', lineno:
>>>> 104, function: do_cve_check
>>>>         0100:        try:
>>>>         0101:            patched_cves = get_patched_cves(d)
>>>>         0102:        except FileNotFoundError:
>>>>         0103:            bb.fatal("Failure in searching patches")
>>>>     *** 0104:        whitelisted, patched, unpatched = check_cves(d,
>>>> patched_cves)
>>>>         0105:        if patched or unpatched:
>>>>         0106:            cve_data = get_cve_info(d, patched + unpatched)
>>>>         0107:            cve_write_data(d, patched, unpatched,
>>>> whitelisted, cve_data)
>>>>         0108:    else:
>>>> File: '/opt/build/sources/poky/meta/classes/cve-check.bbclass', lineno:
>>>> 198, function: check_cves
>>>>         0194:        else:
>>>>         0195:            vendor = "%"
>>>>         0196:
>>>>         0197:        # Find all relevant CVE IDs.
>>>>     *** 0198:        for cverow in conn.execute("SELECT DISTINCT ID FROM
>>>> PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
>>>>         0199:            cve = cverow[0]
>>>>         0200:
>>>>         0201:            if cve in cve_whitelist:
>>>>         0202:                bb.note("%s-%s has been whitelisted for %s" %
>>>> (product, pv, cve))
>>>> Exception: sqlite3.OperationalError: attempt to write a readonly database
>>>>
>>>> So it seems your patch doesn't solve the issue
>>>>
>>>>
>>>>
>>>> On 23.02.22 13:54, Ross Burton wrote:
>>>>> All of the function in cve-check should open the database read-only, as
>>>>> the only writer is the fetch task in cve-update-db.  However,
>>>>> get_cve_info() was failing to do this, which might be causing locking
>>>>> issues with sqlite.
>>>>>
>>>>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>>>>> ---
>>>>>     meta/classes/cve-check.bbclass | 3 ++-
>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
>>>>> index 2d69aeba4b..d715fbf4d8 100644
>>>>> --- a/meta/classes/cve-check.bbclass
>>>>> +++ b/meta/classes/cve-check.bbclass
>>>>> @@ -265,7 +265,8 @@ def get_cve_info(d, cves):
>>>>>         import sqlite3
>>>>>
>>>>>         cve_data = {}
>>>>> -    conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
>>>>> +    db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
>>>>> +    conn = sqlite3.connect(db_file, uri=True)
>>>>>
>>>>>         for cve in cves:
>>>>>             for row in conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,)):
>>>>>
>>>>>
>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#162258): https://lists.openembedded.org/g/openembedded-core/message/162258
>>>>> Mute This Topic: https://lists.openembedded.org/mt/89339702/3647476
>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>

