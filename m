Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AF3C5516F
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 12:25:46 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5297.1785500744671923250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 05:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=iRhYwDGn;
 spf=pass (domain: ericsson.com, ip: 40.107.159.8, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hvj2lv4+bNApxdILrwVL8vDPwNayqjv6KG7brhSGtEFHZyVrCh5qjC74HyZmuMg6c/Rsst2rgMOyDrGiaf8LZwRGOb4ZoFYjKbGFUSbq3uSLUdVMnEeE8HukgEQsChSR9beEDivx4TlKqVJfdoVRCFiUl38QG3JemmiUky6tO4geBR1SWfAjtwdEx96ulw2u5pXXuMoGGKXpoIKeFUPCETpEaB5vb9Yb3H4yJq6ljy/NmAjzuchbNedAxJIu+HQ5ul2teFzg3BLZqy8xTKU5BCQqHaXhrAiasokmhTSBVyF7udJdm+EM2wWzIRRg2YsjfeId1Kr4CGGT6eaf669ZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6JPgg4YfMP9zuqgOvHtlM29NWtwk/4Rhayk+FOdoeA=;
 b=LPH3BJzHny2u7XTge/4Zu+R0sO5KhMkMlPac960l4oCsedH/QX7kYHMV5XiH9WCAcSMWnN3miBVT+GVWMsp1A7okwctjYDe3S9nOQuVnugBKIf2WpfWaEu93uthiK8mcQylt//zU+OWY0oIg68dVrVz80tYnDSrStB3Kc/GEPfRwFV5aZ43eM7mleVSBhw0Y0qz5gWPanpyYbnBIwGaxyCT93fZYr1ZKdXsTP1hr9o8dksWyUGXRTPPyJF6oLUhaG+O/aHiuWdNkVy9MlOlhE768cgy+FQzu+S8npvnatlMut32SsL/XiuzUYzC/DHy1XPDQ3pOrxL8IHh+onMgQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6JPgg4YfMP9zuqgOvHtlM29NWtwk/4Rhayk+FOdoeA=;
 b=iRhYwDGnlHK2w74jOaIpVV0g/Z/dwNgYR2kQ1pSJbecB/4vQlEwtLJBRnfng2EU86HrB4anuBfPK7AyuEN721Xy6JkIjQDDHu5BWLX+7XDCvW0TuoqNRF3nRx3h9aElEnfdii4k/qWv999BQModuWcZzB0TnS7SJgqg9HUgBo2gjVXouKZ4ivNGlzHyU8/fY0F1+Su5jxgeBGeqeSMkIhqqid6ECh0TO+qC1L50Q4AJed0Y7ZxIUqbkO6XjBbQ30B2qg6Kv5sB5+ofT3+eVqgkUZnWH3cF0P8n00tQmudd8Nmb4Dqfqt96w7iwqJSm0k/56f8LhO6CdTLgwVpGVh7Q==
Received: from AS4PR10CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::10)
 by PA4PR07MB8416.eurprd07.prod.outlook.com (2603:10a6:102:2a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 12:25:38 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::3b) by AS4PR10CA0020.outlook.office365.com
 (2603:10a6:20b:5d8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 12:25:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 12:25:38 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 31 Jul 2026 14:25:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 7A99A4020DF7;
	Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4A22D700DF49; Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 1/7] util-linux: inherit upstream-stable-release-point
Date: Fri, 31 Jul 2026 14:25:16 +0200
Message-ID: <20260731122522.1647968-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731122522.1647968-1-daniel.turull@ericsson.com>
References: <20260731122522.1647968-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|PA4PR07MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 407a4634-ec4a-4ffb-f471-08deeefed448
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|18002099003|22082099003|13003099007|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	oqAQ+7mbXxHoPI8faSr4YlV5ziEbtpNPDXHsmtKqxT9fatX9Qwi7Mfksq1AtrPlbJL7tDJkh/LDdSmJOWjUsHndy7JTvyzmZuneo1R1zIFecXPuAymc55UnjzhYhVQSFr/vEAsifjk9RPXLw2toB+F0B9/ZF+YLIkDvM+EIbz5YM/YLnnSp3aa8QzvDaiyW4uAWP3XojP07xredSYiv9TCkYxgEV5vmuxH66nimIDZVmjFMAYjEUioJHOVEnDiYefkEIrIS4yJ0c8IMBWrt9N20D91Epokvc+oIwgFYK7jEZJW5jKB9oIhwP2ZPDlJiNVEGiIBJBxrkF8K0YQcOBHCpgCkbiWY/crgginOW4vyhmdM+TP1F0ah2j1wEwJ6OvXQfMQtW7KP4OvBWHM36p2KlG9J8Qd2MBf00WFYuNb8TDKlojllfsGAHhBepRfB13qAOFM46dP/i5qOFWb/L5i18pZPXtM0Z1izo2xwyUIjgdn6WtHENbp86KDzXwFn/3SANs3JID7F+WrgcSmDFqjDxNSDFYiLMGMIlI3I49Lbdi7ZvcId9R7SiEnxQ6hQZH/E+Bz4EYgejwFOVXLApVqhDHD720EfoCkGddHX0PDTBIej0GUW2Dp3yH5j+z2+m/4w101itV0coLAAL8IC+SEw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(13003099007)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ePmt8fVMj+PKbe5v6hSLCmYKy8TtXNhRPIlEJ/GDRio1fp6rlIPIulZOFBoPgKy0TVcVZHPm0pKDGDvCSwBdqBSQsNtRgOJCh4L94Vggb7QgyKT6RlD5zl/BQqbqBBAXEfLbp4jQqn3Gcf4j+8QaE/o23DBgsknJFR4S7o9WmK/ew3CQsO2no1nQOP1qX3F3jOZa1cB6o750iKJpl9FnEUkZD2gzGW1sfaIOsFPvSocC6SP5Ay4ojCRd2pIr/bjmuDeD8b2TrbyYB3Z0QXMpQsnmCgI+W86YjXdgRsZvnQS0Ng1NlH5l2mFKq7TDGaiAV6N/j8lHxLBfbe4zfoOLeUggfZGcGrCi/6XWq6C9WSTh75mPNYa7Wrs9WT0kiuPJL66dBNfosGRCf/vOcW0tgg7IWjBA61HyEVnOBkL8p6iKiPqcnhYnqBjm1Lr9r4sY
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 12:25:38.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 407a4634-ec4a-4ffb-f471-08deeefed448
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242436

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

This addresses the general case on master, where PV is 2.42.x. Since the
regex is derived from PV, an older branch scopes it to that branch's series=
,
and the 2.39 series scarthgap ships does not qualify. 2.39 adopted the new
kernel mount API, so 2.39.1 introduced
LIBMOUNT_FORCE_MOUNT2=3D{always,never,auto} as, in its own words, "a stable
workaround for use cases where new kernel API is not ready to use"; the
series also took new CPU model support and libblkid bcachefs sub-device
label probing. That is a property of the 2.39 series rather than of the
project -- 2.42.2 is 32 commits of pure fixes -- but it means this must not
be backported unchanged, and each branch's series needs checking on its own=
.
For the avoidance of doubt it is not a development-series effect either:
util-linux has no development/stable version split, and pre-release work
goes to -rc tags.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index 460b996403..c22b599f1a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -22,3 +22,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v=
${MAJOR_VERSION}/util-lin
 SRC_URI[sha256sum] =3D "03a05d3adf9602ef128f2da05b84b3205ce60c351e5737c037=
0f74000679ce8a"
=20
 CVE_PRODUCT =3D "util-linux"
+
+# util-linux publishes bugfix/security-only point releases on its
+# stable/v<major.minor> branches.
+inherit upstream-stable-release-point

