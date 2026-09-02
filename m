Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A721C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:43 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8949.1788343181984326556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=V8QKiIbv;
 spf=pass (domain: ericsson.com, ip: 52.101.69.59, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcqfEIU1NLJW5MUYPvm6H5eXeuaga62UNeNpOIDPRxgL8G0+Zsid19WWP4ZmTYqlA3v1j++Jn73TL5MAsKSn1c89ncAwFs/K7MjETCug+23EndKSlrvI6SCgcTuwBJ/kH5y0UmV472srzDI+loxICtklIysK4PPJccsa7mIgJgXRq1V0dfwEG4Va3z4xWgrmFzNtxAnXKgA28LiOnNP/cGOYu3qh3KzVoNrgVbb12ntGsi2ucWWJFevmGjJHqxDgxb1N7F5cAH2tccvMJJ6YqGkHLEU0doSZnC2l99El//AFCYi92yojCdJIn4zzH9Tz8oL8KjogRKy8iN41wqXUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZeYGhRN8VKRWSrU9lrHIJwBHnGdImtEIeydY9aWqXI=;
 b=Z7G8afYBl7LgAyXKZr914Ww4Ff+gKciZNKVIN1rHcjJuIj74kF3OV+lPy9q/NNmGN3V13DQM58/XIz6yEISkP2OeLbWxWSTbNYaJf7ledLom88roGzCK9AmhM+Q/7QirPiprdoqOf0pJNWTdY3OkokVcBV5q1znPwcLjA5koDD4Yo91kYvVo/4QUjLTI+cNxvmu4czQgghX56QopozxXCR3Qsv0AqWtmqgHfR3MDvPdfrO869g891DxdQvm7L+XSZJ74NmcFFeXJccLdrpMQMj68HLljiZco3wEfpRwFyCORxnhFYMChVAl5kUt4MriBbzWtcBXquQYH23UItI2mZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZeYGhRN8VKRWSrU9lrHIJwBHnGdImtEIeydY9aWqXI=;
 b=V8QKiIbv0Gm4u6xrSsUEBKOwchCVzvez6oljdgHl6GiLMaW3+GQLyQ+kzOM0awzR3+LoWmSEGDms6kjnVtSQVkx9ycXt3X//b4nNA2pnBpYDXMoQXlk1cx60gIRtC3wtF37LXQMJ1XScJJ34SSP3DR/haSZ5hINwZNQBFgnxR6LUTPA8EVQnk4IBlHnRJwaShUpzxMz0aZDQAujgcnXYb8EBNx49gNDIuijGr+0rlB5Vgxk8dPTRfn7hWsgPoG4j4lTbM7IXAlydFmqNpGP9iJtDVDub6c21UZo+8E8TVnoVMIucZXUzXn6+Hs7DmNJJ9aj8UJKTDqoepo9cXdG57g==
Received: from VI1PR06CA0157.eurprd06.prod.outlook.com (2603:10a6:803:c8::14)
 by PA4PR07MB8509.eurprd07.prod.outlook.com (2603:10a6:102:2a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:34 +0000
Received: from MI3PEPF00008481.eurprd02.prod.outlook.com
 (2603:10a6:803:c8:cafe::13) by VI1PR06CA0157.outlook.office365.com
 (2603:10a6:803:c8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MI3PEPF00008481.mail.protection.outlook.com (10.167.240.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:34 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:34 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id F261D4020A9F;
	Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 560C3700DF7A; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 07/20] xz: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:07 +0200
Message-ID: <20260902095920.2840293-8-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008481:EE_|PA4PR07MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 044f6ca2-a94c-49d7-424f-08df08d8e44d
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	naOPAABiMa3PWh9CFBu+QvjoU/GsKgnnHBY46U1QDVnlt+Z2SqeAhQlvH2M18qhHWXn6sU8Jg575/t9AeolwP2lDkjilfEC0IGiBaJjBmshmVKSkrYOpld+565DYrAn+B5gDPP4eEzcK15hy1HKyYrQhYuE1vd4AtDtU5Ojsb3PzSZoHXWqDNuYV7dOqUULk+O2/girk3Qp1dOt2SVfMNDLy+DeSg6y3FiIv2bMXbaPEDWQnwECiFbM4mfdf/Jw8Chtzct+2EJLkFu9i7NDkJesbspD3hVnw15uKmr2zOOQSBFkeFWy5BVF/SymHRanGJBvSOVUBUvnV85ZDicsnEr/VQ6TZUU/17dr3zoOzIRfdNPuX2LtYHKsdjqpL2ErcExYByLAgc3TgRcEFDk8AE/5ydKfPlrIogawseM09I94G4OnoWTKOMD1YRv395rogDiUrdpNqAP0N7pCQ2XlhAxYU/1FFgelOmjEVKHiNzxhUhzP37fMr9/8+CJeIdiM8a9SfQoStANej7HcIoMBu3Wn5SAyehJmsLarDQxgZG9Ofh41UxdCFqehGxcC0skIvmehCeoFbBeHjqszccVexJx8YcoePXMxnZAioKYmqcBMYjcZlOqMHBV5atXE0bkm1jhYlbNFlay3SQKzCxKJwpmwH+bYwY/iltJHwwLq6qLk=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yBbJQOt8XJa7TKXE35YakbQfzRmMIMxZvrB4eZWbXAR3QCr8XtPqGo23Z+xef6GCYwloY45YSymog8AeLS46ORj157em1WeCPge2Zr/p+lULXVkfaHubg8RWok+63zaVp+9kTTYwZoOINyTe7LrjVWlzjIJK1E38VqzE0wTeACV+240lpOy3rELgzIVnAh3kRn7L/KeNGjt/V5eshJcB4UmgPkNqEbqT9bMLunXosDmyJyY73coY84cGCEmkazOEEret6hIBO81A1g1Cy83oTEue9MqX1yQ9Wjsx/t1iPnwWNK9Er8hdKK9q2bA9+bDQGSEytSpUjCPw2HdHbMF52Pas8Xm4ZPZChW93AIr0RXCs7951hTQA9tDet4vjYh8RefxmmL19EjxpyTRuChMPG3oAtMYfWHeT1IrkkLpX+C6oV1TZowXFIfMq6MHLxbaE
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:34.5282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 044f6ca2-a94c-49d7-424f-08df08d8e44d
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008481.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8509
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244923

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted for wrynose: applied to xz_5.8.2.bb (upstream: xz_5.8.3.bb).
(cherry picked from commit e336ba1ed32bc924dab329afe1d687e0382f1c87)
---
 meta/recipes-extended/xz/xz_5.8.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended/x=
z/xz_5.8.2.bb
index 15eaa7a52f..5e7ad1fc70 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.2.bb
@@ -33,6 +33,10 @@ SRC_URI[sha256sum] =3D "ce09c50a5962786b83e5da389c90dd2c=
15ecd0980a258dd01f70f9e7ce
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

