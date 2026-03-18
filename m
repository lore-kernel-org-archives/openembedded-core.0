Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAD31088E42
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 21:59:52 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26467.1773871183813455155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 14:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=LnQnJWPD;
 spf=pass (domain: axis.com, ip: 40.107.159.71, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8ok1N7esz0HnCnmnLskugYyJvL2NOTAfbb2bXktiSjk+wL6xusOTma6TqPpS9hSqOCfm3mHcMQet4/KKYxkgbUa7AUSHwgpzv51AYoHWuhIdoeUIEJGviF8DRchQHXqBaghKD3oyA0SPNqUebM8KTJfzKI77dU5o014Ultyrr5z8ssQanNhBhmN3VUKzq3BJ0ckE+PME3o3nmn9lCA2rQELQRPrpGlrJTgXZrUMWRidSozVAJV5F2CiqqcIeHRMbmPPImwFNGrTNG26TS/JVR8JWoS5qMQ/1JSakBEB6vJXnGWgQICypu2EoHMIFZzN7NxgftffvAYE//QLOFdBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoaNLYrXvPVXjJur4e5xBmG2AVNALULoX1o1v9slu0I=;
 b=koa0ivvCnrWSkyajfoOf0foR0pHFiGoSwrdRpP/Z4bBmNZelZFJQi4FjLPRUCJ/JMvyBDxQ8aMApryIFp3nHZ3W6R9sRu9GguDOccqQYIn6d2edGIGvyyIu3XdtBOQ2AL3SJoe0z6wRodfa9s2JAlDMIQ39hwJsbfIS8H45U1dVtUHw+YFto42dI7ZVZnCKfc6oWZGMir1bHjWLoePsg/gmwWZpqY/oBuVjCnAhF/RaWjR5vKfLRgT1rAx5g0jNkJWOh+orbuWhNU2Rq5SuzdV1Nhfat+oNLyg1C8pT4a8jBLZo5yYNgaH/4NdCjrggoVnW6dyqhmzTlJH1WYohSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoaNLYrXvPVXjJur4e5xBmG2AVNALULoX1o1v9slu0I=;
 b=LnQnJWPDenLNjRVgBeCAwAfsjxnfCQSEE1bT5oJstLN39wlJ+e8TOqr2ALm2bP0I3MXL4SzBcTToucaB2FG7YPVmLGo9jDTBDFwafHG88TEuA3WGGBxu9+RPgo/t2Ism+/71Tt3S8Y28yzJZVS1zGm6mQ9rQz1bXeSFud1/+LAA=
Received: from DB8PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:10:110::36)
 by DB9PR02MB6779.eurprd02.prod.outlook.com (2603:10a6:10:1f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 21:59:38 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::c0) by DB8PR04CA0026.outlook.office365.com
 (2603:10a6:10:110::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 21:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 21:59:38 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 18 Mar
 2026 22:59:36 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 18 Mar 2026 22:59:36 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id D51B7261B
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 22:59:36 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id CE3C612024E; Wed, 18 Mar 2026 22:59:36 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] Revert "insane.bbclass: Move test for invalid PACKAGECONFIGs to do_recipe_qa"
Date: Wed, 18 Mar 2026 22:59:34 +0100
Message-ID: <20260318215934.1949404-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318215934.1949404-1-pkj@axis.com>
References: <20260318215934.1949404-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|DB9PR02MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b032c74-63df-47d2-c593-08de8539a661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yQbQwD97QLpURmOxxxa5ajiStp5tAqDfaDcxvuyLMKO1DZyzW3d0EIscF7vaosYd2YMM0xzFm/WrX5AA+suiH05c1QTs2mzx45i/qSOBIgfNgRsfnnTad/0GSlHtBtFay70fn7mgbBM1dCXHzDeQtxGCRhL4TKtAvUFwboomZRGVN0a6NtUAKFY2oCJYS2gwsDKsjbSRYZlgRa9Ftt1PCsOEt/5ypLzIHxVL6cNV1e5D98fTjg9kBWgPBnZGxi3VrdpG9PcN12KXrPQnCVyynqSq9NSFPPK+I8sOFQ00NCw/9WkSvpYTaf4Sh9kvymEhbAwDgYuqz7hTitGW6DfePsf8WrjQISciWJKwi0RsdZUK3wY6tHwPu5yJRUoFkHYtuQ3peYbHb8Rw/lW/X63/ia9pY1TXOUprBlDIkX9WNru1teR0Mq65C/lTbbZVLzcPLAVGeUAtJzwTJWpDQjuGpGnsbJ2lWOlC+KPLXfWATFrx5BBDSq5unQMcq3MRFKUzY3qDiHUaVaD9rnM4I7ErRZ07LDRcJcSs6nnkrnbEiVNHYntjcWj+eJ/AMpA1v/+UpwZzw6ZS+Y1WzAC+qhj7KyAGphwpEp2mriJPWvzlzojiYBpiT2PeLGb2SDaxW1QK4I1fOPkEEX6wI0pL8dWM+OkNHylr6k5XxDAwhUy4PtxDVC4aFKtlVpxISPFjgCdQc9uoG7cQYr/CcTIx9NSFV6Fy+jYCr1gl2X/TsS3hcSCwtMrkByHs0fUrE2kRJMOzsPF9DFE1oo+nNY4aeyLUlw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ArDbYFQXg+7DVlb3xAhHI7zpr7LRTNChzfr3o6lrALz1kNgWS8VIgjT5hi5sPohotl77F9WOOPIl65VT0xMEwb+wz3DZPnXBdcWGs5spsuAI6U9OO89vyq43UIlFw7kGdxLo1NPJDVZJV62/eAIlNHKCosC4aOByvSrA8zqHcj/PLPlF+l1GB0EQDkf7BL7/KdFvb0LlvTInnTVZ9O0mc8lA5ld+Xocgi7RF4ujUmxmz9X+P4rl3XrQyP56gAQqzv6SOc+Ob4Nlbb5hSN6S8sjhNIqnpoKEKx7Fzdj0QgTtfXvbec0OEzMi7BP5lJyifL7gp8gGmxjy7YyNJ8OeAngkphSLHw8sPm7TBoqPloRykIxhKzZziKQU9m05C/iC9SDqSDcYXAGq+870jko9vR9VCGZYuzh/asRIVPnKnOfYFp4x3cNBhU9NpzBecYfVy
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 21:59:38.3716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b032c74-63df-47d2-c593-08de8539a661
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6779
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 21:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233435

This reverts commit d3325c384a7df54c564cae093659cf7b692629f2.

Moving the QA test for invalid PACKAGECONFIGs to the recipe_qa task
turned out to be a bad idea as that task is expected to be architecture
independent. So move it back to the qa_configure function. The original
problem (that the configure task is not run for packagegroups) will have
to be solved in packagegroup.bbclass instead.

Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
---
 meta/classes-global/insane.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index aeffee7983..7b13e932ff 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1423,6 +1423,16 @@ Rerun configure task after fixing this."""
         except subprocess.CalledProcessError:
             pass
=20
+    # Check invalid PACKAGECONFIG
+    pkgconfigs =3D (d.getVar("PACKAGECONFIG") or "").split()
+    if pkgconfigs:
+        pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
+        invalid_pkgconfigs =3D set(pkgconfigs) - set(pkgconfigflags)
+        if invalid_pkgconfigs:
+            pn =3D d.getVar('PN')
+            error_msg =3D "%s: invalid PACKAGECONFIG(s): %s" % (pn, " ".jo=
in(sorted(invalid_pkgconfigs)))
+            oe.qa.handle_error("invalid-packageconfig", error_msg, d)
+
     oe.qa.exit_if_errors(d)
 }
=20
@@ -1484,21 +1494,11 @@ python do_recipe_qa() {
             if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url) or "//=
codeload.github.com/" in url:
                 oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstab=
le GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
=20
-    def test_packageconfig(pn, d):
-        pkgconfigs =3D (d.getVar("PACKAGECONFIG") or "").split()
-        if pkgconfigs:
-            pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
-            invalid_pkgconfigs =3D set(pkgconfigs) - set(pkgconfigflags)
-            if invalid_pkgconfigs:
-                error_msg =3D "%s: invalid PACKAGECONFIG(s): %s" % (pn, " =
".join(sorted(invalid_pkgconfigs)))
-                oe.qa.handle_error("invalid-packageconfig", error_msg, d)
-
     pn =3D d.getVar('PN')
     test_naming(pn, d)
     test_missing_metadata(pn, d)
     test_missing_maintainer(pn, d)
     test_srcuri(pn, d)
-    test_packageconfig(pn, d)
     oe.qa.exit_if_errors(d)
 }
=20

