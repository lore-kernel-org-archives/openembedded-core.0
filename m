Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C5AEC1118
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 17:58:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.762.1771869531768380121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 09:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KjBtIQ94;
 spf=pass (domain: siemens.com, ip: 52.101.83.20, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3T4x9czXn/wIldh4nTmD/++SiBjYpbQiOeHmp1mZ3gm8prehPMyowa8EJYoOBm0rFvN2C77WzARqDK/X/yETar0HrorrGkk7yqvDmi7Seg7cpMO4/gE2c2xCYyLueyGO2HFSlyoAjcMcQhcBjBh+D50qA/WYTq35xMZOE4jInyn7TsGnumemxhpiwLFdkGA4rWKF95FALh/vUoyqgYBmILS1IcV1F/3byIcBL/F0HK35ugLIThGwLp96bP55LUpI8eeJxjbLivQ5Pqwuuoep+6NLra8+NY5j2PXNotrgXMGT3sDreIDYebHw1hdliOYP4LReWb6iVq4IeytEDpglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbm2B2C59uPD/gFxxeKXv0c8TMdeKr81IC5tBTuZbYA=;
 b=WLB0fKmlZXpjuFi5YWI0HbdD0775GtjNi11SY9uKnri/D8+Sc0q16se9X+KCIThECkySUrSi9f9oGtIglKuvIHNRNGP3AevbOYNPFAsQtU12/CQKtaCrZidypFnuSA2IPWKM84zTbxXwdws2OYeVwkXpoWoMK2tf79R6Co3tw/fbhiUtD2g58YGpype/mIR44Njz4+6e56Dx9YTOOXw6Cm97CYuxyxMuXSpQwXIMuTNgQTdQ6SE7QjxnwUBmmZFEeQzAq2vnXH0qQueeOjYf5IP3Y1/Dscf1sszAY/b0pbVPDjHhlENTlc4/0y2u2nTZC9z5IiP/+VzQv/7xXa8vpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbm2B2C59uPD/gFxxeKXv0c8TMdeKr81IC5tBTuZbYA=;
 b=KjBtIQ94qrbb1M4Z2N4Q1zGRqMfg+LQakWyMfUwjm/DdWrDqrHDrWKvnq+AJruV5CZe9xE8Pfa5NCkPLDRW4Ppx89n1riWFioa9eQyXgf7PFonmWoxoykyNgb05IiVImFJo/a3s0887/f/j59dpZvkVwhOYZNp5Jx9DBqziHJ/RULz9jSoOyNDnx45fgWGAxctD38DtBVifSwHSuJRfpEO31nV4fOqEYMFMes42UE0ATLCrfRdDbX74CQcsdoeWbP5LIQX9giWEeMdAJc1hFybmlO9FXpDrE9cmlUiDnQmX6sXE7H4JvfIVHZjeyPOZpUjTN3ceJp7kGVsROM9qfgg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB5828.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 17:58:47 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 17:58:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Yoann Congal
	<yoann.congal@smile.fr>
Subject: RE: [OE-core][kirkstone][PATCH] libpng: patch CVE-2026-25646
Thread-Topic: [OE-core][kirkstone][PATCH] libpng: patch CVE-2026-25646
Thread-Index: AQHcoFFCbjae1Z7AZ0GKLl5wN1Rt2bWQmrYw
Date: Mon, 23 Feb 2026 17:58:47 +0000
Message-ID: 
 <AS1PR10MB56979A3CF496D0DDF3C4EE68FD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <189524AD92992BAB.219417@lists.openembedded.org>
In-Reply-To: <189524AD92992BAB.219417@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=771e8901-6f80-4798-b91b-2a83713fd64d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-23T17:56:02Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB5828:EE_
x-ms-office365-filtering-correlation-id: e9fb205d-750a-4787-3967-08de73053144
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|7053199007|7142099003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?gOzjgnpHDUa08V8Di0x7LiYfZvbmvv3PwXikHlkgXlRPNq0ocLMKfcWTL2t+?=
 =?us-ascii?Q?N8p0xZq3982hM4O9U18D86Z9vLPlqZXb9fhX1xHYo4hcYmTkdeph2qDGPSKC?=
 =?us-ascii?Q?OGhPBXrnNe2es2x4ZmPSDWNYks10lWitP/nhFY905YeNaGhHfA9LCVVtLxMl?=
 =?us-ascii?Q?K7S0B0rjygrjmW/819rRKBHwQroitLmX3FobKDiHdYFvMtZkKwM1dMvVOBD8?=
 =?us-ascii?Q?w1VEnDquiHj0zHM9m2e+M34o8B025xmxgbDHRTpF6fdDPN3IWTOLSaRs50wc?=
 =?us-ascii?Q?i43vTbtezAJXEJ/H3a8Lxqdenf9hiJbX9IDkH7JmxGBb/mtTfsNB2/Whua0d?=
 =?us-ascii?Q?6vMwjkW7Nmx9aLHu4zf/DxWNmV76o7iuFVzUtF6uuYghYfbUjqZfC/+Bgq6P?=
 =?us-ascii?Q?owQHOgQ7WmzXXFdwyCM6QrUn2+0KsjK+SWNP+Ihyfmf9VDEGVR9YgUFgW1Hk?=
 =?us-ascii?Q?voolTH93MB2VAc58XydEvgtPrQ1j+WHfLFEf3p9UXOoyz0qcfDDARzUMMTTA?=
 =?us-ascii?Q?dwwIu+FD5jhYHRXlAlaYPGBA1He74l9OPlFM1AwiHmD/yQk4WNsxdRaDJgJj?=
 =?us-ascii?Q?Vmey2aSoAJ2MBDuk+Axw7bD9al1pmzcIPJ1f1pQG/9j6LK6VuD+lILoaBIb5?=
 =?us-ascii?Q?M1knYMXcekRt3wygRIlcJz+nE3cawRI4jdSDgK8gH020DCNOXJKFjOk6IJ6+?=
 =?us-ascii?Q?/Nj3R/E1+7wN+dz6r8CawRLTE3UiutxKtmJioCmigtZgnMIZMsQ3BRLaDr6a?=
 =?us-ascii?Q?yhdyujyXLBr2MUEwn3hPqybb9XSBFauMMgh5pe4vLPSc4WfkeTlCMzJ5rOkW?=
 =?us-ascii?Q?R83rJiyqaXlZRvxN24Ee4xvBluG4jTRAMCkeB5YlAIzGq/29iAYDxSDdg49w?=
 =?us-ascii?Q?CdH45/qbIsbjbPtlRVLwtNsInK0HhzbMVA8Xar1Zaz8AcAzPRD7wXWCvrBS1?=
 =?us-ascii?Q?J4Rgm5P/gj9hCVGgqlXblh/fDy8Q642N/fNq8jkje0zivzgHdBBK+PStrb3u?=
 =?us-ascii?Q?0pLYhWfzG6RT7LuJh7GqKfs976RAmqizyfFeb8Ue0yIu/ajYnsvSbLhcSZHJ?=
 =?us-ascii?Q?ed2mnxciLJZclCghJnfFaKtchM3rthHgPrSxlPuGG/isTaAxgIb32rYm/9fO?=
 =?us-ascii?Q?FSxTxT4agi+TpUj02Rm5/vKeZSUuWyBsqvmfZGW5F1Y46Ufs13VKdCeTfTyh?=
 =?us-ascii?Q?MEDYrIP+R5sgGT3kIYAi4mas275QajQoDx6hGqyc5Tr0rDRr7ZKFmAYqywhC?=
 =?us-ascii?Q?mV9Gz4MrWtETDGHWT37Bk/owDaW9KzbgT25xRf4Sw8TroLHS22uzwUIwiMYK?=
 =?us-ascii?Q?vizK9cuhgKpZ9CtecG7EzaYV7CqUqweJvF74Cr6Ebk10zy7sbERDFEOMIEiz?=
 =?us-ascii?Q?JChpDex4wvZFeg/Icn2WwZ19bSJoMV6zos7E8/Yso3UAiU4orwPdWX7/cJ3m?=
 =?us-ascii?Q?CyeHDBqtaueOETZotmXqswbPPqL4Gj8z7szLeueBkWJ9Pfg37gUtyJPArMK6?=
 =?us-ascii?Q?UGoRdJQnbeyVmNHsyyXCwYJHyYB26QU9g+UeM3HpD0a5vBjau5UbZkttBt3L?=
 =?us-ascii?Q?/I+TnLVhEJYyTaY6tF+blug8U94GedvI8sTlBKs5GlTLSkpw30qeD/x6+ZdX?=
 =?us-ascii?Q?+yvlDhy+OPRCfJAOaPmj2jM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007)(7142099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NnUvsEN49rtav8GwTBnkUDq4emF7iiLwIrcH5e1fdZfupic29/NFg0eQ1IRI?=
 =?us-ascii?Q?2RChvqJtEz6hOmSGteWKULRodwLwWT3mJnfKZUz3G8U0nrc8dOdRXpa8z7aJ?=
 =?us-ascii?Q?bdLkviax2ONFUlm8hn8vcSD8xiJTh85R2guYHITJlED6Va3+juxJi6cn3jN3?=
 =?us-ascii?Q?HQQt5E8xels22pNHGBC7lBIBhyOxMg4pulPuNTmlvhtcSp+xv55b1YmIK5Mu?=
 =?us-ascii?Q?MTFH1tFx7NiV1d/0La9ylKfiU4NVd3WTDkBpih2R5BJESlYOj+9gcPF7Ba+S?=
 =?us-ascii?Q?qsM4j1+J7sIMS2eAOxLR0IVcTgJwLZZp19AK4nt5Fr+7P/5Kka5TkOm6b6yW?=
 =?us-ascii?Q?ZDfZpvw6AJr0OBX118vrE5bhyKuKuF2ThRKoh3M1hmRmTEbNn7S6yxa95AIc?=
 =?us-ascii?Q?xFb5Xkzj/ayW8M7qU3KReyoloSB0+nkNjF2RE8+gVqP5vHgCpe9J+jFJ6HwN?=
 =?us-ascii?Q?Mjpd0TocM+AbJvc173R8bvg4Z5sBpd4nKdUdYKitpvOnfNFQ6sYxVat3MX4A?=
 =?us-ascii?Q?A0TUNZyaSr91FVIAOTU9ZIu+QF8ReRxOXO+1C5ox4mLVUrenK9fI1WlXHYDs?=
 =?us-ascii?Q?ffxqsIJvVn2XZ5JHqN4XJVz9htCsoxJjNnAo/gkC8WilDywaQjlLEfBAm9kx?=
 =?us-ascii?Q?n4ehKM9R1jphBzf1E+sLl4dmEq+D6T6xs6odP6a5GeIJlSXov2xOcMPNpLH7?=
 =?us-ascii?Q?0J99Ram8Y2k8yHglX0MFSY9gKrieKNJMCWVIdl1ZeBcjpgckOAlMBlseLCdB?=
 =?us-ascii?Q?9b57/M5tgtEBTYBweSMI1/WWHenChn8JEY+Z/3HQfazuhVcxbbUf/HhdAKbd?=
 =?us-ascii?Q?sHGkRv1QywMBnC/vZXg5TIRtJLaN5cMyBnQehJhPMlgci7Pfrggoj5P6O53H?=
 =?us-ascii?Q?PCgy1ZB3ZfeSjV3UxXVRAyW26kKyBrtpmmpdHndMcQaP1ulehBmwySUiziLN?=
 =?us-ascii?Q?6DknayJgZcNBIP0Vn88h38gDMyFPzHiGj6mfri96OqPxKi9MRMbiwOb8o2nI?=
 =?us-ascii?Q?5fU7G2Iemo0RHPY44VndkzQK9FuWgmn8P68d+7e8eRA6OrAppwJ3cYBs5paZ?=
 =?us-ascii?Q?0g25WM8LFrnX7QKWIqNNd3wdcmLM1SHEoRXJYL2QtOq+mnhMcuOFiG8juNkk?=
 =?us-ascii?Q?GpwBn+ICtqxyFMfczkXgYP1dvF83G+Ir21LnFYJqMbVt6gmJXeoY3wwBfuO4?=
 =?us-ascii?Q?/oFGEN5mdEUKDT3GYbDjPMa2Eu4RCZ/sGNXM0X3i+K297N+V8evINRJPuiHU?=
 =?us-ascii?Q?JJxuNPaIovhXRZQ8ETdKnIRs7juPnwKiGb3WTjiq7+inDTcDQ6xNrejtPpg9?=
 =?us-ascii?Q?VYlPQgFK5bgiKuQjHxDpQ30TLT4Mlrhu4/HV8xAFdB4vSGGMCMFFoq/FTCM8?=
 =?us-ascii?Q?7LiMdCWpXNwOwXrz4KbGgDKEVVdyy4awe1envXE89SgwTsShtDJQyTsQPVHL?=
 =?us-ascii?Q?dVsFLoWp1UL/sV1uSMGRIVJUUqpIQev25JPLMGIyGEx+E5kdtY4TZEQzyb8j?=
 =?us-ascii?Q?Y/YwBe5ItpP1J0MP/+44cegVu771Mxiw+zvD3hZOZvzWHX0z2EIxxBElA8jq?=
 =?us-ascii?Q?uq5EV13r7c/1PL0+B85l3vgFM/4rRXa+6jccySNnJBjLsEvId/b5SbIVYEbD?=
 =?us-ascii?Q?s6+ngONZvQAnhDbWmvBUCqCABsCU7rNOLRRFxVNajhW6KtXMasVhpN1MI6I9?=
 =?us-ascii?Q?NYh/eqnQCe6M5Zz08iTxZcYzG8eoaSjGoAbuQbVLW7eyWXgcH/e26BiYR3rs?=
 =?us-ascii?Q?Q8vvjT111A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fb205d-750a-4787-3967-08de73053144
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 17:58:47.1187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Gh+QOAF1h+popD14mIo6Z2FbHufkBii1Z6E1KOfM/jAgIXJ+kv/MBduXu7hwGG2iCHfSIiUzCy4ZdVSaDNczw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5828
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231687


> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Tuesday, February 17, 2026 22:06
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][kirkstone][PATCH] libpng: patch CVE-2026-25646
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Backport patch mentioned in NVD CVE report.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../libpng/files/CVE-2026-25646.patch         | 61 +++++++++++++++++++
>  .../libpng/libpng_1.6.39.bb                   |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-25646.p=
atch
>=20
> diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
> b/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
> new file mode 100644
> index 0000000000..e97c5078b0
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
> @@ -0,0 +1,61 @@
> +From 01d03b8453eb30ade759cd45c707e5a1c7277d88 Mon Sep 17 00:00:00
> 2001
> +From: Cosmin Truta <ctruta@gmail.com>
> +Date: Fri, 6 Feb 2026 19:11:54 +0200
> +Subject: [PATCH] Fix a heap buffer overflow in `png_set_quantize`
> +
> +The color distance hash table stored the current palette indices, but
> +the color-pruning loop assumed the original indices. When colors were
> +eliminated and indices changed, the stored indices became stale. This
> +caused the loop bound `max_d` to grow past the 769-element hash array.
> +
> +The fix consists in storing the original indices via `palette_to_index`
> +to match the pruning loop's expectations.
> +
> +Reported-by: Joshua Inscoe <pwnalone@users.noreply.github.com>
> +Co-authored-by: Joshua Inscoe <pwnalone@users.noreply.github.com>
> +Signed-off-by: Cosmin Truta <ctruta@gmail.com>
> +
> +CVE: CVE-2026-25646
> +Upstream-Status: Backport
> [https://github.com/pnggroup/libpng/commit/01d03b8453eb30ade759cd45c707e5=
a
> 1c7277d88]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + AUTHORS    | 1 +
> + pngrtran.c | 6 +++---
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/AUTHORS b/AUTHORS
> +index b9c0fffcf..4094f4a57 100644
> +--- a/AUTHORS
> ++++ b/AUTHORS
> +@@ -14,6 +14,7 @@ Authors, for copyright and licensing purposes.
> +  * Guy Eric Schalnat
> +  * James Yu
> +  * John Bowler
> ++ * Joshua Inscoe
> +  * Kevin Bracey
> +  * Magnus Holmgren
> +  * Mandar Sahastrabuddhe
> +diff --git a/pngrtran.c b/pngrtran.c
> +index fe8f9d32c..1fce9af12 100644
> +--- a/pngrtran.c
> ++++ b/pngrtran.c
> +@@ -1,7 +1,7 @@
> +
> + /* pngrtran.c - transforms the data in a row for PNG readers
> +  *
> +- * Copyright (c) 2018-2019 Cosmin Truta
> ++ * Copyright (c) 2018-2026 Cosmin Truta
> +  * Copyright (c) 1998-2002,2004,2006-2018 Glenn Randers-Pehrson
> +  * Copyright (c) 1996-1997 Andreas Dilger
> +  * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
> +@@ -647,8 +647,8 @@ png_set_quantize(png_structrp png_ptr, png_colorp
> palette,
> +                          break;
> +
> +                      t->next =3D hash[d];
> +-                     t->left =3D (png_byte)i;
> +-                     t->right =3D (png_byte)j;
> ++                     t->left =3D png_ptr->palette_to_index[i];
> ++                     t->right =3D png_ptr->palette_to_index[j];
> +                      hash[d] =3D t;
> +                   }
> +                }
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recip=
es-
> multimedia/libpng/libpng_1.6.39.bb
> index c4347a6715..448594e0d7 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D "\
>             file://CVE-2025-66293-02.patch \
>             file://CVE-2026-22695.patch \
>             file://CVE-2026-22801.patch \

Looking at the stable/kirkstone-nut branch, this patch was applied without =
the two above.
So there needed to be conflict resolution, which is usually a no-go for acc=
epting patches.
I'm wondering if I should resend those 2 on top of the third (and revert pa=
tch order) or if all 3 patches can be re-applied in correct order.

Peter

> +           file://CVE-2026-25646.patch \
>  "
>=20
>  SRC_URI[sha256sum] =3D
> "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"

