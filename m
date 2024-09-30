Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C58CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 09:08:40 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.3])
 by mx.groups.io with SMTP id smtpd.web10.50058.1727687310343479038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 02:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=N9OCVxu7;
 spf=pass (domain: cherry.de, ip: 52.101.66.3, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfr+xCum03ClV5gEsG26JsrRasStMAGd/ZKo2BjhGAuzubNXKJ0xhen9GoR4RWE5qDETpyskW54RdfFOm5MBfsWo10ADQQreh+luZaNox9OubxHjzy4Eyi/QaIliuyFwvnj/Izm5A/y2WAFNYdyQcFSZjhTU2s9qZ9oViKWQgj9mVuHXCDfSd58zZcy7nolTtNedBtDDZH6YinTo3FJNivTilfGstN1U8SVcH4B0PfIJGjDgxyhK2aA7h/fJL44yCEDtnCPczm63Gg/qiF3iEgEdEfpaLmENNX7hbzvp2IAnSh96m5vUKt7yLqadnLegTz1lZ5A+AeIxWAGrQruIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tk2i6F0apcPhLqnWPhQqQhsARcdcYu6rTvTySfKMQzk=;
 b=g+BWLC19uUt1sBLKsJ5AFV6ilu4Gu3U13rIq8qSggpDwQEdPwkWY/SECF9J90r6jVbYdGVyO02+GN5qMqV/sPjeytYOrpbK06uEK7f3v4Kl+hI/qYMK128tueKFppYJ8lkQYMw1tI0bmk6QtGLYnmN069l0SgAObTcURii7HadhLkr/s9BAuJkbeRZDfnrBgIDxvxy+pji/WGSzvuNnOSh3OvwAY2dYn+VsukEk52wCmLe/SOIXu+yHprGOGXzZXLkBKXgrss9eDmYKk8Q2A/XnrDxJMsyRVhShXSXZ7ogRVZCVbOLh71eZfDkVgpzeT2z23Ty74KCehrL8DB9WcwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tk2i6F0apcPhLqnWPhQqQhsARcdcYu6rTvTySfKMQzk=;
 b=N9OCVxu7emvX9Y/FwIcnuq33hKxrMajj0IqlcLMXOsxWJO/0Q9OJNAQ9q+AVMYIPAFGig+y185cdPsxFmjmq6shzOzxFtPLKm+CxubMWTRd18sbn5cwoGCxiiYAVLI8c4mteojDjeJwR/ynJ9N5n0Hln3xh0KkGqwhp/5JkgHDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GV1PR04MB9120.eurprd04.prod.outlook.com (2603:10a6:150:27::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 30 Sep
 2024 09:08:19 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Mon, 30 Sep 2024
 09:08:19 +0000
Message-ID: <82a9dd53-3b9f-4564-bf88-5deadcde0453@cherry.de>
Date: Mon, 30 Sep 2024 11:08:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta-oe][kirkstone][PATCHv2] kmscube: Add patch to fix
 -int-conversion build error
To: purushottam27.kumar@lge.com, openembedded-core@lists.openembedded.org
References: <20240930073149.3209357-1-purushottam27.kumar@lge.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240930073149.3209357-1-purushottam27.kumar@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GV1PR04MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: bc670eff-1023-4724-cceb-08dce12f6d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1dqYVJXMWQxL0lpeFVPWjZrK1NDVzR3NElvTTNBSDBiS000a0s3cWFvOVl6?=
 =?utf-8?B?U2tVRldtNDZqZ3ROdE1SUUpQbkdGTmdRa0x1NTJTa0psZVppSFpqek5YVTcy?=
 =?utf-8?B?NEt2TGxsWXZ3dW5McVFOZ0VMQVo2TUxjbEYvN2hYUWdWd2dSOWhLbGd1eWNv?=
 =?utf-8?B?bXJwaHdSdGUxOUZjQkczZ0FHNFVKVUJpaW1JOVhWRzRtcENFUE9KZ3dLTnlJ?=
 =?utf-8?B?bE1UU1FrSkYrVG1JNE0wWm5yOXMrSFN5dEdtL21VKzB3WXdPVUdlUElucm5O?=
 =?utf-8?B?QU9TSFRpMmV5WGl2dUpRZzdlY3hycjJHM0JvZkR0T1pybUNoQThrV3lFY09L?=
 =?utf-8?B?R2lXaXRoM2NMdWRZRUt5d1paWDZwUUNqcHdlZWZCMWpkUWV2am0rdWxQYW8z?=
 =?utf-8?B?dVVkV2Vkdi84Y2cyWnk2WDdPN1V2ZE1wUEc0QUUvYkRqZ0hoRjNiRXppZlll?=
 =?utf-8?B?cVVaQU45MDBld1JIUWFLQTk3OS9wNGJpQnp3dUtxbENpTkp2YmRZMUc2SHps?=
 =?utf-8?B?em9KQytoWEI1WWI1M1RBazlsRWlUSlRVNG1FcmV0YkRpQnR1ckl6eXRCbUhD?=
 =?utf-8?B?b3Z2UTVkUXIyZzIweU0wUWc5ZDc5SjJsL3VmZWRKTW14UnlNdzBqWlhXeXJv?=
 =?utf-8?B?U0IyVmVMN2UvUElYbGNsUDZtWXRBb2NPT3I3YmlOR2cyb1FZZ0YwMkU5ZHFO?=
 =?utf-8?B?ckVSMFVtVE5WOFpjTHQwd3BaMzZLQmRyTnNNbWRXNmhSalJudjFTdldIUzFz?=
 =?utf-8?B?MGh6ZmJVbjhnM0tpa0xFRmZGRnJ3YWwwVGZhTDlWZm9vUEp1QW8rcDJtOUNi?=
 =?utf-8?B?aWQ0citZNmViaUhaejZBdkhueEVJN0hxZ2czaG9US1lrVFdsTktmOHk1UXhW?=
 =?utf-8?B?VURmSVZQcGJ3OHcrZ29hRUhMTDlpaEtCMzN5YUk4aUNvS2FiZmEwNU1td1JU?=
 =?utf-8?B?SktBYkRIb1dvemRhSkt6MDFJSGlxMEFBd2EwT0VqVEpLaTR5enA0QTNtQnUy?=
 =?utf-8?B?WHc1a2I0SVgrOHd1Vkl6d0EyQ3dGeVZ5L2NFMzhOakorSGFzTTRYQURwcjk1?=
 =?utf-8?B?WFZrZ0hBWkd2WTN0QjJjMHRTeHZXWklXREc2cEVDb2ZpYjJnUTlMUDFpdmJx?=
 =?utf-8?B?M1RMakgyZG00QXVlWlQzdUZKUk5GNFh0MktFY040SisyOXpwb1V1VGNCSTk0?=
 =?utf-8?B?c0N0Y2RSMndIZnpXd0JMT0dOeS9WaGI5WXZGSGdGMi9FTHJQdENmbnNPUVZ2?=
 =?utf-8?B?QUJ3N1dYdWxzZ1FITWNyaGFhb1dRN2w4MFRScmRZVGU0QmJlV0JvNVZkTitG?=
 =?utf-8?B?ZytOTUxWRGdLU0dCMnhDOW12MXVvN0dUandidVdGMlptT2d4S1hrRjl6VEVp?=
 =?utf-8?B?alRNTFlndlJFVTk3R2h5ajVUeFYxZ2pRMzc4MXo2NVEvUmFWT1JsbVVicGUx?=
 =?utf-8?B?SUI4cndwMEZvQ1RFRXpRVmw1NDM5ekdIR3pQMEt0Z3ZkR1RkVXlaUEZBbEw1?=
 =?utf-8?B?NktkMU9BejV0cUpOWE15NmlreWlGVUpsMUVWMTdTenFtVVBXVTVEcEw2U1pr?=
 =?utf-8?B?QkNEKzQzMUc0OCtWV1NXMGZaLzBKRTV6TE01M21jRUtrR1ZCZURidEhJdC9E?=
 =?utf-8?B?UGNNUjJvWnZyV1I2RUovRm54ckxXWU9CaUFOS2FHbzBoUDAraUJXRmhhaElm?=
 =?utf-8?B?NFVJRE1EbWtUMENXQnI4dGJXSHhxS25OT1FxUXluakZrUlBpNHNYeUp3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjBkcGh0dlRCTGd5dnlCSzAvOHhtUEJKc014Qm9zcEtOTitjMDhyc2EyNCt6?=
 =?utf-8?B?QnNiV3laV3NjRUd0U0k0SXZrNEdGVjh6S1VSV3Z2RkttZ2Z0VVduTkZqQmUz?=
 =?utf-8?B?YWRPTmtEckt3ZWhvR0h2b0gwSUphQzByOFZUajA3U1dCQkJtM2VrNCtQMEZk?=
 =?utf-8?B?Qi9LMCtRbUplZEM4QXh1NUxGNHNBdlpHTHZSSXV2MUc4Q0JXRE9GcWZIc3Jm?=
 =?utf-8?B?Yy9CMFNkZHNEWkJtZ05qTUoxYmNwVmhZM0s0Q3RyOWxXZnppUG9NQ0pZTXJk?=
 =?utf-8?B?T0RsZmlMdnBYNW82TmsvdE11UzhPY2dmd3N4ajhXZVRqNkdZSlp1c2w4UDZu?=
 =?utf-8?B?WWg2OEdqNkdEdFhrbzlBaVJ3WDd6a0xDc2tsdHNNaXFWbzI1MTR4RFpoWDB6?=
 =?utf-8?B?UmNwMUpXMzVMd25YQnRXS2Z4VXdhZloxK0xUMUtUWVJCZzBZRzR4WnhRRnZN?=
 =?utf-8?B?NThUd0p1Ylp3L3JINDlIK0ZCRVhzK1BXUzJpSi92T2NqMGwyV2p1cTdGY2lN?=
 =?utf-8?B?K3FPTjhrYTBHd2dRR3VKVnhPbVlFT3prdVN1UHlHYUxXaGdNNE0wbFNmSWlS?=
 =?utf-8?B?dEYyMjFPZDliUzB6UXhoazZtSWZxMWZwMXlORFJ3NmFORDJyaFcrb2puellN?=
 =?utf-8?B?eGJhY1VMY2VuY1JOVVNWT1JPR3NYUS9qb3V5Nk9sZ1FPR1VkaXVMT2EveDdI?=
 =?utf-8?B?TWFYb0xTSW8wR0dmT2xyblhxRW1mOENTRmxGY1hZMERaak5yK3RaSi9ISm9q?=
 =?utf-8?B?TkdkSGpQaC8xSVZGSVBIL1lTajU2NktUVGFqbnVsa21mREh1ZS81cnIrVmNt?=
 =?utf-8?B?Z2hxMDdzNFlJNEt4TDl1U1ZsNkFobzBtS3lTUXV2dnF4a2g0STdQNGJoN0Vo?=
 =?utf-8?B?Q2Z2RXBUeFNQbUQ4RGVuUzNHR08xL2prbHYxdW5kVnp0dG0zMjhLR2JhUnZN?=
 =?utf-8?B?QjF4R09TMTQybG8rYmtrNXFlVnBQNFNXYSszNVI1RmdDR2xUV1ZQVmgvS2d0?=
 =?utf-8?B?M3NIYXJXTDdSYmhPVE12RXIyK1luUk1zbGJPeXRSNTZ4Q05VS1QwVDdqUjA5?=
 =?utf-8?B?STdrRWNOZUVLU2Q2YXdId0V6cGRKdVovUk1VSCs4SGJ1dm5maGU2YXFPYzJv?=
 =?utf-8?B?U1R2SVh6angwbTJPL21Lc1c0ZWlBeDlpYnNZejZkSnpLU3VVcThPalduTlFa?=
 =?utf-8?B?bWw2cUxPMXNKNmJJUlQrVnBDaUVoUjM4L0JLekdyb0dRTVNmNzhnQmo5UDVu?=
 =?utf-8?B?MkZkMTZZUEFkQjJYSzdQWGRtL1paV1daekY3eWtvbFFDNjcvcFFDSDJ0YVBs?=
 =?utf-8?B?UGg5YThuRHlTR1dzSFNLSmltSkhjTllPMW5WS0tZU0tnV1FqTzNHQmxITUVC?=
 =?utf-8?B?ZG51SCthdkNZQWtJNUtYaVpTa0FLM1FFTk9zY2k2ZjhtZWpYdjBnZ1Q2cG9p?=
 =?utf-8?B?ajJEQVpqbWpmU2RCa3V6ZHN0UUtsQ1crMFhrRW5TTkduZjNLZ1cveHNmZzFy?=
 =?utf-8?B?aHlKRzJzM3BqN0wwcDNLMm9HcFkwZzNYLzd2NUF6QTJ3Rk93NG5CeFRkV1Zl?=
 =?utf-8?B?N2NBTUNzd2VFK3RqMmhpNXN6Qk13R3hyMGtHVU5kZDhpZXpoYUVVOVJpWVVn?=
 =?utf-8?B?b05xeWZ0R0RHcVYwd0ZRNDBrK2pjczBoeHpndU50VmhkSlFOeGo2YitvR2tl?=
 =?utf-8?B?S1ljZzNqdldwMCs2M3FtVXA1ZjRSTGNkUE01UEl4NnFBWGhuZGcycUwrQytM?=
 =?utf-8?B?L3M2ZmtYQm8rb1NFN21WTDJuV3B1UTBNYXhLYmhyRWJrSkJhM2o3YVpST0E3?=
 =?utf-8?B?N09uVm4rTitEM2Vra0srTHpJWDFDalRycHBuV1JFVXNhR1BVUVhPdUxCbisw?=
 =?utf-8?B?UXFYL2lybDFIVUV2OTlyQVRQTUVQRFU2ekxqWnF5TVI4SHFPUnE0aU1QTjE0?=
 =?utf-8?B?UlRLS3pkbldTZWJXbWdsTFBLQ3U3UjZIcjVsMktPREttQk1aS2NacW9xL2Yy?=
 =?utf-8?B?OXZtQlRvMksyNWcrZVhQdmJtVHdqdmY0ZzREWFQ1K3hNVnkrQlFnbTk3S2Yv?=
 =?utf-8?B?R0wzMFc5Mnh2ODBZTkNrLzdlVkxpcU9GUjJ5MUlKd1hRZ2xQZzRNOWczK2FV?=
 =?utf-8?B?Y1EyeFFQaS9RdmxzMnVKOGtEMEpadGZmYldHRXpZOXB2bUFrTGJtYUduaXRK?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bc670eff-1023-4724-cceb-08dce12f6d7f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 09:08:19.8252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2n5kr297CbN6t9U45mWpLYq6jna+5Kcv/UI14ssvzrzJxSZ0S1Y/Wa0weNvjXNHSxakdirOVQvU1KTbToPn6N67x/5LOhYtUAA3w4C2cs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 09:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205099

Hi Purushottam,

This triggers Patchtest because you have "meta-oe" in the mail subject I 
believe. meta-oe patches are not handled on openembedded-core mailing 
list. That patch is for openembedded-core though as it's in OE-Core 
repo, c.f. 
https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/kmscube.

So I believe removing [meta-oe] from the mail subject will make 
Patchtest happy.

Also, you probably want to have [PATCH v2] and not [PATCHv2] there, I 
don't know if this can trip tools or not. git send-email and 
git-format-patch should be putting this correctly with `-v 2` I believe.

On 9/30/24 9:31 AM, Purushottam Choudhary via lists.openembedded.org wrote:
> On some platforms, `EGLNativeDisplayType` is an int instead of
> a pointer, in which case the void pointer will raise
> a `-Wint-conversion`.
> 

Please provide an explanation as to why this isn't first contributed to 
master and then backported to kirkstone (the reason we discussed in the 
patch for master branch is enough in my opinion).

Looking good otherwise,
Cheers,
Quentin

