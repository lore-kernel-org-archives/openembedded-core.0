Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1056C02184
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:45:47 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.56])
 by mx.groups.io with SMTP id smtpd.web10.22048.1736786744538078878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 08:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mO95f+4k;
 spf=pass (domain: arm.com, ip: 40.107.247.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNu+BqDtUifeviQBaP2rDfw0x4eLJCzaCfce3GFC/89Q+c7A5mRO1U2X8+iRBC43PFGMCWlz1GA4B/dGUR1xyjoIqJt8PWoC8QRJzozFl7w7C9WGMtY9NZ8bodnFiEFTjdLg/QFAiz0NvpNjl+7ILLrGXJ9YoIpOl2m3ZQIyG7FT1OHKAlg2bfc8YhyX2ytHkpQ9Woobmka65x34vVPIkpZeizX7ZmxYyw6sj7t0sXBz4KzmKeUDzP6c8W9iLGIDf9RtJTqJz7o0jcA2pHMaIr5Rs3kB4SG5UJsmQ6mwG0hgp3qJ4/G9wSew4YUmlHZxoTT+Xsfdl3G4nnl5RZgm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkytS6ZkzhaKW1cDYUuOwYxJRd7N6qsdChTDMnP9DKg=;
 b=O8jL+Km04YHnW3ypvijm0/Wnu2nqex87b5uJlLq0rThGD/r5zzA49EDgo6nFaa+03M4gwUIJoRTaW9iISQfA0zv4TTK0HHniDWuzm+j/aIZRznO3g2X3ZSGglWHip7Nu5XRQSepoYx2GdShUCk5EunY81ND76pyLywRCwEk7eIMcpdMe0uT/46VxLKNdbguAOXga57gmJYC6sX0z5e1yv4FwyJII15zy3Z3rk5ABLVOxtq92oW7UYaDkGHmorpPOwuNkd4ZDqk3nzNQiy0xgf3S0G+0R5Gx/MvmW6ErzpDM2j2u5F9Kc+kogB5nfww+f/XpQSd5kuucpMpZiR5V4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkytS6ZkzhaKW1cDYUuOwYxJRd7N6qsdChTDMnP9DKg=;
 b=mO95f+4kkUNgW2eIVqi2lteHHuBPo9M7aFBVdMJX25kcuOB5skT9BPcvCxqfqSBhUgYKpaTawK1FmX8h6ihbdSjYtoICRtI2DrOofoCqbthJGaC+K58Qvw6+OZzLRD1AKlwPguvHmdy2tdjUbkqrQRlgpmpRa+DgIiigeUObeOc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by FRZPR08MB11192.eurprd08.prod.outlook.com (2603:10a6:d10:13c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:45:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:45:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hiagofranco@gmail.com" <hiagofranco@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Hiago De Franco
	<hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH] libxkbcommon: remove locale dependecy
Thread-Topic: [OE-core] [PATCH] libxkbcommon: remove locale dependecy
Thread-Index: AQHbTN2sQ+3wL/mIw0G2hERuYrRaf7MVG14A
Date: Mon, 13 Jan 2025 16:45:38 +0000
Message-ID: <A468A018-CE0F-4C18-8189-4190498A8051@arm.com>
References: <20241212213429.250224-1-hiagofranco@gmail.com>
In-Reply-To: <20241212213429.250224-1-hiagofranco@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|FRZPR08MB11192:EE_
x-ms-office365-filtering-correlation-id: 95dd67e4-d52a-459b-6edf-08dd33f1b5b0
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?qcfuue7oJntcV4Pwdc57Q8M/VMoD5S7YKzvb0/897XMPm4Gv2aCFyv31nKgy?=
 =?us-ascii?Q?xxyyvb7aOH7XyWKWxzaprZEvqiRXfIos//e8/u853KjNWTm9EjzGVx0KkaqS?=
 =?us-ascii?Q?tSjng2SwTPfjgidQZC8a2Z6XH+5nx1rGPF4XCN08q62a9fEaHsyXO8NwXbkc?=
 =?us-ascii?Q?H6avBdQ1vimiLroBPyqDm+OBa+5zBoZkBSq13ImcLjbXlTE5VL2GSWLsuTG5?=
 =?us-ascii?Q?Rcrp3CSF7lp0C9Sxyrv3sLNVwVNlgRDhZnLSFIN8V+k32aBaj/w0qqrSh7yA?=
 =?us-ascii?Q?NGVjg7fHPH8049ojdAOiV41gEcICdfknTQEjI5iI1353kLr5MMPvC8Ys/hmh?=
 =?us-ascii?Q?ciC4fKW11eOoMXtCkTK+sVuP8aB7Hx9v2XE+6IklstTObtkzz5OurMq02c0Y?=
 =?us-ascii?Q?fIF1bsSNg8akkU8JQwvzRSA4/u/I0LXdqvKDvKAF201fgysr54wJGhoF2EQq?=
 =?us-ascii?Q?woMM4WXH9iHbInJIR2JDqGr8x4/+JXGYSdFLPyc9ZrjK9stNetIYrVHgK0y3?=
 =?us-ascii?Q?LfznUw+jqSpMC7j86sFaioHnzLkslGE0HOXWJipEn1kjrzlw5t7UwcHsGpSO?=
 =?us-ascii?Q?lkeJw1UKAVh9PQSvKHECgCpXiUFsc8SXJh/SpFWXtwKF+HtLAQU3yGaX+GZs?=
 =?us-ascii?Q?JGnvIEN/aN6sM7GlwsmzRdVygZME4cPM4qeMNXWG6WwPeFYIMxND2wpQd+yS?=
 =?us-ascii?Q?OM1n+BiUfsZknkn1iCuNnKDqprFkrg00KqqAMwgyqT66JJHo9DTq49uShqYx?=
 =?us-ascii?Q?JWWCZA1rphbW9nUPPgCRKxrPM/GSfa9+9i0tr6NQl1GaNZzXXF3jGxytGX+q?=
 =?us-ascii?Q?j0l27ttbliabkdUD9gMB3Q1EvBiFFdHFgBTF/pz1gd29yJB0T0gcHBle/eLF?=
 =?us-ascii?Q?MnYuehYAPUo/f36sz3CVilMUe5Grqhqmb6hYeifDyEfldJ6uPH2IXNdiMuQ3?=
 =?us-ascii?Q?bGV3cCogG4UUCPYvpFgCRgeGypmPlCygdthSorjHtxLCslt9CisNJsRWraDx?=
 =?us-ascii?Q?TyQQJ7bvwL35MvkiJDyi0wDxevwWJEhjcPsGEsWvqP0eH0dUX1988HEw+/l/?=
 =?us-ascii?Q?7BnKLwn1BZGCwijIhJYCdoEW6evFv8/RhLc0aeMc97ybkbXJVY0ikxy9RLqq?=
 =?us-ascii?Q?DaQJ76h0KhjYesPdOhoyHM8ih0endClBIvw8nq/iN0TQfRpODZtYbR5eD2Vm?=
 =?us-ascii?Q?Me3W9Rznnc0K2kTmGNVrgKckyIBuW+1pknoH6Tns1GMyLR6FOsaeCm/nuKh9?=
 =?us-ascii?Q?e4f0xEJTjlavqg0kbv3TduktudXFeNND4f/f4yho/nHbUGkDQ/n3bhGe5Czd?=
 =?us-ascii?Q?secWtaj0ufX9Ew0VXnnhmf/QBrn8nIXElo6RqEihV61K+lvYQsXEedU/vpPt?=
 =?us-ascii?Q?pyyb3o+y+hvjA7GZ15K5nq89b0TNQZ+fsqenenqL/BvkR2TlSzXGrkpzDviI?=
 =?us-ascii?Q?OpOFo2a4LJkP5XIiKDu7P/SFM0Ei8p3f?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ggLsPzQ/VuewQ79/VjOHJlL7g7pPmIz3rgbF+sKZQ7wYaY+TpUp5iSdtKTDp?=
 =?us-ascii?Q?TXbm8LeE0JfuzXMKZwbKQ4PmCrRCoHYZORqxTKR5tOEbuDsaq1CXOcCYzhgw?=
 =?us-ascii?Q?nEjX8qKGruV/qXMSgo5K2x9SM61G72Q54llorkLSQSj8C0hTMLaLcAsDq4Dv?=
 =?us-ascii?Q?VRtQjRIO9cWmur1AZXgapbujuzpw0fUI+O7tXwz7pGeC+PIR7KJlX6MBiNEb?=
 =?us-ascii?Q?KXANR+6wa4wPUVryh+LUJZTdS5jdS1pXPwMl+zhHhlUe8AK76jDeFybwMmz5?=
 =?us-ascii?Q?h4486yA0cVnwU8XeyCDifkv1NYeu46/iCrRCGykGJn36r2iNrYhW0sw541DJ?=
 =?us-ascii?Q?alkDHIqGQ01EEotK+EwCOKS5cOptfeXtGjJUBm/XjvsPCGTg+gRI0UDIEGb8?=
 =?us-ascii?Q?bj3yr8hp6Pl7f1H3LoFoPUpWeAZCIABzwsjdGaQDg+Hay+AEHZdF4Qojs+Ce?=
 =?us-ascii?Q?H8oVJmZ3J6iaTeDocKM6XWa8O3S/x7wiogPXEzt93wtFF/hcb8lNCFozFH+q?=
 =?us-ascii?Q?XISnpi2ln7uqSuzJcJ9yisMaXBtza9R1ykVrILagMCd5QI8OijCfGkSgiWCS?=
 =?us-ascii?Q?rgKtIz5VQIWGSFOZkqSDZ1hxNix1E2Hwa+fBVAzBOQdsuQ6tKBD/FKVS2poO?=
 =?us-ascii?Q?f3ihBIoHIOvg+3n/vSYN+RvMu5vodBt0N3q8KRua90f7jHmgj/m7qUeBD/P4?=
 =?us-ascii?Q?FHzsXhWmT987XGuHI5uTNOVvkpIFQc4Ij7VYkNxWXH2j9m1vZopRxR08dEl2?=
 =?us-ascii?Q?WRzHg8ilVg8RqvkFUTe+SMz5diZAwGzMZxrwngT3xqWdUmamfWCYOAjzYJOk?=
 =?us-ascii?Q?wokdQzaI/QkCSq5bVaEo7cwH25spCH/NIziAYk7IAZd5mFZJKT+HnAlGPRXi?=
 =?us-ascii?Q?ik7utOZjftsykCGOeub7UtU1wZlj/7hTJJ32CL2WcG6mIbGH2RBezA8qafEC?=
 =?us-ascii?Q?1XDf5TWYZAXSkvkB3bAzxSbnaf2M6L9PrvJydJoLUSEvFApoDKxSpI9dc16a?=
 =?us-ascii?Q?sGgpaIA07qRnd/0dlP/MMV3JaJmeJ2tuZf/b2+3NP9f/JxcVdEAn/333h6kL?=
 =?us-ascii?Q?JuWqtGj7PsLgMywxOEwiW1S8EixSTJtUD8YkDLy5xI6j4FBlFY5wUj8Y6J3R?=
 =?us-ascii?Q?oVYGPLbWrSHaeiUR2hQ9cSZlIFiWcX7+A9r3ajdpJGulYqm+VqYbwscFyBOy?=
 =?us-ascii?Q?KnAYpLtAi+RRLM1ogQfPgy8VfYWLZtezpRo+NizYo4DFw7Np6bMZXqLmKG97?=
 =?us-ascii?Q?9hh0HWhSJuiYaVYrdQtcIvAS+nhk8U1hLg2uemrOQu4h3EK0ZdZw29ohLVHN?=
 =?us-ascii?Q?Ga5ognCboAcNd6bNpzNr7JKPpxfjEz2mXXNhwwtN6r+SbKJ7VScmsJzvl3h5?=
 =?us-ascii?Q?7BoaaOv/M+RbACImeetb4QK1V9iUJEuoeL0wQIMO2XTRpxkaFiwQ1kMZ8bD7?=
 =?us-ascii?Q?LPU05xaU/4qqVvlKnGZjoKj2r54UkgX2VHmb582/TXwdhPQbgW6Iujnea6Zx?=
 =?us-ascii?Q?LitsaaTgu6Omn0kXwazBkrhVaD6fSwZ49JDfrQAZ6gbhz3AyudzYsreB2BD6?=
 =?us-ascii?Q?3mErEvk+ZUTI3lsxTT1I8hq8ZlHzKh27MHxCsBaN?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46934240BB81B44FA53CE8660A593D48@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dd67e4-d52a-459b-6edf-08dd33f1b5b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 16:45:38.4358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmSdDaB8P2kuNOsyanei0Nn4JSCebqYRb6yHEtgyCrH/bkTiOxwPUdHCeNXo6DSkazk8yl71h9CexuNXLidNlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 16:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209737

On 12 Dec 2024, at 21:34, Hiago De Franco via lists.openembedded.org <hiago=
franco=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> From: Hiago De Franco <hiago.franco@toradex.com>
>=20
> The error described does not occur in all cases where libxkbcommon is
> used. As example, a Qt application that depends on libxkbcommon might
> not require any locales to be installed.

This breaks the use of the Compose key, as this needs the data in the local=
e files.  I suggest making this a recommends instead, which you can then no=
t install.

Ross=

