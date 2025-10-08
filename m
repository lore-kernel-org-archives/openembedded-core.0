Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0816DCCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:52:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.web11.856.1759953158642738504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=NXnsKml0;
 spf=pass (domain: axis.com, ip: 52.101.65.1, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+E3A5LBbeY3Gn8IQh3pgyJJPo8RIjR8MHdFzSTZP2p/d00Rn/FezF3ukYFbCW8bCKgaYDfUZKOWwHYdrYffATbNa7meQpHo+aSZOcBJ7R42JFiHx0wC/sEIX37NcArcNGrdAXm1Ss1qw5TgwKjIxKLCjDI2uz+1Elrx3GsV3nlx8XPMgBWNckgviciqTc4SoHqtExbe3JRNSpDPLRAsKVXjp8YBXrwf8+IThWQCDVBvIPHB6EXZvg+JrkXlI4a56/ZGxatbZ7GhcJMOoXEDgBNTAwJxEhaXduSgIInh36vdOtJxWEmVCEG1RmV7H9ZKNNClmo+mFWHUHtj9YOCahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfP0IRomeraI+2cCS+LujUl8n2Qy5+ZauXa3zTTB7gY=;
 b=JqaguRFboKig5vunQWL71L8/XVJMAM0MZgFQF8odoosz0jyb8ksyCLPzIhydQMqkLuRGDoVCInD58ndTuIIR+32l3xmc9lY3NnM2H9XKg2yEEixk2T1S6jzS2BsFL0QPaJx3yiLHtndZvHQWErf4L1+R2szDslJCuriEzNkxBvOB/EQizyfZTvOv7VQY0CKu/qK5VF0Fk5whaE5WhgRORJkUEedtM3ZkXuAppZp6lJuiXzqxx900EzGxlMNQqTVE4hKWtpprrbVe5vergILUwaAMkoC2+xEJBRlF+BFNHc5A+d3lbhIYakt5snQCFHGK5uP3aHYYmUKJZ4xdyPVS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfP0IRomeraI+2cCS+LujUl8n2Qy5+ZauXa3zTTB7gY=;
 b=NXnsKml0hVIa4TNQm/INDVqUeJaDUvcp8CNToDsuqeKEsjrBFozZzqzqszZm4patNaLOccIfCPg8oXFpmmLoak/PXV8lf8xTOrN7gKv3mgl+8Xx0DUf/idwfGYLVlnAzXiYb/wU7qY19g2WHDie/NVdX5/OFdc/zYEDXRChwAUM=
Received: from AM6PR0202CA0065.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::42) by VI6PPF78C7BDB37.eurprd02.prod.outlook.com
 (2603:10a6:808:1::310) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 8 Oct
 2025 19:52:33 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:3a:cafe::38) by AM6PR0202CA0065.outlook.office365.com
 (2603:10a6:20b:3a::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Wed, 8
 Oct 2025 19:52:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9203.9 via Frontend Transport; Wed, 8 Oct 2025 19:52:33 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 8 Oct
 2025 21:52:32 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 8 Oct
 2025 21:52:32 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 8 Oct 2025 21:52:32 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 22E0D1992
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Oct 2025 21:52:32 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 1EF5E1208C4; Wed,  8 Oct 2025 21:52:31 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/4] core-image.bbclass: Improve the documentation of available image features
Date: Wed, 8 Oct 2025 21:52:16 +0200
Message-ID: <20251008195219.117570-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008195219.117570-1-pkj@axis.com>
References: <20251008195219.117570-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DD:EE_|VI6PPF78C7BDB37:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d52e30-8b24-45da-9849-08de06a438d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B5OyCRQFLhUZ3Kf1nuoQs6sp90Lf2+M/glXue35LEV8laJoUGEoRNom0THqd?=
 =?us-ascii?Q?nDfvisICW2QV+k+AFylWsPzZhgra3qYsABkdE3hwsdS9N0tfC65oCCVTi6Op?=
 =?us-ascii?Q?QcXywhb+L4bYzSNEcdgzTqzDGjKmNeTZIbsQPPbA6pDAWqIq9aAyNmMVQ8hS?=
 =?us-ascii?Q?Y78cPf7PEZFKTlb9cOO+37msAHVZEqom8yDsTiH/7lNobwXM1iTBI9Y/zMKK?=
 =?us-ascii?Q?2WO8lk9P9RAnlbKPKyPqsCzQfS2+ZYbBq43wHYjfAZFCbFuUHr5thE29BRHL?=
 =?us-ascii?Q?GUmGqQXc3t0Vvtn2X+PNqWZO/TeD6CyFtIxhBpkMxyyjSOWGC4ZCv8LdTSli?=
 =?us-ascii?Q?HmNJrILEJV07bIU64E0dOcqQZzQRUbr/xzB2Vr3eNg9mjlNqyQz9rvH0/HMG?=
 =?us-ascii?Q?xhhM/nvFTyna2Ut69zxTgVpUKPlg/MqxdyzKCgEnFHBT2NpBFc6AE7y6cNm8?=
 =?us-ascii?Q?Vwr82WhSN0IpQN3816/jr7p9uEuHMz7FUCQI9rVLTs42nakwTsEM3Ha8XVAi?=
 =?us-ascii?Q?2w/aMgXqNHejjzrcULIz36ap+Ru+4cxdDETNAR9MR5a3Qf1iO+eiVMj2QQhz?=
 =?us-ascii?Q?AeJt90VyFM87guFDhCkZC/u8HJbgVJR32t5kHYVtqps9kyb1PReljiLVl5Ac?=
 =?us-ascii?Q?un2cg0OHvtRZYMPQ0LY67/epJIf13o7SkhloZZyJtPlvJuqhdQ82Fxl1MoCv?=
 =?us-ascii?Q?Csh/b3aVlTVn9w0I49loEIguR3LN5RUYrKtt0hwKgq0JWGUU0ldVHwSZlTGV?=
 =?us-ascii?Q?sBdwjGdAvY619JePWsPg+1hLNHxuJ0ufDx5rKK5nT/HztbRxlwiTyUksHhxk?=
 =?us-ascii?Q?jI5qp5Y7vARl9NaGvHDPhAe3HFlVReyMoHde0CtboP+mRdRaaUnYLqHBUo2W?=
 =?us-ascii?Q?zPXpBxPEUEVBgJdQcGuJ/n/4xYsd9S5kAT+QaNxN1XbFhCvyWqpWvC3Z4lp4?=
 =?us-ascii?Q?GO+CwquhyVP6+xpF9z/ozUoyHzUgeyGIKuq6caWmaMe/i0eeKunWCAkfF090?=
 =?us-ascii?Q?zmgg1jDZ2tE8D5ljLrXI6qwkPNSRWkCx5/gWAIEzT8X4ND5EuzVUQCNj94cD?=
 =?us-ascii?Q?QPq2oBAfj+Syr0JTBQDN1cDSaO7oIZl53mfHRbV1SLn68spb876akbBSSjIf?=
 =?us-ascii?Q?aVI6uE436dWnKECUZCZCwAS/NIbd8FpPFa5T59782rVlfD+yOnxa6mvDwDmr?=
 =?us-ascii?Q?LJPrFUn00QzHra9BbKESlH/vdjLAl8Uc54ElfkUStHlusWdk8EduZeb4jApJ?=
 =?us-ascii?Q?uA/MW4frCrwXLDOTub2BF9BOSk2Bi8j5n3McTaTodUYVT+y77/7CvuSeHhep?=
 =?us-ascii?Q?Bq5B2P/Wm1+m+AfBEKwfgY5huwdcOqq8+cEUS7EOulRBjxJ07YihH8GfdHxh?=
 =?us-ascii?Q?VDFpELM9fVnVJOQrR4mlK5qTKauFqDJbpakv/cAbFO0qTLyRzwXjz8gN4PD/?=
 =?us-ascii?Q?SUd+m33stD3AbvsUYJ19r6hXdr5WYu9o569AOhleQlHSI9LQVXzc8CAbYiu5?=
 =?us-ascii?Q?Gt9948uIV8d9zk9SMiFrmzYDV2D/e6D5IZIAc8OQvojM3aeCIxNJSQ4D5ktS?=
 =?us-ascii?Q?dtO/GLUu2D7reF0Mn+g=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 19:52:33.0366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d52e30-8b24-45da-9849-08de06a438d0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF78C7BDB37
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 19:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224599

Group the features based on what they are used for, and also sort the
features within each group.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/core-image.bbclass | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/c=
ore-image.bbclass
index 34d4c2f544..67802f738d 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -11,10 +11,13 @@
 #
 # Available IMAGE_FEATURES:
 #
+# These features install additional packages into the rootfs:
 # - eclipse-debug       - Eclipse remote debugging support
 # - hwcodecs            - Install hardware acceleration codecs
 # - nfs-client          - NFS client
 # - nfs-server          - NFS server
+# - package-management  - installs package management tools and preserves =
the package manager database
+# - splash              - bootup splash screen
 # - ssh-server-dropbear - SSH server (dropbear)
 # - ssh-server-openssh  - SSH server (openssh)
 # - tools-debug         - debugging tools
@@ -25,24 +28,28 @@
 # - x11                 - X server
 # - x11-base            - X server with minimal environment
 # - x11-sato            - OpenedHand Sato environment
-# - package-management  - installs package management tools and preserves =
the package manager database
-# - serial-autologin-root - with 'empty-root-password': autologin 'root' o=
n the serial console
-# - dev-pkgs            - development packages (headers, etc.) for all ins=
talled packages in the rootfs
+#
+# These features install complementary packages for all installed packages=
 in the rootfs:
 # - dbg-pkgs            - debug symbol packages for all installed packages=
 in the rootfs
+# - dev-pkgs            - development packages (headers, etc.) for all ins=
talled packages in the rootfs
+# - doc-pkgs            - documentation packages for all installed package=
s in the rootfs
 # - lic-pkgs            - license packages for all installed pacakges in t=
he rootfs, requires
 #                         LICENSE_CREATE_PACKAGE=3D"1" to be set when buil=
ding packages too
-# - doc-pkgs            - documentation packages for all installed package=
s in the rootfs
-# - bash-completion-pkgs - bash-completion packages for recipes using bash=
-completion bbclass
 # - ptest-pkgs          - ptest packages for all ptest-enabled recipes
+#
+# These features install complementary development packages:
+# - bash-completion-pkgs - bash-completion packages for recipes using bash=
-completion bbclass
+#
+# These features tweak the behavior of the rootfs:
 # - read-only-rootfs    - tweaks an image to support read-only rootfs
 # - stateless-rootfs    - systemctl-native not run, image populated by sys=
temd at runtime
-# - splash              - bootup splash screen
 #
-# Features for development purposes (previously part of debug-tweaks):
-# - empty-root-password  - the root user has no password set
+# These features are for development purposes (some were previously part o=
f the debug-tweaks feature):
 # - allow-empty-password - users can have an empty password
 # - allow-root-login     - the root user can login
+# - empty-root-password  - the root user has no password set
 # - post-install-logging - log the output of postinstall scriptlets
+# - serial-autologin-root - with 'empty-root-password': autologin 'root' o=
n the serial console
 #
 FEATURE_PACKAGES_eclipse-debug =3D "packagegroup-core-eclipse-debug"
 FEATURE_PACKAGES_hwcodecs =3D "${MACHINE_HWCODECS}"

