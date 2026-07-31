Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4F8C55174
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 12:25:56 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5301.1785500747864041096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 05:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=Lb/soQhG;
 spf=pass (domain: ericsson.com, ip: 40.107.162.68, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REj6oYKbpvgq8wONXluSwUXRgko6y6DjN1To9LWGzJwlZzQN7wzAe72CDbwjyc7emKX5oKw8+Dgqd9QhOj6E8eLoBDUo1wk5NFCovB6uuvQ49iSo3wyVdgYIN5pPAZSHz5KQ7PMrqYkf69S6Mho9tEpXV3tTr/QQ30YvKZUTzM+TRCHtH6H34jhyPVl55j+mrSE6nswi4+38se8giUjW/xEj7EAIpSm22ycKNE7ZkbvVS8rR6JJj/Y5R5OVkTiA5Sn77rOVTIMR6aKdRgv3XQyZ/FgY8vfalavhY/sGZ/7HXYDKTMgnRu0zS7VCZNNQ6zwWIYHivWn/za1cBctccDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exNhqBMp8U7MX6wLy14/8fcGiKSzMhjdG5UpSBDHLRY=;
 b=QmwKU4BmJZ4GvCv4qD3HnllxMcGXO2vjszkUkkXSdPefpan/UVZktxgFH/ql53B7x/RKU2a6oUL210pQlbsXXyIvNcRBuT6PG4Ztt+P6Rw2EDg5gpijN/fGk/R3bCsNphxoz3/Cprg1ROStAUcQLrJnAgPLbRY1RYJl0YYRaYTJOq87XupvE6OhRvs6fxswyRiyBW2R3PHcUL0M6WQw8RkxPV33z5JvNBG6jNNdG0ff9fm1zyvViH2lvl96ObES+EHlRWDAauXN3HrziDs2ws5kOaQ0LXUZlRo8ZT5vLByvOaUNUtfLQ02buRLZgodWGGihke8W5S4D6KQIpk0siKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exNhqBMp8U7MX6wLy14/8fcGiKSzMhjdG5UpSBDHLRY=;
 b=Lb/soQhGtU68xF9EMBFeifGKeM3uXHbmIuU2Hn8dP1g4a/BnMIs13PV1FLj1ulUQnlWKOchelAQvCGTZhAF8gqVZoKgEj4PWKqrwV1pKrrYM+15pL6xMw/BVTkGvVY/c+vyBxaiNWv7Z9T8pbbipGZQWs81GLwaqQh2YxzaDw0vW881VrUN3JZoX5gJJk2xcgPHqn90PHr4Yfw9NLvHUaS9F+1AoHnr2Fmqa3p45OMWdqFVyEHWJBxIcOyW5qWG/nLREyZqGmOj8erg6Dx+I3miLKzKShLWfKEMyQyFRq8EBxEpA3ws92n3SYCdh44egEvCIH/TWnMzt5XQi5zI8lQ==
Received: from DUZPR01CA0254.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::26) by GV2PR07MB9108.eurprd07.prod.outlook.com
 (2603:10a6:150:b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 12:25:41 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::64) by DUZPR01CA0254.outlook.office365.com
 (2603:10a6:10:4b5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 12:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 31 Jul 2026 12:25:40 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 31 Jul 2026 14:25:40 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 8AD7C99674;
	Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 526EC700DF4C; Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 3/7] glib-2.0: inherit upstream-stable-release-point
Date: Fri, 31 Jul 2026 14:25:18 +0200
Message-ID: <20260731122522.1647968-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731122522.1647968-1-daniel.turull@ericsson.com>
References: <20260731122522.1647968-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|GV2PR07MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: e3fb2497-a357-4ca3-f7bf-08deeefed5a2
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|13003099007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	VaTlwLfDvK6RLGE/XdqG0zgOyjZy+FG8pY1BE0hFdBFgxkPKQaFQt52JtwE6p9XPr7+6SEPiBVsYPCh8El5avXTn+LSduu1yZ21DjwsqE4X0x53MksVZPnVeJ1J3gbaiVz+JSXdMASn9axliECT2aeXG/OzDBsz/qcPPHsfbPyxdZG8sL2y05UiWYaoglek5O4btV+1MGS65mAp11gVzFLuWJK0pFrfq8azeVu7xKB3ovxlgW1p5FqfN8taGbUztOeq6BhPOI2M5PArj3h8Ozn9+q7G6wKkHoq9Zc8u/8xJDpoCqyU2uPd1YmW+QkAeP7V/AeWd6kSX4/LHfmbnkY/1jR45wOBlw2cx0KfzoaWOwwxs10VHb+/9uK0jPN3s1fPGJf7O/M7fJmZFNXP8j/9Pz9OUtJhYylQ9uNoHo7Z8WIJb+1/05kkcJGvYbynHpn3HaeqKpx7Rk+0sqPc2IexYxtqbsYSsikRR2A0gmVQ0jWJ5yE8oLtbLHza0SBBomK6jph6MCar29r1A0lKoXysCB+7pSqx/7FXXIvvmnlWMw8DX1v+WFqZj8yFwFSkuVkqZOBjYs8VmhQjxh8ot5XNrJR4MyDinzNfPPNnvYG9m3k00Ytzb4u50FCLd1PcGe36erEzSloCEV6oiHflC+GK+1cwC3EnzvWIIALI4CyeU=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(13003099007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FqfUwV48CpbV+0BfKG2ceUKvRffYuowUnZ78mAdLqhOeHS8tep1PhgpUysTWtTKT8XTcBHRTj6sUzqp/YcrsEK6SUmJJIIN05+fUdslvXzrCALPs4Zc3WMMo3SmptxgV6A4oOs9AVFDMkBhIsxiSctoYlDz3F2JxO9BGeeFPidXT+BVYbbjk0c3460IDXG4xdrFIweNargkd07mPymHny4RxdUfq6dgg1gUPaASoUXfZqthPaf1O9GFt6ruiO9aY2b3EorQHOvO2B2WLXIf7s9OOHdWJ/seG7vYJ2TJm7JdsVVtrOL4pZEJZKKeehuo6EOeAZLa+fwD9lfWxLLsqGmW1HqZREIPr/c3cnMBrk0iBDMpruGJJY4jaBESk1Jui+zuJBsxPX6P3O7nqozxpczSSNPO9WK2BphAK8RW8AtrRU3hSU3nte9SSPbbT1gQv
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 12:25:40.5661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fb2497-a357-4ca3-f7bf-08deeefed5a2
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB9108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242439

From: Daniel Turull <daniel.turull@ericsson.com>

GLib's docs/backports.md states that only bug and documentation fixes are
backported to the current stable branch, that new features and API/ABI
changes must not be, and that micro stable releases are intended as
drop-in replacements. So upgrades within a major.minor are stable point
upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.2/docs/backports.md#L18

Checked the last two point releases for feature creep:

  2.88.2 (Jun 25 2026): entirely "Bugs fixed" backports plus translation
  updates.
  2.88.1 (May 02 2026): seven fixes -- a GCC 16 miscompilation, a GRegex
  out-of-bounds read with security impact, and five further out-of-bounds
  reads. No API or behaviour changes.

The series opened with 2.88.0 (Mar 16 2026), which must stay outside the
regex as the feature-level release.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 2.72.0 -> 2.72.3,
scarthgap 2.78.4 -> 2.78.6, and wrynose 2.88.0 -> 2.88.2.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index fafb7e3391..200ae3dc32 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -30,7 +30,9 @@ LEAD_SONAME =3D "libglib-2.0.*"
=20
 GNOMEBN =3D "glib"
=20
-inherit gettext gi-docgen gnomebase ptest-gnome upstream-version-is-even b=
ash-completion gio-module-cache manpages gobject-introspection-data
+# GLib publishes bugfix/security-only micro releases on its stable
+# (even-minor) series.
+inherit gettext gi-docgen gnomebase ptest-gnome upstream-version-is-even b=
ash-completion gio-module-cache manpages gobject-introspection-data upstrea=
m-stable-release-point
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20

