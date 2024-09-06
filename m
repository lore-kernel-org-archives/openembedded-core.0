Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C14E6FE31
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 16:50:56 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.52])
 by mx.groups.io with SMTP id smtpd.web10.3806.1725641450587272980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 09:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=ntp1IvHR;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.212.52, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ox76WUr9KVw1HxQn7p6v3r2qhD3Dwgu8N6hJeMBkmGwYNuYMxpHz5PH13tmP92HqC3i0oHnZfKPQgxX1vGm2zVT4LGCC6QzXv+SK6EHxlpMY08/kKc6QMRwXFAQ/uoGywicSBMshM+5WhVw4lOnJzEww68EmRYSvFVsm8Z1miiCtfBtIeSs/7A3459pvT9Qy7HFtsnYt1xzJa8HgrE1pQIlHr0gvlaMJcjYsukYXMYtQ2u4oOVEQLMg3imK3lX6MCsiyk+ub6qqL0rZZszFMerQOaoUc2QIzeyFZzRRjgKAKmjtPGGCp7HK5+C1kjWPU3q76vDrbO8/kSKejn/+/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85Du34lZ65f/HSfhlLWJt2vycSGPeEB/vhuVg3BGxGE=;
 b=Dr/jCm1llZiTOyk3BOU9H9ixgoolHvRXOpceu8PNjj7PpABe5TQtTwPnQso6ovR1OJkgH2uimM8etS9oZUeNG5Lqocd094GOhPr4CQrzhrh+F1nfO/OlOsawhwsya0LXn44pyH2OEzpgcIRc2jzRlnbzshY574C2nA4F4PiIJ42q3gW3MS+5czOZYtbK6fgt/GMnDg0s0wI813RHv4bW2vCpqvRkyblWWYucF/5doeLzLj/HaeRNNh13pdoSRtThlvwK9C/H51UAfThcG3iWRrOM/IrwwOU4DmF1ci6NsbtSP0Mc7slZas6brm/fCOk8QoOby+l5axNbX/GDaFsO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85Du34lZ65f/HSfhlLWJt2vycSGPeEB/vhuVg3BGxGE=;
 b=ntp1IvHRD4yF8Cl5nHxFOxYcKAyTEswEpSoQxAKHUcfXIOeGoaUHl2eyq+N8xVtUeisWdwOE/o7rxOHKptDoCcjLP689dgSWBzSvf3mSMnil9EZMqA9Nycv65YyC4sHCJO2+jpgxaq8ERWYPVVHK9AcgLv3JCO46lsDplLzZcz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB7018.namprd12.prod.outlook.com (2603:10b6:510:1b8::14)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 16:50:47 +0000
Received: from PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::5cff:1844:4c17:a0e3]) by PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::5cff:1844:4c17:a0e3%4]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 16:50:47 +0000
Message-ID: <069b9959-dd0e-4b45-ad6f-e4900a386eaf@amd.com>
Date: Fri, 6 Sep 2024 11:50:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gcc: Fix spurious '/' in GLIBC_DYNAMIC_LINKER on
 microblaze
To: Steve Sakoman <steve@sakoman.com>, Khem Raj <raj.khem@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <20240904052544.2082232-1-raj.khem@gmail.com>
 <CAMKF1sqN3U0uSv7E+5ZMOS_F+fWcax9Xm1xy+wOf1N-H9OT_MQ@mail.gmail.com>
 <CAOSpxdbhMHYFHnWm3LER+FNPOe9vK7ofG_0gZAeSHkga9kXAxA@mail.gmail.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@amd.com>
In-Reply-To: <CAOSpxdbhMHYFHnWm3LER+FNPOe9vK7ofG_0gZAeSHkga9kXAxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: YT4PR01CA0328.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::18) To PH7PR12MB7018.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7018:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 807acfa6-266a-4fd4-070c-08dcce940e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6KQLDcQVBqqMgKBkol9SXZgHK1/6C47MscHZWGf6t0L97hO7SUlNJt7Mvb6Q?=
 =?us-ascii?Q?+6+Zt1Pzg8F0oDx+R7YiwMCvGgPcPbbki7Rz5zWl76fjPUjIDkaP1/qv8ol5?=
 =?us-ascii?Q?DVmOn6s+k6WHy36AAMnOAF3slOGv7rL6eDFljJIi2U1lnQDszHtc0weW3EOm?=
 =?us-ascii?Q?2XEZ/Rj0Mb4lXh4eLTzvvkIizNzEGC/lVfQM1FG5viltoMGhkjUiZDO9h/GA?=
 =?us-ascii?Q?kjiCb5YbbHG6CQZzHGtSzbXY86LSyw6l6f++oflH/vgLGBHB/0u4IjMCmbSL?=
 =?us-ascii?Q?jkbAPzJKsww3oKRHTF2vNPYjMrPINZGMq/ZGHZI6ta2d0x6ed/D9Lya5XByb?=
 =?us-ascii?Q?V064qiHS8TCcz3QmOWp2xo6hojoCnt6E5uz4erpuJA4U5FZTx9t8/XWGZqEB?=
 =?us-ascii?Q?4Z/AOooyDZxkoUdMi8W7LCHKVUqEYPzkq5unGmLXZZhZjrmaGdIVEfGbzrV+?=
 =?us-ascii?Q?giObr6+OMbdplM5+ogx9tCPBMP8YMdk6LEqpDwHJf7VJnJxeNou7QekuLm74?=
 =?us-ascii?Q?ZEJ30ez0YdoITypfy/9N2/PWwW6KwqjIrwuHd7p6Ociea+INWbTwB4c2tj5k?=
 =?us-ascii?Q?Fse3geOJ3dSD074AdtmEGrgo8/+gaqgYYXV8ZlzmAVfKXMV9oqY58WKWRzMD?=
 =?us-ascii?Q?CgmgtL6vaR3TVLrNxFm+iNpJpmDok6GlhcXb2rZH0ZQHmKKKK+imppB+vF9t?=
 =?us-ascii?Q?QFAbfy3oY9Dgx6lEfre4bERVsXcTdUgk10k/dmprNVLCQ6Z7NiFYGtvixSOf?=
 =?us-ascii?Q?bexzjM+9sgLYHuGvJBWf1M7yt9dEh41Jr/LVRcX9CbWHIVQ9sDuEFGh/fyKU?=
 =?us-ascii?Q?s68NdzY9AGFm5f1R4+iPrcfQ2xXifwfz5ywnguU8YXAzDHvxGfeCsLPoop1k?=
 =?us-ascii?Q?rFOBLbLguNSTqQ9Vbi6WikSu1jOkg+kmifxEKZ3uk1KmBwVomq5oAKKVZKMU?=
 =?us-ascii?Q?XspUhb2SaYxT/Ce+nhBXM63ZDF57tXGaexzgW07KoTonG1sJajjGOqaVEKGv?=
 =?us-ascii?Q?ltORiP+g0xLcDvL8b0oBh/ceRWOsjfsvlWPEGuhU3urts2OcBUZkyV+KCrRC?=
 =?us-ascii?Q?NtawliLBCSO1HE6cArJUxrl4xJ2NQ/GaJPeYkGWjzw6b3jX2ccNFv24wY7rn?=
 =?us-ascii?Q?xSNq4BUgQD6MuNRnMLCU7l+YlHypeH46Ruq+QVeSIiZ9RksHme7tq4NDC5iq?=
 =?us-ascii?Q?hnxUWgsEzBJf0FlqPNuPFhplbdbIpqr/HerLBn97DKL++V0lqu/gf2WxuHNO?=
 =?us-ascii?Q?vyAkglm2trGUVmwgkvW8SGkYwYs8kk+MeSqSxJiedcY761EJ19aLfqQMsMh6?=
 =?us-ascii?Q?j1f1xR58JX8+DVK1PG4EQ8TxvAJ4djtfZ4gjxSzqoJINzQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7018.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NjmdGHHqbkAS1An27CZC2deDqdURIpOowUuC5BhC1jEPivBSL8DJnAZxOsrE?=
 =?us-ascii?Q?jQLqBU1bD3D8Rb+ONukpz1TYDoSgGwvN7jnQeKBwwhk5y/7knGV2S6Wh5KpC?=
 =?us-ascii?Q?62CLtb1/2EqOeXSs6j9HlsBMZIKAxea6+iLqa9q2WE2H3jpfTK34BMR1n+5j?=
 =?us-ascii?Q?aPsOlRKHG1khM8Q+WaXtx1ppSqQ0NYplShkF9mHK7rV4sQ8L7dRLN1ZCrxXQ?=
 =?us-ascii?Q?jXLEcYJ4mueb7maJDPu9tVm4u+CR+jJIioSQRCTXhrjZWzj4R24g6I5VKFrm?=
 =?us-ascii?Q?G+5gfWfZw+NtSD8JLZrstmkQVsN1hTSJqHQsNyUzrEc0HEoy92PAssEtA7cf?=
 =?us-ascii?Q?mtos4yPEQ+LBBciJ+wJQUE2PK7Q8RrApLCMYSoq3wFB9BJZDZSX95fZ33LqV?=
 =?us-ascii?Q?mGF7erpDK0L5gr4+edpRVksxjZQkTngwC/y0jJ43KaX10+TusDesHpHzLedT?=
 =?us-ascii?Q?dRBUrih9zWcTSXK7cdMH7Gz0qKFoQIvkybX9SbJq4Ybicw9dtgtps+OCk3JK?=
 =?us-ascii?Q?MGOCYFDp8Zkk9srobEgJ3czGTC243HCBcgDSx8ZyQFANMPJpeFqo/hOuZLDt?=
 =?us-ascii?Q?xzHY9eQm04AZ3yHCbR4S+JBtg5iU2+7kSScYpvYgrd0lDuYDnLI6UXz2Rc9K?=
 =?us-ascii?Q?6fcDZ+3dw7Irrokq659n7pvW/f9earKHW8vcL5EbkyrKefkIgUWc8FilR6p7?=
 =?us-ascii?Q?B4vg8ybq1NVIooQqWJfHVu3usxWmZOwOwJeg7Bi6iH6HpFo99hctRCakjOvB?=
 =?us-ascii?Q?twrcA0pxydcOSRP24nxrYhCIjFeXaXXBKZAtT7raIEBz2/gzLUlOjrFYOpGt?=
 =?us-ascii?Q?wMvmnu2KZeKTU2GjlRo+gG4q0pbtFjlXL1+yIQa9WacfzW9L7819Cu6kn/2P?=
 =?us-ascii?Q?hk8xWuNjXCXqmp2Ps1p6yQbeZepGHZH6x7jYkkzK+kf6yoJAYE0l+dJsHiYl?=
 =?us-ascii?Q?7hog0eO3lxXJM65M02ATE2cSG/ya3xsY+ExJFFJOTdQxqOPK1NoOih+KnjbP?=
 =?us-ascii?Q?VBYGOqePhUEiMTbHq3ibwLE2WPNm5I1F6bIkOyigJuG1gU0r28ZmxsXyCLHq?=
 =?us-ascii?Q?zHNrcYVZ/YKRI7QDHujg/TerX4Le90RcjR19uvnJsZigSMopuB4fCAshMMFP?=
 =?us-ascii?Q?W/b30+Wm9bnXjJI8XtD4BLm6w8ngYKyDo1CqMinbHyoAItLR20FRB1Hs2Rel?=
 =?us-ascii?Q?WybX8QF/g54qEo7kMQctukpWPu67jZmxFfIZGgJOujeRRvKGn3T9jydXdtAx?=
 =?us-ascii?Q?yq8lZ2tsiKIy01oArRjvC37cKRA2pYnwpeQJUet3+GVMlGfVfoRxZBfmnIe4?=
 =?us-ascii?Q?fr3FbVbTuvzkTZXRkp0R2bIyCMUxOP2ebUTs2bar48Txp/7XJjd9EDXp/rR3?=
 =?us-ascii?Q?RoYHelb+R05Ilgnip3xcIGySkEWTeCFGRUqjX0l5TLghjU0t/mZAEviMqDtC?=
 =?us-ascii?Q?LfsPYIohju/geGgCB7XKOTejZtehTYaJzxJJtfU9fgFcPXa7D96sCG1uxNKB?=
 =?us-ascii?Q?6Eyp1fA/fNrhTIwVZgvs1oi/mAN4aFu4PQzZEVb23+kteAUo/TvK5/aP5KjZ?=
 =?us-ascii?Q?EQjzFG1EBRmUG7OF6vPuDdI8+GN58NP2nowAQL5o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807acfa6-266a-4fd4-070c-08dcce940e23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7018.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 16:50:46.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFPmWa+xTFCS9iKwzwc0W4sRXjI3dzsnRZ+5zhIDtdnOiibBRRnUPOo1NCVm1qC9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 16:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204278

I'm not sure if I'll have time to do Kirkstone, but I will get this backpor=
ted to scarthgap and will send it up "soon".

--Mark

On 9/6/24 8:40 AM, Steve Sakoman wrote:
> On Thu, Sep 5, 2024 at 11:55=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> This needs backporting to kirkstone and scarthgap as well.
>=20
> This patch understandably doesn't cherry-pick to the earlier versions
> of gcc in kirkstone and scarthgap.
>=20
> If someone would like to prepare branch appropriate versions I'd be
> happy to add them to my test queues.
>=20
> Thanks,
>=20
> Steve
>=20
>>
>> On Tue, Sep 3, 2024 at 10:25=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Cc: Mark Hatle <mark.hatle@amd.com>
>>> ---
>>>   ...fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 6 +++--=
-
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LI=
NKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-De=
fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>>> index 6ff16e38e19..4ed55015519 100644
>>> --- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-an=
d-UCLIBC_DYNAMIC_LINKE.patch
>>> +++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-an=
d-UCLIBC_DYNAMIC_LINKE.patch
>>> @@ -1,4 +1,4 @@
>>> -From b597a2bc85ffdcf780731a44de02799ebc3d8f61 Mon Sep 17 00:00:00 2001
>>> +From 4067ae345f0ff1fbf37c0348f2af09257513b817 Mon Sep 17 00:00:00 2001
>>>   From: Khem Raj <raj.khem@gmail.com>
>>>   Date: Fri, 29 Mar 2013 09:24:50 +0400
>>>   Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKE=
R
>>> @@ -184,7 +184,7 @@ index e5d84e180e3..98cb49c189f 100644
>>>    #undef GNU_USER_TARGET_LINK_SPEC
>>>    #define GNU_USER_TARGET_LINK_SPEC \
>>>   diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/li=
nux.h
>>> -index 5ed8ee518be..5553e7cac21 100644
>>> +index 5ed8ee518be..299d1a62c81 100644
>>>   --- a/gcc/config/microblaze/linux.h
>>>   +++ b/gcc/config/microblaze/linux.h
>>>   @@ -28,7 +28,7 @@
>>> @@ -192,7 +192,7 @@ index 5ed8ee518be..5553e7cac21 100644
>>>    #define TLS_NEEDS_GOT 1
>>>
>>>   -#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
>>> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "/ld.so.1"
>>> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
>>>    #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
>>>
>>>    #if TARGET_BIG_ENDIAN_DEFAULT =3D=3D 0 /* LE */

