Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C4EC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:17:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web09.7479.1645622269829293159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=XM7LkXci;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.59,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSYmX0i5G4JRIq74NKFXVdS7ispEiHXLUK3hW+48Q9zJ6yNSsl9gofWeQYxrz6OkmO7UeyGI4ns4warLPQbK98cXIBNkmOqixY8o6zv0mOTpECs4UsxO/BSkej0hICJV35+LPn/9Dh1gYysgorePtRKgc/UZ1CUNiOAVrvO392jCui+gISY4Do6zVyTGcG30AZCEOD5Hua3vyuKnedrP9H5WG0eQ+KAWyuSgCYutnoMlvdSXN/Z/fRq/ytsB6s3rniGgXaOvnz+obAHVq+BTk5oBPEHFztPvQ+ONrYfUffvnc5dH4Ty5+KsXb2qrQ98kimWU/otpuEoR1LsVaU5t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBZokRzezToFwCIouVgjIPA9ByiLPFrfQSfWQomEqgc=;
 b=f8PitwNMzQQd1TQq+yInbSyt3lP9naOcqVwOSwfnn3On2PRpIV5Yci5HtENzhWjeAwHhe8/9XEIzpONoLK09H/GlHPB3rkSbjiOtohRtNsurKu9hPCVP7chh4UdXZ/5LWbCDzBig9xb3cAOleenz5KiXEXfcOlnpnVelZG8KYvJHfSrK8/t5370GmqKlpAJh8KHElLbuNAUejZpyh9by39rvM+O8qgIq9cfEuHzS9OpAIscBilQVFvtvWXQha4vG+FamYAejRU1vHUIRaBm/Dszyt5Is2JC3hOC1VxjWqoHMNhvJcCZ0xHgVVCGA2kZJL8SmXA+MmGhWwAINCHphBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBZokRzezToFwCIouVgjIPA9ByiLPFrfQSfWQomEqgc=;
 b=XM7LkXcidEwuvVL4NlF2CuZvYPhwV8UsQ0OSotf8ePtA5aI7iY6uxa/UR3ThMGAAIVX9ZvYVY/zIZy1cRRU1bZYvgpkpMKh//axt1LqaPze7v20kQz6+/mmxs4EYeX35zpXQ2176sM1YfjI2z0igE3z7sJU3iHTngjr/s8f5SfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM0PR08MB3763.eurprd08.prod.outlook.com (2603:10a6:208:109::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Wed, 23 Feb
 2022 13:17:46 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 13:17:46 +0000
Message-ID: <2d28f6ce-213b-418a-df40-2465579931f3@weidmueller.com>
Date: Wed, 23 Feb 2022 14:17:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <7b788487-cfaf-7d47-2697-6ac692cb7b5e@windriver.com>
 <7764a230-888e-f92e-538c-dcd536e300d3@weidmueller.com>
 <2e481fb7-360c-890d-b651-4a83af7b11c6@windriver.com>
 <f7edf748-fbf3-ac39-69ec-69c9aebc79ae@weidmueller.com>
 <78b7ab98e425456c7e5b1e4fcfeb16596144cc41.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <78b7ab98e425456c7e5b1e4fcfeb16596144cc41.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::29) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0ca4037-6edb-4af6-8cfa-08d9f6cee17f
X-MS-TrafficTypeDiagnostic: AM0PR08MB3763:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3763DEA739D1ACC59C6FF3B9D73C9@AM0PR08MB3763.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Exh7URl8+9AP1q/M32SQsRgwwjcfv8vDqYWfoV4j8/Jn7AArC4hWOV2UjwbcyKD5sUh5FWd7exybyk1QRvb8VPwvLpJVi0WDMq0yiu95kJtxk00J9zlino7RpxRI3OxhDdh2oU6ZB2qzmaSM16ZR/YGcynO4zR1jWrljaDHrbYG9z6/CqvmhIyUYT71Ph6AFxKsyANI7GVt0MhPjXL+3pgPa0p0GbcQByl0eKedX9pg2zCN3ZirKjUoPlL1UYnnz0PfIRYqMafY9Jm6ZVZOLzMlSxw8G+HeIf+TOJXARJTr6FKHi3snmmP0MXZXtAe5Kuib4KdMjvzLeCJY5xk9g8ImUoqwFHZD3RvAg9wsf8LDvEJ4gidQ4MfwiOpD3AIXGCZQ202i/Ibt/FVUVSEmv6v93UQnwR0lQ7j5baiUPfH2ZfT983OAEuEuZBe6I4fr5gbMSqxx/YO41k/p1/fsi34Nj/02DqzAq84OfqQYNb/kRFtmWK8UnFpclxdjAL2dKd3YDLm/32mGVJfGbcY+0LKopArbwa05QHDWcj7hGdAYC9CWAqeNh6ejPkjdWptPjQR3S4SoL8N8kd9APwM1pFcYK5FkHaFFns3oaikt1iIyJEs0zaLuAs0A/Uw6zvlvH9V0b2ysQ8ZsefsSYm8MwshQmqh84VvNXuziQFmPJf2sRrTXX2Kst4LQAuaZeC9+V/ZZt0mGzDCjMMkJjAZmr9nI7L1YVBHWZf2Z8PKUrUQNA9PawuZKu+qvj3LRVyeQH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(6506007)(2906002)(52116002)(5660300002)(53546011)(110136005)(31686004)(8936002)(36756003)(8676002)(66476007)(6486002)(107886003)(2616005)(4326008)(66556008)(26005)(66946007)(38100700002)(38350700002)(6512007)(31696002)(316002)(86362001)(186003)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZmHXFEUR1+R8EQ3fuQ02RD+P+oAVq8re+5EzfdBYq0+X7stfr57XLSABYNS2?=
 =?us-ascii?Q?WlaZYpUV1ighkK9KlE2f6aV4ffbcqwMzMi4oGpGS5mOxattIDZtVyZkn8VnX?=
 =?us-ascii?Q?dHT2zBBCUzsOtEhaheDq4pWMKbfW7sKDWykvezpUR9+B4mQhtP6Y9ezhkpWy?=
 =?us-ascii?Q?BsvWulrVx7EOuQ0yTSiXdcHQZabjvy8w+0aKYxFn3trMKBFtH/a5iEcdA4zU?=
 =?us-ascii?Q?pbmzWIG0phDAR5lmoxlmHQeWTWEm/N7z1SWVrWEOgmTN1k//ziMxSQ0fDtTB?=
 =?us-ascii?Q?2eTz7IdmbC8bLFACduSFTKJN8tPBzD8Ww5E94jdReB2KEqrv3zRhn1MeVC58?=
 =?us-ascii?Q?a19+j1MGbNH/d/D+2UDW2yKPH1KkOhE/cY78J+mFqZb3Mm8Bf+lUNn1KD2R1?=
 =?us-ascii?Q?JGxKhVCN3c7H4OxLedZx253ee9kq4t1X0n6XGc+N4pBCjZRfpyEAtjyyCdeZ?=
 =?us-ascii?Q?7tpr4voW6l6pqsX95B1sgfSJxFreBPGFN9ixGwENCVZfXiJrXyw8MajJFUBP?=
 =?us-ascii?Q?qjjizgQzNtsG2LV2ZMzc5rF05f+OobmuU/W7oD3J/olC0MWoMWePLWVmG/cA?=
 =?us-ascii?Q?c6fJynwVtODMNpoT0S/1mKtFMD1UFtFtNxlPdzp7ZXY7TqowLZLEC6HgoQ4M?=
 =?us-ascii?Q?i8PSpTlycnmCqAoKmzjwKKOvWs505QUKYEwZW/a+aHGIBSTrCBDXGht/ZU5Z?=
 =?us-ascii?Q?nl/YgVc2V2ADSq6zj7abD+iIqGQEWKUw8hTiXR6SYgXqwK9kd5zUlaSBPllk?=
 =?us-ascii?Q?pgp3RWyqb6h51938gQRLv/fABNtBtHK+fQm7RQhxKe7gz5kCPh7OhiDWPkLx?=
 =?us-ascii?Q?MaGa+wJZ//ick4s6HbJP3h6v6Gdt7o401mq9AJ13x1Ux1O/VXAekUH4QaBNm?=
 =?us-ascii?Q?pGdur5j8BrR96zZLMQ7CqLh8p4ngUQxaU1iuiZboPex7767zmMjbmknyEQ/Q?=
 =?us-ascii?Q?nui9+AD/n4EN9gqTjp1avBE7aZxlf3ZH7T2PVkJvChGJWBbpIwDs8uDvmZOj?=
 =?us-ascii?Q?VZ9TAvWDi9JuHy7/ENY2+WiOuNsUsbpsQDMM3GnGBKBPJYAIhWMmHSU2zu7Y?=
 =?us-ascii?Q?qv0rK9zjhAfW/iQIC4CBypB92SV9KKPZPuQuEEL9qvFjAYBUL2FBWl30zrM2?=
 =?us-ascii?Q?Fd72QVoGQFqHkFaFkoNKsSxR8tIpyC2LQzaNDwlzQ99TVeoOnQp2qL1srp3x?=
 =?us-ascii?Q?lqjdKQYzjBTjiMmodfnEA2leWE7e3nOoN8ivcITe6/hBelm/MUyuzqn6ycp2?=
 =?us-ascii?Q?G9P3hA/ImatCJTpDZc1uUDnAUQE206QzF4YHRVRdXvIdE1r6EeoUE87TfgM9?=
 =?us-ascii?Q?CCa4zrQ1PfEWQuHV4tX31h5iv66C3hkBDgbcQV06JJJTx4emCq4Pi56TODhQ?=
 =?us-ascii?Q?X0Yzrns9QB7A+g8jTKX4BMKL1a1jmxVT6bPBYe4xhWl1iS3+uYkyVnznql87?=
 =?us-ascii?Q?HBpIO53roRtv7zgpgyh0XwOK4IYWmSUe75RQ0XWP95mkZ25BIbBfOsvL2xAr?=
 =?us-ascii?Q?AxFNGY13rIMOQL7/fWlHCuUBAp33+fbFwWOShEJTzpR704b7rvCGseb7qz+5?=
 =?us-ascii?Q?JQTsDmwPdhEoLDBk6NiHjwuidKirZKb2G64n0QIga1u1exu2YjHHYa5rHUqm?=
 =?us-ascii?Q?tZXAS4U8MjVQ4usP5vpZEJg=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0ca4037-6edb-4af6-8cfa-08d9f6cee17f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 13:17:46.0157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pUKnHEX8WeUqQx1d7gUbU8VAY/1yOc0smHlmbDsgwAU/gXd9l9b4D5bMU+SqaO+6PZ2CUHuqG28dgOZFXL+WRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3763
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 13:17:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162264

Am 23.02.2022 um 13:39 schrieb Richard Purdie:
> On Wed, 2022-02-23 at 09:13 +0100, Stefan Herbrechtsmeier wrote:
>> Am 23.02.2022 um 02:49 schrieb Yu, Mingli:
>>> On 2/22/22 9:26 PM, Stefan Herbrechtsmeier wrote:
>>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>> Am 22.02.2022 um 10:20 schrieb Yu, Mingli:
>>>>> On 2/2/22 3:35 PM, Stefan Herbrechtsmeier wrote:
>>>>>> Link udev shared with systemd helper to minimize the udev package si=
ze
>>>>>> if DISTRO_FEATURES contains systemd.
>>>>>>
>>>>>> It is only usefull to link udev static with systemd helper if udev
>>>>>> should be installed without systemd.
>>>>>>
>>>>>> Signed-off-by: Stefan Herbrechtsmeier
>>>>>> <stefan.herbrechtsmeier@weidmueller.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> (no changes since v1)
>>>>>>
>>>>>>  =C2=A0 meta/recipes-core/systemd/systemd_249.7.bb | 1 +
>>>>>>  =C2=A0 1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/meta/recipes-core/systemd/systemd_249.7.bb
>>>>>> b/meta/recipes-core/systemd/systemd_249.7.bb
>>>>>> index 739f3aae86..431781e6c7 100644
>>>>>> --- a/meta/recipes-core/systemd/systemd_249.7.bb
>>>>>> +++ b/meta/recipes-core/systemd/systemd_249.7.bb
>>>>>> @@ -66,6 +66,7 @@ PACKAGECONFIG ??=3D " \
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES'=
, 'acl audit efi ldconfig
>>>>>> pam selinux smack usrmerge polkit seccomp', d)} \
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURE=
S', 'wifi', 'rfkill', '',
>>>>>> d)} \
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURE=
S', 'x11', 'xkbcommon', '',
>>>>>> d)} \
>>>>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd=
',
>>>>>> 'link-udev-shared', '', d)} \
>>>>>
>>>>> After this change, the iso image failed to boot with below error:
>>>>> Cannot find rootfs.img file in /run/media/*, dropping to a shell
>>>>>
>>>>> And more detailed about the error as the attached.
>>>>>
>>>>> Steps to reproduce:
>>>>> 1, update conf/local.conf to use systemd as the default init manager
>>>>> DISTRO_FEATURES:append =3D " systemd"
>>>>> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
>>>>> VIRTUAL-RUNTIME_init_manager =3D "systemd"
>>>>> VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
>>>>> KERNEL_FEATURES:append =3D " cfg/systemd.scc"
>>>> You have to set the INIT_MANAGER variable instead or set the
>>>> VIRTUAL-RUNTIME_dev_manager variable to systemd.
>>>>
>>>>> 2, bitbake core-image-minimal
>>>>>
>>>>> 3, runqemu qemux86-64=C2=A0 core-image-minimal=C2=A0 iso
>>>>
>>>> A revert of the commit solve your problem?
>>>
>>> Yes, the issue is gone after revert the commit.
>>
>> It looks like a loot of packages have a direct runtime dependency to
>> udev and after this patch udev have a runtime dependency to systemd. We
>> could revert this patch or move libsystemd-shared.so to its own package
>> to remove the dependency to systemd itself.
>=20
> A separate package for it would seem like a good option and could smplify=
 the
> original issues we saw enabling this too?

I think so but it will increase the size of the udev package because of=20
the size and dependencies of libsystemd-shared if you use udev without=20
systemd.

If we create a extra package udev, systemctl, networkd, timesyncd and=20
boot could be used without systemd package.

Regards
   Stefan

