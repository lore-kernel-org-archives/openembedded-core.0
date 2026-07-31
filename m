Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63FDC5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 12:26:06 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5428.1785500757339824455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 05:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=QGtMirLH;
 spf=pass (domain: ericsson.com, ip: 52.101.72.30, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oS2wU847wBeBd8hWzKNcE1tpJA3PVAK6An+OA+dgtS+q43z23toUcoEUJ+vfY4eIQFBswRirC3Lqby+EbJEopZtpFml9pVzD+Ipc4/8fh8dWRHcukL58fWsqvy1BEt4Qq15FLg8zrAEQEw+d6zgtSxZ88SQDctsM6MB5fjKGNVPlUrQWxDAnUijJnIvIHjv5sRQJlNPIbqdCmUxhEX/zU+ecrhvfYBleS/zPeVr6cOUyQgD0bS0nD0FFuCBGnh+cYMALwkqq4kIev7djUCEmjMVFPWFBfwFbQ2YPRAo7R8i83vZ/rW2IVpUO759rT6TTrMXIns7h5YXIrslDZB8TfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=We4LlNvNShJEXYQf4BpZyViRAiWiQI4CP/Tx5IGJ9W0=;
 b=I9NMCob+mHaycUd41tnhVtX8hftwN33vU+p1BLYU5NXARw+k7UVpABTN1VeVMWzlOKaFrTIdluhqj40ngOv8S5jjukYZ2juuFCLKUHyo8LtNTx85EpuP3xkxlBHnQ6ImG1eS6nOsSpgFBzpolhuIkpvSNgmoQXIFthuYo+xtyxwycQTcUEQZL16z5Pb+zg66o2djiF7ThzBYYaqr0ZFea2WxkTEFB/+81y3MvYdyPi57+f8TzWc3tyZFZWJ9wG8IdObkgvshfn6x8CVaxxzGo/VYOy1g+yfydLZW6doaFlGnjZ0tamwFcPTSbl9DB6cHkSypHIQhtr1NzlUKu1t+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=We4LlNvNShJEXYQf4BpZyViRAiWiQI4CP/Tx5IGJ9W0=;
 b=QGtMirLHlTe+s+anHHew62eFebui7d2zSdaLiAhZrG6Aia2I3WjAOIh5R6mut1OGb2QPqm110yRp/jxz2kMF7RsD4F+K0lHIYQFrjL4JsgNZAHS803YVInA0mFmYreoUu+Kaq8vDQ5XwCM7vRPggDtVq0smd4X9XnNz20GEOi+inxowIhrsEYsFdj0vp6zndwalJxcAw0yg9SxJxfmSAn/61+G2psMeS9xxNyxJamRn4MpFyYbGlbLsWjkGzgsWrTd47yPsdpyqFPtQ2qSJK+GhxnAf0OQMKhGM6W2gO30eARSCUadNO5tjp10nqKNxFXwMWT02PJSgXzRMNGxKfBw==
Received: from AS9P309CA0029.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:45d::9)
 by GVXSPRMB0023.eurprd07.prod.outlook.com (2603:10a6:150:123::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.11; Fri, 31 Jul
 2026 12:25:50 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:20b:45d:cafe::71) by AS9P309CA0029.outlook.office365.com
 (2603:10a6:20b:45d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.11 via Frontend Transport; Fri,
 31 Jul 2026 12:25:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 12:25:50 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 31 Jul 2026 14:25:40 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 887D399671;
	Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 47DD8700DBB0; Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 0/7] Mark recipes whose point releases are fixes-only (1/3)
Date: Fri, 31 Jul 2026 14:25:15 +0200
Message-ID: <20260731122522.1647968-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|GVXSPRMB0023:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a0386f-1ea9-4fa2-59b0-08deeefedb60
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|13003099007|6133799003|56012099006|10067099003|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	O4/wVYV2wv78JeyuItefE778xBsECkd5Cen4sQJsiNEwt3VSHqQplx2TbElyZxzZxy1Pq2mf+ED+tQHnWsrtPYye0pK5xwni8xGnXFUkNKQSREwH1Kv3Pr2hZ8dQDhmWDuHcZ3GQaS4jyO8PIgYi+2exhQdHD32dHzQ0hqqTFqC7HHgMk/xCw3jRbdum+DA774hcbWaso2yMQ9PM3/zim4WI61W85UsNsGrHNFuacZ/77fZd1i7lb5ootB5hbw0Io5hBCvtEMqB8nMfwRtPTsONR1MafGg6DHfm5n7+gabdrYWyYOd4Mf42GZ2fER+0/YTeTwjq77NUU5kLsA279iti8etZAhK/0CZ9EztbRonk4aTjSeMZ9o45apqKxznPENXB/9W6NADtsWs1RLa+WdeyeCwAqsoHTJ76Uz5D0MWl7tFFBzgIjBuY/buKkw1tlrg4PLAJhk96BJt5XPP7J2n7Wu1ZJZydEl5qBwhVEVqL5etvd0lCD1064VcuWg0VaxClRY6FxrgklJg7KBpDYzOha2KE9610uApPTR4YDtA4TjAhVjqsfPehSpRTxxcD7EjX/Y4GBistEgV0RQBuxeERcgP6sqIOxzXq5SpW94mpSFLfcwWkEX3MaQVidfSjwf/caLKUcIYCYbwOpfFje4BUy15G+aU4hXxjT5zR3PBM=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xqAfFKYF++atTMJXNhh5PvQxyQiUPm9yxTlfadN4PkJm6X4CMTkNF42Ny56tbiczOPZNyUudaN41jqORDG7EVAgFEw7+mzRJex6TuuBiXeEi91VTIAmEIwMM8XVb23BCamiWxd34Ymyi1OqmCjNtdzXLPUORkQIaiogkn9HwCiFrp13BdALadn7llMYdSArcHbI/2dRR2X3FNtF8fIdFfx3nXqqUb7hX/sC7oKowiqCp9cg4zWWJ0d1NLRSXvcMHjG9ksFnUrShOvTEmAAcIgJ7XPR9mDKOy29QrfHCxY+bqEycVGzwVDiLee1gsccJnmaKHEfY8dbKv2Bo9uU9GcjixBkpfpZfctgP6BBBZl46va/EWc7S6uAjdDUJT9K+2gZH0JIWXO/sfhLKE5B+5t0/7gaFhaV8jr/vhF4PYiJ5WQXBP3Q22HvvRlwH06WsO
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 12:25:50.1835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a0386f-1ea9-4fa2-59b0-08deeefedb60
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXSPRMB0023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242442

From: Daniel Turull <daniel.turull@ericsson.com>

First of three series opting recipes into UPSTREAM_STABLE_RELEASE_REGEX.
This one covers the recipes whose upstream publishes a written stable-branc=
h
policy, so qualification can be checked against a document rather than
inferred. Later series cover recipes qualifying on branch structure and
changelog evidence, and a smaller tail with weaker evidence.

Why:

The Auto Upgrade Helper's --stable mode proposes upgrades only within a
stable point-release series, so it can be run against a stable branch
without pulling in feature releases. It needs to know, per recipe, which
upstream versions count as a point release, and that is upstream-specific:
for some projects the series is the major, for others major.minor, for
others a suffix that is not dot-separated at all.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades

Method:

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
 - ABI signal where the project provides one, such as libtool version-info
   or a soname;
 - what the OE stable branches have actually done since forking.

A new command-line option, a new configuration option, or a changed
documented default in a point release is disqualifying. An additive API
symbol may be acceptable but is disclosed in the commit message rather than
glossed. Each commit message states what the point releases actually
contain, so the reasoning can be checked rather than taken on trust.

Disclaimer:

Produced with AI assistance, which did the screening, the changelog reading
and the drafting. I have reviewed each recipe myself: the qualification
decision, the evidence cited, and the resulting regex. Errors are mine.

Daniel

Daniel Turull (7):
  util-linux: inherit upstream-stable-release-point
  systemd: inherit upstream-stable-release-point
  glib-2.0: inherit upstream-stable-release-point
  dbus: inherit upstream-stable-release-point
  xz: inherit upstream-stable-release-point
  git: inherit upstream-stable-release-point
  perl: inherit upstream-stable-release-point

 meta/recipes-core/dbus/dbus_1.16.2.bb       | 6 ++++++
 meta/recipes-core/glib-2.0/glib.inc         | 4 +++-
 meta/recipes-core/systemd/systemd.inc       | 5 +++++
 meta/recipes-core/util-linux/util-linux.inc | 4 ++++
 meta/recipes-devtools/git/git_2.55.0.bb     | 4 ++++
 meta/recipes-devtools/perl/perl_5.44.0.bb   | 2 +-
 meta/recipes-extended/xz/xz_5.8.3.bb        | 4 ++++
 7 files changed, 27 insertions(+), 2 deletions(-)


