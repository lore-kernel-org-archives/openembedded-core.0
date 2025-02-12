Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE85C021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 14:36:18 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.92])
 by mx.groups.io with SMTP id smtpd.web11.17247.1739370969467058502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 06:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=0j5LzI8m;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.92, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgALZvOXaw+ae2B5ds8C+/jRAqLAQQEYbadmNyBHKQoirHJ6KVlPr2GvRWpMYsT6+kaJUlBzzxAm8q2TyC5tXWAeHqizHt+qu8DqIzcqpYWVbZPgTrUPrSrThZsGc8sYB0Ob/RV+ZUIiGM7wu4dh0POT1oEpZFWpsffrVM/BdKhJu9FxVVZDQzWSFvfek1BFZ01ZK3pJiYaT1AEhx4B4QMbP9rg05FEdkey6Je+C7aDJ/ds60eXV4bmRVG8lgJNFWJcnO4e205cem3F5Vl8Ldb9jD5hK67XYpSH/9cS+WrQFuxypTsXHRvvRcJxtu/9w+aqMXDr4RaOSUvpsXzFXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSpNziSvqdmp/la92gw9NoIIBYbksfUUPc9gk80WNMY=;
 b=AtvudymlOUKFxqSiM79s/YmcZHsLJeA895RJu9ytcOZsJabvzgbhnz8Fa6R1kXeKAb38Gso8a9EsnsMUR+ww2l15AENFh5lT7uzrUk4TyPnV6W4XmYvo68yS3QZ5Zbgmc0M2lmi6fICUF+HUMp7nzmasGrw+dAaca1Zs+06jRR7smsqE4qulG7QSqKeVNEne23bwD1IU6o+JqeJkxGPdT/bpmPB6j6O/JaiC8F3Nb/9p/2gfi9wQlyZ965Jv2zji9RgcjN9uodMjr4AslPvTTJY/LKkRonjOoXGymywiPnZ1by927AC/ipKoc/y5J+wHu/GXVckLhFWz52UzVFI2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSpNziSvqdmp/la92gw9NoIIBYbksfUUPc9gk80WNMY=;
 b=0j5LzI8m70WNmCqeSMNePOeJBETHamw7p6rsvJb81gXvPHIOfVJZEflZV7ZezCOil5No4t1pDslf2feXv3usqUlBt0DLeHGxkbduAwR78hILof0ckH7tN++Ujohu+sjH1kttxZEUg7MBLw7qET3ydFcXvtPIST5DAKDLeScb5lCkoSSbBOBwI/3knCBBhUzHB4z74oL4pYS1rownxNE8SKIYaifzNDsbYiNMlI2oolJ/EDyu5hNYT9/tqFxTuEjq2g05Z6df6xOhQDRSciRCVRxGA2hRCIOH4shBzqnqt+mJBy3azrPVUqfGrtt2N9P5F8EZtA5xp3zjI2v3o9BqCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM9PR08MB6017.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 14:36:06 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 14:36:05 +0000
Content-Type: multipart/alternative;
 boundary="------------ZqVEbjjr1jDQMPOdEDLg34zC"
Message-ID: <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com>
Date: Wed, 12 Feb 2025 15:36:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor
 cargo class
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
 <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org>
X-ClientProxiedBy: FR4P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::11) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AM9PR08MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f04281-71d6-4114-83d0-08dd4b729515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eFN6aFNTK09taVdFWVViZzgxcGF1amFSTWtpUzhIZVlmQUhhRGdnZkdVT04v?=
 =?utf-8?B?Qm1SZmZhRHY3MjhCT1FPMFBCZ21oZVpDeTZyL0svTDBIWlVhVkRKaWZ5WlBQ?=
 =?utf-8?B?RkRQRnlISnN4UDBOeWlmaVVjcGJCSDdHSkJ4SmN6dDRKcDJ1dVg3KytVdjJm?=
 =?utf-8?B?TllXc3VFeURJa2s1QUNWVlM2alExeU9JMWdHdTZPMlZiM2VNREs4d2ZHM2ty?=
 =?utf-8?B?M2VFN3BkSkMrNzMyVHBmUVhNSll2SlVmUzgwbVJKeTlxNXhmbGRwQ2IrRDFk?=
 =?utf-8?B?ZDBOc0pBd0dqQkIvOWNiMnc3N1lsS0dlRGtOU1FHbWFuNWdLajFNUDhCcFF1?=
 =?utf-8?B?M09ZdFZmQld1KzBlOEVMbEUvUXgyZ2JyOER4TzhXZVRxbmJaSjJUZ3ZldVF0?=
 =?utf-8?B?eFN0cEttVGJDS3pBRzRFVVVaTXF4b05temVNVWp6ZHdFMklQUCtmaTRwWlVB?=
 =?utf-8?B?VU53UHZFeE5oTnRaRHdCaWFYRXpWbHRldzB3RElsRGRoUzNzeFgrK2NXUlVn?=
 =?utf-8?B?NS8vYzRXOW54UlI5TkxXN0tZWW5ZcW0wb0ZUc3dqb2FmY1JzZE8wbysvN21I?=
 =?utf-8?B?K0FNWVYyOURJWVhqU1hxMkloamlEb1lnQ2pwYWpONmd0WThFT0Q5aThLYWpK?=
 =?utf-8?B?MEd2TXkzR2xqd3NRWnROT2xST096b2xCVG9tclpuUVRmRWxqQmtibEVnZjJ2?=
 =?utf-8?B?VWZuY1JhUnBiY0FFeG04YVQwVHE5VjF3VWxGcVVsajZRQVBPYVVsTEdyaGUy?=
 =?utf-8?B?UzdQVG5jbThmR1F2SUlEcGFIOEU3clVUSkc3RTJ0SHV2S1A3MytrRzZYSXoz?=
 =?utf-8?B?UXk2QmZjTDgrcGJzWmp4d1lBQksxZlVaaE5vbTVhcDRKSWY0VlZhVmgzSmZG?=
 =?utf-8?B?SmYzSUNBTk04L3VGWlBSY0pWaVJqYzlsOXBHTjZlUzViN3h2WFlWeGxFVTdQ?=
 =?utf-8?B?dnNzMzlHSTBQRHdqTUF2bzA4YWJRWmJHMDdkYmJRRTdSZnk1MlArODRaMWJ3?=
 =?utf-8?B?ajhUcWhuMXI1dGdYUCt3SEorNjNDbmVFVlZkVkZFWjRhWmw2b2RDU0J1dXNJ?=
 =?utf-8?B?ZDIzWm1xT1JOaGpXMTFGYmNzTEdTWnBERUJzL2psU1lzczk5RkhMVDBMMzdT?=
 =?utf-8?B?VHBCRnRNMG5pRVNManA0cldnZXU1MzBHMGtXVVJZNkdhRzVMcEd0VFJ3NzU3?=
 =?utf-8?B?Z0RyK2ZTTzBMaUJzT0MxZWxPRjlrYUR5Z3V0bzd5K0JwUlhZanRENHZEYmh0?=
 =?utf-8?B?L1dHTDRBZ3NCYWgxdHhDUk9ZblFrT1BHODRXcHNXamRsVXpLbDBaQVJJODJ5?=
 =?utf-8?B?UFZJTWVaSXAyZWRoZDlwY01xNWRTNlJXUURVTUdvaGxMbDVwazVVY3VmZW9t?=
 =?utf-8?B?VVpHU2FJc0twWGhBNWJ1YVZqdEF0NW0wTVl1WTZxM2FpVkwzaGRaVndvSXVO?=
 =?utf-8?B?TnZxNGRqVnB4dXExVjZhV0lxdWFwR0VrTEUzWVo2NzgvUVIyM0hUSmY3dGNr?=
 =?utf-8?B?YndpTUlxNStHWFYyY1dxR0M1SFR4QnB1T2ZxRmoxRVZicGtHUGRoYitRT1dP?=
 =?utf-8?B?V0tycWhxN3d0ZUoybXV6bVZmOWxUTFNtbzJiODV3MHcvNzlDcG1lZGdPUk9Y?=
 =?utf-8?B?b0VTUHJJT3hQSWl0UWZUZUM4Z2h5VktzdnFiTGRxQUN5MUozNU0rOGYzVlBL?=
 =?utf-8?B?RFk1cmlZbGFNT2cvTXhjZ0FJZmxEWXI3RkV4RytGRUhJNXFKczlsTTlSUzRM?=
 =?utf-8?B?aVFyNk9XdmJacSttZnZhTTZMa1l4bEMzWEtObjBEUlRvV3NWdFdHV3k4NHN4?=
 =?utf-8?B?OTRZR1ZiVG5ZUytxWUJvdzdSTVNHdDdhaHMvM0dMZXBaakREVWNoemZtSmg5?=
 =?utf-8?Q?/TDzvQQVqNU43?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UG45UmplOHBkWEJLZ0s2dk5MZER6WFdlajlPaGNvVTdPNzVUMHlwenlnQ3lG?=
 =?utf-8?B?MVF5ZlN1bEp6M1dwZUU3cmx3THgwR2hsWXR2MTJrL0ZtSVlnZGp5QzBYOXB1?=
 =?utf-8?B?TUluTGJ5WjliNFprU20vOURwUVJTMEU3YzJEU0hOOTgwUE05NmJDN3JYbzg1?=
 =?utf-8?B?bU5WU3ZJRWtZK2xLUE43WVFiYVlPd1hNaTdjaTVwSE1rRFhTWDVBY1d6ZlZY?=
 =?utf-8?B?Tmp5eGF1YnRCeEVaNGE4UXg2cnhENTBpNGs2VTMwalJPM3dBRkc5d3A3b2ZP?=
 =?utf-8?B?akV0YkIzYzdWTXAwVUdrUmt5QXJ6UDYrQnJvZDVZemJ1MUt1U2k1c2l6YnQx?=
 =?utf-8?B?Z1hrRWtONm15RWkzTUxFMUFtK2ljc3Z3YWlMcmpTNWcwSFRQT2VzL1BZZzlH?=
 =?utf-8?B?MVFubFVGcjNwZlpiTWJjZk5WNmVRNkE1NDV3UHBLbzY5YWMwang5VnVlTFVH?=
 =?utf-8?B?ODllbENjakpGZzREaERpZVlZeFgxTWhDQnQvK0JudUV4ZCsxdkwyd3kzbWhu?=
 =?utf-8?B?S1htUGh5RGs1UnpQUW5Sd2poMCtFM2g4WG1KTzRUeGRtUlJ3WnljMWw2REJK?=
 =?utf-8?B?TEVneURNaHFTZ1dubnhvVTNVOW41R3pxNDlueU43QnJFRHQ2Ry9QYXFpdUow?=
 =?utf-8?B?YStJVGR4dUFxSTBpTGl5UG9jU0RQakFPSEVjN3ZTUlN1ZVlqZFFGa2VCVDFo?=
 =?utf-8?B?T2pIOTBneHQyTEZXTXNHU0ZydkRFSlYzVmphR1FmOFlqR21SVXZnSmd1Nlkw?=
 =?utf-8?B?SlBZS0wwQXUxa0NrVmFhT1BRUlJnalFkUWtWSlJBZnpjcFk1UFNDUEs4VWwr?=
 =?utf-8?B?cTlXNFBTQ1Bhc0F1Q3dpV2Z5SFpseGRuTVNibjhMQWt4MzBJSGpTSSswTXBT?=
 =?utf-8?B?YWszdE9TeXlEMndzM1NNM0UxOW11Vkd3Z0tIbHlBL0ZsRTk0S3ovWDRFNEUv?=
 =?utf-8?B?NU5mZXNwVVJNQ3RMVXBVNDgwL3U2dVFKWVRoWkQwR2VLUjNTU1RQOVZxZjRY?=
 =?utf-8?B?U2psamVLYVdlNnZ0SkRGanV6VVE2YTZldmM4cjErWDhIMGJ0a1lVM2ZnZnRJ?=
 =?utf-8?B?ZEVIZ1E2YXVPTWs2WFBKM3J5NUZEczZ4VWhqSE5RMW52RWJJNmFUS2Z6MXNL?=
 =?utf-8?B?VWVVSElYcUYrU2N1RldmbmJ3KzJjbEF1OExOODZpR0Vaam1Ic3dWUU5YUWNs?=
 =?utf-8?B?R3NWQzJyaVp4SGozYUc0M3VyMHVVNlVhTm9aTDE3Zmh3YWh2N1VESHJEOFNH?=
 =?utf-8?B?U2JMbTJiQ0xWdVNDMVlMd0IzK0tSbm5xcTZqME9VTlZOUnJYYUk4U3F4Rlkw?=
 =?utf-8?B?V2t5bjE2b09vcUVGYkZ2S05raGY4QTdWTzY3a2ZkMW5WaUFVQWk4VGM1VXdr?=
 =?utf-8?B?T3BYMUxtMGRjdHZmcVpoUnc0Wm12SGFzREZhZjI2VjRHUnYzaEtzZC94U3I0?=
 =?utf-8?B?MmF6Rkw0dzlxNWhOcUw2cmxhUVVQeE1FT1QwOFE3RkFwaGUwdUQxdm5MYUhL?=
 =?utf-8?B?US96QlBJcVBBbWFDYjllQndDWXdVUmx3aDJSTlc1RWJNWmI3K0xLcDV3bTdD?=
 =?utf-8?B?OHIxT3NUaUVTc3VYalJoc3R3eERESVJjQWFrZTk3QWtVYkxQU29yaDFwS0gr?=
 =?utf-8?B?dXMwMFBrc0hyUE9mWnV1bTFPMmxaQ2hUTzhkNjFKRUU1WHNETnRKVDNUcGxh?=
 =?utf-8?B?SndMM3JvNHNrUWozUXRuZDNSU1B1UE1uWFJZdE4xMjYySmxSSERxUmdXaFN3?=
 =?utf-8?B?NFE4aFNHdTNiSjVLWFBwWXJtU1kyRGc4YVgvSFJyZFpkRzY0cHkwMWJqa3lQ?=
 =?utf-8?B?TkVzOFhId3R2RzhENDFJTUpJTUxTWHBjU24xdmlHaVoweUtjN1BlTGdIR0Jn?=
 =?utf-8?B?ay9sK3NxblN3RW5XSHJVOFhVUTI3UFRobWY5TnFCQTNlUyt4ZFBySEZVRDBR?=
 =?utf-8?B?Wk12a1YxZmJLRFZZdy83UjVHSUNqOW5hcllZUWNkSTRkdnBDU3c5cXZLNEtZ?=
 =?utf-8?B?U2Qxa0hxNi9qM2RVS3FsYllXTlB6a2NFTndWNUxnN0RHVk5ZYlR2QmJ6TlZD?=
 =?utf-8?B?ekdoOGlIWmk0REllcFdJMHdzRGVLMGRHMXltcGpwT3p0dG1YQXZjOGZ0V1RN?=
 =?utf-8?B?dHZCaFpnRk1rWVd2ZjJScFRnSEdFblVEdk9YdEtmY3BuQ243bERLb1F6ZnVi?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f04281-71d6-4114-83d0-08dd4b729515
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 14:36:05.7710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELtBodqdqEy0xvOcPNYL/SGEWq4VmbYH/A7HTM2LddTjGmEByQ5EBQRWZ8QUBvUaxoyS+kvLWLUqnY6dbxQYfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211243

--------------ZqVEbjjr1jDQMPOdEDLg34zC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 11.02.2025 um 22:46 schrieb Richard Purdie:
> On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openembedded.org wrote:
>> From: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>>
>> Signed-off-by: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>>   .../python/python3-bcrypt-crates.inc          | 84 -------------------
>>   .../python/python3-bcrypt_4.2.1.bb            |  4 +-
>>   2 files changed, 1 insertion(+), 87 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates.inc
> So let me as the silly question. This removes the crates.inc file and
> doesn't appear to add any kind of new list of locked down modules.
The list is generated on the fly like gitsm and doesn't require an extra 
step.

> This means that inspection tools just using the metadata can't see
> "into" this recipe any longer for component information.

We support and use python code inside the variables and thereby need a 
preprocessing of the metadata in any case.

What do you mean by "component information"?

> This was
> something that some people felt strongly that was a necessary part of
> recipe metadata, for license, security and other manifest activities.

Why can't they use the SBOM for this?

> Are we basically saying that information is now only available after
> the build takes place?
They are only available after a special task run.

> I'm very worried that the previous discussions didn't reach a
> conclusion and this is moving the "magic" out of bitbake and into some
> vendor classes without addressing the concerns previously raised about
> transparency into the manifests of what is going on behind the scenes.

I try to address the concerns but don't realize that the missing 
information in the recipe is a blocker.

This version gives the user the possibility to influence the 
dependencies via patches or alternative lock file. It creates a vendor 
folder for easy patch and debug. It integrates the dependencies into the 
SBOM for security tracking.

I skipped the license topic for now because the package managers don't 
handle license integrity. We have to keep the information in the recipe 
but hopefully the license information doesn't change with each update.

I don't understand the requirement for the plain inspection. In my 
opinion external tools should always use a defined output and shouldn't 
depend on the project internal details. I adapt the existing users of 
the SRC_URI to include the dynamic SRC_URIs.

> I appreciate some of the requirements are conflicting.
>
> For the record in some recent meetings, I was promised that help would
> be forthcoming in helping guide this discussion. I therefore left
> things alone in the hope that would happen. It simply hasn't, probably
> due to time/work issues, which I can sympathise with but it does mean
> I'm left doing a bad job of trying to respond to your patches whilst
> trying to do too many other things badly too. That leaves us both very
> frustrated.
>
> I really want to see you succeed in reworking this and I appreciate the
> time and effort put into the patches. To make this successful, I know
> there are key stakeholders who need to buy into it and right now,
> they're more likely just to keep doing their own things as it is easier
> since this isn't going the direction they want. A key piece of making
> this successful is negotiating something which can work for a
> significant portion of them. I'm spelling all this out since I do at
> least want to make the situation clear.
>
> Yes, I'm very upset the OE community is putting me in this position
> despite me repeatedly asking for help and that isn't your fault, which
> just frustrates me more.

My problem is the double standards. We support a fetcher which dynamic 
resolve dependencies and without manual update step since years. Nobody 
suggests to make the gitsm fetcher obsolete and requests the users to 
run an update task after a SRC_URI change to create a .inc file with the 
SRC_URIs of all the recursive submodules. Nobody complains about the 
missing components in the recipe.

Whether we have hard requirements and introduce a git submodule support 
which satisfy the requirements or we accept the advantages of a simple 
user interface and minimize the disadvantages.

It doesn't matter if we run the resolve function inside a resolve, fetch 
or update task. The questions is do we want to support dynamic SRC_URIs 
or do we want an manual update task. The task needs to be manual run 
after a SRC_URI change and can produces a lot of noise in the update 
commit. In any case the manual editing of the SRC_URI isn't practical 
and the users will use the package manager to update dependencies and 
its recursive dependencies.

As a compromise we could add a new feature to generate .inc cache files 
before the main bitbake run. This would eliminate the manual update run 
and the commit noise as well as special fetch, unpack and patch task.

--------------ZqVEbjjr1jDQMPOdEDLg34zC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 11.02.2025 um 22:46 schrieb Richard
      Purdie:<br>
    </div>
    <blockquote type="cite" cite="mid:d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>

Signed-off-by: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>
---

&nbsp;.../python/python3-bcrypt-crates.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 84 -------------------
&nbsp;.../python/python3-bcrypt_4.2.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
&nbsp;2 files changed, 1 insertion(+), 87 deletions(-)
&nbsp;delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates.inc
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So let me as the silly question. This removes the crates.inc file and
doesn't appear to add any kind of new list of locked down modules.
</pre>
    </blockquote>
    The list is generated on the fly like gitsm and doesn't require an
    extra step.<br>
    <br>
    <blockquote type="cite" cite="mid:d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">This means that inspection tools just using the metadata can't see
&quot;into&quot; this recipe any longer for component information.
</pre>
    </blockquote>
    <p>We support and use python code inside the variables and thereby
      need a preprocessing of the metadata in any case.<br>
      <br>
      What do you mean by &quot;component information&quot;?<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">This was
something that some people felt strongly that was a necessary part of
recipe metadata, for license, security and other manifest activities.</pre>
    </blockquote>
    <p>Why can't they use the SBOM for this?<br>
      <span style="white-space: pre-wrap">

</span></p>
    <blockquote type="cite" cite="mid:d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">Are we basically saying that information is now only available after
the build takes place?
</pre>
    </blockquote>
    They are only available after a special task run.<br>
    <br>
    <blockquote type="cite" cite="mid:d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">I'm very worried that the previous discussions didn't reach a
conclusion and this is moving the &quot;magic&quot; out of bitbake and into some
vendor classes without addressing the concerns previously raised about
transparency into the manifests of what is going on behind the scenes.
</pre>
    </blockquote>
    <p>I try to address the concerns but don't realize that the missing
      information in the recipe is a blocker.<br>
      <br>
      This version gives the user the possibility to influence the
      dependencies via patches or alternative lock file. It creates a
      vendor folder for easy patch and debug. It integrates the
      dependencies into the SBOM for security tracking.<br>
      <br>
      I skipped the license topic for now because the package managers
      don't handle license integrity. We have to keep the information in
      the recipe but hopefully the license information doesn't change
      with each update.<br>
      <br>
      I don't understand the requirement for the plain inspection. In my
      opinion external tools should always use a defined output and
      shouldn't depend on the project internal details. I adapt the
      existing users of the SRC_URI to include the dynamic SRC_URIs. <br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">I appreciate some of the requirements are conflicting.

For the record in some recent meetings, I was promised that help would
be forthcoming in helping guide this discussion. I therefore left
things alone in the hope that would happen. It simply hasn't, probably
due to time/work issues, which I can sympathise with but it does mean
I'm left doing a bad job of trying to respond to your patches whilst
trying to do too many other things badly too. That leaves us both very
frustrated.

I really want to see you succeed in reworking this and I appreciate the
time and effort put into the patches. To make this successful, I know
there are key stakeholders who need to buy into it and right now,
they're more likely just to keep doing their own things as it is easier
since this isn't going the direction they want. A key piece of making
this successful is negotiating something which can work for a
significant portion of them. I'm spelling all this out since I do at
least want to make the situation clear.

Yes, I'm very upset the OE community is putting me in this position
despite me repeatedly asking for help and that isn't your fault, which
just frustrates me more.
</pre>
    </blockquote>
    <p>My problem is the double standards. We support a fetcher which
      dynamic resolve dependencies and without manual update step since
      years. Nobody suggests to make the gitsm fetcher obsolete and
      requests the users to run an update task after a SRC_URI change to
      create a .inc file with the SRC_URIs of all the recursive
      submodules. Nobody&nbsp;complains about the missing components in the
      recipe.<br>
      <br>
      Whether we have hard requirements and introduce a git submodule
      support which satisfy the requirements or we accept the advantages
      of a simple user interface and minimize the disadvantages.<br>
      <br>
      It doesn't matter if we run the resolve function inside a resolve,
      fetch or&nbsp;update task. The questions is do we want to support
      dynamic SRC_URIs or do we want an manual update task. The task
      needs to be manual run after a SRC_URI change and can produces a
      lot of noise in the update commit. In any case the manual editing
      of the SRC_URI isn't practical and the users will use the package
      manager to update dependencies and its recursive dependencies.<br>
    </p>
    <p>As a compromise we could add a new feature to generate .inc cache
      files before the main bitbake run. This would eliminate the manual
      update run and the commit noise as well as special fetch, unpack
      and patch task.<br>
      <br>
    </p>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------ZqVEbjjr1jDQMPOdEDLg34zC--

