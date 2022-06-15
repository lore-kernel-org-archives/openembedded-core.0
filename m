Return-Path: <raju.kumar-pothuraju@xilinx.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A708BC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:10:56 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.75])
 by mx.groups.io with SMTP id smtpd.web10.4556.1655298648936717641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com
 header.s=selector2-xilinx-onmicrosoft-com header.b=o2t1EJmF;
 spf=pass (domain: xilinx.com, ip: 40.107.93.75, mailfrom: rajuk@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avtUPKzVOyVksGbvAQjelmlETh4d7rA98WAHlZN6hYaxNOvmx6CoReyikBSyIXs9Xh//xekL5XHRzklqkm5GccAkI75PkHnR6MwdqwGF/gS/XQaBvMzsRfzj+gVjAqd62uuHAF/tykdbJzgK45tR1nc0MSeXMUwGwYnjnDx601VSP4Ducb49Xyukl1ANqhAI4K6e+t/LEKMVxiVmpmLd+zjx8h74c7oub4s8v9dpoZXX0atsO32iS3j1NDH+YbUGRAoCPJOPqWjLqO+VxrW1Y0K+h+WDf78fbaAF2vHX3NTxkTyn1Zij5ZzxwkhZJYOBGWBlNccbXO6BskW+QFjcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kI+vS2VI07rHflE5iSmi2yPDrcZg05g+nhqwn8iTgVc=;
 b=jUAgbNAaZTjtBx1hEjfgsfCdYNBpDhnnLxKvso151z+RJl6znwTrewORVFsnhB1UENvoyuhXMjBjKwlwJRDoVuS1ats7r10OwHlN0kZQs97UoaVgOukM6Qk9p8vBQARbHyqEaJ4xjXA95l6E2HOFzzcV/Gk0Bxni7NfeX5dtquAyKgPAFNJ2foK5oHOzb+NLwNcNu4sHwbqKnIGrkqd9a4+PN30YdpKtcELvtmIBHNyf7vgcJNIj2NN/GwybYNVOIFUH3jw2R9psEdgp0IijdyPqvHW8oRofSkyL3rfUlO2p7PTQDkQPHahCbkMlr4TR1V4txgcPUnwgQ2NuqixPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI+vS2VI07rHflE5iSmi2yPDrcZg05g+nhqwn8iTgVc=;
 b=o2t1EJmFl9CmpZeZNTBPLC1XF5AK2b8CmQAue9IvPSkmm4GOwk9CfdQacI3rO5LVCTiYG/vPdWA0VMrpo9TtrZefcmbYZKgamVH6GOswhCX1DK3YXwNkZObJaG0atv6a1msoNqh1TwXpAtGXaopPebml3miBZf30itShJrDAEmk=
Received: from DM5PR12CA0049.namprd12.prod.outlook.com (2603:10b6:3:103::11)
 by BYAPR02MB5446.namprd02.prod.outlook.com (2603:10b6:a03:9d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Wed, 15 Jun
 2022 13:10:45 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::b) by DM5PR12CA0049.outlook.office365.com
 (2603:10b6:3:103::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19 via Frontend
 Transport; Wed, 15 Jun 2022 13:10:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 13:10:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 15 Jun 2022 06:10:44 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 15 Jun 2022 06:10:44 -0700
Envelope-to: openembedded-core@lists.openembedded.org
Received: from [10.140.6.30] (port=55216 helo=xhdrajuk40.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <raju.kumar-pothuraju@xilinx.com>)
	id 1o1SnD-000G1A-Pr; Wed, 15 Jun 2022 06:10:44 -0700
From: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
CC: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
Subject: [OE-core][PATCH v2] runqemu: add QB_KERNEL_CMDLINE
Date: Wed, 15 Jun 2022 18:40:24 +0530
Message-ID: <20220615131025.25729-1-raju.kumar-pothuraju@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33fe37e2-85de-449e-897d-08da4ed07529
X-MS-TrafficTypeDiagnostic: BYAPR02MB5446:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR02MB5446BDA304FBED9F294A0339D0AD9@BYAPR02MB5446.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j/7zv7I3F0y8RNwz07XC9XJFnj4wdahloIWkmSuxhITnowPy0r6cz/lfARdG6aB9uD/tkj/fQgy439UbQk8qSnhX8uauOKCk/fAIAOuND4WhGZq7TY3QwsnbqQSY7ohHQDoP2cQG+NcUrY8RwmBHiZSqk6WZIOw2KXRgn5mAGSrEe66xMJq893eMh4tvsj/AMnTrQNZ+CXW+53zyL+f16w3PyGZjb/mmTj9TvgeBdf2fNjfBID8JxC3hebeDEN9Yq+XwuFCezS9TcqsbNRxw/cAfEjR+fDdaYq++AJBjK6/s12g9zue4nsR6g5XOtC81IVMVRWveb6oHb+qjOCMlZvPx/b+cvwg3lvK9n64cg9vj6x7GoEra0ft5pGfhnqKTG8A1YhEEMpiPwCy/dgYI8JgSM9riFz7ryA4Hn3gD5qevq+7zFGW3AcH8NSvN2KQpsplav6cpeeWmq6oyDisaeZRYi+a/TkcPSv3R7Ij9z/45pZ3wp2T3jx9b0bxa5E6WiOuQQuvaP2sKEVvJL2N+YGwCQznOcKI8cbalSJc/3z94gKSOjLpTz0oOjz8bdLIOM6oNewSvOkMwZrtV6/mT4JteUsXYikn+SKV5xrYsNpV4paevrKEvzZwNfiTPIZYzjUkV/vMKNwoaazYhMtzFGKSWb8Kz8Ggu110tag8BdSAu6hAk6gkSg0lCtKSu4V/XZGMr4tCXiyBUoLeRnZN8xw==
X-Forefront-Antispam-Report: 
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(336012)(70206006)(9786002)(186003)(83380400001)(70586007)(426003)(8676002)(36756003)(6916009)(4326008)(316002)(2906002)(47076005)(8936002)(6666004)(508600001)(82310400005)(1076003)(2616005)(26005)(356005)(36860700001)(7696005)(40460700003)(107886003)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 13:10:45.1229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33fe37e2-85de-449e-897d-08da4ed07529
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5446
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:10:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166983

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


