Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4FDC624DA
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9246.1788343180732398544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=Hhr8yBp4;
 spf=pass (domain: ericsson.com, ip: 52.101.84.9, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3/IOOmcEvJ0kX4RLYKTmsAUXT3AeKXEN8E3Ls3wrKsDyE5XOMPGeYHli2BOP68dOza4kIEe41UQ7Pa/FgI31NbBAUjF32jtjIopNbkkN+SIa0DI3VsqXaq4J00uf2qltV0f7aXXmc+6a5eMM/r6J85T4g6mmGoPvjqlqvFY3FKXDOYpPa8PwN9pQof++xwhfqKMyhRqdOhE9bDYRw50wkHJRVzLt6+DFxBg1aLEY2jPqpAcb/E1FSpP2/4crSev+AGZl6YKlWjK5/ZcoWg/jFRgqsZOLUepjRlYWo6rZcfEcmZYXkLf7z9+fPkw/bRl+TIIxyyOl3TUsPO7NjoXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17QHgRsRKOglEZidFokuXoP1vx2kLCcaq+U3+Ma2qN4=;
 b=iOP8g1p1wc1J6d+8PfXsrNv0EvUvfE/SMD0utO64dWQah8uSSToOYc2WhtiXlhJE741rhZp8EukYMbhCu7+mdr8z4iotL5tfGYWQFH4f7GSTwQhzf1uzj8H/V63m/Qh+Ah8mReqLgYwV/ezdLSSjjJCef+QMbMXXJ0YVuvST5Gmsm+wQHBDJqk4EDDTYGVq8PRkBfAzc2fxTrgJLHHVCPuzFMEIP93N52zSCJykGJUJY3lsRcULPxC8hQQ8mTAdnPbLaJaXdx4f2iKSnvva3pEABGI40R6Mv5qyJ7pjQv8OlkZhT8mQ2LyWHsG8fwnWwz0m7Bqes6GS35TVbhF0zbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17QHgRsRKOglEZidFokuXoP1vx2kLCcaq+U3+Ma2qN4=;
 b=Hhr8yBp4I1MYrscVdDISzrT0fgEVqstREnDm9mc8aeNHfCB5jJqw+DBoDMF3cqnDkQagsjD0ewasdJ2B88uzfZhr0Cea3QDijfAbdLUb+49fo31ntYfDhF8b+Vfnr36js1oyGI8LvBxVFjCTwTlK6RBlRn2uB9fNeyPU9cdo4+It6tzVa1FfZdTq38vxCa30Q6UytG5+Qyb777xmduZj9rAZZaBTLwTb3wFMRB+D9GaQgpy5ecRAwyMLgEoxHK+m7rBBj9b0BCGLEwRcTsuc7uiks/+iLJBX8LUE9qdfqICJXjKSsFQmwEwSlu39JrpVbqLBEgN6C0jNowJ7oVGeiQ==
Received: from AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::26)
 by FRZPR07MB12364.eurprd07.prod.outlook.com (2603:10a6:d10:1cb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:36 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:208:17c:cafe::3f) by AM0PR10CA0016.outlook.office365.com
 (2603:10a6:208:17c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 09:59:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:36 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 3D6CD95808;
	Wed,  2 Sep 2026 11:59:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 7A101700E7E1; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: [wrynose][PATCH 15/20] sqlite3: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:15 +0200
Message-ID: <20260902095920.2840293-16-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|FRZPR07MB12364:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b8de64-5e5b-47d3-404c-08df08d8e535
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|6133799003|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	tkAMBH93/tFtl6VQxt/RQP4PuFt57STJcxiTe6diktuegGa9X7wSB9QnWvEvr+Ht3fpIHce9VN0idp081ynFX+t6RwtdBU7SuuHdAqxRK0z6XMuY/lbhqlkOXCO0gE2hNBgq+e5rqqYuALh7Sce9rMMqgIbI7SVj5LwFPXEDDhlzuEbxkYZSAkd+y6Ns5NaxGSbUmY5J6WlggArgZwRVr0QJ+P4FCbWEHw6rNXTxe6vxqFEWkOnq8AvcEvCoAumqojXylYKf8ildQIxBNeWhUS3i5TW36jaTgAqh+Y4fF6rwlPN9PDskY1pLwH6pkTHhIucwdSOujMKp3yQ4I5QJ+nWJe0QZmTnrNMJFeUTDYQ8hS42G3iBI5sZE/Au9aJnq0Ekw2H426/hjNXqWHKrUXpmqQIFkrm9Ya19PO2coEUXOodQLBkmGfGAsB5MuE7QIjv1ao46dCbQ2VyT8FeqzAhPO6rr7e08UxY9Jmix8rfwGTLt211vUmsN2DvBIFZGYbJFBVSyTYMSwmpMoGgXAQZ6kuPsTGHpZ4DunzWYxaTJndVQNLX79yQTDMNWV5Fv/aZka6nGkOg4o1q2axkCIL6AbSfxFYcV6TCnGb/IcCF39P3vewU16mTp6r6HcvXsLxRKDW5rN/dcietwAbnOSWg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0DUcaz0mGU2JCAV7APaS29tDL4nUnemcazQyogwBQVpIwJUJCR4J2p/WjkPXCywqR1z+wwXJYaIhSbiX7FVMbpslmpVQI3NVIMMyraQsh86Nwb3ghk8HfAg7GfsFi+pA8gcett1LYQwBcsmeNp4kjpJ+ICypx0LNHVNs4MXyuFyIpl41wF+0K2atUv33vT7micODuaZk4fMioqJMsMy9xv+Z1j1WxUF2To1CTW9vZAvRQh/1VhurOyAXECVpNu4eI4Uo2513QWW3o4mxUG3ElXp0PAFmidZHm0onmH/zpWolgqu5MZvbFA6NC7vhRX0qhDsa262VKZYTezGwBVcR6N3Ws8La+E3GEz/K7RJf6DI8iPgk9U5Rc4VenhckVVoQEJaNEzD0TRjgFQrXHCr1vmYSZ8SpF3VcIDHk8H7WLWm+6o/qvxe6ccYNMzyvJc2S
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:36.0511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b8de64-5e5b-47d3-404c-08df08d8e535
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR07MB12364
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244917

From: Daniel Turull <daniel.turull@ericsson.com>

SQLite cuts a per-minor maintenance branch for each release series,
branch-3.53 matching the current PV alongside branch-3.52, -3.51 and
-3.50, and tags patch releases off it. Superseded branches keep receiving
them: 3.44.5 and 3.42.1 were released in mid-2025, long after 3.50 was
current. So upgrades within a major.minor are stable point upgrades per
the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/sqlite/sqlite/tree/branch-3.53

Checked the whole current series. 3.53.1 (May 05 2026) through 3.53.4 (Jul
24 2026) are almost entirely memory-safety and corruption-handling fixes:
five out-of-bounds reads, two buffer overreads or overwrites, two integer
overflows, hot-journal rollback with a zeroed super-journal record, safer
double-to-int64 conversion, and mutex acquisition added to a batch of
sqlite3_* entry points. 3.53.0 (Apr 09 2026) opens the series and does add
API surface, confirming X.Y.0 bumps must stay outside the regex.

Two additive exceptions in 3.53.4, neither touching the core library ABI:
the SQLITE_SHELL_EDITION compile-time option for the CLI, and
sqlite3_intck_register() in the incremental integrity-check extension.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone 3.38.2 -> 3.38.3 -> 3.38.5 and
scarthgap 3.45.1 -> 3.45.3. wrynose is at 3.51.3 with no in-series bump
yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 22cd1dfc82049e47be5e73057c2f12cda036f352)
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support=
/sqlite/sqlite3.inc
index 94dbc38ec5..8791749dc8 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]=
*)+)\.html"
=20
 CVE_PRODUCT =3D "sqlite"
=20
-inherit pkgconfig siteinfo
+inherit pkgconfig siteinfo upstream-stable-release-point
=20
 # enable those which are enabled by default in configure
 PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext"

