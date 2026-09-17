Return-Path: <kazuyoshi_akiyama@jp.honda>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937C1C982CF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 04:25:05 +0000 (UTC)
Received: from mx0b-006e0602.pphosted.com (mx0b-006e0602.pphosted.com [148.163.140.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32197.1789619094977010414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 21:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jp.honda header.s=PoD-DKIM-Selector header.b=h4et8faJ;
 dkim=pass header.i=@jp.honda header.s=selector1 header.b=pIm2ruCn;
 spf=pass (domain: jp.honda, ip: 148.163.140.78, mailfrom: kazuyoshi_akiyama@jp.honda)
Received: from pps.filterd (m0469181.ppops.net [127.0.0.1])
	by mx0b-006e0602.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0fBNa2283088;
	Thu, 17 Sep 2026 04:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PoD-DKIM-Selector; bh=tA/fbX++5QMNwGh9MwQPID1L988TVA5Ll8/8/RNy8j
	I=; b=h4et8faJ9EANG8k+4Snye2qEOlYDlltITkB2AyM0axyrRtGUmU6v28WqZR
	Igctl13TPRybfBYNMDY9VzRRKUkakFqPtFrIWr/X0FN6I8FZ6BBTf7BajkNqaZ1D
	4tDlkKVI++1TJVsQrYMd2tAsbyPst8+8y28OchKD4MsjJhGrvJM/yq7blfui0OJv
	WpAVRxs6itR/usb1tO29YCCsUHMy3gqiTZ+ZSHaTIBTbR9RwFtmr9PYSTGoo9tlh
	8aWYxBV+YhbPKbe+ukagMDDP/ebAzDq860T9MZthqcp5mmpjMm5MGBNurU3vm/BQ
	tpWEIjdztsLnwppcLlxJhQPhyYiA==
Received: from tyvp286cu001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	by mx0b-006e0602.pphosted.com (PPS) with ESMTPS id 4gr5vk8tm2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 04:24:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVCJfpgI2nGU/Ow8POuZfJGtZe6hzuZ3w/NnblxjMg3mOfjT/VKSR/pwEpzGNHrciUV7yDYvE3ItnXyD8Z/i7WqjzkSN1D0jI7VTec9m3vBzzEsz5+ExIxBMRe6Z6Fa2ja0BCow3GDI+jprnmQ7OS9oG8/7cMyR/pOz4+W0egOD0hdFokveu8mCrc6AoopoJJFcFXxwCnbLtBlvPCuYTovMaDM7zPkS07mZuyftQeHVzFVvMU1ITmE0SHndK493mX/h/Ri1OTPfBE21frc3sA0YUVf2VE3ubAkDtpwZkiqyOFHEqOPuMnqg8VmaHiEem5FMxc6JiUvV1SKUDfdzY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA/fbX++5QMNwGh9MwQPID1L988TVA5Ll8/8/RNy8jI=;
 b=TgSqc186o2qHxpT4aAq5mZTNvWCG6IiUEB5DNhI8AAW0m49UprRvy2OsJbRsmY2ZbOB25vAV+UaBrGkuQ3IlnT3T4XQTwIYbCtfN8I3ZLReA+cglqUjifU3P2mpwkykQ2ghdCYyfDdfv5hXndok6usbM0rvsND0dVuynhH9h6QA868IAd17R+wQw16f500Q8tiAnUmvn0irWwXy77Wz+N8nke5sY9K7DZC6hKyNKUP+oDITX7QH/4mjmg0FLVR6K4sJ56lrm/e1WhDxuasjPWNp3GNiNj+ppYj63++CylN2JjJt6Bj0KZEt3YezximMojFO/jYXg2vS43tNErSxEoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 103.113.246.103) smtp.rcpttodomain=bootlin.com smtp.mailfrom=jp.honda;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=jp.honda;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA/fbX++5QMNwGh9MwQPID1L988TVA5Ll8/8/RNy8jI=;
 b=pIm2ruCnG6uL/NeRkDDzALzXT8ko/TXwvTlrpfO/9KBWCDZ9VpmBoXy5REG1Zd7cOurkt2yJXPCnpc1fhQbC2tyI/xlrx9LAlB/zCXxW2loqf9i6lmYy1C01aqr7JYioG80mmt+K05t9U702fYO9ft+Y/il7wxsUqQhEKcPVsWfPxZ4fkXPbnf0JPGa7eRisw4wDy1NY/VBQEI0MVowAzTZrvWFUSpLruN3dL8oFx+QHUS5ke6K4qtjwdWnVEdk2TnsCBLmI9diBs07pr7yko+sX+2DmgYaE1pUCNDDGA8qu0tCS/KuLbH5u+nGEbb87Vxj9oVy/tgfgWlYC1gb7og==
Received: from OS0P286CA0061.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:9f::12)
 by TYTP301MB1073.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:186::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 04:24:42 +0000
Received: from OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f:cafe::a1) by OS0P286CA0061.outlook.office365.com
 (2603:1096:604:9f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 04:24:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 103.113.246.103)
 smtp.mailfrom=jp.honda; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=jp.honda;
Received-SPF: Pass (protection.outlook.com: domain of jp.honda designates
 103.113.246.103 as permitted sender) receiver=protection.outlook.com;
 client-ip=103.113.246.103; helo=JPPFSMTPS01.hm.jp.honda.com; pr=C
Received: from JPPFSMTPS01.hm.jp.honda.com (103.113.246.103) by
 OS1PEPF0000D20E.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 17 Sep 2026 04:24:40 +0000
Received: from JPPFSMTPS11.hm.jp.honda.com (unknown [10.127.161.37])
	by JPPFSMTPS01.hm.jp.honda.com (Postfix) with ESMTPS id B1417933F22;
	Thu, 17 Sep 2026 13:24:40 +0900 (JST)
Received: from srdserv1.hm.jp.honda.com (srdserv1.hm.jp.honda.com [10.121.66.58])
	by JPPFSMTPS11.hm.jp.honda.com (Postfix) with ESMTPS id A31B44000083;
	Thu, 17 Sep 2026 13:24:40 +0900 (JST)
Received: from RL25041301.jpn.mds.honda.com ([10.109.174.205])
	by srdserv1.hm.jp.honda.com (8.14.4/8.14.4) with ESMTP id 68H4Oeh5028153;
	Thu, 17 Sep 2026 13:24:40 +0900
From: kazuyoshi_akiyama@jp.honda
Date: Thu, 17 Sep 2026 13:24:40 +0900
Subject: [PATCH wrynose 2/4] spdx_common: modify UNPACKDIR instead of
 WORKDIR in get_patched_src()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-backport-wrynose-v1-2-bb7d640c2719@jp.honda>
References: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
In-Reply-To: <20260917-backport-wrynose-v1-0-bb7d640c2719@jp.honda>
To: openembedded-core@lists.openembedded.org
Cc: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>,
        Benjamin Robin <benjamin.robin@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.16.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20E:EE_|TYTP301MB1073:EE_
X-MS-Office365-Filtering-Correlation-Id: 904e1b6e-aa8f-4d82-f81d-08df147397b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|3023799007|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	6b+th6d2Z/8ar6g2PPzW7+sgdPjvaSBxmo8Z/KcjdgjlLXjFE6nO76SVXd1DgjdHexHPTX9hMf39jiAJHtQmSqZd4JYYqbIUKa70KVubabXUAkojyvv8YgMIh8CFeQ/BJYzKc2SZ+2uasXX71x6NnA6WR5nD/+uEZad5Imybgt1zBqWUwFnkVOPSIPVy5o/OHC+ydIier2V1WBVQ9lywL7oF5pcNWv3ablT9qtsyngUJw9O6H65Q8DbyjaMszTsaEfGHhr24vQaQBqAAgkasuZPAH48QQ+bJ4Dknp4atdvn5JcYCQB+Fn4mzPNg2IcMCCAmdihyiJYdj4QDxl5PabPf5nyLWQkWogpl5GaAh2iboC1c1ND/9x7nzk09ZOzKEec+DEHNs3j5ynSz26enRGVdjdO0OnEx5UhNCay8Eru58OM0mobqgceKDWV8OtYizusa8RaPwaQY0Rsx2N5pNTs12aAqrDHjFkJWo4L9J8MIs11E1229lpE+MxOhZ0h8ejbQgjbtlJFYh5gl/7Qtk52cy9oKTmoiqFX3MK5FwrALAr+nj4/MJ7PvXgA3P5tZE5gjn5tuZpse/N7XiVecdLG5vcDS7BhIz/l0Os8UeeDswPz18m1H9PaAI3ghjE/d/ImPMOIE4jKWHrlZ7mVeBaKhF4dtgpbB3mJzx9LCK/z8233qCeyZVpWq7EMK2G/544XJ50xoB1IWuFW7WgLwk5A==
X-Forefront-Antispam-Report: 
	CIP:103.113.246.103;CTRY:JP;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JPPFSMTPS01.hm.jp.honda.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(3023799007)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dUd13e6A6LTIHrnXaLpTm43QlkkVuEAHTybqRVz2SyYwXPQNR2r96tRPCnBAzshvt6KcZ6X+ajw2lxPnnh0OFjLW/ZQvosjYC9eknDBOwDN5acxNIkhICQDMt0fo9+lkWozPVJvYe37UoLP8lq+iorfxSn83uP5KX0MJ5yubfzLNAz4rewSAcL0Y1jD6q/Mdj8DBcZ13IS6DpLQLEIfHvcJNbETVe/3nFu7QVVjEyl6+hBBVNJwFYMK5lZbEmAP3AyQsxqxwKiiTQgYdpXwMD/pkvf4vslRO7tSVr6KbRkm/KhQWU3qBiTgE94aYjXOEZm+5v58iGk7fzPoB3NTxNGzW+oQhxO82KLRpXj8Q+BRdd2DdHWP+SWWjP2BbaN4zO4yahXIQyzO2b/AYsv6ajBuhxiJ5sBcGD5oEnufU77x4vk+HPSyNoajrFru30+l/
X-Exchange-RoutingPolicyChecked: 
	bNkvvkSiMdepo0Z4h2N7B5DTzWMcsKfTvjOmLAFxAoNblKlA5tqQmerHi+pwKCBUCmicsR/6BUkmAto1Sj3WFF9+1oVc3lqptG5NjxrTiMGkW4bueQC1BV9ymuJMvbciBOkoOKsrNPhyzldMxN5gkHRblXg/sdTF0MdLh8TLOEpQRMi5kCbM7vrh+dMuRxAaLHXoxx5plD91n1WlmKzFBqRqhMhGTHJnwhPcsGN3ySxTA/D8tOHSPPOp/SZDpu6xQdJ/6KJWQmRPwujQWCBBlnfd6OSR7JrKl58Fa0Hnk3C4EfLSI1Ep8fpW/aEdmEu8fZ4B/LJkztuRIMGQvXUSzg==
X-OriginatorOrg: jp.honda
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 04:24:40.8602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 904e1b6e-aa8f-4d82-f81d-08df147397b9
X-MS-Exchange-CrossTenant-Id: cc138ffb-9c4d-433b-b211-d4549ae62e8b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=cc138ffb-9c4d-433b-b211-d4549ae62e8b;Ip=[103.113.246.103];Helo=[JPPFSMTPS01.hm.jp.honda.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP301MB1073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 04:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246003

From: Benjamin Robin <benjamin.robin@bootlin.com>

This change will affect the SPDX output: the source file path will no
longer be prefixed by `sources/`.

The rest of the changes are safe because:
- `S` should reference `UNPACKDIR` and not directly reference `WORKDIR`.
- After analyzing all public layers, no `do_unpack()` or `do_patch()` was
  found to reference the `${B}` variable. The comment mentioning the
  `${B}` variable traces back to [1] (though no further explanation was
  provided).

Additionally, this ensures proper capture of sources if the recipe
modifies `UNPACKDIR` outside of `WORKDIR` (though such cases should be
rare).

With these changes, SPDXWORK is no longer a working directory which is
"temporary" replacing WORKDIR, it is now a "temporary" directory containing
unpacked source files.
The run.do_patch.XXXX and associated files are now stored in ${WORKDIR}/temp.

[1] https://github.com/doubleopen-io/meta-doubleopen/blob/
e84f0c32663da9c743e4f1802042b733df0e36d7/classes/doubleopen.bbclass#L285

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit aa44a0f0eb5e260959ebd77f439a5d25b3c1aa2a)
Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
---
 meta/lib/oe/spdx30_tasks.py |  1 -
 meta/lib/oe/spdx_common.py  | 18 +++++-------------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1821dd7de4..862e57c3d1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -873,7 +873,6 @@ def create_spdx(d):
             lambda filepath: [oe.spdx30.software_SoftwarePurpose.source],
             license_data,
             ignore_dirs=[".git"],
-            ignore_top_level_dirs=["temp"],
             archive=None,
         )
         build_inputs |= files
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 9d1e22629b..013f23ae7c 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -169,28 +169,20 @@ def collect_package_providers(d, direct_deps):
 
 def get_patched_src(d):
     """
-    Save patched source of the recipe in SPDX_WORKDIR.
+    Save patched source of the recipe in SPDXWORK.
     """
     spdx_workdir = d.getVar("SPDXWORK")
 
-    # The kernel class functions require it to be on work-shared, so we don't change WORKDIR
+    # Do not unpack the sources again for the recipe using work-shared
     if not is_work_shared_spdx(d):
-        spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
         localdata = d.createCopy()
 
-        # Change the WORKDIR to make do_unpack do_patch run in another dir.
-        localdata.setVar("WORKDIR", spdx_workdir)
-        # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
-        localdata.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
-
-        # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
-        # possibly requiring of the following tasks (such as some recipe's
-        # do_patch required 'B' existed).
-        bb.utils.mkdirhier(localdata.getVar("B"))
+        # Change the UNPACKDIR to make do_unpack do_patch run in another dir.
+        localdata.setVar("UNPACKDIR", spdx_workdir)
 
         bb.build.exec_func("do_unpack", localdata)
 
-        if localdata.getVar("SRC_URI") != "":
+        if localdata.getVar("SRC_URI"):
             if bb.data.inherits_class("dos2unix", localdata):
                 bb.build.exec_func("do_convert_crlf_to_lf", localdata)
             bb.build.exec_func("do_patch", localdata)

-- 
2.43.0


