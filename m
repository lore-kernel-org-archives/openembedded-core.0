Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90B9C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 11:10:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.79])
 by mx.groups.io with SMTP id smtpd.web12.9635.1646305831970677138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 03:10:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=uSGL4U5o;
 spf=pass (domain: outlook.com, ip: 40.92.90.79,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAAORAb4eJwsfs4X319GWZFB8S6rAH0BcgZCGwhAy0e6LlxIfr+1/g0Fp+zc5309YQVHPfrGtZNJe4w0lLKyEHicTpJ68sU0vCBnipU//yWsKWU/rPQy7KbrANECsbScB546qi41fbd2agem7shQSDPce12m31+OyOmCX+yJCpGct7bX8kfv8VUSF/Eu7oXkHvS7QSitIRRnO79iCrFskwxnrQYxoHIYY9fS72z4j8nOjZsthkITnJOXRzp4XLABYRgwYM/OYVmq+6EKbuJZAcGqLyEd2ZcFs4YVG/NlymdGkT0vIMZo/RXibcerFgZNbL2IYJjkqtwumakEj5JPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGB8GXuwn+H+Z8M1sLnJArCaw8DSgSrzX7i4tfP7Ekc=;
 b=BiJugdM7QGHw6G0tG0u1213g9AF9oq4nIr8VwUj0tFRBXjyPaR+CV7Nfft30bHkB2SdxqJssRjDjilJKXB/r8ugVW9hfWALBpEtcLnoU0Y9fVE4ibd9kyt/LdfPn+ZYRVHPiDzZVwWITt8mkGn8YfOlu8go+uL8bbPqS0R78W+w2RLt47/LtNhuNIO/RLb5/8ndilCkkaTnpqejGkMWuia2bpeEfdwvQNSpqms952RAh4DRy5IkBKE+r7bi3s/kR1Uape9JoM6g1XQbWx7eD81LGP5VzK51kwZpvml8s8yfOFlpTh8hNpMT/zM2qKQGageTWDk69SSEOQV5qEt5YNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGB8GXuwn+H+Z8M1sLnJArCaw8DSgSrzX7i4tfP7Ekc=;
 b=uSGL4U5o/17eWPNkvTJNbZwPp+3/RHvf3ysuwCFyD9DVON16LwZScUD3t2zRSJIt5mIescpkoUPjvWWozCXotGFcDNSJBN2JiAe0BzgEVjJswNXmLIK1HypIi5w78ZAOBWzM1205Mwhwspf0YzHKWcJ44C9FhlT4hjKopsioTNIzReRGdWqsT4Hw3QsSstsqibPGTpC/3saBwWyNFLCRF/nuZ57y827VrHLSm3Nf4zc/DjUXToxq9yt803Zjmq+kxq0NIJP3wGRDtXc8GSf/YiC47n9s97VyNllo940Qzv7GIPYw0DYlXdv8g3DctdxQdTSepY5coN/0UAyq2vaIiQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2292.eurprd09.prod.outlook.com (2603:10a6:208:dd::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 11:10:29 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 11:10:29 +0000
Message-ID: 
 <AM9PR09MB4642C795688931840887DC06A8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 3 Mar 2022 12:10:27 +0100
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
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAAnfSTsttmQuKcXYcgyfV1wQyptEsZThpYQ3Oa8h6WZsPW9xjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [SfezyOpVMlbeuhq6PrRKpzuKYJIYn26nGk1DWOFki7ECjF1IFw4ldTSxYg8u2xav]
X-ClientProxiedBy: AS9PR06CA0008.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::22) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <7b2626d1-5bd6-9222-101a-dfbef2638b16@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06343b7a-3a46-48aa-76e9-08d9fd066cbb
X-MS-TrafficTypeDiagnostic: AM0PR09MB2292:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VAVizqzJ3r4ZSTxDLUzD1gQ4HI7gUa+kpyrva38LdF2lRxwqCu8a5v8gcGEiL3UesLDosTJlbH7hmeZlHFJJJIH8R0FSE+MRcoLWXp9I5TeG9yrsQRfRwIUSeS0ZQV2AzJtwcbXpHliedMqf6ufGAkOKiJGidHB6VcwDFLirhsegjlyCFy3zzvizH0mEatgVMd2A4AIP+JHej/XZA5w6FVS7uX9OwBxfMaJARurNYrFHcZq4dzdcfxglcNcBJs6q/bPJp3PWOqRVdmuRx0KQNsOzKzFBLaf6y6psCRY/kdFpjzAynPzro5yl/O4JsA3B+JsMKApx2E+Yjlqstx9jtlL66CrqFTSgP+gthfkQEc++IjgP+0KVIPL1sOjuUyXGjmRdxAZqta5tiauR5oN5xGDo4mK35b9+VKw8Jx9StAkOg7aCa71s0KZGw/LCuCyIkXEvqJh2GilQfq9hlZ5v9I0ixd5Fx3AsRjXvpk0g8TrUBraR6NdOmMEUvfiAQ8Hf32k3e75Sce225g0JxmbgkqiYMuZRQHiCBAt8St80c5q0xT+JbYnaKDxJ4qIUwLHmdJrItB8DC7st8DDNWRWskmsKgGdLe3X2azEX1uo1Waa+6ssxKvNKwbdnPwoHNAuOjTRUIiESjdLl2suoro2vUk640Ks1GVXdYt1+PqWU9nQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cUxtTHpMWWtVQ0tPOE5LeCtXYTVDWDZWSHRCRVZZcnVaN1FMOG5GQlcrMHBo?=
 =?utf-8?B?QVVHQTg0VUdrMTZJTTh4M1FNM2ZhdUdPOXhWUzNtTTFKVDZFUi9JYjNHT2JI?=
 =?utf-8?B?UXJINHFpYjBYTFF5UFpyUXh0MWxYREJ6cjN0WkpJNllzL1ZNbm5yUTNOOCtE?=
 =?utf-8?B?N21SWG40OUkvSENvLzIwa3QxV3l5dkJkQ0wzVTlJRFREdDJDcGJuRzlVOFFt?=
 =?utf-8?B?VUM4bXlKWlJSQWlYWEtPU09XeHFSRFFxQmlKZkE0b2xmdG1rVVpVQlB2TS82?=
 =?utf-8?B?bjZHMGJmdm1iazVnN2M4YkdxWUlncEZPSkFSTUlqOHJoSktabkVmdVR0K2ZE?=
 =?utf-8?B?Vjh4bnJ6VlhWTENsUUpvOFY3ZGhqN3M5WGEyd05rWndMYkYwZkhwcHdKVngr?=
 =?utf-8?B?d25QL3AwQ3RiTWhwa25DdjhEL3R4amNzVlJqMTB3S1R2NjhidmhvaXhNT3No?=
 =?utf-8?B?bjFXWThXSWgvUEszSktSWmV4dko3UE9TdjZSQ01KZFNFd1F3WmY5cmx1NHNx?=
 =?utf-8?B?L2JselU5bEg0T0M3QjZ1UlNtK3FVa0lKVk5sVFZKSy9FMXRYTXlkOSthRHVq?=
 =?utf-8?B?RjcrZWE3Q3ZLVWY3cWJrdElxbFkvYjZ1SVdVSGxGQ1JVSU9ic0YvdUhGQnB1?=
 =?utf-8?B?d2t5R1RnSlZBY1Bzb0czM1VWRmsxT0pBeThKaGZxZnBMY3RoeVMxWUc0SVMz?=
 =?utf-8?B?VGtwL2pWdk9xTkVjOURiSW5TeGxQMGw1ak9MSk11RUJNU2ZRS05DOVlMeGN4?=
 =?utf-8?B?cG5rUHVLVGlSbHVabmtjZHBSN3RxdmVLU2lUU1RUMUVScVV6bFlHY25odHln?=
 =?utf-8?B?bEFVajhRaUdIK1pyajBFSXVtaFNUWUtCWDVSdUcwNW9XL0NmU2JLVzgzT1Bz?=
 =?utf-8?B?aThsYnhodWd5ODk4eHg3V1hLZlZERHY2SktENHZ0dnFxUGlLS1F2SDk1TmdD?=
 =?utf-8?B?L3NKZUtJZG8xRk44YWJvbDh5OG43UU9OalM2bXBXdjdLSGVVME41Z1JQeUE3?=
 =?utf-8?B?dy80WDZyMHRiRlBvSGh1WGpZSHc0ZEVSWERxb294UXhtdnk4Z0FTNXlCUnBW?=
 =?utf-8?B?STVQTjRsUUlWV3V2N0NZSWttSnU4NXY5dTZkZ08rNXFUZ2VzN09qWWRSVW9M?=
 =?utf-8?B?WkZPbHJiZEhsV2h4TnZkVFdVYnFnczZ4QWs0d0tHb0F1WkZEQzZkVS9aNkdN?=
 =?utf-8?B?WTJKeVM5dDd5NmxDQXAvWERqMXFvaVQ2Tm1JR0ROdkhXSElyc01lSkZaZUxN?=
 =?utf-8?B?OFZWSEZhMmR5VkVTZlR2SXp6cmlkdnpoczFYZmREMFBVbFdtVGdsbjl6ZkF5?=
 =?utf-8?B?YzNEdkJGeTk1R2M3Y00yWURIQ3FXdlhPMTZBd216Y3lUVjQ1OHpkZm1LWVhV?=
 =?utf-8?B?QWtENEE1NVBFWlE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06343b7a-3a46-48aa-76e9-08d9fd066cbb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:10:29.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2292
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 11:10:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162649

Single from scratch build of core-image-minimal

On 03.03.22 12:07, Ross Burton wrote:
> What's the scenario where this is happening?  Multiple build
> directories using the same DL_DIR? Or was this a single build?
> 
> Ross
> 
> On Thu, 3 Mar 2022 at 08:10, Konrad Weihmann <kweihmann@outlook.com> wrote:
>>
>> Sadly I encountered this here last night
>>
>> NOTE: recipe cve-update-db-native-1.0-r0: task do_cve_check: Started
>> ERROR: cve-update-db-native-1.0-r0 do_cve_check: Error executing a
>> python function in exec_func_python() autogenerated:
>>
>> The stack trace of python calls that resulted in this exception/failure was:
>> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>>        0001:
>>    *** 0002:do_cve_check(d)
>>        0003:
>> File: '/opt/build/sources/poky/meta/classes/cve-check.bbclass', lineno:
>> 104, function: do_cve_check
>>        0100:        try:
>>        0101:            patched_cves = get_patched_cves(d)
>>        0102:        except FileNotFoundError:
>>        0103:            bb.fatal("Failure in searching patches")
>>    *** 0104:        whitelisted, patched, unpatched = check_cves(d,
>> patched_cves)
>>        0105:        if patched or unpatched:
>>        0106:            cve_data = get_cve_info(d, patched + unpatched)
>>        0107:            cve_write_data(d, patched, unpatched,
>> whitelisted, cve_data)
>>        0108:    else:
>> File: '/opt/build/sources/poky/meta/classes/cve-check.bbclass', lineno:
>> 198, function: check_cves
>>        0194:        else:
>>        0195:            vendor = "%"
>>        0196:
>>        0197:        # Find all relevant CVE IDs.
>>    *** 0198:        for cverow in conn.execute("SELECT DISTINCT ID FROM
>> PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
>>        0199:            cve = cverow[0]
>>        0200:
>>        0201:            if cve in cve_whitelist:
>>        0202:                bb.note("%s-%s has been whitelisted for %s" %
>> (product, pv, cve))
>> Exception: sqlite3.OperationalError: attempt to write a readonly database
>>
>> So it seems your patch doesn't solve the issue
>>
>>
>>
>> On 23.02.22 13:54, Ross Burton wrote:
>>> All of the function in cve-check should open the database read-only, as
>>> the only writer is the fetch task in cve-update-db.  However,
>>> get_cve_info() was failing to do this, which might be causing locking
>>> issues with sqlite.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>>> ---
>>>    meta/classes/cve-check.bbclass | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
>>> index 2d69aeba4b..d715fbf4d8 100644
>>> --- a/meta/classes/cve-check.bbclass
>>> +++ b/meta/classes/cve-check.bbclass
>>> @@ -265,7 +265,8 @@ def get_cve_info(d, cves):
>>>        import sqlite3
>>>
>>>        cve_data = {}
>>> -    conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
>>> +    db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
>>> +    conn = sqlite3.connect(db_file, uri=True)
>>>
>>>        for cve in cves:
>>>            for row in conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,)):
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#162258): https://lists.openembedded.org/g/openembedded-core/message/162258
>>> Mute This Topic: https://lists.openembedded.org/mt/89339702/3647476
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

