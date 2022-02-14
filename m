Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192AFC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 10:50:04 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.112])
 by mx.groups.io with SMTP id smtpd.web09.32541.1644835799968028653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 02:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Zsb6B5Wx;
 spf=pass (domain: arri.de, ip: 40.107.4.112, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUEFP5cOhiWYadSrcyNu4N1qm/NV8+RTCKTHe+V9mfz8WSP+Jekd1s83oiOwLUFnQ+1kZMcXqiW5xN893HSwNuAXZBMx1toieb06TwOUcrmIPbm8zX9aoETFyrxE73ESw27TVGVh2thDvwu3IcZXb5QGzwYIwwkpWinUpnsfiR0yT9c6FXyA8dF/pP/u43wGNXQFwVJA+JNLO46PT3ov3qZWBxq7XIw/1ijttN/Eh/k1Dgtpgerbl2af9SZUNXiFgkpzElbYeJC/H2RvWbt5xtuXL3hVRpFWy2QQNmuJSWxJnOxovDEu0kmiVhVQaR3738tewkiCpxMPp7IVWbeiLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snZmtbqhKoUB9V6dWKmp4pSdmJTzuj0nKb3rOIfFgTg=;
 b=FhRizTt8XFMRgREAHu5QaeWpL6+Jmm35NR0JfsvzXbnmB/k2WcPVwFaKUgIMEfpo9FNSs9zzT8zUa/QF1z13dLFuE4d4cEoEeQlUfyG+pcg8LovU5My4MnixP1Neq496Hbv9H4efwO8q7IHVtysiy6f6cq7pxoxdslT+pSoTqekKpsW1kCZKw6bqYefr4gvQsps5zSYB/ArXKgy0e23f3wyUR72wTotnVAjtyYYjue6Tu44NpGQY+MWjQNCe8PLii6KrZP/TaLhzIIuElsU97lddnRvbqGOsyLVdfm6zw/n3nxyDMx7e6rx2sJZczfSZxWA/5lS25FR5VCxClx09iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snZmtbqhKoUB9V6dWKmp4pSdmJTzuj0nKb3rOIfFgTg=;
 b=Zsb6B5WxeTA51axFD51BUTxPMtC3YC+9gfMnSq4JsFzgkXC7vSoAnqnYGXjkOt2JzIoc6JIEck7p0zC/hk56rlatOQ1OcUBT3jt2S8RKlMJlZY+7qlD6XV754naHzSeEHwWvfZeT/z8Y3Nd3s5EVRC9Wrh9w/8mTYKWPfcjFqcQ=
Received: from AM6PR10CA0067.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::44)
 by AM9PR07MB7137.eurprd07.prod.outlook.com (2603:10a6:20b:2cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.8; Mon, 14 Feb
 2022 10:49:57 +0000
Received: from VE1EUR02FT037.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::36) by AM6PR10CA0067.outlook.office365.com
 (2603:10a6:209:80::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15 via Frontend
 Transport; Mon, 14 Feb 2022 10:49:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT037.mail.protection.outlook.com (10.152.12.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 10:49:56 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 14 Feb
 2022 11:49:56 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 14 Feb 2022 11:49:56 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 14 Feb
 2022 11:49:55 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [honister][PATCH] sdk: fix search for dynamic loader
Date: Mon, 14 Feb 2022 11:49:36 +0100
Message-ID: <20220214104936.16535-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4bd391a-0d72-416b-0ff4-08d9efa7bd7b
X-MS-TrafficTypeDiagnostic: AM9PR07MB7137:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR07MB713786A96E35A709C493ED00BF339@AM9PR07MB7137.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7iSknSPRp/fsZpx/6Vn75IwyPX4XpO6um8ctAIexuFj2nwP5ZdTihFJLTMMafMQc3yqRg7SYhycdIRW4xrqjXEdye3sdn6uzki7vkeNPVELAjDonQlKCZUuCsixT0IMFi2xotSvu5FLLpJ5cx4ECO7S+mGQq49NJXJsl1p8r/K9LpALPA34jxtlNpa1pDILC1ffTASFZkVminuEk6Chww3g8SQ+JzvyLLe1m4+AhAXeFlKwUioM/JuLvZJsBZKes6+RD7vtrrAQlThsK9e/sXts0a9MApbOoZHevzWEBbJ7JDGe2hS69MY8Wup8bt6CgeZJlF76y3MnQu8JhsuLHd65Nx27djfISkptaKCWmGj8TTm0tazq6Doy34O1pUMMV5q8L/RXbtwP1NQXA9PNbYgjMfzFtPqn5xlkC//UbId6Xqjl1Y6i1FAUKugQ4ItJQ2xqckW47VKeAmG24IyNhuWqb/AJ4D+BUBAXx8XWchw+Wry9By8atIgC0DyXqX8cxhwleBxXbpjmWBBW3idKvwl3qB0czZHtrXLYUfVhtX9lWlonwDLpQXpjiBzLirbcUmSLJsnYAEIMO88iPmFdgNhJp1uLn1jVtupB1SxhLxAchzUniuxraD/HeJq0g2p7deu5XKcxtDSipESPGEnYxavWssypkv1M7ayLl/oYv42oIDJqngF1l5X6+Yd6TgyW3qHB5yA7xN+sUtM8F8RCl4yl/ZN5BN+Da/DiJtxaSyBVZNDI+TSzzytxSihnXgLhfje1bqET54KHsUE+abVDv9g==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(81166007)(26005)(2616005)(186003)(1076003)(8936002)(5660300002)(40460700003)(36756003)(36860700001)(356005)(47076005)(2906002)(70206006)(70586007)(6916009)(54906003)(82310400004)(316002)(83380400001)(6666004)(336012)(426003)(16526019)(8676002)(4326008)(86362001)(508600001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 10:49:56.6702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b4bd391a-0d72-416b-0ff4-08d9efa7bd7b
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT037.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 10:50:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161700

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


