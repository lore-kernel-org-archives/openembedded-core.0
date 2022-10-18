Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A77C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 06:42:38 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.73])
 by mx.groups.io with SMTP id smtpd.web08.4000.1666075347972420464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 23:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=hTXD1uu+;
 spf=pass (domain: siemens.com, ip: 40.107.7.73, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QE0fKTVA0kYcrfSxRM3ljinSdF2XUcOmBISIHbr5uhyVPtdPWIHDvAJwABL52RoffA9aWWPWg78SnRWeZH9LXXv9gPJd+jTGpq7pokBwwZZYNsN+iWySwMz7RU4wIN3v1dEB1/ZgLZEv4sAuZx2u52XgEMEtdWv1hL2hHDMFai+TyNH0yQiGd69ahJc4nAxxX07+mZ8SpW6xRagdwiV9lbj3zbVxhme51N83a4a18ow6owAz+SkTOvL1y1ngEvCuNtL2DcrUJaw74Ee71LEccN2LRM5NCogXpCQgn79GAaPOe3lh2yAK73+T41Z7KUCzjYt78I9+Cwm4ERdTyBJJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYg3cGbwDp40dikmXtkoLm4B0KkRTC3YTaCn4uQWz/c=;
 b=Y/1YBlnWsXhrFMzT3fX/oT7lZQGBkl++/nc/F5pNXCarQtiaJgmtg2QUo0rY1z0YYc5npJ4P1poOTPI8SpsNdp0LhPRUO7jT+O42kPzKOetY13bNJTuxqwxmE4LCI471iPhMfcCPQn/4WjhnAiUZguqtOymasSfn8Zd2iO8ADU9mBSaKWjtnYpfvU9AP4j3kIel2P3eWctOl86lVCI7fgSGcMiFsx75o2SuEwDfbe1KWv2oQ7rLaq2HDgLvjd48sidprksfptRFmugw+YUEkbz7nXgr0sfhogg4gbkH+W7YO4qnQd8OgbmLZXl6cZFvSyszB295eY/8MMWDUjMbqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYg3cGbwDp40dikmXtkoLm4B0KkRTC3YTaCn4uQWz/c=;
 b=hTXD1uu+ueWX8QhIL94XBoZ9G4lSwrvFw0yBENrIVMJoVi5n3FygMC0xfAfG38av73spB3BFKZtlRurarTwlU6PL6McyNtf9ssph4yJWz3M+jKGtAKrC/k+HjTEmJErrScKsEMxuvrjRz9i5pVyiJMW9Meg3D7FPwJhzHQxgJcCC8/7fAvlLiIex1IDQYAIi65LHzAIXwyvE6gRKzfXAXldcDFhamomxtiB49TPOM3XYtKmuV/1WpiodWFO+3fmzMRsuJ528VjO+vqXuOOAZrnV2oxaPum1R0EVi+6jTj1SP/fFqh+bWgbdRKXOq41Yv5BUKElwrFgh55br1DGyqyg==
Received: from AS8PR04CA0187.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::12)
 by AM0PR10MB3315.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:189::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 06:42:24 +0000
Received: from VE1EUR01FT084.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::7c) by AS8PR04CA0187.outlook.office365.com
 (2603:10a6:20b:2f3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29 via Frontend
 Transport; Tue, 18 Oct 2022 06:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 VE1EUR01FT084.mail.protection.outlook.com (10.152.3.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 06:42:23 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Tue, 18 Oct 2022 08:42:23 +0200
Received: from md3hr6tc.ad001.siemens.net (163.242.52.177) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Tue, 18 Oct 2022 08:42:23 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>, <Ross.Burton@arm.com>, "Peter
 Marko" <peter.marko@siemens.com>
Subject: [OE-core] scripts: include all dependencies in eSDK
Date: Tue, 18 Oct 2022 08:41:48 +0200
Message-ID: <20221018064148.10638-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [163.242.52.177]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT084:EE_|AM0PR10MB3315:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ada50b2-6aa6-4f98-d326-08dab0d3ea2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AnMr4kgTJG8hz9DMDU8Vnl9+vSbaAdmEl0asTL5R+/0DFB/VlQcb076VkEhA67FTVUwNiXAQvh3a6VgoU3ymyZraxPpu97Rcn1g8v7BLSsEb/qEkBHoiOva+wU8VJVBj9cplmKjaNT/rCkw7VGxePBzVsKUvvfPem3FG/jGCS+CBRAqkiNIMfuYYutZdFMy9UqX9SgtiOEnPzSD4RrmVBnvTUInl7SUTqNTcBLRqoBFRFByZKNb/H7c+3MVVlEItxBpZxM0DNvjVkv/lIMyOY3zNLIzn/R476rKbAsaddFbgLjGcaVW6t7KeK8U1bJrEVPfBUWY/i10ezuK+CMZc4vov0z3dRENaWbaGfql0Ye9LhO8PghQhm0CzKzmfWAoLS9wVwPMeYXqlyV9BqzSQBE0AloFINrN3rnnW9/PTkr0bvJxQ4MeAzoGv6FYPU58NhbO6CgyJ0C13+/pmZ1PpBo41+G1KtLCNDzVn7rX/C1w11GB479wV6we5IUVX8+mN+VHfwWHxKhjeVr66pRhpw9GeDf1vYhwd4TiyZXyKOP2yqpb5v/dIrc5RyWS06L+Orptf/KxS5b4+Eu0NhibAXoEua94hRcLVb8URv4sB01y3dNX6D/0dpz2gKc+HX2wV/IgLbMO9+oW8jPdfAbJKzMozdnURjW27MCUVSNFdPsBh42MDLjImtQdMvnsk4eeWSxH715qvXEBUOfLN8l2aiYKvQLhsmni9zHcU479d+xDlriXWX88zNywTqHEOPud4BDX8nLpdikKaqQ34+4uFHyWWes7IgiGQtPyBbgU97nCoav+Pigg0zDb45V7H/+skOJHtmgRamQdxbijw49uaOg==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(336012)(47076005)(36860700001)(356005)(86362001)(82960400001)(34020700004)(82740400003)(81166007)(8936002)(4744005)(5660300002)(44832011)(4326008)(41300700001)(8676002)(70586007)(2906002)(82310400005)(70206006)(107886003)(186003)(956004)(2616005)(16526019)(26005)(6666004)(6916009)(54906003)(40460700003)(40480700001)(316002)(1076003)(478600001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 06:42:23.9403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ada50b2-6aa6-4f98-d326-08dab0d3ea2e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT084.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3315
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 06:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171935

Without this recursive dependency on do_build task, eSDK includes only
direct image dependencies and there for devtool recipe has to rebuild
them all.

Resolves: [YOCTO#14626]

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 scripts/oe-check-sstate | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index f4cc5869de..5c185fa85e 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -52,7 +52,7 @@ def check(args):
=20
         try:
             output =3D subprocess.check_output(
-                    'bitbake -n %s' % ' '.join(args.target),
+                    'bitbake -n --runall build %s' % ' '.join(args.target)=
,
                     stderr=3Dsubprocess.STDOUT,
                     env=3Denv,
                     shell=3DTrue)
--=20
2.34.3


