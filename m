Return-Path: <kazuyoshi_akiyama@jp.honda>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF056C982D1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 04:25:05 +0000 (UTC)
Received: from mx0b-006e0602.pphosted.com (mx0b-006e0602.pphosted.com [148.163.140.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32198.1789619095940802658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 21:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jp.honda header.s=PoD-DKIM-Selector header.b=OKC/b/Aj;
 dkim=pass header.i=@jp.honda header.s=selector1 header.b=Ay3CRnCf;
 spf=pass (domain: jp.honda, ip: 148.163.140.78, mailfrom: kazuyoshi_akiyama@jp.honda)
Received: from pps.filterd (m0469182.ppops.net [127.0.0.1])
	by mx0b-006e0602.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GM08Zj862736;
	Thu, 17 Sep 2026 04:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PoD-DKIM-Selector; bh=QAnkny+vRvZmp8GC0tk/G2aFR0nnllE/rJemeeZ9/1
	4=; b=OKC/b/AjfvPutMNYseDpeO4TIDO3ijXGMbKf5Fke6mZOBoUOFn3+OdtFo2
	pWPjM3QsMhcxLNaAR0UikBdrkSpVgaccGH+6DJshxNfkjBReoei5he9h4Z6DSUZ+
	nLvUpOfJIOA8298/NAEjQKPRN2uj6+VqaBJy+HF/POdWMLnMQmlOLPylkHswnx57
	RaCK8HPp7d9C6J1yJsRNKKF0vsu127ObFcO++nL04WoezTQ82PBTnl4xRjWB8zaU
	vG+kWWWSvv8f+j+OMuB+1Z40FMmLzrLF7K1eO5YsV9RcJpsfUrQpTrHDVxD2LFbV
	qMpzl+aCbb9y6PqWZOgTbs9xPlbw==
Received: from os0p286cu010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	by mx0b-006e0602.pphosted.com (PPS) with ESMTPS id 4gqrrt201y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 04:24:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEQ0Nt2a4+n1qccKYO6EAoSPb5HuNAcCHirFUaBsRv5G4bfkBAdJ27ZX10XfaJpwJFRjFwTBxTfqu67o1e1ZU4uGSGhyUIFU1O6anoae3igweIONDUXhCLQk/XVssH4Pw0hy0x29dLO61U3sw2YWoKSyjy9ZlpFgh7fUN2J9tDWGQM+6UfH83Gpb/WRzhv35b6zf6K/+z68vjOcDD4fVY8qTBNRyrZRdVZ0EAuod3Wt6plKbcG0bHwPygmmB6Zgj+xuJJqjZpq9NNQFAxKfQl65g3a5J3SPg34s2KEHjSnLyNLS6kr17hOb7sYo4XN7RniDOl2e9KjqUX/ryuo/lng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAnkny+vRvZmp8GC0tk/G2aFR0nnllE/rJemeeZ9/14=;
 b=lzzCfz553JK5tktOEjht90GrKX5/3YulAB7H/oRzMLzE94zhPLxCcMtXaekV9Qk1sXhnGERZ3MRvG5RaoDwgFC8koS/VXIDscFdmiUUldLiudlZjmEwEqwgAWXro/ZNA579hJNpDtA6UZ9oFivrMhbdNrI62jdmUbiVYN3TF40ASaIo/0fjOw4ZRTuCH97OeQiCKA4uNIYVjS5wPLU3gzmiVJ4mw6Fq7UAGMgJFhGe27QYugEgVvDOD7VGzh22wudJFWeZflwN1+Oh6/YapxErUqHRoCTqFQ5KVgzWefnRtqj38rQFxk1m3vqD+Cvi803tM0cpCpoeYJw0SMVolXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 103.113.246.104) smtp.rcpttodomain=bootlin.com smtp.mailfrom=jp.honda;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=jp.honda;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAnkny+vRvZmp8GC0tk/G2aFR0nnllE/rJemeeZ9/14=;
 b=Ay3CRnCfbcKaNc4Yv7ie2YNI8fXee3d4a1YS//GpWPIYRyIUefAP9/9KmuImKXR3OosIFcfV4Eha026cWY7IMjgV83XEtqutdiMNJ+6R26j8ZVMAFYKCvZrWSeA5LmB0gLzvcPEjNPuGLVkslHwH9BuP1Cbvh/zw6M/RDWQt9rQmyvzBljwC7zIIOQWFRDVzSzMV1dFuDBGKJz++2RGJhDEFYb8uzl8ST5zkL/FY2LyYGpAhpvhwD1jHeEJfygMC1mPeGpuYsdvLQDETMFMKp0ivKQP12HkwOw1l6NPDkjMg20NhEeCPQ7SinHJXPChq50cY2MkThLb4HtT+U933qQ==
Received: from OS7PR01CA0235.jpnprd01.prod.outlook.com (2603:1096:604:25d::7)
 by OS9P301MB1565.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:3ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 04:24:42 +0000
Received: from OS1PEPF0000D210.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:25d:cafe::d) by OS7PR01CA0235.outlook.office365.com
 (2603:1096:604:25d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 04:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 103.113.246.104)
 smtp.mailfrom=jp.honda; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=jp.honda;
Received-SPF: Pass (protection.outlook.com: domain of jp.honda designates
 103.113.246.104 as permitted sender) receiver=protection.outlook.com;
 client-ip=103.113.246.104; helo=JPPFSMTPS02.hm.jp.honda.com; pr=C
Received: from JPPFSMTPS02.hm.jp.honda.com (103.113.246.104) by
 OS1PEPF0000D210.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 17 Sep 2026 04:24:40 +0000
Received: from JPPFSMTPS12.hm.jp.honda.com (unknown [10.127.161.38])
	by JPPFSMTPS02.hm.jp.honda.com (Postfix) with ESMTPS id 901C6D000656;
	Thu, 17 Sep 2026 13:24:40 +0900 (JST)
Received: from srdserv1.hm.jp.honda.com (srdserv1.hm.jp.honda.com [10.121.66.58])
	by JPPFSMTPS12.hm.jp.honda.com (Postfix) with ESMTPS id 8B65EA3A0CC;
	Thu, 17 Sep 2026 13:24:40 +0900 (JST)
Received: from RL25041301.jpn.mds.honda.com ([10.109.174.205])
	by srdserv1.hm.jp.honda.com (8.14.4/8.14.4) with ESMTP id 68H4Oeh4028153;
	Thu, 17 Sep 2026 13:24:40 +0900
From: kazuyoshi_akiyama@jp.honda
Date: Thu, 17 Sep 2026 13:24:39 +0900
Subject: [PATCH wrynose 1/4] spdx_common: simplify get_patched_src()
 implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-backport-wrynose-v1-1-bb7d640c2719@jp.honda>
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
In-Reply-To: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
To: openembedded-core@lists.openembedded.org
Cc: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>,
        Benjamin Robin <benjamin.robin@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.16.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D210:EE_|OS9P301MB1565:EE_
X-MS-Office365-Filtering-Correlation-Id: eed4db31-e484-403e-757c-08df147397b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	y5XLls89P6Amwc0XJJk7yc/adXQnhHvOwFZ71c3MGTPjyx9DJD6SdrP8hcdxQ7xtTdxaPPLf/R+3DXCsUtiixlwUuZ7dmY6IeFgP0Vu6nYltg3h1NmgRgtFRRE+Zx91v8j1lBvO+YtaMj2QQeqQz5g4pqmjANux9uwKlVin7M6G8Y+GZieaFPDTRYaUIF6eXIJzOnoOTSF98mODCFkk0VQLD0dCldxNYUiE9nFN9kiUSK1ImAZv7aVezDxSqAUgHpq/dRCscFXAe2lQKZmYxVaGgtNrbTNAocWHwTO9hYmWHHsNUAcA0x2Jc/erOGBs73oAZdnw3UaG/rKjvv3FoPJu2oeMs1aiKMDxXvzjqw7F3tb88uvEFF8geZaC3AfLsZ2YLIE6yDV4pH8AMr7sx/SUIWNzJtfoAXO6SGeGOP8Rn72XSlHfpDccE87HQpN6eD2GMI8lM/Biuw7k6qOu4wTH0nQPBZXaxJmjl/xeMNsszno0rZarUbfYkp7RStoEetvpl/BXWY1Wxw2JEHqgXnpJKrcXR1tLnHlqup24C0q4mNj7JKI09+MSMQfMy3YsHUlNx/zMciHgGsTtBdj750n/xi6F8nEcAUV9ZbJqGqV1g8DFNScvPsLCfzp1WWQroO5IRexx1HNEoelujfgLllcdsNuUEoqLvTTx7N8WF0BT0GIFFvVn3FoJXe1Ctb2l/TQ1LEPnW8LIOmtQGzTY/kg==
X-Forefront-Antispam-Report: 
	CIP:103.113.246.104;CTRY:JP;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JPPFSMTPS02.hm.jp.honda.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sefomI5UEPNt2GycnpLAfXHcZLgeC/ISZWgsvwjF+hM/7j2XRYIFgI/N1+8GJJoHclQ2VRR1RXBW0XQUE+DGj3Quc4Hrp+cNGRILC10oi3kSOJbIrLS+a+4qBZPinUyWlO2m8FCBUqIJOSPRjAA9+0rZ+n1qCzwGZHPHgJbrAfTbpgd0SenToxiaRShaBjTMu92c1PZglj7N5vskZRKDVM71vaCyurtra9b+PiYmNh9kFceU0iDCf6pDztxBLu1x2+ESz5IXgNX5vWab8LceUlkb4gg1PcXijgmai3HV7/BAmTbUTQTV3rxo7QHiWaOmBtmWXd5Q5ZG0Q7b/ofTsIvnD8SzO/PsaR0ZzcI/qRQU3Or4LkLpD9lfxeU6Fe1vbUimDo433kLv/NzB1l8MJSBREy+OyA116Y0PClJwnMWBO3aQkaudFDjo+xd4+IIS8
X-Exchange-RoutingPolicyChecked: 
	SMpiho3/G07N4p2QbHvrAJ5u5hpLy4uiqtOsyRDtqJgJcuFu8t8Rb/G8DSUQM8LTIoS3UKugSDzWRUF69bROMp3JYm9r2h01F/8l4hK8UFBI28d2pQfP4v26iyqTRkiuH7HguZD8cD5pZR82s+/oo/tqs3xF+NGkbn3taWrB3/uo8gq2+6gGFQjVIGjv2/iNxviq8Pl2zNY+wyHxNiGzyycRfO4a6furBbHSrjTcVklXAsGPpVQ8YWxZYD7wU8kAJf/jC85OoIjJy8DhtlonLwVe9oDHd8nZ+hN2v7GI+xeAyOq6qaRTtq6Term3mzIdqlQ+z1ilgBJbn0QVKgbcPw==
X-OriginatorOrg: jp.honda
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 04:24:40.8191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eed4db31-e484-403e-757c-08df147397b3
X-MS-Exchange-CrossTenant-Id: cc138ffb-9c4d-433b-b211-d4549ae62e8b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=cc138ffb-9c4d-433b-b211-d4549ae62e8b;Ip=[103.113.246.104];Helo=[JPPFSMTPS02.hm.jp.honda.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D210.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P301MB1565
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 04:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246005

From: Benjamin Robin <benjamin.robin@bootlin.com>

The behavior remains unchanged:
- Instead of saving and restoring the values of various variables, use a
  copy of the data store via `d.createCopy()`. This prevents side effects
  for other tasks.
- This allows removing the `try ... finally` block.
- The function `is_work_shared_spdx()` no longer needs to be called twice.
- In the work-shared case, there is no need to modify `WORKDIR` since no
  task is executed from that branch.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit e0bf8e7c5be3d87376a6c2aab5aca07fd0813763)
Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
---
 meta/lib/oe/spdx_common.py | 81 ++++++++++++++++++++++------------------------
 1 file changed, 39 insertions(+), 42 deletions(-)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 6b1a409c40..9d1e22629b 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -172,50 +172,47 @@ def get_patched_src(d):
     Save patched source of the recipe in SPDX_WORKDIR.
     """
     spdx_workdir = d.getVar("SPDXWORK")
-    spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
 
-    workdir = d.getVar("WORKDIR")
+    # The kernel class functions require it to be on work-shared, so we don't change WORKDIR
+    if not is_work_shared_spdx(d):
+        spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
+        localdata = d.createCopy()
 
-    try:
-        # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
-        if not is_work_shared_spdx(d):
-            # Change the WORKDIR to make do_unpack do_patch run in another dir.
-            d.setVar("WORKDIR", spdx_workdir)
-            # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
-            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
-
-            # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
-            # possibly requiring of the following tasks (such as some recipes's
-            # do_patch required 'B' existed).
-            bb.utils.mkdirhier(d.getVar("B"))
-
-            bb.build.exec_func("do_unpack", d)
-
-            if d.getVar("SRC_URI") != "":
-                if bb.data.inherits_class("dos2unix", d):
-                    bb.build.exec_func("do_convert_crlf_to_lf", d)
-                bb.build.exec_func("do_patch", d)
-
-        # Copy source from work-share to spdx_workdir
-        if is_work_shared_spdx(d):
-            share_src = d.getVar("S")
-            d.setVar("WORKDIR", spdx_workdir)
-            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
-            # Copy source to ${SPDXWORK}, same basename dir of ${S};
-            src_dir = spdx_workdir + "/" + os.path.basename(share_src)
-            # For kernel souce, rename suffix dir 'kernel-source'
-            # to ${BP} (${BPN}-${PV})
-            if bb.data.inherits_class("kernel", d):
-                src_dir = spdx_workdir + "/" + d.getVar("BP")
-
-            bb.note(f"copyhardlinktree {share_src} to {src_dir}")
-            oe.path.copyhardlinktree(share_src, src_dir)
-
-        # Some userland has no source.
-        if not os.path.exists(spdx_workdir):
-            bb.utils.mkdirhier(spdx_workdir)
-    finally:
-        d.setVar("WORKDIR", workdir)
+        # Change the WORKDIR to make do_unpack do_patch run in another dir.
+        localdata.setVar("WORKDIR", spdx_workdir)
+        # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
+        localdata.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
+
+        # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
+        # possibly requiring of the following tasks (such as some recipe's
+        # do_patch required 'B' existed).
+        bb.utils.mkdirhier(localdata.getVar("B"))
+
+        bb.build.exec_func("do_unpack", localdata)
+
+        if localdata.getVar("SRC_URI") != "":
+            if bb.data.inherits_class("dos2unix", localdata):
+                bb.build.exec_func("do_convert_crlf_to_lf", localdata)
+            bb.build.exec_func("do_patch", localdata)
+
+    # Copy source from work-shared to spdx_workdir
+    else:
+        share_src = d.getVar("S")
+
+        if bb.data.inherits_class("kernel", d):
+            # For kernel source, rename suffix dir 'kernel-source' to ${BP} (${BPN}-${PV})
+            dir_name = d.getVar("BP")
+        else:
+            # Copy source to ${SPDXWORK}, same basename dir of ${S}
+            dir_name = os.path.basename(share_src)
+
+        src_dir = f"{spdx_workdir}/{dir_name}"
+        bb.note(f"copyhardlinktree {share_src} to {src_dir}")
+        oe.path.copyhardlinktree(share_src, src_dir)
+
+    # Some userland has no source.
+    if not os.path.exists(spdx_workdir):
+        bb.utils.mkdirhier(spdx_workdir)
 
 
 def has_task(d, task):

-- 
2.43.0


