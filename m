Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F89C36018
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 11:32:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.89])
 by mx.groups.io with SMTP id smtpd.web10.16516.1743507111046690231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 04:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=GfK+8V0h;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.159.89, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S61luL8XKgeWC9Sy+vAFdu8Tdgf0XIctKHXDsCppB7DsEz7c7KCekDmO6mUSzdbKE94IHTJCLbtK7cXTG90V1W+EIl92c8GD5f6GOWU+9e9CbksprcdCSsyUg9eq7P+7aX9Wlu8vV0kVpE/yCFoUBmANigWneKJYNMEZuS5hPzi18gaadOLYXlYCNSp1EomxXxIBQks/3xGLAK6jEB+HZ7i6S2NR2N3mMaj1VfuUBMEwSexD42zcefC1Dwb4v5yFMvibBBrpaGZVoeR0JI8Z7FEBa/Ua4UOvXf8sYiqXWkqsfoqnAi9PUndpd8DrsdN2cn6F7uJakmF5o9TREhoM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfUvcjfosgdjfHJVgW103R9yH/SwnGBV6HKP4YzEDpc=;
 b=srkuhdvKl4tSlx1i2+H1sAxMz5+z4ViXCrSJEiIwYlYEQACp50dh7aUCIK5vNgyR0HMaQV05ksxe098xKjGPQVYHYnFKGApQtkZvO7+5yDHopGrqMzqTCuWIJHSlLhQXtEYQ0nUMCFpKxI2QTGhARrasW/+zvbqprAalylZE2o7So9I2G/p3Amq276Tn8GM6p9cIZbUfaTiT6UVwD6PXBkYJ2NJWw9F2x1driPerOS3RIgLWRGa+V/EBjB962MhVB4e78TZIxb+DYgJm4c29L0Nzbq9lYpiYpMGKVqX9BHFSS/syBtjK5+zdY1ifCURND23Np4WdvOtDdklpz0gBFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfUvcjfosgdjfHJVgW103R9yH/SwnGBV6HKP4YzEDpc=;
 b=GfK+8V0hn8TmdCvyXQioxZQPU6J2ps+lNLFrIi0tIFX0sHbAuOvvpTDL+L4rQfswsFd/KSt3AyB1qYLF0xrOEompQfVXPH3SIfyRB3288L4aTjiySFJK1HgwX2Mqn7SOHCyyEi/5PUfTujWB2OP1RqoPksyjNL3UD3gGbFWtOEF2XT35RqYBlyh4SVFnQjqHlh+b2jZgiq5hGyD1UGnCbJnVtPGeRmchu+tzRG0LF8C/aQQE+u8m+N13EPPYAG7TWRemH1mBNlsZBWQKLjlKQAOviuCPiLFybnlSOPoHwKj+SU3EXZyMS3D1z5uH9F/3lSCwXAhLsZXOH/w864IBmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7147.eurprd06.prod.outlook.com (2603:10a6:102:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.51; Tue, 1 Apr
 2025 11:31:47 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 11:31:47 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 2/6] dbus: Allow using dbus-lib with alternative D-Bus
Date: Tue,  1 Apr 2025 11:31:25 +0000
Message-ID: <20250401113129.3531757-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401113129.3531757-1-niko.mauno@vaisala.com>
References: <20250401113129.3531757-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003852.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:1a) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f01ac9d-619e-4bcd-90b6-08dd7110c9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?y3stfxebISEp8NKaM9HdHLBs4r/p8YocDYCnqQxpcZLZ6ChRv8SEF7ANVkWa?=
 =?us-ascii?Q?QYltLr92qWyMh9ZhDngKerO1FCmcpZwYkTzw23ZIwjhPp7O5vFqJyDQJW/9P?=
 =?us-ascii?Q?UsnmnkDpoz/kPlQosXzP7z3u0MIXpDzCvy8HItiM6lCeeTHD3gyigfnCg0bD?=
 =?us-ascii?Q?U3WoceJ3Pcm6JVWDN806SAc2iiStSdQwECA3VPhvhAeqzDvRLe0uGbZ6gIxb?=
 =?us-ascii?Q?0eVb2xNugIrUh8S2NLOQyynws9kUr7m0uqCk3r0DNyALHvzZZQbEQErnp8Xv?=
 =?us-ascii?Q?hzwFlvwswnV7qmVYVQR3JZ0L/d30IXpTW3vLqSvlgZY5Gz+hvbpWUd1D0B8a?=
 =?us-ascii?Q?LXs6fvFPh2tGsENRJlxczlqfke5BAyd9qrF3PewOCmiJNkLHLn1g+YQsUqwN?=
 =?us-ascii?Q?VIw42VAlALAVltjw6CyhevvXQgCpVMHIoAGnEKH7+AfJtktY6kPB7pMTga8h?=
 =?us-ascii?Q?A8NgovjS5ljQMiLdzN5WrvPoiuUIG0KuAi2Ay4Uo77NXrL0nhLZMlWmgNkJy?=
 =?us-ascii?Q?vYnEknVvciNSDONM8Yb7n1203Ei0byeiYl6sAFWWFWiqWkumA/DNll7huduu?=
 =?us-ascii?Q?NcOXwy1/UApbG8Mwfj4XMoUZALKBNN1nQeRObSm6FnK1+Er+ZQoY3WRYdleu?=
 =?us-ascii?Q?3zjQBzbZ4v5WOpdZpgFAQCVAbPr0CCrapBxvzgzOvw1kTVip466Et/ljA3kg?=
 =?us-ascii?Q?jeKSXc+ban1pzpnqaVrcYoG9ezILKC3abs6I7lEtExLxohuLY/lqkq7C5b7m?=
 =?us-ascii?Q?NzJHN1b0cUGZijRj8svaUzJ2fnqFp9KUNOSvwEfIU+LKgwvLQXOnhJPZlV06?=
 =?us-ascii?Q?CgmHokuIKKLwPhjgHA3jMpY2zS9WTRpgmXhROjKUUE4uS75/xMdUFqt9CiGf?=
 =?us-ascii?Q?p/Uo8OhhmUGR+iEkqq4ugAHR4i4o0KgJJlO8FgEXvMD4fkPtrhTw2bDMSqt/?=
 =?us-ascii?Q?W8FNLfEI+TMKKX90hXoJvpwOce3Zu/8/ALj80dunncsbcF6PbN+1jXHCQ73J?=
 =?us-ascii?Q?boZWaKvqM9RihiZDmGnXIUA1xALnnCJdep7TBaOEkr3sn3CMEqvZIZ5iBDml?=
 =?us-ascii?Q?FiCEeWxrGWNM3ezi8xQgQbcuMXCS74+8a4HWM1I+RbGVwb8Dat3FmJ88XEn9?=
 =?us-ascii?Q?SfcksfEOb4/JqpA1tI9nwVQf8GA/oqgxgF31/xuQR3+YLzbulXLWoqwv/PmU?=
 =?us-ascii?Q?DnPjfc51iXtTcCwdXbeJqZTzlvK+S81SkECvFpJ5I5YpOamrM72M2MkPeoxW?=
 =?us-ascii?Q?bAeeZ/Zptt7ARc9G7lJOHS2P0GX7Ob21gkqji1mxjjpYIFnZJQHDLXFt01BD?=
 =?us-ascii?Q?qZDjxiSYBJA7z/v9jqCHcDp+JuBshXToyV66fBhnakm5kCHbJYK2cMRYesXv?=
 =?us-ascii?Q?j9thW6Hr7LPAeM+FW4z/vKRNbdTAzUCHxS92aybWj9VE+Nz+Tj1QNtjGWEI9?=
 =?us-ascii?Q?rpaZCU0P/bIGSl9rlx1mWvjobTznTN8w?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OxC8J9H8zKCA+7y3jrZZKn8TUa89hrQbP9WDaUAfTVnpYHsugicKfDRQR/KO?=
 =?us-ascii?Q?mA3fqEIFnzY61h0C3kbpdHKqJDaiBwFHn7hLy1cECJc8EiyakM9hHxd9BxaE?=
 =?us-ascii?Q?xM2meyhWRCNA/Ad2fGVVcTeOKVS1d9me/ZQZ/mIQQ3iXvhSHUV3R20SfPDZn?=
 =?us-ascii?Q?cVVOxszXTCSqjYxBQ5zxChVehj9yLwGdbNO497GAKUVtFKU50GxY8v0lYyPo?=
 =?us-ascii?Q?y/8vCwbx1lXu5mmP2AllFBqaRwUe3wbzda4sQYnAEnmy1KILDJo0S3FPzYVr?=
 =?us-ascii?Q?P3ohtfIdyrGJE8+bKldAeUQ6DFE37ch/Rfu05vSxQZ8mpDcV+yFo0vlIBoGN?=
 =?us-ascii?Q?v/FktJv6kfbAiufX1BOGf1REQPXcLDK5oAHoPOFhylf7yQAEzOPTqQqGUWTr?=
 =?us-ascii?Q?pUVXWs575t6JCgh5ynsdV2N3XTHynAGmnaT7zHsPiZJ+N75Hxo3vPnzxdthK?=
 =?us-ascii?Q?lCoBmauNNXeR/2KYS0VCGHJLzAi8rcEgUojF5DQI7JuXWt8UeieAF56casz3?=
 =?us-ascii?Q?J/ILJjDPxzuQCuHT/whldF6UULlr6H6sFi/JgEQuyG8wt/lquBS65ERMJJ6y?=
 =?us-ascii?Q?uBWOPnWeq/L0Tt0acS+7NdI4D3HDYegsgEuv03pwWgbkjBGgm98nkXzAGq1B?=
 =?us-ascii?Q?A7fRb54jF2c3KasTDUSqWAn7kHBuVNQUJlHMMVPRambabjTAuAhXmR/rYqKL?=
 =?us-ascii?Q?JR7678lXc21Ut37KEDvdxbe6emSsVR1jxpbGIsIDa/R9xUyDajSjdbpO6UT5?=
 =?us-ascii?Q?s2hjDUGDuAt7HHfYCSNk1sLPvkmSVlzGpwB38Wqt+h7/Glm2h622ZtjUh85Y?=
 =?us-ascii?Q?apW2ndxWmqxvc222Vr+VC9TPFeJgGiN8XekXsrPDizmflCGa57DPxaXeidUc?=
 =?us-ascii?Q?J5ilqSfiamNB232qZUlfiPIorYBKKG6Q8emcZVwb/ZNmb96iG4ME3nILGj2Y?=
 =?us-ascii?Q?NJJSRn5tGa1RewBEzJkUGr4PP8LoGcP+x59AKwYpev2rM5ZnNinx1rbpZRXd?=
 =?us-ascii?Q?zbQPLFkh8tBYkkb67uNwaz1e0jqZkLrWggTqO/Oe9RpKto2bSEq3ccWPQP+J?=
 =?us-ascii?Q?ushNY1Ks/eDqu9pBpUdclQxgeC9RfLLIzEwq0VVj6tIwYTVVvCJlBZPReR8l?=
 =?us-ascii?Q?EL+kEdWCkj4gt1k7WkI39Uj218Ov7ye4RtV5SnkJL3otffwxo3uEnW3bdSOz?=
 =?us-ascii?Q?f5qaio/8gWKFutSJdnWB+6TuCnFbTqjr7zhMmWE1tlwk2BLZLbnQfP+yQPDk?=
 =?us-ascii?Q?+J4cR0D0d0G1ZPiHv+D/BR1pCjR8firwUbLV67un85O+c7MJMKOiVjoWtQgn?=
 =?us-ascii?Q?n6lOXqQhrokr6FDftbSzOXEU6zatfgp4DGPjn6jdzXFv6okuh6rxITqBABzB?=
 =?us-ascii?Q?cyF3tpMB834oxY8q0e2UWfhWMdRBeyE21Knm1JR6fh5mrYo0hs4HqWv1j8OA?=
 =?us-ascii?Q?cr9uW+RR5BIegyNoBQcbrVfF8x4nzS0vQsSBxhdyElNK0Cif8lGLhcVyUdO4?=
 =?us-ascii?Q?jMviJHb5AijY/n5E34C1qIR2CRE1AM4QcI75iABb+HqpZ0sbruHeyWm/A5HW?=
 =?us-ascii?Q?O/qcYFJcWgFuclsbtvxc85OIg98KXY4p0jEUwktCDGrliUTGalpwFYPOaViO?=
 =?us-ascii?Q?ww=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f01ac9d-619e-4bcd-90b6-08dd7110c9c8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 11:31:47.7355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26Ywt1opAsYV2vVvbESemsaYIG0Xzu7xhGeAYtgdiLv9N7+5WZl+6q1Jb1D7o6irrCNSxT6w0Wxd4gtasDC3dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 11:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214017

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, declare the target specific
dbus-lib runtime recommendation so that it will honor the new
VIRTUAL-RUNTIME_dbus variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus=
/dbus_1.16.2.bb
index 9475e55b57..eeeecde946 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -105,6 +105,7 @@ FILES:${PN}-tools =3D "${bindir}/dbus-uuidgen \
 "
 FILES:${PN}-lib =3D "${libdir}/lib*.so.*"
 RRECOMMENDS:${PN}-lib =3D "${PN}"
+RRECOMMENDS:${PN}-lib:class-target =3D "${VIRTUAL-RUNTIME_dbus}"
 FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool =
${datadir}/xml/dbus-1"
=20
 RDEPENDS:${PN}-ptest +=3D "bash make dbus"
--=20
2.39.5


