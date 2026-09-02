Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2CEC624DE
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9249.1788343181261436202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=I1LbYs3e;
 spf=pass (domain: ericsson.com, ip: 40.107.159.21, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBr7X3UGR+U7bKPpXevYBymGRMH+fd7IJtCYzNf6f8IX/IsxCxF0eejvq/saMzol3F+GWs1VbgcEk3dAV1PX+QoiWIMnFcax2tw7AXHQuHBEjjZnAmxKqnTG2+8+vHxHzMZYq/3xSJOpfGzIoRS6qPnEGBEOaedw9VZ9Q44sZgUenoNBfjXHZcQLJxf1rx2P8BCOipwIvDf1ePCrZCVW7CIjQAggw6CJiycgYCsN+iX8IKA3rHOoIBT+ObZduPVCN5KG1sQGtxNmtQU21w6KaSpbLp/nosm0LN3VMFvRUEcUWzskhq10dn6BBsSrnAS30ozsbsvVRgmanFTue4CmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5zW1EK/Hnyk+w2bNQYLHEwYEKIqlaCbdYbpZIGqqVs=;
 b=aIa0Ne9ftEiBsm1d9SBnPOyNLUXzBdEHNUpVe0KvcdfoN8GSjcKGA3Mj8w3rPxAgfovNhMbd8E38qJytjnPCnFGlwqUEWUpnHxB+i2HzEyLOvk3PctaYBpfH6h2ivFCh6IE0IiiXwdUwKB6t9XYWVBYf8PRKGddNv6rgxFIKgxBZO3WHf7Sq0AcF8IzB8OVFcV4mlwLS1QgWPA1QwbJMKkzt6BO4UZW496FklgEoHgD1dHCa8KVt+Qh5YHTt4X6y9JigoYdRxzDWGTYILc7HBm8bEh5CTaccPfT8diJD/gvOo2UHZatThVoUXs9e/aqbhERIZtBu8oFSO+ke08sOIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5zW1EK/Hnyk+w2bNQYLHEwYEKIqlaCbdYbpZIGqqVs=;
 b=I1LbYs3e+ezCHiu+lQNgNa4ef/KlitVCiMlzy7HOGBlpb4m46jSgSr3NHA8ldM2Uo9Wc3ytb6Ej2o4PnYYFo43l/kz1u8FvL8DgIwepWDldxukqYKdwKrTl7UR9SJc2zOBZL73ZySteijh3nPZ8FUW68TAlVCZhXgJkuqF3TukqMbLoAGwqTHMdTCrrilqAjMUUEFaN6+gx0sL+IbbcWpeyHuVzlFZHKgGYWgCnhVt9fIjKfrUM+V4UCe5mR1j79YpGh7LM5CSP1DuMKstxo4TWxkHKMOleWazx6fK2uWxzphVbj4H51l7OtswrXeMR9t92zMue7fawxNFTu+39cnw==
Received: from AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::24)
 by AMDPR07MB11479.eurprd07.prod.outlook.com (2603:10a6:20b:73b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:36 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:208:17c:cafe::41) by AM0PR10CA0014.outlook.office365.com
 (2603:10a6:208:17c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Wed, 2
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
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:34 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 77EA84020B43;
	Wed,  2 Sep 2026 11:59:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 901D770044DC; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 20/20] lttng-modules: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:20 +0200
Message-ID: <20260902095920.2840293-21-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|AMDPR07MB11479:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0973dc-5e6b-41d6-621c-08df08d8e585
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|10067099003|6133799003|56012099006|18002099003|22082099003|12006099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	NT0nU0WR1S4VysdCyOE5B/DRM2SXNlQGVDt05nV0gmH8kWh+8qWAW6jipCsVALcCZeEGKDxovw/ReeSCCUVGsCj4uYxb1sAanez1qpoyTuiE4yeRkdXKD4ANBiTMIZt8t5cvmQfFGg03zJDUJmUCwigvZkImnj5nPr3nLPHWy7vDRc6Mh3xm2pN8xhCgszffs4NBg9MI57Xhczafe5rXzU0//x955dHAZl+LBlOWEMfjb5H4dgiR23h079IptrO4KkAIrE/SEr+J5yJp58SZ3IUWifPOyx76LrcNsLgDdHZDR0fXCwsHp6E0hOejCkE6Vnl07xc2JSCNbqI8yaKqLuQZXWl5te9V+dpysPy8GscBBcEUG6yqZ0jrFE1VX4sBZ03RzIzeZWa0xSIoiERHpkX9HIb9UXPI2dPvzPhn1+qOkWEiapH+/uY/r7JvW97KMGEBzp3X0DK7yLjvBXVjqpBvh01dezZ/yuBa6gLtlPs7l9Kcjmc5+tCxEVmGU1OmSCj0ls9u2tbUO64auu0edf1fDuirlP4JKJueaTvH9nRzyQ4qMx+4VctDE7qMGTWBKSsaZ8mPE44z1voqs3OLZ+5ZEtLN/IXvMAkbladQNXXnqVtxMORrsI199pVuiDeJJzmUhDEvrzQy8q8zh7FLzsVeFnj3Rr7EooOspRU6N0s=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(12006099003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wdgHEdcxVmyYTCjG0pKZkPIY5twOlVd/mjYPrGFiI6b4yQT9lBhD+Ncha1zPjfUMp9xYMfbA8NB2pLHMqGaHoBf/vkgwtxRwG7xocAqV+lrcmuaVXGrwIfLCCZE7ySqdZaiRSzuZra8ddRfdtOdaxCo5cx+i2aXYCA2trRw6kmXF1nWzgOIjq7A0P+LGbqbPSiJQABWhgcL9Cb81EuKqFaII1GsRUhUDJDmV7F2twcVOv0ulwSARQC1ldjFNbI03058KgsTy2ijLRkgluVb5zMQa3xGK25auUz2KCkOtsGQyzAkkPeyEYnQm4pZMGcjXBPxruFZKoAHiFVp0f8mBZNKWjpuH9u44SyEa7JW2nQ5jMn0YOlGMxyhwRKSX+O9C+9/9DH+SZ/j5hC2DUe1XY4hIIi5s7sw/hk7p4GnhVITpVrCb271JH5A7zL3CvT9N
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:36.5731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0973dc-5e6b-41d6-621c-08df08d8e585
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR07MB11479
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244920

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted for wrynose: applied to lttng-modules_2.14.4.bb (upstream: lttng-mo=
dules_2.15.2.bb).
(cherry picked from commit d4666244a51c7fb8fa7e66c11d91692197c89ce7)
---
 meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb b/meta/recip=
es-kernel/lttng/lttng-modules_2.14.4.bb
index b2c697d365..d0983f58cb 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
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

