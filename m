Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A105C3ABA5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:42:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.61])
 by mx.groups.io with SMTP id smtpd.web11.48599.1745847754698428376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=HPeH7wr1;
 spf=pass (domain: ericsson.com, ip: 52.101.67.61, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIjSgXQ3ylBFpkuKs2nARCU0qczks7qG4n/NiJkZSkRR3nmvIz78uHGtphwbI04l3YbHyOyjKTzEnnEEOn6ug8xR5Y6TistirG89l5vcQp2UFOB7kKxgQ7ppEQU7s1dGMACsw4ADLC8DFfW+QTkUrYjdlS9lwGVywrMujW+2USIjAYcMc1Wy2WaAKxHwCcuk4WoDWigtZRufMMX/hxo2DNc9g4MQgHeXNiWGVm4NT7CV68jaY4oJTxS9tCdzbrKH1uNe1lHWW+DBDJCvCcFFI9pDoGtJdZoH+qBgvWox6QO04MhriaBOzPllmKde3eUVzA20VajgS63tIfudUrOtEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GCgw4omWHK17ko3YRSFTkZsV59vNSNEoF/Jeats2pU=;
 b=qTfgDxVKP+vdBjROfBpCgsyc3lJxrqVM4z8ZTuNMP46i4vz8MoCKk1Z0GvWO1Wzhcvylbv0Ee+Ix7eHvmJVcDTjCfO/xlEdBdbVwsUizdzyiCreSTt7m3uCBgsR+Zg4/bVtG5raPA1BWn96f5CSQXD0710rtlkAnxQCgxo+k0HEnDMzgGN4vv/H50cIEz5nbP86TUSHNdUcnuAm1pMttM4uB3daI82Hqm8q3BjRjSGDm/6MpIAUGmgwWPKKb3kz/ZAU0NGEWvsJOhUyRo2uqd0VcSgIscLwaJD6mEafmG/gFRif7d2l4EnYYwCfGPuKP//Z1HhvqO+YpT2HVdxPfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GCgw4omWHK17ko3YRSFTkZsV59vNSNEoF/Jeats2pU=;
 b=HPeH7wr1B19iIarnZjVrXNeAfK2WKpT4vkl8y0OhMQnnaJulMl99e6EfTCmVlARuXWwPg/7UBQEG7E1/nQ+f1/MK5c+d8lXJzVOOyjOAsKc4rl7Eyi9mFzm0nga7Rsd+u4oOJiZYK9XvS6kSqGvIWTgYbwCjcq0Zy06WgLW/wYiPorNqhIMI8VE92i1DLkd+5D7jeShaqYe1r6AKutaMk7Bpp8E2IKVvWAphl49BxxUhqbtPdUnYfD0bwderRqmdzwjZXm/7fe1qTiaTO8fHbT7pbYzhKGHR0Uw1kH88aPkzOEk19hQgCtRoUQZCtxdxN8CX2eVHuf24EFNAfVl/gw==
Received: from DU2P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::17)
 by PR3PR07MB6843.eurprd07.prod.outlook.com (2603:10a6:102:73::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 13:42:31 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::8) by DU2P251CA0013.outlook.office365.com
 (2603:10a6:10:230::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 13:42:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 13:42:30 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 15:42:16 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 5D4D9402159E;
	Mon, 28 Apr 2025 15:42:16 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 43C057000229; Mon, 28 Apr 2025 15:42:16 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rybczynska@gmail.com>, <steve@sakoman.com>, <Peter.Marko@siemens.com>,
	<ross.burton@arm.com>, <skandigraun@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v2 0/6] Check compiled files to filter kernel CVEs
Date: Mon, 28 Apr 2025 15:41:59 +0200
Message-ID: <20250428134205.900354-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9BF:EE_|PR3PR07MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a818d3d-2449-4201-1227-08dd865a8607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NcVzNC9W1KE9xJNAgKiolbXLY2MrQQgSoPKqZT7nkycmPXqVpwhn4xOAPNRo?=
 =?us-ascii?Q?OJ20TD8QA7mEsTgD+atTUAC6P5O/N58BxGL7sDFgawkZ1HHSNtHb1aiVyvdg?=
 =?us-ascii?Q?0rUTLM15OA/osE71L4OTQ0hWBW8o86I1LpSTUNyOJ+OGMQEIlLZvon1ynJvK?=
 =?us-ascii?Q?J62/AZ7bXUjGuOeG4AUubHzFDHJOJeSELDEbe8T2cjJSSHFvzr/XXCSe93Rg?=
 =?us-ascii?Q?m1U/vG9XDbPEAR8FwMds6H5i/XbhksMrUw5DzheCcU9LvNJTZ+zLbOmioXXS?=
 =?us-ascii?Q?vLWGf2rOS9NE5Ydg0DvFARawEVRAvsmiOAxRu+31b+kq60lZc+UiG24pL9Gg?=
 =?us-ascii?Q?rOEEncg2cYETvhRxjjwtkvZhLBZJhX95RGGKZLcSWDkDDLA/PYP4m0Pkftao?=
 =?us-ascii?Q?c9Zv7iCh5IBWoAOf+4wsHB2MahBKgc0K3qfVgbtcpJR+1GkSAsl8hCs2OKFV?=
 =?us-ascii?Q?C4XgBesXfDZ3cqWtuL82mapT59pJAU/H39nnwTZKtIEpHSxa6Nb7uK2GhJ3f?=
 =?us-ascii?Q?9Tg5JgKnCf9XWRBKg50KZJ4vIkB1vphS8iICdus6vrNKFAnu6GmVLjQtrlvG?=
 =?us-ascii?Q?TCuOwcYLirrLSAb8y4TDGINtofL9/rmOWinor8fycBoBc4GKe+zNZYClRNWa?=
 =?us-ascii?Q?It458dKmTN8Php47us8wdbRv+b7UGCHQ2DO9GvNPdhXLJjY8w39MB/U4WUJq?=
 =?us-ascii?Q?SAcqNdvKVsByh5tGgN9sAKuRA0eGKkIA4HF+8vjqF9hmGeh/yW3k4tVPjiPP?=
 =?us-ascii?Q?wCLDelFcL+uetytvI0IVME6F0yUQCJysEHLt7Ky2EJlyXcW2qeqJSPu6od79?=
 =?us-ascii?Q?OQ3YPpGIz/gjxHZzgzcGCEcNoJj4KrNtFWBxQXs5lBNS6MtbPN9MFXx0IjHs?=
 =?us-ascii?Q?WoWXrJe2qFMtUwpAzNDODC8xhpkAk8J/KhecrPpiHzChwmnWvkyR7eSmzLc/?=
 =?us-ascii?Q?sBtD7SdRov4+TI7XvxQ1SJHtzgngje3di8mzWYPYDoIBMKKRaJYm367WcpTb?=
 =?us-ascii?Q?bgMAGCp/PwW82r9n9hv8lJRQC74sPYDejv2MKzEfiv9F4ZGWbHHP9sSzlgga?=
 =?us-ascii?Q?/p7znEClj4qS2oRSLSmd13XjlfVa0WIuGY35h+yL51cyjVDuKcGu0aND2Ab+?=
 =?us-ascii?Q?tw2sFxnF+H5/RDnoX0Tbo+X1QURzHPViB3n7nC4BjGRtabwQbZQyeohT1Wvb?=
 =?us-ascii?Q?pCcPUcTLoT9NrqzCaTboAU4sD4Zr59wyJTY/ilmQyo0j/f8JXGMDJMWUSvh7?=
 =?us-ascii?Q?r96uYzxBDxK376ZDKl48u9NvpjwN4x0LRFCQlWXEi4Y546pWuHSqU/1XHosp?=
 =?us-ascii?Q?BWdaHb+eRxEN2DOkLfyxJg1iTTJmXX8Or/sI4+RxAJMmBeQTIbZtszZ2Y643?=
 =?us-ascii?Q?PPrA402RT4o6JDYL7hvFHoHtH3ag1zN8IIHChDmOl/b5xifqrIezvUrfhFee?=
 =?us-ascii?Q?FUNIwho2X4d2TeKDS/zAMiGC738KMP9H20w4AoqXdUCy2aiuhGzNkg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:42:30.9411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a818d3d-2449-4201-1227-08dd865a8607
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6843
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215603

From: Daniel Turull <daniel.turull@ericsson.com>

Since kernel.org became a CNA, more information is available in the publish=
ed CVEs, including details about which files are affected by a given CVE.

This series adds functionality to fetch the database from kernel.org CNA in=
formation:
git.kernel.org/pub/scm/linux/security/vulns.git

I have rewritten the original patch and integrated it with cve_check.py, cv=
e_check, vex and create-spdx.

To filter out CVEs that are not applicable, we extract the files used durin=
g the kernel compilation and
compare it with the metadata in the CVE.

The CVE_CHECK_KERNEL is enabled by default, but not the CVE_CHECK_KERNEL_CO=
NFIG, since it
needs to build the kernel and it is dependent on kernel configuration.

To include the files into SPDX, SPDX_INCLUDE_SOURCES needs to be enabled.

This could use as a base to run the vulnerability check independently and r=
un an external tool to filter the CVEs.

In addition, we also integrate the data with the output of cve_check, vex, =
and create-spdx.

As a side effect of using better data from directly the kernel CNA, the num=
ber of vulnerabilities reported
increases.

Numbers from 2025-04-28

Standing CVEs:
- Before: 18 CVEs, mostly old that needs to be checked and clean up in a ne=
w commit. There is only one from 2025
- Checking with kernel vulns database: 82 CVEs
- Checking with only compiled files: 46 CVEs

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

Daniel Turull

Daniel Turull (6):
  linux-vulns: fetch kernel.org CNA info
  cve-check: fix debug message
  kernel: add support to extract compiled files
  cve-check: move message outsite check_cves and sort
  cve-check, vex, spdx: use metadata from linux-vulns to enhance CVE
    reporting
  spdx: add option to include only compiled kernel files

 meta/classes-recipe/kernel.bbclass        |  11 ++
 meta/classes/create-spdx-2.2.bbclass      |   8 +
 meta/classes/cve-check.bbclass            |  35 +++-
 meta/classes/spdx-common.bbclass          |   7 +
 meta/classes/vex.bbclass                  |  10 ++
 meta/conf/distro/include/maintainers.inc  |   1 +
 meta/lib/oe/cve_check.py                  | 210 +++++++++++++++++++++-
 meta/lib/oe/spdx30_tasks.py               |   8 +
 meta/lib/oe/spdx_common.py                |  34 ++++
 meta/recipes-core/meta/linux-vulns_git.bb |  76 ++++++++
 10 files changed, 391 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/meta/linux-vulns_git.bb


