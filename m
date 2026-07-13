Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F9DC43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 17:06:55 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.817.1783962409865929358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 10:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=rxy4v5Na;
 spf=pass (domain: axis.com, ip: 40.107.159.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMl3/TmjZk61Ycfjk4QQgJEinP4uEnfOjVmiRvVF/Pwe/wr8a9n4CjXIy22GWektDuQsxng1ILef7Zp48GkeUR3zUaSarkTfS+6T7u9XZ9AcIrlXSbDqx9kqrt0mPmsox0AXzuo7GlIXCrA2mL5y2J/LXLRYwIoZUWRuRULcB/Ek+oHuZTv8twZb4vm2mLUVULnGRdvV1XpDLlNRIGSJDMde01CcjQIh0b3mnXHEXKmQzjyWf2QVe6EJG08ILjSDUGGHwBajGhD9Ue9VENzCYmlFQnG4A7DrrfAkv1MdcaDhGOEFxCFifZ9aHCqiYQVJZYbqc94KEkglkO9OgZH/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxnqSMGuC6tw9cNgZXP+UT1JBiNgnkWE9q1luQCIfiE=;
 b=BP4m/Mi1k43c3ujrO8UOgxjcJC/0jA/su7rgjwoyYkR7BfEpLBRmAChxozwCfbFdfFKCIxXsdEIc6Dt1A7PQfi53wVxez8cpXgCjRb9z9bz69KRoKjJV1nb8vBma1QyBJYKBP4EeEEfjV3acbvheVJ6I7JQyK7FiWS0skyAsqIcjET1wSLOb0XauhG1E+AvPH9bJ92y0hkV3dtP5NWYE1mawO3kqaODOXQ+Fs9N3gRFOMM7MQjlhgxGfFV6KR45Ir0/UuJBjE9eYwE0PkL0MgtYf1xAdvo7ekXawFGBPyHPBo/D5R3hYXEaK5NUe6DB8yZKtv1EUKRlidPQoYQRSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxnqSMGuC6tw9cNgZXP+UT1JBiNgnkWE9q1luQCIfiE=;
 b=rxy4v5Napo87UHnaeIp47nVaRQY2yzPO+2XjSHKJqvZuQUhyIzZ/L3EmUCUz0vwyWeGBib5BDOwjRSUSNBamwSVEMAWeGShq8iRWavKWbjkjttP8XycbDwCp9Z9bANM/jpbAYP+q3Ii9DW+KA9VMe4lrcnTAyIzCkTP1ovDU/IY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GVX0PFDCA80BF33.eurprd02.prod.outlook.com (2603:10a6:158:401::b24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:06:43 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 17:06:42 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Vincent Davis Jr <vince@underview.tech>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v4 01/27] bitbake: globally define
 KERNEL_PACKAGE_NAME
Thread-Topic: [OE-core] [PATCH v4 01/27] bitbake: globally define
 KERNEL_PACKAGE_NAME
Thread-Index: AQHdEi5ZNzB35vCONkKvf1aM3FmrnLZrrKKw
Date: Mon, 13 Jul 2026 17:06:42 +0000
Message-ID: 
 <DB5PR02MB102131BF9EDB1F84965702DABEFFA2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260712184307.3259642-1-vince@underview.tech>
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GVX0PFDCA80BF33:EE_
x-ms-office365-filtering-correlation-id: d2c4e130-82a0-449a-4f07-08dee1011ce1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|3023799007|18002099003|22082099003|11063799006|5023799004|56012099006;
x-microsoft-antispam-message-info: 
 yMPH17bA5Y6j2Z0P/Zydiljj4T6DxCSuSWh1Fs2nLvu2s92PeBHNhT5HpAok0V0rC/azvcGR94Pi3RUq4zboNsaNb7N/RXKTXGa+ikdRRQe5DLo1N+RldmUGqrEQzfo4DVloWfVeNl6jvUaC7bhlm9En644+pETc3d6nrrD5MOvssVAtcNGfgONejUXVDEEauak34rpPGziXPjKoBltm1TEckLQPxlWTpIp3DpvB9+PNIQEt83IZjZPTLfPE5wAUvU0QLkHKXOz2p4eHo2GdI/y79lnzCVV6CF65iQ/qsOCur0PBdgbLpu2tBEGK01Y5ssz1V/5XYcarrUwTUlZin1Qa27HfGTzFXmtqdg5vZ/GaKSGnJmN+CXl34s+CsRlA3UGWqTKauGMJp15mah+JmNzShBzxLF5C6ETd+1EUOe9bTtYkQizmRN/F72JFDFJJ3FDRn9vt7/GSFz/yYSQR2JJzrBt1BeN7gpqmIdTzgkcyOFsRed3j1jU6fT7vBhCRsLEZLFsUT9w3vsOI9pAWtc1ygBdzISwEf/viIzpAyaKb4CTI2AUFt+CeohTXZ/rLYY3a7WDrfobvMm3+d83/D/G5tI/Q6MtpHcl8jIcNWEZZpeGxe7Enb4rFj7MzCLbuQ/Of16YjUlxHO2A2TtPlwYxd/dUh6xKHPvRz1p4eTGrK48THkdbZIPWxUTGEmSR+yRePRsarWj93j/HULm2pXbKIs+06IMlWiZ7kxOlbKOU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(3023799007)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?UNlj2u9cbZ5Q5Tez6AhV+qsJkVd5echm9t4I+iYx3dCfscoRwoSEi71iGI1d?=
 =?us-ascii?Q?tvpp9ue0PO//i4zK1l5T8SwKTzV8pBX1pmTZJs9i/Z+nyLHYJCrYd/vTXM+C?=
 =?us-ascii?Q?VF/myuFwSvdM3VSTDQ+5nbOrvsmPje3qau/GdN6NsTl0tmFXoQvOSRoayIpp?=
 =?us-ascii?Q?76DrVVcN/dkfRRIEEmai/0VbwzP/Vi4IR0MtUK6YODtpmbzTXj+c76sc8U8a?=
 =?us-ascii?Q?UOSnfgdSbyCmyQIhaMbCCj+EbAmOBR3fmSJ7emUAG6n75nKkdv3YApwLaKSK?=
 =?us-ascii?Q?H4zzvNOT8vjaNITDKaeY7gRrVeJfkv4ZWJgPOXdGgOd323EOWkwQeD573wkP?=
 =?us-ascii?Q?RSQUImpUgb+M0lTcc1QxchKl93aVp+wtzvUoH3CWpYxlkXslIPf8ZNuj8Yao?=
 =?us-ascii?Q?ACGx/0lTfacVoZvDAa8yErdxbvXOBCTXbBxplsY7HCpAjoAZ4TmcD4cBctbu?=
 =?us-ascii?Q?bmJqAcyvj4m+SOfpy5Ga9R2kZvyXn9aIhP8WXcKFJcQBAHK0eMUm+Qi+Zk41?=
 =?us-ascii?Q?XoJ5AqZwm4rgz6ydneTk0uAXm1cPTujSZGPbc4xEq1UMGZqnvXrssZ7hfVmF?=
 =?us-ascii?Q?m8QcMOBjCSebJRyivV3Mx5gRQy5WtLM76UTjmNHgYaEFpIRbpIm59pn2+8t3?=
 =?us-ascii?Q?20rvz3if6+hu7Fyt5vu9cZmZf383p+kf88Zfj8focpqPxh7DlFQz4Xq4FoRW?=
 =?us-ascii?Q?ZtZIdqxnhnKSFRx7jglJ2MpI3qQemMw4auVTVjggiYXoIKciCb+1lbh739r1?=
 =?us-ascii?Q?yIFVfhb3FieCD6JCl2YO01hb/+va/lg0H56AqmsSIBPonQs/KevCmv8SS5KM?=
 =?us-ascii?Q?wGxu9CHtlnnGXoy7eq6P5nXauq+KK72GIftu336tRyEuTFUgqGUMagESQld8?=
 =?us-ascii?Q?Np20pi08EXXlQ6JJwXKaUigCLVyERDkl5IsKp7T4GH3BTpTjitzkPJOnP+vJ?=
 =?us-ascii?Q?H8FZAJURhrSWbSTWvdhY8yL6gu8dtbifVfWhpy2VyLsM/5gAP+KjqrgYvbSu?=
 =?us-ascii?Q?h89WrdwHvQkIzqgjXOnG+Y/NKz2jrfvctXgjW6MtrEgrC/mSCqjYVqFh/Nb7?=
 =?us-ascii?Q?RfGr5L92zqTtRHN1jmGxOUMtBHp+32+/zhVeLJJs+DrZiEmaDmGgL/RwZxoS?=
 =?us-ascii?Q?IqHWG3rTYQVnl4xWyltp+diL8rXkHD7CgI5dRCuxAXBvz1zBNo0Y105dx+mG?=
 =?us-ascii?Q?0K+jS778pmv21Ow2mP2evj3CM39YdAi7D/Bh7kZZjuIr2256g9Ld29BMryFI?=
 =?us-ascii?Q?SCyaRwm7Tg86I4X+1gmouu4x5D9KqRPmpqDEPEz+ugARDDsviH5RwT+ZIk+1?=
 =?us-ascii?Q?Syl/SLG0wT81/X8B07FAiFlfgmO+1hZbrE1rrk+ohaL27SAfsUggwNMeUCU3?=
 =?us-ascii?Q?X23eyAIaUANeZ8iMdlKXSthyp+XBpPifGR/Z2SwSldwlT0FhhR+JEE8c6orY?=
 =?us-ascii?Q?Ftes9Z2V4c2JnQWSIrtBaQdLd0S7lubOPu1FVtIdfCrU8M70vgIctp3vuWIZ?=
 =?us-ascii?Q?9v2gUwICuUYN4Ltqooq+8g2Q0V6iKWRoj/p21AuxE2gZJnnfGODGGTMw/RLt?=
 =?us-ascii?Q?U1g1MkVeIUJNnOdjEBfilTYH9jEAYPuaXafKdqJ1CIXl5CPuL5zxKc3JeWkb?=
 =?us-ascii?Q?1hEDfTudJMA+MgxINY0mgHfVC/pK/+dF7vwWXMeXf95d4LS3BsuQfadguufw?=
 =?us-ascii?Q?305D8x8s2teZKM0zyautzoEUs8g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c4e130-82a0-449a-4f07-08dee1011ce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 17:06:42.8412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAj4FKHmj/XIkYSta5AE4HHhxhITvjhdwikLXssMSPD6rqP7AoUjSeTrakQtMaah
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVX0PFDCA80BF33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 17:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240847

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Vincent Davis Jr
> Sent: den 12 juli 2026 20:43
> To: openembedded-core@lists.openembedded.org
> Cc: Vincent Davis Jr <vince@underview.tech>
> Subject: [OE-core] [PATCH v4 01/27] bitbake: globally define KERNEL_PACKA=
GE_NAME

Please use `bitbake.conf` as prefix. It is very confusing to see=20
`bitbake` used as a prefix to mean bitbake.conf, especially if you=20
like me have worked with the poky repository for many years where=20
`bitbake` was the prefix used for the bitbake repository.

Personally, I think including the file suffix in the subject prefix=20
is a good idea for anything that isn't recipes, e.g., bbclasses,=20
conf files, inc files, etc. However, I do not know if there is an=20
official stand on this.

>=20
> A number of recipes rely on hard coded
> kernel prefix set by KERNEL_PACKAGE_NAME
> when including modules. This leads to build
> time failures such as.
>=20
> ERROR: Nothing RPROVIDES 'kernel-module-*'
>=20
> Commit globally defines variable so that
> recipes aren't reliant on hardcoded 'kernel'
> prefix.
>=20
> Commit also updates variables
>=20
> STAGING_KERNEL_DIR
> STAGING_KERNEL_BUILDDIR

This should be in a separate commit.

>=20
> STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR get
> changed from default defined in bitbake.conf in
> the kernel.bbclass. The reason was to set these
> variables to directories under WORKDIR in alternate
> kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel)
> so that they may build in parallel with the default
> kernel without clobbering. The issue is that the variables
> only get changed in kernel recipes. So, other recipes
> such as perf and make-mod-scripts don't know the
> location of virtual/kernel WORKDIR.
>=20
> Solution is to include KERNEL_PACKAGE_NAME in
> STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR
> so recipes like perf and make-mod-scripts can
> find virtual/kernel source and solve the
> clobbering of build artifacts issue.
>=20
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  meta/conf/bitbake.conf | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bdf37d0da2..569b83a138 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -479,6 +479,9 @@ SDKPATHINSTALL =3D "/usr/local/${SDK_NAME_PREFIX}-${S=
DK_ARCH}"
>  # Kernel info.
>  ##################################################################
>=20
> +# Globally define base string for kernel packages
> +KERNEL_PACKAGE_NAME ??=3D "kernel"
> +
>  OLDEST_KERNEL =3D "5.15"
>=20
>  # SDK_OLDEST_KERNEL can't be set using overrides since there are
> @@ -490,8 +493,8 @@ SDK_OLDEST_KERNEL =3D "3.2.0"
>  # they are staged.
>  KERNEL_SRC_PATH =3D "/usr/src/kernel"
>=20
> -STAGING_KERNEL_DIR =3D "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
> -STAGING_KERNEL_BUILDDIR =3D "${TMPDIR}/work-shared/${MACHINE}/kernel-bui=
ld-artifacts"
> +STAGING_KERNEL_DIR =3D "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_PACKAG=
E_NAME}/kernel-source"
> +STAGING_KERNEL_BUILDDIR =3D "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_P=
ACKAGE_NAME}/kernel-build-artifacts"
>=20
>  ##################################################################
>  # Specific image creation and rootfs population info.
> --
> 2.43.0

//Peter


