Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D92C61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:15:32 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9226.1788099331370673475
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=BPK3Fnmm;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 52.101.48.15, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYeiZPDld8mbwb1Ye118NujWZI0ErGvxoKHWYzsMTbmonCWOtVsnXatMasxqmzoO+Xud/0dqb/tYUGd6UeCS5ShfAn7wLPuXzGpT5BdsXi+jDc9lX96GJltFT9L3sY+VMNoE0xbP/B8ciejB8otWPS8gmqeCBSVUdn6KawKejFxvCyAW7wuCzcIqgtvQZE1xp5caz7O+ZuXyRn17Kzls7b0+iKE8J6c32oOShDVEKoPR/gLgmshuS0UAbewicIx2/DKnQClqQyGZz//7f3gJ59/YHNtvlgE5RyFQuCrxiaG7eCGWj3v7vB2gWH8QXj4ut7xz2sMNAt9xpo6wqQsajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfOTqvVlrEvzVZaP9GbjNfvJPxavEiHMQ1ombbjX50Q=;
 b=YmcFXhj8O94NLitbbgRGugq349eiz/PKHYe0G6YTDY3XHjRUBk0qENRSsWULLeM9EL6ELWVHqbCUC3UvsU9/t6ODv19+zuJTejZnuUDutMZiGJN3V7Sz//lTaXLY5y2jKZ0QF7aon33XaBuvzo6PAKu5eKKhazEAKSTasRcLGfL9N1/9OD04oucq/XsbDGZc9ecno6+5/2dJidODgy2ktKtqmJsjT/d/V3NmGDS0gDkBlcK+HnE7F6O8AXPvKPcRgKgJI+gfRfm2mGClHvD96n9IU24zEZ+Q2kTVvH3DFmSeRp7O5yZBRvCLjERvLMXQmKpC1jS6WUeQLDdxk8tsZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.39) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfOTqvVlrEvzVZaP9GbjNfvJPxavEiHMQ1ombbjX50Q=;
 b=BPK3FnmmFWiat+fR1CWNt2MHmDX8p2B/Aekk5hoMDPIOUCwtvTamBZ2bR8pg29eu/btcd7hvwzYt/B+QjSGVP/WoiRAGpCQIe8NDs7+Jds7Qcg52UPEIq1yQTDfYXzBJQGN9Qtn73B7LKgDsVoladikI4Ac3gxbBy4TdUMbMsJAVkbSDpUCZWrY1CR2Dcf62sTV+zbNR8pP7MnFRdujpMCBu/0Eg83kqDa45D77hg+eSr761WZcE5vzQFZj6kARPYjk4z8f4K48D59yBWGRxry/O6CYOwycV7pqRISJXQKJyV8uvIOZ3k86Iiib6kl5JlFt5mKEi3A0HvIL32X+tVg==
Received: from CH5PR05CA0005.namprd05.prod.outlook.com (2603:10b6:610:1f0::6)
 by IA4PR12MB9787.namprd12.prod.outlook.com (2603:10b6:208:54d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Sun, 30 Aug
 2026 14:15:28 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::a9) by CH5PR05CA0005.outlook.office365.com
 (2603:10b6:610:1f0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Sun,
 30 Aug 2026 14:15:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.39)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.39; helo=wpcosapexchedg6.windmz.agilent.com; pr=C
Received: from wpcosapexchedg6.windmz.agilent.com (192.25.218.39) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 14:15:28 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Sun, 30 Aug 2026 08:15:21 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] scripts/scriptutils: tweak fetch_url to support bb.fetch/bb.fetch2
Date: Sun, 30 Aug 2026 10:15:18 -0400
Message-ID: <20260830141518.8187-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|IA4PR12MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 736de304-4c11-40bf-5d76-08df06a1249a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|6133799003|10067099003|56012099006|11063799006|17002099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	aoN1+3lE5AO8AlzhD5Hxy79rHrSu1zFCxcLl4SMKwAYi3V/4Pkd+hpRQM6E/ncSAoBEujBqdw/yJeW+JefzeGoM/eO7/n04PECmj8616QrkEtZlCs8yAChbNwITKIVwaJMzC5dZgCj6C4x9iGuM5N0dbHyItm+trf52TUcsugG9dDaXDX2Z5JUluqIREsStUGRj0WX9wuw71nFfZOsOA1QQGyvtphIDu2cnBXLSHngqqRCP6QT9ZNMG1FZFAoQAmAwD69aku988yOSlQyU+VqhVLX9xoYMa7bA14Sie1pfUvwCCL/TbbJKzRAIzQ0ThiYoxMTo43VDwOZG+t/c66TUx+d5glZRnOtEd48mW7HmoxVpcBdez26M6vgyfaMipOLehZZx63DEERzc1hiHNZnE97MR8WR7vfxuntjWseNns1uJkio4rxwbA+eR0Vq7/QSy9CV6A+7k1RjTYOPnwaqd9YuzfoC1lyfLYB75dxCEn+m3bKvkQoRP0V8gSPTF96e7AkiaZJ+Utdzdp1eT3CYdrr5x23g9a1U1X9oXnRZs97SSsEo3Prt/iHnovsJJmHsu2up0dpIiPKKzxQz1n6EnYxnFpSq027bpzClGts6q55V+SERvE2UT9RUREe3qAtm+o1Qr/RXw/+EySjdc597bt74bDgjRqA5yWIVnadhLM=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.39;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:wpcosapexchedg6.windmz.agilent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(17002099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Fkmw8XeZYE1jZcieHuaczS7prk85ECC1GSnVKeXG/uIUIniwICDQBm2hnxHwY0v9xaQEfLVAqIZpDo8TWJOwv+Z99LMKeo/u6qcHTbBGkUrX5qxXar8mqTr+k9T0u9TfFXR2J49nT83dBqvmGFZaFehYZn0Bq/dfDCuZoDstciF1ktPC61MdmkBrHvsOhRie8axPvde0kv6EMp7RDjuBV2r0cbHejmeBRT4vpHPfzmhfr6v2a+fsO0sgp7ZiIGp79NsgugVmidWNi+LCX0mKQVYhXho/Rk/geuS31EfrBDWd9AqqrQPYHeGN7SRNXL29ktoZ9NTIo02adBC9l8mN65K/Aoo5+SY1RZAjDwQeqbc0g9kC+aXTBEs4nWFdEIzRryGSvQzHuPO53PodAdn0qFPtUaboK2PS2NW1azDM9j8/V78m4qX5DObaz1lfytd+
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 14:15:28.2462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 736de304-4c11-40bf-5d76-08df06a1249a
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.39];Helo=[wpcosapexchedg6.windmz.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9787
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244657

From: Chris Laplante <chris.laplante@agilent.com>

BitBake is renaming bb.fetch2 =3D> bb.fetch.

Pass both bb.fetch.MissingChecksumEvent and bb.fetch2.MissingChecksumEvent
to extra_events so things work in the interim.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/scriptutils.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 33e197a22c..654ca90227 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -211,7 +211,9 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger,=
 preserve_tmp=3DFalse, mirr
             res =3D tinfoil.build_targets(fetchrecipepn,
                                         'do_unpack',
                                         handle_events=3DTrue,
-                                        extra_events=3D['bb.fetch2.Missing=
ChecksumEvent'],
+                                        # Support BitBake before and after=
 the bb.fetch2 rename.
+                                        extra_events=3D['bb.fetch2.Missing=
ChecksumEvent',
+                                                      'bb.fetch.MissingChe=
cksumEvent'],
                                         event_callback=3Deventhandler)
             if not res:
                 raise FetchUrlFailure(srcuri)
--=20
2.43.0


