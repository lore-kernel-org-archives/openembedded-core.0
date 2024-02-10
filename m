Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFD4C48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 11:15:11 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.89])
 by mx.groups.io with SMTP id smtpd.web10.11959.1707563700254632208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 03:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QEwTwYrB;
 spf=pass (domain: axis.com, ip: 40.107.13.89, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UI2jra2+ZWTWB4TJoUVKMIJ7M5XqECLsvEUYgeUmNMOeHkzv7NEnj8ZEqXTTfvvWv8AVrGoUw285ySY5LkJ0a20GT+qV9Enacb64ib63EvZMltOrJT1iZoa70JGRczcecYuw1vjsFjDF8PTN1323BoSg4Pp3pahqjuRmOYPXu9FEezpwrfaZDgAsQoBXk/ce8Sp85HOsTm8b9jGGZkvYbFcVZEtFpEojdUEAqR/FS1G1UcMARrs9sgTYfWAFoXR5pO474Rp9IUjteAy5g4KIHccSzeCr5LCFXTBMXMKTwzpttl20+Uo8Lw/HYid3k8JeLPElYXRJLMeUxV1LYtcVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03iK4Gj73jQ650H/0ScEJ3OmXkf90T9y8k8FCK5X3Vg=;
 b=QeFOIsy6HE+R1G0lt0JlQK4vTpgYMB45lROQYO6njwjVZsenL2cDxlZtz6OULX75X9jdwFkVDHHOeLJ3ikIx7gRngiS+zrkECcoQv9+IJwWwTpJVz6wxrgSDmyt7C9L9oOm6fJXC4E5/wen0B0AvCZBqdoa68j/ybSSvdT2wZJ2VYPODvgAyVsf2NSZwJBdjyoGUadzyShj++7zYL2xx6BcOYIxYroXoxhjZ8hYsD/QbSgLXn0FnC/QBdh7FuWKavxiRJ4ngVt4UGUcakr0cITRa/mel6SrfNvzrdF+pWUOVs00Y6g1F+c8eV7B0Zo4MrOZiDbp0SBQ9MZkR2FnqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03iK4Gj73jQ650H/0ScEJ3OmXkf90T9y8k8FCK5X3Vg=;
 b=QEwTwYrBlld2B/8JPxdmOnSud/kn1mfDyoXq1hepg9NUJ5pmejdLoZVeACz6OF/Siip8tSBD8XhCgXxlq/n6QSP6LtImYU6IaDjs6A9JY+22BdRkSQj6YKo3ayWxr2ND0Lz54x37xaKEvCEmxpYGBjDGgKDiNUC4KhjccZs4x4k=
Received: from DB9PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:10:1da::28)
 by DB4PR02MB9527.eurprd02.prod.outlook.com (2603:10a6:10:3f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Sat, 10 Feb
 2024 11:14:56 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::ca) by DB9PR05CA0023.outlook.office365.com
 (2603:10a6:10:1da::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.41 via Frontend
 Transport; Sat, 10 Feb 2024 11:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Sat, 10 Feb 2024 11:14:56 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 10 Feb
 2024 12:14:55 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 10 Feb
 2024 12:14:55 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sat, 10 Feb 2024 12:14:55 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7D09A14002
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 12:14:55 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41ABEte32112533
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 12:14:55 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41ABEtLN2112532
	for openembedded-core@lists.openembedded.org; Sat, 10 Feb 2024 12:14:55 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC][PATCH 2/2] compatible-licenses.bbclass: Add class
Date: Sat, 10 Feb 2024 12:14:51 +0100
Message-ID: <20240210111451.2112513-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240210111451.2112513-1-pkj@axis.com>
References: <20240210111451.2112513-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C5:EE_|DB4PR02MB9527:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d31d9a-d852-4914-7c6a-08dc2a29832b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Cf28GU/YLnM45bdqhWoIMI8CpWKWQBbYUNLDzdz+uNvRFyIIopGpeNc6qiFL2ZbQKS9+U5R6O/a6MV8AFOvhkSP5POIpTclEYDMqXOZktgWVhCTT11n0KRue++0/9G81zBfMReQymyb1z/FNUKD0KvxIpHOn+I4Se3tAtUefJnoMkxwsZvnCA89l8ZhhZ7IYCyqXgin09UXfCEfxcczos02L4dwak9Bjy0rFKmlPY89dubiOySPozsrfqDX0TO9wJ71uX0oLFBN5cMLUlv49LRm1clT92Hn6cdhqYsO783ib4dI/5oP9orLeWCSCL/6a2hMYgpU758GisOdlNT+ztK6J5MO9Od5ekVGXwSeLzoQu0KsHGambvcQKDfmPd1SnoeTVJgxOsSzLHId4RnzsKl26LQSx2jkSPdPqZVrYNdQsvWSuLHNxKpl+QOZIkOc2rcr1l8G3yzWMI37PF6B+6eiOw3KQK1OVP+8mKKv4g9j8jZZWD2uygCmj7K0DXfM/HoNqusamqFHuDRf9B9nM5RjZ7REyBVlfzqFXs9Ut8Qji1qTCMNzd/8ddVWGSlYVGsOmCtykRVSGtM/1wNR9c/uCyw5kg5M1q1cAj5pt5+g=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39850400004)(346002)(230922051799003)(1800799012)(451199024)(82310400011)(186009)(64100799003)(46966006)(36840700001)(2906002)(8676002)(8936002)(5660300002)(426003)(336012)(2616005)(26005)(1076003)(82740400003)(36756003)(356005)(81166007)(70586007)(70206006)(42186006)(6916009)(316002)(6666004)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2024 11:14:56.1833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d31d9a-d852-4914-7c6a-08dc2a29832b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9527
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 11:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195259

Contrary to INCOMPATIBLE_LICENSE, which is used to define a few unwanted
licenses, this class takes the opposite stance and expects
COMPATIBLE_LICENSES, which contains a list of all allowed licenses. Any
license that is not in COMPATIBLE_LICENSES, will be added to
INCOMPATIBLE_LICENSE.

The typical use case for this class is if you, e.g., have a company
policy that declares what licenses are allowed to be used. By using this
class and defining COMPATIBLE_LICENSES to contain the list of those
licenses, any new code that is added with a license that has not (yet)
been approved will fail until the license is approved and added to
COMPATIBLE_LICENSES.

The class is intended to be inherited by image recipes, e.g., by adding
it to IMAGE_CLASSES.

Since it is still INCOMPATIBLE_LICENSE that is used in the end, you can
override individual packages using INCOMPATIBLE_LICENSE_EXCEPTIONS as
usual.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

Someone asked for a way to only have to define the compatible licenses a
way back (actually, quite a way back) and this is the class that we have
been using to solve this.

Compared to an old solution that used AVAILABLE_LICENSES, which was
removed in commit bf08d9ccb9cbc749a571af3d33140bcae0e252a6, this
solution should have none of the drawbacks. Since this class is only
expected to be inherited from image recipes, there is only a neglible
performance impact, and LICENSE_PATH, which is used by
oe.license.available_licenses(), should be well defined at that time.

I will send additional patches for the documentation if (as I hope) the
class is accepted.

 .../compatible-licenses.bbclass               | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/classes-recipe/compatible-licenses.bbclass

diff --git a/meta/classes-recipe/compatible-licenses.bbclass b/meta/classes=
-recipe/compatible-licenses.bbclass
new file mode 100644
index 0000000000..46f72f831f
--- /dev/null
+++ b/meta/classes-recipe/compatible-licenses.bbclass
@@ -0,0 +1,29 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Contrary to INCOMPATIBLE_LICENSE, which is used to define a few unwanted
+# licenses, this class takes the opposite stance and expects
+# COMPATIBLE_LICENSES, which contains a list of all allowed licenses. Any
+# license that is not in COMPATIBLE_LICENSES, will be added to
+# INCOMPATIBLE_LICENSE.
+#
+# The typical use case for this class is if you, e.g., have a company poli=
cy
+# that declares what licenses are allowed to be used. By using this class =
and
+# defining COMPATIBLE_LICENSES to contain the list of those licenses, any =
new
+# code that is added with a license that has not (yet) been approved will =
fail
+# until the license is approved and added to COMPATIBLE_LICENSES.
+#
+# The class is intended to be inherited by image recipes, e.g., by adding =
it to
+# IMAGE_CLASSES.
+#
+# Since it is still INCOMPATIBLE_LICENSE that is used in the end, you can
+# override individual packages using INCOMPATIBLE_LICENSE_EXCEPTIONS as us=
ual.
+
+COMPATIBLE_LICENSES ??=3D ""
+COMPATIBLE_LICENSES[doc] =3D "Specifies a space-separated list of all lice=
nses that are allowed in the build."
+
+# Mark all licenses that are not in COMPATIBLE_LICENSES as incompatible.
+INCOMPATIBLE_LICENSE +=3D "${@' '.join(sorted(oe.license.available_license=
s(d) - set(d.getVar('COMPATIBLE_LICENSES').split())))}"

