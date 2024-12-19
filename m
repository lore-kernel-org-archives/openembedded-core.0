Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0689E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:27:15 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web11.138104.1734640028539969179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=oLPpa9eS;
 spf=pass (domain: siemens.com, ip: 40.107.21.76, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAecP3CcKV+ZyuGL4s+Mj43q64SJxF0p1aSSN2H6mm4AQN8ZYt2RVw4lbmDSlV8WdK7BP2el3KYAstP7Ko0mCjnSFf+aOFZR3d2/JAQgf2pzw5ab9vq/327QoRHnX9YsVnaMszD2vPkaT5rPiJO0esNa/fHWfNGM9Xji26WKbdJuNpLIDrWmi727qTrxk0XcfZ0knjG6RUgY/MqumFleSRo9RKgQh9/ruXPtfCtNel/quNadZBNtPLCEjsnQ01vKhdcYn4smFszI6vH0gSE1Gw9qZwbEIW/v+iDXFvZs1oDEmR2FQ5wDe4HeppgFvgOLHLnF3jV9a6nuVhWV3Eeh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FC9yqLSKAlnKYnrXU6SAXumC9GSkqrKsmStpFAr41gc=;
 b=IvSuEXQHSbVVYFFbMpO/15qcvWxp2yLzoXEf/t1z+RSsgF/jJ68HWq8dPOTjIMkiUHLdbbeOYOBKACzQW/zNkfP0kYYM2GLiolM65rmh/z0IqwTRsvPUsfaZ1slpekuV4gdoud1eMvknMZUwLtjfXUKaKyBaACOa3JPc98XRhhPQ5QCMhNQaUWflQGW/cGREMX1T1Uhoum+OECMhlJlmRyJ7K/XzJwKIN4Yw+ff4wz2xbQT+M6AJGzcJvqBCpw3febtcRFonQW13uILW9KTnODl6URJcws2atPEV/HDlXX7wFoCbgc36a+BR44+1Hl46qXTkL3XdGP/8B1TRC4+baA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FC9yqLSKAlnKYnrXU6SAXumC9GSkqrKsmStpFAr41gc=;
 b=oLPpa9eS0FyEMmrRheWjrSt7deh+B/gVNCoxTyEOdd+gPfQsoMvwSVY0ibQdwq9DSgxzsiOW213Tcj9RbDMIXNwYd7jxg7vxRiX6HoeKrG/rVvemUVGSpEjnzH6BqmTm7KYlwQKxU2Wy/CU7vbhvAKdU9gQEj+7f8m2PL2/nJrd054aBkw7OZ74BYk8IH6ga38cuHhhT1NsEfrGdcIjajL8hsKtQY4v0xTNq05lVyHkcVxyRMTIIdJWX2q3tnn+FObvFx2RkCqrJmeigbsgos5sKkp703sbn5SdZ37SLm+A7Q212CJKX6fZJQgtUqvq3kGJ8WxgHKYlfmHRICXzAtw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Thu, 19 Dec
 2024 20:27:05 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 20:27:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [meta-oe][PATCH 00/12] ignore or mark fixed several
 CVEs
Thread-Topic: [OE-core] [meta-oe][PATCH 00/12] ignore or mark fixed several
 CVEs
Thread-Index: AQHbUlQklridE+8dqEmknyuVRiK2pLLuBAWg
Date: Thu, 19 Dec 2024 20:27:04 +0000
Message-ID: 
 <AS1PR10MB56979455DA7276CB6E283025FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <1812ADD12AB727AA.26783@lists.openembedded.org>
In-Reply-To: <1812ADD12AB727AA.26783@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=766f8257-bc5f-43f4-ae2c-d94f536ded95;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-19T20:26:52Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6211:EE_
x-ms-office365-filtering-correlation-id: 61277f84-59b6-4e54-7381-08dd206b80a5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?4pVNqi0UbzC3thPjbL+mFVSrteppFCvix0vABhe0GaBOPpGcMUnd0pdcugVx?=
 =?us-ascii?Q?sy1pZMQEJ+GnphEYM097A0Rf421bR0i6itSmXbaFuYELFtSjOZMioHnYx1p5?=
 =?us-ascii?Q?fCgAjFhwLate6nBR4dFqHO3kAzBa22Dg550asbX8p+2Y49MvabLNBkz/EhOM?=
 =?us-ascii?Q?JlSA7Q3G0E77EIZwXpBuRofd7h5pOHg9ZAF9uUVxLPnH+voJ4R7NuVkz6XQT?=
 =?us-ascii?Q?/+hkMUfgPtwd+CV5Cc1I/6Zoopv0U4kXeSzmda1Q8XWEDkzt8LeMDOGxEOWI?=
 =?us-ascii?Q?PmA6DwIgo6xLgMktZ53WycRPHK9I02VcR1yIH4E6s1Vvy+mfvDjU49oWJ9/D?=
 =?us-ascii?Q?0h59nXp9VwePrMidMWeHETrTSnVdukXcMv1yYpmJlcAEDYjHfUWOxjTlTOX3?=
 =?us-ascii?Q?fcYSSzuCMPaO2xT4nVe/ooOoGj+E4zDZs2Ri+QTwTUN2F0imXm0Ag7ovHTQ6?=
 =?us-ascii?Q?S23FZLJh10tRPaAZA6ywGgyJB3d9w7wmn4j87FlxZT57DFDQ85qt7uSpw1oP?=
 =?us-ascii?Q?j14m4PsqCW0hUEzp76tm587m2ZpmF3m9pM3/bjLfEWh9Nh/CjmdB8NLYl79T?=
 =?us-ascii?Q?oijeuv5m1ZjDYcLBnNzltEE/ZmLe1lVxR5CbQtTNKb4ztET/VOr500Tu2Sa+?=
 =?us-ascii?Q?8PL4jXbNiu1vv/2iNstjBZ+26zD9HO1xtOzL6vAKvtVycPzbjQIaTvXeyWMO?=
 =?us-ascii?Q?1YCj/kqpRZXnIJAp9l87oShnAdCLqhOnwW3u9NeYwm01l0nR0zAm3BmPYALs?=
 =?us-ascii?Q?zRLQzrz2jg75Ib1IXqi6ZX/CFfLjdvGNzxa4ArszcDsvolFbNNRwZ6gDRiGL?=
 =?us-ascii?Q?9kVJyw0zBIcgWX2/+YkMdgs4Q49v3+J5QK3u/StvZY8I5s6GEbXXID9tRLma?=
 =?us-ascii?Q?zMaC3TL3ALhzIpWPwCXM9qtRbAy4Krlfs+rT1sNBUS7tJruaLrJLKoyK+LGd?=
 =?us-ascii?Q?OJO15HXBLagZPYFDHGvuLy1Ku1cQi0y00vprvEfEh/SoSQdg4eBx/Xf1kMPJ?=
 =?us-ascii?Q?tVRj3P/3I47HygXm8lrxE225PVqyh6ylxcPRaN2WzqndMbp6YNWVsRIZb/5v?=
 =?us-ascii?Q?rH1VFlIXzGv7QAw0nj48JgZ6WrWa+RunnJSxWvixtMzUUkW9TLHb1bY2iMa4?=
 =?us-ascii?Q?9lM/6GGnlq/RK94Bhjo1tfe3md4t15hbH+JKBk+fLb8YEdtsBdg00sWygQLV?=
 =?us-ascii?Q?HDcCUsnZeaoLrDqOrfgL+BCOErUlDlNG4LGI/aoCLG8GarpzzLA9z4dqLBST?=
 =?us-ascii?Q?97njSLTiOGzzFn4pMrJdgpvgAUvx582klFHFC6x3FQvPqGsZbytdYkNbb53d?=
 =?us-ascii?Q?S4nN0pqPgcneiRp61etZKtD0HptJ1Z++UopBDkEqj2tGh/s9pmIBW/T1Ps8W?=
 =?us-ascii?Q?QHCTO+l1IVr/HOl72+BHln07hJhdyD2wrlolTKbMLLKCIWN9Oeb/RHs6Defs?=
 =?us-ascii?Q?wHj7MNZ59vzejeEb3nZpt0Yrb4YJJ5Zr?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MVww7K2Eh8f+fKMuJOexet1UGayoY4DCkefeZRXu+xHgetsvryN/EKVpghVc?=
 =?us-ascii?Q?7THrWxdsJXLnGQlZPONdSKY+KxNB0n/W0WHPj4CxGBg31I6dG2I/caVJbhDs?=
 =?us-ascii?Q?/CRRNdkIwcTTfyJDXol8QXsyMy7ZfNaNLtCZHWN5D+KWwnKzoPaBXDJ13Dqr?=
 =?us-ascii?Q?abXwVxlPATEor43wWtLC2NHQ5dMcLJGJpdl9XlSKTtLmMFmLYmtViVh0HYBe?=
 =?us-ascii?Q?zGFXh7D/oOElQC0o1xKvQlrJAPDCxf7Lr//cOnU2K3xntoFHUX5ZP3pCdlhL?=
 =?us-ascii?Q?eOWU7xBc1CX778MpH8Osl32wIyujrJnVf6Mv+lY4fLSJU7iVTKdMRLf7bZYa?=
 =?us-ascii?Q?hDWJ+le6E9SnoiT7agwMGZj6BRSZkpFIDBEwO2gGV2HtlWkSHU29xC9N0BGG?=
 =?us-ascii?Q?VH1SLRzJtTq8T8p0kWu5Pop4uNvVxvPOFu55ttHAwui00J66sC1epBexUt3b?=
 =?us-ascii?Q?TKhXX2IQKvTPf9riZb0Ysxn8oCAaAH2+yS03RI1MeVhpl52/J2Q0UGMcfJr4?=
 =?us-ascii?Q?jo7EPc3ye1CCjGdP0wuDKYP4KRh0WCvEgD/2J/j3DWLipAEI5sSJJ0o9e2bt?=
 =?us-ascii?Q?inG+aKcxH9hnxPgTejnySVmgUZqkyrG5KiCXQWLFCh5HR7Q6SfUImtM/xh2e?=
 =?us-ascii?Q?QNs78LcPccf0DNgMaddBFQEO9qlnb0t2QhZRsZTxKvLqHhyTLWoz1VXfnNO8?=
 =?us-ascii?Q?AfKrLiH59u4UA0NNN0HrYEni/JgqROXcFs4xdHU3B82dFGjuqEdSeHhEs23Y?=
 =?us-ascii?Q?6/jNVwIrh7ScUhgVbXyyyNUk8H0h4yA0Hw1ihrE6lPNi654SGgCaRkrcwis5?=
 =?us-ascii?Q?/JzD+5wIqm7s5f9N656uGqevlrBrMTDlyuhYUmoJSeqOre//J4GAnOEt8kgz?=
 =?us-ascii?Q?6G/dBnI8yWYG5UtBZ6Y9UqGIxnvneg69v7JHJ3fX/H77ARy9xnDrSJ0AoreL?=
 =?us-ascii?Q?IG+Qhhfv8Fg6G2qT/WOsiH/PDNqjDX8IOm1qN1KHIbyUBluCRGmTmVVKqgvL?=
 =?us-ascii?Q?C+sCrEbvSZLKN3N+V+xqftIBi9K1/8eZl5USOJyHFtxMOUYQz4CzIa19n78S?=
 =?us-ascii?Q?zLNPWLkv4DeWVRRpS8wG3yQ1otD7GwAGJiiXbKk2Y7AMFKRraUHGrKcfzlw+?=
 =?us-ascii?Q?RIgcUQF8M8qYrPx9MdY/x4kjwl0JxQB/obOohkQ5HuVCSv2iiQlhOzuPJWpV?=
 =?us-ascii?Q?kZ7sNU0DxA5LdW/MPuPNPxtZPGG3wl1QBXpbE6ODYK30ASXDsCS6m4VMiKiC?=
 =?us-ascii?Q?N68CskJ0wZ90tevlwwMKEWw9pS8W+isHqPvHmXVk+LO0yssEzoxNTvN1qt6h?=
 =?us-ascii?Q?W7T/946dvCNyQKdJGF2l5KDekclbkOobKnEyBWocw3N1YD/7Wa5+QSU4yYgL?=
 =?us-ascii?Q?yYlNQYnYTfb5ScyB39YIA8v86fuTzLvKrOLPrtIavaPvL5Z3qKvIC7U7dXmE?=
 =?us-ascii?Q?yBxjoicPuidXsoiCGQ0kAKoeFmrTNjJQ7g3mPmHZHADQMnz9M5SqsPO2gh9W?=
 =?us-ascii?Q?dMcr3IGBuvJGbzE0DMURiUUpJe/JACX+5zP3GB+yZwyVntOOoPAwL+cU7Ryv?=
 =?us-ascii?Q?RNPaKpOv3VorEcvYEhGWJRTsi+KSr9IpVl5ofKAC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 61277f84-59b6-4e54-7381-08dd206b80a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 20:27:04.8049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLZY9INwHdIKOB6UUyr6YWdSpTkQC81Kv7vyk7BwfMySY5R0lhFOpEsZWnkQHhH0mQY1x3EJuQJ2f2H7UOBS1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208946

Wrong mailing list, please ignore.
Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Thursday, December 19, 2024 21:24
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core] [meta-oe][PATCH 00/12] ignore or mark fixed several CV=
Es
>=20
> This series handles all CVEs in meta-openembedded master report which I
> think that can be removed from reports without doing an upgrade or patch.
>=20
> Peter Marko (12):
>   ace: ignore CVE-2009-1147
>   apache2: ignore CVE-1999-0678 and CVE-1999-1412
>   apache2: remove old version references from CVEs
>   spice: ignore CVE-2016-0749
>   gattlib: mark CVE-2019-6498 as fixed
>   monkey: ignore CVE-2013-1771
>   redis: ignore CVE-2022-0543
>   spice-gtk: mark CVE-2012-4425 as fixed
>   apache2: ignore disputed CVE CVE-2007-0086
>   swagger-ui: mark CVE-2016-1000229 as fixed
>   memcached: ignore disputed CVE-2022-26635
>   emlog: set CVE_PRODUCT
>=20
>  .../memcached/memcached_1.6.17.bb               |  2 ++
>  .../recipes-support/spice/spice-gtk_0.42.bb     |  2 ++
>  .../recipes-support/spice/spice_git.bb          |  1 +
>  meta-oe/recipes-connectivity/ace/ace_8.0.1.bb   |  2 ++
>  .../recipes-connectivity/gattlib/gattlib_git.bb |  2 ++
>  meta-oe/recipes-core/emlog/emlog.inc            |  2 ++
>  meta-oe/recipes-extended/redis/redis_7.2.6.bb   |  1 +
>  .../swagger-ui/swagger-ui_5.18.2.bb             |  2 ++
>  .../recipes-httpd/apache2/apache2_2.4.62.bb     | 17 ++++++++++-------
>  .../recipes-httpd/monkey/monkey_1.6.9.bb        |  1 +
>  10 files changed, 25 insertions(+), 7 deletions(-)
>=20
> --
> 2.30.2


