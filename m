Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C95BC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:39:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.73])
 by mx.groups.io with SMTP id smtpd.web11.113.1745937556622981778
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=wGELIEOk;
 spf=pass (domain: ericsson.com, ip: 40.107.21.73, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuTefm4tgcqD4MGCNxSZmmCNKCFiOgKc3+7SysVbsPF2grBWJ5KqvLii1d+kZSNVSY4oSdnPB19h4GJK1BMYlFMJJ3C4QXkZXgO40avZ6nk9Ys4UtRYIHp4BeAfdC0YqE9YQZ8mzGkfBDOvh81CZZooRv8QYqIMgsdLbG1bl7lWwvBzvtUy2dATmgqnCtleWTzA5+4jqqSR35hwd28b0290dzoXmxOxTZGq87EiveJFu8A4k0Cc19wtTWlFKrVPGL0Nu6aPdaHDuwNGTRa9bwpfqJ2XC15U7CZ2ggvi33yqqvWOsyLR4g0rPUIh4cOn8LrvYOY4EMr3NrG9ez2Mjiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjLRPnjCx9ycXLMNNW6B7daaisbWseo9g0X84w4Yeq4=;
 b=lpfuS9NUMDgBXOjGs8iPcEb+lXzj2VrTIYoDMlqBt5nx9nOzg2EtFMEUZtZg9j0P+LEN9Xz9PIxW0A4OmMsH1hLO7Wq8yYfVmTTKORX0JDp/5HVgdLy6esCtuS5sbhkfShmHypzUFSsJTGuKvq99po4A7O83OejR7o0T7RBhIj1xoHSynf4GQD/nmXpQSrMB/ecWjaEbaw995tiF7stSPratgomjftkRTLrxKRYKfDhc6wmTQ2HUpwQ62ndqJ7calMo+GJpyFEiiKt51zDMOXTtx6X6Hrq0LrF5+iHo6C8/jWAmrL+MHsSQJgdyrPpkbuTjkIJ6lPAAOu/V+EOgHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjLRPnjCx9ycXLMNNW6B7daaisbWseo9g0X84w4Yeq4=;
 b=wGELIEOkDBksnU6dlbCojCiZ2fF8QoTT3zWivt4nHFrnzPIb8+gVMNmI9g/vwAtFRoQ5SgOny6eHo9OD++jpb0L3v6xe9RJjxW9z/+zMkOfuv9P6YZ0CsUweNBDvTLYVP0Ig7P5QuVKIM/meymovWMnmcjF4HBQgKlA+ha0IRFKaljVcKCeOs7zqjR7i541uZlegi2NumNEW43gae16FHoflZT2N1wtDsAbp853U4n5oZh+ObkE/hC598BOERcGuCD6rSMbqUWUrGx+5HHXW2b7xSpEAq/PThITvyDE3MtWLMbYy6Gm7ChHFAQPBOb056gFidC6V/cIOdRrKH5BrrA==
Received: from DU6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::18)
 by AS1PR07MB8566.eurprd07.prod.outlook.com (2603:10a6:20b:482::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 14:39:08 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::9f) by DU6P191CA0005.outlook.office365.com
 (2603:10a6:10:540::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 14:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 14:39:08 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id BDA904020C01;
	Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id A630A7000229; Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Peter.Marko@siemens.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v3 0/8] Check compiled files to filter kernel CVEs
Date: Tue, 29 Apr 2025 16:38:56 +0200
Message-ID: <20250429143904.634082-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|AS1PR07MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: e378e34a-7881-4c8e-8d7e-08dd872b9961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZYcdQH/rCHYTo322/HA/VDHyOXQ1ulfavN96ErNsIlHlDeRN2/2Wyn5xGJ/n?=
 =?us-ascii?Q?rLb1zcs9X3Q1P3bvNKnUkh17PHRV6SRx531MsGQbtj9pjWqTTQb3QmwqvzoX?=
 =?us-ascii?Q?2AsmqDbpPwyd21mExl0vWb/tmmbx7AtPSxyka2Y05X868RG52yCCiHjbvNYv?=
 =?us-ascii?Q?XS4q/ie24QQ8K0Wki3ug3I6kuE/aKe/lbMjKM+Xv0HxP80nClygq0sJGcciX?=
 =?us-ascii?Q?3vVeGpmgMxpvwoefb7wHUjznYVkgP76cWXbtZOslJ41zJ47U6p7nhItxzdRk?=
 =?us-ascii?Q?paRxmyoUh+yK9gJPay5cPCGeq26e4ahl4GNF1N/goCNNNk7IfPpLyI59OX4f?=
 =?us-ascii?Q?CWpMuRMRZegZLqkTxyKyYKqqX1ZVEvFlrIG780TnMyzOy0H8v0Cx9MP3sPtd?=
 =?us-ascii?Q?TrCmtEPc/Pe4+IwKMzxjIpOOB3BEyY7MLJe892jRZL2Br/PrLr3QDXcefp8+?=
 =?us-ascii?Q?dnY65OH/KvK1odA4HxCW9rS/Gu3Zt1thI7bTODlYryCqvZ6Rz4dtjfAOrk41?=
 =?us-ascii?Q?/GGysgh36xwdEYZcfm9EiLRVIdgPwY6UuSh8n4UsMoqYeIzpmhdrwDGdSYBd?=
 =?us-ascii?Q?qf846PsciBurTNVmvqGjjQBGruZ20u1PdVK/XbeORn0dbma9mT5uweX734U9?=
 =?us-ascii?Q?MC4thSK538yLoAnKSq4ctQJXLGAfPfyR4mMh39sGRx6lbbkPpDYCT0jyKmJB?=
 =?us-ascii?Q?oNXv5I+wjV9HJpm45HkBv/0FdOJ84vqPKJ0eWA2moOdAdIOki6JcdekXuASO?=
 =?us-ascii?Q?KWSu7uZ/e5I8RTxjSgnoncy/8OUcNJNN35bUPri2ksDd9VdJuONZmrUehVnD?=
 =?us-ascii?Q?3BJ7+kbA+vHkrlUkO+VkuE3rkJvFF3bzf1X8KVGMqHzW6vmzU63OEnseyJk7?=
 =?us-ascii?Q?BjNCWafmE9U0nX00h88SXtR9zthY3UgJsei2Y+2W7PDsFOBpCpg4okfCRWsW?=
 =?us-ascii?Q?gsQrLW00l1NtmjW5py8pnTTX8H+6kJD3MvzlbTtnxaHcLKZsjTuRpyjmrNTm?=
 =?us-ascii?Q?SItnij/6db//xXCh5fqMS0JUuTAdfC78/lCgaAk03BO9rcTXOL37wi+iByaP?=
 =?us-ascii?Q?2sy57Lj+1JoY25PnzLC0c+SI+ul/DOAzcl94Y3hGJ1BkIj07nG1pn9mJacdA?=
 =?us-ascii?Q?lTy7oHVeVLzWPVO4ZnUse1mL1VkPL9p1qz4dLg+r5FIgVH+TB8DvqmOy7yml?=
 =?us-ascii?Q?5QdWmIVWqSCElPGvqJZYYeiKdxBBbXsWvwGUP1qN1vvwjXKOoBZVRJm3bMYD?=
 =?us-ascii?Q?e1sklizkBpnNxWGNc6H5qcX/9GHZFuObFaly+AoEkqr2rHafoLk7NkkVKyeq?=
 =?us-ascii?Q?5v9R3EyAoV20swJVPPgrHMUd/1Un4TErQo8ULPdBksct7FY6dCaTSdmRgXvp?=
 =?us-ascii?Q?9y7SvnoV/XWSZiVhs1s0+Q/s4M6w7ReB9U05l9zfGnSaoX42xOkTYSuvhRUm?=
 =?us-ascii?Q?WUxaZSpJ8B4JGJ9rqHjcTq1bf8M7hnX08Ea66wFSHrEahDY0aXu/8Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:39:08.2295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e378e34a-7881-4c8e-8d7e-08dd872b9961
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR07MB8566
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215674

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

Daniel Turull

Daniel Turull (8):
  linux-vulns: fetch kernel.org CNA info
  cve-check: fix debug message
  kernel: add support to extract compiled files
  cve-check: move message outsite check_cves and sort
  spdx: add option to include only compiled kernel files
  cve-check: optionally allow to force update
  cve-check, vex, spdx: use metadata from linux-vulns to enhance CVE
    reporting
  cve-exclusions: correct CVE_STATUS

 meta/classes-recipe/kernel.bbclass          |  37 ++++
 meta/classes/create-spdx-2.2.bbclass        |   8 +
 meta/classes/cve-check.bbclass              |  51 +++--
 meta/classes/spdx-common.bbclass            |   4 +
 meta/classes/vex.bbclass                    |  11 +
 meta/conf/distro/include/maintainers.inc    |   1 +
 meta/lib/oe/cve_check.py                    | 211 +++++++++++++++++++-
 meta/lib/oe/spdx30_tasks.py                 |   8 +
 meta/recipes-core/meta/linux-vulns_git.bb   |  76 +++++++
 meta/recipes-kernel/linux/cve-exclusion.inc |  31 +++
 10 files changed, 424 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/meta/linux-vulns_git.bb


