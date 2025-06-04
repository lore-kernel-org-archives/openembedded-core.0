Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E219EC5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:21:51 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.17])
 by mx.groups.io with SMTP id smtpd.web11.14198.1749036107913915109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=TASDmned;
 spf=pass (domain: ericsson.com, ip: 52.101.65.17, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBBYgB9uWmQGz/B9piC48Z4ntjD8CEp+S7yWwUpzXRMwgNWDojHoYzE0UU+2vOdtX6rMTZGtmZ8XI3QMCuJwchI77cD7l9McxZYQ3Wwlwliz/zMbCe7GCTuV0lZ+Gme9UCQ8dI86Ndg+htJ65KsRoR/aYkmHMWGLUxjpo9DtsdGI9cUSKfvW5T7aL7yzGKl4ZlfasjibUtcJ8fXkOs5v3KZgaCv/7dK1pjjNefUH0WEgzMIscGbgZJD+W7c7jwS4L9k8TyMNqGdUgpb6TXeqqCUXEwdTHKlCYaB9vsp5yEMkP8sEChPsRVpviIFcg+Uw80AQhzSIUt8jVZMmuEN8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiAeU87bmavr7GcAZaA4f7Y4kjtQxOXxFgEYLN5Z3Dc=;
 b=skTDzR5apst1SP9ZcIP3LKWQAJrdRdsN8FhFBr+RC3qRpqfqExMn2ALE1tPDy7q3V3krv53VaEbSq496WWMzqDF+RAi1AgFLlWJeJYrmV/jow4AsXuVGPVrcoQlCpEMY/p0xr4nhtxp39PRI4ENW79wIeA0D9zX1/aNNvJPDU0+FyfKkCzGQIBmYFZiEvq/IPbQl6rmq/lJKptoKD8Hn6Uqdo8rsdsAFKjQJW8OVg3Mikv7lSRFG5fyp1D49EE7HkLEzdsGG/o1HF8x0CGg42sDUQYzQgjLfPKI7Y+W97WfODsWxEWH06kXLRskkRR7IFV2ar6pS1SnLTp6OWi/eog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=cherry.de smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiAeU87bmavr7GcAZaA4f7Y4kjtQxOXxFgEYLN5Z3Dc=;
 b=TASDmned7JZ5RVOCeYRWqwRaHS2P+ibDzSmdhZJufV57j3xb8IvNwvD8+9QoUXU3J/HTaFVLwiXtng2FHgfHYq+imb8pP1PeZyy1oZbCmUCXY9mD2knKaJtqLP8nvJ1Tap3jXcOWcmXxWRYSbNsgARQvmDBpABfvV52+d92Kw05I5jyyAVDQtTPGoaZp/lzBgbHQDGaDqqKsCCK72n+0RQyD9noIJxopHqbPcZCMnszPWWlhu5n6WdF+L/TfjugvCCjFwqrWYQffh3aBaWr0578mzf6+S8YhsuFhYEy/FpIYq9nD5T78dyO5RYEm3tQiGipiGpMKhRaQ1+npB/33kQ==
Received: from DU7PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::22) by PAXPR07MB8843.eurprd07.prod.outlook.com
 (2603:10a6:102:249::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 4 Jun
 2025 11:21:44 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::e8) by DU7PR01CA0019.outlook.office365.com
 (2603:10a6:10:50f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend Transport; Wed,
 4 Jun 2025 11:21:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 11:21:44 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 4 Jun 2025 13:21:43 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 563054020B6A;
	Wed,  4 Jun 2025 13:21:43 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3F1207083F54; Wed,  4 Jun 2025 13:21:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Peter Marko
	<peter.marko@siemens.com>, Marta Rybczynska <rybczynska@gmail.com>, "Joshua
 Watt" <JPEWhacker@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v6 0/3] Check compiled files to filter kernel CVEs
Date: Wed, 4 Jun 2025 13:21:30 +0200
Message-ID: <20250604112133.2581063-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|PAXPR07MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: c33f839d-ca26-494c-b9b2-08dda359fca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gFTq5VaDSyw6chhkB/sFKUPKGdIyFsWoj99edIsPGatMWHbOxhf07wUAqGdD?=
 =?us-ascii?Q?zpLdpTclBQ3a5eOY2yXssXfJ5HsoCbhcp4SdUu0GMVuoMZOx2b4Y3qIU9OzS?=
 =?us-ascii?Q?XkFus6370SroPnQaDQtZf+TR24TjdSvrsWwg8uis5KTXV7xKkhmj4y4gZVxD?=
 =?us-ascii?Q?Z+sbxtQqKaBUSBxKdnb5S3P73L2Q9clgpDsQoVCFGUcM+wRelKV9hG3IQrGx?=
 =?us-ascii?Q?pw4LvQGB205uL2FlI4zljJfM9g+WuYSSm1fYdjfJAGkjizlgZicQ1+UUGAU1?=
 =?us-ascii?Q?BJ0NB1n34ESoOnljXIGuBihLxfmoVo+01jMuORBNcZiScGvwDgVh2jbqJ33z?=
 =?us-ascii?Q?MtvrkvOFABtdX8YwDYR0K05C0jKBF3XlVlAYhgXBlZkxJdh7OPQx2CVkwBJZ?=
 =?us-ascii?Q?xG/EQS0hEHMtiyY4bWDxsAIXfSPn8tfzeaFUuI3n0hVqbssGsBAXspzn7PbX?=
 =?us-ascii?Q?UFgDPdNCtSU2zvRSnT7O/lO7OpuimKoajOA+8C+2DcPQCOqsI9cmC48xhM+P?=
 =?us-ascii?Q?J/NMB4wZHOTVGkmsciRidrLwLi0FM0+0q/eMa51fL3lRVkTKYhNVyrJV+JYJ?=
 =?us-ascii?Q?dHmZDYLng9oD+/qDALQWdFvXxZvgai+2vUyVa+4JZRQM9z/oGeKM+QDFHglR?=
 =?us-ascii?Q?3k14sjNDH67tk8KD81rNlptYQh0PYOA8h0rqXnDU+YK/lSlhEfSbRijhmmuv?=
 =?us-ascii?Q?XoXzBjG7t9EyrLsgBHxv/SOvRFjHPMmgv7N8DEDXlRoBjltWINQhzb3ElRkB?=
 =?us-ascii?Q?iBPoIl2mzOuwJuZzS17r7DgmXWB0+SjblgdA2NPI8gO+DGhLyzyjF2GASu5s?=
 =?us-ascii?Q?D/YXMPTP0kMSjkhd3Myo/P7ojXwdJDNnz8sBlXmBRYqsVg3G31y3x6/N6MIe?=
 =?us-ascii?Q?mUNY+VIpCfS5KA6lqCe1Kt7aIW2LsALGuX2qekXHno2Z/sS50Kj444qtUspL?=
 =?us-ascii?Q?M2xZ0KXOq+VdWPao4kSCx6+URz6IOXglwFH2e+932xAfsWMt8v5QXFnZqPt0?=
 =?us-ascii?Q?rLzukZlggcGcWQfPsS1e455ABhB/imPSLut9aEti/XzmDPqsLK1vA+2QOzqu?=
 =?us-ascii?Q?P/KoW+DuziqQurBkzq4fveoCvhdZwzhMLmObQR2C5rGza7K06dGm5nPrcRjJ?=
 =?us-ascii?Q?a1CxRNjP70CN9bsuDtSJZFf2mWBzHHClgFgdOwtDHRBqSY0yWgJS80F4wjln?=
 =?us-ascii?Q?dMTjm5vKBd2q5Q/bU/n9+3Y2co28aktqRw+iU32pLJ+o20KwCY7O41jFR6jC?=
 =?us-ascii?Q?Ce7Hevw1fzCbtaz3A9mHFQIXuCFYi075M7W3tantAMXObEswKOfaYV6vweXE?=
 =?us-ascii?Q?0EXy7kDSk8DFS2eQahky5WD6SGagRBpPU/xpfXed0CkcehFAvX3duxnvvJEa?=
 =?us-ascii?Q?JzkNdjkpOjG0tQ4euEQZAUE9ZfzxM3BEsvlHOwDizJIBjQLZZF1rLFUBikb+?=
 =?us-ascii?Q?GDWKgBmvr5YwsWscwB/sFPU0ZjjWx7J4UASLjON5EPnIIt5hrFc20mxfkahP?=
 =?us-ascii?Q?H32o+FzL674D2bhnjlndV1aCgzyCrACEC2d5?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 11:21:44.1889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c33f839d-ca26-494c-b9b2-08dda359fca7
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8843
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217907

From: Daniel Turull <daniel.turull@ericsson.com>

Since kernel.org became a CNA, more information is available in the publish=
ed CVEs, including details about which files are affected by a given CVE.

I have rewritten the original patch after the feedback received, including =
only the basic functionality in the build (extracting the sources as a text=
 file and inside spdx) and created a postprocessing script that enrich the =
cve-summary.

To filter out CVEs that are not applicable, we extract the files used durin=
g the kernel compilation and
compare it with the metadata in the CVE.

To enabled, add in your local.conf SPDX_INCLUDE_COMPILED_SOURCES. It will g=
enerated spdx files with only the used sources.
If only the kernel is wanted use in your local.conf: SPDX_INCLUDE_COMPILED_=
SOURCES:pn-linux-yocto =3D "1".

This could use as a base to run the vulnerability check independently and r=
un an external tool to filter the CVEs.

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
v5:
 - Use debug information from do_package to extract compiled files
 - Read spdx file from the kernel in the script to process files
v6:
 - Export debug sources as compressed json in pkgdata
 - CVE script is kept intact

CC: Peter Marko <peter.marko@siemens.com>
CC: Marta Rybczynska <rybczynska@gmail.com>
CC: Joshua Watt <JPEWhacker@gmail.com>
CC: Quentin Schulz <quentin.schulz@cherry.de>

Daniel Turull

Daniel Turull (3):
  package: export debugsources in PKGDESTWORK as json
  spdx: add option to include only compiled sources
  improve_kernel_cve_report: add script for postprocesing of kernel CVE
    data

 meta/classes/create-spdx-2.2.bbclass         |   9 +
 meta/classes/spdx-common.bbclass             |   3 +
 meta/lib/oe/package.py                       |  46 ++
 meta/lib/oe/spdx30_tasks.py                  |  10 +
 meta/lib/oe/spdx_common.py                   |  41 ++
 scripts/contrib/improve_kernel_cve_report.py | 467 +++++++++++++++++++
 6 files changed, 576 insertions(+)
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py


