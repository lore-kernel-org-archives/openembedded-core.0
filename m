Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2666ACAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:52:39 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.5])
 by mx.groups.io with SMTP id smtpd.web11.853.1759953154913471222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=LnCtBqTq;
 spf=pass (domain: axis.com, ip: 52.101.84.5, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLYuvD7WfEb7JlyCbMHTmpeQSM1ktZVsc+YiLfbSSQzmQqQBCx03novXu7rNK9SuDleg4kR1OiJGO1BwDuaAOeKR/2YELqsPdITRdFuPmkPIByYQN5P4Xw9RcKAPdcTYNPVqCAiXdxb2OcOcehPW2Nt6K8cFYji580yB+VJZGD7f5IX8Px1YAVftGYh0ko7WTC7hh4o+rqtixCyb1MsEW3RQdOSWK9sUDShNZCDICXpFwH025wTA1BrAl2BSKtup5yX30UvDZokeFV7thB/4FjGc7U9JLLInj6Dp+gaZSatTVT1n9lwWEE0MEg0It8N9uA2LW55vMO1S7itE+I66Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeBq06O8fFSORceQdXbD+fWSdL2kX3iO7xiY6fwIx2E=;
 b=ZjaDYb4AGV8HH1PMAVkRHL5sEacLbjT/ADZAuUHAjGf4r2B+GMhew9xqHe2/Ln7QhB6w3+MaPWkvRbX/xHNGhoX2ssopLW49wpexfkIGJ+gZANcZRljq4kx3xn74SqOjVmyn/+T+2sp07SpNbvwbVoEKvEDyVlwpQVLAv1LOYWRrjb491iMrnKZDGXJbmTu51aFZqDMmM+QOz/h/vIS7tlYIZxNXqcXaEDmUpvbH41G5tjp57OlAkn9d4OMUzm4kHvGGDtyk7IdSzWapSoUsxOYDwqA3+1Jrb+jTR4gXC0K9Wdj0ja5smrzHbpHsw1U/99L6xqsI3W7ZBktVzGrsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeBq06O8fFSORceQdXbD+fWSdL2kX3iO7xiY6fwIx2E=;
 b=LnCtBqTqwmVvZuOj0iMAjKZ7Wrdr2ywShE81qfHXsqWa1C91WVrEjh0TTpPnSIB3S1L3EQdhjZt8CHQxzmdK7+M6LUid+nibl2RvPvn9eRTy5xeR2+y2J+OFi4Ch0t9w690bY8ho5MdNgizkU7zPYz8w07aHvkiCbvj7EOl6VpY=
Received: from DUZPR01CA0267.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::10) by AS8PR02MB8293.eurprd02.prod.outlook.com
 (2603:10a6:20b:509::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 19:52:30 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::db) by DUZPR01CA0267.outlook.office365.com
 (2603:10a6:10:4b9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Wed, 8
 Oct 2025 19:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9203.9 via Frontend Transport; Wed, 8 Oct 2025 19:52:30 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 8 Oct
 2025 21:52:29 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 8 Oct
 2025 21:52:29 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 8 Oct 2025 21:52:29 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B9D731992
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Oct 2025 21:52:29 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id B39AA1208C4; Wed,  8 Oct 2025 21:52:28 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/4] core-image.bbclass: Sort the FEATURE_PACKAGES_*
Date: Wed, 8 Oct 2025 21:52:15 +0200
Message-ID: <20251008195219.117570-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9E:EE_|AS8PR02MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8d93c5-f4a1-457c-229a-08de06a43728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V2rtAJizDt+tpJKjC/DkustUhm1//OXC++sJioLf7fjjyo5gg132dIiyAdk2?=
 =?us-ascii?Q?tX6D0s0P8lC3iYqHcUZTb+3AkBN1iYUPgps1KE1+Pfz6oA+LZanhQGBV5QXw?=
 =?us-ascii?Q?Zu6XGXaVjU1iVw/0oJU20K9eFGe0l8xqOLv+RtOEbtsSMku1R0XZlEy9hY9w?=
 =?us-ascii?Q?ABYJlaLKjPQ6DTg3dtyAPwLBMalUYvTb7BKJiSWB5IoyS+rPOtz7IHx065Wd?=
 =?us-ascii?Q?1bQiAonmTQ7v90wwy4ahzmqOSBnAX1AJlMf8qYGD5Yd0oLuYgOfxicqlGEhm?=
 =?us-ascii?Q?ZyutV9SvvcMlvQebUs+ZDS0GAQxY4iyfuJRRWQTMdS9r73jqesJ/DutpKm/F?=
 =?us-ascii?Q?ivH28ZmXtnjV8jAeYG6zSUci8G15LufDHsHKb4ceY96URxtMrfC6uUMnRV/r?=
 =?us-ascii?Q?HWttmnwFfsX2brbY1ocUIlnT50eeNj5OrkCVpdMSSySQRqcfOOnorjidGL7P?=
 =?us-ascii?Q?YCGVK0791JOGR3U2UbcY5cgeiyhxDTCr+3fIU7fWisWw4q+0RP15N9xgpaMT?=
 =?us-ascii?Q?cnNEl8RoCqg+u4lsAcTfvbJNJ5cAZdfKGlGevgvgTDrXCHlqg5QOp0NZJOMg?=
 =?us-ascii?Q?X/kqWH1R4HvJT7LJXAjcaaUivmcjqjaZ9k6j51ipT0bS/igmKc6RcMEMEQYQ?=
 =?us-ascii?Q?A0qquVsfSoo5thNAykWM2rCKPWId/opSZC0gr7GEuw3+QvOV6MB2tCDplOj8?=
 =?us-ascii?Q?vr4GVWrLUg9Qg5XvjyeQkWCDE1aSyIMFDuuJwS+zJtsXytGlHYA4ZA365nVF?=
 =?us-ascii?Q?mVltImBpMVatyez3sXfVSoYoBGM+1p1uChzOvULWpnPSVP5v5W91iOpVfIfL?=
 =?us-ascii?Q?7GZSUO3M1ZRwFBV+X/4p5gj9BwWnzU44br30g3/F6SrlIeSdoco6wYat4Py/?=
 =?us-ascii?Q?jaROf3mV8IReJyy/61mIEXllnPrBR3iVmSOU2umENR1dMzue2qg+pCP35Urb?=
 =?us-ascii?Q?VkthT588pT0xTB6NGCMsQMYIDFislHx3H2elnkx2XbhVC2GEB2/uIja2mERt?=
 =?us-ascii?Q?GQ9gKlDaI+aydbP1evcLIk/xkC1ZY7kBEmR/PwFmMcyHtEOzSOmdD+a4fopf?=
 =?us-ascii?Q?XyVHgQPjBwxYXzdIFPHw4QSGKuEmB76cEV0sHT8iuiG+YIFE6cMLttyHolKU?=
 =?us-ascii?Q?3RAteL7N/SnjEKPehpRDPK7aYd5wpDF4PffS14Y1ii45u+JRgodJQ56PBZif?=
 =?us-ascii?Q?K+Z76awbidaijPAPBADNt4asZL5tdnndw+pTInrwdWsWodmDtAG1NyE/Etyn?=
 =?us-ascii?Q?Nic6RopqX3q5hOhaNrkMsw6zUkBnv/fnyBnF0yPIZr8wHSQDD8eAW0sZWOam?=
 =?us-ascii?Q?2BFj7b9W0XszfN88rIQBocPNOpSR8IbTQ6lf3FIJIVRKXCvirRwTmlrTJZDa?=
 =?us-ascii?Q?FbDPLqZB5oDK0tEKkOU23atoEXBvxksRV9IAQdAo0dkkx62gQdA15+a2dHqf?=
 =?us-ascii?Q?OQ8rrWrvcUQ5+0ynqDZcK9CHW9KTPou4nHBbXIR6v4+LYy7DP4JSXq6JA2nL?=
 =?us-ascii?Q?b/2oJ1mdRmvI1RpIvYYg72cGliYnVFhZlhHenKCwoEIDIgu4LdeY+9Svjjx7?=
 =?us-ascii?Q?940ntXcmrAGn26tdtts=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 19:52:30.2450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8d93c5-f4a1-457c-229a-08de06a43728
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8293
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 19:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224596

This is primarily a preparation for the next commit.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/core-image.bbclass | 41 +++++++++++++-------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/c=
ore-image.bbclass
index 4072e420c5..34d4c2f544 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -11,20 +11,20 @@
 #
 # Available IMAGE_FEATURES:
 #
-# - weston              - Weston Wayland compositor
-# - x11                 - X server
-# - x11-base            - X server with minimal environment
-# - x11-sato            - OpenedHand Sato environment
-# - tools-debug         - debugging tools
 # - eclipse-debug       - Eclipse remote debugging support
-# - tools-profile       - profiling tools
-# - tools-testapps      - tools usable to make some device tests
-# - tools-sdk           - SDK (C/C++ compiler, autotools, etc.)
-# - nfs-server          - NFS server
+# - hwcodecs            - Install hardware acceleration codecs
 # - nfs-client          - NFS client
+# - nfs-server          - NFS server
 # - ssh-server-dropbear - SSH server (dropbear)
 # - ssh-server-openssh  - SSH server (openssh)
-# - hwcodecs            - Install hardware acceleration codecs
+# - tools-debug         - debugging tools
+# - tools-profile       - profiling tools
+# - tools-sdk           - SDK (C/C++ compiler, autotools, etc.)
+# - tools-testapps      - tools usable to make some device tests
+# - weston              - Weston Wayland compositor
+# - x11                 - X server
+# - x11-base            - X server with minimal environment
+# - x11-sato            - OpenedHand Sato environment
 # - package-management  - installs package management tools and preserves =
the package manager database
 # - serial-autologin-root - with 'empty-root-password': autologin 'root' o=
n the serial console
 # - dev-pkgs            - development packages (headers, etc.) for all ins=
talled packages in the rootfs
@@ -44,21 +44,20 @@
 # - allow-root-login     - the root user can login
 # - post-install-logging - log the output of postinstall scriptlets
 #
-FEATURE_PACKAGES_weston =3D "packagegroup-core-weston"
-FEATURE_PACKAGES_x11 =3D "packagegroup-core-x11"
-FEATURE_PACKAGES_x11-base =3D "packagegroup-core-x11-base"
-FEATURE_PACKAGES_x11-sato =3D "packagegroup-core-x11-sato"
-FEATURE_PACKAGES_tools-debug =3D "packagegroup-core-tools-debug"
 FEATURE_PACKAGES_eclipse-debug =3D "packagegroup-core-eclipse-debug"
-FEATURE_PACKAGES_tools-profile =3D "packagegroup-core-tools-profile"
-FEATURE_PACKAGES_tools-testapps =3D "packagegroup-core-tools-testapps"
-FEATURE_PACKAGES_tools-sdk =3D "packagegroup-core-sdk packagegroup-core-st=
andalone-sdk-target"
-FEATURE_PACKAGES_nfs-server =3D "packagegroup-core-nfs-server"
+FEATURE_PACKAGES_hwcodecs =3D "${MACHINE_HWCODECS}"
 FEATURE_PACKAGES_nfs-client =3D "packagegroup-core-nfs-client"
+FEATURE_PACKAGES_nfs-server =3D "packagegroup-core-nfs-server"
 FEATURE_PACKAGES_ssh-server-dropbear =3D "packagegroup-core-ssh-dropbear"
 FEATURE_PACKAGES_ssh-server-openssh =3D "packagegroup-core-ssh-openssh"
-FEATURE_PACKAGES_hwcodecs =3D "${MACHINE_HWCODECS}"
-
+FEATURE_PACKAGES_tools-debug =3D "packagegroup-core-tools-debug"
+FEATURE_PACKAGES_tools-profile =3D "packagegroup-core-tools-profile"
+FEATURE_PACKAGES_tools-sdk =3D "packagegroup-core-sdk packagegroup-core-st=
andalone-sdk-target"
+FEATURE_PACKAGES_tools-testapps =3D "packagegroup-core-tools-testapps"
+FEATURE_PACKAGES_weston =3D "packagegroup-core-weston"
+FEATURE_PACKAGES_x11 =3D "packagegroup-core-x11"
+FEATURE_PACKAGES_x11-base =3D "packagegroup-core-x11-base"
+FEATURE_PACKAGES_x11-sato =3D "packagegroup-core-x11-sato"
=20
 # IMAGE_FEATURES_REPLACES_foo =3D 'bar1 bar2'
 # Including image feature foo would replace the image features bar1 and ba=
r2

