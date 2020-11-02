Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.3338.1604343575960576654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 10:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gMPYc6Yg;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: jason.wessel@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVNs2Lp06h5adYb5W77OOoVlmJHZTkMnK55d5dk+eE1+ViJ7lG27WsVH9lHX1sRvIH9iqk3Sr0gpsNy6pl84Bcw7ybsKQJVVz5eT4FkfU+54a4b9rjQtkYZz+EwDBwoljWbkrcl6MFiacTPV3Rke6YCe6wAjY93/bE01rkghFlYLeYNykqFtLBNsHf08RVdviEo2zMmSRfOMEbwNV6ZdqDCtpg6Nx2SgH0nDfi0sJR49mHMOZ7ipIi5oVJ9iIzI4p6NFhcn4Pjewuy0Qkrx3ZfVzTc8lKxbxH6HoPPWK0oyVYJ3DmM747b+tH4e0eYvY0wKsDySVLIufzhcPhJCi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uP3mGejCN8MX5O5KDhf+cCf1lOFDrcMhMxlH2R3mAWg=;
 b=N89oic2GhvfWJOqcQ1Tucmyi5qjC7Uy1LyTKb6dHAETXnglf33mKqdiIVlq7bD0SLgGO65bUDTGDd9TDP2DG1CR2jIdvzB/nb7ppsgwJ4odnUY5ImV03JJJp3J6QiV7xZdyBk1GaDR70pWuGNYDxruiXhX3N5gshT31Uk7kc3/xQ8CHrVF0g38Y/zjLaRBcg8o7OQS3x6Th1PdfEtnH5xpyUYJntJY7xVdxfkJloy8IJB8Xw4wN2qJVysnvdgm5Nf5GJlFSZ53A8Igj0nhJ3dUblBFF4pTvAIY98ieXaZbRwZolWJkphIdDSHwxMyhIndFjaPnWiFA3rmePx4J27Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uP3mGejCN8MX5O5KDhf+cCf1lOFDrcMhMxlH2R3mAWg=;
 b=gMPYc6YgjxOnl8Ni04B2N0CkS+Kg3J+BzW1J2DyOZ8/O9Z0QalY24uziAWHDexUHXvunYxUv3mz4q389sHgseZ0vnHfYuh6XG2c0u5LqjpfEPTW05VRsQqUUo2Arkl4qeI2ewK0z075cg/8woIbAF2xIBHuZjCgjGwsXqQYQU9A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3514.namprd11.prod.outlook.com (2603:10b6:5:61::26) by
 DM5PR11MB1433.namprd11.prod.outlook.com (2603:10b6:4:6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Mon, 2 Nov 2020 18:59:34 +0000
Received: from DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97]) by DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97%2]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 18:59:34 +0000
From: "Jason Wessel" <jason.wessel@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] systemd-serialgetty: Switch to TERM=linux
Date: Mon,  2 Nov 2020 10:59:21 -0800
Message-Id: <20201102185921.65148-2-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102185921.65148-1-jason.wessel@windriver.com>
References: <20201102185921.65148-1-jason.wessel@windriver.com>
X-Originating-IP: [147.11.105.123]
X-ClientProxiedBy: BYAPR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::19) To DM6PR11MB3514.namprd11.prod.outlook.com
 (2603:10b6:5:61::26)
Return-Path: jason.wessel@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp2.wrs.com (147.11.105.123) by BYAPR06CA0006.namprd06.prod.outlook.com (2603:10b6:a03:d4::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 18:59:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c79511f-9487-4269-a2f9-08d87f616fee
X-MS-TrafficTypeDiagnostic: DM5PR11MB1433:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1433A8B5EF8F08E4079306B097100@DM5PR11MB1433.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XIP+jQRNf3AWFU6ZFtJUCZk/gBIlZAs4JLCP7ngMDnAlLbTtIP4PH8qHMJ0CAgkyfK9KAHrze1mGFxhHRH/ncvjR4lfz63kPQraCO5RYzPnEntt3QjSnnb6XWnPVXkjspQepUcvgxrnkNkt+AK8QtXSwqdhBFW46B+YNUNRycVSDaL6oVLVkNvVg7CrBEwJKCqGEC96pr8YC/I7U+NOVdp+i7EQghszWKQ6+iOAv5aCXTzSh/BqLS43N7Zba0f/1kifGL5UNBH6/CiV0HfGBppNXT50XdAhDA+GtAGprYDVA1C8JB2HTote8eLa4k9v55jxSGLqAGoHQ2wqZAj2WIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(6916009)(8936002)(26005)(186003)(8676002)(478600001)(5660300002)(6666004)(16526019)(6486002)(6506007)(1076003)(52116002)(83380400001)(44832011)(2616005)(36756003)(66946007)(66556008)(2906002)(66476007)(6512007)(956004)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	E9JQSuyYXmF2sozQuB4o14YJ/U4NI+dNfMzpBm4v7CKs7rUMW0NlT2se2ZK8e7Sw9DMiSwtpNw0syyb/+28AFa0XkiAa7zcMJ2iCkb53kgmX1AO83baMf7SxPPnU+HdjwQA6/fYxFisgIOu4rwCPrwfebpedDfoF15wEgitvLOMUP1H0IKjRu3dQLg5aAwSPNygAKnC4XRR/T9sRW9iKJz8YYUiBUxrwa6dSfc0AxEclM5kth4AnnZN18BGkSjTWI0R/RiAnjJmf0S1D7ZXTgMXWeYe6l6rPaR5L0DAiKe28BsyOLd7Mg6+Xq8m2Hm1sv4aUglQVt8kGJlUiaJTe2mL6QODm1mdaCL11Q0iFEmnzT5S57XutgI4Ijd7uePKMCbTXKMVhYxasjOsAHuWXCnqA2X88mGOGPmhxYuFVYsxMJmGbCcxAMqN84i+t/TS/rPi3y/kyfu3D08z2FVIlbwtesh4JEyAyA3pdFLrJYAfalnGYqyyY0qx67VnczQ/fopqiQQR2GE51QGSG3+fmNaCJjIhZ2nr4WYswP/cVWbzqIpHU5kYoT584W8RBEUOh3i/8XLTtYJL09mC6/oECO1V23NvRYneCDPph/QF/bZnYYT6z28ddnQ01HN5a5yf7B5+74uRZEhSaza/rSSbi5w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c79511f-9487-4269-a2f9-08d87f616fee
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 18:59:34.0959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsmG4L3Y/GysDLZxjJdTrYdkTYaVmM1XfekTTCSqhfHhruGmHI77HgSn3am+iWYNbLR8It4oXwnSLh7X/cbm1LQvslofOf2e+060cwsvKo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1433
Content-Type: text/plain

Long ago in commit 473ff65c2f69de4ece3204fadfae7c5cb992149a
(serial-getty service: Add xterm as default TERM), the xterm
became the default for the serial port terminal.

Using the version of vim.tiny in oe-core master with the
serial port connected in xterm version 322 (which is one
of the most widely deployed versions at the current time)
causes artifacts and missed characters.

The example sequence is the following:
  * Start vim
  * Press "i" to enter input mode
  * Type "123"
  * Press Escape to enter command mode
  * Press "a" to enter append mode
  * Type "456"

At this point if you are using xterm less than version 535 you will
see on your screen "12456" instead of "123456".

Changing the TERM variable to "linux" will still allow you to have all
the same functionality with colorization, ansi character escapes
etc..., but will avoid the extra xterm specific escape sequence that
only exists in the most recent versions of xterm.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../systemd/systemd-serialgetty/serial-getty@.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 549d566009..f2290639a6 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -29,7 +29,7 @@ Conflicts=rescue.service
 Before=rescue.service
 
 [Service]
-Environment="TERM=xterm"
+Environment="TERM=linux"
 ExecStart=-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM
 Type=idle
 Restart=always
-- 
2.17.1

