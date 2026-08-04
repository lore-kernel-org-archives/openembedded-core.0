Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C204C5518F
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:11:56 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17288.1785852711756048471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=WE5r59/E;
 spf=pass (domain: ericsson.com, ip: 52.101.69.59, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKCvGvxFrQifdHixnJ1N50vatt86HM4RxuSmPunIgvQiG72xoMgGTfG0T1KSiGi8xNJsZ2EZq7doDs53MXCkw4GBPFcOHaYPt0cN1h99XGE+mQBBnIKHhDR3QHHysdmCFsby3uXFum0Am5Fo2jhTNlnskt8VhWaASJvUzzLnoHLbvVz1+i4PtDJZb9jv5QITMfOBTfNHTGMNUks2qSbKF7+pP5Sktdiev9JM9ICDWKxjpTp09unKs6jQ5stveqjx8ZtoXcZ8XXozZOoKhXYKe8TqitSbqqDHU12bF5tEPz1DPsSfid4GzEbVadkB7SsASDbTflE05NpIc6KadYf1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GssADpR4vbgHpKIxMrbIsYSkDUURKLOekGGV608nsxc=;
 b=r8N/vF8v73Ey3Q+l4lro51b8oTFzAzANuN+LnisZo0tXg0Wg9hZI2PJg2EvcqWcpuggUZlN05UvA4kQFVaNSWfu+VQZwQEC88NidePBrgnb+M7S7ut/TlEOmfzB5bRYTsVaungsJN7IwPvLXZP/X5MFHcsJB/lAAHVRLq2tjAl66/WNyYPB9ByVw669tLC2GbGe+afhRvr/qv654aPizPmwEFscXnVmXVzKsKE9P9hR5/2x7CTlbZDWTFU5HM2uk3wHAH0N93HGT5qO611Hk3AgZGTcV286fM3O2uV7NEtZU/ZAUtAvTuNQ8mLMxGP87N6nxlJ5jz6gt4OFWJHSwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GssADpR4vbgHpKIxMrbIsYSkDUURKLOekGGV608nsxc=;
 b=WE5r59/EsqsyKFht6fEMov4+RV3cwI56o2n3J/b5yO5ix/umiJzrNsPd56k8LHxRyT5V6ZKxv3OOL9giYNSi7tNGWjkKPnaE4WTffyZdWYcvierpCMNdLW7EyN5ShUB9ML1KrEWvnj7hEroMSCB0YBr73wWKZCPORa3OMnhEDvWPdOGfnNVNsu4fTWedQKMnYM0rM8mrhN3SeXQO3mb24l8ly6xUtbS70uqfD7NYtQ62QpWCxBrtHxzUB/tLkI0g8CKWPldVXFdW0otCMLX+dfwSLsJyJOP1jBy2WtSPuKRqwEBlFX+ozqQHbsV+FpjKVS48CPPVy6q67nElfVErKg==
Received: from DUZPR01CA0157.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::21) by VI1PR0701MB6973.eurprd07.prod.outlook.com
 (2603:10a6:800:198::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Tue, 4 Aug
 2026 14:11:46 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::10) by DUZPR01CA0157.outlook.office365.com
 (2603:10a6:10:4bd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 14:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 14:11:45 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 16:11:45 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 18D404020C1E;
	Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 5772E700DF53; Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <elin-upstream@mailman.lmera.ericsson.se>,
	<openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 7/7] lttng-tools: inherit upstream-stable-release-point
Date: Tue, 4 Aug 2026 16:11:35 +0200
Message-ID: <20260804141135.3779287-8-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804141135.3779287-1-daniel.turull@ericsson.com>
References: <20260804141135.3779287-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|VI1PR0701MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ccb3b4b-8f01-4eaf-c059-08def232513b
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|13003099007|6133799003|56012099006|10067099003|11063799006|12006099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Mf2SBkOae0ccfHxvw60tItNprFZgPQI+i8BVPDAP/5461W3NI72qOoJEDxB+Ub+V2h7s1D45pYS+Ig+MQ3phDgQNhGCnqwUanqyoikXEDTqaMiKmpuASEZboMIXuUxoZrVsIouC81gB3y/1sbhuDlJshs4p9w4Ytls2NVYeLrgSSvUQKgtuzlpX/VSXV3yOkVb/LieDtxzyWGLcFC95Qw3hEgbYLAvmRhBE5xlQo6bnizlzrj/bSsvgduFV7HegSeTGEvupY2h6yjgjem9Pu6HWoygv3a7EIgUB1b+qGI2ryWDaXxAFhZNQXs19rbZxoAmkQ9q/n9Wj8Iz8hVgPFizyY5vjyBGm/rYwzp7QYW3LXN4y75lCSrWBGfv23l1gAtnDUE9nY6oiEY994WIONbHHfLXYoV7zFSqOYlwaWKePyizP6qLdapM8cdBL6m4MpIC6u3jOM4TEwjRn2IE8gh1pNWWLPJKCLU7YxhgECH5zqMEnnMAxyw3w/XtA51Rzzt8Ddf9A0if9OPkFnsf+6AybNWzFSSOMbsCh/aNz95AvqfqKXtDm2B/Q9xYmH2QmXXe+to1Le3zl20aJhKocrKMr+TSiy80sLtY2eg8wwNtmThP/yWKZyMq01UK3lLSPC4nmqkiAhfB0dnqWbdmYQipoE9AgSJ5ZPWLAzXHGq6LY=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(12006099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gXct1LI4+q1Sgu9u40sclUEUYfqMZIJfWxkQDeFx0hHqP2QnLOE6YvE7SiK/dk+BDkKheYr2G1L8O+2muAGgvp0gqxsCK7KCbikUzTq7esm47cCAEFZWOsfHJPWbbqHegg31UvomBUbKN1nDuyr8e8jOeGt8L+BWeHJ4yxs9VQxFTuziPISIj/NCgdSsIf4ne15pN8GtSwqQshkLbE48oGE8mH7BdzBNiTjEgiPdtWaNm8tLe3CTkfj7VmK5TZvV4zv/ILocyIuiLTlZE1SDcQeSLkFdqi72I/KHkKuWTM9u1hzpfr3VMpB6N6TNkpvqZLYl6dakXQE3fRkOSSdsrd7DJjt+CJa11Zm+Wr651UObn9fQKXSimqG+Zza2vOod3ISTi93GFt+3SJPYgUv9ieoYJCkGw5nm7CLLva6I1jMTwl9VZrTSRHUpcFk1F5Ue
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:11:45.7508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccb3b4b-8f01-4eaf-c059-08def232513b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6973
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242771

From: Daniel Turull <daniel.turull@ericsson.com>

lttng-tools maintains a branch per minor series (stable-2.11 through
stable-2.16) and tags point releases from it, releasing from more than one
at a time: 2.14.2 and 2.15.1 went out the same day. So upgrades within a
major.minor are stable point upgrades per the OE-Core stable release
policy (ref-manual, "Stable Point Release Upgrades"). There is no written
policy document, so qualification rests on the branch structure and the
release contents below.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/lttng/lttng-tools/blob/v2.15.1/ChangeLog
  https://github.com/lttng/lttng-tools/tree/stable-2.15

Upstream keeps a ChangeLog with a per-release entry list, and all 48
entries for 2.15.1 (Jun 05 2026, against 2.15.0 in February) are fixes,
tests, documentation or refactors. Seven address machine interface output
alone; the rest cover a consumerd lockfile fd leak across fork+exec, a
missing default kernel probe entry, an uninitialised read in uri_compare,
a musl compatibility fix, popt error handling, test fixes, and one
refactor preparing the CPU-mask escaping fix.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone took 2.13.4 -> 2.13.8 and 2.13.8 ->
2.13.9, scarthgap 2.13.11 -> 2.13.13. wrynose has taken none and sits at
2.14.1.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb b/meta/recipes=
-kernel/lttng/lttng-tools_2.15.1.bb
index 9a56d1711b..4623e114ba 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.15.1.bb
@@ -56,7 +56,7 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng-to=
ols-${PV}.tar.bz2 \
=20
 SRC_URI[sha256sum] =3D "8b6d4ba7ae2c036f7dafbb4e29717677411078f9a9d961b2dc=
7c1ba16273e9e9"
=20
-inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
+inherit autotools ptest pkgconfig useradd python3-dir manpages systemd ups=
tream-stable-release-point
=20
 CACHED_CONFIGUREVARS =3D "PGREP=3D/usr/bin/pgrep"
=20

