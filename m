Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BE8E87846
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 16:09:06 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20408.1770134939563561116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 08:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=WLiar7tF;
 spf=pass (domain: axis.com, ip: 52.101.83.32, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTjT/DMISrIL1mDyPODMhXJ90r+hc2mnZ1lzGQHhFxZCnZSAZQ7eZEGoGb1JBEAIxhIOmTBSERQFi9kyfkEfpJcCbgYmPQip2QdI3eJ5vg9Wtu9/U95YP+vNI4nexRus3kzCI0le/N56BNuKpJbZoSogJy3dUMaWH/CJbarqyRBh45kKljhE8RUsrqvKWT+8CyoGeLE+oIgOtExkQNUz04wXEatTf4OWkabtvuUwiYE5v42bIdEJUSVNLpUo9Q3jGSS19tSvBGar22XNIB7a1ZQrzJkOhZHSuUC8enjq6AXJfae4u3OrCAHYq8+rpPsCpAS4zWmT1uzp3nElmlNbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/iZoRZzLeh6V0KULDYon2d8DBfYtWh14tBs/VflPyg=;
 b=kuznkbX3TsY0kJbNKypFElKQkVfuii+AjP3KrcBhDlzZa73GBga1cWH7OofftXmCuEBV0M9kwKnCT1hfSxORm1v33eS/Xesl7RlfGf9mG5wkdBwuhfVxVYnw7ilrOvBpBKF/mDMqz30gjTfzjFSbqEYjqNTRXsgFPLm5XJIYjeBVfoLMt7lSqbi0GHTRnndJ2mbK8ECgtDyiY3UdCl3C+gy47gfryTj+pfo7qFTR8Oueur/hgujNKBDCpoatTkvai9YicY9tjlFRkpjuuUlRK4dG9qI2BcQOdq7C/MRyeZeIJEqP1DntdcWKKgsxBgfKgkfOI0fYZ9g/7BfD958yGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/iZoRZzLeh6V0KULDYon2d8DBfYtWh14tBs/VflPyg=;
 b=WLiar7tFXy+9hUH4PKuPs7VkyVnI2wPeQSlkzuB+8ZpryIgxc81S3OjvX88MOT2EprebrwonH8htpMMXkk/Qs4vandoWGlJ6I72DBY6NMyy7DPITJEpzIz3ygDitQ+QBlKVaZN5BQeyKoQvCzrLsVx0Bo7ydM5Gn9QbHXSGlZPA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB8PR02MB5785.eurprd02.prod.outlook.com (2603:10a6:10:f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:08:55 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:08:55 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>,
	"Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Subject: RE: [OE-core] [RFC 2/4] clang: Enable tests for llvm, clang, lld
Thread-Topic: [OE-core] [RFC 2/4] clang: Enable tests for llvm, clang, lld
Thread-Index: AQHclRYERDfg6mCJXEmxGwDUFTCRw7VxI2jA
Date: Tue, 3 Feb 2026 16:08:55 +0000
Message-ID: 
 <DB5PR02MB10213EFF0F909111910AB7E1AEF9BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
 <20260203140337.1971735-3-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260203140337.1971735-3-Deepesh.Varatharajan@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB8PR02MB5785:EE_
x-ms-office365-filtering-correlation-id: 6bee46b5-6fde-4756-ccb7-08de633e87d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?oPaYNul4bKi0K6XZjfAkD2En5/fKaUkAaN5XETVahLeTUrh9HDuGv/ouTPa1?=
 =?us-ascii?Q?o2hBfXOaZRHta5NPdKegrQMMSGfox7WQLZ2D7Xz0pNMvZ1IwZl+6SfFPS37R?=
 =?us-ascii?Q?3hu2kUllfeGj5EL8BT5Mq+yxGGlEMLu1AgL08JEvb0xGBtFj74CkPoD507I6?=
 =?us-ascii?Q?jTUppkakYLW4ddYvFPsHGG/xpHIixtRNxHX0hVnKEdZ2JCVXCtB5O+QGIjw1?=
 =?us-ascii?Q?WPj9uKPVPGSbEB+SKy6zPvLWiM6T4nQAREKhM0fL1j/GSOFt3u5mfFcNFMAl?=
 =?us-ascii?Q?I5RBLfT2v/RbZrix8r4U/rl5I24ynKM7sQRsF9veij0TZZqaxxWlFZ7sFuNA?=
 =?us-ascii?Q?/LkxtJSvKNsYf+3uJtNfbqLyKvGQ7hPlxLo0CzuMDcWLW6RacBuuP/sP7tJz?=
 =?us-ascii?Q?/dDnbLm3AtU3l+DwCwsWbT5ES60MxH1nbHFdm1MfVb/UysRRg8T+YgkcFkQa?=
 =?us-ascii?Q?dqpLKgMZCT5l5TF5ErGGPinxJlqDwQ79mYzPe6Rhi+zBmo5zh5/fLmdTe7gT?=
 =?us-ascii?Q?/HXKm7ouT5/4lOmDyZj8803m5UjkCOacMROhPVDY7D2FGNrxpeKE9Sn7b38L?=
 =?us-ascii?Q?DoX0gZTbbuo2ycImbwCw+NeHv72NhpsYt7gYHTZ2hwRGciknnFHwlm110Q+3?=
 =?us-ascii?Q?W1tVEQ4donJ91eymrCfa3a6mgwcKAs0v75Cxhr9dB3MTm/ahbVk+75ghK772?=
 =?us-ascii?Q?E6CQj69MXmG9RifyliZCNXKCqTm8i+48xa7OEoejqUyMkDLfvjSpsTOp1xmH?=
 =?us-ascii?Q?RhC9QHCqcT3MBtpB7ckaePvcYiS09AreiQS3Cv60D2ijLGdO5xKhKY/Ol+3c?=
 =?us-ascii?Q?PFoOqhMhDsxEQ6d8RPgjjvYN8crdD7PRWDaTw9EitYle1PxnjM2J9Cd6/oyJ?=
 =?us-ascii?Q?/JIP5/b4tcl3gS0fxZBrXThv64VdWTOK9ismjDCSxyznRhAEvhRYXS6ZpeSn?=
 =?us-ascii?Q?Y5r+zdgKY3ADDqAFnDPleSQcEuiMuVBDR76XHZljXK6NOYaDAXxVJVVy0HTi?=
 =?us-ascii?Q?ij7X/dN9VBOAOFKpzjSr+9Ax6f4PW0+brw1r6stXg24zIEjIGDs30lCzQ4dq?=
 =?us-ascii?Q?/ZWjdWbTHROFtf1SB65njFu2kMRIExJE8H5dRw+59/uPAgs8/ScwHxbBcnYy?=
 =?us-ascii?Q?o2Cxv7lInJkLL3AvotR+KKEw9SG+PX3DvIuRD2C8Uf3zfmhsJJyMBE5Ktw6J?=
 =?us-ascii?Q?kMRqQ/Co858vZkrxul14uzV1un0hAcj3WycklcpEy6R8LywO0faC5PfbwXSb?=
 =?us-ascii?Q?KjSZz8RI+eARqkEJOgp3wzjglKHsPFMt3yRiCIJBnSx2cvmoi/AEDJaG1E8N?=
 =?us-ascii?Q?N+4HkI75xXMMKycQb1EPshD1BvO0pWcTRit1IXnZqrLzIMWAdVOM+7Uq5EzM?=
 =?us-ascii?Q?npo1hO/Mf9TEgDwmD9mi8HgDS+HjM5ybUDJXiZxrM9aUaztPie1ywAxhJ5n2?=
 =?us-ascii?Q?PYSjqJCuJTbVe7mGoHwEe2oLX3kUtasEBBT2VtkE/rKsk/m4UF09ltBORxol?=
 =?us-ascii?Q?1eoU8mSrP9s/967F9TqF7trnrvBK+LPUvyIxmzCbKQPz8A+h0ZbQ5BqtxlqE?=
 =?us-ascii?Q?pk8E5GPsGoqFMDdEz9RZZLQrbjozTFWYYz/yvDoEszJ4+6plmvXuqBf1vI6G?=
 =?us-ascii?Q?3zvwydftP9OHSSjz4PwpYaM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FzMOxgsL3mrCo6u7ckiC7U0HPAvH3i3owPoqAo6rmKKdbfHe/2y1ubafOwmm?=
 =?us-ascii?Q?cW7QojWovjEeJzFs/jTiYqIy4x3gWyFadEgWssA6IVmskyUlBWVH6MYqaZhq?=
 =?us-ascii?Q?9KXnA88DM8skSG3RoUfhQphu7OTzQHyuOfEEq7rf82icLpOkj+QEWwzBn7IG?=
 =?us-ascii?Q?4n6rpfsJzetABB3EeFQfTb6nDm2K6zO0ZkwSadnG/9/6Yz3YWgu1NNQ4R3uo?=
 =?us-ascii?Q?80m/NlooarNhcUOjP1Em1pb8GGgA0X1hn994xlDG31hA/qxSp6gmXMk/4PrN?=
 =?us-ascii?Q?JOj8BkM5YJJqHtzpyNNre1Czm383gLYpNClJa6xbUMAfW8VuIJMneYmrnU1S?=
 =?us-ascii?Q?qccPwDxuCt8AmMQwFH86D9tyzvMyz0b6uCxreeQcX2mo5U+JuPn/ywYB8KOj?=
 =?us-ascii?Q?+xw/8p6VjciU9YD5nJMWdI0A4d/wpXZwfZeX4xAkDZcLKbVepRRZcTQMI3Ir?=
 =?us-ascii?Q?GVkU1LKU7yJoYy5BzMeVZmUPA4DR9nkwc6m6m9/ZNwEpd31Sp46EgVkCoQ3D?=
 =?us-ascii?Q?QR/W0V+FKVWlrUwF9cDD2FS/zoSDDBSxjfPFUtdEyu6d+jMvh46WtNAJoTut?=
 =?us-ascii?Q?evCUcdzwwzAo04d6LXzg70krlRmdr/P/LxMQCLSbDNcPSBakSCIavoqcMlM7?=
 =?us-ascii?Q?LWEmjBOzFMVcJZyw5SKT8T+e/K911n/7PAsdemXaroLp6WxIMaK0T8RvO1Ah?=
 =?us-ascii?Q?nBnX6DF82fU4YP5mXXkwriUBA8reUcOGhbe7kqKVxo4MwwZ4dZkB2Bh7BQeB?=
 =?us-ascii?Q?qKf1EkqbjtxL+3LHL9czJLyhzpcvBBdaXdiMFgQM9TwrG/W5+46exsTanTkD?=
 =?us-ascii?Q?/sx++sECFqHEMZewuUT2VjNKh6H7ABjiZdIFXnz/CY+sZcNF0wNIgHFs9XMS?=
 =?us-ascii?Q?w3cPXVILNMkAhYRBcuNuHkxVLbleCdG4IYdROOFF5To8qGCjs7r9tV+w+2df?=
 =?us-ascii?Q?Mtsua8qos4cWwO6YKjOoaZlyhEX7C0blJ4x57kcvVtOouNu6Djh12Ew9czmF?=
 =?us-ascii?Q?0lr25RvZ1NxoEQ0omnnxfgd+u8EQKcabEtOLXyo5xFkla1b8IXhTEqfNAy6U?=
 =?us-ascii?Q?BFL0CQbFOxFhuhfHKNAcrb97mpB/wj3p4Rm2mVGkk5oXC2nYkcQgypI8al7u?=
 =?us-ascii?Q?OwSzwZYrdScenwPoGXQX+iisGBSG7en6ElnrSG+P3SBhbi5zAE+WHw5CpgAV?=
 =?us-ascii?Q?xQEG3cQn71swq8NBoj/NciZqtWzE3PLOPWjYIzW5CsNDhxfRN9rLjE11gDrr?=
 =?us-ascii?Q?DoQ3uKx1X//tKD0twdtKNDL4VkvidEZ/Gv+SXhnqHomNQj2b02SU0GUdWPJU?=
 =?us-ascii?Q?jzYi0+t/ij6GYbRhzQ4J1E2JILwgOUfm7tWRGiiNNHX6nQ3yAMKw+MS+CfwF?=
 =?us-ascii?Q?1gUsOubwuEOkhAs5+ctY94yU8uNCpz0lXJV4KVTgvZVXe+a4tjIOsvpagJvY?=
 =?us-ascii?Q?2AsJ6Ddo7iEMxhaFqkS3x8dcT/UgX9EhRDt/qo2+Qp41gAn7H2QqPzcXT8wp?=
 =?us-ascii?Q?MthrDJivAWapgsa85rJZgLNd9HevCWad9RQpovxU8JvBVF/MCfkV6FQKLbWA?=
 =?us-ascii?Q?kpNXrchTLfqCP0L6UsGJ7p7K8qhFsvze6FgtV7lk7JYrHnCmqVxv469s/P5f?=
 =?us-ascii?Q?upDmVEVyiTCeBuAizDr4U8pkmj2iVdHNRKAbhokwytwbZT0EfEjJNZ4Utvkb?=
 =?us-ascii?Q?mueHJt9L8V+zz8AljNo+dIyfZK0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bee46b5-6fde-4756-ccb7-08de633e87d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 16:08:55.0723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Hz9RwQE+8EX8BKnaOOtvLK1F01+Occ7mXwg56l5fG1RxY4RDgX8BWUENK2NCe9s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 16:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230462

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Varatharajan, Deepesh via lists.openembedded.=
org
> Sent: den 3 februari 2026 15:03
> To: openembedded-core@lists.openembedded.org
> Cc: Randy.MacLeod@windriver.com; Sundeep.Kokkonda@windriver.com; Deepesh.=
Varatharajan@windriver.com
> Subject: [OE-core] [RFC 2/4] clang: Enable tests for llvm, clang, lld
>=20
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> Enable the required LLVM, Clang, and LLD test build flags for both native
> and target builds, and install the LLVM target tools needed to run tests
> via llvm-lit.
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-devtools/clang/clang_git.bb |  3 ++-
>  meta/recipes-devtools/clang/lld_git.bb   |  2 +-
>  meta/recipes-devtools/clang/llvm_git.bb  | 11 +++++++----
>  3 files changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
> index e10c327a2a..a1ff25f863 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -68,7 +68,8 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
>                    -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
>                    -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen \
>                    -DCLANG_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/clang-=
tblgen \
> -                  -DLLVM_INCLUDE_TESTS=3DOFF \
> +                  -DCLANG_INCLUDE_TESTS=3DON \
> +                  -DLLVM_INCLUDE_TESTS=3DON \
>                    -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FI=
LE=3D${WORKDIR}/toolchain-native.cmake' \
>                    -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
>                    -DCMAKE_AR=3D${STAGING_BINDIR_NATIVE}/llvm-ar \
> diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtoo=
ls/clang/lld_git.bb
> index ba36942790..1d3d80e117 100644
> --- a/meta/recipes-devtools/clang/lld_git.bb
> +++ b/meta/recipes-devtools/clang/lld_git.bb
> @@ -16,7 +16,7 @@ OECMAKE_SOURCEPATH =3D "${S}/lld"
>=20
>  # Explicitly enable symlinks as the lld build doesn't call into the llvm=
 setup
>  # and turn that on.
> -EXTRA_OECMAKE +=3D "-DLLVM_INCLUDE_TESTS=3DOFF -DLLVM_USE_SYMLINKS=3DON =
\
> +EXTRA_OECMAKE +=3D "-DLLVM_INCLUDE_TESTS=3DON -DLLVM_USE_SYMLINKS=3DON \
>                    -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devto=
ols/clang/llvm_git.bb
> index 96ea383731..6fed382d69 100644
> --- a/meta/recipes-devtools/clang/llvm_git.bb
> +++ b/meta/recipes-devtools/clang/llvm_git.bb
> @@ -44,10 +44,13 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel \
>                    -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
>                    -DLLVM_VERSION_SUFFIX=3D'${VER_SUFFIX}' \
>                    -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
> -                  -DLLVM_INCLUDE_TESTS=3DOFF \
> +                  -DLLVM_INCLUDE_TESTS=3DON \
> +                  -DLLVM_BUILD_TESTS=3DON \
> +                  -DLLVM_INSTALL_GTEST=3DON \
>                    -DLLVM_INCLUDE_EXAMPLES=3DOFF \
> -                  -DLLVM_TOOL_OBJ2YAML_BUILD=3DOFF \
> -                  -DLLVM_TOOL_YAML2OBJ_BUILD=3DOFF \
> +                  -DLLVM_TOOL_OBJ2YAML_BUILD=3DON \
> +                  -DLLVM_TOOL_YAML2OBJ_BUILD=3DON \
> +                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=3DON \
>                    -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
>                    -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen=
 \
>                    -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FI=
LE=3D${WORKDIR}/toolchain-native.cmake' \
> @@ -69,7 +72,6 @@ PACKAGECONFIG ??=3D "eh rtti shared-libs
> ${@bb.utils.filter('DISTRO_FEATURES', 'lt
>  PACKAGECONFIG:remove:class-native =3D "lto thin-lto"
>=20
>  PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENABLE_EH=3DOFF"
> -PACKAGECONFIG[exegesis] =3D "-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=3DON,-DLLVM=
_TOOL_LLVM_EXEGESIS_BUILD=3DOFF"
>  PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,-DLLVM_ENABLE_LIB=
EDIT=3DOFF,libedit"
>  PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOF=
F"
>  PACKAGECONFIG[shared-libs] =3D "-DLLVM_BUILD_LLVM_DYLIB=3DON -DLLVM_LINK=
_LLVM_DYLIB=3DON,-DLLVM_BUILD_LLVM_DYLIB=3DOFF -DLLVM_LINK_LLVM_DYLIB=3DOFF=
"
> @@ -124,6 +126,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk =3D "=
 llvm_sysroot_preprocess"
>  llvm_sysroot_preprocess() {
>          install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>          install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROO=
T_DESTDIR}${bindir_crossscripts}/
> +        install -m 0755 ${B}/bin/* ${SYSROOT_DESTDIR}${bindir}/
>  }
>=20
>  FILES:${PN}-dev +=3D "${libdir}/llvm-config"
> --
> 2.49.0

Will this noticeably affect build times? Because we never run the=20
selftests in our environment so if it does, we would very much like=20
to be able to turn this off.

//Peter


