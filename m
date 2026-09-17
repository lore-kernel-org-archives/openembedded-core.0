Return-Path: <kazuyoshi_akiyama@jp.honda>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF34BC982D2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 04:25:05 +0000 (UTC)
Received: from mx0b-006e0602.pphosted.com (mx0b-006e0602.pphosted.com [148.163.140.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32199.1789619095981094663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 21:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jp.honda header.s=PoD-DKIM-Selector header.b=Us/kk4gg;
 dkim=pass header.i=@jp.honda header.s=selector1 header.b=cDMzutke;
 spf=pass (domain: jp.honda, ip: 148.163.140.78, mailfrom: kazuyoshi_akiyama@jp.honda)
Received: from pps.filterd (m0469177.ppops.net [127.0.0.1])
	by mx0b-006e0602.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMwE6f1670600;
	Thu, 17 Sep 2026 04:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PoD-DKIM-Selector; bh=Vj8GoE15dit6sTjVL84LmdE2NmP6TFKOM98dXiCxKB
	4=; b=Us/kk4ggx0X5FxjqtLb1ziNPeDghnzcYSgmnwHu9zJHJO0qGW7El9y6v0P
	HC9r/oP+FCsDSxKCFZmAweaeNqnAk4/3XyuWHDp5hRzYZG5RA+uhzW4S06n0ejU7
	zvr16bvQZF+I4xwjpj15qguBtObHc52bbPdQ4a5yv9WQ7B2w7FjhjudWUBlaIF7m
	f/MFyKNn89tdRx6Bh0rd4IM+aqu7LUm5Pw5rx6B2vTx+1HqKfB234liCvr4uCE5X
	o2pREPIfqoYoRd8URFYVofqTly2oNerzE5pmoSS/A3ZvdF0EaFuvTJ2UA/1VLKEZ
	HSO0LE+1Sb8Zris+0rKPgMFZwABg==
Received: from tyvp286cu001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	by mx0b-006e0602.pphosted.com (PPS) with ESMTPS id 4gr3yj173q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 04:24:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TP3+ZCOwVY1AP8CXmbOIxOJniP+HUbEVVY27hfdHt7bJDLApzQFacvwhTfhnuAqM0IkCEtWuUG64RMulwOW45+jE3pPfRf/v7Lbi881vMvHh1Lmn2s04OUmXZT+RyDDGoQlphMms+ClkF9SXhvdbn/1T4r+p5En54IPeLyDo3oeqMok0rL6bgyUf22OQE6HxfH74k+RWWvumaCIkmEHwhC9OUMoTA76P309LgfeHndiP36NrtMEPtx/953K5/sPWNQAuS2AvvD667DP5P5bICSXxTKM6VrUYrqbn7p5RMcrAMgMZNuFYY4Uw9wTbjHYFhcSh1skLCVDjKy18xEGWPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj8GoE15dit6sTjVL84LmdE2NmP6TFKOM98dXiCxKB4=;
 b=niKuvGBJAxjQSpRol4ItisTY/419TA0OmQT+fiP+tznLLNd3+wge1Oy3kBg9/JJn4CzhBhjEPKO2+KfVOS3uUebKHs/D/tomf6bES+3pw4gjaXt/N0MxL4rrmHqU1VBKpwb4JedzFmZKoDQuTaGyhP1wnAoSAp6hlx3QYVSTQm4bNsEDoeMbVnyFYTY2JGISzvqKy2OcDO7UjOcrMghMEfFXJfLPzUlbalrLAC1Srm9e+muTBxoz9GQ2o6tM2G8rrDO3h8C2WmYB5cc8dpolOEJu7MGXnhekgzbQXhXyJ7fRmbNspI7X3P1uAoSCONImKJJjprXjf/GwYYfUhs1dhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 103.113.246.104) smtp.rcpttodomain=bootlin.com smtp.mailfrom=jp.honda;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=jp.honda;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj8GoE15dit6sTjVL84LmdE2NmP6TFKOM98dXiCxKB4=;
 b=cDMzutkemtKjlyy6j1avzy13l+YLyyBZRXwyKMwi5wrSZaXs8hvh6n89fwwb7fvkbpTbRzb6YxRBFrBTFCTO5i+w0bYIMQvolcLATqwFFwkA/5Pgsf09vtee8jZwf1jtrzQWrlizU2jD+kcntBn6w4iJKwlFW4hG05JvBgCRxNbQr9jV2Aij//bc5ee30/+MuEuigknVFvhGyxyccDJ2dL9/5UEPSpJJxzrOszq3JkvZSE2oTO/SuFVqCb9O0x+kb8te1sKrkvlxTI7zqooyjyE1+P9mBK2XXkIjtOGpINe3DEvNQeSw8hkvrjJ1lqXnabQghTJ5fazQ+WcODhTRTQ==
Received: from OS3P286CA0081.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1f6::7)
 by TY4P301MB1692.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:332::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 04:24:42 +0000
Received: from OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f6:cafe::32) by OS3P286CA0081.outlook.office365.com
 (2603:1096:604:1f6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 04:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 103.113.246.104)
 smtp.mailfrom=jp.honda; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=jp.honda;
Received-SPF: Pass (protection.outlook.com: domain of jp.honda designates
 103.113.246.104 as permitted sender) receiver=protection.outlook.com;
 client-ip=103.113.246.104; helo=JPPFSMTPS02.hm.jp.honda.com; pr=C
Received: from JPPFSMTPS02.hm.jp.honda.com (103.113.246.104) by
 OS1PEPF0000D215.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 17 Sep 2026 04:24:41 +0000
Received: from JPPFSMTPS12.hm.jp.honda.com (unknown [10.127.161.38])
	by JPPFSMTPS02.hm.jp.honda.com (Postfix) with ESMTPS id E2C15D00064B;
	Thu, 17 Sep 2026 13:24:40 +0900 (JST)
Received: from srdserv1.hm.jp.honda.com (srdserv1.hm.jp.honda.com [10.121.66.58])
	by JPPFSMTPS12.hm.jp.honda.com (Postfix) with ESMTPS id DE723A3A0CC;
	Thu, 17 Sep 2026 13:24:40 +0900 (JST)
Received: from RL25041301.jpn.mds.honda.com ([10.109.174.205])
	by srdserv1.hm.jp.honda.com (8.14.4/8.14.4) with ESMTP id 68H4Oeh7028153;
	Thu, 17 Sep 2026 13:24:40 +0900
From: kazuyoshi_akiyama@jp.honda
Date: Thu, 17 Sep 2026 13:24:42 +0900
Subject: [PATCH wrynose 4/4] package: no longer modify paths in
 save_debugsources_info()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-backport-wrynose-v1-4-bb7d640c2719@jp.honda>
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
In-Reply-To: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
To: openembedded-core@lists.openembedded.org
Cc: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>,
        Benjamin Robin <benjamin.robin@bootlin.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.16.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D215:EE_|TY4P301MB1692:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6eaa2a-62c8-43d2-3900-08df147397d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: 
	RgZyQ9RwsPGO9waAHCtg+25NlkSobDyKD+rssUWlVZ98+7L47qc5i34452cVnVnlSqw7SirKBnS4Or9iPpPemnx+YZnqCWuhhSHzHpF9OYvZVbezo01AfZhJzX4ugmhcXpehW1Nc+ppn4hYoDEWJi7FUz/Q0WbDh5CPKLH9deIIfe12X4YeyEiFD0tFQ589PpIknZvQoLKFHEztqeNfAwBxj/QvavFFLugPapqkl6gVePhgTtGMrRoWdACizYw8SXTZ040/y6FW3XHeRm3FZsrP7fW55hdt0qhDUH5GXhVmXOxRdEa7jjUShVF9AQqnOMFp4YnU8IldRv+iMrUi+MUxHEd6aYVj8MSHI6nFrpKGDQMKo+eivS0TSW4mbdXKmD7F7ciVV4MC9PP/2/mUfW/+5W8KFnakcldFTcd83VcXGw9szfbWgjYcc/SQOHuxBFs1BUk56tXN+fk+457Vbi8p9UUwSOhdRVV+pOUwZMxkDbi2YUcVUA5wn5Evg7W4RM9Tup2iX8srbiKpt7jkV/tbJ/uNKr4bbhbyG47+sTVF/WfNrclb4/NBFtL2GCM9eJHsDC5CuoPsjaVRTN9RDfDDFoSpUuLD87jsNk3DB1/kxv05t+F3ZJdoIR/v30IkItjOaLGZW5dJhsulzJgX4Fai7j5Cl2FZ+Z1pXBGmM/Ab88o9GWx56Ztthj2KH3VEbdodwqfuYHazGnHz4deuTRA==
X-Forefront-Antispam-Report: 
	CIP:103.113.246.104;CTRY:JP;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JPPFSMTPS02.hm.jp.honda.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iN91W7yNOlF2AyuYpa79eZewd4xB4o9jMuoxTMl0elrj2ZXpc8uvPev9wMixMsfgpA2rW1s1yR8+of2XrUfW7N7Uzq3jZybpmBShFCmPm10dzLhHkw48rTVsUr6mOvvpwNuvrD1IPRkhQMCDWZN4CZ6DyHfKpw9NOcqBnNrmck3vyI7snT2P19GVeauV5A37I+ESTjIrFJlUb4EtIJwppZVK156F5RuKhcrs2swF8RvrAK8kBA3YKJdnPNeVbNA/dsenggUQEnP9XALdVtGHFU06+KhGAu4ff8KeuFL7HECbb7Kv6Hg3afyAE9B7B+2uJ4rhLhlS5kh4kP2J/Ru1uotdisYGh+2L8rf34cWLE4ScjDU5ERV/d5Gk/krmgA54FNhJp4JaFxsZfx0qWrO2Esi10DMHBoSEDDO24gatfMpoi/5UrmYSicI5Q9BaNNB4
X-Exchange-RoutingPolicyChecked: 
	XzF6bwm3DRXXMd8ynKqO8Bef6DYDJQ01t/RvAkKl5zX8QsAQwigyZDUyrD3RyJF3kGl7tde5s0FfSGVzuebjzdal7+0djtC2wCNI8GXNnWoyC4mYFOcj7xfhp/HitXPuECNmN/RwkN6qRGidKqOdmapDUiIXhN/7fpJw67Q6e9/K0dSxRyKO1y2rnqncX/kylluRB0C0iDppHQzlnx/ffHeFwgo34Dm31lym7O6Dt4IvWmiIvjwEly6ofCV3mmPQk982Gajb+/duaF26Q0FYVLkEr9otiJXOSg4UZInJ2t/3pWGdPa+r9Fl4LnFc49no3dcJ1tv7rdUT9HKJ5Ma+Rg==
X-OriginatorOrg: jp.honda
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 04:24:41.0674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6eaa2a-62c8-43d2-3900-08df147397d9
X-MS-Exchange-CrossTenant-Id: cc138ffb-9c4d-433b-b211-d4549ae62e8b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=cc138ffb-9c4d-433b-b211-d4549ae62e8b;Ip=[103.113.246.104];Helo=[JPPFSMTPS02.hm.jp.honda.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P301MB1692
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 04:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246006

From: Benjamin Robin <benjamin.robin@bootlin.com>

The source files saved in `${PN}-debugsources.json.zstd` are now saved as
is: "/usr/src/kernel/" is no longer replaced by "${BP}/". However, the
file list is still filtered to exclude "<internal>" or "<built-in>", ...

With this modification, the content of `${PN}-debugsources.json.zstd`
is no longer specific or tied to SPDX generation.

The logic that modified the source file paths to match what SPDX
generation expects is now in `oe.spdx_common.get_compiled_sources()`.

Furthermore, previously, for all non-kernel recipes the source paths were
never "resolved", since the KERNEL_SRC_PATH variable is always defined.
So the returned source file paths always started with
`/usr/src/debug/${PN}/${PV}` (the value of TARGET_DBGSRC_DIR).

Update the source file paths to match what the SPDX generation expects:
- In `get_patched_src()`, the sources of the recipe are extracted
  (again). The unpack task runs in a modified local context with
  UNPACKDIR set to the value of `${SPDXWORK}`, so the sources end up
  extracted in a sub-directory of `${SPDXWORK}`.
- In `add_package_files()`, all files below topdir, set to `${SPDXWORK}`,
  are (recursively) listed. For each source file, if its path (relative
  to topdir) is in the list returned by `get_compiled_sources()`, the
  file is added to the SPDX SBoM.

Handle this by replacing ${TARGET_DBGSRC_DIR} with the relative path of
${S} relative to ${UNPACKDIR}. If ${S} is not relative to ${UNPACKDIR},
do nothing.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit b567c2f0d91fbf36886d0c3a6f6ea90c07771044)
Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
---
 meta/lib/oe/package.py     | 54 +++++++++++++++++++++-------------------------
 meta/lib/oe/spdx_common.py | 42 ++++++++++++++++++++++++++++++------
 2 files changed, 61 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index c375acc124..bef3c92a25 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1060,37 +1060,33 @@ def copydebugsources(debugsrcdir, sources, d):
                 os.rmdir(p)
 
 @bb.parse.vardepsexclude("BB_NUMBER_THREADS")
-def save_debugsources_info(debugsrcdir, sources_raw, d):
+def save_debugsources_info(sources_raw, d):
     import json
     import bb.compress.zstd
-    if debugsrcdir and sources_raw:
-        debugsources_file = d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.json.zstd")
-        debugsources_dir = os.path.dirname(debugsources_file)
-        if not os.path.isdir(debugsources_dir):
-            bb.utils.mkdirhier(debugsources_dir)
-        bb.utils.remove(debugsources_file)
 
-        workdir = d.getVar("WORKDIR")
-        pn = d.getVar('PN')
-
-        # Kernel sources are in a different directory and are special case
-        # we format the sources as expected by spdx by replacing /usr/src/kernel/
-        # into BP/
-        kernel_src = d.getVar('KERNEL_SRC_PATH')
-        bp = d.getVar('BP')
-        sources_dict = {}
-        for file, src_files in sources_raw:
-            file_clean = file.replace(f"{workdir}/package/","")
-            sources_clean = [
-                src.replace(f"{debugsrcdir}/{pn}/", "")
-                if not kernel_src else src.replace(f"{kernel_src}/", f"{bp}/")
-                for src in src_files
-                if not any(keyword in src for keyword in ("<internal>", "<built-in>")) and not src.endswith("/")
-            ]
-            sources_dict[file_clean] = sorted(sources_clean)
-        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
-        with bb.compress.zstd.open(debugsources_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
-            json.dump(sources_dict, f, sort_keys=True)
+    if not sources_raw:
+        return
+
+    debugsources_file = d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.json.zstd")
+    debugsources_dir = os.path.dirname(debugsources_file)
+    if not os.path.isdir(debugsources_dir):
+        bb.utils.mkdirhier(debugsources_dir)
+    bb.utils.remove(debugsources_file)
+
+    workdir = d.getVar("WORKDIR")
+
+    def _filter_src_file(src):
+        if src.endswith("/"):
+            return False
+        return not any(keyword in src for keyword in ("<internal>", "<built-in>"))
+
+    sources_dict = {}
+    for file, src_files in sources_raw:
+        file_clean = file.replace(f"{workdir}/package/", "")
+        sources_dict[file_clean] = sorted(filter(_filter_src_file, src_files))
+    num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+    with bb.compress.zstd.open(debugsources_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
+        json.dump(sources_dict, f, sort_keys=True)
 
 @bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def read_debugsources_info(d):
@@ -1337,7 +1333,7 @@ def process_split_and_strip_files(d):
         copydebugsources(dv["srcdir"], sources, d)
 
         # Save source info to be accessible to other tasks
-        save_debugsources_info(dv["srcdir"], results, d)
+        save_debugsources_info(results, d)
     #
     # End of debug splitting
     #
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index e40cf36bba..f885f1832a 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -277,14 +277,44 @@ def get_compiled_sources(d):
         bb.debug(1, "Do not have debugsources.list. Skipping")
         return [], []
 
-    # Sources are not split now in SPDX, so we aggregate them
-    sources = set(itertools.chain.from_iterable(source_info.values()))
-    # Check extensions of files
+    unpackdir = d.getVar("UNPACKDIR")
+    srcdir = d.getVar("S")
+    bp = d.getVar("BP")
+    kernel_src = d.getVar("KERNEL_SRC_PATH")
+    dbgsrc_dir = d.getVar("TARGET_DBGSRC_DIR")
+
+    # Compute the relative path of source directory from ${UNPACKDIR}.
+    # The goal is to replace ${TARGET_DBGSRC_DIR} by this relative path.
+    srcdir_rel = None
+    if srcdir and unpackdir:
+        srcdir_rel = os.path.relpath(srcdir, unpackdir)
+        if srcdir_rel.startswith(".."):
+            srcdir_rel = None
+
+    sources = set()
     types = set()
-    for src in sources:
+
+    # Sources are not split now in SPDX, so we aggregate them
+    for src in set(itertools.chain.from_iterable(source_info.values())):
+        # In the common case, the sources are located in ${S}. To format them as
+        # expected by SPDX, we replace /usr/src/debug/${PN}/${PV} with the path
+        # of ${S} relative to ${UNPACKDIR}.
+        if dbgsrc_dir and srcdir_rel:
+            src = src.replace(f"{dbgsrc_dir}/", f"{srcdir_rel}/")
+
+        # Kernel sources are in a different directory and are special case
+        # we format the sources as expected by spdx by replacing /usr/src/kernel/
+        # into ${BP}/
+        if kernel_src and bp:
+            src = src.replace(f"{kernel_src}/", f"{bp}/")
+
+        sources.add(src)
+
+        # Check extensions of files
         basename = os.path.basename(src)
         ext = basename.partition(".")[2]
-        if ext not in types and ext:
+        if ext:
             types.add(ext)
-    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {str(types)}")
+
+    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {types!s}")
     return sources, types

-- 
2.43.0


