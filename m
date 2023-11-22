Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B13C61D9D
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 14:08:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.80])
 by mx.groups.io with SMTP id smtpd.web11.20040.1700662102286360158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 06:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=I1o2T/Ce;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.80, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HI1Ra3IaJDqCa2X2Pp4zNkkKIZC3PFxZWZjr7Uto8k8Vm6nmo9JNNjR3/H5E2HDn4NviJsHvjGJQUeZR38vqOGWrPAHG1RtZU0FlqYUuO9CwfleVTbQjYTuyKLw1HY8SSsvzuiVzOObDF7g2wQ7hPPylrK/7/W8h/evv8lWVmQLkD02lINE+u1Jh+FK4KvxseAbqh02CiJHqEnI0I5+4l6IZO8vpS3iHljaxYcxBmS+TnmgmjuOaIZSnAmJ81q4YbjSUHY3uDoXi0Ju75hMR7s4ErtezQPL/NRyBc1wlPxJ1v5Qgsor4nHnsxCw20tbobn7d5sa3MHjlFbKhxF6VFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKNpOaKHLcjc14yvN7hylj8gPMeCKeFTr104qS4YbhI=;
 b=oEKnSvrn7NNTMPeS446lcyMsZlX4m8bnkHGseqOBfFK6rDrfIo9InqK+T4n4Y3sP66f0Mx4B6sdsIIOEGuXkkWCrAUW7Hw9k8+QKQEc/ZQICMbEw8ZgLpw6lJHiqnuDxkKQr+44w1DCmI91wwC7agUvScRzYbZePe3GSQwCLs5pt2B0bWyc10yC8nQNXZbSMnyAZWHxpqjAJXzSLq0iATsX386msuT99seaAGFGvO4Gh24aCR77xw9pB7R1ohWDecXQEgeqtrlZIqjf1RvXKO+U0/cTqgTlbq0be6cJ+3J7iRX+w/mEn6JdeZTALAw8aCMVKm4AbaE9zOKiwModlDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKNpOaKHLcjc14yvN7hylj8gPMeCKeFTr104qS4YbhI=;
 b=I1o2T/CeaEA1W9YTxVFTV9QxQSHI0hcG3aL0JQUmp+5vXqZUI5UziCYOjuphgvHEcG4ARjry9sCzj577wOfLOStm8gcnqz89T/6G/Yu8mtgLcI7F/eJA8BMSjvk36/pX9Xyub9lMVH2ggGrvxDW9yeIksgT1mptxBKA/jWED1KY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS2PR08MB8830.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 14:08:18 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 14:08:18 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH v2 1/2] patch: extract patches without diffstats
Date: Wed, 22 Nov 2023 15:08:10 +0100
Message-ID: <20231122140811.1021807-2-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
References: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::19) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS2PR08MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7eac21-d292-4abe-6563-08dbeb647a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KBaOU4q1kJ4bSwS0Sl/N/a0zgUJpcpRmONm1DzzKAtzfu9VM7yfvkWc0vMGcGqexQHajNPuBdpYDgffZL3t7mH4jnVyr9vSPw/26N8MdPWOD7xjFc1oIR/+nHMnGj9yvKvZm8bBOQHy1S2IPfD8OmqyU5MbSrd/UZjb0Rck/a35/z2cJJ2Xc5hbGQtQXd2SLQoDZLNWXeoZOXYJH1+JdRI6zb2YW7NkPlUNoSCW361FGqckJ9met/5cn2PCOOXiflGpC95YxxWro/pDiJ316QNslxu4ncSWr+pnd4IRDKQvt5+RU7z6cXabfO6RMo0SOYCxlQjeXGDMr2rKBR2jsz11xBRKe1QpZzh8PRCNXoVNIAHxiPNCg6AyW/IltTCCjkti/qIZ053g748wKyyeCeMSG9PTuM/drmy85oryoJwcuFHA24+LU5g+NwDzbixGXznBS9i7KaddX1aoOditQRD4i9oHxQrc9j/A0PGXuR9RBy1AbjklaCA6Wd7iKAfqtLkhNcWnNN5UsOhOyJE0/NtURHgfPLIGDOaRAWIt0hnJkaQZwMzH4SzSqHlnlt3AWJeulzEoP0BfdwtSrzyThUxIZffamwg1WVij+PcoqL+3VZNtiHmpSnSJ0M6kTPmLl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6666004)(478600001)(6512007)(6506007)(83380400001)(66476007)(54906003)(66556008)(6916009)(316002)(38100700002)(8676002)(8936002)(4326008)(66946007)(52116002)(2616005)(6486002)(26005)(107886003)(86362001)(5660300002)(4744005)(1076003)(41300700001)(36756003)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D2x03X/XSegUyMelLMdURum23goZX3HjmoUE6YrS5fIvW7pJWgDvcEzve+Gl?=
 =?us-ascii?Q?1MZ9D413dUstBiTvRV0kKyt/CFIZfN3EVZwqZkhZBPR1D8DN2ms4RwhmxyLe?=
 =?us-ascii?Q?nGUoE/KKzmnci8RsquVH07psaxXHuG/sW1s/lUVA6Yt61DZZORI/Br6PL6fn?=
 =?us-ascii?Q?Wgal466g07xKxSDizbMpAelVAj6OCQwihzjN5WpzaBJctFoQsa5BKRDctbZB?=
 =?us-ascii?Q?qqZb2enbjD1E2pOGr8QH8ua0Iqv0GCRwsf3I2dktGSdRdMe4/U8Vl0poYAQs?=
 =?us-ascii?Q?YvYXEy4qfRNyUtncQRI6P+5mTxvSLivXY4x1UlCP9IG/UC2oL8m73hR9UYN4?=
 =?us-ascii?Q?kk1T0ZUP+ry9Qa3/kct3JSyErtyMc1SeRHgUMzqUhorpt7zps/XxU6cFAo2V?=
 =?us-ascii?Q?2RMlObMnY+r6XUpXyG3+r06dRTZMLXpd5FQl6GEMKfRfGOvM2dNVMRq75Bfv?=
 =?us-ascii?Q?oExmIYcBXCaU+6c+C1P6MTbz7Z1T4BcJUaxh2SbGw7XcnRnR1fJRUlYlU0Nr?=
 =?us-ascii?Q?FPPQhwDl2xA2naYWlLdr2CttroNl9q40yt4JcwgNhPNZUg8d1DEjjjAJVTOb?=
 =?us-ascii?Q?spqLTUvwUrmMN49s2EuKSrR2EI9LKxbxslSZ4R6PpWheUWPWHN0wyYRuqLIM?=
 =?us-ascii?Q?ZuU8QVCZP76d9bfeWV9+PrTa9gaeLsjQE8//KgAYraCKJzHbJjRWu/WCmb/f?=
 =?us-ascii?Q?T+48LZBO9+uEtUu7K5Rrn663nP78xvu6k4nkTRS2wAt2u/KXdqE9N9QdyU3f?=
 =?us-ascii?Q?7OzixOahjgeiVCz65ji15+fAia+oN+fzhyblgnmQl/trBQaXgVt4hnbXexvA?=
 =?us-ascii?Q?XwMWKKYApi4qIYQdJzSN2cDcwml0SrqL0Xv6aWI5n/RHxEoQrSawixqGJDAd?=
 =?us-ascii?Q?7snjzHtfm/urRwASAo52H0NDvDS1kX2ZkvQ1SaCYqD8RaPgIwhjWoB1PufE7?=
 =?us-ascii?Q?dJEU4CgUdMHtm5uhnocnlnLYCirqmmG/zCx5q3LpU2gHxf7TsYFgK/Sl4F9o?=
 =?us-ascii?Q?bTJZyzCDKBT1IUoiI8Om+ONnBVtl/NkvdiTTnnw048Cr7Qv3Ldk6sDZlI5B1?=
 =?us-ascii?Q?01UpbdzO6QT+2SHT+dTz8VLKIEAadQQN6sV5buHrW+YqDe1zMuY1sAr1azI/?=
 =?us-ascii?Q?qcRvb5s+aDhf0CHM/0ZOzyJam2pwlRqE1p5FZ23HASi0LDNLXH6iDbP5dkon?=
 =?us-ascii?Q?ANkhuTQcYd8sOX0PLQ6gAa1DYIgHb7UK0JzPKl1u9ejau9kQjhGs0CD0WhnV?=
 =?us-ascii?Q?UWmJoTilds+CqjSRujp/kmRSPmnbffHGXYBawwIhtkeYHLY7PicgPXsGcvo2?=
 =?us-ascii?Q?Sc704N8O+jM64njyuYnMJdzOpxZGVx3JcpbfOfP/NpcM4YysFKthCxk3cIrZ?=
 =?us-ascii?Q?KUb+oWwKPZ/M67xgut5TWF3clT3mvk4zHVRxm77NILvsfRj5cw1eCXnimQd5?=
 =?us-ascii?Q?v7tnfxQAuVkTvEkM1CSq/FHJh319TvvhDuc8hN0Y2j/qKHT/mJibXQPcWs1S?=
 =?us-ascii?Q?rnEZORcFR1S5CTERKjKr1J03LQvVhyY8bnnP8mzL35TvaQZtUVhV6RuFlxb/?=
 =?us-ascii?Q?fm6yvZszOmv0ZG9CkmPh5vifjlUZgdwTNx5jZNQTWp8k1/8Xx8ixGf+E6752?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7eac21-d292-4abe-6563-08dbeb647a0a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 14:08:18.0860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1zvDpAETibPQqyR7CaZOR5cXXGq8h5SH6xmpb4STRksBb5BXxlnUSHciXiOgDg90gU/3/QVGA7WSIIjtf/X7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 14:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191106

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Extract patches without diffstats to reduce changes during patch
refresh.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/lib/oe/patch.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index ff9afc9df9..495a302121 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -466,7 +466,8 @@ class GitApplyTree(PatchTree):
         import shutil
         tempdir =3D tempfile.mkdtemp(prefix=3D'oepatch')
         try:
-            shellcmd =3D ["git", "format-patch", "--no-signature", "--no-n=
umbered", startcommit, "-o", tempdir]
+            shellcmd =3D ["git", "format-patch", "--no-signature", "--no-n=
umbered",
+                        "--no-stat", startcommit, "-o", tempdir]
             if paths:
                 shellcmd.append('--')
                 shellcmd.extend(paths)
--=20
2.30.2


