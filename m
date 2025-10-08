Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFAECCD187
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:52:39 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.5])
 by mx.groups.io with SMTP id smtpd.web11.855.1759953158376030219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=dK70MW6A;
 spf=pass (domain: axis.com, ip: 52.101.84.5, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBmFp4xpAuChIk842EDZ+tTr74A+CPkFzwqR6sSKXQLuk8aoB1//lb4CxO//QBw3KBVmq3Ls4VZAk+AmnuVFbxNhcF1wy3/UT6qq2cUV5z6+tJEcs1rwkGPBQ7LzOPLTeOImU2+j3hyehFDLQqDkYCJZUTmwmk6WkmXnpI2LsMv1pMishtJPon6BdzAhwygznpnPZl3nnRR7jWorLbwZi8lds/0m8IvA2tmnxqpUIZY6WMXM6AV0bLeLgXY12FyyshUiUdLklQHio25k3otLsbKnnU3Wdq90xeLt6Os8mUZc4gMSnphQo2tBrM4vvKe/QRT1nbmqCQO7bp5Tjn3ECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIx+91x3kve3103G5Ymq+JlGpuJplTO6zHKcuG1rw84=;
 b=RApKhjN8JH39floViBG7v9N+g4qteNExBfGfoFE780lX0cAcNBe9JP8xjDqJH7V9pUOmR8uoOa/FJIzXcPHLcaxPWlc7Eeoe97+uYBJq3NMye13lp+i8VzxN5rc0yGd+WqlhQLzXm//zOMjRznEMQZM+YtUilun33lyP1rGAkhcgQg4NjChxo1ji5HhEc2QjuloWuvgsNrN/OHy/mPfKCKi0dOlaQ/cGVpoGxRKzsfkQAPwSNP09fR2DOeWOClhQxmQgR3RVJTTvRKrquDCXVrRziy11CoD/d0TaJ3S26IqNf2ZRc7+6NGsiaMcbdBGwUUpMo+9c/I4oyYWBogz4aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIx+91x3kve3103G5Ymq+JlGpuJplTO6zHKcuG1rw84=;
 b=dK70MW6AFiKhFc7RLTPMYpdE80XiQNe98gMDZA49nsss5yoR6g1U40KUhPM7OaDu+dviun2duwJ0kIFejK40DKQUZLISv3AoEvw0d1qyDBTW9hP0zx4wvt+23YM/rQmfZGcwhLhhXqD/EQz2cqwd7wVVIxdcZFNmJ+NBn+gKMUs=
Received: from AM4PR07CA0032.eurprd07.prod.outlook.com (2603:10a6:205:1::45)
 by VI0PR02MB10969.eurprd02.prod.outlook.com (2603:10a6:800:266::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Wed, 8 Oct
 2025 19:52:33 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:205:1:cafe::38) by AM4PR07CA0032.outlook.office365.com
 (2603:10a6:205:1::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Wed, 8
 Oct 2025 19:52:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9203.9 via Frontend Transport; Wed, 8 Oct 2025 19:52:32 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 8 Oct
 2025 21:52:32 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 8 Oct 2025 21:52:32 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 259C61AC9
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Oct 2025 21:52:32 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 213BE120210; Wed,  8 Oct 2025 21:52:31 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/4] core-image.bbclass: Tweak the descriptions of the image features
Date: Wed, 8 Oct 2025 21:52:17 +0200
Message-ID: <20251008195219.117570-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008195219.117570-1-pkj@axis.com>
References: <20251008195219.117570-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DB:EE_|VI0PR02MB10969:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c3db39-d5d2-419e-ddd7-08de06a4388f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JaV3XcxLU7rOGdf98yj8MRFHdDDOlxTlwCZ8nAuixIPibmVjKvSN0+7j9o3s?=
 =?us-ascii?Q?SufYMWSexzDBHruP7YU0L73dHRe6n3CGg92tMxR7Qmv49jjADzwERIK0fZRX?=
 =?us-ascii?Q?hINu3aq1DtGyRceQ6cknU8ezPinc26BETPnagQNQ2Mg+CPh/OtaIUwJ3bCvE?=
 =?us-ascii?Q?EeSc7/avEPmSJzR8DbQvLDDrr/q9wMhKGAGr9+i5F0XOQ5GH15AklziLcsNS?=
 =?us-ascii?Q?mqGvEQBLdm9PQ76Q/kDh9dDhR+pu+JyrXT/kzxGIGKmWBRPnwFWSTPTZX6rc?=
 =?us-ascii?Q?4gB0l3RxH/mR+EsG7rQNL4TZf4lMY1wOWtmOThTP4wWUcS/qMc6WM7vzWvU9?=
 =?us-ascii?Q?37KPYBdE6MaM4muwwcf38YpD+NwzBWXDWcMP5bSplX+Cio0xfTy78l5kqtYr?=
 =?us-ascii?Q?AWrWOzwVCo2em2DjiCDvxS2ZnOdJXIdi4id7dX5E7OAQmL9GAf2n2YR5suLG?=
 =?us-ascii?Q?FpEt/VNYe/1BJ2Jnd/z1uUVhpRKrZTbNuwwCSjkgy5FtG44tM8SdXhhYUa8o?=
 =?us-ascii?Q?kyUtdFiPxRRZLKMk6O8XkVedaIgM1H0adiVYdHN12hFhu+9Q79UVmccVXfrg?=
 =?us-ascii?Q?xbhY0Go256TRMEGHIjPKLU6seP9yQ6vKk2BPFxsHuFxqj4uT2kxQNr9Iu2rV?=
 =?us-ascii?Q?oOt/e+6oj7njeUvwa6z3TSXy4BGTWB+98berlHbJma38Lfijn+4WvxGBspht?=
 =?us-ascii?Q?mJTi14QhS/jjiBz3ogEBh38XshY0xZTf1xHUrLzLVjSHw9TZqAtYtz7CuaKx?=
 =?us-ascii?Q?MVA7S+ltcFZKwyFwYK9bWunlp2LposZXzw0rWNdsrXPa/MBmz7MVqkxKhoHy?=
 =?us-ascii?Q?u/hF9beCP4BR0ce+QVWEj6xTVMou6zV4sx8doFi3D/2bLLkvHEMomgyK3bV4?=
 =?us-ascii?Q?7wFdafrrukusYVJy7XRw53UN+46c4W89NYG16mBHo4HEvB6wTSRWIRfKxHx9?=
 =?us-ascii?Q?Zg4XERaBobDBdx8qzfLz0lVc9+JwD/UrJ1rD9dcJT+xuqMB9/FWmW/A78Oer?=
 =?us-ascii?Q?NY9NptoasOHK+OvTkZIk8gicVJnpxnf3fgRWqjmsqBHKqvz3CSqnL1wiwmbL?=
 =?us-ascii?Q?RuctuM4X5eF2n1XU5SaLkM1xYf/Ohm5KrT9SXxXj3zYElnF6U8VBY8XGSpdl?=
 =?us-ascii?Q?oVkFVwvkTw91BKdHrlOXpQr/F9R6q+HLSiJc9ubu0BMhRWijtqaqssdPnEX9?=
 =?us-ascii?Q?8HLn6zm1O/StoJ0VNkBuexKTpQ0Uh3uX1MdzVv4Q9LBc4g+raszaenMt3JtN?=
 =?us-ascii?Q?mTK9YRRfnTLBsn2HrQVgnzvNqUyzGurQprg42GWup9y6ehQIUzH5Cn26z+II?=
 =?us-ascii?Q?NVpRpib9WicraoMHuOVr1KfBJqqLTfg9q5syTMi8uMVE9RwVQ7/3zW7SGbbU?=
 =?us-ascii?Q?yht5sIHe/HJY7TEJXRLij53VMv+dBB3RjL+UvgVjzLZhqPAQiqxysAbkuuO3?=
 =?us-ascii?Q?puVIgZzuBLwtUbkI/cBD5TXB0ZzHjOfgZn/N9kEKFcVlr/dQQUaDeFSECq7y?=
 =?us-ascii?Q?e6lqkTCSRvgsEQMFLq+GVCevO6eTA99YrBgaBHRyC8l54A47bCpUCNJyxTEh?=
 =?us-ascii?Q?Kbcpic+LjUyn/aPmAgQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 19:52:32.6135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c3db39-d5d2-419e-ddd7-08de06a4388f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10969
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 19:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224598

Some minor grammatical changes, and removal of some duplicate
information. Also note which features were previously part of the
debug-tweaks feature.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/core-image.bbclass | 29 +++++++++++++-------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/c=
ore-image.bbclass
index 67802f738d..2fb857d2ff 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -4,16 +4,16 @@
 #
 # SPDX-License-Identifier: MIT
=20
-# IMAGE_FEATURES control content of the core reference images
+# IMAGE_FEATURES control the content of the core reference images
 #=20
 # By default we install packagegroup-core-boot and packagegroup-base-exten=
ded packages;
-# this gives us working (console only) rootfs.
+# this gives us a working (console only) rootfs.
 #
 # Available IMAGE_FEATURES:
 #
 # These features install additional packages into the rootfs:
 # - eclipse-debug       - Eclipse remote debugging support
-# - hwcodecs            - Install hardware acceleration codecs
+# - hwcodecs            - hardware acceleration codecs (specified in MACHI=
NE_HWCODECS)
 # - nfs-client          - NFS client
 # - nfs-server          - NFS server
 # - package-management  - installs package management tools and preserves =
the package manager database
@@ -30,25 +30,24 @@
 # - x11-sato            - OpenedHand Sato environment
 #
 # These features install complementary packages for all installed packages=
 in the rootfs:
-# - dbg-pkgs            - debug symbol packages for all installed packages=
 in the rootfs
-# - dev-pkgs            - development packages (headers, etc.) for all ins=
talled packages in the rootfs
-# - doc-pkgs            - documentation packages for all installed package=
s in the rootfs
-# - lic-pkgs            - license packages for all installed pacakges in t=
he rootfs, requires
-#                         LICENSE_CREATE_PACKAGE=3D"1" to be set when buil=
ding packages too
+# - dbg-pkgs            - debug symbol packages
+# - dev-pkgs            - development packages (headers, etc.)
+# - doc-pkgs            - documentation packages
+# - lic-pkgs            - license packages, requires LICENSE_CREATE_PACKAG=
E=3D"1" to be set when building packages too
 # - ptest-pkgs          - ptest packages for all ptest-enabled recipes
 #
 # These features install complementary development packages:
-# - bash-completion-pkgs - bash-completion packages for recipes using bash=
-completion bbclass
+# - bash-completion-pkgs - bash-completion packages
 #
 # These features tweak the behavior of the rootfs:
-# - read-only-rootfs    - tweaks an image to support read-only rootfs
-# - stateless-rootfs    - systemctl-native not run, image populated by sys=
temd at runtime
+# - read-only-rootfs    - tweaks an image to support a read-only rootfs
+# - stateless-rootfs    - systemctl-native is not run, image is populated =
by systemd at runtime
 #
 # These features are for development purposes (some were previously part o=
f the debug-tweaks feature):
-# - allow-empty-password - users can have an empty password
-# - allow-root-login     - the root user can login
-# - empty-root-password  - the root user has no password set
-# - post-install-logging - log the output of postinstall scriptlets
+# - allow-empty-password  - users can have an empty password (debug-tweaks=
)
+# - allow-root-login      - the root user can login (debug-tweaks)
+# - empty-root-password   - the root user has no password set (debug-tweak=
s)
+# - post-install-logging  - log the output of postinstall scriptlets (debu=
g-tweaks)
 # - serial-autologin-root - with 'empty-root-password': autologin 'root' o=
n the serial console
 #
 FEATURE_PACKAGES_eclipse-debug =3D "packagegroup-core-eclipse-debug"

