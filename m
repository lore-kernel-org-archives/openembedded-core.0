Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47633FD377E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 18:58:35 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53060.1772045907081863469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 10:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=aDui+WpC;
 spf=pass (domain: axis.com, ip: 52.101.70.69, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYscgYpEaMJ0/H/JXrbAxCxaEaGD5lby2CoJ0d6W4bP/n5mTufdpsjF0OQepFkqBG92ag31MTNEHnF8AGMS+PRIZGOA0m47+p6N89mMBizZwikU+6TuH5Ih+kjqSsWJ+1tGD9zu4iBL8FFjc5Wz7Pupvw4d0wXAM+OSPMoHKENPerXsomRRN0zr1gkGKwhM5MHW1J1wETeyAVTB7P1qdlXJRYjAJbUQPOg3xiKmu8IG3fTPj+dovK5U6YQFdHTvmTp9jH+lQdPByqsJE+aTJpArS7hgEiZRPKQ1Sq237WLcBKhY7pFGzkqZRrnVYXtem7INsP2nmlIxw0YEIR/0D1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRLc9ItaMdHKLcqiqY+gZ+PsSdQ9ot1FDl8dXLUS7yI=;
 b=BCKONMy79tgYjR5ZjxLmCpFjh5dfLbYMvjfoVmcQXm+fJ6aaYfqBe4UA+1bhyESVh0BROtgym4quvZLWIzHHXPXQgbE2peKOGwaXO6UM9lUiE5yfzxmcPsUqV/cjQB9wItZEC7xbFN/A+ceceRsEXxa1yEgu9oTjsl4tA4Hncsk3CEx+fx6fo1wx185N+OFel06LxXaCfgDjCOjOGGkyEGzziKtGXhYwMKeKSAHThM/b3CgegAREPYcihwe2LuAv1DwZchTBKok0s4QTqNeF5ajW2aZ5bWU+7KR5CTxQHc9uDG+scglyZacEBCn/E8oVZRz4LWFYoHP4LpzH+eNw/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRLc9ItaMdHKLcqiqY+gZ+PsSdQ9ot1FDl8dXLUS7yI=;
 b=aDui+WpCVvXHOH3hBgQQ9OgLfxMYCfpWN/2g7brNI4A3aYoaanCwbJN3XpwvZ334D3e5hys1HQ96bTeXxOv9Zoq/58zSkIv1MfBRnDUXsNwpBDuJP9DUgy5qrTR9uYlGmsajnTnaIa4yzB29HL/4yXATFYtxi7A5Nci4srqhTqU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB10271.eurprd02.prod.outlook.com (2603:10a6:20b:634::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 18:58:22 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9632.010; Wed, 25 Feb 2026
 18:58:22 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/4] lzop: improve aclocal.m4 handling
Thread-Topic: [OE-core] [PATCH 2/4] lzop: improve aclocal.m4 handling
Thread-Index: AQHcplOoDvDK7K/+2EKP+bkBeyw5Y7WTxEPw
Date: Wed, 25 Feb 2026 18:58:22 +0000
Message-ID: 
 <DB5PR02MB102136B6FC33A6E0EC8AB347DEF75A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260225123727.2043715-1-ross.burton@arm.com>
 <20260225123727.2043715-2-ross.burton@arm.com>
In-Reply-To: <20260225123727.2043715-2-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB10271:EE_
x-ms-office365-filtering-correlation-id: 2e7f3531-e18d-47e8-27b5-08de749fd929
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 4z+HeMmj37xzTSRET6ZqhEPDacawuR5Nys+hOUP3f0s/wO5hgasPzH2rUDABaVknsro8cjG4mewanwRo9PC2aJrrM964I4uh9lszH+4nIJw3yGE2Ci/GbAJlwe/iQRh4PsxsebtGo4xXQIPEQ9Ufc8diATYjHvpAKn8BT/IhcaWA2VnurkRfNeYOSIuJKeBBlXX7TO/Gs2VzTcADjoNxDpPkIWfLmn52Bx7JZHmrCiwG/1Nh4EPaGV4IL6M7u4G4P1RElwS5PMiTEUBGy7V4u31KJY43voLkvY8vBVrCZPqFnOitx7G+aR9A3DBIOSme+argp5EGBvlPfJFCPGTpHraQjZPGHTkwCXq3WOfJDGjUFbGOBzxvahCdJ+/e0r1mF+n9Ynn5/gC3Kvdc20Zt2wnOuj/sUOMrblU2wPSQ9rhzNuZ38sWCl8RAhjUc/x7YOITugVrv7re1+T9P4BUNwGbts28JxzXBbshIVbHaIwH/Iken8uJY8EynBWVrqtWUcUOzZIAmQYM7/8yuC1IA6YZnWJ7blz6ZFP1bo9yVCesODq9KgpqM+25Wql8tq/HQs4uI9wLyz5Uu9G/b9/FUkcFpsuM/KqMtZgzEtAAAGfYZAEvkGpsKX/Rgr8iSHVboxJjJJ6h1Wwx6SmccAAAHeMB2pOidAQK3K+UlwE3VLiTwO+gID9svKhmZ11o8g65jDBMX9VlZONpcfOj3wQj/8zd+AKOclnKsEGefFi4iuw87vaFUZP/Cmj4r3BEVZTBt
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?G5ZQRpC4CEiYrrvewIcSy6b9Jx2cyX8RKnmhCQlKkU2B+5jI5rI88Ep4vPtW?=
 =?us-ascii?Q?SfnDBcR0Hh7LLiqlXueG72uUFhonAc5tZZl7hvqL052dNtxgd40J3r6XmJG2?=
 =?us-ascii?Q?pM8PFZmWuz/BOOZuqhv7FPFfP9kUbJ9vR0+1Rgx+79xp3R4jfEGbEHw3ed0e?=
 =?us-ascii?Q?Tzdttg3tLQrZdO+L8eco476dE9iCUGxLTIUklK0WDRHRIwvO8K6lB45SFrZe?=
 =?us-ascii?Q?q7EsGGB+TPxKGOqN47hrNKz8auePWF+i+ma1hCYofFcUCAmd/aEpudWWFcM7?=
 =?us-ascii?Q?llIo3OQFw9uNwhTTd0weWybRiFFHSX9jZ1CunLCtLvnvcjU+tnJnh/AT9ypg?=
 =?us-ascii?Q?8Q7bYiTruEGqBQpd5s6+htqmiYq+zdubpZdrkqAA1a+3XmK6vKWq1TvLYibA?=
 =?us-ascii?Q?ALKeX6JjKcR1WIwOJtebEOPoC/GEbfDFMGe4UOCeXvFkFedYVzcv5enXQFJa?=
 =?us-ascii?Q?JYjJIp5LGJ0TAtJMXC91O7mKOVpARHzS0cCAi0Bja/yfR0nTGh/UhSG+p14C?=
 =?us-ascii?Q?tPw2+zZ4yACi11XGOKkICsPQn0cEax7NT2Q3vPyXTVi6pkPLZ/F6RZAzGvcU?=
 =?us-ascii?Q?yNR2rVH54n3YLWdsBZYBP02GALuvmh6lb2uYgus0cM43j8nsqU3lFJ6gimmc?=
 =?us-ascii?Q?1qOe0H9UUAIZRit+5TjkXmYxnCuYd2YI0zBGMEybYYsPIEiTKGWpdQNQYTWN?=
 =?us-ascii?Q?p9ousn7/MQONgt8/OFDGZQ0av3Tq8n6sfqwKG58CIhYbs2mjPJkdTWgVCaR3?=
 =?us-ascii?Q?B9x3YjwQGYOosnVt8QAO3nLLTjWiaS4cZfMv1CZnWiVRxxeRGxK/e52C3u1Z?=
 =?us-ascii?Q?vHS6eb7YAk8ueSHzGA3yA5m/vx1+r9hdUcCH1RDdfbXTUhcTPL7j1oTUA9rI?=
 =?us-ascii?Q?F2Xy5YoJUAMnDlimmJbQtsVfDe3kT8ULAS0Y/HDx2E3Z7LPjY4bhsHNc5ysq?=
 =?us-ascii?Q?sCeKJZ1hKESlR+zweAZreL2vpRhzhl+HTOyWY5q4qO1UMnHgf1UBprID38yH?=
 =?us-ascii?Q?EYs7O3q8IAhq15INADe8FosQU0kFcnC8eY1+tdAK4KO4D1ojo1GHLpkSfSHi?=
 =?us-ascii?Q?QetjYEyCm0u/srxSS7PNK7AQDQmQCOYDewFJMkqq5NGo3lPe+hzXHWeTZlK3?=
 =?us-ascii?Q?gF66Y0ex4NX4g15a3fnQX+FlgjckdUFLM4HSPy04cfQSU5pmSXybqo44g24M?=
 =?us-ascii?Q?9OkG/zNLf+JLVt0iFsTSVLcgb/IVg18AS16rMBiuRZ0WLhXRXzneah3pGOWh?=
 =?us-ascii?Q?go3WO+MXXp1i/7Sv7IQA60krTutT6VQBC0FCEr/fxDatMk4EzYj43dX7f5LB?=
 =?us-ascii?Q?jaN9VhWgRwenRVacu/ITOnamyFTHOe5uoO19DtTKLCZ49XNbuo3GtxUnh9Rh?=
 =?us-ascii?Q?/59EDa7rN2H5AEaJSg/88KOzb3cfIngEV898OrttL/XGfSxjl0RxNbG60bbr?=
 =?us-ascii?Q?dE/ylyRINnJfh3oDxhRv1JK1Dlu/iTz9fT4H+ZXZofpTN0lbpdOaSVzDdBqf?=
 =?us-ascii?Q?fcKCKhb145LVYoICVzKYmoBF3VuCpKZkjVE1DMzZfdRxIn1cu8e7F7wbU6L2?=
 =?us-ascii?Q?t+GE9GsejkTrmipGoFmBHX8C5pq8sHHjTgaq55UAuCeE7xUUs3SSZDBfZ8Lq?=
 =?us-ascii?Q?DUeNQAoVOhSVrF932SLLSxnTfp1FMcc3tXNgaDyZ9ZuxLQXvY2s1/NUGvQoE?=
 =?us-ascii?Q?mon2vMRN2XL7Ou3K9vckmggqZUA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7f3531-e18d-47e8-27b5-08de749fd929
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 18:58:22.4993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYAUeBe2hGQOptnRO5rPX+E65NfUDVTGjcpmJV9/fzb8ZW0PPIIHq5IU0X48iSL1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 18:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231973

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton via lists.openembedded.org
> Sent: den 25 februari 2026 13:37
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/4] lzop: improve aclocal.m4 handling
>=20
> This upstream has a hand-maintained aclocal.m4 which we don't want to
> delete (autotools.bbclass does this).  For some reason this was worked
> around by shipping a copy of aclocal.m4 as acinclude.m4 and dropping
> that into the build tree.
>=20
> A better solution is to just exclude aclocal in EXTRA_AUTORECONF, which
> has the side-effect of not removing the file.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/lzop/lzop_1.04.bb | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-support/lzop/lzop_1.04.bb b/meta/recipes-suppor=
t/lzop/lzop_1.04.bb
> index c32aa534228..57c2190cf40 100644
> --- a/meta/recipes-support/lzop/lzop_1.04.bb
> +++ b/meta/recipes-support/lzop/lzop_1.04.bb
> @@ -12,15 +12,12 @@ LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
>=20
> file://src/lzop.c;beginline=3D5;endline=3D21;md5=3D23d767de7754eb24b9e900=
b025cf7fc8"
>=20
> -SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz \
> -           file://acinclude.m4 \

You forgot to remove the actual acinclude.m4 file.

> -          "
> +SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz"
>  SRC_URI[sha256sum] =3D "7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe177=
4d95147f305a2f41"
>=20
>  inherit autotools
>=20
> -do_configure:prepend () {
> -    install -Dm 0644 ${UNPACKDIR}/acinclude.m4 ${S}/acinclude.m4
> -}
> +# Ensure we don't delete the shipped aclocal.m4
> +EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0

//Peter


