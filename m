Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DDDC53210
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 13:13:11 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.94])
 by mx.groups.io with SMTP id smtpd.web11.12143.1672924386561727712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 05:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=yznK8AEq;
 spf=pass (domain: arri.de, ip: 40.107.105.94, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B43fG14yU3hsHVAhmnMU7NEDzJ/KJ0odq01J62utJAkrOs3glDzJDzeUAQVtle1+Ue82+t8sR/hetE/kwNdZHpn2zRaM9WmIlLk4l0vkL8mDqKYuJv4irvlWzSr/Ww143ruHwCrkVX6MpPwse7G6oZfPG2hJqwe9e/HYC86CPVHkwP5xXLniY0WuOsBvtwmm8LlbckM0xZ6Bnh/j0BTOH/M3LdFkSo2DKnQIScaa7wn/Gv1khJ9XiFIv9z9C9Al4oWk/pwpCCZhSeV1JZeDkjErR001ZZF64DyGP5OfnyzEpwMvFk5shzLp5gQtEKBJJHibNp4WazpnGWItg/MFMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIoh8HkC0M8qO3GkzD+JW6NAYzi9CRNVPsThIPZfGCk=;
 b=iKz/TJQsYLCFECi86n+kpWBWeAf5lVnMQVpreb1J6zF7oolbwA0p53i45VzTkwJJdDOKK4uW1ysiLEG8FmyhkW9ddTNatOrvM4fUmxcAqfqwXe3cPM9waW1gCyLClSRAPOufJVg08T5DGva7lSC6HwSisXL6W6IKyFHlW0dM6boBfuDZk+qdw+itAFNnFnAh0GSaoJwWoYmVZKfM9OmRaJnOMID8AxEvHnCzhXt3HOP/LNkwiSYMs9OPosA3t7ek7g7E57k1FZcefyo2M3PWfk27R1z7ObyvkrexBppjfLgZwYedndYKggyFb6JAGYk05LYM4FXyJs9caYpToTzd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIoh8HkC0M8qO3GkzD+JW6NAYzi9CRNVPsThIPZfGCk=;
 b=yznK8AEqRG6xbR2ugzgRhFYZZ+JLUTJWo5EyJweBJghC4lf0rk0zttQ83yZYnuOhOAEjgQjR7b3pI0skPjp3WMxoOyzepR2yxHlCgeBFJyWbZmtACX26i+m6Ot723v8TwbBIRgG6XaduQHaac4p/kyYQB9h5sP1m78HLqa1+5r4=
Received: from AS8PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:20b:312::9)
 by PAWPR07MB9227.eurprd07.prod.outlook.com (2603:10a6:102:2e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:13:03 +0000
Received: from AM0EUR02FT061.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::15) by AS8PR04CA0034.outlook.office365.com
 (2603:10a6:20b:312::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 13:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM0EUR02FT061.mail.protection.outlook.com (10.13.55.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.16 via Frontend Transport; Thu, 5 Jan 2023 13:13:03 +0000
Received: from N95HX1G2.arri.de (10.30.5.13) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 14:13:03 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] boost: add url lib
Date: Thu, 5 Jan 2023 14:12:48 +0100
Message-ID: <20230105131248.30336-1-ceggers@arri.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.5.13]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0EUR02FT061:EE_|PAWPR07MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fccff31-9294-462d-809a-08daef1e9407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZWYtBpTit/aoahTU079nOjSy/8Q3rja/ND+ktDxomAnEg8rOiNpy3TcKvHR/QIQyeVB0Bk5uudQ2atZLekwVcU/C+mYPh3jbFj7WN824QQZgbjlICw6Vd9x8JCm/hII99pOV98sl6rHGpyh7BIPCXl6y4J4J9rYqU5u4gAiXf5F95Y9INAtCCca+BNhI4uPlr4+nhmSg5LNi4snvtQ2H+OZyLFOIDbC6N2QSYDRSitU/rFMnOBpKlOa/TPoATRMILNKkl+/R3p6QE/g2B3IJpcHpL9mZaB02nTNlYAJEMzUfqOoKoR7WlVcjvEow5XONUrma7QzM42wq+OMokSXja50JE1qAj5J4aeLnb0L61hJUX8w5pYSABH0ymIgXUumWadr9H23mmp4K8gHHYTaK9c9KgUgWwDIgaeNt30iw71lZs+0OCyIbEJOqA3o1fqxtV440W9ZbK7TL1nR5zZlFTZIxr4h9xWJnpdhoFxUalKiU7bpWR2UYIpTYO/jLs6JSHrr6eyBDVg9Dxln/4s28UmCsdVJ4a+mC1O9hZ92T60yShF2xEDbRa3j/BJItaZ0V+6i0gqCMW4eT98A+azyg31ATZzDqK2qmM6JFOL7IPSY5qCmnWJsaMa2Su+APAsmgpkQglCf/MwGtUYlFAaSmqTJYtMzqfGn+NjwPp1vfXv82SZqIcLO4bszrszXyRfKwmKvf7DkeO6p3aop9XYnjnJvXbHNk5bq0z8W+9WxYJao=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39850400004)(451199015)(46966006)(36840700001)(82740400003)(36860700001)(316002)(83380400001)(4326008)(81166007)(70206006)(70586007)(5660300002)(8676002)(4744005)(2906002)(41300700001)(8936002)(40480700001)(82310400005)(426003)(16526019)(26005)(186003)(2616005)(47076005)(6666004)(1076003)(7696005)(107886003)(6916009)(478600001)(356005)(336012)(966005)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:13:03.6829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fccff31-9294-462d-809a-08daef1e9407
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM0EUR02FT061.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9227
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 13:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175523

Boost.URL is a library for manipulating Uniform Resource Identifiers
(URIs) and Locators (URLs).

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
This patch depends on removal of the boost-url recipe in meta-openembedded
https://lists.openembedded.org/g/openembedded-devel/message/100414

 meta/recipes-support/boost/boost.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/bo=
ost/boost.inc
index 4263e645de1c..77105aa1fa13 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -40,6 +40,7 @@ BOOST_LIBS =3D "\
 	thread \
 	timer \
 	type_erasure \
+	url \
 	wave \
 	"
=20
--=20
2.35.3


