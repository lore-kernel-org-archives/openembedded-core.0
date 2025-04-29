Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45616C3ABAB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:39:24 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.8])
 by mx.groups.io with SMTP id smtpd.web11.112.1745937554900363562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=s5z86H+6;
 spf=pass (domain: ericsson.com, ip: 40.107.162.8, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLOywDGjjerH4NwrILLRy9O9k0Al0VJLKc+MNvVJVv1Iv8gSamZVxfESLzUEO2OaHvymjD23G/EdlwUMpCCk0ew5U4it3isYEyq/p5tHGu0XqdsuNNuS3bkstQ6pYawHIjU0kUyHgdg28V6b+sF0FQ5sFqyTwDk6SAjKI7sZhGrNOzZoAiDPng0dms1nIYM3BtEwH+D0kapq62+PrdlJzAAwsNu9PRpFAtshRMfZXJgJe+ySeuW7wSOoH+2INoL+ZQ4AlZbHfi25KlQ1MFhv1JYPlaldu/S4L2b2kX6UHef58miKnrZ3j6+53h5FZmF5Y4tRX91oDZtdA1V6lRSSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LO2G8IZ5AgHg19ep1KJlZ0K851Pt2uMutPxoLyU93dE=;
 b=kkr51QnmWGOREY1YGsVJSsG5p55KLux5d1G0KGzaWeKtQlHwtdw/O5BFmrocU2CCajDZ4Arn1TdXpzrWewNKuAglQ9rcGGJu2J+ziuNMHIheKHI4FHcC/xBHN0JpARmnpDpHd1o9jdHGvA/kA6LyvyNaECEs/bS4AWivWAGCIKvAvgkwyLPu2wIcczFjpS7U5UGix2kWjjuQ54mrh9BOBFkH82tTTk7yw4HOyGfKALvJw+ZmM45adpT6KWpvraBPosQlmEAwFRIm5Hpwvn9c5JSOS4M9bSXoMqgj1EW7qDGIMklwamRnP1DMOS2sYZ6zxqffTjI01uynuHaezLlxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LO2G8IZ5AgHg19ep1KJlZ0K851Pt2uMutPxoLyU93dE=;
 b=s5z86H+6Ii0YhiODyY46Xnki5SnVeoCQfP3seWw+3ZhvNM9IIoWmBxjSWK32HLGGZjg/i6VKDHB9nWqMDpodSlLkefTSoy8ePL90OzSu/1wZZRjZyuNxFXbImHf0JvQxW622UD06Vqd/Z2cnTUYCrqjvU9QqfYSouxysoCWDXfsGYyVnF1uGiBiFBxDomtApxVwETaX5oBbxGh9IOXbT0/yssVmLlF89METyZ8dVIwt1R/FQZbv30z9aVEiiVSnbm98A3L3UPyMmoCsP/enLuQFAOov/G6i/fROFs6V1CwjtN2Pp7gv5MnPR1/DOPMRl2pohF9lYVzHFuaLMk/5TXA==
Received: from DU2PR04CA0065.eurprd04.prod.outlook.com (2603:10a6:10:232::10)
 by GVXPR07MB9774.eurprd07.prod.outlook.com (2603:10a6:150:111::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 14:39:09 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::b2) by DU2PR04CA0065.outlook.office365.com
 (2603:10a6:10:232::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 14:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 14:39:08 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id F2B674020C0E;
	Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C4E9C70E75F6; Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Peter.Marko@siemens.com>, Daniel Turull <daniel.turull@ericsson.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v3 7/8] cve-check, vex, spdx: use metadata from linux-vulns to enhance CVE reporting
Date: Tue, 29 Apr 2025 16:39:03 +0200
Message-ID: <20250429143904.634082-8-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429143904.634082-1-daniel.turull@ericsson.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|GVXPR07MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: 41bc6e74-0522-4aa2-62cd-08dd872b99ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FmrtMe2oySTzWAeNY7yGvzmIXBQnZjX+Mpwf4NAY/VCB/Nvdc46IDnah9Ps1?=
 =?us-ascii?Q?1OckuxWjvzrDwO7563+kgmCwzKfdlDxScxzYRdrdeQvkgPhbvNCgu/qbCLXI?=
 =?us-ascii?Q?SY0uaCDfDPJvJSDi6NAES2rYgR89mwWCFBo3sK5RS5UAgREcwlKQcRYTngG+?=
 =?us-ascii?Q?zInuTG1TumOM9Znx4yl6df6A+kDMrWUMMBR+JKmQ6SPWtDAj7+Sm3H1nugK9?=
 =?us-ascii?Q?kLCJmHVcROtnZrOp+Wt4qA4wWHM/2SxIs2NO57CA7NK3Cz9MyzndEwKY41sm?=
 =?us-ascii?Q?cYrPtzYsf0W0BTLyznVqieNPAopWd/bFdOyXxbUBuwnSvsjHdlHoDXERizba?=
 =?us-ascii?Q?w+lbZF//tYL09y1ODC9MefkFq7Cufjv4inNWof57FI5OYJjRX8n2Sk2ZiUKO?=
 =?us-ascii?Q?xsemaAZB3k8TUgs1V6k3GCgondEqd9Ytq3tiBEGQq7DC5m5u8x1DqcLrYu4D?=
 =?us-ascii?Q?so6xfUznxWd8jzfSKtJOYFcxjuVQLsw37vfgsqE9+4DM2Vkl1AHzXKbKglTX?=
 =?us-ascii?Q?8KfxhErp7LnMWNARjNuCQTJv57w9NM4fp68A57HJIDswCfT4yF0JTOTjDZx4?=
 =?us-ascii?Q?kGhGK07A9fz4DKdbreVRlvF1hjkLpbFdDGQUoAbHBdGIGe5YPQXT6B/7ZzVu?=
 =?us-ascii?Q?BGy+RyXPbYr+B+wsEEoHH8exhxkUm4iJ+PPmFbPYFxF26tcFXovORSqyzUPX?=
 =?us-ascii?Q?tTeSw4u++NAlicYhmNZFJiUf/ksWFKMo2E9CPor7x75BOHA0k8ICu0zxdMa0?=
 =?us-ascii?Q?zANbTxADZzKaoIsKsDJ5dyWy9FSOqmI2o1rJ9SJC7WveTQfMXV8pylE7BSEk?=
 =?us-ascii?Q?Bh4kv36/hDV/oAku78ldBEmRvEeMyu8P4u8auejpU5WMFp/zIHcsNukZEMri?=
 =?us-ascii?Q?/PQ4s72FXpFiHc5OcQ7L5jqFrCO1eX2Ujvc4YqchzcVqEnb+FuiRHlchgM/E?=
 =?us-ascii?Q?A672oZwytuXlDmtHlTaJNChuYnkIgaHw06nXCgNgP6+CeNo4ZS66PSr2vaXd?=
 =?us-ascii?Q?7WlRFUo609LbJbLBvM6lATvM/FPicdi/lrmIZ3qZxoNfqZgFxCcW3qJK3/sX?=
 =?us-ascii?Q?yIbOSMOUvRjRfq1XGYJUKZYOklbQFhd9AI5LEizTGE3eA2ZFGnFhIPGRrBUW?=
 =?us-ascii?Q?wi8O742zRbNS/7Zz6RX6d//iBNMI1S5SQLELPXlkZe0L2Bc0s8FmX/vdknCK?=
 =?us-ascii?Q?Th/5nIhVcVCobnZ0ZzEpx3nOEKUnpv4+dckX19mJnii91+D+wgsnzpZ0z7Ey?=
 =?us-ascii?Q?14cgXLyk9yohsZYVy1ZP9kym3e0BFiuK9X5/LJExEfzPx0cIt5aV0ExEs3Jp?=
 =?us-ascii?Q?e6ihSbzWUSLx3kyJamShsO2DPfs/tK6DxyTpF/9WHl4r/FIzgdLxphdAClT1?=
 =?us-ascii?Q?M9dSbHeADzoj2a7EbbdzeV+cA3clXvs7QmUCG+eVyjRfMtKwjp1w6VglvL7r?=
 =?us-ascii?Q?cPb9SF82AY7uVlqKt/M0QRKQBTGsTxWOl7ajx1Bx7Dc/oPO8xecUYRC240mM?=
 =?us-ascii?Q?Afi8hpbjXqymc7ltTDOX8QnIQpxZG+7yCgkU+7mPMLH2E40sn092fws5oQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:39:08.7297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bc6e74-0522-4aa2-62cd-08dd872b99ae
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR07MB9774
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215673

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
 meta/classes/cve-check.bbclass   |  23 +++-
 meta/classes/spdx-common.bbclass |   3 +
 meta/classes/vex.bbclass         |  11 ++
 meta/lib/oe/cve_check.py         | 211 ++++++++++++++++++++++++++++++-
 4 files changed, 245 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 81512c255d..da396747f2 100644
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
@@ -161,15 +171,24 @@ python do_cve_check () {
     """
     Check recipe for patched and unpatched CVEs
     """
-    from oe.cve_check import get_patched_cves
+    from oe.cve_check import get_patched_cves, get_kernel_cves
=20
     with bb.utils.fileslocked([d.getVar("CVE_CHECK_DB_FILE_LOCK")], shared=
=3DTrue):
+        cve_data =3D {}
+        # Add all reported CVES from linux-vulns
+        cve_check_kernel =3D d.getVar("CVE_CHECK_KERNEL")
+        if "linux_kernel" in d.getVar("CVE_PRODUCT") and cve_check_kernel =
=3D=3D "1":
+            kernel_unpatched_cves, kernel_patched_cves =3D get_kernel_cves=
(d)
+            cve_data.update(kernel_patched_cves)
+            cve_data.update(kernel_unpatched_cves)
         if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
             try:
                 patched_cves =3D get_patched_cves(d)
+                # Update cve_data, this will cover the manually reported w=
ith CVE_STATUS
+                cve_data.update(patched_cves)
             except FileNotFoundError:
                 bb.fatal("Failure in searching patches")
-            cve_data, status =3D check_cves(d, patched_cves)
+            cve_data, status =3D check_cves(d, cve_data)
             if len(cve_data) or (d.getVar("CVE_CHECK_COVERAGE") =3D=3D "1"=
 and status):
                 get_cve_info(d, cve_data)
                 cve_write_data(d, cve_data, status)
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bb=
class
index 1e3249cbd3..83d35d0e3f 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -41,6 +41,9 @@ SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
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
index 905d67b47d..3d49b1ad0e 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -26,6 +26,14 @@
 CVE_PRODUCT ??=3D "${BPN}"
 CVE_VERSION ??=3D "${PV}"
=20
+CVE_CHECK_KERNEL_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK/vulns"
+# CVE Check using kernel CNA and compiled files
+CVE_CHECK_KERNEL ?=3D "1"
+# CVE Check using kernel compiled files
+CVE_CHECK_KERNEL_CONFIG ?=3D "0"
+# Location of the linux-vulns data
+CVE_CHECK_KERNEL_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK/vulns"
+
 CVE_CHECK_SUMMARY_DIR ?=3D "${LOG_DIR}/cve"
=20
 CVE_CHECK_SUMMARY_FILE_NAME_JSON =3D "cve-summary.json"
@@ -78,6 +86,9 @@ python () {
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
index ae194f27cf..b548402928 100644
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
@@ -376,3 +386,202 @@ def extend_cve_status(d):
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
+            d.setVar('SPDX_INCLUDE_COMPILED_SOURCE','1')
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

