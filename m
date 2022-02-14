Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07378C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 10:50:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.102])
 by mx.groups.io with SMTP id smtpd.web10.32354.1644835836149980533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 02:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=UowYjs+i;
 spf=pass (domain: arri.de, ip: 40.107.21.102, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxOpwMxwmi2qskV1upg4GDbw/6+un5+fmM1iXNhW+GDQBcoRNew4dfo+6Q0A8DVnHUx3C+shwKHAiwYvSMKYGfJCpLsjwcnq5Z0O/T2Pr9BwUdsS+xvvAFZGkUq1/2fnmlQC2CX/LcXpk2qkTmlosl19qABGYXbd6Zla3EeWabtHcpWcQeLJTVPTCtOzGploDoOvybEnIT8jD5IUaq7bOTP3sKbtrDVrXRU7ii6KIPyt2GKg28IBt7MecnITLmv9EOgqkMMeRBiW6DAT+KriENTRh6BUfFvCgWjV8kUaqSNEumiJo21/m/kfyKxqiDfIeVeL7dilSBS3ooCqvJMYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snZmtbqhKoUB9V6dWKmp4pSdmJTzuj0nKb3rOIfFgTg=;
 b=I4Jd/92TdaeARlLui7VWfhuJivzq5Ac0TD8nEEP70lIQrKmM/bymUh9pHILsKAt6FWKnJobx8n0253FoJfhXVgvyciibtzBpDKjmRLCLOK2kUyGIkWpvxVQb2UWj/b0ZOZrlO+9WVwMyrm12Vq/WCvK1Y5KDjc9FMA6ZUOIclWZmzF1LTyrjwSnGelHTmoO90alEo6OGoc+i13TCNx0qk/6rUMdLrSzjnx6D4dhUZf6y38dfVN10fLshD6/+o0t9RfYTKOZHfAQ+Z0W1kDlyH1uOkKxPiz5JcME9EA1bYsfqjo2CGi/C8/Ph/0vvoQoDwRCUi3Om9HVqdilRnWEKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snZmtbqhKoUB9V6dWKmp4pSdmJTzuj0nKb3rOIfFgTg=;
 b=UowYjs+iZh1dD3xJoAQwvKsO0ZX44RxpKXfeIdbZVxL9XZn2obS7dxsquKEMg+3NkUvdRpPNbBzfWwyokZkEUIVFnWo+wn1JQwwejzcE7q7ZAQIDWxLFpZJefB5zdqrmPIyClMT1DjTespXqRX0AG1kXhozAxRSQ0LUyroXdO3Q=
Received: from AS9PR06CA0417.eurprd06.prod.outlook.com (2603:10a6:20b:461::21)
 by DU2PR07MB8127.eurprd07.prod.outlook.com (2603:10a6:10:270::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.8; Mon, 14 Feb
 2022 10:50:32 +0000
Received: from VE1EUR02FT056.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::f2) by AS9PR06CA0417.outlook.office365.com
 (2603:10a6:20b:461::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 10:50:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT056.mail.protection.outlook.com (10.152.13.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 10:50:31 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 14 Feb
 2022 11:50:31 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 14 Feb 2022 11:50:31 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 14 Feb
 2022 11:50:30 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [hardknott][PATCH] sdk: fix search for dynamic loader
Date: Mon, 14 Feb 2022 11:50:20 +0100
Message-ID: <20220214105020.16594-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc73c6c9-acfe-4350-8015-08d9efa7d23f
X-MS-TrafficTypeDiagnostic: DU2PR07MB8127:EE_
X-Microsoft-Antispam-PRVS: 
	<DU2PR07MB8127A17643A856001F3789E2BF339@DU2PR07MB8127.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iaPy7TB6LMkruFNaN3BnUjGXlMUKOTxD3h2KnGKlQ/1PyqfIVM9QBDrRWdsO8tZ5gpHz2UsQqr9qCbp0cI3HeDqWAKK9cetflsXJ1tjgYsXzOcdAq4IDsvVjvrsfftdg8whaXvsLNn7uiiVorQ5ViP0HezV8GFvm3jSvMVc9Bms2y5Rj1b6NChxzTheH5wnbkMwkNh88pBgIgCLK8kLabkb/RfVGUpJ87E6T/raCGgFCaU+lPO052HYXq17jmwioT4s81P6ryOJ19qG1m1GY8lg8rePj9YNoXhjvuQOgEG3WxmXblYofVKEAN5kCNMAzl0nuwcReKxvMtuSnd1z9KFNS2OAmNEOsZyFTpckR7GNcjbT86X9vH+K59zv8eSbzu9nhPd9IRtEsCqygNwALTnerRxU/7i6P5c/mw+gdIRc5qcruj98UIsU7e1uninOuDpUsZ/JWr3TCOE8JL5QI8KQohM2yHr+DtpuWtRRD/5hJ0TeMmoZRhC8vCtdPds8uhvDw+/AIbwt+QJWLhKAKyBQB7gRYT3WuOczApU8c/0Ge3hZViA7vxy0Z/GAaafTf5kDAXqJI+iDy17jPpqC+Cg+hSNxodY/LSERt31TCcDB/T6BZbUjKK1v35MYnukdTHHH5RtqNvH7TwF0xRjDZwnpGOIo3tPiNXwYH+ca824uNYTbZ5lry8b1IR0NJeSMvMMb7L2VzOmzREHAaJC7MyvX9R1bLXnHXP2kUYXIPp+UYnaBzPfBXoeJ8z+63mndPH2DeYzLqudei7yK/FBHLbw==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8676002)(4326008)(26005)(47076005)(70206006)(70586007)(83380400001)(8936002)(82310400004)(86362001)(40460700003)(5660300002)(36860700001)(2616005)(1076003)(186003)(336012)(426003)(508600001)(16526019)(6666004)(54906003)(316002)(6916009)(81166007)(36756003)(356005)(2906002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 10:50:31.4964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc73c6c9-acfe-4350-8015-08d9efa7d23f
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT056.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 10:50:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161701

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


