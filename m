Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79B8C79F85
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8950.1788343183465046306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=Mg4ggTQJ;
 spf=pass (domain: ericsson.com, ip: 40.107.130.29, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsYqHzaY45oSGbYaBR2sOnGpny6ATi2jpZhCfXiLhKksUjKGryAFbRpO63BtJ+tAeNb+KI2xooVY0Q6L00pkM31SKBK3SqMsACJYVhRL9s/WZZkh9NW8c+r4dakWd0RZcXYi/I0pncM68+dG2fofinkTcQx83qhVG+f1IfMwG2lTx0iTrBXldVyDebaCSRJCcRW3GTowHJrspOKxvCcAsVJQHDwCqLvbp9IEM4IOQeRi2z/95bWPzKjkZ4cAMwvyH2rjk9dXxsmVpuQp4m/pFYhVTHwKVKc0ab9j4rXupSzKmKG6UUt2660SyMjE31z+CnBGEtOYNcDClOm86jAIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp+KidgEzQSN3WRqcgwCH/gXqZkoRiYOGVR7cvV4aDA=;
 b=qpHxXAMywn2FDNu7TulvcpY/jp4xYFAblWxTDDJaphwg0JH/bjvpgZn2nMhIhPzDGmLQBwl3dJ2SfCtwQnFa9CB4Kn8F3IPdNvrZVkLjh3NkGBWanjh6Zjs0kcy7XNVZw1LGpszqXkYrsnDGMeTCUqToKCb10cY/ZTln990SbBZ4FqxzmgvlUuGI8QNSAqG5x8qHZ3RWU3qXJqOn7oFUvHyqFGNKJlkSGQyh/49PuqcclYJtxt4Hi8Dp5Qn+yVXww5h7ivM06/vYX0xE/Bt4FurBBXTjerlNDFBWrykuZohc8GTJjKG2YKA/c0fYqAB7JLqBvzY6pNyf9trjsDJ/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hp+KidgEzQSN3WRqcgwCH/gXqZkoRiYOGVR7cvV4aDA=;
 b=Mg4ggTQJMNBhcSp1SaFLW9uvrxSR5/Mjo4VVf5k8Z/bAKFksCukqn1uDZ0jc61mQtyUZrw+MISBlW0e5XphnfyCTvXE9h8/5YkjSR5yzqtMOYjaHMkNrsQIpUKbt+n3cVzaq4b5S63lEDHm4jgdir1C7WRIYyxANu4QQGKk9TdOcziIu0ydwXRcwy9F/ZBZhjS9Nd3yI+nrBdQdv0uF+fuVWLBQT58gJfoPWRmXPLxyhunGvSpx/OPUzBcjiGTG4E5v9kTS4iJVSAFicyTKDLJVaYpNjURVBeuLcVbr2IGCtyrEdOBV9q+BDTy8h7u30/gN80kjkfEt2rze2xqjWEw==
Received: from AM9P193CA0011.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::16)
 by GV4PR07MB11486.eurprd07.prod.outlook.com (2603:10a6:150:2e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:35 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::27) by AM9P193CA0011.outlook.office365.com
 (2603:10a6:20b:21e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 09:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:34 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 30A2F957FC;
	Wed,  2 Sep 2026 11:59:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 7E43E700E7EA; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: [wrynose][PATCH 16/20] lttng-tools: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:16 +0200
Message-ID: <20260902095920.2840293-17-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|GV4PR07MB11486:EE_
X-MS-Office365-Filtering-Correlation-Id: aa003b1a-5530-422d-457d-08df08d8e45d
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|10067099003|3023799007|6133799003|22082099003|18002099003|12006099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	bZQkQhys/wFEnGvhucBS0bquaqlxlvrRbkpnk2foi2BtC70hySkQJmMRIEzxQ5iGpELOHN4WGh1k9svXrVqfgllCBXBpZZ8WNtVJRYDH8hHfxIeSzSbOrZNA8qmyz7tfzNLoyRjVnzZkeiWpEJr/Kli4VIz9YH8NkNrVmVG2ubIyXB7rJsgsFYUYDCF7S7vunIpsohwX125r4B3RmNmxmcupp+FH3XBYyi6Hou8M8COIFUUyY4QQ9psemW17sF/rxu45fmoOuaH7xbOsPUrahQFUpAklTHod2zyqLsgzmQ1j4Qan1E///8aShYdZX4F27YZx7Q8CXsFLaVwt7Ktv8QwD5orfxJ4Oik9z/29/nhxpSji7iPc+kmTjMgLExThTpNXFCHr5bjmSuGVfLKvibvhaAsZrUuOll8XnMb+pfjtW9udV626DBkZLtzqGWZSygji5UdZwzzOoUFpwALx1hrQmuKBXHI3hPk15xbV3R+R6qz2v5VLz64Jjt6CqaZXkjsS6kQwSkSlkg/bvDg8p7od9Wk2BPSgY91FqFcxJWVjHyNP+pBJofAPsVsBJhjx09YF2QpqAJ7R61YEeK87cxp5WarKxo33OQmMnPko1+SsPFIlvlJr8pDor6HeZE7ee0KgVq9Nb7Jq200w88g649oM/oZwmjaEsMOVH93WDZyM=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(12006099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/Z+FC4Y1QcsdbP6e5hDVFvuKyt+fGcw1pyYoZfU6bGP/LKKu5p9OYcsReCJtwBz2BzPINTwGqrYZsyHRk8T1yOj/y8lEnG0t9Zvj2+9qjHxyQfQndgQKoyYOu9WqWDmisfdPETd9dhoarfzueGyKae5CKgfvv+T4Q4dxCm1Na1JYW1ebLRmKB9gTNGAm7XzD1HjBcjvpdFHpLuLQq3/2S0pxTFL708KsKx6fd9p9SzUFlgGwfsabI4/jK03NOuc3j2btL13TXxoRFe43l7Z4DBqwxnlgXOyThiuJjvlwGO1/ZtWul5X6L5lUqji71hBhhEhoFbaPLWEgTqYWdco3vRQLOvm8kGbwa4QZdCEKQ70vdzJXC6WdYkegLR+/PGi8drmkXBLJTBQYQ4gZmnFtqHdVpUnxQcGXibbIzk6FjB1rTqi+ueUdU1IKM326h+qy
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:34.6580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa003b1a-5530-422d-457d-08df08d8e45d
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR07MB11486
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244924

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Adapted for wrynose: applied to lttng-tools_2.14.1.bb (upstream: lttng-tool=
s_2.15.1.bb).
(cherry picked from commit 40f22582ff6989f9275808bfda229a8ec78504e4)
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes=
-kernel/lttng/lttng-tools_2.14.1.bb
index 3a3f2cff2c..3df9ed1c00 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -54,7 +54,7 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng-to=
ols-${PV}.tar.bz2 \
=20
 SRC_URI[sha256sum] =3D "0e68eb27923621c4bc127cfce40422d28cf7e473fedf6229ae=
6c32ba5c5b7c6d"
=20
-inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
+inherit autotools ptest pkgconfig useradd python3-dir manpages systemd ups=
tream-stable-release-point
=20
 CACHED_CONFIGUREVARS =3D "PGREP=3D/usr/bin/pgrep"
=20

