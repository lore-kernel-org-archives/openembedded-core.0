Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4315AC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 10:04:02 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39949.1785751433347837918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 03:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=AVoBIS9A;
 spf=pass (domain: ericsson.com, ip: 52.101.84.70, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8I4C4CcRPiiQ2W1katGnLJrDEPJNNr1jvGlqJyPqFIKhummd0L22JkmsBNWJl09LZEcR9NSNks2d29XL5UCtXo7muyVMod6sjqUSdngid/I6yU2w8xUCawpMOPrPbXAf1P519wgcTWTcx7E9Zh2+0PBaSUevDxlOhacu2cI8rLSNTYTOJEoQMJT/wwVUEa8tsz7jL2QIaXzmRjybtwEPaQhBdSQ7MKqn9u8MSkpbYUw02BHaPPlMdj46srDQ1/KQkU3ntN8t5yX5AaTkebOEIG02Oo1NO2g+R36iukfqby1cKLPHAWU3UhkmFm0Mc4HVRVZUQSnkVkRLKdwctROVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1+uF6kOC/21Q8lOP07YR21Yabf9tyEBzODA8nvm7i8=;
 b=X/keix2HzfwGGOpY0iIFcGbB5IkRyevH+1lIa1kIEKYXdzaHDJwgZsknMltg041CFtfSvzTA9bqdZBbKulHztuQbXZDAJIx7i16G/mjNXPRCfkshmGDaPt93pc5JRGupz9fzGxzym8rMgSKPJpd1ttxMRGB2Bg+ELW0J0vrhpUfgjCouLddoqeX7uDsZPj1OI/wyNWBJa1/JMt3ZeJYydd8EsWFj8G3PymYP1IQ9RLS5vVDPJLLNXTxEbdUzfd1ezHWIaiLsnMPAZrNBr0cIV4DPRdhtuZ3OSvmGVimZNw/ry9bxa74AKmsj/BMJLHhsV+yz9gBkPqJu0cFYZ1Yecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1+uF6kOC/21Q8lOP07YR21Yabf9tyEBzODA8nvm7i8=;
 b=AVoBIS9AQAHK45b1Z2KrALU1/YVj2ZBR0AkvgeSw4DpNGla7XS+AZOhBRQ9dWmzLmkacdjRQ1XZyBW6WI5AFg4+f7ZBdOcvEzjGCJKL1MtcKmajSQxlH3V2zdwxYhwzzGx/g1MQ+P1PttFV8Ku9fNc+9anY19zHfpUL5yIMkji8HN7qygngnjzWF8mrV8HTRXUdMTOkUrnWY/w1FF4N6mK8KiyBuyxPaL4k3mY8O3XSr7N/JMchlrFvcKa6Mun3AjseLsZz2prkxsLCx5bJpKraoPscY+UdzLuo/hWkalmvm2jKOcFpBpPjJDQ+TKxJMwqHK6GAceekdFd3rSltJnw==
Received: from AS9PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:48b::17)
 by GV2PR07MB11944.eurprd07.prod.outlook.com (2603:10a6:150:359::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.14; Mon, 3 Aug
 2026 10:03:46 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:48b:cafe::3d) by AS9PR04CA0064.outlook.office365.com
 (2603:10a6:20b:48b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 10:03:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 10:03:46 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 3 Aug 2026 12:03:45 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id CE7754020B46;
	Mon,  3 Aug 2026 12:03:34 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 9F489700DBB0; Mon,  3 Aug 2026 12:03:34 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 1/2] devtool: upgrade: ignore changelogs from 3rd party
Date: Mon, 3 Aug 2026 12:02:30 +0200
Message-ID: <20260803100231.3752129-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|GV2PR07MB11944:EE_
X-MS-Office365-Filtering-Correlation-Id: b83afc6f-b9cb-4ccf-967f-08def14681d0
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	xsJ2jZk0JS45bE6Bk4+F068OTtaYEVr2l7iWybHLzu8vLXyTATiZL+m5pZk+mIGEImn5MvGu0Y5/VhHJh+ZjQYv4qfIpAKu5r/spFrx209jlay9MSNm2rDbS2MA0Vrh1TP9CmcCn0AGhFsYgCbS5B8EmmgaX1pgGG2bNqTkHlmimog+G4er/g6IcIPBPkti+XpAtCqoaDs0j/dn5JIITHw3dW9JII9ngGM6Rm8+reorFYYBjRw+o0XrbhW4DbzSlZYb/KaEsuFs3Ug3962CROvbMVahmLtzzQXh7s6889dXAG51Ey4Ls0AKmQpmz6JkfSA1B+LsoV/EoAH64UCfRQKcGgBGpZ7Ew6v0ZoAgemydiKjZow+cGgO/1kNLT8aJTT8dj9IRwJKlmHaHzWeDoHQt8MWSHKQ6r1bBAyMCDq1koQ1zZ1xTI7hPgdHnTMWWi7ZMxN+VyUryKBRCCQktv7q7W6+e4gfF1k9IB3CDojxtkEVr+gRM9hsMLp55HewCwdvk5IcygGZL/KxP3ou5va6FOqxyG2O3E8apQ1xjWBHZ3qCq/4NJNlyDXu54Ew8DtAS3lo+XlhG+q9FYbO0uaz75hOpbOXTueo5Tmbz+TkcSt+0ik5F3uQ45wkMEWC86TlLd7YXInaVTWUHns4m6gBrZPEWWryuc+6GeEo5UYrtQsKIKLWhMWtagYhZqZ8u4s+MAr0a8lVe1jrz2wba9a6w==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sclOH4gu+06CRlRthF4xNGjAq8Z/7KgLiS5jaW9XMzlyC5RxkfJq7RKhcjpXq8Qs6J5FcyahNhAuVJ89VzP7YSVXl+ILePpl2HLzI083NoKn92BlOSs1tPLdfS9aBL9oz8H5yECAcCicxEKx1CzhtTKM0lUzPLdotdQ4qb0wxyZliZcO2r24SjASviHePg87tDC6drvaaDGsgjpMlI1OaFA9MI3qIzlbAxJ1UD8SU0CEW2n0agbIYePSJNRQL86xZdcyNM3IgBth1hT8/tlCOCZdQjFz+3t7omT8rBp2K5vKTuhu4dVfvL97bdgYubrt8iLVfid/xn8WXUg5U7SjydllN4Ck1gF4kC+q0ZvDG5ha8UCBIotp5M3S+pyi2PRTZstVJ8D/QBeTnKYB1zPiBzaz8hc1dJbGqBtR5fIEoqQq8+q5aRVtSncccQ1TtkoN
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 10:03:46.0498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b83afc6f-b9cb-4ccf-967f-08def14681d0
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB11944
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 10:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242645

From: Daniel Turull <daniel.turull@ericsson.com>

Some upstream projects bundle vendored dependencies in their source
tree (e.g. nghttp2 ships third-party/mruby, which has its own
NEWS.md). The changelog extractor could mistake one of these
vendored changelogs for the recipe's own, misattributing unrelated
upstream changes to the package being upgraded.

Exclude paths under common vendoring directory names (third-party,
vendor, external, deps, etc.) from changelog candidates.

AI-Generated: Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/lib/devtool/upgrade.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 13d51bf952..495a5b8217 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -55,6 +55,13 @@ _CHANGELOG_BASENAMES =3D {
     'perldelta.pod',
 }
=20
+# Path components indicating a bundled/vendored dependency rather than the
+# recipe's own source, so its changelog-like files should not be mistaken
+# for the recipe's own changes (e.g. third-party/mruby/NEWS.md in nghttp2)=
.
+_VENDORED_PATH_RE =3D re.compile(
+    r'(^|/)(third[-_]party|vendor|vendored|external|extern|deps|3rdparty)(=
/|$)',
+    re.IGNORECASE)
+
 def _run(cmd, cwd=3D''):
     logger.debug("Running command %s> %s" % (cwd,cmd))
     return bb.process.run('%s' % cmd, cwd=3Dcwd)
@@ -591,6 +598,9 @@ def _extract_changelog(srctree, pn, old_ver, new_ver, o=
ld_tag, new_tag, workspac
     try:
         stdout, _ =3D _run('git diff --name-only %s %s' % (old_tag, new_ta=
g), srctree)
         changed_files =3D [f.strip() for f in stdout.splitlines() if f.str=
ip()]
+        # Exclude bundled/vendored dependencies; their changelogs are not
+        # relevant to this recipe's own version bump.
+        changed_files =3D [f for f in changed_files if not _VENDORED_PATH_=
RE.search(f)]
=20
         # First pass: collect per-version release notes that changed
         # Matches files with a version number whose path suggests release =
notes

