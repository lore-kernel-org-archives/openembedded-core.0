Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBABC36010
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 01:33:19 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.8])
 by mx.groups.io with SMTP id smtpd.web11.2953.1743816789806072743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 18:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=hDU5kOMR;
 spf=pass (domain: axis.com, ip: 40.107.159.8, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHfVUhnI1cALkbF6YafEYHhMrjdxmjZ7fB4EulVU1MplLnebbvVAI6AkwMmMIEprvpQEwqlFfRSm5f8MUc7SjyumSegmqNm/0tCk+SdfCoybjpIc/gr7SDOAc96O0YqgqXbEky2DYnsPlQARfvDpc5BafzqYl+tjD8FpVeZbcNCacoLQXAEiODuTpitbraApnctXMsT4+DnSvL9SGQw7+0E/kgBnBMDzS+HZDAn9MRBmpQ3CQpMfCQZA6sCKVo28aFhf/2Nbl2jc5Z3ZhwvsBuOworEyh7GEj3N4qF54LLu16M81rA3YFO0/xi8xKNK0XAQtnmt5cy1Ow13viUU3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RylBjEREkHfKIR59pmSQj2xL7sKFS5wacjiUodOdUA=;
 b=Q/TjsywL5w2OIITf9BckMBGpDJaVhnwfoAZTpbNTgui9xo8WvUgs29NKoODh/XxeSJvhqNIBN7X/n8Kro15CjNctVoLFY/vqjhT+oYQU2WrPncq0dzamuAiSA4PJzL/FmDS0ZDDJ80qf0pZ9+mWiwy1t5DHLeVT39HSEwFe4V0/cO+OI6AsJ3Lo9fqLrVfE88Oh2mNDMLCu8NXqVG+60b3aMVSOR3NI2rHEJNxakdYLNlP8qvG38//SngHhf/1XPfhXeXSobkZc65B9/l1+mjtPw7DEL9xRDYp6lUUcIG5XA28UXpTtM6yiwTNL6GAcXDryPPEaiBOH6hhi8/dB/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RylBjEREkHfKIR59pmSQj2xL7sKFS5wacjiUodOdUA=;
 b=hDU5kOMRcNEhAgIr6CDWLW/u/1yfKlP+KKPUEC1dnu6Wg++u3lUHhetlgZPXjtbSuxZEbo639tqmt+rDKSTAZJtzlujoqKTnIAcAMwEq5tgU/qyqJBo/wQyC564OI6tpi8HMIxeO59a1bPm5mnD/59D3VI2ewO2mQ5hJ36w4hMA=
Received: from AS4P190CA0025.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::12)
 by GV2PR02MB8800.eurprd02.prod.outlook.com (2603:10a6:150:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Sat, 5 Apr
 2025 01:33:03 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::b7) by AS4P190CA0025.outlook.office365.com
 (2603:10a6:20b:5d0::12) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.8632.13 via Frontend Transport; Sat, 5 Apr 2025 01:33:01 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sat, 5 Apr
 2025 03:33:01 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sat, 5 Apr 2025 03:33:01 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 7E7E72F4
	for <openembedded-core@lists.openembedded.org>; Sat,  5 Apr 2025 03:33:01 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 5351X1QW1545117
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 5 Apr 2025 03:33:01 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 5351X1Qp1545116
	for openembedded-core@lists.openembedded.org; Sat, 5 Apr 2025 03:33:01 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] insane.bbclass: Report all invalid PACKAGECONFIGs for a recipe at once
Date: Sat, 5 Apr 2025 03:32:58 +0200
Message-ID: <20250405013258.1545080-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250405013258.1545080-1-pkj@axis.com>
References: <20250405013258.1545080-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|GV2PR02MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3952e4-a27e-44ce-296f-08dd73e1ce17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ugvuhpQdpPzN5aW2bMDJ86oP6digFumG7Pte+oPoRuqteHpPNtSWsQ8DygOK?=
 =?us-ascii?Q?tgRBSk0j6IY1zHp5ISVAs+OqJ3DkS8sh0CEjzcbJQg8YxO4iMwXsFjS0kXH3?=
 =?us-ascii?Q?QLJstoh7YFKB1Y+OOZxiO0MeqvcwS9lKxTiB28pot34U1s9AN+np1gzQ72Vi?=
 =?us-ascii?Q?Klbo/OjwUcvnEOCq8EJxZdDbtj7nHtDspRTyGtJt0Mql65HHRq6vaETgsvjT?=
 =?us-ascii?Q?z7yFJrbmAz9R/H5mTg8QBSYnCVFKSkPoq5p6KMuBvvtX82PwibhAfVdpRarZ?=
 =?us-ascii?Q?5/o+Z0ELeu2WxjnJ9Xe/lKkuKdPhlwyaEu2g5ASDPJqNvl/fkKbgHPJaQuhY?=
 =?us-ascii?Q?O7R8L2PeBU3e0iHloSNezCZRufNGEYsZAVBA9nv7jqt/bD4oJYDtKDzKQ1BH?=
 =?us-ascii?Q?fSNa+QM1DmV/KKfGAbhN9+2hSKH809ZydSTn3+Inl3wZW5nKe1vYbGw1wizG?=
 =?us-ascii?Q?B9ANloP46jMoCU22HhJH77GRianGtqvcVh36Yu+DayEMHBevO/XIhbHyhafo?=
 =?us-ascii?Q?7r3dUWY+zkIq65EfF6CE1hWMtUW32NPT2KiigXArhVerO2coWCFlr0JbHFsh?=
 =?us-ascii?Q?HqeYGAuuWdMGoT4+LoVOQvmyvrjfIKLAv17+irbVbxnXVIjZ5YFRUh2Trfjp?=
 =?us-ascii?Q?lTcRKRMmjOjnu0vomvl+ScaaX+wXDb44sVSNZUupWjJLF+/olP8i+PokZTfa?=
 =?us-ascii?Q?Y+HFEpuL/7RkQyINe00eqgpZI3hPPIlbMnqDQpW7kPWy+RZSiQgb/d1ZwjQ/?=
 =?us-ascii?Q?uOgNPK8isfxWddX8bN2KVcJvBH7+Emn4xupB74QPMhJ98XB1TLKhZ5E0ZLlk?=
 =?us-ascii?Q?mYvEUn2KkDaysQzW81hAMhOAQ2d/An5Av3j9Vc9gMKmzjQxGn4srMUzM/Bm1?=
 =?us-ascii?Q?Vh0ZZGXKdmj+NiXvJxAJ7EZGnyCWGz8QpvgeJJ3NXh87mFJ3iig11TQTJjXD?=
 =?us-ascii?Q?zTwR2JL86XxqLlL1VisvpsxXEFVJTZm2hdj/oO0sJLnnIQMUumt3pcSXAGaT?=
 =?us-ascii?Q?RKqMymD7wTShtIS8SQolVjwOIq1kkCZ1tRXHi884Y4tVA7UX/PUFLBZII0wQ?=
 =?us-ascii?Q?VTcc7D1iM6T6gzVKZgfQgY8xXt6GNNZqbqZaNi01ok9D5kSOETrLNxDK4PkG?=
 =?us-ascii?Q?mNY7VT2OueBXasUYlBEIBSSrJrbpRhFMhtsMmKYRpeAin2EcryK8sadWh95F?=
 =?us-ascii?Q?c7dqa22g6watnP/LTKR0V5Rqy4fZGNHfAl/ln/k3P27MmeytuWuFfyBxC1YW?=
 =?us-ascii?Q?kzYnnXlNfnxqU0ptg9Lz9dmsA8vgvu+YVbhveb7y2/wJJOJ9M25qQs6Muu9l?=
 =?us-ascii?Q?420yyNxQtLqOVM3Ua7a1BFaBm0+KGgllc2nlN4fMl37poD1I005uIQCeskwq?=
 =?us-ascii?Q?/Hd8i6R+eoRb2Cq3ERhI6CLcLOrW5u7FH5fHzAuuqa9+RP/Nq5X+HKZUAsqC?=
 =?us-ascii?Q?vz813PvheYsolZhGCevioDjFtEzX1/kZmSo0Si9TdcfkT5mDjrm853A5TeY5?=
 =?us-ascii?Q?zSMGsYrN+h6D1v0=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 01:33:01.8626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3952e4-a27e-44ce-296f-08dd73e1ce17
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8800
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Apr 2025 01:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214370

Rather than reporting each invalid PACKAGECONFIG with a separate error
message, report them all with one error message.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/insane.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 748de050e0..cd26bf5eb9 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1469,10 +1469,10 @@ python do_recipe_qa() {
         pkgconfigs =3D (d.getVar("PACKAGECONFIG") or "").split()
         if pkgconfigs:
             pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
-            for pkgconfig in pkgconfigs:
-                if pkgconfig not in pkgconfigflags:
-                    error_msg =3D "%s: invalid PACKAGECONFIG: %s" % (pn, p=
kgconfig)
-                    oe.qa.handle_error("invalid-packageconfig", error_msg,=
 d)
+            invalid_pkgconfigs =3D set(pkgconfigs) - set(pkgconfigflags)
+            if invalid_pkgconfigs:
+                error_msg =3D "%s: invalid PACKAGECONFIG(s): %s" % (pn, " =
".join(sorted(invalid_pkgconfigs)))
+                oe.qa.handle_error("invalid-packageconfig", error_msg, d)
=20
     pn =3D d.getVar('PN')
     test_missing_metadata(pn, d)

