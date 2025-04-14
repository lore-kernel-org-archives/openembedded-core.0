Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675A2C369B9
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 11:09:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.38])
 by mx.groups.io with SMTP id smtpd.web11.47318.1744628960252848193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 04:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Fb71im1W;
 spf=pass (domain: cherry.de, ip: 52.101.67.38, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYWhKSBZbZXsfhVZmCaXTmdAyDqq33C8ZHSQxweis8BO1BcbOz6XDiOyiZBm34aSf1vDj5SDpuAxtHXoWQnFJq75PANxyuKyVDmRcKddtl+snbBdBMiFU3QJABbspMF5DrG+2iBsUiU35c6ti7oneom/bUV5yLEdBGNJ9ylc/5ls+A1sqnn+wXWFoV5c+RnL9tlWgia9gm2z4xJN1Yb+5gPJgy2mnkVwb7iGkPIBS6uuaIvK+ROwnqraXTG1KfmpWTAY4RRKtSN5NwgPUsVEv12cMUEe5s3iqF+i+h9tTEQZV72dbW35kTefhwKx+8eqfm2aoyOUUVs2OgTAEN/nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBq+62AO2iBT6DrbTHNnrRkbFupEj6zLdvRsQmFveFE=;
 b=VApIZMs1tF357lIfBrZE4zXv9ZGAgmzPfktI+rkp4DT3k5D4nV/FPvMzfKY2iiBaOOiGHavoy+eGco5atx/4lk4ZfrUJZZpRP6Q2hTkQ/puxiHIQf0zHKS8m7ooEXqjS0IokQU04avoWXRwplsyehxD0cqPcVsdYq9OaQRKc1JZb0AGTUJtgcvaEx9QatJ2VSCf4xlqhzMUBbw06QxgANFPKZ8O09oiVHhfh7BQSzTReuN6d1JrFFLMBCLHOSt+obsQADBIPEZvOedmnCZLehBmKOCa20XgDUaXIuzLWnOGVxG07EmlhjJcfwzbDiHb5N4gTMBNqgSEJwlL7djMzkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBq+62AO2iBT6DrbTHNnrRkbFupEj6zLdvRsQmFveFE=;
 b=Fb71im1WGUeHJDMbWV1fv+QdRuQwHwUxt/L9Y+JK+a8pu87AHuxrqh807zhsdYiZav1RBUhrahOM0CP4HwPtKuuGLJ+5GpdZjrfZ909I9IvedPX2aMdEzF5BFxfJLXPA+Vv7nM+FyP42WkzU8xJ8r5fPmHq+51ddkOH0WguBI/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9269.eurprd04.prod.outlook.com (2603:10a6:102:2a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 11:09:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:09:16 +0000
Message-ID: <a3e99bef-5c29-42a6-8a7e-140b8a9db474@cherry.de>
Date: Mon, 14 Apr 2025 13:09:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 10/12] mesa: upgrade 24.0.7 -> 25.0.2
To: martin.jansa@gmail.com, dmitry.baryshkov@oss.qualcomm.com
CC: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Trevor Woerner <twoerner@gmail.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
 <20250410-mesa-25-v7-10-59d715c66e19@oss.qualcomm.com>
 <CA+chaQeWA01kB3q6=o4xcZwA1TMggHxYTZ0AZETY7he_yU3E1A@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CA+chaQeWA01kB3q6=o4xcZwA1TMggHxYTZ0AZETY7he_yU3E1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0251.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: aa572ba0-1dba-4840-6e94-08dd7b44cb69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qnr/a0savoYIw7ACNwGgoAhBHvzCZi7uL2af3B0yts7/19G4W+AFvaq3FddV?=
 =?us-ascii?Q?0o7/1tA+JK6/Mvo/PHPvT60auem2dbkxCLE+EnBPENRK1K7DOEUUHmigKEK+?=
 =?us-ascii?Q?ihd5ldbU7sqX+vDMoa85XTeyJfdYUVodXRY0dytT5cBpBDbVXIXpqafIcjwS?=
 =?us-ascii?Q?E8fWChtaMebpAVx7mAwbqTDOihO+cITGUUzf47iGS78VbHfXqWe4bq/eoBxs?=
 =?us-ascii?Q?s/43HEJPWQuTKeZDbM6/znduqYhm7W40MHr/a8D5urp7FFDFH6fYQyBH8ev3?=
 =?us-ascii?Q?HisfkjHfU162vs0rHDChLao3+Q+m0PLvOlgjV6cZESD6kEm/zLANokj8EOpz?=
 =?us-ascii?Q?CaRXnPDp9afbPQUbebX8O0N3KC7ElVfFU9nAVP/zdjKgKm17HN4hQrVG9K/i?=
 =?us-ascii?Q?hf4PrJZekafR+6r3lN8pzqOXeuRWKqoH5/qw9W1CDaZIFS2fiMVBxdH94izx?=
 =?us-ascii?Q?bxauu9caOqyWmTp1lLXz7+H3zvC1fRdHrcKiykK7CbAmoaFgaL0kyUsKZdUA?=
 =?us-ascii?Q?upfjsHqb5+QdMJ2uCAIxd9J3g699KdshyqwD0du/P4h8bN5fnal8FA3I32m0?=
 =?us-ascii?Q?DwcPAsCmq953+689MzbJ6t1MxBVppfRXZ6u5w5AhwVvZ3EfinCNremSj+jcy?=
 =?us-ascii?Q?fVrNN53dZwi79kSaJBH1/BeuZK/EMJD6xHs6X21nQnlXMb+ujfGl0kyU1MIo?=
 =?us-ascii?Q?W/HYBBOQbo1Ef5IT1c4dbqg8gLlVvm/7BLi8ld03NBby6rtCHPG8/a0aARak?=
 =?us-ascii?Q?H7u8DGz9h97eIBTFGwODKQs+YQHPshohCHfk0GT8AnCn/VZwnKfr2wpEu9Oc?=
 =?us-ascii?Q?kGko/pqsy/QzhLlKH0W9C89aEzC1fcM1C+DKY1tpyH2jPOJX9ZNdO5z1ug6w?=
 =?us-ascii?Q?6o5ZDS7uGyn3Hn/0T+tSu2WMExM3yvu5/EobA2QjAfLusgLlHqJUM4V4HAIA?=
 =?us-ascii?Q?LNjoy0+W/MpFqtClRubWLvx11CMqLAI+WYB9sR3EAVmBq7z+Y86Flhf8kIji?=
 =?us-ascii?Q?MRqjBllVMLlT8T6n6CLOQjIizW7xAtxZ0TWQMDYBIkk1KgRajdF5Hc3MVkTY?=
 =?us-ascii?Q?izVBNA+X97Mx74ygftqZqS7n0rophgtmvZx8AcSEsKYwo4uR5gMvpzLxuW7N?=
 =?us-ascii?Q?JUF7pC5Qg0/AD/JZOoqLWqmkFQck/nA4MHBQ0jy1v+rtQnElbls+6Wm4RRK1?=
 =?us-ascii?Q?uQTETYZSlxXvWdvI31hmvNaP3GCh/yMHjeHWdGMd/DkjjpQl6peb9pF//UJ5?=
 =?us-ascii?Q?rgtacKyAniH7QILg6Vgbkh+AuqsYbzMTy7dyVba2Cz2sGsOmAADEmN35O3Lg?=
 =?us-ascii?Q?0eevUYL8zvyFxk9TPlgF63YPh8D69eQs9Mj3BADF5hWYnONYUSHsr79w4V3O?=
 =?us-ascii?Q?a3bzO2Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MOf4A35zzT92loZiUVGyJ3flLhUqR6NLjwrQ1K4rRK3I4Ufv+DHL6YN8BO3G?=
 =?us-ascii?Q?YAaxFbkXVHyUvp7GdV40YxPG7Gjp/80RiHDWWkkSiIyJzalicqec4t3gsc5I?=
 =?us-ascii?Q?qXhb842uGkMSPIVekpFlGZ9U3LmKYi7LptaaJwgGf3zDWbx+LopPWUPKzQkf?=
 =?us-ascii?Q?2YlhK/4w06dl3ShIKIolkZrZQzylWddW9Kd1JD6+aW1OSFUJOmeyquVdkNRL?=
 =?us-ascii?Q?Ocsl+eTQLOPGc0uReRr03YZPIycQW8R4pYxlqwYPsjK6sl0S/2pgEokCR71p?=
 =?us-ascii?Q?Vw1vzOxYgFHZb/UscgyHikdysndC36byCzwzguaBLQeEMy+pmNRmAHVdrwyl?=
 =?us-ascii?Q?ti+QJbRut3vym9BERfq1nTB9dn5kXlhji6DA7tz3eH2w2RkcpG1CiI7bgoQK?=
 =?us-ascii?Q?fbLh7X48I7DWU41E8WpHNdxBnUNmMQSmp9N+DvGN5BsajwTexeDNeeHUkM3k?=
 =?us-ascii?Q?tuk9nIoMO2xUuro2CQzfUEUI2DyTn4ytH2e71SDMtU+9GqfOe8bd++Gej8Tp?=
 =?us-ascii?Q?Bo96HBMm4P9GYrV3YWWFUkDoSqLW3mth/mQGALMPFsAghGE4Nygyn9ndfjcd?=
 =?us-ascii?Q?bFwZ1zXkQvlJ22AVmVqWRQbryKRrATmw+BivxB4Nv547nIjy3dwatGRwR6kB?=
 =?us-ascii?Q?fiIFTtMUemVaOhI9NXvvL1O2tykNT9UjsldD/FsJ4UFUBjZ8WW3skaZVMJt4?=
 =?us-ascii?Q?0HE2H0YoC+12rP9TpG37EaAn6JEQ9oo+ebboY/Kwg2v5XFPubnxzgtmA6xFR?=
 =?us-ascii?Q?wj2ghhZawAkIsaZ2DCypcthNOLYqSe9DK+O7AgLjhp8Vd/o62u2TyqqAGscM?=
 =?us-ascii?Q?CQKvUKMnAsR39VJgsZyjSuxBUfKZVBlHahroCeXctjODLCrXRO4LWbGDl1Hg?=
 =?us-ascii?Q?i9qVPwWLiNPafSNoAmzsIwl5esS3HJ7Op8J5OeNN99LJoIJAzp5xZNmyWYb+?=
 =?us-ascii?Q?XXGyDQaqhPmoNvf075HvGu9I13QGAYSFj6f1epyK/DOncQPxcp0Kp/SoCAcu?=
 =?us-ascii?Q?iuWw71KzWDVJegZb4S/TT9XHS4XqBLEdihkW/2yxv76vqiu6ll9gvgJqZzQM?=
 =?us-ascii?Q?xPdJ7q6JA9I0STh+5eAuZcudI4W/zJvniIDgIjJVj3Ufk3sd5lYwK42kywGD?=
 =?us-ascii?Q?0qvONpnSxuAcF1TIfHKoEGNgKFX/fYp7ob4d5RglgPiRkzFMZ5TjVp+ObjKP?=
 =?us-ascii?Q?4jGI/4OIHmQ4ay8n2h2oPpfzANrVvgE9/SvqzfdQDTjZBNBDvl4dYmBPaa6n?=
 =?us-ascii?Q?eHaz3WmI1i71CkcHqZHo/cahjhmEZqGIHwYiwK1rWG+uVbwng/iNzIZVRm74?=
 =?us-ascii?Q?HOXeo7Dd1lcRtVUs+av+nPatFyPWEyKGdHq7/ZH/or/CzuLiGdqkpXfLtGuz?=
 =?us-ascii?Q?7U8aQ0H1Vz5lEFoad9LU/F6f4Xi+GitIN5xjZb+FrnGtugkt29gHzWqEadlb?=
 =?us-ascii?Q?9dAGPAXJq/8ARPrMp1mR8aVojHCxu6kLxt9U4joxj6PxEKCVOyjnBzsb4Coo?=
 =?us-ascii?Q?zwjwUJ1ptmmPK2AKWxyK6Fd19j/HLn+zG/C3fR2cnGpBt/f0+QzlkcfgSaK9?=
 =?us-ascii?Q?LjJvRqnQnf5OMIVZDwQ691KAgXHme+m+xLf+J1dtX2FyfZ0lSTG08FWaJG3a?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aa572ba0-1dba-4840-6e94-08dd7b44cb69
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:09:16.0175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+y/q3WtZ2CbSNSvQ7Yl88gBGcSPyNzmye5GGGl+yom0X3BteT5v4ms63Lgc7aQegcSFZCidFMPqRAg3GjrYo3SyUu3rziz4z6z+o+uveKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9269
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 11:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214800

Hi Martin, Dmitry,

On 4/11/25 1:43 PM, Martin Jansa via lists.openembedded.org wrote:
> On Thu, Apr 10, 2025 at 4:55=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> Upgrade the Mesa package, dropping applied and refreshing outstanding
>> patches. The dri3 config option is now gone, dependencies are merged
>> into X11 deps. The swrast gallium driver has been split into softpipe
>> and llvmpipe drivers. Reworked OpenCL support to use mesa_clc compiler.
>=20
> Hi,
>=20
> looks like kmsro is no longer valid gallium-drivers, the PACKAGECONFIG
> should be updated or dropped in this recipe:
> meta/recipes-graphics/mesa/mesa.inc:PACKAGECONFIG[kmsro] =3D ""
> meta/recipes-graphics/mesa/mesa.inc:GALLIUMDRIVERS:append =3D
> "${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
>=20
> and then removed from enabled PACKAGECONFIG options in meta-raspberrypi:
> recipes-graphics/mesa/mesa.bbappend:PACKAGECONFIG:append:rpi =3D "
> gallium vc4 v3d kmsro ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> opengl', 'x11 dri3', '', d)} ${@bb.utils.contains('DISTRO_FEATURES',
> 'vulkan', 'vulkan broadcom', '', d)}"
>=20

We also use kmsro in meta-rockchip, c.f.=20
https://git.yoctoproject.org/meta-rockchip/tree/recipes-graphics/mesa/mesa.=
bbappend=20
so that too would need to be replaced once this is merged.

Cc'ing Trevor so he's aware of that.

Cheers,
Quentin

