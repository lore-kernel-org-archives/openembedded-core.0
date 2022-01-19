Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E1FC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 23:49:30 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.81])
 by mx.groups.io with SMTP id smtpd.web11.4678.1642636168477702579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 15:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=oZkdsWmK;
 spf=pass (domain: nxp.com, ip: 40.107.2.81, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YH88szbI+RbWI8t9nK3xYRrWUpa8o+yqB/28rbAKo9H2SMl1hjJlol1w7hhcw5no3FavN7jWLpN8vzOEs2YxHx5txrFGRvdeTB/Khj9uunlch0j5nmLUi7LHOLUSUY3Tq9Oo7IRi7aQhKiuOiBU9PLKrTqc3j2jbtu1wOl3dF4hlqDvvlcof/WrRyCmsVSDj1fh3fs5eGs+IlI3nkldYWy5AY4Y43q2bTz7eNx84lxs1lyIR0pEkeHbcuawpWoO/1dYJAHJkZNhJjAMnUyqzH9Qg3O4x6/vCyraHk1lEfg1R29ixKh4pKAJ6bwItz2mgWxEYqLaxtZrQlcAIGd1Q3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5s2eTim6BJoF6JSbMx0PS3QSj1rWf3KF3otXBLpQ8mA=;
 b=EDShwtQaaZQaKocMXGJj0RIy+SkItAMlRza5FCBXXL2L24rhJdYSlayolEoYn0iUNSEA4sHWD+IsSI40YJ893p3II9BlEBX8WZgnGSktaA8fKqtWC4lYZZJICiyh/p95RE4CDLNdW3xUrxqeJl7tdtdXVIRhqOW+s0YMtJSFKNQEi//RAB2GaHxgXvMLlWdLNdm5E6/oifCaiiH3DYZ8o7DV5j3o8tT+074HpShx/fuM05xCrxoYzoVBLXgHlFXbqImjZb5fpHl87K1HCR8NJkwGIA+86A9jZODQD0GiYBlR2O5+yGr3xq6bykgouQ0HQR6I/wTVQtBRNRZ/KKHxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s2eTim6BJoF6JSbMx0PS3QSj1rWf3KF3otXBLpQ8mA=;
 b=oZkdsWmKFYF1yPXK96d5C1oh52ctA5u8ggA8Qvba39hIL8yF9CQy/sByGIUaYWTzLkzFqVbCs5xbamIxigzorZ+ce3LPYpSGnXySK2ZaravPNEDCLjV6V03bdVzE88Zs3Ouh+7DLDAnNEmMNWzh12cIzmdMhhNrtUC+AQO7phUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com (2603:10a6:150:1c::8)
 by VI1PR04MB4655.eurprd04.prod.outlook.com (2603:10a6:803:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 23:49:25 +0000
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::d862:4f37:b34a:f4c9]) by GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::d862:4f37:b34a:f4c9%9]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 23:49:25 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] xwayland: Add xkbcomp runtime dependency
Date: Wed, 19 Jan 2022 17:48:52 -0600
Message-Id: <20220119234852.22999-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0009.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::22) To GV1PR04MB9053.eurprd04.prod.outlook.com
 (2603:10a6:150:1c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c8ecb52-febc-4437-6747-08d9dba6529d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4655:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB4655A92B1D6522E538FAA6A8E2599@VI1PR04MB4655.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YpCD/cuSdOCcQVyDIITXFsc1je8kY0IK69tAHcy1UuG4kUr8krBOQvMUZs4CS2TWxKBTckwQ6++3awhbAq9Dvie4ICNEa+4dCNJixQii5RlHO2jy7R3w1x4zPI+F7BPbyLwvEG2EIdwY48bRQ4bLjIJHJw7kem5rhgi7yLk9ziaTWRuBolfPrV8wMaNaVBgKfp3QtjkYgmkefzQSx5xv8BcaYCzpU0BQ2MhC65CfJPAsvSEhqW2EpuIrD31eYzNpzR+zquqfXQeWuO057CDiQ02Y5VztmeF3UsXQqWjkv2zjgdKFiRQxpnQvx211zeR9vZ34fOuPzqQVU7enn6w7kk+HS91eOdX4usoeZE/XFLzNYIPlP9MbJkPrJiVqu/CD7VLtAUgchd5NnnFQhPSGgs21kFI46T4aSRPEiMke4t/R/d6MQfVSt4xNFKJI0Jg7G8V9wIoKLonpU2yeort1l+5CB/ntlItv922m3iUAgDtdYXE0PsuRYexDWf8batcKcMqQQUcJ2eHpqPgTyGaqYWRlV+tX5dqVkCoikRLze8rJX8M+XRX5zoRVnqkPCJ2RIAa9aPvWJFHH3SB7OKYF/wW9pK/Vny7ksH/TkSrpPSkUBLBX3jG4hz2t7hIEDUxm0gYRUEx1OteObzYhNIbc6CkhtuXD1XiiGIqa+n03yRcfkzsiVRUy1rlnLhM66aXryLgeESZzHUAOqFhBpbh3bCBr4ogtWqrDXbL1WhXScHlUFLWr2WpJIE1bOGbR5Lyzj1okq8AoV+lCy8RyrNPIm/7OYj2EZ0VdWCnFeDSsDK7gPl0QdQs3zlUKfDtyrMcXwPBxT6l204z7d0TIHQ8znw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(38100700002)(38350700002)(316002)(36756003)(966005)(5660300002)(86362001)(44832011)(4326008)(6486002)(8676002)(6512007)(2616005)(6506007)(66556008)(2906002)(6666004)(6916009)(26005)(8936002)(52116002)(66946007)(66476007)(186003)(508600001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sh5l90P2T9yDnuNy0Wry6wpbjyQ7+k4ojVJv40ZLMvv0UTaMGCgDNQSdGQCs?=
 =?us-ascii?Q?S/5+yxxFd+/ZMn/A2KgrTHJ9eYmrlI+fJ0VE4MWBbnnhTzULecaCwNLneXuv?=
 =?us-ascii?Q?y+gx8C+J1S9/0uF/3C74OZktk9XoGIlEB/8e53CLbmVlDmZnt3ChodVT9TCQ?=
 =?us-ascii?Q?weUDUuEVSWiQnVq9LThVplZebMjLaKcDgE8XIoYuL9xmrRGAMxqyGAqrnJzT?=
 =?us-ascii?Q?xJjSSRSY0is8tPC3+KKaO0c1+oSZJXbZNj8oB3ejrz+SXMQIRkKWrcVgL9YY?=
 =?us-ascii?Q?M1nagirejrHItRzjmx3KeJLh3XY2AeYGJ56F1bp30dKSIXLjXwqKnT3KfaLe?=
 =?us-ascii?Q?AnxireR9pdbpFTiNpoe5MwzPKdWSo4/EODBzYIkDV3EzxCJGCmuUVB/YH06p?=
 =?us-ascii?Q?ih4JaIo3EO3pKmGtlR7+wL3WAk/U7igvkbieH738DADsRghAv8FaNfKFhQww?=
 =?us-ascii?Q?r0gm8vpwgIep+1boDbtgPUSV7DULH9asZrGwkLghz3OpnOj6ddmUAulffQaz?=
 =?us-ascii?Q?Mh9UdYwRsrVEQT0JZ8Um7Tfs4PcDa679hOEzlgdx17DmYFHvo8CzO5KFDEtH?=
 =?us-ascii?Q?Suo0qBsKUFDXoP+h4t5FbtL4r2xzVfPwGFN/aleV0EHbIG70TsVYUOEX2QTC?=
 =?us-ascii?Q?hw9/dSpzdtYuGdH8qaqdb0JxwW28hmBTutpPOzxI7f7IFevg4p4rxNVtu5xa?=
 =?us-ascii?Q?zv7Z2zlA6M/3tP331m5W+RrggosyTqaJN/rzNlODWMCSrV0XZkI2exTfuLwU?=
 =?us-ascii?Q?l88eOIFhV+zn+1oGGMIUtw0yLpzAThqiw8BkasZ5mjIbngH9W/XIHTToJprQ?=
 =?us-ascii?Q?HR673bMvgKfqJTMY2j38DndMK+RtLiLMh4nwSt2fyb6lPhi+bRwr/PHYyl1g?=
 =?us-ascii?Q?thxdEMCrfpTMuduzNL/ybQ62yVhNpoRIFA+60CVapQayXBWjD4J7mhTflnp0?=
 =?us-ascii?Q?X10q3cK3uJl7z3HrCx29DbGqC36jjV0vBheCOyhiwwwQJ9gX0S466caKBMs+?=
 =?us-ascii?Q?txBEukthvGjvYpynOZoBV3u2BVMWv2Cp7tvNPzy8HNedAOo56hE6FJfj/YAe?=
 =?us-ascii?Q?aEGuIY9bJ8RQYGczmL2R/pS2JEfhVp+9rDcvRe76DSYEMIiK53aa/UIozmye?=
 =?us-ascii?Q?y8nvQZMIxopWQ5S/uh7EWxDJTLgSVFy0izNv3BWoCFGok2vsdEc8t2ECfau8?=
 =?us-ascii?Q?vtZTHaB8KFmi0hKHk16gX5UX42ucdroi/B0b/XiXUCJqpjrIfuvvb75IEAjg?=
 =?us-ascii?Q?QE2C/vMdKASfOiApv4Rwfy4HC1wss1hWsV46OoHXlWjQ9AXJN2FyAcINuyOc?=
 =?us-ascii?Q?VswzPhzkmKYvbJOnJFBp2NkbpSjwPz780b/wNMIuMdh9SFS9K0UPTYMSrjvV?=
 =?us-ascii?Q?t7Pr5FImxRRGpbUN+DtVB1zHlbJopqrL3BYg3gjhCe4ESSNPIpxL5cJJXTBo?=
 =?us-ascii?Q?Y+gQkXafNUp90ITvxs/pz0nRn6gZRFILiKL8LqhTvrJzKcam01Geo+t5UDZn?=
 =?us-ascii?Q?4q07tIbD/WvcpOIK/pi815HHSBL8CYcfXvtgt2M/fczZVpHZbUEfsPeHf003?=
 =?us-ascii?Q?AGCprndusyqzcMBXct34E9UhlrC5mh1qt/jOqxeunkviqLvS1BGycSQI1rUs?=
 =?us-ascii?Q?igJMUTk/gTWn9y+tqzLx++g=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c8ecb52-febc-4437-6747-08d9dba6529d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 23:49:25.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TBcNC4wXuJY/JcE4ULSfaQPzvKd0SjbTQ81iEju31+MoOsjsKxxTJOVmPC2CXI7XGDjimdtv9k9LzQVzXiVt6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4655
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 23:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160746

Trying to run an xterm fails with the error:
xterm: Xt error: Can't open display: :0

Checking systemctl status weston shows an error:
Jan 19 21:24:16 imx8mq-evk weston[396]: sh: line 1: /usr/bin/xkbcomp: No such file or directory

Adding xkbcomp to the rootfs fixes these errors. Checking the history
one finds that the runtime dependency for the old xserver was
removed because it wasn't in the correct location [1], then restored
because it was still needed [2].

[1] https://github.com/openembedded/openembedded-core/commit/bdcc5e8f1286d288baf410458efc39a59b68d751
[2] https://github.com/openembedded/openembedded-core/commit/f2330ebc3071d780cbc6d1ddab5c54bfadf8fffc

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/xwayland/xwayland_21.1.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
index 5d083e8ada..7ea40d9486 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
@@ -42,3 +42,4 @@ do_install:append() {
 
 FILES:${PN} += "${libdir}/xorg/protocol.txt"
 
+RDEPENDS:${PN} += "xkbcomp"
-- 
2.17.1


