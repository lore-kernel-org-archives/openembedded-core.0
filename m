Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707ACC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:19:56 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50827.1786439992280229713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 02:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=D+h12CPM;
 spf=pass (domain: ericsson.com, ip: 52.101.72.31, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/dS7Ps7AyPBroFALDgW8pcU0BfecEEcO3R7brZVATfOfCnI0BCI/X1YsWeQ88EVncLlpOlpC5/Ft/7pqXb9TrI1H8qGrR4gUcGzfS8uQ5ELwKLXAlGBlAfdI/BuzzPZFP2nLch9PG9nVybBkvfp89K4c9H/hyR7gj62sXH5fmTu9uj+jDVL/MyZNg2LkfWXsENFX2EBzIn1FuNWqbKzolg39v683ef3uoQnkbJFJAopWx6t+Th1ZokzwEEHsu93Luy7E86p2HbFSOqk6/k28r8SL3s3AidspYMFZj5zDpSYbynwyZS45HixZ4y8YPKWVyK9M3w95x3anrxA97Xstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k84lBmIfwEYXVv4AZSrpGp2E5xOgZUFhlF9WHQ6Au8I=;
 b=bpIgFVRcSXdJG6eujX3cLXKatnCVVCIO5YfM4b2zRCWaiuakeD2uWiBhEVFJ7SsaVxoWqSVtVSSsVPLtRIzpRo5kJWRoeimWs8RSh0jf6pek5PBh24z28q7x8Mdch1Py2GzK1aXxJMMGTHVwezXVlWk5cj/AeexKuuXx86OMUXCDNSP466pjhvy6y7E68U9WOJcn6S9yYw8dyFVKY2rzWNjQFyOd1/433uEcor0yPbDGf4eIYbx08Ecs74P4K6lbsj6RYAs9PEqnMRnX0IUFUiFbokKj4x/BmQLL/6+q7bMR5oL5pQM8icpsTM1/ZmqOSpmCo5eWpjuGOWsThwJ+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k84lBmIfwEYXVv4AZSrpGp2E5xOgZUFhlF9WHQ6Au8I=;
 b=D+h12CPMFVrH5eK71k5r/XBkbXFpQSQuwBYcfnFBZhAgiyWldFc7AqG8Pwr+aJslUYflevrxcSZ5bQUW1TedmkHNyg4ovmMXTgzf8FwrdXBNcXhX+l4pJ0w42K4kpJLfcAQA06URQTdAlb63A5MEF5/bH364KGOIL2U10tUurByyyDIZfCerbRb94zBMHy/+qjPv5DHDkNTMjOpzNOpluMjwADNMWlXD1Nl56JGL/nqEOvxjE3ZpEV7Y3kxEeQtEr/dC95RQQIbHXi1LwMI7aG63mYnEMsFtMrOt3Lw+OlzxqilLryqI7UMS9NRYHK0CkkDjtmp9p85XsZRpcGc6UQ==
Received: from DU2PR04CA0296.eurprd04.prod.outlook.com (2603:10a6:10:28c::31)
 by PAXPR07MB8340.eurprd07.prod.outlook.com (2603:10a6:102:223::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 09:19:47 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::aa) by DU2PR04CA0296.outlook.office365.com
 (2603:10a6:10:28c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 09:19:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 11 Aug 2026 09:19:47 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 11 Aug 2026 11:19:06 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id C773C4020F08;
	Tue, 11 Aug 2026 11:18:54 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 95533700DF49; Tue, 11 Aug 2026 11:18:54 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 1/2] lttng-ust: inherit upstream-stable-release-point
Date: Tue, 11 Aug 2026 11:18:42 +0200
Message-ID: <20260811091843.3420858-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260811091843.3420858-1-daniel.turull@ericsson.com>
References: <20260811091843.3420858-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F1:EE_|PAXPR07MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 921a19fc-376f-41b7-a824-08def789b027
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|13003099007|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9QICFcB+bg6+MSoJyhim2Nb1F45WKIDfSIbug2Vs7KTdZvENNW9z/RqkLhnUj5DeOUnvOHJm476UMwqoxEsPhcJv1apurdON0+XGoEhuzgAxD3kRayb44vVm246U/Dq59/9sUQf1oMFR8OCLRP+5/Bc6AND5TMAv/xDvGOOizqx4iX7OuZS5t9VvMyi7nGDSCv4tsVtdJHakPnVA3EwPVp6spHnHejbKR7sPzq6NTrVOBytyd/D5nb2ljCOtulTSAbkq60EnBfjfPA3jt0JVu9H8lqQlfqq87XKM2JyrsE88ffNi/GEt7ioUylFRK5tKZHXLySP9UMkPmhi+6tyHaZ6nlZg5NBrxCQTgFQtQ6wQueNC7poAr+lPgGvcJ39tAk5QgTfqtLF6oEIuFEKWcavoEbuEH1VfrRX0i+n1dTrAXYukqm3G9RsYirKXtLmECTHsfLW3zyqCLBDQBw9olMYz6M0pQpfHpLLGkzEip7KIkcD+D7HNE54NFpuNs4JgU7GAOHRD6nFtuIpQivO3k2Yoy7oNwZ+jrlSr05/tWNdB61GkoDxtCBPTJwsrDdBM4yfV1O7YBGYc56TVekf3dB5SmQr9U5Qxus2S5NXclY7u7gQrWzn8F00aS4649cqSXmJwwh4idPW5xCGqNuSxbMFC05X8+gVtzUY5obsK/llZeAk3bUuA3EtE6nz9qnjCSDKLY0+eY3ufKwzSkXGX3Zg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gFQi5KX/NLnIPe3ASd2RdxhIMkmcd4iNrv9tAI1f8+QmSuCbqaORsWf00gp6w690XF3xQDucJn1AMmOSim8EXRyNXybc4fZEE3WkCYmaC/sxKPm2lsa9th2OtJ8xzh5lCly0u7uTuhtJy1ruNu6+fhnlhO0tOOP4zqd9lguwb7nlnvL8JZ/XXKseE9X0/tYewlMW+Iz6rUD2D1XcKggrl+Sfvjfn5bbCM+c/+kfUcW/ds6ff7Sltz2CAh62Up/G9iZl/I3qgfB718h6wxP5ReqHyvpcX5aDeWz2t8jEF9TwuoM25Aa/zUYlo6ub0beKF0FFiZwt1a4Wh4MjB8x8o/8Xzd3A/yuFAL04EDFuTuBvUZdceeV6tT4mphkXSxes7wmYApcdmzVvEIvmuHT8Ca3F8foyd//K+6jNW1e8CW0+TRfkUrMS/xillIjdmdIGY
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:19:47.0328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921a19fc-376f-41b7-a824-08def789b027
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8340
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 09:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243177

From: Daniel Turull <daniel.turull@ericsson.com>

lttng-ust maintains a branch per minor series (stable-2.13 through
stable-2.16) and releases from several at once: 2.14.2 and 2.15.1 went out
the same day in May 2026, and three series together in February, 2.13.10,
2.14.1 and 2.15.0. So upgrades within a major.minor are stable point
upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
Release Upgrades"). There is no written policy document, so qualification
rests on that branch structure and the release contents below.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/lttng/lttng-ust/tree/stable-2.15

Upstream keeps a ChangeLog with a per-release entry list, and every entry
for the one point release in the current series is labelled a fix. 2.15.1
(May 22 2026) covers a negative error code on incorrect message size, a
shmp() return value checked before dereference, an underflow warning in
zero_file, uninitialised LTTNG_UST_LFILE and sigevent structs, close_range
inefficiency and excessive fd-tracker memory use, and a NULL check in
ustctl. The one non-fix entry changes a likely to unlikely branch hint.

Only one point release exists in the 2.15 series so far, so this also
rests on the 2.13 series' record, which ran to ten.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone took 2.13.5 -> 2.13.6 and scarthgap
2.13.7 -> 2.13.8 -> 2.13.10. wrynose has taken none and sits at 2.14.0.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb b/meta/recipes-k=
ernel/lttng/lttng-ust_2.15.1.bb
index 9f1d0961a1..5d2ce3d0b4 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
@@ -11,7 +11,9 @@ PYTHON_OPTION =3D "am_cv_python_pyexecdir=3D'${PYTHON_SIT=
EPACKAGES_DIR}' \
                  PYTHON_INCLUDE=3D'-I${STAGING_INCDIR}/python${PYTHON_BASE=
VERSION}${PYTHON_ABI}' \
 "
=20
-inherit autotools lib_package manpages python3native pkgconfig
+# lttng-ust publishes bugfix/security-only releases on its per-minor
+# stable-X.Y branches, the same upstream and release model as lttng-tools.
+inherit autotools lib_package manpages python3native pkgconfig upstream-st=
able-release-point
=20
 include lttng-platforms.inc
=20

