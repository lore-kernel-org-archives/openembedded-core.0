Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE371C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:15:36 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.56])
 by mx.groups.io with SMTP id smtpd.web10.6913.1748942134165871653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 02:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bNR73dtQ;
 spf=pass (domain: cherry.de, ip: 40.107.162.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1iQfKibI9Xxbgf/wQIQj5c6e9pU/zLsrrRybn/AMocsPdWxRwILiRNpd3wP9I7L0XhTx4cZotsl5yudDXvTyrE0W/6FpAfPSUyM4zmIOWn0ueBvrMN7QP0giyG0OGspFDpSd4ADsjunPpGeZ3iGzdfcFioGzbnEFYIA+sKkL8eW9TzQnu4hvu9ywSEG+qIkuNddjAgMs/r4tHbLZtqRspjEOTUPvZucaBIl7pEnWH/MiuYQI3dpyow4tpmGJ+7t3bWqJp0iBN3BEsJ9/kko3P95HMXcF4H+T76GZogTMwMd2EUYMc+2RhR2HXOpPjm68nQu+hpvl8WpK1O4TMI6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/7SE74F7MCiG6ux8LptEhuFQQXPXZwM0/1768jfEAQ=;
 b=c4p/9QeNGsADrqrYSTWIrfEqAuUbsZtJ40frK+Gpjt9xcA/bMFZeXo1IL3kr1JcQC7MeYCXCyOqdEPV90XB6euhh5oTOPUv91nTwfV5qUrbkGtp2eZ6jWqH60UWz/29q4TQdXm50P/8VyGMnO7GrgADcTXEaGyET01d3REfFYkekfH7oTW4BjYdmUNAOwyIjqM+wkJ8H0AmyZZH4FwbZWPTHIwQ/TqXtjVeHvubeepV5Abcaqc5XMmSBsljbqV/l97i/xjrvHhFp8B2oH8epg/qQM3NX54K5JFk1+4qbYWMY4RLfRBJgp9Pvfl+nrcLSQ35MSk8dpFMtHQqaEH5fOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/7SE74F7MCiG6ux8LptEhuFQQXPXZwM0/1768jfEAQ=;
 b=bNR73dtQPaI6jtGRMoeo4unZCHDPrb8t5MJlZ3a8zJPqYPauFsLheMG5+OJHGVWrV3dC/XR7N6DsO9A6qTyrItd1ZQARsf2Tm/gkEzbVcMUI39LWre22Nu/9vbf55ftR1GuHP66JP+USEi+zAC+EcJSedNcA3QuMObCSkuIIuPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 09:15:30 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 09:15:30 +0000
Message-ID: <daf0b71a-c495-4a1c-88db-d841761fb866@cherry.de>
Date: Tue, 3 Jun 2025 11:15:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes-recipe/image: Add variable to create
 rootfs with a exact size
To: richard.purdie@linuxfoundation.org, fbberton@gmail.com,
 openembedded-core@lists.openembedded.org
References: <20250602213004.2123954-1-fbberton@gmail.com>
 <31284b0f55e3c18957c9340cc399f1c0c9a8410a.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <31284b0f55e3c18957c9340cc399f1c0c9a8410a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: c2213423-10b8-4ddd-5fa7-08dda27f2fe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?THRTNklDWEc4a2lhWndQTFVvTkxIcGJNcG9yb25pVHJMZWRTMllhdldqYWhV?=
 =?utf-8?B?cW1oQ2hjNlQ1VUF6VnZ4eWg0bEQwenQzOHNheFdUY0ZpbXgyTEFVMmlUdUx0?=
 =?utf-8?B?UzI5cHY4WkdsTFpuQ0tGeEltbUFWdjNWVENJZkFpZURHeitDNHFkWHovQUlB?=
 =?utf-8?B?R2RyVWlVTklIeFNDWTI3WlRjVkVDMm1KSzJYL2pLYmxObmQwNXQ2L0ZvTndq?=
 =?utf-8?B?RWJ3dnRuYUxZSlZCc1kvTTd1ZEZCQmNOcUV0NWhwR1Bqd1luWE1yUEt6elRx?=
 =?utf-8?B?QXQ2SndPcHl5S2k1RENmUUZzdW0yMit5cDgrejJDZzI2dXhzaE02dzZUdUxw?=
 =?utf-8?B?Mnp2SGg4WmxEbTQ4cGVtMW5LY2pISGF0WE5WUm8wakcwVUpzbnRGYlZEb2Ro?=
 =?utf-8?B?b3BKaWlaVHo5Sy9PNFMwUVlXSHZMWGJsMHNabmJLb3VmenFoaW80NE5EWGJO?=
 =?utf-8?B?d3l4Rno4c3ZDL0lVc3FJMGlTZjFsak9Cb3pIY3hDNlh0VjZsdTE1VlNxZXJN?=
 =?utf-8?B?WktnL1BDTDBSb0lUdDUvMnNxdlF6VmwzNjVrMVNCUTY5a1VyWWk0NUlRSktY?=
 =?utf-8?B?cDJTdjZvdi9nRStBOEV3dytkRks0Zk1haDJKTXdjUzBVYU9WRHdyZU1lQjFk?=
 =?utf-8?B?NlVndFZ3ZzhFa1hjRE53KzVxbmFmRFdpQ3VwMkpldlA1M3h5SXFVOStjaEI0?=
 =?utf-8?B?UmEyRngxS0VaZk1GTXg2VGljV3plTnpDK0Rqdi9PK1VwTHMxVHNrM21nMnlv?=
 =?utf-8?B?MlRJOVpEbGs1WEZHaERqNGJwaXFVZUEvT2IyNnowVkJiU1RjSm5FVlZDaVhp?=
 =?utf-8?B?cXdudW5wTVRvTTJ2VXg2R3V3UlR6eHNUcDFsQyt4UC9OYURsMjRzZlZ0VDlw?=
 =?utf-8?B?ck1tUkI5b2MxZmg1Z0pRSHo5MEVHY1dTdTRwUm5HMmpsNUZRV0FyMXlTczEz?=
 =?utf-8?B?WC9QZXJtUml1enVsanRzRWROaktVaDliYVRRb2dkQnA4cElmbHB5MHpVMU9q?=
 =?utf-8?B?RWRTUjFnRzI4ZUxxaDhXNXpwNm9oMnRwdkdaR014c1N3ZjZvbTc5SjZmbUxT?=
 =?utf-8?B?Sk1uTXM1WmZUZUo3VHBTRzNXNzA4cDg4N05lQWtUb0tpNmhSa2RpTmw0Y2dU?=
 =?utf-8?B?M3g5RjZIVzdWSTh3QTJUYS96MW1XQm9TbjNMY2psOG5nL3YxbWNnd0s4NWI1?=
 =?utf-8?B?eWZIcG1KZG1IVnBmWmIxbFhIaGJvUFpsVG9DUFpyQnkvSFgvUWYrbkR3dytj?=
 =?utf-8?B?WW8zRTFBN05IbjNNK2hQUlpUWU16YytLWUdBbldTb01oak1RR1VsZzBuN1E2?=
 =?utf-8?B?bmhqL3B6WUpxUkd5dE9ESWJVZmVYbGJDWXlCRlVCcENaZ3BGUWQ0dXRLaDVU?=
 =?utf-8?B?NWY4SEtSTmEyaEY0VUhnVXlDWnZwVjVNd1RiVWt1SjR2YjVLU1psbExyQUlT?=
 =?utf-8?B?VkhOOHdZYzZUOGhzYS84SWUzWGFlUHFFRXhLMjFOUXNwbFlxOERtWGRKMmdq?=
 =?utf-8?B?V0pIc3kxWE9iRnB2aTd5SWNqUFFqRStUSU9jYmo4bzUyME1vRWJoeXdYQ2NR?=
 =?utf-8?B?eGplbExlVlkxVWFlb09WSmZCMWVjNDduV0M5ZGtMRWg5aDVGQW94WW1LK0Zj?=
 =?utf-8?B?emZDalkySTd0L3FmUDhsR2NlS2RTUWYwbzg2ZUF1YksyM3YyODFZZi9Xc3ZQ?=
 =?utf-8?B?aEdpRmFRbUEvaEgxbnZ2ZXl2M2xuU0tNN2VWOGUwWUhwL2h0bkZLVnVhbDEr?=
 =?utf-8?B?MElCUUNmMVk1b0ZuQ0kvdzI1OEhmNzFFTjRVbGxIVG5YNitaOVZycGN5OTJB?=
 =?utf-8?B?dXlDV2YweUVMN3hLa25ianZxRVhsZlgvOWlFMUl5WlRubkp0Tm1SL3lyWURJ?=
 =?utf-8?B?WENHbGFWemFFM29SRi9KMU1lem5nRVJkbGpyQms5Qk43STVDS0xPaUtvVnp5?=
 =?utf-8?Q?Ez7lzBuNs3U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?blR5YUp5cnU4bElveGsrUHlZdWtYQWJBbmlZaFNtQXNlS3FLSmNTcVVIUU9W?=
 =?utf-8?B?NHV4NE1ZcGw4bmtjY09xc0FzeDNLMWkvMmVuNFpIK0pLN21rd0VaS2kxUlZ3?=
 =?utf-8?B?Sk9YU3M4aEhXMkx4OGZJSUllNWtIeFdvU2JXejdJY1NOdVJNYTlTS3Y2ZUJs?=
 =?utf-8?B?QmFQYXRhTHVrOEY1Mnd5bUZEODhlU2tUb21NUVF6a0ViWHNtQkhaaTIrUGpG?=
 =?utf-8?B?OUIrM0tqQTl1UjdPSlcrdjhMQzJjUFNTYXpCclQ1UFJUVXlTV0d5UGorNi9M?=
 =?utf-8?B?TXlSYis3N3Bkc1BwdzNFa256cUdTdmdxcjlyV0tGTW1PTjJZTVNZVUhvcXBW?=
 =?utf-8?B?V3pubDBkcCtCZjl2ckNIbks1SGdzR1FKMlpQZUV5WnRFRTFxV0JOUDlhcDRJ?=
 =?utf-8?B?dDFVblZFcHQ4bXdHTEo2QnJFRUpNbTBnNHVjUTR2R3VOL28zY01uL2xPdVV5?=
 =?utf-8?B?RncrRlhianlzRHlJWmR0SExNQ3Q4cXA1a1R0a2F6d3ZhZ0RpM25xcVFydGN3?=
 =?utf-8?B?Q3Z0Sm51SGM4M0FZeWNtdHBjVTNPUkRycHE0Q05kcVBrU0p1RWNFVTVZaE91?=
 =?utf-8?B?elZMMjRHVWFsaUErL3BFNE96SStOTjRVSzBwcTlBemNtZVJTTTJySitmb3Bj?=
 =?utf-8?B?a2N4ZW5wa3dmYlRNL0w3a1VTanU5TXBNOEdCcEpsdmlpTi95RTJEVHFSSHA5?=
 =?utf-8?B?dlgrSDVDOVN4NjNIb2RTSy9LenNBRHVXU25PbGdTa3VwRnpSN2VuQmV0enRz?=
 =?utf-8?B?MzA0K1pRT043d0wvVUR0VzdibUVnclhsd1FmMkM1MjlHa3BGa3c4YVI4ODk4?=
 =?utf-8?B?cEtmYjk3c0JHdEhza0xjWVFyZTZMNHYrbWI4WEVNSU15Y2d2VEFPcFk0WlBP?=
 =?utf-8?B?S0YwMG9XMk1LcjRBVi9tbWNtMHN4RDBSL0xCS1g1RzgvZEZNWnNEZG1iOFc1?=
 =?utf-8?B?S1pWSXBieVk2RW9uZkdPalhKWklNcVVGSXFOS2s4NmZsRTdNZmdKQlRjT3J5?=
 =?utf-8?B?WlBuem1xekVxZXRUSmpGYTBkQmZoTjEvUXdheDQyNlJWOTZoTXJuZ0VtNkU3?=
 =?utf-8?B?WU9oVVlieDVSZDIzdmx6V0VXTENXRDlNZ09td2RYTmE0NXpXR1lWWWNDUVBV?=
 =?utf-8?B?aWxML0VRWkJJMGdQSEtPU2grQnNya1FMKzd3VE1vbFIwR1ROY0doNGpreERN?=
 =?utf-8?B?M3Brb3hRcXE3NURhWG9KNndCcGJ3Q3VPWnFCbW5nZGVNdFg5REFSc3h2LzBU?=
 =?utf-8?B?QnQrVTRQUVBlVThWa3VUU2ljS2NtazY0b25DMEhVclJhb3VYOElOS21jYkNM?=
 =?utf-8?B?SmwrOHMwcnlmMW00cE1qL3BQU0cyWjJCcWNUcDg5ZXRxU3AzdjFRN0xzTGJ1?=
 =?utf-8?B?YUJJS05BNHNiRFMyNEk2WWxBK2F3ZjZHYktVYkRXUit1YW9VNU9iUGZhMDVV?=
 =?utf-8?B?ZE5YQ2JIc3VnM0JjbzU4Ukk2aURjZVpCRTNwbnozeWNuNm1mNW9sZkdoNkp1?=
 =?utf-8?B?VktaV2tBN0JaZnRrV3lkWktXZXV2Q2NITHdJR3R6YitCWEF2bmR5eWFuMEF1?=
 =?utf-8?B?N2hpak1xdjRid2YwL1VaRHpxekZJRTRyYmlBZFhSdGVqcFR3N0pWQ3VYZ2Nl?=
 =?utf-8?B?eHcrUk1TdFVBd1dGWG9KYkZySzJ5TmdlVk1SNlhUNXQ0YU5XaDdjaGQwVUU2?=
 =?utf-8?B?NDRhTExTQ0xqcHp4ZmVNNis3V0N5MUNZMzdyUXZsVVlxa0xWSDBKaUVlQmtW?=
 =?utf-8?B?Qm5Kbkkra2k4SWYwTXE4THZDKzZrbERkWXk1aUFQSmlCbXc1UGFBK2thamR0?=
 =?utf-8?B?b3Nxd3VOODlkNWQzUXpOcitZUVRtaGE3TU8wL3RiRHlTZlltZEpZYS81eFNK?=
 =?utf-8?B?eXBtWFFpa0xrdlQ0NXczK0VJMXdrVi8yY3RjemlDVkowaUswUUFoMDlHZlQy?=
 =?utf-8?B?M3ZocFpjRjZBR0NlU2RPYmJ4VkRxNDVWYUNlWGNadXl1eHpYbldTVkZGbFhp?=
 =?utf-8?B?cHFvZGFTc2tqR2s5LzFBWjh5TzYrVTFwWUUweWgwVkkvUTloUXVod0FteFA0?=
 =?utf-8?B?VC84Zkd6cEZVdUt5TUdQcHJ0cHBtMUk3eVI4ZUpWKzhnbkljWVNHZHl2aDU3?=
 =?utf-8?B?N3EzRElIdW9XS0hEdVp5RnZDa0ROZmoxdk1iOUxaMTlybGtXd3Q2SWNobjQy?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c2213423-10b8-4ddd-5fa7-08dda27f2fe3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:15:30.6159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUHb7lTU8QlDxPDkUqtsGuW7E4ErrLTg3Sw7uSQEX81dW982Zm/IeSc6jw8s9L/5bvXxuw0ujH0NdIraHNZ+5ecDDJX0s+jFksruvOhzHQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217787

Hi all,

On 6/2/25 11:37 PM, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2025-06-02 at 22:30 +0100, Fabio Berton via lists.openembedded.org wrote:
>> From: Fabio Berton <fabio.berton@criticaltechworks.com>
>>
>> Add the IMAGE_ROOTFS_EXACT_SIZE variable to allow the creation of a root
>> filesystem with an exact size as specified by the user. This bypasses
>> the default size calculation done by the get_rootfs_size function.
>>
>> This feature is useful for creating a small ext4 filesystem with a block
>> size of 1k. The get_rootfs_size function uses a block size of 4k to

That's just the default, the function directory_size takes a blocksize 
argument.

I'm wondering now if it really makes sense to have 
IMAGE_ROOTFS_ALIGNMENT not be a multiple of the blocksize passed to 
directory_size (well I guess the issue is that we then apply an overhead 
percentage on it, which may misalign it...).

>> determine the size of IMAGE_ROOTFS, which may be larger than the value
>> set in IMAGE_ROOTFS_SIZE. If an ext4 rootfs with a block size of 1K is
>> nearly full, the .ext4 file generated by Yocto will be larger than
>> expected due to the way get_rootfs_size calculates the size.
>>

 From my understanding, this means we'd be exceeding 
IMAGE_ROOTFS_MAXSIZE? Does Yocto fail the build because of that? If not, 
then I'd say we should fix it somehow indeed. If yes, this feels just 
like misconfiguration to me?

>> By using IMAGE_ROOTFS_EXACT_SIZE, users can specify the exact size
>> required. Users should ensure that the size is set correctly according

To have the exact size, isn't it just IMAGE_OVERHEAD_FACTOR = 1 and 
IMAGE_ROOTFS_EXTRA_SPACE = 0? Though I assume you need some extra space 
for the ext4 journaling for example?

>> to the filesystem requirements. It is not easy to predict the block size
>> that is used by a filesystem because it can be set by a parameter or it
>> can be added automatically by the tool that creates the file system.
>>

Should we have a get_rootfs_size that is specific to different images? 
e.g. if you generate an ext4 with a given block size, and then another 
file system with another block size, get_rootfs_size would need to 
report something different for both?

But I agree with Richard that we already have too many variables there 
and this feels a bit like a hammer solution for now?

FWIW, we recently had contributions to the documentation for this piece 
of code and this was one of the contributions that took the longest 
because the code is already not that straightforward to read and 
understand so adding yet another exception/variable will not help with 
that. Maybe that's the only option but maybe not, maybe we need a bigger 
rework to simplify all this.

Cheers,
Quentin

