Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2289CD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 09:40:54 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11736.1781689251591804801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 02:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Lt9bEK9j;
 spf=pass (domain: axis.com, ip: 52.101.83.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6jLBWMaZ+ycHS74tWyBLXzwV84uIYkeC3hNBUFgKAVu6CquzucTCTxXBH9MZBNSPUZrnBtJ7wuzAeryKJPIH/TY3k7C7XT79PHbZXE7iXU/xMF53/3FLT23VYFom13BW+9cGrU44+uyOQZm/vTGc8VfbIeyx2jTfJNJX3E2SM6TzBaHPwo1tBrGvBujXayC8LEDWKm34zlD3+ZztL3eb/eESswz3pmbcimG5djvEZIb1FvLR9Z+WhsV3uIUs2B5AlmM2V2GjAbk6viEFzBVAHb20dSGKDLpulVOWoQCx4g6dVLr+GV22e0E6uPjCYkglRqDBeeKroAVP1bH/5uB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPSMY7q9Mbzg4/RRAGEdjNC2Vtie8TJHGLY/g9ZfqYg=;
 b=UH4jHLmj+8WUyuqZDbwKQIxblv1J7Yh9W9TSWrKi9QmbzSp0GDPkrUdUJa0SWxfI0WkcpuoAfLQ6pStWWtJjcSTlW8J3tvxleESj8JgL1MZk1EOsX1E+DsQbBqUwviBLvWWHjNm6WjI1qyZ7xSXF0tUl3eVkDg8q1jZrom3UU8uQbpRCjUGDgeEjTYJFltSp8KeuRBcWuuNiquy07j3JV4tiD2NZHrLYhKSoVpAO3WBgPBUG7NAAmjgOg47zOZkmHgMmjnFAT2LVj9rfbLfSQXE8ulJtpvOm/vEs19raYlRh6HAT1hNrPs5aEZb9imQGul/9sG0YT7IYsrMd4G78JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPSMY7q9Mbzg4/RRAGEdjNC2Vtie8TJHGLY/g9ZfqYg=;
 b=Lt9bEK9jEG9N5kZO1gqFwgy3MHM21jQFkVZdZssfvKL7zrLNz5tTyrnkE6dWSRSYABFbI7S0H6X/XJyIaeOVrM3/erm0VCKqrmqcCDHI1ZwRaKIwGZIcfJ2svZW+M7FPRuq7JZVCZRCXf/aTXTjRptgniuRCadk/EZ03v16WiD4=
Received: from DU7P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::22)
 by AS8PR02MB9316.eurprd02.prod.outlook.com (2603:10a6:20b:57f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Wed, 17 Jun
 2026 09:40:40 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::2f) by DU7P195CA0012.outlook.office365.com
 (2603:10a6:10:54d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 09:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 09:40:40 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 17 Jun
 2026 11:40:39 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 17 Jun 2026 11:40:39 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C0B352A22
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 11:40:39 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id B6774129561; Wed, 17 Jun 2026 11:40:39 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] toaster.bbclass: Support layers that are not Git repositories
Date: Wed, 17 Jun 2026 11:40:37 +0200
Message-ID: <20260617094037.104230-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|AS8PR02MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3cf18f-81ea-4edd-25fe-08decc547e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|11063799006|56012099006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	d2oIVdoAWLOOnNAn445U8Mdq4fRf2Wb38j6qqZK4qoEscJWjh/YQ/sOOymRY/2SrsplFJM9xSe6PVzZSr5l8QVC42RfDWKBz+d+xzqfFUFMrTeppTSQBPWq10CufK0I4HpmQzpjfkgFD3GWoSTB7GqIICD00jcjJFXn26cPZxiZpc5a3SrFuJiYlwwYIM6Djn3EDLSYg8yQZCnvafNxp95hICueFBpqNK+1K0Mhub7+JH/opUpmn4g2bp/oVRd899nizILDU0v13EAMvG4mqiKF2GHgbLMAbxCuNtHlZ2OLw8AoHOO4EVTRWAOdDknRv6//IpmWX7PZQKbMt5dN9ibvzzzqNrf4OV1whdgR8wMWr8njmkaLw3ypNycyKUfDmcURN+5cyt1I4iLIBFle4iooPolQWToAr4h2G09Irv9rMmKNteeHAWfnUcwGllM3ud+2FIqV8C2U8VUjhnob5HDlRY9qHzsOkSQAVEO6LNEUZEN1Iq1rkts70JTUOADDV/M8TJvXytNsX4Mca86Bw/238BkIQEHrszCYlpWrVTgP9RAh9Ef5duhyL6Tyvz9fMMLrfhXisjtYc4LpTf5h60/Mxyy0S3e59b7jOnFV2rUkKslEH1IRQbe7ypa8ABj1waNGByZV+ckUO5IcfmNnUNghu4nux51i6ULExuQxQ1Fkkdqz9IjtKIaVmn3YXafFw+RDxJyGjyaoDRYuLHrjXbs+na8FdylmiBfBfPiOnc5M=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(11063799006)(56012099006)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	daU/ChEL9d8fq9pgXyYJmHVzM19yTC2jQfW8pjY2PE03R+rXxRHynHMbzgmQoLBaLHCxsOA/cm7m1Gm0c2Yv6e13pkyrWbYvs29hx7P5GVc6flN5AyqAboUAbyBknd0KyDopQY8jkEmLQdQctwoBfiDrVobyOs9DmqRqiiGHUkLafmT2nybkVq/WpwPXrUKGRc8oO+iX2wHbOtSVp+HMfotHv1RZQpn/2Gt9KY9TsIKY9sQTCiNa3nYdWCotZ6PBeB/82YNU4kykBxNUFzvmeSHfZhE0lb8u9d3AfCL9YFkmabvF8IkQR1VkhwVjqqS7NRLYLDOJ0f98LYrw3ALcbA5ir+Qokt8v98V2aWjTWYoOd0PhfgPK92VeiCWp5E4JAdF2tneVcLGkgIjpbhHeU4vli9038wfq3ZitVxstxabS3ZF6INjRKANCM1SgP2i9
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 09:40:40.0867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3cf18f-81ea-4edd-25fe-08decc547e4b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 09:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239026

Not all layers are Git repositories, e.g., the workspace layer created
by devtool.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/toaster.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 5878230062..f6a6f87de5 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -32,12 +32,12 @@ python toaster_layerinfo_dumpdata() {
     import subprocess
=20
     def _get_git_branch(layer_path):
-        branch =3D subprocess.check_output(['git', 'symbolic-ref', 'HEAD']=
, cwd=3Dlayer_path, text=3DTrue).strip()
+        branch =3D subprocess.run(['git', 'symbolic-ref', 'HEAD'], cwd=3Dl=
ayer_path, text=3DTrue, stdout=3Dsubprocess.PIPE).stdout.strip()
         branch =3D branch.replace('refs/heads/', '').rstrip()
         return branch
=20
     def _get_git_revision(layer_path):
-        revision =3D subprocess.check_output(['git', 'rev-parse', 'HEAD'],=
 cwd=3Dlayer_path, text=3DTrue).strip()
+        revision =3D subprocess.run(['git', 'rev-parse', 'HEAD'], cwd=3Dla=
yer_path, text=3DTrue, stdout=3Dsubprocess.PIPE).stdout.strip()
         return revision
=20
     def _get_url_map_name(layer_name):

