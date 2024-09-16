Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDD9C3ABCB
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 19:39:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web10.4207.1726515539234724812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 12:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=HCxEJpub;
 spf=pass (domain: de.bosch.com, ip: 40.107.20.78, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRCO7LnqVchpGQlFVFJ3wKVKESey+QCoWIamiZbi3XbOPUyxb7O0kB5KQibDxnzZZlpXBFVQS+iJOqj4pCe6H/so1nuhHMwg3GC9G4z9YLA1CJWQwnvMsHvSAowIGlDnGoc4rK9hpELyONkGvEbq8R73Li+3EJzVM58q9resMa/aVo60I/FDokDfxnJif1kiSNEieM0cBqAqasi48crLB69pVrJCk9SjoSz2RIsRJJNTFOxBRYshcd0SGw5262qGcct8mwHlH9SLBwwj4HgLKjr7s2RQC6tgqDY9uHv7L8O3b67w9SqaSfgTGaQ/XPIoAn1zvGLDjgmi9EnsMdOQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjY+/j/2fXm2wqU7wS2alR1X9RhUqwo+9unwGxLTM20=;
 b=U4XyVE9aXyU8MVVth5EgP7PzfKLro+liyc/6cJg9G3SfYG/4W3WfKI8Duul89FbBba9y9XZTA3AfWCYIUZnFDE0cGOiJErkYyt/5sFvR+coQGokxT6F71u6TldDfPwykPrHgWzxzbH4a5C+YyvTyiuwyskSMFb8OrRndM929eHDM/URBi05ffXO8ox8Kbzb2Ug0TFGkgl8miyQu6E9bMnoMDfOhNGclkpWJwnyIXWTxY1KNSWOnW7KKgXFoStkhDhQIQwbIX+vTglFbCojkkvYjy/TF221DofLZ6fKz3sMuspqkhiVdCHKcWyS2O9H8ft4DgVMDEkcYUeNpqxnRBBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjY+/j/2fXm2wqU7wS2alR1X9RhUqwo+9unwGxLTM20=;
 b=HCxEJpubvGjHIfxfGepEFERXejFqgi+qnP8cQ5eNfczO0+zOjhgnJoLTFynEp4HEU2zVQZjNIha0luh619YT4+BPVJWDeYAHTounfIf5BK7W3XQXej87xVDXsgKSd6n3GlsfYe5j4L+QjV8+IQ35X90PTQKu0sFM0DQwx+vLnEMdBlWwY7MDCtpNXQ7HqCx4bIqlcTUyXApk0nFFPmtiechNA8P40NVmfPm30fYNyguIaZs4Jmv1KA8Q/w3YLTYCi9WD8JViRSH+KBqI9BlYolLOg99cAq5e6O7y3q8yaxRrz6iG/0I5nP/AhTh/q5uydhkww9T5Vm5jZDO4L1+New==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by DB9PR10MB5403.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:334::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 19:38:55 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036%4]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 19:38:55 +0000
From: "Jonas Mark (BT-FS/ENG1-Mue)" <Mark.Jonas@de.bosch.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>
CC: "pidge@baylibre.com" <pidge@baylibre.com>, "alex@linutronix.de"
	<alex@linutronix.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Simoes Ricardo
 (BT-FS/ENG1.1-Ovr)" <Ricardo.Simoes@pt.bosch.com>
Subject: Backport fix for inter-recipe useradd dependencies bug #13419
Thread-Topic: Backport fix for inter-recipe useradd dependencies bug #13419
Thread-Index: AdsIZuK9Lhmr0SrRQhe6uZfdz+y7Zw==
Date: Mon, 16 Sep 2024 19:38:55 +0000
Message-ID: 
 <DU0PR10MB7076812C64238EC056EFCE1AAD602@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|DB9PR10MB5403:EE_
x-ms-office365-filtering-correlation-id: 3bf88e5b-a048-4c49-a7d8-08dcd68733e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?hmifYyAwo20vFWePFmwh4XYQQm1JAvbKH5Etc02+5Z2bfzyyEcR7HedfTQ?=
 =?iso-8859-1?Q?YpswEYsA8c83tL2LrW0bD17teZVnE9ZwntW22c6m0gdkF9imaRN9gsBBhc?=
 =?iso-8859-1?Q?9pvpfEavpgFTxQXgsMOcXu36okVHfCylB13jW2l154RxQpNYiP63pm191R?=
 =?iso-8859-1?Q?1wli5DxTa3h76481IepTCg8LGaNitjsMw9Zuz5QfObk0Hjs8Ky5Nu+6y4M?=
 =?iso-8859-1?Q?MgJ8EnKn6gdLYQUSoP/9MWOlCdxxgGAQqTnBSYInonLeJI/UTTP7y93hjc?=
 =?iso-8859-1?Q?dNzLFD5MUIlHwlcramSlGqsFABxRT37XCNedKP+x+Lu+eM/UxJnrThURqu?=
 =?iso-8859-1?Q?jRCjDjE9VurT0tYBcQvT5AQGrw0BaYE4sD7D4kDPrstb0u1vTk8MZbLxZr?=
 =?iso-8859-1?Q?99tfgIMyFw5xIcVZVvUZyRNjenS1rjRpT53AkVCx+MNj2BHikhlKNi1jSL?=
 =?iso-8859-1?Q?GBAO633nFaeiNcU8Nmnk1ERyMNyY1jb3INcHOqfNTJ+Z3zjZexA5EgLwdZ?=
 =?iso-8859-1?Q?6jfGR/MEt/6NJqDjoAk2UbqYNmV7fvYM2nf2lQvQ6hiNCIRi+sXYCNTZHZ?=
 =?iso-8859-1?Q?IuObg3kUuYvdQ5dnfcpYbDtL6gjLG2PX5ag6A33pysU821ihte6HSNHFm7?=
 =?iso-8859-1?Q?c8QkUW1a8LFStS9yzFQBqEe2F+LmbqdWZSrYNelDcvSDN61XakwOJnGd9p?=
 =?iso-8859-1?Q?9Wgb5Oyi8jAv+cOzE92akkQhVmr6AQYUTbxvvNe9VTkAJ4Zvel7KvPz9ny?=
 =?iso-8859-1?Q?FuOaY35/o0yShOaM2FSHKIcQDylepiYUK6EG2ca3CfN7vuZwtKH3ozHo3i?=
 =?iso-8859-1?Q?4mR8KWEUBDm2ecrVMutaoOqAKumYfM7sP/WYzlBYad/2NVcz6e/AIku6tT?=
 =?iso-8859-1?Q?GZINm9lRcOvhWzdfR/UxNbKpqSB505JPvLEBdL7u/LW+4bjlzFJSWLyi8O?=
 =?iso-8859-1?Q?pPnzwdVP2ARV6e+EoPTkil73wCR2C1UNg6OjUxE7obIc7uisRSd5MUJZ5L?=
 =?iso-8859-1?Q?A1WuTmd8pFCtavcYF9bHCmZissSuUXU4RyFICCRpKlMkiqwlZ0G6qNmMjM?=
 =?iso-8859-1?Q?smRIZfjMh9jVoVDF4ZLCgIzmBLEPf7b9xk8aH3VSZJixJGemQG7pBZYEFH?=
 =?iso-8859-1?Q?enF51mAQMLq+HOKDUt+Ei0+I8NlClBrEzwQP6pD1HTmL+0K3TwXMZdWIjZ?=
 =?iso-8859-1?Q?ytAsGXXRatFhR/67xusmIhb/YSlVEKe29/YTr68bXT0TvWce45bN77aWjo?=
 =?iso-8859-1?Q?P+IoQD198X/3YzQCmzzYRjtV3Yo5J1zLBb/acOtb5/lpaiPMlBI9Efw9rm?=
 =?iso-8859-1?Q?z016INOVUAEH97qUnZf73b2xARG79rtQzS6dwU8w+qCnDIXJf30vHdqhjC?=
 =?iso-8859-1?Q?0j9fmBdrDvjShW5Cx331BElTxQ4lYS+d+2O8bsWJCJ6Y9rAxDuQc8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?k264kc+K4BzBcVv2tI9y7BBXeLxDygu7ByvkQD7ZQCrPbFsDkxMOPMRnzb?=
 =?iso-8859-1?Q?rXIReN+8YGuHPxe3BLRBRLW7yyeC5/FXqvz18jgbCMqw5qN7hbvkTRUepH?=
 =?iso-8859-1?Q?WO9QExbZVPSzsR3Er2Zusm6wIQoMEtrTWeeYD2Va3cZ8FDDoZ3E+LnQKH4?=
 =?iso-8859-1?Q?I5htX+n6wIfEuE78LvB3DcvpmKTQbewWn6up/Bnge6evdKO0Wk6lNyRQY5?=
 =?iso-8859-1?Q?JWciTwOBY3eJJB4CBuRzRh7a3e2byJglfydTdl9pFvMA9ii0549I5J+NyA?=
 =?iso-8859-1?Q?SZQyOD3QVmvdxdCDinOr7mwI3B3uPxxgV1LAviAgC1vT7vXJjDoeS1kPfH?=
 =?iso-8859-1?Q?P2aqAcv1x30+9+m9CtJaDsX/kc1sahUgpdsuph4FkUk3Fdjh5UVZmJEiWI?=
 =?iso-8859-1?Q?C4cQYHeLXWaeC+OLg3f3xQPTeJsRJwG4tLN1EDqn8/YgWB3EFApzX3nYLT?=
 =?iso-8859-1?Q?yIAP+ofathhiEnDg4wdf82mzwnKh4yaE3rxbPG0DCc8ijFNLzTW8zry+Wk?=
 =?iso-8859-1?Q?m6ulq957UeUigWORQuE+oy378/zWsGNBeFhpCLRVoiwonRC9P89G4h89sI?=
 =?iso-8859-1?Q?ALxmbdVG9ZBeEt/cODuyLSSuoRwy5NmWG0UMLd8ZY9lxnTyLKr82+rBK6Y?=
 =?iso-8859-1?Q?kht6fQdWasu3lJxBKzMatf6Lw76enhC+HVXEncX+6OOzArelg5EZgv+jn6?=
 =?iso-8859-1?Q?emctoRMgXMVIasP23d+vrBnM+Omk4JE6b+baIrWeZ/b73k9H/q9dY3FR5Q?=
 =?iso-8859-1?Q?1CkQm8WNpk6SUfeKcu5YQocbKRdbtVmyvxdkdb8JKsJJdk0lgnGrkDO+32?=
 =?iso-8859-1?Q?+lh4uBQ8iNYNVxwiUOcbPBKDjqDO0tP9Ix+vdnE+jh/KP71GCGwtxGSKz/?=
 =?iso-8859-1?Q?GRXdgLeliCo+TyfSoPGS4fRsDlBafhcP/BkJj/5KA2nHeo8U9bv9/4I0SY?=
 =?iso-8859-1?Q?83VALBGuEmhyad0yZrykjDBaiac2Tk2kZDK7nqhAV90tQL7J6jOS4G/J+M?=
 =?iso-8859-1?Q?mN2WOq955h3VLk5sTNRZau5UXU0vugfvELRZZUC3bSF4elIejBOimTITQt?=
 =?iso-8859-1?Q?raowCT+xpMUwXLfLg72/TkOZJxrPk1VlwBzu7Z80wZegpmViR7n/BL/GeM?=
 =?iso-8859-1?Q?Xc4gPavVAmY5BmHM46h8D6VLs6JUmsJVrD4hN59NvSqLEc95yzWQboWSzq?=
 =?iso-8859-1?Q?1pGFMmnDxC4DgvAn5jVm+L7QCDSOFOzjYuwTuyjM+dLBngXzzpjkRISYNZ?=
 =?iso-8859-1?Q?m9Bb9GanOUPohMV4gvgGVBYdQL6Pm3liT+rswMziOVw6/WeO5hnH9JsI7j?=
 =?iso-8859-1?Q?ktCEhaEflMTGMxWUJlqnO59Ce8lgbf/WJ0yV96aNQVUhLlDphVyOB2W4Zs?=
 =?iso-8859-1?Q?mRj3sqvfxPtkMAv8SSO/Ty3iX+E/4dQi7N93EKm6miofsyavGoQArn3sdB?=
 =?iso-8859-1?Q?CBdPCdp6ciHMpJ8dyTuSR6lKhVdky4jhk9e033365P3wKhEqSRMZrrzvkx?=
 =?iso-8859-1?Q?9/45kEz9aJys0qaNkphk6aRKLxy7XyrFH1z7CzxDW1/mOWFHIuIBMEj00h?=
 =?iso-8859-1?Q?uifPYQEyRsIx8DXpW2fdZP0xePsef1WgXgPt/Furv0WBGTXmwkaNB9Qyno?=
 =?iso-8859-1?Q?aKN9m4baKVOrE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf88e5b-a048-4c49-a7d8-08dcd68733e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2024 19:38:55.8624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AqPh0PzVwbbl08AomsFoXJpAMtQiqQZXKef5iK13A1sppEujjGUeEJrr8xiHAyZKLBof+onG5CFMk8pF5nrOaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5403
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 19:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204609

Hello Steve and Richard,

I am wondering whether it would be reasonable to ask for backporting of the=
 fix for inter-recipe useradd dependencies to Kirkstone?

I am referring to the fix for bug #13419 which was fixed on Scarthgap.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13419

I understand that the backporting would involve the addition of USERADD_DEP=
ENDS to useradd.bbclass as well a fix to bitbake.

My colleague Ricardo and I are visiting the OSSEU this week in case somebod=
y would like to discuss this in person.

Cheers,
Mark

Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)
Bosch Sicherheitssysteme=A0GmbH | Fritz-Sch=E4ffer-Stra=DFe 9 | 81737 M=FCn=
chen | GERMANY | www.boschsecurity.com

Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
Aufsichtsratsvorsitzender: Frank Meyer; Gesch=E4ftsf=FChrung: Thomas Quante=
, Peter L=F6ffler, Henrik Siegle, Peter von Wartenberg


