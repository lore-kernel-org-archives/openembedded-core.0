Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC16C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:22:01 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.26])
 by mx.groups.io with SMTP id smtpd.web11.14200.1749036112002160466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=ctU6pPLu;
 spf=pass (domain: ericsson.com, ip: 52.101.66.26, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJvwYxblZ1bxhp7YI86LxE/Cuk+QN6K9NFBSBlP4FKj7ZMb0HuD5tUgZYrJVi2GvmjqpZ6rEeCzyTwjSLTl441dl++xQL7S/+N6usYpa3IrzSVDN6DlIG4+wJHa1ixi40cQYX4TZRDFoRu4ne6vuc3cqe+sWr5g3saXn7U8d2ZQpPv+frvW2PckE8wkSEVoAyNf3FD4LdjtcpHPsiGfhIuu+kaGWSr4YcQOycN+7OJJFX1kwfrtn6A8x1cyg2++5DB1zKL/4PanTyi0je87onZelt+H0TCPbLngT3fDiGUxplxiL7pFKFd78ijST+W5nO9DL2IK1DDTwckKk4fpZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnSW74qMcBydtWb7+i5K+VeqYjIm2JbO3YMLAQgAbdA=;
 b=snQzB4lgmuYEmriJTun22RCTjpTSrpbbHk6QkxcSGJ1tewLVGcOe0iGLDWMngisfczzi8L8jI0yCYvEi65i+OM9Idvcw+IdN89TBc91jgSyYush0FApcXOpZHWFPAuQKrEQ5nIMV2mUw7eoxTvOIc1Cy885fkzAuhxWRXmwkYxgzwxueYGzv5AtNHDpavZvTWE2rctm2Z48/604zLNbaIXD0HorQ33UcUckd/tYArq+osVUbsZwJbOpPkh6yxBPILH2APedjjmtvLAQa1Jue8bSsgAiuc5yF9PPEHCzXWCKv13TLzAFPxmzUIDCHDwMgnKPjhB+uqjq8HtyZUFZ7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnSW74qMcBydtWb7+i5K+VeqYjIm2JbO3YMLAQgAbdA=;
 b=ctU6pPLuml4Vbcdn8Gyz8Z08tSIo4N3SZfcmS5r/P8n5AMJUhSigJWhVkBe3fzLRnKVJiGikbQcT6PDIvEFkxsCR7wAvkiL5QEGvrl2FuAkiA4t6Y18qCIZE39UbSBM0NCYkWq4YgwnYlZzt99arYdtu7wekiRo+WmMaREK27JcOve4pbmfrI/X5xPMh8vNdokVQPWFpNTgFH/DUnduSfHnLPgsFm/vXgortNe/O2en5f9ax5RSb7+22gQ1rk7QQiPCQmdebn9JotoTzA4zYP5kYVTTyIblNMcXVoudHQiaj7mN4CNsG1Fc5qh3+JWQbputAcwFAKtGphrP7Dg0nEw==
Received: from DUZPR01CA0276.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::25) by PAWPR07MB10045.eurprd07.prod.outlook.com
 (2603:10a6:102:38e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 11:21:48 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::14) by DUZPR01CA0276.outlook.office365.com
 (2603:10a6:10:4b9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.32 via Frontend Transport; Wed,
 4 Jun 2025 11:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 11:21:48 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 4 Jun 2025 13:21:47 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 3AD5695145;
	Wed,  4 Jun 2025 13:21:47 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 209B17083F54; Wed,  4 Jun 2025 13:21:47 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [PATCH v6 1/3] package: export debugsources in PKGDESTWORK as json
Date: Wed, 4 Jun 2025 13:21:31 +0200
Message-ID: <20250604112133.2581063-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604112133.2581063-1-daniel.turull@ericsson.com>
References: <20250604112133.2581063-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009526:EE_|PAWPR07MB10045:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1eefa4-26fb-4c7a-0c0e-08dda359fef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zgDeN4Hq6YUcokNY74pUb3w5Hn/3GB8OXfLajDfp3oaekikpe/uXvw9N8hsi?=
 =?us-ascii?Q?fkFwrcT+3psYyRJXZR8W/5+1YcXAHeBrosLeL8rO0ie+QYWW5il56YHMOuBp?=
 =?us-ascii?Q?qNj/6hb9UC78vC9G3JfQdOhe8VwFligdORiFAjV9KnHBux1ZOc5SOs3zG51j?=
 =?us-ascii?Q?kRTkIk4TH9RQol1+cGGKomVh8UCl/TzBrE/c87tQR+aYPAr6wRb0NLqs/lMF?=
 =?us-ascii?Q?hhUgrBqWQmTzjIXxDtlr62kWpgCjNnzJfPOnVTTrU/GoXaZddkfR1SQ+wH4v?=
 =?us-ascii?Q?3Pby6kMR286FQdVf0tm944x/RsxzzUFXdJNVMMb7h3MnDUrMhQT8xDjZUKdW?=
 =?us-ascii?Q?hZxCxIB+N3CoS7QSl/ahGbP0JcRjempeF0Av06Fck33O+EIq4natF5SfEwa2?=
 =?us-ascii?Q?XEa6dshY8lS2fxSv2v0V1AvRuQFdZxdjw+1uv1sohP9ZDgJgBtNUw7/sn8IB?=
 =?us-ascii?Q?YnNjPM/b1fiFQFVG3CiF//dcqEKMjMQ1DPD3kDwk753dr/MiVtWh1UTBgzdn?=
 =?us-ascii?Q?RRDKHVH7rbO2Lq0DOgIlEQq10J0kbAYmOWHXNH7lHmB0s/3WP4tmg2EiVFcj?=
 =?us-ascii?Q?aLVmP80Hcr205KQ6+8cbAYoQXwAKKL52HnKxeV06Ztkx4iouPF/HdU7Elam9?=
 =?us-ascii?Q?CP/KqLB4Klqr4SiDX57V7NXaUndA1IS0Pq1mJ4UdVUILsucSg3WBzc+s+nG5?=
 =?us-ascii?Q?FJ3PQ4Pf2p8jpNTweFhhNNVaZDQF+vkev1bKZNGau1aHTvEADNq+R/AAWUc3?=
 =?us-ascii?Q?OKzTmRboS5oKLxXfr/HwKtZqdmFXwfXQArbrKxAeLbpfklvMgy1nd0NM3o+C?=
 =?us-ascii?Q?Mw1Rlwx3014d1orSmWmQ9mq5N6oz8ZezZx2A4HEcrOXkR+oSKfJaTIzRPEG/?=
 =?us-ascii?Q?1o903qusBCNn20ceab8ovjvNxCf2uPt0nhC0TC458eQ/oGgOKwC9Mc9tYCNp?=
 =?us-ascii?Q?BkMOKxP8NPwpTdDo1t1HmaIE2SB2T4B9Mqm6hFPifibDZXHlWoFAzBdF11p1?=
 =?us-ascii?Q?V5LJRRQc5aoxIUhpOlS0qZwqRUTYuzhapPm7gjlh6clt0w+9TeMBIGntXbV1?=
 =?us-ascii?Q?ktcPDhzrFcvdxGDFchhwQxKUyTlO5GZkhLT1irXFCXU/dmVbUARS55RDyf5Z?=
 =?us-ascii?Q?ReRcIh7O1u0jDFEvZirFsDKV84m63MgapZ5P0gSbVkvJDF2ZatPn0ZOoMYfv?=
 =?us-ascii?Q?pt1FYXQVH6NBFBJJ/BlRg5RziMBYBxYC/HFOA7oSLYKfiyAnxQ84G5V7MUYc?=
 =?us-ascii?Q?EhFsVMLsDF+yYJfpPlM9Vd9kRADsViHRjDtSw0Mg2V8WyeVil2LCnzanELCD?=
 =?us-ascii?Q?+NXai9MxudRS4WFMgcs9fmCgq28PIyXSKg0cMP0JkigisDIwFrJqQ3X4Tt/X?=
 =?us-ascii?Q?MiQCHfcwe5J+pVoqiWBhTBtjx5UyHfgwOb4/qTSBqm/UXUtmSEjSoTqUXZ3m?=
 =?us-ascii?Q?Wyd4y4jrm/tbMMbMdnNifem21kR92fkarhHOUsA/yVU7syZfh8VWKYUqcJzW?=
 =?us-ascii?Q?D0CHGIKGGwmrimU+NgBFZVu7D79cOOu+lkxW?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 11:21:48.0221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1eefa4-26fb-4c7a-0c0e-08dda359fef1
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB10045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217908

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
 meta/lib/oe/package.py | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

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

