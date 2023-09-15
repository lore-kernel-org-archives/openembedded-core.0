Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8ACEE6450
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 09:54:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.71])
 by mx.groups.io with SMTP id smtpd.web10.17094.1694771690610020427
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 02:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=445gt5Pb;
 spf=pass (domain: navimatix.de, ip: 40.107.7.71, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/eKdq0vwlzt614FrWAEwbziqcW2BhawE95Ekx+pRP3RCLnRjeRc4ECK/L6r87QxxzT7qoypDkWWq9XwIJ9adZVUW4ZOoQagNSbhEfFlm4yjb1sOyYzt/NsDfxopoNPOERFEyojlg0INU3JjtSNr5Vo0F9ZiAvOLamMl+NVH/38g/pjwr+ZCZELMCAv7eo+AMM70V+1yHACfCV94LiPSqboIHq2SglR0/innFg4N1Y0A5/sEu4hNBZ91jYluMwT2Rbd1VERQN7U+53Jvamf3mKLlO8J1pJJcWQfmyhH02/SiwWxK18MIEs8n2qtAHRscSwdxEjsHypJfPSIc3XmhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLyylxOAFQQRDYQnNt2uodyMPnYY5Kcgt/+xYlsJE4E=;
 b=iQZIE4c3DKFtt49L1Z0I9VjPbDS+9tdU0ibK/WFl27agJHyic9xMYZ3HkNm4sS2XISFelrsQcHd9umeGH7tG5+FSg0jXNZl4mxPcN2jQYpx1tyAn86caH6tKkf/Gsz2/VxlNkVYe3bY6guDGJPsjCzYihkSnYtuiDJskFcxGOzf6+ocY8L3BnWxAh3uF/SvjBvGIypO783wScyW3gcBA6qGo8c5Np4WRD87nq5IUjkhk3ZIn0+HIZ/FIXVl+fpMhRrAMoS2azvMkXlNMTgioxGOYsi9Xe15by/Chw6ltneXkLD9+gNBN35K85OCfYH0NJGtY+rhQwzxZqTPU2j8Hjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLyylxOAFQQRDYQnNt2uodyMPnYY5Kcgt/+xYlsJE4E=;
 b=445gt5PbFGt1wT17Ldj4Hs2jrz6krfZJbo3aqM2TsmluPf8c7IwNjVF0aKczLlbLJvbwGxrYNLjB+Q+4lZ1kUXmr09n4Oh4TKjGiJAlpOkptUpy0HO1Xa/6lmAf3V33EYDjEypYyWCuMsLVWdRnKtgPckKvJQW9jbng2baLXl9c=
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DB8PR01MB6533.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:146::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.8; Fri, 15 Sep
 2023 09:54:46 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::3972:7cce:497d:d704]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::3972:7cce:497d:d704%4]) with mapi id 15.20.6813.007; Fri, 15 Sep 2023
 09:54:46 +0000
From: =?iso-8859-1?Q?J=F6rg_Sommer?= <joerg.sommer@navimatix.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: dbus patch 1916cb6 in master branch, but not in kirkstone
Thread-Topic: dbus patch 1916cb6 in master branch, but not in kirkstone
Thread-Index: AQHZ57mD44u/8XoCx0CtaTV/JgbNlg==
Date: Fri, 15 Sep 2023 09:54:46 +0000
Message-ID: 
 <VI1PR0102MB31362AE02753F5A7490559CAFCF6A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR0102MB3136:EE_|DB8PR01MB6533:EE_
x-ms-office365-filtering-correlation-id: 1b53c640-f0bd-489c-73b7-08dbb5d1cb12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 o7sYjpZXmNkIfTD62qHW+V5tW/+LZDmYWePmafJHfONsfpYea3A5bD8YGdfpzlDPH4Kh+bboUD7SyzCyz+mw5YOa3z5KHAG6yJBtxvzBIWu4zVWQ8ulI45GVR0Ck4hrIT/1p0FRvHkT5vzXJnXaidDqmLm1WYFa2tCmyaDNqiii+7Imn9IeMHJ8KQIrey58p9idOvuj6sigJH9+UuE+bo+wcvFbZ28TmkB/JyHPMz9ZKu71xql4z3AuOUyYRchyElgZRe0rGa4cFbVw9Y+/x0f3wHV+44Mepu8lg5SK3X8uutXaeh31DKrUp9lflE333n2llyH4NuqYrGS7GF6W9qn+yd98+6E2utSIV9A0ZsrmZCK5OwJDvTHCf5HCu6D4+xdvvKBSxtxCVvDfT2AaIplZJC6KMs3Yu4RLockJi10G3Xw/+F8fYMS6AnWBCeIGublKy/I5RulpGx5iOYTDOCCwjKcmpxarAn35xXW19UQoG4RBBCTXBwFy7jiPkUIbIhJrY69MasAAYEs/EzFZ3yfqa9QV2nTd63x5Zn90/vEZ7BPPLXM55Vu86x1AO3uMIAa615n/YsuYvcXWdtamG+xwFXzFoaER8qzkVS29+M20=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39840400004)(451199024)(1800799009)(186009)(478600001)(966005)(55016003)(33656002)(8676002)(8936002)(52536014)(6916009)(316002)(64756008)(91956017)(66556008)(66476007)(66446008)(66946007)(76116006)(71200400001)(5660300002)(41300700001)(122000001)(26005)(86362001)(4744005)(2906002)(38070700005)(38100700002)(7696005)(9686003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?gOrbVD/MVdhlNa3NVLSI2TqaXpgeFNvTf/3DMh1j3rPj6eOc9ZEIJCrYag?=
 =?iso-8859-1?Q?GmATdVK9ED15jbINoAdtX2yXH0VBi9Xvm4iI/KY+dTu6tSHf1zLjJdS6t3?=
 =?iso-8859-1?Q?2v12+zZQ/hQrHmI+cp2PXvVfea1z57t1O/bKDbPZ7vP2nKJ100JlaWaixI?=
 =?iso-8859-1?Q?yNyj1ZjrGMSc8FctQtSl4Phmbh0j+t64sPToNMQFwYuIw0k4UrV+3n64hZ?=
 =?iso-8859-1?Q?PixqhN54AXrnxJMy6OVNLdBrNcLcB+GaDX7jOj8BBs756t3VBZ0Op7r9ul?=
 =?iso-8859-1?Q?70pIsCPuKecD1FgEzLGz93dJUhg+OvWbfUSy9ptzmdBj8LPCMpwowiAHQZ?=
 =?iso-8859-1?Q?47JBHZiMUp5hAWi4sOncN3WmL8XhXHTKafPT+RFu/PiNUrU1lPxtNOTgBn?=
 =?iso-8859-1?Q?sLTrfJ16bSYshFfrnaWtXmoCFTN7Dkk448zg0U4BrJZvXUT7NXOigVdgUh?=
 =?iso-8859-1?Q?20zvEaZLrfCkqoCSVsq/6sNo4jWK4rIZDG43s/1M1uxmX6/DBWRKu5rHS1?=
 =?iso-8859-1?Q?rqXKqdHvEuBMG3TVvbfgduVJmiTMtbwkDPDWTvQ/amHS8fdXj9kVK1bw/L?=
 =?iso-8859-1?Q?CSyPvdCVcgbXnP85DipXSMszovOV8xsdcjmiHfhZEX1x01Xwf7gKGWjf2l?=
 =?iso-8859-1?Q?Esj67BxoGgX0OjVO7P0V4QwUKKRN25WeQ2IQ+ujJAM7C42shjbcqdd3JZK?=
 =?iso-8859-1?Q?9K/qv2iSXuIFeyU3butCelP4LLorUhWfEauuIHWZZV6bDeo/ubfOWIFiRh?=
 =?iso-8859-1?Q?vOOmJOni1pX7U/52CM7/oiDcNpW2j9+kJ26vxU3Vr8PCKg0+t7anNGJxKb?=
 =?iso-8859-1?Q?OE4dOFih3HPsEprOJ5ISLGHD47SnhTVR+GbadIqskrKzI2m9Oag9ET78FS?=
 =?iso-8859-1?Q?kXbFxFqZLgNUzpY6bbYLokqRYYwq4R3jkX2qUkFWoP1MXbDSr8SsyHFisC?=
 =?iso-8859-1?Q?Qm16oyCFDW65NH6CgPptbBy3IXk5mFN8aeb6X809X8Ijw0kxzZ01xtBeqX?=
 =?iso-8859-1?Q?zKdKuVZZ4HfTHSx2i/GV2vWGhNI0bFRjY9SGbo/Oz6c2JDyKIlIhAWcbt4?=
 =?iso-8859-1?Q?mPPJOLBy7nlfFz21sAGonTqOQAFx3qXUYXWPxv2Ib+usygd3VTNij+OLtD?=
 =?iso-8859-1?Q?YLTbGzzXo2tahAFbtNWWG/n3UhvX8/ghDLRgzP9seISikbvDHgYcsf9fb0?=
 =?iso-8859-1?Q?ByMbEXT6VisCmE/6O4+Q4Od+X5FXlbz9K+spDyr1OB/Qfop1LJxWqgt5v7?=
 =?iso-8859-1?Q?0UTp76brnk4XWsYNEeATdbbshL02fgHcPIIMQhTt6mn7UtRji6qz+sMUAA?=
 =?iso-8859-1?Q?WxBW5A0qiDRnG84m8CkC+6QV0aOXaWYBxOfnJDiSIrYA3FCoCfJ+QDG2Di?=
 =?iso-8859-1?Q?qEFAvNiFcB5dA63ulBICBz0c0Dt5fN3Ck98t3aqBbMtviU9Z0FqB+S8xJG?=
 =?iso-8859-1?Q?BuNteLd5LTtjGq6ElsUcmqJaixYXUx6ASvSrsajdj2ZAxADyGoZhbVNGRQ?=
 =?iso-8859-1?Q?dBAza/NjQy2MtYcJu34MUj08X1P/4/0NEXsfZLw6Tz/f3c/JCu4UZii73h?=
 =?iso-8859-1?Q?PjklCckhFQR+Q+HLC+B/ma/43Qfz/OG0InARmW0GU8Z/MYGIISiQrnz9vM?=
 =?iso-8859-1?Q?+4qXX7yw5PF6KZ6f3DgpRA5kysSwXRM4fP?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b53c640-f0bd-489c-73b7-08dbb5d1cb12
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 09:54:46.2445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SClPgVRlaz3PLyR9Uvdes6vGLQ4fP5KauzZAZC8kvboGwb2iWqkqog4wqZblWIqcy9xrqHTWKLr973sfSfx753pu2j+k7Hz7jiY0u1jznas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6533
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 09:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187662

Hello,=0A=
=0A=
the patch =BBdbus: Specify runstatedir configure option=AB [1] is in the ma=
ster branch, but not in the kirkstone branch. Is it possible to get it appl=
ied there, too? Whom can I ping for this?=0A=
=0A=
[1] https://git.yoctoproject.org/poky/commit/meta/recipes-core/dbus?id=3D19=
16cb69980dbe1de79c3809f50280567e85792b=0A=
=0A=
Kind regards=0A=
=0A=
J=F6rg Sommer=0A=
--=A0=0A=
Navimatix GmbH=0A=
Tatzendpromenade 2=0A=
07745 Jena=0A=
=0A=
Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley=0A=
Registergericht: Amtsgericht Jena, HRB 501480=0A=

