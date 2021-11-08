Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D47C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 22:51:00 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.72])
 by mx.groups.io with SMTP id smtpd.web11.4163.1636411858422932858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 14:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=UpMjB4ac;
 spf=pass (domain: nxp.com, ip: 40.107.14.72, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQr3/xcr2eXkuyM0BOe18GSA982kpuSsKFADZQZ38jQOgvq8noWrnse6GIfUlYVJI2xN0lNMExTX6rPrjHLFTKzSjjDWTjjZS7tXh6fyQCIYvhYqCtWZAbgvHqvgxLzCkUGkicvHz1Uc5hD+0c1p8gR62BUSuTOovm8HXcXk7jh1WjJF8XuUXh6hQki5npzmBerQI2/tRLXbkGelsiLVhnoxLFArjTDJnjG3QEJUtoeR6cmS+kHesV4P7CMBCqhkabGqVrEc+z5h79zH70ZEeDgGMWh90LeIXooRx8K06UkLFe6tKBcqjUyhQ4OuI+X7l9SAVmYG7jZ2CtKpNyTyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Fnjp1z9g/IzfmECbkVBdYKN5hV3uh+nvIvqNv6ueeo=;
 b=eL1916xOCxhXkSoGQ0AnrDxuGz3egCg6jkcc4wrRPsDsi5AAa9exiS232wqS+/LDurOzlPCEGhA92FQ3AmA3G/UTSD6h8wF6TA4AOmJS2Pqzw7LY+I/jDdB717sVq/GyOn+qCTPyb/YolrV2nWs/Zm/a5O4KDP0qoFQkzkwINAQq7v7nV39aBFaW3sHIfIi1bpyGU75kUQotE59v8RONkgbobtJ6aXkbzxFeDRY8bQXr0jDbiH+weFcnUo7Oepo3ZUzqb5I3lLq0J5TU9CeJNCfieRlkY0RArhMDx924BYgXZfmSPMKYxy3gsRchBa2R4gkqwWHiMoJc7snZTFEDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Fnjp1z9g/IzfmECbkVBdYKN5hV3uh+nvIvqNv6ueeo=;
 b=UpMjB4ac/WK77FLiWPlgm0U2PyzGseOrT0TKYms0TrXBVQaWkBl409LLiJ2hQ33qORIaNrGMgQGzDw8yXxZElwE0etxzwzrFAABeqI2qjG8oO4Or/UrUK31eRfIM4CpnNZZ0ebz+ioISol+CrDlX4vab6mJutT2KHwoS1xhATvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB6PR0401MB2661.eurprd04.prod.outlook.com (2603:10a6:4:3a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 22:50:56 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 22:50:56 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [honister][PATCH 3/3] bitbake.conf: Use wayland distro feature for
 native builds
Date: Mon,  8 Nov 2021 16:50:11 -0600
Message-Id: <20211108225011.24741-3-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108225011.24741-1-tom.hochstein@nxp.com>
References: <20211108225011.24741-1-tom.hochstein@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To DBBPR04MB7753.eurprd04.prod.outlook.com
 (2603:10a6:10:1e1::5)
MIME-Version: 1.0
Received: from lsv07069.swis.us-cdc01.nxp.com (192.88.158.246) by
 SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 22:50:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea9328e2-4e20-4c13-2d58-08d9a30a397e
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2661:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0401MB26616C289CF62C8ED125C910E2919@DB6PR0401MB2661.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OdJe/8uf/8XD8kuDSx+wt31tfwRKDWZ2ZpNU1nYhePZQ8d3R8IXWQse/FbrcSE6ws2ZUlx4deN361yjHUzlElyFXpQNMznB76It8JUseGDOHf78O4qzY4VTZgQl0tBF0M7B4wbkMwcV5F1+RtbS1cUxhKjrSANXOs2JSTvlV56KM3OHevNBsyDHB1b43nIdBLJTzaSzb1kDt+yUZlGiRzl/XJ4vjXL87gU88+ECW42Xlzl+a99ohdAvX9hUaL2beGU30EwVxTg3oBA8WbwYiSKJ1M1UN5MmIUaOeza7QZZVSmsTerTDFDn4vPootWQutM0zJ6ueh0CnhQUUNJzP8oVgv8oIkNff5mHpn4DnU8xJOssNNTj/Np/Ayas5ey64hUL2/jotTn2gnUhzfWucySfaaCMg+2wDAFYdG+dkEMq8RcHgXQVtyDUqNC1W8hTAla38Dvi1eL/fgZU48C5shLZYOpt4Og1slen6Ya2ulUJQIOy/MQLq/URuAP47wEAbD3DWHcLzbED7QdJTtpcLXMzn0e7txI42Bp07SG7qhweewuxaMkAKcru6Baxzhn3rRn4NLIHtaDWz/Gwg8p3xF/lDuaItLgmwPfzctLzDx77/5XSb7X7ivyDTDPoj6yDyP/Jdpwb7p9P497qoXRpPE7AKbaE1EaekFrlU49MfMmChniKrqQ0+bZBllBFaEIw5r5mH6SguUn0geBA4sPr2UzQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(66556008)(5660300002)(66476007)(316002)(86362001)(38100700002)(8676002)(54906003)(1076003)(36756003)(4326008)(38350700002)(6666004)(66946007)(7696005)(52116002)(6916009)(26005)(508600001)(6486002)(83380400001)(44832011)(2616005)(956004)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HAAorZpGStIIefC4m2VH9cJ5Mk8WfeTjz+Np40GLtwHe3YmZUOcZbVNlInzK?=
 =?us-ascii?Q?hUkeKey+aiYVhIrjaPRFwiT5IL+GT1t1wmTukZcZDZ9vzpEIzwNwM0T179Lt?=
 =?us-ascii?Q?MjQleBUADRhQ+DobcRiSNPs14kH/B8mjbiMD2wsHv68mGqnDJ6OU+HA+X94P?=
 =?us-ascii?Q?0cOdqsw/dKUyeN+Gn69MpWUgqx9qTg3XnN+cjf8hpb9BT/E4ODDIaqUGIrHG?=
 =?us-ascii?Q?b+lTLvwXLCrWIbHeQWUxyeSCqVZoFtCKqQhg0HlJYyDm+M9mEd9DpSbBgNA5?=
 =?us-ascii?Q?Js+gEw+HRdrYENV7p1akEOAZnWGnG6iavlc0iD2aFhv20MKyR3xrn4QnWaJw?=
 =?us-ascii?Q?5krtHZCmTfxl3OvvstCw8oRCEtgk9Isp+U+f1Px+oPo55gIeE3xHZCGfLXwG?=
 =?us-ascii?Q?oLMhOAGU6aj9jF07tXzBuMShI4QwC5eWybRg0QHLgXZZivWPQ2RImeGJ7mVR?=
 =?us-ascii?Q?xqzgwsI/VfqAveVfjoYl/cm3R74FrP84vyufNaTkCVSYDZRGTS2woliIuL46?=
 =?us-ascii?Q?VskvWM8x43t+CVFw32IlNTkbXzgBjPZqJ7VUBCT1ruocNp3rnDrEw9xmLPcY?=
 =?us-ascii?Q?v3x5RPNDvg/gR6KjY+mXKeEVv5QNhqIhqc3ug83G2EJQNlO5payg6TMXhuEI?=
 =?us-ascii?Q?fD9Qnv48MzwTDWd0XCb9QbsKI0hQ7bhVEUecZH+kWT/O31RPTsgrsF98HnUc?=
 =?us-ascii?Q?nWUOmOB/z+5K2e9K5yKoF2wrWdHpqA+L83i0cpvQHb+KQq+EccY4/LlfONJ2?=
 =?us-ascii?Q?P46VekoJlgBXVb67HVxlmoRNb48ELtizNHW7t0xghc1ehAKwqmC9kQ63qIXW?=
 =?us-ascii?Q?e9q1fTY085yUEcdVATQRU/eXXEzJ3pj+mlLGgbe9z9jNNOT3YF82mHGjvBpu?=
 =?us-ascii?Q?ZnM27Y9bZ9HhUKYLflMuS07F2H90LVr5xCklhtc0wCKHrQ4VIDJ+ijTeWTay?=
 =?us-ascii?Q?iv1c64mngkcytyeF9OjdjC5vvW4Jdh/M9D+bjq8DPDu1FSKlC3DOSOLGETq3?=
 =?us-ascii?Q?kf6E8UCIhAuR40G7GBqvoy6RNAQw3jek/axyGYToKJlSVOHoy0LYrmCuc0p7?=
 =?us-ascii?Q?u84YzTGoeOVrGeQ0W0qgQPnjW/LXPjDcVRqQ4/w7/mtCsV01muvJNDYldt4n?=
 =?us-ascii?Q?tnI2DnBOZZ+FF2mYtILACxtfzec8G7BgNcoIOjvhUr2seANl3wsWUx7cSnVo?=
 =?us-ascii?Q?3hOe77LhiR1t2JjZfckBvgwAq6hLq3BxY4zZdk2CNFOqijqJza97EkeXLYtT?=
 =?us-ascii?Q?ALw6jl0KkuQ6R0ZwJ+Sjauakr4xnw5Y1tZTcRFhLnWzCjWSlaTm6zo6v873N?=
 =?us-ascii?Q?8M9t0LK4Jv8d5QgBSgEDPUWErznLHE/GTkq4VqqNk/Ukm4QBYVWdreXgtcXi?=
 =?us-ascii?Q?kU4Z3Ur73maMLKqbMEwFru9E87P6XBAFGuosEqQcS4HLE0dBTKNIQ8Y70lpB?=
 =?us-ascii?Q?S0bZd/1ut9kPWI+n0/Zl+5/Cp9PpcPHFCxXL8U6YwY1JJlT84LHC8ciO64rR?=
 =?us-ascii?Q?NbD/rvEc8OwolmBpQ6MgVpLv60cRRjKmqTxLiNsqLrnE9IySxZghYpazM7oi?=
 =?us-ascii?Q?VMndb+UkcQZwGk7niQS95OUzfOIQe8GbZr+iq5S0eBLNLLHDJoEzKP03yutK?=
 =?us-ascii?Q?6uOnS8FuXyKICyR2Fn/p/mA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ea9328e2-4e20-4c13-2d58-08d9a30a397e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 22:50:56.1725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bfh55tW9aqwIv8kldICubO9bHLIK/gwMPHTKB3rcHiNc4ogyU/q5r9G5J+wr/jUPcoCtKefnRivQHrOXVy1OJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2661
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 22:51:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157993

The wayland-scanner is missing from SDKs with weston, but the weston build
requires wayland-scanner. Allow the distro feature in order to include
the wayland-scanner packages via nativesdk-packagegroup-sdk-host.bb.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 858cc6f257e22e39df83f4808ea27c6d12cd1b80)
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9274322e3a..c2cb2f0d9d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -850,8 +850,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.17.1


