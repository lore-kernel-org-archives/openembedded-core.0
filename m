Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F710C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 14:36:57 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.59])
 by mx.groups.io with SMTP id smtpd.web11.60860.1749479805899812794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 07:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=DWuwBUaF;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.59, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmgMvIERSA0kWPDRyjMCnh6AJ4c5TcxzAm4vEd9GqOSB2XsI3MxnT4MYK+XwYdJXfN978RVPL0HQfZ3p43jFnNneyamk7DvC/8o3HvAl/zbiThy8SMwD58SbfQuFcEuHp6XxpeL6w+TLIDm2jd5Oosocr0r5NAzRTdmQ/u2KmjD1cZ44fmmLQYasWnr8X8g03OxIgWdSkdoPrtGLc1HcC/xPGtxHKcjCxLGqwR/wVqzwfYMg6pAVhFr7LrgUO52lsikQ8OabZwC87DR2WYNfoTDGIPmgMaOk3s6sJXyir57omBEykNpDwPBzwhBHEyPBGnDMdkSojOpSJOHH48uv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cce4bkyvwHgV10iUAOECco3VqW5rr9K16pCIuzcUJAg=;
 b=QwsWv2aCP966KoCPJXEZ1sb03hGUG6fqh3ZQqrm6KowzSMFOyhgrHKY+4bfzRZg3Vzb5aNBUjtjQK+0ark09L+LC45isdLMC8p+/Jl5YPf77XuuFgNzGPPy5kOcvO5VNf3b6KVC9WnBKm17wHN7un09cCESGX2FpI33LiOJ0UoXv6NuJRPwM107Lti9Udy/zPk1apMJJVYJMyj5N8oL6QdkHXa/NpJ13XZ+xT4SOguoVZPOY98cMgpeXNlWbqdvw8cjekbvpO+3Mh6EqwOkrNVcglQiZ9hPC5Wqr6qyXAU+6goyk7TITomgQTrPuNTSLfNOzCU8y4tB6JLqAGb2kTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cce4bkyvwHgV10iUAOECco3VqW5rr9K16pCIuzcUJAg=;
 b=DWuwBUaFry76g32RADlat8xMMOAV9edJI+h3Rehk26K3uRRVSpG/ss7G75ad1hRYLAykjX8SDYAq3AHhoNF+atZg6k1BLdGgdZb92CfWw1iEairf7sKD7vaKWjjWKP7XxpXF+1cQXc5JwosTuqsNi9uGViJ5MSUBpjbdvOeFkcQ=
Received: from BN9PR03CA0633.namprd03.prod.outlook.com (2603:10b6:408:13b::8)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Mon, 9 Jun
 2025 14:36:42 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:408:13b:cafe::a1) by BN9PR03CA0633.outlook.office365.com
 (2603:10b6:408:13b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 9 Jun 2025 14:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 14:36:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 09:36:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 09:36:39 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 09:36:39 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <jon.mason@arm.com>, <ross.burton@arm.com>,
	<mark.hatle@kernel.crashing.org>
Subject: [PATCH v2] tune-cortexr52: Remove aarch64 for ARM Cortex-R52
Date: Mon, 9 Jun 2025 08:36:39 -0600
Message-ID: <20250609143639.2388322-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ee2db4-f8a1-456c-0a4c-08dda7630c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UTTDqLNAYr489C8DbPPA4JhhydL0ZOyhg+1ynA4t2sY88WEy2iGnu+nmMkMe?=
 =?us-ascii?Q?oLFtdjw9wrDw1b+MkO+VeoRLtI60a1FCKav+vjNcY+loobrkZ6FnDan+wZdR?=
 =?us-ascii?Q?/b8V6f2ZHeoXfweegUjycAhEA3Cey7kndd6kUTHb9d6QMPXClsQg6x9tsz/u?=
 =?us-ascii?Q?nOaAKZ8Fz8Eub/vQGPBtqswQLoz2evElQBTWSUCgfeZQbSlAtk5DDw3M6XE9?=
 =?us-ascii?Q?cfoskWKsVwxByF6YKGM/7s29fp2BoLXeXAKYchwV8D4WlobVYZMBOrD1yV+T?=
 =?us-ascii?Q?UNYzHEtGnNIB1pY/G9EGDNEl7IMeIyBSYZC7WIWdZ+5f2V8tbpf5hRMR8byB?=
 =?us-ascii?Q?pzMj8w7nqizZUNuRe2aVRgUuZBrryIulZT+vYGluYbN+fbYrwaJ55+fEOtBx?=
 =?us-ascii?Q?QKAH/KkPohHP7Nzlq7hDQ9rPANedFZnZEvhQt/Orq0MpQ5vIr5iiLfM2e6ZE?=
 =?us-ascii?Q?qP9XBLayk4WiISeLYy+FXZEqkteqPA3D8zib8p+icvFp9Mi3cK9iwyHymvL/?=
 =?us-ascii?Q?iICV7cxzqdtfqushbmXjzl5Pcp56ROKPlIriO0BGUY+vnCVnj5Z+8ShjFSKE?=
 =?us-ascii?Q?mayuHuqFHpuXA3+l3y4n8xH6/ISluZdyxR5cx1wk3gxe9GShiH+Nnf2v5cHg?=
 =?us-ascii?Q?Npbnb86d8/M3OVotA8A7/XV8F4lJnLioy46Uc5QUDHVHVDQnIHtPucEAMPIm?=
 =?us-ascii?Q?jqtJQWd5ElWF3rUzoihhq6oIvZhso04Ov/ISbn61vRJYmwWFyI/jqMoO8JqQ?=
 =?us-ascii?Q?QvrZnXgPOuDUBfHcKoIoyoCIxvX8WAZ6a7rJf8H7ho3HEF8D4pujungcBKJK?=
 =?us-ascii?Q?X/AGlET0VEFyz9OuppYosQgN34DkhxOYf2jgtkmuGKP5RyMzqLPuQju4UzZh?=
 =?us-ascii?Q?SHI4msuEe52InJFgZPJAe3PWabPQuLioA9sdKHWPPwLcZqvYf2JMGv3iicKP?=
 =?us-ascii?Q?9wjLNbLK0fTe90kPFGQdv3rnlVaVKp7ZS1MJwJmhhN/gPHKeSzEU8kyvr2pB?=
 =?us-ascii?Q?HEV9/sFP+sMoVJBlppLA9UQvOOTK/WEIwJWtPjnS6uVhW1EOmk7552PsxfWh?=
 =?us-ascii?Q?nojoBh3/Sg4RPS6ahRoY0G0K9RTbZzRajuKajdVLIRDi2R5wL20xGXyLHQod?=
 =?us-ascii?Q?iuDoEvSaPAP9/O3Pmz4acCesxj9ws8VMhmQ11s0Gq5nL4LAX3oWKTphLHGQR?=
 =?us-ascii?Q?X+UYxn42X0D5s8uTpJPchplN30pHharcjlBvi2YewqDwP5PlmmjlLTTDd7fE?=
 =?us-ascii?Q?NOezRsqp/+f4brmQ5gXNIitkeX6nevbCKKThqcgT2FY2PkTkLUP4Ydo0/OCv?=
 =?us-ascii?Q?4XUqWhI+DFZYGn/4qp/7yCsobWrzm6m/JM0taYky5gpG6NORubTfaQhkMm/g?=
 =?us-ascii?Q?7bUqmXs3owFU52oyQDE7WZREc4a8KHZvxv7zNxxnHuNyRBtJQK/QtaQtrKWV?=
 =?us-ascii?Q?H6zesTMVIQ+XnKsUqM0eY0W2EDhbbh1EaOsYKYLQ2M6MCoCN20iPjzoBFb0h?=
 =?us-ascii?Q?WYeWPYJI5tw3ob0wFj0pCzJ4EAZa7oAdKx0k?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:36:40.3116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ee2db4-f8a1-456c-0a4c-08dda7630c21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 14:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218293

Remove aarch64 for ARM Cortex-R52 processor as it supports only 32-bit
ISA but not 64-bit ISA. Also update ARMPKGARCH for cortexr52hf.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Signed-off-by: Sandeep Gundlupet Raju <grsandeep85@gmail.com>
---
Changes in v2:
   - Change patch subject.
   - Discard cortexr52-32 patch implementation.
   - Remove aarch64 for for ARM Cortex-R52 processor.
---
 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta=
/conf/machine/include/arm/armv8r/tune-cortexr52.inc
index 89f0e09450..e8667bc16b 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -10,11 +10,10 @@ require conf/machine/include/arm/arch-armv8r.inc
=20
 AVAILTUNES                             +=3D "cortexr52"
 ARMPKGARCH:tune-cortexr52               =3D "cortexr52"
-# We do not want -march since -mcpu is added above to cover for it
-TUNE_FEATURES:tune-cortexr52            =3D "aarch64 crc simd cortexr52"
+TUNE_FEATURES:tune-cortexr52            =3D "${TUNE_FEATURES:tune-armv8r-c=
rc-simd} cortexr52"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52      =3D "${PACKAGE_EXTRA_ARCHS:tune-ar=
mv8r-crc-simd} cortexr52"
=20
 AVAILTUNES                             +=3D "cortexr52hf"
-ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52"
+ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52hf"
 TUNE_FEATURES:tune-cortexr52hf          =3D "${TUNE_FEATURES:tune-cortexr5=
2} callconvention-hard"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52hf    =3D "cortexr52hf"
--=20
2.34.1


