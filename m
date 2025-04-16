Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C19C369C2
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 14:29:25 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.62])
 by mx.groups.io with SMTP id smtpd.web11.20610.1744813763314353792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 07:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Qh5y+W7a;
 spf=pass (domain: ericsson.com, ip: 40.107.249.62, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5DHADO24rbA98S3pOMmpCQyvzVY1OW0DBBQ2smtgnAvp9tHfS9hdJis2B+ztgvGh6bbLBrNdTb7WOhr31fSnxMILCJmAWe+fro4qtcpz3Ve6XI3DBXWs0Jok17brS52RUKPnb9JMQHhHSQwwm/L/hLhdFzE6qcAR3+29tn9ddObLbvY68k5uKyfVxjIbjc1F906zidCU2rLD6eAEAx70TASfKAB7ODU2FXjbCKBZsSgGX1MuyglJOi3bsNhzisZv8WRaiYMvEkXWVvuYC6ZrsbBOvYDQxxV8pZHETyrNjARr/7B/MBGyrW5Rgp+ymF81xxhE/U4fg+AcNJOWjjakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYSU/kbDNwhbodE59l33j7vQHRmlA1qsJNRBrs3zvU0=;
 b=PW0PFJf6hwpABM58zupH1YPePkayOQZHv/t35ZArxLWEZOoyTUZlZ3pa6aayjqZ3F4KW0e6BqbTSh2YCw5wzer+vR9m/aMaU/xtHGXicMcDBUIYnGF6IbZXp1BMKfWv+N3WRwWAyc6Y+YLzjycGNzbnf9dds6W9BQdZ+kCL6vw8xQuRVEnniqV4bhNueDs5Wu/edG+K6VXgiWdwjrefkN2H2EZZBi/ywqTB7vrb8d2YcyVtFU4V544I0qjx2Sc9sQflSUQ7yLRkuYyo2TFHH4SdV4KT+1wHV9fECL1JOCFl4NYHmUe534hrny3W/7qmTslWr25C0cU3Q7FoUwRE4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYSU/kbDNwhbodE59l33j7vQHRmlA1qsJNRBrs3zvU0=;
 b=Qh5y+W7aXOK22KkDHEBDkz1VNxtS3eSMBKiuLpckGr+xFh9YYl4Xbes0G+AvVlXvta/Uf0vpmAk+eFkSruSf6O5ee2OyAaj5G2LzHYvw51WgX73dR1+rWv3uL8/24Ycx7850eJd3IRaEqO2q1VGFs846qXoIi3pIdRIpfZlQyt8/4Mbw39MxGCpkPwP8D5yiNgZehzDIy9irQQuSFMUaklvBMyy1x7hTyDuM95vpAwkV7js0oJQgfOFZXDeGKNrQ9qLtv8lyJLOWiw6yawPHiy513bnxKNaLPPxu6ED8CZQzEy8BzMDIjcPqrdj2UZ/2k065XToCnW6R/eVnHzZl+Q==
Received: from AM0PR10CA0044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::24)
 by AM7PR07MB6642.eurprd07.prod.outlook.com (2603:10a6:20b:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 14:29:18 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::51) by AM0PR10CA0044.outlook.office365.com
 (2603:10a6:20b:150::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Wed,
 16 Apr 2025 14:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 14:29:16 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 16:29:16 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id D93BD4020A84;
	Wed, 16 Apr 2025 16:29:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C6ACB7000229; Wed, 16 Apr 2025 16:29:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rybczynska@gmail.com>, <steve@sakoman.com>, <Peter.Marko@siemens.com>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 2/2] cve-check-kernel: verify kernel CVEs using programFile from kernel.org CNA
Date: Wed, 16 Apr 2025 16:28:59 +0200
Message-ID: <20250416142859.909037-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416142859.909037-1-daniel.turull@ericsson.com>
References: <20250416142859.909037-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019A:EE_|AM7PR07MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7949cd-450a-497c-4788-08dd7cf31176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x/ILaE+KdYpOyww26pt+vIF+SpUWRy019sfQT7hi5h7wpOSDJF5bz52spd1U?=
 =?us-ascii?Q?UgkVagV2xB6V9zVjDy5kKiQUWPZv6ODIALanc36oq8Qqh7v5pZ+ehhEtSyO4?=
 =?us-ascii?Q?iI63bhguBdhpHCcWS5/uNrklRcU8aTCYbYYdGmIBcvT05VB5GGAcZLGd7yeu?=
 =?us-ascii?Q?9Hbi3pZkyFc4Ckk2B3hY4RNvF7vjsqAUqQixdMPBA7QcUctnlYMNrbDQeP1C?=
 =?us-ascii?Q?fJ/vTO0yfSzyMnTj6ZqH1zl9P/qaS8UDAazOxEbjhnsCQlraUzWPILtIN6HG?=
 =?us-ascii?Q?iYz2Cnbatcgz39y4Qje6LfiVxSs7+6NxafdTwqizeOsEo3EOdaKhR2vdCruh?=
 =?us-ascii?Q?IC1AToBMq0YPz9XhlHa3hBw7ikVmxFcMgS9CTu/m0jCl2FYvHe+dbylxgxCY?=
 =?us-ascii?Q?g8732+QgyzDwyS2qtMFGgTcTL9y0HPOzJqTjgcVL1G794UO4rjS7UVLjnpUa?=
 =?us-ascii?Q?20Z+a7Mp3jkC1MJ8nu4ac/1OBHE8kPvKSXfu9P3dbDruH750QfuY7QnuC7zm?=
 =?us-ascii?Q?keKRCJTY3tZjnjNOA7zakqCLRzvvUDMm6s2EWl9O3ZYh639qbE5VtepkEHvz?=
 =?us-ascii?Q?Hg1oOTYf9bX34W0Eqyu0j99eromHI+APP2UcnbS3pVjuc+w1sZMwqGEpBN60?=
 =?us-ascii?Q?FPrZFJQpX/DqetZAEun2y66ipEyPfvlKEgNH7/QWSisv0hQ+eOrr2uvf+G9Q?=
 =?us-ascii?Q?E61Cvwwev4vBzJ/npBct/CuUCja17q7bPdoi6YEb1NANezDZmz2dr0GFK/Vc?=
 =?us-ascii?Q?uPS2ftsApQuWRR92TwAW08xPXXgtb0S3ovG/MARzzIpwZo76Pwj/0xtd48fI?=
 =?us-ascii?Q?JM9ubA/eICfDU/0Twk0r/UXNs3aLE23pc6omiybOqNOrZzYE1E01Y2P2ElmV?=
 =?us-ascii?Q?qcZ5TTumdgUvGl2jBq6T6b4CvaVAW8phArxWnXLgYKn4svFUj/VGm3ZBS7G2?=
 =?us-ascii?Q?wRSJIjAnrQfmXt58A8+OClCI004pN+1AiJqaGHxodvLqalJOgGMtDtPh5MQP?=
 =?us-ascii?Q?DVeKu0kkqoG6VqPRvXTSPhxxz+ac3WeD8W/sXt3oiOiQgV/2Gb/5/pfo2wD7?=
 =?us-ascii?Q?K2m+L8yfGaco+AH2pxYd3UvRD/HJzKbeqbsTEKMzzF0SYZjbmEjCm3cxRyN4?=
 =?us-ascii?Q?OVjMaKqWFXLxk80bY99OwyQztooeP6Jf3wFdPAnYeJMyfOBUlru16gNmP02H?=
 =?us-ascii?Q?b4rP0yJE93rnwuIatnvRwpGVRKLuqB9b5soaZlw/C3vp2G1lTuoYwNPvOGZz?=
 =?us-ascii?Q?Cev4uDkWl6PO/xoB4cKmCy9EHOULAIXgcsmjNK2SmN8F+dqlDN0mXXUCcdTd?=
 =?us-ascii?Q?Nj4aJj8KhSA6jtzAI+JEqj+IEJDU06IERg9e5WCtMgHrNoL+6rFyF0eUTSHx?=
 =?us-ascii?Q?hHvJ8MChaoBrYtzi1pNwq9gbQCR8wmceRQspCO5eWlGOr9Nh7rxyqofMSFD/?=
 =?us-ascii?Q?2urbCkZoVOlqsss73oPonHx2Yj6vPIb/arIenG1fF1FPsCW3asoky/1/nDEj?=
 =?us-ascii?Q?siwm79lT6gMPeSWOK5hpYWo0xeVGgfJLJT6ovQkkHvEJA0Ag7vUuQknr5g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:29:16.7714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7949cd-450a-497c-4788-08dd7cf31176
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6642
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 14:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214993

From: Daniel Turull <daniel.turull@ericsson.com>

This class is used to check the CVEs against a specific kernel configuratio=
n.
Depends on data from the kernel.org CNA
https://git.kernel.org/pub/scm/linux/security/vulns.git
The CVE data provided by kernel.org includes the files that are
affected by a given CVE and are provided as json files

It requires the kernel to be compiled to be able to extract which files are=
 used.
It is created as optional check on top cve-check.

To enable add in your local.conf
INHERIT +=3D cve-check
INHERIT +=3D cve-check-kernel

To test it
bitbake virtual/kernel -c cve_check_kernel

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/cve-check-kernel.bbclass | 132 ++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 meta/classes/cve-check-kernel.bbclass

diff --git a/meta/classes/cve-check-kernel.bbclass b/meta/classes/cve-check=
-kernel.bbclass
new file mode 100644
index 0000000000..c01f0efd1d
--- /dev/null
+++ b/meta/classes/cve-check-kernel.bbclass
@@ -0,0 +1,132 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+# This class is used to check the CVEs against a specific kernel configura=
tion.
+# Depends on data from the kernel.org CNA
+# https://git.kernel.org/pub/scm/linux/security/vulns.git
+# The CVE data provided by kernel.org includes the files that are
+# affected by a given CVE and are provided as json files
+#
+# It requires the kernel to be compiled to be able to extract which files =
are
+# used. It is created as optional check on top cve-check.
+#
+# To enable add in your local.conf
+# INHERIT +=3D cve-check
+# INHERIT +=3D cve-check-kernel
+#
+# Then execute
+# bitbake virtual/kernel -c cve_check_kernel
+#
+
+KERNEL_FILES_DIR ?=3D "${LOG_DIR}/cve/kernel_files"
+KERNEL_SRC_FILES ?=3D "${KERNEL_FILES_DIR}/compile_commands.json"
+KERNEL_CNA_REPO ?=3D "${DL_DIR}/CVE_CHECK/vulns"
+
+python () {
+    if not bb.data.inherits_class("cve-check", d):
+        raise bb.parse.SkipRecipe("Skip cve-check-kernel when cve-check cl=
ass is not loaded.")
+
+    if d.getVar('PN', True) =3D=3D d.getVar("PREFERRED_PROVIDER_virtual/ke=
rnel", True):
+        bb.build.addtask('do_save_compiled_files', None, 'do_compile_kerne=
lmodules', d)
+        bb.build.addtask('do_cve_check_kernel', 'do_build', None, d)
+        d.appendVarFlag('do_cve_check_kernel', 'depends', 'virtual/kernel:=
do_cve_check ')
+        d.appendVarFlag('do_cve_check_kernel', 'depends', 'virtual/kernel:=
do_compile_kernelmodules ')
+        d.appendVarFlag('do_cve_check_kernel', 'depends', 'linux-vulns:do_=
unpack ')
+}
+
+do_save_compiled_files() {
+    bbplain "Fetching compiled files"
+    mkdir -p ${KERNEL_FILES_DIR}
+    ${S}/scripts/clang-tools/gen_compile_commands.py -o ${KERNEL_SRC_FILES=
}
+}
+
+def get_files_in_cve(d, cve):
+    import os
+    import glob
+    import json
+    datadir =3D d.getVar('KERNEL_CNA_REPO', True)
+    pattern =3D os.path.join(datadir, '**', f"{cve}.json")
+    cve_files =3D glob.glob(pattern, recursive=3DTrue)
+    files_affected =3D []
+    if len(cve_files) =3D=3D 0:
+        return None
+    # Assuming one match
+    with open(cve_files[0]) as f:
+        k_cve =3D json.load(f)
+        for item in k_cve['containers']['cna']['affected']:
+            if item["defaultStatus"] =3D=3D "affected":
+                if "programFiles" in item:
+                    files =3D item['programFiles']
+                    files_affected.extend(files)
+    if len(files_affected) =3D=3D 0:
+        return None
+    return files_affected
+
+python do_cve_check_kernel() {
+    import json
+    bb.plain("Updating CVEs using compiled files")
+    kfiles =3D []
+    cves =3D {}
+    affected=3D []
+
+    with open(d.getVar('KERNEL_SRC_FILES', True), 'r') as file:
+        for item in json.load(file):
+            kfiles.append(item['file'].replace(f"{d.getVar('S')}/",""))
+    bb.debug(1, f"Total used kernel source files: {len(kfiles)}")
+
+    # We want to use the file in log directory
+    deploy_file =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+    cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
+    direct_file =3D d.getVar("CVE_CHECK_LOG_JSON")
+    fragment_file =3D os.path.basename(deploy_file)
+    fragment_path =3D os.path.join(cvelogpath, fragment_file)
+
+    with open(fragment_path, 'r') as file:
+        cves =3D json.load(file)
+
+    total =3D 0
+    for cve in cves['package'][0]['issue']:
+        status =3D cve['status']
+        id =3D cve['id']
+
+        if status =3D=3D 'Unpatched':
+             is_affected =3D False
+             total +=3D 1
+             affected_files =3D get_files_in_cve(d, id)
+             if affected_files is None:
+                  bb.debug(1, f"No file information for {id}")
+                  affected.append(id)
+                  is_affected =3D True
+                  continue
+             for f in affected_files:
+                 if f in kfiles:
+                     bb.debug(1, f"File match in {id}: {f}")
+                     affected.append(id)
+                     is_affected =3D True
+                     break
+             if not is_affected:
+                  bb.debug(1, f"Changing status. Files in {id} not compile=
d. {affected_files}")
+                  cve["status"] =3D "Ignored"
+                  cve["detail"] =3D "not-applicable-config"
+                  cve["description"] =3D f"Source code not compiled by con=
fig. {affected_files}"
+
+    # Update cve files generated from cve-check
+    write_string =3D json.dumps(cves, indent=3D2)
+    with open(direct_file, 'w') as f:
+        bb.note("Writing file %s with CVE information" % direct_file)
+        f.write(write_string)
+    if d.getVar("CVE_CHECK_COPY_FILES") =3D=3D "1":
+        with open(deploy_file, "w") as f:
+            f.write(write_string)
+    if d.getVar("CVE_CHECK_CREATE_MANIFEST") =3D=3D "1":
+        with open(fragment_path, "w") as f:
+            f.write(write_string)
+
+    # Summary
+    bb.warn(f"Before filter we have {total} CVEs")
+    bb.warn(f"After programFile filter we have {len(affected)}")
+    bb.warn(f"Affected CVEs after filtering: {affected}")
+}
+

