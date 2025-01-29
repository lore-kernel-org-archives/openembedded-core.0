Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C36C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:15:38 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.50])
 by mx.groups.io with SMTP id smtpd.web11.19508.1738174528091904354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=eOGRjz/2;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.100.50, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ3Umn0aR5N64yVM58CNh3wsyq0drZDZT7LcxrASOLwvtuxh5ZCWtwv2gKDBWjrGVb+/FRE7+FlD9ZZXxlBc87/7NWST5zc50fN3DjX38RnboPS/0x/2rCTDzihNuvWjhF0SC53BR8nsjromluQU+UYSQ6m2SEq9dx9qx0PjUBt4mpaoDHqsYU5HocNyUI4fF5pdXrQPNkWUr5wZPKoQznXvM3j97iHxyRrWT1/YvFDd3TLdt19H/+AEKmVjmZsrx7hLW3rI8N3gDcCX1yU6RUzHnstoHwUL8KJVGbfVAZ2KJgiLiBLLLdgloJaHtdsKj2304DXu43R5SfK9CyabNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZxAs3OZReTsx692I5e2LWPsluISO1jrE/4TUjRHMkk=;
 b=yvH3OXfaUdagND5C5FVAddNb7GZJNPy4ETCKWq4E9E26ssOOGnZMFSVT/ckgxpBCB6jzSkzNrHTULG67bByrwmto0A9fok2824YJeUYoOu/C2819hj+CF+5q4mdBf4ECJrn7Dh/NcGoQcsgakVF3w5zxl3R2+iLHdWhcKpKqaMM6ZVTopu+Ait0HJMXjD6tbyob/tUD7RtUXo6NeufzBibGvzSoUDUlb+eD4EltgMaIcHy4FwAxSnDOZEnyTV8+BUwSC2ej7YvBgYuSfo0eku2WAqBLsJPBgMQuskyeYUPBohZrRYdejHDexh1o+skFhn4JlsNRPNX9omJCbVBLVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZxAs3OZReTsx692I5e2LWPsluISO1jrE/4TUjRHMkk=;
 b=eOGRjz/2rINK/wNb6kYkHoUcMEc/i7ZUFxW+E3S5Wz7KoMQe1IPmEYinDuL7Y01Ylf/4LMxpmm8Y0orBPZ5R2VNpPtSqi7LgiEiLj2SxerK+01UeLCW4UMEBMstgzzn0eoGv9m6o5S8h2IvQBjeq8v5oHZawG0wnpRkiVMhq+y547tA8jtMGHkoJYqXjYi0sbNVTPhQCQtBewI1ocr57ReTCcv3Ro32y8whgXZxx9UT1q7ABJOd7uKSwbDIiv5Z0xTmcQQC3L9l2paM68lF29Zghv75J0j9oBmM8C5P9Tzd5ku2OvB6xDMMFuHk+f9Ddf8PD/iP+dQ9owAH/akIDng==
Received: from BL6PEPF0001640C.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:13) by DM4PR12MB6493.namprd12.prod.outlook.com
 (2603:10b6:8:b6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 18:15:23 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2a01:111:f403:c803::3) by BL6PEPF0001640C.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Wed,
 29 Jan 2025 18:15:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.37) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 18:15:22 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 11:14:41 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 4/5] devtool: standard: simplify get_staging_kver
Date: Wed, 29 Jan 2025 13:14:55 -0500
Message-ID: <20250129181456.1826467-4-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129181456.1826467-1-chris.laplante@agilent.com>
References: <20250129181456.1826467-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 597eb987-6e01-4ea5-87cc-08dd4090e595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0zlaHuKj5XzD5DU8xPX/FTTFgb1YgxyL8HFykVmuUVjqUH8tbrA4yPUfCUWz?=
 =?us-ascii?Q?lABPIwuOPurCebCnSpm5+tmPebsTnwjaUHISfRkcV3QRiUSrUWQCOKBqf0mk?=
 =?us-ascii?Q?aqPw9UGcON4AlR++Mx+p3tuDE30fHSKJ4RuowwfPpteHHUB/7xvp176rwM3Y?=
 =?us-ascii?Q?4WK1zrMH6w7UE5XNrzw7rdnu818RkoX2NpO3LxQAEziGoB54tfq+RPnt4p9F?=
 =?us-ascii?Q?/exzguADJIvhXOgVe4IyhNNtRi2rb6Iqw2Oj6wvit13a+qYwf2w/qJkE/4Ec?=
 =?us-ascii?Q?nac5swdHUsZFrJzXe66u7YgMM2DrWxboTr5tM25IRGhpth/fFif9Fs+SUk05?=
 =?us-ascii?Q?GWix3HZ/SnELcF3v/Lzzv37ZtdYaFdSrauOIAmoOzO3HPbF0MsLG9Cs5K6Kt?=
 =?us-ascii?Q?7rZ0wD3+uhE/9xq57mtA4J6Wh/o/LLfUeUYpUNF2rOQtWvFLdLWdPTW8pIWq?=
 =?us-ascii?Q?jKV4P75gt0UVhHqSSQGGEhXxK8mflONCmRR/eYBB6J1YnjftkWgXMIz20TpW?=
 =?us-ascii?Q?Q7tdUlzz37wISpb2I2OOFUcCwfXYG0ZgXcI3LNPw105lR357OVWyr7JcO4OD?=
 =?us-ascii?Q?3T4gHpfc0B0/y1CKl1OHsu8u6AeAqbK6Ok9c/z8SmD2BQYsxevbKXFWuQwJA?=
 =?us-ascii?Q?uQf7lrlduE3oHXrvROtqKRPufw6DxvVrEmZO9VTl4hEYncLg5lm97CstBfoI?=
 =?us-ascii?Q?nrfYSK9VmtWib5iSowSu4traGsqzpeTFBDV5tirgr3ySQZZw79NM+pyqZiFD?=
 =?us-ascii?Q?09C7LYFt9wtc0oqNxcVC/VSkJuS32GfHccMMgbYJTTdIx6D2vHwjdOS5LyAs?=
 =?us-ascii?Q?N/7VAo7IxvPltdbsRrKQ8vrQVh/Y+B2mHGQAIFq72bluCFFbgEb9Lsgh3fp0?=
 =?us-ascii?Q?Crzgs4oxfWDTyPDqy91+ct/G608OYEAWS/eDJVocICIYSkZsUcB3fq8y3KHU?=
 =?us-ascii?Q?HGuJUdgRAtQoXtaEBiS/+xyo7tq9k4DpYyCp5FnFRoxyCDF7vW3oeh8ZF8zN?=
 =?us-ascii?Q?GZBKHgPfFPLaHHQ9IOUZRw0QSm0XWfLDmdaiT2WBBHPdXPCVnOz7K9CBu0l2?=
 =?us-ascii?Q?TQVzrbgVq4t+8WgAJlzhL4ZyPuv45YNG8IT32qTS3ETMmrGNWNAnvO/e89Kk?=
 =?us-ascii?Q?vTch/kOLPeVd1Pvvcc/fMWu+UrvUR9neWiTmpmtQKtVwbXaC4JTyFK8yYwV+?=
 =?us-ascii?Q?zt/VJQTOUFuVvVKDUuG7yUFXd1ldYqFPdNGKAL1sL45UumHncQ3eRzgX2fP6?=
 =?us-ascii?Q?p2KWW50m0s8fW1jEL/laATXt1/hhNbLuXty7D3o+KKYSy1YdJYxNs+OiEl0g?=
 =?us-ascii?Q?yrhPQCRsKpDBQ7wUYuuNgaCJ25TaJFj1HaEINFZuCXgNP/nq0ZZ277dCg3SW?=
 =?us-ascii?Q?qcF5oc0gE0gnAFtXf8Z9Hzrg2B2FB7slqnRLUpr03YpfrzHlls/erN+x42D1?=
 =?us-ascii?Q?FBc5MsWP9g5M9+vgYA93wwpuJzJ/GCL9QzLu2gxrvjs/QKn3XBbwvtfW1mph?=
 =?us-ascii?Q?dqb74isPf9yAc84=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:15:22.6478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 597eb987-6e01-4ea5-87cc-08dd4090e595
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210406

From: Chris Laplante <chris.laplante@agilent.com>

The goal is to make this more Pythonic, as it was a little cryptic the
first time I looked at it.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/devtool/standard.py | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 20c94616b2..0cdb9c6cfb 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -726,15 +726,13 @@ def _check_preserve(config, recipename):
=20
 def get_staging_kver(srcdir):
     # Kernel version from work-shared
-    kerver =3D []
-    staging_kerVer=3D""
-    if os.path.exists(srcdir) and os.listdir(srcdir):
+    import itertools
+    try:
         with open(os.path.join(srcdir, "Makefile")) as f:
-            version =3D [next(f) for x in range(5)][1:4]
-            for word in version:
-                kerver.append(word.split('=3D ')[1].split('\n')[0])
-            staging_kerVer =3D ".".join(kerver)
-    return staging_kerVer
+            # Take VERSION, PATCHLEVEL, SUBLEVEL from lines 1, 2, 3
+            return ".".join(line.rstrip().split('=3D ')[1] for line in ite=
rtools.islice(f, 1, 4))
+    except FileNotFoundError:
+        return ""
=20
 def get_staging_kbranch(srcdir):
     import bb.process
--=20
2.43.0


