Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE92C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:32:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.62])
 by mx.groups.io with SMTP id smtpd.web11.34966.1749220370126636165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Pu84TBZY;
 spf=pass (domain: cherry.de, ip: 52.101.65.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0ySaL1pswwgo2K3SPh+Ruvqek1uP5vdI49Vjol9XIype2bFnikPUNZ78e5ZuBVh3pIl3n2MfJKZZWnWxfZUybtQECb9638h0NC0S2QvQ1GnRAdTCTubmT9HLkvJ+rsoodWj3PdduC8nJ7rdck2Tb+ygit6sAKAwPdap7mj+VOLAaIKHJfYt7c7VNSkUjQSEXV2G96N6HOFevRxEBerlayfITJc90tFu9OLF6uX9dR29aKAVVgGU2zukGiji6J0uvrHf3vpoeWa0buNwxyDVWceQEFU0EOucatWBmBq5DqXesUevgWmI8o3j5fDXQREA+kP2PzsbQO0XBNZQ65ZVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kf0Y7aIsfbhM3U4kBmSLvklhSgAh9Arja017XNogCXk=;
 b=kSinsJxYCZ07cf+xHaIaUEA9gMN4sN+OF3L9IwJYNyA7dZAMT5mkZDPqG6hhx1EC7KUNMBadSopwIucZjoN3n1wTjQijwe3fqkBrRMTSq8criy2eCfbnTo7OEcY+g4uQg88qDaSTppULq9mCkArqrsRSnoq15KY12lKBF9RwNXPbDOzLG4Uszh+TAm8HvIB1av+HirV26CuBpbXOOpswTO7Zah3TW60ycYLoj3oi/2aFdmxQWS4UBxHLqeXgwywOgBBENijWlYEORZ3f8PCEeEPbvLpCbRR1GXsxb+WvZtvQYGwj7bCOM9YxTLBHuHiF++RNPbWwOeN6+Z4/VuWy5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kf0Y7aIsfbhM3U4kBmSLvklhSgAh9Arja017XNogCXk=;
 b=Pu84TBZY+IDig+43qH+oeXi6Ah/8CZVzjFXAYkdnsGnt69artP3k2iOEcx22txrjLqmfTTtj6Uo9HSezWhQjm2aj+E0MhMIeWXRDI/HXYDssyaMtqCCs7iEHcm1uGEUVHA2/kGn6rC3+d4jOGOeuq7jij86+Mevj8RMNYn3Gq9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7707.eurprd04.prod.outlook.com (2603:10a6:10:1f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 14:32:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 14:32:46 +0000
Message-ID: <02970934-b607-429f-bfca-722b8678a10c@cherry.de>
Date: Fri, 6 Jun 2025 16:32:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] insane: add test for recipe naming/class
 mismatches
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250605201151.2019194-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250605201151.2019194-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b5d0e0-f102-4bf0-9778-08dda507018c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eS92a3VEdytHZVJqL0x3RHhqcHI5TVoxUmR2elJmMFZMUitTWGkxWVY3STJ2?=
 =?utf-8?B?bndIT21FRUhvZFRaMWtYMDIxcUVGQWFaZWZ5SUp4aXgzNVh6UGhleUI0d2Fa?=
 =?utf-8?B?ZzBiaGxtZm1HeGRWRTJaZGhOcHpkNW9hUm95d2M2QVIxTGVNTXdmdDB3M25S?=
 =?utf-8?B?RmQ4YjI5S0YzeDQzdmNmK21rNHB1T2VvSmp5aE9abEU5VmZHRXc4VTZjTHhZ?=
 =?utf-8?B?OUkrWXp4QW85QmVieXJXM1ZKZnpNbm1iMGI3TDhJejdqSDlBM1RSTTZZOWFv?=
 =?utf-8?B?STRwNlRXeStuNG45ZzZ4Q2pRa25vWllOVWpSWEo4cHNsUFVJL1VtaHFLR0RB?=
 =?utf-8?B?WElJbXA2ZGxwMzVmRklkQm1OTlFPTnN4MHNod0ZwbGFsUDd6U2g0YTdRekE2?=
 =?utf-8?B?dDF1WnhzSWVzSjh4blE3VC9VUjg0OU1EcThMWk9CZHNLWklDbVRVSDNTaXZE?=
 =?utf-8?B?alRUSWlOVUNYOWgyVmU3ZDd4cHZvYjYwZmNXb1BhaU50U3pQRys2RE84cy8y?=
 =?utf-8?B?ODZJQnJuK2dOclBvZEtBVFltS1BMOUNtbkJhckJHZEllOWh4Y1U3T2EwUU9T?=
 =?utf-8?B?eHhYVkd5Ky9qUUtPT0t4TytabjZJTW5HOEpkOGR3RjFHRTFXV04zYUZ1Y3h1?=
 =?utf-8?B?dUM1TGsvUHdsVzcwRmlVMHorajFwN3E4OUp0K2kyQ3dEOHlLa2xLclBXVzE4?=
 =?utf-8?B?dWpodElUVGZDYVRXb0pwTUFET0s3WjFSdlB2YUpTTGxLM2hoekFKc3pHdWto?=
 =?utf-8?B?SWJoS0lYUmVNRW5xS04wOVNnNDVnVExsaWZqd3RFMHkxNmFGNjBVUjdPMldE?=
 =?utf-8?B?Q0JydnNFM3FCbnRPS21XYUZJb3NHZERmYkdGeUVaY0hTQ2xiN2FoUmNXeXpD?=
 =?utf-8?B?UVlPWDJhV1dUVGdTQVYycm5XTTAvTXRLTk1KMVpaNXdzTFpKd0hNbHNoS0dX?=
 =?utf-8?B?bU44WG50Q0c3YXcxUlBJZldBYVN5aXdRdzcwbDhWaGFXWG1FNnRSS2MwMTBv?=
 =?utf-8?B?bkhMbjg5SWxUcmNHbUhDTjc4SXFsSEtWWjBNSW5tSmRZUDlNa2FwY0FKT1RQ?=
 =?utf-8?B?YU5WWjF5dmlmR0s4eG9qeE1QaCt6OVhwZC9tUmQ1SnBGbk5vYWNTS3o0UldD?=
 =?utf-8?B?R09ib1B2clhxRG44NFNPN1EwQzJYR1p2VGlBZFZIazRkRlg5cHNjOVUrN2I2?=
 =?utf-8?B?d25FTU9aQU15VFAra3RDcTZGcCtYWmNZbFByNUVEYzMzN0NPdU1rTG1xSS9a?=
 =?utf-8?B?L3UweENEMFloVWVIZ2RGVjUvRTV1cDBPajViQkt1ZXZnaHh3TGpodmwwWmdB?=
 =?utf-8?B?K3NSRTM4V08vSEI3YXhtK2pENkZzV29Zc3pDUktzdFFncWlhbE5YZU01SXc2?=
 =?utf-8?B?R0xEczZWVy9lQURvOS9OSExudERsdGcrb0hkd2VUUnZBTGFUYXFhS3kvY3VQ?=
 =?utf-8?B?RnNNdk1WL2h3OWxjSjNCeWVtUDVjL2RqSDBsd1JVY2hYUFc1enRkV2NNOVgr?=
 =?utf-8?B?Qy9kQnFSK3FFN1pnLzVMcmdRK2NlNUZoTmlrSXR0UU1BMkdOWHhCNUJlWmJq?=
 =?utf-8?B?UUU5TlQ3MXpCSlNXMkpyaXJEMDZNdUo5Z3ltU0s0L2tzZDBtMG9QWGdYSEVk?=
 =?utf-8?B?ME9lbDNoakNqUGlqVGxtMnhHU3FWRmtjQWw4YXNtRDIzT01DQmliK3p2RUhr?=
 =?utf-8?B?QTZlcTRBNDBlMnd4SFI1cGttY0IrczZ4enp0NXZGOUE3QjEzY3o0bHB3MnpR?=
 =?utf-8?B?YjI1K2wrQTh1Z1EvMDFiYVY3YzY1NStlNUlmenZxVWRYS1p5Q0NsSkwvNTN2?=
 =?utf-8?B?UUR3RUZZMWo4YithUnoxVzJaOGpWVjYra3lrdTNVMWNoU3RXb280bVgyQkY2?=
 =?utf-8?B?TllBVFN4ZVorZlNaaVh1T1dld0RnbWcwemRuQlh0bnlWS2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QWNKR3RRK051Ti82ME5jZjRQMk1wU0RTRURqOHNOaUw5WjJvUHltWnAraU44?=
 =?utf-8?B?Wkh0bkE4UFJuVFU4VHZHUldJWEhYL0tlS1JSNFgzaUFDeWgzRk1oYmNKNUF2?=
 =?utf-8?B?eG5PM0V3alF6K1VUS0kvMGE2RWNxaW1EeVh1aVFReHh3dUNidWRsNEVuaXZx?=
 =?utf-8?B?STZUMDhndml5MGN3QkMvK09jN3pGQXlrcjh2cSttaXdwWmdsQ0tSNWlEZGVJ?=
 =?utf-8?B?bUxPaytJZjR5WFJIQTIxR3huTkYwbXBta1JqUjR2dmpQVDYxUVlUMDJaeFB0?=
 =?utf-8?B?QktSY2dEbHhWTHJ5cktXa1d3d3JPTnlUMUVuWVFxS3QyU0hLYjd2cExNU2s4?=
 =?utf-8?B?MmZxZjVNL3dkaWFBM21ZaHp0YWcya1RGK1FyTTZLeENLZUdRV05LUms3WXF4?=
 =?utf-8?B?KzBhdGpvemVHVkNyM3c4QnNvSEVJcTlhQlphK0k2Ykx5eEZtbnhudHczVjc1?=
 =?utf-8?B?Qmd1YmFpcGxRejBveTZTZlhLTGpnT2cwLzhBbWtQb3kycHVUOGtyVXFzTXpS?=
 =?utf-8?B?MXhPak51OEltMnpLUHk1aDdkT25PZXU4ZlhpQWxWT0dDK0pmTVFoNklkWVAy?=
 =?utf-8?B?WHFLTVVxazR0eFg4SGgzRkpKQTdyYnU2OE5NdmVIOE11Y0dsY2lMRTRWVXNR?=
 =?utf-8?B?TE1CdXRUSWQvTlYwVXJ6cHhzT2d1cGtZbTd5UkQwbVVTYVBNYk1obktIVUpB?=
 =?utf-8?B?OWZnL2t1cmVEZ1dJK2wvM1hSbFZEWi91MmdCQnNzVVZtNktETitXTW54a3lE?=
 =?utf-8?B?ekE4a2Y5YnJkc3A0QnR0NkxCSDNReWErbXFaUDQycUlPYjdRTzZGNjNkQ1R3?=
 =?utf-8?B?YVU2dUlkU0E1NkIzZzBtLzJpOUhDbTJ6TUlZVFVrZlBYdExveUZvMW5nOGU5?=
 =?utf-8?B?dURiRHlrYzdwcWxTczAzbmowY2luN3pyUFA3bFY1bkVOcEVYbnlDdnByZG84?=
 =?utf-8?B?citFQUNOOUM0ZHpXVVpJOEsxcEE5MndMM2hrbGFaanhWMStLclFYOUNCTVhJ?=
 =?utf-8?B?S0tGeXJvNUptK05uK0ppTVRldXBGdjF6V2J1Z0k5amd0aGJybmxZQU01NGNW?=
 =?utf-8?B?dEM3bzBqWjhVSkM4YkFhcm1IV0ptT1QxTHA3bzRvZ0NvRDY2V1l2cnQ1bkxy?=
 =?utf-8?B?V1lVdW5Vek00Sk1aSllpNjY5TkNGSE5tZWlHS3dNanNyNllrWFRHeVkxbHNm?=
 =?utf-8?B?MjRDczR0K0NWY1psOVBYSHh3dzA4WlJxTUFISUxOMTBleUt2TVluclcwcmk3?=
 =?utf-8?B?RmNlbEtuQmhMVjlKalhWY2d0eDMvVWpRQ0k5M21lMUxCM2FjU3llTitXNXAv?=
 =?utf-8?B?cW9GUWhXVjAzaC95bUFzaUxMZCs3N3A0d2lWSzc5c2w1OWN2QVBPSk5kcTZG?=
 =?utf-8?B?SlFzSlZLdDRWV1VBZW9wWDZ3VUhIMG1kelRYZFlLQThFcjNsMWZBTm84VVRL?=
 =?utf-8?B?dWdoODJaZU9USWtLUnBleVBZd0VOdzB4OUtURzNHcUFyMVQrQjh5WlBpVjNG?=
 =?utf-8?B?NktXekFNY1lZRDVUUE5hZVpiLzN1djFsZ29UYVdVdC8wUU1pSG5RRWduTHhO?=
 =?utf-8?B?YmV5MnVlYzdhb3FrbDR1NkJvekRHUmdpY2paTWV2M1FGQVpNS1ErNGU0dDR6?=
 =?utf-8?B?eUZwSkUvejk4K3dQL3lWQU41UThiclNOOWhtTnhMTUQ4bndLYk5Cdzcrb0Zw?=
 =?utf-8?B?bzZZSlZJOXlZNW1id1JEeThmc2R4MmRMZWpZMHVUOWZxNEZGTkxmMXR0bXBW?=
 =?utf-8?B?bmZkUVlJbk05Q0txdnNVZm94T1I4VHJ0ZUx6MjBVbnY4bkMxUGZKSDdNMmRt?=
 =?utf-8?B?L1AvMDFYODYwWGp2WVVkSkg4NEk5emdqeWgvVThGRWFyN2dpTVlOTHcyNGZ0?=
 =?utf-8?B?Q3ZmQlhONzZXQVdYcHlCWi9kNnZKSno4NEg0Qm1OZGpMYk1aZ3FQU0tPd3lC?=
 =?utf-8?B?ejg0MVY1ekFteVM4bEFNWDZPcGNjRmZ4VDFLQnBGSE9yanViTlBjRnB3WFE1?=
 =?utf-8?B?YTg4ek1nR1pXMEpDRWI0Sy9zVERDdkxzRWJVZFRjc3ZVU056MDB6OG80b0Nq?=
 =?utf-8?B?N0tsdFZUVDFPR29aOTlhczVUbVVtMW9aWUErU29TN0IvemhKL1NZL0xqTzBR?=
 =?utf-8?B?MnlTQWFPTWVPb3dac01WNWFiOU4vMjd5U0FYOHJ1MCtXaVdnY3BsZGM3aEZq?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b5d0e0-f102-4bf0-9778-08dda507018c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 14:32:46.7932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIWw7ZYvXP4mFHBlgeg3wIt6Jn5GrTqeO/+gT7k+mzyHI1UuNEytBGZpln5mqyzVL5L3XvGt4kQByWtSK3QX1wDuymPoRTK8ERcIp7CQSvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7707
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 14:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218158

Hi Ross,

On 6/5/25 10:11 PM, Ross Burton via lists.openembedded.org wrote:
> It's not unheard of for new users to create a recipe called foo-native
> that has BBCLASSEXTEND="native" instead of "inherit native". This will
> result in a foo-native recipe that is actually a target recipe, and a
> foo-native-native recipe for native builds.
> 
> Add a test in recipe_qa to verify that recipes called -native inherit
> native, and recipes called nativesdk- inherit nativesdk.
> 
> As this behaviour is expected, add the new test to the set of tests
> required to pass for Yocto Project Compatible status.
> 

Once this gets merged, would you mind sending a patch for yocto-docs 
that adds it to documentation/ref-manual/classes.rst ("insane" class 
description)?

Thanks!
Quentin

