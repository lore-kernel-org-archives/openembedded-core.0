Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8387F109C03C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 16:35:39 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26884.1774456534941715534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 09:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=MWZqyDoK;
 spf=pass (domain: cherry.de, ip: 40.107.159.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mtsr6Qtpdgjh9KMfla+RxW1OpWgu3u9Pdipy5HQe2lXMYnmNyrbZv1MqhScquT/u1B5HeDc9JJ+y3m9BG0wyw0jBm1fCgq+4D8p9eA7jklQY6o0/c9SuToq5Yz+P8PJdLeHRZS47o0pfth2RHKb9exMsz8kXbs1AlWoYFdyDYyjFtmP7i+P3icaxfhejtKhDSjvDwOrbETVnoZcXEwfYwkcYG6zUhR/sPogrnzVqtwM5XbNHyM7d+y0GbSERmh00nXip5YMh9cNtkkEd3tnhwpw5G3R2xIkAiXXtiQlUW5fgfwVTrcAM8z95B0woqE4Ljs24Xx0HNWZc4AoJB39Hag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5fIPLkvYQPunJzBn+glT371Rk6hkKINPxpxSYLGbJY=;
 b=OIaplQCWP1hUP8f2V+mXaNJsllr1w1iQ4o3IvZ4URvl1t83PHhgcfgmK99aqo1WnKOkm+2CEg0gxbtdiX2sWLuXCkReVAk4TmJv5LOjwvwN/KA4X1oIJKv1Ad8CXyiXTHomI7xQOLOOJc+CMSTW95FrSuj3DwMNw2BMdmc30tRgfzG8dYg5T8AhcayMhwK4BHn8/lWArPwqfWn47rnxNHpyah+fKSt7P+ewZQcLIHjCKbwPHtOfC5cmZG/sGfcciIjNdnvCdMaeaM8Uw4b0WV3rAbIsuLXAHeh5ebCzSxPpGpEINQAUr5BQIx15t/BgvZj/9pvQjAuc88cNl5/mjow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5fIPLkvYQPunJzBn+glT371Rk6hkKINPxpxSYLGbJY=;
 b=MWZqyDoKjOFDXEYZRSo0w4IUOvSngyPczVSTt25spl9pmJTZBUvjdC9+xXOsaWdxxkyIBHsUfFkkNe3Do1RFZG+T0gKNG5U7iPfimClt1PZHgweP4b4PUTQ1NOKPf+n6N3+SfUeWcLKYGd4KiWYuUd16HnNNKxdXwIuY1eqcYFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8875.eurprd04.prod.outlook.com (2603:10a6:20b:40a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 16:35:29 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 16:35:29 +0000
Message-ID: <2bd9171b-cf56-4342-88c5-9de13b715903@cherry.de>
Date: Wed, 25 Mar 2026 17:35:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa-tools-native: fix do_compile failure
To: Khem Raj <raj.khem@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org,
 Changqing Li <changqing.li@windriver.com>
References: <20260325073954.1176537-1-khem.raj@oss.qualcomm.com>
 <CANNYZj9AkosvmmNePiALvwVkR2rsthvsGy3ARLTmWxKh=t7OaQ@mail.gmail.com>
 <CAMKF1soXSQxLU3eRCejvHH5HORG9xRMxObU+svnAdd10JAs37Q@mail.gmail.com>
 <2169b9ae-3e23-47b8-94cd-09f985f8c8e3@cherry.de>
 <CAMKF1sr+ip+swiV7JMsFjX-Gk8qDji-MVhmjJTB+wCUrQD7Brw@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAMKF1sr+ip+swiV7JMsFjX-Gk8qDji-MVhmjJTB+wCUrQD7Brw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f8f593-b76b-4961-9f69-08de8a8c86f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	W/bqAofl3OFnsshMQevT/C/7o0KmP6CLPyM7hNHfOe2782B8cnFEMlkLwwTqvJF/6DxqIUQw1lsjn4panh/C3DEDtKrjgiv4CplOA1wGWqwJBfmmiMAEdVWP/hKKbtY/g8dQ4ea5BfYx5qlfZmrqKebPCmyook3lCc+yVU+ekIu94m+oCRTwLcxwOMF2VA4oJ3j7fQvmUAiooLWYbtXt8le/ArJNZ0O6q7WHaWcqvqFsztjYn8moeNaeuPwzd/JYBYUmBdTsXcfTfkulrZohbCzgSryHko939QF5chGxV7TjrssGJkgnJvbpuG9ZvY7hrpL2Ymv39IQibSYfO8mAnYnh5bG20Jv0OW1s1nxU3YgM4xLk0g5TVQtMFmyyPTykAd4e+/9cLo+LbwEBQSVlleGF9/lp2amZQc4cBeC9m66H7JaQTuGxMPRrpqRN4BdHlpwml21s/+AzByBdwzl9NfFw4UmhMa4EEpGxQtT2Iv4hjynIJEhhBG7LyMIlkYHIPABf2OFNnGWcVQ+6iVAYvG9Oatvlh95KhJ3L3HIEHyPsfMQ2/qqq/gDHuV0zy3hN/7Z0F9I4FjHHWGLtY7evPhr5VSaCgqTZ7MrrblaTrHjCd7m+hQK8HabLOtFPtb+OgtxOPKje9Qa7WaK1nOl9tqNU2d1HUN8lYWbSe/IXEQuILi2DlM2CtYNzkRt4RrMk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?28D+xQXjPP2mZ7TjJZM7Lhm7vkpz3kjXknz878x42iOJrHFdy7hQAEawYhKM?=
 =?us-ascii?Q?Edn9br+sT0GkI9vmID/GP+Ug1cN3k1C3x64GCvPzlJsLu8Jg80PCPPOR9MGS?=
 =?us-ascii?Q?pmaucr2tAbsj5vUrXTa6/Xd9pByvySzlqIuBum7KAX8sWhRccJGhmj0cVtkK?=
 =?us-ascii?Q?6stiP6VPmaKPOkvM8bI1cp7lN94ldkvV545MBYf7dkgqfQSsJPX2nJO45MRu?=
 =?us-ascii?Q?6GIfQPzhDy469q46anDaYR1kXNT0Z+mhLK8CgzYh+TpFszrMP7MKweH5XONU?=
 =?us-ascii?Q?35xj6tM5UkcIpb42CRJZOhj7MIFYm+t1XR9BFST0Q/KuDvvD8lUzpE1tSvgl?=
 =?us-ascii?Q?wzSNtscR9Grn3Xul0uJNZS3KH/6HMnj0rzuvPI5o8cS9UkljMqGe56iMN00s?=
 =?us-ascii?Q?QcG9yJlQKYRtEI/bU6g3yroT7hz4ofe4LIr+G7w7DPIQDjOafm7pLjwfkiML?=
 =?us-ascii?Q?P1nTdlqlAwChoaiFD58fTPupSULZOZBYFCbCUkQDhJqijfbaCxlk//7pMDM2?=
 =?us-ascii?Q?npjFYQcouaMLnsSEx+BWcR2h13FjmlB0hUOVXRI04ml/93/Sqx043Kig/J37?=
 =?us-ascii?Q?KrcGcr6IEQh+H7ghB7o4fHaIF9SsmVR1g0o9e2U539Gz8+qTuKhLgQrVRsao?=
 =?us-ascii?Q?tHm33NM4U+rJMGuBcUaQMLAsPZShRfxITpPgw0A8JzBcoGoO/FLPevxo5hLx?=
 =?us-ascii?Q?kU0X/laZG/XFG2rhK4oMXcyVeV7DFYlS9+FPFSxWE3rXB+Uz85LnwYr62YBO?=
 =?us-ascii?Q?6v/XCs9RqQlG1A1NijY/t7hUO/Yp5cZ7s1+ep3dVF0OIAU8Jwh8L0dShMXhT?=
 =?us-ascii?Q?V9oX3WsK9/YUr55iNoE5ggLVlTjzYVvttCX3MQMDUH/6PScMZ+xXqfQ8VnaR?=
 =?us-ascii?Q?xHDiJcLICA3KjdT0QpowcZ10R0yXtB0m9qqtbBDli4w0S3wRDWnhaB3Or2tu?=
 =?us-ascii?Q?1kOuODhVrUfZ70fE7hDfCpNl7eYUhNr0hGA0Kozk3EzlwVOLK0cuM8WRjHCB?=
 =?us-ascii?Q?NxxnMei2xSY2m/LbTMRAo0z2394AvFgtGE3MXqxtQWZ/jInJBJ4sBwPCNqFJ?=
 =?us-ascii?Q?G+MGePag/TTSpRqA5SPqBJMnATaJGc0TbzX3FCgiHJA2LzHsB2ARSVg+/1KP?=
 =?us-ascii?Q?0FxhCQMHkO28eFS5mB/1MJWkPn95ip0+dch3zyenG8dPdX9DMFoRd0NjoaGQ?=
 =?us-ascii?Q?fegnmdDIWecqLtbUR6gq24Ntk/8a59DJHcK6zSwMOF0BCVlY/VjrsIy489NQ?=
 =?us-ascii?Q?PEGobdo2bR0KMUrWb6CY8MVNANXrCd/0Scs5EUzLS2rsLmgBRCJfGcA6kJi9?=
 =?us-ascii?Q?e8DI9DZTRGcQdYAz9L6H6U9Eq4f/Ol0ZginS92Rx4uu9Za5KOz1HDhl2ZD5B?=
 =?us-ascii?Q?4BsAQVj73zTYJ+7zYwigmcVrZLJ28terBLkJs1uAR2dPC5qCDcGqRMgqabXI?=
 =?us-ascii?Q?dsfcxJYS7aH06+vI5xkaj6qRk6RGTLFJpX4FUKXxc4fLeyb1e//RVkarRSVy?=
 =?us-ascii?Q?LzS+msNTK7Oj1XxH7aNvAUOZmZZPyTHh9esUzjcIZXEyazKgcwA+0DvkvgIx?=
 =?us-ascii?Q?8AKLBCB58VDa/dGjvQAHGdl39kgaqwjcHQG0BRoHHLRAizloMBwT+jugaJco?=
 =?us-ascii?Q?XcRbm8v5Ek9ckOesCG/3Y0BSM5XJlB/3Ly1dTA/MYZ3xBWUSuGcQkZjzPwfs?=
 =?us-ascii?Q?OKwoiRaGiUwA+qX8SQqjBNEOc+O7Je3Z0pYVYKN8lVxap2MawCRiuoq2ZCMc?=
 =?us-ascii?Q?IdS2UYvpSQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f8f593-b76b-4961-9f69-08de8a8c86f7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 16:35:29.8606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcxSeIZSq6PQtUScfd7yTROSQdiQdj4UaPwt6QWeTfvrvIvoRGdtiBdGqkE3UDRkkixWL6cssiXz3/pfXVGVo0oeooHg/knKi6vBzqYoM60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8875
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 16:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233925

Hi Khem,

On 3/25/26 5:26 PM, Khem Raj wrote:
> On Wed, Mar 25, 2026 at 7:53=E2=80=AFAM Quentin Schulz <quentin.schulz@ch=
erry.de>
> wrote:
>=20
>> Hi Khem,
>>
>> On 3/25/26 3:46 PM, Khem Raj via lists.openembedded.org wrote:
>>> On Wed, Mar 25, 2026 at 5:52=E2=80=AFAM Alexander Kanavin <
>> alex.kanavin@gmail.com>
>>> wrote:
>>>
>>>> On Wed, 25 Mar 2026 at 08:40, Khem Raj via lists.openembedded.org
>>>> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>>>>> Fix do_compile failure:
>>>>> ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal
>>>> error: xf86drm.h: No such file or directory
>>>>
>>>>> -DEPENDS +=3D "libclc-native spirv-tools-native
>>>> spirv-llvm-translator-native"
>>>>> +DEPENDS +=3D "libclc-native spirv-tools-native
>>>> spirv-llvm-translator-native libdrm-native"
>>>>
>>>> Should this be in PACKAGECONFIG for panfrost?
>>>>
>>>
>>> I have opengl-only image to build for odroid-c4 which does not have
>>> panfrost.
>>>
>>
>> It "has", due to building mesa-tools-native which enables building
>> panfrost tools unconditionally.
>>
>> panfrost PACKAGECONFIG may enable building the gallium driver (if
>> combined with gallium PACKAGECONFIG), the vulkan (panvk) driver (if
>> combined with vulkan PACKAGECONFIG) and/or the panfrost tools (if
>> combined with tools PACKAGECONFIG).
>>
>> So it's a missing dependency for the panfrost tools and should be added
>> as dependency to the panfrost tools (see my other mail). I don't think
>> you need it if you're not building the panfrost tools.
>>
>=20
> It uses mali binary driver not lima, and panfrost is not in distro featur=
es
> or packageconfig for mesa-gl
>=20

The error is in mesa-tools-native and you're fixing the=20
mesa-tools-native here, not mesa-gl.

You **are** building the panfrost tools, unconditionally when building=20
mesa-tools-native. This is a deliberate choice, see

https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/m=
esa/mesa-tools-native.bb#n6

I'm not sure what brings mesa-tools-native in the first place for you as=20
it's brought in when libclc PACKAGECONFIG is selected in a target or=20
native mesa recipe (excluding mesa-tools-native).

mesa-gl brings this in but only for x86 (see the various=20
PACKAGECONFIG:append: in mesa-gl.bb).

Quentin

