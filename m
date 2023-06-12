Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A67C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 11:58:12 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.70])
 by mx.groups.io with SMTP id smtpd.web10.56868.1686571086708020581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 04:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=F0fijVfi;
 spf=pass (domain: siemens.com, ip: 40.107.15.70, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1QdhcUqT63KSdYDTFNoAAHbasY+u0d3DojrttM6tjQK+9KGFvJFqlQhgkfy9IfxjAUxUFcbXVCMBvCiYD8LWmMA8t0DTVMdqdXshCP4zSMQY/1SoEqNx0NCaLtqeZ6NBmXtL8gAC+aVcNJJ4297hqz6jeDpICY/kaoiF81La4BFSQWdGKCrbDIqzpQVMPonty0HmpvJ1qPrTFH5w8J929TdAZkVFqfEDz8Qf8ZItK+WlC+etrUM9t26NcsPP4zj6h70neFcL6FQHYX/L6Rp0BIh2aNuSqLdvylCwFb5zn873xOTc7F18iZNkCudtZ3NyH0/voHJGqPzacQ2cuR1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqAvZuLJfe8GU9lYdj2TGnDMgeB1bbk6lfhN8wKOEhk=;
 b=UDMuC4bD9C+Jm0H1xfNVcvDvKCnxX+17z8VLJ/uuHmZ6LETitk4M5y+z8J1mBe47tO+9i6wxbiWpZL2m7jA+5GhrpY/S4qXTp+Lp/pcPGyXdQbjnhMWlGeqkJWs5x1QQ7uVJ7NAoG36is28lT2pY6+ZPJlCxrCjEX5zYH5gJJXwNhYIKx/cHqqFneLmteFiLUkkgRBrr1C8OEdbYMKRoaWvmb677Ij/mNI7A7l72wnc/HtxDdiL+NrhNOAgSzQeOfqxcxiQNUHhdtWl52uOdqS5N79MIS3S7Wy7XeX8VYH3UbzL3guzIS1eUti8tvnAVaqguleoMTjSVaYj/I15kDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqAvZuLJfe8GU9lYdj2TGnDMgeB1bbk6lfhN8wKOEhk=;
 b=F0fijVfiECyWM2Gz/SDXf4B6ubCPYe9mL4Iw7BIQmcTkgqH2UiFaB/i729sDEH2o2eRH2z1RuulV7o/BSJPSEflsRSsxfOJGVxB2heeGKLBeCTmupE4Y7A6li1daPT8Yt6fnpUHYzMeRoup8Wr43TZ7S9xZSfj0E6IHP/D/1PZgo0+yChEGctIWdJciUjuBe8SkF8lSTduIx2j2O7xVEiJ26oJZ1qhsESehLshD2ah3iabayX+4MjOAC/K2munnXIgCwkk3xX2mt+qfzoOdta0conT0b0LC6Xdca+YFvoX6cx3B6oRKoUYQNatKRcBpKBY8VxQBMqCUIUynozKAcwg==
Received: from GV3P280CA0070.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::25) by
 AS2PR10MB7226.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 11:58:03 +0000
Received: from HE1EUR01FT095.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:a:cafe::c1) by GV3P280CA0070.outlook.office365.com
 (2603:10a6:150:a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.33 via Frontend
 Transport; Mon, 12 Jun 2023 11:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT095.mail.protection.outlook.com (10.152.1.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21 via Frontend Transport; Mon, 12 Jun 2023 11:58:03 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 12 Jun 2023 13:58:02 +0200
Received: from md3hr6tc.ad001.siemens.net (167.87.37.146) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 12 Jun 2023 13:58:02 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][dunfell][PATCH 2/2] curl: whitelists CVE-2022-42915, CVE-2022-42916 and CVE-2022-43551
Date: Mon, 12 Jun 2023 13:57:43 +0200
Message-ID: <20230612115743.52686-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.37.146]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT095:EE_|AS2PR10MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: 382daf46-4cd7-4196-fbca-08db6b3c46eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WitocTsWTtW8MMem34Fz+KAnDgN5blk8ydbz0iMTctf+SPzIiR8ni0yUeiFpledEE4iOZmcpRvAyXj+I45ATttPMqOG+KZ1ODU7irQ9+FTdJTEGcfuFPKKdmFZ3oWtJOgFrgI+Rzk5CgMmvIdNO/hyARe/2hCv+w3xC3tZh3e37LWj3jKZEr4QFuxthRSg1nqAxvQQVvAFLWsT2oyAw0Fb5gBG9JDEcbnMgDwyprOwa13b1uMUMIE+DqrBFp3TNk+lZfQv8r3ZN3I+PXy1oxszcXab+eKWg64eSKQOiaB27YYkXSa1YOsQMapCR0TeNZUeDeGO/79kuouJQsQNl16GlwFUv7fB+h+nn9GICtMaXMkGyzFzGjFBK8DFhCjETsmfflMLBCwKi/Vw0f4x3+nzSWd+Nq9+L4kAszKaXE+I19VsM5hAo1PjivUEtgpP3H3OIv47zW62i9W8830ZoDyMma/qCzHFq0pdcsTMfNADQISYVsOr9x/K8yBKvC2pDDDZrTdQ6HwCbwlUn5LJqsaLUIHgEkRKTjI15VxjKKPDWj0yAkPl4j32d9iq0cTplLD2HkrBSd7vkJ7nQ7zN9U4S+jsHKtY4tYwRHKSxHqBSI1HDF1xszJhtF2QfUavItuOOSqyA+sI2MhCkgKgX2Nzt2y6Lz+6U6Sr80pe7guhPEcUztVDfbKYalddg7oV3Hu8OJ2O2ilDlRYhRxKCQabyvHfmrVOHGQE/14WVE2NPKcQ+TipLGvNZPoVEvc4gY0PQ2HoKMv/w1uL7PIhwWPLwQ==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(4326008)(8676002)(8936002)(70586007)(70206006)(6916009)(36756003)(41300700001)(316002)(6666004)(86362001)(478600001)(4744005)(5660300002)(44832011)(40460700003)(40480700001)(2906002)(82960400001)(82310400005)(81166007)(186003)(16526019)(2616005)(956004)(82740400003)(336012)(26005)(47076005)(36860700001)(107886003)(1076003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:58:03.4144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 382daf46-4cd7-4196-fbca-08db6b3c46eb
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT095.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7226
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182666

All mentioned CVEs are related to HSTS check feature, which is not
implemented in version 7.69.1 .

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-suppor=
t/curl/curl_7.69.1.bb
index 899daf8eac..ea36c0bd3d 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -56,6 +56,9 @@ CVE_CHECK_WHITELIST =3D "CVE-2021-22922 CVE-2021-22923 CV=
E-2021-22926 CVE-2021-229
 # This CVE issue affects Windows only Hence whitelisting this CVE
 CVE_CHECK_WHITELIST +=3D "CVE-2021-22897"
=20
+# HSTS check feature is not implemented
+CVE_CHECK_WHITELIST +=3D "CVE-2022-42915 CVE-2022-42916 CVE-2022-43551"
+
 inherit autotools pkgconfig binconfig multilib_header
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnu=
tls libidn proxy threaded-resolver verbose zlib"
--=20
2.39.2


