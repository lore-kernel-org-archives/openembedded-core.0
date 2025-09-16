Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017C4CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 00:25:40 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.17])
 by mx.groups.io with SMTP id smtpd.web11.8103.1757982333646908029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 17:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=AvRUfBgp;
 spf=pass (domain: axis.com, ip: 52.101.84.17, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjepSciU1R9DyJ4Ct5WMw8ZklPz9VrQNSXWtAelhEz/s9+/Xb4lkkEMUhDBD4y+77bKu1s5bHlms/9KWF3tNcRPGwBvW8jNzZuA3/9JV2CG1iu0BJ1fowa+jG6ogtidr1S/tJ/4ZJnvEY1XiKBS81gvPoMHnEGubgUQ3y1kCbPPasF2VsZ8vH9L6KdOvQYQhHGESUB1OwIEZ7Pkb0eNK+WYEQhPaoMvW3k9B1q/VGnrf3HRT9DPMPBjrPawX/OIt1ExdvrufomY5fNsGKyqr3W3su5ABGyIMeW1SHOiRd9OW78BuCNnsUnygkjaM/zUExpgYn8JrLVvDOExWVBOuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btxWOsIZLRa8nph3H2h/hSu686JwBivFvEite/aQQNU=;
 b=IGfim3ejLlwjsjfZyzy8oS/FWgkvDaGE49w2/m8TtvKZWj5LAC6jxi3fmvuh1h1IhMcdiAJRxGkqEX9TiaU7EN4tx9OEcl0JtaH+/2QPoXgQBBA7P4znOCcYn84mudeQ2aoWguGPJtjAA3ldLbYx0ldwhbjuW7qzydeSGyWsJPTPHg0eQz25LGXem2KIVFikgbLTgHvKxrPFFsDW7MMVFv9O2iNjxNnrStrRlq8WXTrEs8BDm9DhDUrVLNz0nz67+r3pc6wvgZEBgKEm9QNSzw0W+eSZmTmlv+RiKygLPQDKEMmx6DbkkbOMmYVnrkD+hl3kGTi6psUNvDlB9ciNsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btxWOsIZLRa8nph3H2h/hSu686JwBivFvEite/aQQNU=;
 b=AvRUfBgpG7jAUOf3dFI3ctoj30AVAiwVVFGTW66FZyneTwBXQ2CqYo3v/SbvT2QU5yvdMrlJpVui5bvAMkdUl0dRb04EDevwmym1yG1vX160XPuU+4CTpoiXl5cpEr6NCnOj71h7+Kw9xxUgpcLc4+r3H1jOCvibnvcg902w2gs=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB8403.eurprd02.prod.outlook.com (2603:10a6:150:5a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 00:25:27 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 00:25:27 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: RE: [OE-core] [PATCH v2 2/8] distro/include: Add debug_build.inc when
 DEBUG_BUILD is enabled
Thread-Topic: [OE-core] [PATCH v2 2/8] distro/include: Add debug_build.inc
 when DEBUG_BUILD is enabled
Thread-Index: AQHcJghkpkS/fcd6ykeTq7cfK1jR3rSU9LsA
Date: Tue, 16 Sep 2025 00:25:27 +0000
Message-ID: 
 <DB5PR02MB102139D0B56D4D14DDAC711ECEF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250915061743.313230-1-hongxu.jia@windriver.com>
 <20250915061743.313230-2-hongxu.jia@windriver.com>
In-Reply-To: <20250915061743.313230-2-hongxu.jia@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8403:EE_
x-ms-office365-filtering-correlation-id: 8e8bbde4-fce2-4d35-8e59-08ddf4b7890b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?4WJBFQc7jLfqSazeOAnVwRlI7pvVYwQt97h1bVE6qhvZyZJPw9ZKSVbpZEo3?=
 =?us-ascii?Q?WSOFcGIopCMNS4RT+CrYa2lo6bFogF4G/Yarjn0kGd1+olmXP9RDRmK+inWL?=
 =?us-ascii?Q?/eevuubn6w0aSzqkfqf6pA8FbqEx9EWvfAdk28DyedBy+S00VBUj1raaCkIf?=
 =?us-ascii?Q?nkoAQI8HKNi/BGGMdvXO5yqbph5sfOPF5zTu5lSVPf6n/SY8LzvML0Yk32oX?=
 =?us-ascii?Q?ViLaVtV/lJv9wBlLTYKBrRcSzg8a+reRzPkJgdDfrQYbsLS61qEznzrdiHbq?=
 =?us-ascii?Q?B6iNFf9mTUb96MlAys/gX6JC3X/SamLl2jDE1UUZzktcjpym6stCEgGhwZFY?=
 =?us-ascii?Q?02+11Y/di/0KlCu79HmHsZF2q5FyU4iL8RX7S+YIxC5WMw6Q6MQfw6YZP1wc?=
 =?us-ascii?Q?XOJEnfIK5VHaUwvBn5Ere81tv2IYldFGNKatdrY1Su9RTSRg5KBhm2KMJOj1?=
 =?us-ascii?Q?+PXre2YlAGKOzHNvhzMqdFAffvyi1Q9r1DIMcXoTuXlwmE+bznS4EGCW8if3?=
 =?us-ascii?Q?GyeVM/uPmu7gmQOpoKERPIOvYIcnuRj0L4EEJfI2qYDefzsNwFWGfHwfgvtw?=
 =?us-ascii?Q?x14dp7zYkS5UgqegIIIUhJs7dVW7ujRsVOV1YYMr6HYrrpbORElo4QgObbxc?=
 =?us-ascii?Q?NZVWVr+1JE2xFqLv226poEZBW8t53ascLQSIayBvtr7qA22oV+YcE0HWBKal?=
 =?us-ascii?Q?HByMKfLinL9HuIEecJMrrpTN3xe3CTALunGJkuVb8wxW03F6q9SqNpEe/iv2?=
 =?us-ascii?Q?KMQ4/d3ALulqzzK3lFCdXph6ISQUgCnTFXWEsmG7lpfb9qsoVkn0qRbrk9ZZ?=
 =?us-ascii?Q?8E5iRQIz6Dx9664/J5ucFM7bkx+azlCJJBsXaW9x6FABfrHIe6qloBq7PI6K?=
 =?us-ascii?Q?FhpeIYoHsPIeaLsGCyrauvq4DpZRPXuc6Mk8RBod/DNTgmECSRCASV92M5m3?=
 =?us-ascii?Q?rWyu9XOwUtMneStKFOFnaehy0/rGYzPvoio+xW7e5NBFtxTiKJOysIL6XTpf?=
 =?us-ascii?Q?G8OoMaMUzv/8hvfWELQ6Cn1yTSLTRznhHz0PSUUI6LyNawRPjfcQRoH+Kuwj?=
 =?us-ascii?Q?uT9ZoTNJOvbU0WmkUvi6DgTlQ5P6H9ps3uwJRgaHkzeC8UmROyMe6450Myfu?=
 =?us-ascii?Q?xGSV5FqrygVI3G6J8DSFT9XF/rsMZTQOMeqdUUyhpAtpjNYfSfi8DhMnocpV?=
 =?us-ascii?Q?/l4tEQeZ3WgTPYExzQtV8BuI1wPLJDxUxN1BSNfTXNMxogXfHRJ8gBp+tH8O?=
 =?us-ascii?Q?UHAhzRnZ9D/zsy5vbMckGIIaNGz7l0uMnqbnOPn9+fGvtZFiPrSw27eaers/?=
 =?us-ascii?Q?ZebpvV06M0x6weCnT6zM493ivWB6Yw/lVOAHZIqI4UAMQZDWSeahW4nwhjQ8?=
 =?us-ascii?Q?G4uInwqkfSIebEcm6ere8MthdqtnedMsqdGbyNbLY/2+FGLBFwtPDKRPNONV?=
 =?us-ascii?Q?Fj3kPazWWplYoqQhHUIzZxt/ilfhlkz1AQC52jqu9IJubJpd/XLcc60/xnmD?=
 =?us-ascii?Q?Vx6VBsOjf1/fsGA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2sRgz4i1cd6YgBBM9l+sfSvVi4nN1cmLrN+V4k3so7Rd7tD+i0EnV0TLS22H?=
 =?us-ascii?Q?a9B3CdLGnBJzGdfp740DAk7mFpWOn5UQGmrZuxiDuCSpZFnqEUv/gYTONluY?=
 =?us-ascii?Q?K9N6eLL+sz2TRoL/3l92pZOfRhY01baADfjnYiTO35St2aScxCALb6qwsien?=
 =?us-ascii?Q?RDWlRcQUpqfLYA1siK1WEjb0oUctco9omXBKylFbtwDXcfBmNLxQDso4WXQ4?=
 =?us-ascii?Q?2Mo6TdCON53hVybIMZmF0DxYvSr3Ru0RPSgAc5HZeNaKiBm0HucdKk/mfas4?=
 =?us-ascii?Q?mZR1xufvz5WHz/IhuFxv9L2jGaVmKvcrinoe3zmTctni9bDXg1wL0v7TTvFI?=
 =?us-ascii?Q?W1Fh2R/7HPyECRQQH3fnYRhneLIxKU6hX1+0Tx9WjS2wiRoC+IpzGI+5StLt?=
 =?us-ascii?Q?mdd0c+DUbrDrTBk6Hk0qHGIX0zDyulo4/5xthogOHja1CDfG3TD4Pk7PrLVL?=
 =?us-ascii?Q?ghIAuQmvsIc6CRIKxREzCMPwfLJSkKz5V8ueXkz332phZVYYeUQw7/1ULPMs?=
 =?us-ascii?Q?5U16dzVx+IyIAYJKpv3CHEo4IuAfgUNnoH5/PR+UkbuK/rlal5aFEzjJ/W1Y?=
 =?us-ascii?Q?kQVZasuj+MUt3kDI9x9BvdaQBbh/87c1/z2Y0SWd9bObz/8/3SN4IQ9Dwesd?=
 =?us-ascii?Q?wbKMJBim0Da5RJ7bpJMQMyug0/1UYyLxSeONn+BC0NXzj31HrW+gup3ZUMKv?=
 =?us-ascii?Q?oEAmlPpLMqVNtdeHiK8ZZodIkjAg1Opnxmx8s+BrjFuCfqpMx3E0pS9Wzqc3?=
 =?us-ascii?Q?Np/G/MPmVfCWyQCy/ZCyFq341uEbflRtlJi7Ko6r3GIGKBjBz4miiuy6XDmI?=
 =?us-ascii?Q?TrtQI5el9VugPFgLUX1OHKqV0Ch0djtf6gPmOpOfV25OGa7/9qnFkmQbi3Y1?=
 =?us-ascii?Q?5iTXwAjW+3Y7AajRY6sScdF+lmtoyUb0kV5z0ciqijDt8k4unkGjxUlCeew2?=
 =?us-ascii?Q?8HEvEzUTyyfKLdal4i1wn54AMVShKMFPkl9AWcKwa+G1R5sPjUEYRexetWy8?=
 =?us-ascii?Q?4EL0NVZbhN8fPAQXKMMtghw190HG2FEwF2jflRlcjkhSsh4URbWRv14GDDwo?=
 =?us-ascii?Q?+UJt7wwefmaYCEsLmZ+41GkFBVuqkLQ5mG5ywbDshyDueT8SAuqEkY04sUjF?=
 =?us-ascii?Q?YZoyNSNXSbN7x5vnXPtreItnUZ5US3TnOk5Nnq9KugX3WJso+bSDXprRC9If?=
 =?us-ascii?Q?4IOJXgD2C4YZCmCYNNtLm/6zu0KaxyHJLaFgyg+zbYApbrLo2uRYvzLv/O/m?=
 =?us-ascii?Q?Ch7cPyF7ntLn7O7TBk96Hl7vDBRuRVxsNY8mdiYpCGL6rTL7IE+dojXcNxme?=
 =?us-ascii?Q?wtbltTk1c62MFkOXupdpPEU6XHyRUpKA4mDpGAr7CYiohhT7GNw+QR4dQfKD?=
 =?us-ascii?Q?CHL4FbJr2X9CqgzhYrwJ3t/Zob2RKjUUMqR3rn3bxqXQv3Z0JHfFQtWiQXUO?=
 =?us-ascii?Q?0+LDP7jHPx6vkzER7rFJyvguY3Jk8aJ6TZVfgtfnd5Ctq18kmAa+ZcC59PQn?=
 =?us-ascii?Q?kc61FxIAhA6YX0hIXEKM08q4qfVAXra2xPkpX6FAltB0cMWAko/E7WSkiA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8bbde4-fce2-4d35-8e59-08ddf4b7890b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 00:25:27.1557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nbh7bMp9XjYLlnxVuCDT/3iJbpArqoUxMVjrioZx95Lr0KHQ2+Id72zgXOOJI9xF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8403
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 00:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223511

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of hongxu via
> lists.openembedded.org
> Sent: den 15 september 2025 08:17
> To: openembedded-core@lists.openembedded.org
> Cc: randy.macleod@windriver.com; Peter Kjellerstedt <peter.kjellerstedt@a=
xis.com>
> Subject: [OE-core] [PATCH v2 2/8] distro/include: Add debug_build.inc whe=
n DEBUG_BUILD is enabled
>=20
> Add a new include file debug_build.inc to override SELECTED_OPTIMIZATION
> and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled
>=20
> Add separate variables FULL_OPTLEVEL, DEBUG_OPTLEVEL and BUILD_OPTLEVEL
> for the optimization level, and override it for specific recipe other
> than original remove and append DEBUG_OPTIMIZATION and BUILD_OPTIMIZATION
>=20
> Update the documentation for FULL_OPTIMIZATION and DEBUG_OPTIMIZATION
>=20
> Require the include file when DEBUG_BUILD is enabled
>=20
> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/bitbake.conf                   | 15 +++++++++------
>  meta/conf/distro/include/debug_build.inc |  8 ++++++++
>  meta/conf/documentation.conf             |  8 +++++---
>  3 files changed, 22 insertions(+), 9 deletions(-)
>  create mode 100644 meta/conf/distro/include/debug_build.inc
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8e90c7bbc85..91dc51cd61d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -658,13 +658,14 @@ DEBUG_PREFIX_MAP ?=3D "\
>  "
>  DEBUG_LEVELFLAG ?=3D "-g"
>=20
> -FULL_OPTIMIZATION =3D "-O2 ${DEBUG_LEVELFLAG}"
> -DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_LEVELFLAG}"
> -SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', '=
DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}" -SELECTED_OPTIMIZATION[vard=
eps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
> +FULL_OPTLEVEL ?=3D "-O2"
> +FULL_OPTIMIZATION =3D "${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}"
> +SELECTED_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> +SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_LEVELFLAG F=
ULL_OPTLEVEL"

The vardeps is no longer needed.

>  # compiler flags for native/nativesdk
> -BUILD_OPTIMIZATION =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O=
2', d)}"
> -BUILD_OPTIMIZATION[vardeps] +=3D "DEBUG_BUILD"
> +BUILD_OPTLEVEL ?=3D "-O2"
> +BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL}"
> +BUILD_OPTIMIZATION[vardeps] +=3D "BUILD_OPTLEVEL"

The vardeps is no longer needed.

>=20
>  ##################################################################
>  # Reproducibility
> @@ -831,6 +832,8 @@ include conf/licenses.conf
>  require conf/sanity.conf
>  include conf/bblock.conf
>=20
> +require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_bu=
ild.inc', '', d)}
> +
>  ##################################################################
>  # Weak variables (usually to retain backwards compatibility)
>  ##################################################################
> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/=
include/debug_build.inc
> new file mode 100644
> index 00000000000..af947a80e8b
> --- /dev/null
> +++ b/meta/conf/distro/include/debug_build.inc
> @@ -0,0 +1,8 @@
> +# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD=
 is enabled.
> +DEBUG_OPTLEVEL ?=3D "-Og"
> +DEBUG_OPTIMIZATION =3D "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
> +SELECTED_OPTIMIZATION =3D "${DEBUG_OPTIMIZATION}"
> +SELECTED_OPTIMIZATION[vardeps] +=3D "DEBUG_OPTIMIZATION DEBUG_OPTLEVEL"

The vardeps is no longer needed.

> +# compiler flags for native/nativesdk
> +BUILD_OPTLEVEL =3D "-Og"
> +BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL} -g"
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 741130a3921..824c4fb3801 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -129,8 +129,9 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] =3D "Defines which l=
ayers to include during cve-c
>  D[doc] =3D "The destination directory."
>  DATE[doc] =3D "The date the build was started using YMD format."
>  DATETIME[doc] =3D "The date and time the build was started."
> -DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging informa=
tion. This influences the value of the SELECTED_OPTIMIZATION variable."
> -DEBUG_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and CF=
LAGS when compiling a system for debugging. This variable defaults to '-Og =
${DEBUG_LEVELFLAG}'."
> +DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging informa=
tion. This influences the value of the SELECTED_OPTIMIZATION variable and a=
dd include file conf/distro/include/debug_build.inc"

Change "add include file" to "includes".

> +DEBUG_OPTLEVEL[doc] =3D "The toolchain optimization level flags for debu=
gging. This variable defaults to '-Og'"
> +DEBUG_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and CF=
LAGS when compiling a system for debugging. This variable defaults to '${DE=
BUG_OPTLEVEL} ${DEBUG_LEVELFLAG}'."
>  DEFAULT_PREFERENCE[doc] =3D "Specifies a weak bias for recipe selection =
priority."
>  DEPENDS[doc] =3D "Lists a recipe's build-time dependencies (i.e. other r=
ecipe files)."
>  DEPLOY_DIR[doc] =3D "Points to the general area that the OpenEmbedded bu=
ild system uses to place images, packages, SDKs and other output files that=
 are ready to be used outside of the build system."
> @@ -178,7 +179,8 @@ FILESPATH[doc] =3D "The default set of directories th=
e OpenEmbedded build system u
>  FILESYSTEM_PERMS_TABLES[doc] =3D "Allows you to define your own file per=
missions settings table as part of your configuration for the packaging pro=
cess."
>  FONT_EXTRA_RDEPENDS[doc] =3D "When a recipe inherits the fontcache class=
, this variable specifies runtime dependencies for font packages. This vari=
able defaults to 'fontconfig-utils'."
>  FONT_PACKAGES[doc] =3D "When a recipe inherits the fontcache class, this=
 variable identifies packages containing font files that need to be cached =
by Fontconfig."
> -FULL_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and CFL=
AGS when compiling an optimized system. This variable defaults to '-O2 ${DE=
BUG_LEVELFLAG}'."
> +FULL_OPTLEVEL[doc] =3D "The toolchain optimization level flags. This var=
iable defaults to '-O2'"
> +FULL_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and CFL=
AGS when compiling an optimized system. This variable defaults to '${FULL_O=
PTLEVEL} ${DEBUG_LEVELFLAG}'."
>=20
>  #G
>=20
> --
> 2.34.1

//Peter


