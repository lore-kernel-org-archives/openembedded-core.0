Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E02C369D3
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 15:18:27 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.52])
 by mx.groups.io with SMTP id smtpd.web11.42763.1745335098489630295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 08:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=S6aHBY/k;
 spf=pass (domain: axis.com, ip: 52.101.72.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IY4V74R940navPnHI7V6/cV7YWRdnBg8p3xS+LNHNgb36KJxmr2E3JpIeACkYthfFbi2QjdWSWLH/m8B/99YsOKOCh/jLjcm1FEjbPwSQWyp2S48GJB2QzPqA17Mr3tThnHSBWmcHsbWWXzRRkEmBfctxbPiUHgh95qY4MDx2eC1i01kfmaVJB2u3Wb3yi2+KYd3DOsivmlaC0f9KZeb1liyN1qt7Phg/HqUlcJAOx/7U+kUVuVBxBOXPHL+enazxOXcfcSDvqM7FRqQVq3SuJSGW+57XTjR0Cnn6OQQQKRd1zo0kY8Pq0y1JOT8IstbtmFGrWlmRE4fvjtKBtjA4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9PY771zT0Z6Q3LdFYDlUkDSkb59zxTGaSzKIl8xozE=;
 b=KIvPNwhWwoCnz5o4WT8etMNPyiEYvzHIUrcq1hRXbT6AK5IT+LAKVlMFTqlEtHftxZK3F5b47RbRLe6nSJVOhiRwdvsiyftM8ph+2VTb4k7anfA8oYKvHluNimezxwDfcnIH80zdCEBDvKyu9MZpdYkW3mt/PN76uPxLKyA1GJcerhUWovB4iNAsHxUstZSJQuyRNTzjIeW4YlgU6oLjIKvu1MbKFVtBYxXP6CFMkrIyiTmK5LRK7mZfpRbIqCrKr9E4gQtwLB52h6Xw89T5A1MgW8wc0dQ4EjjACpEhJ/wA5ltQhbQCWhB5JrT8Af5//tsK6IAVl9HOolBcK+5jow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9PY771zT0Z6Q3LdFYDlUkDSkb59zxTGaSzKIl8xozE=;
 b=S6aHBY/k/JO3KHNe3JLym3dVpCsoa+MYPX9N3R8PS9/ILB6fatx4swnl7cwcH/w3/kxs4qQFHmb+r9+QayK42coEFYMFMzKr0AxHrgR49czkIwfoLf58A83UXs1hWLb/7JHL/jgF4rEAOZF7nkQaqiW8mFatzrONG+FPrRw4TBU=
Received: from DUZPR01CA0287.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::29) by AS8PR02MB9601.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.17; Tue, 22 Apr
 2025 15:18:14 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::26) by DUZPR01CA0287.outlook.office365.com
 (2603:10a6:10:4b7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 15:18:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 15:18:14 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 22 Apr
 2025 17:18:14 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 22 Apr
 2025 17:18:14 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 22 Apr 2025 17:18:14 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1548022C
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 17:18:14 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 53MFIDjO306173
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 17:18:14 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 53MFID96306172
	for openembedded-core@lists.openembedded.org; Tue, 22 Apr 2025 17:18:13 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 1/2] insane.bbclass: Move test for invalid PACKAGECONFIGs to do_recipe_qa
Date: Tue, 22 Apr 2025 17:18:07 +0200
Message-ID: <20250422151808.305986-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|AS8PR02MB9601:EE_
X-MS-Office365-Filtering-Correlation-Id: bedff113-6503-4cb0-17f7-08dd81b0e702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?f0J98HBI71d3j8AAadeQcluvljl44sUrwa1bAL3kWklSWpvgrhjGCAD/0xve?=
 =?us-ascii?Q?xVpE/Y/XbZiZIom8FgBDNztwQUse76t7dXqB4Vn7hojSIW/DHiJ6QRZ0oIPk?=
 =?us-ascii?Q?jENG9zYgllZgWB6LAQDCo7v1Sf7jhHeN9RWCAbbINiH7jKfSMKfeB7fG9+Dn?=
 =?us-ascii?Q?pDZsBM/FFysaWn25j5xBDzdx07qswdgYxgzU/4SvxP7LHEFlLMq0hpuo9NaH?=
 =?us-ascii?Q?/7CEqk+FnzubrPp9JIsNoTMh7mHFT1FYMBSTflKDKFqBjj67TyukOohtfm1O?=
 =?us-ascii?Q?C9gTsSadeV5IdrywTw4dQWhneslbWYOuiteDqUk/m5VLHVmAKXIBjwydszmb?=
 =?us-ascii?Q?PyLgDrM67KY0nYwr6oNv/RWP6qhHHhFraz6QE6Oh8rspo39PLb7oCnZ4Mmi8?=
 =?us-ascii?Q?K3Jp3UjikUZzmMi17wO3VeeDtIFtWZOW38EAFlFAEaITejl1u1Mjf2+UFxEs?=
 =?us-ascii?Q?d1vXD2ghcuNwz4KtKZPKgpd3FqHXdXsrx3tsvDOdT0371GveUJmuSfcAprBR?=
 =?us-ascii?Q?mf++67HoSOfQOw2iiBk8ltwQVtPvqTj9Uu5n0ReTtrz2xQUwQfw4jVOdMljK?=
 =?us-ascii?Q?O9apNCRdxvYQJxDC+IyERxCim75qxX2LqAcGpLG9AGp5G3SZ3pV5Eo6y7eaw?=
 =?us-ascii?Q?voJXVpknHthn5naId5djktMou+j16H5KMbBXcNM2kngAarsbsIKsYk/oreRQ?=
 =?us-ascii?Q?MYfuLKKrm7Awf/XDaBKunSxRUudkNBxGGEyHLmTiGpD/L4MqEDiCteCSJijc?=
 =?us-ascii?Q?QvaCBI2pySatwPFyLE6FUdBMNxIlJr26jtQiZQPxLRTeSMgDH2lXP/O72DBn?=
 =?us-ascii?Q?GGvc9jtIERDsVkj4ZfrWW8iN8VTP+kKeBIqnG87yH7V8IjBlL1JPt1PxjdMx?=
 =?us-ascii?Q?NZZGWqFxdqWfLUmCpBwUT0/7ZGVLeFLnoh6r4Jw3KYAHOZjzkQ/Bkf4HM9Pr?=
 =?us-ascii?Q?ZDhh1g9Y0XcNlwlUdk+0IfsGH5P7RMkzfvSOfKdAFxW+ZJifFuRopcwxBct+?=
 =?us-ascii?Q?VsrH/Oc3U3slhkhyC0X7ILIogKSrF4u5xb0DMeYwqaOxGQ+4xwKxX+qXfuPO?=
 =?us-ascii?Q?KnzMVM57glLdlFaRWdDNUiv0GwfVY97e+J+Rbz6Ej7lIjQWZ1xIIjYHkbnyz?=
 =?us-ascii?Q?pYDKvTmTaCD+YnBV5k2uxDSxHfnUq8myCma7yP68Q/ssKz03JKURazILL7cz?=
 =?us-ascii?Q?AnXftqgxbZIjrgHtgkoHEWIk5aZwkGT7r4Af7TmSCU2WRH1wYvrGAm7kb1dI?=
 =?us-ascii?Q?HNanU0zCaW/xNMTeXLo4PVq7oekLt6u6dCa3n/+MCR2R5Zngji8ITvhPOM0Q?=
 =?us-ascii?Q?TuxFp0JNmQbhkEmXZz3ZmfUwxaYPbd718zMuChcftBoZa7hZdU19pYj7752a?=
 =?us-ascii?Q?iHD9rNLvb5MW+0Yk3/x8g1e5pLubvhikQ8yP2SXQfKZG2FJGRAkSriwZSwYR?=
 =?us-ascii?Q?hhSh60LZsi8kNyXz4B3fQx/ApSO+5kst5WPFvgYk+b1GUjCBePVDLwB/hNTA?=
 =?us-ascii?Q?Zr1mwuaiRsr6KPQYuHUqrX97PJqyW9vyTZ1E?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:18:14.5911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bedff113-6503-4cb0-17f7-08dd81b0e702
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9601
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215230

This makes sure invalid PACKAGECONFIGs are reported also for recipes
that have no do_configure task, e.g., packagegroups.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

If possible, I would like to see this in 5.2rc2. However, it is not
critical, so otherwise I expect to see it in 5.2.1.

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

