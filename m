Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BA8C56202
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:11:56 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17368.1785852710127280316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=E9oD8MuA;
 spf=pass (domain: ericsson.com, ip: 52.101.66.41, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MReOrlmXvSq5u9f0ioYkiVxfQVqc3WgoK5c0qYhUuqMm5bFOmZk7GQkv3ol2znCAUUXc7EEdjAQYG68l6m6T3uNSVIvDk4AoOA1UUMGGUS5lwtOdcdJhBhVVvOr4Y2yumVvoVGq95pkCBG/YwA2euQRhJpz2N/leep+aquWbq42MW709SAsTVoyz3L2phrLHsaGZ1G7U+NTQLxyUq3j06iabcUry2Du6x2wO7y2xX5tijAXwum9GW0hJse0XAx9iIasUtAEds8kGtm9FG8eFHMbLggAhPc1upSLgYPz9gzyVw2Ay1X544o9moksAIsgqb1TgXWdtJbjIVSQWjQR6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfGx3w/PN/DQiQytHwpMh6TWxvDVf4Xjl10e6q8WWqM=;
 b=Yfq+9AMx9eJ4H1ODXvavhpFDbawT8mkVpn1monJFKet6MbU9uEUxqWe4S6D1KipdJMyud1SKqhi9SyeYcGw589dOLY0cDqHC/qyH+SeHkbkmpEK3FSkEyFbgSCV6Xfm2EN4xucVPAwYsFnQxGbfC/d9syck+6CU5PIuMhDEZhVFaiE1wbZcCkf7CO8iFxrY6uNT/LjEDd3KohKXa8Ttw40pplaLf+XKyjHBqv6sLgmFbxYq8H63Cbjy/1nBJUQXf+UHRTuq5/QExXxCXTQUgBVLndAFG4/kHksqYakHZsYewD+7cJiTMZVaeOMyPxoiZKvSxauDH05ZrfLk/U+u1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfGx3w/PN/DQiQytHwpMh6TWxvDVf4Xjl10e6q8WWqM=;
 b=E9oD8MuA+i9fMzRxARMbB/NWdTn7n4C+qe0ssweSqkXn8hfCVJofvjga6pHJg2brzkuN581DxvoR9nOwzPYGu7tjzB7tXtwxzFuOLNEXnXePt8GLGVLhB5Lhq/OX017bwdSH0wTAozSi7tdbyop28MENxUrryc6JolnesqfnSqzalnlrhQXjZt97QmHOY/+JdPvzi7wN4e0A6K3ZnvSDKkvImpIdSO6ZK5QCsdxrls56lXuxOC77D675myMzO11HsASNOsIVLY0W+XH74U/4rJwwcEWk4ZlWdfISiohF7r4WwPfCC4bpdz+6b2vDaVJNQoju1fqc/O5wPqweliHRCA==
Received: from DUZPR01CA0161.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::18) by AM7PR07MB6945.eurprd07.prod.outlook.com
 (2603:10a6:20b:1bf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:11:45 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::5b) by DUZPR01CA0161.outlook.office365.com
 (2603:10a6:10:4bd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 14:11:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 14:11:44 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 16:11:44 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 6F0014020B6B;
	Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4344B700DF4B; Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <elin-upstream@mailman.lmera.ericsson.se>,
	<openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 2/7] python3: inherit upstream-stable-release-point
Date: Tue, 4 Aug 2026 16:11:30 +0200
Message-ID: <20260804141135.3779287-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804141135.3779287-1-daniel.turull@ericsson.com>
References: <20260804141135.3779287-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|AM7PR07MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: f93ab0d2-ac4d-49e7-f07f-08def23250b4
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|10067099003|11063799006|6133799003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	ePJkmENY6G9GZC0yGzmQfm0evUC9gE1c9Tdt7r1Wlrv3YOE/yRUzXSH3PFB1SDx/WSMMMwygKc02E7w9QYRnmP2V9tSt5EnCbQrmMZzPjWA9vrpz1rWw6aAQqlCjMWsi2OFe7n79VlVcjrS7rjBKRXfaMvRdo3knok0igCPaJyfcAU7HJyc5i1yDqyMklmTW4FYJgDesQ7ek6By3VEMioBXmtfkGegZ6F0YQqzILEFEfqDyHHUXbUvenGqAEHlFeUXKynRcpRS4nJm2fzi2WWUdzPE2e7TJAljA6kJoccW3/1gFlFzw9+Ce7o5JxUx9r6HUypbaHD3UvREr0Xyfv0JGpiQZYXVrUoyXKzc4Y73JFH/k05G4JVVS1XaaTMA0NtQXH6RLRBhBs3tt1nS5bXAP0kROKvDZrmk9vCmLfTPHLRY4HPyLGfD+meC8t8QytK2Rl+IvMfuDdM/q4qQUwAr4hshqqiOQRdydA5xnpgQ3MWUZzh+xFlMZY7gPc5dRhREpqLli3LA8MM5pUof0EfyCHG9s23eSywu2swdQ6Ys562NQw1KzJ9wEkts9B0Ei0WKdaXiT8LqnAi79hKIBwPVnoEkzijMK0wVR5Jz0Z+1kF4gyXi/HgskoTmG7e4cf1s0D6jiYaZAAuiP+i3If36uMNSRKzZV63pdbIu31CBnE=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jdNK82dlEyAuHdul326DVFZDUcZ2XBhq3McFGlRo8cQ62eoJozX9QgSI1+rl9IurFIxlZrPU/s1LGfgi6LxW3O2E62hdfBBLGgH80dYiOuWzVYeEK8Iuz4JHek9LPN8lPRp/OboLSg7NGBaY+TJbc84Z2r1fDNxrUe8Stub/9sfiB06jsxc7ppVSC5BdW4SvHa5X/Eu8mRxNMtCWL7JEslYC5O/4dX/wejSd4yFg8JZF1/aHHXe1M5DWGFJ10dPxBMv3US2R5ppJPpn03HYI5Eg3UtHRxKsBInVVrDKIG++0hdb0+BiSTH+Ew431NISJJGcWiouJxvUeisDCP9ROOB7oBvvOCafhI6lsZj9RQcHU1qZtUrtf6eY1nH5tCK7GzYyZkhRgwClxAnIYP9uBmiNDSr3iz1MOn0+3bPdp5jXuJ/A3QPJgTROl06kMcDao
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:11:44.8677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f93ab0d2-ac4d-49e7-f07f-08def23250b4
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6945
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242765

From: Daniel Turull <daniel.turull@ericsson.com>

Python maintains each release series on a per-minor maintenance branch
that, once released, takes bug and security fixes only, and it releases
from several at once: 3.10.20, 3.11.15 and 3.12.13 all went out on
2026-03-03, after 3.14.3. So upgrades within a major.minor are stable
point upgrades per the OE-Core stable release policy (ref-manual, "Stable
Point Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://devguide.python.org/versions/

Checked the last three point releases by category, since these are
substantial bug-fix releases rather than security-only. 3.14.6 (Jun 10
2026) has 8 Security, 32 Library and 17 Core entries; 3.14.4 (Apr 07 2026)
has 5, 59 and 46. Every C API entry in both is a fix, so neither adds C
API. 3.14.5 (May 10 2026) is mostly fixes but does add RFC 9309 support to
urllib.robotparser -- one extra capability in one module, touching neither
the language, the C API nor the stable ABI.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone 3.10.4 -> 3.10.20, scarthgap 3.12.3 ->
3.12.13, wrynose 3.14.4 -> 3.14.6.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-devtools/python/python3_3.14.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-=
devtools/python/python3_3.14.6.bb
index 77333ce3e2..19f4941bac 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.6.bb
@@ -35,6 +35,10 @@ SRC_URI[sha256sum] =3D "143b1dddefaec3bd2e21e3b839b34a2b=
7fb9842272883c576420d605e9
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
=20
+# Python publishes bugfix/security-only releases on its per-minor
+# maintenance branches.
+inherit upstream-stable-release-point
+
 CVE_PRODUCT =3D "python:python python_software_foundation:python cpython"
=20
 PYTHON_MAJMIN =3D "3.14"

