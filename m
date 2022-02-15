Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43721C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 12:55:20 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.101])
 by mx.groups.io with SMTP id smtpd.web08.9067.1644929715247234052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 04:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=g50EJLpA;
 spf=pass (domain: arri.de, ip: 40.107.15.101, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJ1Cc92UdICXgAofovp3nsqXdhlf2GAd/cR/uP6NnPzr/sZ5OKd9KxF73rEccxIVbsA+eN8vb8Vb319iGmn0yc9d8Sp7DAYKsiE2JyCUSv5Jp0u4iz7ppPPpCMko8jR+YJ6IwvUHuzO5HedFGgpJWb/VOtYnEWYLRchBjb0em/h/HSwCsNIk4fbeuTXj8Ub80ubvf/GUrY0Q0u/UsBcdrfx8JO2XkxKLudxGBD31otpJzUi5k/EhaCW0cuex71iPFngCxq5p1mPuHbttOTM3nXdwSeL0sfFg5z8Rpna8Ifi18SsoIYyRdsUzEYeoT1hJs6HCJqfZqkqct/nY2mNjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sW2fLqgAgzE6LkEzPH6YEkmBHH89Ube7l+xLVDmTJ0=;
 b=NtUTr63q7OO9UIZmFz1Yn6fOAz0Icx9ZdPACz8QuUdPFZbCZXGjy0FAs+kbOjhY60PAfcH3amuVJKgR6RE4trShXiZ6uTqm6rawGszlAloM9lNOIB7N8/IZBBUiSgso9i5gkOUXqUtIQnQ4b4ERvWbOXt2VeQ5a6/wdColntgDvJ6uLZwgWq++XPbIENWSe0nw1PHc1Gx3MrVRTmtcaxrfxTUuclJEbleJwhDa7+6IZYYQ7rimv9JD0bEHMPlx+7wfJNfxBasxx1SOPMGj+42hhPjn6IOFFTi6MrnAOVMNZJsTnQEqfz5slSIb/mbEzD90Q4pDHjwsTFYblEi7FiwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=arri.de; dmarc=none action=none header.from=arri.de; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sW2fLqgAgzE6LkEzPH6YEkmBHH89Ube7l+xLVDmTJ0=;
 b=g50EJLpAz82fL6S0LbUtC96R5hVR2tYkUIaN38Xj6PwSCE/zGM7vA5qCiPc6OiIqRWlpLTqFaDUyLnjlXOgKQ9N84brIL2/D4EadFMncMl7qcds0Ue3g0HbDJ/HYRFHaG/z77oM4DL7BEv33k0Pbdh1iCOO97sRsJiOkQOnIRWA=
Received: from AM6P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::43)
 by VI1PR07MB6317.eurprd07.prod.outlook.com (2603:10a6:800:13f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.6; Tue, 15 Feb
 2022 12:55:11 +0000
Received: from AM5EUR02FT046.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::6c) by AM6P195CA0030.outlook.office365.com
 (2603:10a6:209:81::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Tue, 15 Feb 2022 12:55:11 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 217.111.95.7) smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arri.de: DNS Timeout)
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT046.mail.protection.outlook.com (10.152.8.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 12:55:10 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 15 Feb
 2022 13:55:09 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Tue, 15 Feb 2022 13:55:09 +0100
Received: from localhost.de (192.168.55.96) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 15 Feb 2022 13:55:09
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] curl: configure with '--without-ssl' if ssl is disabled
Date: Tue, 15 Feb 2022 13:54:56 +0100
Message-ID: <20220215125456.13686-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.55.96]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9f331d6-92be-4b8a-d932-08d9f0826687
X-MS-TrafficTypeDiagnostic: VI1PR07MB6317:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR07MB6317FE34FC6F34520A37C893BF349@VI1PR07MB6317.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R5dIFm07QI8kxa2cip0YIWwj55pd6w8xx0/DyvaszlVHS9Tq65/y3rJblvlqFu91YSBBqHvmpREjYtdmrhNxFRwwP6/Mo+YFE/TIxyc1W9q8brUwymH9T9kwMQnT2mkWHBIM9r2rzA/TMvOYNJQsac9M5yJr8GueLLr3r4t5kBNol1biXrewtOS2/zpbKCsRy6kDM8OS+WiRGtHfH14EkYvq8Wi2BxkyXZAlAHv39Ba0+CtpX1qukv11yCvQNRz2DJ8nXoNPB7tsa8V2n+CRYzdqJKUr81e1mbf5ah3JELkiY0fwVK+3docGMPmWvS12JYI5yLPIJAeq2zWFPp6P1vrX7mxcYLJu46Jd05F8BgQWvhEPl4wAWFHlb7V/jy2KsPIo4zgZvWmfjb+n7nPX8OLOha48A9nILzFRfXiij/q/DQ3e6SeO9ggJCNiTVy27XuYfrzcEcFNQpZgtR8BKDY+3msP7iUuhaoczyAx8iVF0lOApNo1VdOYRYc1IZKfqeUCssabFp+9e6sxp7+VnsW/5/11gk/NZueQHhRnj6T+yIsob9m3U7yrm5bSrwykpO6f9WByBnRA4tgfiwhDuQBdwTdjjfAlCw9FfkjoR1iKUkBzcW6TxuNbr6739jy95g++FbMfnXLZyEGODwKbNhMUmrNjsdsbun+zbBF1z4FuElzJrSdaVKI50ROnaPZXq
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(16526019)(186003)(107886003)(26005)(2616005)(36860700001)(336012)(1076003)(426003)(82310400004)(63350400001)(5660300002)(47076005)(8936002)(4326008)(8676002)(2906002)(70586007)(6916009)(36756003)(6666004)(70206006)(316002)(356005)(81166007)(86362001)(508600001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 12:55:10.5760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d9f331d6-92be-4b8a-d932-08d9f0826687
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT046.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 12:55:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161747

curl requires that at least one SSL implementation or explicitly
'--without-ssl' is specified. This is particularly the case if
PACKAGECONFIG is empty.

| configure: error: select TLS backend(s) or disable TLS with
--without-ssl.
|
| Select from these:
|
|   --with-amissl
|   --with-bearssl
|   --with-gnutls
|   --with-mbedtls
|   --with-mesalink
|   --with-nss
|   --with-openssl (also works for BoringSSL and libressl)
|   --with-rustls
|   --with-schannel
|   --with-secure-transport
|   --with-wolfssl
|

Fixes: eef6c45fc6ec ("curl: Rework openssl and random PACKAGECONFIGs")
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-support/curl/curl_7.81.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.81.0.bb b/meta/recipes-suppor=
t/curl/curl_7.81.0.bb
index c22a13cfea3f..e7219def18d8 100644
--- a/meta/recipes-support/curl/curl_7.81.0.bb
+++ b/meta/recipes-support/curl/curl_7.81.0.bb
@@ -67,6 +67,7 @@ EXTRA_OECONF =3D " \
     --enable-debug \
     --enable-optimize \
     --disable-curldebug \
+    ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtl=
s nss openssl', d) =3D=3D '') else ''} \
 "
=20
 do_install:append:class-target() {
--=20
2.34.1


