Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F330C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 19:17:26 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29861.1787685442071942034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 12:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=qofpOvan;
 spf=pass (domain: axis.com, ip: 40.107.130.37, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hiRxV5RemPn+WTZi/trdS3RKLOy7wVECutLy/owHhmFb/SQb2GNAx4AJzesHBTyo0sLngFHzwWXXAUgHQ5eNHoqB46fnGoebu1Z/mwJ5+kyeISMq86uE3Hx8BT/KIUn3knvEWHg/aGeXb38FCvWWq0L39Xf4LNoq84e6wvu8YDc/TMcNuXhg8rylqhuS/WcZfwWMAaZAZpKA8e+RFKlpXlpHTC1/R10zCZKB2TEeMzz/hBu+6HLpO/Hj4G3PC1SCle0QpHpBt7fY0FxKuUFy9LMGxItSvU91tTZVH68KeDBo1vNM2MXLjJKWNWEWI8rCrRDeH7+1orNe4NcopkRQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh+lxIPtXLY5MFacHHRI/EZjefuYchKv1avF9SOr3+c=;
 b=Fh2yXDRtqDBtpE9DVuiOrFcsW/+vjas1cynj5qXTafCV3fMKLoxG2gUSXe1wwQ7etND2b14yqEy0g7mV62lKaRMRCaXni3/QNKtEg4utOKHeFazWCRHwTXiitXDbZ+rPq1vU6w8XiTJ7V5jnhBq4+/543t0UE2bV0iVfvKWJPyD4kYslnPU8ndOjDd92ootvptHNef2RV8GkdifkpUNqUjWdPhPCPwzBwfpNJl+f0kRyWdYNGvyh1JOawxQ406gqIf3qC2Nq/SSJZO30fYJgZgO0qfMOETVPNS+O2lcoQdntAKDb7mczLDc5aavjg7/SDA/78TbJ+kUNUlODqXPxzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sh+lxIPtXLY5MFacHHRI/EZjefuYchKv1avF9SOr3+c=;
 b=qofpOvanH7Jt1vVAcNEvyiBTKsYP0MRYE8J3dqlX3uQeTeY2uOLasK4L/OxxcEgF6D0CtuTK+Km+Rj//Dn0FGK6d6++1lzoQ7vGcifeV8C7RP7h+Sc1uU0eIsDtgaNtHsFv/AUhTbpooIr1i/s1znPEhL5kYb53Ee2KJ/qSF5e8=
Received: from DU7P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::17)
 by AS4PR02MB8431.eurprd02.prod.outlook.com (2603:10a6:20b:576::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 19:17:12 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::73) by DU7P189CA0021.outlook.office365.com
 (2603:10a6:10:552::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 19:17:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 19:17:11 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 25 Aug
 2026 21:17:11 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 25 Aug 2026 21:17:11 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 391912D7F
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 21:17:11 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 37112120928; Tue, 25 Aug 2026 21:17:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] busybox: Remove CONFIG_SHA1_SMALL and CONFIG_SHA*_HWACCEL from sha*sum.cfg
Date: Tue, 25 Aug 2026 21:17:08 +0200
Message-ID: <20260825191708.3014535-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825191708.3014535-1-pkj@axis.com>
References: <20260825191708.3014535-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D12:EE_|AS4PR02MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c172b4a-cbcc-4d94-dccb-08df02dd76ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	3qFBx06ykyTsOpNzSQdYXiaSA3WzL/xCmq+rqptg6m12edQvgCcXiXvQt1UIbHk9YRlKfuo9buqev41F14Tvv4KEIkV38QeBwqIJ2mB4fJ7x/1LtZbDf1MO4WPkPaSjqAyIXM1qwyO3aXPoGQFGhNm2bA5DtOHWhHNQuXrfnpOzxGO/KerEx/ZC8xIgCfVs0kTpxG0+rcdOCI6/F3Isp6GVobnsJZV2roVFpOKWWs+uOker9me1R8T5d0uh1t/bEzyJAeVpBzTe7fdQ0d/9OEvWEwygihzZbJ+RbCGjJlTwVObsyu30khEmkWZSDKyc9eDiItiFOT1KignzS+GYFCt46gYVo0uCjFfxjgHWONFxZycnALuFEC9KqEjBsePVPzgyJJXRwoP+jgYdtcnVBf9F8LPpp/896iD2pC+IVRwLZ/TUFOX4G+TudEB8u0DFJLy+wbNS485ws43qvfAMAzoE7C/9wYLt5X/NwP+KGZK4y5gr/0xNVJupjCOUQK0YAact1Fk5rJs5yfKUsqVDosHQb5/w3OR/7xSivyBhC+jogyK0qhmHYki7X2gS6LYIKdhd9UUME3KC8dWeMKdHrTSW0ftBw3lhFo0ywWr7MK7FB5pt6+6Zk9wi9JH4AHdDLCWx6rQeQLLNiZInPHJKg5QZl0bsu/Xl4ZtxG/Vo7Zu51x91qJ+6HUagTbCf4MKUU
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QBB4Lqr5rTIOp60LjQvH4ar7bPHDgVi3yZVn5p4dmsnL7hc4FDvDQFhA3fEY2JSO72shung97rZnHxtz5hw23vFnrd3a2EE0Ye32+NrcQZUsh9NyEAj2fW/WP3o9/3itfGKMEinsW1YhQTYZny3BNmPgKkYcMM7289V1qwE2CVPsND05qnVf1fsvhjpsticdGE6+tHItn+Keiod8HDu8BGgAhuhbHU0IdYxU0q1nl2+v1GerRrTjZV/Kz+72FYa0bN4rGp/+m1/rbANAmLKO0rvJra2Cy+9N3tWnxiqrNjOpICQDFTXnJS+BITdEHwmMNWJKj+MXtz9un/wKlK4GwGeJ2D5WcC484kh5UcDH3teOM9oYw3EsySz7vB7eP8KLUM89LUItiWHe6UyrGscbXlfPK7jXZz/fkw6yL3/X/EyKl5+GigZx47hKKWFIDJ6z
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 19:17:11.5861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c172b4a-cbcc-4d94-dccb-08df02dd76ef
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8431
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 19:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244271

The options CONFIG_SHA1_SMALL, CONFIG_SHA1_HWACCEL and
CONFIG_SHA256_HWACCEL affect the common implementations of SHA-1 and
SHA-256. These are used regardless of if the sha1sum and/or sha256sum
applets are enabled. Thus it does not make sense to configure them in
the sha*sum.cfg files. Additionally, their values in the .cfg files
match the values in the defconfig file.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/busybox/busybox/sha1sum.cfg   | 2 --
 meta/recipes-core/busybox/busybox/sha256sum.cfg | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/sha1sum.cfg b/meta/recipes-c=
ore/busybox/busybox/sha1sum.cfg
index 01137a2486..20e72d9263 100644
--- a/meta/recipes-core/busybox/busybox/sha1sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha1sum.cfg
@@ -1,3 +1 @@
 CONFIG_SHA1SUM=3Dy
-CONFIG_SHA1_SMALL=3D3
-CONFIG_SHA1_HWACCEL=3Dy
diff --git a/meta/recipes-core/busybox/busybox/sha256sum.cfg b/meta/recipes=
-core/busybox/busybox/sha256sum.cfg
index a5b0ab22d1..ce652ae4c6 100644
--- a/meta/recipes-core/busybox/busybox/sha256sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha256sum.cfg
@@ -1,2 +1 @@
 CONFIG_SHA256SUM=3Dy
-CONFIG_SHA256_HWACCEL=3Dy

