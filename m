Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A49CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:52:16 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.59])
 by mx.groups.io with SMTP id smtpd.web11.2155.1758037934673341099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 08:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=C64thOCt;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.209.59, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBBFpnQg9saEZoGHa9fg3WrS1QTbSA65o6O6Ogp1kwNJjRQRIEjMxtCqJWOpYVXpgP+2VfxcpOp/L/5eCeCeiAPzUAXSn6g7LCwShWLaQ5AwtdHsOXdCI2t5eM+JeutzvxHsO2sAXwITJmn3S5a/3Kh3czmhgr8MVFxOIDRSrNZjZsPMMPCgE/OvwiXznbtcO8pFXG2kVehYM5300PR6fXBWnblpUaDA9C12wUcOPH0jwAlZ/G2tSNCmsAGZAB0IUg6+S1oUXFYJQi7gZDbfx6Jtx/gtxzO65Hg4Hld5UZaoZouhOMpINbdfcJAdg9CekUwD14L5+sQyVKVny8TlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdoRi9pFrKIHAm3KgGZ0K5+8RMAh6qkPH+lWwhgiQkw=;
 b=vEtVblkBGUHeHsPhZv0r7ZbYVksPya4qmLByCUj6cIef9WS5P1zAIBT80rkC4cwDD8EXHSYETaBcHKZbPgFWa+vs8WOQ3cxnI9cIjDnoxrWp2l5A7NkDXMeEMQS65s/XFZd1j0d7F4xlGT8mDsyvAoGW5CA5hcX/onvZfLgFqBh/EXcPa/wvSfP17P72DN9iJIHF19pqN0KutJTOBZTIkahYJ/w+/GLMMXlU/85b7BPE0eB+1CdObhOTK1Q2R6+bMylgJrv4s3mfBaXy+/NPGwRdlutFCSOP7fyxvgIxDEL6DNPZmw3PO3VulSYB3J/EnBsGCVShiePQ3i5U2HjyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdoRi9pFrKIHAm3KgGZ0K5+8RMAh6qkPH+lWwhgiQkw=;
 b=C64thOCtroG8t6XIXMU1O6IAsMF19kLuY74AGbuEQnFXuShW+vOUOua8I9mdsAjJ6WebWTgXPvN+yGu4eWc5xtBwXX4zVfzmIcIdLxtjA+8ijhtsDaBgTnW0XrMJ15XgQ91HJY6d6x6gBbYd+j4sf01mLg0QigbfV2WXDqcpg/Fl+W02W9lz0Z5FQh7MYhJM96hx+VyrcjLVCXxrMKSZx/gZI7lbisnejBGH57qlelAzH+iqQ8DXoTS6X5SW3esOVHsydjYlU04Ie31Hl0dmAMKL4Qu7Ad9ClbSJQFdkpgU7/jMCsq2nagYrLC/u5L8bubWaAV5mTmuJHtkkO/pZRA==
Received: from DM6PR18CA0025.namprd18.prod.outlook.com (2603:10b6:5:15b::38)
 by DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 15:52:11 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::dd) by DM6PR18CA0025.outlook.office365.com
 (2603:10b6:5:15b::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Tue,
 16 Sep 2025 15:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 15:52:10 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.58; Tue, 16 Sep 2025 09:52:04 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 3/3] devtool: __init__: simplify replace_from_file
Date: Tue, 16 Sep 2025 11:51:44 -0400
Message-ID: <20250916155144.3279173-3-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916155144.3279173-1-chris.laplante@agilent.com>
References: <20250916155144.3279173-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dad9afc-466f-4614-f7bd-08ddf538ff88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QnURV1xJc6MGiOgdBhQDlQPd0K8AxlXOxrUTsSHahaFmEAdrhSz5UJ1goYLr?=
 =?us-ascii?Q?tPZuSRcfJniwMUGdVSYNSTFomU42QJrA9ufvBTXW32hkiecNv/Wnvo+g2Kug?=
 =?us-ascii?Q?Kz0mFBSKd9vq+Ciob2D8ljx++ZheWXQtSe/87lWEgM9oHq6HOEpjluKlBv1Y?=
 =?us-ascii?Q?a0tgWelpyGje23snsbC+y0aAEtPu97wYOO9BMQRDO5yGP0W+scrDPxfVDA2E?=
 =?us-ascii?Q?UwEtt0yTtghhQaGxuXusDgCpO8sIk2SlSGwzu2D1/seCy2Oxzc/6XECyirQ2?=
 =?us-ascii?Q?mntlUm1hZSGsPggtamqrlzp1hXl7/uth2GTXnCp5tzDFhrnudw0F9CZbmXZZ?=
 =?us-ascii?Q?BSc3VE8eBm4/vkErnKPoOdvcxM8ihMMCuMBnrKz5Yu0wTvhidou+aJtAe1yJ?=
 =?us-ascii?Q?J4gL49c7zQARW72qFbMYLIhEAJY2HQc7jJ0YdkMhXCv7KGGjazpuevM9LGcg?=
 =?us-ascii?Q?TyhTooG5uimI0ii9VZ1SiC1Wvzj91e0FlUC4J1/zgsVGr7oIPh6hhEeuK4ya?=
 =?us-ascii?Q?XJhmn6D1DkRl1emG/Vj1G8pkqHSp9qaR7m8QL31e4HV2MLEAC8+0a2NrwmKd?=
 =?us-ascii?Q?l5QMOG3Yfvjhscl5dk8HOR1vn8I0p8irIfZtkJNWFpIuH1Hbss4Nhh+3iVuE?=
 =?us-ascii?Q?2+AFwiOgabgKMYqO8k7RmOkER7ewDgqyehYtLxb9Hx+ReC9BL93Kglmkg5dg?=
 =?us-ascii?Q?e3pNwpt/ZzrxPcRYgZSIIr594Oig+EzqKGuGADfhJneX5Xq2D2bbhw7hw/DQ?=
 =?us-ascii?Q?EdQa0KrKXsOFgRyyxaVDmzScUSWfCXjugRB+l7d7SVkJMedcmemeDI61GqCg?=
 =?us-ascii?Q?s/C90D7Su85Cg6Pj9XYBtvO1hOP+Rf2K3zHqc7J9dFjO2Zm/eNWx3j8PhTmL?=
 =?us-ascii?Q?75DWo231XKQe/Flg26vXPupoG9CUJuS5rTEFDax2aLZ2+SV2MC25RnC8JxYh?=
 =?us-ascii?Q?FFaxJdFky78hw6Fgq0FY0sK5/VFqZRSMZva+ZW4fIjupTN5XX4q/v+Oi5ol2?=
 =?us-ascii?Q?BtJ2mMG57bVWjB5CWOEK0rxy9patnn4VLtrZMSankGBP0xVuq8kDfg7zTvAM?=
 =?us-ascii?Q?zoDoFU1WBu/wKogZ7VYSQ+3sqNtYeVzTnDcKfcgN471us0b6gn2C827Kwy0v?=
 =?us-ascii?Q?JOXhkVwRs9rf7Y82zGHs2l8JcBzf4Y32izSr14HYVLToBuDnMgrofjLJlQMg?=
 =?us-ascii?Q?CXfS8dNBAvi9bl6L9js2sDPAGaYnYbwGsJJgIwBnVJ4k5yqz3JzVkkcCJulH?=
 =?us-ascii?Q?NfRnvhjjyBB/O2wFqyHZzK4KsQ0ZCa90iWxXjW1AHqdys/wcV8EsO737omJQ?=
 =?us-ascii?Q?lYa0P11VreYmxWTOZkjn2dm3W4zzJb5rZLjD82ZFURin5q9suu8Ie+Pxhf6l?=
 =?us-ascii?Q?gZYTr2HD2yBqPzIxe62YEgjNNWhor8/4/euoj2fe3ZVZjGWZ6r/Zi+cLNrZv?=
 =?us-ascii?Q?kbxv9Ydv37o58g/bErA2PsY0LEuGEf6FANfel4dy2Q7v4qERcf8WnfnqIdRS?=
 =?us-ascii?Q?C7+jwdM4xx33j8sGvA05ZYD/MfpljUnWa00a?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 15:52:10.9490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dad9afc-466f-4614-f7bd-08ddf538ff88
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223569

From: Chris Laplante <chris.laplante@agilent.com>

Mostly just remove some useless helper functions

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/devtool/__init__.py | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__=
.py
index 717a60c039f..969d6dc13ab 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -295,32 +295,18 @@ def get_bbclassextend_targets(recipefile, pn):
=20
 def replace_from_file(path, old, new):
     """Replace strings on a file"""
-
-    def read_file(path):
-        data =3D None
-        with open(path) as f:
-            data =3D f.read()
-        return data
-
-    def write_file(path, data):
-        if data is None:
-            return
-        wdata =3D data.rstrip() + "\n"
-        with open(path, "w") as f:
-            f.write(wdata)
-
-    # In case old is None, return immediately
     if old is None:
         return
+
     try:
-        rdata =3D read_file(path)
+        with open(path) as f:
+            rdata =3D f.read()
     except IOError as e:
         import errno
         # if file does not exit, just quit, otherwise raise an exception
         if e.errno =3D=3D errno.ENOENT:
             return
-        else:
-            raise
+        raise
=20
     old_contents =3D rdata.splitlines()
     new_contents =3D []
@@ -329,7 +315,10 @@ def replace_from_file(path, old, new):
             new_contents.append(old_content.replace(old, new))
         except ValueError:
             pass
-    write_file(path, "\n".join(new_contents))
+
+    wdata =3D ("\n".join(new_contents)).rstrip() + "\n"
+    with open(path, "w") as f:
+        f.write(wdata)
=20
=20
 def update_unlockedsigs(basepath, workspace, fixed_setup, extra=3DNone):
--=20
2.43.0


