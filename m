Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E23DC3601E
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 01:33:19 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.31])
 by mx.groups.io with SMTP id smtpd.web11.2954.1743816790144479978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 18:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=lUD1kFbu;
 spf=pass (domain: axis.com, ip: 40.107.159.31, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNlzkHWSa1LHn2OMK6EXGVEL9KsT5kX6owMpn90Ficiiz2Y+X87MlwuPCwZ4c9nDcAEPp61bdb7txgaJdRnfSrix3K7ntSKwVEkUZ55cTjaaDuGrOB/oWjEa7Rb6eYLTj/sSnG4qrFAwoa0s4N99DWbfwWsYDKKowh4x9uM8gtGO2OhLmD5zrj/d1jrUfSepWEFUhdLs16x4HC8qRI+f/QlUwlYizeMpP3GLjFzkI8x0Ef+YckpYXJvkKdVmC83EoWoSpQDCAsyFq7N4lgJTWlgczQNudXNkHRo/RXHm0VqIDxLLU7CbYUd3kp58KLAMFxopgHl42OG82ZFqv55RQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdSnx7kChz+tK1h8tOZKMr66jzj2IPlRPfwy7tmFB28=;
 b=kdzw59WaDdsyoZMNcJW3IKvkcbkDGY+0zxlKek0g/4eTuGnOeWu0zQiOefVxbEu4pVY1FN1X4VKpAY9JiYGcO5MAVA1X3L6RISaMHMMk9Ppf59OHR47TRZG342wot/+25BrY84w1/ffTnLz3jt9vkfAOMyGxzQTna1Af1A5/YUshxE/oTq5M9zazbo+DXufO0GX46SLVUC+OEtLommNleTDyI4tagNTbHt0bs4SkHv13Tji556atzjqmvkMwNOLnlCtvAmehu2Yc/M7w71Ze/+LHfEf4YVk8rLoOc/VZtpBdl7xKFBiuEENS3qwGO/ckjeWgtuI8ADl+yLzZSqhlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdSnx7kChz+tK1h8tOZKMr66jzj2IPlRPfwy7tmFB28=;
 b=lUD1kFbuxk+u86a8g6Cyllvt7ysltTCrHAlFdBuy0D2vUCa0rWidm9ciWNaVLNFau+a0PiFNHNIzyY5XiutJdOhtMAmBHlSzmQhya8Ox2XG+S97WYPQv6V7U2RT+FA/3M8cVNCoNuInv4uTwhfbIMj3G6uQz65rC3/uzqyxtWOk=
Received: from AS4P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::11)
 by VI1PR02MB10265.eurprd02.prod.outlook.com (2603:10a6:800:1c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Sat, 5 Apr
 2025 01:33:03 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::bc) by AS4P190CA0018.outlook.office365.com
 (2603:10a6:20b:5d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.27 via Frontend Transport; Sat,
 5 Apr 2025 01:33:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Sat, 5 Apr 2025 01:33:03 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sat, 5 Apr
 2025 03:33:01 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sat, 5 Apr
 2025 03:33:01 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sat, 5 Apr 2025 03:33:01 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 615A279
	for <openembedded-core@lists.openembedded.org>; Sat,  5 Apr 2025 03:33:01 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 5351X1sH1545113
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 5 Apr 2025 03:33:01 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 5351X0K01545112
	for openembedded-core@lists.openembedded.org; Sat, 5 Apr 2025 03:33:00 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] insane.bbclass: Move test for invalid PACKAGECONFIGs to do_recipe_qa
Date: Sat, 5 Apr 2025 03:32:57 +0200
Message-ID: <20250405013258.1545080-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|VI1PR02MB10265:EE_
X-MS-Office365-Filtering-Correlation-Id: 30826f8a-05dd-411e-6d60-08dd73e1cf1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ufImZxfraJbFuj7CzvbqzbS7n5cXjEWCOT27Ju+3Mx1RJby7FjOzhuRMS5XS?=
 =?us-ascii?Q?jighP4furhPDBfHL6HEsmEUyIqHsAWXCQ9fcoOBvWTxvtxlyQrg1YXantVvP?=
 =?us-ascii?Q?4ye/o1kEGsJgkHxhkPx1SJi8JUoXRDFzg/LqtKASF6RkEa3lbNLCleFk82oT?=
 =?us-ascii?Q?/C8FQohqMunxio+pcHKxsf9t0D3ULgz5Tftv7/je2NpmmecUG8NO4nMzfIRM?=
 =?us-ascii?Q?c3NjrasZ7ZCvFZDnLjOo2q3eZayZ5UMUNiJKWV9lUZVqcHzCQ7BvHtoz7lV/?=
 =?us-ascii?Q?bAqntVt38o1Qd06i/Q0o+Po5zBKx/3ROevwW7R0MpMUH8Ax3X5cRG/BoIUnC?=
 =?us-ascii?Q?Kg9EHLPJcgTihOwnCrCUg96YFEg+Jkm+SXNtyIv9EmX5Qd/WQfn3NchIGRRF?=
 =?us-ascii?Q?GfXMQMDZVXOCJt77bW4fUvTSTvTP4Vti5lyZEsAQUj6Lt7sOsWMlva0LHHEr?=
 =?us-ascii?Q?kdRctTaEnHniNiHVtIrymSKpGhQdXNtEb7CZovMdknBMs0nagZE2rLACmZDP?=
 =?us-ascii?Q?5V72+gK4QC9DfUGeijMksOUMo5nE10og5jlGYXnVr8LEJzuSC13JnVoSATuz?=
 =?us-ascii?Q?feJ+USxdu2sEA+Ar//9I3QARfR4kCff15qQOIhtnlIpQt4kO4h7jx2jCdVAu?=
 =?us-ascii?Q?JTdUiTo8kBXo27vt69b70QrthuG9SpoG3TVJ3r14X1cBPsU5dLt8OHaRVCC8?=
 =?us-ascii?Q?2pcUF5tSwqn7eIEh79LEOif2XZ6JeivzJXnFT3vNFtbNiU2PEI+iWuYkBG6V?=
 =?us-ascii?Q?NOMtZFZk00XXZCmd7x3FtCqTH+ds3F0apnw/HVSpOtsE3MHmNWeK2FN7MUOj?=
 =?us-ascii?Q?9Tu8HfnnfQa4Chl5zGKb9hA//KMZZgPkPDcnSqFhDsOlrHwHG8BJD72farNn?=
 =?us-ascii?Q?GgbT4oar+txDwZVM1GAOk/JiXfeKHiZMIzeYN7QK2N0zUe+d6gicmfJQsBd4?=
 =?us-ascii?Q?kPtlYMBVX2a++gG2et2r9amef3yg4wAXcR8iLg70NYq+wPgRM/fnVsl0+PRM?=
 =?us-ascii?Q?DHHbhJOMm9PVZ9VOOjmhWt9MMqatoysbojRW2HCZBgXpKnqqO58Ft/S2hVci?=
 =?us-ascii?Q?zTXt81ATEXI7iQzrVifL1exXGlDztbP0EYbFGDA5rvarVkKl3Wsfo0Sm+65d?=
 =?us-ascii?Q?WdbMcnQ6EvE9cMpDexFrIQZx1tO29hXXztt4ooxkhiLSsXXdZfBdRbL0uE0p?=
 =?us-ascii?Q?G6imBqMFWQAqEJmQofwzsm6vJYj0Lr0rs8OdYoRMtG4wR5zQlfdGhTLfR8P3?=
 =?us-ascii?Q?h0xD0eQdHDBHXqguTWnP/3lxnOm10KcYdcgCw+tPQ06dh/SMVCJ+lBFsB/TI?=
 =?us-ascii?Q?1vRSrqBwkNJHKVm8gOpo3ohCLi2csSrHezZvVuWEQuTYGKMhUTXQ4rdNxh3E?=
 =?us-ascii?Q?xKKrcz2aZk5D9DmOwZpZNadnMyDBP0h581SkV0qGHN/2uCKQ0vhSd+Efr5VT?=
 =?us-ascii?Q?MVijEm2JCjDJpOqWXSx0+1lgGfLsM0JoY32zVwe2IAi54lK4dDoUmHGWlQmx?=
 =?us-ascii?Q?zDOEbO9TEugQ7+4=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 01:33:03.5814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30826f8a-05dd-411e-6d60-08dd73e1cf1d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB10265
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Apr 2025 01:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214371

This makes sure invalid PACKAGECONFIGs are reported also for recipes
that have no do_configure task, e.g., packagegroups.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/insane.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index fc4ca84b35..748de050e0 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1418,16 +1418,6 @@ Rerun configure task after fixing this."""
         except subprocess.CalledProcessError:
             pass
=20
-    # Check invalid PACKAGECONFIG
-    pkgconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
-    if pkgconfig:
-        pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
-        for pconfig in pkgconfig:
-            if pconfig not in pkgconfigflags:
-                pn =3D d.getVar('PN')
-                error_msg =3D "%s: invalid PACKAGECONFIG: %s" % (pn, pconf=
ig)
-                oe.qa.handle_error("invalid-packageconfig", error_msg, d)
-
     oe.qa.exit_if_errors(d)
 }
=20
@@ -1475,10 +1465,20 @@ python do_recipe_qa() {
             if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url) or "//=
codeload.github.com/" in url:
                 oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstab=
le GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
=20
+    def test_packageconfig(pn, d):
+        pkgconfigs =3D (d.getVar("PACKAGECONFIG") or "").split()
+        if pkgconfigs:
+            pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
+            for pkgconfig in pkgconfigs:
+                if pkgconfig not in pkgconfigflags:
+                    error_msg =3D "%s: invalid PACKAGECONFIG: %s" % (pn, p=
kgconfig)
+                    oe.qa.handle_error("invalid-packageconfig", error_msg,=
 d)
+
     pn =3D d.getVar('PN')
     test_missing_metadata(pn, d)
     test_missing_maintainer(pn, d)
     test_srcuri(pn, d)
+    test_packageconfig(pn, d)
     oe.qa.exit_if_errors(d)
 }
=20

