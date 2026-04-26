Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524EEFF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 14:29:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19753.1777213738434152911
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 07:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UFXSItxC;
 spf=pass (domain: axis.com, ip: 52.101.65.59, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5uncR944g9/U+iku06C3ZtYN2NF+ccYWctvxg9SCCve/IN8S/6PQDu+9OdKRv5R/dJ9rI7e7EpYjI6V938iBXUwMtAJYQ6ocwBrXMREz36mbAhY9pNP3R4R0j/qRFiWgOzGBmlXpkDpHUAUEVJqc7qiTFwRglMqjqOoNAMLX7DRrnsmJW6rJHoBuDzdhLMQ78xDAekiBfUANW+dAPK9OuXJYTi/mH+OMEujHx/rz1UJYI4bd1WDQNAiSa0sT1CB84A8VdyOeZeXo3QIEb5YozAq2jy8hIOlxTWaW9pR43dZkORhDbQHW7ahNsMGb7CKi+YQ5aBNkfcVmoxuNRvPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqXNrfrp6pxoqHBb4/VurqQJQEWAfiPWF9ZvQOGomAg=;
 b=FbKHMXtaXHYMv2c2rbfB2nv/p0pAXv6wPjbb9Gu8Z4+9qOk2nBW3tw5aqp0lhcUY2GO3Ng8zdnX2CJdsgzGYT6Xbpp7lcCXJGdRTKcMP8DcJUVgnluP8p3X1csN8dyIw6GYWAL2wTV10WOxB6WlnOO/7Rgw1U/OoEaqiv1RZsv8gbW+N9VLWuXhREbzzsP4w/c4YAIGYCyTGqGDbgHLM3giqict4Am9PqnuSUrVSERR5q75/fjAMN0fQJnMEw3i2DKkz/u1rs2L93mY3F4DO79enj05AhNJidgwmTXr2Obg+734JQ/YDSQ7V2smanOpznocY4+0DnoIHrScgV8Thhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqXNrfrp6pxoqHBb4/VurqQJQEWAfiPWF9ZvQOGomAg=;
 b=UFXSItxCCkBm6m5UHXBeFNTspDTOMkRli1ZygSPefWhlmsqnMgO6uF+QsLkxJhhEyABVHU/JJD7NrDycIK3xh9/XsUqYx0TvMiiXqRY4qEDRYCIrTAG043+T5XjpSrPqtW5zztJG5OfmQwfYEhENnpvWgda/gyIUeoZtf/GC7Nw=
Received: from DB8P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::28)
 by AM9PR02MB7060.eurprd02.prod.outlook.com (2603:10a6:20b:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Sun, 26 Apr
 2026 14:28:53 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::a6) by DB8P191CA0018.outlook.office365.com
 (2603:10a6:10:130::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.25 via Frontend Transport; Sun,
 26 Apr 2026 14:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Sun, 26 Apr 2026 14:28:53 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Sun, 26 Apr
 2026 16:28:52 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sun, 26 Apr
 2026 16:28:52 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 26 Apr 2026 16:28:52 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7D1705BF
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 16:28:52 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 7754F1253DB; Sun, 26 Apr 2026 16:28:52 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] pseudo: Specify the version in the recipe filename
Date: Sun, 26 Apr 2026 16:28:49 +0200
Message-ID: <20260426142850.2195902-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|AM9PR02MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: 852e58ae-6db2-4b06-9f78-08dea3a02431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	dlqUpqSgbW2THMRloyP/Yrk32FOFFou8ueC2ZzVe/BZ0UGa+l7B1WjU0uKemtx5BOOUOhb+f6pFFL0r976JIVwzMuIJdHHBVbfrKuYjWXYArow/vgAbxmPyHnZo18TI7vVsMDwc83+Xy8xni5rdvCvRqDKmoWnrAxiFJZxQDGAzN7YnUvM9TGtYWkHZR78KTVZP91AZ9MfRpkjiTqdjiQZaqizlpQXflSYjyQ/GRE+qsNt519nJTCbKfSAOH6wEymfpcy/VZo6/xb/f3i1Wb14hv2fPcHJI4TW4kH96VBuc3ZPTVWYOf0liwSzditomS8mGnoeXFDIZ+dc/hlGJk9VLHsOY+FpkOz1nk0gr5UQfyUgDAq9acfJO1BdWj2J50V99NlwcApCgfVRh5f4y1v9G5SI3l+c4yt9BBLDCHt9znVcVmbdiosfCeD+ioIRlCGvc8oUuNcRwwfEDcquwOVW4r+8vzYBIVgwzBYE+WuX9Hp0shzNdMZ0JkGkycUMFBJZefYpRlvfNxN4QjvsQxZwBiFYHDw3FFAOU5D/aGoj1nntllAdhcdkksxP76GonXMbGELL7q/wER/uG4+XyBYRGIliojNogu16W/6IG4y2G6a3VFIaNC+rRKFKPXeOj9FZzaNpFZg6tvvGMikBUZKhIW9NxpyFqgA37SMFSaks3XNJNNQixpmDS3k8pUc7ETMZGRkpPhHY3lnSnidR2XenCKoQY30hBrHSGKcX6zu+9y2bvKDfP8b7jkO+t7UKFLqUpYK1Sxk1osASRJngbUbg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	l2XYvIBx/3WOWzTp+swS2+1IblXUqEdt9USuCss1rsKaRiJGfikMj0/Iw87cumcJ8j2glgvUEvYs1/DEdcaIuPvErJ4MoruXw3jttCGzAPudmAl2g8heGxz8jenS/k2AnPPirU5wBaoUYRyhsIlqX/+vuKwBd4fCDc5Tg8g1+iHP+itbXluDwhiB/flGBR99giJV/vyt/NWGMVqvuOpBTD+H6UMc94/p+XhMudps4mr/pt3Afr1jBJsuYuE6IdzRdzTwbKHV8glSH2KD5dr525zKDto5vIb3PkYxJBxEN5eiDR/3mDSrMQaveneQ4aIsPPIJN2aORRA4Higquz1kMOt0ciocAZZplgr/uPvJOt1UTCQOb9cqMx5XrKE6m3qdUMhTGK/mO9inYnOnDe4ScKH3Xyo5T4kS2irh+/dRZ6JRZy4u9vy8f50Lis/wYToT
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 14:28:53.0038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 852e58ae-6db2-4b06-9f78-08dea3a02431
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 14:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235960

The last updates have been cut from tagged releases, and this allows for
using versioned bbappends.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/pseudo/{pseudo_git.bb =3D> pseudo_1.9.5.bb} | 1 -
 1 file changed, 1 deletion(-)
 rename meta/recipes-devtools/pseudo/{pseudo_git.bb =3D> pseudo_1.9.5.bb} (=
99%)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devt=
ools/pseudo/pseudo_1.9.5.bb
similarity index 99%
rename from meta/recipes-devtools/pseudo/pseudo_git.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.9.5.bb
index 8c16aa7135..225d6c3f67 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.9.5.bb
@@ -13,7 +13,6 @@ SRC_URI:append:class-nativesdk =3D " \
 SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be4190d604=
0282b84c8d97b99072485aa"
=20
 SRCREV =3D "0bad85523ff71f1a84cea5fdf72e7f560c4aeed4"
-PV =3D "1.9.5"
=20
 # largefile and 64bit time_t support adds these macros via compiler flags =
globally
 # remove them for pseudo since pseudo intercepts some of the functions whi=
ch will be

