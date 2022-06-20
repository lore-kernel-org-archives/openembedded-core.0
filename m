Return-Path: <raju.kumar-pothuraju@xilinx.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76B3C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 13:40:27 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.72])
 by mx.groups.io with SMTP id smtpd.web12.30379.1655732426416158745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 06:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com
 header.s=selector2-xilinx-onmicrosoft-com header.b=pU3re3xO;
 spf=pass (domain: xilinx.com, ip: 40.107.93.72, mailfrom: rajuk@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNaaIe3yLpewSKqZCvjPT8g45cBVDHGqrGhrXCXV5MRzKJxUPOCs8m675Uj7soKfHkY+50mpfDpPwXYkZFezS9BhzdaQ2Q8SlN0P2uD0+GDZEZWMjXN2e5PC3QHrx+uDPBvv81ukzg471VypdTkv5pIpstbTd5IOnd1sCd/ZsP4D0cDklS85kijZhdW7xQTWgSF32+4BAmrmRLl+jPpPuZjqK1pjo1cvdnYDJtF9L5YqNwPKioPVbjnvyc8o78b3mUTl/MApTK+Tljj3LiFig4ehi3JAZMCxjisd5cKQme2044KiGNZsdrfI4EBCaN7Gv4BXA6hr/kNQDP52pCfrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+xq+exDrt0iehJGH47HWBToyMkkTpb9Dvw62hzy7Co=;
 b=P5rCAHaQv3lMLYPE50dgrLK239uwMbYOEfkJfkvLRVLaXaQ+AVUkM4GNDBtwHvQ3rBf7yvSbMIWlW8tPP5+8+mJMxATck2/ViDUkYUouj4J4hBbcHZmnj/dtmqMOCsydj6bRO60dzUwBkr82IQAz4SL7HIZUlvWMF4nQFE0kE7efzmVpTT5a3BmO4LGjgIM8gmcFDO1bdedSEyuaGzU0rtm6qSltDbl2hMrcozXO688K5ErM0W8Oj1iVQ/B6mv1Wr8hfI4hBbtZycGfkqKudLgeH1gkU17F9UB1wTP2+mzw+GViikhql5bZFmv2rnDiN0IhAl2g9Xnk3oTlwd9GITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+xq+exDrt0iehJGH47HWBToyMkkTpb9Dvw62hzy7Co=;
 b=pU3re3xOYytEz66pBP8sl7a2RcPdy2Mg3QctjsBg6Fz0kzauOtLHfiI6vcQc03S80Wgs01ogHecMOEOrbF2kBcawwu8fdeRBdJq2MNgySZac3IDuMhszaCzd+oEpvSNO07j/gRyLnapVB4SmD7A91n6wPGUiJgRiHalI2feMPkw=
Received: from DM3PR08CA0024.namprd08.prod.outlook.com (2603:10b6:0:52::34) by
 MWHPR02MB2350.namprd02.prod.outlook.com (2603:10b6:300:68::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.19; Mon, 20 Jun 2022 13:40:23 +0000
Received: from DM3NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:52:cafe::c) by DM3PR08CA0024.outlook.office365.com
 (2603:10b6:0:52::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Mon, 20 Jun 2022 13:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT021.mail.protection.outlook.com (10.13.4.249) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 13:40:22 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 20 Jun 2022 06:40:22 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 20 Jun 2022 06:40:22 -0700
Envelope-to: openembedded-core@lists.openembedded.org
Received: from [10.140.6.30] (port=58374 helo=xhdrajuk40.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <raju.kumar-pothuraju@xilinx.com>)
	id 1o3Hde-000EEu-1v; Mon, 20 Jun 2022 06:40:22 -0700
From: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
CC: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
Subject: [OE-core][PATCH] kernel-uboot.bbclass: Use vmlinux.initramfs when
 INITRAMFS_IMAGE_BUNDLE set
Date: Mon, 20 Jun 2022 19:10:19 +0530
Message-ID: <20220620134019.16951-1-raju.kumar-pothuraju@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3ada31d-db30-42f9-f9ea-08da52c26cc7
X-MS-TrafficTypeDiagnostic: MWHPR02MB2350:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR02MB23503B036D43488844882E5ED0B09@MWHPR02MB2350.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I+yXiiCgiJxwDEZh5lSbRnxXmDO9PEyQ9uPtA7M+S0Yn3PS/IxzKfGUJ5Lnl4vqKzoOpw+N2Il6OhkcFnn06HCExDMY9kd4vDqCnwgXEt35mUZqQB6athEIRgGyB94HM39y6bQ9iroCCRIWZGvMmlKJt3q/YXGrDwKuX5IF3VNjrlrEAO9Uvb1e1vwZWRUD1NbD/X7KmUYWSwQ7zcainjCOIiPjFDmHztYgofSkFqSSyq36V9TzMyndZwbWIxT/if0fj7HqGP763Xu4QN820lfY0PSZC9Dyh9hV2xh8FQYkcNu9oqJEyQuwlWAGQ99YdsfrSbZocN+ZX6zRTEvkqNlAGGO+P5c2UVrVcXpxoR+Mm7Sbb4xHYGQ4OHM8VJF812KCZ9p6Gqw24nuHkG9esE9c7wJYqynzWkCY98lATyzBGexDHiBPLBJbFNU8X5tfoH5bYtOfCYlB4g4MOPwS6MMUiHqhdQLBvdiNIOatOCQ9x6eLvJQ6/O4GBnIidd9E6KGUMnuNYTFC8G6sHxHklBLHy7sG2s+jzY6FkeA5sqzzTPN/Jig35yF47c2Brspg6YVKtD6XQiWOYrsHKtdveLhedO4nKhK+6y0fJepv5mT+7gg0ZjlxOzbdgBVt1cacipThcYDNA9tA0zQQigbH20PNPXDU7C0Yhskf7Yimj+LNUDuXUucilGaxvm8tGtJ1xG/6jvCCLN8/p3C8tb0d278c1fWksVUaP2WSpf3/yHahTVttdv5hSlquLprii0VTiusm1xImecu+sowdtN88uCnGBlK8vaRHxAMnO1MZEicU=
X-Forefront-Antispam-Report: 
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(36840700001)(40470700004)(70586007)(47076005)(426003)(70206006)(186003)(6666004)(336012)(4326008)(8676002)(2616005)(1076003)(36756003)(6916009)(107886003)(7696005)(26005)(7636003)(356005)(8936002)(40460700003)(36860700001)(82310400005)(2906002)(966005)(316002)(9786002)(498600001)(5660300002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 13:40:22.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f3ada31d-db30-42f9-f9ea-08da52c26cc7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM3NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 13:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167108

vmlinux file doesnot have the initramfs image when INITRAMFS_IMAGE_BUNDLE was set.
Use vmlinux.initramfs in uboot_prep_kimage when INITRAMFS_IMAGE_BUNDLE set
based on the implementation in kernel.bbclass do_bundle_initramfs function,
https://github.com/openembedded/openembedded-core/blob/master/meta/classes/kernel.bbclass#L316-L317
to be able to use proper linux.bin file in creation of fitImage.

Signed-off-by: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
---
 meta/classes/kernel-uboot.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 2daa068298..180e7cf066 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -15,6 +15,12 @@ uboot_prep_kimage() {
 		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
+		# Use vmlinux.initramfs for linux.bin when INITRAMFS_IMAGE_BUNDLE set
+		# As per the implementation in kernel.bbclass.
+		# See do_bundle_initramfs function
+		if [ x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
+			vmlinux_path="vmlinux.initramfs"
+		fi
 		linux_suffix="${FIT_KERNEL_COMP_ALG_EXTENSION}"
 		linux_comp="${FIT_KERNEL_COMP_ALG}"
 	fi
-- 
2.17.1


