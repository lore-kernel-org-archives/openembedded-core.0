Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763AEFED3EA
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:41:00 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25816.1777045258831098325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 08:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=fjIwUax3;
 spf=pass (domain: cherry.de, ip: 52.101.70.37, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBxT/E/W5ixSLVPBt1gcCE4QoQLgMylw1YDeo3vmSjOTgKtuzz/F86lIQNoc/2ZlWTCuPf0jXKUEw1SIhLD44q42U3OXlbUnyKp0kW8kEsF/sqaS+ul+PkFvaj+PUdCIwa+n/rrTuZ7u9f0Pm6nb5F58AwySjObvEJ61pprJhlsPoWx49AnO0+X5LjgC7AWUYYUKCfha7oBCnn3PLDwGHp50yosL/jBvVMgyQo955OTpWzus4+BtTYcBreDjYJTq9p5aNRD6niLcUbCsTwdISrPyIzpmpGt5JATgupdWBFZwvjJyYJ/v7PHEiMxmx3KC9SxpHV/vCWobGnv5anaWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw7MnkHiFd5P9qV69XEImTAWcwLB6U0Fe/gMPVh2cPs=;
 b=Kyq+iHl0+adalCuFVs7Hje8j5C8/mAmYXnL9Pd1zXWc2apIOAtaxrh0twbCg4F2NDkCrd3L4AsVNmTorMBduReJL18+tqCcFSDcFbN5JJWwF4baO7DDNjYxUlxse9qoS3ChYoVTZROBfwPpqhdh/NFFR0s4VL+FZPqHLkEV0CyNz9XM4qyJ16hUcsVTvGZtGuM9a+3pCBU+gD4Kh6xwvh8yWeiqZNL4i3NSjithAnHWtcHcXsjRtsRBpZ10LWh9fsGoUaJn47oeVyJZSG7OhgERpBgcEfL2eoMXPvKDtZmFk+400SwNNQ050C6NQRrPQnQ6uSQ15/SlE2kaj1g/q6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yw7MnkHiFd5P9qV69XEImTAWcwLB6U0Fe/gMPVh2cPs=;
 b=fjIwUax3T34Mv0RgXIjMS/XmmXKY6O2ebsdfmZVq/zu9KgPb356/Fy7ROjkub6rS1QAIKRGd1aQjMwb3y2edjOazUYm3nroi184UBsOvO8Q6UoLJvvqlMXbWpUf6WDHvJltOybCYhEyFuC8mhYod7GXTDXjjktH0508iSuYlczc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM0PR04MB6868.eurprd04.prod.outlook.com (2603:10a6:208:18c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 15:40:54 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9846.017; Fri, 24 Apr 2026
 15:40:54 +0000
Message-ID: <f038565f-4a53-426b-990f-d41e9d1e3732@cherry.de>
Date: Fri, 24 Apr 2026 17:40:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: simplify conditional operations with
 bb.utils.filter
To: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org
CC: thomas.petazzoni@bootlin.com
References: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:802:2::33) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM0PR04MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d8bc64-a294-4a23-f1ed-08dea217df13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	32YztVWFIjtb7Nqaf6hOXHWE//V5yMR+jIJJ45V7RvCdc6jiruIZQgel8OcoOAb9WMgANT8aCgWZ/3+wR+VlmtLfovSqYwmDSQSN7pxXHnpw5mntjI643smVYARZU5jiv+6q/0tQe8CXtzQt7Mpf7tQ3CDL5L90NWEbrZdS3kfcGfw45oLDV2dp3VjneWDxXOiPmlSmK72iUIZrX37XS5OJkx5+2/RFlIGjy6Qbz1XK6CVs3U49AoQdjjiN3N6fSbAcnYjyu6wqVTF/oK77uRsLbZakp0ILcfnKaSDmTDlOYZtkARap+5rMSTv+WWX66vMzt8cNPw3PsIvRU94zgh/QtccunN+pkK0/GgDyU/Z46ADFNin6IY9F/eii4mQbYq/Rwa1exCv7mhTB/oJ2FhfWP9VOQFt7EgR+dhfGb0aRRJXBxz7r1C6A9tBv0DixXNzJmaN1ns9/Ws+B5EbtaPkPwy6VGnQ/2armSqNF/GAQEWNaITJLN2KRdLTlZ++qxwwPSXys0fvXdaa+WdDxeNxM5YbcnLpq0PV+UOaP7aRqlrwvkuz3hJZgCcXo3vAbl+y1l/XPCOuky+9vYIabpF0ZLdvo5yP78um+gfbJpajmDqpVhXCTQnVBhs7nYIWirvt5eRgNHwVmLpPGjYChQu1geiM7ISIQ+skWuLb7CJv6rZkGGs9hsvVZE2BSO17Ct2a5jY5U0P4Dhi1GcF6qAOUX+nsm/8Y1B4Zw0qEONe8Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dPMicqn3nAh3fCGZiOKFDzKGlZTt0QgU082ZZxaaLguQ3ZkhCUZpp8YkAYhm?=
 =?us-ascii?Q?rFKap+YdEwpQMMLeKCwaT3I0krE2jnKycmizOQ9MCtqEmIdTs7AurQrb0KL4?=
 =?us-ascii?Q?NpshulJDsobveD5/1Yx3zf0puy7AZ9IDIugpHp6VDGdE92WcS9JGXHuDxLk8?=
 =?us-ascii?Q?ZQMruEKEsJhzdl5gty5Efqw72HyMUACoFjezc3fVgmtuArqerUxnRmw+WRxp?=
 =?us-ascii?Q?UMnAFEFhVJIxOYeQOz6aqSKEY0P6qdjOsArQjsJrojclSDYcBqS4ZxgINUmC?=
 =?us-ascii?Q?K1aEKtRYOvudPIoqkGPaUKWuxMZHq32SfCtPe+oqiIQ/qDs74b0vaKEcVMSK?=
 =?us-ascii?Q?o6w+VrFl915uoMjke7KfBZf6y1C/oC1n6IHGC2CaETS4EgH4DQarFwelgtT0?=
 =?us-ascii?Q?Tmu/+kGY1ZdbIYpbDkIxDPBmeqHYOv6wGefCOMVePDipneWbyjcLnFqyuumM?=
 =?us-ascii?Q?VA/edXorbZ+iNEhHjWJpr69mLszepHQA+WCaF3NA/StqGU50iYKsYe+Gq2+N?=
 =?us-ascii?Q?0Gxpqvq3isPLvScgGDStVK4GNIiIx36vlEQWGRJ2U7JRM8YJKnpuxQyDPyHJ?=
 =?us-ascii?Q?KG2if/CMVTCELJBx5nrA5wE3DAksd3JAwupk/10x6mmcoPzIHzh2rsp9Bw7H?=
 =?us-ascii?Q?x2w157S8hlD5LsfUlZtbOOg7D8VJQ3t1mcVgye4/VkiZPirD9m1U+F/Ag034?=
 =?us-ascii?Q?7f4EtmDNZIZlxsF5q3dtAR1hMk1jxQEXqM5LW/oKMEHL1MVoIRBkYZMYKbed?=
 =?us-ascii?Q?ua9tYRLpFWtsV6mSFkDPabYCLbTu7v94jEFtbwbDzXoJyA0azVhGtjSdeEUZ?=
 =?us-ascii?Q?wBVoM35Ra9DmPRqUQ2bcwhdQqVy6s85V+Gza+dr59JzWw6OWdJJ1TIUBm23b?=
 =?us-ascii?Q?RlJE9rC+o/vYb5BXJFsjWJ+3xHfj2Pwqk47bkBtTHWoor0KEcPipAaRd/+9g?=
 =?us-ascii?Q?eU7QVo9flRRa1B7ksm5kxHYaw1KWNccn8wvKe22rs5xsk9qdO7lNAQz695Vb?=
 =?us-ascii?Q?nXXLxVq3ugm86Hqvezwc5kp1315h6FSrruW+bkFoT7DoMbVsBMmXBUd4G1Hy?=
 =?us-ascii?Q?kLt2r6WhabcX4c9aT38BofD3cJ/JdvFvjKcLPHhO+Bt5s9fskEhFB5vF2C7G?=
 =?us-ascii?Q?lYMt/ddoAJXczPCm6tA4GHPL3AeufWJNeJhhWFOsK8FOqzGj4QKqKQOKHodb?=
 =?us-ascii?Q?KtE6xLUVMj/FLzgRcuh7jEXPM5G6N2VIVh8QDQnBXuG52jkQAqAI3wNvNapu?=
 =?us-ascii?Q?qb8RLDumWMe01FngJdL/Ssu5ZMryXcCIOuyKVRCre0vOynyarurNYMW2Jx7A?=
 =?us-ascii?Q?5sqkldQS0Sw5ODcz9v4ZIrO2hcpYkLz4IHd7DCIvy78P6vVuo5WRTW2UwqTY?=
 =?us-ascii?Q?/cLTNvnjFC0jkakZsEkwMXANxp2G60JDtpQwf+0WJafSXdDK3u/C8t/Yd7se?=
 =?us-ascii?Q?Rg+N1YZ1BKelxpjhgE1zskJMRhF2XhCiRihvDrlzCTuMnC1JWsiybf/p83Oe?=
 =?us-ascii?Q?5AOVzV5ezVI2vTJsdWkuptRHRGoG3EtGs3cwQUJovRSVEyF5MpoXMkKCvhxJ?=
 =?us-ascii?Q?o5NdW6OwTNEYzd4PEF1Z9zw9ktWXS1qJS++5v6LcT5SBHaxB1Bz/MwqStdSl?=
 =?us-ascii?Q?j68BY/zLRVTS2mQ674wkIwk5KIwYPNfsOoAahS+Q49jHJq83X9UHcNqBmecl?=
 =?us-ascii?Q?3oi12zyFMw8hFfo59NH0Vdx79QCDEIXmPPbcr9u3/UkbyHSsgz1ID4pPV2ep?=
 =?us-ascii?Q?sshMLx9494NRegA+bp6oGJcLJ3wpzdAzcUmmHiX6USdLbmR0e0nM?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d8bc64-a294-4a23-f1ed-08dea217df13
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 15:40:54.4899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbT8Amg9NN0tLYsTL9Z377xrGO28YQ+6OkfhLb4iz2t5EOLYjn4Mj9PaTp+qXzO4UXT6a5Sb8wF+5Ihhog5JFs3XaEo6pjYWqQHOj7gWLj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6868
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 15:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235870

Hi Jo=C3=A3o,

On 4/24/26 5:17 PM, Joao Marcos Costa via lists.openembedded.org wrote:
> Some recipes and configuration files use bb.utils.contains to check for
> a string inside a variable, and return the exact same string if true.
>=20
> This can be simplified by a call to bb.utils.filter, since the result is
> the same, and the inline is shorter.
>=20
> Replace "bb.utils.contains(A, 'a', 'a', '', d)" by "bb.utils.filter(A, 'a=
', d)".
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   meta/classes-global/insane.bbclass                        | 2 +-
>   meta/conf/machine/include/arm/feature-arm-neon.inc        | 8 ++++----
>   meta/conf/machine/include/arm/feature-arm-vfp.inc         | 2 +-
>   meta/recipes-connectivity/connman/connman_2.0.bb          | 2 +-
>   meta/recipes-core/coreutils/coreutils_9.10.bb             | 2 +-
>   meta/recipes-core/ovmf/ovmf_git.bb                        | 2 +-
>   meta/recipes-extended/at/at_3.2.5.bb                      | 2 +-
>   meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb          | 2 +-
>   meta/recipes-graphics/waffle/waffle_1.8.1.bb              | 2 +-
>   .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb          | 2 +-
>   10 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index feddfe0335..04700be71c 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -46,7 +46,7 @@ ERROR_QA ?=3D "\
>       ${CHECKLAYER_REQUIRED_TESTS}"
>  =20
>   # Add usrmerge QA check based on distro feature
> -ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',=
 ' usrmerge', '', d)}"
> +ERROR_QA:append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge', =
d)}"
>   WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
>  =20
>   FAKEROOT_QA =3D "host-user-contaminated"
> diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/co=
nf/machine/include/arm/feature-arm-neon.inc
> index 174b9b9f2a..2ec354bfeb 100644
> --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
> @@ -5,16 +5,16 @@
>   # 'vfp', -mfloat-abi parameter and 'hf' suffix is implemented in featur=
e-arm-vfp.inc
>  =20
>   TUNEVALID[neon] =3D "Enable Neon SIMD accelerator unit."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neon', ' n=
eon', '', d)}"
> +TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'neon', d)}"
>  =20
>   TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with 16=
 registers (vfpv3-d16) unit."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16',=
 ' vfpv3-d16', '', d)}"
> +TUNE_CCARGS_MFPU .=3D " ${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16'=
, ' vfpv3-d16', '', d)}"
>  =20
>   TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32 re=
gisters (vfpv3) unit."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' =
vfpv3', '' , d)}"
> +TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfpv3', d)}=
"
>  =20
>   TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv4) un=
it."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', ' =
vfpv4', '', d)}"
> +TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfpv4', d)}=
"
>   TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv4',=
 'neon' ], ' neon-vfpv4', '', d)}"
>  =20
>   TUNEVALID[vfpv4d16] =3D "Enable Vector Floating Point Version 4 with 16=
 registers (vfpv4-d16) unit."
> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/con=
f/machine/include/arm/feature-arm-vfp.inc
> index d020100daa..be0c19bd03 100644
> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> @@ -3,7 +3,7 @@
>   # and this .inc file is included from armv5
>  =20
>   TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vf=
p', '', d)}"
> +TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfp', d)}"
>  =20
>   # simd is special, we don't pass this to the -mfpu, it's implied
>   TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s' % d.getVar('TUNE_CCARGS_MFPU').sp=
lit()[-1]) if (d.getVar('TUNE_CCARGS_MFPU') !=3D '') else ''}"

I'm pretty sure your changes in the conf files won't work, but maybe I'm=20
wrong?

Before, we only added a space if there was a new tune to add. Now, it's=20
always added.

Considering TUNE_CCARGS_MFPU can now possibly contain only spaces, the=20
check if TUNE_CCARGS_MFPU is not the empty string to access the last=20
element in the list returned by split(), which will now be the empty=20
list, will raise an IndexError exception.

You need to adapt anything that's using this variable to check if it=20
only contains spaces or at least remove spurious ones, possibly with=20
str.strip() for example. Unfortunately, if TUNE_CCARGS_MFPU doesn't=20
exist, d.getVar() will return None and you cannot strip() on None. Of=20
course, considering TUNE_CCARGS_MFPU is declared just above in the file,=20
it'll always be defined, so maybe that's fine to not check for None.

If the space didn't matter, we probably would have used +=3D instead of=20
.=3D, so I'm wary of this change (the rest looks fine).

Cheers,
Quentin

