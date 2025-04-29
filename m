Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C4EC3ABAF
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:39:14 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.48])
 by mx.groups.io with SMTP id smtpd.web10.99.1745937552619668247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=JBgA1fW2;
 spf=pass (domain: ericsson.com, ip: 52.101.72.48, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6Jf/mRRicCsihjAKawRXaaM2TydZHFcBk+v7mKwvJi+dQJhRb0fJMULa11Tk7jkPNCAye8X4cK3rtorVLUexGYkjbKtQeU7f5iyjccoo0HfXDVqoq1m/NGbfDwhMvE4Kyd62jizTklP7oyb58FU1rYVXAKFN1gCsWHy7O8RbZPew9bcFHXxARrM9EqeDWDTSNyhtj5bgx3426kPFLAeR00r7kLXiGUHA/Mmm7siujd1g6aarmMsaD/RUGV4ZN7zqf0mJ5PNKRHZLQIpg+rsPWEpy/3r5Pk8OOAt3OOxam1QF1mHkUJ2SzahrrMDL1slTUg74C/mnB0lTTtgyFejVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jm8v9LvaSCGIxPHZS5JYvOYgE6e74mADG0WF5ehg5eY=;
 b=H2zijTsSvEzzMurd5A9OOq+Thgn6UI8teU/A6KcdeGuz4MwCGRsk1Rwk/ZYEDFLQQiLZ1IvgEuiXeBZSgbwDCYopkK9sw3Sz+YOrnfdNPu69IoJq1utGdVN0vSPzTXOVJBe8YXR6PALnlFDDyo8ApZFHnF7pb1P8X7el3z2AaVmAxT3Bg6fINM7vBf1/mKK+KA+ts8vmPA40HZ9L9CCHngm5enEGPYcMWR0o0R3nFofePR3t57DV01Cx5yh84OfzbeXY7IKCmQGrXNV/LOmW9V5CMt1BQO3xpLi1VAPq2so0yxzC9LmtQviLjt1AD7bvf3bMDfkE66JaO+vBttj77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jm8v9LvaSCGIxPHZS5JYvOYgE6e74mADG0WF5ehg5eY=;
 b=JBgA1fW26GlCHn6jM5KBTbsCe6VsfSTDgI1p/zaCgcRZTexLCbCVAnzv6ckR4hmUKEjFVqelu+cfAp4vu2aUx5coyuZUUjiS84lVTWNu+3O/7cGan3oN/67pi4S21BqvLF8gT9XNKHQRssnXy6sj/702Cw3G2xoCT6AsLRqHGNmlWto3PuQW35aJFHKfCpjSrvxPdXSOxau69afElv9kdSFU7vwuMUzcGuqNxIB/QOoeyg4JJqdGt+pBskboeWPLEexHmPQaPCmU3VNwb1xUhWmOSKysWeQwk+3jkahmos/oRTaA+c5XMz/EmIK4h5B+kerjInSJxWuOkFhh0YWb0w==
Received: from DB8PR09CA0004.eurprd09.prod.outlook.com (2603:10a6:10:a0::17)
 by AM9PR07MB7266.eurprd07.prod.outlook.com (2603:10a6:20b:2c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 14:39:09 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::8c) by DB8PR09CA0004.outlook.office365.com
 (2603:10a6:10:a0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.39 via Frontend Transport; Tue,
 29 Apr 2025 14:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 14:39:09 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id CBF034020856;
	Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id B737170E75F3; Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Peter.Marko@siemens.com>, Daniel Turull <daniel.turull@ericsson.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v3 4/8] cve-check: move message outsite check_cves and sort
Date: Tue, 29 Apr 2025 16:39:00 +0200
Message-ID: <20250429143904.634082-5-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429143904.634082-1-daniel.turull@ericsson.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|AM9PR07MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: ec88bfe9-61af-4d09-6026-08dd872b9a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xKjMBVKQX/PWOuJVRFQ/MzsIiLYmgzkBMlSdBiZvb/zrg0EGbrl1RW671hWp?=
 =?us-ascii?Q?wUuvaZlJ9AqvdDNH5seV2FPDRyIynNnTlqjTH5+qSg7lTFE4Hh7aJUfkEfCI?=
 =?us-ascii?Q?oi4jHVppsbHIu7dvu4IMoEEdDI48AzS2TlxuzJMCJogxmIM/KTGUvAkIUvj7?=
 =?us-ascii?Q?mS+ljM22N7ahB3hD3zdxIVvI7iCeCAZjrmH31LGNJLFmQqs74Zq+gNVrJNuP?=
 =?us-ascii?Q?uEuVFteJabhzipWo9Ee57d+iDq0p2liC/a3ZI+woo9bf0z0KSL80QlRiCW/E?=
 =?us-ascii?Q?UIvAKhE2oFpkQXF7j9oHI3RZz/eufb6vHZjxoXFSK5hiZycR5bPZFdKks4b1?=
 =?us-ascii?Q?aO1p+aqLHY3rrltkPVJRzOpxhOb5pEzah2fKVSE8rcPUn15O4GfdiCbKR7do?=
 =?us-ascii?Q?Og+O8cUJOoKp6CTAXzVLF1djfaeounBIXbsjGNiJU1Zi2VL6mN/5Eqt9C6aO?=
 =?us-ascii?Q?xUtm57par0XPjHDCDjL0WIp3kZGq7FDadvgUlhuRmDbiatwqc8Wi706E4gfk?=
 =?us-ascii?Q?yXwgAk2L0Z3gyNcMOi+AHzigedzWOsSilqAjRjWwIW3x/Qngj/zsj0IMY/gk?=
 =?us-ascii?Q?UQM4kWHXXWAmqPPzvoSGgdbtzpEbLAg3GLd78vC8+u6YrxtD5us3x9BdBZas?=
 =?us-ascii?Q?Z9NoWY22rVb1/NWe3smJLvViO931GWYCKHlCPafoDnUf72Q3mmMcAxote5Bb?=
 =?us-ascii?Q?RqZSouUadO7WBv3Rqbtw2oIhMGLrFLM39q/p0bMJPFSP+uZLueg1tPwTQQvT?=
 =?us-ascii?Q?/7Eq+PJ/cE9cRbdEVZqJMtkGy+xjiR9C7RpAhF8bC6cMliMQwyhiNOWqOttC?=
 =?us-ascii?Q?xJW3J8i7jpNTkvR5nyJZbZ+TzK/1SvCdZl2umDoQwe8nkIQqFdTLg5JhwDbE?=
 =?us-ascii?Q?W4oMmQGRJIWpvkHzzoGwy5d48b12y18meidnt8qeeYBFe90I+qmVrVo+xqk2?=
 =?us-ascii?Q?I5+j/gF1RB3pcPqZA7ZPc8XmTCkP8GHPk/X1G372zr3FlWI5GLuYOOdLkHAN?=
 =?us-ascii?Q?DXTDtMhqlxoqaQH6ti6WnsEqh0FXjIhfGMgEqfPV6Ie1Ti2SSYwfK5tVi4tR?=
 =?us-ascii?Q?o0wYBFSD4GBz/59WAMH+m8STlkj6Jg+NbXCmfknClvYXLuOMT0S9fra+ZUUd?=
 =?us-ascii?Q?BVSTxb4n61/oZ5VJk6w49y3fPVt1F67eTsdLJURVY1xIZj8gOMYZfKAz+Jbn?=
 =?us-ascii?Q?xvRqUk733FW0Qnw/6+4yae+jMiWOGoLiGHGESwO9v/yyiDOsMXRl8E8GjKh+?=
 =?us-ascii?Q?+dLlZsxG8bEBQkFEGMPy+yp6Rta2NgtsXwF6z1wqHutVNQEC/uPK9vcjzu9X?=
 =?us-ascii?Q?EnHS20lUtwjXwqjfeB2/vN+FgScqylJZIbAZUHiSL0ZuPck+isyBseUTU0iZ?=
 =?us-ascii?Q?rhRBGa2SY/DyLFYEqatUSsg70/MXbc2X+dy4nU6vKE6vXBAtySn6aL2Kxlmt?=
 =?us-ascii?Q?ThnB3vc2w6zaj/uzzC8F5m63z2oTrj+rRVhrQsgWQ/jZ9xv8R6V9kS9K8Y+Y?=
 =?us-ascii?Q?/8v4Apd/nt/UGz+6uPEVHOzIPuA/ImFf2puu?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:39:09.6083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec88bfe9-61af-4d09-6026-08dd872b9a36
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215669

From: Daniel Turull <daniel.turull@ericsson.com>

When adding corrections from multiple sources of CVEs, the
message showing standing CVES should be at the end. Also sort them.

CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/cve-check.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index c63ebd56e1..cce10c70ee 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -173,6 +173,12 @@ python do_cve_check () {
             if len(cve_data) or (d.getVar("CVE_CHECK_COVERAGE") =3D=3D "1"=
 and status):
                 get_cve_info(d, cve_data)
                 cve_write_data(d, cve_data, status)
+
+            if d.getVar("CVE_CHECK_SHOW_WARNINGS") =3D=3D "1":
+                unpatched_cves =3D [cve for cve in cve_data if cve_data[cv=
e]["abbrev-status"] =3D=3D "Unpatched"]
+                if unpatched_cves:
+                    bb.warn("Found unpatched CVE (%s)" % " ".join(sorted(u=
npatched_cves)))
+
         else:
             bb.note("No CVE database found, skipping CVE check")
=20
@@ -422,10 +428,6 @@ def check_cves(d, cve_data):
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
=20
-    if d.getVar("CVE_CHECK_SHOW_WARNINGS") =3D=3D "1":
-        unpatched_cves =3D [cve for cve in cve_data if cve_data[cve]["abbr=
ev-status"] =3D=3D "Unpatched"]
-        if unpatched_cves:
-            bb.warn("Found unpatched CVE (%s)" % " ".join(unpatched_cves))
=20
     return (cve_data, cves_status)
=20

