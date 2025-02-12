Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0A8C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 17:24:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.136])
 by mx.groups.io with SMTP id smtpd.web11.21853.1739381071182316966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 09:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=CcD9XvLY;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.136, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooHc8Ba8I2ebGtoNPwwuC9QpBGLVo+9Gu70+4R99lUWQtNiMdDgQR5GiIDo0slWAgSOq+rzpxqtbzpQ7S1Rz5nRTsZlQ+Bqhe0L3Tz3kEOS1E3aQ8CCSRJ4RL/yyHpJTp5YHQrKa/jOiKHYKnVSTapG+EPrvTb0C/NjXQoZa4uD5uCr+Ft5GaMQbEs7uFGni5Bj6BmGDdnOu2hAkH3Tvdsfq6b5G7aypHxTkBhCF36hJnrir51XxBS7UyGHUVlLe5uBghB6Y1r/i5V8SHFxrn4oFQztqacniKM0R1oovgMox7bb5YV+f9HWdx9L/QV/JFpiGG8dLyRMA0Yu0rTKSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOSOIsYED0rG2dmL7kFBwj1fQzlUIHeaRf3sVtf7WRw=;
 b=YrFLRWDekIoYvhs/HnnhQuGj8l/hUYPVxrdyuklpsSzqodcqPK9Shn6rWFOqKAO4zYLp9iNA/uKPpDFCxHXTyMtbRqWlJnHrzxgmbqcAqIvK9mzhHF4Lu9INt6nlsnWLANSG+EK123mjfTjk+MVIrDDZ+3t1LNXGe5IZ03gG3JDbhja33oEyVxnmgYqv4QmT2kR99kjIDRsJch5QkoF9LmZ1ANkviiIe/WdmZno+0C9v6T149z9Oc8kOXNIc1Ak10oXlGXDgEGPSLwFhmCPD63y+0iz3P1SBy+HdW7AqlKLYZ+BakwgsBAfi4gG926IVllTSNlzq5cwrkmPdAeR2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOSOIsYED0rG2dmL7kFBwj1fQzlUIHeaRf3sVtf7WRw=;
 b=CcD9XvLY61LqWWjzPlia/n/zlgGuHxTeRPeAH9wQ/IcsO6JKeOPx5S2H1hDLmlb4G3xiSIZExcLiTF0YA9of24WfYDdJTf4z6n6sqjMNlseBgKSuhBdEp9aQRZNtUtuy0faRDXkQdU3YjELcTqXcQ0X+kZBWfLnIbv6cTkhTDZvMSTIASiMSYn5OnWTs+N5rSGcRYE2DW0dRGkSAJvN1lOjyeo1aQNr5vfrHrF4dYTgchyuvUSMq25fjHDvq7xgKGDLVa9fA3ay5zAfgK8w0z1erzoX6rxrxoI7e6gtqxacxct6guaXFNLTZVedRGrlxoywbNl+JauxVNypoLyf2Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by VI1PR08MB10244.eurprd08.prod.outlook.com (2603:10a6:800:1bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 17:24:25 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 17:24:25 +0000
Content-Type: multipart/alternative;
 boundary="------------ASIXTKnWsJWmptAHU7aC2p73"
Message-ID: <7848a428-7193-4597-9b85-84e7dd4d3b32@weidmueller.com>
Date: Wed, 12 Feb 2025 18:24:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor
 cargo class
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
 <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org>
 <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com>
 <CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::9) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|VI1PR08MB10244:EE_
X-MS-Office365-Filtering-Correlation-Id: 822bebac-ab9c-492b-9885-08dd4b8a18d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N25WRzlxaVAva2NoMGZxMzEyK1B2SXpVaXIxQVlINXlUeGlPUXNSalhLUXFa?=
 =?utf-8?B?akdWblhDUEZSUjdUSTRZZGFSdExiaXVXTGZBUlg5RSt3Ui9jSkxRYVg4em5Z?=
 =?utf-8?B?MnI1NldLWFZ3bEdWSXVPS3VLTitWWUJyek9LeDRUYVkrcmNxcW1LdW5oZ21B?=
 =?utf-8?B?SDJzV0xRYzRJN2hrSSthNGpjQVpnZmI1blUwcUZvVlk1eDhCcnZySHhlWDZi?=
 =?utf-8?B?cVdYZUltZXdSTU9ONUJxZGFnL044bHpuV0p0RnFIeGlTQ21DTUxqWTVKaHNW?=
 =?utf-8?B?MXVaK3RUelB1N29mRnNhWHMyWlZhOHo4MUkwRDIrRVdYcWFzdnhXVVdBcUFp?=
 =?utf-8?B?TURmaE96bUZHcWU2TkQ3NG5oZmZ3UTdjUTdXckhnVXVsbzNmT1M1aUpYUEhr?=
 =?utf-8?B?TGVpeVVHRzk2L3NKblFqSndxODc4TVhxSk9PNUY0eGhYOUpwcUcvV1ZVMHpW?=
 =?utf-8?B?WW9CUUNOVDRlN3Z3bjlqMXZVUjV5aWw1d2pxaWJQaC9QYXBCeFlUL1BoY1RD?=
 =?utf-8?B?QS9haEpoMEdCcGFITE1RcFlTb0tYQWJjTkVBQVZSUXB3RjJsMEU0ckhmcjg1?=
 =?utf-8?B?S0hQS28rWVdEcmE1OVVCVXhQZ0hyQnY4MUlvSllwWER0THVtSG9CYVVQSjJs?=
 =?utf-8?B?OVBWanNNWXEwc1JFT0tyc1BkY2FxRFNVdWpOZUcreGpVUjM2QXNlb0ltYm5S?=
 =?utf-8?B?SWE5bEx4WFJDRGQrcFBlOU9RZkh5eU9kaURaV21QVWVaQkswS0dqWlgvejlr?=
 =?utf-8?B?VUhYeDBTTW0rdy9wS1Q5Sklxakxsd1BKTlNMVEN5aUI0YXJJemk0U2J5Qkpj?=
 =?utf-8?B?WkJ3VWFKem4vbUhWVy9SWEpoeDVhZktLQnpkRytCeDVUWERaQ2FkN3VIZGZm?=
 =?utf-8?B?ZlNGRzdaV2RObzNtL200Wnl2UHcrblU1Um9rSXA5OVRwN2JCa2w5QVU5d2to?=
 =?utf-8?B?OFk4bDkyc2ZPNkhVeXpuY3NVdHR1UWsxNTJZWjZOSzhra2ZzZVl0SHNGWStZ?=
 =?utf-8?B?M0o3R050OFh1WkVWaGpDbTRKdVFpQ2FwNVkzRXZZZmFaYTBkcE9jbEJ0UXIw?=
 =?utf-8?B?dHJyYUpaWis1QXprSzh1SEFFZEZsYlk1L2krbkZTZndRSTEyREpPTmJYWG5s?=
 =?utf-8?B?ZnlwYjNaMHNBODVtM0tiS0NNK3FLSDc2ZEhQYUh2R0NIc1FaU3VlOHZHSjl6?=
 =?utf-8?B?MTVpT1cwWnVxR3NIcUg2VzhjOEZ5c2tEZmFNNk1yamhVUEhEU0lZbDJodk5y?=
 =?utf-8?B?SEQxdEZIV2lHL0czQ3ZMbFpjaWEvelNLcTM4OVBQa0lWNnVrMjVUeExWTkcx?=
 =?utf-8?B?R0ExZm1XR0EyaGtxMWhaWHYxOWtqMGFLVjZwZHFwclhwSEppdlJKd0hGeWRX?=
 =?utf-8?B?K2plY2dvNmluSk9UdEZyQ1dyUlF3T2pjNER6UWdQcGRQZktLRUYzaWNranZ0?=
 =?utf-8?B?aGpFRkpHeWxBeGtVSGJRSUdlNnJEWGVWcmh4TDc4N0tNMjdqUDYxQ01SWkR1?=
 =?utf-8?B?MHN4UVF4RWJpVDRVSjZjRUdNK0pzQmVhaHRRalRmYURiajd1ZDVxRm9yNng2?=
 =?utf-8?B?eko0QTlReFUzVUJQM1dTOVEzQlZCL2xTMHJmd1czNjdxTTdTSENwaHU2OC9V?=
 =?utf-8?B?aTkwS2NNZVo3eXE3UDc5T2lSby9hR0kvM2NrRXFlT3E0QklPYWY3NkNGUklr?=
 =?utf-8?B?V1dwWHZzYU5TWjhiMERPL1Z0NWd6a1QrcGo4enZ4RHFtY1Arakk5VUFxeU5F?=
 =?utf-8?Q?UQcpDLnfGmE48IxnGilM2GGB+2huzufoRKGfNlU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2hSWDFlSElJclhSZTZINytONytuSG40cWo3ZWlwTERxNVVvekIyeU44em5S?=
 =?utf-8?B?Szd2c3M4YXdBajhMN2x5Mmw2UFRiV2NSbyszdHFCdkZzSkpGVHhrbWVtbXdT?=
 =?utf-8?B?alJSUnA5RkM1cjRuTGY0SFo1Vk5nb3M2U2FhQngwWnFGbDJjb0NrVVR3OGVs?=
 =?utf-8?B?NW1MempMcTlyb0prMURKczJMWm9iUkZNdFVoL2JrcW5QNjFBMlBaK3Mycnk0?=
 =?utf-8?B?SkNNcCtHOWRwN0xkOWdQWXFGeGkwNklFMUVEdC9scCtiTHljcDh0ODdhTDJE?=
 =?utf-8?B?T1NkcFh4cDlGK2lNOUFIRysrZEJJUDJpbzVwOVdidW96Z3JnNUswVnJUdEdx?=
 =?utf-8?B?S2VJdTBpVXorSU1uOVpRTG41ZllQSmZ2eTRkU0dTdENmMFF2dGMrWTVJbXlB?=
 =?utf-8?B?R0xVWVZxaWU1eHdZRHdUSUdMT0Z5a0NIWlordDFtZTVhTkd4N09WZVZJN2ww?=
 =?utf-8?B?MmVXcGJwNDBNb2I2dExiVlBNdmhoZnNpNmtTTHlqRkNRQ1dvRDRjbC9tcnQ1?=
 =?utf-8?B?MkhOUUtGVWNiclptcU9Ed0w1bXNHUE5DTGF5RGtDZHJXcGRDTHVBazdIWExw?=
 =?utf-8?B?VzZuWGdFb1doWnNLMlcrZGJ1aEZCRVNWcGdGYWtwY0tzNXdWdUM3UHY0ajM4?=
 =?utf-8?B?ejhKY1phR2hjbE83THZaKy84OXNNSkJPT1A4QStaWXNXeWlaUW9RbGg0WjZi?=
 =?utf-8?B?S3FnSnNPZGRpM1ZZZm9Jb1FWNjNsaExqMFFYZTZNUHJhVk1KMDcyMW1IS0R0?=
 =?utf-8?B?ME1yQVdDNE9jOG9FQ3krU2Jpeld1NEZHT0grL04rMkQyZkRIdWNzYzVDV3hM?=
 =?utf-8?B?Z3ZLRmVQTitUU3BmeFBvR0JraXU1YkNrM1ptVzROczM5SStIenhPT1VjbDlh?=
 =?utf-8?B?QjdDUUt2Vi83Y2xTM21mUGlXUDFLZGQvc3FOVjlxUW1zWWNZTE1WQm4rY2Zw?=
 =?utf-8?B?WjZuWWdaN21HM0gweXIwSlEyR0tiTVRnTlJZbE5RUlgremVLeXo0Yy9QaENU?=
 =?utf-8?B?b1ZXNzBtSk45YWpoUGFZTHJvRFlKb21SZUIyZG1JM1BwbmhXRHR0WnRsT2xB?=
 =?utf-8?B?cVVOeVZwTlIxK1lnUVRGUnZvbVdZQ1lpVTFyM2tVS1JwZlpqK0pwTk9PdUNL?=
 =?utf-8?B?ZG5pV0Q2eVN1b01nQ3g1VFhQeHNXUVo1VEkzQ1NGVEpNUkxRQTJKUTBYb0ZC?=
 =?utf-8?B?MTZFTFE2K1gvaVlDeTlwQkZZYUV3elhJaWtFQUxMbjVEa1FCSTZYVm93YnJQ?=
 =?utf-8?B?b3lVQ1Nod3pYM2JBeFowbjZaU0hGOWhEclpGc0JweUNrd2pQK1RadEIrbW11?=
 =?utf-8?B?MDl2SzRSZEFjZnZYOHM4SWFxamF2SmJNam5LYWJ3L2poT2U0Q1EzVG12alR3?=
 =?utf-8?B?RkkwK1Q0SWc4Y2VSWnNVRzNNY3I2aVlQQk1YZ3FsU1lJbEtETWFkdHpobFVH?=
 =?utf-8?B?ZjJwU0J3NS9xQU9FYnpUMUhkenl6amxjRWxiaUhLa0xvTGtWQUJMRVhjaVNq?=
 =?utf-8?B?aVgramlMTjVVY0ZHZjdrVS94S1c2d1g1NXduNmZoZ1FmQWQ4UytTZVRiWUhW?=
 =?utf-8?B?d0l3eXRZMHB2ZWR4aHBUeUdLcWp0RmhnYTJ2RmphaUJBaHFTczdQRlJiWk5R?=
 =?utf-8?B?dDBsUXRDRitsUDNPTWRSN2xUUGRJeDIxZWZTTjN3WXlSdnl1OVRFcTNuaXhu?=
 =?utf-8?B?dmE0YW1xNnNYMDlMRXh2NmpQVjJIaUV0RE9MQWxVeDlZWC9nWS9FV2pFYW0r?=
 =?utf-8?B?aTh4VVNJRW1EQlRZbFhKK3V5cXBzcXV2UkFhVWFtcUxmT2NSNUVVNnRHZkRq?=
 =?utf-8?B?VVFQYUpid0R5QWVGK04yeFFWejZFaHByVzVGTXN0RW8vdUI0ZlFIdDZXb0o2?=
 =?utf-8?B?MWtFM1IwaDN0eGJ5T2c3czNDMXJadkJmK1F5a25tTmo3U0p6YTBTOG0rUEtj?=
 =?utf-8?B?WlVNOEViR25CMUlYN1hKNmt1enZtcDFqWFJ3NUtYUTkrWlJWekFKczJ5RFdH?=
 =?utf-8?B?MWdtMU1IL1drODFkOE14QndDNXpJeDRIVENxZjBxZG1mSmhIS3RvQ1o3b0pp?=
 =?utf-8?B?U2tTS1ZtZE5tL3ArdkN6REhueFlwZWVKbXAxVXcvOXFSc2lXL1d5U2lML0FJ?=
 =?utf-8?B?dUhwVkx2YU12TTZSakFyaXJkd01yQjM5UzVpMHBoQVdmV3A5L2J0NlYwd3lt?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822bebac-ab9c-492b-9885-08dd4b8a18d7
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 17:24:25.2476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7l+H71SBFv4VfaQ1tuUJ3qVxUVr4tzzSa9yVMCWKJHjtijHfw+RycYSqkLbaGOjX8ilo0faQ3CZa/IfwKv1GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10244
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 17:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211262

--------------ASIXTKnWsJWmptAHU7aC2p73
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.02.2025 um 16:07 schrieb Bruce Ashfield:
> On Wed, Feb 12, 2025 at 9:36 AM Stefan Herbrechtsmeier via 
> lists.openembedded.org <http://lists.openembedded.org> 
> <stefan.herbrechtsmeier-oss=weidmueller.com@lists.openembedded.org> wrote:
>
>     Am 11.02.2025 um 22:46 schrieb Richard Purdie:
>>     On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier vialists.openembedded.org <http://lists.openembedded.org> wrote:
>>>     From: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com> <mailto:stefan.herbrechtsmeier@weidmueller.com>
>>>
>>>     Signed-off-by: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com> <mailto:stefan.herbrechtsmeier@weidmueller.com>
>>>     ---
>>>
>>>       .../python/python3-bcrypt-crates.inc          | 84 -------------------
>>>       .../python/python3-bcrypt_4.2.1.bb <http://python3-bcrypt_4.2.1.bb>            |  4 +-
>>>       2 files changed, 1 insertion(+), 87 deletions(-)
>>>       delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates.inc
>>     So let me as the silly question. This removes the crates.inc file and
>>     doesn't appear to add any kind of new list of locked down modules.
>     The list is generated on the fly like gitsm and doesn't require an
>     extra step.
>
>>     This means that inspection tools just using the metadata can't see
>>     "into" this recipe any longer for component information.
>
>     We support and use python code inside the variables and thereby
>     need a preprocessing of the metadata in any case.
>
>     What do you mean by "component information"?
>
>>     This was
>>     something that some people felt strongly that was a necessary part of
>>     recipe metadata, for license, security and other manifest activities.
>
>     Why can't they use the SBOM for this?
>
>>     Are we basically saying that information is now only available after
>>     the build takes place?
>     They are only available after a special task run.
>
>>     I'm very worried that the previous discussions didn't reach a
>>     conclusion and this is moving the "magic" out of bitbake and into some
>>     vendor classes without addressing the concerns previously raised about
>>     transparency into the manifests of what is going on behind the scenes.
>
>     I try to address the concerns but don't realize that the missing
>     information in the recipe is a blocker.
>
>     This version gives the user the possibility to influence the
>     dependencies via patches or alternative lock file. It creates a
>     vendor folder for easy patch and debug. It integrates the
>     dependencies into the SBOM for security tracking.
>
>     I skipped the license topic for now because the package managers
>     don't handle license integrity. We have to keep the information in
>     the recipe but hopefully the license information doesn't change
>     with each update.
>
>     I don't understand the requirement for the plain inspection. In my
>     opinion external tools should always use a defined output and
>     shouldn't depend on the project internal details. I adapt the
>     existing users of the SRC_URI to include the dynamic SRC_URIs.
>
>>     I appreciate some of the requirements are conflicting.
>>
>>     For the record in some recent meetings, I was promised that help would
>>     be forthcoming in helping guide this discussion. I therefore left
>>     things alone in the hope that would happen. It simply hasn't, probably
>>     due to time/work issues, which I can sympathise with but it does mean
>>     I'm left doing a bad job of trying to respond to your patches whilst
>>     trying to do too many other things badly too. That leaves us both very
>>     frustrated.
>>
>>     I really want to see you succeed in reworking this and I appreciate the
>>     time and effort put into the patches. To make this successful, I know
>>     there are key stakeholders who need to buy into it and right now,
>>     they're more likely just to keep doing their own things as it is easier
>>     since this isn't going the direction they want. A key piece of making
>>     this successful is negotiating something which can work for a
>>     significant portion of them. I'm spelling all this out since I do at
>>     least want to make the situation clear.
>>
>>     Yes, I'm very upset the OE community is putting me in this position
>>     despite me repeatedly asking for help and that isn't your fault, which
>>     just frustrates me more.
>
>     My problem is the double standards. We support a fetcher which
>     dynamic resolve dependencies and without manual update step since
>     years. Nobody suggests to make the gitsm fetcher obsolete and
>     requests the users to run an update task after a SRC_URI change to
>     create a .inc file with the SRC_URIs of all the recursive
>     submodules. Nobody complains about the missing components in the
>     recipe.
>
> There's no double standard, I'd simply say that design decisions of 
> the past doesn't mean that there aren't better ways to do something new.
>
> Richard went out of his way to explain the status and what sort of 
> review needs to happen, I'll add that while getting frustrated with it 
> is natural, pushing back on people doing reviews isn't going to help 
> get things merged, it will do the opposite.
>
> There have been plenty of complaints and issues with the gitsm 
> fetcher, but the reality is that if someone wants to get at the base 
> components of what it is doing, they can do so. I've had to take 
> several of my maintained recipes out of gitsm and back to the base git 
> fetches. The submodules were simply fetching code that didn't build 
> and there was no way to fetch it.  The gitsm fetcher is also 
> relatively lightly used, much less complicated and doesn't need much 
> extra in infrastructure to support it.

Thanks for your insides. There a two main solutions for the problem. Add 
patch support to gitsm so that you could use the git submodule command 
and create a patch or generate a .inc file and manipulate the SRCREVs. I 
assume you would prefer a .inc file. What do you think is the downside 
of a patch?

>
>     Whether we have hard requirements and introduce a git submodule
>     support which satisfy the requirements or we accept the advantages
>     of a simple user interface and minimize the disadvantages.
>
> Unfortunately in my experience the simple interfaces hiding complexity 
> don't help when things go wrong. That's how I ended up where I am with 
> my go recipes, and why I ended up tearing my gitsm recipe back into 
> its components. There was no way to influence / fix the build 
> otherwise, and they didn't support bleeding edge development very well.
Do you have a good example for a problematic go recipe to test my approach?

> I'm definitely one of the people Richard is mentioning as a 
> stakeholder, and one that could likely just ignore all of this .. but 
> I'm attempting to wade into it again.

I am very grateful for that.

>
> None of us have the hands on, daily experience with the components at 
> play as you do right now, so patience on your part will be needed as 
> we ask many not-so-intelligent questions.

That's no problem.

>
>     It doesn't matter if we run the resolve function inside a resolve,
>     fetch or update task. The questions is do we want to support
>     dynamic SRC_URIs or do we want an manual update task. The task
>     needs to be manual run after a SRC_URI change and can produces a
>     lot of noise in the update commit. In any case the manual editing
>     of the SRC_URI isn't practical and the users will use the package
>     manager to update dependencies and its recursive dependencies.
>
> I don't understand the series quite enough yet to say "why can't we do 
> both", if there was a way to abstract / componentize what is 
> generating those dynamic SCR_URIS in such a way that an external tool 
> or update task could generate them, and if they were already in place 
> the dynamic generation wouldn't run at build time, that should keep 
> both modes working.
If it is desired I can add both variants.


> I admit to not understanding why we'd be overly concerned about noise 
> in the commits (for the dependencies) if they are split into separate 
> files in the recipe. More information is always better when I'm 
> dealing with the updates. I just scroll past it if I'm not interested 
> and filter it if I am.
The problem is to identify the relevant parts. Lets say you update a 
dependency because of an security issue. Afterwards you update the 
project with a lot of dependency changes. You have to review the 
complete noise to determine if your updated dependency doesn't go 
backward in its version. It is much easier to use a patch. After the 
project update the patch will fail or not. If it fails you have a direct 
focus on the affected dependency. If you back port the patch from the 
project you could simple drop it with the next update.

> I feel the pain (and your pain) of this after supporting complicated 
> go/mixed language recipes through multiple major releases (and through 
> go's changing dependency model + bleeding edge code, etc) and needing 
> to track what has changed, so I definitely encourage you to keep 
> working on this.
>
>     As a compromise we could add a new feature to generate .inc cache
>     files before the main bitbake run. This would eliminate the manual
>     update run and the commit noise as well as special fetch, unpack
>     and patch task.
>
> Can you elaborate on what you mean by before the main bitbake run ? 
> Would it be still under a single bitbake invokation or would it be 
> multiple runs (I support multiple runs, so don't take that as a 
> leading question).

I can't answer this questions and need Richard guidance to implement 
such a feature. I would assume that bitbake already track file changes 
and can update its state. The behavior should be similar to a change in 
the .inc file. Bitbake will detect that a "include_cache" file is 
missing and run an update_cache task on the recipe. Afterwards bitbake 
detect a file change on the "include_cache" file and parse it. We need a 
possibility to mark patches which shouldn't be applied if the 
"include_cache" file is missing because the dependencies are missing. We 
need to run the fetch, unpack and patch task before the update_cache 
task to generate the .inc file.

--------------ASIXTKnWsJWmptAHU7aC2p73
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 12.02.2025 um 16:07 schrieb Bruce
      Ashfield:<br>
    </div>
    <blockquote type="cite" cite="mid:CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com">
      
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Wed, Feb 12, 2025 at
            9:36 AM Stefan Herbrechtsmeier via <a href="http://lists.openembedded.org" moz-do-not-send="true">lists.openembedded.org</a>
            &lt;stefan.herbrechtsmeier-oss=<a href="mailto:weidmueller.com@lists.openembedded.org" moz-do-not-send="true" class="moz-txt-link-freetext">weidmueller.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div>Am 11.02.2025 um 22:46 schrieb Richard Purdie:<br>
              </div>
              <blockquote type="cite">
                <pre>On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via <a href="http://lists.openembedded.org" target="_blank" moz-do-not-send="true">lists.openembedded.org</a> wrote:
</pre>
                <blockquote type="cite">
                  <pre>From: Stefan Herbrechtsmeier <a href="mailto:stefan.herbrechtsmeier@weidmueller.com" target="_blank" moz-do-not-send="true">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>

Signed-off-by: Stefan Herbrechtsmeier <a href="mailto:stefan.herbrechtsmeier@weidmueller.com" target="_blank" moz-do-not-send="true">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>
---

&nbsp;.../python/python3-bcrypt-crates.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 84 -------------------
&nbsp;.../python/<a href="http://python3-bcrypt_4.2.1.bb" target="_blank" moz-do-not-send="true">python3-bcrypt_4.2.1.bb</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
&nbsp;2 files changed, 1 insertion(+), 87 deletions(-)
&nbsp;delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates.inc
</pre>
                </blockquote>
                <pre>So let me as the silly question. This removes the crates.inc file and
doesn't appear to add any kind of new list of locked down modules.
</pre>
              </blockquote>
              The list is generated on the fly like gitsm and doesn't
              require an extra step.<br>
              <br>
              <blockquote type="cite">
                <pre>This means that inspection tools just using the metadata can't see
&quot;into&quot; this recipe any longer for component information.
</pre>
              </blockquote>
              <p>We support and use python code inside the variables and
                thereby need a preprocessing of the metadata in any
                case.<br>
                <br>
                What do you mean by &quot;component information&quot;?<br>
                <br>
              </p>
              <blockquote type="cite">
                <pre>This was
something that some people felt strongly that was a necessary part of
recipe metadata, for license, security and other manifest activities.</pre>
              </blockquote>
              <p>Why can't they use the SBOM for this?<br>
                <span style="white-space:pre-wrap">

</span></p>
              <blockquote type="cite">
                <pre>Are we basically saying that information is now only available after
the build takes place?
</pre>
              </blockquote>
              They are only available after a special task run.<br>
              <br>
              <blockquote type="cite">
                <pre>I'm very worried that the previous discussions didn't reach a
conclusion and this is moving the &quot;magic&quot; out of bitbake and into some
vendor classes without addressing the concerns previously raised about
transparency into the manifests of what is going on behind the scenes.
</pre>
              </blockquote>
              <p>I try to address the concerns but don't realize that
                the missing information in the recipe is a blocker.<br>
                <br>
                This version gives the user the possibility to influence
                the dependencies via patches or alternative lock file.
                It creates a vendor folder for easy patch and debug. It
                integrates the dependencies into the SBOM for security
                tracking.<br>
                <br>
                I skipped the license topic for now because the package
                managers don't handle license integrity. We have to keep
                the information in the recipe but hopefully the license
                information doesn't change with each update.<br>
                <br>
                I don't understand the requirement for the plain
                inspection. In my opinion external tools should always
                use a defined output and shouldn't depend on the project
                internal details. I adapt the existing users of the
                SRC_URI to include the dynamic SRC_URIs. <br>
                <br>
              </p>
              <blockquote type="cite">
                <pre>I appreciate some of the requirements are conflicting.

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
              <p>My problem is the double standards. We support a
                fetcher which dynamic resolve dependencies and without
                manual update step since years. Nobody suggests to make
                the gitsm fetcher obsolete and requests the users to run
                an update task after a SRC_URI change to create a .inc
                file with the SRC_URIs of all the recursive submodules.
                Nobody&nbsp;complains about the missing components in the
                recipe.<br>
              </p>
            </div>
          </blockquote>
          <div>
            <div class="gmail_default" style="font-size:small">There's
              no double standard, I'd simply say that design decisions
              of the past doesn't mean that there aren't better ways to
              do something new.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Richard
              went out of his way to explain the status and what sort of
              review needs to happen, I'll add that while getting
              frustrated with it is natural, pushing back on people
              doing reviews isn't going to help get things merged, it
              will do the opposite.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">There
              have been plenty of complaints and issues with the gitsm
              fetcher, but the reality is that if someone wants to get
              at the base components of what it is doing, they can do
              so. I've had to take several of my maintained recipes out
              of gitsm and back to the base git fetches. The submodules
              were simply fetching code that didn't build and there was
              no way to fetch it.&nbsp; The gitsm fetcher is also relatively
              lightly used, much less complicated and doesn't need much
              extra in infrastructure to support it.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Thanks for your insides. There a two main solutions for the
      problem. Add patch support to gitsm so that you could use the git
      submodule command and create a patch or generate a .inc file and
      manipulate the SRCREVs. I assume you would prefer a .inc file. What
      do you think is the downside of a patch?<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p> <br>
                Whether we have hard requirements and introduce a git
                submodule support which satisfy the requirements or we
                accept the advantages of a simple user interface and
                minimize the disadvantages.<br>
              </p>
            </div>
          </blockquote>
          <div>
            <div class="gmail_default" style="font-size:small">Unfortunately
              in my experience the simple interfaces hiding complexity
              don't help when things go wrong. That's how I ended up
              where I am with my go recipes, and why I ended up tearing
              my gitsm recipe back into its components. There was no way
              to influence / fix the build otherwise, and they didn't
              support bleeding edge development very well.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Do you have a good example for a problematic go recipe to test my
    approach?<br>
    <br>
    <blockquote type="cite" cite="mid:CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div>
            <div class="gmail_default" style="font-size:small">I'm
              definitely one of the people Richard is mentioning as a
              stakeholder, and one that could likely just ignore all of
              this .. but I'm attempting to wade into it again.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I am very grateful for that.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">None of us
            have the hands on, daily experience with the components at
            play as you do right now, so patience on your part will be
            needed as we ask many not-so-intelligent questions.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>That's no problem.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p> <br>
                It doesn't matter if we run the resolve function inside
                a resolve, fetch or&nbsp;update task. The questions is do we
                want to support dynamic SRC_URIs or do we want an manual
                update task. The task needs to be manual run after a
                SRC_URI change and can produces a lot of noise in the
                update commit. In any case the manual editing of the
                SRC_URI isn't practical and the users will use the
                package manager to update dependencies and its recursive
                dependencies.<br>
              </p>
            </div>
          </blockquote>
          <div>
            <div class="gmail_default" style="font-size:small">I don't
              understand the series quite enough yet to say &quot;why can't
              we do both&quot;, if there was a way to abstract /
              componentize&nbsp;what is generating those dynamic&nbsp;SCR_URIS in
              such a way that an external tool or update task could
              generate them, and if they were already in place the
              dynamic generation wouldn't run at build time, that should
              keep both modes working.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    If it is desired I can add both variants. <br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div>
            <div class="gmail_default" style="font-size:small">I admit
              to not understanding why we'd be overly concerned about
              noise in the commits (for the dependencies) if they are
              split into separate files in the recipe. More information
              is always better when I'm dealing with the updates. I just
              scroll past it if I'm not interested and filter it if I
              am.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    The problem is to identify the relevant parts. Lets say you update a
    dependency because of an security issue. Afterwards you update the
    project with a lot of dependency changes. You have to review the
    complete noise to determine if your updated dependency doesn't go
    backward in its version. It is much easier to use a patch. After the
    project update the patch will fail or not. If it fails you have a
    direct focus on the affected dependency. If you back port the patch
    from the project you could simple drop it with the next update. <br>
    <br>
    <blockquote type="cite" cite="mid:CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div class="gmail_default" style="font-size:small">I feel the
            pain (and your pain) of this after supporting complicated
            go/mixed language recipes through multiple&nbsp;major releases
            (and through go's changing dependency model + bleeding edge
            code, etc) and needing to track what has changed, so I
            definitely encourage you to keep working on this.</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p> </p>
              <p>As a compromise we could add a new feature to generate
                .inc cache files before the main bitbake run. This would
                eliminate the manual update run and the commit noise as
                well as special fetch, unpack and patch task.<br>
                <br>
              </p>
            </div>
          </blockquote>
          <div class="gmail_default" style="font-size:small">Can you
            elaborate on what you mean by before the main bitbake run ?
            Would it be still under a single bitbake invokation or would
            it be multiple runs (I support multiple runs, so don't take
            that as a leading question).<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I can't answer this questions and need Richard guidance to
      implement such a feature. I would assume that bitbake already
      track file changes and can update its state. The behavior should
      be similar to a change in the .inc file. Bitbake will detect that
      a &quot;include_cache&quot; file is missing and run an update_cache task on
      the recipe. Afterwards bitbake detect a file change on the
      &quot;include_cache&quot; file and parse it. We need a possibility to mark
      patches which shouldn't be applied if the &quot;include_cache&quot; file is
      missing because the dependencies are missing. We need to run the
      fetch, unpack and patch task before the update_cache task to
      generate the .inc file.</p>
  </body>
</html>

--------------ASIXTKnWsJWmptAHU7aC2p73--

