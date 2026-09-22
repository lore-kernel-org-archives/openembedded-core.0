Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801A5C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 17:09:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1093.1790096981156231663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 10:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=b14SAdjx;
 spf=pass (domain: axis.com, ip: 52.101.65.24, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRD9vKjGhuWVY9vNlEwtG8oTLYxEBZ4wGb7fFoRFuSNwcPRRXZW2WnAzFLpbP+HySDO/MdMjHQvJPI449kctGIEzupXxWISvxd+MYUDS8ruIrOHHviTyELqNvpsu3Yg1ZJ2KLLVJkpzuLhRnxGdJUC2P4lKKlpg6EE9tloKjlUHJ1NZ1dry5ZkvRk93FSpgmedLPdrxp5oxNGuqu4QeDJuMosVNKD2DeOicFJlIxGheIKqNif10lJxcY8GRplKvnQvFLLf772er4QWq19Ku2ff9eg35d3l7ExhBF/x3yYEXzMRNyTejGmHODluoPMdt33KntiVeEzY2sdooKF7Lnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVivT2LH45740Ch35GIdpTqDVINmUnYJ1PZERD/z21M=;
 b=AZI8yI6PdNqcusglyVyfMBrmTsJL5vlhOzjUps1Uj/lDI1G8NS8g//BkGiOn6DvUqtqrhIlJimqz9a54YUjuYTE7xebb8VxHhj8SMPms1KTfRqWWta7wm9mcipEgrwLdCIosfutJ50s9gGStVoOQOzFimiPhvnW5fslZEf+XC3JSDOQ478AOajS3ZM0ovIaMKn7HNmyGNaMjXIfk4Qg0aKvLkEDFXiSBeGuYholrw4AFRxNy18fOOms9IFa2RJLrzb3hwNfrhaLPhWZtM4p2ZT1cdMUqrjsSLfLVnsvozsQMc+oHZfQrwH3i8jwntjgeCtUvpVdvqlO2kSBigm8sQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVivT2LH45740Ch35GIdpTqDVINmUnYJ1PZERD/z21M=;
 b=b14SAdjxrGSAx9nQqJmXlJ6HIK4HTQvJmBLIk80fYAKvkKqhsiY/UeRZIioptNNSxzf8eURKeksew4PSwXJ7SqfUgapTkcmm6V/Yai+conoHgyDk7VX9vE8+Ibhig1S7B6O/xfiHnnpt53+xHQZfokRd7GZDrYN0cdKNuhI9qvw=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PR3PR02MB6268.eurprd02.prod.outlook.com (2603:10a6:102:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 17:09:37 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%6]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 17:09:36 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "adrian.freihofer@siemens.com" <adrian.freihofer@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] package: introduce PACKAGE_BASENAME for
 consistent kernel -src naming
Thread-Topic: [OE-core] [PATCH 1/2] package: introduce PACKAGE_BASENAME for
 consistent kernel -src naming
Thread-Index: AQHdShOfkHT/lPP1tkqGhZh2RAcBGrba001g
Date: Tue, 22 Sep 2026 17:09:36 +0000
Message-ID: 
 <DB5PR02MB1021327C9D3FB6F7CE13BEAFCEF832@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260921215300.582692-1-adrian.freihofer@siemens.com>
 <20260921215300.582692-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260921215300.582692-2-adrian.freihofer@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PR3PR02MB6268:EE_
x-ms-office365-filtering-correlation-id: 8e0c2bcf-520a-4559-c78b-08df18cc47a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|22082099003|3023799007|11063799006|10067099003|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info: 
 ztYANvIZuqmCN9bhgmtf9Ifxw4SH+/MbFoD+gbhiC/8PkSUlkBhERO8qzObk6pRQIzz2I2EvZ17dEYutk+dKufPDf7QsFuFNy53xykMQ77RnKkalsrYwDbzKLyoFwid0my8Od1HZ4G48HrDpDVszrRW/rIvOyIFpjsj7P6G6E5mxvJ3h9Or6+Q8qQ/sWWxwpyhSBPyBud4A07lzrLCtg64lIzufJZouSHN+wCzs9PDaiD4fd7rxdf/JSkvBRJPWATyRNRXjlgbYfky4tveVNaxqvNrX1mFO5DIih1hBkFc1Yk2YdQxDk3UH0IC0He9Rm8+RuR15Rw36Gi/dHiZb2bib7sfqH9tv7IdQ0bdaZ4HzdFUMeag+mTh5zlnrKYk3RBy3s8XDixOMLs/lnTZCbpZGE/EPpqNHSx9xw6TjxVHkDf4sQDPRiOt+ns2rOmFFQcnSuQHfUOY/dyVwM3UsKGVmClyaC7CfCKHGv/RzDb4g8DZcMDKuOLqMn5OyRxTBrv8g+KBHJqLamlLYP4ioiBxKsZ5pIf1+NoAmihPHkCCCoHLso/MmrS+333VYfyamYJxnCMepYmfQN/hSzOOJ27S2rXxS05Ho+ScniV4Rfn3XfgCTxWvmRpP+JVWM5E78ew2b8MujLIQsd1f/7fF8q1Nh5oXromo95Za2DvuQpVKzmnwtL4MXyBZCMpCnSlPOLxFU47FdTG/AxPVz1+GMb1Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(38070700021)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gtE7KNLuwmDHJYucnVsJ5/B1i3uzumJ33d2kfYj7xiNHUMcB8n4py/ayDiWk?=
 =?us-ascii?Q?r7bo/fYCY8Sl1XhbqdIZgBZwKY9fe4BZUnnXYReHbEvI1MJY6hFjQ2VlP6f2?=
 =?us-ascii?Q?Q0yTgOAe4IwoZyUhMh14/4ZWDRTn8FOAxz9Tqj8gv7jLlaHkgelUDUdzVA7e?=
 =?us-ascii?Q?7Lq2Vi4A1EgvvOGp0FlLn1r9Pd/RsDNWDj7wRyE2WEmqX70st/sdgFEu94qx?=
 =?us-ascii?Q?u3dz/+spjzKKEwYDuYQ4Rm19BitCmbqV/lTgQ1bLfvndH6TdhhVnwC1GcNl8?=
 =?us-ascii?Q?oqNJGOUpYYiFCks8m9J+G7cjXAwfnPZwT2gIxW8vJrFAjQgQWqTPQMSR+98g?=
 =?us-ascii?Q?1ttlyH2hTbEP5E0OZfb4+D3Ni9K8lI/0mbfMQ2Gg739YSqokNZobtZiXkXL0?=
 =?us-ascii?Q?QBjxpT+58Jf/aCRrtPQB26Jju4PE8dn7HHdtaQx6sA2AvPjFC7o5P8IPCVSF?=
 =?us-ascii?Q?dCcBKIPZWGvRFUCZLRZY9qflKtPiT2VHnC4TOZ+anGvint4Zha4Wo/8qh3Og?=
 =?us-ascii?Q?AHlGqyHKFP3mGTwODtcL4sjw8OD1D6OMkBj97uTJouau99Fo34XHxzGIat0f?=
 =?us-ascii?Q?2xi0jwg2bCbIYe+lDuyKJocwwi2O+mFz4YChu6OP+7J2yueVz7mEqMyzYHc0?=
 =?us-ascii?Q?Ln7yNjytecDk6jGXJ5xbzYxBCzgqvJv3hOfmb2RWOXId3gSC9RHm95wKB/kR?=
 =?us-ascii?Q?Q3if5FoH2DQP+1Xq2BUsrsZMOr09QycUoulPbm1MaKiQCxWZB3DUBleOTRz2?=
 =?us-ascii?Q?yJBRMPMW8q+qVYKNJ0AeURYoD+IoZ6QKypTzzEDcgfeBOxOqEX7nvHgfRN5i?=
 =?us-ascii?Q?x6LIBFfSgyna1Xb9MCrw1z7o0bakse9lZFevXdZ9b1T74OxDrVYX9GVA5erq?=
 =?us-ascii?Q?4xwMeFb38LnU0/p4Km60E+mpi1Bc/58oc/sE8pxJAgvj57r83LW1i1x1Hu2O?=
 =?us-ascii?Q?v8A16X3+PGCcYjCFoyvnbiyYU7a6uV6VTlGITa3KV7rYNgpk8GcFNi8ldXHE?=
 =?us-ascii?Q?tv96NXW1M7ouddwGPL4xfYP9dQrK/deNbx41OOCBI1s+5m7zWyFczmY6ovrP?=
 =?us-ascii?Q?ZOvJ+AG8LBGPBgDa9Nv7aEfy4aeqWbtlkuyNKHltN+/SuowAqYdtcMbM6YXE?=
 =?us-ascii?Q?GCjjknYfJKR4ogOeI0N+kNUdtchzx96ceKAxAOn0Do63Dm5UVTJLq4mf2MYc?=
 =?us-ascii?Q?OzhazEWyynMTqw138gmbZ2sJ5Vs0xZcWrYaTnWQl9g0xmdM1Bc+bCfv1fzuc?=
 =?us-ascii?Q?AeLTzUTMADM70WRdOMiPzAeItlHXzFi72PZd+U7Ou4toGCKpRFaMDOiaT1Jy?=
 =?us-ascii?Q?93wtnE2pv6TSoEAneFYGNrsvsMUA5K4jAruMBg73V9Nh4PxG/uScgveU0nMl?=
 =?us-ascii?Q?XeZQY92aW897ZP8ZMoqIr2VIbCNu7h0oZf5JowwxU2raPDCpYpEKOl90Qnjc?=
 =?us-ascii?Q?J6DOC5KGWGltD0W6uS0HsEVPWTw8TmHyl54EwTAuA0LxcCF16+DCFqITAyu+?=
 =?us-ascii?Q?FQFJGKfSaLJT568pYAzIfCd11OrO+VpJEkNqKg0TV/TDEbrhvkXSb/cOSM6Q?=
 =?us-ascii?Q?n1tG4uJNxd/NC59cmBTJBaadkt12K+JRWPfyINBGwf0r0TbucIstYDcNI0XG?=
 =?us-ascii?Q?HtbKA4TIQBV69QaX6aTYnBBawb9wnCcLO2j5VpQCOjJse8Pg07Im5NqlPFvM?=
 =?us-ascii?Q?6WTnQ9/SIVUVNLlkWwG9nQjZkOc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0c2bcf-520a-4559-c78b-08df18cc47a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 17:09:36.3762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sLDzD55lwtPoHWnF/zjOZUDTs9KaycEXGJHbDMjs4VIJ5QZyk1eotOWD3fKefe8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6268
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 17:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246427

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Adrian Freihofer via lists.openembedded.org
> Sent: den 21 september 2026 23:51
> To: openembedded-core@lists.openembedded.org
> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
> Subject: [OE-core] [PATCH 1/2] package: introduce PACKAGE_BASENAME for co=
nsistent kernel -src naming
>=20
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> populate_packages() always names the auto-generated -src package after
> PN. kernel.bbclass instead names all its other sub-packages
> (kernel-dbg, kernel-dev, kernel-modules, ...) after KERNEL_PACKAGE_NAME,
> so the kernel recipe ended up with a lone -src package (linux-yocto-src)
> that did not match the rest of the kernel-* family (e.g. kernel-dbg).
>=20
> The complementary package install logic (oe-pkgdata-util) cannot find
> packages that are not named after PN (${PN}-src, ${PN}-dbg, etc). For
> the kernel recipe this meant linux-yocto-src was picked up, but
> kernel-dbg, kernel-dev, etc. were not, which was inconsistent.
>=20
> This commit introduces a generic PACKAGE_BASENAME variable
> (default "${PN}") that a recipe/bbclass can override to declare the base
> name its sub-packages should share. populate_packages() now uses it for
> -src naming, and kernel.bbclass sets it to "${KERNEL_PACKAGE_NAME}". As
> a result the kernel packages are now named kernel-dbg, kernel-src and so =
on.
> Changing the kernel's -src package to kernel-src also means this package
> is longer found either by the complementary package installation and not
> installed anymore.
>=20
> If kernel packages should be installed via complementary package install
> logic is left for a follow up commit. This commit only aligns the
> package naming also for the -src package.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 3 +++
>  meta/conf/bitbake.conf             | 6 ++++++
>  meta/lib/oe/package.py             | 4 +++-
>  3 files changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-
> recipe/kernel.bbclass
> index 0a6d754108..16745557f7 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -679,6 +679,9 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel
> do_transform_bundled_initramfs d
>  # kernel-base becomes kernel-${KERNEL_VERSION}
>  # kernel-image becomes kernel-image-${KERNEL_VERSION}
>  PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNE=
L_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}=
-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
> +# Keep the auto-generated -src package (see populate_packages() in oe/pa=
ckage.py) named,
> +# and resolvable by tools like oe-pkgdata-util, consistently with the re=
st of the kernel-* family.
> +PACKAGE_BASENAME =3D "${KERNEL_PACKAGE_NAME}"
>  FILES:${PN} =3D ""
>  FILES:${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_MODULE_INSTALL_PREFIX}/m=
odules.order ${KERNEL_MODULE_INSTALL_PREFIX}/modules.builtin ${KERNEL_MODUL=
E_INSTALL_PREFIX}/modules.builtin.modinfo"
>  FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d353a7cd2c..f82ee0f039 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -334,6 +334,12 @@ SOLIBSDEV:mingw32 =3D ".dll"
>=20
>  PACKAGE_DEBUG_SPLIT_STYLE ?=3D "debug-with-srcpkg"
>=20
> +# The base name recipe sub-packages (-dbg, -dev, -src etc.) are derived =
from.

But that isn't really true, is it? E.g., PACKAGES below is defined=20
based on ${PN} rather than ${PACKAGE_BASENAME}, and so are all the=20
FILES variables. This seems more like a band-aid than a complete=20
solution. (And no, I am not suggesting to change ${PN} to=20
${PACKAGE_BASENAME} throughout the code because that would be=20
madness.)

> +# Recipes/bbclasses that name their packages after something other than =
PN
> +# (e.g. kernel.bbclass and KERNEL_PACKAGE_NAME) should override this so =
that
> +# tooling (e.g. oe-pkgdata-util) can still map generic package globs to =
them.
> +PACKAGE_BASENAME ??=3D "${PN}"
> +
>  PACKAGE_BEFORE_PN ?=3D ""
>  PACKAGES =3D "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${=
PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>  PACKAGES_DYNAMIC =3D "^${PN}-locale-.*"
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index b7030643d2..4afd047905 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1391,7 +1391,9 @@ def populate_packages(d):
>      # If debug-with-srcpkg mode is enabled then add the source package i=
f it
>      # doesn't exist and add the source file contents to the source packa=
ge.
>      if split_source_package:
> -        src_package_name =3D ('%s-src' % d.getVar('PN'))
> +        # PACKAGE_BASENAME lets bbclasses (e.g. kernel.bbclass via KERNE=
L_PACKAGE_NAME)
> +        # that name their other sub-packages differently from PN keep -s=
rc consistent with them.
> +        src_package_name =3D ('%s-src' % (d.getVar('PACKAGE_BASENAME') o=
r pn))
>          if not src_package_name in packages:
>              packages.append(src_package_name)
>          d.setVar('FILES:%s' % src_package_name, '/usr/src/debug')
> --
> 2.55.0

//Peter


