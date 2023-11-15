Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B97C2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 21:53:29 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.74])
 by mx.groups.io with SMTP id smtpd.web11.26108.1700085206728983310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 13:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=kWM6uw5q;
 spf=pass (domain: welotec.com, ip: 40.107.105.74, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJLwKZCprhwVUF+LIIghaWTbBIrDp1eInlR06vGN/3TRXZjV0JrJBSOAJbZy/279n3tB8MILQOkTAHrCRYTnCPJLoyY/RGY79xrio+CpWsXSWW6PoZU+/AOO46wRs6ntJ61dHRBzQR3kiSrVkiS9ZSlzL2axc1lqLsEq1CFgVMoly6lp9KuZvXqFD343VJpADLQxTsORGfLrbGUB21tcEkapRibPK4IQiDY0Ohe/JPRBVnFoF4ZmTjvgRbIWBB1+xwKmQCJAQqlCjfJ20joBvQMGVk329J79+C01DUyTcOIXMrjNft8294qdyfCxknh2IFQWYxKiCkn0FSdEZnOW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqFdtrfoG6njlNnHHwFUuiAlsIK9kqCnBQHqFNjviw0=;
 b=UhOC78wpftoHXD2wiwQe1V4qSZ/fpYXdxM2UMy7mBjVoOfhmCEbBNF3zRQvmuPFWc4X8gtcTfrKP3GqBsSzh03BFGGeyOu4RlcLJ2IYaeHoaK42f7CcPElI91Lpy8HTYCfGKiaWSzRME10XfLykDOR9zucCLwxOnyzb5JL5YUzCZ5w7xUrQpjSP3O6fDEq1SWtxN4eahA5xClorutdp2xT3JZOw+gY4ikBuaDTqWpOXxAK7FIfp+mxjwiFy2ooOOh9WARqaka8JvjDznQ6uGzb1Om9WboYbG1DUZ4IuXXv4CSMlNjJu1wznrqgU6Gcw2iLpG0Hw7rMKNBBGjVmEEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqFdtrfoG6njlNnHHwFUuiAlsIK9kqCnBQHqFNjviw0=;
 b=kWM6uw5qT6KHufXf7AFmVv9OPKMb5DKUFLcLcXveQXg7E0rkahIkFssE8uMkmAC9XKru+Q9DjTtqeTbnFH7ijz/r1sEQNjovUN7poboSGzRsWuswQ/16j8Rc7znmuzQQAoA9UVQErGOLiI3UWhFBZFqI7O6SInc2C8yquQ/6gRYmsEgCig+/Yr3Wx6jAd4FiCzH1UmUgGRc69iKT1jsWDOGR/V76s2GgqUVV5bMkU6wuASSI0YGIrcmXp1I3FE7DyO8hz6EUFb0m1QCrmQFrs7qZ2dSmABa/SvI3yZybjzuKw9dZpfGqaiyNCXAiECI2a/5BpM7HI8T3Zjk6X2rYuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
 by DU2PR04MB8887.eurprd04.prod.outlook.com (2603:10a6:10:2e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Wed, 15 Nov
 2023 21:53:24 +0000
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906]) by DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906%6]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 21:53:24 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v2 2/2] ca-certificates-native: add certs path to SYSROOT_DIRS_NATIVE
Date: Wed, 15 Nov 2023 22:52:56 +0100
Message-ID: <20231115215256.867653-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231115215256.867653-1-p.lobacz@welotec.com>
References: <20231115215256.867653-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: JN3P275CA0014.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:70::17)
 To DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6475:EE_|DU2PR04MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3b18c1-0223-4b48-ce23-08dbe6254a89
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uBp4Pfmhg2HfKZbSuD69pr/o9Cyi5RZt337nx9RJQarrHP1kS3rjSX9cQ6B+BcUkFxam6SsuKqhPzbGcRVrapjYUhznTMaYiYcwiFMHbGVw3rpLpjlMG7e0YzHxwIpsPOwej93SsPhnwlvrPqFLOu7NB398vw2O9/9SLR9zlykodmM2LVphLv2Iv+zN6Rc+NxkS8N23GIoQQNLIE3dkHV3PA9xbIT4qCFvSpeOpMUIrFp0Eg5BCdt/g50GZCQaNC/EBtez52fOazIeVUwI4gAp22lmgMuMKr/ADpWHWN7M1yKAV1bo/oBJWlw9aHuSptfB0/OLWGeMtkPjd2aXPqHlzDunyiyPe/zYugnRzVxUmI/JZlVCt7Hw+iQhD0/hy7U+L7LbAEDmh1hkg1laNbVtCnn05rANWdRCAId8abaUing+HEG/G8zSy8yanmvZJZhsnQarB/LDJbIuR9PjbS6+TcCDdHJBzaglvh2m8L8xyVJ7Z2fEUTjVcfkUWjcUnnOBeecDoUPCAS6nItrLz7LX1oq4BK+jaeLz8/PRBhdN8U52yvVqqsOw3+DpvZXjtM2IXygbJRd6qvoZFiPPX1qPiLPd0/+SMeb5KBYkq7XmI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6475.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39830400003)(376002)(136003)(346002)(396003)(1800799009)(186009)(64100799003)(451199024)(6506007)(478600001)(2616005)(6486002)(6512007)(52116002)(107886003)(26005)(1076003)(6916009)(316002)(66556008)(66946007)(66476007)(6666004)(4326008)(8676002)(8936002)(4744005)(2906002)(38350700005)(38100700002)(41300700001)(36756003)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0pOFGlqDjVWKsKNwRxONaZnt4yTz6uEe0EgDPdTVUDYpQyL0pR8qL9kCNEp3?=
 =?us-ascii?Q?+c4TnxDv8vyt0yLSMAKPZ7Gb2+OoQGvP5qJ591ODlSkkUecp/GGDoKy7nwwm?=
 =?us-ascii?Q?XSdatjB7wfpG6byG3qdpIcYEeVaRir56eH3JubwjjC4AWQDayTQXON/IJV/y?=
 =?us-ascii?Q?TyDp23YuB2OhZH5poIpcLQJkoCtoo6VEmaCqSg0tb2uKeG+d4DFhdOpzNB4P?=
 =?us-ascii?Q?P6Kw/qkAxtz38lb7S7OgscLOU2GlPGt4ihvVwvbZ04IH4S1Rpy+xvtFWMECx?=
 =?us-ascii?Q?Ae/xhxIolS6YlCOQl12ii4GMiZewhds5pZTxRM0m1xGPtCnY+xAPyVxAmnsw?=
 =?us-ascii?Q?sQ0s6rbEIAxTsmR3rBUNa+zQQ87G6w70uBd5b7+iyGgF45Rsj2Wxf9b3TETN?=
 =?us-ascii?Q?82ikyheFt8kion9SUZT1hAuSzElmZphnUap9o47sncW4AjIEO1RdZqNypZ/U?=
 =?us-ascii?Q?Vr6TAsLb9pNpiU20cmEHSJws43zIp2TFoHh+MbfBtO3FQ5cKFHm5XxeZduZS?=
 =?us-ascii?Q?osaDQ1Quimsz+FK1/E9lTdLhfjuQZw3ddTLIEWWF38pVPzKNAsNGI1E91pYQ?=
 =?us-ascii?Q?89YJ1lA+Xm4M98i34Omm+puUy+/F6oxhN5fXE3ukb94Tj2eOfBVYvF5xRdRs?=
 =?us-ascii?Q?buWXZCScBiH6CYa8Coguzi3S4mRyrvDTSJjWCXTVUEomOiDAP5EwVmEuq7xC?=
 =?us-ascii?Q?m51pTTJMYVx/ZhOgMh9I/Vb6cw+zGuW00/CqKSqtgOK9Yg+xftsKwmw0sw5f?=
 =?us-ascii?Q?caTYwbYtksLc6scoImiMfH2FufPDwOGTsPFKgtUgNGq8mx9Dq5UFzaMMtjDr?=
 =?us-ascii?Q?GWvJAAZucca298FAcSn1RyG8P7jLwhCPfm9nbTKPJi7R4YYS0eeN5s9ntcmq?=
 =?us-ascii?Q?3aB5uVaAREcQvZzEr5NqbHpSt59LXHv9x2+hx3XuNS8QDdRAtfMcL5Kx/RQp?=
 =?us-ascii?Q?qWiE6d2//8DMZSdTTs00HFF1Wb5MEhQdmb5kHIzcf+KxaN57IM1kAT0jQWb4?=
 =?us-ascii?Q?l7GPOBsgCzq1iNJYF32CPJlXMwfhedJ5mrws8W2YaMN6DqwLI/TanR7lk5yJ?=
 =?us-ascii?Q?cJhuJoqVMAJnDfzj6ZjZrfzBJU9Tpw8TMcLL+3l9RBvj6WwtSnU9ShScJZQX?=
 =?us-ascii?Q?BqL1sJAbPg/UYVzWkIVapawAhduys1BwlW4VXZT2zOnEWyeX0EYdiWRJK0oZ?=
 =?us-ascii?Q?AdxccIPbFkCHKiTXdpkBy2+VccI7M87VXTGyVhv9ezkl9N5w22xMauozf7yT?=
 =?us-ascii?Q?x1EgS4J+pyBx3//Me5boASI1aRjDd7lg+3j84YF5PDndSbZJu98JyKb52fIl?=
 =?us-ascii?Q?vGDx+LcNFuT+/UxCj992KQyythB4R7+hr5OznmuFkMfpxj+g1G/Xo0abLWZr?=
 =?us-ascii?Q?mw3jY50bSJZFfQgRH9+oAAZXes/6hEB2ExXkMWrktPSTGPxXe2nHG4T+ownu?=
 =?us-ascii?Q?obyQNQs3+g6SFn+jG8l62d/V1n+FcqO/BwJc4AifFoZDEbnMotXUUMe1qQe3?=
 =?us-ascii?Q?oRpwiqsFotYIGlc2daZ8tPXDM4UxedukyaUHegGSIEFQ47lxFcWwxR2/NcEx?=
 =?us-ascii?Q?udhN0CiuFugYcl6+JL6/JEkSDlv+EjHQnKoYpvSe?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3b18c1-0223-4b48-ce23-08dbe6254a89
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6475.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 21:53:24.7071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cf2GPtTTJ0xYZZQK5JDzaUwTX4JS0apF2wF5ZYd3qAuq6Qzx5+AHRI6/HyWZeK0my2ATldyXXiMDbvwN1ApvvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8887
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 21:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190744

As curl-native needs CA bundle for establishing secure connection,
its installation is required in native environment.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 .../recipes-support/ca-certificates/ca-certificates_20211016.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20211016.=
bb b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
index 99abe60613..0d55bae845 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
@@ -86,4 +86,6 @@ RDEPENDS:${PN}:append:class-target =3D " openssl-bin open=
ssl"
 RDEPENDS:${PN}:append:class-native =3D " openssl-native"
 RDEPENDS:${PN}:append:class-nativesdk =3D " nativesdk-openssl-bin nativesd=
k-openssl"
=20
+SYSROOT_DIRS_NATIVE +=3D "${sysconfdir}/ssl/certs"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.42.1


