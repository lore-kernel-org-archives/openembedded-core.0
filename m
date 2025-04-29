Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3845EC3ABAD
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:39:14 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.15])
 by mx.groups.io with SMTP id smtpd.web11.111.1745937553769489909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=gtRREMH7;
 spf=pass (domain: ericsson.com, ip: 52.101.67.15, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shK1hhyURmMdsSXEi9+PCuJTRfupEkgIFrrx94gHK58BjbFUt6A65q9JLzYYLrWkOsiwK8CPYL+iYPuxCEy3pd7SviyjGEF8A0wzrnUT/d02Y4rOcwCE6v/AC6v3lWXtVCH806QV1dYiKWr1Y8Fs3lsZgK5GZZT46GxamEZEYtzPRlDzql1sIp/zDcYg9JqPOQ6IFSRQeTJiFrEpodFqwqa8h6sBWym0X38/nch3r3oj0+LoKHfKwarEgWdV+X2cqAg18RyECpC9QcOEA9nA8uGmOb3nBOZX5o3KhRveiH7LUZBq950NBCjHSF/rRrqENhYYqRtVQzvu4q/y+RbuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ov/qwUB8n81iVMOdCraPBC24MN+AHJyANA66Q4nr8+w=;
 b=idvop0WM8vKeUwdewV9DtOmrTIe0pjJGK6hr9jGvBpWutnBlfmkRiniALIreEXvrd5Bfxi06S78ym24O0p6jG7ehHRHpWpF3j6zoBB3VznSuNSMVAb/QyUQcUoJzBuxjNpmXrFRRecHgpFbwyy7jYQHNAYRjFeZuO2ZHBUvlN6L+W8zRS5sezyQrXPygbbHBfONjnkyydydfr8HBW8Y75bzmgP+HnswNOG0JjpFWK8lHs/cWwNaC0e668xanpV9NnuKU3Pf7MQYKQGz8FIXjy1nkMC2RE83aFsPHN4vNw8+pQKz5axeIRJ8IsK1xJ3OM0NIjOphJkIRuGZyfkDdUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ov/qwUB8n81iVMOdCraPBC24MN+AHJyANA66Q4nr8+w=;
 b=gtRREMH7z4oS94TQMOnKyMNLdSbv5uRfdLAb05xvJkg23rptNtJ3FijWr4VMJ2jck+bKHyp9pdv7Dm1RGHPiTOCR5eUKQDqEcV12YXk6oqsA0j939Bloz62DdFf11PJeyO84dccBU1NZQFPdRrO6rg6qls2imk0XmflHcWrnb2xfJA31o7HAECwMP5N7lHYVInthByUKWzQNaRiabE7Mrvqr8d6s3s3LPWWgBW7Yj5iJga1LHynvA4Ni7cfi5hqmXYLvNt1QMNV5Jp5YI8qrQ8bKTNAss5rJLKSp21kcWKbvGlWN+MA28N+KLwtghAxf/lvoo6boBm1nAikGnatwuw==
Received: from DUZPR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::13) by DB8PR07MB6380.eurprd07.prod.outlook.com
 (2603:10a6:10:13a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 14:39:08 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::7b) by DUZPR01CA0006.outlook.office365.com
 (2603:10a6:10:3c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 14:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 14:39:08 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id EAFA695835;
	Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C00FA70E75F5; Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Peter.Marko@siemens.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v3 6/8] cve-check: optionally allow to force update
Date: Tue, 29 Apr 2025 16:39:02 +0200
Message-ID: <20250429143904.634082-7-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429143904.634082-1-daniel.turull@ericsson.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|DB8PR07MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e977960-fa0b-47f7-c152-08dd872b997a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oCUplpjY5rVJs+svgpFvfB0fHscE3TzKondpHYAopkPo307J0Z7IzQxVlu/d?=
 =?us-ascii?Q?g0T8CK9xgWTSqoAG7oQQYXIqMnmYbv/bKny1VoF4ToBhX8ucy+coCRR9rB0E?=
 =?us-ascii?Q?2s1om1NeTm49exhF6j5vFu9WutHR9PLYLJpGxnbmyLl1nwqAUYxqXB9c1pw/?=
 =?us-ascii?Q?7vvKo8srb8fi6sx2wyWkTIZiRkukLY6JlxWpueO9WFqPvrd2M263DTmkxj1n?=
 =?us-ascii?Q?VkGsEy1GtDP7ig0SedRewpSUJ4TKTZE4vPcxidDSPjfBf9cLqBtp1UqKCSpY?=
 =?us-ascii?Q?hFXNLue5zybtTzuswuU0Ra8vvQouCqpBT5MaNr55UwUpqYVa7L0nuQjWq2gU?=
 =?us-ascii?Q?lYjCVM6Hlqqi+PCELGjRDXwM12KFOUXc6Ai/Kc7BTleOu2O4eVgY3qUpCNUT?=
 =?us-ascii?Q?K2h00VwpnWDNPJh9HMpdcgnjrvDTzVeq//mEsLJhnTUTfP+gPLI2cSDsSgw7?=
 =?us-ascii?Q?/EqyYtDm68G9iYOPZIsT1jQBSod55H2rrhXFCN6DjDn77+a3mJlluQT5qJCx?=
 =?us-ascii?Q?1HsOmPgknuNjwzJtH/iqojPbKUHZ4OmevROT3gNj24alcmr+Ylpx6EnFTKXm?=
 =?us-ascii?Q?GeF+kej6/ZW9xDcwy7+Y+Exg6XAoXwn5SQNWqZIus3+1VfY3Q6SviXugYfRS?=
 =?us-ascii?Q?6sRiLXDohIHP8gFY7Xy9gfbxPJB1MAUGaTlpttTm/FO+djRUZyAD0BeDKEX3?=
 =?us-ascii?Q?dXeI+7tPf7wkLC8+ZJY0O/74RJ7ClG5iUmZUfLgtl2NKXPsBYcuMcTioH8aT?=
 =?us-ascii?Q?0Xv6/9e6XX7rv7BYskGnLr8nu7sujS5O2iY44F8TlMzEL3X7KHJW9MtJGQIz?=
 =?us-ascii?Q?SyhfrMID6sslu0uk6VTjsuVm/bv0eu/kQXir3Hc09N6Fw8q4W1PX+Vx7v5cF?=
 =?us-ascii?Q?+56u89BpSf/61QGDGzCwg+6Dd+Sm9d3Qpd5r03RK6ZqCU9ykEKcQPM9h+bkN?=
 =?us-ascii?Q?mG1qVYrQh7CnqS4G7bKJ3UlV24+CkZ9nDl1Ss+RQQMgNMpDED82/KZ7ccGjo?=
 =?us-ascii?Q?N8zAenkBTLEV/NXbi85pc/ESUuPXuf0lAtHQroImhHzP+9shY//wKM4g1W5F?=
 =?us-ascii?Q?mAg6Q1ZUMmXpS5HwehvxuthaR30pr4vgVPTJs5x7LuZmMYyaO811OgAXfDGO?=
 =?us-ascii?Q?UhD/QfQoVbOrpkhs/yOGaCTIPwj36pC1knov8s+oU+pWVdIZpWn2VXGvIrkV?=
 =?us-ascii?Q?jsjQYGZwiHnInzKPlqqIsUQzI5j4C5o3RgwYS7QcVCaQoVI2QRXROzFQCMAN?=
 =?us-ascii?Q?laeCIHB601IwXXAiWOYOKAyfMaXXZvda2Rh5h4X5DEtU8QetYQXZQGKu9Wr1?=
 =?us-ascii?Q?8/i2+ZSn25rm8OE4/nz1ZjXZKC9wYUwdai5eUxsWeIveYYG7+qzhj8k7n1ev?=
 =?us-ascii?Q?+ZGO265wRyjO+iV57j0MX17s/cbV0CjeWxIni9M2LyGIOSWsk3asV1Zpex2v?=
 =?us-ascii?Q?+VoRWiOgSAioFHZOaBp7v10t50ezf12WEl17pO3kjdzp6WclqfCbE4MwLT6d?=
 =?us-ascii?Q?3uxnY+3NIndCU6xH5eCKXO7hLx/6EL8Pq3Px?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:39:08.3945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e977960-fa0b-47f7-c152-08dd872b997a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215672

From: Daniel Turull <daniel.turull@ericsson.com>

When introducing multiple sources of CVE potentially it could be the
case that the answers are different due to data quality.

Allow to override CVE information from the scan from Unpatched to patched

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/cve-check.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index cce10c70ee..81512c255d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -277,7 +277,7 @@ def cve_is_patched(d, cve_data, cve):
         return True
     return False
=20
-def cve_update(d, cve_data, cve, entry):
+def cve_update(d, cve_data, cve, entry, force_update=3DFalse):
     # If no entry, just add it
     if cve not in cve_data:
         cve_data[cve] =3D entry
@@ -297,7 +297,11 @@ def cve_update(d, cve_data, cve, entry):
             bb.debug(1, "CVE entry %s update from Patched to Unpatched fro=
m the scan result" % cve)
             return
     if entry['abbrev-status'] =3D=3D "Patched" and cve_data[cve]['abbrev-s=
tatus'] =3D=3D "Unpatched":
-        if entry['status'] =3D=3D "version-not-in-range" and cve_data[cve]=
['status'] =3D=3D "version-in-range":
+        if force_update:
+            cve_data[cve] =3D entry
+            bb.debug(1, "CVE entry %s forced to update from Patched to Unp=
atched from the scan result" % cve)
+            return
+        elif entry['status'] =3D=3D "version-not-in-range" and cve_data[cv=
e]['status'] =3D=3D "version-in-range":
             # Range does not match the scan, but we already have a vulnera=
ble match, ignore
             bb.debug(1, "CVE entry %s update from Patched to Unpatched fro=
m the scan result - not applying" % cve)
             return
@@ -416,7 +420,7 @@ def check_cves(d, cve_data):
=20
             if not vulnerable:
                 bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, cv=
e))
-                cve_update(d, cve_data, cve, {"abbrev-status": "Patched", =
"status": "version-not-in-range"})
+                cve_update(d, cve_data, cve, {"abbrev-status": "Patched", =
"status": "version-not-in-range"}, force_update=3DTrue)
         cve_cursor.close()
=20
         if not cves_in_product:

