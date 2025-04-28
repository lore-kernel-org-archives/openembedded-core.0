Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC100C3ABA6
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:42:39 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.67])
 by mx.groups.io with SMTP id smtpd.web10.48683.1745847751876037816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Vhj8yV5R;
 spf=pass (domain: ericsson.com, ip: 52.101.69.67, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=co7fmnUU+V5lQQXUEosDQ+FAXu9tUlz7547ploARExpwm/38tNysYBqIxF6EQZaeO3pvnDBrwToKoKtY0SeW2F2g94IsKUB2B9vLq+cUPt9vLjZve7lr3lbFxdb8kXjcZiRfeXCYtcocXpMQfEY5NLOkFg2B31qTdZGUp9i9bIuXMGGJZsHdfikMB6gmxMD9NmEJCeitiQ7E0y42+QcmZWp5FEjBR+MDVUR2+zivqzKpoImawc2QbaW1x4lNscB3aZPFwm1wqMt7QSRuX0Apkrb0UrNP3kZyIO2I6w89F+1vQtO9+b+O7J5KelzZAk8K2piBGxPJGFeuI3A9cOUtvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YD2A0U6hlobZuOAUwDa4mT7U0BLyJbIXjGkbbJZyak=;
 b=aEd6ppBUKaAQUJ47HzuTUAi8s0o3YPlhnRUc8Tnyuv8DC7izE/ghACit44iTVNhUHd7ymoaCMCzhOJR0pSPPHr0L4ckTPwWWUkuNLjWaGSxuZtX6ti9t9BChyrw0rtkAnhMyKRhc7oNUDqhl4z+Uo1VYSScSdncedMkWMvDUK/DS+SzJgLfhpxZVQAiqieKOWV8CajileLwXgQAWRX5UKxFIxXdduxNoUmf9xH/AIUR1JpeFbnnBOslFxoSOllAA9zioDcbwKtUd0uwXm09l4LgUGlwS0NwYSok9uSXnTmRiSuduknFGsgvqxp8+YAhisM8nug6SHoF+OhdBoYkXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YD2A0U6hlobZuOAUwDa4mT7U0BLyJbIXjGkbbJZyak=;
 b=Vhj8yV5RBU1GWEueL7ILcgH8lLYQqG0LEBPrlyuMaGHgJd4bn8FmZdtZ4prbjp40goV09J0Z25RU7JJDRP+0h8rDQIYctLbCCujv+h6Se2r6MF1woz/BS9jzcDUoeHZj+UwrT5prccUYVVlh4kMO3qyi7PwmVVS2yncQ4r/lf7VLEvyKXXmWG/R8PLZBsC+hTtn2+u3kJUK2fPiZtQGlOD7l+zmzwu2Lf1jAAIfTOwThzkHI+oHaLVFngms5ZObMhkLVZgAQT0Ii9/Nqs4F6+zhIh4sdznjfQJiR5SDnI7CnmKyseY5dNyiNU05OX/0TEB32uEsOlN8O8X5E7nfa0A==
Received: from DB8PR03CA0036.eurprd03.prod.outlook.com (2603:10a6:10:be::49)
 by AS8PR07MB8156.eurprd07.prod.outlook.com (2603:10a6:20b:377::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 13:42:28 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::ec) by DB8PR03CA0036.outlook.office365.com
 (2603:10a6:10:be::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 13:42:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 13:42:28 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 15:42:27 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id F0BD7402159F;
	Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id A06E370E75F4; Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rybczynska@gmail.com>, <steve@sakoman.com>, <Peter.Marko@siemens.com>,
	<ross.burton@arm.com>, <skandigraun@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>, Joshua Watt <JPEWhacker@gmail.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [PATCH v2 6/6] spdx: add option to include only compiled kernel files
Date: Mon, 28 Apr 2025 15:42:05 +0200
Message-ID: <20250428134205.900354-7-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428134205.900354-1-daniel.turull@ericsson.com>
References: <20250428134205.900354-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|AS8PR07MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: f08a7ab0-b354-4331-2037-08dd865a846f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YUMND+eI0VWSsQ+NmWJyB8nDdBmVu3muYQGaCXro14ZiDDJH4FsJsTIE5Fwt?=
 =?us-ascii?Q?05wAXAnw6w6yqlEUA6ITOTJg4BpzBRKIRROpAf9/X+ZbzVfXuPwhzI4e++U1?=
 =?us-ascii?Q?eBwTt0GFMHq6IiiR2wn8ar2OMcDUlX4sJUxqITCf4h+nbOvrHxOeH11Rt+x6?=
 =?us-ascii?Q?wuNjpv9Tx0QQe+gLvon0znlMJIoeVv/V8zaFYVafPcejy7qK+TFK3UWBqBzD?=
 =?us-ascii?Q?Ab2hsZVJ1/nXIiR90KX8WCGKMvOUJBV+B3+44G//2Iy16yoEspMmvM2TqhK+?=
 =?us-ascii?Q?zbkT3HT8mauwQybWDYGIOr1JLh4tN0B5VkMd9HR9nRLlAkxo0erI8Chl3UwT?=
 =?us-ascii?Q?D8zVYOP2NuoRB9/9Q943a8UVOSQTe/2IcN20HZYfObj1XopTJo5eNCqEW6p5?=
 =?us-ascii?Q?HrBgrQVC4seKqEomgXEWMjakodNvvELfAfz+I7LjUM4BHlB4Jrjp/4gyOKNb?=
 =?us-ascii?Q?6xRmyNaQb1ggyKjC8JjnPlmtpFahveRNMKZTCHB7Jbo+h0rLwlGvTAOgedgX?=
 =?us-ascii?Q?2VnLYi6aodkzAAptaVpaMJu3+8eTFKd+VfCWTvCUELrDbgfx5z9PTRCZRgKs?=
 =?us-ascii?Q?Xj9qv0xQXHqAwyBy33c/Dee671U7mr4RRwaJVCUGmWG1vZB5DkbRWwOCyOnk?=
 =?us-ascii?Q?xpyL8LRaFpuIBsXqMC9VJ+8x6lBJofwR0AZA+abKKExSV4sUL5QbE5ciDdUq?=
 =?us-ascii?Q?HjkH8XbfTmO7jngKer1lmxSPYNa0BqBT2lzNdfOwVB3GfEYfrwySTA4i5MwR?=
 =?us-ascii?Q?6AE0AR4Z3Ucy0pwqBsq3jO54AXxfewxO2Mw6IIL2fXls0US6QPVVrsIrRm5T?=
 =?us-ascii?Q?TPLeVqBuoJiLNA46cWV4ZT68sqmy9lj/YVuPQuZB7g82tjcQ4WphE1ychnB7?=
 =?us-ascii?Q?Ye7KFqgSgJnCbl191Mzkxp+CnvY7JpMiLaGJfTFPCPe67bxImDumQGSQ5N6O?=
 =?us-ascii?Q?9B5QTHBJ+hbLmehRtRr2lQ3J6br/m5eelUY/esmKZKLcQHl3g23s575swun7?=
 =?us-ascii?Q?BZMRnOR7uUiMKlOglmEC6rd4AL7OogubH/JJtbZbxdjuUcXJNkAATT/e9PA8?=
 =?us-ascii?Q?diyeSlcRkc3UlRTCSe4KpeXgWA9mqG0qQ1uwS7Vo1QzwWo8ue8Y6w/kWFCp5?=
 =?us-ascii?Q?u+mftEtzxquhnzszgxptmMQPzJve3LkfP3rs6hWWI+ZaIxTYwJnwf0ZmR7uV?=
 =?us-ascii?Q?BoEUqRiO9jCA+/dFMs/mKx3E+sWl8FdNEwRkIu0ZhmGLvk7qw3oZbtwzvj66?=
 =?us-ascii?Q?pzyXwwRZEsckyTfRxjniVdGXEZz9dr/rrcQKZ0WvCX0bswUarrbda+u2adnQ?=
 =?us-ascii?Q?YRSWx2C0dXyS/us1ham2IxqUneQWoChw92xluc9dmDHvQIRF/Y2lr0i6tktm?=
 =?us-ascii?Q?12jy8i10Dw9PzcsKCyeQpuJiafqecEF6vnkHb/8bNy3tGu1gVnQ0b84exaE5?=
 =?us-ascii?Q?oTD8gJUgS6/ZuXcZjhYLI/ZouD1ATD2iH+G1dssjmVdyrecFB7lcZCdmcMtu?=
 =?us-ascii?Q?QRyL/MUVT2a4nPh6M/cYbXPCmLy1NhnzjbDx?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:42:28.2225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f08a7ab0-b354-4331-2037-08dd865a846f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215601

From: Daniel Turull <daniel.turull@ericsson.com>

When CVE_CHECK_KERNEL_CONFIG is enabled, only include the
source code (.c, .h) files that are used during compilation.

This enables an external tool to use the SPDX information to disregard
vulnerabilities that are not compiled.

CC: Joshua Watt <JPEWhacker@gmail.com>
CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/create-spdx-2.2.bbclass |  8 +++++++
 meta/lib/oe/spdx30_tasks.py          |  8 +++++++
 meta/lib/oe/spdx_common.py           | 34 ++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index 7e8f8b9ff5..6bf0c70bd4 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -137,6 +137,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_sp=
dxid, get_types, *, archiv
     spdx_files =3D []
=20
     file_counter =3D 1
+
+    check_kernel_compiled =3D bb.data.inherits_class("kernel", d) and d.ge=
tVar("CVE_CHECK_KERNEL_CONFIG") =3D=3D "1"
+    if check_kernel_compiled:
+        kernel_sources =3D oe.spdx_common.get_kernel_compiled_files(d)
     for subdir, dirs, files in os.walk(topdir):
         dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
         if subdir =3D=3D str(topdir):
@@ -147,6 +151,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_sp=
dxid, get_types, *, archiv
             filename =3D str(filepath.relative_to(topdir))
=20
             if not filepath.is_symlink() and filepath.is_file():
+                # When creating spdx for the kernel, we only include compi=
led files.
+                if check_kernel_compiled:
+                     if not oe.spdx_common.is_kernel_compiled(file, kernel=
_sources, d):
+                          break
                 spdx_file =3D oe.spdx.SPDXFile()
                 spdx_file.SPDXID =3D get_spdxid(file_counter)
                 for t in get_types(filepath):
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index ba965821f8..14f26773c5 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -156,6 +156,10 @@ def add_package_files(
         bb.note(f"Skip {topdir}")
         return spdx_files
=20
+    check_kernel_compiled =3D bb.data.inherits_class("kernel", d) and d.ge=
tVar("CVE_CHECK_KERNEL_CONFIG") =3D=3D "1"
+    if check_kernel_compiled:
+        kernel_sources =3D oe.spdx_common.get_kernel_compiled_files(d)
+
     for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
         dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
         if subdir =3D=3D str(topdir):
@@ -167,6 +171,10 @@ def add_package_files(
             filepath =3D Path(subdir) / file
             if filepath.is_symlink() or not filepath.is_file():
                 continue
+            # When creating spdx for the kernel, we only include compiled =
files
+            if check_kernel_compiled:
+                 if not oe.spdx_common.is_kernel_compiled(file, kernel_sou=
rces, d):
+                      break
=20
             filename =3D str(filepath.relative_to(topdir))
             file_purposes =3D get_purposes(filepath)
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 4caefc7673..c87e3875c7 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -242,3 +242,37 @@ def fetch_data_to_uri(fd, name):
         uri =3D uri + "@" + fd.revision
=20
     return uri
+
+def is_kernel_compiled(filename, kernel_sources, d):
+    """
+    Check if the file, is a kernel compiled file
+    """
+    import os
+
+    _, extension =3D os.path.splitext(filename)
+    # Special case, that we need to ignore, since this is not a source fil=
e
+    if filename.rfind(".mod.c") > 0:
+        return True
+    # We filter .c files and header files
+    if extension not in [".c", ".h"]:
+        return True
+    # Check that the c file is in the list
+    if filename in kernel_sources:
+        return True
+    return False
+
+def get_kernel_compiled_files(d):
+    """
+    Get results from the save_compiled files and include also header files
+    """
+    import json
+    import os
+    kfiles =3D []
+    with open(d.getVar('KERNEL_SRC_FILES'), 'r') as f:
+        for item in json.load(f):
+            kfile =3D os.path.basename(item['file'])
+            # Return also the correspondig header file
+            hfile =3D ".h".join(kfile.rsplit(".c", 1))
+            kfiles.append(kfile)
+            kfiles.append(hfile)
+    return kfiles

