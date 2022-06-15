Return-Path: <raju.kumar-pothuraju@xilinx.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CCDC43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 09:59:54 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.51])
 by mx.groups.io with SMTP id smtpd.web08.2774.1655287190053663577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 02:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com
 header.s=selector2-xilinx-onmicrosoft-com header.b=I2PHGILR;
 spf=pass (domain: xilinx.com, ip: 40.107.244.51, mailfrom: rajuk@xilinx.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oZ/n3Ca1xS2/YyAU1SRbZ0iKthobuN6YFAIHmgFwNbRxCCG1Eqfno+RmQ0Ucd/wonl7o6D6UjYB4nSzMuD0fGhSaNojA2TDj36nblYIg+8s1TToCHlX18szsoHNAbxYvzhy9jmidByiWq2HK1/xAXZt59uTJQEl51u5TXH+UAZK7/2+SvTx8R7W8GRAOZ0icLrL7PKvGOP2JyDOovPcAJ8d2y2TSKJCnOTaVLrJgttSyvYpNnvYSEknwmFLpcRZUSYDh8o82SMnSysAdUJtF9+5wepVCqoIKNixYZgKKFk2SoSq1KoqfNVyxCeJ4GehC3GgJ6AR81ebyRqC/hMkLVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymZcsXgdVhOdXABYMKmvrpIV640a9rE0IEXjqkXPbps=;
 b=llAPfzwqdg2iG55GwzlNvZXwB3PtodCXpZ1bCvJU5EQxBP8WiyD2jlgZfCK78jK2tr03MohiDQnpSyWOq+CNDK5Jilh+LnQ3m6dIisoXzzOgN+wON1jP3uaEfqI7fS9LzSWWgHeqqDreum7a6nuf9H4c83SvQTit4OXa6mfWYOiKqSBSMudMyCC+F+euI9CvDnEJYFRtaEbeCEZwKfQksBRTl9T+kYe6slk2p1gCuDy0JA5JSO3ApATJa0vzSkMYIVM8N+GpIOYqXfkNNOn+i+u0CHUcXQYG6FgLfeEa3Inj59pFGpdzDme88LZ7/1FbR7AQD8E0UhgkSvBpBVfPNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.83.241.18) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=xilinx.com] dmarc=[1,1,header.from=xilinx.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymZcsXgdVhOdXABYMKmvrpIV640a9rE0IEXjqkXPbps=;
 b=I2PHGILRe1nbKB+t9ZLcYLwQDJsLrf9Ms+2DN1rTqDzoa64qdNS/l7bd0au30qzVv9F0WZ3Ir+2m1qpRBMiv4o8wYGLHQPEVXnNJ8G5TeBc1SWfuc+YZc5pmazbsyIh/OZgj2IFyJnHp3r8WZdK4XrzL7na5W0XnueK6ybkcY5Y=
Received: from SA9PR13CA0107.namprd13.prod.outlook.com (2603:10b6:806:24::22)
 by BN6PR02MB2545.namprd02.prod.outlook.com (2603:10b6:404:55::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 15 Jun
 2022 09:59:46 +0000
Received: from SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:24:cafe::51) by SA9PR13CA0107.outlook.office365.com
 (2603:10b6:806:24::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.7 via Frontend
 Transport; Wed, 15 Jun 2022 09:59:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.83.241.18)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 20.83.241.18 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.83.241.18;
 helo=mailrelay000000.14r1f435wfvunndds3vy4cdalc.xx.internal.cloudapp.net;
 pr=C
Received: from
 mailrelay000000.14r1f435wfvunndds3vy4cdalc.xx.internal.cloudapp.net
 (20.83.241.18) by SN1NAM02FT0056.mail.protection.outlook.com (10.97.4.111)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Wed, 15 Jun 2022 09:59:45 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mailrelay000000.14r1f435wfvunndds3vy4cdalc.xx.internal.cloudapp.net
 (Postfix) with ESMTPS id 528144264A
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gzg20f+DrwIkgHyIXrOVk7aWgKLkvCPuHQLjlkrYqXmoUqDG/wUgW65wtfMVqBoyH23IJaDJJ33BJxKkMTc7TcsS2RwF7HEV/fo3Wh/pHiNq5DlbdHlA7KeayUmyU+kb3NnK6lgqaF2dyV0DJpQol2a9RC58t06SRlan3LkJS4H6W5/9rlR1l5zQSe6NMPb5dd7xm9W7sskr1XNE5TrylGTZ4Dm9HMEcnS8ABt9AKxksTqZjFJIc7TPbbwGcOxkJuJLl/n+PiQLW936E+RyH4aaGnP/BYvaLPG5aVZBgpVGCj1DVjXJURrLXJ20ixpt4v8j9/sFznoHt3Way+R2Cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymZcsXgdVhOdXABYMKmvrpIV640a9rE0IEXjqkXPbps=;
 b=YADkeWn+rmDiXuMULb0Fx0/B7viBMoXp7zFKux8cKK3Oe3yEFRJOdnmC0+tc52kHSYcf2q1J42tB7zQWp179q5fLz9F4oVru2okx8Wu5nUgAu+o4h7Xzon1NUfWqFe/1uHCviJ5VF5kVBO/pvYefjrY1Z9r32c5GX9kAEBlrIaw6owPdKIxZSkr6unKuhH/hu01iV69C3Ek5eFiMqtHXbVTRdRV4hLc3PZD7weswe1jSJ9ZIxs4774syoh3Rod4rvfCcyxNH6n2TMYpJ89IKZzY84Q++oArPxRGiYMoCB9bHF0RJ4841dVdWM7KzzXxEcJWvSyFOCle3XJphAUFRFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
Received: from SA0PR11CA0011.namprd11.prod.outlook.com (2603:10b6:806:d3::16)
 by PH7PR02MB8954.namprd02.prod.outlook.com (2603:10b6:510:1fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 09:59:43 +0000
Received: from SN1NAM02FT0031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d3:cafe::a6) by SA0PR11CA0011.outlook.office365.com
 (2603:10b6:806:d3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Wed, 15 Jun 2022 09:59:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0031.mail.protection.outlook.com (10.97.4.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 09:59:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 15 Jun 2022 02:59:31 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 15 Jun 2022 02:59:31 -0700
Envelope-to: openembedded-core@lists.openembedded.org
Received: from [10.140.6.30] (port=55094 helo=xhdrajuk40.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <raju.kumar-pothuraju@xilinx.com>)
	id 1o1PoB-0002jD-7J; Wed, 15 Jun 2022 02:59:31 -0700
From: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mark.hatle@xilinx.com>, Raju Kumar Pothuraju
	<raju.kumar-pothuraju@xilinx.com>
Subject: [OE-core][PATCH] runqemu: Add QB_KERNEL_CMDLINE
Date: Wed, 15 Jun 2022 15:29:16 +0530
Message-ID: <20220615095916.16290-1-raju.kumar-pothuraju@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: b6d56bcc-3169-48af-6cf4-08da4eb5c6f3
X-MS-TrafficTypeDiagnostic: 
	PH7PR02MB8954:EE_|SN1NAM02FT0056:EE_|BN6PR02MB2545:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR02MB25454B5FFC02F9B643A80C8FD0AD9@BN6PR02MB2545.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fK5xX+y8wAT+Eu97bQ1Xsh3ubVjIeobawKq6jnFTWJQRoEilRlPDRW/4/6UholfKHXHoUipWCDWAp7NnZSgo1VT4/Mr2P7pXiHLWz0ThA75Yti563T9xPwu8mpIW1PrjHS+Ov5hsIF4neb8h7TI4n/7cV+AwqUfPZUZL25uw/KMJ9GilczfjHBRIv+Z9oKg+IDbF/iXUcDJ6I6Hnn4JhbbPT7HVqoAlYreSCUTLfY8H5rtjgUTL6V7fB/ZIJB5oXwctax8lCaGNn3SMfrMpBwLiX9PaPHj2npKM+u6P/uQQRAhujz+J+yWVLRxNDD8DIKOuVTNonyhU/M2TDc1oluL4eNAd1UJwb8itKtDCLZHt9DTRq0RRp26e2NgjQs0UYm5df3mAB5tk4mCfaFXJM2qB7/+eh5W/jMnjqw9N7a/VMtxL70vMRxemufS0b0qlDqsZA2ydutkD8Kl+aLJzrBNBTL66TaplM9Dh3qjCpZ/3GWpYMlYiMQiX54REnFjU4OHZUhaGqqzmN9IGI28O6KHBsujLdbXyBLkbdoqSvAlnvntj6UQWJF7e6j1duLC8/+7DvMpMW8mCChCfev0ablreq0mUh9txfMhvTLpYAiFGzRbogphIM/Kb1CYT7Ox47ULaGb0Fz9NH7Xk8j+MMAYYvDZfHGZZQhVDkmbpp7h/h4WV4RFVr+6mWt7ynSgqdg99HGeVqvkL2pTT+Xr616eQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(186003)(83380400001)(47076005)(1076003)(7636003)(2616005)(426003)(36860700001)(107886003)(336012)(5660300002)(8936002)(9786002)(356005)(508600001)(2906002)(8676002)(4326008)(82310400005)(26005)(70206006)(70586007)(7696005)(6666004)(40460700003)(316002)(6916009)(36756003)(54906003)(102446001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB8954
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	825b6645-6e5e-4583-f37f-08da4eb5c53d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+o8xjlNgBTrgoMfV5FF/jIOob6sGZTZE8IU4FRlTZGXxEKyLtb7PNwgNse6wMifop3DcG+nZxJu3BvBi0SrR+V7880rABZwP5uWv5dZ4l7f2GVnqNmfQs0YBn1nHX5MngSTQ23H2y48JddcmR4z1i+CxEEZ+NhWlvfqpXHLcprwymeOYwEWgoFNUJXOBFiTNVu0FFlMq/bZFcaAmydv+F56uU+NzhUrEwnGD4F5rse1TcbEG9ajuoVXPSRbUOuatRiS8xuxUChkdl3fkCwWOVKTANqmB5Dce7hn4HM2ld1hcDUC6obcP/HQ+8tmVR6FDxnXAqVhII0Znn0AH+Ov+l4lSwNcWsZHrUnucoFtN+hyBM6PIOkr8AS7gstTJA92WCTptwp/coMAJBheCZBtnk+FMq63wTN85IEhApxtVSQVLTgYPkj90Sw+C+83rlfNKCX5yKDsreOJoE0Pj3E4jfEm64aeLzM/RiR/vN3XfGacEoC9YOcjdwVwxzlRw9TcA0wZZaK1YLbHLzmdXgRJwintjyW70OuyZEEAjbGowlaQVOfv8T6KrLxCle2JgiTWSh1dhMXqkX8QDzqL41C/k9EKBNc07J1Sb5U01sVSjRotxKo8SZNzPdw8a8gszOoP5kAswiOEkiZxcrSZEYL2bfYTPjahlnm/IBjaklAEqA5cX8EPm5e/45CRoMZlrZWDvaPQ8aJN6293MhQSP3xl5tfxqce/BjsvMxEdbMevoYMRagIINn5K5htIeBCPupS7/
X-Forefront-Antispam-Report: 
	CIP:20.83.241.18;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mailrelay000000.14r1f435wfvunndds3vy4cdalc.xx.internal.cloudapp.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(47076005)(426003)(336012)(1076003)(186003)(40460700003)(82310400005)(2616005)(107886003)(70206006)(4326008)(36756003)(316002)(6916009)(54906003)(8676002)(6666004)(508600001)(5660300002)(26005)(8936002)(83380400001)(36860700001)(7696005)(2906002)(81166007)(9786002)(102446001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 09:59:45.8516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b6d56bcc-3169-48af-6cf4-08da4eb5c6f3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[20.83.241.18];Helo=[mailrelay000000.14r1f435wfvunndds3vy4cdalc.xx.internal.cloudapp.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 TreatMessagesAsInternal-SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2545
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 09:59:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166926

runqemu auto generating the KERNEL_CMDLINE values and specifying using
-append option to qemu boot command which will lead to override the
kernel_cmdline/bootargs which are specified in DTB when using -dtb option.
Add new macro QB_KERNEL_CMDLINE to specify not to add the runqemu
generated KERNEL_CMDLINE values instead use which are in the DTB if
value defined as 'none'.
Add provision to override bootargs using # runqemu bootparams="root=/dev/ram0"

Signed-off-by: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
---
 scripts/runqemu | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6e1f073ed2..97ea37d690 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1486,9 +1486,15 @@ class BaseConfig(object):
     def start_qemu(self):
         import shlex
         if self.kernel:
-            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel, self.kernel_cmdline,
+            kernel_opts = "-kernel %s" % (self.kernel)
+            if self.get('QB_KERNEL_CMDLINE') != "none":
+                kernel_opts += " -append '%s %s %s %s'" % (self.kernel_cmdline,
                                                                 self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
                                                                 self.bootparams)
+            else:
+                if self.bootparams:
+                    kernel_opts += " -append '%s'" % (self.bootparams)
+
             if self.dtb:
                 kernel_opts += " -dtb %s" % self.dtb
         else:
-- 
2.17.1


