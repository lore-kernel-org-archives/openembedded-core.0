Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED624C369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 15:10:20 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.41])
 by mx.groups.io with SMTP id smtpd.web11.77811.1744125011650633496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 08:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=ZkKq/Wxr;
 spf=pass (domain: oss.nxp.com, ip: 40.107.241.41, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxgwS2ipMHmVD80mhxA6ymjnO4OAmuf2NgH26RmQNXii11wQmwkiMGhf7IZC/IG/8VrBVzldUtFNwZBvKIkBM/T18u5yN5uUbEGO//Tr+9pz1wwUz06958mUolUKY4bkbVHgUoJEeNba7rIl1tXjzVs+7KCOpSxIcFsT7g9T043jbwQ0S9zdHwMDBsDDE1eN6bOTPWMeGZM5sC2LINS+tjtaPX/sOb15PXKack2+lBwaXTXcErbMAMzQR73wOggAByjqPgRYMVBvMtlWMAgZCl4qUjltNGd8Hk5juig7kmLYOK6/nyi+oI5UBBcmexco0RzEHrVZv3rPzPeLQ1pGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJ3W/1iVpTKg4/VHm9AbCrQpRXpHmQtHr1ABoKhOOtE=;
 b=Jz2OInADm4eXI8TEbvUDCFLGXK/m+KrLZ/tMzzBMISAyWuF03LCvy0K2u1EqLHPmvk/laXP/LoSw4ZKjmNANsfnAx7qJ0SLDRsTOhMlUccDSQh1/bLyCCLWPogln2piG9u40L4/6PF9FK+ktwmCAleo5Co1CGfaMcMxAaYficuE/FsY01/Tnsp4r5bxPCzwnBb9xKWlP25rqge0kC6v7qdE3ZA0jewJBUX8nFKmVPe2OvsuIar22cs0wJlCxWOidDQRWSE29RxFX8RfztWor3SDUYc7EgSJEB3M6krYsvikYUk9kqSbChgqYS7nXD9GrC22ux6tQdz3tf+BxvH0DVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJ3W/1iVpTKg4/VHm9AbCrQpRXpHmQtHr1ABoKhOOtE=;
 b=ZkKq/WxreBZv3V39kfYYgZM8HGIi4WvGBH+MQqaeK6heYXsvOku/w3EWAB4IA6YI/1Bn9N8wa+uBBktRPHj7j9DaIecI4r5GjJm6Nz3w5Xh+Th/ZhuMBcNQVmThIWaFOjLBNN5zqFe86WBmWBYC12z7IQatKWH4wv9zJoK8m2+bKCkUin38nCFT5TsRKjZWnUGVkN/BN0hZfg/czIBxP6sO7wLqS26/ZDXpbU4rjm1u5BngBW3B6wk0cZVUa21oLq3FHOlDlVuI+SAGUj43neIGp54v5hQp8qVuv6DCRrE48vHdtHv0eCBM0g6Y1/NTSWcrCsPbb4O8IZGswVritfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10212.eurprd04.prod.outlook.com (2603:10a6:800:243::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 15:10:06 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 15:10:06 +0000
Message-ID: <27985820-e6f7-49a1-8574-5c55f17ab80d@oss.nxp.com>
Date: Tue, 8 Apr 2025 10:10:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 4/5] oeqa/sdk/meson: improve test to validate
 host/build target assignments
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
 <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
 <D91AQNC6UKX5.394WLWGGFWT4O@bootlin.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <D91AQNC6UKX5.394WLWGGFWT4O@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH5P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::6) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10212:EE_
X-MS-Office365-Filtering-Correlation-Id: afa92263-2855-477e-7706-08dd76af7239
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L3kzZTZlbE5BTFdrc0duL0ttblNub1UxbmpMd0VhVTVZOGpVTmRkS0g5UU9p?=
 =?utf-8?B?YXNHRkVXWThqYmdWcFJPcVk4b210TzMzN0NFRUY0dStpNlpQQ1FvK2JvZzhT?=
 =?utf-8?B?bGY5VnI1YWxwOTZIWm5OV0ZtM0pUdVJFZk9KazNjeVNmNXZLSnExL25WbjRG?=
 =?utf-8?B?KzlibVYrcWVycWIrN3FJS2pYTERHUHJvdDZCcGIzamRhQnlvWHh1cFFKcWl3?=
 =?utf-8?B?UjM4VXYwaHp6S2JXcWFiMVJRSVNTbEZzaURRVGdPR2UrUGdrMW1rYmlxK2tQ?=
 =?utf-8?B?c3M4YjNNWWxrTTM1ejJGYjJrRHRDY0hlaHcwWi9NUTFxbE8xREtTa21oTlVZ?=
 =?utf-8?B?OU1WcHlrWFhaMzBGOE54N1VuRG9pQ1VXMHFKQVM4bFQ3RFVXZG1JaGIzT0pK?=
 =?utf-8?B?b1VoVHVJMFM4UnRkV3orTmVHSUNaeXI2QmFDTG94VHZCaE95SEozQmtDMnYw?=
 =?utf-8?B?M1NCcVpDN0tXbVdTVzEwV3BRM2haUGxvTkl5cG5HbHZBTEJidXA4S0hLYVdI?=
 =?utf-8?B?RFAramtuckRRWWdmVUJqL3A4dnd1MWp3NzRMVVRJbm1zc24vWUpkODVaTEsx?=
 =?utf-8?B?aXJObGp5b0hRRWRkbVlGaFJERTdTc3ZCRnJhdWNDVGMwVmFlOGk4QktodVYz?=
 =?utf-8?B?bytoY2o0WS8zMGRIaHIwZitDUjRsYzBaME10a3ozRXJiampiVXdsU0xWKzhu?=
 =?utf-8?B?OC8vM1JORFE5M2xlREo1Y3gzSXNFZTJ1czM0Mk5FQ3lyWGxHaHArZ1ZrT3lH?=
 =?utf-8?B?M0dYTG5PUlFhQ2loTnNrdDBGQWtoc0JkQmdQWmhmaC92eUJXODE3aVNtVjgx?=
 =?utf-8?B?c2JJeU1SeVlyYTlsakkxeDRGQU5vTHc1c29sczMwWkFkYnNQNVB0ZUZZb21h?=
 =?utf-8?B?dnlidTNsTnY1L3FhTm1STHYxWWcxVUorRjlQbWw3aW9oUU1yVzNCUGp5OGNN?=
 =?utf-8?B?SE81bFpoSlhLNzlpREJUMnRUNVZJK1ZPM2FsZm41TGc5Rk9Jb1U1MWM5bDFM?=
 =?utf-8?B?Q2pvVXlTMmFIV2lBaEhjZ2xiR1loUG5UZmdUWEhxQWlVSytGK2F3UXQxcHc2?=
 =?utf-8?B?Q0pkaHNyOW0zbDAvUWh1eGJ3clUrdHZFeE5tU0VNOUordnY2UUNRSXczaXFP?=
 =?utf-8?B?OXYyMTg1R3J2am9hOStLYUg2QjlzZEN2Y2NlM0V6QmUrQ1RxSWhRTTNOaFE3?=
 =?utf-8?B?L0krVitJdGhoOFZkck40SFg3dklJcU0zSVJwUG9PQU1mOGlxdG9JU0lGZlB2?=
 =?utf-8?B?VG4zLzd4Yy9TUndtdzViVDAyZHJjc2JobVJKNVlaRHlIZ3dIMmp0NGlOUVRQ?=
 =?utf-8?B?NFhURlJxaVNhaFR1UWpKOXhwa3VrTms3cDhDMmtWRWtEYTB1ZzB6bjB0Z0ly?=
 =?utf-8?B?cG5DQ0hiOENmWkQrMWF5VUl6ZENKQVFTSU5sUHdIVkhGNXIyYjU4TXByTkVX?=
 =?utf-8?B?d0JCT2szQzBpL0dzVU1JVDJHbjQ5VlhOa08yOE1KRFBUMVJyOUpady8zcDJs?=
 =?utf-8?B?QVZncDRsMWJDblY4MlMreHJtbTJrUkxrSlM5SWErb2FhWGQ4Z3Iyc1hTalhS?=
 =?utf-8?B?QjBpR0swd05OSFovNUtQRVovMzJOK3dSak4wWXJsNDhkT1VYeUYzTEtHS2ha?=
 =?utf-8?B?MXBJS2ZySzRzUVg2RkxYazhJYXJRYTFDdm8yNmlwK2FyZ21IbVduRi9YRTNY?=
 =?utf-8?B?V0E4aFZVK1RPQkphYUg2d0tFbWJNbHp2MmhuSDF6bEpXMU9QWWQ3TldJUHFm?=
 =?utf-8?Q?fKU3pvswXuoN5LgjAGnWI8SJV1mEuf26koGzJOi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1hIQWFrQmZvM09oUzVHazc3aEVGaHQ1clM1SmI0U0tUek80UngxZm82Rm53?=
 =?utf-8?B?V2wreFE5ZXFEaWNXTXlXWGVjNnhCVEthY3FPZ0dnWG1RR3ZDZTRWYVM1OUwv?=
 =?utf-8?B?c0IzZmNUQVZVYWlnZVl4ZVBaNE5pTXRxbStlY245RHdoR1hUaVc3eWYzL2tI?=
 =?utf-8?B?Mk1MbEZoOTFhSC9zZjNMQmNnZlplZDBBUW5WUElZZ2tOYXlqT2RKVFBlWFk5?=
 =?utf-8?B?eGh1dzJwUE9mUnMyVjYxZFRVUDZDdXYyeHZmZkNPQlU5eUtBTk5FZkN0TFI0?=
 =?utf-8?B?SHRURVZQeWwxSkF6N2tLSjUwaUJPalNVNjloNE05NDFQZllvWjNPUWpMcXVk?=
 =?utf-8?B?VldSMmc4K2ZQT25taUo4NVgyMWZpQThHaWdOcFRqL2VOS1dCOXlrUmZFVi9O?=
 =?utf-8?B?dWZNZDJZR0R6TFZkeTc2LytqK0E0bnhYYmRJNlFoQ1JnMXljeFNBNG1hUVo5?=
 =?utf-8?B?dElTeitDZnlUMVIvMnd3TXBZZDRpbk94NnFuQStnRUxuSWJFWXVRZUVmYWhp?=
 =?utf-8?B?WS80bDNJRlIrTEJtQ2MwamJqNnFlc3ZPRmovVklkekx1Sm5yNkRVRXp1eUNi?=
 =?utf-8?B?SEhtTCs4M0Q2MWZCZDFYK1B0TWV6ak0xVUJRazAwamo0Z1VNSDBmU3ZpUldm?=
 =?utf-8?B?WDVqaWFSbUphd1UvcVpIcTFhTTBWZk9VMklZY0hxQTd5cjRCcXNvWkFIZmhp?=
 =?utf-8?B?akdGM1B1S2ZHM0w1aWl4K1NLejFDTkpZYnZkS21BTFVGTFNBU2N3TkFCN05F?=
 =?utf-8?B?enMveEU3eFVPRWNla2VwZUVlUHNNbnZqRkdUZERCbzl0VnJjK0xaaXpVd1Ba?=
 =?utf-8?B?ZU1saHpPSjBsanh6dWtOODFtVWNEYlYwMDFMbWNIcTIzZW1sbmdMUVVDUU1G?=
 =?utf-8?B?YXpyVWhOeHZ5MmxuYzUvQmIrT053L1NBL0tITDg1dGMyZXVhamU4RnMzbUxB?=
 =?utf-8?B?MC9XTm9MVks2WWlqUTc0dGQ5cnBXN0lmNnk3OXRJa3RBTGQzbjFJRGF3cUE4?=
 =?utf-8?B?K2w2U3JlM2MrUEZ2Q0NCdFRCd3hweU12Q0FkNHA0ZnNFdUorTHJiWXdjMWEx?=
 =?utf-8?B?YVJJN0MwNi9nZzRUbEpmODZnK2lxQzRlenJtdGtpbVJTL1YxWXFQcit3YTEz?=
 =?utf-8?B?ODlGdWkrbWJydzBxNERpUVBFS2kvY3paNHNGS3ByTndwd3MrUEpLc3ZUdHFU?=
 =?utf-8?B?dDByQ3hMRHlxaSszRDJaZVBhZHpsM1lLWmpUalBHa2RBdVI5NUMzT1U2MTJW?=
 =?utf-8?B?ZXRhREYrOEN3QWpCSmd4TEE3bXZNQ1BVWGZwZWJ1UkJnWkFsMG1JQ0JNUWdz?=
 =?utf-8?B?T1UrWFZtTVpaUkJhUi9BbUpBUGpIaUVDdWF0SUI4dVpFSlk2Q1NzQ1lYd2xK?=
 =?utf-8?B?a1V2cUE2bGRHdG9PaWl2VHUyU0d4ZUY0YXRENjZ6dmFWQUs0cFdWR2hLbXA2?=
 =?utf-8?B?cTRLNjVTYWVOemdDQWdrb2h4Z2NGcmlwWEk4dnZ2VlgzUU5sdy9TWTM5dWgz?=
 =?utf-8?B?MEI3MjBSVEIvaStiSVpIWXdqZVhjRmV6QjREZzgrUGVnRUVRSWtQUXgvTExM?=
 =?utf-8?B?dHJjTGtkc2lxVnppT05LeWsxNHpVOEFkTVYrZm1VQ0pGTFdjZzNxQk9iRzA4?=
 =?utf-8?B?UzJQcGtjSHc2NDhrTThYQ2hHNFhyeGdyQ25TMnFJZ2pEc0JkWjdRK2lmQ09v?=
 =?utf-8?B?d3NqVFBpd2tEUVowWE9pOTJHWWpVc0lNc1QzUHV6WXgwQzY4S3ZOOFJqdDZH?=
 =?utf-8?B?MCtZTmlHZHcyRVlQUGVSd28wcVRpRStnWUpSTDZFWEY0R2oreVhVbjU2cDFt?=
 =?utf-8?B?eDBoTWlMOHdicURHS1RKNEhqU2lNOUcyWWNXbm4vdUIxTHMzTlFGTVMvM05l?=
 =?utf-8?B?ZnJXYTRqZCtzK3hYWGJEc3ZxQnBGUUNtWnEzcWg1NFdHVm9CY3d3ai9VN2V0?=
 =?utf-8?B?cDlEM2JpcFl6QmRoT1ZQcUFabjhTUE5xT2xrUDNUemxXVW5rbWxDcS9DUjZC?=
 =?utf-8?B?MEdHNHE0ZXZuMGJsRzYrbHp5ckgwdWRzZDl5VG1CYVU3M2doT1drOUE3SDJy?=
 =?utf-8?B?eStkdWIvZHFodmp2eHMzREE2RFlkVXZ3Q09xTUhpMm5lSXB4TWtYZG5sZU9C?=
 =?utf-8?B?OUN5c2l6cEpvZmJERExoSzZkbVE3a2xkYWx3Z0orRnlhVXppSzNHa2VhNmJJ?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa92263-2855-477e-7706-08dd76af7239
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 15:10:06.8388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPkph4iV+XV1upRPdiN+DmjsJeqk32m8CoJ3a0o+evDOgDbtGZIRXyrazzJ6uIg6H0A6edpMNAvrLac+d1Oz6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 15:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214542

On 4/8/2025 8:37 AM, Mathieu Dubois-Briand wrote:
> [You don't often get email from mathieu.dubois-briand@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Mon Apr 7, 2025 at 11:18 PM CEST, Tom Hochstein via lists.openembedded.org wrote:
>> From: Ross Burton <ross.burton@arm.com>
>>
>> Use 'meson introspect' to dump JSON describing the build configuration
>> and validate that the build and host architectures are correctly set in
>> the meson.cross file.
>>
>> Also instead of calling ninja directly, call the relevant meson commands.
>>
>> Fixes: [YOCTO #15485]
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>> ---
>>   meta/lib/oeqa/sdk/cases/meson.py | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/meson.py
>> index 1edf78720a..407b94d242 100644
>> --- a/meta/lib/oeqa/sdk/cases/meson.py
>> +++ b/meta/lib/oeqa/sdk/cases/meson.py
>> @@ -4,6 +4,7 @@
>>   # SPDX-License-Identifier: MIT
>>   #
>>
>> +import json
>>   import os
>>   import subprocess
>>   import tempfile
>> @@ -39,10 +40,17 @@ class MesonTest(OESDKTestCase):
>>               self.assertTrue(os.path.isdir(dirs["source"]))
>>               os.makedirs(dirs["build"])
>>
>> -            log = self._run("meson --warnlevel 1 -Degl=no -Dglx=no -Dx11=false {build} {source}".format(**dirs))
>> -            # Check that Meson thinks we're doing a cross build and not a native
>> -            self.assertIn("Build type: cross build", log)
>> -            self._run("ninja -C {build} -v".format(**dirs))
>> -            self._run("DESTDIR={install} ninja -C {build} -v install".format(**dirs))
>> +            log = self._run("meson setup --warnlevel 1 -Degl=no -Dglx=no -Dx11=false {build} {source}".format(**dirs))
>> +
>> +            # Check that the host (gcc) and build (cross-gcc) compilers are different
>> +            data = json.loads(self._run("meson introspect --compilers {build}".format(**dirs)))
>> +            self.assertNotEqual(data["build"]["c"]["exelist"], data["host"]["c"]["exelist"])
>> +            # Check that the system architectures were set correctly
>> +            data = json.loads(self._run("meson introspect --machines {build}".format(**dirs)))
>> +            self.assertEqual(data["build"]["cpu"], self.td["SDK_ARCH"])
>> +            self.assertEqual(data["host"]["cpu"], self.td["HOST_ARCH"])
>> +
>> +            self._run("meson compile -C {build} -v".format(**dirs))
>> +            self._run("meson install -C {build} --destdir {install}".format(**dirs))
>>
>>               self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libepoxy.so"))
> 
> Hi,
> 
> Thanks for the new version, but we have a new error now:
> 
> Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/meson.py", line 47, in test_epoxy
>      self.assertNotEqual(data["build"]["c"]["exelist"], data["host"]["c"]["exelist"])
>                          ~~~~~~~~~~~~~^^^^^
> KeyError: 'c'

Thanks, Mathieu.

Ross, can you have a look?

> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/1330
> 
> Can you have a look at this please?
> 
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 


