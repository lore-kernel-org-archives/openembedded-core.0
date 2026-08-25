Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC24C61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 13:23:37 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.137])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21476.1787664213928150098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 06:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=V5EC4RA0;
 spf=pass (domain: phytec.de, ip: 40.107.130.137, mailfrom: w.egorov@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0SbK1lXnjYa7upYRJReV0luYyZv9xQCISWIhSod+vLRm0PRrXuhSual77z/v6guT8XrMuYzJ6nCZ9kzFjckCYckfBaGJOCx3QcKkuPLchLVb9umCWRjBhYdJaHJZYgUfDlWmQ5WUa5psz59pI8ARvw2xIyhfrMt5WVsN/3nGjTcC56YjaJVawNLTlXMYNtOvOZitRLzI3inBaoVPHTE2VZfXvnofhSAWhzQuZt3j8qdn6iQJ3pgLkO+LGjQ7yUwCw4xhIUFjVeoFWNt5zzqYNFuJ2Jlgt4NLXlO3vMUuCfpCCOeZTsIJQByK6tH3Xal9YwVGtpJlKFEpkPIcefc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSBz3w8j7XKAOYuo4A3UhXPN+mOzLUBU0fPRgp+5YaY=;
 b=bjTZyrwKg6oV/W2KJhzlfdu6UCiXrd2GshyBSC2z+xj0+WEO/kKt54Hfm4LVlj+aov2pVfqs5oLkXlhcPdro8WRRbxwLv9uzsb0+dDq1sB4aW3qcRae/lYBQ176q3tH6aFT/nHtWmXwVQCv2ab7HwNBHLjJ2cC9o+mMPFRmIa71i9+3k2JZQWWt1PZYXSX20b0JitQHTVJLRjydAioUTXbJI0T2axv8iKA3NVMJR8O6CDqfu3m8A1IzCfEBqfOuPBX8qJ8DyayTJlTtlcz6pzNEwvP8EgGzGK9oNwaaHc4QQFaz9HMCwFoB8+pUpi1OMAXHQtU4BOxQKWwMDl7+trQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSBz3w8j7XKAOYuo4A3UhXPN+mOzLUBU0fPRgp+5YaY=;
 b=V5EC4RA04GT8efvyUVe6bMee9S/zs7NCWWyqwR9H+7HEU53wcCCi+y9aESOr4ZLFDVXncmxQqgreHRaPi1l5fSM7GtoJAlod77i2VWXAnXMzo8+YugKWFetat5BPKTMES2ROUkmPavgZtEeBYG2kKBSWEADQrG58JOY0Bwu1BKAN1rxLEcQCeHs+YOOqxHEIDxYj+rnYl31NtDqgQRSx4Gs/JxaUebrFj/ArYjDsneYkkUuny4bxsk1+ev1itAmHLMbsciADY5d42ZNvVqZ9bSS7srAhExLyGK43T4pUjDbg7SRZMFDxFmYSorliVaMvV+/j8WpwFRt1dhhkt48Ajg==
Received: from AS4PR10CA0025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::14)
 by AM0P195MB0516.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:16b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 13:23:29 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::f) by AS4PR10CA0025.outlook.office365.com
 (2603:10a6:20b:5d8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 13:23:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 13:23:28 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 25 Aug
 2026 15:23:28 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <openembedded-core@lists.openembedded.org>
CC: <yoann.congal@smile.fr>, <upstream@lists.phytec.de>
Subject: [wrynose][PATCH] kern-tools: bump SRCREV for conditional 'depends on X if Y' support
Date: Tue, 25 Aug 2026 15:23:19 +0200
Message-ID: <20260825132319.3151755-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004A:EE_|AM0P195MB0516:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2d8df4-f124-4a1e-112a-08df02ac0d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ssQE+XvdY8wTf21+ODZhURissPWHt2Q6gk5+EwPW+sMhtOogcPG1riqtWK3z9rNLT+7gSduLPHtKM1Q3PFgz3q5NdERRQCbZxrzq/jc1iuvpmAViKK2fLFBoe7H9aPGAg7YCs77PuHb19gHrQSUHCRTw118yZ3rNPn3CcHW+8eBXlZDmJfV1Q+Yvtx+5mTnL/tAbU0yT3Hk9FyFXALTfAexCIQgmTDXLRbLakUN5c4200/3TH8QNNYDS5JT3/MnsELLang7v4hq6T/NIfhGVuTRkT/HnShi0Cw+Xh3WkJv6ecFPHFsfA/UwBvevby6jOutNWKSuwZ4ozhvO4K03xJSl2qX7cYfi8C8rkFUQfbzS+IQBV9Ukdc+eYB/LUgO9hQ7fHy/cZZj9twQEDhxi+7/O/4TN1drfngYv44qk8hkvONoiUcMz5t3hwU8MsN5nd2RrJIOmEBSD/P+f637ZDOBJTaUpjfmvMtafIvGrVc+jfEDImPNnbXzEnhb5MRs25yf2V3eAjsfReACDYJzwnxuV2E/TMGSLWEb3lmub6wRzGuhuMV3HG7yXkveKJZoTCQuxEEYJ2efDVw7Aii2zHtyCR2vkMyFQcx8l9BXLGWpeAQ9vyZGFbb9sRUObhacf+PfO0SUoT4oN/0gyoOdxxxcPvlM/lXENL91rAG9BksFq8TT9JdyuwRWLHUOxg5Unq
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IkhrtsLTFf0gKYdXKHHQm9rXzhOOZsczdmY7og2VkfZ0IBxZWyQcK+X9+1TMR4eYISWClQIPlgV3mHZ29fPzFyKV1eJzBHBUDpOqc1XE19F2TFFiQ7lO0NVI270XoaQZVuf7cnw/o+E69tc/VqLwpOgxOhiCDTuX1W91Hg1n5wxbqoP2lmR72FtG5o+mjfzd326ZL+/i8pxzp2CvAv1g+faq2QesLgeS7NQGclHfra8PT2aY1XNygZclrqAB5hq8QqqbZlbXaIJvEe3OGup+Xq+QNp8/DS2hCO5xJSnhabY6Cs3QlAo+mMCjbzVn4TZpG3awraE+lH2x23bJm6D50QjPjeBsG+NldE6h/zzZSAmp+LIX1nhZlJAPX6Yn5dr6LbVZousZ5uOwfTey1oRHbDsSkK3GfgCDJmvXG8SDew0opw1hKLaixnhY7pVGaOFU
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 13:23:28.8282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2d8df4-f124-4a1e-112a-08df02ac0d2f
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0516
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244239

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Pull in the yocto-kernel-tools fix for the kernel's conditional Kconfig
dependency syntax (kernel commit 76df6815dab7, first in v7.0). Without it,
do_kernel_configcheck fails on v7.0+ trees once a config uses the syntax
(drivers/hv MSHV_ROOT):

    drivers/hv/Kconfig:77: error: couldn't parse
    'depends on HYPERV_VMBUS if HYPERV_VMBUS': extra tokens at end of line

This SRCREV also carries the symbol_why.py/kconf_check audit hardening
(surface parse failures instead of swallowing them) and the new hermetic
Kconfiglib self-test.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f592ee59e90e536af33648112658dafe00f5d0e)
Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta=
/recipes-kernel/kern-tools/kern-tools-native_git.bb
index bd90316050..2e13e4ca31 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "\
=20
 DEPENDS +=3D "git-replacement-native"
=20
-SRCREV =3D "a4a362d9f4f0abc8ab145a8673166b9bd875731a"
+SRCREV =3D "96a8d58bcd260f104c193a81b727818424d7b263"
 PV =3D "0.3+git"
=20
 inherit native
--=20
2.48.1


