Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9CAC3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 03:20:59 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.48])
 by mx.groups.io with SMTP id smtpd.web11.2888.1748575257369015856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 20:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=E3jKLMiL;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.48, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqNMosysaBl5FwUI61ePcnZaZfqKds0EzOKCyt+AIvgMFktyvhygo+DrIIgH5OetP6vjYwnEv+hasuB/CU45bap0segVUpzCpy/CjGiMsrJwRN34vJuAU0k6r9yVbxEUt6FasNKd04/I8ptUwsYWx2Af39lXSzdUEGcWRF/fkr/wN97GOHI46zP7Z/6Ni2SKZF3Zvb+LB//Dr/RtFJfFkv/5B1ni2HHyOtnBkzhHGRPktiats2d4YQFZxXPjj0VCEQbEMx+t49oaNYhWXihkLhZx+Lba5AdfLaSKz+Olmm2ONzQ+6AWUqfgE0PqVz1CpY//WbAX9Uu3+m7q3KrLpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3V0S8dl0mGGeILvt1Mv39pUM1NteTe3xd+sq3Dr0XOQ=;
 b=UgPA7C74o0C8kXzVJ5g4Z2RdPuVih72PsYCMw4kC5KxF/bTrILl6dRCkdzcp5vrw6RK9lkzrbdW4yqCAF9+Waj2s7nlqkjFE1Lvi2S8LcgK6e8H4OOx1acu3TjAdVfO5RdIb2pR13U4NqLjP/pi8RNFew4r4tbVkRO+mYNhV4BlaRs2jURHXaOYEKg0bDBbiGKnPzBkAcMdj+HL7dA463YfPJqXTNBBvrx/91qVDhWFYysnZWtM1bQxMmG5o32XqDVvB8KZu2ZO+hhb1TVBVlmDxP2zrnCWaQLVcqjqPqhyNx7xemFednMZDEqB70sflcaUM/KY2tz8yRFh+fL3JpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3V0S8dl0mGGeILvt1Mv39pUM1NteTe3xd+sq3Dr0XOQ=;
 b=E3jKLMiLlyAWwbzzEWgTfxJOdF2ymTiVXptGHLbhxYngvblJ0G6/HYmOlkRlyUgj5YuiC245etfh6Yy14TiqpKoXlkz0DNrA7eGI7ZTVArjtEj0rBpSd+eF6+UNgRMawxcZW1QimBcAqEHxJAc0+Qf7pcQVRAATt29g4w3Zd7kY=
Received: from BY5PR16CA0007.namprd16.prod.outlook.com (2603:10b6:a03:1a0::20)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 03:20:49 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::6b) by BY5PR16CA0007.outlook.office365.com
 (2603:10b6:a03:1a0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 30 May 2025 03:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 03:20:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 May
 2025 22:20:47 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 29 May 2025 22:20:47 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <jon.mason@arm.com>
Subject: [OE-core][scarthgap,master][PATCH] tune-cortexr52: Add support for ARM Cortex-R52 32-bit
Date: Thu, 29 May 2025 21:20:47 -0600
Message-ID: <20250530032047.1369164-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|SN7PR12MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bbc36e4-567d-4179-97cd-08dd9f28f935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SBX0ENz+iiKfKXO5jN9qWmnOIfYnN3CPr0dhzENtIczkKaNIFsywSOJ8ncA2?=
 =?us-ascii?Q?ukIYyhw+Q2Zz0SiQOYt1guo8XeJLqs2HLxAMXd+LOtDd4hly40dTjJhbltG8?=
 =?us-ascii?Q?c8wJEdqzE1PpUsovpoS6zAfdREmCVQqTvjR6lV3a5Uc9JwzTUyS5d6QQzNqg?=
 =?us-ascii?Q?DugeF2xQ5MnL6lEu9cahbuHN/uWXdOPYAv6bEK7roAOcRBLD64i3iphiUtut?=
 =?us-ascii?Q?UqlRgR1m+CJbvTa53bt7p+D5jg51vplFvHmBM1Z4Yw73ZhjjuNAC1I0+Eu/3?=
 =?us-ascii?Q?GvNNNflKAaWdRzfhiczR8LSB4ebVgNOxPAsAjlTaRk3NmSHKOF+SSfIQZjmz?=
 =?us-ascii?Q?NKjLvGZoABfjGzYMqTonvGDPQTuGXtI0zXuhEGPY/3PPu5yk21ooDgiwpi+H?=
 =?us-ascii?Q?wbo4kaP6b8LdP9VG8In8mvCDsbuCp87Xk+ef8llFAFcNfoMMHE0XRzFh6kH0?=
 =?us-ascii?Q?XQL/WyLF1E69g3QAqVgONC8FqrPbnVLXiQQiDMUPdzzEQ42Ga+tYPXg1/3bd?=
 =?us-ascii?Q?amOXHAdts4o+ZunlaOB9EK6K5bV3UlsXBSz9NIeFFPAl//O8lyx2iDiDdyaR?=
 =?us-ascii?Q?w3HRjIIthGud7/wDBbBGf9EuD2gHKtaYTlANYlWrQ63dRSNexjsQy9JiLkyd?=
 =?us-ascii?Q?/Or5kQrpO4F8jYFP0fo3Js86oteHAZctTO08Upm9oqAirQ5yOIvCwzzdmRCQ?=
 =?us-ascii?Q?qxBVlBTtMFLUNg4E8O7tdd16bBAWoJ3/aB+1uzG37T0DioubUpFFVzx5q+S+?=
 =?us-ascii?Q?6bwSmtXw08WpVqQooDh+H+VaAiUxlew731vUbdnJvsu0jMu/KOgLisBKeT9K?=
 =?us-ascii?Q?g3eq4kRMi/rm1Q7olKxuY9ok6QVB9nD1bXHnBfMOxYWcOT4n+a+1dQc1oxyi?=
 =?us-ascii?Q?9OP5s3dCN4qNWbRfAPgAjxRwBcdwO39JXD/a9ZSGnvzJibbYZpuTB3y9P/9d?=
 =?us-ascii?Q?BPgM1GTd8iVxUL5SkulP1qzfCofJmRyIQbc2iZ/X139EK4uzHRYw0j2H5dGs?=
 =?us-ascii?Q?10cz/IfXwkqcNJGxIVhQld/1lNOgHZYjK9QCrNTRQSe4RVl1gawYIPmkcq3w?=
 =?us-ascii?Q?G38xIG6qTPBmd1utoRSgbpP9OBUC22xE0fYpHGx+qhsX1Gg7JUjzR3G3dpXe?=
 =?us-ascii?Q?UgwsLxdouG5GckuyP7JT6TiZgos0oWy4l8aY+UQA1aYQ1C2rBvIfpf+Gpyjf?=
 =?us-ascii?Q?NRvKZtGRlEC1eCxeakgms51ArAKws18v1AdgWU4rCZyj6jxIgreThJhSHhZJ?=
 =?us-ascii?Q?Lx7CAG6D8H0Dg4/o8R03Pra6nGeSLpMA6hQliIug6c+3GFU1/Qt1QdnD7FNZ?=
 =?us-ascii?Q?h667eKl5JfA0+dAbZbTpP3zTfNQZ7gzsOmd2xX+Ziu5OGh8YlKFrfH5n1Km/?=
 =?us-ascii?Q?MMF9vdSHOEg3HLWI4JJfOXDokEAQ1SRYNM5BWGG4dVzRTvjtXV/IK+FSSoIJ?=
 =?us-ascii?Q?xTZybQG9dA65cBMe/h2FATuUggms1TmiZICEZNl9skJPbBn0dWZsAumsJc5I?=
 =?us-ascii?Q?XjMLml8sFmlQbvs1KUdzQSQDFrJyv/xWfNvs?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 03:20:48.3517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbc36e4-567d-4179-97cd-08dd9f28f935
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 03:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217462

Add tune variant for ARM Cortex-R52 32-bit in GCC as there is no
support for Cortex-R52 32-bit toolchain.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Signed-off-by: Sandeep Gundlupet Raju <grsandeep85@gmail.com>
---
 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta=
/conf/machine/include/arm/armv8r/tune-cortexr52.inc
index 89f0e09450..ba1c2ffa28 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -18,3 +18,8 @@ AVAILTUNES                             +=3D "cortexr52hf"
 ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52"
 TUNE_FEATURES:tune-cortexr52hf          =3D "${TUNE_FEATURES:tune-cortexr5=
2} callconvention-hard"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52hf    =3D "cortexr52hf"
+
+AVAILTUNES                             +=3D "cortexr52-32"
+ARMPKGARCH:tune-cortexr52-32            =3D "cortexr52"
+TUNE_FEATURES:tune-cortexr52-32         =3D "${TUNE_FEATURES:tune-armv8r-c=
rc-simd} cortexr52"
+PACKAGE_EXTRA_ARCHS:tune-cortexr52-32   =3D "${PACKAGE_EXTRA_ARCHS:tune-ar=
mv8r-crc-simd} cortexr52 cortexr52-32"
--=20
2.34.1


