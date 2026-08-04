Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88226C55ABF
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:11:56 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17286.1785852710515278790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=glXTPqjY;
 spf=pass (domain: ericsson.com, ip: 52.101.70.43, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdJUzgWCcA/o8xyHpKCUgYcIiAkBZUdzrGXdvgUPD7Zw/KVt60dwxwFU54mNABgN1sgthHzGkzlXv9qClYd+qQ/xp4PncZVu1YKfDcTQ0/m846BE6JF505n/G9/vuE5EPvpAiIx7ntHEWK3q88ezunaNtU67SHZOX1w3MKi7F+wAJb6XVbRaSyzAK3RtigsyoPqH2BxNp2UOHNdEzP8PmhYJuH7BVC2M85hcK3qZpDV9h6lRiTgP3xvxUE/H3JzzQrpcIW48YVXWS1X9blwrUGFVLdW0TZSF9V2WOR64KpPlpUH4mERHE7H5IgiBPWTZYvysDwItZ79qNIQ/bEuonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8Tuaemh6R822d+oTdm4dJxYbKJ3BWSUFNCFfmoK+1Q=;
 b=P82ItvO6IeRCz/Mtrsm73cO1z5liaprXDTKnT2SkkVwW/J3shJ+mCi+Js9fVHKriVy3cF1koZceTCYgv/GqAWCik6uDUEk9HfODvu+iA5yZPQV2a/zARfq4gWeC9jgw+7FkZ5cSUU5lEBmbDUn8flVjjGNP56whpT6XSUGH1ODE1wHRYqqxaeBYHVomLh9qVXR2o2f5xGyvoo3el7SZO8SguR1NUA3xfiiwhVpGZpaqC7BBH0vNRkbaAEO1KE1rGhAnDsgCC3t+gERFGxyZJdsMZoJaNOoYr4n97jvVMexYo+Ng0ML/PLZ5/SV/O0Zr/UpQ9IYR10ydckNl7DvRgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8Tuaemh6R822d+oTdm4dJxYbKJ3BWSUFNCFfmoK+1Q=;
 b=glXTPqjYwQh2oXg9oXj01H2PfxZL07Bchwp4xV6m+gSvnGAnPWqxuCOKLqmi7dDA5DwuSMCodwHC22dFdv1uuvnD+VnTRK5ahM9s3/fSKqsWJEPXmiweC0sqPNToxnWIigC5oppz2a8JH3rhvYirl8dpgDdSvxBgj5RxlQLDMmO43QKRjYYx2P/cMJdwnXNYvjLqw8s1xgeJfOQIyIB312b4v1MUUmzd8snww9RlZbR6mPH9Lm7KS8nm/P5F0CBCZ5MzB/iod66RXwC9roG9EWTtnZen/VlcY55ggW8w9CxYnVx2Iek5qOr85rbC0NSQER2MBX+GquvN9iaYk0Bd0A==
Received: from AS4P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::6)
 by AM9PR07MB8017.eurprd07.prod.outlook.com (2603:10a6:20b:309::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:11:45 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::88) by AS4P195CA0019.outlook.office365.com
 (2603:10a6:20b:5d6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 14:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 14:11:44 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 16:11:44 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 720B095800;
	Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3D62D700DBB0; Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <elin-upstream@mailman.lmera.ericsson.se>,
	<openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 0/7] Mark recipes whose point releases are fixes-only (2/3)
Date: Tue, 4 Aug 2026 16:11:28 +0200
Message-ID: <20260804141135.3779287-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B6:EE_|AM9PR07MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 4635b646-459b-4551-488f-08def23250c1
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|6133799003|11063799006|3023799007|5023799004|56012099006|18002099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	QFzw3g1ak12UM7NJXnR/7OMvhk+sb/Flq9XJBuPTwGktVSHafIgse3OX+/JFevegfHRu1t5wKsbOoU7YPSkWLn/5NDwo/iLgz0zSXg3VF5R4hf0viSDWVY+NHlv/ZNPjLdnhWkwcV/k4oDxUErd5u6ItDA20zhpwRUS5qegUA7D8F/nlFCd9UUUkdBOM1jZOJHywIP2whKtrpoVHejFWJI+vbtuik68QPZekxSI5dPSc8BtuICro52GeHcyxdnYM1cb4Abd9fCliY3gr53PlnxMjxjQTD5FWf/xOqgEF1j0zUNUXwSeHroQpuRTWjRgBSOjtgHe09AlyKvEHRi+geOj4SpA9nHl3Gd+O153LafvG7OPVgzmG5jFBVMXo1Q0ESYxtuOkYKEymY510paayrTNsfzI5+AHKKhT/ieY7zhfoq++blLg6ingIiwrOhkhDUq5PK/FQOd3YdY+UarNLbKtX4Fr0lIw6Ubcl5fAVgp6lG73CYRndOS8Vb72/7Ydz4FM7E06pVfekZn3As0lL1MaZEVQInfCVN+w00A574lk77NvPJrjOrEFw7xgAeOkplL5Ms4fzh8lOYHCei1ggiDO8L6+iSnX7cjv/TYO2hL8kRUilxRmBIuPhxZzF/UhigpELFN/k+LW2n5MoC8Ae3A7HVgqcKVSvh8zBSF/Zorw=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(6133799003)(11063799006)(3023799007)(5023799004)(56012099006)(18002099003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cRJiBqlWA+Drzhmtz79/jenu/KGc2HWKtr/ZDfOnHQl3scdVcKUpv1UnQpHJwFpMw4lWWZl77plt4BYhcU3gdCgjWa5DsLhznUj89W2qXQUdBckF15gj+nWi3YxgpN4btXLPH8h8/6DOGVY+jrRWepT3EjIPiJXs9HLvIQG5/de+YwH+IKMa59/RHw5kDoKmfCSMZNP0QnPrrbnm4NrvXACF/LqAyB8BmBBr+Gtt3N986bQY709pf+bJwoN7+YyNdt772RRg4SpJNbHSxRT/8ZrIWoj1qAXZ0eee8AMqmw+na/qFx2+z7z7AJOb5W9mD4mhK3LiwriH9nZpXUZYApQQ2m938hkX6CM5P+cO55/ZTNe8849qhBFx5f+tiDAmjnbO1EjSvQt8PSI+GFDWmhVCM9443+4Y6HPc7QuQare8CMK1f6Im3ShkMFFKVl62h
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:11:44.9675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4635b646-459b-4551-488f-08def23250c1
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB8017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242767

From: Daniel Turull <daniel.turull@ericsson.com>

Second of three series opting recipes into UPSTREAM_STABLE_RELEASE_REGEX. T=
he
first covered recipes whose upstream publishes a written stable-branch poli=
cy and
is in master-next. This one covers recipes with no such document, qualifyin=
g
instead on branch structure and changelog evidence; the third will cover sm=
aller
components with weaker evidence.

Why
---

The Auto Upgrade Helper's --stable mode proposes upgrades only within a
stable point-release series, so it can be run against a stable branch
without pulling in feature releases. It needs to know, per recipe, which
upstream versions count as a point release, and that is upstream-specific:
for some projects the series is the major, for others major.minor, for
others a suffix that is not dot-separated at all.

upstream-stable-release-point.bbclass derives that regex from PV, and does
nothing until a recipe opts in. This is the enabling work, one recipe at a
time. It matters because point releases are where CVE and crash fixes land,
and counting only bumps since each branch forked, the stable branches have
taken few of them while master takes them routinely.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades

Method
------

Each recipe needed two things: a mechanism that can express its series, and
evidence that point releases in that series carry only fixes.

Screened out before any reading: version schemes that cannot express a poin=
t
release, development series (whose point releases are not fixes-only),
abandoned lines, and projects with no per-series branch or other
bugfix-only marker.

Evidence required for the rest:

 - a written upstream policy where one exists, cited by file and line at a
   pinned tag;
 - the changelog for two to three point releases, including at least one
   that is not the newest, with section headings enumerated before any pros=
e
   is read;
 - release dates across series, which show whether the stable branches are
   actually released from: a version published when a strictly higher one
   already exists is a maintenance release by construction;
 - ABI signal where the project provides one, such as libtool version-info
   or a soname;
 - what the OE stable branches have actually done since forking.

A new command-line option, a new configuration option, or a changed
documented default in a point release is disqualifying. An additive API
symbol may be acceptable but is disclosed in the commit message rather than
glossed. Each commit message states what the point releases actually
contain, so the reasoning can be checked rather than taken on trust.

Scope
-----

None of the upstreams in this series publishes a standalone "this branch is
fixes-only" document, so qualification rests on the per-series branch itsel=
f
plus the actual changelog content. Each commit message enumerates what rece=
nt
point releases contain, along with the mechanism used and any caveat, so th=
e
decision can be checked per recipe.

Where an upstream could not be shown to maintain its stable branches alongs=
ide
the current one, the recipe was dropped from this series rather than argued=
 for
on weaker grounds. A per-series branch and a coordinated release history ar=
e not
sufficient on their own either: one candidate kept per-minor branches and s=
hipped
its old series for a year alongside the new one, and was still rejected for
adding a configuration option in a point release.

These are collectively higher CVE-exposure recipes than the first series, s=
o
coverage here has practical value even though the evidence is weaker than a
written policy.

Disclosure
----------

Produced with AI assistance, which did the screening, the changelog reading
and the drafting. I have reviewed each recipe myself: the qualification
decision, the evidence cited, and the resulting regex. Errors are mine.

The class exists only on master, hence the /dev/ documentation link and the
target branch.

Daniel Turull (7):
  libxml2: inherit upstream-stable-release-point
  python3: inherit upstream-stable-release-point
  openssl: inherit upstream-stable-release-point
  binutils: inherit upstream-stable-release-point
  libgcrypt: inherit upstream-stable-release-point
  sqlite3: inherit upstream-stable-release-point
  lttng-tools: inherit upstream-stable-release-point

 meta/recipes-connectivity/openssl/openssl_3.5.7.bb | 5 +++++
 meta/recipes-core/libxml/libxml2_2.15.3.bb         | 4 ++++
 meta/recipes-devtools/binutils/binutils.inc        | 5 +++++
 meta/recipes-devtools/python/python3_3.14.6.bb     | 4 ++++
 meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb    | 2 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb | 2 +-
 meta/recipes-support/sqlite/sqlite3.inc            | 2 +-
 7 files changed, 21 insertions(+), 3 deletions(-)


