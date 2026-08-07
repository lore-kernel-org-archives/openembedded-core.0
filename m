Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87010C5AC81
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 12:16:04 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41241.1786104957385591539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 05:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=mKBUQY0K;
 spf=pass (domain: ericsson.com, ip: 52.101.83.27, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBWzbROnPtLdZFqajVZuNQPZu6RyZUEd/s2ZHUsrYYfwEsJL1rgrIM7yDTxEsOvFGcYEOr8J4u36e/Z8OOVFOYqen1N7T+pLGn+Iu8QpqmuuXUnHzyuFMFt/IaEgK3ge3ywVl2DEg+EhfNGlfOWHivBQvDawT++LyLZEpcsOxWyOsr7G5xYIKJGO76+/DwKt4rnckGHODaLC0nN3+ODjiMGUvTxq9uVcMii7hhkvuiGwaGoT1z+2ONhPwmwBvmc1mswEBkfPfXcHCTsLQoGA+3IaIYgMfAi10qz2NgJdVrteTMAlIpTIg3fRGNV2KJrZmRQq7CYvaYiFKjnpGWFvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JELxoZ0n3axY4rghW6Z5HTnfraFA35qoGH3+qOKkknw=;
 b=Yc+Mb2P/DhQDM3aeV+bYHu5b4gckdO5yJHcqhLvu8f7hPpN+9L4fOSNZFuYisbDRmMWK/tJ1SSaHb+CtJmS8fR5foSEZBxBghGCXvMIIcKV4CAVxyg1UnDa8wuObFLfIHU4Akrsxga5Idm2h09UIhpNVbl7nSJZQ9Utem82NNCNDC90gF2vS/2KcQzsYIkAza1WQE6qUHXCCjYZGG3xmlayOTw9OJ3dAtwnTUV+jajNN/l33fq6RLzfGyJl5wY1xsric//zJIkwuqEjSF6EA4bJDZw1hjBT862eBiCf00NYDZLpKtW4X+kSRvsfRvjt8JgAC3jUtfzrp1hUTMiGAHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JELxoZ0n3axY4rghW6Z5HTnfraFA35qoGH3+qOKkknw=;
 b=mKBUQY0KyUoRaMqgTlaZbS/rZCLxIXO1uqMhhTw6yXs7L0KfFr/wynnorMIeL/YCBJRAp9FGhn+27RT3ohVjcCfyM1ySNQTwds09DmXt2XMtw/vMPAx95o43BKVhqsTPHpaEX0DhicglVHdeFnlTL0vGC94IoFvM+U8y0gru6QzcK0olmCZgx2RmNRLkd839FkDjQM2d+8VnKSi5qlL8h51Eq2mzs/AV5nTKe3BavwyMnBKOkB254jYfBlOFeUDFuUihiYid8Mz9EsJeGET+ij9TZ4gN1ub4iPG5qOu/uxIwA6lUsHXNCpvSaZ54hpWCHx/kM05OeO9JiucWt1P6Dw==
Received: from DUZPR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::14) by PA4PR07MB7199.eurprd07.prod.outlook.com
 (2603:10a6:102:d1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.10; Fri, 7 Aug
 2026 12:15:50 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::34) by DUZPR01CA0088.outlook.office365.com
 (2603:10a6:10:46a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 12:15:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 7 Aug 2026 12:15:49 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 7 Aug 2026 14:15:42 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 14CB36B97C;
	Fri,  7 Aug 2026 14:15:21 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 553DD700DBB0; Fri,  7 Aug 2026 14:15:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <paul@pbarker.dev>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2] util-linux: inherit upstream-stable-release-point
Date: Fri, 7 Aug 2026 14:14:33 +0200
Message-ID: <20260807121433.612928-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|PA4PR07MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd7c856-5bb8-46da-b795-08def47d9e4c
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|10067099003|13003099007|6133799003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	bVPW+4gIkqJq2TzXpgYOZSDo4kMCu8t9Y/A8KfdFzFtikSsn01w0MqGdqDxhW4ga0Wil8Di17DAR/5bWySAqUdCyOaYDj4z7m+C4qPmq7yUHMQBGHFj97DHiQhyXMfJYUIqs65ht1E91R6gbPoIUIW9csJUO9COZ7aAxdYO8J5OiF5r6LI7cnG6+3Jtc1wsGWSGMPLxroELeH9Iy3vSwXZWVkkQ0OJsGl1sn2Zcod4CefHHU/OOdRh3xIPjJ+qnxWaCybegJmmt92SHSUt3FPVglxF0oiaJqqW05QyIbD/6r2IXAQOPsP+/UNx2WTx5w0KMOOZmVtyr/CtuyuilJAdKyU1x85pDZQ2J93gN6HzXMoUZtyz9UqfRce1s6LQ7JRnvL8iGq7af77/n6CUJ+GmOPIskSgb4FXvyhLYkKWicfr6oQJvXMk7QCVuGdIVEFFqE/PEACQWEz4fDgjCiiAhQcJr6pRa6AAKmHuKfL6ya5D0ko2j5j4PiRvcSuM1AkZ9TncIy7DWkqgFDtfTLnUqrdQBaxpcWjzQvoEje3S3VObiaBhNtInRHVbV3p9US55sRLHQT3RO/vp1Exje9CpPVUdFSofVkeM+2OSHl2Kc/JRiYlLLkhnG2yF1BFoTyA310Va+9dV/sm9dchxR82vZcMgTi+WTLXv2iDuz26zrWT9pN04D25pS3kfvF+vjgRRL6PhC1SR8gp/7q+9AaVNQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(10067099003)(13003099007)(6133799003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bxtoaL+8hGjIOz9efny/RFJ4Nfcn6YkF9EeC2EidC/4w3F0kYvoRVBRrWIQnGuQZ8ecTKsdWEkNtagnBBHLosoq8OOv7yPU+b1JVDy1sQLSHCdMex3KtMpisJA7hnDWBKHONA9vWith9t7MRlG4WoEXm/jQJ0o3pJLAarV/jjBFXYI8h3t6aQMsjU6nSa5T/IUuNSjODqbGY7S15SsgLOpKcWOPilAW+pIkCinxzyn4hWpTAz81yh4ZqwibgZbteVRBRr0rcb4Ldp6cgX80ZxQIIhlRvU+GlHQoyvHDglebsHpGTJDyjgnmde7QCZqkJKV9qoiCHR3M5jQU6Qo/nI3ekpFCP+woBVreWOlJ/hUTwKg2yB50v7hCRQPqKzu4/8sSH46+RAkNfiWAVofgNctwPI6VrDhBeVVWCbpCJbF8oE6hO4g43Vz4HS8rQ/6Yu
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 12:15:49.6318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd7c856-5bb8-46da-b795-08def47d9e4c
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7199
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243010

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
---
 meta/recipes-core/util-linux/util-linux.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index 9713c8b882..ee9291fb4f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -24,3 +24,7 @@ SRC_URI[sha256sum] =3D "03a05d3adf9602ef128f2da05b84b3205=
ce60c351e5737c0370f740006
 CVE_PRODUCT =3D "util-linux"
=20
 CVE_STATUS[CVE-2026-3184] =3D "fixed-version: Fixed since 2.42"
+
+# util-linux publishes bugfix/security-only point releases on its
+# stable/v<major.minor> branches.
+inherit upstream-stable-release-point

