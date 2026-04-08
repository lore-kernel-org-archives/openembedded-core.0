Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F255F10F994B
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:39 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.107438.1775657858333361571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=MRNKOzPM;
 spf=pass (domain: axis.com, ip: 52.101.83.69, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+jEWd6fyEzA512IBtPyC8wT7iD28gnnnZlxCkPDoL0yWoMKFu+/DgLBRCfAsclbl5684nZYDZaKONkVHpL2rtifberZZhcrI7fw9ka9NeCcRGUKknyLHzaZ+8Yey7NgfAUS0WLD+94u/0dymLAhEa4hVK8rtSL6EmpjizpYQQmZZ+7s6ElBDpL9o1T1hSqQe3wE6lyyxuiv2G9jtMyakQ/BUWIJvDp32xpgjdtJGcIo87MjvwJEvkT/5xlfl4Zlvefs/Whpn2phaI7Mq4nInb84CgbjxmS5QDOHzZL7Bl0ouYBH5qD7M6gZZLuhjFkJCb5GDpj7raqybH/p3J8Y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOohf4aq18Ix4Hu0babc6oswi3ivUUJzmsKOyYaUJlU=;
 b=UaeB0i+edSlZKQ4goJQWYRNICPWDUZtI/FFgm61L7ZtgSfdYbZ6TRvwvSN4coAc7tRP0OUrU8dmUSjEkoW8hl81GHk6sudGReOLMSRq3PavRVwVqvj5kzzudbwuLTsbpPJxxbprAchTGF8FBq6vLhM8r5GNU/R46EifqyUJmU3IgvkRRCmFexswgBciuJ0/1kkCosaZa1rxM+BxVKDrguVDlp9M3TnBdXyYJJIPZJx+EdaWNjk4q5AnE714xITwWKPDbrqfjzpvY70YCrLB/GAQpQdpOjAk1FEkNtSPj/SeWS9NWHpuc7Ltc8RI2UF+jx5Pz7cFYFaGnZjHpM/3iLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOohf4aq18Ix4Hu0babc6oswi3ivUUJzmsKOyYaUJlU=;
 b=MRNKOzPMNw3LSIIG4PHHf0408E9T/bcO7UFcVBHcgkaW9Jquztv1SCZsKB3BH/fEDlQKqJKochr9ERHHaMc8ykxD2XAryUqahAbcrDLzGr0u3ScPWTCz0eyVk3oEXbSQ9kC9HlbpsIsJEU2sktF8QR6ngjXflplXywFr/clMzxc=
Received: from DUZPR01CA0298.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::15) by PAWPR02MB9709.eurprd02.prod.outlook.com
 (2603:10a6:102:2e1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 14:17:31 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::5d) by DUZPR01CA0298.outlook.office365.com
 (2603:10a6:10:4b7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 14:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:29 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 9AB4A247B
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 976F912092F; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 10/10] gst-examples: Upgrade 1.28.0 -> 1.28.2
Date: Wed, 8 Apr 2026 16:17:18 +0200
Message-ID: <20260408141719.1086823-11-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408141719.1086823-1-pkj@axis.com>
References: <20260408141719.1086823-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|PAWPR02MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: b4976ea9-9f8d-4693-8106-08de95799171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Bs/GZ4Qv3ihprvNMOaZNitIikj9ui/uKHbvy0OZ6YmlnJyGXVgzHSE3TZTnCfE4ANn1dLvRl7hfrcPjQp7RKzr342VmOmVXIUUGlMnC0iybP7OSV6Foqe+CNkmEdKvdTXEZjWtJl0C0RY02e41GBO7pfFVL3rfvoO4N1dbj00MUXq1kmCvydqAhmLpKZDUKoUx3Ba3HPza2P86cKvHVDyojhayVHwe+GRz/2IC37Qy3YHhG0Rhm/MRtnSfuS73FWsAJio3qZKWQpQ/h4d/uoZCIDIZl1w3XrMQGwQZgevjsYRqFRwOJA2Y56nGGuvDw3D3pzUzUzl494paqStiLsn2BzZhukhzgQZvDjChjW7QK/ggNSgNW4he+O60jI9QFuxNdL56QgknJnYXMfX/8+QjCGJt2tfUwGloUGG3OijuzHecm+q7MgWwVsxwgCIr68FjTUFDsrBSVLmhvCbrHom/U1iks9mS4kv8j1GdsQhCfmuT6izDlCBHhsYsbzmDEbi8Hub2s5huWY5JvHzheB8g/8S2qP6N9oYsgCoR2kP6B18Lv3aey9nEmFu2cL8iDUSbsFINBM2SI65o2Z240gp3Qe/9Qf8edvTUEE8bYD/zoGIJEK7GmUaHnlXKaRaoxwY8mhg3Y4pT9Wb4vrBXDf9/uu25kqlJUlb+v8jNAizvEBtYQErmvTdHzFX2drShXC0+kyzso4/2Jm1KNDoKaKxGa96nzm1kFIPyvs4YPJKFho6CG1HJ3Yxsai8+Pa9TIzvEAOpdqpYrnETyCGkLPXzQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qOv/9heRjI7IVXOeDwM+XpcmycDamLPf4vc+NbGZRa8cg/nimgqoa0HMQa7/6SwyS4YbBrg4BLDqjZ/O7CXxQfGlGUOPLwuG/7I4f0Ptdlu9bakAE8U+rczGLGDNT7VZFFWhPisATsWAY3+Hx+Q3IAafTxpSJegUsKf9rEALSXA+iW+FWlqSvLTqhmXTFW9qaaa2i8zBkvFttZiwye30uvi8OkwNYVj2yHVm9ITkuNxfaR5BrYe2oLfBdVAXKHMr3SAl/gAATJSTv2Tw50alFwTWVVFcyGs5CmpqCWBdtLsmm9FIwI9udsDxfrnKCoLgnlpvblH/QsbXmnrSAVefMxPIp08hW4uqj781oX/Tmkd+WmOm7xMbStundG1h4VuasB9fq3EFLsj4Duvrtyu/UjUWvtpK/44abq1+ngdsM1ZrYre3BMJFY/EqFnbuhDLr
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:29.6400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4976ea9-9f8d-4693-8106-08de95799171
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9709
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234850

Changes since 1.28.0:
* b2a3b2e: Back to development after 1.28.0
* 6ec50ef: tutorials/android: bump up ndkVersion to 29
* 4f6b36b: gst-examples/webrtc: fix error reported with android NDK 29
* 425d36f: gst-examples: webrtc: Update Rust dependencies
* dcb37e2: Release 1.28.1
* 32113a6: Back to development after 1.28.1
* 43421c2: Release 1.28.2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../{gst-examples_1.28.0.bb =3D> gst-examples_1.28.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.0.bb =3D> gst-=
examples_1.28.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb b/met=
a/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb
index 066454608b..304d71b637 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/gstreamer/gstre=
amer.git;protocol=3Dhttps;b
            file://gst-player.desktop \
            "
=20
-SRCREV =3D "9058212f43074ef7df229e73cea135c4ea96e0d6"
+SRCREV =3D "43421c2a5b8ac5cceb52b11749df40301e1de5c0"
=20
 S =3D "${UNPACKDIR}/${BP}/subprojects/gst-examples"
=20

