Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA14C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 08:48:03 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.0])
 by mx.groups.io with SMTP id smtpd.web10.10047.1750322875941739108
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 01:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=RxUFcioe;
 spf=pass (domain: ericsson.com, ip: 40.107.130.0, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZecj2oslq8CBWYc9U2d9hHzpqBPBHqyT/DFYmzhElH0+tSBx948b0Ub9qYiEBqDWXxxTyBoIRFruxs9wrEUf4sXFx81w9XKxNehcG5dVklyKiTkx/DxsAiCx2Mz9xEtycptfpweLro7CFI1THh62gWQbgUKAIlb4LTp8GWKBfcrlfT4pqAPDEuoQpCXcXf1pEdg6cuy568UDn+YOJhCORH2t+AbXMQJHwBaD0R6HNSrdmk8UeukA2BkPd8UCt4HowHBr9TnVvpNLHIzjKPHD69MF1oITUOyiVtNEB5uyqL7FbIK/ZcazUENY5hBGK/IM5Zum7P7UcK6+q2ozPoNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8DlDBCMbw4BPWdXEDBP7Y6YY/junut6TKL0qg+bQ4I=;
 b=DzZetwLcLUkrh7mUnVc6P/SiJLjg+7LCBD+Kb2hqddhP4zTdKE04udZvrOtoNM5fDzgJdKWMYkSd5tAqfugN2eMlTgxldOSPQ+amxePDNmSQLS38Iu5fmy6C5CDmiZgApsHD7HXqyeSeu4l7UV6+lvwantjxP65vWY4U9jhpSWvAuB2U/cDm72fjhjgm1lPjdT3lDhMh4mEcXsDGPDS7cjn0v3hpRU+VqJUmwRWFjrdXwyz87YKgCrmwv0eZBtm6LVEKemXPIz+YKZwHyFWg8GrRp8zlMXNYu0zau4J7Knz3+9tZpI7WCn6/JnncGwhYOSEgSmu+02CRK30S25e0Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8DlDBCMbw4BPWdXEDBP7Y6YY/junut6TKL0qg+bQ4I=;
 b=RxUFcioeg9l3IcOBbP54VNYSwbS8Hhv8L3hV445oFMptcRgiZzXDsxtxDU8VjpTaHsAHdBmZMXHoVP1Su1sW8zxynSd6yKtr5fHswYcik1gYeYm+TnkfQw2PpsR/6c/qxZsepnMCOiJMxmjEhfG4mcaUneTXvmVHjExKT1sQxOHnM/3XjYaW7Md0Osc+T4zlNXhNbymUgtoW1yhDUHqcxU5NPtd9WIuLzUaS/MTPyLamU3+QVXRwTCTIYvAd7vuEaRFDBZmfHdaTY+3o4uFB1VrpwuoOMIqx2tX80Z31GUB4uLRbVZJvrD8gvQgACMvOWuBGrWJSZZCVdl6l/T9k/w==
Received: from PAZP264CA0158.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::18)
 by VI1PR0701MB6959.eurprd07.prod.outlook.com (2603:10a6:800:194::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 08:47:52 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:1f9:cafe::4) by PAZP264CA0158.outlook.office365.com
 (2603:10a6:102:1f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Thu,
 19 Jun 2025 08:47:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.0 via Frontend Transport; Thu, 19 Jun 2025 08:47:52 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 19 Jun 2025 10:47:51 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 90D694020A8A;
	Thu, 19 Jun 2025 10:47:51 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 78DE37083F54; Thu, 19 Jun 2025 10:47:51 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Joshua Watt <JPEWhacker@gmail.com>
Subject: [scarthgap][PATCH 2/2] spdx: add option to include only compiled sources
Date: Thu, 19 Jun 2025 10:47:36 +0200
Message-ID: <20250619084736.1940747-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20250619084736.1940747-1-daniel.turull@ericsson.com>
References: <20250619084736.1940747-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|VI1PR0701MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 757b7455-c601-432f-2f41-08ddaf0dfa38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Aou6R3vg9Ap+B0F/G0fYD03Zwp3aTuKndLipThNGmmFEUzyycm8Ac1PDUY0z?=
 =?us-ascii?Q?SEv4jpEGQh80wOE/sbNe8UDg0HcNYKFURZpQdMWKhGbvJ0QLZK/MV0GZEZrR?=
 =?us-ascii?Q?JrmSwDEoEhqMRBRKeHGdpXPMXfL7/ImzLUCxQnUKCYZb6ryTSeYn9j2gGW+Y?=
 =?us-ascii?Q?k7rE/ZwmAcAX93omCcwfvD5W9PteoWt9DW+xPtKvbYtRMaEnjL6+ZczZFFLn?=
 =?us-ascii?Q?vopKToOH0PD5rIEbM1EIi9XuHC4E8EtI1vcpC8AT8Ib2RFdzTEGRjrRgAULy?=
 =?us-ascii?Q?uOPMklH0GQuPOXXTp3cgTIvlYEXy01ShLejHq6ToRf+Qv3lvPoxeEFLEcF7J?=
 =?us-ascii?Q?y+D/I+RU3zg8DH0q3vpUgggkZsRZfVRI8n2I0EhSEEz5mcKjcbrtci+aG26T?=
 =?us-ascii?Q?ZkrOdx/vfoQCMrn4qZw/ZJzuaXkO2JC69FfT7L+7xJ0sU71YUDHMSvbiu5bu?=
 =?us-ascii?Q?AAQkn1gXKFjAtAknzCcOZ823sj4AO50FJa16QBJCNUF2SStC9Zod4/yOQ0bP?=
 =?us-ascii?Q?TT/NDkFO8rr5KFDEIXhDQBSDtPuU/QBvIzkPRR5zGGRnQm6ijMu+EXyljBkz?=
 =?us-ascii?Q?d/S0cv+H1/MrqSsKjRL+YsItaZE1laHY6+ANHmfxMAwab+Orghr5J30zbHFq?=
 =?us-ascii?Q?w0QoVqnqXUMfV1ASLkLZgNNsGaLUTAmvKytUptQy46dKe1R/RN2JiN+zKbGD?=
 =?us-ascii?Q?nd/y+UPrOWBfoxkjkd/Y5YYls2edpBeGYWR3BVnu5hr+Du8e1yMTk3eAR1Tk?=
 =?us-ascii?Q?KZW4mO1cE6P+q6OodnBd65RUmx+Siq/zxD9xsDhLojI5nzAJEthxTnnFD55j?=
 =?us-ascii?Q?jDPU16LmTSZX3p7Y8AFYWwYPG3EPD8rnOrtBaRk9WZ+8x4FsmbUI5PgAZ7AK?=
 =?us-ascii?Q?z+T85TsaTZC2lZndxDu40UPUZ0AWovkJWz2IMTc6INYialDd9ZCek8KCRyxO?=
 =?us-ascii?Q?onWKxmaTA5rjWOdU5Wvd0rSBcxIYrZyhpwoUe5jxEzWOUjTLO4qfH1XXH5zX?=
 =?us-ascii?Q?+wZqD1wv/d4qf3rdO/ZDGHmOX43wBe4hcy0UKBloG14Twb3dYNvrLMuML0zP?=
 =?us-ascii?Q?Fac/am8atm807KYGz9TCFjMv0R9OaFpNtosFtUvqiQ5kIKlSuaTeD7SGDeKP?=
 =?us-ascii?Q?C5bwFNMMlycwihOL1BeSV5n+jv84kQRglGsr1KtyenmVTz+2ZkV3KxiU14oG?=
 =?us-ascii?Q?T8UBMfhIpDhYO4hbKWIELQaIX8za5duipIuhuhlCysyP7iQ1IGU5C8knr8Z0?=
 =?us-ascii?Q?LcbuEx15cLRj5ztLOqz2OgZuAxcrueVsciy2B0jUjxXrRT9Qo7yJhWALxc61?=
 =?us-ascii?Q?RbHnwhb0VlCXachzzfLamBwcl8QASRhfga2NifgzWd04l8FezEEbIZkl9WS5?=
 =?us-ascii?Q?9tjHKwgNaOdlF6QFxHGB4Co4l7qG3eQilsSLmJ1WaQxY7ZILY9bQFKodYzHb?=
 =?us-ascii?Q?/nrkgk+JUlAO5OEQvS2a+Ywk4/6kdySewmlHOY4xUlATIzvNB2+T4lamonH/?=
 =?us-ascii?Q?gHF+j8IWTtXY79g+kwj15wB5b2+E/wu20r+Z?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:47:52.3316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 757b7455-c601-432f-2f41-08ddaf0dfa38
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6959
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 08:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219059

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

(From OE-Core rev: c6a2f1fca76fae4c3ea471a0c63d0b453beea968)
Adapted to existing files for create-spdx-2.2

CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/create-spdx-2.2.bbclass | 12 ++++++++
 meta/lib/oe/spdx.py                  | 42 ++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index ade1a04be3..1fc11ad7ac 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -100,6 +100,9 @@ python() {
         # Transform the license array to a dictionary
         data["licenses"] =3D {l["licenseId"]: l for l in data["licenses"]}
         d.setVar("SPDX_LICENSE_DATA", data)
+
+    if d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =3D=3D "1":
+        d.setVar("SPDX_INCLUDE_SOURCES", "1")
 }
=20
 def convert_license_to_spdx(lic, document, d, existing=3D{}):
@@ -215,6 +218,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_sp=
dxid, get_types, *, archiv
     spdx_files =3D []
=20
     file_counter =3D 1
+
+    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =
=3D=3D "1"
+    if check_compiled_sources:
+        compiled_sources, types =3D oe.spdx.get_compiled_sources(d)
+        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
     for subdir, dirs, files in os.walk(topdir):
         dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
         if subdir =3D=3D str(topdir):
@@ -225,6 +233,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_sp=
dxid, get_types, *, archiv
             filename =3D str(filepath.relative_to(topdir))
=20
             if not filepath.is_symlink() and filepath.is_file():
+                # Check if file is compiled
+                if check_compiled_sources:
+                     if not oe.spdx.is_compiled_source(filename, compiled_=
sources, types):
+                          continue
                 spdx_file =3D oe.spdx.SPDXFile()
                 spdx_file.SPDXID =3D get_spdxid(file_counter)
                 for t in get_types(filepath):
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 7aaf2af5ed..92dcd2da05 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -355,3 +355,45 @@ class SPDXDocument(SPDXObject):
             if r.spdxDocument =3D=3D namespace:
                 return r
         return None
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
+    import oe.package
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

