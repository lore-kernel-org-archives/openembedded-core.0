Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759D2105D99D
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:21:00 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98130.1775618450364186998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=BXT6Kj7x;
 spf=pass (domain: axis.com, ip: 52.101.70.18, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZwjq6PISFHhcsPZ/JYdUSyAonlIHtFdzDNHupdPWD+wVeCFdNChXDB2pzfbxTgWDssc7J597Byur5VAfIpqkLGOQNWBva2HNRE6c4lISVR4p5pAa09ENbHfTw3nIwM+YKKnWvUOzjR/p1LJ/u/CsHJXpIhvgg+DkwL6EeD4GSEs8m2QQD16Da8yDR/j3aJrHR/12CPFRrZiL8CFBEOd7yFeeFRU0D2v1LeUKmSVEN2TatdQEkKG2suDW2HsOz0Q62wcP6urzWfnFqMTrUA9jYwnZnxLNVmGRim41pk5kqfCBdvR6oj7pOozdc6n/wiR/npLu+7sKW6XSysJEu941Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqK9W4WhEnVjbfsAbZVq9x72YJKROu84t3yolI77nAI=;
 b=u2K/Jz9qrpXdzQhnY3AbTLFTw7KuWOPs7XxPKPSmEQD/2OJFiLg/LD2gM1BysFRprFNbn2bt+f2QBs7j+Hny83f1SzOyXb5jgV5KjGXX+j0+6GJrVXhnya126FFY3iqh9hsdUPCPNF7RL3zOmL2Td43COjYcMShaKfR6FtxGTkOJPHt8gb0rNOoWN1HhMq5wkwJbw2BCa8T5ICsMOlFEG/bGit/4MwsG7R3lSq/Oe0/FlPj/SLWD5+vJvdCOu+cBGLmP/BdRNUmc6uUJRqPrEgQqFs2pKh/etT1mAocPhEoOhnSLbBMwbssc2uUoJVTw4V0cbG1p8M2qQHH06i4hIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqK9W4WhEnVjbfsAbZVq9x72YJKROu84t3yolI77nAI=;
 b=BXT6Kj7xJc21sZVG4McB6DliP14b3/7e/WfU1KBV7vANsEMub+o22Ymhb5HtdIzdjGrvEeKn3cgXrq55XLdajXBkM6hswr5RmpqnNV0VlPW8jL3/qGKMlJJIVBY4T2f8QcCBzryUjwEjx4Ve1p5Tp+TbM13hKpGOXB/roTRjoO0=
Received: from DUZPR01CA0330.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::26) by VI0PR02MB11145.eurprd02.prod.outlook.com
 (2603:10a6:800:257::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 03:20:45 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::cf) by DUZPR01CA0330.outlook.office365.com
 (2603:10a6:10:4ba::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 03:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 03:20:44 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 05:20:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 73EA02E69
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 710DF1205FC; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 08/10] gstreamer1.0-python: upgrade 1.26.9 -> 1.28.0
Date: Wed, 8 Apr 2026 05:20:21 +0200
Message-ID: <20260408032023.1810147-8-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408032023.1810147-1-pkj@axis.com>
References: <20260408032023.1810147-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|VI0PR02MB11145:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c66cc7-8f2a-4725-caed-08de951dd26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	EiwXHpwKMev1IZwXRu00kGvdMQgLkQWpRBRBwu+L0LPDcdKW1SqayfPQLAKuZhLLLw9myQZVA3LUOUJCs7svLVCH1WswuArROHr514qdg2uFBvz/UAvhHWWXa4IVNf+We+COuujAhRDN3wPHiRDOaZf/DIm1x32+6R+nAlduZocHaFpd6IOnOsOsxu83bZyp/Q816aTuDt93x9ehhjUevygiV2CccBr/POpdbYvk4+mKaf3F8pAqlGBo0Y8TtXJ7bs0vx+k1Xy5EjdLugfOk4icL2lhtwEzbn4XR9+LzQIDvOvQ+JR7xISrf5UyRnvMOUmS4xkdP4wAO7mSXeEsRwCbSin17ZaM+gZs2tk52JROC8cJzkzajTVP+62j/8E4UESUCCUMXLD8kp3KAX4bBSPQhYXkNUiBSb5S3/Qm/DuiZF5VyjM3kZP4hjv80ic/aroPv+HNYAcWZpwGqs2pzmTPg+6Z4lFjLMg3XtRaT3h63EWvyVKfmmkJaeJx5s1JtI1/lMvKQnQHYpK69OLWOpdcXXzFe8eBkV3pBTz7MyvxPwTuTf5b50Bo8/jmZGLjbtQgpkh9U6acn68uaDdRLThIg7EbFw3hVTaGgtcrzu+f8qjiwJ0RNoNl4JP7uhkGax44InngAAWk7wCn2bAwXJEhPkbWld2/D/Ixg0bQWXK5ZZqbb8Pcc8W5wJIHhT3DwvyNKwC/TFfm/4Who1t0jIQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JFPhfUUo6xBBwEc/LLPYtady7FpZOkCtAE11yDABL+aV6jAL0ADrjwsu2Sr/jsxhWSwLOKSdZPBp0ZopBL95iWM7Ksvf9Qz32SBTnJkAm7PAuIpqFM6POtQZtmR2i3Pe4Vyk88MCp1UfOinK0PIKiRvPE1bFn0W+DLLAsSyvB0rdMc7hTkP6i3pAj3FDmtEyC3HZsaDY2zSq/qfUOgOVXY4hjUuhlYzRP/XHeKhyrhvUQch/mbnskqRGsJLKu9wrdv4iQX9Fsk8PL0K3WHIkrrZ31zWTh8eWOl6Im/FRDf0++FeAmpHJ9zsJIkQuA1dzZUHNs5caEkNXIqSNl1lA78PL4XeHnXh93OrRbJeq7cVo2iKGrPwVuK6LkSjRv0brZfpHhJ1xrXkg0c5/8r8dxLVKz757T9zs8Mf0FFWEvO1lbpf5H9/Z4GeuZ/r35InQ
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:20:44.9489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c66cc7-8f2a-4725-caed-08de951dd26a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234801

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 ...reamer1.0-python_1.26.9.bb =3D> gstreamer1.0-python_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.9.bb =
=3D> gstreamer1.0-python_1.28.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.b=
b b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
index 57ddf0bbba..7169b853c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
@@ -8,7 +8,7 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a5f74=
0"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "21a51d35fd973af1186795d3d9d696f321584aeb09ab4d176b=
59f26e842b8849"
+SRC_URI[sha256sum] =3D "9eba882a413cf06bf0575e635f73c0a2d01f3abdf76e18f804=
a90f3ff6a0aa2d"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstr=
eamer1.0-plugins-bad"
 RDEPENDS:${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobj=
ect"

