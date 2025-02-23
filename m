Return-Path: <rogerio.borin@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F70C021B2
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 22:13:32 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
 by mx.groups.io with SMTP id smtpd.web10.76038.1740348802880900010
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 14:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toradex.com header.s=toradex-com header.b=SWqsSxZR;
 spf=pass (domain: toradex.com, ip: 194.104.111.113, mailfrom: rogerio.borin@toradex.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1740348801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCfoM4KTv/ilenkdjNG/8wUTrOlQhb/KrL8wEZWiU1U=;
	b=SWqsSxZR9+LSHBX+iimOVXq/o0AIWCtduAJeqzvExFZGZuK6z8ZLMb4vOVi1VEAlsgpipf
	rR2XTk7Zvgo5Icl1ZCG11m78VLXJ6ROUdV/qsLHahbKjVq0h2iIcLoNkdXr873oGMpGJFK
	Y1tMxW4njo86lkNGX247xCna/TTHpnI=
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp17012054.outbound.protection.outlook.com
 [40.93.85.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-64-gpOhTaMENrWIJoLHAbgAVg-2; Sun, 23 Feb 2025 23:13:19 +0100
X-MC-Unique: gpOhTaMENrWIJoLHAbgAVg-2
X-Mimecast-MFC-AGG-ID: gpOhTaMENrWIJoLHAbgAVg_1740348799
Received: from GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:30::13)
 by ZR0P278MB0172.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Sun, 23 Feb
 2025 22:13:18 +0000
Received: from GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
 ([fe80::797c:7290:661d:7a99]) by GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
 ([fe80::797c:7290:661d:7a99%4]) with mapi id 15.20.8466.016; Sun, 23 Feb 2025
 22:13:18 +0000
Message-ID: <0665a8da-cab0-4d66-89b8-cb9649918365@toradex.com>
Date: Sun, 23 Feb 2025 19:13:10 -0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1"
 behavior
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
CC: Adrian Freihofer <adrian.freihofer@siemens.com>,
 Jose Quaresma <quaresma.jose@gmail.com>,
 Leonard Anderweit <L.Anderweit@phytec.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sean Anderson <seanga2@gmail.com>
References: <20250222002047.319479-1-marex@denx.de>
From: Rogerio Guerra Borin <rogerio.borin@toradex.com>
In-Reply-To: <20250222002047.319479-1-marex@denx.de>
X-ClientProxiedBy: CP3P284CA0015.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6c::20) To GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV0P278MB0321:EE_|ZR0P278MB0172:EE_
X-MS-Office365-Filtering-Correlation-Id: b52fba52-da9b-4e92-59fe-08dd5457469d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7053199007
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aNGFg2z+67M5kpt0uQ0kqLTuRufv9Ljtv7r0HxG3Z5d9EQuHe2fAviQOaNRR?=
 =?us-ascii?Q?WqQmqNeZYNRp74w+PKa5ki9rz8W/+7gNyeR+fQ79B++dePQnrVL045YPgiNc?=
 =?us-ascii?Q?DN7pBUHdNddHLKOnLLr6U6t3Y8C+FJxaGzG0FUwmFz3VblBx2O1ewAHRjpoa?=
 =?us-ascii?Q?KGwZG1MALJWZCsh8EkgJ/0nHvUDBQ9LKjmDVJO2f7qiX0hmyZ139rh9Yy3YH?=
 =?us-ascii?Q?LHmDG0xYYlsKVbdpONKaMbhMOvbvFxvpcOk3HJhxP1Kp3KiqnOQFx7MISo06?=
 =?us-ascii?Q?nsoG+DCgZXSzwyLUuzylKWwI85RwHPvIRqEsfT4EOMGjOoEnms99rZRlYTBT?=
 =?us-ascii?Q?1OoCdVjke0s4nUaYDTlG4Hn0nSNaKY0+LnjF07/+Jy8L8RzZqdcqmRrWc39q?=
 =?us-ascii?Q?a/qTHyDxTEJ2E52y1mMGtbbsZiXh3mjo5jyE/ttkZ5EDc1EU6k3PG1y7ajho?=
 =?us-ascii?Q?NLfQjZjyjq86cR7VU2tNrsXA2O5ukx4kw2HVprr2Fy/Vlgx2il8U9HSIgpHo?=
 =?us-ascii?Q?zutL3qOp7ve1xkNTiqNLfcPx5P/StH1Jpb2j/imPZeXzcgHcJaPTu1OvbVJi?=
 =?us-ascii?Q?9Mn17iT9NyZ2Y7quLHbeGWFC6fHy7R1lPX0l913RH1AEmnGuioNlyAoD7R7X?=
 =?us-ascii?Q?m71jqrsXS0NNoF13O/Z66kXjXI6gcHZB9avl7CmCUOooax0A5uYNnNQrXVeN?=
 =?us-ascii?Q?sviG9sov2WMBD6il3MkfM53fQ+wozh0HjBsB7HI2he4fkOaOVVmw4ocKPxDo?=
 =?us-ascii?Q?+geKH/SkCtZx2ZLfPyANjk3g4ymUgYEHd0VX0SDmjWXC2N5MiZ+XDkXDdA9E?=
 =?us-ascii?Q?Hm4hFhc+iaKXN8WnGkQSOY3QY4kO8ZP4KMMH8PGf3gcqRisL8GZolImpfa/e?=
 =?us-ascii?Q?6YiawqKRzUbeZerNfHw3GdsIJ4/oFCdWbJXqaM4OR9tYjQWa6oTLxrNsuyN7?=
 =?us-ascii?Q?1yBuXNKh1eTwV079fLb9+5CMWY8RLyoJwNyICP8Agf6S/0lXkaZcJ070qz8S?=
 =?us-ascii?Q?4XMOGJ71LzJ33nLU2cdInOQFcsBPycD2TPGpDbhlxkVgzKSfU4cpiFfbO0N+?=
 =?us-ascii?Q?GQlY0GYUMqoyiNl3hUOwwwefMmJqkxD6FZ1wQXH94YuGIwfvl3yJKYfLcQAz?=
 =?us-ascii?Q?y+pz7wdjV80Y1ikkKO8YOZSit4u+fZO80SVcuDqEJrqjqTtqKEv6QR0rPOJA?=
 =?us-ascii?Q?BMNDVGM/FNLbyLv8nwgBD5lSYv11lmwypxo0Gy6622hWu4yreRqkfPtYR8sJ?=
 =?us-ascii?Q?eOnAkJR+nXl+IDcAm+aotDLsS9slLDKiPPd1XpomggCtnaUMcO7iBd8Z0oab?=
 =?us-ascii?Q?7Nn6c/6ZGHTWJS2cBdLCIznRdFya5WiHooQakov6YyTJzNbseQL2t5Io1Qay?=
 =?us-ascii?Q?EVJ0UNlRS2JfiCnIzySRxlWBUVI+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zGR03XxHI7Bqm1ZZu1gY8pEztDtApwjMT16MsqTIvtXrdpNIoS6fkeDs2PeM?=
 =?us-ascii?Q?/1+N5n86ZB+MwsaYh8mqm2ANO8ukf1mZgantnt83xZjHx/Ihe/AFiy3vqDWu?=
 =?us-ascii?Q?EWNKY4ZdrCg9bxN+0HLioXmSzZqSisRlA4+rUdVPqK7y3JCriLYT4SiW4yA8?=
 =?us-ascii?Q?jEgLbUbZeQxvTgxVUlOSAhyjBhjbxQc+RJ0xfbfr+rNrt/kny36BIQQ7zbWK?=
 =?us-ascii?Q?oViwvVbOzq2xqC044dNoU/wZPdH2BtuAyCZFlpUTThrTN9QFYJbeLE8LvNO4?=
 =?us-ascii?Q?aGdCcN1KxwRTuCyIk1tqVW9LCkSB2A2FCN5lbZa0uYbJu2y6IQ5gCF9rC8Ku?=
 =?us-ascii?Q?8amOcKTBG6ebQ0blTQfJpD4MsG2TMCwPg1qbIen5QwnV/CIDW/2Gpa76D5VC?=
 =?us-ascii?Q?/lEj7QSdKcRfv9ksMh7iGjp9VOKnIzt/cgLMM/hFq8U5fN2P6b5FAUtfVdtw?=
 =?us-ascii?Q?0ZS+X/8RbxFzEviyH/5VT581jWqRny188O3H0IH9vqkbcBU1BvoYMBKQK7LY?=
 =?us-ascii?Q?zgUi871kY2cLueStnhIo1Eh9GWbIrVlxPb69aZJrl1MWJlxSHA4COKeL5aEa?=
 =?us-ascii?Q?x6nXLqpS0Jr4OpIU82mN1ovvY1ptN2fjW8KZhIkkK602lsZ60C/Cl5IL/AJP?=
 =?us-ascii?Q?ANanI91qzkGvqdViD31Ogy5Em/tRy+KIovYfLZaK+RQufolSLcWCYeMzGM6u?=
 =?us-ascii?Q?lqjuGZrLSfxavnD8X1gbm/IdH2Y0FtDFKjPJ/eRJxMjKCMdyrjXNZxgDp4As?=
 =?us-ascii?Q?tgSQ0yiqx/bKIeoI8mYLh39QUsv8uU53QZX3QL+U5hnhfiVQGm1mtQ8ckQhi?=
 =?us-ascii?Q?MBE90mnx39BV8HT9WZYz7eLrUIVsOS9GVw29XrpWTRhpC84rDB1ga6vliqRo?=
 =?us-ascii?Q?H+VirZHuj3GSY8aJVQ+MiEFvxaSPmbaXAeX9Gew7Cmr12+Q1Ho5JJhHXc3zi?=
 =?us-ascii?Q?X92SH958OgW9tySahthMnxk1r4Zp8NBEhPTuhoQJyhEQaXxIhEkv1nznwH+6?=
 =?us-ascii?Q?Nu5Zd7f8xLT7dcEfYzfmlikZCzvAewE6DkmpcNlhd80a9/PBNjJBuvvfjepa?=
 =?us-ascii?Q?9we6EtqgZ1C+122BVkmnXfNZ6QCkAn4KQMwCdBmx+wJLJoJFNVRLkV0v+qHW?=
 =?us-ascii?Q?vk09jfz0yXvM2mN8N9JN4RuPUTuMjuO98lME4/MIrU8qThJNVld+i/Tqvzm5?=
 =?us-ascii?Q?DFcYK5ZyayQhsG8RUspAbKyfDY6CfYiN7ax7A7ckmhzZjSjWuz836sUcggQB?=
 =?us-ascii?Q?hqer9ZYAyq6CGpxibfEEjoiAxNpt0EILaM28qtlgmsqFEOpzaQVZ0ndHSwE2?=
 =?us-ascii?Q?jf+V4vzvFVb56OLR5HXgi7q/CGu4gqlgAnzzxM/+x89syKiyPE13UWjtxUPw?=
 =?us-ascii?Q?vdCzwqJBPIKCOILUr0eK8FgDLguioPYCitY9zrjCMQyWNb7f1m+rzGoTB+Y/?=
 =?us-ascii?Q?ogYo3LB7txhgTNyfHx6xHpnvOoz0hTmD7UB/5xyZeGPuD8I93XlItSLRmZGz?=
 =?us-ascii?Q?8IIjyv6sOPkbbJ1TjuiokOPjrkFrQ+J0XaYRBCl9StBFxPC5hNL6qqfyhd1G?=
 =?us-ascii?Q?ZDB7BvegOAI2anNSd8GIdg6TdtKbmq15O+xqZk6OREtPpVKyL48ID9TlqI+3?=
 =?us-ascii?Q?jg7uvMtWlclPWI2URlyDgvPVsgmWJSeT6DIGXlUvY+O2yRHF7q5kQKD8lOnA?=
 =?us-ascii?Q?scHgMA=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52fba52-da9b-4e92-59fe-08dd5457469d
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0321.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2025 22:13:18.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tB9xEitktT8hhSxSilhkdCa7lKxAx8Ds4fvOSnUStn/Hlp8H3Ccctfrd/VelKpxfmJlfCsc8Wb05s81kxuaGGUZYC1R1N57vFFCjGzCBRGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0172
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vhtOVqOjaPHZgiJPR_1_TraD4BPALdPKr5ysZMD3J18_1740348799
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 22:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211830

On 2/21/25 21:20, Marek Vasut wrote:
> This message originated from outside your organization
>=20
> OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,
> where the resulting signed fitImage contains both signed
> images and signed configurations, possibly using different
> keys. This kind of signing of images is redundant, but so is
> the behavior of FIT_SIGN_INDIVIDUAL=3D"1" and that is here to
> stay.
>=20
> Adjust the process of public key insertion into u-boot.dtb
> such that if FIT_SIGN_INDIVIDUAL=3D=3D1, the image signing key
> is inserted into u-boot.dtb first, and in any case the
> configuration signing key is inserted into u-boot.dtb last.
>=20
> The verification of the keys inserted into u-boot.dtb against
> unused.itb is performed only for FIT_SIGN_INDIVIDUAL!=3D1 due to
> mkimage limitation, which does not allow mkimage -f auto-conf
> to update the generated unused.itb, and instead rewrites it.
>=20
> Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if UBO=
OT_SIGN_ENABLE and UBOOT_ENV enabled")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
> Cc: Jose Quaresma <quaresma.jose@gmail.com>
> Cc: Leonard Anderweit <L.Anderweit@phytec.de>
> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Rogerio Guerra Borin <rogerio.borin@toradex.com>
> Cc: Sean Anderson <seanga2@gmail.com>
> ---
>   meta/classes-recipe/uboot-sign.bbclass | 60 ++++++++++++++++++++++----
>   1 file changed, 51 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
> index 96c47ab0165..5c579a9fb0e 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -101,27 +101,69 @@ concat_dtb() {
>   =09binary=3D"$2"
>  =20
>   =09if [ -e "${UBOOT_DTB_BINARY}" ]; then
> -=09=09# Re-sign the kernel in order to add the keys to our dtb
> -=09=09UBOOT_MKIMAGE_MODE=3D"auto-conf"
>   =09=09# Signing individual images is not recommended as that
>   =09=09# makes fitImage susceptible to mix-and-match attack.
> +=09=09#
> +=09=09# OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,
> +=09=09# where the resulting signed fitImage contains both signed
> +=09=09# images and signed configurations. This is redundant. In
> +=09=09# order to prevent mix-and-match attack, it is sufficient
> +=09=09# to sign configurations. The FIT_SIGN_INDIVIDUAL =3D "1"
> +=09=09# support is kept to avoid breakage of existing layers, but
> +=09=09# it is highly recommended to avoid FIT_SIGN_INDIVIDUAL =3D "1",
> +=09=09# i.e. set FIT_SIGN_INDIVIDUAL =3D "0" .
>   =09=09if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
> -=09=09=09UBOOT_MKIMAGE_MODE=3D"auto"
> +=09=09=09# Sign dummy image images in order to
> +=09=09=09# add the image signing keys to our dtb
> +=09=09=09${UBOOT_MKIMAGE_SIGN} \
> +=09=09=09=09${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_D=
TCOPTS}') else ''} \
> +=09=09=09=09-f auto \
> +=09=09=09=09-k "${UBOOT_SIGN_KEYDIR}" \
> +=09=09=09=09-o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
> +=09=09=09=09-g "${UBOOT_SIGN_IMG_KEYNAME}" \
> +=09=09=09=09-K "${UBOOT_DTB_BINARY}" \
> +=09=09=09=09-d /dev/null \
> +=09=09=09=09-r ${B}/unused.itb \
> +=09=09=09=09${UBOOT_MKIMAGE_SIGN_ARGS}
>   =09=09fi
> +
> +=09=09# Sign dummy image configurations in order to
> +=09=09# add the configuration signing keys to our dtb
>   =09=09${UBOOT_MKIMAGE_SIGN} \
>   =09=09=09${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTC=
OPTS}') else ''} \
> -=09=09=09-f $UBOOT_MKIMAGE_MODE \
> +=09=09=09-f auto-conf \
>   =09=09=09-k "${UBOOT_SIGN_KEYDIR}" \
>   =09=09=09-o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
> -=09=09=09-g "${UBOOT_SIGN_IMG_KEYNAME}" \
> +=09=09=09-g "${UBOOT_SIGN_KEYNAME}" \
>   =09=09=09-K "${UBOOT_DTB_BINARY}" \
>   =09=09=09-d /dev/null \
>   =09=09=09-r ${B}/unused.itb \
>   =09=09=09${UBOOT_MKIMAGE_SIGN_ARGS}
> -=09=09# Verify the kernel image and u-boot dtb
> -=09=09${UBOOT_FIT_CHECK_SIGN} \
> -=09=09=09-k "${UBOOT_DTB_BINARY}" \
> -=09=09=09-f ${B}/unused.itb
> +
> +=09=09# Verify the dummy fitImage signature against u-boot.dtb
> +=09=09# augmented using public key material.
> +=09=09#
> +=09=09# This only works for FIT_SIGN_INDIVIDUAL =3D "0", because
> +=09=09# mkimage -f auto-conf does not support -F to extend the
> +=09=09# existing unused.itb , and instead rewrites unused.itb
> +=09=09# from scratch.
> +=09=09#
> +=09=09# Using two separate unused.itb for mkimage -f auto and
> +=09=09# mkimage -f auto-conf invocation above would not help, as
> +=09=09# the signature verification process below checks whether
> +=09=09# all keys inserted into u-boot.dtb /signature node pass
> +=09=09# the verification. Separate unused.itb would each miss one
> +=09=09# of the signatures.
> +=09=09#
> +=09=09# The FIT_SIGN_INDIVIDUAL =3D "1" support is kept to avoid
> +=09=09# breakage of existing layers, but it is highly recommended
> +=09=09# to not use FIT_SIGN_INDIVIDUAL =3D "1", i.e. set
> +=09=09# FIT_SIGN_INDIVIDUAL =3D "0" .
> +=09=09if [ "${FIT_SIGN_INDIVIDUAL}" !=3D "1" ] ; then
> +=09=09=09${UBOOT_FIT_CHECK_SIGN} \
> +=09=09=09=09-k "${UBOOT_DTB_BINARY}" \
> +=09=09=09=09-f ${B}/unused.itb
> +=09=09fi
>   =09=09cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
>   =09fi
>  =20

Hey Marek,

I've built images with both FIT_SIGN_INDIVIDUAL set to "0" and "1' and=20
checked the resulting artifacts for the presence of keys and signatures.=20
Everything looks fine, as far as I can tell.

Regards,
Rog=C3=A9rio


