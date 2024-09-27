Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57ADCDD1B6
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 14:25:24 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.45])
 by mx.groups.io with SMTP id smtpd.web11.70428.1727447120782630455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 07:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=k3IX372x;
 spf=pass (domain: cherry.de, ip: 40.107.104.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwnBjV6WaaN6piaJMbSFKr91xNRYCf7Poq8//czHK3Q2JDmEiYQPTUl4iLSluSzjj5AmqJG02dzJJTful1HL9xudbCTFGrToKxizABjNNVC2Q19NERayD4V379ShQb3OF7stvSGjSTJ/felRvqHc8z87ZnDieLhmjjgk9Wfqlm5kjc851+5niFpbcYUdjqFwBo1GPV0ZEi4zSLS2gfKj6s1ZzgG38pXGVIKBsIVHnmm8XXZDXN/Zr1B8rL9pnI1Ja1VVBBRgnCmwr5Dy8xn1+qp0KIPUldR48p1JROQyNy9Y/C+rwbrn2fJdNke646lxeYW34IU3C529p9ujuwpzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXDzCIlYUANAmNfPGbkfxcXBv8LHi13G0UUyVX288ms=;
 b=wtiCiLprFTKo+EWGsteiV5FRskxmwNFBSdwZ2JwBN0LS2wzWxfxz9r6HaYNVnN6qyZ5lgSxbrjERyA0A7IaGTLfzzWHZG2IQwN+66Xz7cJZdjN/+mQ1QaV9QbraQUGWGfLGiOBNtJRBI2gi565hpJRQEPLCR8LKJ5E297fEJ8tcBHoRMnCm4BABsac6TZt5lDUCCNpto94lUoKFzwLzsO1h7y7XLWILn170ulW2wFftxbJEX5iEbdp+rPritMig3dwavMe7zCSnt8WLWYkUaN87eNoo2hUhezEtNNLSo/yC5x+MCz2HTs6n3CGrK3EQqfDTHElB1BwKgstBZOeABQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXDzCIlYUANAmNfPGbkfxcXBv8LHi13G0UUyVX288ms=;
 b=k3IX372xy7Wbne11Z3ih0MhW8zwVxd071JEHPn823k4F55SfXEJ11JhqafwmmBpte1gtsipqFmtq+IfcLom922iTBLLcbGRNunwUU/Ro+lBymb0zWUjXQv7w/aPSytIOCKM16L72sLm+/cqcaV/0WqjfGQdzCvSOeCZokClzBB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DB9PR04MB8155.eurprd04.prod.outlook.com (2603:10a6:10:24d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Fri, 27 Sep
 2024 14:25:17 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Fri, 27 Sep 2024
 14:25:17 +0000
Message-ID: <5c5290c7-0535-4e58-9c36-83313336d068@cherry.de>
Date: Fri, 27 Sep 2024 16:25:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] kmscube: Upgrade to latest revision
To: Purushottam Kumar <purushottam27.kumar@lge.com>,
 openembedded-core@lists.openembedded.org
References: <20240927105333.52805-1-purushottam27.kumar@lge.com>
 <7bf76c1a-a3ba-4c18-bdb7-4b9044adfd9b@cherry.de>
 <OF2DE997E7.61C047EC-ON48258BA5.004E8C23-48258BA5.004E8C23@lge.com>
 <OF2DE997E7.61C047EC-ON48258BA5.004E8C23-48258BA5.004E8C27@lge.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <OF2DE997E7.61C047EC-ON48258BA5.004E8C23-48258BA5.004E8C27@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::20) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DB9PR04MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: a31338c8-26da-4b61-d84f-08dcdf003565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OTJtSjRKRGZZenZNRXVFWTlnaTB5ejIzKzVLTlVQdmFsZVBMM2tzcHlpc1NC?=
 =?utf-8?B?Tnl3SW4vSXdXSXM5TTBNeWpqcnV5RGlSc2lIUTBmTUtPeWJEZXpUL0pDM1Vm?=
 =?utf-8?B?Yml0eFk5cmIxTnpCdW1lOFV0Q0pyYlBJdzdMTnY2K3VQakZJK3l0a0pVcWx3?=
 =?utf-8?B?bFMvRlh6OUdMcWxNQnJkN25hWmFtY0k5YXBjcGNXMW5RYjZaa2drOGt2WjRK?=
 =?utf-8?B?OHh6NXJQandDMGFuK0lNK0J3ZG1NWjkreE5URHptdmVhVjAxRTJXMWhFb3R1?=
 =?utf-8?B?ZVFEZXd0ZWhxT0NkOVVQT2ZHZFliVm43S1lsRWZXejRGRktpOEQwSVhjdjlM?=
 =?utf-8?B?ZHdTd2pkbURUYUZmeXB6SkhvLzFpcGFnWjhFdGtLSWlLWXBxWjNYeVo5S1h2?=
 =?utf-8?B?SHZrL24xdHBkZEk0eEVkRWV1WG85U1JZTFRkUldxMUo5VWVVcWNJalhISzQ3?=
 =?utf-8?B?clUrUzZxNEU5azc0WEZCV01SdDcvbm80RStBWmdCaGJQdE9mYmZFWlcrY2Jt?=
 =?utf-8?B?OFpiYm54Ym9Oc28zOUx4b3BPTEs4Q0FXYk9nQzNVM2FZci9WQ2taNFUxZHRR?=
 =?utf-8?B?UHdFNnFTczZqQkVVZEtPUzl2K2hzUXV0OVhxbm9aWGtjR011dDRydHRGQlhT?=
 =?utf-8?B?VWtmbmdDalgyMHFOS3U5Mll2TkRwa2NxZjhUWXUyU0Q1QlhDUlVkZE1JY0FR?=
 =?utf-8?B?YWFZckxUZlFXQ2RyRFNKaThMblU2bUFISjBMczFRMUltREhmQ3FhVHJWYlBK?=
 =?utf-8?B?dmIzYzFtbGZXVjVRVHlPWjk3NktSNnRZUVlVT0FLSDVyOUpkUjJDMnFldUFx?=
 =?utf-8?B?U0s0WCs3TktJSnlkNUVaSnhmL0JYQ0c5amNQMVJRTllWQUYvYnNHRk9NQm02?=
 =?utf-8?B?VG8vZk9KWFFyV2t1OWdLL05yMzQ2WUpBMkR5RHVyNkNwS3lGeXhJZEhweUtm?=
 =?utf-8?B?M1N2ZWhEZGJKd3lhYmlrVUdPSzhZMlZ1ZytWbFM4alQxSCs2dzJDRmtLS0ht?=
 =?utf-8?B?SjhQcnU3OXJxY2gyMCtiYStyOXc4UDR1ZDNRWEZBQStvcHZFcG82ZUdzbWk5?=
 =?utf-8?B?RFROR2tIYXJnL3J5WXY2TUtTMFhFQWVYL0o1TmcySnZTQ29Nc2lER0lmTXdZ?=
 =?utf-8?B?enU2VkhJWTdQSFU4MU9jK0YxUFpiOGthVVlmcFBETmNFQjdicGg5cnJhNm03?=
 =?utf-8?B?b1UzVGRkYjNSS0x4bExpY0dDS1plWWszV3BWcGNhdk43U0tGMFBYb2xnMkxa?=
 =?utf-8?B?YmlWYVZxTHBTUUdsWllqU2VramQ5cDQ2WWhOQThnd2tWZ2N4K09XcUFzK0Vm?=
 =?utf-8?B?YndEUjVXWG9ITmNEVUR2RVN2ZE5CNVdtQ0lDY2NUcC9UNkx6V3VRdTZnbnBk?=
 =?utf-8?B?V0VuZkxKRmtFVXNDY0xvQzAyeVRVRzFzeUZXTkZZMmZVUGEyNHFKTlM2UmN5?=
 =?utf-8?B?RWZydDUwL09ENWFKbWtpbUdSYVRsbFczVmlKYjdvTkoxUWhxVjlhZjZYNUZL?=
 =?utf-8?B?YjF2L2ZxQ1dJRVhweHJjSjZnRjZrcGRrTnZJdnUyYXhTMXl5U2pTYTNIT2Yz?=
 =?utf-8?B?U2QyRHd1UHllRGtXcmdNZGh2eitvR1ZtdVNrOVo4Tm1VRy85NHlkaDgvaWox?=
 =?utf-8?B?UjAwT2tqNnR3dnk1R2s5SnA0V2R1V29sVjVrQmJ1NUZBOUhZK2E0Zk1iVUcz?=
 =?utf-8?B?anlmRkZRN09kQkd3V25RTDhMK3RSRGROYUdkSk9GWjVqZHVsb2lzcW9BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGI3S1Joa3h6cW1veUU4YWRYSWE1VUhJUHM1ZHdLRVJtekJwOVB6V1lKcm9o?=
 =?utf-8?B?VlpYbHQ3OVZSRlRIQXgvZCtTSjRlWlAzTWZOMm9wUlA4SXZnUjYveXVVRUQ4?=
 =?utf-8?B?bnhzK2g0TmdjMG9uc1Z2dmZvQ3ZhMUpyTU1sQUI4S1AvZUM4eXZ4eVo2QlZG?=
 =?utf-8?B?Z0V2VVRsZG5DRkJMV1YzVzZDdGd1SnBSbkdhM2ZQa3RodFFWSTJoVitVWkpy?=
 =?utf-8?B?Um8zV0JXOWxlaTJhaEZjNm5OYUU3ank4NGduVGxEVlhtMUwrb244Q25SVFdZ?=
 =?utf-8?B?ZGJBRlNMcW9WemtIWW1Yc2U2K1BOVUZPTW1Qem95NTdGMHZQbm8reHhKQ3Fz?=
 =?utf-8?B?dTNoTTRySkxCaWN0ck9YWWY2SzBCSVlnSzZSU0J4MlpjWFhaZFR1dG1oRGFz?=
 =?utf-8?B?V0hmUzNpVlZRREpFNENTWmRTMUFBUHNLZnpISWd1M05DNTFFVGM3bXJOOHV0?=
 =?utf-8?B?dk9OR0lLUHFnOWVvclpFbXZpZWVoSWtJZm9PUCtRN3JLT0JYVjFxdExnYlVa?=
 =?utf-8?B?OE1ZVUtiWXJlSUF3TXRmOWJPYzNKeFRMZGV4YVp0Ynp4V2lyaFNmQ0pSK1pT?=
 =?utf-8?B?bDdGc0tRNU5rbkpjS0o5MmRHalIxbWJzeXY0bm52LytNWXlxMzdaQ04rYkpi?=
 =?utf-8?B?ZUNpeHNWekpkL3FZMHZUK3RtUGdFaHhMNzJRR1ZPNlp3UGYvckxUTk9nVEpn?=
 =?utf-8?B?bGxrRzFxekZqZjRsRThPRmh3YWlqODFFdXc2dmhrUmRzb01lcit3d3BuR0VV?=
 =?utf-8?B?bUxVQUwxZ09FOXJJbHFQOGhVY0t0TnB6UG5SZFBzc0RZVnlSeDFoQ3Yzem44?=
 =?utf-8?B?NzVYZTYyWjNwbjZHNTFTZldTcHYyWVpoMTlYS3lmUWpvd25XTWhndUFLd3Ay?=
 =?utf-8?B?SDViMUhIcHk5RG5MdUMzaU01NkhiMW9xa0FnN0RLZVQwRGhsYTA0eHg2Z0pF?=
 =?utf-8?B?eGdwOGJXNjN1SU1FVkVVclI5UVZ3QWc1YWd2Wkw1OTRDVXVacTJLeGFkTmdB?=
 =?utf-8?B?eG81ZWl1Q2Z1dWhtZDFnelkyMWRqNENsRkU5a1NxRjRwbnVMTmx1QTZzUGsx?=
 =?utf-8?B?azlUaURLMnNoTTl3bzN3WXVMS0lreUJndlM5U0w0R2J4MWxyajVKdFR3Tmk0?=
 =?utf-8?B?L3ZibDJIWDBvMk5qY0l2cTVaeVVzSkNkMUtjM2VXNlQ4RERPNm56OStHdWRx?=
 =?utf-8?B?RVdUWkRHSk55d3ZSVWh0cERZaWZhbWxkMW9yMFJYekV2QkwwdHpVU0xLRmtl?=
 =?utf-8?B?cHlZczFjSXIwSHpFRGh1T1loMVgxY0IwNEZ2YkppRWFpcmM4blVCSDBKUG0w?=
 =?utf-8?B?TEx1NFNDNWhBM1RTOTNvMDV2Mk4wZmZCWG4wT2MrMHl4cGlBNk9MdXVMU25k?=
 =?utf-8?B?dkV0ODZpcmdBN1RJQXhpR0pHU1hIZVYvYkRQRENHYlM5NkpaRVppYnZXR0Z2?=
 =?utf-8?B?N3JkN1h0RWc5SHRUcHpwTlNDcWh3dHJkVEk2ZHpBZWZpcG1jTXhlSXV0MUJY?=
 =?utf-8?B?bk1oUmFGTWU5NHdqTFdkS0J2QTJRYjdRY1hwcklxbzVjL3M0V0ZqL0FURjVC?=
 =?utf-8?B?aTRzMDJNdlg5YkF5WUlEV2hZcDhROXE2djVDLy9WRkRwK1RqY0VsMXEzcGNp?=
 =?utf-8?B?TkdUaVVBWHZYcCtyNTRDRUcwWlcyTlNDM0ZJWlJQYkxoSENsdEk0UU54VWdM?=
 =?utf-8?B?UHRCUUN0eFJwczRncVZ6OHlad2hxdUZhZm03Ymt3MS8yNDdpcmVvUXZjL2pR?=
 =?utf-8?B?eGh4bDRFRk9yaitBU2xpSmV2cWgxaWg5QnR6NHpiWDhKZ0lYNXMyazdEd25G?=
 =?utf-8?B?QlZiK0tuUjhFMVRLS3ptYWtsWGw1V2Z4QnE3SmpvYnQyUk5jSnJpNzBDeEpl?=
 =?utf-8?B?QWRiVkJLMTBrcHo1b1htODdsVWQ0ZzhyWGNCQ2VOQ0tObU9IUzFDQXpPTU9W?=
 =?utf-8?B?SkVnM1F3eExqTkpTZEt4aUxYTXZyN2dsT3dTdHRuQ3liU0xYMG9hOS9IeU0r?=
 =?utf-8?B?K3UzekJ3a05kL2ZvNmp1WmpTQTVaWkNqUTRnVjZUUHIxZ3kzaG1zUjZjcTlo?=
 =?utf-8?B?SVBieXUwRmdZOVM4eTV4RWFVZGZDRlcrYnR1U1FyZkhqdUgxemZxcFgxcE5G?=
 =?utf-8?B?aDZ4MThDbC9GbkppV1ptTjlvdXBva0tMVTk5ZjcvTW5WRXNzd3laQ0FucUJs?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a31338c8-26da-4b61-d84f-08dcdf003565
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 14:25:17.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXMNN/OiLrf+XvCYe4plooKKdu8oAbOTcc7ufyeBqzhzq/VGLOlLh9PFyBOB93tslW/B70Lzmxf9NhxxFRcEdpCk6Qe2eiHJ2p2sxyBhoHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 14:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205026

Hi Purushottam,

On 9/27/24 4:17 PM, Purushottam Kumar wrote:
> Hi,
> 
> Thanks for the quick response.
> Yes, for kirkstone branch need a separate commit but there gstreamer version is
> 1.20.7.
> Please ignore this patch i will share specific change commit for kmscube for
> master and kirskstone.
> 

I think this patch is fine for master and scarthgap? Is ther

For kirkstone, we probably want to bump + revert the patch that 
introduces a dependency version we cannot meet, or simply backport only 
the patches you're interested in in kirkstone?

Cheers,
Quentin

