Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A86C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 01:25:55 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web10.3349.1747272347376449653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 18:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=IvVOeemJ;
 spf=pass (domain: ericsson.com, ip: 40.107.21.84, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoNxqgs4kD4+UGHjM4LmfhfFPui7Fn4eve2tO/jtRjaMy8VH3XmbB9w7KKYQ1JcbndWo2iJnLqMisHR+/ZCconlxtSECmbqATD4s95wJ0sbjAWSg31GGwJNl9gjE8+0FB/9nKhIgcWvhg4QkPbdWaG4P7f6hcGuSyyQzM1Rmdg+bJUKVK/5bq3R6D0hHOjrxFrIGOKvFxkGpng1yeEwauEultBYgmXmTHRKJyZf5Q37U1mxH4XZdn/gFiP2Uqr9PSt33LANGDxGkFAyKX9tmJPs8ePdKVvlHeHsBkoikOxMoMqz+ggs0kHdntaJDgp6FdwWA1+5KBcvxdyaSwL7/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMLSocud3nI99yvMXu0+wnUlGgHdU+8ZKeDB7bV/SVI=;
 b=Wbxd/yXWtYtEFe7y/JTFcKUmZ+6UOdXWWimYpcOQAvi7Zsnephnw+78Lm4uQeLukKuGiCMx4rBFitivV4QwMGuCXVoeeBptI8uW5xlbqW2Li3LKdCCA5lwtB3eUrcVbFxQUKSlxpRjhbCO7avZmoAYUK0wgYKP7stL5xwB0+RILpi1ryjGJGut/ct8NSEARy4VMm+YfwTOYSZjeLdGO/qOmgLq5lfikrO8wWuwDzpBnkj7iKzLA7XB/dB5jVtHbO859SRbwxUUsoXlvInVQwQlEnG+hKepfnQomRs/yZ6ku4ZCQBXXuQMQniwLOfaMEsdjwzuIrlLl2EjQJerqAkOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMLSocud3nI99yvMXu0+wnUlGgHdU+8ZKeDB7bV/SVI=;
 b=IvVOeemJXzZ5PeoyYlsJ5ZnS9/yg2qRbrQSRUb8HttAJfaaFnMo6bbajn3ydoTvH8ocZILDfNZlqKYxF1cbYv7FRxop5OUQ/1e6I/qQ9oj1WLP7C5yPpDtRrcR//qYRK6bP98RdQGZJc5HWo4pi0xWAlsTQFOcl6XHuKuui2K3A/B74LSXM2bHdvYZwrNY1E9SmhCT/q8LeHqfedoRudei9sJBm2yCZPI45WmRhBDaypsW1fOp3A/Crb/t9+SIzVnWJ7/PAgV7n+Bt0FerCKuplrvJIhctRhBGe/t2kDWLtjhXgKmglZc4ZuxbBlB8qvrfzWRUD9WAEL4keb5GiTEg==
Received: from PR3P193CA0053.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::28)
 by DU2PR07MB8127.eurprd07.prod.outlook.com (2603:10a6:10:270::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 01:25:39 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:102:51:cafe::f) by PR3P193CA0053.outlook.office365.com
 (2603:10a6:102:51::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Thu,
 15 May 2025 01:25:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 01:25:39 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 03:25:38 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 8861E410F4F9;
	Wed, 14 May 2025 14:57:20 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 674A070E61C0; Wed, 14 May 2025 14:57:20 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Peter Marko
	<peter.marko@siemens.com>, Marta Rybczynska <rybczynska@gmail.com>, "Joshua
 Watt" <JPEWhacker@gmail.com>
Subject: [PATCH v4 0/3] Check compiled files to filter kernel CVEs
Date: Wed, 14 May 2025 14:57:03 +0200
Message-ID: <20250514125706.495571-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|DU2PR07MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6e639b-2a23-41be-a18e-08dd934f6705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lgn7AyYA+cln6ABUV2xMje2qt+oCpWnjTvVp/XmcOGKUBelYALgnYSt0+789?=
 =?us-ascii?Q?oZO3Pc28xtg2xxSbtq0Gd0UGUVj2mGl2mg+tT2sOnQ7xZW4WGXw1sgUqTBvJ?=
 =?us-ascii?Q?VnP0sOyKkqLBtNiyhmV+8bnOsgxkC/QfaeTCEMN3sz8ghlPrDwH4rriwGY1+?=
 =?us-ascii?Q?kMQoR2Pfnr834k7UPKE5Vfnu0eRHQlBuMM3y7O1rPW43RXE4ASnMVlfdhC1t?=
 =?us-ascii?Q?WZqw3zRkQn+Bf2IQc7g1BH4Q671u5c1qedriKkvR2IARoKi4Ux0nPyBn0Ozs?=
 =?us-ascii?Q?WRMaz0IiwJW/D4ju6Ih6PbhxzBRp69PCXKEEfEIMvKqoJdwL4NbFU+MEe88W?=
 =?us-ascii?Q?Lb2AzeCfmIMUIQkFU3rlU8Eh6Y0K6gIScWVUcQiDLSOLLiswCBM5WI/3EpXm?=
 =?us-ascii?Q?46y7FzdPn+x/5IS9Y6sb1AZJo8WuJHP5I9dHa7xcvHaKoBDax1IkPmDTVtIC?=
 =?us-ascii?Q?1Na/NpZnS5aOq0maPUIkU9fywOcwewCyMLNpDAO+6MEIBgY59uxJbYx9b2Dr?=
 =?us-ascii?Q?Y6SXPQGVcK00H5GKpNs0OfHjxFJ/8gRMvcrLC413sc4Ae+5dQINI5eDwPC24?=
 =?us-ascii?Q?ToYOgVydF/72sN7zVoF6rQRoqrMuawmiSeeo+G8MHzVBivqgFLFQO0X/Nct0?=
 =?us-ascii?Q?KnGbGUMo+45qOApM+ZdLDRn+H79Mn+l5YQfkmyCsozPESHy11FtF6xgRtvz8?=
 =?us-ascii?Q?sASUkCyD/Ci/rXWtnab97x+YlfuOkrcn+JMpDv5apJP5xk16Rm58IAlDbnKi?=
 =?us-ascii?Q?gEfWNjBaueRzJiA6O8J7iy2gwCrTZB0TPIi9w+awbdnghaXeD+x3FKu3+jrj?=
 =?us-ascii?Q?AzJJ4VIXXQsvIfYM7+aVHllPEYn2oHhrEpE+GayVZ0r8IfClJ2Dbxvhg3JR0?=
 =?us-ascii?Q?lUyKDHhYnZxxaGyrG1KEp42oJSxA5U2Jp9bJBcjXI+NQaUtNUmKpe3sg9PQn?=
 =?us-ascii?Q?orW2HKLmUblPrnqfg6yZXOJskHeLGYCpZUvw/mUyU+mkRbCt5KyWrRRbz86X?=
 =?us-ascii?Q?NQnZnLMQDCM5JV3dBXx9HLf3J+/qL4i7eP4VnG5zlOkwOXfxoHfF23R84Ta+?=
 =?us-ascii?Q?KRs9460zp/ZiP28oK5ufBFpYN+LWjEJ9qyNUzGleosg/1phqRK+56w0xB1ce?=
 =?us-ascii?Q?H29HjxRsnCkQjoV16A/E7ECUFPR34cyPAuE0Gs00VYUCdWxRjYuL3I3f2nut?=
 =?us-ascii?Q?Y8J2zrEXBS62asxdX8nEe6LkaxBtOFRX7AbN9YGcSIfr5cns+l2+W6ixZoma?=
 =?us-ascii?Q?p2k3HmgnrblttHaqhuGsbRhboYl5vGX4UChHjQNbkdYznMgWoYgGth/8eg2y?=
 =?us-ascii?Q?u5JrBgeyjjtLAHmFv7d4TlT+1QWwW4fM6vR1Wm4uk1OlBWlrh9CXnPz+/XRZ?=
 =?us-ascii?Q?oMEnUIlWknQiIzs8dQ0ge/X+Nx087sGp7hnwrP9OauCascyUbNjMBK3SMOSg?=
 =?us-ascii?Q?TAQTIOpxd9U1Hwt6J9QmHmf3M30XTLitMBlaVqYEK+kb5IkQmgjw3c7eAnR/?=
 =?us-ascii?Q?tCtRml1PFhV758oAMU3q641G0RKnXS+tR3Zu?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 01:25:39.6030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6e639b-2a23-41be-a18e-08dd934f6705
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 01:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216563

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


