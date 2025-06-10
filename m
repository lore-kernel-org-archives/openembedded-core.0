Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6916C678DA
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:25:07 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.23])
 by mx.groups.io with SMTP id smtpd.web10.90072.1749569103511828373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 08:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=mvK0Csom;
 spf=pass (domain: ericsson.com, ip: 40.107.159.23, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTFINRWxtQD+iUWdqG+PfapF+7y8TYQ+a+I0TWhhFhg62UK7BsrPe3kb/GAs+dBmpV9XPJh5ji60ypcmAcpGmo3VsUYm9Jxig5BGUCVF1y3RvH1HyzrfeqRJdd3huhgMhcudvMC4Ah5u319BAHuotuaFW2jkjK1pWbUqzn3/95lHr5y5yHZqe+Dy1tOBNC3vAu+SttZhUIZWOdHuXPc8c+J8TdXxywfSD9Lln29crMak6K5tk6MiqasjIuZWVf9vgJ9zEzY5pV465pmP3ja9I1vmQb1mq9U1qOTgBI9dsVohnma0EtTsFpAvTFRYoWrISZ9e6ydtpO+6/mdAvyrqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUJMWecbuoWo0cyvVht33qdnLpuNRnAqY0gLvA1/+Mg=;
 b=GaU0clfKGEAJf0yXzzZks55sZPUP6cq3kLks5xX4mh8NcPF0LQ7GO50xv3b75k2to/GlzK+hMHejXdVBC9+9A3KQSTZIePuUGLmO7E3Xgndf1hEsgc6D8bVco7dxcZZqZX3o0xIh5nWSjJzaZY8eDFzJe8Uwqo506xDI6LBaoN4EMSTNPmEnNWDGwI/+BZ7FKI8YsmAhULj0PLf1YVHk3TKMQW0AP+J566C/+9IL0eZa8UZxPRoSmBIYL3TVUFmVrjOCBpcV+5AUK7if9+IdzKtAqtLBFNFzTYuhLhH0JF8eJEs/gwDv5ZSerPN9waqBLmfBltTx6Arf1AKBThl7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=cherry.de smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUJMWecbuoWo0cyvVht33qdnLpuNRnAqY0gLvA1/+Mg=;
 b=mvK0CsomB6wxUVfdQYo0JRvr8wmN9A8cWk0tPA9KCr4WM83FQRUW2pw1yStt6LDeyYXF/1RSGyl4yhHa82xvO3D06vLHbfD/JzVKVMv0eUtvlBvfbsGG0o3HzdsDKnBN/ejhsKXTC9Kw4g4aqrjEjWWmYMArQPrj77xAz4Icz8KoG6QzcaCDlp/dum3CgNbjpw5NbEP2UVI1oRNYOW7UpsZx5PwuQ3x56dXTgzozvR41DN8+cpR+GQKenpyPhHi6z0KuEVg26qWjclsl3seJg+Pe7g8jEesFVA1GOCGjUoLCUJomnyE8ANT04Gbj+QRTr24rpy9H7co6v1a0hiND8g==
Received: from AS4P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::16)
 by VI1PR0701MB7024.eurprd07.prod.outlook.com (2603:10a6:800:192::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 15:24:57 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::54) by AS4P189CA0027.outlook.office365.com
 (2603:10a6:20b:5db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 10 Jun 2025 15:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 15:24:57 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 10 Jun 2025 17:24:56 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 11E1C9582F;
	Tue, 10 Jun 2025 17:24:56 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id ECAE87083F56; Tue, 10 Jun 2025 17:24:55 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Quentin Schulz
	<quentin.schulz@cherry.de>, Joshua Watt <JPEWhacker@gmail.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [PATCH v8 2/3] spdx: add option to include only compiled sources
Date: Tue, 10 Jun 2025 17:24:42 +0200
Message-ID: <20250610152443.2162164-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610152443.2162164-1-daniel.turull@ericsson.com>
References: <20250610152443.2162164-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|VI1PR0701MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a8b419-2e19-4c3d-373b-08dda832f539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+I+XBhg7PWOLAaBlzMONycR/vmLE3xyI+iI/TnzWzc49e8ddAddNHczlWqoX?=
 =?us-ascii?Q?yImcMwh49ZQS87/O2gUU/sBDlamr82VHySOYFUAeC+YFJqmOsyXGUnB//ezN?=
 =?us-ascii?Q?2ZpDIqSOjn350QLEhFiB19yRhvk0O9Z1tD6ujD6F56ykqhhpUHPt+QTanX78?=
 =?us-ascii?Q?YxtBdsHr8EnHvTkbpmFCWLQCFzA2IYfxH9HL+WUecMcQzSKoDnktnebtvp6o?=
 =?us-ascii?Q?K+ml1GJJSL7zZfwTkfx4gwEmCMXpE5q/Fe/8XFsNOTqwUu3UvCovDPtOODvg?=
 =?us-ascii?Q?doa2tskmIYg/1ELliGW8iYf+kqBNjM7Wq+0scOw6yuln6O9MNsOlv2BHKYN0?=
 =?us-ascii?Q?f772MLtP16gt9jsfyEgJWp2gViAAM97oilWtDXDcwmfQ7DT/iqf7X0oeq5rh?=
 =?us-ascii?Q?rxEnj3Ii8UlTdvXNnhVtH94xYwzna844ChiZ/lQVKk6J8P2lviJJ+BUtTcRI?=
 =?us-ascii?Q?VslhEVYbAh8GEpZ1zlabRfpIpEJT3ch2ex3c3OiV0prFN0YRU54CvAC105H4?=
 =?us-ascii?Q?xnpVBqy1YV8IWeL1EwR2TAP8eVQ1/l8SwtAWZpWl8nvEE7H0nG85H3lbaAuK?=
 =?us-ascii?Q?awn6JM+8GuwPGmnQW+yfxQAfQCoR1lM1hEQbMj7jf5LyRXLS8OAE/alddoDp?=
 =?us-ascii?Q?n94U4NZ6vbgvXtL+lFfM/WbFBFMSuWIgHGoCvL43150yGocoEPkC9LRWB8rI?=
 =?us-ascii?Q?evU3Wl2YCYdnH80N15CSuSw8jkX8yTCDc43MkVYDX/rZzgM7HXPV2vgURXzA?=
 =?us-ascii?Q?GNCsBdNBqoyY8RIMRdrabFqNazmvIFUTxFpA6rkc0TbquqBlUHXItfoWkFHZ?=
 =?us-ascii?Q?C5afaMfsGkWtrkMPRfJBnMFXLYAfXACdJBQ5BZpMOKmFpeoYIvPBSIvEPcLE?=
 =?us-ascii?Q?3ovlVCFhzXTwtEIOAEKc1YaL72DPu7DU++hjse0Pbw7gz+MSJfg5tA9wN5AC?=
 =?us-ascii?Q?gMkmDqc5ree/e8ZKlhQf0BCgGvQLEKWXkYomtJuOfs2sJ/ebn8xn9Kbb0VTf?=
 =?us-ascii?Q?LDGE0FH4JTfRX7MywrLGAv78q8ZIROato4LzKfQsLDVVwnp8HLAb1eI6vO+v?=
 =?us-ascii?Q?XBzVw/ySaYb6KsZXRLTiXyDElnKSGNkW7k+mmfokjOYjpFkCEyk/a/JT7yu+?=
 =?us-ascii?Q?Xt3T1mVALBmWFGotEza8MQSq6DagctS/7a9hh0JonbIVmQG3gSuxmCD0wKw9?=
 =?us-ascii?Q?qi7EcHPpt8d9h3yJntWPO2Ax+2a//blonZNuGVS+QyTn0QVt4j+Sy60Q8QTz?=
 =?us-ascii?Q?85xbFeZaK701cJbVvtITkj+/clv8rIKc3RKegByH10fEM0quQbDcXBYTlCeo?=
 =?us-ascii?Q?vzDbtRS0amHh/5EnY4T+M1h4z+rnFuE+KiFdG7IATbo2UDzXZU1SqfgDJ2VY?=
 =?us-ascii?Q?H57QTAwIODR1t3cFBD/k9Nt7cK5dbrWcSg//HfG04B3MSV8HDW+lRvlqbc7z?=
 =?us-ascii?Q?Kb9UJT8MJ3C35v+4meiBQrgD/CmgFjs9aXyeAjiWkXHkn+814lItNQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:24:57.1882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a8b419-2e19-4c3d-373b-08dda832f539
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB7024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218362

From: Daniel Turull <daniel.turull@ericsson.com>

When SPDX_INCLUDE_COMPILED_SOURCES is enabled, only include the
source code files that are used during compilation.

It uses debugsource information generated during do_package.

This enables an external tool to use the SPDX information to disregard
vulnerabilities that are not compiled.

As example, when used with the default config with linux-yocto, the spdx si=
ze is
reduced from 156MB to 61MB.

Tested with bitbake world on oe-core.

CC: Quentin Schulz <quentin.schulz@cherry.de>
CC: Joshua Watt <JPEWhacker@gmail.com>
CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/create-spdx-2.2.bbclass |  9 ++++++
 meta/classes/spdx-common.bbclass     |  3 ++
 meta/lib/oe/spdx30_tasks.py          | 10 +++++++
 meta/lib/oe/spdx_common.py           | 41 ++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index 7e8f8b9ff5..6fc60a1d97 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -137,6 +137,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_sp=
dxid, get_types, *, archiv
     spdx_files =3D []
=20
     file_counter =3D 1
+
+    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =
=3D=3D "1"
+    if check_compiled_sources:
+        compiled_sources, types =3D oe.spdx_common.get_compiled_sources(d)
+        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
     for subdir, dirs, files in os.walk(topdir):
         dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
         if subdir =3D=3D str(topdir):
@@ -147,6 +152,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_sp=
dxid, get_types, *, archiv
             filename =3D str(filepath.relative_to(topdir))
=20
             if not filepath.is_symlink() and filepath.is_file():
+                # Check if file is compiled
+                if check_compiled_sources:
+                     if not oe.spdx_common.is_compiled_source(filename, co=
mpiled_sources, types):
+                          continue
                 spdx_file =3D oe.spdx.SPDXFile()
                 spdx_file.SPDXID =3D get_spdxid(file_counter)
                 for t in get_types(filepath):
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bb=
class
index 713a7fc651..ca0416d1c7 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,6 +26,7 @@ SPDX_TOOL_VERSION ??=3D "1.0"
 SPDXRUNTIMEDEPLOY =3D "${SPDXDIR}/runtime-deploy"
=20
 SPDX_INCLUDE_SOURCES ??=3D "0"
+SPDX_INCLUDE_COMPILED_SOURCES ??=3D "0"
=20
 SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdocs"
@@ -40,6 +41,8 @@ SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
+    if d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =3D=3D "1":
+        d.setVar("SPDX_INCLUDE_SOURCES", "1")
 }
=20
 def create_spdx_source_deps(d):
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 61d7ba45e3..beeafc2bb7 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -156,6 +156,11 @@ def add_package_files(
         bb.note(f"Skip {topdir}")
         return spdx_files
=20
+    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =
=3D=3D "1"
+    if check_compiled_sources:
+        compiled_sources, types =3D oe.spdx_common.get_compiled_sources(d)
+        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
+
     for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
         dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
         if subdir =3D=3D str(topdir):
@@ -171,6 +176,11 @@ def add_package_files(
             filename =3D str(filepath.relative_to(topdir))
             file_purposes =3D get_purposes(filepath)
=20
+            # Check if file is compiled
+            if check_compiled_sources:
+                if not oe.spdx_common.is_compiled_source(filename, compile=
d_sources, types):
+                    continue
+
             spdx_file =3D objset.new_file(
                 get_spdxid(file_counter),
                 filename,
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 4caefc7673..c2dec65563 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -242,3 +242,44 @@ def fetch_data_to_uri(fd, name):
         uri =3D uri + "@" + fd.revision
=20
     return uri
+
+def is_compiled_source (filename, compiled_sources, types):
+    """
+    Check if the file is a compiled file
+    """
+    import os
+    # If we don't have compiled source, we assume all are compiled.
+    if not compiled_sources:
+        return True
+
+    # We return always true if the file type is not in the list of compile=
d files.
+    # Some files in the source directory are not compiled, for example, Ma=
kefiles,
+    # but also python .py file. We need to include them in the SPDX.
+    basename =3D os.path.basename(filename)
+    ext =3D basename.partition(".")[2]
+    if ext not in types:
+        return True
+    # Check that the file is in the list
+    return filename in compiled_sources
+
+def get_compiled_sources(d):
+    """
+    Get list of compiled sources from debug information and normalize the =
paths
+    """
+    import itertools
+    source_info =3D oe.package.read_debugsources_info(d)
+    if not source_info:
+        bb.debug(1, "Do not have debugsources.list. Skipping")
+        return [], []
+
+    # Sources are not split now in SPDX, so we aggregate them
+    sources =3D set(itertools.chain.from_iterable(source_info.values()))
+    # Check extensions of files
+    types =3D set()
+    for src in sources:
+        basename =3D os.path.basename(src)
+        ext =3D basename.partition(".")[2]
+        if ext not in types and ext:
+            types.add(ext)
+    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {=
str(types)}")
+    return sources, types

