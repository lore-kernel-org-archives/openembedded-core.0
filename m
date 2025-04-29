Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2724BC3ABA5
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:39:14 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web10.100.1745937552984497825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=acy3ATu5;
 spf=pass (domain: ericsson.com, ip: 40.107.249.60, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FO7pNIYVKFHZooCjETVha8oSMUM7MR4IAXiISVFXe6ywYva7FaeGj1dJzJg8VNCwQyuzeaWhNQRp/4hPe4cZG6wjZ5NHUqiwgMyqkMdEVt4Dzy2xvn5gyEkoXUncM1g5+a/hZSJRPzOzj2963PgPk5kbZBaAZzkXVPCdWhzquKFOzE0mwSTNs3KtHavVHPRDstRxgE+olDXPWtLiRBntggjRou4QWroCyz2xOsExQrfWCpG38Xtmu4WrzyPd3ja5hMZ8T3y1G4lgk43uvANLXnwTVuzqKgc3Noh3oCv00IN7U9di6D7ZlUfN4n5kavOJSlvNUzlKabHjRHVe4wtrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uRwcSID8sTy5Bp1xeAtPCEarAyOGRUcguyD1ePHQrg=;
 b=pcHCq0L6mYOTCZaT2oELMxWN4HKp6Ntf/bFU688s+aHuvY/Hiaol7TCp1zGf1m1k/9v79F1UaWyoo3on3SoONWzKbcvuSi73imort62B8NvxVz/Igr5gkiPds6FH8BVI+aK2zc2bdnIyfgGQk+8irLZZgLzh7FRJoKUlWLsC7DEauMHBQCv3YPoPT9p6ZmwRYnLLeXpaUT+GmTFyEI3YzHWKK4qSo/WGxTMHPr6FW1Rp7SZSVTUbwKEJedemkYNWG1N8YfP6hEs9fRmK/tk3XEYoS+HlQ3a6weJmwRwFybk4pnf2zLLGwIyhmOzIgWWfy9ZMKjTPEcRINGdFp2hSig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uRwcSID8sTy5Bp1xeAtPCEarAyOGRUcguyD1ePHQrg=;
 b=acy3ATu5TgoDx5NBa+aegffIowLZ84+7dqkHy2sCyL1ye5yQ1Gnoumh9drMejK4zgx/NA2ftHYgWfknSOxgev7lHI1ftu4a2H+UWzuA58M8u7bcpO1p6WTyFIi/hrn5xJ58l9Oqc/oBOqXZNBQFOQwkcXQJYbIrKyyvtlNQwoQd7YGU1DRjX99WmBxzIwNkHb+ZngGHZP0AKfI/YQt+oQ4JxIRHB4dBAOY+1rKSURkRAwNUyxduAOTG2918spAnwSpmPAiwrfBRdSuoruM1MJjUIb4TActiuRaq230fNA3uJU4Ume4mvGsH+pvwahvStXKHmUDjQgz15hG9pneB6Wg==
Received: from DB8PR09CA0024.eurprd09.prod.outlook.com (2603:10a6:10:a0::37)
 by VI1PR07MB10018.eurprd07.prod.outlook.com (2603:10a6:800:1e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 14:39:09 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::d2) by DB8PR09CA0024.outlook.office365.com
 (2603:10a6:10:a0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 14:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 14:39:08 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id CA8BB95833;
	Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id AE0BE700022B; Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Peter.Marko@siemens.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v3 2/8] cve-check: fix debug message
Date: Tue, 29 Apr 2025 16:38:58 +0200
Message-ID: <20250429143904.634082-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429143904.634082-1-daniel.turull@ericsson.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|VI1PR07MB10018:EE_
X-MS-Office365-Filtering-Correlation-Id: 40948d88-31f1-49ba-6340-08dd872b998c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TcliYtR9yOYHdFyTwpBMcAEA9S15n4UfcJ3NXsyhWDdWlQ5xXAN3HrmvR6LG?=
 =?us-ascii?Q?bjwkfKpPOzsXhpk3r4pMEOdAx+qR611CanXuOMksM4soXFUq61Mbq2ZRsHb/?=
 =?us-ascii?Q?JZKhw+a9tPBHU9Ahf2yAfoDCUPdCDfNvh7WB5aIe6rhWb+ybAdNLa46UIYF9?=
 =?us-ascii?Q?6U8QwR3c4zyKTVPxC9FM6jDtvnosvcObJGMlueTy0CA6hhHij48CyBCf3ifw?=
 =?us-ascii?Q?ri7vO5AuQJC0WY476YusJ7mHswDUXIR1qGWN0NFzzwprgFwEcLynhk6NQ5xm?=
 =?us-ascii?Q?a/o41Jlq/JCzSyPJ14P3/n1DC0Zf4/cBVieAH8yEfIfFUtm7ogkijooT06yD?=
 =?us-ascii?Q?gSSVoZAgGlS5V3GdzPPDXT0YiIlA629K7rUaq82SEd0sNU2iclsbpGdfRYfj?=
 =?us-ascii?Q?m0P1WKgcg49hjupZcLCmsctJFXW7Bv6ZqCmO7i/0qSltRtJOTTifL4WqvL6j?=
 =?us-ascii?Q?wlAsdtzbhcvvpUrEpy9CbIXALxZ5xMjrFqr8+TNkv+Pw2obWSdMgKX9CRo0y?=
 =?us-ascii?Q?ICzTRfHEAPOmtKtYV+k6CB4e2/4vWS/yfBXMhHzCC1JDn0YOtMfzNgB+enl3?=
 =?us-ascii?Q?h6D/yAuMzcYMXTFrWhUoHRoYWnvR6POucalPRBhnPiusgCxZiD8s1MhLhmiF?=
 =?us-ascii?Q?CK0nFb4JEQOFn00YXwPQFgMiuQbLukRFMPj+zoHw0cbJVOSuSyR1BSARF1Cj?=
 =?us-ascii?Q?aNsCC04YRkikUbLY5cAsQ8Rr4AGfz6ONNTS22CGIQChoWqvMvQ9uwA3SwoWi?=
 =?us-ascii?Q?xPRziyXk0Q8Ph2XdqSVW6KOmmUa7xLscR+XOWizt+QA5lTbk6Vy1Rjv0wr0n?=
 =?us-ascii?Q?4YFBmJjnWjbkUmL7OAhaq89rxKeJX5sOsgUn+ZxMSxMfOaIDWjqFlvY8IwTK?=
 =?us-ascii?Q?bNOrRvFzyxDTUHtSPLHnSSommkquP6U+SGFv4JNavbjuW8BiOGy9mFi6uFO2?=
 =?us-ascii?Q?eumzvF5izGziIuwHd1HZ6WXd9BmIW7oKOeVd5WWEiL0KMRc9cdEnQD5slebX?=
 =?us-ascii?Q?ZokZ+D6eE5vHjkRY5XVndI0sQm1vvN0rcNhvRFrIbUUdKpDI2UZ4kzV8d/Ff?=
 =?us-ascii?Q?toqyBGz6azvSQyJn+sk5eC2hUte1QXLy3bUtzMuvpTJ4P4mdr8l514RctRpA?=
 =?us-ascii?Q?JL8PkS2c+T4gShkAUxHPntX1fxd6hdBaKcL7ScwOGLIcKKgYptrrjhQCTfxz?=
 =?us-ascii?Q?YLO039S40dISjt2yrnfWfe07v9sI37vciMHq1di/srnXItFdcLfEPpmakQOH?=
 =?us-ascii?Q?j5RdoWC/qSP+ufwbnBflvHL51hXfrCHg59YDL6YGxGMYd9H8tIhdrUyFkBT+?=
 =?us-ascii?Q?4RAadZQ3Sg8jxYZaVXBC8juCAlSa37DYs5vuinBYvgW6Ng/NZbsrxJdXZmyC?=
 =?us-ascii?Q?4KlYKC4poOXWPGFuy8+TJXY2CstiV8DxG+gAkAZsqk3ziEHMCrjY8q53taeE?=
 =?us-ascii?Q?BldkR+Cle4SBudy/C1WDAUz/We16doNlpHkcTmlC24cJWG9xs8NA1mqLs1Ku?=
 =?us-ascii?Q?Box6nG/oLMeeHh0HEpeU+H/xKJsG26ljQUbC?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:39:08.5078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40948d88-31f1-49ba-6340-08dd872b998c
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB10018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215670

From: Daniel Turull <daniel.turull@ericsson.com>

Debug level was not added as a parameter, causing a warning.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 1aef00d297..c63ebd56e1 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -277,7 +277,7 @@ def cve_update(d, cve_data, cve, entry):
         cve_data[cve] =3D entry
         return
     # If we are updating, there might be change in the status
-    bb.debug("Trying CVE entry update for %s from %s to %s" % (cve, cve_da=
ta[cve]['abbrev-status'], entry['abbrev-status']))
+    bb.debug(1, "Trying CVE entry update for %s from %s to %s" % (cve, cve=
_data[cve]['abbrev-status'], entry['abbrev-status']))
     if cve_data[cve]['abbrev-status'] =3D=3D "Unknown":
         cve_data[cve] =3D entry
         return
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

