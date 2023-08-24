Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AE4C7EE43
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 13:41:26 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.134])
 by mx.groups.io with SMTP id smtpd.web11.10994.1692884476446218037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 06:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=D79YJ4gT;
 spf=pass (domain: prevas.dk, ip: 40.107.7.134, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLDR4HlCIiZwUikQqkMiWQGiUq2MmriQUjbeh5F8Nnium7fcrcnJBHS6EyeRwkCRjH9vfFbPyC7JpFEeDIHrs2IwEOffXqo2ejNqmfz8Uq0rW887jejwjj+2wcd+ygWzvQesmG1YP7wIjip/bK02g1UikEtyYIBXYCJ90+oSXWAYJD6QRGEHycB6COuxHmUxiVOPtkfWiDim1KtygRenQlzrCLm3lIrRpnTqAD9qpKS1HI93yeUkdYsm+uP0aYnYDJjbV/7A3RR3GlS5rRpvakJpTHUsmJnSgtjr3fU8jalHg/G8js0V0NrErUMkhlVU4aNCF8z6UBeaAwBHPWGWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bxep55lbCCEddPQGfaQ9YAwfylU9rSxUUHMVa6EwtA=;
 b=JbR5LtUUBXuyNFGoVL6rDGUweuMdG6IwEsLkzrd/B6drKJC91tcxvfCt34tjt2Xo0vpqNXAlpYULdQ2SA3KkdDBGyMVQ63KfOe0IqGO1qt3/oU6xC5lP1aCjf7DDa1V1LiAJwuzi2i126pr2w5n7dbhSQae5CN5mrcJraZYLadvVvl/viSwra6Z+uzBFNXQGJNhz/4rO9BqzSx1SGnDSCFagwxcW/JgiXyAcpa7pQ7bF1PG2vkXmkBVBCIZWrLEWaITbkxwkqhyFlFY7z7IPo/GTQYw5X9Zb617vbo+bpNlqvED7J7QH91wtMwrxCNU0VOBMAl3Px34o5+OQFxNbjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bxep55lbCCEddPQGfaQ9YAwfylU9rSxUUHMVa6EwtA=;
 b=D79YJ4gT5hcCHBTakmrYSKC7EuRgfCkYbJ23CB1aruraf1aY7vjE8WX/xNzvw/YEz/wd8cuhyseLZSFrJN1rTY4Z7DH/IigA1fpfltci/adQWfkknDk2oCVN6lb49cRON9RTov8/vQ8KRC0HHmLiYgXvI8A7rww4v6oMqMPDlV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1fe::24)
 by GV2PR10MB7534.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Thu, 24 Aug
 2023 13:41:14 +0000
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6]) by DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 13:41:14 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [PATCH 2/3] libxkbcommon: add CVE_PRODUCT
Date: Thu, 24 Aug 2023 15:41:00 +0200
Message-ID: <20230824134101.41906-3-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824134101.41906-1-emkan@prevas.dk>
References: <20230824134101.41906-1-emkan@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0049.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::10) To DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:1fe::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB4571:EE_|GV2PR10MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7d661c-a91d-4f1e-09d4-08dba4a7c8c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XpBm93nmq89QyW8UeU/iRFSlQ/X7dyYQ3i/xAU4cBWXO/Z6hPGCueWujypqqp5hLwCwf6W1ErCjiDhZDUpZq5eNRwz3OIDZhgIrfsm07v7L5rQIPjbHJb/USiCTKnGa4ilCKpTeDfA7Mx9fzSmoXPcUd0H+UVrLPn4gUSsm2hzdFnyKYNwcIl+hA39TVFeMfl+n2wuab1zsJMKY/88pPHnq3/BnJAZmc/m6BVS9bH9lN1Tr1lPVbNYKRs2T7Srvyu0ptCIjIN/N2f7vqWzc0wQ+cBR6ikvxL/ZRKsxIFwb15quOaATDKKY1TFTg+/BsK0U8907LPwcDN6jkDwEw6FJDNTdzaEBq4KkgURs+7b9MWh9+dZxk7jrOGMgki2X56NGkjdCzlfW5xyIm5FUKRvTx0ftmY0Lwh2DM2Cm9IpiEpiDL1HPtp7lO1WZ6P9XN54mstq5kW0sV6FMAect69C5wliLSvP6FwoDVBjEplx4ObZorOgevto0ISoiQrBKRWYNvMjguHCeYHnBYvY1Lriu3mEfzfrqHdRJvf2hsdUdE37WejB8ZA66xgLfcqwjhWPZJZSoVdcXW1akx64ZJnhtWYWZA9IQQ+sv5ddIil45LmQxSYFnZglyWoUFctPWCA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39850400004)(346002)(136003)(186009)(1800799009)(451199024)(36756003)(52116002)(66556008)(41300700001)(66476007)(38350700002)(6916009)(478600001)(38100700002)(66946007)(316002)(6512007)(6666004)(26005)(107886003)(8976002)(6506007)(1076003)(4744005)(4326008)(8676002)(6486002)(2906002)(5660300002)(2616005)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l3rk2+R6CDXyRBwm8K5yROGVZsaEUNVhZ2WEk8vs3SgggBaOs0n+Kdt6IKsy?=
 =?us-ascii?Q?aXpWwhLFkAvMGxlTLSmnaUwjRTto0H44oYZJTYokb7Im0FIZ6oZJbOEIkcWm?=
 =?us-ascii?Q?i/F29ABeGHsLqWfqraV1PA8ZThMoFx5q/SzYggCxD1ytVnogoWt2f79bE+i7?=
 =?us-ascii?Q?wgh1QuEfpHtEQhuZbTISx+2629Kvt77Riwszvs1gX/o8dUwZbz8Hz2vmMAS1?=
 =?us-ascii?Q?UaGtjUByT4Nzrl/YGGoicxJCSzHkgTF4BnKnutZAnESEgjMQBGzXTCW09/YU?=
 =?us-ascii?Q?zoKexcZ2+e99z95sGqZWQFN2C9oMNeZUSWPPqf7BNvo05J3ByXQuK2x65Xnf?=
 =?us-ascii?Q?ysjrJizP7wp15IuPi8LUbsjE+DswJN+RhjkijS2Bxt+7irxCabsCwZ5hXfaO?=
 =?us-ascii?Q?IcfUyazqikEIQ59e093Du6xduGiTfN5UcMh1AEeDQ6ffLi93iebq0s2IlMCx?=
 =?us-ascii?Q?9GKx3UcLZmu9ptRIfHIHBFz5mX3F0WAbNcNovxbwPksnL+pKwoKPa/5p0X4s?=
 =?us-ascii?Q?738Ep7pW7P3eJOtGu94P7ATRVmrNmhiy+viXgOWdUcgENWQUNvophxYISjGj?=
 =?us-ascii?Q?E+d0XPlLr731E7AaLHPNrMZlzP7Tt2SFQDo5pmLVAiXYyv2n70b8OkRN8si6?=
 =?us-ascii?Q?iCMD1tqxj76vw6Dt23x7bhR+AR34eWCZfQuk9yuFZdGURWG+uggL51NE2ltr?=
 =?us-ascii?Q?Vz5nbclHppcq0e6qssersvGgWIosksHtPVPl7CAu9VlYpg7gsd0BefDlIuev?=
 =?us-ascii?Q?pcPg7pJ9Qauw3CF5KBxHdckWczV9wJefMt7tlk4N6drG5alj/gMseGNQ2yrF?=
 =?us-ascii?Q?QAZOEudchEZnAxdC6I1er5VCMhaGS6rhZypNkYYT7EYaVnBYC+7ZdncOC3lB?=
 =?us-ascii?Q?pV5uiGvtT4uxUPvxxcyIXzc8DESAnYh/6TFeh38zvIq6KnoL/aLN+fWOqNzy?=
 =?us-ascii?Q?Y8/1ZV2ob7n/M4KGA+DskPASTPzWloNR07SLlXoSdt8SElF49HeRf1wxePxa?=
 =?us-ascii?Q?w2layOWad2EdypXi3COcaKOa0CGFJlXPhrGKgJpimj0xJDx6L26CmF/LAgPJ?=
 =?us-ascii?Q?Ub1g595l63zH4+IEx3x4s7q05hKChAkXAHBNxkSvlt8JgTKAKO74T++iCdj5?=
 =?us-ascii?Q?3COsE3C9YDaMhe6zeZHZwifR+L+733v0q2SP7atxTjs+SwxgEjIGHxh63fnO?=
 =?us-ascii?Q?M/maAViWNopZ/9XW4Zjn9DEJvqrj0Sxws5KOhsilUf6yPvBWRA0T6zHkLUTQ?=
 =?us-ascii?Q?WA6nlAKBXaHK21qLJ90y7GX9O7+DuNcjVWr/uSsMDWxHg0DuvjAn3eT/5jhD?=
 =?us-ascii?Q?GvZ8urnFHAaVFXjmOf2ub5KOtbVUz4qh3vaB1jbHbP5xZ4jmtwdcwapsd17A?=
 =?us-ascii?Q?db2nJg6rq9K6x5JEBd+iaEZX2sH7GXevtEcioskAzsTj87hPxlHvtZBatuvI?=
 =?us-ascii?Q?728xqTN0Op1ZhOQYsE7yOam1fRRWkmh/JwX1TkpRozbBiwAq0janCTexRRlD?=
 =?us-ascii?Q?eciD2czHoNwHwnGZe64QVEv4Iw/OA9XjIUOizkyCVYNkNhD3iaWzDwek+qov?=
 =?us-ascii?Q?6KFtANtNZwzR2zCWX+UG+D46NsyZ28cxHzb0VrB0GJ2W/1NCD7PCwTbBeKln?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7d661c-a91d-4f1e-09d4-08dba4a7c8c1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 13:41:13.9346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL7rtO52lot4qbHGSnriY6Ds09+60VxIs0KyAaodnaxFbr6rVbSy8euViw0u2ebQIFuFx/8/5RNpMM4rt5B9LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7534
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186661

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb b/meta/re=
cipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
index 01966c8973..62e9b158e4 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
@@ -36,3 +36,5 @@ python populate_packages:prepend () {
 RDEPENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11=
-locale', 'libx11-compose-data', d)}"
=20
 BBCLASSEXTEND +=3D "native"
+
+CVE_PRODUCT +=3D "xkbcommon:libxkbcommon"
--=20
2.41.0


