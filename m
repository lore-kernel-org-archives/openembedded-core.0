Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7A7C0015E
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 20:56:20 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.42])
 by mx.groups.io with SMTP id smtpd.web10.13777.1690059370641442747
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 13:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=Cvy0j/k/;
 spf=pass (domain: welotec.com, ip: 40.107.15.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezpWP99yVdrQtHR9xZLThRbdRJ0GZ8JpjQZ6DO3p+AoO39xR7VtCXEAM+hMXOCz9gnIJx8Zj8ZccyyWoTy+5q+Ypr9jvcwkzoQuip3uB/fM7uBfw+KYE03QU+V29BCVyBdBqoOmeIKY+sp9P8OYfu9pHBAtn2sLe7SWbxpGZjC6FT+kiI4OpqjQLmdzCyLXhhhjp73oopUh4DEJCh9wsrbpOpnpg5L/9oeamUB0galUSEfFQikxLQ9knx8kRo914pOg2ehtjMB+kybA/UUjy0IpeqUzcWYSpBIkUZT8hfogidilWT78gNFfN3syEcKFO8aYyYPCGieRc+6zFUQp5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=ODBkTmzN35eQJmaO7lp3Vx6Fu6Oz0QSQt1zcHJooLcXRhiE6YjxkedhZvYNCpROJLFuVGsrO+Kc0OLucH9snr4BlXz3IxWUGr1dwUX84IW9RlPaWvs2G9gWLpUtcq35qrFmBkn0aiP5oHZEHZkMkjI2zkFclxgFtYCXDP/WCPVCmyd1ZpjSKNeqg1FS4x81ii9F9iCzSAqHyj7/mCUFJarSmRNvYcTHJCVplY05QSI94SysK20UJyIhIwTOSGSPKYU4pq82rTmHir9U4842kKuskI54lh+XJiqQqkt8bpqPmjYxhOx03MpW9F9C/Y9HcVRIaut32pVbeaFwaAMNBhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m/0dvvqXg3Wj8yTZTDEa3xc1tO3vwBVgyQA18gnN6k=;
 b=Cvy0j/k/Ad8jD8SxRQq8hS4lppYNubxPt+hn13aTQ3SWRaDk12RssExAh52HfW5dMwRuoEs++6skREcGRB6nob1Au+7Ns/2Wez738g9pIqqC1M49g8N9HVflyKiHiLq3J+7+yz5PAptzu8uKZMTQEAaMyNLQGh7iTm/01jH4vKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Sat, 22 Jul
 2023 20:56:07 +0000
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53]) by AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53%7]) with mapi id 15.20.6609.030; Sat, 22 Jul 2023
 20:56:07 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
Date: Sat, 22 Jul 2023 22:55:51 +0200
Message-ID: <20230722205555.2487992-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::7) To AM6PR04MB5368.eurprd04.prod.outlook.com
 (2603:10a6:20b:9c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5368:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 947cc559-8789-4ae7-252e-08db8af611cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BOyzMh7BPY1dl2Ce6riUU7tc1DQlmbIeNiRjVJAFKNFha3y1KkULlS/U8EgkjaBNGZYgXig4JxWFamq9+R/2fJus8Jgl51GEryVZ12BVp9F9zC8WAhS9GavmGKych5LJJF2DGzNeNdCkXxzic30Sr89BCGdftFSnY8mYfSTLPqg3FIQtEnL4GMnlNe6eeFylvM4s4JppP3lzqw7wepYEK35+3tIW6xeuW1LaMVrSXvfBYcZHdLZ2h+DfPkWUejpuqfT84ZG/VRjwmQOa0KnfGFT4Vn2avNkzlKVYH/I+8tptOaLItCBikFa2Ht0d+BhhudwDvknMx3MBSQ+unZV6NXJkteOuXCZwe4+6NUBR/IerPogWyrCBGApGgjPTdCb/1q/lJtKFf1GAGxGpayYHnEOXWVaJ2uRprhT03fjZFfxUheyKfJ5oil+PMpMvDu9pszDXa2kw9lMfJJyMGa6RMlcemNPe/OTH5+sNZ7DjHbLTObKCPBjTyuLZ6ObHNLBtcW3Di8OVW+B6nfC/EVq7tFb+xrThH2XvMb0RNU15l5T3jmQsg2avxrjMZ06MRfdINMHvFY7dFgNKcG1LdUbdhxi1dHiv6hREQ3XrULbS/78=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5368.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39830400003)(136003)(366004)(451199021)(6512007)(966005)(6486002)(52116002)(6666004)(478600001)(186003)(2616005)(6506007)(1076003)(26005)(107886003)(2906002)(316002)(41300700001)(66556008)(66476007)(6916009)(4326008)(5660300002)(8676002)(8936002)(66946007)(38350700002)(38100700002)(36756003)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?En/YLTlDWu0IsCBPHn+3yB2hbxG9tNvqlBwj5wKaVMneYTHtDlFwTJCeowEY?=
 =?us-ascii?Q?C9KGPig7rT6F6CzCdHMmc90Qw4HKdeidrxisvv/6UD5SLMOq5jRLVcAyPUN4?=
 =?us-ascii?Q?0bSZEUlJSWB119q1pDS5haKQPBXlPwCtivMHO+PARkupe9eXyKz/rHBKvgpG?=
 =?us-ascii?Q?9dFxAUmIAsqQCk8TevPU2jwPoRLXH3Le0oHAGfpR0slrHjWNRGz6iUkkgGoC?=
 =?us-ascii?Q?5enz1rIvNpuTSUDZ897fcLR/VcoguxeayC+fTGpBJ+5FuF/vo2Mnf2vlelcR?=
 =?us-ascii?Q?+jRQdmoOItGBzYNwOrhfgxl3Nx/ikqkoezcyTBWT5SuP0LVrPLhAOM7UgT6u?=
 =?us-ascii?Q?O6SOmC90AXJvtZJbLt6dRow/2xnNCGOWAFHJcB5eE3QJR/xEJI+6vaIxarr1?=
 =?us-ascii?Q?8Lkr6J5xdB1MQonVB/EQlB5NchFQ/aXFWsp+MmIO4k7teWASxyroEokKKESu?=
 =?us-ascii?Q?jXaH3mJgcpj5J4+u6IyxrSc4YLPlPkb+tgwXs1M38BcHT4ZMUsTuwNX+kLRg?=
 =?us-ascii?Q?EecGcNkJ5cI/CH02ptwYNE3+x3xACJc/pq0GMir9tmQ/no9jxcX8jj0sk+Yu?=
 =?us-ascii?Q?RPzi12LJJF98GhOXmQPD/E8ksU/ZgG1g4UvER6G+iF0oL8TCCJYrQ5TE4g+d?=
 =?us-ascii?Q?tpyFzJUwHORHRPPPaAdnjFIly4EanECr+jSULg+jbYCowekqvovGPNaFrI+L?=
 =?us-ascii?Q?yAGfcjd/tkQHMzIer1vSoMb+Sd3L/484XDdcPfUvHHt3Fy3vAbYV3sKwVYyE?=
 =?us-ascii?Q?gPPetA0GMESIC3sgseTTPiKWCNMTfyltJN3HUAwzVggLLcR+B5xH/K7x6mV2?=
 =?us-ascii?Q?0b7eaQpCgDyBm78m8VBTzvUEaxa5K1vIHIx1yAiReXNMNWRkaRGBx55F58sG?=
 =?us-ascii?Q?hoBTgz/Ys7tv/KtZGqLY7ySRb79CmQ24B2dn0zQi5dDCbN9Gg9ChvLs/8Gcu?=
 =?us-ascii?Q?pGzt6omVkFtMThYhXWWtoWWK5HNNnvXkm6F6IWgvcLH7HcyQDP90xIB9hdn6?=
 =?us-ascii?Q?aiDQJXMM8AxV0VIS0f/GNWKvG9TvspomNJpgyOqDHZclPxjD58/HdapcB5Np?=
 =?us-ascii?Q?fK2DHzV3Id9I/pRGY4Q7HKp1Rj7eq+kT/+MOFwcVsi+Lpr2fvCST9lJbU9Uw?=
 =?us-ascii?Q?b18PQ34OTkCP47DrJI10xwyTBYf0oAXYVdLL9PJ0JLo90bh+i8ZlDKQAS019?=
 =?us-ascii?Q?A7mx5lUAgB6NGJNHNtTzNu3H0wqKa1kXczORzrc6ItrIM3z210kGo1p/QXTX?=
 =?us-ascii?Q?oiYbazfWOvUa03CY5SlamoVSwH8vw+kZVFtpPLhgJOiMXi1fvKReV82VNqit?=
 =?us-ascii?Q?/upn+6n3UxfPwypDLog4zslNXWPvN0BaNazZi9/tD/XG1h66+ZLHr2a0TzO/?=
 =?us-ascii?Q?hIpDeQLT3IytIidGCJgkLMjO+a4tupc6WkR5CngjgLjfHFLqsoc+h+B/7GMI?=
 =?us-ascii?Q?Hb640lwhgDofZayPkBWyptjjaSTchh6o8/qG65s9jF8uquNEFmsH7bd0NBIe?=
 =?us-ascii?Q?6YiS3kpeiPqjivDuy+nUHBRByEyuZQSVqsmFhp2WEpal16WqpB/NXnL2Ik8L?=
 =?us-ascii?Q?jspBFEHSPA8oKG8pCW1D2GJ+g4eOM5Jef8hZs9a8?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 947cc559-8789-4ae7-252e-08db8af611cb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5368.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2023 20:56:07.0217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xh2dSeJX81uEuOQrkti0Yy49GJCLtGv31HOlgHdtDlF2uyAo7F+yV+E5K1QleShxb2o0sMJx6gKOtzBCzbZ4ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 20:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184735

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..a0f106e4ad 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.34.1


