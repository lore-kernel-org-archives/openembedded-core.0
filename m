Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86847C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 12:03:29 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.6])
 by mx.groups.io with SMTP id smtpd.web10.5683.1749125006678769111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 05:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=lzZRBEtX;
 spf=pass (domain: ericsson.com, ip: 52.101.65.6, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFTOkkqQRiTzOqqw3vnTotIsV8jD6ViH6Tfgjc8INso50wZfRU4gjbhjYF0nr8uSWfndekZRC2BtcXILAGRLkR9Oc8iE7y3x7vu+AZv4Jjt2qIuiqTSDDU3lMuLgLpf1NkoPfBzSd965pq1fMrjHJta7M+0TERZQj6a1tElEw6wYh/OqouG5i/haNGPtu+EN26NqOdEaB7vyLB1H48OmHuib8ZjAUpt+5FM0cKDG95Fq74wltT9PVMXTBN2djDxsYYPl3YLbgoYU+1czo0cfelRmKC25hNQmz+OrZY60iXMZNXQXP3CkYVQ/X7HqRHiAFwaQpR4yuMyBlyTaiaBvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8FqG06UJQWGA7JQTQYrJVj+gKBjj+Z6dJdQPFnHZbg=;
 b=rNXQkApnxqoUiz9ZPhyviLPECRyxoJC3dG46WL80KPKzQP8ZwKLLnMRVcOyUoLAJQJQd9UjICc0OengZF6zHVTwt0TL0R3NFQvM0ZSCA4XuB0hc8pdHC4+eY9basZUMgHEgGu/FrohPXAuoylAHfYuKxzSg+pxCVDS7D85odU2Bjq5tgs6DV0daBLuEjpWAnOH9CvOldKMfXLZXxZpQxHas5KmPvz5wdaNYittv8xx92Apyeb4wnbSdSHcqBPI9GMGy3OnquO9mZNyV0S4rIrh4m1FMqhjZnzutkP77RKOuCvRfIXOD3hcVt3gyT/S68MHN9mpW7GfdsJ7hIuVanfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8FqG06UJQWGA7JQTQYrJVj+gKBjj+Z6dJdQPFnHZbg=;
 b=lzZRBEtXlgmhVSp4SLyPVtkepRBVjLbBQ+P4H0shsomvaJlBUe/D9/hTXFvwo9sBY56D5K0V+BB4hktNoA6ihyLtuBdThmqvBdKH4TuTqtnZCTJA2nfzfvB4JaHA0WYXN7jzO5MHdp/t2mzwRwpRlRGq1ew0TcEaleR15xdw5XTsxq1ILi5debR5qfTzXiDsZtvIXIYHee6qdfIOmWIEAhZ4J/6N90cCreFoVaKFQ7mOtp8tjaRGQM5pIlU0Wbhlsqy17S9D5ZcOKvohEh6nj072WRi2l0wSjsfnztJc3zH7arYCU5vP096bKrZ07NMuARv2ODYTxTSoiRbi0YcXTQ==
Received: from DB9PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:10:1db::29)
 by DB9PR07MB7705.eurprd07.prod.outlook.com (2603:10a6:10:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Thu, 5 Jun
 2025 12:03:23 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::ee) by DB9PR06CA0024.outlook.office365.com
 (2603:10a6:10:1db::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Thu,
 5 Jun 2025 12:03:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 12:03:23 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 5 Jun 2025 14:03:22 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 447239582F;
	Thu,  5 Jun 2025 14:03:22 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 2C2447083F54; Thu,  5 Jun 2025 14:03:22 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [PATCH v7] package: export debugsources in PKGDESTWORK as json
Date: Thu, 5 Jun 2025 14:03:06 +0200
Message-ID: <20250605120306.3692449-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|DB9PR07MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: b6063425-3bff-4e89-dbbb-08dda428f881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?79BsDbExddjzO/OVJKVLcJKaBS3YUweyxK3U39lNl5ziOCT4ePUkWQjnDqN1?=
 =?us-ascii?Q?aXd5qFnp25WkLfdGfH/2gE2lOBLLy3zo33bGIjsezHGXp+4gpzyVGUt4Epld?=
 =?us-ascii?Q?NpYh/NpEmUOJ0pn/m2okpV3bmYwrk7j9l4DjsNnJG0lFlBuKRU7SaSn6sBf3?=
 =?us-ascii?Q?btYG3fMZx7f4m9o9bHEZjTAAeJ+iPvXXM41el8OqDCjxCUyi90dv58PnXn82?=
 =?us-ascii?Q?Llma7FcK6aJE0K3TCGzTaAagmzbsn3SQPd7SAfhX1maWSe+fP2JN0g4JdGHD?=
 =?us-ascii?Q?hVR+bt382b0zyB5oYUheYmARCX09ZVg920g7qDPBJVCHO/gnYNgXNLV//lJ+?=
 =?us-ascii?Q?rBwI52jraZX9jZr8C6HjGnbSy750uMjU2rjNg3D3obCRBkr5Qsu/gZTyJceh?=
 =?us-ascii?Q?dinK+u9h4HSDwQN0TaSz1MXqacDiIVD5xQ8ezLBnwkcftZ5lMTMP3nLFmPff?=
 =?us-ascii?Q?jTtOPpHumwjtzZi+mTNqoXMSaod/6r6QCEYaqG3weBhHnh6w5U0woQjp0Yoa?=
 =?us-ascii?Q?uYvwhUJvegEFCtsXIGBk2lC5nMZB0dz6/pAbw2eUu2btJco1tX4SszBiQm1w?=
 =?us-ascii?Q?54mTDGHGh8e9KB+lQScZxwINOupaEfGRBOl+Hnb4u8h+sAieoK7zyOmI4J9C?=
 =?us-ascii?Q?HTnTVFhG5nqvq59E6n6X+h5GSVNmto6PW7y/P9qWmqwmlg3/f8JvuP5/76rE?=
 =?us-ascii?Q?62nKmVMXV9YcXHBvIa934Iy1TjRreaggxrHaOyErbDEd9q+A0mQ088M9wIHm?=
 =?us-ascii?Q?CL7j0oNKyQH5nqP8Tf6higifIs9yygdnl4DdedfoNzYPiX4ioXe/Rbydxji6?=
 =?us-ascii?Q?vYPpMIbHLqc9SYcdrXjAyGgCcp7FpN1Ow4h1UWR3YmXtexXg7P2QasBuOSeV?=
 =?us-ascii?Q?D401mn/axYEVVkEyQevr1VRLHdH4b4evRCg4yMu/BK6CzKC0Jn9t/351yRiE?=
 =?us-ascii?Q?8ewrP2i6WpU8TPA/dcW1AsRB3wvg07hvXLyhJqjd1raYx/7JqIvgwZBEfTYV?=
 =?us-ascii?Q?krueKqHok7Y3DbyvRnCZoERYJ4i8vwgud4D1KEm039b69XuyVVKdDRg/v5Mt?=
 =?us-ascii?Q?tdjPQD9+VWM12hMDqYWXk8xUGcrsSK7dHdB2oPBWfQLTBLqMF1TqpJlXk3DD?=
 =?us-ascii?Q?aTyqhyfF42wz8mfWCTXS6yFBS4FPh1xExPZMMaYayuAiTQiH7eCSc8CdiqZ7?=
 =?us-ascii?Q?JH/fIBRjxPoPWZocZtiBGhGlpQshZMQJwG+Tnuy0QfmB6nkpAjp9zC3ofXRb?=
 =?us-ascii?Q?ugJQIi9WUEA0A0zD/sX/DpQW7Cz0sMsgkXnaDC/wO3CyCEuAObvCxT4UFrpw?=
 =?us-ascii?Q?GpWANDYQVZRmS2rbrLwqTOfIt6Y3USCP0sTmvieLEjOAqcymd8ASZSAIcd+1?=
 =?us-ascii?Q?RwgIsgxRWkYTLhBtU+cSsVU89vLcEYniOyYysh7Sm5pc4NrED7bkVrm8KikP?=
 =?us-ascii?Q?SkIUVE3WklPPF0kiBCN5pkXnfZdIqSCo1Rk04aJKDn8R2GrZrJBrTJBrddaP?=
 =?us-ascii?Q?QM4DeNRSQIqhDOvFVNBiK1RTvU4rP2zjiD38?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 12:03:23.0506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6063425-3bff-4e89-dbbb-08dda428f881
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7705
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 12:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218011

From: Daniel Turull <daniel.turull@ericsson.com>

The source information used during packaging can be use from other tasks to
have more detailed information on the files used during the compilation and
improve SPDX accuracy.

Source files used during compilation are store as compressed zstd json in
pkgdata/debugsources/$PN-debugsources.json.zstd
Format:
{ binary1: [src1, src2, ...], binary2: [src1, src2, ...] }

I checked the sstate size, and it slightly increase using core-image-full-c=
mdline:
Before: 2454884 B
After: 2456860 B (+1976 B or 0,08%)

CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/conf/bitbake.conf |  2 ++
 meta/lib/oe/package.py | 46 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 13d55923b7..8c0c71d76d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -991,5 +991,7 @@ oe.sstatesig.find_sstate_manifest[vardepsexclude] =3D "=
BBEXTENDCURR BBEXTENDVARIAN
 oe.utils.get_multilib_datastore[vardepsexclude] =3D "DEFAULTTUNE_MULTILIB_=
ORIGINAL OVERRIDES"
 oe.path.format_display[vardepsexclude] =3D "TOPDIR"
 oe.utils.get_bb_number_threads[vardepsexclude] =3D "BB_NUMBER_THREADS"
+oe.package.save_debugsources_info[vardepsexclude] =3D "BB_NUMBER_THREADS"
+oe.package.read_debugsources_file[vardepsexclude] =3D "BB_NUMBER_THREADS"
 oe.packagedata.emit_pkgdata[vardepsexclude] =3D "BB_NUMBER_THREADS"
 oe.packagedata.read_subpkgdata_extended[vardepsexclude] =3D "BB_NUMBER_THR=
EADS"
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 0bcc04ea54..c5acb7d205 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1049,6 +1049,49 @@ def copydebugsources(debugsrcdir, sources, d):
             if os.path.exists(p) and not os.listdir(p):
                 os.rmdir(p)
=20
+def save_debugsources_info(debugsrcdir, sources_raw, d):
+    import json
+    import bb.compress.zstd
+    if debugsrcdir and sources_raw:
+        debugsources_file =3D d.expand("${PKGDESTWORK}/debugsources/${PN}-=
debugsources.json.zstd")
+        debugsources_dir =3D os.path.dirname(debugsources_file)
+        if not os.path.isdir(debugsources_dir):
+            bb.utils.mkdirhier(debugsources_dir)
+        bb.utils.remove(debugsources_file)
+
+        workdir =3D d.getVar("WORKDIR")
+        sdir =3D d.getVar("S")
+        pn =3D d.getVar('PN')
+        pv =3D d.getVar('PV')
+        sources_dict =3D {}
+        for file, src_files in sources_raw:
+            file_clean =3D file.replace(f"{workdir}/package/","")
+            sources_clean =3D [
+                src.replace(f"/usr/src/debug/{pn}/", "")
+                   .replace(f"{sdir}/", "")
+                   .replace(f"/usr/src/kernel/", "")
+                   .replace(f"/usr/src/{pn}/", "")
+                   .replace(f"{pn}-{pv}/", "")
+                   .replace(f"{pv}/", "")
+                for src in src_files
+                if not any(keyword in src for keyword in ("<internal>", "<=
built-in>")) and not src.endswith("/")
+            ]
+            sources_dict[file_clean] =3D sorted(sources_clean)
+        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
+        with bb.compress.zstd.open(debugsources_file, "wt", encoding=3D"ut=
f-8", num_threads=3Dnum_threads) as f:
+            json.dump(sources_dict, f, sort_keys=3DTrue)
+
+def read_debugsources_file(d):
+    import json
+    import bb.compress.zstd
+    try:
+        fn =3D d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.js=
on.zstd")
+        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
+        with bb.compress.zstd.open(fn, "rt", encoding=3D"utf-8", num_threa=
ds=3Dnum_threads) as f:
+            return json.load(f)
+    except FileNotFoundError:
+        bb.debug(1, f"File not found: {fn}")
+        return None
=20
 def process_split_and_strip_files(d):
     cpath =3D oe.cachedpath.CachedPath()
@@ -1280,6 +1323,9 @@ def process_split_and_strip_files(d):
         # Process the dv["srcdir"] if requested...
         # This copies and places the referenced sources for later debuggin=
g...
         copydebugsources(dv["srcdir"], sources, d)
+
+        # Save source info to be accessible to other tasks
+        save_debugsources_info(dv["srcdir"], results, d)
     #
     # End of debug splitting
     #

