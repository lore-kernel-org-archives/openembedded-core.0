Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483A0C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 11:14:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.83])
 by mx.groups.io with SMTP id smtpd.web10.18189.1708946087821986181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 03:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=VlKQMQ7v;
 spf=pass (domain: siemens.com, ip: 40.107.22.83, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9EpGARqtdfM4FupaGKtxGvCVV5SCicTDzFCihN7SlQn4J5+GBu9aeAA0QpcILCypl8wwdBmWJyTUnakms4K8fi6AXjDViz2DzGxhCy0HDi/OypCktcRGUTIs8PGalAVSZlgZaEOYYR1uhwsgCpsWLz5pTdj8h2JFVyZCLcVcc9DjS4Nk6B7/S0/G1RyZUF8S40Z5+WWTz1MdzUbfdwopNM4wysCFxC8tOnLlq8svO7vbCJRirqciQ3QgEoIHE5xhyzwz0iXKfa5lVfMxksKEN3uWF1cCqVITaO+OXyVq8jkku7aJkZ7Hpdb4XhXdF8VsEvNGa4Tv1HQvmTo0xJu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZbeieCNRWpVA8M9xedsyaNMPpWSWM29Kwv7vl8/wpU=;
 b=cD7V1Bpr65EZsADu1oov/mErWCwymxgXUpXGZJYZjBu0UnuNdArYbcBv6UH9HOmXMqHviSNhgjy4Xufj5D0FIZf+80T+hcBNnXHLu2nypc7h0ILfws5WMHJJaIy8tt/1dhVUlN//BI2AN0LNW0k9OtAmtBy5Rq4cuMd5a7dFSXrk9stbDgYdKofBeQbqgBdPszon+FeYky+IsF/Ae1i/kLRTTgwKK1fpGCQ9XgFBC01vG+4arjyWq1lm3qdVSFXGyOgVPBx9Tqx2f10P6LLklczDy3zhvP/KRoG/236PjoOcbyAa8FT3Ie3WmMf9znMK6ZsI8YgrzvVn3FSXLNGDdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZbeieCNRWpVA8M9xedsyaNMPpWSWM29Kwv7vl8/wpU=;
 b=VlKQMQ7vyjncHLTdIgcs+f1Ep6nG71Mf3zP6o3zdH5Utntphn0rHx6gYFfqdbn/qCYUS87HMX1GQUtA2gYOymStDHZ1p5Fkbm80IGVoB5cL7HuO+JUyYZKA8eqhTLzHOTqRufnSgbhGK62cGtu+SAz+SLt9Rw4ByUX4KsRzmB9oEBRTR+znC7ly19VIzONUdwcCQ92TBtV2xkaNEzWnDjtr6A2DvZoiGhvmCE+XIDMTiZzyeRRug36KscXIQ+Wpe8WPaygMSId1vRz6KplUhTaPklzD5NEzGi5yNdUpVKPxc7Ta3Kit2TOzwNfJfc2ie2YByPlHzZjRmX3uvyW2/1A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAXPR10MB5382.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:286::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 11:14:44 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e%7]) with mapi id 15.20.7316.018; Mon, 26 Feb 2024
 11:14:44 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [yocto-security] OE-core CVE metrics for kirkstone on Sun 25 Feb
 2024 03:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for kirkstone on Sun 25 Feb
 2024 03:00:01 AM HST
Thread-Index: AQHaZ+0aAAkohSWop0yF1snlXBHnkLEceYZA
Date: Mon, 26 Feb 2024 11:14:44 +0000
Message-ID: 
 <AS1PR10MB5697AA89526441063871AEF2FD5A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240225131813.166C71068A9@builder.sakoman.com>
In-Reply-To: <20240225131813.166C71068A9@builder.sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b4c52981-9376-4c42-8d5e-66bb56be0d09;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-02-26T11:12:30Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAXPR10MB5382:EE_
x-ms-office365-filtering-correlation-id: e9bf659e-ff47-4f23-1ca2-08dc36bc22c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bg5AQ2Ycn98ZbfrZ4G2sAEZoaElOYUItS2GdKzlc5/R9tbLVIVFCV4vgQ2lO1HqjlN4sTQN4d4t78BqkXRcNQv+Yt0fbdGW2wODplEBOEfUymGY5X3eq7vCc2Ijr8XeDCrTFvIj4zJV4iKqle8thHD0yi4udjJLy6GH+x+XaSLW85opx8mE/yyXdsrpjfDtUwuQ1alewYc8yrTYar1/OhIxCSih3SNycD2NoJIXVDc+JCVnEOionTMMAkjpegkELMN+kWpXHzEMtx+KGyqj+KlxpDwzk11n0DtDp1Im38J0gQ9TDRdh+OjZnQf3IicqLDPv+BfscnR9qNJkQ2wJgo/0q6awYDLwV05PgPovr+x72kmj74+ZiAjmIWon7hsIggx3Ez7mRfSlYw2cRZOh6jf4VlND2lgNQ6TDqViQlYLmmnBppeovfe7JY90Sum74dxr8e6rzYho2QnqjuKL6GoNhUblPm93dwuf+bdJpD9hWmm6tmDv8dhFD5x2jhg9ekUrSXKxL6ZGzkKQy5FjLPdbBKmjax9BSktcvPRGGABlF+IYSO4CPbTwN2pI0xm7m7T1EACumc5WrB8nGbzAAuwzUJB7MmgC1rOYvn7mvY8sVm9YQxpPsHelDJ78p53rpXno+TSLlvY9MdE2AOSjB1KpVMTsb4muuGvPBS0W76ETmEHZAD/NRjGt9eDvZoQcdxofWLkffvBiXx5iW6/Gq4yQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8vL0jZ0s9nfJRcK4u+HNqF+LBH58DVl/Ye9oRlCyqML/BfxHk27B7F1Bmuxv?=
 =?us-ascii?Q?i+bfdVUZ1xwZM3NfgM1B+IR5tf9d0+QqWhNdXOu9YoDmYNF0RyTdUETU9ffG?=
 =?us-ascii?Q?YAD1NhFx0J/uvp7gqwCKtiE1c1vlC6kRd7NogXOarEvYhFNbV3eyLXw+vJ8p?=
 =?us-ascii?Q?4qlmZ9VgRdXFPgP//Zntt3cgMRr0Ho9N/PQYNuw+FmWQJUV1Xwgfys0B3D0o?=
 =?us-ascii?Q?v7fvajyY9heGQ0FtBP4ezs2qNBzZPs3LCUVm4md34wJkXnzpQ1DRB3cranR6?=
 =?us-ascii?Q?QKAK5ELggREsHaju2qIMJMu7pDf7dA0fuu1Q+grCjAITXM/zx3GaVKwOnUOf?=
 =?us-ascii?Q?jxJm1YJDMLoal7DbeLG2pdHPSgEJ3W31Y8zuSBFAM/4Toz0qk4sMbmOZJpKT?=
 =?us-ascii?Q?5t7dNY2c7EcIcEWi5DIXJAYiAnyeEUDUMPJyMrFebrBTczGKP4XLRotnjGKt?=
 =?us-ascii?Q?8rE0AxMkJpu6IP8jAk9OzhohvftWTYkajtRtrYqke2gNpqjPPYWbgUlE/cTd?=
 =?us-ascii?Q?Mt1eqceFGpoIkw71rcbfZFcQ3Wl7eD1SsmWz8WBxmFSRTAl8sQE3xd+Mkpr9?=
 =?us-ascii?Q?2pFlXGrB46k1DGC2dZ5QAotrb90J/eQxE8nfQBLiAOf0p0wXNZfFcC5Qc+zr?=
 =?us-ascii?Q?idAZpjFK2PHCBEOG1+MwN7x4QK+9vsqCo8UG+TCe4ClV4mF+ydhSwNDGqKdX?=
 =?us-ascii?Q?qJD4Vxl0siWG234ttLMK+F6oSRBZcm3GLr7IKgUWeJsijyormHG8oWTZMsZ2?=
 =?us-ascii?Q?vqW1gY4BxK3JxvTNjEB3AYBQwV4xDLoO1DU9sWzHEnhvwh28lF26325NV9hS?=
 =?us-ascii?Q?UFq7JNu8Qqh6PVh9ETp/23u/heIl5gARsvfoXizrlo4f8Ymk+y+qFk//F9HT?=
 =?us-ascii?Q?05ZrGh5o3sGpJdkgddVoWePf5dnmoBxZoSlWxaBR2bzw+bTl0QHQaamI0y2A?=
 =?us-ascii?Q?jAcpT6OriqM3MALvEHv5zQbGWUu2VjWeHe3AExgwtc6BpqjU/P/i19B4De6w?=
 =?us-ascii?Q?5LK7gvwJcF/4SZXXZGCP3Z80S1HiJENFmyKvDfcCagmpjwqlMHhz+kxgCGw9?=
 =?us-ascii?Q?vsmxMCKuSBIpZ5DeacKpyLxmAW7rhHlKU3lwLMu3fdXdFkHBYZPFI+nVxpCp?=
 =?us-ascii?Q?3G5L8PC7t8YvO9cPJLKbhK8B1u3rTr/3V7Xpm+Gt+1oHxXsffa7CEPQ28oMq?=
 =?us-ascii?Q?5MbyyyhtXVfVFVAUaOD1et1Bz0qjKs94tfz+DoGL60ILih1AFFRFkjkTsYyD?=
 =?us-ascii?Q?fIF69PJiMZsrxJ2OkEtXabBAxJXC5b0rzkPAmGcy/KR6gQBEt8peprr/xwrS?=
 =?us-ascii?Q?YGKvTgnGHIdTXFt6EMI/Y7wGp6unH7w4CEYTuZOgalJLaxHNN9iqQIWJfgqd?=
 =?us-ascii?Q?cfLie/qZ2E7urXIQz9qCdtk90QhxT7r465MnZ9fo/rX+UWJaT//lhY6YGNvS?=
 =?us-ascii?Q?LivFqoHwlDzLy4xTDCgVb01LjMLhjJlQ4mtrn5zn38pNCvSh9r01KX75aBxq?=
 =?us-ascii?Q?XH4Y9LDf5IwjXauWlmG/V/qlULi/p00RCtbPplCZE4/Ly6D3QHyKL40YHVIL?=
 =?us-ascii?Q?TMT5z/rHG+oHGFZpoUPq/X6kveAxOihdKo2iFWNx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bf659e-ff47-4f23-1ca2-08dc36bc22c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 11:14:44.4544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLqlIX+Gzhl1nSIgiUh8l9qOhW+aFGcEdIbHtn4LIpLnX5RuyO/DnJNPVNy6AuBzhkA3BQYg3hO2WeFm+vwfdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5382
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 11:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196199

Hello,

It looks like
graph in https://autobuilder.yocto.io/pub/non-release/patchmetrics/
and list in https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-s=
tatus-kirkstone.txt
are no longer updated properly and show old status compared to this email.

Peter

