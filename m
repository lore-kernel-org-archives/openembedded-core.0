Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A76EEA871
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 00:44:18 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60684.1770943449306950837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 16:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=offhyhyR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.23, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFvgQbM5SYSxeKKBr4UO7mlizwpvbBQuPADSLZ6RcJT3vgz9kPnTUTyS76j0njZZCCSlH6lLwtiiMWAh3t3u/XpoR26EDfd6uwtejI10t7f3iXgXPOi5Ho0UVJ6LBW4Fhialg00WzghIIqNmU4Lw5UVu7H3JYkEGMeBGaM9EEBn5DZGOT7aDuV/QHXm4gXe3MPIJNT8kigvCnAygr3kfBHi8lVsdr1jO4kDnTIzSyorkvhctA9rulyWgEjwuZeu865D8t0lHoh8rhsEv88yB4fXxqE2gRaCyfWeh+C4Zq/Z9PJ2kvtWbU+BHPz1vhGXpfZoM91cil2f5r6JXrvh3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LseYfUis2Df1qk49gP91B0aTrq6ujG7Sd7ZY1h8pRUk=;
 b=vYL/VtPyZS/mB/MJUykguBozB0gcRlhkO7WgEBMh9PzuTCfnmwvPKUF6+TzkjdddFckBHIFkanuvObJ0SGrPql76r/4tu+8r4MpGqN2E978eYDaz+qIoPuwOac0Tse8M5RJiICAjzjwgwHIb8HwFl/SKRHHzhQMPcxojzUwqzfETIh8cRDkRFtnxcq7lDkOscoWxVqnsNYf0gDFkxWrixz85A96bJYrUYgOXaB89tZdDXZKoh37B6foiLmR5gjWK/ZJJGVF8dBXMzysB7VYpYw1tS53R6Ckz1uSuC9yELubjtMC2aDBQI+LAChWbXMf3BRdNuWL4NStP75o1rGbipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LseYfUis2Df1qk49gP91B0aTrq6ujG7Sd7ZY1h8pRUk=;
 b=offhyhyRSxMpgc68mOuJ3lIJ5cvk6QiWrUgMA2uiaDWfJfpRBOM2/gsVtyxDsWdsTS5rf5T+qo6FG8/hLwpzTCS2DkDD3mbiIonghv7jCLb8nvRdjMGOjFea++sHYBCPasY+b5kcVJNJJgTgX6XyfKNXy2iIxfuHnY5w1L1XhYU=
Received: from MN2PR11CA0019.namprd11.prod.outlook.com (2603:10b6:208:23b::24)
 by BY5PR10MB4211.namprd10.prod.outlook.com (2603:10b6:a03:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Fri, 13 Feb
 2026 00:44:05 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::d6) by MN2PR11CA0019.outlook.office365.com
 (2603:10b6:208:23b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Fri,
 13 Feb 2026 00:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 00:44:03 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:44:02 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:44:02 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 18:44:02 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D0i2Q1245343;
	Thu, 12 Feb 2026 18:44:02 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCH] reproducible: fix git SOURCE_DATE_EPOCH randomness
Date: Thu, 12 Feb 2026 18:42:53 -0600
Message-ID: <20260213004252.3371379-2-rs@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|BY5PR10MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: 324c7b1c-6fa5-48ef-416d-08de6a98fc9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6mRfumG95w5eO4qwvH8aMZPkwSVN7APT/d38NKPpVSfVYNhf9yfsycCkuhjR?=
 =?us-ascii?Q?GIG+eKfCVr5XJYIGfBUr+VVDzWqtzn7gnwh0NnYRJMI2gOP3G2DfXgl4tvPR?=
 =?us-ascii?Q?YqJFyXpJdC/NZpn2SmsbdYJvn3Xl4M7iSUbIwYA99Fheqo9EfmsQ8fonNMqk?=
 =?us-ascii?Q?Nx5jGM/3avyixWD1BRzhLV/XtjzbRtxDFhvThTB9uq65L66bZliA/7v+d+5B?=
 =?us-ascii?Q?620uzjoiYvMc1KmTlV1x8Cqfx3UC6l7pFcxIKszrN3t5awq2JDEbZ1UGvanR?=
 =?us-ascii?Q?jAyjJpFYYhodVx/gpaPcZFBZ+r9VSgq5plNWJkAuftJbdz+cAfX4o8kWdWOJ?=
 =?us-ascii?Q?6a/jthC086RdZZpx5TKEvURYZ4OC02C2hD5j1j8IXLEWkeD4cqxe3tk1+f+O?=
 =?us-ascii?Q?7Bu8qU3AQJ92qeac1HQCnJO6K4QTewiY6AZLJyPpxHvUFerW3Wbf+sNE1KWO?=
 =?us-ascii?Q?uZ5LJhDvIsdD3CylAMt3Jnj0G1YyDw65Zv6YvgHfUG6lvsTk/Yx45xBJ1K0S?=
 =?us-ascii?Q?Vk8txhquq2ziUYcunrB7HGxpZKv2SYDmKldU67CKNR2f/lAgZnAEezOqPtUx?=
 =?us-ascii?Q?2RX1Rjd2n5HC6lMPV8FKLYULwBw/uVlyop8nJpAeTLXUro2PYGPnbRaiBogX?=
 =?us-ascii?Q?qLdKmV6eCUHNm6Q6qQTWLpk6Uece+WkwqJzYWkOyn1mS7TPdzsHYIHSz0MaS?=
 =?us-ascii?Q?iuY+JUqlwpUvVF306LpKwJSPUiwRFs8B9dojGagPxvMy1n9STKhg65A4vgfq?=
 =?us-ascii?Q?AcGZxL+aPovqI78MLATvMNHmA7QRW+frPF6M2FyfUlWfQfo+ABnS8ENqETkm?=
 =?us-ascii?Q?disJdua1Id3rFskkn/BoiykMkDQFi+eRVJb3nsQjjKgB5E1EVF1URk2W88ou?=
 =?us-ascii?Q?zzrFJyAfXkaM25jOn5DVMZAOuDtDwyYVyXaBUXrYFv6fhi6PxoekQSmNQeqD?=
 =?us-ascii?Q?ljchTaEcX3yqsHQ1WXNDCf2Nd36C5SeQxHPR64PDLTCRi0Cf2crxnZByQx4c?=
 =?us-ascii?Q?snOfgatfAmsXqYmgITFiXRHfjozo1mXbheJkOMIfbusLBE/aR/6wq5JTu/Jt?=
 =?us-ascii?Q?z0zyL+gaBarcY8Jo2f/xPPNFFl+TyKuVhItIKwlZwT/9X10z6FhyPK4JSTEI?=
 =?us-ascii?Q?XqdH3c9D1GFlgW1IIq/nDJ8Q8vXZsOeHGmR5hdA6YPle/LCmHNokfaA6VNB1?=
 =?us-ascii?Q?w7K1ZCylzzg9kYVRXdMamDhoZXjfwFZhOv+92S0AM0zVWItr780yQOPrBKP5?=
 =?us-ascii?Q?MnXqfW27IA9bIU8nXAd/imSuOc0AeKICqsSoG86nw6JoWvfNhZw61P0xLVI2?=
 =?us-ascii?Q?FIxcYxpJaE+hZPIQVpGbmgrZVQMFBpoPrJpaw2VC8bpn9OaIAxHjzCfilBE3?=
 =?us-ascii?Q?zZXURW7J0zny6E6N6GgAfiNzbuc5Rd/6bThRkEW5gIYbaBxLwy0gbUvQEd8Q?=
 =?us-ascii?Q?BFlroslIlrYW1rDnQV/109PkbRdA9jUWGSG9EFJOKyxsGuIdya0hGRY2SxDR?=
 =?us-ascii?Q?YYj1TQ9DIeTMIU0CdrkB/ghJ6cpT0OSXpyaHBkUHZ+Ac/VxcVzSyiUri2jFv?=
 =?us-ascii?Q?ERNoHoctZElsMdYCwWBTNOjHWaLtqIF51a16XvRwHLgTsG8UOK8goKV2cvfN?=
 =?us-ascii?Q?gUwFkzkrxooSDI2dkH2FswgH9TKkyFcsY+IoySzvf6UT43zV/HC5BvbW/LDd?=
 =?us-ascii?Q?X47jUA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CrQnfeGAfu7xEMErcsvL4epRYe4TsFWEYRxisJOiRPQkwFBL1mDnCW7Yv3M7xZi9MmWWsqXvpMVUIty+/OJysB5szwWeUGrRN70593xt7c6nsnfm1bNsk1o/iIlYOTiA1iB9AC5Yhh9HjbHlr7+p7LJhp79oP9AcsSv4XvcEv2CIfeYUjBE+D3Hpd8lYDSgGvR6LQTGD/MgI+zpeu6QYp4858ESXaDjVdZ/Z3IIEcTiXPSuxyDCdk5/GAbwtviT95FRMiVuhU3dAJX03W43DPEZ9YLsfjayC/CeAx7gk6Zd25GJPkCGyByS+wNoQMzzr8e4NdvHAWb/f58iTjSsDMioY0hvqxM2XFVBKAmMejybTlTcGkMnaE6Z8qNFJTvyueZ2xUOMGou+MmaG6d8asIYUVGzDK4t7CQpgKXRh49SYqVNNThGdHUeCtLEFmpBKi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:44:03.7514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 324c7b1c-6fa5-48ef-416d-08de6a98fc9a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231077

From: Randolph Sapp <rs@ti.com>

Anything that defines multiple git sources should have the largest value
taken when calculating the SOURCE_DATE_EPOCH for a package.

The previous iteration actually introduced some degree of randomness, as
it would stop on the first git repository reported by os.walk, which
does not assure any specific ordering by default.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

To address issue reported here:
https://lists.openembedded.org/g/openembedded-core/message/231076

 meta/lib/oe/reproducible.py | 64 ++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 36 deletions(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 0270024a83..06ceda8d7f 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -3,6 +3,7 @@
 #
 # SPDX-License-Identifier: GPL-2.0-only
 #
+import glob
 import os
 import subprocess
 import bb
@@ -74,52 +75,43 @@ def get_source_date_epoch_from_known_files(d, sourcedir=
):
         bb.debug(1, "SOURCE_DATE_EPOCH taken from: %s" % newest_file)
     return source_date_epoch

-def find_git_folder(d, sourcedir):
-    # First guess: UNPACKDIR/BB_GIT_DEFAULT_DESTSUFFIX
-    # This is the default git fetcher unpack path
+def find_git_folders(d, sourcedir):
     unpackdir =3D d.getVar('UNPACKDIR')
-    default_destsuffix =3D d.getVar('BB_GIT_DEFAULT_DESTSUFFIX')
-    gitpath =3D os.path.join(unpackdir, default_destsuffix, ".git")
-    if os.path.isdir(gitpath):
-        return gitpath
-
-    # Second guess: ${S}
-    gitpath =3D os.path.join(sourcedir, ".git")
-    if os.path.isdir(gitpath):
-        return gitpath
-
-    # Perhaps there was a subpath or destsuffix specified.
-    # Go looking in the UNPACKDIR
-    for root, dirs, files in os.walk(unpackdir, topdown=3DTrue):
-        if '.git' in dirs:
-            return os.path.join(root, ".git")
+    git_folders =3D []

-    for root, dirs, files in os.walk(sourcedir, topdown=3DTrue):
-        if '.git' in dirs:
-            return os.path.join(root, ".git")
+    for mainpath in (sourcedir, unpackdir):
+        gitpath_glob =3D os.path.join(mainpath, "**/.git/")
+        for gitpath in glob.glob(gitpath_glob, recursive=3DTrue):
+            git_folders.append(gitpath)

-    bb.warn("Failed to find a git repository in UNPACKDIR: %s" % unpackdir=
)
-    return None
+    if not git_folders:
+        bb.warn("Failed to find any git repository in UNPACKDIR or S")
+
+    return git_folders

 def get_source_date_epoch_from_git(d, sourcedir):
     if not "git://" in d.getVar('SRC_URI') and not "gitsm://" in d.getVar(=
'SRC_URI'):
         return None

-    gitpath =3D find_git_folder(d, sourcedir)
-    if not gitpath:
-        return None
+    # Get an epoch from all valid git repositoies
+    sources_dates =3D []
+    for gitpath in find_git_folders(d, sourcedir):
+        # Check that the repository has a valid HEAD; it may not if subdir=
 is used
+        # in SRC_URI
+        p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', 'H=
EAD'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
+        if p.returncode !=3D 0:
+            bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.=
stdout.decode('utf-8')))
+            continue

-    # Check that the repository has a valid HEAD; it may not if subdir is =
used
-    # in SRC_URI
-    p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', 'HEAD'=
], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
-    if p.returncode !=3D 0:
-        bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.stdo=
ut.decode('utf-8')))
-        return None
+        bb.debug(1, "git repository: %s" % gitpath)
+        p =3D subprocess.run(['git', '-c', 'log.showSignature=3Dfalse', '-=
-git-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
+                           check=3DTrue, stdout=3Dsubprocess.PIPE)
+        sources_dates.append(int(p.stdout.decode('utf-8')))
+
+    if sources_dates:
+        return sorted(sources_dates, reverse=3DTrue)[0]

-    bb.debug(1, "git repository: %s" % gitpath)
-    p =3D subprocess.run(['git', '-c', 'log.showSignature=3Dfalse', '--git=
-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
-                       check=3DTrue, stdout=3Dsubprocess.PIPE)
-    return int(p.stdout.decode('utf-8'))
+    return None

 def get_source_date_epoch_from_youngest_file(d, sourcedir):
     if sourcedir =3D=3D d.getVar('UNPACKDIR'):
--
2.52.0


