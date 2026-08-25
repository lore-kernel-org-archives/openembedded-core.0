Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439F9C61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 11:02:04 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16969.1787644928143424857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 01:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=VNFGdWGu;
 spf=pass (domain: est.tech, ip: 52.101.72.44, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3yZRJOs/pnBn36sPLWemjIS4EcakE+8aScS+k8okqJIWRwpEV8aUHhd+2GnehCZS9mK/L6+YiWGKzLYSbvqa2bVqTf5zFIBY/cH0DOUn+jw9pnqUjKbzkiBga6nzqD6lbNpA9Yydyf19cwhdC4OOUZYjvXI0ACLoO2GSL0BZDgMUot4Q+4zc2Mmd8ticNmdSsGKMLfNPufQ9wLiCJtNwjBKuHNAtpT43+SjHU6zV61acDrZHONZhB1AbRrJz17hTukb86/PBOx64NJ3t+uRV+gZghYAgJ6/oQbtpKqxLwfSXpnIy/n8hKvpFa93REo6dPjJ5+UgLShR0nsux3DTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qjvpjEo0R1G+sHEiU2k10VMvwP8HwMaBROY7EnQWeQ=;
 b=aeNqVBacx2WA7ZHXJpkCp9rJGfC7S1aLP7AwfcixpbAWwb3W/PNKjjfrn1IQqopUCEwXtMsvELfCHT/nNkjBVnKt/fsM8N8XG3zBplE/aod/JLytinuiiWUGR7Z8zBpaoutwOxr6gOXfDQqglCUBPSJ9xBncyOJjLbTgJGXH2ayPmwRUHzyp8aCrYNF7+EVF3iEVRXg58WjzPVVOXcbVElvPydKIYt4Guz7iRZFERhPjQgyZk/n6/JuZz1d+xzRy0ZmbelffyxQMedtydjL2qEDVjxE6xiIfyNj/OteJhNvM5en33LminEHIcYRzU+7AMMpsqYtmdX7WlLKhPvR2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qjvpjEo0R1G+sHEiU2k10VMvwP8HwMaBROY7EnQWeQ=;
 b=VNFGdWGuWUPdmL3ybPaF5QTSZt0y81bnj1JNRbuWb1gawPueTbFf+90YEyQk1MFelPDo9IqPsdK0tA7mxKtmQmMfek7pxICfIDBH7SoPj2dZe9FhCxcOcktlzrOSeo0jo6dICQxO7U1dmxeuEKHkBRkpslqY4Jd0Qsdd74T3qNdzEmSOZdDDAKG1PX/GXe19XyacZkohlL8xPG6Lni/s/swqBDbzaJ7cVOKwe5C+P8vxP2QwqQUdoNm8WDbzm6Lsmvth/3CQ5EongJbA5Qrlh1nU6Jg9j0SjVTsrDfqYW2Pg+A75XUtCst2H+Ob6DJCfd68M+ljEQQf9gz6UpJQgxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by FRWP189MB3482.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 08:02:03 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 08:02:03 +0000
Message-ID: <62b95db3-cc69-4ee2-9eb1-e36310fe1f9e@est.tech>
Date: Tue, 25 Aug 2026 10:02:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][wrynose][PATCH] gnutls: fix CVE-2026-33845
To: Yoann Congal <yoann.congal@smile.fr>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260727153312.1704911-1-adarsh.jagadish.kamini@est.tech>
 <DKXA4BZU6EMT.1W6DIXYU6GQ0S@smile.fr>
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
In-Reply-To: <DKXA4BZU6EMT.1W6DIXYU6GQ0S@smile.fr>
X-ClientProxiedBy: OS6P279CA0013.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:30::15) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|FRWP189MB3482:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a0edf8-a04a-4692-63ac-08df027f25d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|13003099007|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	NUIxwbaa+SQ1ifkxjDTCA0optF8hD+OhzpPGJl/0cVhhCexABQA2Vw1fW9l0mWImorBVnWmVRrrQiv5wzRvDsoW9I8lN03zMeN8dcAw9S/SGQfqLdn58ymyEia9DQmhDLX0IjkeQbGUJekUyDseokqPpsfJE8aZklEFztmjLcgwAsutgznsrwS1l6k/DI/ICCUsKwWs8MGQMllbuxhK65mmQLUlFUS7AWxcsknfObeZ/E0pBDvphKCnaVwoPy/x0f1fZsz/kZdCur+s2nIPkhK4PGVYKC6mYoU7qGOytx7MOcFxVBOrwZRSsyhXVTbgu/evqEdwLdc06YMdnVqrWoydQ9rCwTFKOx5+aj4wbi0zigBgY4uxqhjxldQueYHIjnaRtjuUhh0/wkhaaw0Qur5Wu78uoOIKDi+n4EMKbQdOGDqGPIuoEKHt9ZWEFhwgSpLQApYJsZhRF07ExzetrZaPo9BeJSXSGIOvjF/o4ABDhCQ76/vHCaHbwf3oJHetyPI3qqgmg9Lty1vfRSeyO3mvMNSUc7Q8OVEFJWgwA3ZDxwRItKYjEIOeo69ZKph5I5T761TEij5uIXGuhEwUjuPMli5QJWIAndWYqgAM5NrvlNjjEC++ArhI7UHEw0b77+FeElkR9Voet0Fkl3ctDZzNBYEdPb8AHTJ4d1ER/ahQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(13003099007)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHZEVDJMTTVtdFp5enNLZS9lRTFrSy8wbWkwMjVhcjlvUmlyZHh3SW1odUNy?=
 =?utf-8?B?UXd1bDBCRm1sMmx3UjRwblFhWGVEa1l5S2tPaWtPMGhEWFp1LzhIbVUybU1M?=
 =?utf-8?B?Q1h0RmFtMU5TeTYyUlBlVzF5NzluNys0MzgwcGhFeUwyYlNnSkNQbFcyMXlj?=
 =?utf-8?B?a1J6cGswM3V2QklzNUxhTmxUVGtDUitQbnEvMHBXT05DWlRCVmNZMUUzVTFC?=
 =?utf-8?B?M0paeW9qanVFRkZZVnFBVWNkYlpLUXJqeFVpLzA2UXhUd2hROUIvdGZWYzQ3?=
 =?utf-8?B?UU1UU093aEI3aDllUVcxbklRdXd0STZRdXNoVkJtelNyWXFtSEwwUzlCVUNY?=
 =?utf-8?B?Vjh6WFRZS2trTG5jZURUdG1kZnRHNkp5RDVPTktPcml5RnlYQnVyd1B1KzZL?=
 =?utf-8?B?NHVncW9ITFJYZ0NFT0N6dlRsUENUZzNsZzBHT3YvYnZXb0NENDJlemZqeG1p?=
 =?utf-8?B?eGVqamxEWHRyTkpDMk5pVE1sY21aM3ZkRnVLeTM3Z0NOM2dmM1NmbzMrOW1o?=
 =?utf-8?B?ekdhZFllQldVMjY3VHhZV2ExUWhxS1NIRWFVQm1XTnIrS2hoNkdxcnBaVGdM?=
 =?utf-8?B?ZGRtWFNyWnIwb0w0bXdxT3NDblFEVmxzQTRxRG93U2JZREhBUVRtRmw2Tk9z?=
 =?utf-8?B?TTQ0eWlNL0wxVlZwWURQamY4elpDaDgzSE1rYTNOQm5KZWNqYVRaeUp2TFhs?=
 =?utf-8?B?OS8zdDQvTnZmdDhGd2gzM29rQkxlUzNWMGp3ZG9HK1RWU24zRWNxRkRGaVM2?=
 =?utf-8?B?Wk1mTlphWCsvUVBaL2NSTk5oV3hZVldwRGptOTJBVzQrVUQ5UTRsMHh4UWNW?=
 =?utf-8?B?cDBGRVRpQjJqQnpteFlCQ0FabmhYS3hjb0ZtZ1o4cmFTb3NSUkUzaHNNK2tk?=
 =?utf-8?B?Zng2NDI3RXdDeDNtVjlNQVZVWnN5YlZ4dUs2a0dPUDl4U1VOUlpjZE1pUW9s?=
 =?utf-8?B?REE4czVTeVF4MVIwaVh0OHUxZVN0V1BvY256NzZRNmFmdC8xdGJNSXRnQzV6?=
 =?utf-8?B?SzhaVEFwVDdVYkdaZUluQmMwVnRQR1NaTEV4cGdpZ0xCdlJBWmlKMDRIYXND?=
 =?utf-8?B?QzBwdVpJQkZXQzlKVlV6aURlcnVsZUdiaWRCTktkWVExTnJmWjYyWU1NTGp3?=
 =?utf-8?B?WWhXcFVZKzNJbnV5V0dNVlFPN0s2T1gvUDNlSkhLVWJrWEZ5SmU1c0ZLeDRG?=
 =?utf-8?B?NFdMcTA4UnlzQXg0Y2RRQ0dXNDBBeEliL0ZxR0JSMDJLT255VTkyMzRiYXhx?=
 =?utf-8?B?cU8zMS84SlJTQUpwUXd3Nm1jMkUzNWExOEpBL0J5ZTF1dTBIUWlBYytraUxo?=
 =?utf-8?B?ZkRpOHFBNmN4dSs2MUYvYy9JbXA1WkhHb0NZY0l2eWRibUlhZ3pFMGYrTjQv?=
 =?utf-8?B?WllwWStZV1NjZVlKbUlXamxTc2tYeUdoOGRnTDlERXo5WWhtOGxidHpMRFNl?=
 =?utf-8?B?a3ZwUVRkTmFqaWRnbjF5aDE3MThXL1I3Q3dCTHJzY2xMRnV0RVAwYnhBWXEr?=
 =?utf-8?B?Z2xyc0xYTXZ5bnE0S0ptbVZ4T0JtRmF5V0grbEFNRllMYVdMME9zQzhQWEg4?=
 =?utf-8?B?ZFJvMUpEempDc0lFTGxQNlpuR1kzTTZmdUNtQjQ3REV6MmZvTFRSNCs5VktW?=
 =?utf-8?B?M0tLVmJyU083ZDVZOVZEdzYrQy9YQThKM1ljVmNCS2FxcGdzd3VsZG15TVJE?=
 =?utf-8?B?c056Q2p1cjlGSjAraHVLZEY1KzA1SmJ2blhMeFMyT0M4S0c3eStvWGYyZWJy?=
 =?utf-8?B?ZEQvS3hXaGxoMS9OOHF0YkliRzM2L1FCaFYxQ3dCcE9GdnhRVTA4OVY0ODY4?=
 =?utf-8?B?NGxmQW9oTGs2WFA4aVZhNXFrT3dHdnI5alI2RkczZGJYWDRVTTl5a0pLVmps?=
 =?utf-8?B?dXZkUEE3cm5Pa09YNWdhY2Y2SjR0WFJWT3VRb3hSRzFURnkvZ1BBR1ZLRjc3?=
 =?utf-8?B?N2M2RjMrV1FncE00THlMYW94QWVlekRNK004ejdWbVJVT2VTQWJZQWV4Tmpk?=
 =?utf-8?B?TitkK1JvWkl2bkhzUnREb1hKcENvSGgwejgyVHB5S2hJdCtQTmI4STdIYVlT?=
 =?utf-8?B?NlhKNXBpL0NDYkJBVFJOc0Y3UDZCSE5ZRHpZZzlIb3hsY2NBZVVEb2JTU2ZB?=
 =?utf-8?B?Z3ZtS3NIaURudHdVVkh5MUc0YnB2cElrMUU0c1I5ckphVEhIQWpaS3F4UTZQ?=
 =?utf-8?B?UERCVkRLRUxmY3BuOXh0YTU3M2RuaS9nUmZrZmRWL09FaEJidTIvWXFuZnJF?=
 =?utf-8?B?OTh5VU8wNWk4MDdBaWNJSlM4d0Z0Nmwwck1VWjRpVUpidTVCbWlYTDdFWTRJ?=
 =?utf-8?B?SDVWeG5TS0NjOVhERy95WTROVUlmdFJUeVJDVjluSHh3MWN1Mnp3WWJYclJy?=
 =?utf-8?Q?bFjYpbio/iEg+AnM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a0edf8-a04a-4692-63ac-08df027f25d4
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 08:02:03.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjL8rw6UVEwh4IixWSSuSNmLvYidUBjOZvD3F1Vo0V1rhPeHWA89PggTL7snM3/xtP7+PPFpBa0Qo47c7ldJjQQ1m1MBIjuYZOMcVWn/CM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3482
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 11:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244228

On 8/24/26 17:29, Yoann Congal wrote:
> On Mon Jul 27, 2026 at 5:33 PM CEST, Adarsh Jagadish Kamini via lists.openembedded.org wrote:
>> Backport patch to fix CVE-2026-33845.
>>
>> References:
>>    https://nvd.nist.gov/vuln/detail/CVE-2026-33845
>>
>> Upstream fix:
>>    https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275e87d0415413
>>
>> Tested with ptest:
>> Before: PASSED: 371, FAILED: 0, SKIPPED: 15
>> After: PASSED: 371, FAILED: 0, SKIPPED: 15
>>
>> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>> ---
>>   .../gnutls/gnutls/CVE-2026-33845.patch        | 195 ++++++++++++++++++
>>   meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
>>   2 files changed, 196 insertions(+)
>>   create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
> 
> Hello,
> 
> It looks like this patch does not apply to wrynose anymore:
> | ERROR: gnutls-3.8.12-r0 do_patch: Applying patch '.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-core/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch' on target directory '.../wrynose/bitbake-builds/poky-wrynose/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/sources/gnutls-3.8.12'
> | CmdError('quilt --quiltrc .../wrynose/bitbake-builds/poky-wrynose/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch CVE-2026-33845.patch
> | patching file lib/buffers.c
> | Hunk #1 succeeded at 919 (offset -4 lines).
> | Hunk #2 succeeded at 933 (offset -4 lines).
> | Hunk #3 succeeded at 1000 (offset 11 lines).
> | Hunk #4 FAILED at 1009.
> | Hunk #5 FAILED at 1018.
> | Hunk #6 succeeded at 1110 (offset 11 lines).
> | Hunk #7 succeeded at 1122 (offset 11 lines).
> | Hunk #8 succeeded at 1311 (offset 11 lines).
> | Hunk #9 succeeded at 1327 (offset 11 lines).
> | 2 out of 9 hunks FAILED -- rejects in file lib/buffers.c
> | patching file lib/gnutls_int.h
> | Patch CVE-2026-33845.patch does not apply (enforce with -f)
> |
> | stderr: ')
> | ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wrynose/build/tmp/work/x86-64-v3-poky-linux/gnutls/3.8.12/temp/log.do_patch.240673
> | ERROR: Task (.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_patch) failed with exit code '1'
> 
> Can you rebase and send a v2?
> 
> Thanks!
> 
>>
>> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
>> new file mode 100644
>> index 0000000000..d81ffb7ef7
>> --- /dev/null
>> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
>> @@ -0,0 +1,195 @@
>> +From 9679a9c8ab1694b78c7cb285d29da904e3f3bc45 Mon Sep 17 00:00:00 2001
>> +From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>> +Date: Mon, 27 Jul 2026 08:58:02 +0000
>> +Subject: [PATCH] buffers: switch from end_offset over to frag_length
>> +
>> +Instead of maintaining an inclusive [start_offset, end_offset] range
>> +when reassembling DTLS handshake,
>> +track start_offset and a relative frag_length instead.
>> +
>> +You'd think it'd be a no-op, but it fixes:
>> +
>> +* 0-length fragments triggering completion if message was 1 byte long
>> +* a remotely triggerable underflow and an ensuing heap overrun
>> +
>> +Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
>> +Fixes: #1811
>> +Fixes: CVE-2026-33845
>> +Fixes: GNUTLS-SA-2026-04-29-3
>> +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
>> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>> +
>> +CVE: CVE-2026-33845
>> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275e87d0415413]
>> +
>> +Backport notes: adapted to the stable branch, no logic changes.
>> +- lib/buffers.c: the local fragment-size variable is named frag_size here,
>> +  not frag_length as upstream; renamed accordingly.
>> +- lib/buffers.c: merge_handshake_packet() has no recv_buf alias in this
>> +  branch, so recv_buf[pos] was expanded to
>> +  session->internals.handshake_recv_buffer[pos], which changes line wrapping.
>> +- lib/gnutls_int.h: applies cleanly.
>> +
>> +Assisted-by: kiro:claude-sonnet-4.6
>> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>> +---
>> + lib/buffers.c    | 57 ++++++++++++++++++++++++------------------------
>> + lib/gnutls_int.h |  4 ++--
>> + 2 files changed, 31 insertions(+), 30 deletions(-)
>> +
>> +diff --git a/lib/buffers.c b/lib/buffers.c
>> +index 672380b05..2d77e7590 100644
>> +--- a/lib/buffers.c
>> ++++ b/lib/buffers.c
>> +@@ -923,10 +923,7 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
>> + 	}
>> + 	data_size = _mbuffer_get_udata_size(bufel) - handshake_header_size;
>> +
>> +-	if (frag_size > 0)
>> +-		hsk->end_offset = hsk->start_offset + frag_size - 1;
>> +-	else
>> +-		hsk->end_offset = 0;
>> ++	hsk->frag_length = frag_size;
>> +
>> + 	_gnutls_handshake_log(
>> + 		"HSK[%p]: %s (%u) was received. Length %d[%d], frag offset %d, frag length: %d, sequence: %d\n",
>> +@@ -940,9 +937,10 @@ static int parse_handshake_header(gnutls_session_t session, mbuffer_st *bufel,
>> +
>> + 	if (hsk->length > 0 &&
>> + 	    (frag_size > data_size ||
>> +-	     (frag_size > 0 && hsk->end_offset >= hsk->length))) {
>> ++	     (frag_size > 0 && hsk->start_offset + frag_size > hsk->length))) {
>> + 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
>> +-	} else if (hsk->length == 0 && hsk->end_offset != 0 &&
>> ++	} else if (hsk->length == 0 &&
>> ++		   hsk->start_offset + frag_size != hsk->start_offset &&
>> + 		   hsk->start_offset != 0)
>> + 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
>> +
>> +@@ -991,11 +989,10 @@ static int merge_handshake_packet(gnutls_session_t session,
>> + 			hsk->data.length = hsk->length;
>> + 		}
>> +
>> +-		if (hsk->length > 0 && hsk->end_offset > 0 &&
>> +-		    hsk->end_offset - hsk->start_offset + 1 != hsk->length) {
>> ++		if (hsk->length > 0 && hsk->frag_length > 0 &&
>> ++		    hsk->frag_length != hsk->length) {
>> + 			memmove(&hsk->data.data[hsk->start_offset],
>> +-				hsk->data.data,
>> +-				hsk->end_offset - hsk->start_offset + 1);
>> ++				hsk->data.data, hsk->frag_length);
>> + 		}
>> +
>> + 		session->internals.handshake_recv_buffer_size++;
>> +@@ -1012,7 +1009,7 @@ static int merge_handshake_packet(gnutls_session_t session,
>> + 		if (hsk->start_offset <
>> + 			    session->internals.handshake_recv_buffer[pos]
>> + 				    .start_offset &&
>> +-		    hsk->end_offset + 1 >=
>> ++		    hsk->start_offset + hsk->frag_length >=
>> + 			    session->internals.handshake_recv_buffer[pos]
>> + 				    .start_offset) {
>> + 			memcpy(&session->internals.handshake_recv_buffer[pos]
>> +@@ -1021,28 +1018,34 @@ static int merge_handshake_packet(gnutls_session_t session,
>> + 			session->internals.handshake_recv_buffer[pos]
>> + 				.start_offset = hsk->start_offset;
>> + 			session->internals.handshake_recv_buffer[pos]
>> +-				.end_offset = MIN(
>> +-				hsk->end_offset,
>> ++				.frag_length = MIN(
>> ++				hsk->frag_length,
>> + 				session->internals.handshake_recv_buffer[pos]
>> +-					.end_offset);
>> +-		} else if (hsk->end_offset >
>> ++					.frag_length);
>> ++		} else if (hsk->start_offset + hsk->frag_length >
>> ++				   session->internals.handshake_recv_buffer[pos]
>> ++					   .start_offset +
>> + 				   session->internals.handshake_recv_buffer[pos]
>> +-					   .end_offset &&
>> ++					   .frag_length &&
>> + 			   hsk->start_offset <=
>> + 				   session->internals.handshake_recv_buffer[pos]
>> +-						   .end_offset +
>> +-					   1) {
>> ++					   .start_offset +
>> ++				   session->internals.handshake_recv_buffer[pos]
>> ++					   .frag_length) {
>> + 			memcpy(&session->internals.handshake_recv_buffer[pos]
>> + 					.data.data[hsk->start_offset],
>> + 			       hsk->data.data, hsk->data.length);
>> +
>> +-			session->internals.handshake_recv_buffer[pos]
>> +-				.end_offset = hsk->end_offset;
>> + 			session->internals.handshake_recv_buffer[pos]
>> + 				.start_offset = MIN(
>> + 				hsk->start_offset,
>> + 				session->internals.handshake_recv_buffer[pos]
>> + 					.start_offset);
>> ++			session->internals.handshake_recv_buffer[pos]
>> ++				.frag_length =
>> ++				hsk->start_offset + hsk->frag_length -
>> ++				session->internals.handshake_recv_buffer[pos]
>> ++					.start_offset;
>> + 		}
>> + 		_gnutls_handshake_buffer_clear(hsk);
>> + 	}
>> +@@ -1102,8 +1105,8 @@ static int get_last_packet(gnutls_session_t session,
>> + 		}
>> +
>> + 		else if ((recv_buf[LAST_ELEMENT].start_offset == 0 &&
>> +-			  recv_buf[LAST_ELEMENT].end_offset ==
>> +-				  recv_buf[LAST_ELEMENT].length - 1) ||
>> ++			  recv_buf[LAST_ELEMENT].frag_length ==
>> ++				  recv_buf[LAST_ELEMENT].length) ||
>> + 			 recv_buf[LAST_ELEMENT].length == 0) {
>> + 			session->internals.dtls.hsk_read_seq++;
>> + 			_gnutls_handshake_buffer_move(hsk,
>> +@@ -1114,8 +1117,9 @@ static int get_last_packet(gnutls_session_t session,
>> + 			/* if we don't have a complete handshake message, but we
>> + 			 * have queued data waiting, try again to reconstruct the
>> + 			 * handshake packet, using the queued */
>> +-			if (recv_buf[LAST_ELEMENT].end_offset !=
>> +-				    recv_buf[LAST_ELEMENT].length - 1 &&
>> ++			if ((recv_buf[LAST_ELEMENT].start_offset +
>> ++			     recv_buf[LAST_ELEMENT].frag_length) !=
>> ++				    recv_buf[LAST_ELEMENT].length &&
>> + 			    record_check_unprocessed(session) > 0)
>> + 				return gnutls_assert_val(
>> + 					GNUTLS_E_INT_CHECK_AGAIN);
>> +@@ -1302,9 +1306,7 @@ int _gnutls_parse_record_buffered_msgs(gnutls_session_t session)
>> + 					&session->internals.record_buffer,
>> + 					bufel, ret);
>> +
>> +-				data_size = MIN(tmp.length,
>> +-						tmp.end_offset -
>> +-							tmp.start_offset + 1);
>> ++				data_size = MIN(tmp.length, tmp.frag_length);
>> +
>> + 				ret = _gnutls_buffer_append_data(
>> + 					&tmp.data,
>> +@@ -1320,7 +1322,6 @@ int _gnutls_parse_record_buffered_msgs(gnutls_session_t session)
>> + 				ret = merge_handshake_packet(session, &tmp);
>> + 				if (ret < 0)
>> + 					return gnutls_assert_val(ret);
>> +-
>> + 			} while (_mbuffer_get_udata_size(bufel) > 0);
>> +
>> + 			prev = bufel;
>> +diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
>> +index 54d3c9f67..283f25c07 100644
>> +--- a/lib/gnutls_int.h
>> ++++ b/lib/gnutls_int.h
>> +@@ -479,10 +479,10 @@ typedef struct {
>> + 	uint16_t sequence;
>> +
>> + 	/* indicate whether that message is complete.
>> +-	 * complete means start_offset == 0 and end_offset == length
>> ++	 * complete means start_offset == 0 and frag_length == length
>> + 	 */
>> + 	uint32_t start_offset;
>> +-	uint32_t end_offset;
>> ++	uint32_t frag_length; /* used exclusively in DTLS reassembly */
>> +
>> + 	uint8_t header[MAX_HANDSHAKE_HEADER_SIZE];
>> + 	int header_size;
>> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
>> index 468b4bdd40..4219a650de 100644
>> --- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
>> +++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
>> @@ -25,6 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>>              file://Add-ptest-support.patch \
>>              file://c99.patch \
>>              file://CVE-2026-3833.patch \
>> +           file://CVE-2026-33845.patch \
>>              "
>>   
>>   SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
> 
> 
Hi,
Yes, will send a v2.

Thanks!

