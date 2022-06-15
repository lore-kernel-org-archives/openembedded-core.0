Return-Path: <raju.kumar-pothuraju@xilinx.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B731C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:11:26 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.41])
 by mx.groups.io with SMTP id smtpd.web09.4496.1655298680741020382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com
 header.s=selector2-xilinx-onmicrosoft-com header.b=JPpOmN2R;
 spf=pass (domain: xilinx.com, ip: 40.107.96.41, mailfrom: rajuk@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ze1/NrbL0gMa4UileggS/ikBjOo7qPtM2F2mmz9BjefvHEiuRUvht/ay8Aa+3WkK6+9P0vuHKY0XixOfSNHGsYvWPUZHMnA9q5HmKx+h1Svr/rvP9GNNncYk/Y3OmrlsycJfsPk3llflaxBE5T8QaidU8FbbkTVafyu4sxDJ78v6BNnnZzbtvsMDpR0ENv8ZYFPZSiT4WyIuyZqP+AdX6w5sRwwu/ucJ+0pkBbi2QR0C3e72QFvjanD3x1EUYL5Sk1shKrUn08U2OUIFfHEjVJqsoc5eYCVsr+/e7gPlWKGqmTjvPIUvgKWkzouA3ryWu6lnU+vP2PhRD4rIbQpneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kI+vS2VI07rHflE5iSmi2yPDrcZg05g+nhqwn8iTgVc=;
 b=MKSn2EnylPaGJ50KCMRDTRNUFWpUu94j3bP8UhImVGpAE/TMflBmhk0M0wRCebXOzAjNBuiGUYN8lVBtPnkYG+xIoshNB4cRkOgDEw7RcDcVVx7Arf1DzrHNNuqc1DZHj7DhL3tRcRwelJiXNu3xIKZPxb9dptSMfmeY3VWisO07RDUMChgWGn8cYTUVqWUXUT9o34rcVa//jZcip82GgkWDEMOFA23lGZWFGvSEvJw4jOozomaw5R2kXy0wu9thIL+AAmYR4de4j9C3ch0N3kLCyBzUn2OTz/Btb6ER494qtGmH7qcFvEa9wIQXifdLjioV0d+TJZI4pc/SGCE0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI+vS2VI07rHflE5iSmi2yPDrcZg05g+nhqwn8iTgVc=;
 b=JPpOmN2RSiScrOBT1lb3p4QBwo/3DOSmRQc7AS3rHIKLbhdGyjBtCythSU6mdHPo1OuEFDcXxWFxzOPeG1FLEjjyonS5ilIbhojk59vEmgmQPlIJEp38pzgZL0cXF1swryCsymgbiF6TPqEx7JsdupMswQMlJ/ny8Qe3c4R43a4=
Received: from BN9PR03CA0762.namprd03.prod.outlook.com (2603:10b6:408:13a::17)
 by SA0PR02MB7305.namprd02.prod.outlook.com (2603:10b6:806:e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 15 Jun
 2022 13:11:18 +0000
Received: from BN1NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::41) by BN9PR03CA0762.outlook.office365.com
 (2603:10b6:408:13a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Wed, 15 Jun 2022 13:11:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT011.mail.protection.outlook.com (10.13.2.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 13:11:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 15 Jun 2022 06:10:45 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 15 Jun 2022 06:10:45 -0700
Envelope-to: openembedded-core@lists.openembedded.org
Received: from [10.140.6.30] (port=55216 helo=xhdrajuk40.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <raju.kumar-pothuraju@xilinx.com>)
	id 1o1SnF-000G1A-5J; Wed, 15 Jun 2022 06:10:45 -0700
From: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
CC: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
Subject: [PATCH] runqemu: add QB_KERNEL_CMDLINE
Date: Wed, 15 Jun 2022 18:40:25 +0530
Message-ID: <20220615131025.25729-2-raju.kumar-pothuraju@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220615131025.25729-1-raju.kumar-pothuraju@xilinx.com>
References: <20220615131025.25729-1-raju.kumar-pothuraju@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e4a6f27-e292-40bf-09bb-08da4ed088fd
X-MS-TrafficTypeDiagnostic: SA0PR02MB7305:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR02MB7305B414229FEB3B5658ECAAD0AD9@SA0PR02MB7305.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0us9zNTdlLn4/FBs3Y4qFUdoZ7reERn08fl6cfo13iNiNNIsJc7P7UbsALGzgPtfHYy+UNW9iNAzmF0W6mZdzdN0tGD8mBD7v5wnoEmYV74bdUjOruW7T/7X5rKDxzSmX6UOZLH3Gvq2pHU6F85sSr7jnIvf+z309mm7WEJmj5wFKIJb2a7VA1ltcd2eqxjecBfBqD+Zf8bkdrmrwZmffPzh0Ztr4wryf4m4xTTUtdcstZS6kzxG3Kt79aafLn5nFGvMM2GvQgtHWjC6KzuodCpdmi4lfzDwuxtdN4aiDzARakOv3MQAY3EzBceYvku9tLEDQaOtwxYvnhry3RGIoLGHEci+ryh1FgFC2WQFF+8ESB4C2/vYsO16kJbZLCsw5bkPVWxGEpUFHjMVHTW6KA7CV7cYw2BAjX0Ln0mQdoQI0LS0Ad0AXnnRXToLQ0eM0745UKzg7ac5eTwRNpkSYU6zi3h6ou8mjEYCKy9npAVTlHSDP7N6IhJ+3XtwWO8+PrFsPPv77XohK4E2QIEpJknk4/jfOxSQe0l4gsftUBNTHrmWbSOBsZRHmy8DGkZ7MoideiRpGh9d7P1rb+UlVV56qioxVwpkD7LmVwT+uHL4P5VR4hengSBCcfx7/SJNzJ+wAuOGVin0ura7EFH7Ed3N2hbnAuRjbHz8uR+2te581zN0T1KJQUOOkbYwg3LlD0/bZUSLhBcxtx4A+dj7zw==
X-Forefront-Antispam-Report: 
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(9786002)(4326008)(8676002)(70586007)(70206006)(2906002)(40460700003)(356005)(5660300002)(8936002)(7636003)(82310400005)(26005)(186003)(107886003)(47076005)(336012)(508600001)(2616005)(6666004)(7696005)(36860700001)(426003)(316002)(1076003)(83380400001)(6916009)(36756003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 13:11:18.3388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e4a6f27-e292-40bf-09bb-08da4ed088fd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1NAM02FT011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7305
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:11:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166984

runqemu auto generating the KERNEL_CMDLINE values and specifying using
-append option to qemu boot command which will lead to override the
kernel_cmdline/bootargs which are specified in DTB when using -dtb option.
Add new macro QB_KERNEL_CMDLINE to specify not to add the runqemu
generated KERNEL_CMDLINE values instead use which are in the DTB if
value defined as 'none'.
Add provision to override bootargs using # runqemu bootparams="root=/dev/ram0"

Signed-off-by: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
---
 scripts/runqemu | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6e1f073ed2..b4c1ae6d83 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1486,7 +1486,12 @@ class BaseConfig(object):
     def start_qemu(self):
         import shlex
         if self.kernel:
-            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel, self.kernel_cmdline,
+            kernel_opts = "-kernel %s" % (self.kernel)
+            if self.get('QB_KERNEL_CMDLINE') == "none":
+                if self.bootparams:
+                    kernel_opts += " -append '%s'" % (self.bootparams)
+            else:
+                kernel_opts += " -append '%s %s %s %s'" % (self.kernel_cmdline,
                                                                 self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
                                                                 self.bootparams)
             if self.dtb:
-- 
2.17.1


