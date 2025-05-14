Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B12C3ABCC
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 13:37:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web10.102114.1747229810110090257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 06:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=uIGmWPeR;
 spf=pass (domain: ericsson.com, ip: 40.107.20.79, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXtQO/CqoGDl1ns9XHjzHMrFBgi1C91g54FmiMHFyGh7zNpIyZM/jnXcGws7/19jas/XEAUchHq3WklixV4pW+3KOygOuaVB6NLCMFbhId78hHNmpEbV5ro5EWlvFfSsafB24Ie0L8jkP1Rvx5G3kuy2+IXq1x2cEcfZFDZYrbFCFIH5QnjHIIofksoGjqpQ4vmnGQaYH3OUeFpjD28uCjWoupanQeneK50uy3sJB5dW2rXz2ynvK3/sBbGepmYcmKBui+/xT/gassfy/pdrexQfXRYWxcuT9/O/6qC9iicHF4QDQ4VMw2o3nxc7tDzZfPKzEre5fAoubNasdAftvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4IB/tqYvKu3Z39WPDgO82mDlvjI90oO06ChSJPnuHg=;
 b=dE58jaat9oMdHJp5+rEUWLOzX26K5QXXDGxFZrpJuBXiUyWjjvTSUM+0AkOGQtZZCTgxHySmqTJivkpwBOd4HmlH9kmMSJcWlYt0RtQEo0Ur7hdgxXKspiyNkBUQGL0SZ3l+AFjRVA8l5gTykUnN5H/GtAVuKwtBm1pQ3hVulxSMv825c7jziLozO2cWOFBl9W5Oo0hbsVm1oC+EeuW7l5J8gU845cw+B55WufRSdX9lzfTcKfmfnpPOUd8J3HQ64jaJbNItt74HhBSIXPWErTdP0Lab2tsTrkE2Fv+/ZW5uYZES2zoVprdXj0oTG3ESEfogPclxJ3I1cXTZB9+pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4IB/tqYvKu3Z39WPDgO82mDlvjI90oO06ChSJPnuHg=;
 b=uIGmWPeRRb6KTGrUbpPV4+HhEA39HpUJMaqf4/w2pWShlySemE6TfcH54V7gepWtST+9qJ3ZXxl1Tri6Vx4kvqbjS+yDrBHxDdEP6po2Up1Xnbxtfux+owGO+fOBFYN+j83z9wer9AvUDwBR2H7YmkpFBm0y11nGHwSJmW1rMjrFRvVRtuKDU8p9YaJsiF7HYCpokIObAiW5m5+VpyVKu7LgQqDUUK/38c58CfJo1xbtD9ZbnJyCQn0dr/kUvu3rLEVwsedE0bmgn5Vz5QpVKfDARX97mEf3tGYGGf+ICVRhmq4q+76Br5oIaBV1fVy9+21raOjLa0btoR6JMg9ihg==
Received: from AM0PR04CA0105.eurprd04.prod.outlook.com (2603:10a6:208:be::46)
 by DB9PR07MB10052.eurprd07.prod.outlook.com (2603:10a6:10:4cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 13:36:46 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:208:be:cafe::d) by AM0PR04CA0105.outlook.office365.com
 (2603:10a6:208:be::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Wed,
 14 May 2025 13:36:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 14 May 2025 13:36:46 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:36:46 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id D66FF410F604;
	Wed, 14 May 2025 14:57:22 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id BEB8970E61C0; Wed, 14 May 2025 14:57:22 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Joshua Watt
	<JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v4 1/3] spdx: add option to include only compiled sources
Date: Wed, 14 May 2025 14:57:04 +0200
Message-ID: <20250514125706.495571-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514125706.495571-1-daniel.turull@ericsson.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B6:EE_|DB9PR07MB10052:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b32486-7815-462d-9ffa-08dd92ec5f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NsVYvs6q+ym/jpVTBTqbndnBBNiEFAZ8+ivP2dU+L7RKXV4QSb4LTbQSetDe?=
 =?us-ascii?Q?muEZURPG5QTMObVFZxy0jJI9ClJ+FZFNYtj74RfUBhghUylTzwfXkqaSE6Ii?=
 =?us-ascii?Q?T5n+xtlJy/+D/aszj8LlZM7B+kgnm086TlCUwpRz2SJH5TuC5NOQatna0SXH?=
 =?us-ascii?Q?Fjn0nFE5RyzCMrwEynaGNCUhvIcFmW7dz4z5Rn5WH+nun6WPtGidK8gJDFZU?=
 =?us-ascii?Q?DmntzfGcgHOre6HwAju6qNMuGNnMLw3FI0pqgOWmy4BtYWrKK+gvZDkNge2O?=
 =?us-ascii?Q?+ZHBcxYTp24YmaY4rNVxXM/u2k8ZNg6q5GF0mul6qJwCNbCbwABBYqoiSprl?=
 =?us-ascii?Q?1QWlkpuvEZWeCmGmYANh14ASNrcANK0Qo+oq8GY4X/Kk+Fum/FuC0KCR+F7J?=
 =?us-ascii?Q?ojWWvW2IszgKlGkux0tC/q0SMK+HwFii8fRjU+luftycnRZrOML+pBZqt8Bm?=
 =?us-ascii?Q?bj4QEWctlyzBhD0VSAmwClPkeclXJwQN/cKkT3v2BZq0VKrdGf6lCQc7npnK?=
 =?us-ascii?Q?Q+/mKcOK3JDyf8FYJuUoi5+VVFqLNt4XokoMFWuXy4onqNCpX9RvlZUgf4yl?=
 =?us-ascii?Q?tIPsm6tYmgO0HYpeUwBwu7TliwfiyukD1BlIxRbtoJ2VWIe24FIH3rTrX0P5?=
 =?us-ascii?Q?nqldRwH5SWmQoEvRp797DAEk4pckUzsh3dbJUAHIF42+41ShCfBgEPRGzQKe?=
 =?us-ascii?Q?kHv/SNUjLgM3zsYcU4XoKVlaHCqgEdCKZmhlSHHTLuw4qPAwpyFnJHh2YJ6I?=
 =?us-ascii?Q?Vv0OXjZVVCn1dJTgb4a/JTYyQVwGnnFahlNy7Au+40UpO0/wZ5iz81VcIWPH?=
 =?us-ascii?Q?9XKyPnqXZSqG8ym1WJOFR//KPzn7luDUZvpgqXZpeTVEhA+T2f2w0YB0Hiw5?=
 =?us-ascii?Q?HmouZFOfVgSVFd69+qNjbHNJ/RWrWRUsLchm1LwRU6aJ7/BlSOUT/m3g5qjc?=
 =?us-ascii?Q?GFRfEhj+mDPFQ+XZpgE/88J8sMk9Q+g5PHuDFZfw7AMzhPzOCGotlR8OGv03?=
 =?us-ascii?Q?iH1fh68qE8Y4n/K4n/piZpT1Qc+2V/2+zdFqMRJLzPdmKSFUYPPWKVScabkj?=
 =?us-ascii?Q?hPEZC3kGQpCS9muy13q5t1v0d4SAOYh7JlhViswGyY5jPvzk1rCR3kCKxZnf?=
 =?us-ascii?Q?FG9a1gfDF+i9ctyUTAq/sGaN4oEBu/7gZF+EWrboA45/acOoG9SczfwkeVxm?=
 =?us-ascii?Q?/fzfr+0i2Susv1kX7PFhuroORMKXxNxzybzzTZmwxVnpn26yDiaEfiDmTFuz?=
 =?us-ascii?Q?5rGjMI4aUd3K2l01a8vCI5TPvR1yd2M3A4dfv0vGhGI2dcsqI6/fsjIW+gc6?=
 =?us-ascii?Q?u4FaNk7YLZx2kHuVYGYoxKVMFTNcq9ugKr+53do3qdZUC3RcIeQH2VedxW5q?=
 =?us-ascii?Q?+AeaYHo3eDClplEpV/QLbANHdUCRrdEzpazRX+sJLz/Y4Zy7M2FSfPyz2J/e?=
 =?us-ascii?Q?jUcvbV+f1OnOOewdGJ7ZURWLw14dWrWDeFAvV/coJaZF7FpikIVTYg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:36:46.7389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b32486-7815-462d-9ffa-08dd92ec5f78
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB10052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 13:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216493

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

