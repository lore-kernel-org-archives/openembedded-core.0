Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00419C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:32:20 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.49])
 by mx.groups.io with SMTP id smtpd.web10.10646.1749137517899686225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=DsrRkj8D;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.49, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWb4LhNPXVR2F1+Tnln1/3wHjrPXmFBSgfAZ/ret21IcjHgIRwxr8Ug3stUuTuyQLeRwVgR/3vDifY54pwBomX+ifXc5nJ2TLQW9fTfDBJjDqBMHoSPZI5EZcXLxLFereXWyFqp3bCv+WsjgYd62HPyXgoXX9m37LvviZS8+dSZQhYR0hQSWbV37TlEmverOKH/06pD4IGLUWM7jDn49+70vVMx4csFmh8Vk+xejra5b1nRywbo+oS+TT95OK9SthRoA8wIPqdwBTezwgYYpEaPVV+jbft/yme+kOBoxz8i40Qz5KvJWksgmApkMlz0Ybou4JbvBhu9yKrVqPso5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxfQwuSbQbUWdy+tTvHYSOAobBxZn0ZiU9+4yjTB8J0=;
 b=l8X65AcUviHOgj6KULYwLclRAUQqF49ippDbp413i/rIN9Ft/TOAIwcHQHK5dupjuP4T6HVwbGlIk+mPCOqDjf9EapWSOwZRlxYXtlAtpF7OLlWVMN1Ly6uwTWxFvsjyKRDufbqg6/F8HegX/O+i7d7Sz8UVIdkT9t5phwRxL4ec99bQdN3zwtvvKbeKNzEKS5Mu+LnJFv6SoDLCF81JSOE/FIqX6NHUh/Xwnl57ZSUoPq0NZl1q3iD1FdmvHRawvXdJAHmbV/uBd521IBLvdxOfkRXxmC3nbYnHq4WCo9hQpAbNnlqn9SbElzDMIeAHq1vmHxeJN1h+UL4isgTbRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxfQwuSbQbUWdy+tTvHYSOAobBxZn0ZiU9+4yjTB8J0=;
 b=DsrRkj8DGAd6oeY06ks26XL4ld7yP9bNFpwgqisD9TjHvK03Szgd+3f1XTyTh4Jl7sHMayYHDWljbW8IziosXb1b/TgNjdMN6ftbIYeTEh1Pm5GBgAUUoq9hO4KFFXiEAJfP+pYiPl/o7ip/UPbS17R8DQ9wyGCRO7P6AsnRh0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 by CY8PR12MB8265.namprd12.prod.outlook.com (2603:10b6:930:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 15:31:54 +0000
Received: from MN2PR12MB4357.namprd12.prod.outlook.com
 ([fe80::fb07:a830:460:38fe]) by MN2PR12MB4357.namprd12.prod.outlook.com
 ([fe80::fb07:a830:460:38fe%7]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 15:31:53 +0000
Message-ID: <c531fd36-70d0-4c57-8e03-8888455955a4@amd.com>
Date: Thu, 5 Jun 2025 09:31:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap,master][PATCH] tune-cortexr52: Add support
 for ARM Cortex-R52 32-bit
To: ross.burton@arm.com
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "raj.khem@gmail.com" <raj.khem@gmail.com>, Jon Mason <Jon.Mason@arm.com>
References: <20250530032047.1369164-1-sandeep.gundlupet-raju@amd.com>
 <8607D12C-E6E5-41DF-9809-6E748E1D749D@arm.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <8607D12C-E6E5-41DF-9809-6E748E1D749D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAP220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::15) To MN2PR12MB4357.namprd12.prod.outlook.com
 (2603:10b6:208:262::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:EE_|CY8PR12MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b6bc66-eff5-49c0-31c4-08dda4461959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sk+vOjf1zXqmFCaSlwMNy2mbhf18oARYCaQsZWSZsZcuAJTentde/CdzEMfD?=
 =?us-ascii?Q?2QRlir6DgTzIXt/1QAd33jpjO4d6o6sVubnfS2BU2IWH4iu1r5245ITalSfK?=
 =?us-ascii?Q?wp7gKi2TRFbUe9HU7nJDBIyTWezajWyjN38g9z3mMENIyOXjFuxw8hTnnlFx?=
 =?us-ascii?Q?eAdfTAzthq/Y938ibS5HtUgwlpRB3bYnahx8BlAvrrmbJ+zszs27JDjsZB74?=
 =?us-ascii?Q?VxgB2rnCff1YjFubSH/aI6AZpbQrUOqzS8o4+jv52BCEAzNrVqpag2C8jITd?=
 =?us-ascii?Q?xQm6FR+/DMKZFnIv5LNxLhmVrBDcsYni6BDLcogie5rTPo8gzsADsP0Mr16n?=
 =?us-ascii?Q?iIMtlUyvgEAR8zijNHf6WBudlqFOlpxGu/BMIk7vRAb7L5l3zs3ryIh9A6Xu?=
 =?us-ascii?Q?KXp0owQgvKXNKiEPHSi31O3yBpZGGQiLiJdhE/+vK3cvHpp4ejsgg2BG7StR?=
 =?us-ascii?Q?j8CbX8n7RBBdQRB55f5gXq+iVuzmGJrsYJuHcxCQ/vUAaFtcWUVeq0kjtAlt?=
 =?us-ascii?Q?jMsuYcl731KOU/Zzkxk+rIVCQG0c/qhWgANflSQnsi42DErUk9zuaSCb1Lz3?=
 =?us-ascii?Q?9MiPF7kxOPvOU/nroJsm3npuE2pFpN7xErSJRQzgKP+0ol2JzFwDyrKCPWl1?=
 =?us-ascii?Q?866pJ3qS6vTxM4X2+eiNJCmqrbw02MupkJicQJNrgg/HtGSgx7SLkqzoXbrV?=
 =?us-ascii?Q?zB5SmfAOvSZKJnDBjY8pf2iAT3b3OtlwpEQ+ynEzb87qQE3yV9Esf16qhxiO?=
 =?us-ascii?Q?e/tkIiDnKdxZQjo5jJngaBVqcULZ/No+K3MkkwAGNtb5qYP/XURBLdft8BsF?=
 =?us-ascii?Q?DAg9ABSUT77IiEA6Xpbk1OaVQjlDEM3Q9mHHhD36e7fHnVlR5BhNZ7wHDjAC?=
 =?us-ascii?Q?IN997tq1AmeRl0Jbu/ZFBj7T3XjCSoayv82+iTMDQdyCg05iggJYSfJYLv3h?=
 =?us-ascii?Q?eQUU/ce9Y98wYOM3Z7CNDCkyNHzCQoyIRXjOyB0XqOXbyqg36R3IzpdVKEkX?=
 =?us-ascii?Q?/09wBVWosTSaIMviGcpYLC3+rcOA7lIaoYIhRbQuwFnJtq/QjzAoJbgYH5se?=
 =?us-ascii?Q?Oib/w2eN4Z5C8CJTeQc7/3H7BTE/81mXRaBnLJRHtuY70gccLoEx/a5tq29/?=
 =?us-ascii?Q?phRF+8iOQSrEx1HfLz8RGKzifJgk7GNxiW3l/n/3SiioUE2WfSgABCkdjKPI?=
 =?us-ascii?Q?IgYR9jnnMHv1a48F2xM822qqpPSE17fetu2h/tWhzLcWEdghkfHvHnv7Ep+Y?=
 =?us-ascii?Q?B3C/X+WeUni6Upo2ONvBgqbMl14sh1RBoNTwzzbo7MizpNdpc4zuLx9GAbb7?=
 =?us-ascii?Q?M9NGP1Oh/bA/5oLbbWIC59HxA1phPPNByLPWUqRRj9/kmSrFDRfyuFs1+q8e?=
 =?us-ascii?Q?TXLtnYg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4357.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0KGvJW+Domm0eMQ45mRbuTyaKfQX4WysBw3jXh2WU+i45v60GZSi8Idee2Dy?=
 =?us-ascii?Q?bKrS6nAIGVsHfQd5Qe4jtJTuvP6fu1Lh0vNFSJlhoKNSnfvJuYFmXRtFHt24?=
 =?us-ascii?Q?fkoeUdiDYoOJxDV/e32uLjdVTBfHyae8jqGOEtBsYbM9oIHO/2GjF4Oj76Yi?=
 =?us-ascii?Q?/4twLTAT3RqufwYvFWh8P0yKiaQNYjJGGkuxErA27tetM3Xh8O9Q5BHTgsGj?=
 =?us-ascii?Q?tHqlIEzRgBbaXHtk2JzisqJ7JzJLh39QIK42tlLQeulh6JCtOee5L8g7TWPc?=
 =?us-ascii?Q?Xfm6VEfvsQVjC2OqTPvW+6AWY/4EaOTgW/xj278H76j8ZrN3qpU+sBuff9Ys?=
 =?us-ascii?Q?JMU3tC0/hV5jBxBv2XKkaJ6f8F0UHk4wkdvdr0pu+X4DO7UqNW1ePthEUcAd?=
 =?us-ascii?Q?1h+pPjisB7iiRU69mzcKxhqnN9PvSzL5sESBtxbOPD6wZ9vJdHXlnov+PBef?=
 =?us-ascii?Q?8pZoMfknPxlF+WAEQD5X7C+U0MRGtUwp6ijblPQeD08B1+1smzYlrKYHskjO?=
 =?us-ascii?Q?q07rUoEobdTC9bPQYsRjibvKcIK2RKzqmxfMHRT6+J2Xvcv2QkSafeN+TAKB?=
 =?us-ascii?Q?uLtd3G9jHtCNDNh81fo2UOCLxrb/JX5ollKB+GERVkv51KcEThE0wrhB5JpV?=
 =?us-ascii?Q?kNWULDVDYABukuKXfuZd6F+NeRto36VPG3dxZB7+cZ5vue7UJXQq8af2CYDo?=
 =?us-ascii?Q?BSm1qwoH7/4vXGRyguFAQRTOtMsYER9vpD4LnPbF3OO01Kmxl7Qasu80L5uE?=
 =?us-ascii?Q?P058uI9dBwbScSnsGxdh9lBVALxaZA/DOCKXGULSaZ59uzCAqD31bbImMYSX?=
 =?us-ascii?Q?xXrAVDUu/KVBFoHYOBis82PPXmEOJlSdPxDG1DdkXIlye4czuYLWepHT7KEm?=
 =?us-ascii?Q?7bsgD4HW5ZqMDLLMi6QcreVS0ENExIrA+0jSi8f0fn06EsScLUQUJguuWghW?=
 =?us-ascii?Q?eYeOuclswvdTTkjcKtSj9fccAbEcBADvbt+T+43+KMCYQx+rOqp8Pnbe/aYL?=
 =?us-ascii?Q?YSFkzgDflGFA+be1I3T1INA5dGvkMNXyP4E4JhqvldFK27Xf6T4C4S9l8Nmu?=
 =?us-ascii?Q?A2vC0qzPEzHYGtjhh3HpaSo8TN6yXnRa8KSUOw44LYPeo1jKxV9/eIVoqV3d?=
 =?us-ascii?Q?ALKKuBF1Cd+xzk0/IU5wisok1lFGVuCTMItg0E4UKVRhfTcZzk4oZ6+aYz1m?=
 =?us-ascii?Q?RxnVfDk/mMtbCzPXQQB+G/6oNQ98P/zksD3x8FAovyUJSEBzjCb8m15w3eii?=
 =?us-ascii?Q?ppxjST6Jc5NHjHPVfltWf3By7c8dPRpR3ajrOm5T5HLSku2ltuOZk/Vlbw32?=
 =?us-ascii?Q?RLKAR6jHodMltnmkGsESzESaZMhkeQE9Xwf2bu5wSPERTIwYjPTwA+bNhu3F?=
 =?us-ascii?Q?irFUkq4UCNUUur2wnLs4YMU2oxr/RV8wUtVoKcNPGQrQHPGObs5v0wGqvV8H?=
 =?us-ascii?Q?6Y26peNU14ITXxOxjib6Ix0lUuP0AyyV79it64dt5H1KbQIBuiDfeNNdp+Z3?=
 =?us-ascii?Q?DhdBGYR3clHXxBapQgwBQaDaVUOpr6HrNbrRJ55AAJyEBT1Rd7ANQIyPO5DJ?=
 =?us-ascii?Q?zO6BE9LGQkXMdxHJ8Tmq1yKfnm2G3n59eg4dppPa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b6bc66-eff5-49c0-31c4-08dda4461959
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4357.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 15:31:53.7696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVS9r35dAkswgIDyPqoKl2eq3qO8jz8hTwKYGLQSWspPqXE4EOXn6Y290EE89ACNNZb4EYKdzKYw2RoyOA9d1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8265
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218036


On 6/5/2025 8:12 AM, Ross Burton via lists.openembedded.org wrote:
> On 30 May 2025, at 04:20, Sandeep Gundlupet Raju via lists.openembedded.o=
rg <sandeep.gundlupet-raju=3Damd.com@lists.openembedded.org> wrote:
>> Add tune variant for ARM Cortex-R52 32-bit in GCC as there is no
>> support for Cortex-R52 32-bit toolchain.
> This is the wrong fix as the existing tune file is just wrong.
>
> The cortexr52 tune says:
>
> TUNE_FEATURES:tune-cortexr52 =3D "aarch64 crc simd cortexr52=E2=80=9D
>
> But the Cortex R52 Technical Reference Manual[1] says "The Cortex=C2=AE-R=
52 processor implements the Armv8-R AArch32 architecture=E2=80=9D, so there=
 is no 64-bit R52.
>
> The solution here is to stop it claiming to be 64-bit at all.
>
> Ross
>
> [1] https://developer.arm.com/documentation/100026/0104/The-Cortex-R52-pr=
ocessor/Supported-standards/Arm-architecture?lang=3Den
[Sandeep]: Ross, Thanks for the reference point. I can send a v2 patch=20
by removing 64-bit references. But I won't able to test all the use cases.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218026): https://lists.openembedded.org/g/openembedde=
d-core/message/218026
> Mute This Topic: https://lists.openembedded.org/mt/113374193/3619217
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
ndeep.gundlupet-raju@amd.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

