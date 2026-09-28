Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9868ACA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 12:36:01 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57401.1790598955150628767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 05:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=yYf823tQ;
 spf=pass (domain: siemens.com, ip: 40.107.162.18, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDl28IAQGMgeLsBlWxe096dOBTEb4WJh+350Ho/WT6RtH4OcA45XX8V84e0xFiNYiEPtugSm7TWIUgGUlDve+FNja2a9jMCN6AzmYtHJbHzQj865bB+khhF9Oxq7CpAuUM0jQd6K4TYlmyfQLUB7N6PzY23ceTU+GnbrQMQl7vJGkd0Q4ZpAMgdQaaVNDtmFSucCi/xgUUyaXTRpNWJ1JxB3baF1w3HCBbIeL7X80c39ODU3VQgih3AaqrYz5hLNIVgeB37nKOSPUijPEggrV3pjMcvhudL0Lp063DZcSmvRLo++5QOucrFnjE7KqC9hXf1PqloIbIcEZYtn1maMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvUpXEVJJ/F79+OKV/Am+KZGMNkpXgbgL19ewuCi60Y=;
 b=KbUQRicZBv2LSpuDekiizSDp2fM+aQf4liR2eMW+qrAuwCEFSbzyiMtu8P8QRsfkeHG5CDIoVBNU0vD8Y3QXyPrVqUD56VHcqBduWO8AICRoiOqyK0IKTKqV59w/90WYdpl5RUuOm66acm4ThII0PukFo5cSbBgTMzhK8FEpHS7LkU3TlE3LhOKQwZiy4jvHNIoEAVCV50SUH1uiGDwaUL18aAr9AqzGmAVqO4Fwew2eJiOLxreTAkinaPZmNNIhb+yvNNGrhLj7O4KfolHIzDSLhFfzEImIWbVNt1wtPhcd6DT3qH/ONEgwUQ1myOXL7kJ9JMxejbo2/xIQgd/cUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvUpXEVJJ/F79+OKV/Am+KZGMNkpXgbgL19ewuCi60Y=;
 b=yYf823tQfCEDDlfsRGAVba7mfHX+AfS1CIGMXIOgQ7rcXy6Ji4oLSQlVG98eSJcqSE6xJur04RC08Yz6P83xZMdkqVY4R4FrkYaMzAcS4+ByJLBnugb81L+iuz8pJXQEtExCmS0Rm9CPYawUvzDZrjvjk5XnBZBOY1zoN1uZMFpLdYaLkAdpnb4ViE2N6LWNJ650k/H1CXzBg54ELwE1DcKUXg2YCdxuIGIYOMiRhb0KIKxKGek3jFInYJFno5alreInN/F7LyHtIvFALwx3x7764W9iPr9G0IpoXvo0YqppmDBYkgCgI4UhK8KK6+xmD32z1A8RPMLQ7sMYlLLNew==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DB9PR10MB7931.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:303::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:35:50 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:35:49 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>, Richard
 Purdie <richard.purdie@linuxfoundation.org>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>
Subject: RE: [PATCH v2] toolchain/clang: prepend target host-sys to
 HOST_CC_ARCH
Thread-Topic: [PATCH v2] toolchain/clang: prepend target host-sys to
 HOST_CC_ARCH
Thread-Index: AQHdMOAdcrDvwhsBPUy6HHn5sbuz5rbkJIFg
Date: Mon, 28 Sep 2026 12:35:49 +0000
Message-ID: 
 <AS8PR10MB5073188A36969BE5B9F44940FD8D2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260820201120.293849-1-peter.marko@siemens.com>
In-Reply-To: <20260820201120.293849-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3a7d5d0a-2994-40e4-ba2a-8509b25fe9ff;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-28T12:16:02Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DB9PR10MB7931:EE_
x-ms-office365-filtering-correlation-id: da029f23-7901-4bcc-2a82-08df1d5d072a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|55112099003|13003099007|38070700021|11063799006|56012099006|260925022911599003|260925021311599003|260925021911599003|10067099003;
x-microsoft-antispam-message-info: 
 YMPQuiPFH7GysUUJS08JvDHwRwY2g4ELjJDnjP5L74kB87hahzuZlkiInM65MpLBWPPm+jclewPzMw6hccT/GySPD1FOirAFba7ZKlKl3KcouowIdiVgweC+CEbjBkGQprjT2qxJ6kt6BvJOqX8lPCV3LCnLW/bOUKAvQBwFJzEkOcVPAQlrnUlz9doRrARR+DMUeYpPju6+JgMqFUiZ08fX5TNXgPqfxjMpK4AyVD6oUfwlwNeKw+Z533FwA1ttb9kfK+cKBHU+ggk/1+TQ+c5YPiP04HFCF7V9PDBGxIQFm1h9tmVZnMrSMnTsqCfTJbJLcHtxjN174H2v/+DrbOY/NTmMRSfpyzIk3O1LOY6YPDH28/AbO3/4FfA6fGJHmINl042qOionvLMcBywn8/dabWqigpLIFLieLp7Ftuv7AIJu8Yk0nxuLmCYzBRoN6R8/W74cgqfOC+oMXOd1nGgtsZyAuJxwm80tWEz0kEtuowe18D43yUv9ULIEL5+w2DwjrIrEdhZAuarWNoZQwScOVJUajgK4ebDfwASh2QlzfWGQc1hDMdHOTk4xvOk9k6Hoz1WhAlruTw+kuC/jx9lEQJzib164hCFuLDn/XTf/i0XmmEYD64GbC314meuNnRTqExYvY8oIxuIhy84eSm0bBHuLotMiew+mB3aRJgR+bmqjxRTFAd4wGL6ypunhgEn4miCfgHMxqLFWahCDbfXtq6NseceZJOXsSvYEC/E=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(55112099003)(13003099007)(38070700021)(11063799006)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ck063/sp6R7KFF8+KTsIB57hWUTH4GCjk7KSqtZYklqLCM6IX2u3HONc+UG/?=
 =?us-ascii?Q?zHrBl7JVWnE6vIlU49iLbTQnGPgk5SlT03S+o0tJTspQy/NN3CL1KZsJHJ2/?=
 =?us-ascii?Q?KKuHOykhm2C868/bm9fmva/O3XsU1kK3MhgFsIeqkO6TNxKcK2M+5TVf99Nv?=
 =?us-ascii?Q?2B/ogWRNCM4oOL8h1aFswFm/AWtdVL/aCAYtvEn2sWouN3a0qLXWyI16Q9SN?=
 =?us-ascii?Q?T7zVi6EAJ+NbFaqfRbXgsRY2Q3zna0fs2FgWfbz6UljQMdibDZZcJ9JUjlM6?=
 =?us-ascii?Q?KmHtU7m68sxVxBlrq63bzRG3noRwF2qKW/BJO+4jIzijyDOWdtnO+aH1DR57?=
 =?us-ascii?Q?xG4LmGJzaihaEqWmLL8c3Gy34rJY/vxaopSxEUV3MFdQrAz4LSXcRNm4mI8j?=
 =?us-ascii?Q?TOpnLDp0uhHduRdGJwQXB/rk7yuBp396tixXZa5fxmadwRWV80y6wsbvCO01?=
 =?us-ascii?Q?cIY3DWif2dvlxVrA4zu+unoUR4qtq5QWGR+5aLKr0Y8H0gVe+3Diq7fwc/J9?=
 =?us-ascii?Q?/dciwXUpgp4lLXibHhPbXf5emkOwKqnOejR6szHKMvcxvuD750m3DaBewsJr?=
 =?us-ascii?Q?XRFVL+PKgZJ1YKTVN0kcINTycQHSMWHZYUNOGt+Ggl+Jc4VRCQTHdm2gPKk1?=
 =?us-ascii?Q?83+ewvpHac1BO3nnUh84u7sdjCJ3Zpl3K0XyDjpipkuk3/9JdTHKmpvDxMrH?=
 =?us-ascii?Q?Jv9rtsRQE0Dzf2gffHBupJhPN5gpbOrXRKU7lljZ9nJoU9SWQEMkI3xg8NUM?=
 =?us-ascii?Q?ZiQDBKv76JdjV9+rc17evXzaIm6MqbIuXcx1gDxHUNEf2FILmp2qeWX8cpgF?=
 =?us-ascii?Q?lUqpKKoYOr9dtyN+wKofp+4i6gP3cBoWtrbzE4tsIAkrWkaMiNfLIu0tAidb?=
 =?us-ascii?Q?igQKx+NcvunMws3IDDYtITRq0gLu5TmcQOOQf+DQGjGPcNRIu96QCk55xkSH?=
 =?us-ascii?Q?/t+oDOsapt+uE9xmpAp8qUex9UOMfy/uM58CPFfYNUtL1+4rFqra88tHspDi?=
 =?us-ascii?Q?mPpDLZasacLKXdjZGJW89yovvfumbvrcF9D1fU30GYYNbPASXq9tXoMvq15Z?=
 =?us-ascii?Q?Bmtz63KV9GZZici8sNjdC6Sego2F71v8xpNaGT3g9xWqH++BZcfbrBhAeMe2?=
 =?us-ascii?Q?JdN9zT2Yl3rOiNMQP3hC8AhLj/ShTW/rGFnxCLmN9biQL0kNm1LR0WA/hdhK?=
 =?us-ascii?Q?FW3KQ3vfZThnlG74oP61t+2JW8884DREeSLSDfdZn7uCVoju5MFLExPH2+ve?=
 =?us-ascii?Q?S80yKbr64IQZE7x+QlbIjwgOL+dmHsUeaX1ZEswOPrmCxXWzcLKj8lQSTFOL?=
 =?us-ascii?Q?leEMK33LcjTLjvblbgBN8ctsHd1Ff7MZmTk5RJSfNl6XjpptqySrPvX50OV8?=
 =?us-ascii?Q?IFfIfUGUxB+ixZPXx5VBH3Fe0ppppNp8uIVeLaYhjRhnXtRVCdk66g0B2dWV?=
 =?us-ascii?Q?knn5aEXtQ2sKrmgRlEpN9us7tOZ1s+KTVC1WHHF0Udi3OtWgKS8aFZ8SzHn+?=
 =?us-ascii?Q?JYkqZJ2d8FNGzp+4gNYrN4Q2rGfxEFdQtg7DzhvHmdY05ewHe+/4kfZNdXlA?=
 =?us-ascii?Q?tEYfaW8Nqdc3pU7JzGxwYdcO3wtTe967KUWMiYPMm82j1Ks+mV7FXEuO3egx?=
 =?us-ascii?Q?9qV0OXNEtPXxjsXxgGGKadE58AGb7vPyL36MYdXvWt6C8ARtHPwPljyIv739?=
 =?us-ascii?Q?c2W+aWr2uja3Sy9aVPtm7FfmJYIMetLOrFEgAeGwlS2MRfggG52VAvxf3A9s?=
 =?us-ascii?Q?hM/n2Ek0rg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da029f23-7901-4bcc-2a82-08df1d5d072a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 12:35:49.8842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iYMXW2/4AaDmH6kSAaI3h6q/XNEweX5E+O7RjF/DEUuZqhY5Pa2M+aVn/xpUsKKsslFPErY1K6baB+ffsyHzgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7931
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 12:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246760

This patch is sitting in master-next for some time already and is probably =
spending a minute or two of everyone's time on each patch review call.
Let's try to do a decision whether to merge it or drop it.
I (without asking or rewording via AI) think this:

I see following ways how to approach this clang-tidy problem:
- make clang-tidy architecture aware upstream
- add these flags to tell it the architecture (what this patch proposes and=
 what was present in scarthgap)
- add it only to recipes which use clang-tidy (or other similar clang tools=
)

clang-tidy (and this also applies to some other clang support tools) is in =
principle architecture independent.
Linter should not care about build arch, correct?, it just needs to know th=
e paths to sources.
So imho making it architecture dependent would go in a wrong direction, pro=
bably wasting time of whoever develops this and upstream clang maintainers.

Explicit set of architecture globally looks like a better choice.
Yocto currently does not set the triplet in build flags, because it's hardc=
oded in toolchain and thus "it works" (however as we see here, only in 99.9=
% of cases)
For clang compiler it's a no-op (the value is the same as value that it has=
 hardcoded during its compilation).
And it helps all "arch-independent" clang tools to find the right headers.

Having a special handling for clang-tidy in all recipes using it is certain=
ly possible, but seems to be sub-par.
Yocto should support clang-tidy workflows natively.

Best Regards,
  Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Thursday, August 20, 2026 10:11 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>; Marko, Peter (FT D EU SK BFS1)
> <Peter.Marko@siemens.com>
> Subject: [PATCH v2] toolchain/clang: prepend target host-sys to
> HOST_CC_ARCH
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> This assignment was present in scarthgap meta-clang.
> * commit adding it: [1]
> * commit removing it from native case: [2]
> * it was removed completely when migrating clang to oe-core
>=20
> After migration from scarthgap to wrynose (or current master), clang
> extra tools like clang-tidy do not work anymore.
>=20
> This restores the state before migration from meta-clang to oe-core.
>=20
> Test recipe used for fix validation:
>=20
> test-recipe.bb:
>   SUMMARY =3D "clang-tidy demonstration program"
>   SECTION =3D "examples"
>   HOMEPAGE =3D "n/a"
>   LICENSE =3D "GPL-2.0-only"
>   LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL=
-
> 2.0-only;md5=3D801f80980d171dd6425610833a22dbe6"
>   SRC_URI =3D "file://CMakeLists.txt file://hello-world.cpp"
>   S =3D "${UNPACKDIR}"
>   TOOLCHAIN =3D "clang"
>   inherit cmake
>=20
> CMakeLists.txt
>   project(hello-world)
>   cmake_minimum_required(VERSION 3.5)
>   find_program(CLANG_TIDY NAMES clang-tidy)
>   set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY}" "--checks=3D*")
>   add_executable(${PROJECT_NAME} hello-world.cpp)
>=20
> hello-world.cpp
>   #include <iostream>
>   int main() {
>     std::cout << "Hello World!";
>     return 0;
>   }
>=20
> [1] https://github.com/kraj/meta-
> clang/commit/503aa977b27be0506fb6ac21fbf9e8b049b82247
> [2] https://github.com/kraj/meta-
> clang/commit/6da0abaa33b458a37b97f42e3755245e3220bf27
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> v2:
> * removed native variant, which will make it equivalent to pre-move mota-=
clang
> * remove unuseful AI explanation from commit message
>=20
>  meta/classes/toolchain/clang.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/classes/toolchain/clang.bbclass
> b/meta/classes/toolchain/clang.bbclass
> index 9a3cd0e584..f6b554d210 100644
> --- a/meta/classes/toolchain/clang.bbclass
> +++ b/meta/classes/toolchain/clang.bbclass
> @@ -34,6 +34,10 @@ LDFLAGS:append:class-nativesdk:x86-64 =3D " -Wl,-
> dynamic-linker,${base_libdir}/ld-
>  LDFLAGS:append:class-nativesdk:aarch64 =3D " -Wl,-dynamic-
> linker,${base_libdir}/ld-linux-aarch64.so.1"
>  LDFLAGS:append:class-cross-canadian =3D " -Wl,-dynamic-
> linker,${base_libdir}/placeholder/to/be/rewritten/by/sdk/installer"
>=20
> +# helps extra tools like clang-tidy to find arch-specific macros and hea=
ders in a
> cross compile environment
> +HOST_CC_ARCH:prepend:class-target =3D "-target ${HOST_SYS} "
> +HOST_CC_ARCH:prepend:class-nativesdk =3D "-target ${HOST_SYS} "
> +
>  # do_populate_sysroot needs STRIP, do_package_qa needs OBJDUMP
>  POPULATESYSROOTDEPS:append:class-target =3D " llvm-
> native:do_populate_sysroot"
>=20

