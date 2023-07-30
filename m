Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C93EB64DD
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 06:33:28 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web10.68592.1690698804236016109
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 23:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=TKaXb5IY;
 spf=pass (domain: siemens.com, ip: 40.107.22.55, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QehNB7/KXDdPCAqISpR6bwstNJjrge4JH8gs/EN61K6HRvnJnGlAZmo35rYGJ+1MU3/HvFGVFXgaEJz7FEIyjEyzAjNg13V1Qv161H8hYYzbSvljG2x3wbCJzGdP0tlWd4MCjZW+9FIXlPPGd+UQkdqaemxZ17DxLxpvLxSZTpJC0OPLzzhfJuUQzKtd9KWAw/87psGoXYl4Y+z+wrRqz4/NWdHfi/WvVq+wiFS34F1NjpvidqDlTZL+hEOXy5Ptr6mve/6Z2EQd4I5fokv1giWSsJaY6lPzRibwWmEM4O5xMFaxlApBiBDQ/LhK2slt9qSRnt0OfP0OGQp5+rIyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oli6RxXyXJFwCAhIre5PK6ZPiuq1LD6pFN2X7xaSUBU=;
 b=Qi1MclIo5ePl3wFSXyQMSfZ3dBUy7olg03thHcGhPqF1+SLVHtFciNc3aSpk/WmhdF5BB5VX0djuGAlwkmcMAC226rdHC/H9uYC2qRqC6SKqqQDQpJDeID68lPEvmPsCozb+fJWGcO4e1O5qQGCus8p7+aZOffVZfDdnRTrZkTu35jFhWD4MezV98y7xB3Abub90gFmnchhXnnv2jCLVZ9xQUyGkWfHNwzCYUUWsLBcBZd8mIWTaJXCp4QI3saSEUYHk2JWKxhGhfYPTLzw0ZGKaEEE3GBxRLtFDZGjKxR6dl/+sYpxOhJerMg1PTuwr/6YJ4R1FmGN4ZNyo2t3efg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oli6RxXyXJFwCAhIre5PK6ZPiuq1LD6pFN2X7xaSUBU=;
 b=TKaXb5IYDpS2wNkpBRHK7ghmyZEZwbeAYY2Tnoc9bHJ1F5/aw8olyY0Ch0VgAkxL5IcRTMTazkXHmCbxMjOsuqE5LqFO0DRzhYA8YeOvM2IOwX3xoaQHrF0HoJsY5mBPupjSOW++af+19/gAsIvcm0S5IG6U7doQ7fQ6aQT4FhsVZrg1ehrmS8oaS7oB4nV2DYlHeNOheoSntOA+VW9ckcAgWeviELq0xmQnxGVofTmSgtm7/mRqS/2mcAp3R5NZMUc6HltrTwWyy8+3FzSKhdjNr0NRXFJk4QDUuW9gfrs+fvkkR5pDx/q+SWK8mZTi6ctjeRfXIH8oSAmFiDKsBw==
Received: from DUZPR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::17) by DU0PR10MB6559.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:404::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Sun, 30 Jul
 2023 06:33:21 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::42) by DUZPR01CA0048.outlook.office365.com
 (2603:10a6:10:469::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42 via Frontend
 Transport; Sun, 30 Jul 2023 06:33:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.45) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.22 via Frontend Transport; Sun, 30 Jul 2023 06:33:21 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.16; Sun, 30 Jul 2023 08:33:20 +0200
Received: from md3hr6tc.ad001.com (139.22.41.206) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Sun, 30 Jul 2023 08:33:20 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>, Andrej Valek
	<andrej.v@skyrain.eu>
Subject: [OE-core][PATCH] maintainers.inc: Modify email address
Date: Sun, 30 Jul 2023 08:32:39 +0200
Message-ID: <20230730063239.13797-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.41.206]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E1:EE_|DU0PR10MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f19747-b276-44d5-97fe-08db90c6de5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/YA5hkiRUSEnNqoXStum2EdcddRA3EUFMsZZlFPm3l+t/BNK2+6joXw92d/JgtuU6xYnbRrWTNd93UFwaEFo8fe1JYB8VMkFJ1gkgDiReZApr7Wg9SC+T41si1az/qh05JVBdwrBq/KooSD4If4PZ2hlb9Uz+qaHKCyjbktuk8Gemq3Fi+NZEdCIlG09SMFxF0h98TNNdqZIMyc6vfNab+wQfFAXhRha4t5lQq5CEm2ol+46pdrpyxH0DvQgAfigLPHeScI8t0ivZVCwZIhXe/wmXw8iaKovSvg7xWzX2eoExAPuNTaAefFxYBPsgsWlyu+c2ls9txSse/qy5+7to25MjlaGIWOgChGOuQUa/4KdgpwvWIm0NOot+1aEDpJ69sregASK9vEaML7Huhr+uR7LZ8/vHhSZuutjtu/5aUSZzGzHeD9P6gt5XVH9J7gaBFmRXRJcRIkz3ajulwKVuxTQB5ja8JyEh6qEheOmic2zX5zebedlRHXrwT1qxfKKGc+ORalUrE5J1PAEXZ7Pg7Y11N91aFT1LTlIZP0ZL/PHBr6FZaT6xZL948clMxdYy1ymqiZle1P0ZG6fYw2zEmppyjNXWTS5xrj79/YbPJMxQqHDc7O8E5lVB1ThI8xoK0+4WAV8tZVxGpGVSjfyPX2pkXJKdFZl7niQyc1sKyJ9zV76Ea2WeW0nv18vKWdQnkx7Y1YIpcsQEeVab/QOOU3RcU0PV7ofFdPymB1k2oI65yNTClSHIFTCS9ujZ0bfTB/5fw3iSbp85oq8AJ7s2A==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(956004)(2616005)(5660300002)(1076003)(8936002)(8676002)(186003)(336012)(16526019)(36860700001)(47076005)(44832011)(83380400001)(26005)(478600001)(316002)(70586007)(70206006)(6916009)(54906003)(4326008)(6666004)(41300700001)(86362001)(40480700001)(40460700003)(36756003)(2906002)(356005)(82960400001)(82740400003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2023 06:33:21.1163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f19747-b276-44d5-97fe-08db90c6de5f
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 06:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185061

From: Andrej Valek <andrej.valek@siemens.com>

andrej.valek@siemens.com -> andrej.v@skyrain.eu

Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 17f038c71e..a7a74f1d2b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -82,7 +82,7 @@ RECIPE_MAINTAINER:pn-buildtools-extended-tarball =3D "Ric=
hard Purdie <richard.purd
 RECIPE_MAINTAINER:pn-buildtools-tarball =3D "Richard Purdie <richard.purdi=
e@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-buildtools-docs-tarball =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-buildtools-make-tarball =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-busybox =3D "Andrej Valek <andrej.valek@siemens.com>"
+RECIPE_MAINTAINER:pn-busybox =3D "Andrej Valek <andrej.v@skyrain.eu>"
 RECIPE_MAINTAINER:pn-busybox-inittab =3D "Denys Dmytriyenko <denis@denix.o=
rg>"
 RECIPE_MAINTAINER:pn-bzip2 =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-ca-certificates =3D "Alexander Kanavin <alex.kanavin@=
gmail.com>"
--=20
2.41.0


