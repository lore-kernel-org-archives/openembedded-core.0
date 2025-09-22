Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2B3CA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.42])
 by mx.groups.io with SMTP id smtpd.web11.47556.1758531649665426756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=nH8kYWEu;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.162.42, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPEaXsi85BCwCUZPZ4vLbpzw6XX/dx7uudLTYe5bVBKlEmWhkFBZ+QvHzBfLwDcmaO6c2kOm+Efb02woDn1XxFa0w9C3wlfqaRPjA5pVJPprwtJtXFtkb+3e0iNbQ10M4lNGf+/EbWlu6URJhBBwKs28kZw9R2EgJ4b+ey8pW4SnsISdWbna0nO+m627DtKS1Bv8IOtG3Us3Ix4bxgtsJgt4sQJFmzDPfE24PZQGQ1xuSe3Zj2cq9miybyDl0UTYgzTpHDarMBkubHF+viTszUSzsBh3AMhekKRnq3cK3RtM5csLCjozHHHWS2/TFBX6noFDyO6PqSB0WCQuEkqQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2E1jr241eo2lIm0J1Dd3vm4tBG67+m7if6UrS9KoQVA=;
 b=XF8CX3Dva02jd8+VJhEpSdzxRGoCHn4M6bab6eqKMbrr+rRkeCY//RaDEmmls1e9hP+qMFpT58edDLkjcEe66K7+8syFAl95xnUjY/gQ46Yzwm8xGxKtPsIqvBaqXKUJpwLCkVHmYwxjjBfwZs4WNK4jrPio3eWi59KAjAWxpZwXdOxk/NKj5lRZv1Arbu1KNy5TE33mkLaNOufLnEJVgYtDrJcO1sFgfySzgv+4qUc0+dYI3gpsLVN8ZLK7ZkD3FPlc4jadPnlbOK+oIg+E0m/v1mQhGtuBXWFLCIY62FWTRxBtpIASzEdUrjjIh0YSqVTnxJMb4DpRb7YG4s1FRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E1jr241eo2lIm0J1Dd3vm4tBG67+m7if6UrS9KoQVA=;
 b=nH8kYWEu9eGIyDULSnQ8KUJ1/djYc/lVmKIugPsgYPFf9P6viZ3Szmi0rEgM6yKHm/N8yTTD8l8nLMEAj0ASkQ7u5+eWnERh+LIlxJCm9coS8WjBWe/2C56d6C18YWGVebPQLBQlEjTT5XBeOIV9yT7yMF/3G0LAXRWrEP0ZtBg=
Received: from DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) by AM8PR06MB7635.eurprd06.prod.outlook.com
 (2603:10a6:20b:362::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Mon, 22 Sep
 2025 09:00:45 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::b6) by DUZPR01CA0007.outlook.office365.com
 (2603:10a6:10:3c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 09:00:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 09:00:45 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 11:00:42 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: jie.gu@leica-geosystems.com.cn,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v2 3/8] systemd.bbclass: factor out service lookup logic into separate function
Date: Mon, 22 Sep 2025 09:00:35 +0000
Message-ID: <20250922090040.2859103-4-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
References: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 09:00:42.0868 (UTC) FILETIME=[603D0B40:01DC2B9F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|AM8PR06MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 7452e9d5-d6c0-4807-2484-08ddf9b68455
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zb09Ln3k0jp1g7/pgflxvAnb6Dfl8Kll876KHb9WoNBh6gxgMer5cZ0mzLUJ?=
 =?us-ascii?Q?SShp31eluVTUqcKPlpHhqsxT2PCA5ak2u3xjrDhudLTYkOgBBK7ANGRN6HnB?=
 =?us-ascii?Q?orIaMHSI1aNLoTYWW44/Xvcgkqp9PjTu3wc8YpsBIHzRl91DUUw2Ew8NLNtX?=
 =?us-ascii?Q?Tf3ub2D1vOGBXnEK809ndmNSM6DlTkpSPH3NKGD13Qn2wjBryVIxG0klkblR?=
 =?us-ascii?Q?jtEVJx415NO33B3RuKv/pIK8NNtamWUNWiJ0vToOwg5u5I8vofStK7xBWKTQ?=
 =?us-ascii?Q?czLKz0bvB6DlrJbNHEj2FUVxMYBOk2KT9H18oV1kYqI2EAlcnKmnD4CiKMJQ?=
 =?us-ascii?Q?ga12iYGRkfHt8bN67H60AkcGgRaEVo4vuZ5UCXrG4uIWwS2YNxOJtvHodrL4?=
 =?us-ascii?Q?+TjFG6SJT1XVvhGUFV5VXKjOU7QZJhA56rtWSHeHW9nZcnxyYgN2mneVnKOM?=
 =?us-ascii?Q?tH6NbEfYf4kb92HNYLFJffm+Mf5ae5K9cYNJRdkeGUfogvAQL1LQldBXmGbY?=
 =?us-ascii?Q?ika79E4Wofe7AKiZswNGBF2Njikh90jidTwagB0VxLakneQ+cbtQZMY6zccw?=
 =?us-ascii?Q?pSwbgPT+fEj+30FrBMvEtWi69hJDcWRMsKEL35ejdewqtD5OT6Fbr/5UKdlT?=
 =?us-ascii?Q?AhBuko7b/7EnmCEoTgWWTU04YxHv3tqqvDNapv90b94kKHCuou7J4OVRDFe7?=
 =?us-ascii?Q?I1TmLx1DCer9rGOiNW1ZqIQw+O4HcHzh2yWwX+xGIhLfwJanjywa+kErNX3Z?=
 =?us-ascii?Q?vpttUqFhpsBw4WbEytvCTphOYIE7W0DYEYKpwZbzjL0qkXv6ODZmjQQ/x69j?=
 =?us-ascii?Q?TetKAIE2ciE88L9+J+xj4FsgDyZc6xStvWflZTlLiSg3A+Gy8PJqXNxSpkUF?=
 =?us-ascii?Q?G4md8cpOO0X695WojvpXovvBwp+Rl3Pd2YUiwkkJDUhZJju8JtAzlBlanSp5?=
 =?us-ascii?Q?brWCX6vfr/57pPu2wDZI8o0dB1jemL1m/a8N8EsM+F96HKLV2zUw6AwSK3YM?=
 =?us-ascii?Q?r1aCV0gfDwBIz+VM+IZ12hlh5cI4Zaw+eNC6TGHrhliObm2bbNZVHrVOrlPM?=
 =?us-ascii?Q?SQzbq3gbPQZb/fADE03zyWQBhZmLs3BZnzs6wyzHsm9AhpbFWgZoamwFDOHR?=
 =?us-ascii?Q?4MIUFB8ChzSRyJSdyea0pxUMw+7Gc2H1Bpbh41Z/GORWvFDXztktNow+jMrJ?=
 =?us-ascii?Q?HdoLSClE9HSIBwSCzxftzhKVgluGwI6NjEArU8rXTWjP9e2tD4D6uAwo40uT?=
 =?us-ascii?Q?/Zo0ELlmjaoAc84wtD6eCF94yLeU5vQYC0NHBbD5T+a6Q/TIUwVY7bjMBQVB?=
 =?us-ascii?Q?i7u/58pqqdebBD2P3YvT+3d1Z7lAhT9uhdJJT9W91bmXiaIa7vN2nVbT+olj?=
 =?us-ascii?Q?3D0jwveesvENQhtNeDqC7Djtu0e/+Wyko7eh3s3th3WbbLA9bE1mT44/Aeme?=
 =?us-ascii?Q?cSl7XSleaTFCeiAqavQQaF9wHpWI8ixveeElqVvu/EHpA9rN9BU4sqwSZZaB?=
 =?us-ascii?Q?diIE++jqRvLEk2VH0BQlmK2a6B4DX7RxHdHBHNYPOn6I7qZlWCoWl3gDjg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:00:45.5378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7452e9d5-d6c0-4807-2484-08ddf9b68455
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7635
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223850

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


