Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56550C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 12:57:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.44])
 by mx.groups.io with SMTP id smtpd.web11.101791.1747227458372931785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 05:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=a3IEOkMR;
 spf=pass (domain: ericsson.com, ip: 40.107.22.44, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsEzC+TUwy4Dc5YLb4sp/DskPd9797IXZP40taXwtlGx05HE3r+4Gqp0GRKMwgN1aP4F0p7gEmlym0ss/HRUNTeMxRI6hX0oPQtPn0hzZpr21nClfcFoID5YqCFh+/DxL2RQM4hXk2dcvEG5g2q7OuHv9xrwrdpumzy+xxKq+UFmXFbbtAQ+2olKIvOZpz0S4ypfE/DiQBXJ5FxA5uDT8cgZSI7GI6gdWe491tjkisfc+nOs/mJDKasd1D5x8FyrDkfqOfDHxFPn5XQ1tXqnhDLOuqbQiQoxwpCIMIsTq9YnULvnThUJbuZF9LTiKYZBnPn2bApfDoxfbPffcvH9dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9SCgQtKh7Nll8oFBtC9HaW6XwG6j3XuDltqnZFCxVk=;
 b=MbbTevTJ1Ctu6chr5M+FTkxmkIeDV1TG4mzNlxV3juTJAjC+t+vz/hhfc3QcXeEyCnQQzuxbHo3g5CaSY4IMhdutXx1UeFHQgUShKgfePLou4uNsu/BS75fFAO2xUmt3wWwnAzjOCIA21a1qd37Ti6lm0PD/iKidW6TrWnlkGNjowWcqTDYQjrwunfDgvz0Ab0vDvZx85aV9dykHb48FQB7+kUOuTgKAmbsuUrYksxtcqAfuCscFC5kXBteSTJqW/Sln4wupMWrwdDS+pncfQLth409afH2uSczQv4PwTRH1g/+L+HCes1d+//Xo+5UD1eTE5JfZfLFB9xMIDjawJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9SCgQtKh7Nll8oFBtC9HaW6XwG6j3XuDltqnZFCxVk=;
 b=a3IEOkMRKt6t0N1mLXcZ9lLtn/bAl+Tdg1DekeQW6Tpc4Odhl2+6pdK6Tftv/CAX6MmZRiq/ighTFKdT0iCRIac8CowFNF21BYQrvyExVL0UtfHBy5BOdamaj10ANbFTonrHuvFX4OzaS930m5d80LQW6KWqjDXarCpCCguSWSNY5G2EczU+7CQHhoU2s0m3TEUKmqMqbb3TeJ8mwyKSQZfvzvNuRtm3woPssGKRJQPGPTZpTb3vtXF8DeqX4BtpVXWjC42CPw5EF3cHnoIKNILbjfX5M+2rQ2FeGEgPT1yTcbrCXxN1T2IaXMQ7Z84n0rsBH3eGqFx/V9ozLZqixg==
Received: from AM8P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::29)
 by PAWPR07MB9830.eurprd07.prod.outlook.com (2603:10a6:102:38d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 12:57:34 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::fe) by AM8P251CA0024.outlook.office365.com
 (2603:10a6:20b:21b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Wed,
 14 May 2025 12:57:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 14 May 2025 12:57:34 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 14:57:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 75FCA16E64D;
	Wed, 14 May 2025 14:57:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 63FA670E61C0; Wed, 14 May 2025 14:57:33 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Peter Marko
	<peter.marko@siemens.com>, Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH v4 3/3] improve_kernel_cve_report: add script for postprocesing of kernel CVE data
Date: Wed, 14 May 2025 14:57:06 +0200
Message-ID: <20250514125706.495571-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514125706.495571-1-daniel.turull@ericsson.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|PAWPR07MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 873922fb-b529-4696-a7a4-08dd92e6e530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lGqVOmDq7w6+QnQ69B3yK0+EZaZkA2CUNtDLMFgwBEfEtSnkPomAvu3iaLer?=
 =?us-ascii?Q?Ay9zmQPtSXCQ2hC6RBlDxxlDaoP/B/e7bIHAY7d/JUAr6YA4+1H1uJvgQ+3g?=
 =?us-ascii?Q?6a8Jzau1sNHeVIOn2crRaNJTy5oZLDDbW43Ocev9piE+5J7blJwtJgofC3Gl?=
 =?us-ascii?Q?5DeJbUaXj94yylhRl8Ri44BjXZAU9eGm9wZ9nxllv2earV75S+mZjoLHq6WV?=
 =?us-ascii?Q?ZgdlVdKafu2y03zUA9VttuxEfR79CjwqS2RgLGzu78N5z6MmmDxVESRHJ6Po?=
 =?us-ascii?Q?irMtmrML8kk94ydx+awqKKkt3dVaUWZkgYLMmd3WVZFO7FNai/7JDyPe4vA9?=
 =?us-ascii?Q?aMO9oriR49hpzHOXAR3BYcSJTgMwDPvvlX+9mC5oJHN9RfMdjboWzr6dyPuj?=
 =?us-ascii?Q?6lV2lXa+Z/yqBK0XG9713eZO0hnfNbu7icpFKCY/RwZWIGZNSrc+edC3HmEa?=
 =?us-ascii?Q?mY7atjcZrIJ6dOaVjBqTDZNeX470u/M7s4uZao7v25qwMT0d1f2UTFRFrBhN?=
 =?us-ascii?Q?uR3YQnuyf0DrmNNEbKS6xxG7+bU2LpkmW4h5Xx+VEecSOWS1G5fnqqMs75Kq?=
 =?us-ascii?Q?P3FsenhMG9qk3fRCQXN0sYVc4qj3WUYWEScZ/GqviGerfXOeVxs6QtPaiHpQ?=
 =?us-ascii?Q?6WVRMtua0HHbbkydsPGMABv1r4gabrCBgGcJEn3xADPOUCJBN26xGKlw9TBG?=
 =?us-ascii?Q?sT0nPhw8c8ozF2HuLMm4Y6INGe6j08qSSW8ENCa0Hj3+vhpwftFutLOCo3WW?=
 =?us-ascii?Q?O7WxTZOeVwcGGbuV3b86NUvl0Akgp4AK8tduOCN/n5vKQLbWRk66RcIZxVPn?=
 =?us-ascii?Q?NP5VTCFGRG5zqX7gTLIrydU9D7F6WAygv9jbHhKhSYFrDQiicB3sy/DXKqdz?=
 =?us-ascii?Q?QSG8xY8+UPotUppHOH6VFTYZ2TvCkYJ2blaCcH1J6fYgfWn1wmxR3gSr0ZZQ?=
 =?us-ascii?Q?tjLUp7BWIofmORMs8/O7XQfIbO8HEXNznvXEKdFjYLyW8CrA40t3d2kEBPZi?=
 =?us-ascii?Q?Cu5hwr20jwP1QGQe1msgMPRjID3EG30V9Qht+fxAbf/7wHmqDRIWzXVHR9IR?=
 =?us-ascii?Q?NTtDPLkb6IwFMjg8wsJRKXXutVdpQpjPEBnvazzF0zgoBieyRTeTJ67JKuTR?=
 =?us-ascii?Q?CGCC3vHJo0kIYra4gQ8rigucbj2PLjcmlft1qoUgouQu2YYC0uMi5Guf1KrE?=
 =?us-ascii?Q?DHqHDu5Z2U5ZEK0Lgb/C4+qjjPz5olaUm5JpLMwD87wCLKeSaFTocciOBW8B?=
 =?us-ascii?Q?HYFN2Ky2C1p12P5usD2qXNwo1QapSAdzxzIpbzG5F1L1hV+OhV5inojOhRyc?=
 =?us-ascii?Q?DYNqtXE+ghTeyPtGT57JzctkKF6toiU9WHzK3uShZs9fWxFob+iGTyRgptYF?=
 =?us-ascii?Q?Madds2Vf75oVOLF7NfE8w/oOiwbV++FF4LUQ57e6n8/e6/JLCkK08NgpcaKO?=
 =?us-ascii?Q?iUHmsMs2BBjcd/mR5j4r00kdb9eP4/kr1PXegbiQHOhXMSp/lG5q+Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 12:57:34.1100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 873922fb-b529-4696-a7a4-08dd92e6e530
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 12:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216491

From: Daniel Turull <daniel.turull@ericsson.com>

Adding postprocessing script to process data from linux CNA that includes m=
ore accurate metadata and it is updated directly by the source.

Example of enhanced CVE from a report from cve-check:

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

And same from a report generated with vex:
{
  "id": "CVE-2024-26710",
  "status": "Ignored",
  "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
  "detail": "not-applicable-config",
  "description": "Source code not compiled by config. ['arch/powerpc/includ=
e/asm/thread_info.h']"
},

For unpatched CVEs, provide more context in the description:
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

CC: Peter Marko <peter.marko@siemens.com>
CC: Marta Rybczynska <rybczynska@gmail.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 437 +++++++++++++++++++
 1 file changed, 437 insertions(+)
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
new file mode 100755
index 0000000000..d1ce694c5f
--- /dev/null
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -0,0 +1,437 @@
+#! /usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# The script uses another source of CVE information from linux-vulns
+# to enrich the cve-summary from cve-check or vex.
+# It can also use the list of compiled files to ignore CVEs that are not
+# affected since the files are not compiled.
+#
+# It creates a new json file with updated CVE information
+#
+# Compiled files can be extracted adding the following in local.conf
+# SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
+#
+# Tested with the following CVE sources:
+# - https://git.kernel.org/pub/scm/linux/security/vulns.git
+# - https://github.com/CVEProject/cvelistV5
+#
+# Example:
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py=
 -s build/tmp/log/spdx-compiled/kernel_files/compiled_src-qemux86-64-linux-=
yocto-6.12.27+git.txt --kernel-version 6.12.27 --datadir ./vulns
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py=
 -s build/tmp/log/spdx-compiled/linux-yocto/compiled_src-qemux86-64-linux-y=
octo-6.12.27+git.txt --datadir ./vulns --old-cve-report build/tmp/log/cve/c=
ve-summary.json
+#
+# SPDX-License-Identifier: GPLv2
+
+import argparse
+import json
+import sys
+import logging
+import glob
+import os
+import pathlib
+from packaging.version import Version
+
+def is_linux_cve(cve_info):
+    '''Return true is the CVE belongs to Linux'''
+    if not "affected" in cve_info["containers"]["cna"]:
+        return False
+    for affected in cve_info["containers"]["cna"]["affected"]:
+        if not "product" in affected:
+            return False
+        if affected["product"] =3D=3D "Linux" and affected["vendor"] =3D=
=3D "Linux":
+            return True
+    return False
+
+def get_kernel_cves(datadir, compiled_files, version):
+    """
+    Get CVEs for the kernel
+    """
+    cves =3D {}
+
+    check_config =3D len(compiled_files) > 0
+
+    base_version =3D Version(f"{version.major}.{version.minor}")
+
+    # Check all CVES from kernel vulns
+    pattern =3D os.path.join(datadir, '**', "CVE-*.json")
+    cve_files =3D glob.glob(pattern, recursive=3DTrue)
+    not_applicable_config =3D 0
+    fixed_as_later_backport =3D 0
+    vulnerable =3D 0
+    not_vulnerable =3D 0
+    for cve_file in sorted(cve_files):
+        cve_info =3D {}
+        with open(cve_file, "r", encoding=3D'ISO-8859-1') as f:
+            cve_info =3D json.load(f)
+
+        if len(cve_info) =3D=3D 0:
+            logging.error("Not valid data in %s. Aborting", cve_file)
+            break
+
+        if not is_linux_cve(cve_info):
+            continue
+        cve_id =3D os.path.basename(cve_file)[:-5]
+        description =3D cve_info["containers"]["cna"]["descriptions"][0]["=
value"]
+        if cve_file.find("rejected") >=3D 0:
+            logging.debug("%s is rejected by the CNA", cve_id)
+            cves[cve_id] =3D {
+                "id": cve_id,
+                "status": "Ignored",
+                "detail": "rejected",
+                "summary": description,
+                "description": f"Rejected by CNA"
+            }
+            continue
+        if any(elem in cve_file for elem in ["review", "reverved", "testin=
g"]):
+            continue
+
+        is_vulnerable, first_affected, last_affected, better_match_first, =
better_match_last, affected_versions =3D get_cpe_applicability(cve_info, ve=
rsion)
+
+        logging.debug("%s: %s (%s - %s) (%s - %s)", cve_id, is_vulnerable,=
 better_match_first, better_match_last, first_affected, last_affected)
+
+        if is_vulnerable is None:
+            logging.warning("%s doesn't have good metadata", cve_id)
+        if is_vulnerable:
+            is_affected =3D True
+            affected_files =3D []
+            if check_config:
+                is_affected, affected_files =3D check_kernel_compiled_file=
s(compiled_files, cve_info)
+
+            if not is_affected and len(affected_files) > 0:
+                logging.debug(
+                    "%s - not applicable configuration since affected file=
s not compiled: %s",
+                    cve_id, affected_files)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Ignored",
+                    "detail": "not-applicable-config",
+                    "summary": description,
+                    "description": f"Source code not compiled by config. {=
affected_files}"
+                }
+                not_applicable_config +=3D1
+            # Check if we have backport
+            else:
+                if not better_match_last:
+                    fixed_in =3D last_affected
+                else:
+                    fixed_in =3D better_match_last
+                logging.debug("%s needs backporting (fixed from %s)", cve_=
id, fixed_in)
+                cves[cve_id] =3D {
+                        "id": cve_id,
+                        "status": "Unpatched",
+                        "detail": "version-in-range",
+                        "summary": description,
+                        "description": f"Needs backporting (fixed from {fi=
xed_in})"
+                }
+                vulnerable +=3D 1
+                if (better_match_last and
+                    Version(f"{better_match_last.major}.{better_match_last=
.minor}") =3D=3D base_version):
+                    fixed_as_later_backport +=3D 1
+        # Not vulnerable
+        else:
+            if not first_affected:
+                logging.debug("%s - not known affected %s",
+                              cve_id,
+                              better_match_last)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "version-not-in-range",
+                    "summary": description,
+                    "description": "No CPE match"
+                }
+                not_vulnerable +=3D 1
+                continue
+            backport_base =3D Version(f"{better_match_last.major}.{better_=
match_last.minor}")
+            if version < first_affected:
+                logging.debug('%s - fixed-version: only affects %s onwards=
',
+                              cve_id,
+                              first_affected)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "fixed-version",
+                    "summary": description,
+                    "description": f"only affects {first_affected} onwards=
"
+                }
+                not_vulnerable +=3D 1
+            elif last_affected <=3D version:
+                logging.debug("%s - fixed-version: Fixed from version %s",
+                              cve_id,
+                              last_affected)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "fixed-version",
+                    "summary": description,
+                    "description": f"fixed-version: Fixed from version {la=
st_affected}"
+                }
+                not_vulnerable +=3D 1
+            elif backport_base =3D=3D base_version:
+                logging.debug("%s - cpe-stable-backport: Backported in %s"=
,
+                              cve_id,
+                              better_match_last)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "cpe-stable-backport",
+                    "summary": description,
+                    "description": f"Backported in {better_match_last}"
+                }
+                not_vulnerable +=3D 1
+            else:
+                logging.debug("%s - version not affected %s", cve_id, str(=
affected_versions))
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "version-not-in-range",
+                    "summary": description,
+                    "description": f"Range {affected_versions}"
+                }
+                not_vulnerable +=3D 1
+
+    logging.info("Total CVEs ignored due to not applicable config: %d", no=
t_applicable_config)
+    logging.info("Total CVEs not vulnerable due version-not-in-range: %d",=
 not_vulnerable)
+    logging.info("Total vulnerable CVEs: %d", vulnerable)
+
+    logging.info("Total CVEs already backported in %s: %s", base_version,
+                    fixed_as_later_backport)
+    return cves
+
+def read_compiled_files(compiled_file_data):
+    """
+    Open and return list of compiled files
+    """
+    kfiles =3D []
+    with open(compiled_file_data, 'r', encoding=3D'ISO-8859-1') as f:
+        kfiles =3D [line.strip() for line in f]
+    return kfiles
+
+def check_kernel_compiled_files(compiled_files, cve_info):
+    """
+    Return if a CVE affected us depending on compiled files
+    """
+    files_affected =3D []
+    is_affected =3D False
+
+    for item in cve_info['containers']['cna']['affected']:
+        if "programFiles" in item:
+            for f in item['programFiles']:
+                if f not in files_affected:
+                    files_affected.append(f)
+
+    if len(files_affected) > 0:
+        for f in files_affected:
+            if f in compiled_files:
+                logging.debug("File match: %s", f)
+                is_affected =3D True
+    return is_affected, files_affected
+
+def get_cpe_applicability(cve_info, v):
+    '''
+    Check if version is affected and return affected versions
+    '''
+    base_branch =3D Version(f"{v.major}.{v.minor}")
+    affected =3D []
+    if not 'cpeApplicability' in cve_info["containers"]["cna"]:
+        return None, None, None, None, None, None
+
+    for nodes in cve_info["containers"]["cna"]["cpeApplicability"]:
+        for node in nodes.values():
+            vulnerable =3D False
+            matched_branch =3D False
+            first_affected =3D Version("5000")
+            last_affected =3D Version("0")
+            better_match_first =3D Version("0")
+            better_match_last =3D Version("5000")
+
+            if len(node[0]['cpeMatch']) =3D=3D 0:
+                first_affected =3D None
+                last_affected =3D None
+                better_match_first =3D None
+                better_match_last =3D None
+
+            for cpe_match in node[0]['cpeMatch']:
+                version_start_including =3D Version("0")
+                version_end_excluding =3D Version("0")
+                if 'versionStartIncluding' in cpe_match:
+                    version_start_including =3D Version(cpe_match['version=
StartIncluding'])
+                else:
+                    version_start_including =3D Version("0")
+                # if versionEndExcluding is missing we are in a branch, wh=
ich is not fixed.
+                if "versionEndExcluding" in cpe_match:
+                    version_end_excluding =3D Version(cpe_match["versionEn=
dExcluding"])
+                else:
+                    # if versionEndExcluding is missing we are in a branch=
, which is not fixed.
+                    version_end_excluding =3D Version(
+                        f"{version_start_including.major}.{version_start_i=
ncluding.minor}.5000"
+                    )
+                affected.append(f" {version_start_including}-{version_end_=
excluding}")
+                # Detect if versionEnd is in fixed in base branch. It has =
precedence over the rest
+                branch_end =3D Version(f"{version_end_excluding.major}.{ve=
rsion_end_excluding.minor}")
+                if branch_end =3D=3D base_branch:
+                    if version_start_including <=3D v < version_end_exclud=
ing:
+                        vulnerable =3D cpe_match['vulnerable']
+                    # If we don't match in our branch, we are not vulnerab=
le,
+                    # since we have a backport
+                    matched_branch =3D True
+                    better_match_first =3D version_start_including
+                    better_match_last =3D version_end_excluding
+                if version_start_including <=3D v < version_end_excluding =
and not matched_branch:
+                    if version_end_excluding < better_match_last:
+                        better_match_first =3D max(version_start_including=
, better_match_first)
+                        better_match_last =3D min(better_match_last, versi=
on_end_excluding)
+                        vulnerable =3D cpe_match['vulnerable']
+                        matched_branch =3D True
+
+                first_affected =3D min(version_start_including, first_affe=
cted)
+                last_affected =3D max(version_end_excluding, last_affected=
)
+            # Not a better match, we use the first and last affected inste=
ad of the fake .5000
+            if vulnerable and better_match_last =3D=3D Version(f"{base_bra=
nch}.5000"):
+                better_match_last =3D last_affected
+                better_match_first =3D first_affected
+    return vulnerable, first_affected, last_affected, better_match_first, =
better_match_last, affected
+
+def copy_data(old, new):
+    '''Update dictionary with new entries, while keeping the old ones'''
+    for k in new.keys():
+        old[k] =3D new[k]
+    return old
+
+# Function taken from cve_check.bbclass. Adapted to cve fields
+def cve_update(cve_data, cve, entry):
+    # If no entry, just add it
+    if cve not in cve_data:
+        cve_data[cve] =3D entry
+        return
+    # If we are updating, there might be change in the status
+    if cve_data[cve]['status'] =3D=3D "Unknown":
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        return
+    if cve_data[cve]['status'] =3D=3D entry['status']:
+        return
+    if entry['status'] =3D=3D "Unpatched" and cve_data[cve]['status'] =3D=
=3D "Patched":
+        logging.warning("CVE entry %s update from Patched to Unpatched fro=
m the scan result", cve)
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        return
+    if entry['status'] =3D=3D "Patched" and cve_data[cve]['status'] =3D=3D=
 "Unpatched":
+        logging.warning("CVE entry %s update from Unpatched to Patched fro=
m the scan result", cve)
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        return
+    # If we have an "Ignored", it has a priority
+    if cve_data[cve]['status'] =3D=3D "Ignored":
+        logging.debug("CVE %s not updating because Ignored", cve)
+        return
+    # If we have an "Ignored", it has a priority
+    if entry['status'] =3D=3D "Ignored":
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        logging.debug("CVE entry %s updated from Unpatched to Ignored", cv=
e)
+        return
+    logging.warning("Unhandled CVE entry update for %s %s from %s %s to %s=
",
+        cve, cve_data[cve]['status'], cve_data[cve]['detail'],  entry['sta=
tus'], entry['detail'])
+
+def main():
+    parser =3D argparse.ArgumentParser(
+        description=3D"Update cve-summary with kernel compiled files and k=
ernel CVE information"
+    )
+    parser.add_argument(
+        "-s",
+        "--sources",
+        help=3D"Compiled source for the kernel",
+    )
+    parser.add_argument(
+        "--datadir",
+        type=3Dpathlib.Path,
+        help=3D"Directory where CVE data is",
+        required=3DTrue
+    )
+    parser.add_argument(
+        "--old-cve-report",
+        help=3D"CVE report to update. (Optional)",
+    )
+    parser.add_argument(
+        "--kernel-version",
+        help=3D"Kernel version. Needed if old cve_report is not provided (=
Optional)",
+        type=3DVersion
+    )
+    parser.add_argument(
+        "--new-cve-report",
+        help=3D"Output file",
+        default=3D"cve-summary-enhance.json"
+    )
+    parser.add_argument(
+        "-D",
+        "--debug",
+        help=3D'Enable debug ',
+        action=3D"store_true")
+
+    args =3D parser.parse_args()
+
+    if args.debug:
+        log_level=3Dlogging.DEBUG
+    else:
+        log_level=3Dlogging.INFO
+    logging.basicConfig(format=3D'[%(filename)s:%(lineno)d] %(message)s', =
level=3Dlog_level)
+
+    if not args.kernel_version and not args.old_cve_report:
+        parser.error("either --kernel-version or --old-cve-report are need=
ed")
+        return -1
+
+    # by default we don't check the compiled files, unless provided
+    compiled_files =3D []
+    if args.sources:
+        compiled_files =3D read_compiled_files(args.sources)
+
+    if args.old_cve_report:
+        with open(args.old_cve_report, encoding=3D'ISO-8859-1') as f:
+            cve_report =3D json.load(f)
+    else:
+        #If summary not provided, we create one
+        cve_report =3D {
+            "version": "1",
+            "package": [
+                {
+                    "name": "linux-yocto",
+                    "version": str(args.kernel_version),
+                    "products": [
+                        {
+                            "product": "linux_kernel",
+                            "cvesInRecord": "Yes"
+                        }
+                    ],
+                    "issue": []
+                }
+            ]
+        }
+
+    for pkg in cve_report['package']:
+        is_kernel =3D False
+        for product in pkg['products']:
+            if product['product'] =3D=3D "linux_kernel":
+                is_kernel=3DTrue
+        if not is_kernel:
+            continue
+
+        kernel_cves =3D get_kernel_cves(args.datadir,
+                                      compiled_files,
+                                      Version(pkg["version"]))
+        logging.info("Total kernel cves from kernel CNA: %s", len(kernel_c=
ves))
+        cves =3D {issue["id"]: issue for issue in pkg["issue"]}
+        logging.info("Total kernel before processing cves: %s", len(cves))
+
+        for cve in kernel_cves:
+            cve_update(cves, cve, kernel_cves[cve])
+
+        pkg["issue"] =3D []
+        for cve in sorted(cves):
+            pkg["issue"].extend([cves[cve]])
+        logging.info("Total kernel cves after processing: %s", len(pkg['is=
sue']))
+
+    with open(args.new_cve_report, "w", encoding=3D'ISO-8859-1') as f:
+        json.dump(cve_report, f, indent=3D2)
+
+    return 0
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main())
+

