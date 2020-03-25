Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.57])
 by mx.groups.io with SMTP id smtpd.web11.11496.1585143656405913038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 06:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=p+ATCD+X;
 spf=pass (domain: nxp.com, ip: 40.107.1.57, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gilbMxfFyBwONXe3hVDIfCAHKrOF2cutpxLAROPChLigV30byKxwuajXtFeLaQ0fz9BG7Twxo9Mcj3OuOdWk10Z4SZwhhvyUpGrkVnnUUMhs+FdCKyFlxFgB1XlYmaBT0XcYfsSQJWfj1+471en06Ge5M9xPw77wJ0Hk9AI6M6Qlm6wZ6qL/FSLh8L3NxbAioPFO6LMIgeGgf9Iwrvc2aMAsqfTtESlcl4/IcNcLVNcjce30rrfN+q7wQRVG8uxcyr1FYLC9OhDm3LY4RRO/YwoNyol/a4uSFHStPKouYBFU7uI3LrYja8gur9ZOQmRsRZarWZZN0rQi2nudUm59bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jllQZj3muhPmA19bhqOvpls3/CUvuqcep17QiTQQf+k=;
 b=AwaD+VVM8/SmFY8QNp0OIBHkJpncdzVxh+A0sjRSz8JCpK05t2Kgd9JGzQRRP2Y1ipw/UOMulwDsUDJpAzD1qUpirQc65zlPTTEJJyfaxKi1c5WYrbTy0vfg5qC6NGzAh9CR4HUKz+Zi34wa3rX1LP/av70v+gqX4wqoWHNbWxkx4A3FSqNaShaWLpfSxzgpIM1HoZ0Y+BqwTBMnDpHBkKZjfTbvDq14Zs2CxDIjUUWggnLbJqyy4kku3EMjoaqqERJjWmTBjLtn1n4SKeJYI7XruOxaiNzfgTKBHnxjSLzIo677uONeJAER/n6n4em/Sf1npXWw+OZSj4naP0E25g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jllQZj3muhPmA19bhqOvpls3/CUvuqcep17QiTQQf+k=;
 b=p+ATCD+XSKnElyESmkzAn6pEtuKKh65B8Xjeu2Tk4jfDhj7QqJAd5mf3zJBeiawnYq56iTYXAS64/hncxO+D29jONuFGC91QgZCbephFv8j7kSbc1bJgcYAfbL7ItuojEnK11K9c7gly+g12Rvm4QSF6iOtTR4VUy64nnzUrl2o=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
 VE1PR04MB6416.eurprd04.prod.outlook.com (10.255.118.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Wed, 25 Mar 2020 13:40:53 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a]) by VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 13:40:53 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>,
	Antoine Manache <a.manache@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][zeus][PATCH] security_flags.inc: fix flags missing from SDK toolchain
Date: Wed, 25 Mar 2020 08:40:24 -0500
Message-Id: <20200325134024.13043-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BYAPR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:a03:60::30) To VE1PR04MB6621.eurprd04.prod.outlook.com
 (2603:10a6:803:124::21)
Return-Path: tom.hochstein@nxp.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tx30imx-01.am.freescale.net (64.157.242.222) by BYAPR07CA0053.namprd07.prod.outlook.com (2603:10b6:a03:60::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend Transport; Wed, 25 Mar 2020 13:40:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [64.157.242.222]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0cf7ddc8-69b0-468e-fd75-08d7d0c2233d
X-MS-TrafficTypeDiagnostic: VE1PR04MB6416:|VE1PR04MB6416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR04MB6416972C4012ADB913800026E2CE0@VE1PR04MB6416.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(1076003)(186003)(956004)(2616005)(54906003)(16526019)(36756003)(26005)(15650500001)(316002)(2906002)(52116002)(44832011)(6506007)(66946007)(66476007)(8676002)(86362001)(478600001)(6666004)(81156014)(81166006)(6916009)(66556008)(6486002)(8936002)(4326008)(6512007)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6416;H:VE1PR04MB6621.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hgI/KDd/L15yr2cqeXw5yjM9wdBousyjlz5OaBfCjEOd5fDegVLJgjKcybGuHvHzvmkK2YPG4wK/28jfIWFj+n7auvatdlLIslun4cc8n3M+Mip/D3C/caloMCfC3pwdeQ/Ha1ZhsFf/eiQLTRV/VcUEHU/by9Xg3fCPJcYuWYkrBISRRXiL0JJw5g/wPvi0BNihKcB1WsDLCwLiryti21lpfjzDp0W93F934HeMJ1e9Z0G7RD/6/c6XRFO5PsCcTrBygJg4iYpXDAoB19NFQYJ9pbT9+fBl0AT1yXcjSrcXXbynY+kFkMRzu4pQmbBTiBVKcgzMhBBTdfXXeu5Jsxb092sBh7XEfpSVneN00VPOQb0DLsd6RFa9T+ycE6PgGMt38ucmAiyyp79naaJP+A2uEe0xOa5Pyyr+Z16xt2dNA9O8Z1g3E/smwvodbBOq
X-MS-Exchange-AntiSpam-MessageData: 
	DOrWdeCMbQf9NKzKIjKPqKF7ENVbBOwBX3JeykOzCbZSsRoEkavi6pXJDMuGOPCdK+ihN92eOyHnWJQnZAUm1EyJFEAPP+RwrHqN3WDxZL2g8i4Xd8XBl5zAH7QKuW4DqbwuhH08BW1jluivStGpYA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf7ddc8-69b0-468e-fd75-08d7d0c2233d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 13:40:53.2860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DFi83dH91J4x+qvYq4Hzo6o+pB3xSOYCHJjaoMq5sdJu9KMn/RhtKyEhoOerl6/rg0f6B0BLUJD8vrXLyQ6AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6416
Content-Type: text/plain

The security flags were missing from the SDK toolchain
because they were added specifically to class-target.
Add them to class-cross-canadian as well (since the SDK environment
file is created from cross-canadian target flags).

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Antoine Manache <a.manache@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index aaf04e9e59..568d03693c 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -57,6 +57,8 @@ SECURITY_STRINGFORMAT_pn-gcc = ""
 
 TARGET_CC_ARCH_append_class-target = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
+TARGET_CC_ARCH_append_class-cross-canadian = " ${SECURITY_CFLAGS}"
+TARGET_LDFLAGS_append_class-cross-canadian = " ${SECURITY_LDFLAGS}"
 
 SECURITY_STACK_PROTECTOR_pn-gcc-runtime = ""
 SECURITY_STACK_PROTECTOR_pn-glibc = ""
-- 
2.17.1

