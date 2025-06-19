Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B80DC7115E
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 08:48:03 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.41])
 by mx.groups.io with SMTP id smtpd.web11.9932.1750322876199724832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 01:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=LsFPJUsQ;
 spf=pass (domain: ericsson.com, ip: 40.107.130.41, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=II5MMY0WNOc/UEkVdGiidl81GNUjxbp4rSwcsEsE8nRuJMReVs+OVLTW92+4Slf/h7t7KAeqdq/2PDEN9kuIwM9781hjeMSKkJaqNSxFirO/oAjsPV2Qv5ei4TNHLOwe5ePSss1Xkei96JZMSLNYrdINs6e3FKmD+co63WjAn+2owrYNS7J+eOeDjnN6JVOTwGMG639qi4DXo/lbavVyknb82CmZhYSCiUWtp4/g0ZyzF94MLOtY/6MxnryK5N78I/2le+p5MQ1EzMVc9R1uwt7SfM+s/f9X8d02TxL60nJEzaTqlL159NSux3pJcrvsy/fIBP7w0wqV+s93a8jkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E31gYZ2YdpuJsfLjXd2jBO0GVBdrdKeuLcfxNC1yeUk=;
 b=hsNtPWx50MYdTg1p7do7mL3ssi44xkMer+oyCIXnXMtEg/auCsDeEmvXU/KyiKwXisIYwynSpGztw4ktLsHoZqMlauoodMgKqClQZbBGtg1eWBoNTYRp2rVWpRpTTMZadjKJ0EFb5NVKYlypQG3MjAc9TFUb48xEJe9ZsCHzVlAaL/MJmLz30KsJqHir8skQxbHEX30NlkLezQJQniBl9ewdaxy3DMiNX02odb8tDr3C++QrgtU2R/cMF3b8LYPE1H3FeNoMRU//o5MgToVq+XoK4kIBiC6OkVa2ClZKvmZUMe/QGfbKD6m/mzriu3qvxDz5lSXxGUMKl2drHxvV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E31gYZ2YdpuJsfLjXd2jBO0GVBdrdKeuLcfxNC1yeUk=;
 b=LsFPJUsQ1NY+FCLJG1BNtFlsSP/VyLxVIgD1ICcBcmtq+QkgZpNohSqIJ2P3XSnv191222mnEPxoHTwdIkyOTSjpN6PKxLTBLqEsgc1HkAtlYHWqj8AjJ33wqNC+aJNLT1rORRSPhhQlhQzHwq+4YbhWBNfvxddIbnABXOpsqtCtkdLFjm8NTSHxTgbRwMrd/6MoS2bbd10gzEYfnurv+Nzh6zWMpbvKcgtwNvfPtaPozruZtTJU+4s4JvZx6/jiglE8hk0RNQsBgEWTQZ0YStjjab7Td+gATttbTI57/uIvhistEA9OAW4qJUa4n8jFgsHO34UQIhMi8/Mm/c4ARQ==
Received: from DUZPR01CA0230.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::7) by PAWPR07MB9393.eurprd07.prod.outlook.com
 (2603:10a6:102:2e8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 08:47:50 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::b0) by DUZPR01CA0230.outlook.office365.com
 (2603:10a6:10:4b4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.36 via Frontend Transport; Thu,
 19 Jun 2025 08:47:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 08:47:50 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 19 Jun 2025 10:47:48 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id BD01F9582F;
	Thu, 19 Jun 2025 10:47:47 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id A61797083F54; Thu, 19 Jun 2025 10:47:47 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/2] package: export debugsources in PKGDESTWORK as json
Date: Thu, 19 Jun 2025 10:47:35 +0200
Message-ID: <20250619084736.1940747-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|PAWPR07MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: c6074597-252a-4e0f-6be6-08ddaf0df936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CRRNj+pDNv/hMUk0ph/bOh16UvzAP6F3k5J1Heo6UkqLQM2vSM6O+mWJZXUj?=
 =?us-ascii?Q?7pHV51AnqVficaHFzf7Vy0w+9sikvsxuJWW4QovrdiLr0njNASrF8AO2Xtob?=
 =?us-ascii?Q?itrnO4EmVPpIImTlJ8/jQI25asdpCvNv5qMZ4ZdFmXvC+smkGtBXFFvchWs2?=
 =?us-ascii?Q?DCawoUYiZYRGm2KBu6hjHXqiaODR1ZrfjdlwfpVz30MZ2EficHdod0PmNxmc?=
 =?us-ascii?Q?8rE0mOZSwjhWQynqAPqEwLumGGa2uZ7/plGADuaYEh8lBV79Ngw45jWUrxmc?=
 =?us-ascii?Q?XYULMTdFofqU9Z/pHNftFyS/f/ZkgvDWkPT2jGs9H+GBw9OXxFTxFiV3gN3s?=
 =?us-ascii?Q?YnRz8LHpEht86RQv7D4j01TSPcsM5fWxMd3DFfw90TdmMqxhPGDCii17kKSj?=
 =?us-ascii?Q?J8fKc6NFGBjIms3JYHu+oK5Izxr2tTYTpXB1YhtmyRVEh533zTflM0J3FP5k?=
 =?us-ascii?Q?MzFxqloY+woEOVCz6ZBtTUCXkxr+xfr8Z4WV9xpratfxOIi70X1M7Iwcl07y?=
 =?us-ascii?Q?DeppZ+QIQZfHZSFJ8jqMmr2JOlg19IK5gPNm7AggANXreIw5JxtCVu1eSmqc?=
 =?us-ascii?Q?GZFOAqOlMRAArXg/5DKWOjQWFGZDYcknUVmWomj0bKqMHL/UEL1d6lHpCptz?=
 =?us-ascii?Q?nVBvN1Bx4VPcG1O2wvUSNfRZdblumTCQJmVcldn3pe2uEHmfwcgTrx1Tut0J?=
 =?us-ascii?Q?Rr232p+h9WQFkLzCbWNrnck2eY+dQ9wpXnc49zhrLCSaprMR6+PU2+Vlo1o4?=
 =?us-ascii?Q?i5mPwDvABMsrfz6ikWYUuIE65CdlcBMbFWhY1BfATT28Qu7qq/jmrewBStAV?=
 =?us-ascii?Q?2vsnFAoH43OiUH9a0XhZJ6u4kUSGUHZs3g54UDOKwZZh2Wzc68YgD+XF47En?=
 =?us-ascii?Q?y+tjAvQgd3sNdbxqauABvzeTT9J9avZ30B8/3Se34jSXrTJAibN4Y7wuuolf?=
 =?us-ascii?Q?QQULGKeCSxKczU3hQqLP4jbdXwfmhdF6SZyi5gsMGS5tM7PU1Sh4fBRcmlzx?=
 =?us-ascii?Q?rKkqts7hZ2IoOU85uQOxEBjg6IFH/a6Yb1ct7Uh3ypvViH0lZ0KkblEbljrA?=
 =?us-ascii?Q?dhK/1fuUFsCjx2OWToyrfCT/9ce2Ssu59asw8nPuLk7XqhLkUN4mg9Z5/FFn?=
 =?us-ascii?Q?l8Jyy+9kvHkYmSx9Sb17hi57U2G+YBKtqyU+O7vwnZeheUoGY1ik9qxcDVw+?=
 =?us-ascii?Q?WqgemxBV0u6jyNQ31Q9zS2zjrBh1fhSRWzLTF1I+4Fk600D/vvoKRWWTxZQz?=
 =?us-ascii?Q?F7RZROj4dI4BxknojRTu1F1CwtgnUUerivvEbCjBNkovvL95dHzEhEls0LR/?=
 =?us-ascii?Q?lTq9PUfO36/lLy4Q1YMsrmI0v38Z+7uB111m/vzwb/n5922ZAbChS3UqetUC?=
 =?us-ascii?Q?ZPE6mvPmcUdqNNcHRGNjtJYOI7ytvAKeua+SmVX/F2K4gEFHBGfbu6SGuwil?=
 =?us-ascii?Q?C9u+Oxpy//UGzbCPIuGigO/0hU+AT5jYnUVUTGYbEqcjABBGrkKO2se9ZbSt?=
 =?us-ascii?Q?0jS4OOHAKRxSejEHyY9CuB4ALIyJTqYxwsyg?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:47:50.6206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6074597-252a-4e0f-6be6-08ddaf0df936
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9393
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 08:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219060

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

(From OE-Core rev: c507dcb8a8780a42bfe68b1ebaff0909b4236e6b)
Adaptations to match spdx in scarthgap: change BP to PF

CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/conf/bitbake.conf |  2 ++
 meta/lib/oe/package.py | 46 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 78f15b76ae..acf4e2d153 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -989,5 +989,7 @@ oe.sstatesig.find_sstate_manifest[vardepsexclude] =3D "=
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
index af0923a63f..ba0d326781 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1038,6 +1038,49 @@ def copydebugsources(debugsrcdir, sources, d):
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
+        pf =3D d.getVar('PF')
+        sources_dict =3D {}
+        for file, src_files in sources_raw:
+            file_clean =3D file.replace(f"{workdir}/package/","")
+            sources_clean =3D [
+                src.replace(f"{debugsrcdir}/{pn}/", "")
+                if not kernel_src else src.replace(f"{kernel_src}/", f"{pf=
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
@@ -1269,6 +1312,9 @@ def process_split_and_strip_files(d):
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

