Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C39C433F5
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 18:50:52 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.70])
 by mx.groups.io with SMTP id smtpd.web09.34727.1636311051744001590
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 10:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=S2zE8QdT;
 spf=pass (domain: nxp.com, ip: 40.107.4.70, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHt+8GpvWc6ktsr2vjvDZ2iqkqQRoWGR28spo+wWWrsK3qdMWT9jFTSNWUtgIN4V7tUUTNWbFXmyVlPf0p71/DmvWlgbLBBFWizTIJPIPXfy443H90tpDjAQstz9pe7ThDtK8OQ1MUIsNAikgbKYoIpiZxQdj/2P+7sLcfuQAvdzwH2yl3Bc6sr8NjNqlS5oE4h4DxFAtUdwXbV3Nd7Vw50mhbq/TGT2RuUDQtimrC7n2GUBeJJMyQwKX2Nkhj0+3maiSnhIwrWU0Zqk5ZD0QuGFzO/NQFevCMLg8kZaCQ3H8yo0a7PtytPHs9ln01CfptTbXiFvBaV8Rnxas4zFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERU4kPVsIcZ2mwnlBDM0haQCe4wT7MVW0AMB3WYfbaY=;
 b=dzE55jiPXg1gFXBS/e9q2UJ46lwLzqapfuodK5Y2FloMKoxuI7MQ3SyEQjjd89oUycaYvSD+aAl+fq9zlHxTqPSGInhKK+nB9oc/LawUz9OIgKbPsQHHZSqt/glkXIhplpZ17iyuVchEwNj5rYivXZGOB6CKbjHJv0zRZXbUrH/QqTJa7dwyTkpEKg1sd7mbeEJW0DzNc0uoKGVs4sd1nNRl79xhLp9R0YfkZrHUaICup4Zp2rwU7kN6p8CgxW3FwuQeN23R4JBQ1u17lbVIJSDal8yOscwxxQ5MdbuuLcMakt+dZ6ifa4j4UWiC+qBkiagMNWPoPw4bK6UdIREeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERU4kPVsIcZ2mwnlBDM0haQCe4wT7MVW0AMB3WYfbaY=;
 b=S2zE8QdTNHsh6lXJYng32XbxhC54KyZrgsKTP75ZqaSAIEVBFQSKEN+3LNGP9uKl5ZCwb7BVCdxiqL8S/1i9PbJcj15aNFieyxFvMfM86yN5334pQbURoXpDNzbwypKZuWz5NXl7AXZOLnUOSfqmLSdmVg9XDJo/44fQRnjjsOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB8PR04MB6890.eurprd04.prod.outlook.com (2603:10a6:10:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Sun, 7 Nov
 2021 18:50:50 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a%3]) with mapi id 15.20.4669.016; Sun, 7 Nov 2021
 18:50:50 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH v2 2/3] nativesdk-packagegroup-sdk-host.bb: Update host tools
 for wayland
Date: Sun,  7 Nov 2021 12:50:15 -0600
Message-Id: <20211107185016.28794-2-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211107185016.28794-1-tom.hochstein@nxp.com>
References: <20211107185016.28794-1-tom.hochstein@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To DBBPR04MB7753.eurprd04.prod.outlook.com
 (2603:10a6:10:1e1::5)
MIME-Version: 1.0
Received: from lsv07069.swis.us-cdc01.nxp.com (192.88.158.246) by
 SJ0PR05CA0068.namprd05.prod.outlook.com (2603:10b6:a03:332::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.8 via Frontend
 Transport; Sun, 7 Nov 2021 18:50:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 013ae9bc-3ff9-4d47-74c4-08d9a21f8459
X-MS-TrafficTypeDiagnostic: DB8PR04MB6890:
X-Microsoft-Antispam-PRVS: 
	<DB8PR04MB68906D3EA571DF0E2C01AD8DE2909@DB8PR04MB6890.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zel2zScEvV6ceapmn+dQrPFQifhAsy3eZHRwmaSIrlJLA/8THtvGF8qcJCu5OoPBG5SZgwnHsb/rm7IX20NU99HJnMLhZfRx2IUbn0DnP0qtHaozm5mD4iGdCKDTAjwh+qi/AIlMFbqASu99L2z2PclMr2BhNJdpjZi4jih6E2PuEI+mHvkk4aXa7PcG69acbr9b/E4f5IrOEU80NCFyu5y5cQ3BgoAhKa2nERAUMhbTWm7QV2CNCFLfU+DyeEmOxPGV/gb5DZyWpS2UTl952fPvfKdSgzMZK6bkL94CGmSjXBu1SVjbBe1h0/Rk4RBsmfexXKxMnARK7l9e2kfl8YrXRjnJkSQvlFPzXHnoF5jD/UD+hJp8f4TzWlBja+ds4EP1I1/h8qqGMcrkxCNl0MJNCNx2IPypImyAx1DMy+uvbR5YiGZcmvt8m3nJl8U9+LinEK5UO4AnW+ooU9jC3QPLXimLsGdHPPuLF+0ufB9CfcLfpftdyhq0k0Fe7kJZHxRcoZbie8Ehaf/D/dNTmLOMfd/UdFXuHDrOLiC3MS8Dg6ZoViTUKf3Z2Qy96ISOLezlmy1ncOhlvK1Nvg+XFA7RaHfo1QgELXn98K59Dr3iKOuiAz0arjGCo5P1eaf+Q7CDVYMJZTBhkplaLoilIYX2QIbVmqodiT+gKugUAqu1Ej/En2vBP/EbxreR4jjli+ST9RNcsd8M4c2zytiUsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6486002)(6916009)(52116002)(38100700002)(38350700002)(26005)(6666004)(186003)(66946007)(66556008)(66476007)(36756003)(44832011)(83380400001)(86362001)(8936002)(956004)(1076003)(8676002)(508600001)(2616005)(2906002)(15650500001)(316002)(7696005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kDxe+UHemPNgKCGPoz3X0oypdYCEjzwoKSCLqOBBvOxnFMec28YuD8qoRCwI?=
 =?us-ascii?Q?RwwX8MX8vBXxHtE9rH+2b4q2nRBdx1KSe3EplDxXqUZG6RqEWQ435dlFAeV5?=
 =?us-ascii?Q?MnLiJc3FGz6Japd71T+bqGI8E1hqRuD/H0pG2doYh74ScCxPzn/C8VPOZ1YQ?=
 =?us-ascii?Q?FvgcZq5tW6wkP9A0q54PKjNAaiX35xWOAOaX+Bmh5/WewHpZH6a7YCNBX9K8?=
 =?us-ascii?Q?blflRq5zuuV6JnPQjpCRyZ+vVIHBtYp3Dd8hfeIvGGuewUfpWGjiOb0Dmw5Q?=
 =?us-ascii?Q?UAleVeUpL9jf7TFdtWFnlqUOJxxbMspnkYtWspWH9AuZHKNBX8ABRPFSBnwx?=
 =?us-ascii?Q?dN3K3TmkTIEe44FctFF1wtTzPYdiGYdj1PO6CHwjpJlDV2mUoc2MQ6mDP/v8?=
 =?us-ascii?Q?JuWmpDuUp8pYpKoGbK4wWTxDgoZ8O7dJDLqSw8JTeif86TUvoI4Pd0n1BrKd?=
 =?us-ascii?Q?8ZA2uEUpcpAbU40TWzeqeHpo+NKT/Siym01gkPmeZoz+nOH4Gouk6abu7yVH?=
 =?us-ascii?Q?VyFHT5B7ZRg1nJJozV7+LfztHAbNVUtiktveWjmDde25dJ7S3FkKo2xIQJoL?=
 =?us-ascii?Q?4bSdNi+c+eYDnotVanCcvOikw3ou/M+MWPrh7DHKvqojaSadlUzMqWtDDupg?=
 =?us-ascii?Q?ipsO8rBSxV0oDBnUmnU0YoZcLDwKKVtTikh+wPQKirDleTEqU7bMvdV+KWeg?=
 =?us-ascii?Q?+o06skITZc3ZGKYvtgXj4mAxvTTXge7+Qw0bM+QMUeMWnwnasraK2Eup5W5W?=
 =?us-ascii?Q?K5tGhyRaeas/ODRex+vtxaLFY23ZYA35Pyn6hGwwZOxXJkbiP8+ErsY2XIln?=
 =?us-ascii?Q?J307ytMJ0yzmBeRjcj7ZgVVgjn3DtSGhPjd9acxyydRbYZHlhNW02hP0xR/s?=
 =?us-ascii?Q?gYzDWIGiV6QEsjTMaLd9yIfw4LODBn1c2PkQFHQLLSadCLxepmYLbez9NI8n?=
 =?us-ascii?Q?uJLfy58f7d7/Yi3pLDwzSm39V8xhXiliUBV1LGekPYpmuH1CGmyug6TS9CcK?=
 =?us-ascii?Q?aELzOLMz5mcEAUMoEZnoT9smVUsgpGUrIMXWnTmxUslZXjR0lpjB03G6q96z?=
 =?us-ascii?Q?GJg/z5eJmMUuFAxzikiEm5sPfGyACYXbFXROGk/tIkCaJjLZZw5y0PyHKAUJ?=
 =?us-ascii?Q?ZUkVV+Y7UfkA0NFtbtjQWeJMWV0zgWO0YpIJjMIi6lMTItzNCopQynyEjoHn?=
 =?us-ascii?Q?8kH9xFxTLiAtwn5BNw368Bs45lLeVeF+7XUxXQLBbMMUmq9CLEUB4UXRoFGH?=
 =?us-ascii?Q?awyp3EO5f/mu/nigR3nN8zlMdB8UkIHAlOUJrqgJAHOKnyYfj3hwfVVNsf5X?=
 =?us-ascii?Q?bPM45zBg/d4p6u11FbOFemW2TQt9SKNR2pOJJkgornWjInpRfbF9iKXaT/DL?=
 =?us-ascii?Q?iu56VzUyr6Kdv2jzgVTGTMZrKy7LqpSQiOP8IEQAf5u1kY0gPD/g7gG8ZC4p?=
 =?us-ascii?Q?J/DyPudDgzS+991LLT0oCiOtnkOyDKUu8kC/pNju3HpdIejExSIdi906uelV?=
 =?us-ascii?Q?iq69/QTyAeNq5c1M0f0IApBSRo9U8C1qtkszWBxr3yv3/bBe3f/pbM+odar2?=
 =?us-ascii?Q?AV5Kv9OR8MPhz0hCYGzRX/k+7iAnCCB2osuNQiH3+BXwOiG1TuHggKiQ+1Cx?=
 =?us-ascii?Q?UXvxMDJZf90KxV9mjVO+ikg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 013ae9bc-3ff9-4d47-74c4-08d9a21f8459
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2021 18:50:50.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1qDhZR8iNd+CNwaSyzunoseRkDjRyIrCw5BqeOKY1t3dzJHNbodxdBPIpC/EGxuF3aQBcI3x0aWfPRhxPwnjTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 18:50:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157959

The wayland-scanner host tool required to build weston is moved to the
wayland-tools package, so update the SDK host tools list accordingly.

Also, the weston build requires wayland-scanner.pc to find wayland-scanner,
so add wayland-dev.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 39e5002bb7..9166a0851f 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -25,7 +25,7 @@ RDEPENDS:${PN} = "\
     nativesdk-makedevs \
     nativesdk-cmake \
     nativesdk-meson \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland-tools nativesdk-wayland-dev', '', d)} \
     nativesdk-sdk-provides-dummy \
     nativesdk-bison \
     nativesdk-flex \
-- 
2.17.1


