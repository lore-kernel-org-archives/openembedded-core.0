Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B30C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 12:32:37 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53403.1786451551574259097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 05:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=ikcMEkxO;
 spf=pass (domain: cherry.de, ip: 40.107.162.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxFH0Gu9SEsIb+Bm3SD2+G/udluWXkhc7gohpW8Of0AkFhS2BMQX3qhjodZVD73kxVPLnV6mXRtLmXtELR8+TdPJWFOFV88Sp6IgHmqS/ymeblZBxmRedtrqezNssZ2f7pfgNsYpEE2+B7FnvDgae4xoFHz+bkXuEd55TcoNogAwZdMRP25rpg0NYPpVZjNmjiIi6uBN26t64ggVuEKfJHm3dCaGKjs2xbZbZRUL7nnFFsWmHCsD7vW7BwTvpXh1FX74g08mheVYzVf9SIrT4NJ6hdUuxpZsQpp8y1DLTTHaENcOPyTQqud3RohfUaF+1fqtGWM1e2Ue3gT1E2jjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTURoNZKDFV/kF8UZxjNuvF5TSNOrsqVXsKqesWfhgk=;
 b=HMvUK+H7mCEllnZz0YPsZZVpXFCnWCBTz4RVBemD7LPU0Rtg/HXKuqeu+z7EuBCIe86xuZnr0fZ9IxPp6aex1j7Xl01jv5pfC25hynSdtLHfUEtgBRnnaF4lyG0Fq2/ysKfRkPsu2pqx2wbwBEyMoevnhudiIFHO5ClxTOXcgF1qDRBg30YcKH+Yf51piLZ5NPEiF6EYFc2L2d+D/6oMAGDSTH5IrPfs3SGfEA7HP8C4pMonEYvvrE3j71LhLFqXL7uClDDjrXem2KoSbZIwA4FReV4p8oWLmt8DPhCXvNeTwTRtr7aU1g6pQnET1M9GBFwnfh+qubRw/a2MuI9Q8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTURoNZKDFV/kF8UZxjNuvF5TSNOrsqVXsKqesWfhgk=;
 b=ikcMEkxOyNKlEiIRYx2f/6vBL3QsiBeUOGfNDT1z27t4Z8r8XIZVQjEevGQRfcSgM/pO/F8oWLV1uyPvLk+dMy8Snb90/N5P/06ZWc9rCr+o15WLeKi2Ed2krCmr3CcWg7Ro2eSOUT7PPxTqJ5ADEz3NQ+Wiv342VYX0t9duxYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DU4PR04MB10363.eurprd04.prod.outlook.com (2603:10a6:10:55f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 12:32:26 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:32:26 +0000
Message-ID: <5c5b2aa3-08ba-4491-8f1d-75216be08252@cherry.de>
Date: Tue, 11 Aug 2026 14:32:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: add support for Clang toolchain
To: Ross Burton <Ross.Burton@arm.com>
CC: "Harish.Sadineni@windriver.com" <Harish.Sadineni@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
References: <20260811105603.3447122-1-Harish.Sadineni@windriver.com>
 <274b9268-b499-44b7-9297-628de8facb23@cherry.de>
 <58AB193A-9DA4-4BC4-BC53-94FDA2D986D4@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <58AB193A-9DA4-4BC4-BC53-94FDA2D986D4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VIUP296CA0025.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34e::15) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DU4PR04MB10363:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1e0ab1-5e2e-4b14-b7f6-08def7a499b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|10070799003|366016|6133799003|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	kYgO8fGiQa48oq+R40lRgAYKuWEpM9gm5B8gvM1AC5UUaw6G7EVwVfoOJASg+OPghfZXMR/io1vknZO8+FKRpDh6Qcxit75xGJUTf0RWQYo3O0nM49p6dDPTbA1te3OxMkQDAPUvjEa/V8MzrScDLsEq+OVcgvFkedh2u3879byvdo81wcIobaZT9reuvyClKmS/MB1FSsVB5dzgUfJVd9dGe5cfwSkhWg79O1yRpiTyKqEFCrxDAcKdtxG7XUNspuhrEDjuJ5kst8qJCCxR/7XUvODFJrIrO7A9tdgMpxs00UUmBoh6basPmHiQmyVjRpUV+dAjWMfe46YDXz4J5ooBWFebtrezA/QC+hCAXuigMGbaMwio08ELuZ+Ihz9H98oHsbJ/1F0E3Q2yvManCGkPMDOzAgALfxtwmVucSnUtxs+mY9uW1MiMdlSAAcZJ6MwgicT/OkB9ajVJtq8fAA2Pi3YjBPpS85AzT5U2/pQO0yu63/WN6CXa9RBma6fe7OW3Dzle9b7KEIEMi02Y3ihRx76Jugqw65SJXos96uNho8C1AIhdO6JM+DsMRvKZ+L/5Kva36pCqPf+5i2iUrOIlhdYm/r7aJKiCUtO/YLVZvojC2FpY3j9ljr/bN9elP6qN9eSoNs4mrVJG3oJ4tWTw1RKorfQLD0OZgAKPJtY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(10070799003)(366016)(6133799003)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uhG/yVi1QC1BdJlWQOgj7guH9HtmHlDKNjEYNuyMkqJ/ir+2y7TjsqCri/XT?=
 =?us-ascii?Q?qOocGcwQY5v8HRUAlGPtqFjFueOh484gRm7D1dguF3useMIMdxMBopLIpMxg?=
 =?us-ascii?Q?Lc0BEfDZo36yuyAcxHNoFdNH+3a946iHZibrA3StKiQFQOEWnAXswTYvVORG?=
 =?us-ascii?Q?QKgK2DTh2Rc5Bf4tNCIMpTTRGv5Ik154cAcOL7HZSVIGJx7vnojMQmlX2Mxa?=
 =?us-ascii?Q?WgmPigQCh2iWq5cM5SG+At7UOzox2DPMfejumVN7rYrqpAQZpxFY9BQOwGmF?=
 =?us-ascii?Q?ZPPrSyHbxTPScCQI9S03RtMumbzhr1zAxLWlj4Pah/EoWpRgjGNXcvwQSUUQ?=
 =?us-ascii?Q?tnaYxrqlD0EONCJqASXS4MLxoh/40tRIfAKdjCopt+meiDeVec877YNlnQyC?=
 =?us-ascii?Q?4AJsxdhp7pnNdQzczxNcrVDNKaIWHHGBLzw8qfut0/2lKOzKIJ//q0Kj/sIL?=
 =?us-ascii?Q?N+BK/wH2he7BGsVSST2h6aknykDgheAI8pGcYWYekkYS8oOogrdxsdEe+JWO?=
 =?us-ascii?Q?y3g1DHM+Vt2tvZYMNtff1PVhCgkZQpRHmCH9PrWmap8zMyC8icW0Y/Q+ihHh?=
 =?us-ascii?Q?Urz4rlCA2eeC8FfvpOwV8t3o0PAn9OuOWeU3sJJzc7JCl0DysAfQndiKuSpP?=
 =?us-ascii?Q?/zK7tgjFzkgPKuV+GVAVibr1BdgtYvlpLB18R60G+2emhzjKBzvhuCi0V0sA?=
 =?us-ascii?Q?4r8nTpF6hs/NRNeLaPb0GXAp9NDacijMgyvn/mFk1OmNa1DJGTxxcYRAsQWH?=
 =?us-ascii?Q?G1UzIZRwZ71QR5Gy4tyufOGSt5e/7SVctQGnKGwH1OGIaZU9LCSGlL7aVw7n?=
 =?us-ascii?Q?coHFZJK+zLAIO+29gK8LjmRsSHb7vf4jgZOFfUTSK2S3DbrmdKMJ1OIQGdXF?=
 =?us-ascii?Q?ouTRxwGSmvXVY994YUiyff/k8XpKgLwluK9qMm71Djjtp8vzTHB4xpSOme3e?=
 =?us-ascii?Q?eg+sIpEdOoa3ErjgDPk/U7nckuigLV/9vJumfiTjopVzpQn0qjQFzsv3t5xS?=
 =?us-ascii?Q?U4DPr8tPucDvkSd0gAcToR9gIgpysRg1yqDiue+6rLioJFE97qdLhp73ICY+?=
 =?us-ascii?Q?V7bAYpEybtd6azmtJIH26JZ4ugBarWREwURArGV6f5x3YOYAQqiSc/zA83UR?=
 =?us-ascii?Q?7JAvTzKnoZi96ZkZqqUJn3ZnERo2BH5jntCNkAg/hcEiEIFh/Xr5VMhZgzfH?=
 =?us-ascii?Q?KM5YOSWzS1vf/9jDBTFxlE/W4LKKYiRD2EO/yUge9Sb/hO/qdkRzLR7vyJf0?=
 =?us-ascii?Q?Stu3ZcOY5urrROFB7dUiPa2A6ax916T/Nry5uBUxV+KRAXqbgLfItUhBswXr?=
 =?us-ascii?Q?tFmu1mg9cll4wwxWwjGRMw/bS8Pvd/EnBMnuPr67ppG+NLrz+a93/TUbTbwY?=
 =?us-ascii?Q?YydeUbqNa7I060D+QNxZpmxQa3gd81/6D2ZU3BWv/dQdX3dfrNEsuP5FLCiz?=
 =?us-ascii?Q?KinCuiEvxqehnGq/oblFHOnQZNdF6m4akKMPylBxvuyHGL6rExMDVyqH3BqA?=
 =?us-ascii?Q?BfLQzz7sABdEmNpo9Zp2i3xyGDAMLqRvPjUqHCwx3MKDUsAZTjix/hv7bGRg?=
 =?us-ascii?Q?BfbpWL+Crhdb3ga40Sqml+FDX4yuL+FrgjoLDIaWJ5jlA3bPGmxMT3dKkgi6?=
 =?us-ascii?Q?YBBYE8LBzNsvfyHsyPgHCIGqzIMT5Ninqgo5ZELvkrHx/PReupDHUq7Y3KIG?=
 =?us-ascii?Q?zy8WTrXGiOwAeMKZS1Z3HbyQvoJnGK2i0vuklrMj4GagyRnG8wso8M/i9gKO?=
 =?us-ascii?Q?fFvmQgFAhZIHLPHVng+vuDDQgVoYWQCWtnC0qhhv3LMKKJxxC20FEjMAlFK3?=
X-MS-Exchange-AntiSpam-MessageData-1: DI5Q4BhCKCH+BA==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1e0ab1-5e2e-4b14-b7f6-08def7a499b1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:32:25.9635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSSryQOMBFzFKtpisWVw+nUHnLfv8/lqOA4oYSgnppIYAxwJUFXCgR5cfHTRYOPwfD3z1lsrTFZ2NHhVjVd8USn0wy/wo3KMEfa6FPCe+3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10363
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 12:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243197

Hi Ross,

On 8/11/26 2:21 PM, Ross Burton wrote:
> On 11 Aug 2026, at 13:13, Quentin Schulz <quentin.schulz@cherry.de> wrote=
:
>> Why not simply ${TOOLCHAIN}?
>=20
> That would be a big assumption that TOOLCHAIN is also the name of the bin=
ary, which fails for any native builds.
>=20
> But it would also work here=E2=80=A6
>=20

OK. Let's rather not use anti-patterns whenever we can so people aren't=20
tempted to copy this for recipes that can be native/nativesdk too.=20
Please ignore my suggestion for TOOLCHAIN.

>> Have you checked we can build u-boot-tools, u-boot-tools-native and nati=
vesdk-u-boot-tools with clang?
>=20
> FWIW, upstream CI exercises the build with clang so it should work.  Our =
CI will be doing build+boot tests of some clang builds with qemu.
>=20

 From my shell history when I built Rockchip boards in U-Boot with clang=20
a few months ago I had run:

make CROSS_COMPILE=3D"aarch64-linux-gnu-" O=3Dbuild/puma HOSTCC=3Dclang=20
CC=3Dclang puma-rk3399_defconfig

So we need to check HOSTCC is proper and that we really need to add=20
${TARGET_PREFIX} in front of gcc/clang in CC.

I thought u-boot-tools includes u-boot.inc but it doesn't, so ignore my=20
previous comment (we should however verify at some point we can build=20
with either toolchain).

Cheers,
Quentin

