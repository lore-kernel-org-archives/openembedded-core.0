Return-Path: <henning.schild@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B6FC47092
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.84])
 by mx.groups.io with SMTP id smtpd.web08.6450.1650620711792070683
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=Lv54uTaM;
 spf=pass (domain: siemens.com, ip: 40.107.15.84,
 mailfrom: henning.schild@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzqUxBe4XSeFKr/zvmjLmcFHGhuozkSD3GOf1SjnLPB8wRAS08sS88DsFzay4R2Kt60HURAtnUOCvbzr0Q+MPae+QIAG0h9txUPSLd4gzxUCYoEv0P6eVjNjBLvfHNaWrv1Uh7EaQdedTyOo1t4Cjeg42vHGDEqLuvI12TBYStAsAbRWhV7fO2qb1CowwJa0WH84JKOwfqO2o3tVVIlr9eNHTwN6neyuLZ83/2UKXeQrrgB+XoUkL9AuG0rWNLAVgXc4CHd8wJpny8+1r3EEr1lJJDlMLcN8PJ/Je59+/j6T2kNGE7lv0vhr3W0Xud9iy3TXMIiCMCjtkGC3GFiv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MexvSoLUpVxnz5dcMk8dEA9h7ogyNPy4gq67wZSDeio=;
 b=J0yrcWBT/ZnsFnHXB3UQ5b4tgP+CLPRkDyqHAtt6/qrcvvpsays3fc7W3X33OOeUU1VfcvgK4Cl62tCNJ+oo8/aIIx3XCdV0/a4yUbuot9mc/Q3KWgJ8d8HvZ2b84p5vT9jc69+rYlQbhwFD6YW7YfGwD1HNMGO2brH8lvHM4Zei+i+HPc6kBHdHTfTXw3JSds1A4cEvvszRiZBhYyg+mSoj5m+VNa139KUrq1LmVCyHPKT+1f0kHtCAXqWKmQOFWM/AAIF7fWi47mMW+cSeQUOT09wZRfC6AULCoK16rNoNfwG9cqZHCAMA3d8gzgUtKyCsClXDhVfjJ5iselYvmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MexvSoLUpVxnz5dcMk8dEA9h7ogyNPy4gq67wZSDeio=;
 b=Lv54uTaMTBznuDhpbNiEuxPpTfs68MhBAcTyV7yayTqBEZ7bVK8HiYq2NEaIN4cFxa9fSKPGEbdZUwnY6SnVCg7q9yUBj72GKw1mRby5MwuMnOJBAJMOIVjAYKwqFDm7sj768WdCE8Y1aQ1iSE1vL/iiy9SLDCuM4hkgMRkwP1lha5xoh5YBoyyhTHCtlwVt0I06TX4qNMar4/q1YhgcpZkaYPFaERAZnr4nQFC6mNX4YCoyz0vsBUjkBXFywQYpVH2eSFmX/ErTNJ7nRp3Z2WHjSubcEVPa2jwWfuZy16i5+VVLhDVlVKhU6mUovIy17Hcy/5K/h6N98Rsbg/YPTw==
Received: from DB6PR1001CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::22)
 by VE1PR10MB2989.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:10c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 09:45:00 +0000
Received: from DB5EUR01FT087.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::76) by DB6PR1001CA0012.outlook.office365.com
 (2603:10a6:4:b7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Fri, 22 Apr 2022 09:45:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 DB5EUR01FT087.mail.protection.outlook.com (10.152.5.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Fri, 22 Apr 2022 09:45:00 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 22 Apr 2022 11:44:59 +0200
Received: from localhost.localdomain (167.87.32.223) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 22 Apr 2022 11:44:59 +0200
From: Henning Schild <henning.schild@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Adriaan Schmidt <adriaan.schmidt@siemens.com>, Henning Schild
	<henning.schild@siemens.com>
Subject: [PATCH] wic: do not use PARTLABEL for msdos partition tables
Date: Fri, 22 Apr 2022 11:44:48 +0200
Message-ID: <20220422094448.27342-1-henning.schild@siemens.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.32.223]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68f173eb-b10d-4bf4-d631-08da2444c49b
X-MS-TrafficTypeDiagnostic: VE1PR10MB2989:EE_
X-Microsoft-Antispam-PRVS: 
	<VE1PR10MB2989A77DB997EC6EED357C1385F79@VE1PR10MB2989.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6U5unR8kA1GpdQyTx5dml7aQtoNlhB/sRHfXs+du6FRk5GmenTWV705G6euDzJMgFxgR+IEaKGZH3WSQkXLFuYAD4UAAuDS6lgzlG6m5RYjKYZwNDG+pYxi/Dcoqd5NGY6dq8NmdrQrUPZ5p+qS8Th31iHi8Bvdb1FND1VczrOeokho6RtW2761gKyiLbEPv2u4nV299JWUh/HOo4BeHGebnWaiV1QSmihnoxgw4N+aJgVf7u1rjTUZ1eNVEJYFYTB01JKusqLVqXHz398rYoJ3KplVlCnlxKyVPeNOrSU1sD1ipqk/jpPdqLleEGM8zu/xHo+l3pS8aVKGfP66u8ovzBkKnFHBMnYxbDEEkJi0HdGAIr1hXlREjB8ppzFmD0m82HX/C6eNRtMDta4ukjoQ5RAekEhyPpvayyPNHInM91yq+fEhqOhYgPQ5oCjgT8DnaovcAXbsXOUJkyKuYykyYLBSRWFJ3ZiL4u5wZgOPVp+Do5TpoR6e9ewoXlvfOJPsnoi8Nkei1cKlnx8uLzVdINfNOi8/v3m/UkF1SFqk742+Hz9g7mS5PxuICUHnu63dcmL6Hdj1tQsVK/IqsZoztTww/UEU2RGIqjiD7gddcP9uk4lmh6tGBstvNYUWRJwgZMt01FNmNDlIh7UPhIMjcWmQ1GZPFxTyclNO1OsJJ6cV/Un+i3ykmw75viM1n
X-Forefront-Antispam-Report: 
	CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(44832011)(47076005)(1076003)(36756003)(7636003)(83380400001)(82310400005)(8936002)(86362001)(40460700003)(5660300002)(36860700001)(82960400001)(2906002)(316002)(6666004)(107886003)(7596003)(508600001)(8676002)(356005)(4326008)(54906003)(336012)(2616005)(956004)(16526019)(26005)(6916009)(186003)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 09:45:00.0488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68f173eb-b10d-4bf4-d631-08da2444c49b
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT087.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB2989
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164782

When using "msdos" partition tables and "--label" but not "--use-uuid"
one can generate images which will not find their root, because
PARTLABEL does not work for "msdos".

Fix that by simply not going the PARTLABEL path in case of "msdos".

Fixes: 2fb247c5ecf0 ("wic: support rootdev identified by partition label")
Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py
index 35fff7c10242..4d0b836ef603 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -259,7 +259,7 @@ class DirectPlugin(ImagerPlugin):
             if part.mountpoint =3D=3D "/":
                 if part.uuid:
                     return "PARTUUID=3D%s" % part.uuid
-                elif part.label:
+                elif part.label and self.ptable_format !=3D 'msdos':
                     return "PARTLABEL=3D%s" % part.label
                 else:
                     suffix =3D 'p' if part.disk.startswith('mmcblk') else =
''
--=20
2.35.1


