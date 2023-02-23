Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397F4C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 23:25:05 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.55])
 by mx.groups.io with SMTP id smtpd.web10.4954.1677194697091189997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 15:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=Vr+m3Yh2;
 spf=pass (domain: nxp.com, ip: 40.107.14.55, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfIHuDd8raKyIu7Z1eQ6QeKubkIrBDU9gtlbg6QlIMlaM5Dl2ou3EqfdNnvppVMX+ki6YFBWELjmZQ6MOrE7pzTlHkltV89I20uoPF/UgdSWzO2MZHrLOS+pTCHTD6e+SMygPg8HQLHUHGZlWg/HATPSUK7dLM+T5eb+iBRT0qv5wyLTcmOX1ilJjueg0Gj8c/qtgfDVvM0OdbSS7eWBf2cRME1hT8XeBgeJv5ymNSNnUKtn68w3I1jVXOuVKWKHuJ97xtmwdjFTa0G92Hdw806mZXOXLfjRTarc26mO3VhtzCDar2gC3ebg+wkSvDFAY+Q8xKB6kv3bRTEDLaMfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAO8+P7ZVfJEBFBUWfJ23FKsmBUQ993uGGi8sXkFIoY=;
 b=d9yzfwYm+EpK0Xb+HFy/LFtx8DnIbOnhE7CwSCEPDgKpzPWvgWui7EPtj6WnUU2RqnKp0mVR4p/racZT+eFPzkwyHE1Se0D0TLnImFMnGTM02V5Ovw1Lyei5Dcisvd1R81j7a0OtI0iMbVhM88lNMUROVI9xDIXANZqOPaIkOFXhqfnFvunRkUN9IdUk1cnkch0IaP5V2ZN9JtPVcbHxbaoutV8NPiAn9zr6Qr44BsALvlRrpcTvwlsf4ivyJBoq1rfPdCrJKPBeIAOJ9CtIby/sH1zchlakCeNpkhHn6c6NJgUPGljyf2b2lV9wIQ4pCKJZH2gTEcjAwAfJRX22RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAO8+P7ZVfJEBFBUWfJ23FKsmBUQ993uGGi8sXkFIoY=;
 b=Vr+m3Yh2GaCfg0sUkLYElhCJZZ2BwkUbkxm9F992zy0qKOu+kVusfiR/yP1d68O11GvjqFTXFaOiMOn1JgOPtWGZidQKIQBHuyZWvIAkReOKSLNTeUXkb1u8W+AwrWfLhJWqMSyBlUUOWTooyxRdxmEDBd2q1jxI26t5OVwooA4=
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Thu, 23 Feb
 2023 23:24:53 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 23:24:53 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>, OE-core
	<openembedded-core@lists.openembedded.org>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: RE: [OE-core] [DISTRO|MACHINE]_FEATURES_BACKFILL_CONSIDERED:
 confusing variable names?
Thread-Topic: [OE-core] [DISTRO|MACHINE]_FEATURES_BACKFILL_CONSIDERED:
 confusing variable names?
Thread-Index: AQHZR6g8vwkwJ5+4r0+QgjBGl0YsVK7c8QvA
Date: Thu, 23 Feb 2023 23:24:53 +0000
Message-ID: 
 <DB3PR0402MB3852CCB16686C166ADAED151E2AB9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
References: <8a4852e0-7d49-dfc3-7f41-9bf6c0c28016@bootlin.com>
In-Reply-To: <8a4852e0-7d49-dfc3-7f41-9bf6c0c28016@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0402MB3852:EE_|DU2PR04MB8840:EE_
x-ms-office365-filtering-correlation-id: 6b1b8c40-1229-43de-62d4-08db15f52acc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BXi7UlmsfG/9pnjgFy4TXsuvi4aIhNQLeE6tr3RwtViwQfa0yn7xZRLwoZOa3Frq1ata9RC1yb23REkh//5w2IcB3KbeTLabYZIGK+pa3BiSsRg0o67ndqLtrKlpVyCV3qjf0qPjNf9LJTMcRF9NCXI//Nz2ElCma6oEe/uqtuC+Oe/cDOjXBKQJwHS6LbLxUBRWzMm3iR6QKrl4QaDhZzOBTP9HddPBQkLgsPLS3fHn1oy3c0LNsCH7pwLxT10Htm+tLWE92XUuguitNrk1JvTkyBjX3MugWyZxnYuQXuomm2tN1abv9U4C5q5xuvGWBBPlHxMBUpxiFyKEXSHMD1YYy8hf8CQre6eqQ57dNwIXOYEL40cU2EPu2JI3ND+/43lZ3zkLYUF/gTmmdqsKgePumhxt6uH+f6VgndwZ2wgSxPeU9LkM6kmbJbzYI8vK0cH3Q39B4aV2iNTDNWXVmERMb0T3bCHyakAqOEwLQQOtSNj1+qOgCtueDFn+jBSlezqTw3j7ocjhTSMCXvqhXjMybND9sMterQr8VMza+KvZ08+AP5SQJEaxdppPT1Wv6VNX7eG1Nd02P92IYLW+8i3o4GeqPfHjS+2pQ1P4W7YR9IfzbErArrkErBLLSzn/oMHmLAFGsz2p+s1npsi4mNz2xvCtrCejV2k4R29Kvz0bdiM8DzC3j03phBEyhT2RDkb/wsVneraFagIQabtb7A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199018)(33656002)(66556008)(8676002)(71200400001)(966005)(7696005)(83380400001)(53546011)(6506007)(186003)(9686003)(26005)(8936002)(55016003)(52536014)(41300700001)(38070700005)(86362001)(2906002)(44832011)(5660300002)(316002)(38100700002)(478600001)(45080400002)(122000001)(110136005)(64756008)(66446008)(66476007)(76116006)(66946007)(4326008)(83133001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?z7RPPLyQCdf1OD9s4Nnl2W19agp2MWIER9OTX+n09WgtFJ7SQbaUbLE5RLvC?=
 =?us-ascii?Q?KCyhd6J5co0VWqzA2VPEVS/eCWeNLZqG+I9SUD6qqjUNMdnOi8O3GIVr3R6f?=
 =?us-ascii?Q?h50iW12ieLrmHKzol4y9z1WKFWUOeY6+EMaO1taXYZ3KgzrmReEPRi4zUOfx?=
 =?us-ascii?Q?ZDUaaLGm2e3HlfXj6FPeWKua9sBVYEIIGVQ9k3qqQ6qVaSnnWl+0BruFvqbd?=
 =?us-ascii?Q?4jsMY9jsnuB/NBKH6HQbsABuFV2zeYoDlDvnsW06xXq4l9u6ZbQeb0rIZAm0?=
 =?us-ascii?Q?V28EkF8DIjhVphBVQZGPKDZpPRIKtjQi+NgueS5aGzLN86Zui3+xHEthsJFj?=
 =?us-ascii?Q?KYd/4YEanVK1A5V3bGZMT0MrMAgHDCLn9jwJKwneJruoj7wSgzs0DC+6Fdwp?=
 =?us-ascii?Q?3J17+tXgwgt0I2jFVhyQCI2Rqk2lF6dcFT7JmEOgeNyrVAlgKeSxw/W5p6g7?=
 =?us-ascii?Q?JeuPy1Uy44V0Y4pBoygLVQYj8kguANvt3nFdrgnRuvv3Y3U8EYDvv8b34BZk?=
 =?us-ascii?Q?zhwFzYzeoAc2jmOzxKONaiwE9nTgV2NtvF+ShSO585T+dvd3KayR9EjLaHjL?=
 =?us-ascii?Q?c3DRJY+VILfN8X07zGmmC+sRs1vfgDgqGCD1xGL29RWb/tXR36gbGxxXkR9/?=
 =?us-ascii?Q?zhgQdPWPURAr7WY2s7mPFz7mh+Hdnl/tJ5GGXL0CH4ueqt4OL4s21I4PmhNu?=
 =?us-ascii?Q?ApJRtqIGw8T2BlwPOaQRipjYKlpWOLFhcrg9BHAVc/7g0Xwb5Dpacd089J/p?=
 =?us-ascii?Q?FgG9vPZP6WnBkb8XVjGTiZaNwU0ImA6u4JxKtEXUX5hV7vZOWQubSX2dEUlI?=
 =?us-ascii?Q?5NPq3KaJdsVeFjYTufAh58hnFoAGTkfW7bWLj61+hBR0VFDq6LZn5YZjtTNP?=
 =?us-ascii?Q?kLAZzZH5GRtEP1GD5jFMfuCXxsE1f0fMcbRsBCYDvyvQopWnsjE/fKYnnrjr?=
 =?us-ascii?Q?eFewXgNEUEMYQ9/KBKu3WneB42awUYZgIcWEYH4Jd6/Z1Jv6oHP1s8my/Tpp?=
 =?us-ascii?Q?88/ZLiOO1eX4Nz/uTidsEA/ebPj4VilT0yhXxhrA8l79VASutMvMRgDt9WBR?=
 =?us-ascii?Q?ewMAHWjZ9zxuSZUXK7MCN8h4oARmcg0OG9d272m+BVtSRu7E7i/f1PqRegEB?=
 =?us-ascii?Q?U1Er2L0+7SVB/ow2sMheVV8lEPzA51KXP62mvu7eQA7o/xhMpjMwVL8/go9F?=
 =?us-ascii?Q?GqSAT19o2UBRmROX7WYG4kMItLTGKcsQLWsC531kfIL0OgXsrS7ra/x1c9Er?=
 =?us-ascii?Q?+mJ8qlVE7iOujF0idZ1mGkoHk/1LXk+ihd0r3nx85+9r7Mbhn/9K9A/29oOl?=
 =?us-ascii?Q?K7fwRzTtW7VZYNGEIZk5MXO90TUGOi/NpW8G9J5vB99gIhj1rkpS6q7MDGpT?=
 =?us-ascii?Q?eNhXlXUhjGzzUr1Z4/6zsWamd6Ng98T97yqVi/Wnsusuma+/xc4K2f+zvQse?=
 =?us-ascii?Q?+N2hTlcYEYnMC7rVGeo1RKdQyyRfNsNi1MRTlO8SLCMHpHBhu/CxGSUmFV+j?=
 =?us-ascii?Q?dk4JWC1VqP76hLIw/RAyEjpxBZSOvQ2TqSWd/khDijyy1p5HmleBNPpVLAZ8?=
 =?us-ascii?Q?X5pXqX2HNO5/pwWwl9AQxXd7QU1lVNTnxH4vPMcI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1b8c40-1229-43de-62d4-08db15f52acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 23:24:53.1640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wk1XHGqKAphDU5QRCzoyhqCN8WI6J9jWk124w1K85lX/gUc/8Bae2vKxXuAO3DwVKadHPlQwgVS5a/HdQJ1g6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177638

I agree. The problem I have with these variable names is that it's ambiguou=
s whether the features will be included or excluded from the backfill. All =
you can tell from the names is that the values were 'considered'. What does=
 that mean? You have to go to the manual to find the full meaning.

What's important about the variables is that they will be 'excluded' from t=
he backfill, so this does look much clearer to me:

	DISTRO_FEATURES_BACKFILL_EXCLUDED +=3D "some-feature"

Is there a good reason why we have this separate variable and can't just do=
 this?

	DISTRO_FEATURES_BACKFILL:remove =3D "some-feature"

Tom

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Michael Opdenacker via lists.openembedded.org
Sent: Thursday, February 23, 2023 11:00 AM
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [OE-core] [DISTRO|MACHINE]_FEATURES_BACKFILL_CONSIDERED: confusing=
 variable names?

Greetings

Anybody else finding the DISTRO_FEATURES_BACKFILL_CONSIDERED and=20
MACHINE_FEATURES_BACKFILL_CONSIDERED variable names confusing?

According to the documentation about "feature backfilling"=20
(https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdocs.y=
octoproject.org%2Fref-manual%2Ffeatures.html%23ref-features-backfill&data=
=3D05%7C01%7Ctom.hochstein%40nxp.com%7Cf4e5b1f4523a469612dc08db15bf5d8e%7C6=
86ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638127683879148065%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&sdata=3D4i2IX0GpQlQXAh8Jausfvb2o1oF6MBZaU144KHKjcKg%3D&re=
served=3D0),=20
these variables allow to exclude some features from being backfilled.

I'm not a native English speaker, but for me, "considered" carries the=20
intention to include a feature, not to exclude one.

Shouldn't we call these variables DISTRO_FEATURES_BACKFILL_EXCLUDED and=20
MACHINE_FEATURES_BACKFILL_EXCLUDED instead ?

Thanks in advance
Cheers
Michael.

--=20
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Cf4e5b1f4523a469612dc08db=
15bf5d8e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638127683879148065%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DS4rZtW35Uxk1ww8OkrPlCJdlI2FWgIpxHcq7P=
Dq2M1o%3D&reserved=3D0


