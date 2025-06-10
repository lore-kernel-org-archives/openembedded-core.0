Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6975C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 23:33:10 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.50])
 by mx.groups.io with SMTP id smtpd.web10.1889.1749598382015402885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 16:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=2ZPD9I0B;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.50, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZ9hrqOw1gz8b/wJd/5TIb0aSCm4CNVfvBwD6HVHO4/dALgkN5JoZeXz6E13A1qyI0VmzV3dyw2+XStnvNsGGOoiYOx1Y/jU7spvdys5FVJJ6gEXlWgJK2VjjUywuNLFRdRc/1oGNACdNBZtCj66rduwUWuzOhdpu828RlLe8CBaFJdqvA9Wx529/1zUq8sYd+ylb1HZcF//fVljIRl4DMU8aBhyNmvzZaaFPcezyDhp9hCIQww50AhumOVmqRVV4MQkRaOPvCliIzfn+3qTyqWHFkbx1pB8zO6DoHTZk+DhSNwA8J+ElJ2LV0vSHP6SjHno7RKyQR+pCCLCT7oazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKJaBlp5Nn1DdUECwRbhqQiSNibqgTsyK8UA+ILQM3M=;
 b=E2/KHPyhTyRazH9APkOVvTjUuCzdwi8DpxvRgVRnIJn/XCLOaPkxnN11hMCItytevcoOVbastykoroxDqWZBbTRC81twoBYj2nqWuvhFOLlQ1ws1/3j9B8dUlenW9VpDYJ3Xkmk8Dvifca9657gJwJZs3aeCkmapfl37VQuZi4z401qmdttc3q7vumEhGjXZbDzO21BoNyEg7Z+MA53RxVSiBVVzsorUv5qhGe6e++wNHmBaRqzq6zUiYkB5Bn6vs8ULXfmTjyy1Lhr3aXGU9M+p5fJ5YaLrJZ/KmxaZcCVUTrhuthYmKpuM9KK2TVBadQDASiwuK+eezGfduYdZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKJaBlp5Nn1DdUECwRbhqQiSNibqgTsyK8UA+ILQM3M=;
 b=2ZPD9I0B+64vBKnQQZBlkjRhw/jX+jnSl4RghaLY3fVqizoTzOs+C5JMPL61ejs976fQG+POQLoFnIFB49wjxbMDhpUEpkmPFunsrsnkPwG9zv1vgojLcpjPyRkkgqkb7Jk0IUNldBLbR6NjqMPu18oau/Pol7ZwlIQR/TLQYSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 23:32:58 +0000
Received: from MN2PR12MB4357.namprd12.prod.outlook.com
 ([fe80::fb07:a830:460:38fe]) by MN2PR12MB4357.namprd12.prod.outlook.com
 ([fe80::fb07:a830:460:38fe%7]) with mapi id 15.20.8792.040; Tue, 10 Jun 2025
 23:32:58 +0000
Message-ID: <37991b5a-6216-4dc7-be8c-8c2abbc8f55b@amd.com>
Date: Tue, 10 Jun 2025 17:32:54 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap,master][PATCH] tune-cortexr52: Add support
 for ARM Cortex-R52 32-bit
To: raj.khem@gmail.com, mathieu.dubois-briand@bootlin.com
CC: ross.burton@arm.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>
References: <20250530032047.1369164-1-sandeep.gundlupet-raju@amd.com>
 <8607D12C-E6E5-41DF-9809-6E748E1D749D@arm.com>
 <18462F4E324B73C9.10724@lists.openembedded.org>
 <1195a8d4-f134-4fe7-8169-2fb0b6f2fb6b@amd.com>
 <CAMKF1sq7FSejf79sUhHyPbMmNnNeH1xs9ACXrd2R4WBDTxYn5Q@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CAMKF1sq7FSejf79sUhHyPbMmNnNeH1xs9ACXrd2R4WBDTxYn5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::6) To MN2PR12MB4357.namprd12.prod.outlook.com
 (2603:10b6:208:262::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e24d9b0-0f3d-4795-51ad-08dda877217b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q0A2QJ7GBVY1ry6stCOUsS1/Ax32TGA6XmiMpOz/luKW2/E769XiqOMjHMEF?=
 =?us-ascii?Q?DtOKPo3D7imqMNYxkDUqObj6G1cYqRMyW9Z3M6LSi/YRxE5mv2lSd4mZ30MC?=
 =?us-ascii?Q?yKQ33P03AyUzee6j2RhmC0DTnAT0J2B4+RRAPRNH/22aD7QsLYhVYURumPqj?=
 =?us-ascii?Q?ie66HNuieXxW/jegNTfUKpm3SS1OT0+fI9U7DgRgSx1o+gOM3ScZJdpb3pVe?=
 =?us-ascii?Q?fL963E+gMf+Ekc+WgVO8SqW6/tzM/Xp7+RsVycyAfltw21BaW4rODSmGGSe+?=
 =?us-ascii?Q?94oaTPEcSaxKaq/JjvgEFJYGgcf58e/mP2Ha60v3kHcwF+trbFwq6zHimqiz?=
 =?us-ascii?Q?riaNjrm7YlO6iN1IENSTIkCPey61HCMUhnh0BhjJVdOfbo0uopzXLXZVRECr?=
 =?us-ascii?Q?TOT4/LUGuGoIdHUu2rvDanN2RhvJrsnLsaJMmRcgVNkPinn/ZKPyVhM3zwu8?=
 =?us-ascii?Q?pax/osrlTRTPqn868P+FnX7Wk0/MrXpQtcIxx7VM9sJYA/vkFsC4ZEvsLjcs?=
 =?us-ascii?Q?2vNTSqEQ4wtJGMDOm7gSvDntpGKYUqw8bGuKgLdODj20E5h1fmNZGD5sUqsU?=
 =?us-ascii?Q?YVYTW5JURpD0NiNKvSeQRIU822f/9Oz/W2Sm6o5MbERXyDG/IFyyEsdlcQxU?=
 =?us-ascii?Q?s2q1E07YRQ53SM4qqDqTIWX6gzdS+sprdgieb33gPmPhqco9GV2CXD6t/oqx?=
 =?us-ascii?Q?WX/bDI0RCnI+nxwscKqyx6llguUhp0H94oFQG8dt0wg+HYfx7tW1+KBHZItz?=
 =?us-ascii?Q?T84ezPEC0Z0jvOjG/fczRCcY2youQ1BcrBn+x7iAKV/PjPIafGXbtZhL6efp?=
 =?us-ascii?Q?fyYnlMSSLn/JD9zKjU7YxSuONB6tbvo+JkakmDXDGo+gwzC2tJXCcId4IzNS?=
 =?us-ascii?Q?agUFuKJ0TuRlfXCYhdsax+yVXh1w06AkpxOL6YUrIBlhqvNS0fUibRWEhypi?=
 =?us-ascii?Q?zh2+E8nmBw8fACXcmRAFGcRk8XIzxX5dyCrPFqocDP2Nw0qulMSOpEkTuNqT?=
 =?us-ascii?Q?0o/2N0c+AYuHxQFzJblaqlgc5ipVNWI3tQAcq37ZGh1VdFcWuKlgI4jrA4IW?=
 =?us-ascii?Q?ZTzSkjol+Pv7PR81lgC194MMyaIu3Ib8BOFfpxnmt34hUs/PShCgwAzlGilv?=
 =?us-ascii?Q?bTfV8udn7I1pquX6rEmdGIVp+E03n/6D7ir9BXNt68W09WxR6bZBFGsA3iU3?=
 =?us-ascii?Q?7hbhrXQnAmiUboHc5vFmhD+q615c324ELCq+q2Lr5ibvSynmA50LM/d41jsV?=
 =?us-ascii?Q?fhac9xvT4440q071W5bDpe/t87PMvkriWsZBEEZAKxdGEiEvjyLU0KgN6uKs?=
 =?us-ascii?Q?3BNIh5WqI742k3DmByqYB3WOeZASxoldvnHuQci0O/AuEQMEZN/39Yi5M0ar?=
 =?us-ascii?Q?+klr/w1gX96pag2d7CL6QjtqJYQvLw9kGqnP3Govt5P4LzNilwDL6dvVNjdH?=
 =?us-ascii?Q?bMbyYIL14SY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4357.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zEVW3CvTg6jWcCmjb0HGNKrrZVQv+xNSMpSVoAAb+xqXHGspEYUwuJoDT67L?=
 =?us-ascii?Q?N3qHhf/Mvj/yYuu3yZXc4QueZwcrHBUGQpxL/2LY3jmyIbz80D+QRl2qZ6hR?=
 =?us-ascii?Q?tKZz5S0ko/ma7SVc8wVefXgtF03mca+uuCIYuNFv+T/+vKPV93pWiKZJSqtz?=
 =?us-ascii?Q?8iy9K6UpvsL66tFPN0E+/UzT0aPolaDOS20GTheOLbskujUG9ukzU0jfoAD9?=
 =?us-ascii?Q?zbe8SqnYH847NckSYamR26cseVNLF3Y6E+sVQSuvMOLt2/BtBVe7PFPjv9Wr?=
 =?us-ascii?Q?0HjpeQu47TwnESE3ryvvqiDy0aug0S0XRiPND/J11GCZfbq8GAnMhYzfRfs3?=
 =?us-ascii?Q?OeGvpABHw3m8abq9H2bdrxCj3LOmlqoobMbZk3Jo6gGcQpWa76Cn/bnsopt6?=
 =?us-ascii?Q?m1R0LMoaMtRGs0DaMI4DiODIiZRLKqgDajz1dR/Db9uPzXF72kLf45yvqkis?=
 =?us-ascii?Q?FMTAibFRYKDwqNsrplyXl0h5gKesx3cTnb2Rv3JbL/q0MhS73s5r1D1aH3Ov?=
 =?us-ascii?Q?8zOLbUKwj03YevvmZVfIvBMNuDRSRqzNSoGeX7h/M6ZsC19i2skZpMkaDagM?=
 =?us-ascii?Q?km07UxDAZ+S2gzFdjrclWzzaySllaM/Rpv+q+O59R4DYi5jqYSLdkv4LrKXH?=
 =?us-ascii?Q?UnJU2HNcFGEQEWOeFHAhaWgZ0t1FqKu9Ww7lFOAPGu4hXayWU/qqjrpCqIRg?=
 =?us-ascii?Q?Gz9HvaLfjkYkxOq6J40W+W4rk6ialhE7U0rvM1Cy+0EWm4mIw3T8X4oW4pd/?=
 =?us-ascii?Q?bX9S71tgLXvsfrgdvCOWOlD9TB6xi2P36XohGnWOGxadNYWiwkNDKljSh7Ac?=
 =?us-ascii?Q?l/ustXpzyQE02CxcJ8AHMewBbMaSc9QLwKbaLORCsnzcKDtipxaIm3M+IM2D?=
 =?us-ascii?Q?sAlC3J3DaenM/yELZGZEVjQmZni9z6p4pq3S0LEn8aUl/2qV183C/yi5Qcud?=
 =?us-ascii?Q?W6aOgXVjnmVZp0rJfLBJGaVO4j6qkgEgxOZpj5Sd7X/57yM3xI7+EIkKcGKs?=
 =?us-ascii?Q?H6bbx0xq3Zs3VPIUeWJ1sHx8sWHx8Gy4RUJ7OmHPhB29CU0Cw856cFvkLwUf?=
 =?us-ascii?Q?t0thrE3Rk3gCu91qjI1Gbs7/da++ExeUQk3Oq1y4e6Yr0g42MoM85e4Ejsb7?=
 =?us-ascii?Q?NCXCgGslxbIygmMfrjs9c+qEsGEpSfMCH5+na424eAe9+3h+4x+Qq4UFJ7G+?=
 =?us-ascii?Q?W1LmEzvtc1MtfW8LXgOD2iCyxx98PjxT9ehQFg0jB0TvcI4cSU7GdaL+alQZ?=
 =?us-ascii?Q?FPIDpWTCQt43WzqUvsCTKSaZkGV9ayynDZ7RWSIN04PhKE0qI+sA1G9f/KpA?=
 =?us-ascii?Q?6sZ1hkmnus1NCLIEA9HIISdWoL+pVQMEnpEzRmO6W9LuzR75OECutwCt5JMz?=
 =?us-ascii?Q?hhhGUDNB2V8n+6zuiO6AQIu3SU2eyllpAus1IsufBbj5RBrYkXSOINYFTKWK?=
 =?us-ascii?Q?fHlKDQQyWgSqxfyD3g9PM84F+xA2hHsaVfWKFKSLrodaci3iO+GXKJd2y3ID?=
 =?us-ascii?Q?8U++Hi6+h3qzAUwrz+ZVYP/V+qQosBOfgVtae5wL02RtSLWcgFq3TfuWuK2D?=
 =?us-ascii?Q?8VkcCHCUzBIJajOVh8D2X0qKFth2CnNX12rt/SpI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e24d9b0-0f3d-4795-51ad-08dda877217b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4357.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 23:32:58.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ul54V3fW1x2c4fv2UvHPAmgxOOiwuU+HL+XWFiAyGqZjFkT4Ywb6n+t9jj9uxrxD3EgI33NyJebE2mj2Ib3CEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 23:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218443


On 6/6/2025 5:21 PM, Khem Raj via lists.openembedded.org wrote:
> Hi Sandeep
>
> On Fri, Jun 6, 2025 at 10:35=E2=80=AFAM Gundlupet Raju, Sandeep
> <sandeep.gundlupet-raju@amd.com> wrote:
>>
>> On 6/5/2025 9:31 AM, Sandeep Gundlupet Raju via lists.openembedded.org
>> wrote:
>>> On 6/5/2025 8:12 AM, Ross Burton via lists.openembedded.org wrote:
>>>> On 30 May 2025, at 04:20, Sandeep Gundlupet Raju via
>>>> lists.openembedded.org
>>>> <sandeep.gundlupet-raju=3Damd.com@lists.openembedded.org> wrote:
>>>>> Add tune variant for ARM Cortex-R52 32-bit in GCC as there is no
>>>>> support for Cortex-R52 32-bit toolchain.
>>>> This is the wrong fix as the existing tune file is just wrong.
>>>>
>>>> The cortexr52 tune says:
>>>>
>>>> TUNE_FEATURES:tune-cortexr52 =3D "aarch64 crc simd cortexr52=E2=80=9D
>>>>
>>>> But the Cortex R52 Technical Reference Manual[1] says "The
>>>> Cortex=C2=AE-R52 processor implements the Armv8-R AArch32 architecture=
=E2=80=9D,
>>>> so there is no 64-bit R52.
>>>>
>>>> The solution here is to stop it claiming to be 64-bit at all.
> Looking at web for docs I see
>
> Cortex-r82 which is based on ARMv8-R with aarch64 ISA
>
> https://developer.arm.com/Processors/Cortex-R82
>
> Cortex-r52 which is under question here says its ARMv8-R but with 32bit I=
SA
>
> https://developer.arm.com/Processors/Cortex-R52
>
> So I think we should remove aarch64 from this tune, that will be right
> thing to do for r52
[Sandeep]: Mathieu please drop=20
https://git.openembedded.org/openembedded-core-contrib/commit/meta/conf/mac=
hine/include/arm/armv8r?h=3Dmathieu/master-next&id=3D10bce00fb2176515a35c42=
2028d43adb10d02def=20
patch from master-next branch.
>
>
>>>> Ross
>>>>
>>>> [1]
>>>> https://developer.arm.com/documentation/100026/0104/The-Cortex-R52-pro=
cessor/Supported-standards/Arm-architecture?lang=3Den
>>> [Sandeep]: Ross, Thanks for the reference point. I can send a v2 patch
>>> by removing 64-bit references. But I won't able to test all the use
>>> cases.
>> [Sandeep]: I had a chat with Khem and he said we can enable 64-bit ISA
>> optionally. I will wait for Khem to reply wiht right pointers. This is
>> blocking some of our deliverables to build r52-bit baremetal and zephyr
>> application.
>>>>
>>>>
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#218189): https://lists.openembedded.org/g/openembed=
ded-core/message/218189
>>> Mute This Topic: https://lists.openembedded.org/mt/113374193/3619217
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
sandeep.gundlupet-raju@amd.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

