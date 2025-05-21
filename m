Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDEFC54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 13:44:38 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.64])
 by mx.groups.io with SMTP id smtpd.web11.11558.1747835070934477864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 06:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=W7JbrFzo;
 spf=pass (domain: ericsson.com, ip: 40.107.249.64, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9v0iz7CdyKWw6NKYR//YgZ2Euk1e3Bj1c9g2KbYmcoxsqH7VHVPFffQTED8N28gV541m/DYAIE09mEAim0zviZDHkzPolLy5yCDkh2xYz9edWkVLJgGgU1P7gG/Sfzi31Fn8bktQefE+i1NjgoQ+AXd5E8zORFPALqvhafzjopDPzWGkOkRIMo8EDS4EJiP+f9fAuyHb6cRGVzciHRPFStlC8mfU6ZTIrdziqCOl4XCqywcgacy387Xxc3kzcXUP808n4VyaAbxvcXeFHkYjhVTOxPq6FvgrK4Q4+XzWdhDplyyXpjX0VfCaYYvRypRi6Rv44OxhB7mQDjmMtTAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CRHsESif/f0/kgSztC4khaC5Vizk6B0ZcwVLWkgPDM=;
 b=IM30UEdf1OSis9mmQ+R35ESTbHKivn9+rqWCj4C3lot00Lk3ZwyZ+c6EQc1T2Fsj7hyuQqSLd4yUpQxTov1O0Qim7TvXzboNKg8XZBFIvnQA0W5MBCQo7ubqut9fnEuboG1Fd/J76jiT1Yzyab0s4oay7jWLw6LwkfgSjcrDG4vrIHOVIkyxNh9wgIzLfISkFTLn2kyKsupyieQfRCDO7TBFwdXS6XREOFCZ4Pi+S/sCDkbeKDTEeRy3EOSknn6zwu4PTp/WZqgZRE7WBtCJ/5DU0uYqmB2+K6xGR5zh+2xKBZrHP8p0lWLX72Oi2rQa5j+mbcVNHpJCNtYbDU8dzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=cherry.de smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CRHsESif/f0/kgSztC4khaC5Vizk6B0ZcwVLWkgPDM=;
 b=W7JbrFzoWp47OiZDzpHfog/LWcgnfjXs0BJ4B8gkzbHBiw0vDULGEGoDOcDC3AOy1G/i3WdnXB1xAq8ujCBSf9r0fMAy0E6n3m1azefkE+wTUqUPVLY8bT4WU+pU9mOa3CEpZI8QwULwVYGyMd897kFITN9mpf2M1NEeZoU92I1BpgKOk0e3IPhlkz6Yt/fwjXf+Z9SaMOeo6JMVduTlx0K22bUO3BOdkHHC6thjjfVN12aPE5gUGAe73G/2KWtj/MMxqtSFelLyc30NVxaNfQJlV+xqVLR9ORUpcdwk4LBEHdnDIp4w5tbbDI5prxfJLFkdG2HybtKOqFBCvfEk9w==
Received: from DU7P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::34)
 by AM7PR07MB6818.eurprd07.prod.outlook.com (2603:10a6:20b:1c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 13:44:27 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::9e) by DU7P194CA0019.outlook.office365.com
 (2603:10a6:10:553::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.20 via Frontend Transport; Wed,
 21 May 2025 13:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 13:44:27 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 21 May 2025 15:44:26 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 84ECC4020B71;
	Wed, 21 May 2025 15:44:26 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 72EC470B5B03; Wed, 21 May 2025 15:44:26 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Quentin Schulz
	<quentin.schulz@cherry.de>, Joshua Watt <JPEWhacker@gmail.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [PATCH v5 2/3] spdx: add option to include only compiled sources
Date: Wed, 21 May 2025 15:43:59 +0200
Message-ID: <20250521134400.1733473-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521134400.1733473-1-daniel.turull@ericsson.com>
References: <20250521134400.1733473-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|AM7PR07MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dab7722-34b8-4d23-5a0d-08dd986d9ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VIDDLPp/13j9vSvLXTiIXYECRHE0LB3gHJTpBM+T+ohOBgoOfT9CyU2Vbj93?=
 =?us-ascii?Q?Q+DwOcUbumVN7z6i91ZJpFI8UL/QnJaikuxHA5E88C18wet2/ao1ieB3c+Up?=
 =?us-ascii?Q?nzgtfLzOuziHlPwjaBj+s6bSalsVYZhI6L1quq498VTxlmeY7qo46960QpAK?=
 =?us-ascii?Q?ct6GEobFpDKK/jEUfWhPIw013R+yL0NGJ8jFOJ5siXrxKBWc1AxypGX8pm2U?=
 =?us-ascii?Q?m1UIO7gUESzM81DIG7CLaNi8Es5YLf/enzmei7icEsGD2m/JAZs+5KIvs2NQ?=
 =?us-ascii?Q?JbwjcQbyrR8fbI6DREr9skr+XB0zK+wbiYm3wNutOHOh86TLAv7ceeEaJXOc?=
 =?us-ascii?Q?3ex2R3ftcCPtJgitvWjOhvqhSh+eeEgWQCqlQiZwfIKWbu6rr1zQ5IYn6WuE?=
 =?us-ascii?Q?Zp3859h7ML0I88Ca9fJtQ+3bVH4Bp8Uj4AGl3EifmVKMjLQP0TgmcbGXRde+?=
 =?us-ascii?Q?Mkl31RLDtrUA455ui+1iSlGilwHH/uM4QulfNzdao+l4tGtaLgI1aKSCOD1D?=
 =?us-ascii?Q?FKcgkv4YvrjlZrr5qACfzQ457CHW8c/7Tul++irOabUzsqX9a5vpxFKCbqYk?=
 =?us-ascii?Q?/cI6DIxtP4q8Zm2H+v86Wb1lj9qTNMe1buAQmrpF5H5aK4hOjYJsqpoVBMLA?=
 =?us-ascii?Q?sp2Khk9WPExC5/3Cs41zqVsfDGug8jgqqr7sHrQB6lF3IHTDguUAnTZ+hWOi?=
 =?us-ascii?Q?T3pUrTqh4J0f6f4YlLoJkeKzFZ+xCu+ZHz3zJnm7TNtbjcm65nB3FINR2zhm?=
 =?us-ascii?Q?VmR1Qw/J+FlZxzEif2L1E2syf7QZmre5AQo0oqpzCBL3nR1ONJjl2ABDZgn1?=
 =?us-ascii?Q?X9834Q5Al2Vzn7U04LN7NdmSf/jFNxWqgesdrW6Yz+gNIO3oZzsIuv5k2j3k?=
 =?us-ascii?Q?RnPvKf/7bofEoNzlt99B0rvcLsyIvvM6VIiwGekUHn/3pio4YGEuZhPHztyo?=
 =?us-ascii?Q?TFa1x9R0/ROxV2sdCaryUVMj9wprMSwEm5Dki2HtewzKU0fDxJeEFh0kdoKm?=
 =?us-ascii?Q?dqKUSCepF9fkl3o9ghyHdNhjjwpeI6BjpA9ZoR/h64lkp7l14D20WIO+H5uC?=
 =?us-ascii?Q?EtQH6bmtxM4+MDkeQfJ6Zkv6Us7o+9YzG8cUu7brgpaGMkeB7CgEYkYVkHXT?=
 =?us-ascii?Q?L3WRVNyfsG09c93qh74UD3ez1Ts2eCMhOM4nQMWnUfDzgTeiZqhdX4YuaFGS?=
 =?us-ascii?Q?3B7oTi5LzDnj5/z7lFaX1plvSX/Jdj5XwjKfsMlvye9kvfjo5eTWfUv/AI/J?=
 =?us-ascii?Q?wmoQW/ewe9QBmBofuvq/H+Ppwqmk7bXYwVYGxuJToE9OaF7X8dxrDELdYI9s?=
 =?us-ascii?Q?3/dTN/ONkhTsy7ogx6xbDYYm/AYtGuA1E6TflWXf5nmcocvitBzx+rKLmIAq?=
 =?us-ascii?Q?x/K8ik5IhDgnfQEX5+BmHaJ9hiMQZolhE3TjLT+aENLhijSXkko1KU4nbBq3?=
 =?us-ascii?Q?/V1CBhIMMrIsRtR5XzpDJwXBwpZQAodFzoJqBS9hbUw4YgwOxyYuxA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 13:44:27.3322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dab7722-34b8-4d23-5a0d-08dd986d9ae7
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6818
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217026

From: Daniel Turull <daniel.turull@ericsson.com>

When SPDX_INCLUDE_COMPILED_SOURCES is enabled, only include the
source code files that are used during compilation.

It uses debugsource information generated during do_package.

This enables an external tool to use the SPDX information to disregard
vulnerabilities that are not compiled.

As example, when used with the default config with linux-yocto, the spdx si=
ze is
reduced from 156MB to 61MB.

CC: Quentin Schulz <quentin.schulz@cherry.de>
CC: Joshua Watt <JPEWhacker@gmail.com>
CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/create-spdx-2.2.bbclass |  9 +++++
 meta/classes/spdx-common.bbclass     |  3 ++
 meta/lib/oe/spdx30_tasks.py          | 10 ++++++
 meta/lib/oe/spdx_common.py           | 49 ++++++++++++++++++++++++++++
 4 files changed, 71 insertions(+)

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
index 4caefc7673..e4959fb755 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -242,3 +242,52 @@ def fetch_data_to_uri(fd, name):
         uri =3D uri + "@" + fd.revision
=20
     return uri
+
+def is_compiled_source (filename, compiled_sources, types):
+    """
+    Check if the file, is a compiled file
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
+    sourcefile =3D d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsource=
s.list")
+    pn =3D d.getVar('PN')
+    pv =3D d.getVar('PV')
+
+    if not os.path.isfile(sourcefile):
+        bb.debug(1, "Do not have debugsources.list. Skipping")
+        return [], []
+    with open(sourcefile, 'r') as sf:
+        # We need to normalize the path to match the one in the package
+        # kernel is special case that doesn't match pn
+        # filenames are null-separated - this is an artefact of the previo=
us use
+        # of rpm's debugedit
+        sources =3D sf.readline()\
+                    .replace(f"/usr/src/debug/{pn}/","")\
+                    .replace(f"/usr/src/kernel/","")\
+                    .replace(f"/usr/src/{pn}/","")\
+                    .replace(f"{pv}/","")\
+                    .split('\0')
+    # Check extensions of files
+    types =3D []
+    for src in sources:
+        basename =3D os.path.basename(src)
+        ext =3D basename[basename.find("."):]
+        if ext not in types and len(ext)>0:
+            types.append(ext)
+    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {=
str(types)}")
+    return sources, types

