Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3548BC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 11:25:13 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.55])
 by mx.groups.io with SMTP id smtpd.web11.17566.1744716310499301912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 04:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=H/T2HEA9;
 spf=pass (domain: cherry.de, ip: 40.107.103.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcERVMMN0dO7WSnbwAijhVI82IwyuOBesJX4T1s6V9mzGwSqWZGfBTJjRlCtiNVAJHKWbp8BGdNjdbSaYFymFdgUmHOTqQiYJr05fY7Pwd3LjXj2t7WJveLvFuQ9M2b4pxnYRtSMEkrg73YlLCOOSfk/cudn04o6pN3TjmNF+G9dtgTW5jN0Qv+sE6ZrDHP42LlHb2STVSss+YXhO2tJhOG1w30aahWq3khRLL78FwdUFwak9368fkRuLt5oDqHrbZRTpTn8uSSBiISMw+lL0BtyzeVHf/vDZmbQHyGlFYI4+T4qUyhD4o8WdDHtapRlKu3G0yHAa3fb7veNohmDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZcai0qDs0NHtXObCnOIUg0O6qlHSm/cxM0NmlW3t8o=;
 b=hVWMwyBe6OMeitm5T6wo7E59BDoeXgNnKUivZa1zyT81k1j2tpljIAz10RYQuJ/hUouaE1ReA3IYecquxdc+xnoXHorHdzW0LmQJvRS2BSOChRBYH72Djw9G2jM3GSltXON+fTZxzAl0OUNtdD8mVRUSrx8MpYf+WugntUlhGAOLaKobzqtO/GFChAN+UYntHsPN7C4YnrfIGC6dnvUgUKNopvDJAn9DeQMf3cCvERxzbuNDZiKNbflvTJXpJ3jwUWe7Ofq3k9wjUBmmSwb9jBuVfzUfLYleZeVcQbWrETrKA/2VThx/DoRaYrgxg9p8If9gdHTKd/sFcKB+gCpQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZcai0qDs0NHtXObCnOIUg0O6qlHSm/cxM0NmlW3t8o=;
 b=H/T2HEA9w7GNEGGvpiWiJAxFbyYUJga9KwSfyXIguE5wwG1B60XUiAc+RiOP8dC5w7y5u2i/DXjbTGBlaZDiXk4WAZcEUE6HHSbr5xhMtyq25tUAw0vDRYWekjcU9WoQsIoWkBef0YuP/61C1ahwM0JmzWC/32hn3aK7p7Nmf2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB9759.eurprd04.prod.outlook.com (2603:10a6:150:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 11:25:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 11:25:04 +0000
Message-ID: <4d26bc54-f8fd-4fae-a507-0a219a2bed53@cherry.de>
Date: Tue, 15 Apr 2025 13:25:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 10/12] mesa: upgrade 24.0.7 -> 25.0.2
From: Quentin Schulz <quentin.schulz@cherry.de>
To: martin.jansa@gmail.com, dmitry.baryshkov@oss.qualcomm.com
CC: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Trevor Woerner <twoerner@gmail.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
 <20250410-mesa-25-v7-10-59d715c66e19@oss.qualcomm.com>
 <CA+chaQeWA01kB3q6=o4xcZwA1TMggHxYTZ0AZETY7he_yU3E1A@mail.gmail.com>
 <a3e99bef-5c29-42a6-8a7e-140b8a9db474@cherry.de>
Content-Language: en-US
In-Reply-To: <a3e99bef-5c29-42a6-8a7e-140b8a9db474@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: 29042242-10f5-47b6-fca0-08dd7c102ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?leU79kBpiBdCwdEif4NqblD43TZ4XlYFfbkdMrL1CEvrENAXORMaCVHBWSj5?=
 =?us-ascii?Q?RkTH05wz9wlJ/nbVlhHlTY+LtoRgQVnR7G2qaFa9SayGCOvF2VoS3uCj9Yjn?=
 =?us-ascii?Q?cpJilJBB8EZmkMjZGGn/x/+SEMPk4IgYtccvCxQqDDnLhRIzmwWjXk2BPasy?=
 =?us-ascii?Q?m+Z+bNHO6ypxylF55vdTPqapIRM63ZB+C4KPF9PNk/sFzA4o/TPEbYPvInFC?=
 =?us-ascii?Q?HEvgkpyKXwet3dF/QBKbEh+er4M3bvP19330RTopgNSUIgHVaRnKTr8oRpvk?=
 =?us-ascii?Q?0reepaupN5H++ljnSgyQXX/V1QXrk5xM/2Vsfs8uHV9eSoQuLGv6jGqHJCCf?=
 =?us-ascii?Q?Ro3ewT0TScPDvLZq2Tava+67sBc+iY9iXz3MAWo0tQB7BANiBnF68TVQ4sco?=
 =?us-ascii?Q?89QhcnPkCsrhdMEmwjTbKZCSUIwsDPdemTKNmUuMCTFivx5TkXUDmrziH1QB?=
 =?us-ascii?Q?OERP/W+F8jLVnJQ1HKkZefK/sRJoY9Gbj8Bb5DP9cO220GHcscWnMhqpDHSv?=
 =?us-ascii?Q?03x20wrdaRT9l317hyQTOyl5UIrzDUXwJAQKFCJ9Mr+9+y8cl1xQkOcxrsmX?=
 =?us-ascii?Q?RqJxccbWRzbb4niOfIN7TncM8tTC9/QWDSMO1CSrdH7DKXVHWL9uF2HbLCZG?=
 =?us-ascii?Q?Egs0r2GL2kzooIAfuO7JG//Up28ux35rfSzD2QYYtrTxI7TzzVUw8Ig1RaN1?=
 =?us-ascii?Q?/b83Ykuz7eBDwhtV1EQeTcb3Y+NozAy3PhpxathribJvd9E6Sumjig1zeNCr?=
 =?us-ascii?Q?I8iAblEGVAy1LXp+AkxWXIReqQz4MMT/rmvsgzI+1tvJY6p5YBW60jajJl/1?=
 =?us-ascii?Q?RxCySsC2h7gmSAll5AHrhwlDPUgtiddUWA1z3KUHQAiCqTIYyBISNXB4FUgF?=
 =?us-ascii?Q?GjfqCQd49dJnecKVukMCUJTu14nCSVXGv6yX4uDKuqoz4tHXtKaGpjGCYjho?=
 =?us-ascii?Q?5/JEosQuCfQAhYc9njYE7obB9t7A3aTX0zaqPeL9yrtUqya5B8/t210jy5PC?=
 =?us-ascii?Q?Yx3lXa7LLcny0uFXyYzChI6M8/GsJ162ONAtNgLjGQ9uQ2L+8WnyKMceCxst?=
 =?us-ascii?Q?gPWj4nSgVhCzPJMr4Bgk1duWuuf7njzAMkD+kV0Lo6eE2dRb5myzHcFsH1nt?=
 =?us-ascii?Q?bmbCJuQ5f+cZzxlADW9NdhZ27SPiGlojxrIjV8NHW12A7G9SW9iscmIvlyws?=
 =?us-ascii?Q?/h6OqDXpSA6f1pc8LS4ZyX0zmRTNp7GHvDQrLp64axMN6ojSBFd2dC7n3m92?=
 =?us-ascii?Q?51FCWAvRDuqhy6sC1T2qjiEbIc9k5EhUAu3MyjWvk+nFAjit2oxUoSw3RMDh?=
 =?us-ascii?Q?luLxfbFb+0o14WcgrLiBmGXUrnJ5seuf2xnUPZ4g8jZUmDHilbPgcKNOIN+h?=
 =?us-ascii?Q?X/BCUSk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?shbIfJo8Iku8PlR11fsHdZfLRo1leOwV66zl4u3WGnN2wXMO0EBRpWAp4jQ7?=
 =?us-ascii?Q?KoZt2YPXu8vX+96y4T2VJznrMXUVnY8Pal4p5JLFoZ4UB90ZPUd9O97100Wn?=
 =?us-ascii?Q?YvlysSVD8fFRI4CT/DuqabRQaxkpNMROHUZlYsltMKFHfL6wx1LdcRKEGrwS?=
 =?us-ascii?Q?Kfc/2ADX5v1TNZKXoWb5E+74yhy84mm8sege84fTJULal2gFsl08k1Zk7DAU?=
 =?us-ascii?Q?oZTQbpeBUAwWmcAL/CaMmbb1KVqSlRMRuUewYFixSqgpsByOQm5A3HrVTi8f?=
 =?us-ascii?Q?8TB1OkJ6i6nDJ8OnO5VkCmBQQwT7/QNFv9C386JgemnHDaKj5uU7VdvfDxE6?=
 =?us-ascii?Q?aKtBONSmYaUdrCq3BdtQRUiDWVoFxRjawFKt+ed42nH7YTrS0ANVCNNigvou?=
 =?us-ascii?Q?op/dYsN/ZSjJuhlQgP8yEBsOOlaViRFf8/YcIW0haWCoYMba0z25C2KMxsMO?=
 =?us-ascii?Q?XRLGhdx+uRGp66ropWOOMz8ka52k58PYCIx/Vlvrv0IiJTyB4QhYQUWDYzi9?=
 =?us-ascii?Q?9wnWJBUBo1DmYc8iM893mkpY3qzrXkX0UsoQG1XBwpbqfGfdqxh6ya/8CjQa?=
 =?us-ascii?Q?XnsJoMHMC3gbxyqNLPiqg1Imj1/UzahsNMHbvnEUPhv3YGpDgu8hBz3mvUvU?=
 =?us-ascii?Q?gEp7UpGnY/nPjDjawpxZkOdIAJM03BN2pgTJ4On7WsN3NQSMQ4gaa8D2VZh+?=
 =?us-ascii?Q?emnTb2TMFckTYH+5i+4ncgog7m7PSmWkkl/soRYPMwRhfAuxheqUFqADdQ1n?=
 =?us-ascii?Q?WZ87WIBzoS4Dc2/fzXISa3kNTv1NzYAGQX0zqnCbskGm0ksRS+j9iEqXkAqP?=
 =?us-ascii?Q?eeaJQ5POHLc07T46rhZ9vVk/Shmr+EhlesUzf45qr/zBMBLrvvMLiflBRNzk?=
 =?us-ascii?Q?UMEtemrPlTovgpuidyeGk8M4l6APb/HKQ8GzaXZhQ7ZErP0YafMrdgV4Af6Y?=
 =?us-ascii?Q?gmnKsmgYQzYQ0xnReSfk0pYfKumd0zI+NsditaCEoTmmVV35WrGoAn+XIwqf?=
 =?us-ascii?Q?n2oDVIq/f78mxBMuHb0j6RGv9V7CiU3HPOz/03UNDIAJAbwGuBCRx5fLWYg8?=
 =?us-ascii?Q?poh/ZQhiWL3AQts/scxPuM7+xKBBD2S2PneqUPgElHx8cOqoWJiZpkjeynRk?=
 =?us-ascii?Q?iH/XdYjsO/zTxdI+Jm8oMKouTfD0fBj+cx6HbCyBM/e5L110hZDfKISXmygN?=
 =?us-ascii?Q?d6Ijmdhok1Jmu2Iv7TZzTuqjLCw+nlGU8Ct5QpJYl730YTLoUtIcgcsBGaZD?=
 =?us-ascii?Q?bHJkzTjriwbxz9DI0UAgoS7LdfhMqyLxSD5YqZuy4Yk1UW9E6RvHjN7GoOcx?=
 =?us-ascii?Q?aHv4VMtJhU3hlOehNUADSP0jbQQHIBqEEN8M5W/5iN+gMilP5UOKLLFIqZbN?=
 =?us-ascii?Q?9vzbgs2xFvyp5kC3w1gw6VDBdLe2q+fZHQEzN6aiB8bhwuoaT+GRrMYHeVEe?=
 =?us-ascii?Q?wDgX1JuViPWI2NRnf7kCkOV4Vbj82XoMzoU9BOfjmWGSG7e7b/wQiKk31TTq?=
 =?us-ascii?Q?QySmF9iE3+WFtOZTgQyC/xwXEAdSLIP8SRbU6LE37IwKht5KB24GldQOaFT+?=
 =?us-ascii?Q?3XUhy/h9m4X4HJeoecU57a+PuG2Gt6m+XE6QZC3rw8WbRYNpoGunfcr7DWkP?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 29042242-10f5-47b6-fca0-08dd7c102ac3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:25:04.3889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypbURRJwix9BhVv+TkeoiK69zuxI41qpB6g8cUJbsZuH8vhFO6tcHD5+LjXRsYcS1a1wCc3MYEAugedNCDFLqXOQgdqtPfGX18ljCNkWWKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 11:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214842

Hi all,

On 4/14/25 1:09 PM, Quentin Schulz wrote:
> Hi Martin, Dmitry,
>=20
> On 4/11/25 1:43 PM, Martin Jansa via lists.openembedded.org wrote:
>> On Thu, Apr 10, 2025 at 4:55=E2=80=AFAM Dmitry Baryshkov via
>> lists.openembedded.org
>> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>>
>>> Upgrade the Mesa package, dropping applied and refreshing outstanding
>>> patches. The dri3 config option is now gone, dependencies are merged
>>> into X11 deps. The swrast gallium driver has been split into softpipe
>>> and llvmpipe drivers. Reworked OpenCL support to use mesa_clc compiler.
>>
>> Hi,
>>
>> looks like kmsro is no longer valid gallium-drivers, the PACKAGECONFIG
>> should be updated or dropped in this recipe:
>> meta/recipes-graphics/mesa/mesa.inc:PACKAGECONFIG[kmsro] =3D ""
>> meta/recipes-graphics/mesa/mesa.inc:GALLIUMDRIVERS:append =3D
>> "${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
>>
>> and then removed from enabled PACKAGECONFIG options in meta-raspberrypi:
>> recipes-graphics/mesa/mesa.bbappend:PACKAGECONFIG:append:rpi =3D "
>> gallium vc4 v3d kmsro ${@bb.utils.contains('DISTRO_FEATURES', 'x11
>> opengl', 'x11 dri3', '', d)} ${@bb.utils.contains('DISTRO_FEATURES',
>> 'vulkan', 'vulkan broadcom', '', d)}"
>>
>=20
> We also use kmsro in meta-rockchip, c.f. https://git.yoctoproject.org/=20
> meta-rockchip/tree/recipes-graphics/mesa/mesa.bbappend so that too would=
=20
> need to be replaced once this is merged.
>=20
> Cc'ing Trevor so he's aware of that.
>=20

c.f.=20
https://lore.kernel.org/yocto-patches/20250415-mesa-panthor-v2-0-a7850d0091=
fe@cherry.de/T/#ma90526dc898fabe6b29644c8c6bd8c6acdbf5653

Cheers,
Quentin

