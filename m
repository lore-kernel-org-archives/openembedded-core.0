Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A304CC3ABDA
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 01:12:05 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.83])
 by mx.groups.io with SMTP id smtpd.web11.3246.1747271523416315833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 18:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=dHjbuasu;
 spf=pass (domain: ericsson.com, ip: 40.107.241.83, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYauJ3GXD6zohRSb7qLG+NwhCBEGbCxiHJY7Dsn2STTXAzUdV2bWKbm2HHC2YqzDNuMvK0rfyj7G8ttDRLuqAivuKcILdJTX9QNoxiy27ehSCfBwDoIpwj6bW6iqo1+DZjtWfaD9oNnxMI0450TxccMa3BI8mdYkffzCHQ82YOv31x4Pipzf08khQTCcQGZOamVkajdL21ZG2FbLDo5/4OX2sb2jCwN0eW1TxDHYpybX3QqTM2vKcJJS3Tx5mHIFw7QEgR07mCEQZSly0MwChdlLo877Nf8X51T1MCnzSokrQR255F4ygNbMiVvU5AJNCMItZv8fp3jdR+eqwcq0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMLSocud3nI99yvMXu0+wnUlGgHdU+8ZKeDB7bV/SVI=;
 b=kHvHjMJimVAzur4nWRQ1MQSWtP91TF2BLiJPy9bc/NjrN35PjjQ9z5R3zXieKgl/dBTZiZokNXPeutI9i1pkV0IWMgkTDXPvVLR6ov/ezpEBCd4yQnu0RPYx6Jzhc+xKkSG/wSfUZvJu8LsmTFr+AOeWX5A632KhxtUOhuI+XEjSK+ixv7MMRl7xXiZxcLg8K5WIvOH0WrS/UhifqH1YwLYI/FFX5YcA/XWIIxz36nKU6Q2rLv8pN3LYovNHmQTkq3pqhcwg+KE4cTlHoW9hrR/ANk0MSOiFoXQizGFQ7Rl4aGyCUBujJaS2g82X5Gf0pfy8djxWxAXN03/cxRAbZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMLSocud3nI99yvMXu0+wnUlGgHdU+8ZKeDB7bV/SVI=;
 b=dHjbuasuxjZFSYvXXlRtlYvDiTbgvA2z6tDSHVSWe4AAFBsqR+gpc0vqk2/PXF0eNcPHPurMjIyXTxJ8zNLnF4N6HJ0L6NjCdFpCAS/BjCahfAqdWig0BoXwq6AAQQs0b+ClRGBqKpGZDZYcsmnf0j+41W5AGxyxfbwuJRyf51cBe0L9hv2j8wDduKg+nTiC6eVbBVstllPMRgYcrM8Zg7JA9UzFZVv/ZtamDA6r3uRKcb9cR0Z9vNjR14nLvR7Dx8p8kwIY0iAH4vwcL4Na4a0X9Tz7e249CrI173YtmlZqa0AFMAqU0bAE3me0oYnBaiWs7bjVOVs0oEnUlp+isA==
Received: from AS4P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::7)
 by VI1PR0701MB7038.eurprd07.prod.outlook.com (2603:10a6:800:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 01:11:57 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::45) by AS4P191CA0017.outlook.office365.com
 (2603:10a6:20b:5d9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Thu,
 15 May 2025 01:11:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 01:11:56 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 03:11:54 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id DD3FADC186;
	Wed, 14 May 2025 15:11:48 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id CA4EF70E61C0; Wed, 14 May 2025 15:11:48 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Peter Marko
	<peter.marko@siemens.com>, Marta Rybczynska <rybczynska@gmail.com>, "Joshua
 Watt" <JPEWhacker@gmail.com>
Subject: [PATCH v4 0/3] Check compiled files to filter kernel CVEs
Date: Wed, 14 May 2025 15:11:43 +0200
Message-ID: <20250514131146.501451-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|VI1PR0701MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb84400-b9b0-48f6-01f2-08dd934d7cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6pNS2ZjbyBnOOjvWX0IGLyMPCInQRZ9FEZnUs6jfRMaClQLMLsQ9s0eif7ot?=
 =?us-ascii?Q?wSiGDw6FyWuYvNr4DQ3o1JKhqN2xu5sNw7l5KhZ5YmLyLmh18nY73HtZ1aze?=
 =?us-ascii?Q?E3t0OMtLEZCXSi+GjrWBJ+oJPj4VtrGJBsSTqPsRMbdGysYVUw/HO94qmroY?=
 =?us-ascii?Q?8Rbl9h2MflWGJv3yfG0e8C6sktkdR809tcfS/fNgdyfCYi7g4VBda3uqXALG?=
 =?us-ascii?Q?eMaNI7GDGl+7PFj+vuePXDb2VwE8jumtZ2I6CRINfaTG7+gxYbvsomz/hQVw?=
 =?us-ascii?Q?wV+dUCCFDE8FrudzO1bWQLuIWijJqUhaW2XI26G+ImNvJ28v3xb07ssEglFj?=
 =?us-ascii?Q?Qo+6nyWY/nAEitK4AOT6/83wpKdHSxGNdFvoOF2cmQeiqTMLZR5xIs6NR218?=
 =?us-ascii?Q?t25XoxJcYJ120rDw9ZJPA1KNwLNWMpT70aoXuJzkYFUjkYT9x5VoPhvj0243?=
 =?us-ascii?Q?l5PSSRrTVP9YUjj4UZk4+mHVBZfZPvc2zlsMx9X3wszpsdQuEKIqsXS+SKMN?=
 =?us-ascii?Q?rg0/+mW5AAvZmc7gY/oWR13IBfN2K+ycf1bY8r4VwlMuhYc9wKO3qu6+FDYi?=
 =?us-ascii?Q?F5CnnbIW+8tSZkR+b9ZkSexDhG9hhtfrbjqQQ9LWR8WHUrHXS+BNChnPxtM9?=
 =?us-ascii?Q?MG2+3Ck8MpNpOWKTLgId5I/ldgqpb/xS8Sbuk5iuXsReUQUbkdMg6JOT0sGO?=
 =?us-ascii?Q?4m6TUMNFaimMiHKbD2G/gHjZaMx12sPyHqD6IKe3JnuhOuftS9ANyZNHP/qK?=
 =?us-ascii?Q?oZ+nHGiXnX5GzZAgpJ+vj6xoKvyg0ca/rHOIaZeSMLUGseqOOGJeGR8yjU9g?=
 =?us-ascii?Q?yjFjCEC8hbz+JNspHi/jwPBRFf90uM4+Y4cSUUzPeYH3RQTI60r9iViept16?=
 =?us-ascii?Q?L6ZVN0oEdB1Z9dtkKo9AX/ejLy2At7+yH7c7cbL1RnQrbaGLNbYMySEYAjsg?=
 =?us-ascii?Q?uuSg+GjGPjmeEX4Awg1Vn2E5BtYJZbnGTsQyeKfZovTxBDilTWGAEbKI2ZK8?=
 =?us-ascii?Q?VgNT7N0JI38TaM1YuWxkWPl2eB73VPUaRFiZTjASSodWYmLLY9f5z0GSsr4O?=
 =?us-ascii?Q?wqyK2m0svBzTKnChicKJwwSNymqtNs4mWQpkaclCAd5mson67cVjIkQf4APm?=
 =?us-ascii?Q?cKfZ0qcBOBXjnbFMGEfbTBdYAesgcnlMcWj8sZk3teaH4FtxwvUwqjfj0U8i?=
 =?us-ascii?Q?tJfXQ1zLIG7DRA3w3kUJThj/V6bifru7adh1mzzWwx5F+8ZDzUI2o/H9OBc1?=
 =?us-ascii?Q?ERz2i2t4kr4NJZiXWa3SV5gvUJnNdlIljQtysFy6iykrxmSbpmhGWGtlx4Hq?=
 =?us-ascii?Q?+TY8NcRCnjfMUdASXVyLfacFSw50eoSFEgHMxhK+VVcYa5d+oS3KmSpFQsZO?=
 =?us-ascii?Q?1EoFGi6pwddm25wtlfowVIgdJiQtCv+NOkoul2CerjBQstZ1FcQtXS0nAn7a?=
 =?us-ascii?Q?6zP3JDjEQoreDsRwWgUzpl+kizuhUfbm+FKZ0AAwttzfxnisA5dqHm86AKii?=
 =?us-ascii?Q?xtwbOwdoY3DWctwYVizVK5nHAUVI+jBj7LsA?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 01:11:56.9200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb84400-b9b0-48f6-01f2-08dd934d7cc6
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB7038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 01:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216562

From: Daniel Turull <daniel.turull@ericsson.com>

Since kernel.org became a CNA, more information is available in the publish=
ed CVEs, including details about which files are affected by a given CVE.

I have rewritten the original patch after the feedback received, including =
only the basic functionality in the build (extracting the sources as a text=
 file and inside spdx)
and created a postprocessing script that enrich the cve-summary.

To filter out CVEs that are not applicable, we extract the files used durin=
g the kernel compilation and
compare it with the metadata in the CVE.

To enabled, add in your local.conf SPDX_INCLUDE_COMPILED_SOURCES.

This could use as a base to run the vulnerability check independently and r=
un an external tool to filter the CVEs.

This patch can reduce the noise of kernel CVEs by around 70% with the defau=
lt qemu kernel config and even more with smaller kernels.

Kernel     | Total CVEs | Fix backported | Vulnerable | Filter with x86-64 =
qemu yocto compiled files
6.12.28    |   1201     |  1138          | 63         |  25
6.6.90     |   3121     |  2877          | 244        |  80
6.1.138    |   2979     |  2522          | 457        |  142
5.15.182   |   3767     |  3005          | 762        |  230
5.10.237   |   3586     |  2622          | 964        |  288
5.4.293    |   3030     |  1806          | 1224       |  394

When looking at the spdx source files included in the linux-yocto with a qe=
mu-x86-64 build, it goes from 86989 to 38312 files included, since only c f=
iles are removed.

v1: initial proposal
v2:
  - rewrite kernel_vulns to fetch similarly as cve-update-db-native
  - add functionality into cve_check.py, for the classes that uses oe.get_p=
atched_cves function
  - add linux-vulns into the cve-check results
  - add only compiled files in the spdx, so the check can be done outside t=
he build
  - include compiled files into spdx when CVE_CHECK_KERNEL_CONFIG and SPDX_=
INCLUDE_SOURCES is enabled
v3:
  - make inclusion of compiled files generic for SPDX, so other systems tha=
t has knowledge of used files can also make more accurate sboms
  - have the functions to extract files in kernel.bbclass. For other recipe=
s that in the future want to use this feature can add the function in their=
 recipe or in a build bbclass.
  - move order of patches
  - explicitly have the save_compiled_files added only when having the CVE_=
CHECK_KERNEL_CONFIG
  - add first kernel cves in cve_check, so manual CVE_STATUS is preserved
  - add CVE_STATUS for false positives
v4:
 - Refactor and reduce series to 3 patches, one for spdx, one for the kerne=
l, and one standalone script

CC: Peter Marko <peter.marko@siemens.com>
CC: Marta Rybczynska <rybczynska@gmail.com>
CC: Joshua Watt <JPEWhacker@gmail.com>

Daniel Turull

Daniel Turull (3):
  spdx: add option to include only compiled sources
  kernel: add support to extract compiled files
  improve_kernel_cve_report: add script for postprocesing of kernel CVE
    data

 meta/classes-recipe/kernel.bbclass           |  19 +
 meta/classes/create-spdx-2.2.bbclass         |   9 +
 meta/classes/spdx-common.bbclass             |   3 +
 meta/lib/oe/spdx30_tasks.py                  |   9 +
 meta/lib/oe/spdx_common.py                   |  33 ++
 scripts/contrib/improve_kernel_cve_report.py | 437 +++++++++++++++++++
 6 files changed, 510 insertions(+)
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py


