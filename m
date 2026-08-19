Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A856C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 17:25:14 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1682.1787160305976962392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 10:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=VxO8hMt5;
 spf=pass (domain: axis.com, ip: 52.101.84.4, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y60H93iej8hwGRt8F2/+sXkicUxxYsSjUfiOP7mtPP73QBZSast+BqNCHxqqkNDjFJLSFtB/GgJ+1kdzsksY/LLoB00tbPLyDWvectzV+35qkBSGQtQmWL+hqwdVpDSiCZ+HUVDuIi66bvoXl23c4O+VCRFf5URaymQ8MSHrg2JFav53t6WP69nlVODnSiNWI4sQlwHTUOiRAAsQqvCyq16TGPuk7OJeDcDh+EBhqSIDboYmFKwmRJuUagcfVwEEZJ1PfJtYpHoxH7sHldXs9qDkW1fBskQSTlLulvEQ/wbEvEGLaZlWiyEpTaHPnexBRM70KIBqVjZGoL6VmS4hXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/o/2wHqR1hJD5iZ3dGTxcGef7LwZ/yZWe9U/+OLESPI=;
 b=fiR9PKqfuIc/BsB5p9dlrCksgSSiIS3t9/hlRNhTX5EkgCKDRzSke9WqXSzA+PQ3MH1J6wALD2s5gWRUU9XtdzxDeAZdspFBEy8/78c1jvXRXxSNbb0TL9BrMMWsgkjxVP0xIQVLMNzEV1aGzFCngg6baKLwRS10kYZ/Cfao3i429KUmM2aAxBzauFJGMN23ik8k3hye4AzVuUA843vyktOWFy8Wg91dDeHjDRDbRwXZ9AdWYc2ZAwxblbuWN65samxB8Gv5ZBlDdSbUZEfjsnTA0/WIqeKTrITAdEIp1IBMS3m+Trw7kZ0GNRxa9BlMENzpuGYRufrjbOfsfIx4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/o/2wHqR1hJD5iZ3dGTxcGef7LwZ/yZWe9U/+OLESPI=;
 b=VxO8hMt5uB/0B16kH6XF2t4hnAXiXvWVCjQ64cTamJquuY1OjbcsiQ2c5drZtQrx8SWkrsdcJX8gjDAvRZNcnDTk/GknXEuWOr4W6X2kAJ6A718O+WZ2CyfGc+xY/UZRUE7JrEngyqhVskRg6OI6XvUSLTOmNm9EEksBJquJ/UQ=
Received: from AS4P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::13)
 by DB3PR0202MB9036.eurprd02.prod.outlook.com (2603:10a6:10:438::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 17:25:00 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::13) by AS4P190CA0026.outlook.office365.com
 (2603:10a6:20b:5d0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 17:25:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 17:24:59 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 19 Aug
 2026 19:24:59 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 19 Aug
 2026 19:24:59 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 19 Aug 2026 19:24:59 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 3D04C617
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 19:24:59 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 373EC129F1B; Wed, 19 Aug 2026 19:24:59 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] useradd.bbclass: Look for usermod when using GROUPMEMS_PARAM
Date: Wed, 19 Aug 2026 19:24:56 +0200
Message-ID: <20260819172456.2843283-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819172456.2843283-1-pkj@axis.com>
References: <20260819172456.2843283-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|DB3PR0202MB9036:EE_
X-MS-Office365-Filtering-Correlation-Id: e1365faf-40a1-4d53-6014-08defe16cbf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	zxsHZOL1rroHI8UrLoQs4rlqeDyRF/gjTVpUmPazwUfM/LLI2mYlZoA3qcAqHHwjYHkBV/kjaK1cRi5gaQ7yvlvej/i40Yj+ER7qwp6gzll2+APxrAuk4G/Pi3Zw1oT60/+umhjIKaj/rmISqWt7RLLfyoT9b4VD+x8OjmHPc0k22MCjfZRocPDlMIUguJ5gYob6hsR+ryuhipk3Juv22psdtDfBju9VWio4ekAm5wailSSw/g56k1FTZUp9YeTzbNm2WOZx1e5RA08v9cLU9kXv0bUVM2sXNsRlVIIkF+0KQkHQDTEDmgquXkr7krnnSgZbR/qJ/YX+HJTWYdv8wtxF0kY+rnun6YV1lpkTvIqLP87jZp/YLtHIGq3pjyt+CaCCQpNdiI8T9iWfQ6qqqkCn/qRnBdb/PN6aVdVSFFZI2ih2vKnL/rcRj2UpVY0sF4CkUNAMko/HSC5C36GINcAi9txUZWIAhWFQFNn6nIpsEQSyq9lGgnwKOfKM1L19JmxwE0gYwDedelFuVBVqtsSLnjM9QzHuDaMoh119OYsAPn4BajEHohOSh4Zd395OtnnF3DhkMA/rCj6X9jHOrryd6hb0/K9VmgIsd0eMy2A1V+0Ro8cF28AjHWyMg3nZ9PS6HEpnKjLjHH0E/mXJkKiLrbt+Pxb0S4bTFJRsxLRrLwjPxSHmS7Ypa4me7ZjWLL+aa7uUoxkiF04/uEmjYA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5ONT3ziGLUEQfFMzp+e8VguIgwOtkFhEjtGlD4SYXWPsv+xQYD5mfPzIfvfv1a2UXWZdONJkxYclc1PPLhA9//foxpumcBfCIkZd7irL5syTyZdNjOP12xQ0swLbQ1dNn5YqS12d1+7AKK8vsibcta+g+gUQmpqv7sNPMdy7JFvasPhxwMScvcFqG7qgtMZucaA6RPjKDYxWmeNMXnH4G8WAiTYgxJI9RymuqdjhkSJT0bYoAMeIwMjYvu7NnRo7Qd1V7xewDmaey97JGSft2phhyfNs/4d0zxegJan1dCZNiweKPAszqdBtG/j0Vb9Nxe71mQ8Mbb4OCJmUl76ufKE2cwjwc7KIGFwjcEGlTODyjL9vN3xcviR/0EkQ53E4I1xZZ/HSOrA9TfoTJbfLeQK2R3qsnWJ4qTbsWb+BJNyEuXocbx2yzlZeDiXi669K
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 17:24:59.7391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1365faf-40a1-4d53-6014-08defe16cbf7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 17:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243778

Since support for GROUPMEMS_PARAM is implemented using the usermod
command, look for it rather than groupmems when verifying that the
command exists.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd.bbclass | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index c9f24bf7f3..4a07394a56 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -155,22 +155,28 @@ common_useradd_sysroot() {
 		exit 0
 	fi
=20
-	# It is also possible we may be in a recipe which doesn't have useradd de=
pendencies and hence the
-	# useradd/groupadd tools are unavailable. If there is no dependency, we a=
ssume we don't want to
-	# create users in the sysroot
-	if ! command -v "$1"; then
-		bbwarn "The $1 command could not be found!"
-		exit 0
-	fi
+	cmd=3D$1
=20
 	# Add groups and users defined for all recipe packages
 	case "$1" in
 		groupadd) GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}";;
 		useradd) USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}";;
 		usermod) USERMOD_PARAM=3D"${@get_all_cmd_params(d, 'usermod')}";;
-		groupmems) GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}";;
+		groupmems)
+			GROUPMEMS_PARAM=3D"${@get_all_cmd_params(d, 'groupmems')}"
+			# groupmems is emulated using usermod
+			cmd=3Dusermod
+			;;
 	esac
=20
+	# It is also possible we may be in a recipe which doesn't have useradd de=
pendencies and hence the
+	# useradd/groupadd tools are unavailable. If there is no dependency, we a=
ssume we don't want to
+	# create users in the sysroot
+	if ! command -v "$cmd"; then
+		bbwarn "The $cmd command could not be found!"
+		exit 0
+	fi
+
 	# Tell the system to use the environment vars
 	UA_SYSROOT=3D1
=20

