Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.71])
 by mx.groups.io with SMTP id smtpd.web12.269.1585069436749027945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 10:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=OfCtvvMY;
 spf=pass (domain: nxp.com, ip: 40.107.3.71, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbVNGK8pONKKcV346qIyT78ZDxQCtv39ln7VHcP3ynjRTF7SmOEBVOyxZhBHbn0ZUE8oFNPALcvwQfoBHJaU71o3my0FaOffoQue8nk+Rk/Cuu+PPq8FWGCLzCFiSaTaUtdCm1khdjRs+AQbnyQNCKcyrGOEu5nrjp6r0pve7uJygM3IXuUvXBJFrwEyI1Yl4Yf+ydT/3kI33TD8X8WxF8cY1a690XwnkzWyggOMOPQneRUjXkp5c3tGPMPaOL7s2obbZCADC5yn9bJEV1gnAW8SRiQ5ZEWb8N3oeJPUSx3DnzlgIf/SXgQ3Q+66H20btPu0KR0bYl7iewIdY3e77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zsn4qTNA/QiPACEItZoLOw9GHFqt/ZWDwtHZ17ocujA=;
 b=bWvMwvdwl0mAJAY8Ounf1tSEDZ54s9vuXGwaSqeXfakMy4O7e4RRKi9DOXJjb8UkCr4BA46Z5Y6FhBT4uD4jeJ1gkECWyf9avDVwxi+sQ6QEi4UtnDKavyy1VwlhDME1JVWPlt2LZ5HVRjA7StKPR78Dao9Wfc2x9YkdKcpkAvc7njFA0s8sIepi25QOY4x0n95jq8936YStpmTkF5P+s5w4Wsl9SFhwWUHPSh9gMXo8abzZZY5l0WId/75/rUT4JNgzn2kbTXuW7t2FYhoGHsmptCetE7WBjnYE22NLK8gpy+RT5T4P+vxHzbACKa1rpd08lSTQa8c9611r3RT6XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zsn4qTNA/QiPACEItZoLOw9GHFqt/ZWDwtHZ17ocujA=;
 b=OfCtvvMYQW4XiMx7ZAgsiEUrvsXd/0Lj7aDBxRrYDpR/ajljv/fcDM8FLrz2qXcB0FS9bVBxFFKy7si9KqduFdZjz2bxK6KxNe3E4la9Mk4jOldd2ivRMf3+vuhUiebS1T5RdKuKnxQ/pjs2/q/F8RCgtl5SSIRatu8x5RTGadw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
 VE1PR04MB6685.eurprd04.prod.outlook.com (20.179.233.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Tue, 24 Mar 2020 17:03:53 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a]) by VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a%7]) with mapi id 15.20.2835.023; Tue, 24 Mar 2020
 17:03:53 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [OE-core][PATCH] security_flags.inc: fix flags missing from SDK toolchain
Date: Tue, 24 Mar 2020 12:02:59 -0500
Message-Id: <20200324170259.3206-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BYAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::27) To VE1PR04MB6621.eurprd04.prod.outlook.com
 (2603:10a6:803:124::21)
Return-Path: tom.hochstein@nxp.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tx30imx-01.am.freescale.net (64.157.242.222) by BYAPR05CA0014.namprd05.prod.outlook.com (2603:10b6:a03:c0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.12 via Frontend Transport; Tue, 24 Mar 2020 17:03:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [64.157.242.222]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: efec50b7-1136-4c00-b894-08d7d0155502
X-MS-TrafficTypeDiagnostic: VE1PR04MB6685:|VE1PR04MB6685:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR04MB6685A04E7FB8A475B361B1D4E2F10@VE1PR04MB6685.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(15650500001)(36756003)(2906002)(478600001)(316002)(6916009)(8936002)(44832011)(6486002)(66476007)(66556008)(66946007)(6506007)(4326008)(1076003)(52116002)(2616005)(6512007)(5660300002)(16526019)(26005)(956004)(86362001)(81156014)(4744005)(186003)(81166006)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6685;H:VE1PR04MB6621.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TMy62Wcm43Trc2kkmM4t90SAAWBu62UeVfHBX0PVZTlQ6s3QqtEeFJbsxmeJSQ9OQk1fE8Tl/TbMs4pQDl2DRYUZ/P2w+uuspxDspLzzlhvoiSXrJ+wmopt4e6jqM68cuIM4Kn5Bg+nimZG5a1UvurdpLQAOYs3aIoG48VuqOzRsMTEAqN+kV02Z1zr6Xy1z9RgB1DToOlAxWlsxKCqBbvnx7KAVzBudmRIkGfFpFUg+tdSH61n4aH6lktAlPggkyj9HnbOztcqWj3AME+2PBB2FwGmKT1hqmrlXn7mIKwVAvfVJINkBh8Sh9zhM6YIZ3wS+8NRW/T+PLUsrVlsxR7EK9De3MqSzyPSNDdnsNgUA/GiDin8AsQGYTg/K6X5QCKp90rTMF9496qB+bLjcXMNm0Jb/l6vO0/SgYBAll5lLzc2573/lcU8DvMqmO56E
X-MS-Exchange-AntiSpam-MessageData: 
	Ux7I/239apFh/vxX64azaPsO5fcqdSqLeRJvlVO5CweHmSjwTgNExZsVhnMpKnx+iAkCA+ZHO6sxDt206Zhcypvna+LO7oYmIzX4M/WuV6HGp0rt0TAsytG+Ydt/rpEjqpw0PM5BeBdN9Hl9OGozZw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efec50b7-1136-4c00-b894-08d7d0155502
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 17:03:53.8555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CTzcJBcms+ULucz8o/0XfxFIW+Sco+ZdCA4Rlk5IPMAnxvKtxZ1UPLn9btZxu9Vmclr1AW5xJaphT4kNtplpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6685
Content-Type: text/plain

The security flags were missing from the SDK toolchain
because they were added specifically to class-target.
Add them to class-cross-canadian as well.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
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

