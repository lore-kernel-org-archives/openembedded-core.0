Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2FCC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:49:33 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.41])
 by mx.groups.io with SMTP id smtpd.web11.7572.1714632572102570732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 23:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=vnYPbDiB;
 spf=pass (domain: siemens.com, ip: 40.107.249.41, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPDAnCuq0RyKFq+qaEWtS6qdRvhRtwzqOFaqxP9U78wjwusBBEiZ2NN7jpdl0PuDU/DSXH/C99qMhsTwm22ALTuu5Y/V0j4mDWkat7Xrrwu4zlm4g29w63eaDVXXUjvuufHyJ81ZmITCVt/Lduaguz2QsP0dNti0ySFvfe+Bh7pgQOf5AClCuZBmZVidQcn4RuWLbM/ysNE8HpDJ1uU1/tI1Y1EffyJ8kOREuKkjtTEfIBUfKpQSGrYx5o75nKzOaREa3xLzjnhywAhqt3FKu/OZqVv00x4CF6/wF/5nUkm9rsIARpmxxY/f9hrvlBqPj+Xzztqmkvh96TOc0Vsw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnAKBbfclg+aAsXeQ6qYx/YUL/y2y0nQWhQTlH9iN3c=;
 b=BtymkrZss3bJ+qKY1NTbKyMMMuIeZz4i3khVs8+/Uur5DsI0gr/OHFrAtm89VKW1h/oZhZB0RyPs/gaEzEp8MuMoRb8RUf7hFLPT94rBIlr+9Kp4d/GO/0gdu9BcTu7jiXq/2qnMxUp8Xey6H9dYvZUPBXtte73d6qIYMP2KyyT6T73hqZ9dcHSxxVlueKb6v9mtVPlYrUxt+t66j6SH90PEFxgrwhmZsy/CmGlSapEgsa9Y7IFUAehkXaTxJXQ15n4ZqFJsMANs2/Id7H0igkVaQpeAOnjE8nehcd0Ls3k6b1jUH8PbNmYYjr3oE9E+sYwK3tRiSekyxwQPv8HaYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnAKBbfclg+aAsXeQ6qYx/YUL/y2y0nQWhQTlH9iN3c=;
 b=vnYPbDiBDxSZi3cA3p+4W6PJ2+hTfb/2XF4L6qShaH+IsVMmubteMx7ePhAofV5+xRfpxqEXVx9CgUrsVpB5D3y6ooFO+Khg09bsuSAYkFigIJUK3V5d3zCrMjW/mBsennJLixvdaBlFXcEZmTKV/WZwta1wUcdUkUmd/NRUPrtBoSqhgKjCjDO5I2hNoRD9E/jf4vCICuIr9MVFFQTmFXiyncyLT3GjQCNmiipMWrImNeeSXVvzjYheIbavKHKwggq1jIGNIW6vz4YqxeOklrekB2DUmWBImBUSeScv1xjLXqeFY6UaGA4UuGH2VRE3plRsLoCyb/44VV8zovn1Dg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM0PR10MB3970.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 06:49:29 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7544.023; Thu, 2 May 2024
 06:49:29 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/4] base/bitbake.conf: Introduce UNPACKDIR
Thread-Topic: [OE-core] [PATCH 1/4] base/bitbake.conf: Introduce UNPACKDIR
Thread-Index: AQHanBKI113uB5ZuPkK47VQHEapvz7GDgTxA
Date: Thu, 2 May 2024 06:49:29 +0000
Message-ID: 
 <AS1PR10MB569747BB183FCC2B2704775AFD182@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=23ea3810-da8e-402e-9b2e-5eca80c69295;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-02T06:48:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM0PR10MB3970:EE_
x-ms-office365-filtering-correlation-id: 1e309ff2-b600-4c32-1808-08dc6a7403e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?tNf5qel3iAcXDw/wxV8FfiCNM9S4Wnp2Dh0D7mzvKXP2h7Rr5qf+hP5g9458?=
 =?us-ascii?Q?RF2iYWblY2YaoYY6hn7qiWERGBs172zIsYse/fDv5dAdXqsEL/Io8kjVIgdV?=
 =?us-ascii?Q?PCKtZXiv881DlCsqVXiQzWOMO4IARiRtVA9yeTttNuJHEws2K5EQoXeEAJVm?=
 =?us-ascii?Q?aTh+qdlP4qeWG/i5vJ/ddxLWcDoi1BwoGzwMmd+gUotrj48i7ZLX2Cm7mKWe?=
 =?us-ascii?Q?PhF/HAqi7esr1hxOueIEJQfPVI7qOdRSauAuyLAf3SYXjDNHWSlwjEdXn6uz?=
 =?us-ascii?Q?HSpQsalPKkhf1ec1Nh4/20r62J8OQHNCVwdwYvqRpK+0HH2IRMoZawP1AQll?=
 =?us-ascii?Q?4MyixBwVTWKc3F0CGMknl3JxB8QD9OY0fQTjIU3W+W7e3qZh+of+5oz/oo90?=
 =?us-ascii?Q?GWjkZNxKUMJMEJaCyWz9gJw/Vv2VH6tqQyUXTzdyFFw1swHKUrxck4ytA5Nj?=
 =?us-ascii?Q?FQ1r+Bp0budE9rfhPW5m8xX/S3Q1CswP3Q2POMMcxbme/TUpNtbSRxdeYYsZ?=
 =?us-ascii?Q?1vSwgCu4ntG+NY2e6iaexwFix8xt89OtD5CUSuEqBCq1reID6aS6ucvvmilU?=
 =?us-ascii?Q?am+/78Mt1MP6te4AIk15FmYb/cDWkam0GNKBtdHlgbUY/xemM6WxYxoS8Fiv?=
 =?us-ascii?Q?Bqz8OoHbEzc6w/VFFp3zG810vv0z0OWbaVqtnCtFngnQVUQOlkTXnWsflTCC?=
 =?us-ascii?Q?PkmTXEQq4C3dft6I71Jh55ZarZawvwEKd8/LQti138VHVKt4hVpKXOWw0vaN?=
 =?us-ascii?Q?FvI6iHevb79N2OiIUXF6DjqqQMklz4tmaAIhSsNb0vVw/ixH08F0b0elkU1b?=
 =?us-ascii?Q?3YZF/U1CBQCbnsDsKqqdK5D/yjH88AtF5WZ4E/8sJlczhuGBLgYlQ2pndbhE?=
 =?us-ascii?Q?m+Om461u+5bmOjSLiFNv0faBUaAeKTx83domRtZfyXS3JDRMyZ1Y2qstU5dX?=
 =?us-ascii?Q?8Iai6UP4ZgO67JMP2O99lE14lsS7Y7PeINExQsiAO/27Flgsob/pF7T0A9ox?=
 =?us-ascii?Q?Buv71sbdbsr/m1SVSqIzBdPv3SHm25crY/LagnIGAK+g74qApKft8FrCiAS6?=
 =?us-ascii?Q?nJbtWcjVscqNRHCA0EtssRQurlXz2SXimMPwt9hYnSBXlC6X3hUn2yuMsYXa?=
 =?us-ascii?Q?0N34BFILAJsUUScls43fA314VHpsdY9AF/0nDQTIFCbecOhSglAA/3bReSWK?=
 =?us-ascii?Q?kdM3ZRNOs4fXHRAwNqp7KNUVuGZOczpSXH1pqnpYiPlTJqL8EC3xfWmnpCDM?=
 =?us-ascii?Q?FWzXm2dgxJntmCXA3qp3v5K5b1A6HdTcSXDn1CAIcBFOKmh5Pq9MQ2jhptkS?=
 =?us-ascii?Q?23H7mx3IGYjnmTllWzj0QgkOuUUUPxxfT53lsIc9CdqY5g=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Yh3qRuklgBbz/y7YCfeY4txELBsLgxhfBOyw+FyDRhchcO3LKSfXGCdZUeHQ?=
 =?us-ascii?Q?EwCTsmqS0dDZV/cdBpiKWmfLWNAV+1e9Y0PCuz2BtpUJz906iZ/7sUxw8+/I?=
 =?us-ascii?Q?yEwYXoWTSqaueUVw+3/x9tonfbERUR8JnOvKttvjdL/F+DF6NuhnLyBY0zBW?=
 =?us-ascii?Q?qmlv0vmsz/a1C6Ou7L+5ocJzOx9lmH7Njp4xX3l7UabBHGQW++tWR/dacMoa?=
 =?us-ascii?Q?R1QJsc4xrmPjn8P1+X8gAt9x+MxeqHA9p4EN7nnaQGqbdA0+M3K67EfvEYg1?=
 =?us-ascii?Q?w/EtGJgZlRm4NaO6NXSsmipsoV/AR625NOoQMcErJPrXzWS7401QlIfSCon2?=
 =?us-ascii?Q?TCgviCz+NiugROete1rAfMoFYQJ4FKfVIvl9VFIGZsx0+uC/beb+l1+ARbyZ?=
 =?us-ascii?Q?N7XZzmA6OQ0En//ZqNy+qgd84Lea80U0u+AGbj90fradXOnI9Rk6sk6ML1+P?=
 =?us-ascii?Q?qXxofzKfeh5o1unbuQHVvS+KK22NrJo9e80Y9dKKP2qgd564WZLI2WRWrRu/?=
 =?us-ascii?Q?lnFGzIpjHP3zkRuVtg6L49jgGsvdU8QDycWzTJYwzNbGrRTeA0p1MVjggJaA?=
 =?us-ascii?Q?VauNiBMlDkmDQI7e3i+FVouJSNwSNVjy0NbuqOGzN1fiiCIt215kU7vWzTLl?=
 =?us-ascii?Q?GkzLceNoSDthlTlRNZPb6SnA9YThxlUfJ1drJvPns5qUv3U20Kg1YFQ6jAPZ?=
 =?us-ascii?Q?PUfxhIFXg2J/UScM9n6RUwxNJUhGDQgsxEK/PyhchKZBX9T/ooBGsm55yWcy?=
 =?us-ascii?Q?hMtzhJU0gxSsbxENx/QWOm6rAL/p61Aoz1uUIDzubNZPzMC9Ip8S1ts4LoPL?=
 =?us-ascii?Q?FXK25F9OYs/CRt9Upy+PaADmPdrI1qjI3K+sdUVc/vwOcilWCZW0rprE63BP?=
 =?us-ascii?Q?I8wwolT0+ERCjb06LSwEc/ssDzh4JCY4lKsHJqUA6fdrAZI1/AeESLzrebnU?=
 =?us-ascii?Q?wPkow7SsSEuic3zV1DiJodftPyZrgEJ6uDTWHubeLV8gEtst4kNjQIA2i8dw?=
 =?us-ascii?Q?FPvzKDtGOWffZRD0dySHqjPROGz8p4XahDoVgVkINoL8lu0VqapA3kl9TKv6?=
 =?us-ascii?Q?Ae/ERiFWYMu7eI1PJLENrolu3vSXmRGni+lBxmEixCvRJhlRkPOa+GKr3+ER?=
 =?us-ascii?Q?uV6zP3DKZ7S0Wz+1ZvtUPMkldmT9DEZz/1/Hx1BibvTLGRcz3gVe2jYKtqt8?=
 =?us-ascii?Q?05Nv7csniuqNzVzTqHhjDkhvbTyGFmB0S3sPeW0PrA4wMPiHc93835phAPzW?=
 =?us-ascii?Q?hwm6xXmyGpLpPLiK5JtWcNrDq7bgN3kJ9rvcHyMDgSII45mBzyj4jDRa78U1?=
 =?us-ascii?Q?tIZfSVWt0oO5PrSnm17xKpcfKZxNiJ/vp6qk4zgTfjAg4VNTH7zlizwBZ6r4?=
 =?us-ascii?Q?sRu/mHlcLIM2dRexSQ6RKYvtIKURU80d4BXBVW0GmJ5Y+bgs89Bx+CN29l8X?=
 =?us-ascii?Q?sF/tpeQIsvIleSKhNGTUOQkSSb273WsD2I4FRk4vN6H4c74UVFY6sqYjQiXk?=
 =?us-ascii?Q?yqSn7CURr1uhjV8Pq5uzoTsC8eqk7Yahc3ahhI6pILd/8dAjVJTYVCjgQS7/?=
 =?us-ascii?Q?kjJhmPmvfh2hczN1WgUmcYqngxqSL5DsqBTm7l5b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e309ff2-b600-4c32-1808-08dc6a7403e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2024 06:49:29.3259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIFwDV4CcYJ1nIzQOVlQHx3jMW2Ds2fOEB2DAojTUAWkAZiaOSuBR9LE7JsQJQqo5qYKaCZvu1octq2akuOdKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 06:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198900

I wonder if it we could name it "U" instead of "UNPACKDIR".
It will be mostly used on the same places as all the other short names like=
 S/B/T...

Peter

