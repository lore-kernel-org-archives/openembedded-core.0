Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D5FC71150
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 22:44:50 +0000 (UTC)
Received: from CY4PR05CU001.outbound.protection.outlook.com (CY4PR05CU001.outbound.protection.outlook.com [40.93.198.16])
 by mx.groups.io with SMTP id smtpd.web10.28.1724885079854338599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 15:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=YGkNyYlo;
 spf=pass (domain: ni.com, ip: 40.93.198.16, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVYGb7/PeCFbTnQMlEWS96NFwQgHXjTpwh225BW5hxnQKZep0OvGNamjSx205UappjCgoKs86ccjJXo6aizoHxR+P7FLuZvz0xZz130rRmfkWq02jUn2bnNW5myal8oFdG/w53azK+VZD4aH+CzhjnIyyHumd5CNw5wzx9+gxrfSdLdSq/CYzoZGZBm1q0LOwWmOIcfl54Z0Jzz2iwaU4iybYhn/LAR5RoHl//1qrEufxRWYqlyjgSmS3SLjNo1NsmyC1cYByMhhfLQSwcC5yc0tPX0uK4MwnwKopZwWYf0oSCWtS+WEIVjkdPqLMWk06h2MxWWsO4tAI7cRXbMR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wf5HX0qdQClVxVDYVRf8rGwDk1avl02YjMrY9tPd0/4=;
 b=rlrZa8+ntCEYDJJFz4msx5BHr/SHskdRx96a2QO1hpXo26DFaaozAnV/Lq71OxeMRjKZ4dkWXKuT1OAP+1UDg7r0g2pSZ7M27dZBVe9fLR2sHTpGdXCmJ5DUY2s3gPzxhJNsVbNA04c7g2pzNW01eTUA6M1emFxqxxRh/8tzk1P8DFb2fKlIlOHxkVlm8QP4t9RnTa3xv+p2KHzJ4/e7hjccxGqU2oYwj3Gt1SZXcfBUH1WUIbrJt3MH1f2dB7UCiO5CO5cz9yRrfEO7/dd0MI51+XhG2pKSxV+e3Wj00oE4QJeZhC4SR1GDW+edJXmjQ35wSQ1iQiKinrfDeCsIFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wf5HX0qdQClVxVDYVRf8rGwDk1avl02YjMrY9tPd0/4=;
 b=YGkNyYloyNiJ3avkSQdX2pq5sEveuelOzOeJAoRVBZ5Ek7zOHnvzbtbCrdguui31RNgxMtV7/xagSmg8HC5i5AW0bh8JopStlazCPUg82VDrjhzjMDS1rOYtiXuxvCJKUVMPo+cXWxQTIKiLc7lbC8ildoVMfypKFVZGYN0KKyc=
Received: from MW4PR03CA0265.namprd03.prod.outlook.com (2603:10b6:303:b4::30)
 by CO1PR04MB8219.namprd04.prod.outlook.com (2603:10b6:303:162::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Wed, 28 Aug
 2024 22:44:35 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:303:b4:cafe::5b) by MW4PR03CA0265.outlook.office365.com
 (2603:10b6:303:b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Wed, 28 Aug 2024 22:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.2 via Frontend Transport; Wed, 28 Aug 2024 22:44:33 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 28 Aug 2024 17:44:33 -0500
Received: from cvadrevu-p620.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Wed, 28 Aug 2024 17:44:33
 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Ming Liu <liu.ming50@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Chaitanya Vadrevu
	<chaitanya.vadrevu@ni.com>
Subject: [kirkstone][PATCH] grub: fs/fat: Don't error when mtime is 0
Date: Wed, 28 Aug 2024 17:44:05 -0500
Message-ID: <20240828224405.3227977-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|CO1PR04MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 8050a697-dda0-4896-2c09-08dcc7b2fcd2
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bPTL4j3UJOYYEdlZFsEmCw8XklcCsNfoRpDEPoqRKL6wJAFBOGfpZ5TnNYVy?=
 =?us-ascii?Q?KwMTFzeD7J4MqhB4Zq9YE/P5Hw6tBWtAV7btEzSIT/VdmeMGoZSRzyUN3pqw?=
 =?us-ascii?Q?koG3j4umSnNofIo74j6Pi5j0BuWSFrefz3ZFDO7O5BmRw1ETVj/rD+nkRuCa?=
 =?us-ascii?Q?PJZlKzFCqIoFTJlnoqlIEUImdcCc6omLrF7pIzLzQ60Qj1mgvCFV6geet9XP?=
 =?us-ascii?Q?DPW4/raVq7edpZVVGZ/WM1j8AitUxhOUWBtv85ttKEGGXqgSKl8AZF5NhElN?=
 =?us-ascii?Q?iT/Rnbs0MvEdj/80Sl5VAbkT2DzzQnU6IEh0fxTkvJsXHITrH/S25TAOkLmS?=
 =?us-ascii?Q?ksdWbGAic0uG76TESnJT14VZkU6kWOEaqqN7QTt1FAGy+HiZWK9pxs6p9fYw?=
 =?us-ascii?Q?2gYm7dooBLN8aJj8bNw9v0ZWgacIZiJi2Z6dqJS+Ak2zrwVJaW0R3Ol+ST6J?=
 =?us-ascii?Q?u5E1/XdcuKqxCcKzlUdOLAJ4A7fRnaaV2wgydQA+aKLibl4zpSJ2XhKm+dZ/?=
 =?us-ascii?Q?Lt06fcJM1cy3S2gzDWQ1IuWqhnhMHdnPvyTC0NBVkFNj9cqf9UNXVHcY9avR?=
 =?us-ascii?Q?Guxk3tWkVFUXULfddrUcMow1CyEr7KM5E3yX9GUft52hGguumfRz+IdYfHzm?=
 =?us-ascii?Q?3W6hRq+bsZVJxm0q6O6rdVLozv50wV0KyJccYvONNr+sWDQTA2LdRuvN1SyK?=
 =?us-ascii?Q?Pvdl3mjw1RPz0bTdkr6xMP6OLL0pDcandcC1wKHrL9DnlIVa8kFFMCiYZsNS?=
 =?us-ascii?Q?GyMWdZIrFsvWYGMnejPeGsI31yvCx2NCSvS5bzw7f4saNYyU+tBJK+4ZSaCO?=
 =?us-ascii?Q?A84PwoLNHwQlpIPpReG4RS4qg3WN+KNMBQmxB9YH2r9/hgiqzzjEdbdsod3D?=
 =?us-ascii?Q?/vnlxrYa1j8WaVWtcyn1UHCr8wxv5Hm1ZHfQSOlz7HhqhJhjS4wMcpC6l3J/?=
 =?us-ascii?Q?oDRaerlleUQClypZDE1c0EhW24/+KS77aCJK+IHH5YsQGyLt5ezykxv7wc2X?=
 =?us-ascii?Q?mw3sVqIwOnj1q0xtvYLD1nw/6A3t8O25ZX++1jjwtD7lMg7xjrUkqhy97/n1?=
 =?us-ascii?Q?vzQZ2LDBNn1k2Ev1aJWnOP3czSq/M0gZc24xrl4p/zfTb+wV3tPFG3meo3bO?=
 =?us-ascii?Q?aTWGOTgjzqaWCvwDsk2ylHKGrepbhkq+P8cpBCQDl9L3xUIGVyhMzW7u8Ru0?=
 =?us-ascii?Q?yVl9s73VUzYAEKkTEX/tN90KLfXwGYeItv6/6PqpKDC5VJ0KmNMvW5stAAes?=
 =?us-ascii?Q?iRkVJJIYH8YsHJLrhpHpPGFExDQbqZjgJ6/XxCT+3V+6mqItQ4LDQDCW1+JM?=
 =?us-ascii?Q?GfuT1GvRl/I5xAqwjzy5btjMz/SKJOz2fveY6YX8WwUEHnjdfRuAVoU0tbBm?=
 =?us-ascii?Q?tQpCDYuLjm6GP4hjMw9BbE0IfDK8lPz7AvPRDzyDrZUrT/is8A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 22:44:33.8256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8050a697-dda0-4896-2c09-08dcc7b2fcd2
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8219
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 22:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203897

From: Ming Liu <liu.ming50@gmail.com>

A issue was found when I run "runqemu genericx86-64 ovmf", grub failed
to boot, it's a known issue has been fixed in grub upstream, backport
the fix.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51eab4bb0cae46c9c32d28986eb97badf47594b7)
Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 ...1-fs-fat-Don-t-error-when-mtime-is-0.patch | 70 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-whe=
n-mtime-is-0.patch

diff --git a/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime=
-is-0.patch b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtim=
e-is-0.patch
new file mode 100644
index 00000000000..a5fbd58f468
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.p=
atch
@@ -0,0 +1,70 @@
+From e43f3d93b28cce852c110c7a8e40d8311bcd8bb1 Mon Sep 17 00:00:00 2001
+From: Robbie Harwood <rharwood@redhat.com>
+Date: Fri, 15 Jul 2022 16:13:02 -0400
+Subject: [PATCH] fs/fat: Don't error when mtime is 0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+In the wild, we occasionally see valid ESPs where some file modification
+times are 0. For instance:
+
+    =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  EFI
+    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  BOOT
+    =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  BO=
OTX64.EFI
+    =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 [Dec 31  1979]  fb=
x64.efi
+    =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 [Jun 27 02:41]  fedora
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  BOOTX64.CS=
V
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  fonts
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Mar 14 03:35]  fw
+    =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 [Mar 14 03:35]=
  fwupd-359c1169-abd6-4a0d-8bce-e4d4713335c1.cap
+    =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 [Mar 14 03:34]=
  fwupd-9d255c4b-2d88-4861-860d-7ee52ade9463.cap
+    =E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 [Mar 14 03:34]=
  fwupd-b36438d8-9128-49d2-b280-487be02d948b.cap
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  fwupdx64.e=
fi
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [May 10 10:47]  grub.cfg
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Jun  3 12:38]  grub.cfg.n=
ew.new
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [May 10 10:41]  grub.cfg.o=
ld
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Jun 27 02:41]  grubenv
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  grubx64.ef=
i
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  mmx64.efi
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  shim.efi
+    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 [Dec 31  1979]  shimx64.ef=
i
+    =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 [Dec 31  1979]  shimx64-fe=
dora.efi
+    =E2=94=94=E2=94=80=E2=94=80 [Dec 31  1979]  FSCK0000.REC
+
+    5 directories, 17 files
+
+This causes grub-probe failure, which in turn causes grub-mkconfig
+failure. They are valid filesystems that appear intact, and the Linux
+FAT stack is able to mount and manipulate them without complaint.
+
+The check for mtime of 0 has been present since
+20def1a3c3952982395cd7c3ea7e78638527962b (fat: support file
+modification times).
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/comm=
it/?id=3De43f3d93b28cce852c110c7a8e40d8311bcd8bb1]
+
+Signed-off-by: Robbie Harwood <rharwood@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ grub-core/fs/fat.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/grub-core/fs/fat.c b/grub-core/fs/fat.c
+index 0951b2e63..c5efed724 100644
+--- a/grub-core/fs/fat.c
++++ b/grub-core/fs/fat.c
+@@ -1027,9 +1027,6 @@ grub_fat_dir (grub_device_t device, const char *path=
, grub_fs_dir_hook_t hook,
+ 					  grub_le_to_cpu16 (ctxt.dir.w_date),
+ 					  &info.mtime);
+ #endif
+-      if (info.mtimeset =3D=3D 0)
+-	grub_error (GRUB_ERR_OUT_OF_RANGE,
+-		    "invalid modification timestamp for %s", path);
+=20
+       if (hook (ctxt.filename, &info, hook_data))
+ 	break;
+--=20
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.=
inc
index e6c6cd98b43..2718379474a 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -40,6 +40,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_se=
t_ex.patch \
 	   file://CVE-2023-4692.patch \
            file://CVE-2023-4693.patch \
+           file://0001-fs-fat-Don-t-error-when-mtime-is-0.patch \
 "
=20
 SRC_URI[sha256sum] =3D "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62=
aa3f53ae803f5f"
--=20
2.34.1


