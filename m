Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C427AC79F82
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8948.1788343178872025187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=CcacTsGG;
 spf=pass (domain: ericsson.com, ip: 52.101.65.28, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgJJQ3G0zu2+5xVNBvX9DzU5Z8xn96Ne3y7U/Z4/UpuUIBCz0KCpoezpp9F44PHCN2+M9QhI0Xlw/ZrB39nAX81PoYR5Fhuck0tzNKKhWCA/1Cgkm+FfeswEb5iWQCLz/tsQqp3OLuNqEEu+BVdIvy95SavUux2Z+aobWeqXxkQhfp+TOXThBykRkB0rtLUtmNLbWF/tVHDQk6vvrRdtBgk/ItuDg3BB023BWrNEoOmTY9jSQnY2Nkje9S2RbQFrGpIDRe6qaxv3NLNfr1C7TWxCV1BNur5Ad4w31DHzY4F0NpxSWD1YGln5QgzA2Cm5LbcKI2zgEqRwql6CwJpR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dc4nZUpzMji6d2Vzcezjv9T+/bWwPnscXU4PFOvH/mE=;
 b=eKLCTLtbPmBnwYMIl2kQGqR6J0YUDWJp7MPlqrz6OuvYILnhkptMgats62pdQRRw4XLnnGDiIYXc/AfgrcpP0dwar0xQlG229RIgDiRxHaFPqXLX1Aaz4+NEdZygBdnvQQ+Gx8+TVfBqHwxs+TcKj9VBYB2QGcdWUKcHEBJEs2qKn8hYnFiWn2TSqhB+KuZ9LlplNny/5A6gfr7E92N3ib1ipzci0RgQaWLbFIVcCby9ihTmM9YrCQXevJ2QR1gv+96gKlOTjnJMuMf04s+4htVDnu2FEuTlBTOlAyJp6xIX8usheT6pcUoxi4ng3c+0oQIEU4EwYAEtZoUPpPSlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dc4nZUpzMji6d2Vzcezjv9T+/bWwPnscXU4PFOvH/mE=;
 b=CcacTsGGzHU0QcJioUn1/C3nST2dIOX/Zj7SRFVIcAPBlU+JIrp7ycBed1Ue+KQwfo7ozSQfZpGc5TIC36WjS89/209Rxf4YTgm2vsod3uF3RoN/YxNF7DZjMeUAip9Me3ngEmfoCiEcCsLTWZnc1vaqe+1gLmpkagdsdOezmpQ0ImrjL/ncZnHyX5mCW07FEybt65zSnszsOKxKwhfj4R1lx3fCNTqSTCi9CxVyAMAIAAfbY+DsQvZfxUsANF74GrBInf8/0AyK2fQS5PqC4x+/ozHJPrNu+aVTwQTz/2TWguXz678JNag0X4LQgtBhJtxxSd6PqzP8yMO95vOJXQ==
Received: from AS9PR06CA0411.eurprd06.prod.outlook.com (2603:10a6:20b:461::25)
 by VI0PR07MB11913.eurprd07.prod.outlook.com (2603:10a6:800:335::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:34 +0000
Received: from CPH1EPF00000526.eurprd05.prod.outlook.com
 (2603:10a6:20b:461:cafe::5d) by AS9PR06CA0411.outlook.office365.com
 (2603:10a6:20b:461::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 09:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 CPH1EPF00000526.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:34 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:34 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 63F674020EA8;
	Wed,  2 Sep 2026 11:59:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 82C34700E7EC; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 17/20] util-linux: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:17 +0200
Message-ID: <20260902095920.2840293-18-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000526:EE_|VI0PR07MB11913:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a021873-2127-4231-16f2-08df08d8e467
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|10067099003|6133799003|56012099006|18002099003|22082099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	lF91yQHt3WYU+yUcuL/Jt9AgTHg0cr2xlEmV45UHmm8EOEY1eBlHw7cYkXfAjeFFUeUmbSs/fYIJTMBE5l2D4RlqoEZrrHj1VVzeOG5+D6bV90gmQITp8sCURlN2kTjR0d8paEt/D45olTdmqgc9ux9IyIxwkwVsovpv/IOeXviZNwdSd4Dhdk4sdH+3dBcIZmTmaES+LUdN8U/sBo/7m+6QBO1ZGLSL0lBH2OCpWrBYgtVb4VioeQua7J2+b2AulEdBJEQVoJ4BW96NfWCOYDW7SKeKBmqwhPGGSK195qxc5A4Qgwj1ifDhR1vxd2JitpuNtcfq0jj2Pg6sqMSSbGmZoe1RqnZqREGC1s9ybBJ5ykkeYNUawXp8iAmikAtycVksmbZm8Tck8t+3NLY6kkmXv1rEJYvzo9grTugqC51XJDR/I7biDUkWQqtBDV5x6JcetMrALoyO4i4K4EnB+dTBBebELhbjgv9w2QubPX/U4Gsp8o0vePWiYIVQHEu1fuNVPwc3Jo31hHPEIt43Azw3uPDfxs0Zm/I2QxxKU1kBVvSPwkr1mW/4Z2Na4uRKxkMwbGln4N0CKpui6107dmNDA6pgFcvI0w6f8XyMKNiDVrKCss3DEbMMVcTxRnPDN8sTzPwB28/uJjl9Xf2GPqGgC2q+t5QUYV2Z4bNUBtQ=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WE9I71yLRRPdhL/ZQvkcoD6G+YYVvxMtXqhv3tY+2xL+wm/tZLPQQM5m+ihhEJlitqr22+DZJUGI18q0MhhnSVkMNoz0btV4ZRaBULRKChTY2k+2hJ2KJR/q15OYa88Yu2EgcJDIpxHQVx7wkuSrJZbByVmpQ8jHWf8F4j6WcFa0bggmVZmESY1VBn7P89gihNEcVQOa3MV83RGK7tJb4Ocz3cJyUvK5Rlt01tBp+X0wRQ6qY2gIIQRfgG3cQM28y5TLF61LhLnaJqNndMO42wh6rErZ0Dr6W0tl2StCsiJNqkEqODT6LV3Mt+GAnGUoQQvHpvtfm6KIdKVT/O99yJ0skHdQTjsvC+6NCssjYSrbhpY2y8//m4qmP8UO36nFPHRsRUyOc2E26vTFMU6CN6XYRCuiLeZZYKUMFbMjgMSYZuFH8/cp2NuLN52RklKX
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:34.7350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a021873-2127-4231-16f2-08df08d8e467
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF00000526.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB11913
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244912

From: Daniel Turull <daniel.turull@ericsson.com>

util-linux's README ("Stable Branches") documents stable/v<major>.<minor>
branches whose maintenance releases are bug fixes only, so upgrades
within a major.minor are stable point upgrades per the OE-Core stable
release policy (ref-manual, "Stable Point Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/util-linux/util-linux/blob/v2.42.2/README#L95

Checked the last point release for feature creep:

  2.42.2 (Jun 16 2026), against 2.42.1 (May 18 2026): 32 commits, all
  fixes or hardening -- memory safety (a libblkid use-after-free, two
  buffer overflows, a libfdisk GPT fix), privilege tightening
  (X-mount.subdir restricted for non-root), diagnostics (fanotify queue
  overflow detection) and documentation. No new options or behaviour.

These releases are not picked up on the OE stable branches: util-linux has
had zero point-release bumps on kirkstone, scarthgap or wrynose since each
branch forked from master, leaving them at 2.37.4, 2.39.3 and 2.41.3
respectively. This addresses that gap going forward.

Scarthgap already has v2.39.3, and the 2.39.x stable branch history (mount
API regression fix in 2.39.1, new CPU model support, and libblkid=E2=80=99s=
 bcachefs
handling) demonstrates that util-linux exercises good judgement in managing
stable branches, so we can safely track their stable series there as well.
For the avoidance of doubt it is not a development-series effect either:
util-linux has no development/stable version split, and pre-release work
goes to -rc tags.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit d51c6e87a10c7c75a692ca86b71af9a818026ecb)
---
 meta/recipes-core/util-linux/util-linux.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index aec8721ca3..aa1916f48e 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -25,3 +25,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v=
${MAJOR_VERSION}/util-lin
 SRC_URI[sha256sum] =3D "f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db442=
9a414d8aa6a728"
=20
 CVE_PRODUCT =3D "util-linux"
+
+# util-linux publishes bugfix/security-only point releases on its
+# stable/v<major.minor> branches.
+inherit upstream-stable-release-point

