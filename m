Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EEDC54ED1
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 13:44:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web10.11346.1747835073841297015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 06:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=IkVEJm8H;
 spf=pass (domain: ericsson.com, ip: 40.107.20.86, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QO5AadS2zWy4gNX+PAw/Ah58r0TSacUATzFOCMvtjWVFRs/U8S/sHmACd5AyQq2pWLIXttiF724VS03fr+mg58b3cbMx2uhjCbRdOl3Tq/Z0ABsEglqIh5uOVuuw6vcoams5j8OWAfgKXChroC0JkXCWpN94eDJtaoQzeFDS357//SdDXkDn+RL2J3AJyKu6QTOY4ajV7vvBGm1jnlh+OVeN+RdmTbKU/z0n7wp4fdZv40pfnUjyBFtAULwFzyWf5ZHDbFbRzd+NRwS7XvWGFqvw6qO3Rzt3t+GQNBz84bxqo1qxxUXgc1g5sjUzZSLSDF1TdDEYoePCjuDieWyeDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5X9QZc11nQWAqvLmsG0r1jxwdzW7MbuUQhXgBH1/S4=;
 b=HG0so6FB4+Zx+uJxE7Ct34N3wUq2+WE0IgUW4wEXrmRY0sB0Tm3oze30w5tWHXYO7O7rWwFtE3nMLjeL+FsUT3SSV6DysJAGIaxrWTfrom7Azwmb1XB2fvxzcX1ifDW/8DCMYaWC078xCKL6mBwX801xKechisvUyON2N3P0m3f7GFnXdWwNMhgjkWHY4H6SCfmtNEMe96RdeGOW3THHyexlBU9EDb2YgZOR8vITMtOy/aGtHHXynORwY/xiDrL6H6KR1yHOGO51jIRnRvU0BcjABEZ8EvCjiByFMlN00uMq4MFZH6mbN1reCbzH0WSImxzylpkWWr9lIjGOWvwwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5X9QZc11nQWAqvLmsG0r1jxwdzW7MbuUQhXgBH1/S4=;
 b=IkVEJm8HUefcbViUaIVhhSzbvJ1GdSlaleaCMZZCtIESUmp7NzyXkRJpxy1N+z4QvDP/kqBB46pFNE9eFlaGL3Wle+SJtKE33xZ0c6i/fwwXF4gJrow/q+igkJL1Qh/+t1yFN9+3jhuypWBuCdzOrQdbMqFA+ssX7ve6ouJlrKlv3/KMyk95h7VHwEH1Ry6kwOOLdSbWGxYV+1Bg7YX9PLBDDovqzHi1NNxJlSTTQgsSR8qobQzk4dqhlSwxPVmXTizhc1/r0NqaWVti7T2uFh/fXs1/4nqDzvOmyZi7NnEEiF7mQv3vgg+2R0U6JBvUD0M5sR9A/vcrluGfEok5zg==
Received: from DU7PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::13) by VI1PR0701MB6782.eurprd07.prod.outlook.com
 (2603:10a6:800:17e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 13:44:29 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::62) by DU7PR01CA0015.outlook.office365.com
 (2603:10a6:10:50f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 13:44:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 13:44:29 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 21 May 2025 15:44:28 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id A1D454020B71;
	Wed, 21 May 2025 15:44:28 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 8B48370B5B03; Wed, 21 May 2025 15:44:28 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Peter Marko
	<peter.marko@siemens.com>, Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH v5 3/3] improve_kernel_cve_report: add script for postprocesing of kernel CVE data
Date: Wed, 21 May 2025 15:44:00 +0200
Message-ID: <20250521134400.1733473-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521134400.1733473-1-daniel.turull@ericsson.com>
References: <20250521134400.1733473-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFD:EE_|VI1PR0701MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e73b08-d883-4c8b-c57a-08dd986d9c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W1ypftYqxG5zs4/myaGx3o00lx9MAF34l8HQJO2bJUIV861+ul5b5+Ey7ZWN?=
 =?us-ascii?Q?5z6sXWrujqJKkPd1ij+oUacs4lAbb17KDN3P2NW7StcKYU9f/KBxF/egzqtn?=
 =?us-ascii?Q?7ob/5f8CDOOqhdWVbBPnP4NPkmVgAUzi0v2MFo6DOtD/3IBKAee6gvsFH8V4?=
 =?us-ascii?Q?OjOA0zDcegLEGozkfAkOfdBWG1OxJSrg6A7hfOyB3loahucB/RO6DJf3Sti5?=
 =?us-ascii?Q?eGfrga63pgnaUllq/Q0BrNJ8a8fVbtP2NwCzfD3qmT4bjIEiXhknqBlMz50w?=
 =?us-ascii?Q?CjpbzYRmdk+u0fqwSptxMz+8Lk56lS3sXDWmtyPbTq/SDW413cHI1ChAOQzq?=
 =?us-ascii?Q?vLTC/jfCPRV0oDQLjFEJR5kKdTXjNSb0jkeXaAk6DWucDNx69N4xvFXb1d9w?=
 =?us-ascii?Q?Us0OxClRbxNg2VyKV4uqRVSf/dXyJLT311Gv9estVmNj12qOuJPU22o9uuz4?=
 =?us-ascii?Q?S8o7jjUy5udroaPb1/QEPFs2GqbxO85uherWvRihdxL/DnfuVKOv7prMIUWM?=
 =?us-ascii?Q?espLWlWVOyxoCt02nzPlAuS0kH29a3F56sRMw8HlkKueWdw3Pu6bKYxAjRpl?=
 =?us-ascii?Q?ZP/AZ52jwvIjaVZoMqmKuF2CszguVPVx32c0NPAntPGqQD8Nrsf+rqgyUzTC?=
 =?us-ascii?Q?Kk/ufVZlnA4a/kvMkaWDWwOOttXDQfO6vIXok6iv0PZ5eFCEZ85tOOtTVZB3?=
 =?us-ascii?Q?zqazQ7KjkMElKblSy60Uh4rBqxVKIZnf4fsNk1LpFgmY2KILeLixm+bovT+I?=
 =?us-ascii?Q?rTEIkZJZm3FW6h/16Y60xVsRFXBk6hzMOeHy0pMUzL5co+gYe0t7VmA98rU/?=
 =?us-ascii?Q?S2M0oKRQ2sUx9g+fV/ryXFlwW6mQIDRDKy6In24ejm3CGVbM+WhPHOyiL3ta?=
 =?us-ascii?Q?PG8v9d9zA3eXfgBBO1KhCqzJHKGcwFX48T69d79VKgC0TGpiL4ydbqZgMXZo?=
 =?us-ascii?Q?Y9EerNykM6n+3HTziRT40BC1FoabfvCoYV+/WU1ntJeJDJwHrZYm7pO2Mmua?=
 =?us-ascii?Q?fR6X5Tl5fSuTw/xziZqlg3zM6nLeG+SiBtGgiD3e2Hd8mnZ3cYtVsBbVj3Xn?=
 =?us-ascii?Q?pH6uCnGNNzINrSNw7pf7/f666+F3k+DxADmi1uz/eKRbvBN019KImBYDyeYT?=
 =?us-ascii?Q?sI3BXqq3etMz8qO0jLm+hXF54jHsOZd5KGRAOBLD/qMqdUJRaYAHWK5GKDGB?=
 =?us-ascii?Q?Fr/W3NzvalDZJEvQ1CQqJ4iFCKINSwGSACiGdtHY98QCp7FEVzzPoVw+WCHx?=
 =?us-ascii?Q?QwZNmdEtnfh6JiZIGAjQ97O3AXgFnugV75zQL1x+RUiLwSZpEEletnVhmp7q?=
 =?us-ascii?Q?KNfBl6ZK5t78668EvvYah2Mt2YMe6MpXkQAsNefOcUZWxCVnP79WAkV7RTdP?=
 =?us-ascii?Q?Pe5YpCSRUwGvHG9Zv2QW40V0JS6HJtytOAK7ceYP+6gL7WhPeAsWLoA+2rwm?=
 =?us-ascii?Q?3LyhAZJi8KgOMCoW1OSbYOGwvOtsyve8s5UZYm9oBRWxahZx8ZjcXQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 13:44:29.5131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e73b08-d883-4c8b-c57a-08dd986d9c38
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6782
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217027

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
 scripts/contrib/improve_kernel_cve_report.py | 467 +++++++++++++++++++
 1 file changed, 467 insertions(+)
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
new file mode 100755
index 0000000000..d729f8ed64
--- /dev/null
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -0,0 +1,467 @@
+#! /usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# The script uses another source of CVE information from linux-vulns
+# to enrich the cve-summary from cve-check or vex.
+# It can also use the list of compiled files from the kernel spdx to ignor=
e CVEs
+# that are not affected since the files are not compiled.
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
 --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.js=
on --kernel-version 6.12.27 --datadir ./vulns
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py=
 --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.js=
on --datadir ./vulns --old-cve-report build/tmp/log/cve/cve-summary.json
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
+def read_spdx(spdx_file):
+    '''Open SPDX file and extract compiled files'''
+    with open(spdx_file, 'r', encoding=3D'ISO-8859-1') as f:
+        spdx =3D json.load(f)
+        if "spdxVersion" in spdx:
+            if spdx["spdxVersion"] =3D=3D "SPDX-2.2":
+                return read_spdx2(spdx)
+        if "@graph" in spdx:
+            return read_spdx3(spdx)
+    return []
+
+def read_spdx2(spdx):
+    '''
+    Read spdx2 compiled files from spdx
+    '''
+    cfiles =3D []
+    if 'files' not in spdx:
+        return cfiles
+    for item in spdx['files']:
+        for ftype in item['fileTypes']:
+            if ftype =3D=3D "SOURCE":
+                filename =3D item["fileName"][item["fileName"].find("/")+1=
:]
+                cfiles.append(filename)
+    return cfiles
+
+def read_spdx3(spdx):
+    '''
+    Read spdx3 compiled files from spdx
+    '''
+    cfiles =3D []
+    for item in spdx["@graph"]:
+        if "software_primaryPurpose" not in item:
+            continue
+        if item["software_primaryPurpose"] =3D=3D "source":
+            filename =3D item['name'][item['name'].find("/")+1:]
+            cfiles.append(filename)
+    return cfiles
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
+        "--spdx",
+        help=3D"SPDX2/3 for the kernel. Needs to include compiled sources"=
,
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
+    if args.spdx:
+        compiled_files =3D read_spdx(args.spdx)
+        logging.info("Total compiled files %d", len(compiled_files))
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

