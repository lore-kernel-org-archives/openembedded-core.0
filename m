Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768D0C0015E
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 10:00:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web10.10672.1691056843312850392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 03:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=iWmsLoop;
 spf=pass (domain: siemens.com, ip: 40.107.8.49, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5tBzDSL6Pz2jvt4fd74fDixaNDx+9SfF0XqzbqVHC1/SykoughUB1GeD2D+yeJCKI/R52JCjZ8h7W/ZkDWRu4Ulmoo0Aqdn8daJ0OCLI7TNI+ACqaXCUFDu4OJ+jqjOzBCRpgZU8tiSkj1rr1RgmAdJJ8BGS1hNk98l9wRQF9TLgS4Q6Y1Cn1Q/P81CRyoupmdXnHqi1n5tEhmWjw70JQ7RMPLCwf2e6aSlaXiZfDVX3qDqki3frY36ewvqDMiRUla6aH/wcTyzTuBx4/rsKmdKqikij9HmgQyaJtKebF1VchkWNYTp+5n+ZjLomthjpquX51DIx/SQTGN7hKwsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zetbGI7gX0Nq6bmzesm16cb5Vs54d7Q4oCgkJuR3Rg=;
 b=QBYziWGZFmoroHClq01rw4affzzAFODTYF3spOwcgbvAyJ2suHvLxh9UlmFdXXJzymKFBKUbTidV3P1pJJsbd9+Luz6+MDe9+Zg7jmSXZ0d62YnQX9V5vBPZkpiPTgVCLlHmpahyQK1dt0qrqe3ctJ5J3xXq4QPmlmjhyZPNrm7GfXs6E6qRJe+hYG4gNwIi5jicVllMuTHgK4sFWmElaDMY2emvRUqBpvd99gYr2RFUy7xsQQ1APxY6F9KiZbpQX28XYKGTX+G7ScshcwggGmPiqbxyC9m/bAhoyzia04wm0IIvjg3M757BFb5Jzd0/7yysgaYP2F0Z7eseOqafag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zetbGI7gX0Nq6bmzesm16cb5Vs54d7Q4oCgkJuR3Rg=;
 b=iWmsLoop7z9Ld+PratI7OaJ+eqAQJGIwiKsvW91O6w5Omm+9iewR57Kd5dxqyL1cZES5A917rGXf6a92hCEZ4zpoQae5cs+cUq5mdvUvOo2fAObg3DvWK5Xgsuj5GvE8TlslHaHkNhK6gqOXb5E+yOBj+CuFHElG8YlgZoGpGDZw5lywfWfEx90xs62w1gcNiNBbEpP2to42oY8XxMzUvvv0EtCzlTNKWLhGXvn/CwIh6Tu1pWu2CZYBLo8SLTnomGPauQrS8DlQ8HFHwSwd+RA+6iDeAtlGV0NNHTO+M037uFjhkILtg6LOO+gQ2Qx1KoMlgX4w0GeX68aATF3ZJQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5413.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 10:00:39 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 10:00:39 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][kirkstone][PATCH 1/1] libpcre2: fix CVE-2022-41409
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] libpcre2: fix CVE-2022-41409
Thread-Index: AQHZxeYMPm20MPvJpUCWIG8TrsCLka/YVnNg
Date: Thu, 3 Aug 2023 10:00:39 +0000
Message-ID: 
 <AS1PR10MB5697729E99733D324F7615DAFD08A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230803083910.1288886-1-archana.polampalli@windriver.com>
In-Reply-To: <20230803083910.1288886-1-archana.polampalli@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0fd8de64-9933-433a-93eb-f44508c3e5f3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-08-03T09:58:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5413:EE_
x-ms-office365-filtering-correlation-id: db7362cb-ae0c-4967-8925-08db94087dc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZnC/W3hoCme1ZNEX3v7my5hRxaa+2sM0xOMkZv7hueL+DZNN2P20lTcs/o5BwMcWTxJtk7J3cz3u+/a0ZFzQDN4ACTN59DREU9sAGg9tuRdnjY3R35+ArrnZPIm6/7MJvxF9pR2YPpvyirH5crD19YZXVld0PTScz2QK5gz162ooKjAIivrTRyfpns6LKYfZQLfZmEPfQ7r0EJuWH1i3C7Tf4EfsT//jrAQux4iW/rEs4/xRReLXL384kMXQzRo7aZtDRAmNTWNrxh1TJwWl+m7rMNBu04fCKJRlut6WcKEuaTEXTe7iQtLcpg3L3/91KyESK+zeH4qbF5HBpOsBJIRSUcnRZPfzU/M/9+RPcDj5tzY2KZWiCIkiSFLuKWXl8/hqGYjPzx5L/3mFmuF5LL70VwgxX5p7ZT9kLVtjWjbdCS6luyUu10Jf2vlOP2O+SiGoICRQ4hxgnu8QE+Ld3PRdPFLHMZzRwAEx6DK86UiMtNnT6cxAT+++w4umkQEI49Ra9+828aWmFGn5D2+XwF2Pmi03bMO8avxouHB8mOq2+JSuJ24htISCKv0S7An8+r9vVazJI+OeAAgsJAzqTdYe9pwM8t4oZS98Vsz9dVE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(53546011)(55236004)(83380400001)(6506007)(26005)(186003)(41300700001)(4744005)(52536014)(2906002)(66946007)(76116006)(64756008)(66446008)(66476007)(66556008)(5660300002)(316002)(8676002)(8936002)(7696005)(71200400001)(966005)(9686003)(478600001)(110136005)(55016003)(38100700002)(122000001)(82960400001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?joTbGe6WHSMK0QWFDTG904I18rvbT57IvnZULMWEbtZDdN8yePt6VuJao6hh?=
 =?us-ascii?Q?tlrOMSklhYOSm5evnUUhhbn5iKsLDZ2VFLyZ4Qwu7Yep7/NG7AWFTa2dvXCH?=
 =?us-ascii?Q?sYp7XYNufS+RHk54nh+iiC+Tcxv6E4RCTGfUtL8AH1moAGjh6HBmcUQkZv4T?=
 =?us-ascii?Q?v0odW574fshEq1MWfr8QYEOFXT3K7zChAeYyyN4cweMzjKrLEuvcvf5zZZsY?=
 =?us-ascii?Q?ZsXTA3/Bv5pliPT7giLEFVmiEX9Da9ovvFf3O+oRzmx70PmDYJuT0DXV8FIB?=
 =?us-ascii?Q?2mUF6x7etixGj0NP4Xguq4YW4EF5LrROYHSSLhlQkzJcFQ0B8SrIg4o0g7hT?=
 =?us-ascii?Q?RIv6cSZ0j2kKBekUPVoL04i9hiCikRfq4iqu1d4nC2FYFv9XKWlpN5wqjA2L?=
 =?us-ascii?Q?TwyPT07d/ojwHfNp4EpANQtCBmpsLjFxB5md9CY2RRBr2KcP5agkTMpD6/Ek?=
 =?us-ascii?Q?K6iRZ5y5vZ9k0uI788jAmFdCvwcOysaEo91l/Jw3JXl9FIN7c0R2z/XWQEP/?=
 =?us-ascii?Q?lR/xmZwWdTLy0LjOhuFTNuPKTWrbQeyQoAJIHTNzl/221pGJzC3v5gCgg5ov?=
 =?us-ascii?Q?0gP7zdb1cUlH9vauYJsaLa+KJkiH0L2h8DADIkMX1GXv/SHt/T+VuyE3HRcL?=
 =?us-ascii?Q?MPt6ZLTwpPBH2og0y8yw6gla6j83Qd+rUtQA+yqceDeXyyG1u4ktDEU4bYQP?=
 =?us-ascii?Q?gvuJ/ccbBR7BcMrONWTWZUsRcDCptkQHeycNGpr8p1zMf+cx6sqXVtxS5RlK?=
 =?us-ascii?Q?dF4joh2+52pdihGIZn21DjUUP1aEUQMKcgd1BpqaZKrE2HMXpVG8SMQprXZm?=
 =?us-ascii?Q?72kBLukYLW2Fte2KyGZwoi4BZQNsi9b4+gkZj6vzP08gp8AldT2cBDq1maFU?=
 =?us-ascii?Q?G2ULj/fKWT0BgmW5SKSfZ0Ejfk15CPjgooSZtzuQVPYTMYV3txCVDCOIRPke?=
 =?us-ascii?Q?xePLgH0owZXPTWdeXluId2k+33bILG6TNi/8y22jP7tEQEnBLnjLkn/5kRp2?=
 =?us-ascii?Q?zbS3Xpfdi0XNudyjSwUKdfdfMIT2wzfh6AfHp/aD4CCIgYGD+QAJYsZuCRAb?=
 =?us-ascii?Q?OJ0U9lb9oVLh3xcHZB0aiCje1kvLMHb8YYU/q/OYhox5BJmBa2ISLgUHxwPO?=
 =?us-ascii?Q?9gtl2HQSpx/OSNs6PQLUI/Vq0HyCiWwNQt6eSHt6okS1KBMt9t39kt4wYrHu?=
 =?us-ascii?Q?KcpZ9CLYL/bgcw+A3wbK8zdZkr27noLfDFJi/Jngylc8Fj7KiSLCVhq4e0XS?=
 =?us-ascii?Q?3OTW4vLGcEEGxOa2OJ66memLc8lVrSwsx0DS+SP0alUmN7c8ni1W/6i7U9/k?=
 =?us-ascii?Q?xfzWjBKS8LFIo3wJatq3MCON6iyf2e8OOUXK7x35frXq67lh2ruWOaSm1V0g?=
 =?us-ascii?Q?jKf9ixzBX4POdV2k+xi8W6BHlCAG2hvn8S1xBnP/p+lSqAJeZZvQscMaan1d?=
 =?us-ascii?Q?EwoTENsEDde/VgLoA3D8YzzDoJqApTIR9Z2ElBecfSPoNVq8yaUdvL9ip596?=
 =?us-ascii?Q?ZqHYLgH7vLQc0YgGSLcxDmvxZBUF8g6/lmpjYFs/NU08ovcWmRgUQb6veOC3?=
 =?us-ascii?Q?uJJkquH5/WYohdxyeLu5YfG68sfeNpMF4VTgQpGa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: db7362cb-ae0c-4967-8925-08db94087dc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 10:00:39.3750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H6A93YBY73j8qDVoMLFv4W1PpfAV9z3nikLUCTmJlEKZIjN8W/C+HaPWlFfcTfeNbH1o1cCYF7H/nRDFjCbk9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5413
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 10:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185469

This is already fixed, see
https://lists.openembedded.org/g/openembedded-core/message/185053
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3D410cdbc70cfba709ec5bef508e772f52514ba28a

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Polampalli, Archana via lists.openembedded.org
Sent: Thursday, August 3, 2023 10:39
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH 1/1] libpcre2: fix CVE-2022-41409

