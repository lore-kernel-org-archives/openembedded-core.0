Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6A1CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:28:36 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42829.1782134905824390579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 06:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=r1d7beJA;
 spf=pass (domain: est.tech, ip: 40.107.159.23, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjzhqzgSmSYarUv1AfT6+BfhaHme32ItmphtXYFGStTfMct1D19HxELD8RqJyP3eqittj0LhiRS6ZEEK56NIPD7LTKQgGWGvids6DMUJuvQAaprh9vJvhNMByoWtCzeEbFKvgDelFN0pNS6VfDfwHromYM79Sqy87akb/Y1vKvGpvpaqvJdLQc5YrgCUkkvut9hIwYo5vuJ0P5I7wD6Mtg29IsJKAr8nbN2qYA/cB7IPwdtqJjP65jmI0ucjc++Ua37GxoE77LSgLMcc4YmYZUtpIXpF/KrTGy+wcwYFN9Qo0CuWg/u22JOZBJ6ug4aUx7mYDARSbj6C4ndbaq0E0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz4m2MsAyIplXDkHOZnlpAcYD1Mg9fby4zgJw44ZcfM=;
 b=xACNb+8MOeq0va/jCHyZyWaZvSaFAPh6KDf786J6e6b6XudZOLDT1Cstd6gLNvHno/5GvFx0CdfxmpgEXI7k/e7dakFnRBOH7PzeszOaKP+JRgZpcHz4tLyb+qonUJbbyhcdaJB5zWem4j6eVPmq4o24Zd6/sA0UVvI8XoGoszE3LIjdGzPm4+ePFTTZ17iFepWpt/gc0VASATpJ+KmNJJjVLNI4jgBIoFoFQBoYEC4ROjctzMMbDDlNw7ouZjldqZUMy8t/AvG7Yc0f2NyMnZNUq75Yc8tlP4Alq4zcYTxk3vGmS6CBst2IUNEIB82rm7GQ5cMg1BLye5WOW6hNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz4m2MsAyIplXDkHOZnlpAcYD1Mg9fby4zgJw44ZcfM=;
 b=r1d7beJApCG0sHU10PiIgFQZBsMTxn/LIj1PGhC1SDmQzCpSxVITrlCZAyxPtBDQ0DEoGwp8uKjv5rYzQ0PHty6dxn+1wrTatRSr6ecfQrw5q0imHsXTXtVPuaTaeyr8aj+xCiZoSS7lxvAcDEl2EQf2AJ1F4uZmcWC1eZioMHic3QYcgoEHlhv0NuuQO0nyu66mqFW898RzJYvlc2I/uobciWtpYoMQ4C4nPZqJ71FqmpWyMixIsxxSgP/2HjdeRBrtaG15gDKtIYFazOv7+GMcsIfN/FrfvBbCAWyV+rLuCfWzAUcYOkdEgdytwPSZuY2BPUY5ySje0U4ey4YEnw==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by VI0P189MB2823.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:24f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 13:28:15 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:28:15 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210
Thread-Topic: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210
Thread-Index: AQHc/JFe6ZKemIWpCkO8yaPucHQ4vLZB2REAgAjDRQE=
Date: Mon, 22 Jun 2026 13:28:15 +0000
Message-ID: 
 <AMBP189MB319677192FB71D050506AAFCF8EF2@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260615063640.25128-1-amaury.couderc@est.tech>
 <DJAVAP82IHN7.ZUBCLSIJUS0O@smile.fr>
In-Reply-To: <DJAVAP82IHN7.ZUBCLSIJUS0O@smile.fr>
Accept-Language: en-SE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|VI0P189MB2823:EE_
x-ms-office365-filtering-correlation-id: d3cceb3c-2491-4816-a9c3-08ded0621d5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|16056099006|29003799003|25016099003|12006099003|6133799003|8096899003|13003099007;
x-microsoft-antispam-message-info: 
 LVnpcRTDakL2ps0zkWi7yZU/C0VrR9TEwzW6SfgeqmYJ8S265fbwHO4maVmAPQoyjesSw0glEnwTg/U78aSLGlvS+iLk6t+uSYR3WvgDnGlCLVG1MFXA4Vge7r5gcm20qKp3DaspVRddW4zLzSQCJp/Te3KbQBm1Bd2uZ8KCZbHqnyXV/V7wx3PDYwyTuJIEEEcOjkEFLlA4uTH17pK2lzrzBWHmwEdA48YyrdnjgJVrrvgAcW+ipXeVohxe/c33AE9YDg0wYn1i/NuLYl2efFTzIODH6yg7+u0AmYRL+NbTEf/wdMcFTnyHPNB1lQthRX82Pu6NMyTGYI+65DjoueybGC3aqbnxfhtoUeGh+7BPnZa1okQbZpRpC4AkZQ/nLQUv0uiMMBu2PE91ggteLK/XvpOp257usa95KhoH3gkVdKvqJ2k6P6xo/vm0F1eBSfcs3RZ/X7dX8AEKcBXP/TZZ2Neja7XkElncDNPWuIYAb0q3afF65NCbaMUpv5QKEzr0rWVA4GUa93TWd6hwCTdQhU2v1I6SsgWo83X8FZtveuJpt1IyD2IPHJ68CthU4dcVken/FBQuzi2y/9evXBYt3951kMnQ3uLiN/cZnojzCGpz7CPPi2Rg5zFQC/eGlDpY9HDyZlL3VNz0Z2mxX2Jr7+SoAek4y5aK3oro2xY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(16056099006)(29003799003)(25016099003)(12006099003)(6133799003)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SUXWeo6Bt4LQoCdjt1Kq5rRH5bshbKfjvh43LB5wGc73FMdWJIAE/jWdOHjm?=
 =?us-ascii?Q?w2+XG2Gy2h+SeIutkJoaK27Y3Cf5D2BwVoAxpprNTvBnDXPuJV3TN7+ZXasg?=
 =?us-ascii?Q?cDX/9uRUWHVmbF1o+lAvq0m3ovoAKmq3oZPmIfU6ja80PQZTlDkXmOEqfUpz?=
 =?us-ascii?Q?gGMirWBwUDJv1/BzImRzWI/ORB/GtxvtFyXUQdmKe58BRGafh1uyJfLfWTCZ?=
 =?us-ascii?Q?qP60UMiWLJF5/gDy19nEzszNE5HPlV8bzkTz1vHaYA+V4T6U0VOYjC9yJq8o?=
 =?us-ascii?Q?tY535/TbHdPU7ff/aJR9gFV9FGjLk/8yet2b0LPB1evsuvkhqBsi46PV0CT2?=
 =?us-ascii?Q?1xT7DGTFT0U+GPYOmhUHHvtF69p5zrWlb+EeOoR8t5XcGcw2p5OM9Zp2FifP?=
 =?us-ascii?Q?4P1+MVFT2jP1ccIRnvv9q3sJsn4pgBCr2e4x3dPI/yb7But7ptbUkm3ZNlll?=
 =?us-ascii?Q?Vg/O76MgdSXsPkuIyS0HLaQUjVhcAp7GOEDclsRt2jGEq0a4WEFQ1g6jlCeF?=
 =?us-ascii?Q?n2AKnBLizRmUa4tyUUlNKIEatBIQVzEne34O+5nkhrnDXrIB3TxTb74F7lSn?=
 =?us-ascii?Q?K+VUJmjbOUpe9NeN7qvGyeJdB5a4Ny+7xBXjm/MPAVV+UzAHH3Xcpn1k3+9+?=
 =?us-ascii?Q?Mg04aBqaxRpKkYDdCjtfBlLNEfxeNoGbTk71E1f1qVHjSaKXf9qcqchz/gpY?=
 =?us-ascii?Q?RgbE0iXeHpf87JOhhHnu3IS0LQph7F4mYuanVcnWKG/MzXeYeTHqjkroTp5P?=
 =?us-ascii?Q?DmyOr7hHYXQ946Ufh/BDTxnSMSB8m7uqgz6ND9cNV+zliewadk2lEGXIummQ?=
 =?us-ascii?Q?LI4cMdCI5vUmboPFBIK1qyGerwnwhiISk4ZgW7Uz4piaLQgzXLWsmAURhcq7?=
 =?us-ascii?Q?guQYHqYF303jKEr7qzMLSYpaAKEXcpLb6Ny3rg6WP7ELv2j6XpoDGlqbt5E4?=
 =?us-ascii?Q?8oMBOwAPbuyKmWVLbwF+oeeAp2pejPCrCxvt+YYkG2VaHwypWCmi6tHauoFK?=
 =?us-ascii?Q?jgOieznUCNzjvcr2pHuK7TsJAfJlbgerb0fw5+SzCdX2bLd4QN98FsjJ5cw6?=
 =?us-ascii?Q?1upFlQ3FjcAnrDqt9lTSvucMBLnWCe7z5z1OBMDzqLWTFHsA1JTg2IANEN7A?=
 =?us-ascii?Q?gYcav7BEHAY9Wqf6BL00GM4dbEHrHasz/YH7DyV+/au8jIMTF9KgErXXlMsf?=
 =?us-ascii?Q?lfPuKlSp4wOWe/IsR8Xu688twykzkMmz9r6h/ktn8kDd6X5wNJWm7CoY3f/K?=
 =?us-ascii?Q?mepnMCZH2jwRJxOWVyjX70PZ7gWiX3JgYrg32Se/1HqnBTiKO7aX4p08XvQk?=
 =?us-ascii?Q?zBKdfTAdxO4iqjs4u2xi2Kf7nmzmBmTX5tHppVV6V5ItNnwXK5Xpbvj2NlO4?=
 =?us-ascii?Q?R1jmVVF6pghKVrw3rzfMWuQpv8rI1Vf9ScojXhzbeCoIsS4hCeTlvx2wyAAc?=
 =?us-ascii?Q?q0eTS00qmMMhrJJirzMpY2UD4k8I6jhjjtl3uGvG/07EJnz7p7L4HGbgOj4+?=
 =?us-ascii?Q?fov8MJXTbYSBhZCDzeUtq6Chw80VLFg+kpWHRk4RPt1N3HigWi02Iqlfs9LH?=
 =?us-ascii?Q?0dcIWOSyjByZRRhLyhkkKmc1NQNgzJjvEXCGerPKJ8OiVsxkWsr1giCWiqaG?=
 =?us-ascii?Q?WnJDT+Wy9jd0tKbURe8prZzR7RVnE7K1wX4TXSeJfWUBjns8LbHDmj6aa9/s?=
 =?us-ascii?Q?0/W1SPjCZX5J0jmXCBlUgc5yRnPAycuHCNLhqIX7q/QNk5qI?=
Content-Type: multipart/alternative;
	boundary="_000_AMBP189MB319677192FB71D050506AAFCF8EF2AMBP189MB3196EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cceb3c-2491-4816-a9c3-08ded0621d5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 13:28:15.0580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpSUP8Dgt3TF7PuOgFXluRl15Vy8DACsmSHiDyr2/7SowQNiB3ck/j7KK6e5OaW49vGfHP29PMgnPjC4fiNanA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2823
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239298

--_000_AMBP189MB319677192FB71D050506AAFCF8EF2AMBP189MB3196EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the input, I also noticed I've put the wrong email in the expat =
patch so I will provide a v3.

Kind Regards,

Amaury
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, 17 June 2026 01:37
To: Amaury Couderc <amaury.couderc@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210

On Mon Jun 15, 2026 at 8:36 AM CEST, Amaury Couderc via lists.openembedded.=
org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> Backport patch to fix CVE-2026-7210.
>   https://nvd.nist.gov/vuln/detail/CVE-2026-7210
>
> In order to mitigate CVE-2026-7210 this patch should come alongside
> the associated expat one which backports to expat 2.6.4 the fixes
> introduced in expat 2.8.0.
>
> Upstream fixes:
>   https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f337=
51c88d7d876dfbf27645c56
>   https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49=
a43554193d7f5f4d993189c

Hello,

If I'm not mistaken those fixes are in 3.14.6 or the future 3.15 and
neither are in wrynose nor master. Can you please send a fix for those
branches (either backport or upgrade), and, then, ping back here?

Thanks!

>
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../python/python3/CVE-2026-7210-1.patch      | 90 +++++++++++++++++++
>  .../python/python3/CVE-2026-7210-2.patch      | 74 +++++++++++++++
>  .../python/python3_3.12.13.bb                 |  2 +
>  3 files changed, 166 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210-1.=
patch
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210-2.=
patch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch b=
/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
> new file mode 100644
> index 0000000000..63aac320af
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
> @@ -0,0 +1,90 @@
> +From 03794ce9a58b1f33751c88d7d876dfbf27645c56 Mon Sep 17 00:00:00 2001
> +From: Stan Ulbrych <stan@python.org>
> +Date: Sun, 26 Apr 2026 19:31:25 +0100
> +Subject: [PATCH] Use `XML_SetHashSalt16Bytes` from libExpat when possibl=
e
> +
> +CVE: CVE-2026-7210
> +Upstream-Status: Backport [https://github.com/python/cpython/pull/149023=
/commits/03794ce9a58b1f33751c88d7d876dfbf27645c56] with downstream extensio=
n for XML_BACKPORT_SET_HASH_SALT_16_BYTES detection
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + Include/pyexpat.h                                     |  3 +++
> + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst   |  3 +++
> + Modules/_elementtree.c                                |  8 ++++++--
> + Modules/pyexpat.c                                     | 11 ++++++++++-
> + 4 files changed, 22 insertions(+), 3 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-iss=
ue-149018.a9SqWb.rst
> +
> +diff --git a/Include/pyexpat.h b/Include/pyexpat.h
> +index f523f8bb273983a..a676e16a7a457ea 100644
> +--- a/Include/pyexpat.h
> ++++ b/Include/pyexpat.h
> +@@ -57,6 +57,9 @@ struct PyExpat_CAPI
> +         XML_Parser parser, unsigned long long activationThresholdBytes)=
;
> +     XML_Bool (*SetAllocTrackerMaximumAmplification)(
> +         XML_Parser parser, float maxAmplificationFactor);
> ++    /* might be NULL for expat < 2.8.0 */
> ++    XML_Bool (*SetHashSalt16Bytes)(
> ++        XML_Parser parser, const uint8_t entropy[16]);
> +     /* always add new stuff to the end! */
> + };
> +
> +diff --git a/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1490=
18.a9SqWb.rst b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1490=
18.a9SqWb.rst
> +new file mode 100644
> +index 000000000000000..d1b5b368684e6a5
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9Sq=
Wb.rst
> +@@ -0,0 +1,3 @@
> ++Improved protection against XML hash-flooding attacks in
> ++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Python i=
s
> ++compiled with libExpat 2.8.0 or later.
> +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
> +index cbd1e026df27227..b2d4b982602c583 100644
> +--- a/Modules/_elementtree.c
> ++++ b/Modules/_elementtree.c
> +@@ -3657,8 +3657,12 @@ _elementtree_XMLParser___init___impl(XMLParserObj=
ect *self, PyObject *target,
> +         PyErr_NoMemory();
> +         return -1;
> +     }
> +-    /* expat < 2.1.0 has no XML_SetHashSalt() */
> +-    if (EXPAT(st, SetHashSalt) !=3D NULL) {
> ++    // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
> ++    if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
> ++        EXPAT(st, SetHashSalt16Bytes)(self->parser,
> ++                                      (const uint8_t *)_Py_HashSecret.u=
c);
> ++    }
> ++    else if (EXPAT(st, SetHashSalt) !=3D NULL) {
> +         EXPAT(st, SetHashSalt)(self->parser,
> +                            (unsigned long)_Py_HashSecret.expat.hashsalt=
);
> +     }
> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> +index 0f0afe17513ef1c..1df433e64bc096f 100644
> +--- a/Modules/pyexpat.c
> ++++ b/Modules/pyexpat.c
> +@@ -1388,7 +1388,12 @@ newxmlparseobject(pyexpat_state *state, const cha=
r *encoding,
> +         Py_DECREF(self);
> +         return NULL;
> +     }
> +-#if XML_COMBINED_VERSION >=3D 20100
> ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> ++    || XML_COMBINED_VERSION >=3D 20800
> ++    /* This feature was added upstream in libexpat 2.8.0. */
> ++    XML_SetHashSalt16Bytes(self->itself,
> ++                           (const uint8_t *)_Py_HashSecret.uc);
> ++#elif XML_COMBINED_VERSION >=3D 20100
> +     /* This feature was added upstream in libexpat 2.1.0. */
> +     XML_SetHashSalt(self->itself,
> +                     (unsigned long)_Py_HashSecret.expat.hashsalt);
> +@@ -2257,6 +2262,12 @@ pyexpat_exec(PyObject *mod)
> + #else
> +     capi->SetHashSalt =3D NULL;
> + #endif
> ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> ++    || XML_COMBINED_VERSION >=3D 20800
> ++    capi->SetHashSalt16Bytes =3D XML_SetHashSalt16Bytes;
> ++#else
> ++    capi->SetHashSalt16Bytes =3D NULL;
> ++#endif
> + #if XML_COMBINED_VERSION >=3D 20600
> +     capi->SetReparseDeferralEnabled =3D XML_SetReparseDeferralEnabled;
> + #else
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch b=
/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
> new file mode 100644
> index 0000000000..e9a10d3705
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
> @@ -0,0 +1,74 @@
> +From ccb8d2f7df9534e49a43554193d7f5f4d993189c Mon Sep 17 00:00:00 2001
> +From: Stan Ulbrych <stan@python.org>
> +Date: Sun, 26 Apr 2026 19:42:01 +0100
> +Subject: [PATCH] Add `_Py_HashSecret_t.expat.hashsalt16` instead
> +
> +CVE: CVE-2026-7210
> +Upstream-Status: Backport [https://github.com/python/cpython/pull/149023=
/commits/ccb8d2f7df9534e49a43554193d7f5f4d993189c]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + Include/pyhash.h       | 8 +++++---
> + Modules/_elementtree.c | 2 +-
> + Modules/pyexpat.c      | 3 +--
> + 3 files changed, 7 insertions(+), 6 deletions(-)
> +
> +diff --git a/Include/pyhash.h b/Include/pyhash.h
> +index 84cb72fa6fd1b26..3056dc44cc0f1b1 100644
> +--- a/Include/pyhash.h
> ++++ b/Include/pyhash.h
> +@@ -39,14 +39,14 @@
> +  *   pppppppp ssssssss ........  fnv -- two Py_hash_t
> +  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t
> +  *   ........ ........ ssssssss  djbx33a -- 16 bytes padding + one Py_h=
ash_t
> +- *   ........ ........ eeeeeeee  pyexpat XML hash salt
> ++ *   eeeeeeee eeeeeeee eeeeeeee  pyexpat XML hash salt
> +  *
> +  * memory layout on 32 bit systems
> +  *   cccccccc cccccccc cccccccc  uc
> +  *   ppppssss ........ ........  fnv -- two Py_hash_t
> +  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t (*)
> +  *   ........ ........ ssss....  djbx33a -- 16 bytes padding + one Py_h=
ash_t
> +- *   ........ ........ eeee....  pyexpat XML hash salt
> ++ *   eeeeeeee eeeeeeee eeee....  pyexpat XML hash salt
> +  *
> +  * (*) The siphash member may not be available on 32 bit platforms with=
out
> +  *     an unsigned int64 data type.
> +@@ -71,7 +71,9 @@ typedef union {
> +         Py_hash_t suffix;
> +     } djbx33a;
> +     struct {
> +-        unsigned char padding[16];
> ++        /* 16 bytes for XML_SetHashSalt16Bytes */
> ++        uint8_t hashsalt16[16];
> ++        /* 4/8 bytes for legacy XML_SetHashSalt */
> +         Py_hash_t hashsalt;
> +     } expat;
> + } _Py_HashSecret_t;
> +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
> +index b2d4b982602c583..9e794be5c109ba5 100644
> +--- a/Modules/_elementtree.c
> ++++ b/Modules/_elementtree.c
> +@@ -3660,7 +3660,7 @@ _elementtree_XMLParser___init___impl(XMLParserObje=
ct *self, PyObject *target,
> +     // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
> +     if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
> +         EXPAT(st, SetHashSalt16Bytes)(self->parser,
> +-                                      (const uint8_t *)_Py_HashSecret.u=
c);
> ++                                      _Py_HashSecret.expat.hashsalt16);
> +     }
> +     else if (EXPAT(st, SetHashSalt) !=3D NULL) {
> +         EXPAT(st, SetHashSalt)(self->parser,
> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> +index 1df433e64bc096f..78efbef679024f3 100644
> +--- a/Modules/pyexpat.c
> ++++ b/Modules/pyexpat.c
> +@@ -1391,8 +1391,7 @@ newxmlparseobject(pyexpat_state *state, const char=
 *encoding,
> + #if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> +     || XML_COMBINED_VERSION >=3D 20800
> +     /* This feature was added upstream in libexpat 2.8.0. */
> +-    XML_SetHashSalt16Bytes(self->itself,
> +-                           (const uint8_t *)_Py_HashSecret.uc);
> ++    XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt1=
6);
> + #elif XML_COMBINED_VERSION >=3D 20100
> +     /* This feature was added upstream in libexpat 2.1.0. */
> +     XML_SetHashSalt(self->itself,
> diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recip=
es-devtools/python/python3_3.12.13.bb
> index 5fa25235fe..3e5575d396 100644
> --- a/meta/recipes-devtools/python/python3_3.12.13.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.13.bb
> @@ -34,6 +34,8 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>           file://0001-test_deadlock-skip-problematic-test.patch \
>           file://0001-test_active_children-skip-problematic-test.patch \
>             file://0001-test_readline-skip-limited-history-test.patch \
> +           file://CVE-2026-7210-1.patch \
> +           file://CVE-2026-7210-2.patch \
>             "
>
>  SRC_URI:append:class-native =3D " \


--
Yoann Congal
Smile ECS


--_000_AMBP189MB319677192FB71D050506AAFCF8EF2AMBP189MB3196EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the input, I also noticed I've put the wrong email in the expat =
patch so I will provide a v3.</div>
<div id=3D"Signature" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Kind Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, &quot;Aptos_Embe=
ddedFont&quot;, &quot;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Amaury</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, 17 June 2026 01:37<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-202=
6-7210</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon Jun 15, 2026 at 8:36 AM CEST, Amaury Couder=
c via lists.openembedded.org wrote:<br>
&gt; From: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt;<br>
&gt; Backport patch to fix CVE-2026-7210.<br>
&gt;&nbsp;&nbsp; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-7210"=
>https://nvd.nist.gov/vuln/detail/CVE-2026-7210</a><br>
&gt;<br>
&gt; In order to mitigate CVE-2026-7210 this patch should come alongside <b=
r>
&gt; the associated expat one which backports to expat 2.6.4 the fixes <br>
&gt; introduced in expat 2.8.0.<br>
&gt;<br>
&gt; Upstream fixes:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://github.com/python/cpython/pull/149023/c=
ommits/03794ce9a58b1f33751c88d7d876dfbf27645c56">
https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f33751c8=
8d7d876dfbf27645c56</a><br>
&gt;&nbsp;&nbsp; <a href=3D"https://github.com/python/cpython/pull/149023/c=
ommits/ccb8d2f7df9534e49a43554193d7f5f4d993189c">
https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49a435=
54193d7f5f4d993189c</a><br>
<br>
Hello,<br>
<br>
If I'm not mistaken those fixes are in 3.14.6 or the future 3.15 and<br>
neither are in wrynose nor master. Can you please send a fix for those<br>
branches (either backport or upgrade), and, then, ping back here?<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt;<br>
&gt; Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../python/python3/CVE-2026-7210-1.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 90 +++++++++++++++++++<br>
&gt;&nbsp; .../python/python3/CVE-2026-7210-2.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 74 +++++++++++++++<br>
&gt;&nbsp; .../python/python3_3.12.13.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +<b=
r>
&gt;&nbsp; 3 files changed, 166 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/python/python3/CVE-2026=
-7210-1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/python/python3/CVE-2026=
-7210-2.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patc=
h b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..63aac320af<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch<br>
&gt; @@ -0,0 +1,90 @@<br>
&gt; +From 03794ce9a58b1f33751c88d7d876dfbf27645c56 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Stan Ulbrych &lt;stan@python.org&gt;<br>
&gt; +Date: Sun, 26 Apr 2026 19:31:25 +0100<br>
&gt; +Subject: [PATCH] Use `XML_SetHashSalt16Bytes` from libExpat when poss=
ible<br>
&gt; +<br>
&gt; +CVE: CVE-2026-7210<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/cpyth=
on/pull/149023/commits/03794ce9a58b1f33751c88d7d876dfbf27645c56">https://gi=
thub.com/python/cpython/pull/149023/commits/03794ce9a58b1f33751c88d7d876dfb=
f27645c56</a>] with downstream extension
 for XML_BACKPORT_SET_HASH_SALT_16_BYTES detection<br>
&gt; +<br>
&gt; +Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; +---<br>
&gt; + Include/pyexpat.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp; 3 +++<br>
&gt; + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst&nbsp;&nbsp; |&nbs=
p; 3 +++<br>
&gt; + Modules/_elementtree.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8=
 ++++++--<br>
&gt; + Modules/pyexpat.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; | 11 ++++++++++-<br>
&gt; + 4 files changed, 22 insertions(+), 3 deletions(-)<br>
&gt; + create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-=
issue-149018.a9SqWb.rst<br>
&gt; +<br>
&gt; +diff --git a/Include/pyexpat.h b/Include/pyexpat.h<br>
&gt; +index f523f8bb273983a..a676e16a7a457ea 100644<br>
&gt; +--- a/Include/pyexpat.h<br>
&gt; ++++ b/Include/pyexpat.h<br>
&gt; +@@ -57,6 +57,9 @@ struct PyExpat_CAPI<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_Parser parser, u=
nsigned long long activationThresholdBytes);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; XML_Bool (*SetAllocTrackerMaximumAmplificati=
on)(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_Parser parser, f=
loat maxAmplificationFactor);<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* might be NULL for expat &lt; 2.8.0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; XML_Bool (*SetHashSalt16Bytes)(<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_Parser parser, const =
uint8_t entropy[16]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* always add new stuff to the end! */<br>
&gt; + };<br>
&gt; + <br>
&gt; +diff --git a/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1=
49018.a9SqWb.rst b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1=
49018.a9SqWb.rst<br>
&gt; +new file mode 100644<br>
&gt; +index 000000000000000..d1b5b368684e6a5<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a=
9SqWb.rst<br>
&gt; +@@ -0,0 +1,3 @@<br>
&gt; ++Improved protection against XML hash-flooding attacks in<br>
&gt; ++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Pytho=
n is<br>
&gt; ++compiled with libExpat 2.8.0 or later.<br>
&gt; +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c<br>
&gt; +index cbd1e026df27227..b2d4b982602c583 100644<br>
&gt; +--- a/Modules/_elementtree.c<br>
&gt; ++++ b/Modules/_elementtree.c<br>
&gt; +@@ -3657,8 +3657,12 @@ _elementtree_XMLParser___init___impl(XMLParser=
Object *self, PyObject *target,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PyErr_NoMemory();<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp; /* expat &lt; 2.1.0 has no XML_SetHashSalt() */<b=
r>
&gt; +-&nbsp;&nbsp;&nbsp; if (EXPAT(st, SetHashSalt) !=3D NULL) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; // Prefer 16-byte entropy, only expat &gt;=3D 2.8=
.0. See gh-149018<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXPAT(st, SetHashSalt16By=
tes)(self-&gt;parser,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp; else if (EXPAT(st, SetHashSalt) !=3D NULL) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXPAT(st, SetHashSal=
t)(self-&gt;parser,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; (unsigned long)_Py_HashSecret.expat.hashsalt);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c<br>
&gt; +index 0f0afe17513ef1c..1df433e64bc096f 100644<br>
&gt; +--- a/Modules/pyexpat.c<br>
&gt; ++++ b/Modules/pyexpat.c<br>
&gt; +@@ -1388,7 +1388,12 @@ newxmlparseobject(pyexpat_state *state, const =
char *encoding,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Py_DECREF(self);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-#if XML_COMBINED_VERSION &gt;=3D 20100<br>
&gt; ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \<br>
&gt; ++&nbsp;&nbsp;&nbsp; || XML_COMBINED_VERSION &gt;=3D 20800<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* This feature was added upstream in libexpat 2.=
8.0. */<br>
&gt; ++&nbsp;&nbsp;&nbsp; XML_SetHashSalt16Bytes(self-&gt;itself,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++#elif XML_COMBINED_VERSION &gt;=3D 20100<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* This feature was added upstream in libexp=
at 2.1.0. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; XML_SetHashSalt(self-&gt;itself,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (unsigned long)_Py_Hash=
Secret.expat.hashsalt);<br>
&gt; +@@ -2257,6 +2262,12 @@ pyexpat_exec(PyObject *mod)<br>
&gt; + #else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; capi-&gt;SetHashSalt =3D NULL;<br>
&gt; + #endif<br>
&gt; ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \<br>
&gt; ++&nbsp;&nbsp;&nbsp; || XML_COMBINED_VERSION &gt;=3D 20800<br>
&gt; ++&nbsp;&nbsp;&nbsp; capi-&gt;SetHashSalt16Bytes =3D XML_SetHashSalt16=
Bytes;<br>
&gt; ++#else<br>
&gt; ++&nbsp;&nbsp;&nbsp; capi-&gt;SetHashSalt16Bytes =3D NULL;<br>
&gt; ++#endif<br>
&gt; + #if XML_COMBINED_VERSION &gt;=3D 20600<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; capi-&gt;SetReparseDeferralEnabled =3D XML_S=
etReparseDeferralEnabled;<br>
&gt; + #else<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patc=
h b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e9a10d3705<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch<br>
&gt; @@ -0,0 +1,74 @@<br>
&gt; +From ccb8d2f7df9534e49a43554193d7f5f4d993189c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Stan Ulbrych &lt;stan@python.org&gt;<br>
&gt; +Date: Sun, 26 Apr 2026 19:42:01 +0100<br>
&gt; +Subject: [PATCH] Add `_Py_HashSecret_t.expat.hashsalt16` instead<br>
&gt; +<br>
&gt; +CVE: CVE-2026-7210<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/cpyth=
on/pull/149023/commits/ccb8d2f7df9534e49a43554193d7f5f4d993189c">https://gi=
thub.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49a43554193d7f5f=
4d993189c</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; +---<br>
&gt; + Include/pyhash.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 8 +++++---<br=
>
&gt; + Modules/_elementtree.c | 2 +-<br>
&gt; + Modules/pyexpat.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3 +--<br>
&gt; + 3 files changed, 7 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Include/pyhash.h b/Include/pyhash.h<br>
&gt; +index 84cb72fa6fd1b26..3056dc44cc0f1b1 100644<br>
&gt; +--- a/Include/pyhash.h<br>
&gt; ++++ b/Include/pyhash.h<br>
&gt; +@@ -39,14 +39,14 @@<br>
&gt; +&nbsp; *&nbsp;&nbsp; pppppppp ssssssss ........&nbsp; fnv -- two Py_h=
ash_t<br>
&gt; +&nbsp; *&nbsp;&nbsp; k0k0k0k0 k1k1k1k1 ........&nbsp; siphash -- two =
uint64_t<br>
&gt; +&nbsp; *&nbsp;&nbsp; ........ ........ ssssssss&nbsp; djbx33a -- 16 b=
ytes padding + one Py_hash_t<br>
&gt; +- *&nbsp;&nbsp; ........ ........ eeeeeeee&nbsp; pyexpat XML hash sal=
t<br>
&gt; ++ *&nbsp;&nbsp; eeeeeeee eeeeeeee eeeeeeee&nbsp; pyexpat XML hash sal=
t<br>
&gt; +&nbsp; *<br>
&gt; +&nbsp; * memory layout on 32 bit systems<br>
&gt; +&nbsp; *&nbsp;&nbsp; cccccccc cccccccc cccccccc&nbsp; uc<br>
&gt; +&nbsp; *&nbsp;&nbsp; ppppssss ........ ........&nbsp; fnv -- two Py_h=
ash_t<br>
&gt; +&nbsp; *&nbsp;&nbsp; k0k0k0k0 k1k1k1k1 ........&nbsp; siphash -- two =
uint64_t (*)<br>
&gt; +&nbsp; *&nbsp;&nbsp; ........ ........ ssss....&nbsp; djbx33a -- 16 b=
ytes padding + one Py_hash_t<br>
&gt; +- *&nbsp;&nbsp; ........ ........ eeee....&nbsp; pyexpat XML hash sal=
t<br>
&gt; ++ *&nbsp;&nbsp; eeeeeeee eeeeeeee eeee....&nbsp; pyexpat XML hash sal=
t<br>
&gt; +&nbsp; *<br>
&gt; +&nbsp; * (*) The siphash member may not be available on 32 bit platfo=
rms without<br>
&gt; +&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; an unsigned int64 data type.<br>
&gt; +@@ -71,7 +71,9 @@ typedef union {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Py_hash_t suffix;<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } djbx33a;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char padding[16]=
;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 16 bytes for XML_SetHa=
shSalt16Bytes */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t hashsalt16[16];<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 4/8 bytes for legacy X=
ML_SetHashSalt */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Py_hash_t hashsalt;<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } expat;<br>
&gt; + } _Py_HashSecret_t;<br>
&gt; +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c<br>
&gt; +index b2d4b982602c583..9e794be5c109ba5 100644<br>
&gt; +--- a/Modules/_elementtree.c<br>
&gt; ++++ b/Modules/_elementtree.c<br>
&gt; +@@ -3660,7 +3660,7 @@ _elementtree_XMLParser___init___impl(XMLParserO=
bject *self, PyObject *target,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // Prefer 16-byte entropy, only expat &gt;=
=3D 2.8.0. See gh-149018<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL)=
 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXPAT(st, SetHashSal=
t16Bytes)(self-&gt;parser,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; _Py_HashSecret.expat.hashsalt16);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else if (EXPAT(st, SetHashSalt) !=3D NULL) {=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXPAT(st, SetHashSal=
t)(self-&gt;parser,<br>
&gt; +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c<br>
&gt; +index 1df433e64bc096f..78efbef679024f3 100644<br>
&gt; +--- a/Modules/pyexpat.c<br>
&gt; ++++ b/Modules/pyexpat.c<br>
&gt; +@@ -1391,8 +1391,7 @@ newxmlparseobject(pyexpat_state *state, const c=
har *encoding,<br>
&gt; + #if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; || XML_COMBINED_VERSION &gt;=3D 20800<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* This feature was added upstream in libexp=
at 2.8.0. */<br>
&gt; +-&nbsp;&nbsp;&nbsp; XML_SetHashSalt16Bytes(self-&gt;itself,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++&nbsp;&nbsp;&nbsp; XML_SetHashSalt16Bytes(self-&gt;itself, _Py_HashS=
ecret.expat.hashsalt16);<br>
&gt; + #elif XML_COMBINED_VERSION &gt;=3D 20100<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* This feature was added upstream in libexp=
at 2.1.0. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; XML_SetHashSalt(self-&gt;itself,<br>
&gt; diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/re=
cipes-devtools/python/python3_3.12.13.bb<br>
&gt; index 5fa25235fe..3e5575d396 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3_3.12.13.bb<br>
&gt; +++ b/meta/recipes-devtools/python/python3_3.12.13.bb<br>
&gt; @@ -34,6 +34,8 @@ SRC_URI =3D &quot;<a href=3D""></a>http://www.python=
.org/ftp/python/${PV}/Python-${PV}.tar.xz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D=
"file://0001-test_deadlock-skip-problematic-test.patch">file://0001-test_de=
adlock-skip-problematic-test.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D=
"file://0001-test_active_children-skip-problematic-test.patch">
file://0001-test_active_children-skip-problematic-test.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-test_readline-skip-limited-history-test.patch">
file://0001-test_readline-skip-limited-history-test.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-7210-1.patch">file://CVE-2026-7210-1.patch</a>&nbsp;\<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-7210-2.patch">file://CVE-2026-7210-2.patch</a>&nbsp;\<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SRC_URI:append:class-native =3D &quot; \<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AMBP189MB319677192FB71D050506AAFCF8EF2AMBP189MB3196EURP_--

