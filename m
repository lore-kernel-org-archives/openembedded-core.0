Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5C4C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 09:23:18 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.45])
 by mx.groups.io with SMTP id smtpd.web10.6246.1676539393123417886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 01:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=dUZk2oCu;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.45, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iw0bvIne6noKo3fkPuGm75McFxXz95lPNeDYxzt5tjYo+t/FG/rMDr79cjSRRG/OxfzYsRhOvlhIGfirI/BvvxY0odTdh2XXRl4CsLpvHp2LyDmTPvX2RmomQKSX7Uv33U50zaVphOu0JwEwUc0kPOZnjzfwCa2FQ5FXlhTPlMey29LwRoU6+vRy8b3KHShOK55ASmoi73Xwdfxi+iKKhZPMIby6Xh0sysCRO/rjP1MBXT1bYRsWqcYSgYDP3bpx49YdH8aBUgpbUg+zLOJNQEw4YvqqsRHsSzhdTchrjgaO559Tf+DTJEbAAzMp+3Mx94Rx3/RbedbUNEeM3+Z0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZLI2eY/J+hesPm3sp8XdxHV9WwXCdew1PfTPFvLy2E=;
 b=O755wpVav6x3TtZ77fuhVlW0nfrKtqEyR3D7iQklZJem2Z78wRj8gSGkZgAaGLGEkmhs/2vQcdYb9oF717k3SpFL5HZ+vDmWOHFAJsw2aH+3q+pMHkR42wV4pe0WLATe74fhW3uBZYMQB4k+PCvHMeDsuirIHrNKChu0zjWxxXVz3ZaavVzEmxhOP7bfrQ/t6veA7BD8vGhZAM0ia3+gUxBlScmjIVyKa2AoPwe3TDvX85fWY9YmGhN3MVktUqJv1VbOIWhe5BnqPgSBJm4VK9RC3PKVZyO5iGOwmLrngRqQy5pGFV+1bqBgQsz9eSzNlF3cfQFP1orFCTksmSajjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZLI2eY/J+hesPm3sp8XdxHV9WwXCdew1PfTPFvLy2E=;
 b=dUZk2oCuw57Iw/B61a9XMQci/Rp7hjeU2gtPiI/7biMzSlUgoXRiOVC1ofCHNwekRFVqUccbXNirLuvdtlWhJN0AfYgqXL4E+mHIb4W5p8KAnPWfP5hnmuHj2Il2b5u1RKn90DK2nRymA/pPxKcXYg/hmrszQFmSe7xVPSrBEgWSkz0JjIji7tEpNh7JbrBlEO51D9oSL1OFDePxjmkxgABsdZhjombYvvM6ocduRD44jIUKdxX9DPiiJ9UOEjjXMYrRUdRLG2Dc6xL7TJDckfNfJP7R6qpFnKGQFCUtvwPah5E9kv/lep+7gML6kxEdDDnovV0ojY8oY4EgCr4ztg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 09:23:09 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%7]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 09:23:09 +0000
Message-ID: <a8e26944-63a6-6160-2bbd-e1fc93f30144@theobroma-systems.com>
Date: Thu, 16 Feb 2023 10:23:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH v3 1/4] dtc: version bump and add python wrapper
Content-Language: en-US
To: Trevor Woerner <twoerner@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20230214183101.33761-1-twoerner@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230214183101.33761-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::26) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7b483d-905d-4702-fa1f-08db0fff6b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0xnnAVNc11coDKkI4xKqtmKBT9JzAH6looPuevR1tBW7V/XqZwmj17yd4LQqun/zH2fkueImzSTNj4vzVugZ4ZhsvkEjYVt5la1UcMPzJDAkFxiD64IV5ldHQ7qWCL/3d4IRy4N83ZRSl6l9ke413A6M5JQHRrhmn1CemOmPXkfC3bgy2yfTWUclhWY08esGB2gsttqpOQP3IzCVNKeOL6d6CDhi7DimgokSXW1iJU1d+bvyKh/fITtxA8KXBBVB0o2qHzomfW4YJL5RhHHU/ByADF7hzCOPcE4w3wBgQbW6ELTdY3mBLT+hfpGr+079N0esMc5DOAG2vdAQDnEozk7nLMCJCgWzAwiLIVVkjfvLI/cFUjRwN01Ln1Y6FD9Q2ZX3blOTD/NTNBCg/R3a/+sYQ5zghFqBXcE/SLzoC7OHJo7UozyHh2zTQ34j31yNz1t/24DC9KVFVNGqyYazmhBluHPM4NNcc6agHC/H/WTgG7WKiPR7fuNhWf0J1aDEfSg/gpEjClhBEWHFLuGaGRijwuSdz7HgH0H774mGyVDeMux3D1zlRO3IOf47T/o/yisiNwL3YdljryE2Ucc5GfCtKvcEZ2HkYAadabHCm+NwUIqyc/Rigec+ai499AYfwPgFBG1sAlQi4kz9ZEnTjPTCUcy4hqDt6JQ0WBrxb9oWkJqhvG4O025xDYlwlJ8UaC+ychRiDE/fiOHMQbG1C32dUnbT+M8PwVGoC8K8uEk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(451199018)(5660300002)(2616005)(86362001)(66476007)(36756003)(478600001)(66556008)(316002)(6486002)(66946007)(8936002)(31696002)(26005)(6512007)(8676002)(41300700001)(53546011)(6506007)(186003)(38100700002)(2906002)(31686004)(83380400001)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?43E4GUl8VJXOkanLSrQwL2PAUuTipYHLSQufCeoynYbSJr1ma9o8jmWczSfZ?=
 =?us-ascii?Q?+H+zi2KWMYoAfaelNfXlpWEvy6oXtymn+7eSVdgI1+I/9sYzifnE5demMuye?=
 =?us-ascii?Q?etavs5KIDwnsV0KDRce7p/hA3gd1fC6Dgnof0AMndTK3OuEwEAX+bsbj86hE?=
 =?us-ascii?Q?Jsi7HHf09dG7ZANyuLkQlBzELHJu7tF+aD1AzRsB+frJ4IqecChcC5mUHLoj?=
 =?us-ascii?Q?xSBn9BZk9uVdhZQq/2KvPUIaarpZxgDvr7WlBUJI8N9+ejQ9IuWUy4ZS5+tN?=
 =?us-ascii?Q?diJcyxrSOcHsNC/skFVZuCqqbKy9SO6BhEF8HWb0lclgJY3651IyLhSsfbtE?=
 =?us-ascii?Q?cbD4Cyy9Kd6ZmR1QHjBBCdmHtIeSs5xyY6MgXrFUMNSwtRtYoGjbjGuAfj61?=
 =?us-ascii?Q?LY4vNuZFhQWneNWJNGY2WYzY8NqD6ZADkkpKkekVxzfEin1TUrpliTtnivAC?=
 =?us-ascii?Q?/i9BnObYc4rN2VL4ooW9CkQf1fAuqkF8T78K5P5IAwZErim42m/LxMVxXpqr?=
 =?us-ascii?Q?avQluUOLnjtr4XSsxK7xV7TDXEkvcPSPuBmIqzAiq6DL9wGEnIez30DDD2rq?=
 =?us-ascii?Q?tss3//Zu50wjYQhqNwLlxWZC5pTgYJJyZP/yNViC95Lus6A3XlVA1vtwQGvx?=
 =?us-ascii?Q?h9t2o+tpgjmMhtIHJzDjFBtiQhmf/xUZmcNNa6FDCaZ0PNtyz6acEqvvGxb0?=
 =?us-ascii?Q?gzFQxv8VIYU3zYC5vxjoawPIKKGzeVL6AfLgN3D1mw9b6jWXcsnIgKMLRZDD?=
 =?us-ascii?Q?6E4kucZKaIpGJoQzwxrbpAj9JO7qyzOQlMxUFJkQdn1RGiiVvl6SZcuAjxSX?=
 =?us-ascii?Q?fmjzRKp70vfxJMivZAWuCxkjDkhEliLaoyn5ZmsPAecFLm3zRkDFaw3dvXWM?=
 =?us-ascii?Q?sVAIzG3nCDb4z+6/+w6m7smv/BvrF2uXS02t09QzyyBwIl/eGuPkmex3LNcG?=
 =?us-ascii?Q?AgUob7WRHDbQ4YVWOuFb7+vh78OWNYuAVJkAkQVqGjcqGP9caFGmpibgT06/?=
 =?us-ascii?Q?+GEtotfalLWrEY6LYw+NodK9WF5AcgvrhvxdpzsfrbfXwQRScGUBWoV6DfsR?=
 =?us-ascii?Q?8oV4WwRtIA3lbYrnFbNXopyzFZPQNERTynwcJPcRLBt2j+WWYz6ba8drkbcY?=
 =?us-ascii?Q?awm4EWba0nHc6WSxdfqx3cwrDOjdKmQhznbIqzZd7zAPr6vyq9ngj3Zy0B/W?=
 =?us-ascii?Q?Ubds1tQYqhWu4tmsXUTtre+qCRXYWizuJ2zx8ccgS6MaoJFrVx4mqN4a9+dd?=
 =?us-ascii?Q?lGtxIwZyglnUZyJ3DWXRDQvAwiS149tBObQrGhn63hj+llGnKYKT0fS3tAND?=
 =?us-ascii?Q?9af8qmv2weh916HqEwp78sP+mymyUd9IxjXnwlxtJgTZxKKJbmtBUJZdLCHO?=
 =?us-ascii?Q?8MGkaxSZ/MhgI+c7OLgRzVefXR29JFRmajXNZEnrjJETaHskI6toZ2Tae61J?=
 =?us-ascii?Q?TWPRKbK2/hw4IcZ//Dv+yooRh7gk3Ai+x4uZhbICgIpJ6x/zr5D9CS8/KHPQ?=
 =?us-ascii?Q?SVkLLis55Kbn/xNeQHyfG1RN+V3UuAQfzdWTSwzO2V3p19HpLZGeTK2vXrUQ?=
 =?us-ascii?Q?9QH3mEKus9vc70kxnXi4m1myotK7xGvxUNzy+3bG0Suu7hoZX3a4Rv+tbnO9?=
 =?us-ascii?Q?Ces/h6dfr+qhP8JmjgCVAeU=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7b483d-905d-4702-fa1f-08db0fff6b61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 09:23:09.7279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtweu1BTUFVsueoUGBPKMqtVEab0auNulQsedPi/s2d1Y0p9lp/1sjQVb8d0U9KlmEYFvfzG4mofPLYVyyREk4HWjzD9Jqzvui12mIVdR5BUTn5iwG8ucBzc6vYO3CBh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 09:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177279

Hi Trevor,

On 2/14/23 19:30, Trevor Woerner wrote:
> Bump the version of dtc from 1.6.1 to to 1.7.0.
>=20
> Add support for building the python wrapper around libfdt.
>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   ...tdump-fix-Werror-int-to-pointer-cast.patch | 40 -------------------
>   meta/recipes-kernel/dtc/dtc/0001-meson.patch  | 37 +++++++++++++++++
>   .../dtc/{dtc_1.6.1.bb =3D> dtc_1.7.0.bb}        | 18 +++++----
>   3 files changed, 48 insertions(+), 47 deletions(-)
>   delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-=
int-to-pointer-cast.patch
>   create mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.patch
>   rename meta/recipes-kernel/dtc/{dtc_1.6.1.bb =3D> dtc_1.7.0.bb} (51%)
>=20
> diff --git a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-p=
ointer-cast.patch b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int=
-to-pointer-cast.patch
> deleted file mode 100644
> index 4c3e34b1ffd2..000000000000
> --- a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-=
cast.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -Fix the build of fdtdump with mingw.
> -
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From ae0ce1fa7f4d679b5f8df1fc0e797246e43547fe Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
> -Date: Wed, 25 Aug 2021 16:13:50 +0400
> -Subject: [PATCH] fdtdump: fix -Werror=3Dint-to-pointer-cast
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -With mingw64-gcc, the compiler complains with various warnings:
> -error: cast from pointer to integer of different size [-Werror=3Dpointer=
-to-int-cast]
> -
> -Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> -Message-Id: <20210825121350.213551-1-marcandre.lureau@redhat.com>
> -Acked-by: Rob Herring <robh@kernel.org>
> -Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ----
> - fdtdump.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/fdtdump.c b/fdtdump.c
> -index d9fb374..483f367 100644
> ---- a/fdtdump.c
> -+++ b/fdtdump.c
> -@@ -21,7 +21,7 @@
> - #define MAX_VERSION 17
> -
> - #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
> --#define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
> -+#define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
> - #define GET_CELL(p)	(p +=3D 4, *((const fdt32_t *)(p-4)))
> -
> - static const char *tagname(uint32_t tag)
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-kernel/dtc/dtc/0001-meson.patch b/meta/recipes-=
kernel/dtc/dtc/0001-meson.patch
> new file mode 100644
> index 000000000000..10c4f8706194
> --- /dev/null
> +++ b/meta/recipes-kernel/dtc/dtc/0001-meson.patch
> @@ -0,0 +1,37 @@
> +From faa02d4a60859089017bf92e0e3f49d600c44d73 Mon Sep 17 00:00:00 2001
> +From: Trevor Woerner <twoerner@gmail.com>
> +Date: Sun, 12 Feb 2023 14:37:04 -0500
> +Subject: [PATCH] allow pylibfdt in cross
> +
> +Allow pylibfdt to be built even in cross-development scenarios.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +

Is this really inappropriate? Cross-compilation is not THAT niche=20
anymore that people aren't open to support it? What about opening an=20
issue/ticket upstream and see what they tell us? Or do you already have=20
such info, in which case can you give a link to this justification here?

Cheers,
Quentin

