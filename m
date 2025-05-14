Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9336EC3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 13:51:30 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.44])
 by mx.groups.io with SMTP id smtpd.web11.103048.1747230681875029573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 06:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=yAX0DRGD;
 spf=pass (domain: ericsson.com, ip: 40.107.103.44, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRz+2XjuipvMznQUJWNT8FDL/X34dU5ZcICnSjVDNouG8wt6aTPBF8wsCviqLXdYjyReEJWOHT2VyeQa+IKx8Z3h5/Csgob4tlc5KaNRzUryq57QdzPkUxpviJUEv11lRW23QIaNfnNqjmlSER4o5hmwP8xx1kgZzyWQKTI8vme8lp1RBQgRs2Pr0eKmX6ymuOsx+Haayk7S8VER/lRGq/Xnath9SfOO+VWeYlxkXLs21pmZQmRRnwfPbHgl9bwTijglrpTqfRCoswypqTHxvvole55jfRT/bLLRN0m8vOOx+k7rlOv6L5TiSbY+3D0cO7ny0TCem4S4cTSN1zKrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4IB/tqYvKu3Z39WPDgO82mDlvjI90oO06ChSJPnuHg=;
 b=WqEUBL4qRyGUnNXhmZVGRbA+ZaRa1Mugb7b55IEodbQQRlNdEHhxt9zXp0KcjrXxu0a/vMSOd2XqIK3iNxzfEWEjrYp4arNSJrJiiKjbIH5+FC8oPfN49fbtIVqr/hzwwtfihcKYKLRFm7Tc/0srgV2mYFgs+7C7pZfAmAjIihrDWl6y/axLIxEEi5FCn7Yymah/dDRe+3I42plEh0tiHd/QN5oxDWfPYs80lCcS6wtdfmmzTz6ZC4z5IjN2pzCs5VxzssMNBMgPHXC1oKvIFqbm3GM4UEDqcC+QzQZZ96JVLT35r45CfeJYwwKQRxWGMX50jiEkPGuD0ZHw0DZI+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4IB/tqYvKu3Z39WPDgO82mDlvjI90oO06ChSJPnuHg=;
 b=yAX0DRGDqZU6xG/px3jDb15ZdGAYevqVCUAzqoIi2FPTMuTDijQPCO6wxSpIOzewzRjcubc9nEbTiwphjtcmFbPgCHCXl2Hc2klDKW793ODOR96emdDV0mynswlAeEge20JuxgJY0RqUtAZNTkJvnYCaflgBiSF8lG/EilXIZFOGrMAFX7OtPmUku7Lfkz70KsFExIxW/l9vhbkPd9z6Goqvc1a7QLUOZrc3jco2+IHXI9hrGdX9IM9xw4vhlOvst8jif7/5DmTiUi/3M95j4ORb/bELt4D3LMjIFh6bU1orQtqk2UoDzf8czUNkW7hXZI7Ge2Ec7n7JWUbhxZLW+w==
Received: from AM0PR06CA0098.eurprd06.prod.outlook.com (2603:10a6:208:fa::39)
 by PR3PR07MB6603.eurprd07.prod.outlook.com (2603:10a6:102:6c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 14 May
 2025 13:51:17 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:208:fa:cafe::bd) by AM0PR06CA0098.outlook.office365.com
 (2603:10a6:208:fa::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.27 via Frontend Transport; Wed,
 14 May 2025 13:51:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 14 May 2025 13:51:16 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:51:10 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 0AAEB41CB782;
	Wed, 14 May 2025 15:11:51 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id EA33770E61C0; Wed, 14 May 2025 15:11:51 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Joshua Watt
	<JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v4 1/3] spdx: add option to include only compiled sources
Date: Wed, 14 May 2025 15:11:44 +0200
Message-ID: <20250514131146.501451-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514131146.501451-1-daniel.turull@ericsson.com>
References: <20250514131146.501451-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|PR3PR07MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 729a9b6c-d867-4219-4eaf-08dd92ee6632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i2B53PuxWZw9vK0dAP5iix0EjoPiXqFW79MdQNH4oSjafQ2Jc6WPrw7qhjMb?=
 =?us-ascii?Q?vaEiFxItH4sLB98WEbFmJ3aYApcHH8JkR1k4tO1aWgXD6TpA2BIQIoGOvmKY?=
 =?us-ascii?Q?z+NEd6FTawQo0nS/EH5i4Brr+PmOfipo8+7vi4b3v7SKOK76Cig9aOp1l979?=
 =?us-ascii?Q?whIIETyR1XqxRVTNVfVj1kzVBJeBy/GBgWTDoewJv8suz+HdwYhWhCZl2WjX?=
 =?us-ascii?Q?pTRXgOA+3O2Uxe0XopYlxM8VstRW90VGPneHa19QQpqJCFNiZyLjJBtUZSx2?=
 =?us-ascii?Q?B1v7EWcmxZeywCedAFY8hRzdLGAuc6vfOnj+Www/O/3+yZh9uPEoqLpK/QjH?=
 =?us-ascii?Q?VtM2C01NQVl2Ysblj3Dn7FGAA4QsaFqE5UmfEPjLlzXYb0odS2u665A2Z0Pt?=
 =?us-ascii?Q?G+2HtMYX/P+0EZXKaiHVLY+CmZajb+bcff3FzTHSD6cXDCIt3Qz5sqX4Nv30?=
 =?us-ascii?Q?qtWemEN+Li2Ven+PG71XFf3VL/tktPLAXdUWkShnAIk+Z5Z5iIg49nUgRdJ5?=
 =?us-ascii?Q?ZQUrVeJ7B7IRzrVfK77Ktz+03vSbmbdvZ2AuqnJvakYXz7RXtSTdTtt5Gd6j?=
 =?us-ascii?Q?U4kpCjxyQEftwxqMjWTF8y/4aX+0gy+MT6kGoeVesqGfyNSFZaT4Y519tHFY?=
 =?us-ascii?Q?9brrphY1ktFY3yrKm68lWcZq7CjwPB9NlRtSnU07gp5LktIza9r+24+u4nXY?=
 =?us-ascii?Q?XzwiaowUfqQYBSscSZ5gK4uZZ9sTsQZ3DT38Q8SanaZNXfxe25grsliUQFIO?=
 =?us-ascii?Q?gsde0n0A4nyRbjvcrzard4ax1e/R00WUrQFEZFd5NGwl9Su17pBa5CK7nwas?=
 =?us-ascii?Q?Q9LE6DS9TmsPx8OE7/aa+ny7iUSPYdZfNXufOOIXhQrk7B+0/vEAprBYe1aL?=
 =?us-ascii?Q?TXbz8+jAi9iC4RZHmUnb4KpnZWBAGngLBZrlgQDruQMaM4XBp4VLvp9Jyru8?=
 =?us-ascii?Q?u4rL27hA+sK/2Du5lq7Q6mto44YMJ+5RRUTfi60T2AHJl7CfkcLD4RjHMx5O?=
 =?us-ascii?Q?pXCZ37ef7t96uyJVfQywqvbmyUHnyiggl5mp22JOMcNPUjQWZJpjhjiD/r9G?=
 =?us-ascii?Q?utMM8OLKOgIP/IgFe9T3vX3Z0yGdqm+Q7ou10g66Wed+U6atb7Qcm20hKr/+?=
 =?us-ascii?Q?3xtnh7Rz4fbQA6jw/eGNUc9QWeUiEMln6TX4Izll6RVZgsFFSsh3ubkx0jX0?=
 =?us-ascii?Q?pM0DL1e5OQcYDVwOZ1tb5/jLyOi+Yggj9uAT2uEDcgNskITNgH/6hReu4cGI?=
 =?us-ascii?Q?92HEj7F4MMeC/G7H4+P/+CK6i+XdVC/9b0qa525ASoGggyO3GPPpUDQuClrP?=
 =?us-ascii?Q?ZyjJI3LuYvsAGp3HGTodubJ/mUDGnwFFwpcobctW07ln66pWtzg6V34sBO/Z?=
 =?us-ascii?Q?mU4RakVKwUxvknJ77hgWFPP5i9pIwiADFQiuM0kLMwZzSkm3kYUt4pSJX4k1?=
 =?us-ascii?Q?C3cjTrzkTiWcRt8neFp0YzjycAjrBlnat/R6OxMTfOPYMT6WzZg85A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:51:16.9856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 729a9b6c-d867-4219-4eaf-08dd92ee6632
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6603
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 13:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216494

From: Daniel Turull <daniel.turull@ericsson.com>

When SPDX_INCLUDE_COMPILED_SOURCES is enabled, only include the
source code (.c) files that are used during compilation.

This enables an external tool to use the SPDX information to disregard
vulnerabilities that are not compiled.

This commit adds the basics, so recipes can implement it own methods.

CC: Joshua Watt <JPEWhacker@gmail.com>
CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/create-spdx-2.2.bbclass |  9 ++++++++
 meta/classes/spdx-common.bbclass     |  3 +++
 meta/lib/oe/spdx30_tasks.py          |  9 ++++++++
 meta/lib/oe/spdx_common.py           | 33 ++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index 7e8f8b9ff5..dd8ee6ecbe 100644
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
+        compiled_sources =3D oe.spdx_common.get_compiled_sources(d)
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
+                     if not oe.spdx_common.is_compiled_source(file, compil=
ed_sources):
+                          break
                 spdx_file =3D oe.spdx.SPDXFile()
                 spdx_file.SPDXID =3D get_spdxid(file_counter)
                 for t in get_types(filepath):
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bb=
class
index 713a7fc651..e9dde34513 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,6 +26,9 @@ SPDX_TOOL_VERSION ??=3D "1.0"
 SPDXRUNTIMEDEPLOY =3D "${SPDXDIR}/runtime-deploy"
=20
 SPDX_INCLUDE_SOURCES ??=3D "0"
+SPDX_INCLUDE_COMPILED_SOURCES ??=3D "0"
+SPDX_COMPILED_SOURCES_DIR ??=3D "${LOG_DIR}/spdx-compiled/${PN}"
+SPDX_COMPILED_SOURCES ??=3D "${SPDX_FILES_DIR}/compiled_src-${BP}.txt"
=20
 SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdocs"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 61d7ba45e3..083e004330 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -156,6 +156,11 @@ def add_package_files(
         bb.note(f"Skip {topdir}")
         return spdx_files
=20
+    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =
=3D=3D "1"
+    if check_compiled_sources:
+        compiled_sources =3D oe.spdx_common.get_compiled_sources(d)
+        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
+
     for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
         dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
         if subdir =3D=3D str(topdir):
@@ -167,6 +172,10 @@ def add_package_files(
             filepath =3D Path(subdir) / file
             if filepath.is_symlink() or not filepath.is_file():
                 continue
+            # Check if file is compiled
+            if check_compiled_sources:
+                 if not oe.spdx_common.is_compiled_source(file, compiled_s=
ources):
+                      break
=20
             filename =3D str(filepath.relative_to(topdir))
             file_purposes =3D get_purposes(filepath)
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 4caefc7673..e1b7f576dd 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -242,3 +242,36 @@ def fetch_data_to_uri(fd, name):
         uri =3D uri + "@" + fd.revision
=20
     return uri
+
+
+def is_compiled_source (filename, compiled_sources):
+    """
+    Check if the file, is a compiled file
+    """
+    import os
+    # If we don't have compiled source, we asume all are compiled.
+    if len(compiled_sources) =3D=3D 0:
+        return True
+    _, extension =3D os.path.splitext(filename)
+    # Special case, that we need to ignore, since this is not a source fil=
e
+    # We filter .c files
+    if filename.rfind(".mod.c") > 0 or extension !=3D ".c":
+        return True
+    # Check that the c file is in the list
+    if filename in compiled_sources:
+        return True
+    return False
+
+def get_compiled_sources(d):
+    """
+    Return compiled files from the SPDX_COMPILED_FILES file
+    """
+    cfiles =3D []
+    sources =3D d.getVar('SPDX_COMPILED_SOURCES')
+    if not sources:
+        return cfiles
+    if not os.path.isfile(sources):
+        return cfiles
+    with open(sources, 'r') as f:
+        cfiles =3D [line.strip() for line in f]
+    return cfiles

