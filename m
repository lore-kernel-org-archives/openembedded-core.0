Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2302AC636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 19:06:56 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.70])
 by mx.groups.io with SMTP id smtpd.web11.860.1675796812481135833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 11:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=plO0BafT;
 spf=pass (domain: nxp.com, ip: 40.107.13.70, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQKplB6K7tqc4G3c2I6f39tNaoxJG0ndpfTX2yq18HTOdUgc5eSAzjPh0Manz0AFgaeeNpk/gbcTjYHPO9rIVWe1zvRNspVZYWW2aUUrbQTX7JQEwH6LClNNG1nJJ2Kf4XIg2r8lUmN1VS2SYBZaZ2Qybv4lsjZT6yW+Pt2Ug+ISEcbt9z4Sr8ZETzpVX+0U4xUVOtz2GRE2jF4gcMv2C6HIwkOzNmMoSkgy5o5/eHZuLuBbZpbkcROObM7WK3tKuwxU8MQYIPpL6ri5Rmwnc6F+T0pVHGWd0RCHBeZvUoC4nKlNJL24O3n+D6zsWryx/QMo4jV8x9NRk+q0Wrn5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHZDpoyrEv80WG/b0tGCkrQeI2ksEZf7p7xmlnRkgQ4=;
 b=FcLI8Kz9wO02WcggjVXAdw8a+d64eGkqpkkwJ50EOG4kMrpNMOAkwJZkr5Nt9K/uH7PlSGbzPYmyPrNFHdJZpotH2r8e3BEWSAfqxsA14os9/zGJaRrJGY89D/icnPW46/CjIjPyRMSAH5pID0WnTNMQTU1UB7hxgNxt62G6hJ3t3TICVcc7Zg6c4vsRjtXQPjUAYdsyFSpCwwIhaPiqDE/ZIFPNqVm3mlZs5Q3UEvhuMNJcgazLDjsdLit+8xMHEQtb7/6qa+GWoYd1ArQ922BdvU+Nq07y2/QGFIinlbfppaEJ4sGf2UJEPGXlnqnh1J6Pd9Bi0eTfyC+PlyQoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHZDpoyrEv80WG/b0tGCkrQeI2ksEZf7p7xmlnRkgQ4=;
 b=plO0BafTfMk0AXZuyqq/VQoYFzj615TQ8Tify6pe4thiAZKS2RBqLPJHT+19NeYH/MS91pSVPkRfnuwsXIWytumbyYH01+qhbDQBJhT9sFbX4LyuCooEqqg7KQvRlbjqnuo7TZiVVz8tEnLcuXb/mPnqYRpffNcefmybrd4oQJE=
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 19:06:49 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6064.031; Tue, 7 Feb 2023
 19:06:49 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [meta-oe][PATCH] nlohmann-json: Allow empty main
 package for SDK
Thread-Topic: [OE-core] [meta-oe][PATCH] nlohmann-json: Allow empty main
 package for SDK
Thread-Index: AQHZOm9UebLQL2v8P0yMuc4Rp6LfSq7CasAAgAAAfYCAAFF0gIABFDPA
Date: Tue, 7 Feb 2023 19:06:48 +0000
Message-ID: 
 <DB3PR0402MB3852D81072B6EEDC3BFA0750E2DB9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
References: <20230206210911.2074894-1-tom.hochstein@nxp.com>
 <CA+chaQcNJc+k_SGvbzOAQPPHdf=6M3397qyiSV49v2eAiRf+ZQ@mail.gmail.com>
 <DB3PR0402MB3852BA14C92252BB2EE4E228E2DA9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
 <CAMKF1spg0hP5_7ju0XEqavZcKkTCaQP7nctB6wuistKaCmvQ=Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spg0hP5_7ju0XEqavZcKkTCaQP7nctB6wuistKaCmvQ=Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0402MB3852:EE_|PAXPR04MB8459:EE_
x-ms-office365-filtering-correlation-id: 855b57e6-8c91-4b0c-ab93-08db093e76e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EyrfcdUgrGEMr4hCbipDfLWHDBQmo89O03znwLNI+zMV9QIzr7iIH6j3OlDqL9RBYPqHAyUUUB73dZh1kVBcOjIarIxvAzcDZd2RtV6YhiFp2gMcFKy/WT+iWy4FTMd0Nrq2OI4yGIBQYz4AEdhUz5vtInWC74FEzb5bBBa/+IKR0yIRzA531VEAQrOKubk1+TZxSI/d+LQ5MrksvmKYgn+kSa4suRLqJn6Ce1tHKzcyGQULSkIjcfc7pOtNkNBJqjLrxxvHdp4nTvuTGQJbainI+lzPCickcyXxru2xGdMCwt7Eepw8+9sbjCqxr+o8efLsCqIPGuvdZtU/jPq98QB45NhLFPb3NKGMW4+hP62wdPR6Vy2BAOJKvawXxRh6wfmsCgCCjoDohhYmKyhhPJZSNAb4JtDXwWcpDAs80hyMztnbv8HVoPSaI82gldxBOyvqlFw3xIrZ96GIhPCa54voIJ0FaAL7rcz80FUwZ78iPSvZOmhnjbJi5ixIepq+AiV9IHfIjZMJc86x1Cy19qHZsaTae9CEUwRiaW+kLkCc0Z7iSkZ2ChrxaBU9f0faRAJPdV4KtVKo1YYYOZDHxU6Px2eIkv4DC7LxH2P9kfSoVBhmq/Fjht2isrMy3TarhxCsy/ZBclgkxoZ86oGLwRhCNRpAer1+Yv+f+1NzOUwJtlwi3iNNa1FpY/b0+64K
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199018)(4326008)(38100700002)(122000001)(316002)(38070700005)(52536014)(83380400001)(66446008)(64756008)(66476007)(8676002)(41300700001)(6916009)(8936002)(66556008)(66946007)(2906002)(76116006)(44832011)(4744005)(5660300002)(53546011)(55236004)(6506007)(478600001)(9686003)(186003)(26005)(86362001)(33656002)(54906003)(7696005)(71200400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?PMsTCyjxQI+tN5gtMpJrrnF0ViV+OH8DYTxUkDJYRhpVYQ7VsXSABbdlVRHU?=
 =?us-ascii?Q?8e8+zh7/HnafopEUSn6UHActmWOiYHhOzwTka1EveJLfuy7m3vmxdH42Gq8K?=
 =?us-ascii?Q?wNN8UHBnshlUJ1SB4/tLKHmgbUEpW44v0xUcvhb8uamFOc03aIdYv8LPVPg5?=
 =?us-ascii?Q?93DKPAFuVNPgNIo1pYkBpCu/0zn4UDo0LWUIOgrVS5an4z3jyC9TaXFYKrMX?=
 =?us-ascii?Q?cUbghNjwT4m5iers41jlDZGitnkLdAzDyDWt+Q9YDZxyYgKNdFZfke3Sr7C2?=
 =?us-ascii?Q?VesPBH8x96jDoJxN0MJCXYdRIIvM4lniBT6mUa3eSKD8NzK+aOFOxsUG+ygH?=
 =?us-ascii?Q?Kytf3sCHgF4z/nIDAVtJkCN0H0r4V/JCLBaat3BtEnd3Ac9XkKVR9VdtHRgr?=
 =?us-ascii?Q?QAzTUnJtcCcDKZmDfC9b71ls4t79SPIurqMzk38u7BxLRoeWWb02JHwSamUh?=
 =?us-ascii?Q?hd9LWJlHsm7Z/N4tFjaQN4YnEzbaZecrLTqGC3hM+medc/hK9Ql2Weae+ECV?=
 =?us-ascii?Q?cPfJG6CoTIFBJiv8+wwI8jEWo0qLCyC2PTS0Z1TYUp4oUddns4kOYWutOGXv?=
 =?us-ascii?Q?QidvlPmi8jI1akb0vU52NGN0dQUlOdLLLhZxjkrlC14o4uPW8qw4Bjkzbk1G?=
 =?us-ascii?Q?UJwNaHSgJPn0AZf3h8XMMJHKvA5GVGfzq1Z1E8tapox6a1gleCzKB9rBcWdr?=
 =?us-ascii?Q?Mo58c7xjAqgGZwp/6B3S3C1PBbdPofUJQXutzHQbBYS9XDNDqp2saBWK2ZRB?=
 =?us-ascii?Q?sWZ9yJvLW/bcBCHMYbXj27ozqJX3NJHDaj+RMq1Vpb+zCDrmx1CW4ekE7BAb?=
 =?us-ascii?Q?fbTWNTbvta68NdpxooL8x6iOIxVJhYLZb9lL2y7LyIz1iTHiS6Q4rRW4iEtw?=
 =?us-ascii?Q?zH0hbv+bwz2bYN1skl0o75DTQseKM+s6uancYXeYGqCu6DVflT9Zu8bQEfK5?=
 =?us-ascii?Q?I1kP9LDzBlbo3CE2bSnEUFfuVHeDmpsD4++mzEP1PUYcId4CexViTXzHkARv?=
 =?us-ascii?Q?BR4ACKavUnGDGceVCXAPc1MkAr5Ll9lPr4quHB0NkrR+fvq3L+ORi6pTF2Ae?=
 =?us-ascii?Q?Xy2W9nlX3Fa+SNiAeDMD2MvejpmwuTdg369G9XRhekBKlUMHMDrwn5uTBACT?=
 =?us-ascii?Q?VJ8jSRbAP7Qj0+JTi3/WoqlO7KDbTR0gQDFSKIAaszIu/AuGamhoVI4CDBPO?=
 =?us-ascii?Q?SbWur0L1dEP9nc4h8NyNBRTAjyOmGurVyG42UNIy/tU4MO5tMyHwRO+7Ld8r?=
 =?us-ascii?Q?/cwP8jQGe/9PO7XV55szawg4kSjWUh61b1ZZgFOYnFZZpAI+2KHZYCJ37Das?=
 =?us-ascii?Q?DXy62vf0Ma7S9aw2k3mSEbhE4+KcYIuKoMZ6gjbq97ortiJ65uSS5O/it2YB?=
 =?us-ascii?Q?pdE/xoyn0AZ+anYGC20SiiaepTHe/v8k/Jxkc6sBQHN4N0nSFv9qlyihVCyZ?=
 =?us-ascii?Q?h7SfYY5Kd0hShpN/cu9gC8rI45cdZSmXn3LhBQt0nXhzcCavjWMnHPV/xR5k?=
 =?us-ascii?Q?0Gu9bb0LaN0nGalvNa2EK/YR3zdh2XUFUXG/bEsCiCsBsPa/LQl31eWvoxqu?=
 =?us-ascii?Q?8uoQr3L26VsTaOg3ikyXDWX22Zrl4UkOqfNQTNSJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855b57e6-8c91-4b0c-ab93-08db093e76e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 19:06:48.9999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gip0l42E6lfZArN8fM65P6oMQjNMU8xcirlYHPbnyDYoRELRY9uUD84+X7gTbIGReht9w+PSGFE844viEl70dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 19:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176831



> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Monday, February 6, 2023 8:06 PM
>=20
> > > -----Original Message-----
> > > From: Martin Jansa <martin.jansa@gmail.com>
> > > Sent: Monday, February 6, 2023 3:13 PM
> > >
> > > Wrong ML and why do you want to install empty package? Add nlohmann-j=
son-dev to imx-gpu-sdk recipe instead.
> >
> > On Mon, Feb 6, 2023 at 1:36 PM Tom Hochstein <tom.hochstein@nxp.com> wr=
ote:
> >
> > It has the advantage of not installing the header in the image. Should =
the -dev
> > solution be preferred?
>=20
> if these are development headers and libs then yes its better since it
> goes with the general philosophy of putting these files in -dev pkgs.

This change does not change the -dev packaging.

To make my comment more clear, this change has the advantage of not install=
ing the -dev packages in the rootfs, which is an unintended side-effect of =
Martin's suggestion to "add nlohmann-json-dev to imx-gpu-sdk recipe instead=
."


