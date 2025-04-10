Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1340C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 09:49:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web10.30255.1744278568423953399
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 02:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=R0S97GwQ;
 spf=pass (domain: ericsson.com, ip: 40.107.20.63, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvQN0FtE/nuzHIg2bdO3OVG9O1tPGkIOAUvoTONMO7FmyaPiNzcMj5gZ9ZGHStaBcQE/g75n6l2EG6MjhMDfMaIV1SaPG1+pmro/bci1Qhxmmf8YGhLL2A96rP1DUQ4NpHvJ2CmS/TM+7Lu8zOt2r3uzCLJIAsPd5ySphVNvUGiaG+IZ2n9pHnSALxp0/LNFmsQQBRDMTXPTsWc6kmIbwyfqoho9+D8PJwXJt+btnLNZ8e+swuzA0pXktve3FuXXhghb9tN4ZyDkAyyN+2YBoYnK9E5/fyzFx7ce5XUvyzBz71JA6pfK1IwAG/CHXAU3HJP0zTs8rBnMwL0uYvxDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpBLZd+EBXxzzIlW5Ztyalf5yf+Vm1asmoZMtjKXwak=;
 b=RBb3ZViw6EoA6JXMKVI0nEQ4gn3pAe2RGtqlQYD3EWu6nIZMOQ2bD3/+HBMiRvXdgX201AT5phGnPOVxH7+XrBwYIvjXwg9sJpvqCZAbKj1jObYqVJ0N5YGTmSko+m3LhSNqssvZq7nJ/5qbBYc4Edrn67BMhzSjeRlypEGdGeQcZutVEyl7aFdTTji9Kicqb7Ban1P+qG7O+CisBGaWyrc4zwgK0MZoGXi6H2VSYL6Na+X0qsVoZVOPDMIfr8fR1ms4Uadri3yR1lCG+wcnjEHAUHUAkLbJzI4KsjqQcSLqH8mWQY/PYrif56lS4sp0xWRGy8ESyYLat6X7jgzq0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpBLZd+EBXxzzIlW5Ztyalf5yf+Vm1asmoZMtjKXwak=;
 b=R0S97GwQYNI7IN2dQog7Nrq4pNa5aWALXYjS0Pb7nyW/rD/NTvMuyBmcKYFKMnj4QmsUviLy0OCgelSjj9XTYOP1dAecMmD1CNr7QAtaavbIQBX6864o3Sai4Vyj78SSuxI4k7xpf1q+6cHnUtRK1gMWI5d8lCe5iAHhh7By1f/C4Kl4Lz1L+GgEyVR98RJXzahBqbPAN2UZCbEykgrMi3aGuwFIYc8Zzfw8X5KJiduzJpthyYrqRtYKsSXp7p7WKcpjO12JAYe6kBeri/1MfakrcBmq+nQKBhBsQ5Ws2dG5gzIenxXqFTxwasRm+JWinElAUfq1L0XHoVBBEgsjBQ==
Received: from PR3P191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::10)
 by AM8PR07MB8075.eurprd07.prod.outlook.com (2603:10a6:20b:3da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 09:49:25 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:102:55:cafe::19) by PR3P191CA0035.outlook.office365.com
 (2603:10a6:102:55::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Thu,
 10 Apr 2025 09:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 09:49:25 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 11:49:25 +0200
Received: from seroius08534.sero.gic.ericsson.se (seroius08534.sero.gic.ericsson.se [10.63.237.244])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id D10594020A84;
	Thu, 10 Apr 2025 11:49:24 +0200 (CEST)
Received: by seroius08534.sero.gic.ericsson.se (Postfix, from userid 160155)
	id B7494700D515; Thu, 10 Apr 2025 11:49:24 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 1/2] linux/generate-cve-exclusions: use data from CVEProject
Date: Thu, 10 Apr 2025 11:48:35 +0200
Message-ID: <20250410094837.897013-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70F:EE_|AM8PR07MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f1441a-8f4f-481b-6c76-08dd7814fa93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p7GS87e0MYkclg1lgPwtT+UWvbZaY+jExfPdPqtnIew3gF80n6sBysGB6uPm?=
 =?us-ascii?Q?qmv76Y/3ZllP/8S92iYWsGQ1rPLzWF+CNqS/rBzg20fGVvUFda+xmS5cRKxo?=
 =?us-ascii?Q?cf8QqJdUekGL6vyAC9ao/mZXvn9+QoLAX/MjZmhG3bYmUwLunqGP2eOMveIx?=
 =?us-ascii?Q?+XvI6O4atzppCZvq3j2jDlUyvuQQBnwP7xD/BhoMMNnKSw1Gd+pzbbP66xsJ?=
 =?us-ascii?Q?34o4Ex6c5Z2dpGiKdTfHvCNpXMMgL9eLjaD9HHdMNngZZ1kaKHQhnWYMfojz?=
 =?us-ascii?Q?1domxQDy9WjNQjiZF0vKbgg0Ra9xcdiHKSpTp85pbJD3epq2YFprpZbyq6mo?=
 =?us-ascii?Q?0GDhZdvN9QKWHeFwPjGqI1MXiZW5uwdUHYRhkJGregVYm32UYhxwzA6JLdtW?=
 =?us-ascii?Q?RzEza/miN1i1910GIUwhlQmhHH2yQIpv5QUvl3GNXk1n+lho+FY9GX0/zHmn?=
 =?us-ascii?Q?Gx3NbidFULtprZLpCwTbxzkCA2fu8h/2sI5JGSn3PJ/L5xngfWlEOqOLV3nY?=
 =?us-ascii?Q?JhN2+0fFGt7h86E1SPeNN/4Yl3eEjMEu4kDD46GqQkhjnmAwp4WU1Fskrk80?=
 =?us-ascii?Q?F3A6Vl+ugkCRFGwCfumscdUG50mL/qTB54d2q14qx4zrEdwZg1z2cEKbTZxe?=
 =?us-ascii?Q?AlVdK2ukKzRdr4Z83JGflaFWeNH4LrkP197FR/3g5gB9uv7SYt3sX2TUA/H7?=
 =?us-ascii?Q?CZHm3e4o78ms1sNwxh649R0WHuiSEQhIoyS2Xrx3VluF+gvv8fNcsLV7NG77?=
 =?us-ascii?Q?tJGA5kr2DlrK0He+sarwpYpWVYZyRWt61yVhFWsGsFmm0ZV3XEnBEiyPOeWe?=
 =?us-ascii?Q?mIUsxCX5ZjrJV/KBadr/QX03gRnoK2Q57/BJzcFXCNSLGnxg8wUTlYBH6zEU?=
 =?us-ascii?Q?lyivK8G7fYgAlU+F08Nm2RrZeQzjY8a+d59mU491iFtaHRRsS/L6unJEMN+A?=
 =?us-ascii?Q?+GpDlOl8jG+W/U+OmEvW3694A03HljQj5ynhBFkiFdNlkK6h+KvyhlybVMi4?=
 =?us-ascii?Q?glBNOtj4rOMKIlfxRUycIEyLXnGkgnZ6gzTOD3LWy6OLPSVlHrQc9twhcp7G?=
 =?us-ascii?Q?MmwQU4qSiTGMnZP+Kz+nQO5xlthtvkTsPQWzoHPUomIBxYQVXL2/tCb9WGdz?=
 =?us-ascii?Q?2xCyGMC/f+NqlBN5ZjBUujXAbktGAvtdBYEeWTuZ/TPqVAoZztWeWRUQNgMI?=
 =?us-ascii?Q?Hic+EWfb+FAlQPfJQRq2DehYxlEAy0YEJWiN7gWrclcsLSSvFKnjxlwietLB?=
 =?us-ascii?Q?ysdZ6A5zwAESHRClfa2T5veryrznSyp7V6gcutXx8a1mw1ZG1ekT4rhCJogv?=
 =?us-ascii?Q?Dz00OwloM1AY4NuBxfCHREaXbqc5Ai2Xau/3XF/moku2ck1x0H+oS3EjDAkv?=
 =?us-ascii?Q?XX5BjT1nEVB/aLQf9Sq/n/rjRdpghdQ5J1PJIgeVKrb7RlRRXC019lrwNJUN?=
 =?us-ascii?Q?Qr8g+q8+DxWWxlNKI1+ZiTtPkMX2ywaHwjSxQHUZBEawX//azB9cdgIQbNcu?=
 =?us-ascii?Q?FbvjKt+jYKSdeiYSi80jzB+C5itGjhUPjAf2Xk2dMEdCFda+XaVoEQ3BYg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 09:49:25.4654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f1441a-8f4f-481b-6c76-08dd7814fa93
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB8075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 09:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214634

From: Daniel Turull <daniel.turull@ericsson.com>

The old script was relying on linuxkernelcves.com that was archived in
May 2024 when kernel.org became a CNA.

The new script reads CVE json files from the datadir that can be either
from the official kernel.org CNA [1] or CVEProject [2]

[1] https://git.kernel.org/pub/scm/linux/security/vulns.git
[2] https://github.com/CVEProject/cvelistV5

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../linux/generate-cve-exclusions.py          | 116 +++++++++++++-----
 1 file changed, 85 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/re=
cipes-kernel/linux/generate-cve-exclusions.py
index aa9195aab4..82fb4264e3 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -1,7 +1,7 @@
 #! /usr/bin/env python3
=20
 # Generate granular CVE status metadata for a specific version of the kern=
el
-# using data from linuxkernelcves.com.
+# using json data from cvelistV5 or vulns repository
 #
 # SPDX-License-Identifier: GPL-2.0-only
=20
@@ -9,7 +9,8 @@ import argparse
 import datetime
 import json
 import pathlib
-import re
+import os
+import glob
=20
 from packaging.version import Version
=20
@@ -25,22 +26,75 @@ def parse_version(s):
         return Version(s)
     return None
=20
+def get_fixed_versions(cve_info, base_version):
+    '''
+    Get fixed versionss
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
+                    #Skiping non-affected
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
+                    fixed =3D less_than
+                if base_version < v and v < next_version:
+                    first_affected =3D v
+                    fixed =3D less_than
+                    fixed_backport =3D less_than
+
+    return first_affected, fixed, fixed_backport
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
=20
 def main(argp=3DNone):
     parser =3D argparse.ArgumentParser()
-    parser.add_argument("datadir", type=3Dpathlib.Path, help=3D"Path to a =
clone of https://github.com/nluedtke/linux_kernel_cves")
+    parser.add_argument("datadir", type=3Dpathlib.Path, help=3D"Path to a =
clone of https://github.com/CVEProject/cvelistV5 or https://git.kernel.org/=
pub/scm/linux/security/vulns.git")
     parser.add_argument("version", type=3DVersion, help=3D"Kernel version =
number to generate data for, such as 6.1.38")
=20
     args =3D parser.parse_args(argp)
     datadir =3D args.datadir
     version =3D args.version
-    base_version =3D f"{version.major}.{version.minor}"
-
-    with open(datadir / "data" / "kernel_cves.json", "r") as f:
-        cve_data =3D json.load(f)
-
-    with open(datadir / "data" / "stream_fixes.json", "r") as f:
-        stream_data =3D json.load(f)
+    base_version =3D Version(f"{version.major}.{version.minor}")
=20
     print(f"""
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
@@ -55,17 +109,23 @@ python check_kernel_cve_status_version() {{
 do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
 """)
=20
-    for cve, data in cve_data.items():
-        if "affected_versions" not in data:
-            print(f"# Skipping {cve}, no affected_versions")
-            print()
-            continue
+    # Loop though all CVES and check if they are kernel related, newer tha=
n 2015
+    pattern =3D os.path.join(datadir, '**', "CVE-20*.json")
=20
-        affected =3D data["affected_versions"]
-        first_affected, fixed =3D re.search(r"(.+) to (.+)", affected).gro=
ups()
-        first_affected =3D parse_version(first_affected)
-        fixed =3D parse_version(fixed)
+    files =3D glob.glob(pattern, recursive=3DTrue)
+    for cve_file in sorted(files):
+        # Get CVE Id
+        cve =3D cve_file[cve_file.rfind("/")+1:cve_file.rfind(".json")]
+        # We process from 2015 data, old request are not properly formated
+        year =3D cve.split("-")[1]
+        if int(year) < 2015:
+            continue
+        with open(cve_file, 'r', encoding=3D'utf-8') as json_file:
+            cve_info =3D json.load(json_file)
=20
+        if not is_linux_cve(cve_info):
+            continue
+        first_affected, fixed, backport_ver =3D get_fixed_versions(cve_inf=
o, base_version)
         if not fixed:
             print(f"# {cve} has no known resolution")
         elif first_affected and version < first_affected:
@@ -75,19 +135,13 @@ do_cve_check[prefuncs] +=3D "check_kernel_cve_status_v=
ersion"
                 f'CVE_STATUS[{cve}] =3D "fixed-version: Fixed from version=
 {fixed}"'
             )
         else:
-            if cve in stream_data:
-                backport_data =3D stream_data[cve]
-                if base_version in backport_data:
-                    backport_ver =3D Version(backport_data[base_version]["=
fixed_version"])
-                    if backport_ver <=3D version:
-                        print(
-                            f'CVE_STATUS[{cve}] =3D "cpe-stable-backport: =
Backported in {backport_ver}"'
-                        )
-                    else:
-                        # TODO print a note that the kernel needs bumping
-                        print(f"# {cve} needs backporting (fixed from {bac=
kport_ver})")
+            if backport_ver:
+                if backport_ver <=3D version:
+                    print(
+                        f'CVE_STATUS[{cve}] =3D "cpe-stable-backport: Back=
ported in {backport_ver}"'
+                    )
                 else:
-                    print(f"# {cve} needs backporting (fixed from {fixed})=
")
+                    print(f"# {cve} needs backporting (fixed from {backpor=
t_ver})")
             else:
                 print(f"# {cve} needs backporting (fixed from {fixed})")
=20

