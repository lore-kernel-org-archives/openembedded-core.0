Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCB0C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 10:51:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.110])
 by mx.groups.io with SMTP id smtpd.web09.32550.1644835867237350109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 02:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=eAVxV8sG;
 spf=pass (domain: arri.de, ip: 40.107.22.110, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzsARRu/i+yOThOSo8QBhMNiCDtulHAsCl5Sd6zPsqcTs9FWSiSGymjeZ407Dru0oETx6W+bmYshAbhss1auOvqBdVLJFdWWOrQPvUfU/YMcr66vFqDGYEA/1lgMrqFUWe9dknArPNKfZMZqa8/7Ot0pjQ2aPh2mh72/avXnbMONpiFswzHoXGxUCRZfbtFf/3zN5X6pGZZhus97Sp7dkY9WLhNLb2FZb1B8nNcA7hbntYlwLoJA4HgM7XJq4WxUyLNcJF/HngeBS4R5C2hzobpZKrot+OhRex9g7ocIKnEc1G7Aou0TxgNYX5pdQFxAfMssSmang8+wHui39FUs/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snZmtbqhKoUB9V6dWKmp4pSdmJTzuj0nKb3rOIfFgTg=;
 b=JkS8g8qqRfBHbJstoFCK3JakwrrxUhq88FCK+9IU18cpxCaRu5X7wUrpLbNQxPUFAYPNXqyhHnsgMsZCG4unoQqWv+ONWHkAWn2SsmWiPsp13X8iO8gdEnjY9HcMyPAkUeqAM2R9+xeBNx2hRvEE4gkrYNkf24JkaHuvKJu20FX2zqiWm6s1x68PDD8WU6k9Q0CCNxjiOkvSlKou0EwUGOqeuDhQIfZu/2+ce5K9o0+IYiRaT6tXfIOGsp+6KR/Qkkm3RYpNjbL2JFiW8RoqFW2LiQrCFUgvaTb+SPW0p2p/w9K0cVUnpfveI8gIfXVIVGPgy63lDRdXxZCBop3H0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snZmtbqhKoUB9V6dWKmp4pSdmJTzuj0nKb3rOIfFgTg=;
 b=eAVxV8sGzDDFrJObJO7yiADOHMtENYrGG+iw7U4XilFuBHoCa6x02rmqQVar+Bsjk04wvhTOZYvNnHbeJDxh9gT35XxG5wnMqRHdWtMbjfqgAH6cmtvUFmTp7WPUGVcxBY2KKJ7L15G2lh+7jW/bvd1UVIZPpRgyb2Pr6WTfB2c=
Received: from AM5PR0201CA0010.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::20) by HE1PR07MB3068.eurprd07.prod.outlook.com
 (2603:10a6:7:32::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.13; Mon, 14 Feb
 2022 10:51:03 +0000
Received: from VE1EUR02FT005.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::f7) by AM5PR0201CA0010.outlook.office365.com
 (2603:10a6:203:3d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Mon, 14 Feb 2022 10:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT005.mail.protection.outlook.com (10.152.12.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 10:51:03 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 14 Feb
 2022 11:51:02 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 14 Feb 2022 11:51:02 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 14 Feb
 2022 11:51:02 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] sdk: fix search for dynamic loader
Date: Mon, 14 Feb 2022 11:50:51 +0100
Message-ID: <20220214105051.16705-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af5ca7e0-1fc5-42fc-a976-08d9efa7e50e
X-MS-TrafficTypeDiagnostic: HE1PR07MB3068:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR07MB30682551241BBDE267FE391DBF339@HE1PR07MB3068.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HyGiI2a+IGdC9a2TnyDBGWxYoEK++4cXZmJXd2WHe90Cf53539to7RNguj3D5wsGmjFJ62cKjy2nRrfyJsMigY8vbcjGyjoyUhtCYN3PjZoaraGCN04gOf0H3HQFrrzbFDynTUNHHNz0OBw0n5VWU6WKNPfovUPplq4z1DsW6q9ttZG4Cp7mQy0q5Y+7xuyOb0iw2s7yXV6JBVqyeK4mZeoOHARburJI2UvCIxFqo1+Y0+YCdFlC1fpg2dYuQ3CBJkt3BH4/F312uCDZ3zMaH3z2LihHPlu3i7iGrTVJY8AI3i8ZG+Wp5zpE2gVHSSaKrR6G7kLDYuu8jk537GVe7k6M7RTy2zYpydXwl5oPZ+LgaYPkBKNBGYnc2VG8HVG1gFEpgmdRCV3ULP8Fb3zYADJr8DUQ8wQ4nPd+HamY4Eywh9SB80lLMubbtOV4G7fxY0A6ybynaHPW4t65AXORGWtyoxkiHzsSEEffFKyV7MLn3rBw3hAqlCSk8SC8sqbYxXmDOElZglREmqUUWrL5kNmOiF0ogaM/87KbFMsh7pA6DswgrVT8WOcLUYf3Ab+r+qCjCBAJAPX1z5CeWxrhH4BWabbM4W8O/YmPIOwKIQ44PYayg49gPUQNJD0M/7oanXDFG37DWPso+tSiwGO7qIav8vKbgwa2Hn8uW6P032YpVkkXtV/nNWYg+9+ivYnTjN0My5y9ykzHr7tAhlgk9NS4Z2GIzq0KCBtKGxSfckoX5WgPJ9tQXtyTvRML1HgrJg0rJk8eLdykVH/8n7Qi8A==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8936002)(2906002)(83380400001)(40460700003)(5660300002)(86362001)(356005)(81166007)(36860700001)(47076005)(36756003)(6666004)(70586007)(70206006)(316002)(6916009)(4326008)(8676002)(54906003)(82310400004)(508600001)(186003)(336012)(426003)(1076003)(2616005)(16526019)(26005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 10:51:03.0641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 af5ca7e0-1fc5-42fc-a976-08d9efa7e50e
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT005.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 10:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161702

if the package "nativesdk-glibc-dbg" is installed as part of the SDK,
the existing search expression finds two files:

$OECORE_NATIVE_SYSROOT/lib/.debug/ld-linux-x86-64.so.2
$OECORE_NATIVE_SYSROOT/lib/ld-linux-x86-64.so.2

The generated relocate_sdk.sh shell script contains then an extra
newline and segfaults during SDK relocation.

Limit the search depth to 1, to avoid finding the file in the .debug
directory.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-s=
har-relocate.sh
index 3ece04db0a4a..cee9adbf399c 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -5,7 +5,7 @@ fi
=20
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=3D$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_S=
YSROOT=3D'|cut -d'=3D' -f2|tr -d '"')
-dl_path=3D$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
+dl_path=3D$($SUDO_EXEC find $native_sysroot/lib -maxdepth 1 -name "ld-linu=
x*")
 if [ "$dl_path" =3D "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so=
. Abort!"
 	exit 1
--=20
2.34.1


