Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7241ECCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 07:14:00 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.57])
 by mx.groups.io with SMTP id smtpd.web10.14522.1761203636297564418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 00:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=jlUpL5i4;
 spf=pass (domain: ericsson.com, ip: 52.101.65.57, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQU2EEhHh82tMYPF6ScPJBDhX1nUumcurWUSua3oHTAU0rAR/xnQBNAKLLUAZXeys2UmUCVvNYAYEibo9OmGAu7qO4e7QLQCibrnfn5QYRfoU88fCovdIQX//pma7tqBRLoF8oYTmeiL94Cel+4UBsHdwB9x3f8KRixcIPzHBIuFFhjG3Xm48T3plcIR4Hn52eIkC3gUiQFpEm+5Kj9MlDy0s2MvwVGIDJ5QbjI5YfzIuHbz+zDVvBOrIt48zNjaOWMFVMAmdrmu+TIJlFpMh+4/6SlluGH0r2dtvcXjsXLnqpEqsdhpp1iuMG/jsvTW6naBxmvoSDcTiSi57/DSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmQNGPuCkK9I4mNT7G4DqtOs/m/W5Cd6nbFuhqEc/sU=;
 b=qP5adBJTl6NI1usYg4SM/gtBMljdHRmGgHtvF8wdUJJTWWIqlgHS7eiBdMTO4hgcGE0BlgfJUgAsYND7qQ8nQ2goFMLZ/jR8ciBiA1yOCM/Ud4WiYwovz+1py27t7hcyeSiK2yr+Nh5QZPAHq4sQYR+ljL0dC9uo46mzNPqQb92biOedBdlI+9XlrXzVDzM/fipqJokR3jxq6wP7Gio37gAbS4eZNzaux+coBAe294eer0n2KgYFM2u3m7vrRoI12LQLOeYhMPsJUZW9ryVJ7xnwlGMlQCMrXGCS148w0NhDFvndcQMSIKVIKDyuQVWIXb0yYV7S+xz7FP0BPnlrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmQNGPuCkK9I4mNT7G4DqtOs/m/W5Cd6nbFuhqEc/sU=;
 b=jlUpL5i4mFl1qCqURjg43LRj72NVMm8T+vC4jAiP9qMEoWUzheXzymCO2YjK4k7ptgEW3pqU3dK6LNOVKurkZxDXfAREKErMmCb0pTqO7v9nIA/+V1pRBxtFVGcyztMYU7gD6h7pzeoKzwjt3OE3TeXZ3QYdE+/pM+QHTXj8gDQ6PwcgzK7eqW7sl9jX3iNmnmtnBkVeSTbhi8yaOTq0uAfOffqY2c+erxEvZhEnvrmL6pI3SG529CdsJBrtx0sRsGP3Bhze/Ddn65Z/7/8014+6dxw2NWUtWqN8+AEdrMf8N25W5bQG37EJvpSqG8zLwT6pTFkihCWcnljTbMp/Gw==
Received: from DU7P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::33)
 by AS2PR07MB9053.eurprd07.prod.outlook.com (2603:10a6:20b:544::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 07:13:52 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::ec) by DU7P251CA0003.outlook.office365.com
 (2603:10a6:10:551::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 07:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 07:13:52 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 23 Oct 2025 09:13:52 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id D95ED95152;
	Thu, 23 Oct 2025 09:13:51 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id BD8F3700CF09; Thu, 23 Oct 2025 09:13:51 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] improve_kernel_cve_report: add option to read debugsources.zstd
Date: Thu, 23 Oct 2025 09:13:39 +0200
Message-ID: <20251023071339.1777212-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9A:EE_|AS2PR07MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d4b9f3-a0c4-4c66-6a76-08de1203b8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SLv9MjMII0owi7Pca10/s9UImTO7FiAEApB8nDSi2rEex6vU9ub3vpT5spku?=
 =?us-ascii?Q?P6lSj4XD03/7f0qv/oqfZKNNFBpSJ7ybn3nqb8mnDu6HmKgSsDJkAVo7V6CE?=
 =?us-ascii?Q?KY9mi+61NlUobapt1VH7SBPp2C5+oA+kpIc3fKq0VRpd40dsg/wnbOD5rGct?=
 =?us-ascii?Q?mIJl4GaLOEXOZCzpj1uPW9LjtQ2DvG4OdJNTM4McvtQpY1z6Z3kjgO3v7ThO?=
 =?us-ascii?Q?SVGBQRMK2yKlwJ5NdfjFn1aa17TdfPDENKdHCSOtYNYHDC6CTeKyzd1emq3o?=
 =?us-ascii?Q?7H6DMH2VDEoIBYXBGUxzumRuub/w2rXUJmlbHLnnIjxPYc45J6YTg/sbGKBW?=
 =?us-ascii?Q?Flg0dCJnxllXfGovgd0JUXgdf1yIncTvXZ1EkCTyYZPgM2+tXA1j8y+ET21A?=
 =?us-ascii?Q?hlMyEiekovDTTCrzjBU9jewI/kaf4rpz7foY4XuhqLJPTLsmpAszRu45iXTt?=
 =?us-ascii?Q?obeaG3R9eqxjGNF9kCQF+lgI/VPnSn4lPpRck0RVKI8giHEM6aDJj2moTeJT?=
 =?us-ascii?Q?28f+s97crLjj4kkNvLB3M+mcEF2Xs7cVcvs6u76WgmKQ49bnegnWUNVfaj7T?=
 =?us-ascii?Q?x7lFY23ZMKJSgxcTIHkM1zhXqdtozMwpxVzz5Oqu8foW7gGxKEUpua2S24/I?=
 =?us-ascii?Q?YOp4KIgtWt420scT100y9fw5H5gKMJBt6TXMNcA+MGD6DFXdbh4OYB4uEy8x?=
 =?us-ascii?Q?mgEnWsYBF02XsmkNDoC7X596IVCV6mtksCDUA85zh2oXmyiLnRmTU7Rmkoeb?=
 =?us-ascii?Q?0MRpw05Rw+D881wUL5JZgO7O1dpwI1IxlCN8upeOcUCKQ7aTEndk/M5PmWwg?=
 =?us-ascii?Q?BhmrO1O+YnYm/tQTl1LdFO8Q3K2S9hjPhrSvzaCiay0q46FNFvdOoW5+65jl?=
 =?us-ascii?Q?c0wmU5S/mqlo+kv3g/N5g6yNcm4CiHcAWJ4bBbs9EJZCxRkcib+92u2fldRG?=
 =?us-ascii?Q?T3nfu3BsAK1j3TxuXm+Kw2IQLvsexCOf75NuD/oBs/xXakvli/cYkNpjLhvD?=
 =?us-ascii?Q?AI8G42d54gMSh8QXYcHRI3NsnQ2jg2icIVgRjmChktMZdwgT+yGp6/9AX/uD?=
 =?us-ascii?Q?kru9Vq44yIhUfrwekheT232NZvSscjh0Mv7VxgagiJYYXseTWDuWg0UZW5iM?=
 =?us-ascii?Q?css8gP3C+951lL+lyfqYYfzJRlY8uDN55dfcBSklBox260JPatDIwNrzpyvq?=
 =?us-ascii?Q?Dqwu5JyQHkW52UQPKFAqwAml4U8VxuACmT8yc2BlJ3DW4m2qe1qlM+itIgef?=
 =?us-ascii?Q?E49epUe6njUVCGLLxPpT3oLQ2mmHs8DF9WVKLfIjvAyZ87KF2Lbawg1o0fcf?=
 =?us-ascii?Q?lCdNMkDziSyleyzOV9d+2gAf/q1UyHEuW9KNXfi5baBXsUeek4Q292d8cwpQ?=
 =?us-ascii?Q?WnwHO3mkC//27jg8w9VpZ5N0Z2y3GlskHaxkvoFM7gwOKUftx+4gjnEtYc8F?=
 =?us-ascii?Q?Hyt6BUtC9ZIoT2WRsFKVGxDmUGoDSgowLG4f0wWbPjeKCZ8TbZtMF6K1nbDA?=
 =?us-ascii?Q?7REH3igEyNB9h+VjHhZMuXmPhpCf5Z+KC4AM1mBxkW2Ufd9n2t6L2Hwcukb7?=
 =?us-ascii?Q?KZJEI/++1g/DGOKgFJo=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 07:13:52.5177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d4b9f3-a0c4-4c66-6a76-08de1203b8b2
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 07:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225218

From: Daniel Turull <daniel.turull@ericsson.com>

Adding option to be able to import debugsources.zstd directly.
The linux-yocto-debugsources.zstd is generated in every build and
does not require any additional configuration.

In contrast, SPDX_INCLUDE_COMPILED_SOURCES needs to be explicitly
added and increases build time.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
index 5c39df05a5..3a15b1ed26 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -236,6 +236,26 @@ def read_spdx3(spdx):
             cfiles.add(filename)
     return cfiles
=20
+def read_debugsources(file_path):
+    '''
+    Read zstd file from pkgdata to extract sources
+    '''
+    import zstandard as zstd
+    import itertools
+    # Decompress the .zst file
+    cfiles =3D set()
+    with open(file_path, 'rb') as fh:
+        dctx =3D zstd.ZstdDecompressor()
+        with dctx.stream_reader(fh) as reader:
+            decompressed_bytes =3D reader.read()
+            json_data =3D json.loads(decompressed_bytes)
+            # We need to remove one level from the debug sources
+            for source_list in json_data.values():
+                for source in source_list:
+                    src =3D source.split("/",1)[1]
+                    cfiles.add(src)
+    return cfiles
+
 def check_kernel_compiled_files(compiled_files, cve_info):
     """
     Return if a CVE affected us depending on compiled files
@@ -372,6 +392,10 @@ def main():
         "--spdx",
         help=3D"SPDX2/3 for the kernel. Needs to include compiled sources"=
,
     )
+    parser.add_argument(
+        "--debug-sources-file",
+        help=3D"Debug sources zstd file generated from Yocto",
+    )
     parser.add_argument(
         "--datadir",
         type=3Dpathlib.Path,
@@ -415,6 +439,9 @@ def main():
     if args.spdx:
         compiled_files =3D read_spdx(args.spdx)
         logging.info("Total compiled files %d", len(compiled_files))
+    if args.debug_sources_file:
+        compiled_files =3D read_debugsources(args.debug_sources_file)
+        logging.info("Total compiled files %d", len(compiled_files))
=20
     if args.old_cve_report:
         with open(args.old_cve_report, encoding=3D'ISO-8859-1') as f:

