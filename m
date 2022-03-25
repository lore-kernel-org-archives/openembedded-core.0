Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D38C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 06:52:53 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.109])
 by mx.groups.io with SMTP id smtpd.web10.2205.1648191170621331842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 23:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Ji03VDCM;
 spf=pass (domain: arri.de, ip: 40.107.0.109, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eR25ECA970Ebjura/yBJAS0FQ1PSU9dgcCE6Idqucnba+Kj3lSwwSs1QbI6t7rjW/TNHY9Y3zwTroILBQl55zblqZQiMFnL/krzEMpVXPUwebF/JwHacJGvdo4h3ssVJp8/3PDhgUVZrtqBESKuEjezrSsDmgwVkh5E2uM/Uw81KhqN+EMzGaM7ifU3hcJlKgSSJcHHvp+TWNYan52Be8HUUA9ubR+ubwWGR8oog+vlBbkFvBPaw0upCyi+aEC7v628psBr6yvGesvZ0N+4daC/jh7Rjcg3gp0ve67RBoDL1h6ylhkLpI5mEG4a7MKt1tq1immfM7LVhIZEUXlhC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2hpe+Ua3Uo7eKN/ixcxg3IWBr7UTZK6NzP0GFmW1bQ=;
 b=mTVcUCbn16hA3N4HffhxvcDKMqUbtFf601+cM9um/z87qmZI3ZeOIQX9af82dxEjumpWRLR6+Lg5tY621Qqt5FQIxvHRuHDUzp6d/d/vOa0oC7PUAXTD7cUvgaWko3Ti3/Muzr1sI+EpLZG1VzfAHgCYusq874IU0o0mk/ARRTlhe6J1i3GYRrELsicrv667B8Wlyt41tWsqShmnfCphdIrs/RWzK1wBurJWTOH1LO7DPl/gbaeUkz68P9hXUj/i5zdA8s1G0+3yhsQ/VJeRwl1SmRuBh4nmoq7fjSTVz2PGIksziFZax4pHkLgqAgsx1wFAH4DtpfNpz70anlggfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2hpe+Ua3Uo7eKN/ixcxg3IWBr7UTZK6NzP0GFmW1bQ=;
 b=Ji03VDCMWXJc060b8vNUBMYKe28ntl2HV08r3oDkJMn3VfIMc60aF5hPMlpCCSzO7xfL1XDBorPRIf/yfHULrkOi/+RLY2DvIOx/1kvtTyXH88S8FUQgkiiERcZisCbCG4+DSECu0fJJT/O47EQHqOYOrg+aihBjhJ4bUlue2Co=
Received: from AS8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:310::6)
 by AM0PR07MB4051.eurprd07.prod.outlook.com (2603:10a6:208:4e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.11; Fri, 25 Mar
 2022 06:52:47 +0000
Received: from VE1EUR02FT051.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::e2) by AS8PR04CA0001.outlook.office365.com
 (2603:10a6:20b:310::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 06:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT051.mail.protection.outlook.com (10.152.13.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Fri, 25 Mar 2022 06:52:46 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 25 Mar
 2022 07:52:45 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH 2/4] machine-sdk: clear ABIEXTENSION for class-crosssdk
Date: Fri, 25 Mar 2022 07:52:24 +0100
Message-ID: <20220325065226.14833-2-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325065226.14833-1-ceggers@arri.de>
References: <20220325065226.14833-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51c35939-2563-46bc-32bc-08da0e2c11c9
X-MS-TrafficTypeDiagnostic: AM0PR07MB4051:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR07MB4051BE44A451BCA89065D34BBF1A9@AM0PR07MB4051.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1dDef9HQKivWkXcikZ/wLn3XG99lRTkN/vUXuU2KdeKIPhKRLfJK+Rgu/uuSUR7p9ObAYe+8pN43pvOh0+FOdzsXOgHICqIsflQi1xYCxcyY9kNVt6JL6dRMrWKW1s26JiAcV2tvQfCxvA4u+JqSH4qbTVKaTslV2upEwbzH742WLOt5div0qFnP4pzHNVwqJ4/omBEpMfMwSYfooisPYaX0kRX2jnQBK6+mbWBUvVlGGvkHzpwJ3spgLB9NhhavYiOt61MoJgmTox7KCRyuZfvaJl3PdV2htT3Me9+OPCOLYQEfKSY5KO6+zptp9BKg2t3hZhdMTKIwqfJfyuUkIgUvLJZwyee/MXqEiBDivtspMbI1xXLe1LBH6tEWmILiRngcXpgSOrRTcWqn7l7qO5DTFV/MBn6HsV/uec3E2sefTgQn2QZtaB8+KmoQQT1xafFuHbDx3KlIiN/VWOADjkvNDuRmOLINIRbzmE1LiCFwsYGt0JPp7enHeFUvxxyCrJbTErbL3eF9UpX9VF1aRhvoIjIA6DrVnOeOHRi1MuYU0lLu88JUsZmt4iZYuAhdlcxzullPESShU3YMaLI0VboJ8Vn2h6EUGzsaPVmM3cexlG+BbOzbf/PrTtByGbB/rrY9DUB0LOk0C90JjMc5mJMa7lPQFOL73EPke4Tq0BaPMPzkiwBWMYJMVA1BLTjkV4wt1FLYxmkoFa6VIBEMjw==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(1076003)(186003)(26005)(426003)(336012)(16526019)(8676002)(2616005)(2906002)(6666004)(82310400004)(81166007)(40460700003)(356005)(107886003)(36860700001)(86362001)(47076005)(316002)(36756003)(8936002)(70206006)(70586007)(5660300002)(508600001)(6916009)(4744005)(4326008)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 06:52:46.4844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 51c35939-2563-46bc-32bc-08da0e2c11c9
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT051.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 06:52:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163629

For nativesdk/crosssdk, we have no ABIEXTENSION. Fixes build of
rust-crosssdk if ABIEXTENSION is set toe something like "eabi".

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/conf/machine-sdk/x86_64.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine-sdk/x86_64.conf b/meta/conf/machine-sdk/x86_=
64.conf
index 8d494b261e0c..2ab607e65c22 100644
--- a/meta/conf/machine-sdk/x86_64.conf
+++ b/meta/conf/machine-sdk/x86_64.conf
@@ -1,2 +1,3 @@
 SDK_ARCH =3D "x86_64"
+ABIEXTENSION:class-crosssdk =3D ""
 ABIEXTENSION:class-nativesdk =3D ""
--=20
2.34.1


