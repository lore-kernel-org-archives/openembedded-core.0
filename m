Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83850C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 12:25:56 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5302.1785500749745724411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 05:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=RoNqZn9D;
 spf=pass (domain: ericsson.com, ip: 40.107.162.43, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLkpVbXeFpBLYM4HcCoDHBTAChe+EVnf2n6LzA2pz+/SMeAs2sCn4GkJCtgzhjvy7VPaXBMCKzifWGzUxtLRtLaKJAWXvTaqtxUePOm5+Rcd6W8bo5XfbEtJJqaT8mxWHp3NIz6pHAO4uWFHRBtKJvuB8dQTXwJvs1V2PbvmBKHg9rbZzuJKa9rZk8Z8BnGBWfct8d2DPRX52k8ozG+DLJBPDD2NZJH1XxNJaBqha7XVGvhowvWr9SB5wWRH45uS/ebglleC5qDTU+O/Mb/NaudCXto3IvgD/S0u3xEbFk2GWaJhdEZOdPmNq5/ygAt7hh6W1BvQX9T512VPKX78Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTXelzOeQpjsWpwmlGHavAx7fYMRTtparPuSm72r518=;
 b=Wo973C2cCW55CQQds51xO4K+fI3yLl6id1aeXHEutnOxLhzo3/S338GoHdP2Joc8RxrDMuWmjZ03QZbik216USLAu+CaQE2ZCecoY6nI86gUbb9Y+yyKycYk61XPEWYeuiygBVfbF1IJa05tL7R42TqKB1kOvbfnWxoTW7OKTvQ2KilbBAH6vL/FKBUw1DKPOd5A3+jIXThwg/YrwV7sjxve9pEb+pDI9617dOVL91J0ZW1NBPxSs//1WGljk/8EaMt5/Gw9PU5fJeKUTfj3NmGd21uh+r/kJna72yuKDJDtSTXaBX/ExjjKmzv6TusVh8Yrmf/5vfPx/Chg4Yy+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTXelzOeQpjsWpwmlGHavAx7fYMRTtparPuSm72r518=;
 b=RoNqZn9D5q4tDFyz+r8ktNtMt9WLBd8YNmBlj/wzH4tL4vdu/HXD3wVyaioRfE/+roh1/TDiVwLPCYPuYL5ZIqhbhoA9/6cEe+GkLNmTP2yEUaCu0msmrSh4ZcZu0N6qLXgfE9UDoXe+JOFXI0LrQ2W/J3oFM8ZvL+Xni38P+agN8jrEL22381gxFcX3xQHgp0v5wPXTISb58YuqtQeVZE37ETRLaLALWhHKDvjMm5IqCtU9z3pLL7bIkReFFUMQSeMtYfTuSqleC9SSyqN41kT8//B4JxLR+oZkx1FNxoD4aIeBIkDGCO6cWTsox08htsRiMoFLcFuq7rxAPgl/Uw==
Received: from AM8P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::28)
 by PA4PR07MB8645.eurprd07.prod.outlook.com (2603:10a6:102:272::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 12:25:44 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:20b:21b:cafe::93) by AM8P251CA0023.outlook.office365.com
 (2603:10a6:20b:21b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 12:25:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 12:25:44 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 31 Jul 2026 14:25:34 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 1E6B24020B46;
	Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 5AE15700DF50; Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 5/7] xz: inherit upstream-stable-release-point
Date: Fri, 31 Jul 2026 14:25:20 +0200
Message-ID: <20260731122522.1647968-6-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731122522.1647968-1-daniel.turull@ericsson.com>
References: <20260731122522.1647968-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|PA4PR07MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2f1f93-c8e7-4df0-b737-08deeefed7f5
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|13003099007|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	H47zvyvokTUyzkP+MM6ZmUTG5DkBnljCv69J66B2wRyna7p7/a+t1qwhOxwbD6GHnZJrUdz3GGXyKKYpMAyJTz66nNHaI45BOd8wBNXjOVVb+4iFT2Ox6jvB6+Y4klOhFqZg4gs0zwkNwT/OEzwCmuK1bqxOaBW4zxiqRjgmz9AHst+C75HfvQZF8Yl4RUEx57cAhzMF7WWSGdeWUVnj6zPgTE4DVgNHggdy9Hog1C0FwVctG8lMsjk2iN4itSSBOMgVcwywZsqLF7kcZog9k6N/JkjEkvYOk2kHMErMuitoxzwveF/m+N9OvIE74V6HhnoALIrsWcncM5CsszXwybDlBbUBjRtM4TyuoDSk/gu/4bfNJfIyIuDBRScLWzFxBwlLUtbdmT9mWoyH3HCT5bLmz/kDfMCXY+vi4l1KXMHumjr6nlSKN8AL+xdrYNEAkhHYUmH9piAkHmVHocTytKrYeSUUa/sN+9rLd5ehU5lQofQNZDA52/LdN39zOhbzPHDPXGBEXU57r2RAoO9O15bYfwFVZKNLIXxfNxJSBTV65839BdVojQqYO7N9sqTi79BuI5ED7Fy0pV8C4NackEqGSSdmfpez7YHhwt3FlgAXRJMJ/jI5DZ70P+HQ2XMmd0Hf4bBGNuE7RPJe8Ei6pNwyVOeiVypGRTXRB651ykY=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6fF04Z/lGbf2ATTqaAT7nqAK8zVTDLDQ/Sn31DLXUeD2GXEiKomcPEdkYFBrmlGHNHAQL/CcKVVbK5HpZKs6TrG/IrDmp/5haXI+agBNDw1EAfyA7fG6mpGzepFdkFRB40op1LrZ4xM4DXmopGA+tAw9v+TZiqc7in74PxHDYXj+Lzp95cNU0xIFDs5l/6C7FGOembLXMFoPNVIqZ5oL8Jh9diVHhB6qBQ3RoWj/YT69PM01ULQ+7GVElbzsCqM7iaUMshoDUfh2pIfVisadrL85Orc4tORW0WX++G+QO4O7V7Zr+1UftUdlwLBD1+o2TqH8Bs/fcmNMNH/5mOS90QojldhxZXMOQpfJFj2RTJuaV23YgRGEhz/EmmqqTr/mkNX0kAXM8drBzDx2joKFU8Nb7ThcGivhrQPXQvoX9/sps5UJYf+pvgFRILq6VH7b
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 12:25:44.4722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2f1f93-c8e7-4df0-b737-08deeefed7f5
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8645
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242440

From: Daniel Turull <daniel.turull@ericsson.com>

XZ Utils's README documents that an even minor (Y) is a stable series
where the revision (Z) "is incremented when bugs get fixed without adding
any new features". So upgrades within a major.minor are stable point
upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/tukaani-project/xz/blob/v5.8.3/README#L138

Checked the last two point releases for feature creep:

  5.8.3 (Mar 31 2026): one CVE (CVE-2026-34743, a buffer overflow in
  lzma_index_append), one invalid-memory-access fix, build portability
  fixes for Windows ARM64EC and Hurd, and man page translations. No new
  options or API.
  5.8.2 (Dec 17 2025): build portability fixes for four toolchains, a
  RHEL 9 kernel-bug workaround, and a resource-aware memory-limit default
  tweak that is a bugfix rather than a new feature. No new options or
  API.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone picked up 5.2.6 and
scarthgap 5.4.7, one bump each.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-extended/xz/xz_5.8.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/xz/xz_5.8.3.bb b/meta/recipes-extended/x=
z/xz_5.8.3.bb
index b76b1726e4..0735696011 100644
--- a/meta/recipes-extended/xz/xz_5.8.3.bb
+++ b/meta/recipes-extended/xz/xz_5.8.3.bb
@@ -34,6 +34,10 @@ SRC_URI[sha256sum] =3D "3d3a1b973af218114f4f889bbaa2f4c0=
37deaae0c8e815eec381c3d546
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI =3D "https://github.com/tukaani-project/xz/releases/"
=20
+# XZ Utils publishes bugfix/security-only micro releases on its stable
+# (even-minor) branches.
+inherit upstream-stable-release-point
+
 CACHED_CONFIGUREVARS +=3D "gl_cv_posix_shell=3D/bin/sh"
=20
 inherit autotools gettext ptest

