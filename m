Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEBACA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:56 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.web10.64612.1756215709758046320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=qfEOllwq;
 spf=pass (domain: axis.com, ip: 52.101.65.19, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ru5tfusQtbLPq9w8elw5wLY3sGI83ucKUm4efsItMss8TSlUSoVQPFvPRMLEIfjUJrEoRLt/mRT/lKUtQuTbDNvtKdvB3XEnCqtsA4+PLMd9sdXFzcknPxrST37Di+CzzJcJzCZ0h51JECXxfuUvEZC6VzDPEX/F4cOQhSY9VNGAHjNgCC76Wsa2/WuRrlB/f95S5W1OES7gCujtCpVHR9A1ewApUEmofleRsJ0lGAfubmybJE+zhJK8XXAauVEfgUkA1EJobDZ2jmrU/hGgLtrbRTg8RNrJ9sb7PiLrsAGGzst+qv1DcQlStZ5DnGNY+UhcCTyharQJARODJcJvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tz0fy17X66WssF5e1bWgAZ465GSp8aK5U1mIAzct32A=;
 b=tAIewJfwRVEMFg8xhzF6udhEAP03dWjI+xlAUAvGr0qbmiP4NnohKCurLDDIqaqX70TbtftXwT2hT5iAknhT/hBTuFGlKU+hH9j9pjo02+ob+KasTerSEXOluAPnoNUTeGGa6uIJetUVQtBtCSNkcVnalvg/4eKAHPrWyt48d8G1uGkz+0JXoE1arU5TfD7Cl+YwMBJLS/FuYAF+RLDYA649hnP8Dz+TaWzwsh10k9eDRAeQT4qSnM2UOAa8qoo8482Py7TBMCPo3CJzeKa5NhibaKtwq+Vhxxp2sFb2g+6BPajgZKn7pUZu7KAqXVbKFZgYNQnqqHNtlZOPFVGu/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tz0fy17X66WssF5e1bWgAZ465GSp8aK5U1mIAzct32A=;
 b=qfEOllwqg3z6tc3WwP8iLM5QWrgcLI8BgB2MK+2zc+K/LTTjeAM8Vx+jgSRDpfbBijRmNfVwkPJVfZMy8aa8M8Go6bNhSPmt5x0M2fGCku7/xatZZRQ3zPZNLzZwDCtcnlQwVOU2LPy8SwQiOG7OrlPkXWgRHfs9MCehCr/eayg=
Received: from DU7P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::18)
 by GVXPR02MB11013.eurprd02.prod.outlook.com (2603:10a6:150:21c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 13:41:44 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::4c) by DU7P250CA0029.outlook.office365.com
 (2603:10a6:10:54f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.22 via Frontend Transport; Tue,
 26 Aug 2025 13:41:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 13:41:44 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 26 Aug
 2025 15:41:43 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 26 Aug 2025 15:41:43 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 11C1439E1;
	Tue, 26 Aug 2025 15:41:43 +0200 (CEST)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Ola x Nilsson <olani@axis.com>
Subject: [PATCH] sstate.bbclass: Open file with context manager
Date: Tue, 26 Aug 2025 15:41:34 +0200
Message-ID: <20250826134134.2164051-1-olani@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|GVXPR02MB11013:EE_
X-MS-Office365-Filtering-Correlation-Id: 1051a798-2394-4e35-3347-08dde4a64be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vDEbPByWCa47ASWpnFRZc9kEi3IgZcjUYRzBJp4XZj4nqvrkztotdrcbTLi1?=
 =?us-ascii?Q?waGxFDcUCLxgHcVGs83iFflQQEK1+2JuLgNmRrdMGQnpUDvoVfDPmz1snCO2?=
 =?us-ascii?Q?0Og2teryZd8BmQtWnulzqkzpXBeIQS/rwDl+39Tr/uMACsYmWL9FSenSlS+C?=
 =?us-ascii?Q?0AQYHueN5M+7UMuMj20lCyIdOPQYk3HH3TtIqmo3uKR/BTHQmCOktffvFbcf?=
 =?us-ascii?Q?DCRIK9AZF/3RavK/oiVM+HxBV2KTbPHlK6fwzoRXKi1TtLJY3LtF+/f10tkw?=
 =?us-ascii?Q?h42V9KOlXX7IY7lrf0iEepCYflYRY6GRf/MtDZI1zxoG+QN2wwUW7esf9VQN?=
 =?us-ascii?Q?lQMYuWNRZGVODmyY7jF/UOHPBa0v9Vs8CoE/dlFNUGo39wgWECUQkM6uynbA?=
 =?us-ascii?Q?8WozgSjZNu9wOixEDMOOQ1kJ/vX/6xm2hvq2Blq0lXT3jCbaGuB1R7xLMsBo?=
 =?us-ascii?Q?aZYDv3EsAHW7j+Uv4BC0X+Us0P6vlC6J5L5ei78DYHEeJhHVf1uqfkFyoerw?=
 =?us-ascii?Q?N3P8hcoJui55QigHMMWaIuk0AtY19pDmtm107tRIpjOTtHTZjO4hw/Ix6NK/?=
 =?us-ascii?Q?LRAwrhxxgmo1NbMIQ7ZzyGyl7a0ClP34zMM9PLE7R1m2t+9f7QKv02/3Y5mL?=
 =?us-ascii?Q?1iIgd0NRjH88YXo8YURV8XMxg/0sMXVMdeyO67srLhWLGDiEEL+lJTt0TlhN?=
 =?us-ascii?Q?lTaDRZCq+/8bLjbZg0nypKGJGn0UqN05Hu6Q4RC3NM/n5vhnwIslI02QJmHQ?=
 =?us-ascii?Q?pRhlWIlfNSmy6qie3ZuIh+MlBtJFlw6sFcCPri/HM/rL1Qlxs5UbR6hw0pLK?=
 =?us-ascii?Q?5RnLdepT2n3wl45+mXzJYJ32d5UABSlpBjokIuaB9ppIxq6sgew8yNw+ib5T?=
 =?us-ascii?Q?RBkWu2EVzSr+hLsBvPgz2Uu0aJh9Vxrx2DZ6HDfWT9If2ExE6i/k5Rt0CWMK?=
 =?us-ascii?Q?nVKCSayPYPiC6OBfnT8wsWIhimAqDp70vfHdJ/8S3A3hgxPIPi7NiCj/5xdr?=
 =?us-ascii?Q?Y3xU0olrpB99SM2w2XDfiec2DRgPM1YtEdFT3zQ9U2Wh/cyk+vPuuOeROPeh?=
 =?us-ascii?Q?rPXXkQwJ2lAy91liCm33C8JzSdrD7Wr8nZ0OANZbU0RyK1e5t8hOkVFK5tPf?=
 =?us-ascii?Q?neBhCN2x72Nvbtgm2ZUsKpwpQR5DvPuUJpn+iszQrylcUS36torbu22OK0eZ?=
 =?us-ascii?Q?lmMUwrdRujmnDZIBRCk/zDTusuRAnNCuLL8kv92A2CBGRcWMnKnUoqMvy5XL?=
 =?us-ascii?Q?RnKUpUWFm8WPrPLdIcBDJZ0LxnJtmED6n72xk+jM0bqWWUwp2QpFvsWaj61e?=
 =?us-ascii?Q?DIKIKcXSe9EImFr/4p+RWnn2YEKMGAhdbgeMRIyyBQle6fVuyuXR5mF7xUlt?=
 =?us-ascii?Q?yEvTISK1HFT1HXCKOAxUviQKqD3k02I8eFDDqp8nw74a+eiPy3InqWEarf3a?=
 =?us-ascii?Q?KzgcCMERN5zidk0wr/Y1OmqQjPFtcIg3nj0KghCsb/yHQQoSMg/wkiVRwAKR?=
 =?us-ascii?Q?BR0EcAslZvP/v4laay9VaTb2iw5M0YEI3izW?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 13:41:44.4764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1051a798-2394-4e35-3347-08dde4a64be2
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB11013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222460

From: Ola x Nilsson <olani@axis.com>

In sstat_install and sstate_clean_cache.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes-global/sstate.bbclass | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index e3d6373b3f..2fd29d7323 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -306,18 +306,17 @@ def sstate_install(ss, d):
         sharedfiles.append(ss['fixmedir'] + "/fixmepath")
=20
     # Write out the manifest
-    f =3D open(manifest, "w")
-    for file in sharedfiles:
-        f.write(file + "\n")
+    with open(manifest, "w") as f:
+        for file in sharedfiles:
+            f.write(file + "\n")
=20
-    # We want to ensure that directories appear at the end of the manifest
-    # so that when we test to see if they should be deleted any contents
-    # added by the task will have been removed first.
-    dirs =3D sorted(shareddirs, key=3Dlen)
-    # Must remove children first, which will have a longer path than the p=
arent
-    for di in reversed(dirs):
-        f.write(di + "\n")
-    f.close()
+        # We want to ensure that directories appear at the end of the mani=
fest
+        # so that when we test to see if they should be deleted any conten=
ts
+        # added by the task will have been removed first.
+        dirs =3D sorted(shareddirs, key=3Dlen)
+        # Must remove children first, which will have a longer path than t=
he parent
+        for di in reversed(dirs):
+            f.write(di + "\n")
=20
     # Append to the list of manifests for this PACKAGE_ARCH
=20
@@ -481,9 +480,8 @@ def sstate_clean_cachefiles(d):
 def sstate_clean_manifest(manifest, d, canrace=3DFalse, prefix=3DNone):
     import oe.path
=20
-    mfile =3D open(manifest)
-    entries =3D mfile.readlines()
-    mfile.close()
+    with open(manifest) as mfile:
+        entries =3D mfile.readlines()
=20
     for entry in entries:
         entry =3D entry.strip()

