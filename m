Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B62DC5CFD9
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:19:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50454.1786439958867811338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 02:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=mcfnOl85;
 spf=pass (domain: ericsson.com, ip: 52.101.84.3, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilVQ1IOKccZo2f1wwbJmyLgU1pEqWkEm5NahSGO7I4v82/EtPEmb8sXiElLgfgvbbyGdWkQ/kD9MYqjPSycUZejEjPqcLsapGCAbZJX4Y4J3gmG1G41xc8T8GWqL9Ej2q5IkdTvMDl4qbR+oUITtOQAIhxKPhjogoK2pYL3BM14GkIkCk4HQmWE3DdQTCy7VUoCbEkBTzPVubUTqVB75mBGJSAzC8tLQOi791wDNEFlmVGhJzowKQegpOfUsHQBQwLSKO3LMJeBeC9fZyzn408UjxQ8B97rkFobLF/lsxjyPlegZfp76OX5NITDzKocTbjqgAoO4u/Rur+rbWpCUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmsRBq3l8DoCapawZAD50XBmPv3/QdhYVFdP+dOekt8=;
 b=qTlYeVaUKIXayIuprYXo0xKP4VBe95qWTxShk1Kszojwr2qR427n/ZXcDPl7/LJfMNcPMjtgIPYurhZ8IWGExRvxAZHp826ojLDuqD/vb1MkrtjRQ0WByussDEfJsGe58KEnI5bexrvx85guvdVsKUeCkzp9/W9+3fEwarNZMNRc6yv9R540xeGUqkpCJZUbtSv7KQzNm6LKw2j0X+4bC9koafXe7rtgqe0Ge9Y6R18ObFB+ifTwKb/rEgrcDpH/rm7FrAb49MatNzbQS7cZBQidw7wgKALdE9maraHUSEi3FtQ0/nSFLF2lf9Pdl4E/VymzgX38yt9rsqadyhZ7WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmsRBq3l8DoCapawZAD50XBmPv3/QdhYVFdP+dOekt8=;
 b=mcfnOl85plATqDjDaM74TglW1cCCDlwdFS1dcdJfYPfehDFv2S8a/aIQvCtXW2H7v5yjuDgMvcmxK6MAKl6BktrwhNQBuU0EuyXJqzkYLKxg8EohojpkVEz732+dNRSL/QEnaj0a72FUK5gDvtbU4/noLV4D7JIB29Hawe5aOIN2G0rmccylc/DKrrrzpecMhONA83Jgr2D3K1kWV8pcPU7gvYOCj2+Q4FkEWPDVcklLBk4DF08taOPhh+sRqDCPDxsT03Je9lr/U0bNoQPffzMlPWJDiPNAH1TvFpOzODC+eEA6WX/pbNQL6WglkUVfXXlSH0bm6ee4GWjLwyxcKA==
Received: from AS4P191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::11)
 by DU0PR07MB8762.eurprd07.prod.outlook.com (2603:10a6:10:319::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 09:19:12 +0000
Received: from AMS1EPF0000008E.eurprd05.prod.outlook.com
 (2603:10a6:20b:657:cafe::3d) by AS4P191CA0035.outlook.office365.com
 (2603:10a6:20b:657::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 09:19:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF0000008E.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 09:19:12 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 11 Aug 2026 11:19:11 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id DD9C84020C92;
	Tue, 11 Aug 2026 11:18:54 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 999CE700DF4B; Tue, 11 Aug 2026 11:18:54 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 2/2] babeltrace2: inherit upstream-stable-release-point
Date: Tue, 11 Aug 2026 11:18:43 +0200
Message-ID: <20260811091843.3420858-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260811091843.3420858-1-daniel.turull@ericsson.com>
References: <20260811091843.3420858-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008E:EE_|DU0PR07MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: 912e56ae-7477-423b-4244-08def7899b87
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|18002099003|22082099003|56012099006|11063799006|3023799007|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	veaXk3CqCvcjlxvp6HydIyk+pekFxjcXBAMqH5exH2CwFRfDmkCo2gMFAPvCw2Cz4dVpuqHOHTdvaWz+etkzwihqW3KFtXQNiub0616CfxtgJ/No4efIRclvycVNlNcKILY6IoMfn+sEB0K2bq3o8EYEqPWCTBCY3JGjjZTyRJFE9+J771U2FlpbpTJbbSfXIDNAtHhfJO+zKYPfYFoolhytjz3vpghck2dcQw/HYRNYdS0S/P9uZdcOxLP1fvQI8rncynAaw/NxlEmUdb0KcyiW+Hc+KYF0r0qiiIs729iCFwBD+d+gKE8zLgFUL+QYpCBfJ27HOHoCW0r6Bxzg4JN9wVUHm/z+/6GrBmgNifxU+bYTlljgW6GkPYUCTqUGrcrP24Vr9GWMjK3tIz01ZVE9wSOQaFdhP+NQi17ynlMdof3zHXJQkGlfxWF2sV/C4VdC3YDguA3YVOhOndkuGJNj6TFvhrcg2UWPbGBZGMx5iGF84yMMD5GLaVwVMMggjk9SO34nB1zgrRdu8SiTcRrHCaWzmlq0IGoBnj9/MYBBaAFoALxQs9EjSAUCdVvp8YbIbToKH5J6Rg1MOAhakFQqF3AgvtzK9DLnDyJnhIoPFLeOT9y5WyGRO1bAJ99qgUMT2IDYWm6IxcZTjtDvMiN24EExmtxXuoRhqQQ8dq8o4t7t1Bal9LVG0jlIaT/0d0gLIZ3TcyzNB0WoVjiM5g==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LGDNwpb2nkXjG0j6PE+AqqXMnWYQWZgbLBUX3XJe5uHM5F+j/OI1AmItin/GOUILirvKzek4HMHyge6BiSpcXR0//N4MPyKNbvQLy4oHZEMq1WtBQFJnDltWSZYY8nQbTKOd5A/RYLFFvVLecO8gx/sZo/YPk38xxEFZjQjuchcjXOrF/Q39quo1RO+qtG5xHvDfCiGiVZLz+RHUTHaSAJi1yJSzoZ465baJ4WJ41lqsVAyAWf5BXmmn9I4/dFUgJ6EXNWnu2hpxLJnpR23oU8BhZrAIljZxNz7jr4bV+ixNNI0nG3ELh4rMuxTlli7dRYimWkIzQ8GA3HMMTCp/Uxybh/vTd3Za2Cc2fPO8WeWPfISwPuSB+CFMpyDa1nbVBj6hOYvyt4MrIJmO7VbQNN/KeIeHSZaTTcJ4Giw0tv5qkT8VKwcYpzDSicxKmOuC
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:19:12.4506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 912e56ae-7477-423b-4244-08def7899b87
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8762
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 09:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243176

From: Daniel Turull <daniel.turull@ericsson.com>

babeltrace2 maintains a branch per minor series (stable-2.0, stable-2.1)
and keeps the older one alive: 2.0.7 and 2.1.2 were released the same day
in July 2025, with 2.1.1 already out since April. So upgrades within a
major.minor are stable point upgrades per the OE-Core stable release
policy (ref-manual, "Stable Point Release Upgrades"). There is no written
policy document, so qualification rests on that branch structure and the
release contents below.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/efficios/babeltrace/tree/stable-2.1

Upstream keeps a ChangeLog with a per-release entry list. Both point
releases in the current series are fixes, tests and documentation: 2.1.2
(Jul 22 2025) is 13 commits, and 2.1.1 (Apr 14 2025) 10.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone took 2.0.4 -> 2.0.5 and scarthgap
2.0.5 -> 2.0.6. wrynose has taken none and sits at 2.1.2.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb b/meta/recipes-=
kernel/lttng/babeltrace2_2.1.2.bb
index 7c151bf729..993438da3a 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
@@ -19,7 +19,9 @@ SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=
=3Dstable-2.1;protocol=3Dhttp
 SRCREV =3D "d0e946a71faf5f0c2d7f1fb5b92a369983e9cf10"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>2(\.\d+)+)$"
=20
-inherit autotools pkgconfig ptest setuptools3-base
+# babeltrace2 publishes bugfix/security-only releases on its per-minor
+# stable-X.Y branches.
+inherit autotools pkgconfig ptest setuptools3-base upstream-stable-release=
-point
=20
 EXTRA_OECONF =3D "--disable-debug-info --disable-Werror --enable-python-pl=
ugins --enable-python-bindings"
=20

