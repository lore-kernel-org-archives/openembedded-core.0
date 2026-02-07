Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F1DEE6B6F
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 00:29:12 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5127.1770424143314261178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 16:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=ldIrsXku;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.61, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNxLmiFVTItGNtTMfQBt5eQn1MW5JPjMNaHRjBLszB8cwLPvxTIOLhVtxt4BBeYY52jwBsM6dSzCwCI1OmSSau+9QKP5Pp7Va51V1zVP2UPpyL9XR/bJe+Jy20ZEuBEIwRVtNoHZ5HoxWalIn96JEOZBw9OIHv+m8w5gmnWNkl7oAaAF7JUAbqjRaq353eoCj90VvH1SeQZYr4IHQwPTpZNFIQ2WDOtYbMrBZxydg55pUlJ0qPHH82iPRH6uWN4WcIcp/j/R6Ta5q1YaQlD7v81KcMa/KFwsjMnLgbSAaTTD197fptLEze66/NGT05euOUe2iYQEqDRZGKM4+JlD7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPi0308F8sLiRyCN173g9NclUjn4lOzWSlCgV3tjGzE=;
 b=c7596RVEa2ih/ybj54XgpJbH9ZwkJs/T51dzIbItgsoAI+9f7mLhCAmxIQrCpwtFwD7Ta1oteqONpgATY2jbq9DvLzVxFRo107MnCRYI46eNJtQJuPbRpm52ArcDxFu7oWf1PAV1H23tfnqEK6wFLpobRImq5KR9IqKprRBRsKgCDNPu3UUoKeIMcdphpP9MVWAUgL9egB3+ZgDEkGaCerz0LEX6hpKnoMTPdojfIergFX4+2GxoYTqoiQnbZrHGbq1JMSkj+Rz+4VzGOe93eLHrZ+qW6Mu5lgGEwrcAhSUAMT0UmAC5EMdTe3TTenbizScyAMHlL7DU82Se0ZOz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPi0308F8sLiRyCN173g9NclUjn4lOzWSlCgV3tjGzE=;
 b=ldIrsXkulDctpwRACYvm6vCMfTCA9jFePhmxTZbfiiK0+wrNOuZvqdzT6/hRCQAQdf8Ab+MhnT04pH2sySsPvq60i1vJRop8y3AWOrVAXQndhcSGL7XOeu+15T6kRWlc8mjHNEVM80SKUQb01eJG65E4PevmTvO5AWMnplUA8Es=
Received: from AS8P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::31)
 by PAXPR06MB8532.eurprd06.prod.outlook.com (2603:10a6:102:2b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Sat, 7 Feb
 2026 00:28:58 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:20b:2f2:cafe::49) by AS8P251CA0011.outlook.office365.com
 (2603:10a6:20b:2f2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Sat,
 7 Feb 2026 00:28:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Sat, 7 Feb 2026 00:28:58 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 7 Feb 2026 01:28:57 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1] license.bbclass: directly expand LIC_FILES_CHKSUMS to apply inline python
Date: Sat,  7 Feb 2026 00:28:56 +0000
Message-ID: <20260207002856.2847527-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 07 Feb 2026 00:28:57.0914 (UTC) FILETIME=[BFAA61A0:01DC97C8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|PAXPR06MB8532:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1cb2c57c-0f95-4af5-b5c9-08de65dfe241
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ha9SfmxfRkI5nbJg/I9Fjn9d/Hx4XUsBzwO4IarjxeydxIxrlQEr+resEfqC?=
 =?us-ascii?Q?6WWCwIEEAI09Cd8IY+j1a7twRya2NPVjRJ7uMxCCNGvwACnuThrhOncEfX4U?=
 =?us-ascii?Q?L8x8bfkKV+rcMHtlPU06fOQ0erBkUtwiDlSj3sU1d5Mnex6VDlG5qXM7ZiYM?=
 =?us-ascii?Q?pUhIUpQSTqxbNig8jEzFqndk7mHScpaju5FEk2Ocrj+FPIazrC5nIoYpGtsv?=
 =?us-ascii?Q?m0c1n9b/s6Tnfp+SLJk3yTykTHiCiSA43LEaCVPXt8mtsQmaG+7UUm40M/Ao?=
 =?us-ascii?Q?upIbQN6ozxMiWyZYFogSUmS1k7w91u3wyJHITuftGqJF0gtc56vtZ7Rsf05w?=
 =?us-ascii?Q?mh6LyOcxusA6HwJNo2iwFwj9mvIbpXhUx3zf6G/8O5Te1WH0UAsdUrADCLYv?=
 =?us-ascii?Q?UGhyRuyjIc9W3sjjdf00sdSGRD/6ykcdGd+iDFl8UBH1ydHStkzuetbvQCSq?=
 =?us-ascii?Q?P1D7vDaNcc0HZYwKD9xJxLp1Tq7bhzAyOcZVf9meS/BvnoY2qm0V5JRVkDiP?=
 =?us-ascii?Q?YIKcF2Cx3Ez0bdTeUqUQRrgwnh1MmUOehxUIIvQmzy8Udh0JgdQkHl6hiscn?=
 =?us-ascii?Q?lOvVy3I6HlDbBO9FexRahVnq5ayX2glh5PSxEY6Xe5vL7+r2uLvbgRDyljCR?=
 =?us-ascii?Q?85kRAOzoMSyZjgf5AyiFc87DdlYY9msUk9npjVYfqg436ofuPrGcI+siTCHY?=
 =?us-ascii?Q?5hxf6knHxgA5wTO3uGj8jkYsD0355UPcK3vExJuclgBr2Nis9Q8mxmlTV5my?=
 =?us-ascii?Q?kZo0Y0QLBv8j60ShQi7Ke/3AxwHia6pCKzpjp5P5PBPo2J+4TTv/gmfw35an?=
 =?us-ascii?Q?XPeKGrjt6yfI2F2A5ftN/UGaC84lURtFY2+Wm+y4C44UpmvvhhE1rW/V8Fdd?=
 =?us-ascii?Q?eJ+581aCa3OoTN7mD7dD/KeOnrRIbPVecM3fBPDr2RcxDxcmXNCrAWA9eGx4?=
 =?us-ascii?Q?GnO15R6Ntjw6Jhhx3glXO6C30auLGMYdHYXqrZJVx4Ow/SlpV0sEZUkTVp43?=
 =?us-ascii?Q?jiH4er/CsTMwoP/Owj3uwih1hd1uoDpTAnlzP3boLHvPo2gOWAiX1mPawN1l?=
 =?us-ascii?Q?V6Qk920MkU3c80EDG4ILxsT+wD/CmfUes+CAJnxwKg4XGAQrW+AXZrenoFnm?=
 =?us-ascii?Q?HgwrBgNbO019nr3h04UiaatnQBoVKSnfh1V+odf91zdWWMpEUZczh8pCfQwz?=
 =?us-ascii?Q?Lv9xw315y6b/SVq+9uiPwhxodRRgUPJSfu4RCs63j1OM8QRJl/i8QSPzmJQc?=
 =?us-ascii?Q?QGjnsnoYnsHGFfEXenANvOSIJYZr672T7VMNt1x5afx+AsId09fHdr6iVu3H?=
 =?us-ascii?Q?Nsg9nngepWNjTUiOMX9tKasKgdknhG92G73esaZ6/WxDRziPufFJs4eq0fx0?=
 =?us-ascii?Q?ppAuHEzSZUjD4Qqzuc9PgLpl9NT2scxKG9xCSmuObSb6PMWjk9ZbXf3Zwij7?=
 =?us-ascii?Q?5j7UozxpzAzUsXPDSPVWzcjtCUHTpKCtLaS/R6O5h/MaMNjl6vDrWbMj+UaM?=
 =?us-ascii?Q?2IHyQhKWn3zXU590dBs+Tkksb4qfqvIQ5KkEIyVVsIFDCQgOdyRnh1cwA85v?=
 =?us-ascii?Q?iADOJfx9bDH7k0LiS9lLgJY9ods/KK7TIyUUztvHUDXm87B1S+KoiqhUrXqD?=
 =?us-ascii?Q?8CNLgD1HtWaGx8ZXBoe9C7iPx4gxkZh9iUSDmIHArVjU2N8ynnslFjQTrpMC?=
 =?us-ascii?Q?CcR0qw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ExFoZyqPYZhEMFcuXYnqILsBS0xiuBkEyjFRSjR2RE6WlO+7Lo+ebloy9mP866BBUDQtDO9JC25KUjrTJztrXABrHj07ZyKTVpuQhqFy87uFhiWyfhqSN5/HPY39pqlBXmcaege9Uo0EF3lL+2YidvujcVx9aZifhJgkzmB1g9a5LoLHajX5zErY4c0KZ4/IpTKaQv1duGUTCyiuviZb2M2NAdYD9+2DQR5LKy3Aw3yccvC0/1JJZcqkpkE7y/2lO8+KQaKCh5qoJFfTymiBvoK+9F/naPVqZzpwAk5kMxO4kDAWccvG1rnpgjfoCoMRjgcTomRhESSsbG6ZyP++N1EwkekDsogq/5ZbLVjtbk08lJDJooJCBQWbElk6mTQ4ZFsTACN6Y94l36Kib+04hmkqMfMqI6yHoYUF97+JIVGg7s7G0DzMyQ1mcEg34n08
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 00:28:58.0903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb2c57c-0f95-4af5-b5c9-08de65dfe241
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 00:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230666

Add 'expand=3DTrue' to directly resolve file checksums that are added
conditionally with inline python code.

Otherwise it can happend that the license.bbclass still sees the
un-expanded values and either misses or even skipps adjacent licenses.

E.g. an unvaforable combination of
LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58=
af8d19bee1"
LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${L=
IC_FILES_CHKSUM_MBEDTLS}', '', d)}"

would lead to a
 # pre-expansion value:
 #   " file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58af8d19bee1${@bb.=
utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
 LIC_FILES_CHKSUM=3D" file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58a=
f8d19bee1"
and the license checksum verification on 'license.rst' being sometimes skip=
ped.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes-global/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/lice=
nse.bbclass
index af5f1ed41d..62116ba31d 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -125,7 +125,7 @@ def find_license_files(d):
     from collections import defaultdict, OrderedDict
=20
     # All the license files for the package
-    lic_files =3D d.getVar('LIC_FILES_CHKSUM') or ""
+    lic_files =3D d.getVar('LIC_FILES_CHKSUM', expand=3DTrue) or ""
     pn =3D d.getVar('PN')
     # The license files are located in S/LIC_FILE_CHECKSUM.
     srcdir =3D d.getVar('S')

base-commit: 6ce19709f7835ee5cd7915e181f89397975236c8
--=20
2.43.0


