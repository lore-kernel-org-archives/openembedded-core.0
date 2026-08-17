Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3E4C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 10:59:24 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27788.1786964360638353211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 03:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=mnjITaGc;
 spf=pass (domain: ericsson.com, ip: 52.101.69.38, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFE/sJ9H5DrJdcgS0qBDOhUrf7IrdtJuGsWgbjjBNlpJD0HsSFdLQqhF0kZ5fLJ2M6TssHtt2jf5CBdQmjmVYX1iEqe/BOCVF6Y/AJpG+yXVc2EUiuq8Lq/0AD/Yl00LekC7WKqHgEcAGnqX1JraapdZtBvESG9b3070iFts4zxCCCmdQFGs/TaH0+yn+ShgEB1ebVLp5rVqsGpMLdRP0n5P6/E2GYbvNFZizGcTruLGks4blTtx8KEySKGgCRgxqen6Gef+rCcp9YbfpE5IcXMsZ1WX7+BpUmepx5z4QZtwmCPwnAP6qaAv5+F5DoW9Tu8vUw9ugj1MgkdSVbZxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlKCdd3aCPEYwKZSvU4dtiyoVkUPtGK8g19SwknlNKA=;
 b=krcnMN9RVOZ7H/7E2GgPIIWXZTFfSekFoDAiXQ5addtXwtm4oXR7BAiKutNtXdH3XzNlKBoh6Tt+q51g9gYeiSTvuBzteZu4ajGVHHSJpPqLFrLKASCfA6legQcj4bRAmah4smUxtJqMYAwzksD70+Ew74B0jqLQyiArGnfD6GjmMsNbFQxuFf7vjOCWfqDNjEJ3HTOuXGrb7kbzWdhDppUec4/PraXXCZle+woBoqBgSora0NV6VgFju0ahiZn88I7Bdrd4GNeJ/0W+Ij9hQpgRZolXzu7JZwbL913/jkHyP97FjkA/e25oAmUQ7bDVww/TkwNVYSrQ0a4GOaQHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlKCdd3aCPEYwKZSvU4dtiyoVkUPtGK8g19SwknlNKA=;
 b=mnjITaGco4tCzowkjxlOgf54Whkfhn/0Z0gG85+oPaDMa6M1Y9T6a6VrpRRmSGSk4TpAwELaC27I7RUfnaobQOlVXQCjIF5X1sacOQGh9WxJF2pBN82ijgy5D8W0qwftGQ3AVuElZoXgqt9gltUT02rWGPF2jbKLeiAZWI6k0vBUlt+ytmr3sTb+V8ltmTYNxmWm5FdpCFNUCSpm1nMk3432K4lUgXfQOyy/qb+p6xrypN9wBNlXgB6dY5qW0qOlk8bwg+PmpsDcScoRoi332NXynr0XAtn47zE3bnCMelbD9xNaDQ0BCkPftJmu8GdPD0I8HFifBQbjboJsTr8G/g==
Received: from AS9PR07CA0048.eurprd07.prod.outlook.com (2603:10a6:20b:46b::15)
 by AM9PR07MB7875.eurprd07.prod.outlook.com (2603:10a6:20b:2fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 10:59:14 +0000
Received: from AMS1EPF00000093.eurprd05.prod.outlook.com
 (2603:10a6:20b:46b:cafe::a5) by AS9PR07CA0048.outlook.office365.com
 (2603:10a6:20b:46b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Mon, 17
 Aug 2026 10:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000093.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 10:59:14 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 17 Aug 2026 12:59:13 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id E1CEB4020B44;
	Mon, 17 Aug 2026 12:59:12 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id B324E700CF25; Mon, 17 Aug 2026 12:59:12 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <paul@pbarker.dev>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH] libarchive: mark CVE-2026-14164 as not-applicable-platform
Date: Mon, 17 Aug 2026 12:58:56 +0200
Message-ID: <20260817105856.2295145-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000093:EE_|AM9PR07MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 532d0639-ec37-49eb-2ef5-08defc4e9369
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|13003099007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	SHcSp7xlYe7f2ZelnyILnC5mf+Z3dNZ3BETGdQwVS241QucTd3+IgxMxqeoIS1Z+uGXYIRV+CBavwMHmlksfRi4acFv0pQ8N+I+I2fQwOTmyq4rGC4pkVQsdksxAC9vKoCsxed135Rfan2H91DcIZqc3BnsM4rcwYieZZbLz0eeYD2GVRaQuLP/GcAvt0GxPwCbqI7jc8RZloMJwy1sLF14vOcAlyVcNfWfcUw77oVK2CPnAzb7GH54mwJ5RolEDAWIr+9eM5d1vgZFHbPJC95Ke/XMR4OCVL8+oN5+FVTFQIYWqXHU4oz1TqLMQ/VSAVWRIwIhMJZZ13Ubuz3eGaHoakFL5VcTatrzhglOcBS7+7BPDEFet5R7dzEdx6mirCjKiGJ4Ldg2Y7qESWF+Ifwl7kKnzSAJ3IATUcBFuxj086URmDxvOnLg9PoCYGMfDoKBt4lVoM79KSP1oTMJl/ZWNUyqGQBvKd2jbXhkHjwvkC+3wPE/WMtgWnYIDUJbjrCZrvganYTFAsxZKkmp5dphdW/LXCTUVEKbz1s4qtkJuWpSSqtslksvNBkOxmgxUjLCBpV4CDFb1/g0CW+GIwRUtOsPUkN+/aStrOLlj3q6Qxo6SEEYJ9SnckRAVtKyJSw2FJYIgI8KNA6q2bFqBkpOG0WMXT6zUkwPFekio/EqRWmzsi9lKp0eEPxvUocX4+ETvD4d2kbrcSYMXgceB0w==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(13003099007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sRrR6/cNkxT6CiWLZ2rAOJScSWaoC1t+TlsX17DE1vUAt23XhKmWydURmsb1eD22YU9jBCbKq9SSs7pm2t4VEuGT072HhVLmJZI0mujCSWNCMJ6oRUGTZ3YujnxVU2kfTBaREmy/XbIUg5qz9Q5zEGDQPApwHnXhTaNjSxUsj6OmzHCqF+KnRQWLcqizD5HkFb28WDyqiHxPulWBWa38D4H2EIyWSdZH2KSHvp0enU8beW+1BSrZG6rZ3aiPRFWiZ2DoX8ZmfQWJDyqQQ/CqcwRGGqEw2tzIYVjK0YD86qi6+FS2j1WrRtEQ0A8/7FuuwVtx0fBLExoe6WXbdFyanWhSoojGlo58VciSXo/9NjHBtQO6+ghB9DTgBapUnbmS11kNsURQqhcHJ5TzeRRLE8j14Pw7PFNCn3XedchqRIqU9Wyf5nwtrf09cqJ+vQwg
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:59:14.3387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 532d0639-ec37-49eb-2ef5-08defc4e9369
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7875
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 10:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243607

From: Daniel Turull <daniel.turull@ericsson.com>

The RAR5 double-free in init_unpack() is a regression introduced
upstream by commit 620bdafa on 2026-05-16 and existed only
on the git master branch until it was fixed by PR #3071 (commit
1c914cdf) on 2026-05-24. It was never part of an upstream release.

The upstream release tarballs (3.6.x/3.7.x/3.8.6) use the older
init_unpack() with unchecked calloc and no early-return path, so the
freed window_buf/filtered_buf pointers are never left dangling and the
double-free cannot occur.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-14164

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-extended/libarchive/libarchive_3.7.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.7.9.bb
index c167b164b4..4bea9a8963 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -82,3 +82,8 @@ ALTERNATIVE_LINK_NAME[cpio] =3D "${base_bindir}/cpio"
 ALTERNATIVE_TARGET[cpio] =3D "${bindir}/bsdcpio"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+CVE_STATUS[CVE-2026-14164] =3D "not-applicable-platform: Double-free regre=
ssion in the RAR5\
+ reader's init_unpack() was introduced upstream by commit 620bdafa (2026-0=
5-16) and existed\
+ only on the git master branch until the fix in PR #3071 (commit 1c914cdf,=
 2026-05-24). It was\
+ never part of an upstream release tarball."

