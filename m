Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F3FC3ABAC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:39:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web10.102.1745937553560266368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Pa6b2xU1;
 spf=pass (domain: ericsson.com, ip: 40.107.22.61, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9hk7czRMZzZ9EsGy1+zTOlNU6U4Wu16EqcUNibQOA5UxirzUNObEHjeQd31My82R8cjCJf+ipxvfou9uV+nCefQuKkvbLDzIB50fViyiiwbOw0nriVs1yRB3RhjcU4yyUFSa/lobV9vh5IFVKOkqo+RAjqzsWhGXDXV8k+HXmtW7lgO47MB343RNCI0QHsLuVVC0FjBtbnYW+Gzb827sHLk8s0oAMkvq5sXxI+MKJ0ED/XyAfULBdjTbIJPSmzvh2TnSnWFTAu4DPGhLUTBIBGY+4HoOJDBN9MgbPz/CWYOli+Nhzrct2+EzfwH9UiDYDle6pLi3EmXWdo1gVMSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q/MqUUj71Z+qaRJFzWD4/u/wiaibQ0BYN4b29mlxrE=;
 b=LG8mr5TjBFSHUwvX37iw7qogRh5GbpIWpdRvtiwo5ZtKpLKYyJcTtwuoxk0RlR5FOMyyU3xTchAtOgRTnoEIz8LlqA+jb+WI9/8SZfSwJLqDPEmBaM1FyAoFL8uQV7Z7QX5hMX8CW69M9+Ik2PEwJat8K/SJlvasw2Y3DhA3b8cgkTOaNquEEd4qJlrvsiNri7iCNni5CZAalZ2W0RLECobtOw/gCLD6N9vf7bFjGmwEwdvoA3zDkULYchGafCncOMklUyfqo21zkBNlHm3LzKGmtJhIYoR3JdhZjWBC1jKi5y9o6aI741pDOUUDTUOVG9/kUJvjSuNTAxhWICLP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q/MqUUj71Z+qaRJFzWD4/u/wiaibQ0BYN4b29mlxrE=;
 b=Pa6b2xU1cWadC8Jwk4EoUd8UV9nnG0Ld5PDhMwdD4WT4iu8IXH6TjYXkVnpRGGUUyWXstpq3DMEoOZxMgtVRVFY4NfHF/P06KPVtiMttSON2Ml1Yg/ROTgUpFzm2/PT/epWYxDl+56liH4lPBSQSmL4zzv8vZFLS93ztCkUywF//fDVFTYdrwhB6yzZ80b26ltj3/h60h+m6ccIwWxwjfSmPEqHiNMBZsmbWbqeH2/e2k48OROdj1GMIznT1S7Pl1/MUgWgVl8StSiF0QTTYHZYxWpUO7isKf8dGdn7b+8qrE2+LVAqqdEfNbM7twQxycefHBw5nOi0hreqWaiX33A==
Received: from AS9PR06CA0217.eurprd06.prod.outlook.com (2603:10a6:20b:45e::17)
 by PAWPR07MB9830.eurprd07.prod.outlook.com (2603:10a6:102:38d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 14:39:08 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:45e:cafe::aa) by AS9PR06CA0217.outlook.office365.com
 (2603:10a6:20b:45e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 14:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 14:39:08 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id EE277402066E;
	Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id BBB8E70E75F4; Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Peter.Marko@siemens.com>, Daniel Turull <daniel.turull@ericsson.com>,
	Joshua Watt <JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v3 5/8] spdx: add option to include only compiled kernel files
Date: Tue, 29 Apr 2025 16:39:01 +0200
Message-ID: <20250429143904.634082-6-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429143904.634082-1-daniel.turull@ericsson.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|PAWPR07MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae0fdac-35ab-48a2-79b6-08dd872b99a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7gO4PVBkC33mavJBJaMCnoXS3xRMhn4zGMTRH3RS5THDW0S2J2YyWi0IBk/0?=
 =?us-ascii?Q?G01hh1iM4ARBJsd3cJLwYb74lH4Ed8XbO+aRLnN1oj2oejtCS64TX89o2nbp?=
 =?us-ascii?Q?wpDMYDQx/IgSg9OZQntDeuF7yRqaX7BBbDFhj8Z2JWAPEdmF0DV/g8DWfr01?=
 =?us-ascii?Q?udrTCHzrukBb1HdJZNOY9LmcqyS6fwxedkG8nFojsQUmCGd3X3mW9Dh3yGh1?=
 =?us-ascii?Q?X83qrwNm3ABz1cFd7K6ZGA13Lrh+OwEp6lbDG5XyRCGQ2E9WNR5nOVb3S5z6?=
 =?us-ascii?Q?eqY8byeXeTN6k6ve6kJJVWxMJyaj2GxIyXfFdGT0u0t33r3ILy1yVaMWgXT7?=
 =?us-ascii?Q?w2A6uSUDgIFWic+/uwyC1+xHgd6qM4S0anLfCmYRJcbe8bZGTazTWGF0659Y?=
 =?us-ascii?Q?KpA/CJdIUZ6ikJZgepsfiWm4YWSwGMl9fpTiLVzoXS4n59i0ALfySQhnJbWm?=
 =?us-ascii?Q?xuqyYNDUcVvk17YWfoGjdl4KIE1LG/luULO/LP3GGsxidV0d5nwQ8RF4/jDX?=
 =?us-ascii?Q?Lx+nSrjF0ZC3vldjh6dxQBzQboAd9klpqz+vffAWy27//gKigdx+jIBp8vCh?=
 =?us-ascii?Q?cyj8UKB+wL+Z7eDD620k2k+zHkhInZbaK37GBSLxe4PFpJx/PKn18TtXIeEQ?=
 =?us-ascii?Q?qdH8tNuSMFEFdUcSzo8UNTMgXnHI+kCMvSNnFnqFhsEAnU+7/t48lf99QNj6?=
 =?us-ascii?Q?v7eLj367Qz42604C6OVyrZdrjjqx/wFYrOWYfBgyGKcc8yEbpcHTBg98tae3?=
 =?us-ascii?Q?yp4ae3q8e07cw6VkVtrAEWIf3WC0YJ452HGL82bZ7Okdn47+TmcRIt5Mgot8?=
 =?us-ascii?Q?xacXTDHu1etD/HzFxnYVW9v4vPOjLf+VoTNEbDkBPxDE4s2iHVxS7bEvyvex?=
 =?us-ascii?Q?YJX9GtVZcwS6DbYfpEilOhf0HcebTVXPJ8TvgEZtnqdvoBdr3o2iPo4iw8CH?=
 =?us-ascii?Q?2iC6bxqgXoR4+65+DR2kmmT4FiUQVyd/sHv1hJcAZB81n4lUsRF9OFbaLODS?=
 =?us-ascii?Q?zau6fqLOZsV0YvjsZM7BYPQ40MWRly/16cBH6ZTQnc6BZ01eshoZqorbT/JY?=
 =?us-ascii?Q?LQ/kZtNaNXIsPwKl9fUoHShdMd8ezgyxE4yXBHq94HI+TIcedkWgMgFWjmlX?=
 =?us-ascii?Q?mIldsVV3ifqLeclADK2CUeXUULY7d6xQT4pnB1+ohQrwdlrBX+3LVGGzJyeP?=
 =?us-ascii?Q?oRgzgfRsfSQyqS6BgQy0qjEXeO64lhiw4pYFEHXy5rfUDFM2BPAD/p+id2L5?=
 =?us-ascii?Q?DxB1qmVHiwyn1xNZDmaTYjINKWEkdzM4HlpoorkvICQnsha8v0XprXnNcIuj?=
 =?us-ascii?Q?HJwyF1R1ZJe61/3coRCxoFF9AxUXlEO04Xh4VW2YJDckNMCdgjROGo9x7G02?=
 =?us-ascii?Q?P+tPuc0OwQKnl2IShxNFv3ZCFCGCijm6tPjQ401PU4ENm9Kurb0TCxpkTWdJ?=
 =?us-ascii?Q?zeTSLVsCChwvemRE+AWELQRk4rI4D3hvBu3Z72TPWznnRAj3QSXkRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:39:08.6693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae0fdac-35ab-48a2-79b6-08dd872b99a1
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215671

From: Daniel Turull <daniel.turull@ericsson.com>

When CVE_CHECK_KERNEL_CONFIG is enabled, only include the
source code (.c, .h) files that are used during compilation.

This enables an external tool to use the SPDX information to disregard
vulnerabilities that are not compiled.

CC: Joshua Watt <JPEWhacker@gmail.com>
CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/create-spdx-2.2.bbclass | 8 ++++++++
 meta/classes/spdx-common.bbclass     | 1 +
 meta/lib/oe/spdx30_tasks.py          | 8 ++++++++
 3 files changed, 17 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index 7e8f8b9ff5..5009ebf5f1 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -137,6 +137,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_sp=
dxid, get_types, *, archiv
     spdx_files =3D []
=20
     file_counter =3D 1
+
+    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =
=3D=3D "1"
+    if check_compiled_sources:
+        compiled_sources =3D bb.build.exec_func('get_compiled_sources', d)
     for subdir, dirs, files in os.walk(topdir):
         dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
         if subdir =3D=3D str(topdir):
@@ -147,6 +151,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_sp=
dxid, get_types, *, archiv
             filename =3D str(filepath.relative_to(topdir))
=20
             if not filepath.is_symlink() and filepath.is_file():
+                # Check if file is compiled
+                if check_compiled_sources:
+                     if not bb.build.exec_func('is_compiled_source', d, fi=
le, kernel_sources):
+                          break
                 spdx_file =3D oe.spdx.SPDXFile()
                 spdx_file.SPDXID =3D get_spdxid(file_counter)
                 for t in get_types(filepath):
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bb=
class
index 713a7fc651..1e3249cbd3 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,6 +26,7 @@ SPDX_TOOL_VERSION ??=3D "1.0"
 SPDXRUNTIMEDEPLOY =3D "${SPDXDIR}/runtime-deploy"
=20
 SPDX_INCLUDE_SOURCES ??=3D "0"
+SPDX_INCLUDE_COMPILED_SOURCES ??=3D "0"
=20
 SPDX_UUID_NAMESPACE ??=3D "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??=3D "http://spdx.org/spdxdocs"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index ba965821f8..9fe75e76e1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -156,6 +156,10 @@ def add_package_files(
         bb.note(f"Skip {topdir}")
         return spdx_files
=20
+    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =
=3D=3D "1"
+    if check_compiled_sources:
+        compiled_sources =3D bb.build.exec_func('get_compiled_sources', d)
+
     for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
         dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
         if subdir =3D=3D str(topdir):
@@ -167,6 +171,10 @@ def add_package_files(
             filepath =3D Path(subdir) / file
             if filepath.is_symlink() or not filepath.is_file():
                 continue
+            # Check if file is compiled
+            if check_compiled_sources:
+                 if not bb.build.exec_func('is_compiled_source', d, file, =
kernel_sources):
+                      break
=20
             filename =3D str(filepath.relative_to(topdir))
             file_purposes =3D get_purposes(filepath)

