Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB40CD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 17:53:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61035.1780941196451203723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 10:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=gJLMOxX9;
 spf=pass (domain: axis.com, ip: 40.107.159.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyErK1FVXuvdUGAPn5SxMzlq0a2+Uwn3LYhDV++ElXPlTuieXaTirEB6HQLq3wH3UN9WaJtV9GM4gzfXJmB897TeFS5R3OJ6OuFhhI0OOkENJdlsrnFaoCbENXlZtQRlUizlHCB22zS9dAoQLTyeCheIcnSc1JD1XTqtdThvVwKaW5xJ/sRr2U6zTbw0MbCXAlOTc1ouyDRsjJkPLUW/S45G2ekzDVySTBR4eYfOxAoNZPUWjqVEBU+AvsPEdhJPZXKDnhLHx/9wgsJQ0kjdWm9aGBM6kJewG2TWkjkVTaXCUwVWIBS5K1XZ7IYcaiiRTf5vqDpTpUHbBnolnyEafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUuHtvlzjzQyKeNAgb3mHbd53v5x9QTBhs45D+XS+0A=;
 b=WCClJt4V5dY8JaMT5acomWV+X39OchCYNMG04VVIgbAph2ivFWCe1Hvej63DMk3DTYaumxSlKWoaqMta108dzYH9Q4DvecqXzbUAANjsmRB9u2QZCb8VMWe9onvkgxsentyKE7tZr0TbIiQS5nJsGfLiQedBW1dcjyH+8/9X5GwTjwf9hVFHLso9br8KjHsTX5OB+HbeI0YLtZgFZ/xX0L3tZ9ZbjcutCICJPtTcae/3WR8rEOAcFaQGH9S15tz3TTW7stoNCYI+T3Am0w9Xu0h//MPOdYK22/vfHZnNRmpHw3fu7MsiM5MEggMKcM4joqhAMcMzTRXL830XctQxTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUuHtvlzjzQyKeNAgb3mHbd53v5x9QTBhs45D+XS+0A=;
 b=gJLMOxX9fO5lHgJf8TpPhAvS/5ErkWQuzG7UiM0fpedkLBGDHitSW9cHHnRkQHsv5zSdkf3/BZUF87V057vN/hrgwmwCDu/W5bMEv74qDFouZ41Ac6z/VdD+UzpdB+flHP9NipekHJOj//DqmvEZUBkV0+ACyENw0JSGrCvmk7I=
Received: from DUZPR01CA0193.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::14) by GV1PR02MB11508.eurprd02.prod.outlook.com
 (2603:10a6:150:283::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 17:53:11 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::6b) by DUZPR01CA0193.outlook.office365.com
 (2603:10a6:10:4b6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 17:53:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 17:53:10 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 8 Jun
 2026 19:53:10 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 8 Jun 2026 19:53:10 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 36EEB3AD6
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Jun 2026 19:53:10 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2F59C12C4F2; Mon,  8 Jun 2026 19:53:10 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] oeqa/selftest/archiver: Do not run bitbake -c clean unnecessarily
Date: Mon, 8 Jun 2026 19:52:58 +0200
Message-ID: <20260608175259.3238900-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608175259.3238900-1-pkj@axis.com>
References: <20260608175259.3238900-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|GV1PR02MB11508:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f57102e-88f8-4814-fd64-08dec586ce1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|11063799006|3023799007|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	wDPv33ByI3vW4kRGmggjvKhBEVaxQ+VvCmakRiJ6SUHpfxBkQ0zTCYZUMlbZZRydhDK1+zTP2NOG0gi1RG9LDEthuUVymZzfjpx7GHf1zjMzrfBOk3WZ9mMssPfAfFi0Q0l7fbySc3TEmjf/OWkkUN/k7LsTYwIyIItTOL77zkXFZ93EZ4zKEk3Yaue6imhYEAmv1CdwcjRIr5wLA1Iz8mPfVSs0b4AMvi7MlDa6+BmZ6WVAV3zWuqBrSPzWW2ap8XFSCjGRCYaCHnsnI8727fI0fOoYX/FWJqH2lEtXqhNFM4BiFESxAnpp6ifbOZAdS0f+sFBnhdQ3bllHoW88fKyfHMuC4xWTUB57uCzx0wxk7hHMOH+2n0Jkm2d+dnqfyzl9njXZIGK9XpH+94LKPciS3+nBbfKi3t/MfwppZrPBRqV12ssmF5zHH0HHMz5Cvw2lFGkUvlKj9rcUoqp4Iea3MTYtJuOyPt9PthHl9HgZFxKRfl5ajCY+46RfO9NXEC8JIGhWI1gtp1Ym6QHpSS7w8GiXQlJo58dGHzedJlCIMA8V6WTRzK+y6maulYFEMcW7zKPky0Jz37Xur8s/ifsofw/gpjtXrzJqlddb1dxMMeC7Mu6KwhxaHCNTOZw149i7PcbbbZ1kQKSZp7jBtO9o3negkNguX86B1wah+RtRbNEd6PlkadeWq1PFKw4bTvhA5CJ0ORM67HdAFa+YBiwfd7bZb+ElqK05M1nnGj4=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YAAMSzhOBtMLBiT3LDKRTKKRS/rkc9/Esy9h7NaDY/E/EskNzsL40UeVgriJ8dPoVJwK/yF7bh7Ym7usvLFmh+U+a878NM2onSciE2CS0XA3tNNyEIUoHFqPFEYQZOQl8jfEd0wl51jGQpZSwgbySymXD85PlaqFoqT7Y2pxy9nSHTaqrgRDHV0kBSJPCeKF6v5bwsgGO62dx8zs85JElvvM43K8ZRyjFPS92oVc5uO2YmRl/62xV2pZKlcXmh9pW8U6uqhGO/eqzwOSL9Rh8N9c//IJew7JcCXVYlf/D3DWjuSW22SB1bnl+b+FFFps1QDS/p64INUZzB6U2VJ30PNqeNAFg8zZJcvXY/xmfmiNV4p8IiRr6fqQ9MU7/XdBC5cy4SwyiyEdvnveN97HsXD4xnw+wETm9Nl4TSogdXcunbJ8IW5btejEpKRa91OH
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:53:10.7058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f57102e-88f8-4814-fd64-08dec586ce1d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB11508
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 17:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238254

Now that the archiver bbclass properly adapts its output based on its
configuration, it should no longer be needed to run `bitbake -c clean`
before invoking the archiver. There is one exception, which is due to
modifying DL_DIR as it does not automatically trigger a re-fetch.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selft=
est/cases/archiver.py
index 872504808a..122d16b655 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -31,7 +31,6 @@ class Archiver(OESelftestTestCase):
         features +=3D 'COPYLEFT_PN_EXCLUDE =3D "%s"\n' % exclude_recipe
         self.write_config(features)
=20
-        bitbake('-c clean %s %s' % (include_recipe, exclude_recipe))
         bitbake("-c deploy_archives %s %s" % (include_recipe, exclude_reci=
pe))
=20
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
@@ -62,7 +61,6 @@ class Archiver(OESelftestTestCase):
         features +=3D 'COPYLEFT_RECIPE_TYPES =3D "target"\n'
         self.write_config(features)
=20
-        bitbake('-c clean %s %s' % (target_recipe, native_recipe))
         bitbake("%s -c deploy_archives %s" % (target_recipe, native_recipe=
))
=20
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS', 'BUILD_SY=
S'])
@@ -99,7 +97,6 @@ class Archiver(OESelftestTestCase):
         features +=3D 'COPYLEFT_PN_EXCLUDE =3D "%s"\n' % target_recipes[1]
         self.write_config(features)
=20
-        bitbake('-c clean %s %s' % (' '.join(target_recipes), ' '.join(nat=
ive_recipes)))
         bitbake('-c deploy_archives %s %s' % (' '.join(target_recipes), ' =
'.join(native_recipes)))
=20
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS', 'BUILD_SY=
S'])
@@ -174,7 +171,6 @@ class Archiver(OESelftestTestCase):
             features +=3D extra_config
         self.write_config(features)
=20
-        bitbake('-c clean %s' % (target))
         bitbake('-c deploy_archives %s' % (target))
=20
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC', 'BUILD_SYS'])
@@ -255,7 +251,6 @@ class Archiver(OESelftestTestCase):
         features +=3D 'ARCHIVER_MIRROR_EXCLUDE =3D "${GNU_MIRROR}"\n'
         self.write_config(features)
=20
-        bitbake('-c clean %s' % (target))
         bitbake('-c deploy_archives %s' % (target))
=20
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
@@ -281,7 +276,6 @@ class Archiver(OESelftestTestCase):
         self.write_config(features)
=20
         for target in ['selftest-ed', 'selftest-hardlink']:
-            bitbake('-c clean %s' % (target))
             bitbake('-c deploy_archives %s' % (target))
=20
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC'])
@@ -302,7 +296,6 @@ class Archiver(OESelftestTestCase):
         features +=3D 'COPYLEFT_LICENSE_INCLUDE =3D "*"\n'
         self.write_config(features)
=20
-        bitbake('-c clean git-submodule-test')
         bitbake('-c deploy_archives -f git-submodule-test')
=20
         bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC'])
@@ -330,6 +323,8 @@ class Archiver(OESelftestTestCase):
         features +=3D 'DL_DIR =3D "${TOPDIR}/downloads-shallow"\n'
         self.write_config(features)
=20
+        # Clean the build directory so that fetch is rerun.
+        # This is needed due to modifying DL_DIR.
         bitbake('-c clean git-submodule-test')
         bitbake('-c deploy_archives -f git-submodule-test')
=20

