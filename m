Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D628ACAC5B7
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.28])
 by mx.groups.io with SMTP id smtpd.web11.47555.1758531649117739307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=MYT2SPpJ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.66.28, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4XQ1Pfpp3rB8X3WOSPOhzPsuYZklIOWRcBZdip9H0azhKTsJXhvNgoWLLvOyg2ybC3tLS60OKY6IwC+U5tU6nnFneTCFXaopCZyALt2QZgOlhkmZe3UaQBOPDtPxbpUEfLOsxF6DX8tAf7qnU0SEN1hQuxFU5xXvTScqQb1vLX2ZAsut7Yq8bYxbSi2duxeklLMu13ZVuEBogdgOjPAt5tYHCCBJ7o0DvTepa74xVug8AGuAiUYA8QjVu/PZ0qtIqrjmUH3BnpavMWDfgyExNtUir21QwRHHhyV/2bMSY492f+rXP5mlkB20LNMaUP+nmvbPg4ymnuMVGUAA2fzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPXnUhRlOn8KfQ+fh6FMvp9DUIUzEfepMeilanDAfD8=;
 b=H7LqbddAtJz0O+9bW5aU3NCI+JfhO++1B93iFbn18rmcxkNtyqH6aAfXOCRF866XUIy+zdfmSDqf+uCmR/02xf7ZniHavYfWV3e+js1uLC/vtgN/pgJARti8TyQuG0YmwfKV8ID1c6CXG8Vp3fAMuvXWRm2sQPuB383/e0j6xXmW4BFCmGd+GYZoDZT3KWqXaC5KAsybQsYUzJzx4abGSlos3JKrNSf9XhEW9TMHJIphUNQjVAqsnlsk/IHuBi1A32iLojpdteYY1YTik5Akb7Rxq8REfILV9MMHw7gMcZBJy7TlX/HcSExPDMATrAydzZbj5TWv7hCjIKivJ0xEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPXnUhRlOn8KfQ+fh6FMvp9DUIUzEfepMeilanDAfD8=;
 b=MYT2SPpJZDl9yXSCEuPlO44jTgIGQJvt4bPMBXd6eTHhPXiwjS14f+4H00Z6wKPsxR2Fkk9+1u/aEHM8ijUxeWQWQWiL4FRoahVQU1wzZz1U5ii3XybsxSe4KMIOaqjIK96llcgw765+CeVKlI8uOTeJ3uOhau/W2pxa0mDfLeM=
Received: from DUZPR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::15) by AM9PR06MB7170.eurprd06.prod.outlook.com
 (2603:10a6:20b:2d3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:00:46 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::b8) by DUZPR01CA0003.outlook.office365.com
 (2603:10a6:10:3c3::15) with Microsoft SMTP Server (version=TLS1_3,
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
Subject: [scarthgap][PATCH v2 4/8] systemd.bbclass: introduce systemd_service_searchpaths()
Date: Mon, 22 Sep 2025 09:00:36 +0000
Message-ID: <20250922090040.2859103-5-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
References: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 09:00:42.0900 (UTC) FILETIME=[6041ED40:01DC2B9F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|AM9PR06MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: ab697ae1-5647-4cd4-2545-08ddf9b68491
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pmP+oAMLgX5PJoWOjT+xaGvpKXSY/ii6IWYzQpzG3M+x+LlzhfLwpK+ZEv21?=
 =?us-ascii?Q?XYAz+jKlQyznTHMqaWpMhpKneibnZE2m948r2adeU49oAvztZ9+Ye90GzwfD?=
 =?us-ascii?Q?vbLbDSkWOrTuOtAtOZRrhcLaxDdOQI3XaeRGrkzBQVGg4zQ2y3HVZBN0G/0m?=
 =?us-ascii?Q?6AHWPAK86cqF5yP+O+F/lRQZTrcEfUjmsaQrYs5z3nxuHWs6eGvza9ONB6mq?=
 =?us-ascii?Q?3MGI5mPgiSHHIFlNiN1srblAvzhAHvsisPBLBPTHEU6CxK6wCYjuE3m5GJ3y?=
 =?us-ascii?Q?VcjWJy+cH1BANSiLkCz7AJBckgUlHIwwjeJhiixdd4Jd9J4z8xOBS5AQ6os2?=
 =?us-ascii?Q?Y1SjS7C6XxnD0TNDLEnIplwbCOnMClSQoisNBSaQz/jb863og7+nFeXYO9JO?=
 =?us-ascii?Q?GOqhF2cKamVFqE7obOB1CTNenn/c8xFLB8oqrpJUJR44GXrf/bcws7kbtyPP?=
 =?us-ascii?Q?Uby0Q5EFXE4pLVR9PEjEHiioAnJAXqEdrB6YlcIcGxFM4+TC3vbndH2NXUdU?=
 =?us-ascii?Q?IQpdxX3Aml9M214h2swHJsBEibAEJUOaeUYtn3rEAfMljANw8QyrpmwHqy7A?=
 =?us-ascii?Q?iR8wfh7rF8AZ1/bOLESL8o9ILabJXETf2Dh8ObonOD21sU8rgimtlPkwAy8k?=
 =?us-ascii?Q?hsgdShkv4yyMokmU633pRHXEbiccqEDr9L4EHj1u++/MGYaKsggm2KccQ+fU?=
 =?us-ascii?Q?1BGWtWIhUbrCZ22QdlZhYGPHcH2FBaE7POO9zVJ/qcACM2kVXJHq7Ux2iiKD?=
 =?us-ascii?Q?BiqbORB2IDGfONfeTNE/slxkKdcO1Xo5cFiDLZ3Y9lEvV8FToLRenF4QuceG?=
 =?us-ascii?Q?LKRTVQsDQzx8Fknu7Sd8T6WFXJWEFzjcRN6r0XOvInMf8Mhw86YE9AwWcdVV?=
 =?us-ascii?Q?h3a1YLuA744RmQMjdE8wHwU9i+mrN46P4upb8sD4jkU01jxtHEkQ06JoCbeq?=
 =?us-ascii?Q?RATVPsAS0qKSyLgqF8v+FhSWyNGwMrh/9d4g4d9jc40expk5AOrbqDTe7HmR?=
 =?us-ascii?Q?D9qvFp9reaTfONZvs7YroTLZjoH+buFPjkj9e+7HBK3GoNoUkUFHVzrQbnNw?=
 =?us-ascii?Q?T9Hm6mJcl8wFe3cprGamDhNdcFp6bMJ+1t0lktyKoKvQV50N7zt7jWiB17+Y?=
 =?us-ascii?Q?d408sJ9mAhaieS9P3DSECEWJVYpx8l+M3ITulDocprOXuxKCsBD+iCqOCdZN?=
 =?us-ascii?Q?kcLnS50twNtnsNnFLZiwlIJ8ZS3qBkOGu4vM7RU2sAw6tCN5VxKsimqmzPh5?=
 =?us-ascii?Q?JDfx70Smy0pryrdKbI6uZfxpwmUqU4CKJJTZuoG0EFrKVA2yFSpT+utwTwwH?=
 =?us-ascii?Q?dCreXGY0L4s4Prd9Gov5i9Ok4BCQce3QoYgeaWznWzjeNo9WnOQYA5Zkm6/A?=
 =?us-ascii?Q?ocUoYnADIjdu65S87/CPsm3tVZgVgL4EKQo+TV+XJ1Na463ggQJ1EVoqOT9b?=
 =?us-ascii?Q?ZeJ0o+kgcDuxPas30RVa1oZxDBq8iJhEJ8eNZWfdBeq2k+aFTUD8nuwLpKGL?=
 =?us-ascii?Q?YtmfF1dB7rhaajA5m/ABeEnUSx/jlQXdvF8R4OFCZXBQtTt8UoZUS4AibpCw?=
 =?us-ascii?Q?wRf1whftFmJ51OFunrc=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:00:45.9311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab697ae1-5647-4cd4-2545-08ddf9b68491
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7170
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223849

From: Artur Kowalski <arturkow2000@gmail.com>

systemd_service_searchpaths accepts boolean value indicating whether we
are dealing with system or user units and returns search paths
accordingly.

Previously search path list was created in systemd_check_services() but
following commits will introduce additional places. The
systemd_service_searchpaths helper function is meant to reduce code
duplication.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a89d36932dda306b3c2cf10771647eabc267769)
---
 meta/classes-recipe/systemd.bbclass | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 3f6c8bc131..ccbfc36121 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -90,6 +90,18 @@ def systemd_service_path(service, searchpaths, d):
=20
     return path_found, base
=20
+def systemd_service_searchpaths(user, d):
+    if user:
+        return [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+            d.getVar("systemd_user_unitdir"),
+        ]
+    else:
+        return [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+            d.getVar("systemd_system_unitdir"),
+        ]
+
 python systemd_populate_packages() {
     import re
     import shlex
@@ -172,12 +184,9 @@ python systemd_populate_packages() {
=20
     # Check service-files and call systemd_add_files_and_parse for each en=
try
     def systemd_check_services():
-        searchpaths =3D [
-            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
-            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
-        ]
-        searchpaths.append(d.getVar("systemd_system_unitdir"))
-        searchpaths.append(d.getVar("systemd_user_unitdir"))
+        searchpaths =3D systemd_service_searchpaths(False, d)
+        searchpaths.extend(systemd_service_searchpaths(True, d))
+
         systemd_packages =3D d.getVar('SYSTEMD_PACKAGES')
=20
         keys =3D 'Also'
--=20
2.43.0


