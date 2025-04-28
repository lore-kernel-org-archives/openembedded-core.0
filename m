Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B2CC369DC
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:42:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.45])
 by mx.groups.io with SMTP id smtpd.web10.48684.1745847752243210989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=yMAYMmmP;
 spf=pass (domain: ericsson.com, ip: 52.101.67.45, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccIR3jUuVWtkSLnKGqOg3favIYIsFMAbIn2Z6fx9731CmDgftmJY1vD0B/guRb/JorwYcncbz1aoNLvH+ZDpiidqwrAjx+ffRNc+x7+Df+IiynHHBA9TCDsq4lQX9dklI1oEZBTQiS4l9zZMp49OPrRrATFjtGvGkofRN05UiNPt+3y0gWYB3LhKiw2S9xv4r1V3+fO1pUgUaK2IxIgSACo1bE8GVR1ZgTGZy2337uRwq87xZ9uWAX3kgfyTMHcloH1ku2s6PCVcGvNb9Wmbaa7KCEgGcna+MUD9C/XkmGYHVXmrZtZPS85XBGcZhMq9j0KwzTPXJUJL6zwraq1QrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4ZxotT0aYitJPDYbjm/EuGIIlTwIt8jtxdCZM+hG8c=;
 b=pZbRC9RaKNAYqj8DGs4sthiNvEdTLZfuHamLUzg5MTRpHX99AaNDGkbNdtu9BoChOZjy1rvDivQSpQWNfwAhQXEsCM6Dt0kLBUG+T27sRIMFgmQ55lNUOoSk6w2Z1PgbOlJC5qMnpmcT6RX4LRcrJXh4YDN5cpPt3R/c7pYCkkhWzIFF0xf2YcVV8urwzHa/VP9C6V2dHmApTdTdACUe8y4sxjkjze8NzjpmVcsoN56ydLfh8WkaOkCp1aTXHdlAQx2erh4HUbKrzZNQhYWeM8Lk431+9tYgz+zHc1Jc01pOB22AuPhLjDq1xoVzIvncARkIQLPiw6D2nOPVXCvlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4ZxotT0aYitJPDYbjm/EuGIIlTwIt8jtxdCZM+hG8c=;
 b=yMAYMmmPyXhx/xp9fGsTaqtG73liUKieRPlZy74gybzfFrWP+bTYRaOJOL/XiGGu8NAP1Q4m1QCXQjZ8nPyPcnEP05WjhCFwLEFp17uKPYn+JU5MkfoRDmTPHZvEAujzu6LMi3TbCt8AI7QINTC83Iq9pG9vTXdSZfdZ2BEmIcv6tf4Iw92pHJstaxchuF7dzZiWCxuSuAv4VrTkTVqu+KsrKHPJbHRGlYJwUezM+xvP42iFr8yId/h1ssa6b+8V1LWwTrX6T2dfnHqXC42L7kfOkKcGJWnLAndw8m3HODrI0a+0zJ9/AyKGFYDwD/aRdVHrvykTli2+R0HKgihUgA==
Received: from AS4P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::11)
 by GV1PR07MB9022.eurprd07.prod.outlook.com (2603:10a6:150:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 13:42:28 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::6c) by AS4P189CA0002.outlook.office365.com
 (2603:10a6:20b:5d7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Mon,
 28 Apr 2025 13:42:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 13:42:28 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 15:42:27 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id ACA23950AF;
	Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 9B22770E75F3; Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rybczynska@gmail.com>, <steve@sakoman.com>, <Peter.Marko@siemens.com>,
	<ross.burton@arm.com>, <skandigraun@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>, Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2 5/6] cve-check, vex, spdx: use metadata from linux-vulns to enhance CVE reporting
Date: Mon, 28 Apr 2025 15:42:04 +0200
Message-ID: <20250428134205.900354-6-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428134205.900354-1-daniel.turull@ericsson.com>
References: <20250428134205.900354-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A794:EE_|GV1PR07MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: 61564fa2-7679-4172-9b7c-08dd865a846c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QGv6C1GNdXdRkFjl0JdR3fzpxPSGjN/r6mn3iNhL4xOdEu87cBjfFW4lgDOi?=
 =?us-ascii?Q?XukKDrg4B21BV1aijTUoKj+N4mgWz7q4ANRnhEhr8yWwVv04EXD4H/TZDmHl?=
 =?us-ascii?Q?XNqnwIqImjWAGUPHKyLaMutHJS55AeWq+5RVWHmNrgz1BZvYtTLc+FKNX1oa?=
 =?us-ascii?Q?QlqR1+S4N4+XmBnUEpzEfDTGTtH8SqnqL9wQDRSiQEDpYjBqDjN5qZOP21ZB?=
 =?us-ascii?Q?zZFrfG6tiem+iEVzzI3GTgcKPnym/sPc1WeQMyRiCgySznWrFYUzUv4s81FV?=
 =?us-ascii?Q?SVv749TZyiLvBuXM6HQO4m3RhM2oKPkRZXQmfAcD6nP86O0WylLuxm6/LP66?=
 =?us-ascii?Q?S1fwcdpaebWDSRi9Edh3tr+6T3Lw7bzWISuqK01T7GHFEJW6zblEO6QuHcBt?=
 =?us-ascii?Q?jVA1U88MZKUsTFBcenqiEcgGd5kik/BP1MZrwkJnLPTCoQhKW8i/Upuy3R2P?=
 =?us-ascii?Q?3ULHv3uekjBbvzFoo5Jnh2ikRnuq28nqbgkObvsvQ9wejky+ZVrfxPr3a4zo?=
 =?us-ascii?Q?hGIOvXMQ+oHNVV4tFM7ixasuBBO6qfx/RhIJEJb1X5dXbDE7xKWJAKuoV4au?=
 =?us-ascii?Q?icSE2JcQzRV+67PpYixFXeX3uZ1NScr7WUdDS59qif/2YdVovZrc26tbm+eF?=
 =?us-ascii?Q?/tK9z6ldb9rb+dyrQj3Yusz/aE0a835a0L5+5hdq+CDGOpzJMqYJFs+vwvmu?=
 =?us-ascii?Q?glW6atVOQkeZyWM1c8HZjQStIz/waplwtZdjd9Hjir3q69XLItclOypGD6DJ?=
 =?us-ascii?Q?SYpvLE2ZPrP9apgpO9cGk/uOnQYveTOt863r6MPg++MMaGQfTBn80kQChct6?=
 =?us-ascii?Q?HQl1Z3D3W72R3ujPkOW0dHoOcuXsI2iV/i3HUAgAYFrNYB4BgJ1T8LOA52Z3?=
 =?us-ascii?Q?F3TNnRE+axNrZnzAWVwlDCHWLVk7g4hb5fBmHcVUYY+Td1KhzVwsKTcz+oYG?=
 =?us-ascii?Q?vK/o69GFo+jEy8IEdnyWucFiZb0nzKrXOOV/G9AXsEmiP7H7dYAbec1OfGXl?=
 =?us-ascii?Q?38I6vlffMEKBPqD88BwRU1OPr496jvU38Pr8SFfLp+jVRNlYaFLugxh838D8?=
 =?us-ascii?Q?kIW6o4TOqshp0Skuc9JFDeJqMuHO7ZRrhWBKHRJKocylNY306nfnnDcvVXqY?=
 =?us-ascii?Q?egFJbfM28KYEyaqZVscTCjX2d7dYkS7Z6EvVhCbY/vdwb2qKHQ5v8D0Ve9uN?=
 =?us-ascii?Q?FSZDGvQh/HX1A19jFFtzOEFWos9tW/smSz9GPjVGJ7z4wVOBFPNCyC5mjiEm?=
 =?us-ascii?Q?FA2dhcF8R4kaTNPXnxa4LiCGXvpCYvLUy1TaK+Lak3D+SzfRTkpk/xA/34Lz?=
 =?us-ascii?Q?4eJkB+bnr4jdNULzfhpuVm0kbJf2B6oaoI4/ausjB4T5DRY1bK5CPAWqGuLz?=
 =?us-ascii?Q?r5Rv34zCSWWjUdIThyYJwWFQnP4KH7oeJ9x56iZqDIlGPIkYZGQulVgQ0k45?=
 =?us-ascii?Q?Rr40TzbEjsbxqq9sdEHml2EVHDD0d8GOzZ1Z9VXbWYIkcwG+MLeNTXsJfJrx?=
 =?us-ascii?Q?6t982KFFRiKUmMRFce2W8e+RqVrPwpRnLOcHd6Xg0WiJYwoQsRo2r3WJZg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:42:28.2777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61564fa2-7679-4172-9b7c-08dd865a846c
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB9022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215602

From: Daniel Turull <daniel.turull@ericsson.com>

Introducing two new options to check kernel CVEs using linux-vulns.

- CVE_CHECK_KERNEL =3D "1"
To add linux-vulns metadata on cve-report for cve_check, vex and spdx.
This will check for kernel CVEs, and use the metadata to resolve them.
Enabled by default

- CVE_CHECK_KERNEL_CONFIG =3D "1"
CVE Check using kernel compiled files, disabled by default since it require=
s
a compiled kernel and it will increase cve-check times.
Metadata in the CVE information includes the affected files, and using the
compiled files by the kernel we can ignore some of the cves.

The above variables are defined in cve_check.bbclass, vex.bbclass and
spdx.bbclass in case not all classes are used at the same time. The ones in
cve_check has priority.

Example of output with CVE_CHECK_KERNEL_CONFIG when using cve-check:

{
  "id": "CVE-2024-26710",
  "status": "Ignored",
  "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
  "summary": "In the Linux kernel, the following vulnerability [...]",
  "scorev2": "0.0",
  "scorev3": "5.5",
  "scorev4": "0.0",
  "modified": "2025-03-17T15:36:11.620",
  "vector": "LOCAL",
  "vectorString": "CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H",
  "detail": "not-applicable-config",
  "description": "Source code not compiled by config. ['arch/powerpc/includ=
e/asm/thread_info.h']"
},

And same with vex:
{
  "id": "CVE-2024-26710",
  "status": "Ignored",
  "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
  "detail": "not-applicable-config",
  "description": "Source code not compiled by config. ['arch/powerpc/includ=
e/asm/thread_info.h']"
},

And new information for the Unpatched showing where the fix (if any) is ava=
ilable:
Tested with 6.12.22 kernel
{
  "id": "CVE-2025-39728",
  "status": "Unpatched",
  "link": "https://nvd.nist.gov/vuln/detail/CVE-2025-39728",
  "summary": "In the Linux kernel, the following vulnerability has been [..=
.],
  "scorev2": "0.0",
  "scorev3": "0.0",
  "scorev4": "0.0",
  "modified": "2025-04-21T14:23:45.950",
  "vector": "UNKNOWN",
  "vectorString": "UNKNOWN",
  "detail": "version-in-range",
  "description": "Needs backporting (fixed from 6.12.23)"
},

Tested with cve-check, create-spdx2.2, create-spdx3.0, vex

CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/cve-check.bbclass   |  19 ++-
 meta/classes/spdx-common.bbclass |   7 ++
 meta/classes/vex.bbclass         |  10 ++
 meta/lib/oe/cve_check.py         | 210 ++++++++++++++++++++++++++++++-
 4 files changed, 244 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 12159a98d2..02266f171f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -34,6 +34,13 @@ CVE_VERSION ??=3D "${PV}"
 # Possible database sources: NVD1, NVD2, FKIE
 NVD_DB_VERSION ?=3D "FKIE"
=20
+# CVE Check using kernel CNA and compiled files
+CVE_CHECK_KERNEL ?=3D "1"
+# CVE Check using kernel compiled files
+CVE_CHECK_KERNEL_CONFIG ?=3D "0"
+# Location of the linux-vulns data
+CVE_CHECK_KERNEL_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK/vulns"
+
 # Use different file names for each database source, as they synchronize a=
t different moments, so may be slightly different
 CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSION=
') =3D=3D 'NVD2' else 'nvdcve_1-3.db' if d.getVar('NVD_DB_VERSION') =3D=3D =
'NVD1' else 'nvdfkie_1-1.db'}"
 CVE_CHECK_DB_FETCHER ?=3D "${@'cve-update-nvd2-native' if d.getVar('NVD_DB=
_VERSION') =3D=3D 'NVD2' else 'cve-update-db-native'}"
@@ -111,6 +118,9 @@ python () {
     if nvd_database_type not in ("NVD1", "NVD2", "FKIE"):
         bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD1, NVD2=
, FKIE. Defaulting to NVD2")
         d.setVar("NVD_DB_VERSION", "NVD2")
+
+    from oe.cve_check import extend_cve_kernel_config
+    extend_cve_kernel_config(d, "do_cve_check")
 }
=20
 def generate_json_report(d, out_path, link_path):
@@ -161,7 +171,7 @@ python do_cve_check () {
     """
     Check recipe for patched and unpatched CVEs
     """
-    from oe.cve_check import get_patched_cves
+    from oe.cve_check import get_patched_cves, get_kernel_cves
=20
     with bb.utils.fileslocked([d.getVar("CVE_CHECK_DB_FILE_LOCK")], shared=
=3DTrue):
         if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
@@ -170,6 +180,13 @@ python do_cve_check () {
             except FileNotFoundError:
                 bb.fatal("Failure in searching patches")
             cve_data, status =3D check_cves(d, patched_cves)
+
+            cve_check_kernel =3D d.getVar("CVE_CHECK_KERNEL")
+            if "linux_kernel" in d.getVar("CVE_PRODUCT") and cve_check_ker=
nel =3D=3D "1":
+                kernel_unpatched_cves, _kernel_patched_cves =3D get_kernel=
_cves(d)
+                # Patched CVEs are already returned in the get_patched_cve=
s(). Adding the unpatched
+                cve_data.update(kernel_unpatched_cves)
+
             if len(cve_data) or (d.getVar("CVE_CHECK_COVERAGE") =3D=3D "1"=
 and status):
                 get_cve_info(d, cve_data)
                 cve_write_data(d, cve_data, status)
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bb=
class
index 713a7fc651..d2b9c6993a 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -37,9 +37,16 @@ SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
=20
 SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
=20
+CVE_CHECK_KERNEL ??=3D "0"
+CVE_CHECK_KERNEL_CONFIG ??=3D "0"
+CVE_CHECK_KERNEL_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK/vulns"
+
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
+
+    from oe.cve_check import extend_cve_kernel_config
+    extend_cve_kernel_config(d, "do_create_spdx")
 }
=20
 def create_spdx_source_deps(d):
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 905d67b47d..56ebdb0580 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -26,6 +26,13 @@
 CVE_PRODUCT ??=3D "${BPN}"
 CVE_VERSION ??=3D "${PV}"
=20
+# CVE Check using kernel CNA and compiled files
+CVE_CHECK_KERNEL ?=3D "0"
+# CVE Check using kernel compiled files
+CVE_CHECK_KERNEL_CONFIG ?=3D "0"
+
+CVE_CHECK_KERNEL_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK/vulns"
+
 CVE_CHECK_SUMMARY_DIR ?=3D "${LOG_DIR}/cve"
=20
 CVE_CHECK_SUMMARY_FILE_NAME_JSON =3D "cve-summary.json"
@@ -78,6 +85,9 @@ python () {
=20
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
+
+    from oe.cve_check import extend_cve_kernel_config
+    extend_cve_kernel_config(d, "do_generate_vex")
 }
=20
 def generate_json_report(d, out_path, link_path):
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index ae194f27cf..9f34da0e91 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -47,6 +47,7 @@ class Version():
             self._version.pre_l,
             self._version.pre_v
         )
+        self.version =3D version
=20
     def __eq__(self, other):
         if not isinstance(other, Version):
@@ -58,6 +59,9 @@ class Version():
             return NotImplemented
         return self._key > other._key
=20
+    def __str__(self) -> str:
+        return self.version
+
 def _cmpkey(release, patch_l, pre_l, pre_v):
     # remove leading 0
     _release =3D tuple(
@@ -202,8 +206,14 @@ def get_patched_cves(d):
                 "affected-product": decoded_status["product"],
             }
=20
-    return patched_cves
+    # If we are parsing the kernel, check compiled files
+    cve_check_kernel =3D d.getVar("CVE_CHECK_KERNEL")
+    if "linux_kernel" in d.getVar("CVE_PRODUCT") and cve_check_kernel =3D=
=3D "1":
+         bb.debug(1, "Checking kernel CVEs")
+         _kernel_unpatched_cves, kernel_patched_cves =3D get_kernel_cves(d=
)
+         patched_cves.update(kernel_patched_cves)
=20
+    return patched_cves
=20
 def get_cpe_ids(cve_product, version):
     """
@@ -376,3 +386,201 @@ def extend_cve_status(d):
                 d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_gr=
oup, "status"))
         else:
             bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" % c=
ve_status_group)
+
+def extend_cve_kernel_config(d, task):
+    pn =3D d.getVar('PN')
+    # For kernel CVEs, add required dependencies
+    if "linux_kernel" in d.getVar("CVE_PRODUCT"):
+        if d.getVar("CVE_CHECK_KERNEL_CONFIG") =3D=3D "1":
+            bb.debug(1, "Checking kernel CVEs using kernel config")
+            depends =3D f" {pn}:do_save_compiled_files "
+            d.appendVarFlag(task, "depends", depends)
+            d.setVar('CVE_CHECK_KERNEL','1')
+        if d.getVar("CVE_CHECK_KERNEL") =3D=3D "1":
+            bb.debug(1, "Checking kernel CVEs using linux-vulns")
+            d.appendVarFlag(task, "depends", " linux-vulns:do_fetch ")
+
+def get_kernel_cves(d):
+    """
+    Get CVEs for the kernel
+    """
+    import glob
+    import json
+    patched_cves =3D {}
+    unpatched_cves =3D {}
+    datadir =3D f"{d.getVar('CVE_CHECK_KERNEL_DB_DIR')}/cve/published/"
+    version_str =3D d.getVar("LINUX_VERSION")
+    check_config =3D d.getVar("CVE_CHECK_KERNEL_CONFIG")
+    version =3D Version(version_str)
+    base_version =3D Version(".".join(version_str.split(".")[0:2]))
+
+    # Check all CVES from kernel vulns
+    pattern =3D os.path.join(datadir, '**', f"CVE-*.json")
+    cve_files =3D glob.glob(pattern, recursive=3DTrue)
+    not_applicable_config =3D 0
+    fixed_as_later_backport =3D 0
+    for cve_file in cve_files:
+        cve_info =3D {}
+        with open(cve_file, "r") as f:
+            cve_info =3D json.load(f)
+
+        if len(cve_info) =3D=3D 0:
+            bb.error(f"Not valid data in {cve_file}. Aborting")
+            break
+        cve_id =3D cve_info["cveMetadata"]["cveID"]
+
+        first_affected, fixed, backport_ver =3D get_kernel_fixed_versions(=
cve_info, base_version)
+        if not fixed:
+            if check_config =3D=3D "1":
+                is_affected, affected_files =3D check_kernel_compiled_file=
s(d, cve_info)
+            else:
+                is_affected =3D True
+            if not is_affected and len(affected_files) > 0:
+                bb.debug(1, f"{cve_id} - not applicable configuration sinc=
e affected files not compiled: {affected_files}")
+                patched_cves[cve_id] =3D {
+                    "abbrev-status": "Ignored",
+                    "status": "not-applicable-config",
+                    "justification": f"Source code not compiled by config.=
 {affected_files}"
+                }
+            else:
+                bb.debug(1, f"{cve_id} not fixed usptream")
+                description =3D cve_info["containers"]["cna"]["description=
s"][0]["value"]
+                unpatched_cves[cve_id] =3D {
+                    "abbrev-status": "Unpatched",
+                    "status": "version-in-range",
+                    "summary": description,
+                    "justification": f"No fix available upstream"
+                }
+        elif first_affected and version < first_affected:
+            bb.debug(1, f'{cve_id} - "fixed-version: only affects {first_a=
ffected} onwards"')
+            patched_cves[cve_id] =3D {
+                "abbrev-status": "Patched",
+                "status": "fixed-version",
+                "justification": f"only affects {first_affected} onwards"
+            }
+        elif fixed <=3D version:
+            bb.debug(1, f'{cve_id} - "fixed-version: Fixed from version {f=
ixed}"')
+            patched_cves[cve_id] =3D {
+                "abbrev-status": "Patched",
+                "status": "fixed-version",
+                "justification": f"fixed-version: Fixed from version {fixe=
d}"
+            }
+        else:
+            if backport_ver:
+                if backport_ver <=3D version:
+                    bb.debug(1, f'{cve_id} - "cpe-stable-backport: Backpor=
ted in {backport_ver}"')
+                    patched_cves[cve_id] =3D {
+                        "abbrev-status": "Patched",
+                        "status": "cpe-stable-backport",
+                        "justification": f"Backported in {backport_ver}"
+                    }
+                else:
+                    bb.debug(1, f"{cve_id}: needs backporting (fixed from =
{backport_ver})")
+                    description =3D cve_info["containers"]["cna"]["descrip=
tions"][0]["value"]
+                    unpatched_cves[cve_id] =3D {
+                        "abbrev-status": "Unpatched",
+                        "status": "version-in-range",
+                        "summary": description,
+                        "justification": f"Needs backporting (fixed from {=
backport_ver})"
+                    }
+                    fixed_as_later_backport +=3D 1
+            else:
+                # Check if file affected
+                if check_config =3D=3D "1":
+                    is_affected, affected_files =3D check_kernel_compiled_=
files(d, cve_info)
+                else:
+                    is_affected =3D True
+                if not is_affected and len(affected_files) > 0:
+                    bb.debug(1, f"{cve_id} - not applicable configuration =
since affected files not compiled: {affected_files}")
+                    patched_cves[cve_id] =3D {
+                         "abbrev-status": "Ignored",
+                         "status": "not-applicable-config",
+                         "justification": f"Source code not compiled by co=
nfig. {affected_files}"
+                    }
+                    not_applicable_config +=3D1
+                else:
+                    bb.debug(1, f"{cve_id}: needs backporting (fixed from =
{fixed})")
+                    description =3D cve_info["containers"]["cna"]["descrip=
tions"][0]["value"]
+                    unpatched_cves[cve_id] =3D {
+                        "abbrev-status": "Unpatched",
+                        "status": "version-in-range",
+                        "summary": description,
+                        "justification": f"Needs backporting (fixed from {=
fixed})"
+                    }
+    if len(cve_files) > 0:
+        bb.debug(1, f"Total CVEs ignored due to not applicable config {not=
_applicable_config}")
+        bb.debug(1, f"Total vulnerable CVEs: {len(unpatched_cves)}")
+        bb.debug(1, f"Total CVEs already backported in {base_version}: {fi=
xed_as_later_backport}")
+    return unpatched_cves, patched_cves
+
+def check_kernel_compiled_files(d, cve_info):
+    """
+    Return if a CVE affected us depending on compiled files
+    """
+    import json
+    files_affected =3D []
+    kfiles =3D []
+    is_affected =3D False
+    with open(d.getVar('KERNEL_SRC_FILES'), 'r') as file:
+        for item in json.load(file):
+            kfiles.append(item['file'].replace(f"{d.getVar('S')}/",""))
+
+    for item in cve_info['containers']['cna']['affected']:
+        if item["defaultStatus"] =3D=3D "affected":
+            if "programFiles" in item:
+                files =3D item['programFiles']
+                files_affected.extend(files)
+
+    if len(files_affected) > 0:
+        for f in files_affected:
+            if f in kfiles:
+                bb.debug(1, f"File match: {f}")
+                is_affected =3D True
+    return is_affected, files_affected
+
+def get_kernel_fixed_versions(cve_info, base_version):
+    '''
+    Get fixed versions for a given CVE
+    '''
+    first_affected =3D None
+    fixed =3D None
+    fixed_backport =3D None
+    next_version =3D Version(str(base_version) + ".5000")
+    for affected in cve_info["containers"]["cna"]["affected"]:
+        # In case the CVE info is not complete, it might not have default =
status and therefore
+        # we don't know the status of this CVE.
+        if not "defaultStatus" in affected:
+            return first_affected, fixed, fixed_backport
+        if affected["defaultStatus"] =3D=3D "affected":
+            for version in affected["versions"]:
+                v =3D Version(version["version"])
+                if v =3D=3D 0:
+                    # Skiping non-affected
+                    continue
+                if version["status"] =3D=3D "affected" and not first_affec=
ted:
+                    first_affected =3D v
+                elif (version["status"] =3D=3D "unaffected" and
+                    version['versionType'] =3D=3D "original_commit_for_fix=
"):
+                    fixed =3D v
+                elif base_version < v and v < next_version:
+                    fixed_backport =3D v
+        elif affected["defaultStatus"] =3D=3D "unaffected":
+            # Only specific versions are affected. We care only about our =
base version
+            if "versions" not in affected:
+                continue
+            for version in affected["versions"]:
+                if "versionType" not in version:
+                    continue
+                if version["versionType"] =3D=3D "git":
+                    continue
+                v =3D Version(version["version"])
+                # in case it is not in our base version
+                less_than =3D Version(version["lessThan"])
+
+                if not first_affected:
+                    first_affected =3D v
+                fixed =3D less_than
+                if base_version < v and v < next_version:
+                    fixed_backport =3D less_than
+
+    return first_affected, fixed, fixed_backport

