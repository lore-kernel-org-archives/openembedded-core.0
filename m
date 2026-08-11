Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA53C5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 11:21:37 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51955.1786447286741177648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 04:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=TV9tAAsO;
 spf=pass (domain: ericsson.com, ip: 52.101.83.30, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOU7Z7eZqk+zcV1UFN8JuoCwZbKcaf/OiIxqWVNSENlXH6nB0pY60Qdowg1XccapQ+ri2+dn8cn58pvj6fRM3JI67T1SxTHX9SfLV3Y5OWofbkKuSzQvkchPXX2Yh/oVb+7Dexk7/7ETeBAPw7exQ99F5eyKDpYy2MEPNcVYkhhfjFVEbagTgjNr9mm3JQDRjMVCL70exNVwJCV1dxOwyOH6jqNNF0M1iJh4JfnIllEubnt74wbace5a1Nzm4E7GVk0dz+FmpvYtlZpmKRESRtVRw4kqeTiRB74bE2CmB+ed8lR2isLzmQc7qPRyM8rg+xUBxat3WIsn2H9jOe6XTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Zwo0NZ4Cvo20jbxgXz7xQQYbey1WaPC6gb+1z5PRxY=;
 b=kSyhhnkJN+ZL4q6CuDp6ihMcCMKSQYELjiqA4OmNNyW3++vaPC4LvTCYnqiGFkrnbtKw9GFzMMxkymxKbEcaDts1/9sUey4raHjbLBOFmTn2n2AsStSowR8KcbIN6aEf549x4FZoG5wYpNxnhizXhY8CCBig3PtVZIS5M/r0OnRBmNhn+/8VtU5VeicCAmNuoKX2CHPoyDjtlr9i/su2tVD4RvYEti/txJR8+u33ua+i1BKYU4Xvm+Nd3rSkfejYSerMgljbv0mdi9N+1A1d8vcEd71bWQf9mOtQEVVMmuUWyd3OnTxg9uuezw25PclOSzqoNsLpk7E2V9bwkPnNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Zwo0NZ4Cvo20jbxgXz7xQQYbey1WaPC6gb+1z5PRxY=;
 b=TV9tAAsOiy7uaaY8vFQQZw48utgyxBWAbbiLWxiWwuHlhGyOxXY/v4LrjBabeBIJKUna+2IS0t3EtWAko/8FDJnSQli8/F0/30FT/gafN7dlkvKdR/wMY1XCK9vdvZwKA4ktaYzy0sG4eB2KOGkZsV/jLTx9yKbQOV5NYoPhLsCnODPM45ByqxOzmYmUK0QlUGhWcvAWCL5Q1BbQJ155PGEXHUA8mPpmLNAvroFzYkyB/5WQo9swE0Nm6+Ic7mgwlqm0JPyiXfHWUDuTE3/2XZP2UmKnyc2NZCUkK5ecBkgi4zv4qbnZ0hNtbCwCQYmjA5bVgM68NVyY+c2AnKpVfg==
Received: from AM0PR02CA0143.eurprd02.prod.outlook.com (2603:10a6:20b:28d::10)
 by PAWPR07MB9832.eurprd07.prod.outlook.com (2603:10a6:102:387::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:21:19 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::ae) by AM0PR02CA0143.outlook.office365.com
 (2603:10a6:20b:28d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 11:21:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 11:21:19 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 11 Aug 2026 13:21:19 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id A3039957C5;
	Tue, 11 Aug 2026 13:21:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 697D1700DBB0; Tue, 11 Aug 2026 13:21:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH] lttng-modules: inherit upstream-stable-release-point
Date: Tue, 11 Aug 2026 13:21:04 +0200
Message-ID: <20260811112104.3470671-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A796:EE_|PAWPR07MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ae5b5b-1768-48d8-7566-08def79aaaee
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|12006099003|18002099003|56012099006|11063799006|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ewUKA/aoU4J0r7Kl/QqR0eaui6EolpWLZvu6qIKR2wMMNvcpFY8mi2Y9rBJ/XDCbVAAmtiY8exZITMu0i3vjns9x350oqv5AcOQUCot9jAMR9uLhI7mS8VtsQFvrLCMNVauA1UbIvkss3mKgIOc0NgrzfxFWClvt+zQHg6zvjjsgkebTJZ+Ugfj5yuvcW51boFSGhBLTEsVYnqrZTL1DOdx0fdOYtNO6eVc4sMQzCzg0PS0eZ5M5Mav9PDlkaxuUb/A/JWncqlueH0DaFk+1N+U4SCGMcU5soyv5iE2N/II/h9Z0Eu8bDGQTJVwdGkoZSJrhXfrvE45r1XL//Z+iYEsHS0A9dCqKkoFghwKj9Ov782UHmELlQnLCGp2FCsBSbIzhfLSXkZKJ+wYNeiHIVvlm05vO+FKvOI2GG3DZqqo3C4OnHGTcsn9rGcDczBlw5Xrdsk0ftUJ39x6sJMFvNV8RfenSQM3POWMYexa+TRQ0gv/EFu4Mppl/EOaqhDSDkVCmqRqWh9XSnnBCivkKmPN8p1u77qmZqcsNJMd2pAWUUnirCQt4tcWMAEppP/OCwCitNn6OWM30hDCYC1WGpB4aDiooIRbfGlIA1MNnMDesIlBkOKyodwb8hpFNdb2QxLoftYVUVEtYcDdwdU8JZG5fOvGm4iTDlaTYhrRPrGE=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(12006099003)(18002099003)(56012099006)(11063799006)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QpCEFCT/P4HaYZIn2An9jtMpwe8FvVfU5tDbtEISKJY/Fd8TKpU8d42r5E9pyRuAyyYyUfvd0OuGBmzZyPucfczz6VhuTfKoJCwDANMg07xoFinUJTnWBVYLFjHsZ3ZGVEd89YMz8M8u2APbCYpmCJC2yG1fOOQOz/LUcYvUT7CFapjFDpkBf+JJTdWo1qGe49kXDq09/e0PI+Bh23YQKalNr/xE4pPwN0mD0B99NW0NBV2IJJzndcWZD1dbgtzXabZ8WtKPM1SfMgvqHuLPrqGECO1T5KaTh4yLsATvrrNxUFvKAxIv97f8cii8AUPRK/GkMd9RkEbjzma3uW4T7ugSPuD4sbYseKEHFbMQ6N+1iaajAmfMO8buSYxnxkPHmy8IBL0wzQKBTOGuR6vby1uCBUQ/0ETYG2wwfP9UtAkSQA5KaBo67os2Up9NkbDa
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:21:19.7331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ae5b5b-1768-48d8-7566-08def79aaaee
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9832
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 11:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243193

From: Daniel Turull <daniel.turull@ericsson.com>

The LTTng project documents its stable-branch policy in README.md,
"Supported versions" at L171: fixes are backported to the last stable
version unless they would break the ABI or API, and security fixes to the
last two. So upgrades within a major.minor are stable point upgrades per
the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/lttng/lttng-modules/blob/v2.15.2/README.md#supported-v=
ersions
  https://github.com/lttng/lttng-modules/tree/stable-2.15

This recipe's policy differs from the rest of the project in one respect
worth stating. Where lttng-ust and lttng-tools do not backport new
features at all, L185 says kernel-version enablement is backported to the
last stable version. That is the only non-fix content a point release
carries, and for a kernel tracer it keeps existing probes working against
newer kernels rather than adding anything a user can call: no new options,
no new API, no changed defaults. Upstream labels these entries "fix:"
alongside the rest.

Six branches are maintained in parallel, stable-2.11 through stable-2.16,
and released from together: 2.14.6 and 2.15.2 the same day in June 2026,
2.14.5 and 2.15.1 in April, seven such days in the last two years.

The ChangeLog entries for the current series are fixes throughout. 2.15.2
(Jun 19 2026) is 13 entries: a leaked file and fd on channel create error,
plus twelve probe adjustments tracking kernel changes to ext4, btrfs, vfs,
vmscan and hrtimer tracepoints. 2.15.1 (Apr 24 2026) is three, covering
kallsyms on powerpc64 with ABI V1, a snd_soc_dapm_context move and a btrfs
probe range.

This recipe must share its minor version with lttng-ust and lttng-tools:
lttng-tools README.adoc L123 states it supports the kernel and user space
tracers "sharing the same _minor_ version", and that cross-version
combinations are untested. Pinning the regex to the minor is what keeps
that guarantee, permitting 2.15.x -> 2.15.y and excluding the 2.15 -> 2.16
bump that would need the three coordinated. Within a series they have
never moved together on any branch: taking modules, tools and ust in turn,
kirkstone ships 2.13.14, 2.13.9 and 2.13.6; scarthgap 2.13.12, 2.13.13 and
2.13.10; wrynose 2.14.4, 2.14.1 and 2.14.0. The minor agrees in every row
and the patch in none, and scarthgap has lttng-tools ahead of this recipe
rather than behind. There is no build dependency between them either.

Already tracked this way on the OE stable branches, and more thoroughly
than most: counting only bumps since each branch forked, kirkstone took
2.13.4 -> 2.13.5 -> 2.13.7 -> 2.13.8 -> 2.13.9 -> 2.13.14, scarthgap
2.13.9 -> 2.13.10 -> 2.13.11 -> 2.13.12, and wrynose 2.14.0 through
2.14.4. Each also carries local "fix build for kernel N" patches between
those bumps, which is the burden that staying current within a series
reduces.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb b/meta/recip=
es-kernel/lttng/lttng-modules_2.15.2.bb
index 49f2bc8eb2..bfa1fc619a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
@@ -7,6 +7,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D018e002dbdda330=
6682e394ddd65fa32"
=20
 inherit module
=20
+# lttng-modules publishes bugfix/security-only releases on its per-minor
+# stable-X.Y branches. Point releases also carry kernel-version enablement=
,
+# which keeps existing probes working against newer kernels rather than ad=
ding
+# user-visible functionality.
+inherit upstream-stable-release-point
+
 include lttng-platforms.inc
=20
 SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \

