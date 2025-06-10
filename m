Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A092DC5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:25:07 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.43])
 by mx.groups.io with SMTP id smtpd.web10.90071.1749569101566887176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 08:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=GbEb43aA;
 spf=pass (domain: ericsson.com, ip: 52.101.70.43, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDIUOVqkRekYknEJVGDfoVBr9TWD3g1IyfPR/k+0PdLoJ6oRWHLq5eYrUvLCsl/SyT4tB2pXMr2u57qVjmy9cvZe9ltiXiHPn5fetGpVza2ndk8KFGHvlAIcuCWC8c6H9K7+nmQIAem1XH9Aac+F3zmHPWJHGCptwfJQe1y20xr75dbiqS5lOCg/HYONFqXyru04aF5npFFhtjsZvIfqof0AauYvMti2wMfVllTHAHqO5sh/88iNl+644h9E7froApNUszRM1HqgH8k6b6kDQqyRwueOVBYY8rdO6RsllYxdnMmRT2GT06f+QQzxzfRQW2mLPjGklI+rD7gWe8frHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+zoS5voh8VglqTZUBbHWHFTT1YpUTgu6da4JaPhqao=;
 b=IwQ20S/cgxqbK/L3WISIuTwam0v/w4g0NJg7Pk23lymvj4SSJvuoK4n+ZR6O4woP6ymzCbERSRVMkZijSC4oOySxql7LOSspSeNOPqfysBWH0SpT/dL7pf7HZABSjS2a0pOf422GkualCtoOFqpfrylcMTOgfNs/K42+BOrOMigYcRtyn8Gy5tP8lkNAoybUF3EtuzpufRBJgOaKb5HcSszt9HKFo3vBm3zrAjzzND5JY75En7evxW1sTcjQdElmtsR6hW+rYY1I2yCSgj5RwO+7uyxIDRzMLeW7g1NxKTacIsJxX1BBA7Z+rl2FYCKjBwbRaEnDnwAaygZ2f1JOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+zoS5voh8VglqTZUBbHWHFTT1YpUTgu6da4JaPhqao=;
 b=GbEb43aAkreFj7QNH6UwiAKrbeGAAa0IPdnJkVc87UoDwPPHc8IOVBR4oNGZBou+DdQqrEawkMcLpxleANNxZ3Mqt6Xdq2769Gj+gfMBY/ePk5J6/cxFzUrYzDmoXPyNAJYYKM18O2lAfmtz6xeev64PScyBS168BTq22yjghtg4NmU1deKGChN790vQfsLnIlUaSINqrB+FCXuAc4w9fMxBBKkt9xivtQG8VPtHFc3hFjJ62v1p3wvzlyf7Td0enzYzle5BFYUvcRag9++jVwG4BHTX8YHqPspUqyXdR1eqqIVOkZaGS7paXy7TcpBx7N77hfr6i4FeqEOF82kqnQ==
Received: from AS4P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::8)
 by AM9PR07MB7203.eurprd07.prod.outlook.com (2603:10a6:20b:2ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 15:24:57 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::6f) by AS4P189CA0016.outlook.office365.com
 (2603:10a6:20b:5db::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
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
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 15:24:56 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 10 Jun 2025 17:24:56 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 127964020B6A;
	Tue, 10 Jun 2025 17:24:56 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E89717083F55; Tue, 10 Jun 2025 17:24:55 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [PATCH v8 1/3] package: export debugsources in PKGDESTWORK as json
Date: Tue, 10 Jun 2025 17:24:41 +0200
Message-ID: <20250610152443.2162164-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610152443.2162164-1-daniel.turull@ericsson.com>
References: <20250610152443.2162164-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|AM9PR07MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc504f1-8aa9-4740-4e1e-08dda832f4f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3IJdPGMKgMksBCgbtOYx0U4AuwoKwL8IHEY4oJWWkEH38VaR74K4Q/xYHQ7D?=
 =?us-ascii?Q?VV7EAnvPcrrOuCXBC+llTepbRuygqeJFFoiYVFgTsAbvAmqugR75Ih8mij2w?=
 =?us-ascii?Q?e6msFQ+uXVm+hs7MD//vRMvBtg+Gjb+rFKaQssiGz4Qp+w/KSRN7LyLWgmq8?=
 =?us-ascii?Q?WA5hlWLWo1fu/W/YAyXT8xctTWJJ8E0I26M5IjrlvpK9PG6UOC0pKNcuv0pS?=
 =?us-ascii?Q?RJxbrIB+ce4VM8XO/ghoPv8+n1aAlK/zD/jWYkcd3M29SZQM7itlQKamw0p0?=
 =?us-ascii?Q?oSp0IzryZh4TJ2lqg7TaBps//0kbGjKH+egklwKp062k7dTpA4ZAihya+Y28?=
 =?us-ascii?Q?X6ium068y4D0PuFvDPp3bBXEpqkXLYzeNUfc6/rcleuKEumYWi5gNNqjMF3d?=
 =?us-ascii?Q?ECRis8p0AsDQ1fD21RlLwv/Fu9a3AxCWIv56EzXAHtDed2rrhZlJ3oofgLKM?=
 =?us-ascii?Q?68mvFfTcPZ4G81v1+DjR4/USELXLWN9tMZ75tDJZMDltCzup6UxPwmZDmVeX?=
 =?us-ascii?Q?fGqK6j5V6xueaQXkZEFUB9+iDYPxpIoPY5D0n8BPVN4zb/MkJaKEABV+wyE/?=
 =?us-ascii?Q?sffQcZlOcY5U1/zi1ZfqAQBmfqZg0eZ8MfxplNbhb4lWTGp+CxijqL8W4u8v?=
 =?us-ascii?Q?c98YIpfXdscF7CoDrz6Isuhucz9Xg8tIn498RIb1MmJGVCVgjtjQ4tX82tWA?=
 =?us-ascii?Q?d/hgDQBPgdlxHDJ6K5Zh30MtAks50wyk9UFtNyrTlSQ2mtjOPXY69QeU8BFh?=
 =?us-ascii?Q?7cp9hqG0bHuxOEg2VVkFYlfFLIUBnl18rSKHgCcpvFaj9tZIMX44CdrOdJAn?=
 =?us-ascii?Q?ICoBpjRC0QD/OvRrbYq5dpaQH/yypMHxfTo5pc0SoMLuYiU/Egp5lfyiU7QV?=
 =?us-ascii?Q?VcDQ2SbXX+HPqGXNnTeSP2UhM03xyqICqyLFs1/K6wCg8yBSmp82liQfGuyi?=
 =?us-ascii?Q?rbAMYnkH2I0hj2Jgwqb+QT6iZ8A96tJ9tpbSQmQBAc/U3JV0C1xexKOic6+0?=
 =?us-ascii?Q?+PMrP90htZkT5ffLYum7mH1l/C8y/FKsdTdYBJuj8pRo3YwrjEBSWVh8n9Ab?=
 =?us-ascii?Q?gq+dje8nbZb9z01UUc7i818x2k9SWQRffVEYDGxDNKZTeazVN1uYsOqHyldy?=
 =?us-ascii?Q?aS0THG0rOAcm62Q0egKkS5kQ08hLNTYgiWYWdmLyVTW0JSrxcyObuzojw5cO?=
 =?us-ascii?Q?SJhZsdttfPNtirqm6Nua5Bhg4a0A5GQqa2PGAR/ihl1F8CvCLglGMHPLFfcp?=
 =?us-ascii?Q?U7zHTdGmcW37G67P7Z4IvowZgzM5fDZrRVJmn2lF4vmUvCsquLJlG7ub3OjH?=
 =?us-ascii?Q?1rENORg3w8VFONURKt0RFC5FWD0mH9zegjSvXPhFn1lXcciY5xBej7piMRge?=
 =?us-ascii?Q?tFu1J9PKmqswcfCYwQYfDYS0Q5zDVi2QOLP2iYvJQ4nQffBIFESoYfWzXril?=
 =?us-ascii?Q?/u5e+257cUIvbfW5fyIUQofaBGFzd9PHaInnMWVjpvCXfZC23kGpCi+KqleH?=
 =?us-ascii?Q?FDfOL/S32/A+LNDBjnFWY8JkicrEZdA+aKcw?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:24:56.7359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc504f1-8aa9-4740-4e1e-08dda832f4f4
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218361

From: Daniel Turull <daniel.turull@ericsson.com>

The source information used during packaging can be use from other tasks to
have more detailed information on the files used during the compilation and
improve SPDX accuracy.

Source files used during compilation are store as compressed zstd json in
pkgdata/debugsources/$PN-debugsources.json.zstd
Format:
{ binary1: [src1, src2, ...], binary2: [src1, src2, ...] }

I checked the sstate size, and it slightly increases using core-image-full-=
cmdline:
without patch: 2456792 KB sstate-cache/
with patch:    2460028 KB sstate-cache/
(4236 KB or 0.17%)

CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/conf/bitbake.conf |  2 ++
 meta/lib/oe/package.py | 46 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 52e74a6879..3ec0f31e8b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -991,5 +991,7 @@ oe.sstatesig.find_sstate_manifest[vardepsexclude] =3D "=
BBEXTENDCURR BBEXTENDVARIAN
 oe.utils.get_multilib_datastore[vardepsexclude] =3D "DEFAULTTUNE_MULTILIB_=
ORIGINAL OVERRIDES"
 oe.path.format_display[vardepsexclude] =3D "TOPDIR"
 oe.utils.get_bb_number_threads[vardepsexclude] =3D "BB_NUMBER_THREADS"
+oe.package.save_debugsources_info[vardepsexclude] =3D "BB_NUMBER_THREADS"
+oe.package.read_debugsources_info[vardepsexclude] =3D "BB_NUMBER_THREADS"
 oe.packagedata.emit_pkgdata[vardepsexclude] =3D "BB_NUMBER_THREADS"
 oe.packagedata.read_subpkgdata_extended[vardepsexclude] =3D "BB_NUMBER_THR=
EADS"
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 0bcc04ea54..60392cbced 100644
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
+        pn =3D d.getVar('PN')
+
+        # Kernel sources are in a different directory and are special case
+        # we format the sources as expected by spdx by replacing /usr/src/=
kernel/
+        # into BP/
+        kernel_src =3D d.getVar('KERNEL_SRC_PATH')
+        bp =3D d.getVar('BP')
+        sources_dict =3D {}
+        for file, src_files in sources_raw:
+            file_clean =3D file.replace(f"{workdir}/package/","")
+            sources_clean =3D [
+                src.replace(f"{debugsrcdir}/{pn}/", "")
+                if not kernel_src else src.replace(f"{kernel_src}/", f"{bp=
}/")
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
+def read_debugsources_info(d):
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

