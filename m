Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0601C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:22:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web10.14157.1749036113797800544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Cz0Wme5z;
 spf=pass (domain: ericsson.com, ip: 40.107.20.64, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uD3wxPibHIKk5SuAhXYfUw6lAtIYaaQE1amSODAbLSJ/E4rB1ADmjH5sxjB9aHpFYB0OKJ+9LfU9fBrUlLGwhsvVVGvoX67LwvCZosK+kpyiwlxUa5iZek6RaJpar4NRldKCQ2ARtN5nUnc4NiSa8DnCFg1jx4Zi3cM7c9xIYvHMhi6t3YmLxcZKlj9TO67PXBQ/zLsoq+tbSn/zb3jHU0HXhye6tmfQdsCD7ZWbliJseCUu4Q1JwKDixRH6IP+jnbyleCMA6KKTRxbk6RuNyVEgMBNnSlnPlWPN1Gq8VbfD1wxVVOFhoEeD7fqxhBcnkHFD2pq4wmb16WemtRLl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snDIhAMaYpV80q7YuGsKJkdxefOcGynPOcY1wAYyppE=;
 b=bXrwy80e6E5WKFlpxzD48jayr4eDu0JLXsHBugmQt9XUv9fJnQGOKRQxm8ITCjZqAir3iyELI9IV6r4fwopT9RUIIXjrftSXc+Dtui4yHW6GdFTS++kYh9okVXdHwtTGLoSWmd7CWjWfrcPL+rgKlqLDRy8Bmn364z76iweLyCvbMG4akx/8ZeUCJ+ULHnlPMoUKAWbpeOfoxf5bmlidIBMUCXWYYvoiSmzM5gfT3F6yDKD3gHmk7d+Qz5ryuxO2YorddPayoHDA8rx8E2WzCwNX7itXCy2iI3d+b/LxwA7CHcsnn2Om2lvl2K03Z9WNZnzOuEmN5EGWHyG3GUMj9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=cherry.de smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snDIhAMaYpV80q7YuGsKJkdxefOcGynPOcY1wAYyppE=;
 b=Cz0Wme5ziMmKRpLDSmL11lWC4jzz/tZ76W4/WLjV0n/9OWuMbJKcStm0eVILfT55prkpdOCw1lIFvaXOEOCzddXD/XUFJRcbM5WAmdABiS0m6bvGiiDlUMIv1+S95CPQNFTNs+YtczWuJPvxveOCUdf9a+xRjlMDu8aLLPSoyF+wIkVhErS5YIhkacYOBScP59X5buKr3KCTHTxwKo2KKI1fX6745Wm3U3YG0RVOpm/XhmSplKy8hjK5NLE1gIDE8/ibFOroJf5b/nOqlKBTI7B+HyhTZYJEzGtsVJgEtlPkKBklmnVHHcKu7hnpH9TSeOlhGQA1Xrte22jpv/d+Tg==
Received: from DU2PR04CA0337.eurprd04.prod.outlook.com (2603:10a6:10:2b4::35)
 by DBBPR07MB7626.eurprd07.prod.outlook.com (2603:10a6:10:1e2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Wed, 4 Jun
 2025 11:21:50 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::65) by DU2PR04CA0337.outlook.office365.com
 (2603:10a6:10:2b4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Wed,
 4 Jun 2025 11:21:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 11:21:49 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 4 Jun 2025 13:21:49 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id CF9B94020B54;
	Wed,  4 Jun 2025 13:21:48 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id BA8327083F54; Wed,  4 Jun 2025 13:21:48 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Quentin Schulz
	<quentin.schulz@cherry.de>, Joshua Watt <JPEWhacker@gmail.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [PATCH v6 2/3] spdx: add option to include only compiled sources
Date: Wed, 4 Jun 2025 13:21:32 +0200
Message-ID: <20250604112133.2581063-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604112133.2581063-1-daniel.turull@ericsson.com>
References: <20250604112133.2581063-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922F:EE_|DBBPR07MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 969d1b42-c6af-4e7c-8025-08dda359fff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Y3U0BCOM6HNO6AtKxcJ8cocWjRMU5MQaKGLtIp2qivOZmKUZ5Lm6bRjeov7g?=
 =?us-ascii?Q?MgEdMq8CqpuE17Qz+AyfzIWAc2Dz7kqXXtJNvind56Bv9BUKRuiKjmtrGRBY?=
 =?us-ascii?Q?S2qUzpSPyqCPkopjIdAbCGKpwEmhw2xMqeDcwiExbasDaUXeHUrwnGU8X5Y3?=
 =?us-ascii?Q?ISghW5b2D29BK6EMC3y27AV81Hfx7PMunpO98xRkvai3+LOC9HZAMEiptsm6?=
 =?us-ascii?Q?ziACsv59NWNFyz/lXTrPXIU0PwSmTmaeb4qzJMK1hXyzKVzO7NYePCr9hcgh?=
 =?us-ascii?Q?Jxmm5DkAHluSQQpehBgnKnwUywPItH/Hk3RknW2qhERJeDpCy4b1uOecy2aq?=
 =?us-ascii?Q?chWB58u+c0eDOslkctTkeZ2+s9UtGLAWAY5P2Lo1iyIAVq8c1gkYDoapJOeX?=
 =?us-ascii?Q?70hQRk8ntMcEVK+VnevvrFUdeXV40dCijL3E6y3oHNCxqEdkHY0gS1VecBlE?=
 =?us-ascii?Q?5ApXKF5KWGsWpKMNYP4A5zutgAEzPtSa4LrCrqWgtvoHdoVXhNTTGHelUD6S?=
 =?us-ascii?Q?7NSiu4cKzkPvZxGLpS3FeldPzTZ9t8weGjGpZEMPWAij5qOCdz/cpXyDQ+p/?=
 =?us-ascii?Q?vp3heC/ekkFt3PlqLb2sGES7rOBMmIvUUxezcnGXxqOfjqLM5tK5Myccof4x?=
 =?us-ascii?Q?zBMykJ1W3LBkOj7M3KDb0kdmlTlrjJ2g8p7cG63NLIB8m83Hlna52Dh2ESXN?=
 =?us-ascii?Q?6wHeeIegf/Ecy1qiq+wZcIuTILzheH48KdKW750/9b4nNSpYCHDWbaS9DbqC?=
 =?us-ascii?Q?sV1lwxY3iMjERFACEyS1fYa8OM+lAvx/qQyPC8elsefBog7Fxqr0qNEfMB5/?=
 =?us-ascii?Q?yUQqlhy5emwfv4S+2vBqfDFs8+c5hU08hlTwCo4ZvOFDinzL1H+FDxKH6wda?=
 =?us-ascii?Q?Ew+1Z2vJm1eMSgVpO9E2nMu8ca7c8h4JSaiMPwSx2FR1cHBJ/8FENlnAzJ+q?=
 =?us-ascii?Q?EfTtTzVOZ8NOEWaus+dNigLCUF9hfZ30yqwfhHBut51O/Gm0f+X1AFTu8Dyd?=
 =?us-ascii?Q?H5QLVYaft5gG2rmBm2CHq/+bTR8hLehUGeq7CDsCI7Fadp16J0/tka38Lqrw?=
 =?us-ascii?Q?AP4Qcaxjo6c6gR1+nQy7rxM/7WvkjNN+YliYsTO90QCet+VYfeNx8MMKHNyh?=
 =?us-ascii?Q?cWHi0Bc4k58LfS1opf9Bc1hP2V9k5QFUkvkA21fJ+UFy4RrxaS7TyPoDHbLl?=
 =?us-ascii?Q?4XX0KAVTPR0z5KKZpTyGyWd/cPK4utVQfu8geKGpj7MaXMlRWUFBDMHvdl9a?=
 =?us-ascii?Q?wojrXwIcuASY1P00m0bVNKThgF1vDVC0WEopP8IQgSmkjCVJ+kIpvDZgGlRD?=
 =?us-ascii?Q?jypT7MIo31LigDuEgAvzoAqnlYYnoEZK1nz+qSoTfLhZ91QPeiSmR1HWAJ+a?=
 =?us-ascii?Q?T2hq51V+fExckjwL+mhRCons1p9Au6l0ayOFM5j66+9DZRtghf1JiMMn9DAN?=
 =?us-ascii?Q?DibehP51jXvpT6Pg/bFP6ftboCaIS3Y5WmQ0kmsLj5D+xQmnB+39AA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 11:21:49.7565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 969d1b42-c6af-4e7c-8025-08dda359fff9
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217909

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
index 4caefc7673..daf43bce56 100644
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
+    if len(compiled_sources) =3D=3D 0:
+        return True
+    # We remove the top directory, to match the format in compiled sources
+    relative =3D filename[filename.find("/")+1:]
+    basename =3D os.path.basename(filename)
+    # We return always true if the file type is not in the list of compile=
d files
+    if basename[basename.find("."):] not in types:
+        return True
+    # Check that the file is in the list
+    return relative in compiled_sources
+
+def get_compiled_sources(d):
+    """
+    Get list of compiled sources from debug information and normalize the =
paths
+    """
+    import itertools
+    source_info =3D oe.package.read_debugsources_file(d)
+    if not source_info:
+        bb.debug(1, "Do not have debugsources.list. Skipping")
+        return [], []
+
+    # Sources are not split now in SPDX, so we aggregate them
+    sources =3D list(set(itertools.chain.from_iterable(source_info.values(=
))))
+    # Check extensions of files
+    types =3D []
+    for src in sources:
+        basename =3D os.path.basename(src)
+        # We check that the basename has an extension
+        if basename.find(".") > 0:
+            ext =3D basename[basename.find("."):]
+            if ext not in types and len(ext)>0:
+                types.append(ext)
+    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {=
str(types)}")
+    return sources, types

