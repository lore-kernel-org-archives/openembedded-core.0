Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1992C0218F
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 20:20:38 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.59])
 by mx.groups.io with SMTP id smtpd.web10.22845.1738182037128934956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 12:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=w7AKU9DX;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.96.59, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZ6yXdkQxsTCir2/KhmUvhRkbviny7OjvXnLLrZ55fFDOJML5ka0EahZRkRtA29wdR0T9x/Kyr5I31OfvgHveThc1IG3/DwUy/oCA3ZnGfOJPzIW71yxNlb5olImkJolK5IbMRQJZcdT5TRTMmqScnMi3EAhwstkdxzxbYowhw6lcXom/8rj9hFYfyYJuC9uVoSkn5YD80oqA2e6ooyWVNKIHwGzMLf+5qCQJ8rbMv24VVy6mzndeTQAxXzHol1mCeCsICaa78kUtRZ2EDJS7DJuIL+CAaeS1eto7D4o39LQggJTfkJjb9biISQ8JSYLY7yslY59AzLKIktA9i3teA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kUVxHHuq27/f80AZL7g2Ae26nnrUoPuW8nnia8Ge2w=;
 b=C9ZOS7bUY9T7PGhtMjYI/2kkCvtb7GI2sIQphacGZNRUAifogTi+x69t0m1kpPFhdZ9YHlHLkW3pb4EFieJ+k94mdWZRnHrsGx8mieWNF1DXfQXfLkoiKhxPhtVaMgzBYJL7t8yS6aGr46iVEPMGohqMgG5b2iseh6nZ2/g0RFbCrPfNd5OBGYRtDeYS3x1l4ZXsmqj5deu0nt+d3lenCIh4uoOHCVYucZ/uXo3Bwtb6/+P5kUxZtwmqg4Dhopj1QWPhN+70eby0nj5AFuIi0xIald2zXTLh1JKwBDh/Sy0FxRumHga2J98dZB8aBbfiEnrXA44lfiJKfOJTnGYOdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kUVxHHuq27/f80AZL7g2Ae26nnrUoPuW8nnia8Ge2w=;
 b=w7AKU9DX5T0ntyM/2iOIlAUlcGYBr2kE6MiSapagh9q6tNjNAnI7sRGoiV7tZDHxkmqacaPxW+lTeZiDxoUBGPtUWd09DZTt6t/fRjmTKFCe8iTUmLwXSpvMb6TeAGP+yW1PnI03atmqwuSnp0ovgN41p2H9ddYk08b3C9k1WTUBzt33jwH2NaVQNC2QbWuRXif++ZoHbF8t0LnulmWFaVBr8ZCuXmzuZ5K/X2b/p+R/U3dZ4GEkLBYMp4h8V9jl7vYW802cAAO0bC0JRFaOyIEfBxKl9cPsUiMMxbWJmPY4OeBuryVa7e7ZTPr6+x4G/wQdvuey8AX71tZ+FV5lEg==
Received: from PH8PR20CA0008.namprd20.prod.outlook.com (2603:10b6:510:23c::18)
 by IA1PR12MB9498.namprd12.prod.outlook.com (2603:10b6:208:594::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Wed, 29 Jan
 2025 20:20:34 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::ee) by PH8PR20CA0008.outlook.office365.com
 (2603:10b6:510:23c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Wed,
 29 Jan 2025 20:20:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 20:20:32 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 13:20:26 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 2/5] devtool: standard: fix typo in variable
Date: Wed, 29 Jan 2025 15:20:13 -0500
Message-ID: <20250129202016.1833520-3-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129202016.1833520-1-chris.laplante@agilent.com>
References: <20250129202016.1833520-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|IA1PR12MB9498:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9e0f4f-391d-48e0-9aca-08dd40a261ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U0LyJtvTZwvhwqaL7DUvKZDY3eVGyAGsdvBRC/+g+2oamPFI59I9zmr0fQRw?=
 =?us-ascii?Q?J9/MqPVJstJeMnuc6OtByN7V7KF2Nt1/EpZ+0OV6ag/PtIpK3PN/Gj9RmiNe?=
 =?us-ascii?Q?aulJ4PxNTxjhPBQhrVZB/FRbpbpw/0QE+kmQCJ0WEEEuoJoMdFoixi2EIT4Q?=
 =?us-ascii?Q?FxOLul2Aosx2w+QpzzoTvsO37gsobtzPgn4GAQpcGEO2rHZcpDr4prU+Wcin?=
 =?us-ascii?Q?aaFr6i3Afl88Axyp7kH0Di3orkB/mEmqD4LX8QMLM40IdZ/JYlV3rwlrswA2?=
 =?us-ascii?Q?/GBuK0a9D20C6oMNksGTnhqNiOySSPmd5MhH3y1Vd8uP2vx5VuRL29B/YF1k?=
 =?us-ascii?Q?xUKiyImYKjePLkcK49/XXeAthPmXf4VlpZOVBUGJeUuSzZtLWM+lGzmdSZJ+?=
 =?us-ascii?Q?0stjIbtiavLw4ofC5J8d8X75bx0Op4Mdq3WvempupnoK3E9D44s/M9vt4CV0?=
 =?us-ascii?Q?RKZ51DXm4HJ8QheCaa7CWpkJs+W+9BzL4N+7/MEduYo+VQqYjNxX4iAZTDBN?=
 =?us-ascii?Q?sgZyBdsV0EtHSbhcyHfia0FT3awhOiJUYprY90lSHwFITtizSseETUXKfKa9?=
 =?us-ascii?Q?/cd0gUzhnqWIyyG9YsbiW6GUeR8FamLRshIWPQEj2OFTidpOIy4cycOfZeBY?=
 =?us-ascii?Q?Q2l1ufnSPkEC0GZUl1es5OdNqdIVSmTk/kG+VFbn2xfLkCLk93m7RVBQ3M9c?=
 =?us-ascii?Q?wEMW7W1s49OPO7458/5Jlk7HF7GmOgaUJqJprEToVoGyMoc3apKRatarG/Q3?=
 =?us-ascii?Q?zWiRMvuO5j3VBU/UpX9vpyUcDeUhjkKw6LYZmBnAYKBSflcyZrh1ZaJ26Kg5?=
 =?us-ascii?Q?yDCMxMd81FqB17a2CYtdCtL/gKRrxT65GOBLgj/nPc8TnrqIk+1a66WSEWhJ?=
 =?us-ascii?Q?ZSFwIdPql4iUW9UoHIsCIoNKwWjebJb+i6L57kgHS/9sLHi33A49FXGHmCqX?=
 =?us-ascii?Q?yNM+74HuGA9MtKK6tYSvEQac+pr09LeoYbjSbWWUGbJPUfrX+WX8mJsFm+wy?=
 =?us-ascii?Q?6bOqjvJsHStE/bnAhvV3bKLVsV9Dv9nQ5qfHxZ0jjPb9vFmngnJKeXZ+w5AE?=
 =?us-ascii?Q?OUZHQpGJkSg6SBgZGK9clZrskh7GEp5RVUZNt9LfJjX4msT7ibA65IN42ALR?=
 =?us-ascii?Q?RwyyBQCqujCF3t7Q5HHjMnR3WR2Qci4mTjEQC81reNnip7W/kMTbtoW8ACHh?=
 =?us-ascii?Q?w1UNOD2JGd72IvojUiQu+2dxwZt4ALUZggBLpEc1F2AsYiheXWEprnKHHEzp?=
 =?us-ascii?Q?WcMB6F/n8s+6cYOhiQ/IQQdIRuSgex9xNXeK1e8PPgOCDkja8T1OCsQNZYpF?=
 =?us-ascii?Q?WqrQCvAEzn7vgG+YPLBsAL2o03oW+3hUiOy0lmPtWX6RmNA7A510jQj7MRQD?=
 =?us-ascii?Q?YxyM94wi4ZxTB+k8Ko76zYjvlmJO2Rq3XZVXPrwZkOYwVsdWeCSDCAGGSIUt?=
 =?us-ascii?Q?YS+iFD5lCBIaCA94PhuA8gnG2pznwesBvm5VjtMdzwvZpvKx/IYsuSF9xhwn?=
 =?us-ascii?Q?EGsT8NhDrQUK9mg=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:20:32.5754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9e0f4f-391d-48e0-9aca-08dd40a261ec
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 20:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210413

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 305536f6f0..ca89c8e882 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1477,7 +1477,7 @@ def _export_local_files(srctree, rd, destdir, srctree=
base):
                     added[fragment_fn] =3D {}
             else:
                 if fragment_fn in updated:
-                    revoved[fragment_fn] =3D updated[fragment_fn]
+                    removed[fragment_fn] =3D updated[fragment_fn]
                     del updated[fragment_fn]
=20
     # Special handling for cml1, ccmake, etc bbclasses that generated
--=20
2.43.0


