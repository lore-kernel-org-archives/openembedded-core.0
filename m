Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE85C3064D
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 13:35:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.139])
 by mx.groups.io with SMTP id smtpd.web11.26891.1719408899741511886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 06:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=GZldTQ5o;
 spf=pass (domain: cherry.de, ip: 40.107.21.139, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLNvypfuHi9JMHMhnFobQ2l9NB2SiSCRm8p2gHk6B0U9JwNILVacsCn7G+Ni4+gkM1rfomHtYHqYEHx49mDd10/KuCbobKqdqxPpppsg9L3B732muBK4mty/o5Wxs1gW5/oa7NEIwgKu5D1hGoQJKUTYTKilbk3nCgh6tJvRS5lHr3/ueEIGUNCAGwJ1ps7aI5uKf/c83WQV3PHTI0lA//N4WY9EfkU55Ij5cN+SSmVDSv7tdjO9jLFlnL+hZAJRO8cXUOSN0eEp14CLnjj3ADTZMxeHexZ8SEt0VVVzXz7j4JgxuWHDVinC89M3LvmpZoiFV9Wziq06qu9iNZY8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VC77LW6AcXAKekntVYuok+V3BZ05GmIUpxBmrI+r1yg=;
 b=haj2FmK70z7mNFHQK6PXtMeTJbNgSwdUftRw/H0Fw4GDp+777+qhvKtm+5XYhHumOLbygEOD5qWrHWUHVvhM9YE52U3gKeuMSkf5nr+ktyaO/b1Xu9GJU/X8Oe/cdKliYwL2ZsHa89oQGjg4DsmFop/LLgihB8jq7Vp3MVehmDW1cpoM1a9EbaU+nx0r6E6+QX1fmO4RV/TtdIssChb2Tv65yoEhzTKd1eMMTSjDkTZ3TOa5g6XLdOM7F33eKjGXLUSshhlIVRp8TySVipu9aH2MP8oC1s7mHD+Dzluc3cseTE5pCm8xNFuZsT8NZtyYbvdD44smN+AUDNpGecwNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC77LW6AcXAKekntVYuok+V3BZ05GmIUpxBmrI+r1yg=;
 b=GZldTQ5oHYoeH4CxpcgYYJeyhTL+VMyMQcpbDc9QU/YJB/hzrDY5+YVeyTkSH8nowPf29hY/zIuxHWg6mKWk9CRuLlyaL9V0wn01FA6yVnSVbibd2dals2IUJWmmWT3lzOMdXin3MU460wmqiQE+zZ/14x1w0kaN2VBDD3DJnC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 13:34:54 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 13:34:54 +0000
Message-ID: <c38d4947-f02b-4e4a-982a-131a27ed0941@cherry.de>
Date: Wed, 26 Jun 2024 15:34:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot.inc: WORKDIR -> UNPACKDIR transition
To: richard.purdie@linuxfoundation.org, leon.anavi@konsulko.com,
 openembedded-core@lists.openembedded.org
References: <20240623213254.3215897-1-leon.anavi@konsulko.com>
 <88f54166e39db5b6035f21bfad5f08f7a1008007.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <88f54166e39db5b6035f21bfad5f08f7a1008007.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|AM7PR04MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 801524c6-d7d9-42a4-5c19-08dc95e4c32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|376012|366014|1800799022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2vjYqsUmxblfLdPlyZ6qWzcGwR/stXncXG/mA2mHK3oMVktzp48Cf0ogQzi1?=
 =?us-ascii?Q?11zvd/wdkF0j6L3lJ64uv2QkLQfAxGimzLhTC6fKeI287ftVjo0YMchhh4HI?=
 =?us-ascii?Q?D/wxMAkjZ4I+bSPa6X02pJKnfF9ZCDEyr+DwO9UDGGInWtyf7c7DWmzRp/Yf?=
 =?us-ascii?Q?AgxFgfb3AKa6aWjpg4mScxeXd+jyZArZCie4DLuqQt+XInLRzjOZAljPidPs?=
 =?us-ascii?Q?NTAfCoTe8ddW//aj+mT+ULxLQE8rAau9/C4MUSn4hiLudrRxulWfrYRUgoUZ?=
 =?us-ascii?Q?A8Hbg/wT4FwzpDE+GvxhPM14XSS1JSCgY80QLLYC49ki7EHWXVx89fwOLALt?=
 =?us-ascii?Q?dReX68k7PXwP0aFxtTXGeS+xw7YkLrTdamcQeLMDjxLLGN4Qs5RIC5Xjoq68?=
 =?us-ascii?Q?+cwzWB/V8V9InfbRc/qjN+cSw82P+RvJ6bnlQFasNxpZB0hDLZDShyZRQOCD?=
 =?us-ascii?Q?7XvBXfV2oE09IK0k+0OJa6sKM+nkYiEILH8kD4GakZ3sMol1vmVDwCdLzyMo?=
 =?us-ascii?Q?g/seFctlOwJeoHiLa663cDtYMD8DXrIMvrdDj3Dmq2xWyPVHMwaCRwEQIDZb?=
 =?us-ascii?Q?rDCy/63OmCGOBKXnKHwyQSxFuxtPvVopU3PRLYaiMcU1hBnqj0RIJmGRTc/O?=
 =?us-ascii?Q?14XQTZQ1/zL/mmqGAhgW9acNZ3RsMSmGUlDMxlwefdrdBmU7xRVQptNxqdiu?=
 =?us-ascii?Q?ErYbARP+3U/Xh2Nn2MLJAYQP2N8rp42IxHQPRYtQfZO147UATyxXO3ZYj88F?=
 =?us-ascii?Q?RsXaHDzPG74Hbp9WZLdVX+4wScX8km6i+RgGMadSMZmcATnYpsDIvaJ6Fn/y?=
 =?us-ascii?Q?4J3gzfFBJWeW085yF9DFQzDyipCksZ1aXxZ0IFyH4Dm354KZGKoQ9Y5pILad?=
 =?us-ascii?Q?I8OyVb9a0So3fEHiYzZqfvRu0JvHTC3TwavkR3aw8VsIrjUrFr8DJI0IxBeS?=
 =?us-ascii?Q?3LHiN248SJhPciwhZM7H+dYxAWF1DQC3KNvxjQF4DsAVbqPeugZPbVN5AL/R?=
 =?us-ascii?Q?bwyIR5N28wtdIiqplGBpoeR+0IKaph39iZUSWJMogf+vJ6G7rpPu6lJ6hFy1?=
 =?us-ascii?Q?mJcnQnJsEMWbPPFqm6SX4JyXf3oHrMb1xmWOCIASjREJNpZPR6gHAZPyRN4O?=
 =?us-ascii?Q?YNCnuK2cnhI+x94Ukw7Av/IOChU4FSU1Pneo9/Sw+PlPdsqQC60ftJTRRcir?=
 =?us-ascii?Q?B+z6+viZymrIzlpuO1eSKHVdKfV+7dNDxMo4iTCKUw3HbBvtrbvBqZcs9ZRg?=
 =?us-ascii?Q?ywBriSfmxANs3893QmYy20wvNVc4KKDb4LY/4JiHRUuH5zazQ7jeG/mJsWYB?=
 =?us-ascii?Q?ZVyT8Ofm03IUHCgQacYUkXKLqIRxq/esIaqhbgyjk5dH1g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(376012)(366014)(1800799022);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bfrWet45QWft1OMPwgIOVLc9gV2YCL0LLOypakYNH218CGNT3yxcsKXsohH7?=
 =?us-ascii?Q?B92SNMoWa7cPwSXC816Rt0P/9mo9/lmEq+2IryHIYMuRcXBCYcLpr4byiHxP?=
 =?us-ascii?Q?QkShcHWNZjn4PPFvm2voWEdDeCi9IiMqjsz/cF47HyQLbTTNoa7jbT1P2TOU?=
 =?us-ascii?Q?e1ybxtHvRHThiUjsUOtgz/YvFf84mox+m66CJpngEVUoSQ4AJvfq0ODsS0H5?=
 =?us-ascii?Q?ZO/tzAMj8DLRWxCceWgumoUseQa4AIqj5mwVFe1lB+LiZEHLefYSSfEax61/?=
 =?us-ascii?Q?6BcXW2higSxqXfulmh0i+fVgo/Ye1/o0rErMsdGvJ+DmfIRJn0Frht2gRG5Q?=
 =?us-ascii?Q?d12iH7/fJn5CZyQA6ccigxu7tmkOGVWUCRnRxCuxCVfwov20qvc2YWl+5OfA?=
 =?us-ascii?Q?1DFUnfioQNR7cJAEVv5jfk0Zhvb+DFcpAj5mGiSp1/RZ3tsA/7dPRF8VmCNv?=
 =?us-ascii?Q?BttUlX0fhCHM9kZptkcXty/3xLHINfkUaWeB05LECclstvxanlzxk/FHEjeP?=
 =?us-ascii?Q?eOGKVEUG4e1nC2LIoAGn5UwT0GpFCY6ziPS29jLlrulrbuf7VUdIy9lDEjmD?=
 =?us-ascii?Q?2YF814Y1EmeTts0MYDNjUvzziA8TuV+Cu2wappJY6FFpXRGZ5Bfe5VBTA5Jx?=
 =?us-ascii?Q?YiI/NfMa8v4IOu66CngSckEyK8iMqsdEyVgBh6kk2VtdwDXGeNGX1Zv+5z2Y?=
 =?us-ascii?Q?tHy70xGjOUCw9xt4oT5xVpxGbvpZz2UAG53QdNbtBrpPuuZWuVMK09UaOBUj?=
 =?us-ascii?Q?MVew/iCkLCf+JnA6jdkuCfBW7NXdETh2EKKAdtqKCbVgQHF9TwjyNgx1404K?=
 =?us-ascii?Q?5ki2202cpv2AzhxcBPIMCwY0QtWSxEsyuXs/U+yjcnIC4UeUTRaULAOnmXjf?=
 =?us-ascii?Q?isOo7+IKu7U1lKMOjxBe1p3A9ThrKY0xRXYFQrBRMg3MkHSWABjso/o6E/29?=
 =?us-ascii?Q?5rRZhz6A6qh/ISdADb+3+mMZN5HauK8MAgpSAEZM4A6Aj6a/JNSaZdBZlWen?=
 =?us-ascii?Q?4hKnV3TfigGJtC88it04z45asuiOZpvC0o31h0s6vHoIm09UGE1lrRxRefP7?=
 =?us-ascii?Q?VUl3oZfaYEtpFNVoTDR9Y1Lbf0xaZK1JnnA3zuCUXH05WVMMC18ulj6MEknD?=
 =?us-ascii?Q?YcO+zWpMXk//VjvXI+YPtYYnzw/foPKDfn8u8WjMv/wROAuTtvIhwIKmXB2R?=
 =?us-ascii?Q?x3YKEMfPJ7zG0NHxIZAPXjRMZve2VRWma5vGM9kueaTXgFFMx1begPIdpzzT?=
 =?us-ascii?Q?Ci4mhSVyzvwRGgjMswAe5kdswcNjBc58D/wGJtruv7CDElZgz+hkzF9chM3Y?=
 =?us-ascii?Q?p7ro9fxojUy4gf4zUG5YiySntCRjB/WHtIwH1lAdyRAx+qaZ/urjHH0Dof8v?=
 =?us-ascii?Q?GNuKM0iUtJEtdVhcC6VQQws++FDrMZFai/wbyGeqXkGLs+fYZfUJ+YBCmK1l?=
 =?us-ascii?Q?SwwxeiO2enXQ56Std8xc+jdacrl6XuMp1RUKIpMwnoI63aKo8CgzY+AE1GMu?=
 =?us-ascii?Q?pcWp+YRtyy4BG9TPoi3kphsx2OPx9U3Sx92TXGSGhrMBfYVN1XbOzie/6Uto?=
 =?us-ascii?Q?LcJTe0Z15zyjoQhqaStiCFoW+6NikG6mrhNpwdW9Ru99iM211J7xPpDJNnrt?=
 =?us-ascii?Q?/TjHVKXtOodAj7Hbvy2PSU0=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 801524c6-d7d9-42a4-5c19-08dc95e4c32a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 13:34:54.0473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ad3F6TiiyJPNc1tfFDnYx0Ij6W5n/3/P8PqIzWxzKSuHar4958UP1EJGHrs1rVDMumj3/9i7iVwKs/iwh/3CGTwe2B7dyaYE/bo7gkkBZ2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 13:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201163

Hi Richard,

On 6/26/24 3:20 PM, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2024-06-24 at 00:32 +0300, Leon Anavi via lists.openembedded.org =
wrote:
>> Replace references of WORKDIR with UNPACKDIR for U-Boot script
>> and variable UBOOT_ENV_BINARY, for example for boot.scr.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  =C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 6 +++---
>>  =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boo=
t/u-boot.inc
>> index 45d700fbdd..9a91a0e3d8 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -92,7 +92,7 @@ do_compile () {
>>  =20
>>  =C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUF=
FIX}" =3D "scr" ]
>>  =C2=A0=C2=A0=C2=A0=C2=A0 then
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKIMAGE} -C none -A =
${UBOOT_ARCH} -T script -d ${WORKDIR}/${UBOOT_ENV_SRC} ${WORKDIR}/${UBOOT_E=
NV_BINARY}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKIMAGE} -C none -A =
${UBOOT_ARCH} -T script -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${UNPACKDIR}/${UBO=
OT_ENV_BINARY}
>>  =C2=A0=C2=A0=C2=A0=C2=A0 fi
>>  =C2=A0}
>=20
>=20
> If that command is writing a file, the written file should remain in
> WORKDIR, not UNPACKDIR. I suspect the SRC should probably therefore be
> changed but not the BINARY?

WORKDIR still isn't cleaned between builds of a recipe I assume? While=20
migrating to UNPACKDIR gets rid of patches that were once in SRC_URI but=20
aren't anymore (or other files for that matter), using WORKDIR as a=20
temporary directory between tasks is going to be an issue depending on=20
how the other tasks are going to behave. If the logic using the file is=20
the same as the logic for creating the file then it shouldn't be an=20
issue. But if the logic using the file is just checking whether the file=20
exists, then using WORKDIR is an issue since it won't be cleaned between=20
builds of the same recipe.

Maybe we should go for ${B} instead?

Cheers,
Quentin

