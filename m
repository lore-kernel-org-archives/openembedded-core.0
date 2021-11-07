Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E910FC433F5
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 18:50:58 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.76])
 by mx.groups.io with SMTP id smtpd.web11.34810.1636311057838376141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 10:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=lAitCfxu;
 spf=pass (domain: nxp.com, ip: 40.107.4.76, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUrAk7qPOTvmTjBH6EKCRoJf9zIcBN60tYgNr39TranGHDT7x4fVFG6+4xuI5Y2stEmjYi09xBZNGq8oOzOPAsfp+SqEGjFKK+sW6r5vpnpfkS9ntoklkyGBfDuUSdI1dvabM0YI1pkZ/dMCEDzbAVOJoyBmjzT22KZj6pkSyjXOvrY2mSAZreGs1zkWVXKRQDCWWtUWraBivEadPFCda8uYQqgjwmqLPuYmPGSOw9PP5yE9IMzpRequchxCXSK/fqUm2GAEPOF/1ZirDlV/l7NaoosKFaiwLZAihOLVldKmkPabhU5OrTiQ225RYwjLEA5N5MLqp02EAdpVwPkWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz08e/gYiDRQUmKallxALXjbUVa+kyC8MI6SXwwEYc0=;
 b=Ods6EV8rPwibTXCXa5KeOVIcMgiwGzD67lLcg0D/pxTzq+Bu4Yx+WCQ2dVVAPZIpJjTSGauVGHnW8VTTi5rpaZf9pIER5dxUVfGPvzisCAQ/7RxZRqY0EeEfNqBSuzRx0rj43dJBwxQCDSG7KIM5fjzQoMVx4mbNWzuS5Dh1LA0Y1PCZbLsMgoVIekLepU04Uf4oqaKVEFJ1giCE/d4+GEe9X5DMq+O0bXiwjwOkoYhj1ljmP2y1VsfOch5RXPLSSXY0/x2/sIuwfdtPwEiZEGMOEYxuOrjz0/YMEAfe+9wWNpswqcRC44b5k8JRhFY1cQmOlROsfr+PtARi7SjEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz08e/gYiDRQUmKallxALXjbUVa+kyC8MI6SXwwEYc0=;
 b=lAitCfxuWcpEb/tE9Ey3LxYCsNi9hLBSbsSOg0H9pPWSJ36pJ3p+ReBdZ66KwrAlEEgDFVWF8FtPeh2cEouie8MIfD9vlLWAB+R8h66UhgFWs7t80fvvxTYq7+5DLYCWcakk19vJ8vnFSzUdCYufyD/2tEWJqBu2xoSPKQjc1Vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB8PR04MB6890.eurprd04.prod.outlook.com (2603:10a6:10:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Sun, 7 Nov
 2021 18:50:55 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a%3]) with mapi id 15.20.4669.016; Sun, 7 Nov 2021
 18:50:55 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH v2 3/3] bitbake.conf: Use wayland distro feature for native
 builds
Date: Sun,  7 Nov 2021 12:50:16 -0600
Message-Id: <20211107185016.28794-3-tom.hochstein@nxp.com>
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
 Transport; Sun, 7 Nov 2021 18:50:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5186993c-0346-4a27-2232-08d9a21f8757
X-MS-TrafficTypeDiagnostic: DB8PR04MB6890:
X-Microsoft-Antispam-PRVS: 
	<DB8PR04MB68908263F267547F937B0899E2909@DB8PR04MB6890.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	95mUFbwvQxf4Uw4ujV3tvcS4tzmg7a2YDWbpvfBbNLtqgkRIPmYtfsU0twzLQ9JTeOIw/sq2EGTkgayNMJhJxy3Slb86LJDnEYoWeZYliIiJLO+vdKS9B/WREVzvBfsfYS+J8YWfRhquAwfDHb1dT9G9VGsxdm5dsiLc7VMjT+Y+OkCin77K06MVlqE5NWJStIo3QdXndsX8tQAR+rbhbAq9uTi2Ozrcz36pLa7t2FsJCM+KMHzhMf8IqO3yk/zdaWI0m3Uus+rYOPx+4nGC+DtNDRhpWGLC4gMQaQTQJoZs9rzWt+7a5QPcfhZ60LyHieCg+By9r7Q+P3x97x08+qt5gfRPku1cJMUEgm+Db0thxxe1+haTlllWTghmvfouj3GGw2vrF+nYDhN6j3rg+gbGl6Vcf+I8aiBHLOOt4zgMHkJNB3fI4oSeEMt1908mi3hl9PSzfBw8dpsL5NxdBZpSkfMYPBXUkfdqBIx3/dQ6aHHTPkBqVbtHtVXmgBZJip+ggeDf9UW9CnUNBpNIpLpBZXnCrV/DW5ppGNq6odE+qx+J+PwCaaOoLLedxDNEtAsCjHdnuDhCAkgMO/C7demYCMhtL3F78CjaZRXe3Ptx6kTiamyLLBRsvcL6vt78shmCZ2u/JBdspeV9HdEsh+PKqMEdb96MIRgYDEIPg/XNp1gH3rcJAxTOs/evIJ58LWINRbKbUaawUE6erzqdNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6486002)(6916009)(52116002)(38100700002)(38350700002)(26005)(6666004)(186003)(66946007)(66556008)(66476007)(36756003)(44832011)(83380400001)(86362001)(8936002)(956004)(1076003)(8676002)(508600001)(2616005)(2906002)(316002)(7696005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4sQ8EvKIOdPi8x3Xd1rNj+y4lDJxR7lVB830wQuEIKyid69gDrllSbjfWOw7?=
 =?us-ascii?Q?WEm+Hn2kqiACqVUizSkEV0echoIJQe9fqGwPtaXkstYure8BdANsza1ZIBEF?=
 =?us-ascii?Q?iJbncQMsWkZHHnYRHR+JwQg2FW2UonccP8HYiAyItH/lv356OfHivr18Uc4k?=
 =?us-ascii?Q?mSjSql/XeJxlaniIEzZIvTOACgeIpOsWSWicZwbOf9AX5bZPoA5uEgQ8xWAr?=
 =?us-ascii?Q?6i7HCMWYRERRnj2DLb4aXOoLJTfly/LfeRAklvr7XPycX3unRbPrEA5g+6b2?=
 =?us-ascii?Q?ApEjATeBT9IPOjr8oGIIupPD7ms3DhyvSLop/LdhCbsluF+wJJsjmdAQR8XQ?=
 =?us-ascii?Q?di2PfdKmcnZXXrQEbaU7kPdiTlj1e3Z+0FMp1B6tRYjKoPHm9V2KIxOufkgf?=
 =?us-ascii?Q?BIUIURH5UkPf5fbACAya7lBGR/nvMAg4scDIMJNCfzUdOqrE8B6UUXtp4wCA?=
 =?us-ascii?Q?/RjNH/3WojocL5LIry2sfpmIgC6qDcFJphRETl8eUgBg6WMH1PVZgCdsStpk?=
 =?us-ascii?Q?mfszFUz5DABdTXmqRjOb714+3F8lyXmCvpDuj7CrlFZWzkRDAzI5FN5AxO3y?=
 =?us-ascii?Q?hmJzl22q73JJE8QueawfcVQVrT+Rlp5RUIxwA4E1ytD4uhjc51/lHj//NKgl?=
 =?us-ascii?Q?HF1ICkjJJECp0ioSBgRW1kkINUDQvBTnoXxNPmdzVlNMnovF9Jw0h2C015jA?=
 =?us-ascii?Q?fGdzWDTJK9maBF4zMJtnd4V4HQAMVYjPPxYWm4yPd7+5chZ0PRxwO4nKoTrb?=
 =?us-ascii?Q?2I1tBDviU23yWFYgz04OBj8/9nkxFsOF1pTpJPRB8j1+BPvZvSIMGNzGbyIq?=
 =?us-ascii?Q?V22mkte6dmL80XNg4BftBafbAHVV2wOZv9EwEUeIybxoypvXYpWwtPJaZ4db?=
 =?us-ascii?Q?WXLRMpu5xI9D0QdukjqKQBZYdRueWP5mb7yh4jhe9NbeFTXEYacaL4QT228h?=
 =?us-ascii?Q?/S4hnzQnjbz6f5jr/T4lXVJ1+G2ZuwT4gOkMfAhPQrcyQ08LX8vAJChvP75K?=
 =?us-ascii?Q?z+bzBPA8WZn21MaM1Z4FCHa49TmuuK+7DkHh4bHPbGW1XIkqZMBd2GG5x8PY?=
 =?us-ascii?Q?AlBkMiBibO/UW72Ah2t9rEouNaJMK3sjrCgBxr/hWXN33/aDW7QWSC/p1bA1?=
 =?us-ascii?Q?uFbM0hLQGZ0yJOqBUx+2sJxlqwOTjpkNk8JRiEq40dwScPQaUS9u16fVmkA2?=
 =?us-ascii?Q?CGIuUrHN6Ufm4Kxictf1r8b8+QahQRlB0wi+A2hi/fXUIOolT+OFMr5uWlHl?=
 =?us-ascii?Q?lG7QZdycfOdXKxSLFvT1ac43mJukzBXfdhH1rk49HyI7M0kZVTjpHFV5MoXt?=
 =?us-ascii?Q?KtbgemRAIv/mz/PvqEUGFZN3VpFCjFEw4IC2ppEsjh8v/Gv5zo1965TVO96B?=
 =?us-ascii?Q?K4a/QIBkRZnlbL2SYfjYLPhsvuaZBDjRqZKywx03qnkvezRj77dHef1MsOyZ?=
 =?us-ascii?Q?33zVRReY605+NxouxF0QMF6CBRzYqfG9UlkRgy5+Pg4RLo/0gsih3G7N54RL?=
 =?us-ascii?Q?O2LcpMChD/djyVlAvo/VDM9AQKoQ9KnpTXg/ZomLwRmk8sFzl0lk5SKSo8cv?=
 =?us-ascii?Q?E2I2NrVy5859D3HU0WwXf2GUiAfeI0afDkK+Y+V7uXMTpY8Oq3ILdx0Lm9Cd?=
 =?us-ascii?Q?Z/Bygf3xFvA1+fUh5Z0Ib1s=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5186993c-0346-4a27-2232-08d9a21f8757
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2021 18:50:55.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PxJN28m7Nx+YUwCy7YOpXSlSgqywVaap/T6HIFSaFCttxCbqsfKH1z+j00bHnmQKnbYFJTQRY8cUKmnUAzyF/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 18:50:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157960

The wayland-scanner is missing from SDKs with weston, but the weston build
requires wayland-scanner. Allow the distro feature in order to include
the wayland-scanner packages via nativesdk-packagegroup-sdk-host.bb.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 790f2f7a8c..71c1e52ad6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -869,8 +869,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
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


