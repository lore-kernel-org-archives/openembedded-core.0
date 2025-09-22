Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD5ECAC5AD
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.5])
 by mx.groups.io with SMTP id smtpd.web11.46843.1758529004058666349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=a1Jlxek5;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.162.5, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAGW+p+b+pyU/9S0SkqIOUEFPIAfe1KoKUNkgK+av8En8Ms7mtyIhxGpzoXcyvIN718eCOZAdbPNUd8LX2JGeAkPCH0ZgEBVLbJyV3mLzysb7v2DpoW2gAGyF125OSw5EMwh5+kTBi9cugrJMloS/fyyd8xprRnzRHK8bsGDeijSnkERiyyTIIHCxBEQsUMTzP8WN6rMS3E+VaR5yGoRDTQZ5eQSJN5JXzDdJTrrWVWAmeO+hzygvnLQ5+00ZFtKPn6183aJqBADvM1O+78Z9swKuQbf9XeYyvYkYHBRCiZgiT1zYC3PndRxUFRJfqAC2rpcmhiUun6mpocwalAUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2E1jr241eo2lIm0J1Dd3vm4tBG67+m7if6UrS9KoQVA=;
 b=wS0NeBM5YCw/knFqszC7+vvlDRjcJdfeziayjE0smp3xBonBg5rYy53jWnEm1FM14TBXyJlN7oocO8wxWJmWe2GcTd+wi2MnrvSTKlapAzin+ThJC2diSi5JscsxOqjCuEHh7I+JiMsRtJm2QvyRJ7AlFqu/vRqiFvvzA0Sw/SpRsYkf4cAWlShZP+G4YK+LYLG5DDRBvZwPHsGd6ei9RDMJjIu0arlE0rB2Yrk2ut6wlYAsD64R2maS44w5CQ0e1Plgq8X5np1xbNCj3muwZobPWgwWAn18qfKU+dlFAWdhHvTH7XIRc4WM7uKhDdyp0psZV9ImK16UAWwp21u6UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E1jr241eo2lIm0J1Dd3vm4tBG67+m7if6UrS9KoQVA=;
 b=a1Jlxek56cwr5qeR0iZ6DAxZTf8b0WKi+3GmyJA9sfwS3HWrCiYVG/bqFG1DoZtmaU8nzTFsNDgApj0XWySdMxmyOIJZ7AFB6VHedWAXfE5FZQ0AIGGGeyak/+iCkdSZwQDErHTP/qWcdJuDFCXMkEs+Z/XJtVmz9bnwQAtlpb0=
Received: from AM0PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:208:3e::41)
 by GV1PR06MB9271.eurprd06.prod.outlook.com (2603:10a6:150:1aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:02:01 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::c0) by AM0PR02CA0028.outlook.office365.com
 (2603:10a6:208:3e::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 08:02:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 08:02:01 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 10:01:58 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/8] systemd.bbclass: factor out service lookup logic into separate function
Date: Mon, 22 Sep 2025 08:01:46 +0000
Message-ID: <20250922080151.3483394-4-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
References: <20250922080151.3483394-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 08:01:58.0667 (UTC) FILETIME=[2BA6A5B0:01DC2B97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|GV1PR06MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bce787-fa4d-4623-1d82-08ddf9ae4fad
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CIsgjDdX53xw2S54wHWhIT3mluaI8KFsNelg2j05OY1IvNznAjE8/1d9NqKD?=
 =?us-ascii?Q?TV91TlXFlVdPmdKyIa1Dz7p3TPTUIfvXlnts9s1D267pdJf6KHa6N0eq+Qag?=
 =?us-ascii?Q?j0xNt8jwDOrjWyvLKDGMU4hCFz3wSmomt269KyTGGlV/6UzyydWHEcRQK9uy?=
 =?us-ascii?Q?hhxBowvg+/WZXgG08RrPfaW+yK0xNoAl/9Dw5JrdpDnsRL/lUekx47K8m7cz?=
 =?us-ascii?Q?jtaRn2zl39K15vhvoksof8GiRLTImusieBu1q+R6MR2tl6fqJ7R2TMqK/xRR?=
 =?us-ascii?Q?WPmXmRpHXYoRHGnmqF0cfsc12Q11cyyjeoRADRTJ0DoIFvNcar1SGe1gLtBI?=
 =?us-ascii?Q?XxF5KZUmqRJTtAnjMbi0NQK8x14g5QjVxU626fvRA7BmaIdmeR90/zeKFB83?=
 =?us-ascii?Q?F7VILkcGr+T5cU2LJTLMs40iu5x8+4ikhLYNHZALHirZj4MTsRZXwsww+ZLo?=
 =?us-ascii?Q?dv1bkwC2/CYNarh0C6Pq3d4l2xt7o8NNVj41EHpBA2ld7UO8/HsjY8e9p5Tp?=
 =?us-ascii?Q?lwf7vaOPTto7dKnCq7qCG8GATf5Fqe83MOKA/Bd83HfmEBT4tjKENGjloSF0?=
 =?us-ascii?Q?PBIennOxJF0WOnu3joWC0zklEvJVxAV3gvJxvTy5BS+DHpdOoli8f3aS0c5V?=
 =?us-ascii?Q?WFunFxhFSUboYfeNy2qmp2YdEc3DVNsEf9Hh0Y8bJ9jbGvKTwwOzhUYu1+EZ?=
 =?us-ascii?Q?COckCePMnDNJ9EDGZCB2wAtzOzFeYv5UW82hMxx1MIojzCxZ2xDMiuHjGWHD?=
 =?us-ascii?Q?qoz5Mz8QR5HdejAPLgQDK7xqQswvn24hs48AOG4qj4GehIQ2I4L1JFlBa4p7?=
 =?us-ascii?Q?wXQ4TfA0X1AH9+UvENiXX7ayBi5mglC5q/QF8qNoVN8o0pxyK0JTcjKI5IFa?=
 =?us-ascii?Q?qgNZV3O3kPLT5ykISjeYKiIjEs1RcuwhysD97pwc4GaTiCkBf8S64+LpYd3q?=
 =?us-ascii?Q?sWzcF9r4h0WGNZc+NNUtKocs6luGz57ayZ0cjVtmPN79hakPiwlyTpAvkfjQ?=
 =?us-ascii?Q?XMZWiQrh5YXZEPHKiX3ngoawJec0X26MnJOF1Z70P0tVIfR/gth+hVoVUYfN?=
 =?us-ascii?Q?/wmxLxgEHgCbfgJm6mlIrYQuw/xKaaJvO8mJe9Wz4m6r802sG8kT+r3v1kix?=
 =?us-ascii?Q?am4JfZEeikgXLztCjIuoDom3U3mQYMU6z03hVbueB8T5yguJwNjJKjBV3BYl?=
 =?us-ascii?Q?SRcyRpYDwHaTCGaHaFx0QjsHzMUv3w2dgxhDwRXBPdUDJcCThDFjxtNuMx+Q?=
 =?us-ascii?Q?+VN6hudavQ5e9ac0Fl8pWMdUo3tYu+4yWlQjzsrt28fDa1YTFp8miVB6kJiT?=
 =?us-ascii?Q?397aYbTToZ3SB94AMSjMW2wrl3CY9lJnvP1pIRX2RzDRwq/FpkpboEiCatQe?=
 =?us-ascii?Q?ubP1pqPWX5f44OjdLI8jTHip/nSWWUIwiSmiSijaxVCXj3d+OSdVXWVMND28?=
 =?us-ascii?Q?HbqbGUVFEOxqdvvkCQAm5ss8aZ5W1lretQ+gBm3+J5AX/el0Zn/+z+6g2+fw?=
 =?us-ascii?Q?dBCsmiO1Noy0LjWNv885xLZmDNadxekhB2u0KhbmKLW7wF1DnmnNuWYjQg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:02:01.2509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bce787-fa4d-4623-1d82-08ddf9ae4fad
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9271
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223837

From: Artur Kowalski <arturkow2000@gmail.com>

Factor out the logic into systemd_service_path(). This will be needed by
following commits to avoid code duplication.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d383e18138050490f3dcb95377f63a2a31c3149f)
---
 meta/classes-recipe/systemd.bbclass | 41 ++++++++++++++++-------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 4cc23018c7..3f6c8bc131 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -68,6 +68,28 @@ systemd_populate_packages[vardeps] +=3D "systemd_prerm s=
ystemd_postinst"
 systemd_populate_packages[vardepsexclude] +=3D "OVERRIDES"
=20
=20
+def systemd_service_path(service, searchpaths, d):
+    path_found =3D ''
+
+    # Deal with adding, for example, 'ifplugd@eth0.service' from
+    # 'ifplugd@.service'
+    base =3D None
+    at =3D service.find('@')
+    if at !=3D -1:
+        ext =3D service.rfind('.')
+        base =3D service[:at] + '@' + service[ext:]
+
+    for path in searchpaths:
+        if os.path.lexists(oe.path.join(d.getVar("D"), path, service)):
+            path_found =3D path
+            break
+        elif base is not None:
+            if os.path.exists(oe.path.join(d.getVar("D"), path, base)):
+                path_found =3D path
+                break
+
+    return path_found, base
+
 python systemd_populate_packages() {
     import re
     import shlex
@@ -162,24 +184,7 @@ python systemd_populate_packages() {
         # scan for all in SYSTEMD_SERVICE[]
         for pkg_systemd in systemd_packages.split():
             for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_syste=
md).split():
-                path_found =3D ''
-
-                # Deal with adding, for example, 'ifplugd@eth0.service' fr=
om
-                # 'ifplugd@.service'
-                base =3D None
-                at =3D service.find('@')
-                if at !=3D -1:
-                    ext =3D service.rfind('.')
-                    base =3D service[:at] + '@' + service[ext:]
-
-                for path in searchpaths:
-                    if os.path.lexists(oe.path.join(d.getVar("D"), path, s=
ervice)):
-                        path_found =3D path
-                        break
-                    elif base is not None:
-                        if os.path.exists(oe.path.join(d.getVar("D"), path=
, base)):
-                            path_found =3D path
-                            break
+                path_found, base =3D systemd_service_path(service, searchp=
aths, d)
=20
                 if path_found !=3D '':
                     systemd_add_files_and_parse(pkg_systemd, path_found, s=
ervice, keys)
--=20
2.43.0


