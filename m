Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0142BCAC5BB
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 16:37:47 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.30])
 by mx.groups.io with SMTP id smtpd.web11.35324.1759077465136673611
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 09:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Zux1Fl77;
 spf=pass (domain: axis.com, ip: 40.107.159.30, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ml9/GxMMMlahSg0OdCrzIOXzyEmotpJGyFaZQoZwjpBmLg50VGfPhRpqFJZeUYpHOEeOtcDrtpK3/sOmTYKjvnLR/IwcUB15RL3Gxff9nIkdTfmBCZfrSyyjKJHpPd5+j/GVgNLHExNeC/H49sXldcLoiizSJ45B6ECbq/lGWMKPvoO1jlL7JX69YEgCMgaIR7v6cucpuNOheGpIqnVpAcjhgB1jFPnTCda5GCBCcF1rr2zV8AkpQoeOKJqLqJV34BLLv4yhWoGCdU6A3KBthzjMrlig97f1vHCoLbpYzdb7p2vADgCxPPyruDJjWacr5OwSzMASB6RhXew+gYK2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl8wJY2Lk+YldHEiBcP01eiTlxn41X6QZ6eOyFkrqYs=;
 b=n4V7CO5rkYtlyB5IrIxlBiHO7r4QpIQT4J+uKRBjRN+TbRnB4zEvzRL/DDJO+vz6HqZDVPmOnbutJIMiiE30M2f5hPYzDikYAYM/yvbQ6+e51LY8Ax4VhgD7rdYq72eUDAAIwhtUJxQGSRXjxJOmu9640QA9OvfUc63lukSAfqq6k5ZZx31rUCNAcdZzyfAH/GzoMXrZGAltFaeinCsaLeaZSnR/FHdixxVkny62CbO787qk/sAJTo5JY2XdGlfilwJl64CVpOZcFNPuy2pggXebz6zcHvx/X51fiywYnJkkKNdVAW/JJsf+KjDAioUQLN/e/Ib1OUC6xSO0+OH8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl8wJY2Lk+YldHEiBcP01eiTlxn41X6QZ6eOyFkrqYs=;
 b=Zux1Fl77H3SrOIWQBlj9psB5652vynCBF/lPRDHJz2tKrx5ZEoWBc5wS2eT/wKDQqYzdeymCglUp4j81l3KEp5GTe79l3YhRxvS4Fc/zdCyZxYUwP5kDFIf9aLVVLJVhUBm1yZxhq3o4mRtVSP8xaEo7jO32ONYLqwR/gmNdO50=
Received: from DUZP191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::29)
 by DU5PR02MB10820.eurprd02.prod.outlook.com (2603:10a6:10:521::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Sun, 28 Sep
 2025 16:37:39 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::1d) by DUZP191CA0019.outlook.office365.com
 (2603:10a6:10:4f9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Sun,
 28 Sep 2025 16:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9160.9 via Frontend Transport; Sun, 28 Sep 2025 16:37:38 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Sun, 28 Sep
 2025 18:37:37 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 28 Sep 2025 18:37:37 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E12FE8A9
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 18:37:37 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id F1FDA12025A; Sun, 28 Sep 2025 18:37:36 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] shadow: Increase the maximum group name length to 32 (the default)
Date: Sun, 28 Sep 2025 18:37:33 +0200
Message-ID: <20250928163733.1250308-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|DU5PR02MB10820:EE_
X-MS-Office365-Filtering-Correlation-Id: 579796b8-d989-45c0-dd80-08ddfead5617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zd9oOPtdc91ZbfhCEIGguWfV3MTE5FF1oJEpUHp7qpyRvPIKdV50YUecoCV+?=
 =?us-ascii?Q?ou8aAuxfwzVZ0V/JBwVIq+0gGCDvAHOKzprMNDZLzLM+wp9tnNf2KR6SekfV?=
 =?us-ascii?Q?aILVkA6RpPTnCDs2ds80R7gFPH1rvgeiVFwvDS+3IAqWTjSNhqb3WzDmZfhA?=
 =?us-ascii?Q?YQ7p0Wag1Mb5RF0weQwiDVOw2/wdhFeqXHqGyCirAAYYh7E+aPcJmg6n2Jq/?=
 =?us-ascii?Q?+LICCisaLotv2BbWOPsAY95AUWu35gYLaRVSaHHiLBvTHQBfjuXTFXmQg7pQ?=
 =?us-ascii?Q?SCGi01jPqalFcqQps2SHH17lWb4QrgeNFwsu97SX//AfbWNdzp6A9awWYytJ?=
 =?us-ascii?Q?qrRlWUpbnThjxRygy56Pw1xx1wilKRL+g5ZcwO4F0CuyOULamOo3t4CwAMIq?=
 =?us-ascii?Q?eLtOHbBRH+XgTv5dewJsHWsnFVhtYbUiTGAY8QcHovX40XQy3M5zviNno83e?=
 =?us-ascii?Q?5CAJfBfMVNhPrQda98doaMOYH7lkbKOdwrnm1LlwT9HGrkOdHrQSow2TBfEa?=
 =?us-ascii?Q?VAW2B/DhvOX+3Jrc4tRy+2e96pHhPuJrjJxcQdh9C4Wrk9mvVbhKPDJAOfd6?=
 =?us-ascii?Q?WlBxAqsU7Rtqmk84FHbUKW8n9NxAa6KSFO8RfIsLtyeJSwo+VHG+oyLw/Ptb?=
 =?us-ascii?Q?8POote9ohslYPX8Ol99TFDXwbeYeWieTLxnKYFnRZuBLrbs6/NMfrj/TDxS4?=
 =?us-ascii?Q?r3Kzfbi7hTx0UxRWGtSs0v9SRScZqKWkIsZwuimcccEvnyMNeHlzoGUf/slb?=
 =?us-ascii?Q?3Wdawss7GfXeiXOpMN9eSeUoz0NWrICaYA9NBUWlXpER2vyrR1+RNy0x9xH/?=
 =?us-ascii?Q?JHuqWXalxyDotS3Fz1KCSL0Hd8DTOlb7dZPseIAp2Q3ykED70dZdeOpLk0lh?=
 =?us-ascii?Q?XPycfu3QXwDEQbwp2/D2aqDzYvSCk+BavKdnNHwq/hXiEtyWmQlyr3PdS+wa?=
 =?us-ascii?Q?u/tL7LgYz3YDqRvhDiV9Uah31JU1gwY3AMUPsiGURh1GsGx9wh4FDVpNTLmZ?=
 =?us-ascii?Q?OIsiCKb5ntMbLqqqrjqylGxWd21QTKlz9ujpClX7iq0q+2y4LPmKRMhol0bE?=
 =?us-ascii?Q?av93aX60RTVY04SFy3PTSTsWu1QK4nVoUZWRRIudePQyxcCVXBj/IxwiVTej?=
 =?us-ascii?Q?/BPbRUV0sYcZHrr3AhJVs6A77ApWw20gBVH297JaA0bW+XYMfjZNonWnA4nm?=
 =?us-ascii?Q?Yxr5ZHhe7t2dvCI2akNPiFdNvku8WZdQNOwrbLXkjk+jGWKgMLVu1Icvamir?=
 =?us-ascii?Q?LB0sOuEwSrnS1mIybZPBQVdtVYP2aV43RUcibjFlteYDAjE+u1mwIwNlsygP?=
 =?us-ascii?Q?w1ZE2AT8LUOHWP+7ZAcX7VCsQ5mG5bQBwB6aTJyJhcLkUttcAHlH5W6ybolP?=
 =?us-ascii?Q?Fkxpm3ZA1iaiCS0UH67pgaAXuAy2QjtTZlvaZnZyeeSARYLwI+f2qZBsrl6T?=
 =?us-ascii?Q?+AcznGL3jsIKe+JLB3+zSuZymYru5xHDnMFCNoQMN80R81gALK82zEsAueFa?=
 =?us-ascii?Q?6yQrfzeBnIHcX3ycvd1yMvlD4PCj+2UxL7z0QT8guhHCiQ43iywlR1kMwBAH?=
 =?us-ascii?Q?8PKyzeBetE5ueSPvmXQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 16:37:38.3053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 579796b8-d989-45c0-dd80-08ddfead5617
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10820
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 16:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224102

Back in 2014, the maximum group name length was increased from 16 (the
default) to 24. Since then, the default has increased to 32, and our
configuration is now actually a decrease in maximum group name length.

Remove the configuration to use the default instead, which aligns the
maximum group name length with the maximum user name length.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/shadow/shadow_4.18.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes-e=
xtended/shadow/shadow_4.18.0.bb
index 6842a46dd7..ba65fc7196 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.18.0.bb
@@ -42,7 +42,6 @@ inherit autotools gettext github-releases pkgconfig
 export CONFIG_SHELL =3D "/bin/sh"
=20
 EXTRA_OECONF +=3D " \
-                 --with-group-name-max-length=3D24 \
                  --enable-subordinate-ids=3Dyes \
                  --without-sssd \
                  ${NSCDOPT}"

