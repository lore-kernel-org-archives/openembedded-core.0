Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.128])
 by mx.groups.io with SMTP id smtpd.web11.11470.1592316490717567683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 07:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@qt.io header.s=selector2 header.b=KqBasdXY;
 spf=pass (domain: qt.io, ip: 40.107.22.128, mailfrom: samuli.piippo@qt.io)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnioqVe7kbBeEXB5O4K2lynSVEADVxhZYi8bBoYUTQkd2tdE3AbjH2yi5VFCzP20ONjtKMq40St9K5clfmkWwr6sPvMhLLPOUMJIbW+KTFk5R9jizxgXwfW3b5MtjjdmmXRkFabbRt+vOc2BC4HHIS5WZxoM5MQNKbidLyXdXvqchcAMzC5cUTIdLtXq6382A31bP07nZKs3JwszpT2O8AEmtH09F2VUV6mKPhCMD5Wr69a+qEiVegqL04eZ+YAuncwy1izZrLVZ4uDYNGpu72Jh4SlTEgBaxGPXLn4xTGaaGocd624QYETMtKCupGWPWwyX098v75XEP4IPSr8k8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDAKIj+eGXEzUszIJB2IVSW7e1TOJ83ivaCigw+4NS4=;
 b=Kgv6LLgqyaoBEaOwiqtr6mqjPKX4cK4IwUceziGkDszAKn4f7UzJpf7IAyZLb8EnIijXWHiNyOZrk3d3JBrtlBEZSj5a8MoL1MD/GqiQ+ABSREyHfCIc8aarD4lu9NZHUgkgstEEZnhtQ7Ibk+Iq3aPvBxcTyePV6I0oZXJsfAVEL0zuZIt8Y379JLQks5cFdVJcUD26zLhOwtfdiuw6lACDWF4KRIloHa/fx6lXzYTGbzH87NdqO84RjS9gxbcY4hJ8tmvn9B+5fe+iiLEWo3WGBA1JT3CiCgn9ZdLrDbWqWRHHu52yx9oixx7aPIlZ80xfIyfkW4JSiH7SbHU0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qt.io; dmarc=pass action=none header.from=qt.io; dkim=pass
 header.d=qt.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qt.io; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDAKIj+eGXEzUszIJB2IVSW7e1TOJ83ivaCigw+4NS4=;
 b=KqBasdXYdlIoOlTxVpT+R9QIl8AvdI7rlAjO8gb6NN9iT7Z0COf5y4P042Yi6S2lp5twVWlrQkS+A7v4Sqm/3geLCwnqVXwk5kHFm4OvYE3JzYNIIEMbFaUpi0zBKNpz2GO5Jzw6732P/pZz1OYb242Y7JRaEFBRA4WFEagiG0g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=qt.io;
Received: from DB3PR0202MB3449.eurprd02.prod.outlook.com (2603:10a6:8:d::29)
 by DB3PR0202MB3466.eurprd02.prod.outlook.com (2603:10a6:8:10::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Tue, 16 Jun
 2020 14:08:08 +0000
Received: from DB3PR0202MB3449.eurprd02.prod.outlook.com
 ([fe80::39bb:b87c:c0db:568a]) by DB3PR0202MB3449.eurprd02.prod.outlook.com
 ([fe80::39bb:b87c:c0db:568a%6]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 14:08:08 +0000
From: "Samuli Piippo" <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cmake: allow chainloading of the toolchain file
Date: Tue, 16 Jun 2020 17:07:25 +0300
Message-ID: <20200616140725.126328-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HE1PR05CA0233.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::33) To DB3PR0202MB3449.eurprd02.prod.outlook.com
 (2603:10a6:8:d::29)
Return-Path: samuli.piippo@qt.io
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from munCarbon.lan (84.250.25.20) by HE1PR05CA0233.eurprd05.prod.outlook.com (2603:10a6:3:fa::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Tue, 16 Jun 2020 14:08:07 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [84.250.25.20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76e57fad-b495-4d67-4831-08d811feb206
X-MS-TrafficTypeDiagnostic: DB3PR0202MB3466:
X-Microsoft-Antispam-PRVS: 
	<DB3PR0202MB3466B21F36C67D15D4E31398E99D0@DB3PR0202MB3466.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 04362AC73B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LHSAHurVZMQYSpFjs3wWhW6G1s6JPBiWEr1NS5ikvymU5sqkanP9NvLfZHsDb9CTZOAOIMmvvy8iH3JylbSKTLmSu3vWvZufxZDQTy21p1EjONHzEbmAfELOAQ2QN6uIAj9ub1zcaaVkMZ6hHpOymVx7XqRzAuC+OXjGqrfAamUCMqpDO//Hoz6xe3oFz4LvKhJEhDVhrFEC6m36GE4feSnpLMfQV15xI4m/eLQwKN9SPVAmU/SXeP2bL/EDNVTz3zZwAJncLv258Ma5PCmB7Qo7qkfumGF6SHFXg8tgtXt+uhqmzg425SS+VJdSIxZ+1R8Te3tkZH7Q1hpAm7zJ8g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0202MB3449.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(66476007)(44832011)(66946007)(6666004)(66556008)(5660300002)(86362001)(52116002)(16526019)(2616005)(8676002)(956004)(6512007)(6916009)(4744005)(36756003)(186003)(8886007)(2906002)(6486002)(1076003)(6506007)(26005)(83380400001)(316002)(478600001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	+I53vSpj7Tv62Vi6/kbGxL2S7DR0MMsl5B6blX82KLNw/YCo70L/8P3fHB9qrVw17YtlRUO0ZqgH1Xu4r4wwi/OJhL1qBiaCPNKn2WyFPprQHu/oMck3aYo+1QkthP5BpeFchDFQ655/MIGcyldBY7ulSmfLeI8E4AbZgrsKYMoKhh7Iip8G5esP4c+vH5jpTuiC0dSW+y5sW26N9J//1ZzVkC9UeG41Vc5/sRZ0bKDrWXeSdI6kkhee1nc0XayOeTqRl/LWdv52SumpRtmjiE4O1jbKNcmUJjKAkquSWMJLThuJQrapMfJJY0KDHe5jtGfxN//pPOfMsu2bdjbaxGQdxC73TRVc2QQRJTjzor+NJII9NOx/gFFK8uP37TrjCfihHbeNHrJ3iGVnmXysSukwVOBMhAtoL776vcKTH8RY3QNBAde8gufAlttWqj2NcTWbr7RUsge8cMnOSztB+YxAhHRCEz/JfxHHbw8WKMA=
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e57fad-b495-4d67-4831-08d811feb206
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2020 14:08:08.1155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJHJFg+eqk2O+sQwOp4Fwar6CaxumMoz2ETdbe6FiE1kOFOvcqfaefT3hRYjT5sUGBQ38+agZ5jYVFwGUXO8QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3466
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use path from CMAKE_CURRENT_LIST_FILE to load the cmake subscripts.
This allows the toolchain file to be chainloaded from another toolchain fil=
e.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/me=
ta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 398069eef2..8f6f3a272d 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -19,7 +19,7 @@ if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9=
_-]+)-.+-.+")
 endif()
=20
 # Include the toolchain configuration subscripts
-file( GLOB toolchain_config_files "${CMAKE_TOOLCHAIN_FILE}.d/*.cmake" )
+file( GLOB toolchain_config_files "${CMAKE_CURRENT_LIST_FILE}.d/*.cmake" )
 foreach(config ${toolchain_config_files})
     include(${config})
 endforeach()
--=20
2.25.1

