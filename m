Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02054C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:14 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web08.6874.1637765286114657847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=AlHPbJMZ;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fq6O1lTHIBjkSyv/cmRk4FOne5K9BX0aOSb0n2TRS7u5O12TweVoHErSynwC8GDqqV6D1v8B+8jXKhBa27vY/XEBsBjJxAUahq71S3TtDDOUFqmVfv4PlLvHGPJbg92h5vCQE2Dx8+t4wsLeWWfRhOc97KamdpqVT2OpKs27QeUFjpyyWrOlqxISooZG3TeTqdxIoQh6FPqDFCyrtNFTjdvFkkecuO4bri6tp29aGnhbqkvFAam4+vQWMlPMVKgvYEeFveFj1HPM2sk/SMwRQrWnFiGoyWY5jSItIlb75DnlAvugIokiqMUJ1wjtB8ASGqXc6/OGrAvZHPkX8yM0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl8FGDsnZ5eFoZPDxQktpmK95u2QA25fQp3jylggMQQ=;
 b=gMoB8jhwE/Ro6T0qJex5iwI3LsXkzoaHtuhzqZt4vt8MLWcFaKcyi95YOX1NZ2TaR9Tv3eXuXSfb+z3d1DcUCCyT9x3OA5ZeHoXhX/SuR84cMt9iinxMyUJKfcZaxBm0wBj001vc/NrDUUwnJ0K6x80IAh1h0vfAhcCuMuwcTsT2ZjreABJrM62GAo1o/brT0AsA5c//EJvxotvPBn7l9oXXBTrMUUoRyVS7/IKeSuq7xCUvNsigm6Ldy8EDQWd6OB6kNnaW7CEa0OfLbnYrGYShlNv/Wh692Nbf1Bj6fx/ClEhQBWmCUCH4Werfn5MopDpqG36VnrUbSCW8vQz1IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl8FGDsnZ5eFoZPDxQktpmK95u2QA25fQp3jylggMQQ=;
 b=AlHPbJMZ4P3IjjSx/kbggbqv4+eIXpRsaUirlPxZgT6C4nDkPypjgu1QDMvakRr0CWyvRX4FwWwDEjtcqXMx0LiUUJR+whKXL0bVIq1lCJ4T6ATxGaBZ3E5lD4ZZfY/JMcHb3NNn2udT92hSWcixlEIVpMOIr63X5rpMEwDLhXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6447.eurprd08.prod.outlook.com (2603:10a6:102:de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 14:48:05 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:05 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 03/15] externalsrc: Remove subsequent slash from B
Date: Wed, 24 Nov 2021 15:47:27 +0100
Message-ID: <20211124144739.2250-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3c53cf5-b426-4941-7eca-08d9af596bdd
X-MS-TrafficTypeDiagnostic: PAXPR08MB6447:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB64473C32D02BAC75205E4942D7619@PAXPR08MB6447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PUncMgsd384lCJrPtbs85QO39u8eWtKcBylSWdme6OiUSiOzIcW+H9jGACSvw8Ypf5JbMHnGHJ4Umc/X8KgDk3zNYE1YdaQ0KE4apgMWu5TBjNn514yFT/2jvoWxITktWh8V+NlQSdMqWeppXe0fx3bJ7IUWcqax6g/De3NkmrQYW/NQoPrFZEo3juX37mvh+2IS9/r9uA6nvb08NODooatBuYoI/T4nqVhlpqXXbMLQL20gkenmHVnJGd3qoWCNvIOSXy6hDLBnS7XJv1xhwdCg8gtbvdRgbUTmFHdZ9PwXCMFNL5wVVfg/QcQQFm+bTB4ux9fLPoSQlKSwkGUnKXMYYCnQog6eMqdqwklCWmIUmLtJQHpD6HaRicGQHpb8aDbUbnjUbS5ox340H1TG5k3qGkLOlJIxAnSFUMSWz4KH3Wh70PVZ9a4hiMSuZMfHj/syjhs6ihxg0B6lXGU58u8jw2AYQhjKEic9QIQ/kzVSTfQ5HAr/1WJbJcHkMdORIo3NweQFgBcQHJPuMGm6PYD4LGwZ+iDPCfTrNaW70uzRYWCrwg+/1hpj5RpVbhcGEYEzaWcrjyZcALPC/FOjJ7MptzVIHW0kryqUaQ/CWD8Y6GHDTf2knM9SexL5G1hvrBBJ6qH/kpw6ANsEVJrm0qskZsz5x+QImUmmTAU9jmGAdAztrSpfOYXi0AMd3+dFaQ4t8XtA0f1LU7CGEt+U+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(7696005)(38100700002)(38350700002)(52116002)(110136005)(2616005)(956004)(66476007)(66556008)(4326008)(66946007)(36756003)(83380400001)(186003)(4744005)(26005)(316002)(8676002)(8936002)(86362001)(5660300002)(107886003)(2906002)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lp9lPpMiijSyUn2VBw+3diQtEMfgm7ID6X+MtmBdCuqL737ETE+uBIucHs8c?=
 =?us-ascii?Q?bU/5YRsi3FRWiR5t6+QQ8M1lokdZEYzXbIvyiGccyl/D6MBYUuQ8nAjBtkGv?=
 =?us-ascii?Q?shG/I8f44y5N/s86Wz6BY57FxmB/JBtPEdf/GwP0d+PWDUPb79HWGCd82wLL?=
 =?us-ascii?Q?mwxPZQHFZHzDBuDQr0lwAP9BUT3xZp6yGtRY/Qj9T3CEuoc3BgRWoamBNiw/?=
 =?us-ascii?Q?xT4FQn6jWZsxuQEPfV6RBk5nZgrgN7HIXHE25u03h6ss0f7fK5fbPf6QSj6P?=
 =?us-ascii?Q?t+Kvy8yE2ZxEmvN4vDveYoaKtQ6VLiJbc+X6BCHaxbE2zOfl0ROgVciQMVrm?=
 =?us-ascii?Q?LxGfo5s9C9JRqhErbX5t8DJ7seYdKYY6dUxt7VjaHQehQYlZQs42LCqytf5+?=
 =?us-ascii?Q?PDLOxQgv36Wo9OPzoKNUTmeBEuBVoEFxkVASLRu7/pJq4vt+4hiZ762ema3u?=
 =?us-ascii?Q?C/vGdNYPzzuLmyElNSd3MQgpnfYDx5QgrM4AP+ZGPt4rYa/YKTVQkl5ENKWd?=
 =?us-ascii?Q?W9iEpH7HiU8RZWLbz+0sbS6GHPVWo3XcFEZ9ckawk2lpGqYbm3BpSeKAAKKU?=
 =?us-ascii?Q?/ixhkH3KpjQukfn/R+3gY/sc0NgSDIt0MuWtYzqTTu7Jg1xpKXKRfGT3UWEO?=
 =?us-ascii?Q?nfm1dGNReenAmAb621qLvoyiGGHzljcK8inPZepvSv9UQ7QyRBrRkCCxGpOD?=
 =?us-ascii?Q?f0dedLr3TrA6/+gQ1THvJx2BbMK7PKH2PVypsVL8DDjkmd39DqP/k75tlJER?=
 =?us-ascii?Q?b2idlam7KoqvXv7uiuH6l52tep7yaqKJxLtd8sj688fd9bQK0nRVep1Jl5Gi?=
 =?us-ascii?Q?W8tB+JafRcUISGSdt1AgudzX+wK1hKOwar3V94DtwFAbvDkGFKgM/QeFrG8j?=
 =?us-ascii?Q?hqi0CdLWCsfZlcCHywsChexpl3dfwvV2n0y4eqKvK2FeJkIYwhYHgr5dIEn6?=
 =?us-ascii?Q?pZxQZOtMWT8hEz0IgcL91dgnrK4J4vpOtZiCW/tBcPu/3mKwNmUu8qSwvRxc?=
 =?us-ascii?Q?kvOdEIKNL/8I1cGQFpbkcRzVYVxYR/GWhwZwJitGRRVilIoX2Lj9O5WAN+1S?=
 =?us-ascii?Q?qg1B7h6WHkbnPJBY+ATp2Vkm5xPiwXzYKyuPglI/iYlBTE0SsJK8RfNX6Bp+?=
 =?us-ascii?Q?jP9iuklOuu89NFq/WolTNVZy+mb3f0VdPiuhQhg7ANueNTE/fnXveMqIOvqL?=
 =?us-ascii?Q?Q4I/6K/7qPktzbH9H4XDrU22sDI3Vjv9QTDL00OnxfbCurp+hy16SngfIzqb?=
 =?us-ascii?Q?hFVyxYFnb6dgRmibSSm60KlBOlppc/LWB03ZGEwmXWUpo0IjewIR0OatpP1Q?=
 =?us-ascii?Q?SL30hISGUgtYyBGIY3bBadCLrF4Xy/bx+6nUl7FBWETobDY0pV1pb55ZCfTc?=
 =?us-ascii?Q?sRbsB2oZeaIfZpqq7FL6fsCuzYN0DnM4pdjjYtShEtdy7Po5Vb5aycP+/II/?=
 =?us-ascii?Q?+ZJpp70deG5j0IChlwXs5/PiHIYXes1z5fe0R4e9uJACNIdA1FtwAMtFiW/A?=
 =?us-ascii?Q?5EFVGkC5G2i1W9gyfMKG42+wMZqKXlEzUQwv0sfVdeh33e9mB6t8Mes4zpkx?=
 =?us-ascii?Q?ogYbVBvOPMfG/mxLMXc4hiF6LSwuArcU/+tgwC55PqIdB9RZVS4IIz8Df/yl?=
 =?us-ascii?Q?FCv7L/WWk5Y/urMnRzS8Lbs=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b3c53cf5-b426-4941-7eca-08d9af596bdd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:05.1152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Jv64QgbSXm86wEn8QvtNAhOTLoo4MUQf1MatTfjXKXXKRI5uuCGPAV2Qmil6M3beTqCMCxqwnY4LbuqeqT0imQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158700

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class
index abfe24bace..959f2d7bc3 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -60,7 +60,7 @@ python () {
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
         else:
-            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
+            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
=20
         local_srcuri =3D []
         fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
--=20
2.20.1


