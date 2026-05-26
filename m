Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47D5CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 14:03:58 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38025.1779804227971927275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 07:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=FQP64rR/;
 spf=pass (domain: axis.com, ip: 52.101.66.9, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGNN5kcwB1bZRBa/TPS/IaR/8Ea/ZwTbW/WFTlL/Ldj+F1RcSTKct+QN6Zc5aWdtHcBvW9IFam5RieJNZ9rdTDcLfkFuOqvvNdotfqq0dFyvICN9J6kzm3+soQNVRRJ8CGHBq1JobLH5vLNk9qze/1+iy2Zuq6RWAmgaWLk6EiId4457yyASdsnrvJql8n0KFLklHzTUAY1NXi/f7HkfnuXtPl1G4asxT+dGwBIHcbUNz8gz4D0dDvTdijaf//3iZ/Xtp+yKYHkGcu+LJnWmupwbqpffM8/r6qL/Vxcd12T88ip/VRlApbdBR3Uduf281WcXKzQ5vmwTw8RRuaYPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucjiFwfCFQIHyPWggtPZc5D6KtxaAJ9w2wDOFxd2t5k=;
 b=Anp3HPJXvlj+Qp9Z9NF4waO3DqBYsgh0fN1sbXZXRwh5mXC0UyT+dAy67Ots+HKfLjtXtS63VFrM+9t0waXj1rU2M/UHvDMXk3XgPZuM70kwUL9uJBOLsGWRcYpmxx63ABf9XJux6Ryilq2ycCMWa0SsrG1PKuDTUu4iZeXSErsZmIJQYnrc7KAj3PNF8pECYKN5T49p3XO3Cp4nBamp9Is3f6dRi1WbdDWWNXBx3VBhhEotIIzODT0NUB79XFxylBjrZ6sIBk709mK1+MHJtEj2E3exPkrHHLFs0ITqzbWFqgNvcEnmZlDjuqLZqjxNoHUExLVVMbx5zJt7eJMxhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucjiFwfCFQIHyPWggtPZc5D6KtxaAJ9w2wDOFxd2t5k=;
 b=FQP64rR/HFkOJ2GFLhX+r1KpTP+kcbjD1skBLSG7cJ4bSym/sKFDD1SiKNVeQRGchn4cQnbxz2w/aDNOfB3Fy0AouInbhW7tCLdzXU8eO16EK+QSFFZn0bZp8rGJVKF1IEYtrpz95ZYWwk3B+vwOOksgSDbkK5chNTmPK0OQYUQ=
Received: from DB9PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::32) by AM7PPFB2C401705.eurprd02.prod.outlook.com
 (2603:10a6:20f:fff1::81c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 14:03:40 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::1d) by DB9PR01CA0027.outlook.office365.com
 (2603:10a6:10:1d8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 14:03:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 14:03:40 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 26 May
 2026 16:03:40 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 26 May 2026 16:03:40 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 353BD7CF
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 16:03:40 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2FE43122A1F; Tue, 26 May 2026 16:03:40 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] staging.bbclass: Correct a typo
Date: Tue, 26 May 2026 16:03:38 +0200
Message-ID: <20260526140338.2803319-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9C:EE_|AM7PPFB2C401705:EE_
X-MS-Office365-Filtering-Correlation-Id: aa343538-95a7-4342-aa84-08debb2f971c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	vOFup8RcpBpVlImEwZGWySjK2zzsqqMx09NcpZPwR0E7xmr/6LqEro3Vlt9Xg70g78H4Rrd/nmmWUO5RSQO9CHYN6rN7SWduyYC6JKuKmFIYiOCMCAiNdOHQZ2z4WYfgF66zVaQry3O1doZ7VvJqlmC3vRs2m8zkb5Fdg0A3uELSigHtLmlpRSMfWDokoNuxvmG8gXL4a16CFjtsfd4p1QMegKpMQUy85ozpBbJT1roNso4LL/lL+K9Q5ZxkAfTqbJkFFLr9vkn7SfeeLv6OYm0895lxXV/Dx6Lt9r/cdTbJuzwkdc2hC4wzj/HUCKu/W9kxgX6AnSpOfXEfBAs+QSXbhSrOJiEoJNFi8+XP4NltpGOwcxKBR60n1lgfVOQ1lzi+uElfSNbHSHOC4Iw4ouM26eZa5mxx6CbH4exCZdWs0JOXP3zhfUo9MSObXNUes4p+ZMKpDVkuwJZ3hh0XnQ/YK1hRNgImkuE+/Gq6tS9dxvyuMww6q0PbELjfHAEcUQ2ebRvWvme8AQW1AI17XrOKz5pbPq894ozHzo5Q5L4UPm2PC1vOzuwy8JPdjgrY1svWWxEOZ8wxWsObPX8mRpK+clA0IGNjKfAqc/zAFAEdn/91y+tGy1RvGO+029OPrDt2IU7SQOOchgSdBHh0pTknm2gLGFeJgvrnEkTc+02sTeNRLINvjoIwbtvdhRswBvoMaq9M8zfS2BT3SFKQSCnPkLbd5Qfh0DNI/cGYszI=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IVWlpNDN1IHF06iFbdFvo/x68jbIJJlq3VOJu5K/Kkx2yswlgv2MzFjQLdfYJV6qSKLw6LOph1MByFHWjiRyM5yHxkwRXWF+GKldZ39GbL9a8fHLBAMc32bGouXnICHd6qqdOScjiNHq9xT5NstEecVIhzrTujbZ8Ya+L5CWUHr/8XKRbx4ogCu7+kewmnWIHd8napve7Zdx/u/jfD9ddO7axWnT9uGq5ntdRkf9UotlXKM3ebHXf5n8biTu8v8IyQ76ndaFuUmSJtlR2406QSYjj36iDpAMZMJu9/WzuXLlrOqewAmiLkhLc7XaSgfqOu7ehZ1dML4i/C0ks2227sQA9MLGm3FnNZB/T0vTPhggcB0DED0CnJZ/12c1hJK7uuWsWNvzmTqHBmsiCg+2zbJV5lGQuOWe1R84uPAU0Edg5iyPiEmZVABL40735HOa
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 14:03:40.5803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa343538-95a7-4342-aa84-08debb2f971c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFB2C401705
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 14:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237611

This corrects a typo (us -> is) in the description of
extend_recipe_sysroot().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/stag=
ing.bbclass
index 1008867a6c..93a7af0005 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -250,7 +250,7 @@ def staging_populate_sysroot_dir(targetsysroot, natives=
ysroot, native, d):
=20
 #
 # Manifests here are complicated. The main sysroot area has the unpacked s=
state
-# which us unrelocated and tracked by the main sstate manifests. Each reci=
pe
+# which is unrelocated and tracked by the main sstate manifests. Each reci=
pe
 # specific sysroot has manifests for each dependency that is installed the=
re.
 # The task hash is used to tell whether the data needs to be reinstalled. =
We
 # use a symlink to point to the currently installed hash. There is also a

