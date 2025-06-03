Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC6AC5B549
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 03:14:44 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.11])
 by mx.groups.io with SMTP id smtpd.web10.2815.1748920479000664347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 20:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kUBPVtD2;
 spf=pass (domain: axis.com, ip: 52.101.84.11, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLuqSQilg9LeeUP6V5UR2jbZffjUqGT6Grheq4YRb6t+JmahqCcilD9qlht8mAAqr9P5eiR2IE4gvbm/EbJ6EM9/3WU/aHmbnJYB6B5SaPtX0JfPUQWlrTILgVMnDfGXNJzxfJ+WeoTwRrIK7fHWXsLtlK41mLt9ABhgLvX//EIPw1kbNlGWfNKjpdKsPm+j5Sd9OIPTv9af6qkwXmcJR3TrN0mq7+PzZ9P5S9KTamsAt5zt5NYw5/PvEjny/U9MWJef4JC2Obv8ZQKQSoFNnStY/yUpjI9f/MlAUzp/O9Kn3bCqI/kvHQSAgzLXbMesieHBDYNX9VGMUA38XI9JeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/7iJznE0Zg3G3S3wz5gQ8TQnzJ/CQvn//77OzjAB4g=;
 b=vqPo8WA82iQgyvr7ohvh9VN+eagZbjtMZb55aCwZI9eF/EjI6lOJ+KE27VFhQArjJumaC/B9N5Ene+W+xVnY/EGyyfhH+whwqySASbQQU6+N7OIj2LoTZg9o/3He1eGTJmLl+XaxglMEQW+vyYBv780xOc2Qp2UGbXQCLuSL62Iz7sYn3BSN/IEqPKC/pHnKjXib3gziH2hUhVHD/MeX7sUjhkIMp1313s3xXjzh10SHhHcvRCYjTTOPjIMCPK9qDGznpnPRrfrBkf2hSUTfKS84YnPF+8aKFu+Q77wPdhte2o3M/4+yEsAX8rhTmAn96XfdJyOFDh7I/9Xbmj8Jug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/7iJznE0Zg3G3S3wz5gQ8TQnzJ/CQvn//77OzjAB4g=;
 b=kUBPVtD23aL+XlLjmJj/LGJrA+IctU60ed8uxfMBGah9ZcO0mItnFxCHdLLz4Bthwz/j09td4pnjVJ2PSo01h5NNhtVp7bGlAFQ1Qg1/67TngSRcBDlLPxxfN4BETXKIorwb2lnokTX93qS5MWOLNiLr9K9/Wc0k2FBMTW/paf4=
Received: from PAZP264CA0085.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fa::8)
 by PA1PR02MB11260.eurprd02.prod.outlook.com (2603:10a6:102:4f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.17; Tue, 3 Jun
 2025 03:14:35 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:1fa:cafe::9b) by PAZP264CA0085.outlook.office365.com
 (2603:10a6:102:1fa::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend
 Transport; Tue, 3 Jun 2025 03:14:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Tue, 3 Jun 2025 03:14:33 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 3 Jun
 2025 05:14:33 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 3 Jun
 2025 05:14:33 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 3 Jun 2025 05:14:33 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 64B92B07
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Jun 2025 05:14:33 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 5CF3D129245; Tue,  3 Jun 2025 05:14:33 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] util-linux: Improve the package licenses
Date: Tue, 3 Jun 2025 05:14:25 +0200
Message-ID: <20250603031425.2206714-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|PA1PR02MB11260:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eebb85e-d638-45cc-3c61-08dda24cc3a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HwKXROVtad35fyNoM9X/BmolHRpO7D//yVvk89lV5PgegTV1NoUofn+Pp40c?=
 =?us-ascii?Q?csqO+Fcut3jXiwwak6c60yA6j95bsAuPo5bV9Hd9UBbOruvN2ZDHeIIJIjvt?=
 =?us-ascii?Q?JUm36uSJlDUr9kGOa6CjF2P2B3K5sB3m+eQm995MLr5EW85iR/IQx17OSlYt?=
 =?us-ascii?Q?fXI4av++kccrJ//x8X9FCvb9XQglC453QgeSy4Qi4De3l/B7L6p4E0tFW8Th?=
 =?us-ascii?Q?HXDKzOUBcNqaQpPVE3FV+jQSJlz6iiz10vkN9CvAoIXJRyyLQiZIfF+WLwWr?=
 =?us-ascii?Q?hnqWwYiDERKRTXOzn2srKpHstweXKbjf+GZRulvgSk3LbsmKdqVq2fNs5yGX?=
 =?us-ascii?Q?LeaIN0Z0XZhejjitI3T+Rw3vM9BR4A4IyCfFKAmw1Bs7C8QV1gl/R2DUbN2J?=
 =?us-ascii?Q?NiB4HnRQlZPd4Og2cs4vaxBJ1eVSGaTkYbJXsuLrzPS9g/VggNovfkI/L+ZM?=
 =?us-ascii?Q?B+auSZRwhEhdVy97SPj1UveEY72V5YxroCPfQZ3DNOqZUG+KkEwnhi/RTMs8?=
 =?us-ascii?Q?0M+N/RrzmqbUnU48RJaYnKDEDq0iKmlDL4MsygfOf6cfSjjuGHRWhWuT+UKi?=
 =?us-ascii?Q?/IS+4hajRnmcnnJdgybkdO1OZL9c4EgfmY61zp1u9EYcfnxYAm+vlPsZxegp?=
 =?us-ascii?Q?T1um4npgNZcnjTgMLUBS+2b6xWmG/As86fFVSQh4aPxSrHKW2aFCz7HyvlYf?=
 =?us-ascii?Q?6fZHhMbJz/MbqL5jSNabiMJoVYtLhOlvlA9hPNIt9a8QAQNTDBn4VjtATgrD?=
 =?us-ascii?Q?/MGq3h3b8o379imNVpmp/HvkVtTM5tC+Oj695YvvKlQ2q0XDmoXuAO5xPpfT?=
 =?us-ascii?Q?6KaMVcgubbLbT11F8xyJHGO5dArzgMxp9PuU6mFw/sJrxLbmOt4z+IOlfxDA?=
 =?us-ascii?Q?jtRUdDSCKH4NxetCTh0DYefJb7AE+aOXSMXOJVJ4jhH2Gw5uWtMSWticl8Rb?=
 =?us-ascii?Q?+nVuxshyBCg9rINmL/7K8BDvpsFSZW/FjtdUmQ5O93et2h1naISOAHClI2Io?=
 =?us-ascii?Q?kFqWYpgnQ00NTHugkWP2EoXPt77BlspsWKa+OySfie3ssaHPYTjPEArxTlBC?=
 =?us-ascii?Q?KLs0QhE+uCY/tO/dzvaLGFrJ5zwRa7LmhD1teowpANz1rNmiP73Mq7kUT+JL?=
 =?us-ascii?Q?NPSSVs585DOxQpzz0ft7uxt8xFJ4GISfAqNotTMFI9wjPHd5yHsQ0aDJq+jx?=
 =?us-ascii?Q?dlOboYfy/FXgRjzh+IxSXvSlkgqveSddzY4bmzulapAV90IF16ErLl0f4ML2?=
 =?us-ascii?Q?EIQDH8kL4Kkdkp6km/K++RuY9gHx/hY1X85tGhr8HhoZUmU0fnNqhrq6qOFL?=
 =?us-ascii?Q?7NAVGlKkFfYODgF+86RhftthcCMyl0Jflgfl4xw8ZMD9zzu8AImsi8LcYwvm?=
 =?us-ascii?Q?Pu5VOOAEH9sfdjHHMUub9hc4r1Wgig+1o/fRYyVYJ9/r67oiFlPmugqgXA6c?=
 =?us-ascii?Q?5czPUA6icUjlVlCQvjW4K8DUTvliPKSfLq3OLw0iGufzVx9kILApl8JF/xJP?=
 =?us-ascii?Q?8pXNfmB07WZy6bD6Kaf7KWsNtGpb7ipcb0aa?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 03:14:33.9313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eebb85e-d638-45cc-3c61-08dda24cc3a0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11260
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 03:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217749

The default license for util-linux is GPL-2.0-or-later.

Most of the applications and the libraries are also linked with
libcommon.la, which uses these licenses:
LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & MIT

Set the above licenses for all dynamic packages, unless explicitly
specified.

In particular, this avoids setting BSD-4-Clause-UC and EUPL-1.2 on
packages where they do not belong.

License-Update: See above
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/util-linux/util-linux.inc   | 41 ++++++++++++++++---
 .../util-linux/util-linux_2.41.bb             |  3 ++
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index b0f2a9d497..bd7ad10035 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,14 +6,43 @@ disk partitioning, kernel message management, filesystem =
creation, and system lo
=20
 SECTION =3D "base"
=20
+# Most of the applications and the libraries are linked with libcommon.la,
+# which uses these licenses
+LIBCOMMON_LICENSES =3D "LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & =
MIT"
+
+# The default license is GPL-2.0-or-later
+DEFAULT_LICENSES =3D "GPL-2.0-or-later & ${LIBCOMMON_LICENSES}"
+
 LICENSE =3D "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1=
-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT & EUPL-1.2"
+# All dynamic packages use ${DEFAULT_LICENSES} with the following exceptio=
ns
+LICENSE:${PN}-cal =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-col =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-colcrt =3D "BSD-4-Clause-UC"
+LICENSE:${PN}-colrm =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-column =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-coresched =3D "EUPL-1.2 & ${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-fcntl-lock =3D "MIT"
-LICENSE:${PN}-fdisk =3D "GPL-1.0-or-later"
-LICENSE:${PN}-libblkid =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-libfdisk =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-libmount =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-libsmartcols =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-coresched =3D "EUPL-1.2"
+LICENSE:${PN}-fdisk =3D "GPL-1.0-or-later & ${DEFAULT_LICENSES}"
+LICENSE:${PN}-fsfreeze =3D "GPL-1.0-or-later"
+LICENSE:${PN}-hexdump =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-kill =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-libblkid =3D "${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-libfdisk =3D "${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-libmount =3D "${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-libsmartcols =3D "${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-logger =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-look =3D "BSD-4-Clause-UC"
+LICENSE:${PN}-lscpu =3D "GPL-2.0-only & ${DEFAULT_LICENSES}"
+LICENSE:${PN}-mesg =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-nsenter =3D "GPL-2.0-only & ${DEFAULT_LICENSES}"
+LICENSE:${PN}-renice =3D "BSD-4-Clause-UC"
+LICENSE:${PN}-rev =3D "BSD-4-Clause-UC"
+LICENSE:${PN}-script =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-ul =3D "BSD-4-Clause-UC"
+LICENSE:${PN}-vipw =3D "BSD-4-Clause-UC & ${DEFAULT_LICENSES}"
+LICENSE:${PN}-wall =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-whereis =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-write =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
=20
 LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D55e895a80bdd4ffc65e167=
a76d2e7569 \
                     file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.bb b/meta/recipes=
-core/util-linux/util-linux_2.41.bb
index 00036e8a68..6cc7708e06 100644
--- a/meta/recipes-core/util-linux/util-linux_2.41.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.bb
@@ -11,6 +11,9 @@ python util_linux_binpackages () {
         pn =3D d.getVar('PN')
         d.appendVar('RRECOMMENDS:%s' % pn, ' %s' % pkg)
=20
+        if not d.getVar('LICENSE:' + pkg):
+            d.setVar('LICENSE:' + pkg, '${DEFAULT_LICENSES}')
+
         if d.getVar('ALTERNATIVE:' + pkg):
             return
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):

