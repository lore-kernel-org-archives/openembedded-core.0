Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196B9C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 19:33:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web11.19378.1721849622981127669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 12:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=EW9UwLaJ;
 spf=pass (domain: oss.nxp.com, ip: 40.107.21.57, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jibakX9fhFfAD+WQFKjTvMm07yHoBZqmTmpeQKlW+kx9a3TLI6i9IPNTVIhUbLePL9dVgQYhfYTvzUBYrT0C3o3bQPNI1UovZnnVpQ+v2tRDyvMFWTo/GFc2JC32v0zmuG41vXPDEyANfzOwjTpL45te/7hFUVRw2qqL626FDNbqOISjwT26F/KctdXdSUG92dT3Vj1nk9Zhc2q8VQdXXknRPVidCUHoi/PWgFbWDFupdLeTQCmkNUi9mCs6kNILhu1ou+xIdEOMz6NNQ6htnJoQQJEN+4obBRpgbzHQOX8EkDVuq1D+o+5pt30afIlGldt/wg4/9mSi00QjhV48Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5fZOyMsE2p4osZ8E2crIYfHvOzWR+sXu5tX4Vlbr44=;
 b=Vllt36U5Qxbpbjc3iXTRzJ8xi4Flzf1YOTiX6tKrEI1HghSjcUu0fKdynihJfxVRQ0tdz1HLNUsMRgMCiKUWUytVdsQz1l2FQRrx6ZLUAZDX2kS0JRmR/ZW1uo+0tskoeG7ylGn9jLhEUwjpuCGnZevUbLGoTZ7+GXzkZA205k5WNNkoMiO7Q1TXj/Dr0rot1OQSmLyPB9imLJW9AAvXPiNutfdfwMffupwtvI22dKJtqrfXYgEgODEiVowObP0MR+PGRMW1IqFVsxo+xuVaWbClnT3+hD4KLddr8c1GekhUch1mkrzfgHB0DD3YYKaG+tVmyGDlSO2/S0xpw2AJRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5fZOyMsE2p4osZ8E2crIYfHvOzWR+sXu5tX4Vlbr44=;
 b=EW9UwLaJy6cx0sKXn3FTdII3Nj6TuXVSC+d57hC5148GAhyLE3Rw3brFXJR8EOLZ/VE+uW/aFgEz0J1osfBLbAo+22qFf7Sb77KaoVZEZPQLWGjwH49RbI2e+TEGyTpX0QYV3evc/zE+Mrpxa9shRmEfjSUynBsqy/jQi6qC2IhGK6lXeljoVYnl46LxlxLiRqt2oNe9HmndAlKEc1IPVdC4hq6mKJolzYqKKQnMc/GSp427N8iXi8Cnm+ay5kwm5Nyu45EFdiRRMY1wnT0NocYcg7eXXRD7VumzB/7Y2tFW2yFqJcVIqNxuZx+fZbpaAc851PzlUSxs1OmBaIWuQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB10150.eurprd04.prod.outlook.com (2603:10a6:150:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 24 Jul
 2024 19:33:39 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 19:33:39 +0000
Content-Type: multipart/alternative;
 boundary="------------BIjpIGY9vPKlCNp9CesLlerg"
Message-ID: <fae511ee-87e4-45be-ae8a-88b11d20badf@oss.nxp.com>
Date: Wed, 24 Jul 2024 14:33:35 -0500
User-Agent: Mozilla Thunderbird
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: Re: [OE-core] [PATCH] time64.inc: Simplify GLIBC_64BIT_TIME_FLAGS
 usage
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240724170829.3456577-1-tom.hochstein@oss.nxp.com>
 <CANNYZj_GkEBefDmtp_ANbdZEv2r+i_RfTAYd0TpEbYD1kUZ+3g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANNYZj_GkEBefDmtp_ANbdZEv2r+i_RfTAYd0TpEbYD1kUZ+3g@mail.gmail.com>
X-ClientProxiedBy: AM4PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:205::44)
 To PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB10150:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c7a3c6-e2bd-4f57-9207-08dcac178495
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U2dDWFdSTTkzaHc3WS92MWxoelpmcU1GYVRnNG1seVNzRHRSQ0ZFZUNnNUZB?=
 =?utf-8?B?VmwzUGdLTlM4REtSQkp5dUc5TUY0SnphOHR5dzBmeFlkeEswaTNGZENhcFhy?=
 =?utf-8?B?ak1kdi82SklBeTdGNTZLaW14eVpDMU1tVncza2VwR3JOVUdWb2JwL0J6ZjBE?=
 =?utf-8?B?Vko0bmFwYXBmTGgzdGVHY1BSamZrcGpKbm1Yd0U2RkhNTDVjS2J5VmczdHEw?=
 =?utf-8?B?UU5neDBKakw1UnpiOVBOUmQ4VVlSbmtLRS9zVytlQlZXQ1A0UlBzY0FDaFZF?=
 =?utf-8?B?VnVwekhvVmFoeFZmRU80cDlKM0RNWnM4QVRocE45M3c5SVpIQVVpNHUwMGNq?=
 =?utf-8?B?aE5ZcGovVFdaMkdQSU40dFR5RjZJY2tjWngxdXMwZEFBY0h2WFdVUXhkdGg4?=
 =?utf-8?B?V05leS8wa3hnMXh4dW1ldHhQb3JEWWJOMnA2Y1MzN0dRSmhPdmhYUFVIU3U1?=
 =?utf-8?B?WkJ2czNvVzBqbkZTdnJKZWZnTUpvanJSVlBOZS9ZeHRyUmd1b29DNFlWNHlv?=
 =?utf-8?B?cURnZjdBdWg2VkJnQnc2akgvWG5GeUxkUjFuYlA5M3pjWTNkaWNSTVlra0Zx?=
 =?utf-8?B?dVdSeWNETmVQM012aXJ4R3NpNnp6MFpiODYySHpZdjFYMk4rQ0N3c3FHd3B4?=
 =?utf-8?B?eUQxbk42ekhyaFE5MG9RNDhXK0pOZnVwK3RkeVM3SHF5VytNcCtYb0ZsNjVy?=
 =?utf-8?B?ZEFVdk1DSHdpQ20wN2JNbzZsY2gvblZxeGVIbG1GZlBIdllRNFdXTXowRm5D?=
 =?utf-8?B?eXU0c3BWRkJ1TVFsRjVFWXc4NTBrTnNzeHg2cmZIOGh6QlJKdVVsWUhBQ04y?=
 =?utf-8?B?ZGliZXA1eDNJd3REdXlSeWE5REl4dkI0eVZRY1d4ZHordWhCRkMyK2lpcWFl?=
 =?utf-8?B?Nmxsdk8rMnl1VkxVZStrV0RoMzl5N1FHdTBGYksxQlNjeTlHK2NSbzJ0OFV5?=
 =?utf-8?B?YnRQSkxCSHZYdmRERUlPMUNtODE0bnU3L0lkb1NFR3JuLzIyb3ZiUGJSNTZm?=
 =?utf-8?B?Z3NsTytBYmdGMDBRQXVUZ0ZLMVVrQWQ4WmlWcDAzMm9WT1Y4SXdlcnJJbXVT?=
 =?utf-8?B?eDZPTUR3dVhDaWtHd20yRVRxYjN6UUJvb2d4MXR2UzJBRHFkdHhIdkVNaHZR?=
 =?utf-8?B?a1dwblNPNzNVTU5oM1NxamR6a0Rxa1d1ZEJna0NJZjVwQkQ5bTRnOURZVElx?=
 =?utf-8?B?YnRWejFibEJMeVRzQ3FMYVlMbmZQTER6R2RzSGJXeFMyL2xvNmhQeTliY3Jr?=
 =?utf-8?B?bmlYSytGemhoZElOeWNxd0VyS2pYY3JVb056ZmgxcWJTT2NSYTJwU1g2b1Iy?=
 =?utf-8?B?REhQUlNqVlFodXZuZnVTNlREZjlLRUtCbnhRTGc0T3lPYW05eHlEaTRpZVNm?=
 =?utf-8?B?SHZYVDNZaWRaNXpOTXVRNDJMZE16Mzgrd01OZVJXVDVRMWptTWtRU25PYktF?=
 =?utf-8?B?U2RJb2N2WFRCRUZRVTA1cWVYRVFOSWpJWjRxaHIwaEJ5WkdjaUx1YWVyVWYv?=
 =?utf-8?B?a2M1V3Z1M24yTGlCcklnRDdlWTBuTG9vS25QWTUzVndHSDNQNmV2aVpBWmV0?=
 =?utf-8?B?MjJ5WmRZdC95eHVTV1hlRDdFMng5dUN3U0ZjZWxIMzhYMTY1bG0xRFByUWll?=
 =?utf-8?B?LzFxUjA1R2pScUUySkdtKzVFbVNwL0ExVjFRcWZCNWRqWFRwdWdHSzlYQ0hB?=
 =?utf-8?B?OHYxR1gxRE1VWVZiLzJWWkxZWjRQTk1tbVl0Qnd4S1oxNElCSVhEa2pheE53?=
 =?utf-8?B?S3ArMkF4enNGMHEwNWZhU2hlb1ZVTDBoNnRpaDNKdjhzOHBLdkJGdEphaURD?=
 =?utf-8?B?OFJnYlA5bkpIRFpCVTEvUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rk9HMDlHQmVNb1BRVlo2cnRzUVltYUszVkdBZmlZV1l0TGFKbnBHVHIwcGY0?=
 =?utf-8?B?SDA5SHpIcWFKa0tZOXY3b0ZKSDk0ZVgrbHFzTTVxUURRa1l2R1FMTjFoc2hE?=
 =?utf-8?B?Q1NOSUxuN0s5bkNmazErUUNONG1IeW5xQWp2VVBLR0xuZXlGcFE1b05Bd1dK?=
 =?utf-8?B?K2NTdUFIR3NFemxJQUZTbDQzaHFWMkJET2hYd0R2T092S3lnVHZITzl5OEk2?=
 =?utf-8?B?WWZqRERWNy9md1M4NmpFTlEva3QvQ0xYQ2xBMUNLY1BuUEtKZXRYY2RyTmY1?=
 =?utf-8?B?ck84ZkZ6QVJzOWRYaitNRTBweVkzb1ovZFNYKzI5d1JyTEhqWnFEN2s2WnU0?=
 =?utf-8?B?bWE0VVVSNjdBK1JDWlZPSnpydk5iVTdoSjNLMTRtbjlHVVpoOWhENDczOWJY?=
 =?utf-8?B?cW85RVJSWkVDMVJQVThBQWZQbVZZTG43c0tXZGw4dmMvTGJ0b0xMVU5la0o2?=
 =?utf-8?B?Y2N2ekx0OVVWVVUwUm41QStNZ2R6dDRQUEE0NHlyY0x3eWZWbUdkRm96VmJQ?=
 =?utf-8?B?eVBlTU92bG9tUHBLMGpVWEVkRzRQZDZJcENBSDhyY0hKY0NJSG1nUlQ0SW5V?=
 =?utf-8?B?V3BCNjJKMGZCSlRTbHlXRUFvRjNka042KzJwQ1l5YzNXUnlLZUZhR2lRZzAr?=
 =?utf-8?B?dHNVbEZwdU14Zm5OcTk1T0RrWm4vdXVIS1licGllRWJzZEE0dWlHK0pDd3By?=
 =?utf-8?B?bzA4WFpneU1YbjdZdHNCS3FKNDQrUlkzMGtuczdScmx1V3orbVdvRnc2MUwy?=
 =?utf-8?B?dkd2QnowSFBWWGhla3JUYkYybEJGcFZGWEtlZkhOaVk2cnowZmU4ZEZ5SWs2?=
 =?utf-8?B?VG1tNVFRVnBVYS9mSmZMU3JEUjBrMUxUbjV4MmVCbUtldCtYaDFLTlNpMjI1?=
 =?utf-8?B?TWVHbUZwcHhMUTFBcGg0RWprYnJ3VHgySEl6QzZhTFNtL1o0LytDMHY4aXR1?=
 =?utf-8?B?T2Z1UkdCdHVLVHhaUEl5MHZFZGg5ZG1TWnRkRGZieVBIckZrRHRMMjNZR1NW?=
 =?utf-8?B?d0wwaEVOU1FZUHdOa2xyRzJDNkhvNmJjelFOYldKOCtPV0taZTd4V3J4dGxT?=
 =?utf-8?B?RmdPa3hhUC9yOGJrcmhTK21PYjM0aDVZNlhKVkZHY0J0THlLempNTnBXd0Ix?=
 =?utf-8?B?a0JLSE83Y3dsbHJqbUZ0c1lNUjRrNS8yMnEvbHYvcnFucFF0NjRFWE5VOEtG?=
 =?utf-8?B?aGdWTFQ1eTdDZEJtMjJ4N25hbzF0Z2ovWjQ3ZkN1dGJDRTM1UC91NkZCOU4z?=
 =?utf-8?B?ZFZGMDhmUE40V1BwYXM5UlNFa2MwTVJGSC9XWEozOUlFQzRscHlMcVh3Y2Va?=
 =?utf-8?B?eXlSaGdZcTJkTWxwUVA0RkN0THlLTmJ5ZHp3M3UvaUtZZ3RhZVY1b00ybitY?=
 =?utf-8?B?NElKK2JIMXRTT0F4N2pKNjM3NE9KTmlrTnpOY1VsTW5DdDF1QzlSSytIREls?=
 =?utf-8?B?bHdQemFZemlqK0RZL3NsbFE1eDFTb1ZscEFmcU5Kai9namt0eEpTMU1jMFN6?=
 =?utf-8?B?OFhVM1Q1bWV4Vk5FdVgwU2hRdlh4WjQyc3EzdTFsZTB4TEQ4MWw2VC8vTE9v?=
 =?utf-8?B?TXdRek1DTjZvcUhBRWJlVSs4Y0s2Z2FsM2cxdTVGQjlQbWNEWFpXbXFwNzlH?=
 =?utf-8?B?cUFFM1NidzY3bG5YRnYxdHdkdm14TXdISk43bExoQlBKM3BsL3VaTjczNytI?=
 =?utf-8?B?bjJRWk5aQkVaYWhBcnBFK1ZOcjJTWnMxWXRqUTlXYXR5TGo2Q2ZBYVVwYWhV?=
 =?utf-8?B?OWsvY0JyclowK2NvUEdrMDJJbUp3ZWl1L1JwTlFTbFQzRUhtMmhtQlNSbTMz?=
 =?utf-8?B?L3l5TG5ibnZRZjNHQXprTzNRRUR4NlNXK1JWaloybnVmQlR0Z0lOTVROYkp3?=
 =?utf-8?B?cTNzSis1RE9KbVQxVzhLSXA5dGFtN0ljdWhRR1UyT25NNGpXd1E1SmNvU3RI?=
 =?utf-8?B?SG9aUDVLT3J6UDBZc3Z3cWJiOU9Sait2YUp2SFNTTUYwdFNYelhKd3I3dlp4?=
 =?utf-8?B?WFJoNElWMFNvbWwzbjJTOHoveHFzRmtRU1k0U1R4dFpOUzNzZ3Z6ZjREVm5W?=
 =?utf-8?B?ZGkyK0ZVNUQrM0tRU0JUTkMwV3BSbm5pK29NbDk2b0QyVFhVZjA0eUp0Wkxj?=
 =?utf-8?B?T2JLYU1taytLanc1c0RITXp3NG1JZm1kTWVKT3oxVUJjOVJGSURSYUdkYkxG?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c7a3c6-e2bd-4f57-9207-08dcac178495
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 19:33:38.9341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RywQiKgIclD4bN+ayac/1JlamV5C+HRsx7vSrQbigu76afm282gunyn+YN0qi+YbMsQIOfcBBDBA1bp0aiqaAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 19:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202482

--------------BIjpIGY9vPKlCNp9CesLlerg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/24/2024 12:20 PM, Alexander Kanavin wrote:
> On Wed, 24 Jul 2024 at 19:10, Tom Hochstein via lists.openembedded.org
> <tom.hochstein=oss.nxp.com@lists.openembedded.org>  wrote:
>> -GLIBC_64BIT_TIME_FLAGS = " -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
>> +TARGET_CC_ARCH += "${GLIBC_64BIT_TIME_FLAGS}"
>>
>>   # Only needed for some 32-bit architectures, some relatively newer
>>   # architectures do not need it ( e.g. riscv32 )
>> -TARGET_CC_ARCH:append:arm = "${GLIBC_64BIT_TIME_FLAGS}"
>> -TARGET_CC_ARCH:append:armeb = "${GLIBC_64BIT_TIME_FLAGS}"
>> -TARGET_CC_ARCH:append:mipsarcho32 = "${GLIBC_64BIT_TIME_FLAGS}"
>> -TARGET_CC_ARCH:append:powerpc ="${@bb.utils.contains('TUNE_FEATURES', 'm32', 
>> '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
>> -TARGET_CC_ARCH:append:x86 ="${@bb.utils.contains('TUNE_FEATURES', 'm32', 
>> '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
>> +GLIBC_64BIT_TIME_FLAGS             = ""
>> +GLIBC_64BIT_TIME_FLAGS:arm         = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
>> +GLIBC_64BIT_TIME_FLAGS:armeb       = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
>> +GLIBC_64BIT_TIME_FLAGS:mipsarcho32 = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
>> +GLIBC_64BIT_TIME_FLAGS:powerpc     = \
>> +"${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=64 
>> -D_FILE_OFFSET_BITS=64', '', d)}"
>> +GLIBC_64BIT_TIME_FLAGS:x86         = \
>> +"${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=64 
>> -D_FILE_OFFSET_BITS=64', '', d)}"
> Apologies, but this is not simpler or better or more readable.
> Repeating "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64" multiple times
> should really be avoided.
>
> What prompted this patch specifically?

Thanks, Alex.

We are working to configure the builds of certain recipes so the 
non-Y2038-compliant code is avoided, e.g, by disabling oss-output in 
pulseaudio. That leads to needing to restore GLIBC_64BIT_TIME_FLAGS, 
which for pulseaudio is cleared in this file (on scarthgap, not on master):

GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""

When you do that override as one would normally expect, i.e., without 
the leading space, you get the error:

cc1: error: '-Werror=format-security-D_TIME_BITS=64': no option 
'-Wformat-security-D_TIME_BITS=64'

The problem is the design in time64.inc does impose an extra requirement 
for an external assignment to include a leading space. The redesign is 
meant to remove that requirement on the leading space, i.e., to simplify 
the usage of the variable by external users.

Tom

--------------BIjpIGY9vPKlCNp9CesLlerg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/24/2024 12:20 PM, Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_GkEBefDmtp_ANbdZEv2r+i_RfTAYd0TpEbYD1kUZ+3g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 24 Jul 2024 at 19:10, Tom Hochstein via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:tom.hochstein=oss.nxp.com@lists.openembedded.org">&lt;tom.hochstein=oss.nxp.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-GLIBC_64BIT_TIME_FLAGS = &quot; -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64&quot;
+TARGET_CC_ARCH += &quot;${GLIBC_64BIT_TIME_FLAGS}&quot;

 # Only needed for some 32-bit architectures, some relatively newer
 # architectures do not need it ( e.g. riscv32 )
-TARGET_CC_ARCH:append:arm = &quot;${GLIBC_64BIT_TIME_FLAGS}&quot;
-TARGET_CC_ARCH:append:armeb = &quot;${GLIBC_64BIT_TIME_FLAGS}&quot;
-TARGET_CC_ARCH:append:mipsarcho32 = &quot;${GLIBC_64BIT_TIME_FLAGS}&quot;
-TARGET_CC_ARCH:append:powerpc = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','m32','${GLIBC_64BIT_TIME_FLAGS}','',d)}">&quot;${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}&quot;</a>
-TARGET_CC_ARCH:append:x86 = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','m32','${GLIBC_64BIT_TIME_FLAGS}','',d)}">&quot;${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}&quot;</a>
+GLIBC_64BIT_TIME_FLAGS             = &quot;&quot;
+GLIBC_64BIT_TIME_FLAGS:arm         = &quot;-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64&quot;
+GLIBC_64BIT_TIME_FLAGS:armeb       = &quot;-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64&quot;
+GLIBC_64BIT_TIME_FLAGS:mipsarcho32 = &quot;-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64&quot;
+GLIBC_64BIT_TIME_FLAGS:powerpc     = \
+    <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','m32','-D_TIME_BITS=64-D_FILE_OFFSET_BITS=64','',d)}">&quot;${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64', '', d)}&quot;</a>
+GLIBC_64BIT_TIME_FLAGS:x86         = \
+    <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','m32','-D_TIME_BITS=64-D_FILE_OFFSET_BITS=64','',d)}">&quot;${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64', '', d)}&quot;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Apologies, but this is not simpler or better or more readable.
Repeating &quot;-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64&quot; multiple times
should really be avoided.

What prompted this patch specifically?</pre>
    </blockquote>
    <p>Thanks, Alex.</p>
    <p>We are working to configure the builds of certain recipes so the
      non-Y2038-compliant code is avoided, e.g, by disabling oss-output
      in pulseaudio. That leads to needing to restore <span style="white-space: pre-wrap">GLIBC_64BIT_TIME_FLAGS, which for pulseaudio is cleared in this file (on scarthgap, not on master):</span></p>
    <p><span style="white-space: pre-wrap">GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = &quot;&quot;
</span></p>
    <p><span style="white-space: pre-wrap">When you do that override as one would normally expect, i.e., without the leading space, you get the error:</span></p>
    <p><span style="white-space: pre-wrap">cc1: error: '-Werror=format-security-D_TIME_BITS=64': no option '-Wformat-security-D_TIME_BITS=64'
</span></p>
    <p><span style="white-space: pre-wrap">The problem is the design in time64.inc does impose an extra requirement for an external assignment to include a leading space. The redesign is meant to remove that requirement on the leading space, i.e., to simplify the usage of the variable by external users.</span></p>
    <p><span style="white-space: pre-wrap">Tom</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------BIjpIGY9vPKlCNp9CesLlerg--

