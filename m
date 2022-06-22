Return-Path: <raju.kumar-pothuraju@xilinx.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA6DC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 11:07:52 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.70])
 by mx.groups.io with SMTP id smtpd.web09.6147.1655896062055177046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 04:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com
 header.s=selector2-xilinx-onmicrosoft-com header.b=gVFiBBC3;
 spf=pass (domain: xilinx.com, ip: 40.107.95.70, mailfrom: rajuk@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUVZ3LjVGTkRkXD57bC/SeMvaq/YolmpDv2Y+BZ1xFj7pNMH+JQ7BLyceW7L3l1SNgUyctyeeOxpJNpi7Lbq3FfLjKoHYXfj51kW7gqaiR+zVpolTm4W+BKrQTIBVYSNmlu24FohYyE8zCfmqtDBuq/Z1Q6HuWwxZCZDYn1AnTiDpD2wK23KtXsKbr55cVIrAgi1uxKCRd3Mf9H7Ud1CHu84teb1NuOLau7X5GDlelaLPYTnsAWKDigMLbKvvZ4GLV5gidI25vq8HrxFAy5lKbCbsb3IHBCwcoWDhO8N+N3m6sC+1PSNVgvyZoLpNU4R+ra7nLZ489vHuSh5O7lGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmpSX/J6z6WAr6kmh1zmm2Z2U51f7oqON+0r3dXGPeY=;
 b=D17VCzLRmLfk0JSlBPRbpB1bJYh7iaicHlon5kXvilHixGDlEaQ66xq8zCTfWi8DCg5rrpyjksm2sTJQp6vtXjNPIR7Yr2iuP2BOIcZX6DHFtynI5qH9b2R4hiYaEhNR5MmqG3qBXqvrytAeTR8sb+/fRrg9J/QQf8X4qP41ayalIquWsvF85QNuUEHK9eCLH1Z9Q6iTb0Kjhun82o64/g17urULV/VecfJLvwx+2srzZQmrd+lmbjnAVZCPaoniphphiOOALzXT8l/FNvtOipAiE3bJg0ZcBrtpddzvo/SXt2FPntYUSQrR6qHPZOKJSCvhUyKVa4l6JWoDsnvL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmpSX/J6z6WAr6kmh1zmm2Z2U51f7oqON+0r3dXGPeY=;
 b=gVFiBBC3pR9TvIq/cS1uvGsknRp3JIACxQ+Ht197J5QbrWG4mgAVUcYGD3nsOdm+bqJGWEPE3LrA0OPQTj4kfD92bwYqXFKHCS3L9Xk38R7wic4ba8kVmkCpYIIYqXtDoYs+k5A76UvmZLSWn1CSLbAHuvKs7GxlaPXAalCe+ng=
Received: from SN4PR0201CA0008.namprd02.prod.outlook.com
 (2603:10b6:803:2b::18) by SN6PR02MB5696.namprd02.prod.outlook.com
 (2603:10b6:805:e9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 11:07:39 +0000
Received: from SN1NAM02FT0015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2b:cafe::b2) by SN4PR0201CA0008.outlook.office365.com
 (2603:10b6:803:2b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Wed, 22 Jun 2022 11:07:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0015.mail.protection.outlook.com (10.97.5.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 22 Jun 2022 11:07:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 22 Jun 2022 04:07:38 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 22 Jun 2022 04:07:38 -0700
Envelope-to: openembedded-core@lists.openembedded.org
Received: from [10.140.6.30] (port=60274 helo=xhdrajuk40.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <raju.kumar-pothuraju@xilinx.com>)
	id 1o3yCw-00069V-8P; Wed, 22 Jun 2022 04:07:38 -0700
From: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
CC: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
Subject: [OE-core][PATCH v2] kernel-uboot.bbclass: Use vmlinux.initramfs when
 INITRAMFS_IMAGE_BUNDLE set
Date: Wed, 22 Jun 2022 16:37:34 +0530
Message-ID: <20220622110734.20189-1-raju.kumar-pothuraju@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb8e7366-5477-4213-7aa3-08da543f6beb
X-MS-TrafficTypeDiagnostic: SN6PR02MB5696:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR02MB56963FA6A9AEFDDE9090B87ED0B29@SN6PR02MB5696.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RiXFiXuIhegsHuojxSLqTdhNq3SPHRpYQ0hVaAqua9GVImIfV3VUVGbDFb8lTEbuZ3HPQVI70OAve2ulCIij0CJCmTVgx8lDjWCo0F+O101sX71UqK0SiPkACW3sf5O9bX63rCltICN9JLonb/amxWUSugncyawyLzE0OZNyjAY3ieFPNs/h4DaVU4PQ/wnghq/l7AIKlfL9VIi+/Ba40D0dspFGVtPJOK4qqz92wM8dEXIv6E9P/MPXSvPX61ZgQc0IQzoeN7j+0Q/Ufr5Dd0S3d2wurwtAsZjrU361OAKXfQkT1YDEx03eYoWoKh9JMinF28vNxSiJzdKu4I1cYs90OpFGa5zDXKMSCdyU7IUh0YD8nKzc6HWKJ3fJAlhe3J/zyrvaHhcZc2fq17kVeQ2jKXhrKF+Xq6Sjxsxs1J8WCJ25EKWj4TuLAhW24gezJJV+5or0fYk0cljMVz4tE9PPxPHzPngr8RQ63voBr5wTx/13xqsSuHimVyFeUBWYgtn3NVttVTZsPuI+ecOMHCHZfi1Z+cpFbxN3z8+XSmu4a+/XkwtGTHB5L2x+ZV7BMUVIOY7yIWF2OvR6lTgbqp5YBbIVVtzKGVm51DWGwnkIsObpowDZlWxr87DM3evZMR4XydlUc8mp4twgjJ39IFKsjCjpXigWzlzOWQMvJrtn79qnZA4mBZjhc8gw4j1Pm0QOnAf91C/8fsp5UvjYBJBHqFMkTajeTOFqZBRFLMbhs/ZCJVFBnkF1bA8oLuS7J0nyH+9hBOp0v5S00pa8Gsyd/qo6R4IINer3drMubS7be/8kRDuhMOC/GUGl6xb0
X-Forefront-Antispam-Report: 
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966006)(36840700001)(40470700004)(336012)(426003)(47076005)(2616005)(7696005)(107886003)(1076003)(186003)(41300700001)(26005)(7636003)(356005)(82740400003)(40460700003)(40480700001)(36860700001)(9786002)(8936002)(82310400005)(6666004)(36756003)(5660300002)(70206006)(478600001)(4326008)(8676002)(316002)(2906002)(70586007)(6916009)(966005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 11:07:39.5520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb8e7366-5477-4213-7aa3-08da543f6beb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1NAM02FT0015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5696
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 11:07:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167233

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
index 2daa068298..2facade818 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -15,6 +15,12 @@ uboot_prep_kimage() {
 		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
+		# Use vmlinux.initramfs for linux.bin when INITRAMFS_IMAGE_BUNDLE set
+		# As per the implementation in kernel.bbclass.
+		# See do_bundle_initramfs function
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ] && [ -e vmlinux.initramfs ]; then
+			vmlinux_path="vmlinux.initramfs"
+		fi
 		linux_suffix="${FIT_KERNEL_COMP_ALG_EXTENSION}"
 		linux_comp="${FIT_KERNEL_COMP_ALG}"
 	fi
-- 
2.17.1


