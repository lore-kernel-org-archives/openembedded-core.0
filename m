Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F1710A1E7B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:10:21 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44934.1774523414813719217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=cvUZT1Bg;
 spf=pass (domain: cherry.de, ip: 40.107.159.6, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcL3hm6ytT+pZ2Ougv13cTHm5Q6dhU0SwruYVO5aHI8lKbLhZGdR/qXflohzK2koVLqi80FEF++HBYd1RZVEAl6Uc0by7Vm6LaUTU2NSt2j8OaqFJxjoF0LhrGQMIHGFASBz/257s2iLu98SCprS6ekEkrnD0H2cjwA3pllbUGV0o+tmDb88SOt7scUP1yGlszqi3k9gKCk3UUhh8AOl0d83iU72+juKUj70G6LQIMEY2Qqs5mSAdKI//scZsh3WAWWgftKAFpgfKFMWjgVtrbGRVoGjb7ZYnj4Qii+TURbrnGFT1DfqfeobOdJOD7rDLdxOJMW2hLFrXq7I2dVgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qR6jcFq2r6c2kMUh18yga31Co0/+3cSOdx4dmdm8jk=;
 b=cIqf70UnsHzgTzDCFPC4c8Y4ZxzKdfLV0jA41cmgNItzqvCaTpO5SimsnXoIO9pwKDFetRX3pvW/UiBEH+2VLm3MuNeeSze0SaEXKKaH3D+ARns0eTYTgDppxr61XVTtgyxaZEgVbcZ523nhXhWeDq/Qt7mZ3o3vl9NI0xIV3mZ0yixnfQ0e19vZZxYk66NYgEgQ7AivkO0nmVw75ELy1xCiJDkhZJXNRYWVAPrrmPw50IlMe3TNx1It1h+RrN1iXAMZyt/nTP/OyjsFYFwiqTuRIVtZwfa+w6dz5zj3EJDNqwBB7n/CBaXklN9oJMW5OPwb3rZYuia6mMCSFESzuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qR6jcFq2r6c2kMUh18yga31Co0/+3cSOdx4dmdm8jk=;
 b=cvUZT1BgQYSpvaDHba2uuyxJNfYCXiFacHavlPrOPf/uP3JQOIfD71hBOuiASFNASAToyWkBWKNaoCtKEQSKbA7Ipz8d4SUupgSS06fOf1rtZiUKLW7XwnDXd1cGoY0zjwMD05ooTRPAmf4z2ObP5w+p5/AunE56BJc3PgifsC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM0PR04MB7105.eurprd04.prod.outlook.com (2603:10a6:208:19b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Thu, 26 Mar
 2026 11:10:08 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 11:10:08 +0000
Message-ID: <5594e882-42af-48fd-81f5-39df6b800eac@cherry.de>
Date: Thu, 26 Mar 2026 12:10:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 7/7] mesa: depend on mesa-tools-native for less
 expensive libclc dependency
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
 Quentin Schulz <foss+yocto@0leil.net>
CC: openembedded-core@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>
References: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
 <20260206-mesa-tools-native-v1-7-166935b0e379@cherry.de>
 <yj4junqgkdaddl3upgyn7pzeqvlbr2q4a7zl6llrv2kzlbznlr@62bryfzytptx>
 <1a009ba8-4538-4dd5-a61e-5656852f56b0@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <1a009ba8-4538-4dd5-a61e-5656852f56b0@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0398.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM0PR04MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d37607-466f-4e15-d166-08de8b283db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	6Z7CvSEt59F+YLRiN+LqqDCInDs0xe/DcOTXBLPCwYhIUIKJAnTNcYRGNDojW2HYpG1WqID51tf7QxGuiZXuWVtOp76pKgUx3KD7KROasmiTK2Liv0Rpgfhic4NxKXb15q0K/S+RrLG3efg4vN2yb/Q5j2Dp/kAeG0BjZcMkhjROaPM6cF3HebbyCTlgNmj8xUs4lQkCErXvfx4xFhw/0ZmxvEv8cjYN2xHeZYiHte/bpe6lFfNdq0fqsbjoYjmUKztqBs/bA8DfzF6iF7j5oaf2jrzqoKrjqCou9VW6anYFenMw65i9e9pXRq4RTMLPK+FVBz1tRXFf5QYKmTwsLol5Oxc33nOQ8U6HPfae/N5TcMufgSaecm5vgM+IGCpGx5sSjQJKS2o3/aTRtga1BvwwBo1B8wBdKWfOmVr1EZcYZxMdGr0m50TxVNzWMssUZN3kxXtiq3levEXUzHR85ULEJrmXyaMgQB49X3KkvcuhmU9TR3mMaXPWSkpJaHvsul/U5t6V1/7OSdCiNDwdyNQ0OkQORWatlY7ZTqGUDJyrDkzpJrI1bjzgFIcFIMLJnNb7+swrugBWrGUB4ulBGn4YlHSTIBhO0HZ7tma1xwykyFXSQUtQuWFo35qHc/VFMjZbxGqwjKppC8OJ2dVvDrn1lXn6V30eTBUcW3Lg18NnxNRgAd+Ezk4mzSsrELWkLWrebRRGckG6UaKjYX7IBPyPOV0SJHOePhn5gI/PdCE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v+RRPDeIa0647eJF+ffdEA7BUwf45ENHuGAMlYKgET3AZM2Hva6wpMMo+6RW?=
 =?us-ascii?Q?bnjQnulOSp9fUg2LnL9tM/XnqbDimiBCGrYZudJHKvD/gG1PbwjQ1Z6CzJn/?=
 =?us-ascii?Q?10DN1M2L1jdE1B/SMxazZ3WxUjMlrsFSx2siXGPOlhIik2S9mh/wKxlPcVGv?=
 =?us-ascii?Q?BhO7ASAK7PXNY/RU9+Cpq8lYhFc4aK3q3lk0JPvQjqpG+xi4bpc55hSVSzMS?=
 =?us-ascii?Q?9aKUogmvfqjPPtMjZmjMenU1En8kXMqQUiSUmiDmEINn7Lg0rIYfGXvN37o8?=
 =?us-ascii?Q?TrmwV/6dECh7k0/SHot6x1bysCxmB931CuU/Ns5NFPZSlU9+TmpnDMMGmRzJ?=
 =?us-ascii?Q?JyyE7yD2hEKA2Y8atJVPL/7AKQMJp2bc4e2kpU2bnvSm0MZZRSXfI3WQViiV?=
 =?us-ascii?Q?gelnnmMh4OnS+29jOtbi7zGNqe9MEXyzFyZgFWT8y3bXxd3GLFl5Ultl4ggX?=
 =?us-ascii?Q?x0v4BsT4fTO3Y/BZYz+K1usZaaEnIf1GONiRAs4LR8EA0s8rPlXTnRynUUv2?=
 =?us-ascii?Q?5V1P75toYo+xFgMZUieszDhsRMiTuYpfFzeS0j1wCL/4GF1rnwvjwfZGU3G2?=
 =?us-ascii?Q?aJ3OnZfkPgP0svU+WBSVoHFJhCKGes92ghz9y2Sy0KbMiO25HOkGqb4YkxSv?=
 =?us-ascii?Q?YnhQF13KCi2jPqYa8Kp3g3xK9atYjnHe2T2I3Wr0NzCTvk1ye2ndjhrCUxn1?=
 =?us-ascii?Q?/i7mVZe+RrYizF1f/OXsm/7BNSQ2JC4jkyH1WE4qEdzu8RVTWcOiKDr3ZQST?=
 =?us-ascii?Q?nvjVq3g7JaZJzonpqj2/THLlruqvCLERYgKWOOB1Wm45vQK7/JY4JL0cfPvt?=
 =?us-ascii?Q?kGkZTMZccjPSimOrGl3r6adlMhqkMuxZw/SZm4MqjfLEMYNhbEm5BZxyefle?=
 =?us-ascii?Q?EIUCIDHdwQid+Vwo1s7Y8ihxKOin9APbABYY5WwHOMrfHXN0++McVjGGX9op?=
 =?us-ascii?Q?iR/VAKQvBBYb+SPhV5yoQjApCamVpRBOb9OrxK3pg3j1j+wB7MPxWa+FttxT?=
 =?us-ascii?Q?Ub8xVeOgaFXtd8/2MhGozsh7gjd7qFLGJMjmqNUECNte1EAApIg22CxrPAvw?=
 =?us-ascii?Q?jWaoxQSoPeOORHZmZDgOw54boDyZQXfW9GzhvDKOagto5WhkAlZO2nWeJdkV?=
 =?us-ascii?Q?TQYfeihHjGU+nkPy71Wl5skyxXZpKI76TiY4IiOAHduhV4u+QI1bagfnTzJ1?=
 =?us-ascii?Q?TlI0r2UwgczNMl0nT9iN65J9gNWODWuPNZvPXGIPi4Ivu9JjiK/CVzfpRNKt?=
 =?us-ascii?Q?DCyRiey6+3x/vE0V8PTj1JYovn7FadiarFuev2IGdgnDVGwugre4qTwvRFSv?=
 =?us-ascii?Q?haLCMycGFnSKP0vOCttSKIu06dPAy7LQRfTMJm96a/kvtnUqZHtL36Hp/AU4?=
 =?us-ascii?Q?cEg9XK1yS9Im21rbjyF0WRXBhHdvj/SJ/WZW9L5W1wk2dAiK+hPl7xd+qs06?=
 =?us-ascii?Q?P8xeRSvO301y0UKb7ia3lAN5c2hTPySV3AJfgZLONIaNe+uGwaCQ/lpe326A?=
 =?us-ascii?Q?MCume3Bt7fvBOEpRo4YMYy5EcozbvADdzCKkNWPuUuMcqkrMVPQqVgLM8BSF?=
 =?us-ascii?Q?WmudhWhHACqquoktVUsl5k3unKI9KSOMzkNhn4tKcE970gKBJjqkb2bQM6B5?=
 =?us-ascii?Q?sosjaff82T5Ue316LUB6bXWZQY632jTUm83sgOVqtSQ00urw2nDwL79Me9z/?=
 =?us-ascii?Q?dgpEvk709Nvr0yMJvujlzn2Y89AX1PRtTPMWxPCXFI+vYF26yoPnNlCtAesD?=
 =?us-ascii?Q?U+0KZAjicQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d37607-466f-4e15-d166-08de8b283db3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 11:10:08.6542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiIPYS8D2YY+wKSTGAw5IwNa1UY9BcR9M1idybhVF/u3ejEk9cqnXSnd34E4BxAt22/1tTgAAr8upPCQkXEV3aOGQUm9/40tTTllsnHdZHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233977

Hi Ernest,

On 3/20/26 4:57 PM, Quentin Schulz via lists.openembedded.org wrote:
> Hi Ernest,
>=20
> On 3/20/26 4:26 PM, Ernest Van Hoecke wrote:
>> Hi Quentin,
>>
>> Recently our do_configure task of mesa started failing with the
>> following error:
>>
>> | Program pco_clc found: NO
>> |
>> | ../sources/mesa-26.0.1/src/imagination/pco/uscgen/meson.build:7:17:=20
>> ERROR: Program 'pco_clc' not found or not executable
>> |
>> | A full log can be found at /var/home/vhe/build/tdxref/master-extint/=20
>> build/tmp/work/aarch64-tdx-linux/mesa/26.0.1/build/meson-logs/meson-=20
>> log.txt
>> |
>> | Last 10 lines of meson-log.txt:
>> | int i;
>> |
>> | Cached compiler stdout:
>> |
>> | Cached compiler stderr:
>> |
>> | Compiler for C supports arguments -Werror=3Dpointer-arith: YES (cached=
)
>> | Program pco_clc found: NO
>> |
>> | ../sources/mesa-26.0.1/src/imagination/pco/uscgen/meson.build:7:17:=20
>> ERROR: Program 'pco_clc' not found or not executable
>> |
>> | ERROR: meson setup failed
>> | WARNING: /var/home/vhe/build/tdxref/master-extint/build/tmp/work/=20
>> aarch64-tdx-linux/mesa/26.0.1/temp/run.do_configure.144042:173 exit 1=20
>> from 'exit 1'
>>
>> Reverting this patch fixes the issue, but it does not seem to be the
>> commit that introduced the problem. It only started later, presumably
>> something changed in pulling in libclc or a similar issue.
>>
>> I can bisect it more later but already wanted to ask if you or someone
>> else had any ideas. Thanks!
>>
>=20
> I suspect you need
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/=20
> recipes-graphics/mesa/mesa-tools-native.bb
> index 50d2f5cbb0..0fff6ef1dd 100644
> --- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
> +++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> @@ -3,7 +3,7 @@ inherit_defer native
>=20
>  =C2=A0SUMMARY +=3D " (tools only)"
>=20
> -PACKAGECONFIG =3D "tools asahi panfrost"
> +PACKAGECONFIG =3D "tools asahi imagination panfrost"
>  =C2=A0# llvm required for libclc
>  =C2=A0PACKAGECONFIG +=3D "gallium-llvm"
>  =C2=A0# Doesn't compile without wayland-scanner if PLATFORMS has wayland=
 in,=20
> and,
>=20
> and possibly
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-=20
> graphics/mesa/mesa.inc
> index 14dc7b6c51..44d3d17a52 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -137,7 +137,7 @@ VULKAN_DRIVERS .=3D=20
> "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
>  =C2=A0VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'broadc=
om',=20
> ',broadcom', '', d)}"
>  =C2=A0VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'freedr=
eno',=20
> ',freedreno', '', d)}"
>  =C2=A0VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'virtio=
',=20
> ',gfxstream', '', d)}"
> -VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination'=
,=20
> ',imagination', '', d)}"
> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination=
=20
> libclc', ',imagination', '', d)}"
>  =C2=A0VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel =
libclc=20
> gallium-llvm', ',intel', '', d)}"
>  =C2=A0VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel=
=20
> libclc', ',intel_hasvk', '', d)}"
>  =C2=A0VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfro=
st=20
> libclc', ',panfrost', '', d)}"
>=20
>=20
> It would help if you could provide the PACKAGECONFIG you're using and=20
> ideally a minimal reproducer so we can look this up more in depth on our=
=20
> side.
>=20

I've been able to reproduce and provide a patch for it, see=20
https://lore.kernel.org/openembedded-core/20260326-mesa-libdrm-imagination-=
v1-2-fe018f03be6a@cherry.de/=20
can you please confirm this works as expected? I only build tested it. A=20
Tested-by (provided you have tested it :) ) as an answer to the patch=20
would be most welcome, thanks!

Thanks for the report!
Quentin

