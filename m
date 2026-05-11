Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C46CD484A
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 13:20:10 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50089.1778505602627450997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 06:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Y936ieOo;
 spf=pass (domain: cherry.de, ip: 52.101.84.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXKE0d0DvQBXv2G6o/0qJoXV6J3aNAe8ZOFs1i/Vmm7PFh6uDBlRnZjdNvATfzu/P4C3EuTsO7J6gzpT+v0ygW67F5mcMtyJ4LjxwYqk+measi/r7DiPaZhhGHGN7fWLlv+QgR0eq1IqGk9KO1FiongIYIuJ2kB6l3hHQNgL+okPoY71ZQGFcIHFLJ4lAW073XHiPvhEqXKelXFu9C+bHfFm1XA7yJgqfoVuFjmvtF7glEkU1kLTO9rBVytP+FruTY4lmIEazYujc6TNYPjk6WUrOHcY5kPxbOQyar3hpIkJdbzXkJjLAGn7Z1UZxm+eViVOeK5YdtcOfzdCUeB+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44TC0zS2yq6Xf+EQx7Wxlof3Flx0TFThgvi6MftB5FY=;
 b=fa1ssEwBc2GxGJ3LjZo6FVzZw8x9IOs5IV1ZToRRlcW8KJSxQUxvrAFDZJ5ZFzevpfxLvGxO4A6uu/2eR1/5UjE6Gq6zxw94jd9Tr9HGs1j99J57V35tuOb6mxBy7a46al0lS7zVkt8E0Brq2jkBrQVC5zHog5Lu2ASU8JtpP1Bro7OyA841SUVaNSKHBDykpDpdR+R32U2kEeNAp36nCK7SLIVhTaWjkhvXjJcxRdegRKcEWdS1ZPxK5XlWAmrZ2nZrsLNm5g8t50ijT6HxTr4vJ6dD1hlc/zL/T33nZ4cKSDU3WPHsOPrORmyD+Q6HYkDEGxrZCeezQo0zGUgrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44TC0zS2yq6Xf+EQx7Wxlof3Flx0TFThgvi6MftB5FY=;
 b=Y936ieOozcsLStJVdFnaVZUgX81VlrcfXt16msE93Xbymv7oCPQht7bHAsQmPir1sRcIF2FFbeSeYIKC9VQmkLPfrecTTB5MCHn2ylMjG0bHxaSNzkScIsdMqlWFB1qAikGU/D/UjiTXf3wCn7Gu/Gu8NKoH407141EhY9OdHwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DB9PR04MB8105.eurprd04.prod.outlook.com (2603:10a6:10:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 11 May
 2026 13:19:59 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:19:58 +0000
Message-ID: <16ac5a86-680c-46c6-8079-92a0880f5def@cherry.de>
Date: Mon, 11 May 2026 15:19:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ovmf: simplify PACKAGECONFIG's default value
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
CC: thomas.petazzoni@bootlin.com, khem.raj@gmail.com
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
 <20260511092935.2631121-2-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260511092935.2631121-2-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0404.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::6) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DB9PR04MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: b39c25bc-3bd6-4760-f54c-08deaf600025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|3023799003|18002099003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	56tLQASeZ3w81CYHpwWWLNJ+vcf7F8TBaFh1YHLdx+pUBWtEQVh520L4Awyx2AjCUGaQKcCAmWp4UW1zsszg31+Gp4p+5f6kZ6mXrAPkB+U996fHYGLvQlQhFLvV4I01FrdUDxCClmm6koepGz0HAwy6UETV4JYbaJCDfoWBGEG0acxAolYnVeZ7qFhGUvbW2UeC4Ah/ArtZo20OOTkYdTVEqWV7nqdzAM5WzYI0M8cbU37U7fxWzHvPaftAZvcnzgDqyXGmSgbhcbn0JcicxI9Q9/RQuZ1GY2BE/SgFFKVqk/AHCjykk6fWkZeB+cRQKWlcE9FWehOJ/v3SF+Xv78XCX1sNBNGKXUuzS35dKYyKdow1+z5IcckIoP1uK4Otv14jFE5OKDcuE/QapE5WRt5+O9uftn65PKOX90rQiA8+w4TPg8bS/0R8Obk1Adws78jTVsUReC8Ic0dSBtTml9oupN0Y2Mc1N2skOFKnjtAV7A+gvmltVr4x2L/kdqlxqzxatB0TgCapeGuX3GaBzSBACQNT6EYhNE9Tc3Tdyj5RxJzlO/Kgb/zO/WALU886xBGc6RhyV4BwPEn4WrAIpFZA7vlg4ITYUrzIXQL4JNc8njt3wWhXJrroKMeUUFvkPfwe5+JpCVEHnfEpsx+ifkB3Ds17pCirKEAZlk6MzxHR6WvQFDMGNA5nR6K0iwi2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799003)(18002099003)(11063799003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cmvwObwr3ea4pjTLrcLT23ocBlZCz+xAHx595rrS2Lx9xeIAIvcFI02gaDTE?=
 =?us-ascii?Q?ByvW2pNmg9DyqqfCz+9O7ES/cJxpB2tAcIp53VNUErb+FGDOGS7/g4xfimkq?=
 =?us-ascii?Q?eXfMGAvOyLrVgTtLWY5at5BAThIVkB6gh3YM00Gt+tjiCZaVGNcijtIvgShB?=
 =?us-ascii?Q?TNnbSxHYEzbOTl2N1ZeQVFYfZdYL+IbRVani1b0ZRIaADQXnDoWEHtikrBdc?=
 =?us-ascii?Q?N87ZU0V7kjJ2iIT5NmpWx3Gp1IwIVkpaVlQoS2AiqnvyQldY+Qsz2Any1tZm?=
 =?us-ascii?Q?oEwJ2aUKm/JGMW8dqN9L6NAK+vOlty5sr/pDwZWKvpZ7ydmuZRwP8OKZPKl/?=
 =?us-ascii?Q?yWzM57L+CmNBoQiMLJdlOi3UL7VWhfeNs9OfVrKzXsj1y2w8jOk1ZSC4fkvl?=
 =?us-ascii?Q?bxbl1xWstrptJYJP9rqE+kNdNh/smajTu0MiCARQtmB5Z4tZjLD1kfhaeR1j?=
 =?us-ascii?Q?/Lno4rPxBdGB20urrXz0Bgus6aiZiSrNrqL4C7JKdtdqqQ8qxfIMHgzt2GAc?=
 =?us-ascii?Q?sMeyXBYW3PmnoI4/MAycphgWFx4B03s+2D79cUPVp4YxSWaYc5iaXhOeUSGO?=
 =?us-ascii?Q?2SRjTPlhyBZ6EBy6bMC6o26JLg56Mr62eY2g20KkG6mDkBqvII2bHaPn3Asg?=
 =?us-ascii?Q?yLxaYWLTj1lRu306mG0q8cvQPIz+5bZYOE4PTv0NU5FZevlQ0o0Yg3fz2F94?=
 =?us-ascii?Q?q5lidNc0UNw/iHPAVGC3nY3DvWdCxp7kNcZUnammeRrz24DYUHdaEULdjHYm?=
 =?us-ascii?Q?QT6d8pVybG8GS/tnlOkkT6UEf2bYkcB5HxNgFZPyk4D9Q10w+kkAsMRsw2Z4?=
 =?us-ascii?Q?xfHM+vI9yXoneFFhUR1nwl/zgWcRA7P6PjyPQA0TnEL5GILG6f8efp2wBun1?=
 =?us-ascii?Q?nJpeogmQu9WvRNZ71aJeuFVehwzQfej545U3/0c5ZaYvK6JPHwOX88bE0u8V?=
 =?us-ascii?Q?tiexl6HpbvGspPEzSh4IgA9pt1wDOIp0GlhOzvD/8vsuA9dr649s8n4xgPEt?=
 =?us-ascii?Q?GJqCT241XxpSVcB01xAvx8Lx1u05DJxu0r4LdcvkwbOZK6mMjQfkx5B9riHJ?=
 =?us-ascii?Q?20aMJpaI4R8046PBbHtg8hqLTu6QVIhPkz6LGVVBfhL8YXtUaqgWJ2Zow8+j?=
 =?us-ascii?Q?yqw3SMCO4P/ZTKMeduVw6Pzi5Sq3IcSRjUaSbyKVL287ZRD+SBClOj6NoWcy?=
 =?us-ascii?Q?jPJf1QHfJTVR8V20WmirE5+JO1Fg7ceDKiFrYH64DGDmky7i/LGCCSu+DpC9?=
 =?us-ascii?Q?+bcQqKwUSbM3aOIPY1NDZ8Gk/a0xZll/YetNNLunIaropgadLhCE8XxFrABZ?=
 =?us-ascii?Q?75oawi3W1comC8mUN1rMln89Xk3L8K5z8kU+FzEAUoPB1cbqoYn5u2kNTt2P?=
 =?us-ascii?Q?GQk371fyID0CbR+IipYXslCKCS9LLLQ2b9zLxbS2QZmEvx7OaBz5d/PLmUOq?=
 =?us-ascii?Q?xjhODH9bBDZ1DsZgz1D3saZLpq4/Pvyps/ca/TYYQuVpdkPIKzp4n1UxR2Hw?=
 =?us-ascii?Q?YmHzZPTyVvKJPc5sDN/3XytgIuI1CkCE+tNWNNG5GovqENiJgDQhCGghAGIU?=
 =?us-ascii?Q?JIPhztWXmvnwwfriyDdH9HDS6Ef45hxnGK2oo8aKGeJ0lYtoyY2fEA4f+CMK?=
 =?us-ascii?Q?M3nfnotSgOAdbR5Q/KjDiwdQnVKx/tWNSyFSmjtALUD+VeiabiIJVL4V1rq/?=
 =?us-ascii?Q?IFD6lJpjvektTl4hjdtV4CyFGZAbYFhb4JRKF8PWK0Gqnfi5ssQdzSGO0Ot8?=
 =?us-ascii?Q?FL8+yeKRdg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b39c25bc-3bd6-4760-f54c-08deaf600025
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:19:58.8814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCCECBiPVdQydICJGKRyZtlc0bH/8+idfGgglWE2JkT5FTJcKt1mxCh6pbGm05kXe4A4pkGxLIyVS/GZGDkC0rp6r/bzKstDxznNwrpZoSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236813

Hi Jo=C3=A3o,

On 5/11/26 11:29 AM, Jo=C3=A3o Marcos Costa wrote:
> The two append operations call bb.utils.contains, while a single
> contains_any() does the trick in a cleaner way.
>=20
> Regarding the default value, if tpm is not enabled, PACKAGECONFIG ends
> up with a couple empty spaces, and this can be avoided by redefining the
> default value to the result of contains_any().
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   meta/recipes-core/ovmf/ovmf_git.bb | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
> index 958f42fc10..779e9f8196 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -9,9 +9,7 @@ LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=3D06=
357ddc23f46577c2aeaeaf7b776
>   # Enabling Secure Boot adds a dependency on OpenSSL and implies
>   # compiling OVMF twice, so it is disabled by default. Distros
>   # may change that default.
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG +=3D "${@bb.utils.filter('MACHINE_FEATURES', 'tpm', d)}"
> -PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'tp=
m', '', d)}"
> +PACKAGECONFIG ?=3D "${@bb.utils.contains_any('MACHINE_FEATURES', 'tpm tp=
m2', 'tpm', '', d)}"

Just a heads up that this is *not* equivalent.

The use of ??=3D meant that any ?=3D (and ??=3D) parsed anywhere before tha=
t=20
line is meant that it would set the default values, and then we would=20
append to those default values tpm.

Now by merging those into a single ?=3D, a previous ?=3D will override this=
=20
new ?=3D operator, meaning tpm won't make  it to the PACKAGECONFIG even if=
=20
the MACHINE_FEATURES is set to tpm/tpm2. Also, an earlier ??=3D won't do=20
anything anymore.

Whether that's an actual issue, I don't know, but you may break users.

Merging the two +=3D into a single one would truly be equivalent.

Cheers,
Quentin

