Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDF4C3ABA4
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:43:19 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.62])
 by mx.groups.io with SMTP id smtpd.web10.48697.1745847790166629298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=F6vUMmUX;
 spf=pass (domain: ericsson.com, ip: 40.107.249.62, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLA9bNPl/h+Z13IRMAGPQDJJiu3GGwszLtK5ftNl+aF5OqabyDkur+aPIA1g5msQMWHUITgbjS47YnHORXR1abdRQVv5ydEBUQzFrP184ze3Vvf/8kGMelKzH3zsekThyvmIjlt1ycMloM3cXHlT4A/cUFegAsMBpnWTR1Al7MBvsQrx3efuZvaPLFHRypl+0QQ1ejqam+bRWQg6g+gmh5nrRztz42k647rX/slCwy0Vh4ibmLQgEQr00uFQtn2oHW28kJHDWAPGlVa3mHrqvP4GJpRzS4NEOIHh46qS+5AYI0uVVKK1FMoJBTirIJ3z3MOpvA70jAGbQ/ifdmi2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBeWvVzdv7t7NPwfrziFw0NCHqXj/pelHeJ0mrvclj0=;
 b=niT6dQEBX7Zofii7HF+EiqS+u3eaCWVyU77j4lx/OyJRbIvFMFsZXn9q5g+B6CbP0zHPzRPlkVZzO7UNoptqCMkouNx6o46yRejm/yLTh/39Po397WcrhWIbx9Y9/zQK05il9DJxmZWubGYT2BorbWT+DNr8Hkn/0pVtf0vD08JGeNaF/Zy3GbFelGO5ayf6ClI0Mo+FS/TnyQ1n+4QGlqSu5J1GMfhByGO6YXFu6j5wqr8IYkzIP6sPlhXV2oB5NGWOo3dbEXKDCFg+niRu9YGWsvIjaQSELaqPY1Lrz11UFVXzAIsrfDOCTv5X67xT14LMddbFPVBsjy/X796zNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBeWvVzdv7t7NPwfrziFw0NCHqXj/pelHeJ0mrvclj0=;
 b=F6vUMmUX2pDhxtGK0cwBnVPU3z5ZDgBgmrnLN3vsRCZr36fi3vPVs9o1RP99qrYGiL6GprAjlCYzTOckn8P9F76/XWIJ/3p4+osgMMUgkk5icqA4MGfgwbtVoxuzYRChd3bA/TsF98fGxB1VSxqfqqiW7wrqS2+8jz7i/AkfM3zqVYc1LJJvAhlDbY2x6h3SV86D9i8M7lIJvSsspT6dFoR1WbW7VmiissFw9U5gf2X+F43Bz0PG+/Y9aO+iEcjBgowsTBO9hFvXL5L6NhBujMQtB3kHyLCbc22qlqTIFesnJpjcH9raw2nQQ89HnCpUm5C5uG5K+7SfqHN5gHHjdA==
Received: from DUZP191CA0066.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::9) by
 DB8PR07MB6218.eurprd07.prod.outlook.com (2603:10a6:10:141::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Mon, 28 Apr 2025 13:43:06 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::df) by DUZP191CA0066.outlook.office365.com
 (2603:10a6:10:4fa::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Mon,
 28 Apr 2025 13:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 13:43:06 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 15:42:27 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id A129B402159E;
	Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 8A512700022A; Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rybczynska@gmail.com>, <steve@sakoman.com>, <Peter.Marko@siemens.com>,
	<ross.burton@arm.com>, <skandigraun@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v2 2/6] cve-check: fix debug message
Date: Mon, 28 Apr 2025 15:42:01 +0200
Message-ID: <20250428134205.900354-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428134205.900354-1-daniel.turull@ericsson.com>
References: <20250428134205.900354-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0F:EE_|DB8PR07MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ec17fb-3957-4d15-5935-08dd865a9b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZptyjxbdC4VLQe+I+Wio04NSRBlycCbNEwckYJkus0mA/7KfAlZ/0ac6AG1I?=
 =?us-ascii?Q?lt8NYKkY1wK/KT2GrfGLozDhIUZpAGWrM/4VocFCibtuHP4CNcNqJuSGhbht?=
 =?us-ascii?Q?cxH+0u12T5yM5Atcz7hQ/P5SPl07/aqe8AQ+MrWsML3jHsQ+F/yPZf5Pi+v3?=
 =?us-ascii?Q?4Yt9LCZiAQqrGROmAmW14ss7giQ3ffHnr5WHQPFVsYIgk5AmVpKaN+pPjl03?=
 =?us-ascii?Q?yiZpG1xa4+u08sfnANeimbsSIV9b4aXaR1MICp6ITz9xVacTO8PnBHNo8AvS?=
 =?us-ascii?Q?PiW8xVbAsqHo9r36cZDSZ/FF6PVIQs0+CiA1gIx900na0qNtf7mfb/di5IwG?=
 =?us-ascii?Q?GLcO26Ku0OqgsP8LFVtRLPBoCQ3QEMoPJo1z0T2nE6zX5mldwVtBCZp2CbRb?=
 =?us-ascii?Q?G564Y2EE3D1qxYtmyD+jYjAJojFDdMRD/Ii4bn8idh5LQDfv71WogO6R29at?=
 =?us-ascii?Q?mLZ1B/n6+Coe53ZNZHpDkWFKOHLpeVGd6YlISs6j9hBM3d6RZ/9WOPpzuvvb?=
 =?us-ascii?Q?CiZmX3NvnhFDQCQDQYY3DbP0MEz8P/GFf3+FswPvgO44UXnUvC5g7Maae9dM?=
 =?us-ascii?Q?STw8ZSdA6hFyuoJoIHYObIu4r8+9toFIdmWSDrf/4N3HheNDR2XGDP9gwCQR?=
 =?us-ascii?Q?wQP22/awxMiYoRvpoVef8AppIVBYdRgy4QIFK0KdQTjNYjF21feEuGkSXviR?=
 =?us-ascii?Q?Md2sb9w8lehfaIPKamXwI1NfodXccGp0r9yTZYXIwxjaWG/XwAr+IwqNKhMQ?=
 =?us-ascii?Q?VeJnDS4mVOZ5jjOpmtWvemhhtI3fzcQtnXVcUaM754Nu2XEUmonakCICDceN?=
 =?us-ascii?Q?tgg39WtinuAalZ5sJsKOc0hYM8ACEBroQphg5f/Qgu9QOsFUshmvDAQ/Bxk4?=
 =?us-ascii?Q?LNL1+Ps5kcXTrhF6xZj/4IliCwSvTqWIEV7SuGShVAhlXM4XXg06gkyzE+Tk?=
 =?us-ascii?Q?ZjiPYFlzb7DBAukTZlx2lKNfxLN5+XZ474glioMo66wTz5co9Z25m2OOl8U2?=
 =?us-ascii?Q?RiBr+DPuTxIxF91IRuGaIRVyTydDv/BLN4wc1KZ1/7A6LVs9Q5jBN2zOviD8?=
 =?us-ascii?Q?mTi8tR42El8gCXZ2abxHcwgK7W55i+HbEczJHPJyIeI+1FQ5wJHDj6dkPG21?=
 =?us-ascii?Q?a7C8s7fjGcM762TVJfsTHYNhxuIODG3I5BsmXpigxYWHxs3LNTMlafkKKRjk?=
 =?us-ascii?Q?qFdxTy1fN9AutMDCxZZMtxO1xPAn0ATy50KeUeFMDlJo+/kHExL2sD9GqRE5?=
 =?us-ascii?Q?3wGtsyaCC7aigjRCQbhclvgmoRbHkebBpHH5OE2ExcoWZ/7OpS6UJ3Bzmm/w?=
 =?us-ascii?Q?OpdxpjW/KTfWfAE5JJUuGMM9Z5fLahsUrb+f1PhcuOqRNLtYU66KostNQeBU?=
 =?us-ascii?Q?7Fi93xT+N7eFNLZEopto18XnY9Erckj9E/cERRaFjZAWhZDikyg4TbQsDRnZ?=
 =?us-ascii?Q?dahScYjJd9G3CZx1H9YHxZY2QYERM34Ht3bzxuGpiSPtvhywzUr58sN4idUD?=
 =?us-ascii?Q?ZlIc+KANKHQNObRw8it1Z8FGsGHwBZojBsE1?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:43:06.5402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ec17fb-3957-4d15-5935-08dd865a9b3f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6218
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215605

From: Daniel Turull <daniel.turull@ericsson.com>

Debug level was not added as a parameter, causing a warning.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/cve-check.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 1aef00d297..86ddfaae5f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -288,16 +288,16 @@ def cve_update(d, cve_data, cve, entry):
         if entry['status'] =3D=3D "version-in-range" and cve_data[cve]['st=
atus'] =3D=3D "version-not-in-range":
             # New result from the scan, vulnerable
             cve_data[cve] =3D entry
-            bb.debug("CVE entry %s update from Patched to Unpatched from t=
he scan result" % cve)
+            bb.debug(1, "CVE entry %s update from Patched to Unpatched fro=
m the scan result" % cve)
             return
     if entry['abbrev-status'] =3D=3D "Patched" and cve_data[cve]['abbrev-s=
tatus'] =3D=3D "Unpatched":
         if entry['status'] =3D=3D "version-not-in-range" and cve_data[cve]=
['status'] =3D=3D "version-in-range":
             # Range does not match the scan, but we already have a vulnera=
ble match, ignore
-            bb.debug("CVE entry %s update from Patched to Unpatched from t=
he scan result - not applying" % cve)
+            bb.debug(1, "CVE entry %s update from Patched to Unpatched fro=
m the scan result - not applying" % cve)
             return
     # If we have an "Ignored", it has a priority
     if cve_data[cve]['abbrev-status'] =3D=3D "Ignored":
-        bb.debug("CVE %s not updating because Ignored" % cve)
+        bb.debug(1, "CVE %s not updating because Ignored" % cve)
         return
     bb.warn("Unhandled CVE entry update for %s from %s to %s" % (cve, cve_=
data[cve], entry))
=20

