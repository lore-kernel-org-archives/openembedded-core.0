Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7300C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 06:53:11 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.121])
 by mx.groups.io with SMTP id smtpd.web09.2326.1648191176185559513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 23:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=guZnBMFa;
 spf=pass (domain: arri.de, ip: 40.107.15.121, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXxakmCMvJp/ScgtwvCJa/UvSlmKf2/1CVTjy51VyVykL2lQoZbIuD6YHYKmASetNUEP9DTQKprlkzEIcV7q+cS3U6xaBNBtuet3QogPTbVpi10IdEXOWMJ+rcIR07Hv+gvaOCUaRFrRb6F+2VhzwNeknmQsjZtm0iogx6in5g/PPFjamWqMwcurNXfNmVIM8uE8OVAFgNFyo8RwGiSB3HAMl930sNrNuZtWv+qClucpNPdSY//sNofR9QJNgdeY+37NBJ22TfICxmKD5W6dDRWOiDb0s5r9Gx4YZEn85amVrRHV8DehlPfR6tfjinWCehXGW5Nu2C6zK+1nfbR9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IANVX7UMsgkaGcmK2H4XF++TxdhFWHItL/6x/Eq88w=;
 b=D3Ums9cA388nD6aVI8qD2pFIj+GnmtwHfrTCQvzu+54jVqmELJUjE3Z5L8QaVbftBHfCpeRASLVqeHOCObHjWvwsL/zuoFXoc/sRrRqeezlNw2iRspNCGh6j3LjCP+oG1oBJgawnFPbWQa2KdydqNvMOfrLTLv/jHNZgrq5kGze0aSY4TGKvJllkH3lZJgUvCgbisVNsDEKo32AGvN0TrXQSC5huMZLveu64q+vCYupg9UGhSVpvOiP9mySb3D2Da/kfWCkACgYjcXKpSAzDV5VHAPXqPkrdGucF3ST9xmZ2hLyfrRqU48ZDjsmDDlu+x3V1HfMAOAnU8CFwb6KhcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IANVX7UMsgkaGcmK2H4XF++TxdhFWHItL/6x/Eq88w=;
 b=guZnBMFavSm1ohdSojWJPDnDdb91liP2MZFw2uOR1Jok1GBRhpR1x5tTlPd4QWJ7cgy4p3WXkEadcOaHinHmBAnyMPnJwsyXFrPsDZcTVc5BdqmlHmXSonf5Z4cYZawid9yk28w6Jvl5WZCZUZlaW0UgntAXcwxtx+5JuB9AOBc=
Received: from AS8PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:20b:310::31)
 by PR3PR07MB6843.eurprd07.prod.outlook.com (2603:10a6:102:73::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.11; Fri, 25 Mar
 2022 06:52:53 +0000
Received: from VE1EUR02FT091.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::83) by AS8PR04CA0026.outlook.office365.com
 (2603:10a6:20b:310::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 06:52:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT091.mail.protection.outlook.com (10.152.13.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Fri, 25 Mar 2022 06:52:53 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 25 Mar
 2022 07:52:52 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH 3/4] rust-crosssdk: use ${RUST_LIBC} in ${PN}
Date: Fri, 25 Mar 2022 07:52:25 +0100
Message-ID: <20220325065226.14833-3-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325065226.14833-1-ceggers@arri.de>
References: <20220325065226.14833-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 718b1ad7-a8ca-48ab-b11e-08da0e2c15b1
X-MS-TrafficTypeDiagnostic: PR3PR07MB6843:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR07MB68439EB22AB687CD20474365BF1A9@PR3PR07MB6843.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RR2nrNrmJ5nM0TUKywuQ7hijHq3H73fNJk4UBVRF0717LbHhnSXdvJih4GrCWtAQ/bsUnq1EkSSv+QHQteGQmD3bhGG/SZDNl09FAPzT0nJqfLbVX1ES2Ha1jElCdAuTeH77/ryS0Tn+8NIaKYKWkNNS8WJm3TvxftyO9z5eqWwzXfgFtsYUe/2G9jxfQlk5/J9APXn++/h3X6oXjI4RVGDnhJD33EME4lWnp8BZDMsya7VoOiJrgBfr7pthoaco0HLFBIeiwGTciU4gGIZ9ycP4NPuom9BVWXeHEbxFC801t/zu+CoTq8Dq9ovPJWxDV1LzqhD50cFgelJQPTtg13hVaaZ1Z9pAJEb8THz+kvbq19R49vgarWY4qNF+uL8R20zH4fAbn+yKgA1FwNUy+KeBA+T5UAMeEO4jTG5Sy+wF7aAxeNb6gopvDJjYpKhAJqlJgbhslOXMnY7Z1tgdQdvMY4G9/0erfb9bFZjcx/lz8ib4bjmP+dH2UPGctbG5WzUWpajFvY+cmof7LA+A20ZqRUD2YHNeAZ1/0rdw0lmCMShxCUvvK3rpJQsCyITSkHKTZcCYBoRjKx8zD9hribsgAVfzLXMfgc/xQLEoq9zBeVV8p++RHX8FncV7adJWkx7qyiNVyzmMLMMBcXw4r7GABvDefORW6y0nnBzRTR9nH2vYl3kX4zEgKhoPl1/lDW/w/YFxS6v3xsdJc3HFKpPz3hKzV8miROJB6yM2ReyPYXqujHd2IHYZkiNnj35w
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(5660300002)(26005)(186003)(6666004)(4744005)(1076003)(40460700003)(8936002)(6916009)(36860700001)(86362001)(508600001)(356005)(83380400001)(2616005)(81166007)(16526019)(336012)(107886003)(426003)(82310400004)(8676002)(47076005)(4326008)(70206006)(70586007)(2906002)(36756003)(36900700001)(228453006);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 06:52:53.1038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 718b1ad7-a8ca-48ab-b11e-08da0e2c15b1
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT091.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6843
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 06:53:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163630

TCLIBC is only valid for TARGET, not for HOST or NATIVESDK.
Fixes build of rust-crosssdk if TCLIBC is set to musl.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-devtools/rust/rust-crosssdk_1.59.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-crosssdk_1.59.0.bb b/meta/reci=
pes-devtools/rust/rust-crosssdk_1.59.0.bb
index 5929978591fb..6ea8cb09b21b 100644
--- a/meta/recipes-devtools/rust/rust-crosssdk_1.59.0.bb
+++ b/meta/recipes-devtools/rust/rust-crosssdk_1.59.0.bb
@@ -5,4 +5,4 @@ require rust-source.inc
=20
 DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TAR=
GET_PREFIX}compilerlibs virtual/nativesdk-libc"
 PROVIDES =3D "virtual/nativesdk-${TARGET_PREFIX}rust"
-PN =3D "rust-crosssdk-${TUNE_PKGARCH}-${TCLIBC}"
+PN =3D "rust-crosssdk-${TUNE_PKGARCH}-${RUST_LIBC}"
--=20
2.34.1


