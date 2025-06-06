Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15695C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 17:35:35 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.63])
 by mx.groups.io with SMTP id smtpd.web10.1089.1749231334468795550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 10:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=KtoLyQ5e;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.93.63, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKAmOb2OYQpoSBT9hFlf/vA9FI6o5Tw4l8LtVzmUyuaIpHEnFiqFZaoCdFYzkKiNgQCFo3Owzfzoe4hfqqb7hFFXA3e9GmqevhtfegW6NYBTYodbGH5KGKH5HM6QducgO86AplzofqOQD+WCMGabDmkgoTCVPonaLJMdCJ/DRHltToLP+5fgamZk+p2TdbROL1HZzp51eUxWtxuNUaOgJk7H/rprGcbJm2a0JGZ01m/7KborDwmnh/dgz45f00TUDJiDbbIEl2xBRccQR+fv21/Q9826cvfktLL8hZI/Za8maX++rkDfh+i6Wjalm6EmA/KCY1JQ6kG65d8UhUp7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTC3+RCgJ+j1YYTVxHuKoUJMW6zK5V1MON7OJti/WiU=;
 b=T/ZWHqL8cGyQfzbUlRYwjpzImqN+Cou1FX/iQmfUZyfi+jdOo2/zV+5tyjYpBHfbJFe+DrhG8wt9NCMv1dcrnAdIYEz0t+H2NSibpXGvPE1zFY6V5qUy6C55qTfcHIhu+KcQHcEblgYTAvxG4NjQ9TzV8M+lIgrNUb5PAzz88EfCfTFQ515CyoACuGw8YzEHmV6WD0t9okq2uTKpfDc5dkMdCCzDXMk20C9P+M3389xv2HdMAi/yeUJg0ytyot3DNkDDaJu2pRUc+TwGcA+YPrM4cmeJMVfViUZUyeJ5q5op/didch1uar5zLcisx0TTd1u/c711oMpTSpQM8fG8ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTC3+RCgJ+j1YYTVxHuKoUJMW6zK5V1MON7OJti/WiU=;
 b=KtoLyQ5e72sbcermaPrKQuUMjPmZ97E/IeoH9ALMqjp+y73whzizNe1BpkF2aPuYblVUYs+CSqLNWN0UyvoglyJuomIH3/fOAFMLXC9r2PVAaX6iH21n/q+CluxmNUg1+uevCh3twvt6DMqIZIEqwke9hOGVIp9Wp81/TwsYAbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 by PH0PR12MB7472.namprd12.prod.outlook.com (2603:10b6:510:1e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Fri, 6 Jun
 2025 17:35:32 +0000
Received: from MN2PR12MB4357.namprd12.prod.outlook.com
 ([fe80::fb07:a830:460:38fe]) by MN2PR12MB4357.namprd12.prod.outlook.com
 ([fe80::fb07:a830:460:38fe%7]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 17:35:32 +0000
Message-ID: <1195a8d4-f134-4fe7-8169-2fb0b6f2fb6b@amd.com>
Date: Fri, 6 Jun 2025 11:35:29 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap,master][PATCH] tune-cortexr52: Add support
 for ARM Cortex-R52 32-bit
To: ross.burton@arm.com
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "raj.khem@gmail.com" <raj.khem@gmail.com>, Jon Mason <Jon.Mason@arm.com>
References: <20250530032047.1369164-1-sandeep.gundlupet-raju@amd.com>
 <8607D12C-E6E5-41DF-9809-6E748E1D749D@arm.com>
 <18462F4E324B73C9.10724@lists.openembedded.org>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <18462F4E324B73C9.10724@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DS2PEPF00004563.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::519) To MN2PR12MB4357.namprd12.prod.outlook.com
 (2603:10b6:208:262::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:EE_|PH0PR12MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf24412-8dcf-46e9-d997-08dda5208951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u0RbsCnHLXF8FWdcxrYB9RnOmAA5go2uHu7W71+kpZWJM4w/zAA/V++JzYKt?=
 =?us-ascii?Q?6t5gL4/N8ZKGHIn/G59gjQCSNcl42BpRJTPIRId/JMd3HvhbCkjexoqC/Tff?=
 =?us-ascii?Q?LrWpDkgQOGf8HXW15y8lgxTB4hxBhfnZcan16HH7zDtXdpqVE0IyNz+GkfSM?=
 =?us-ascii?Q?pzmWJY7HY5SrxE4p0Oj9yJxz7FIUpuae7bk90f4SkxRxjmZ66KQOYPhhZG6C?=
 =?us-ascii?Q?rwjpeA47SOrKx+a94adARlvFE9xgYTsbyLatDBavfgOGaOd/ZCwUoBmLl6Ho?=
 =?us-ascii?Q?teaM/UaJ9C9ExorWWstDbj2/yG9+1f9PFOMvtefNLWnbNJmTT3FLQlWIsnlk?=
 =?us-ascii?Q?zlgr1aIK6BMQb48eTy7ABqKWYXNIwXmAurqav/0SZR/yRXDhDMLafz/9dBrI?=
 =?us-ascii?Q?zOQjyeZjlYlhwbVPmO0MpWww8W9FefNpIpN5v0E/Ojr0uA9Zk5XH2zyQA0iw?=
 =?us-ascii?Q?nQrY4TSteh/h2rBsVb2h3eSDRkTdvtKmWrQvp72D2vaLHbN3ZDYhWi0TK5SY?=
 =?us-ascii?Q?k1iaLXEooTLGUcqPZ+Yupssf/DvE41YfwpPB9jzh2yxQOFE/G1dJGg+agE7o?=
 =?us-ascii?Q?7KAyCIczvYVS0mUVVq1YCH3qS9QEEJtr8FpLEUalm1ckG7kDRVm442a3admF?=
 =?us-ascii?Q?sz97OVsV4HoUVNcAQl0YrWhXXWGGvf4nydVkcJCXBBsNSetaCSCY8OjWwKTn?=
 =?us-ascii?Q?4JOm3CyC45LGNlD6VXFOXZAQuf4IwBS4Ir1WSemZm6nMov3Trg8o1fD1x3Ft?=
 =?us-ascii?Q?dYJ+QSNm+5zhgH5AoTWvU9x1Pm50y2/vkWQeUGUaHSWhr6Ius9MGuNZY0dvq?=
 =?us-ascii?Q?3q3W73nhpfyi+ByKElmX5XWefGPWflrW45PSy1RswZeW7TX9HZhdY7nH3a1I?=
 =?us-ascii?Q?cIH/n5lel2cQ1VsEyRBv3P+QCyc4cSCas345iai1tATLa7FAs+Zv5OW09Es9?=
 =?us-ascii?Q?XQDZ78d0OK2v5wtIQGn4dxtKL0syt0AlQR51hpQQQM+rxK+Fks5eX57yOIq3?=
 =?us-ascii?Q?YK3PhbnINhCQI7yDd319aMrDgKCCJB09RSzCoXxMAKKHk3PAsIW81YlgUynw?=
 =?us-ascii?Q?yNtubHq/EA6T9ib8IanH0LfLWASfvHxVRoIMP10WBp0xLWC3Tq7TLPMOh8t0?=
 =?us-ascii?Q?+qqQ44VFXQBFADdl0Jl+J/ozztqKal3OkcUyF0yAUUx1bpr9vMH7krclpytM?=
 =?us-ascii?Q?4OGT0bCCdepFvfXjVq2CtVeXd1jlAJKPsh6pVKUt39Pec4knmOd+CE6tD+OW?=
 =?us-ascii?Q?JsLVwoe6g5Gdz0zTaoW/9rkUUAE3vL5N+9LpWfgzhpYb4QXfNqhGmEFz+QMi?=
 =?us-ascii?Q?UqKB3uNCwDy4rrnLyDpK+SB5TTfIOV8sypr67o0nHJrpE6QyOLAFWkqHybQ1?=
 =?us-ascii?Q?s2+bDv0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4357.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?keKJyjpYrnCaQUBfphV3xl1pRhhsuPW/FRQXC93Y3/iedc4vmBhgRszx0GGU?=
 =?us-ascii?Q?iuvaUdVrJsAtbUZiQg1pkTiNqxrMXUPxHOxoi5+26NxV8P3weIINSg+O0DLh?=
 =?us-ascii?Q?kMFp5IfZFB0ezDpsT1aHhHinEtl5FPvjoKOfNpklLvdekU9JjTpUkY5GTT8v?=
 =?us-ascii?Q?4Xc7j/VbSokHvX7ezorE9iaZ6sdxVV/G8SrCqSDxyASbg/rU9salQkprFjte?=
 =?us-ascii?Q?MZlLSyr4coOFnkZTh/PIFnNeGsV2Qnho/J/VVVrxYBR8M+4pI0J3xRpzPxS5?=
 =?us-ascii?Q?rAsMTEZEBYdu/2QdQ+mur3OC1bFAz50f4butB2aH4QYkz4a4u6FkSm52zIdH?=
 =?us-ascii?Q?ESrJd5Nzxi4wimGlFi3iVRUzcEBB5iEhcMgB63zUY0HFkQPzS+1cUYyCF6Cp?=
 =?us-ascii?Q?NH1wFR82Y5R1Tk967zz8QHKTMnVhBJHcW6SJyfJI0Aif0tVASC+cTUE4YUat?=
 =?us-ascii?Q?FMkzkf99/+xKAxM+YHmE6/9vTTBcSk8k0o1ELE+6Jt4tRjc44D+dBth/Klu6?=
 =?us-ascii?Q?oULrBAkNSBjioMD4fPOMXRVkbW0ZXvjWk3jhUERMYQYeUxSGEs8ZceTsgdAJ?=
 =?us-ascii?Q?veUnDtY4cvtVsX3ueUJ3dh0zUKnZVCsUmUulY/vp7lFU4jDEPWbAqkrdCBKz?=
 =?us-ascii?Q?THiX4sgUXZz+04gi2jkrXtG+ZLMxNZnM/xis4knAXj6590QS1jlFIxMiGq+J?=
 =?us-ascii?Q?LyX9xNuLbWQgAdWpy8h0ADpKcxC2foG7Hgf/UP0oJlMQege9NseDGNep4ypz?=
 =?us-ascii?Q?ozYD9veyTyA4mXE6PjndaW+02hyWfVygcI41DlDNQaJdn4eLpjBYNIoECSd2?=
 =?us-ascii?Q?aJoa+QIe0/hdELf9fsYLKGneeSpOCv+23M9Le0f8XWOnqIVqi1AIEao3ZT5w?=
 =?us-ascii?Q?PZHoz2zgCcsLVrtmCtwkxk/oEeIt7RmV3qd/uU8cSA9GftuwUMD6hHzDXw7K?=
 =?us-ascii?Q?+4Eh9YAcHhNjCo2XPJYgbl8OPfT4A14vbfE/slr6nyAbCmvLO2Gu/OyFAO1N?=
 =?us-ascii?Q?IC3b8TiDvbL71xga+vqfEWhgC5PT9x4KTP0+SYt0qvW9aBNysHUQ2F1FV+DO?=
 =?us-ascii?Q?u8z+nqGMvWL5UnxHEEhJGf1+VESFnWpt1yEf8tUmlDI3+S6tbjCyRYVQG3nl?=
 =?us-ascii?Q?NtecSXTPpe+vxj3GbN1wJBLhFxxdffPhPwOsXHKRiXwWUKSy0902Kp30dEnD?=
 =?us-ascii?Q?8eT8emTdgjpJWUhWFRh3aeBZJm5J7Dv1AJXW/sQnK/XGiCh6FI98AdJKTm9+?=
 =?us-ascii?Q?OjNmVvAz2rvP6wb6EClKYlkLdHEstLDpBnXwAoNBTzwojW+k3sddOjs3DoXL?=
 =?us-ascii?Q?SE+/c0WqRjF2Ods7Us+z25XuCwgU2ZNTei5t/JHnEOn+tDlqr/IRU8NlBkuH?=
 =?us-ascii?Q?l8yB1vJwvjV0Lc595VEQZtCFCltZcN2t4+XMBO/8IO4Ud9ZSVUTBOJW4YaML?=
 =?us-ascii?Q?dmQtA5id0Q4kPabPo4CO2UGuFxeu6ryjlOdtpFo11Js18pInyDaG316P7C2k?=
 =?us-ascii?Q?IK6SBODeRFbBAmNQbu4ZtYSC2DP0Dse1V4yWTsiXcRfSj5wK4jU5e2hfWLtt?=
 =?us-ascii?Q?heMMmpLLBQIlXrtT7cFWsedYZ1sG4u1NeEaT2RQj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf24412-8dcf-46e9-d997-08dda5208951
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4357.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 17:35:31.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dl0ZAZSufGCTseIEq1DVEt+DTt0GSrH0bphLKXaaNgEwOkiFGcbOdMXQsPsJZr9FMsQh7jvMeka884toMbdDmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 17:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218178


On 6/5/2025 9:31 AM, Sandeep Gundlupet Raju via lists.openembedded.org=20
wrote:
>
> On 6/5/2025 8:12 AM, Ross Burton via lists.openembedded.org wrote:
>> On 30 May 2025, at 04:20, Sandeep Gundlupet Raju via=20
>> lists.openembedded.org=20
>> <sandeep.gundlupet-raju=3Damd.com@lists.openembedded.org> wrote:
>>> Add tune variant for ARM Cortex-R52 32-bit in GCC as there is no
>>> support for Cortex-R52 32-bit toolchain.
>> This is the wrong fix as the existing tune file is just wrong.
>>
>> The cortexr52 tune says:
>>
>> TUNE_FEATURES:tune-cortexr52 =3D "aarch64 crc simd cortexr52=E2=80=9D
>>
>> But the Cortex R52 Technical Reference Manual[1] says "The=20
>> Cortex=C2=AE-R52 processor implements the Armv8-R AArch32 architecture=
=E2=80=9D,=20
>> so there is no 64-bit R52.
>>
>> The solution here is to stop it claiming to be 64-bit at all.
>>
>> Ross
>>
>> [1]=20
>> https://developer.arm.com/documentation/100026/0104/The-Cortex-R52-proce=
ssor/Supported-standards/Arm-architecture?lang=3Den
> [Sandeep]: Ross, Thanks for the reference point. I can send a v2 patch=20
> by removing 64-bit references. But I won't able to test all the use=20
> cases.
[Sandeep]: I had a chat with Khem and he said we can enable 64-bit ISA=20
optionally. I will wait for Khem to reply wiht right pointers. This is=20
blocking some of our deliverables to build r52-bit baremetal and zephyr=20
application.
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218036): https://lists.openembedded.org/g/openembedde=
d-core/message/218036
> Mute This Topic: https://lists.openembedded.org/mt/113374193/3619217
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
ndeep.gundlupet-raju@amd.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

