Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D054C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 13:09:41 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.104])
 by mx.groups.io with SMTP id smtpd.web10.12308.1672924175219643900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 05:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=QYTXyLEy;
 spf=pass (domain: arri.de, ip: 40.107.7.104, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tnxt9psiRFFfNEeoa9E30W/ImjmVBPMNblWT3mHeh9l8mJpcWj+jEx5g4zZ/6J2SVIFPzrJpdD06voVOSv4ofM5EdjB6sx86AP3h12UpuE4D7WI+1pMh4uWfxnXOM53vRScEox8ndQwBYUwxSRPjMMUppEq0RFZj2kg1Vl5ezV+swu/7/fsGq2Fq/EQccqs0UNqmUIIJa+3t1/zayoJHqwxV3XPpIddg1KUE0lhRBuf0C69yMoYwGCW4cuK7gdOHDEKbZY0BzoFhJeAoCwRSXcMXP2gfiPYcnksd/cMCIdOi4YwPdZeS4WcZI6Nl5URtRpfJP3xj//hJbRARXKUNKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6+MvOtJX/6ikMGZgoH//7FNB8TOEd/zxR9AzZAXkjM=;
 b=fW2qqNwtsWH266HdA/h3I1Cacw8IpWj7ghHOP5SzV4WRvjF0zpes3HDS7fdeTJ9/qEicQrpWXensrdFRdmHH5GNqMq7m1zgJqxSJJuB/vfCVirDILgj74eME8lFNZEjfbSZeFeXcoB18Cg+yd/AyaG6LNnBn5XJnsGp8TkEN5okq1fakobAy0kOZJbWW7poLTZATsmR3pbzYuF8fPjTDplJAzwcal5OJLSScm7J3LJTchYG10/q+2oCzQTcXz9bNk2XqbtHAokRIXKLS+9/KehrYOflyyRDmZ3umsYz2UNnz3HTSX/Y5pruxOkaNsAfXQEn+S/mVEuRlRXHJjH85aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6+MvOtJX/6ikMGZgoH//7FNB8TOEd/zxR9AzZAXkjM=;
 b=QYTXyLEytlHKqwMlTAiFFIJXqmh8tOab6ezZFKXUjSOslWTo3+1JjNdz7iJyfH3TGCjrKUcDgf3DSckmi6ntAMCdxfccdWBcNYdQQ6rtK9O/va6Wu/Z9QlKehzSefo9CqNQzVlREhef10VVIlOAgY7pdKbviOMPf4jP6HkcwlFI=
Received: from AM6P195CA0009.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::22)
 by AS2PR07MB9279.eurprd07.prod.outlook.com (2603:10a6:20b:60d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:09:31 +0000
Received: from AM0EUR02FT005.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::5f) by AM6P195CA0009.outlook.office365.com
 (2603:10a6:209:81::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 13:09:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM0EUR02FT005.mail.protection.outlook.com (10.13.54.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 13:09:31 +0000
Received: from N95HX1G2.arri.de (10.30.5.13) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 14:09:30 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] boost-url: remove recipe
Date: Thu, 5 Jan 2023 14:08:59 +0100
Message-ID: <20230105130858.29883-1-ceggers@arri.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.5.13]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0EUR02FT005:EE_|AS2PR07MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d2cc6c-2338-4d51-10cf-08daef1e154c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EXVmGIxcyyt5Y0vOrLcYSUmhu7IKwOMmlPOFzqNh9p1Bzm8W5TgZjfnvz+H7C7zhNr5K8cm8+HzQrrcd3lQDTZj34iXsr7bn/eBJnwo5fhUqq97OnpTXp5f0GzNT4LMdUB3TUDu4SCIBFEtPKNyUA1lAmn0G9oRO8XvQMvcM1bj3UShNIZbxOdziDbOUuYi/9KBc7Vj3BGMR/LKMqsh7Vnaf4IxeNwBoBDJ7J5ETl/wySushTK/m0N3H0gX0uTtVWhueu3taekowxoSO8yOrr3Q+RIyB0IiXoVMECWpgpTPH/WlTnqNKIyZDtOoiAGlxZX7dzLpJe7BtHYfkV5NKXFvD3aVyNfw387C//IEOcU6TDH4WfTS3akVMshj1yI7a64D1h97gszuNSFA1PMVjFH14mEyDYSracrfIiVy1bas7mDTz2PYlpwVaO0Yw5r92AyDlK9zmDUYg/8cYaH32wDEp2E1XWFdevz/7auW1PrzpuFdxcOw2ucR6oDWYnCD+NJLZ0ZoKvw162gAUy6rAd8qeZ9hAYpDn/h+kDvpETfI6zZiMAZoqRuQAKaiYKj8AnZBzLRsFIYGVBrgiae1BUlb4AqCQ/tPAv12G327VrNLd6XDv8J8S8xl15N4zDNof/mXVLBNRsI8P45+PWavCYB+kTbFmVqYOrwQwgLogupf9T88bikkrCqzLIgutC2zlDHauMuOyhtRcu0B1UeB1yho6NrJxh5oWxl/aVe71kXE=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(376002)(136003)(396003)(451199015)(46966006)(36840700001)(1076003)(336012)(36860700001)(2616005)(83380400001)(47076005)(426003)(40480700001)(86362001)(82310400005)(81166007)(82740400003)(356005)(36756003)(6916009)(2906002)(41300700001)(5660300002)(4326008)(8676002)(70586007)(8936002)(316002)(186003)(26005)(478600001)(107886003)(16526019)(70206006)(6666004)(7696005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:09:31.1397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d2cc6c-2338-4d51-10cf-08daef1e154c
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM0EUR02FT005.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9279
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 13:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175522

The boost recipe in oe-core has recently been updated to boost-1.81.0.
Starting with this release, boost-url is included in the boost
distribution.

As a prerequisite for creating the -url sub package from the boost
recipe, the boost-url recipe should be removed in order to avoid
conflicts with installed files.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../boost-url/boost-url_git.bb                | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/boost-url/boost-url_git.bb

diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-oe/=
recipes-devtools/boost-url/boost-url_git.bb
deleted file mode 100644
index 14da3ca3f1af..000000000000
--- a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "Boost.URL is a library for manipulating Uniform Resource =
Identifiers (URI) and Locators (URL)"
-HOMEPAGE =3D "https://github.com/CPPAlliance/url"
-SECTION =3D "libs"
-LICENSE =3D "BSL-1.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d31=
bef20d78c"
-
-SRC_URI =3D "git://github.com/CPPAlliance/url.git;branch=3Ddevelop;protoco=
l=3Dhttps"
-
-SRCREV =3D "d740a92d38e3a8f4d5b2153f53b82f1c98e312ab"
-
-S =3D "${WORKDIR}/git"
-
-DEPENDS =3D "boost"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-do_install() {
-    mkdir -p ${D}/${includedir}
-    cp -r ${S}/include/** ${D}/${includedir}/
-}
--=20
2.35.3


