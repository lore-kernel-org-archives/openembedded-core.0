Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91FEC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 17:44:23 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.43])
 by mx.groups.io with SMTP id smtpd.web10.3608.1711043063275297435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 10:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=HYSddi7i;
 spf=pass (domain: nxp.com, ip: 40.107.6.43, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k61BEC+a9qfi+pMBLqxNzPR0rOXrYG4Yle+2qIKaHiBYj4kS+0yBNFBW2kZjTQF1BREQo2eTLOylVllZcFzx4puT4JnfKahtNlQPBFI8J8FmNaojn1YteT6KsQD5n6cIGmrtJw6iABnp/2NexWUOLdyQuejYBvT7qYzWyvmWvY5csDG94fBQ0Ahzr1E4CqUN5oM4noXkP1h3ypdNdu15EG4Q5OHRlCd9KyIMP0Ok9FqXuNPdExrK3ym55R+oRNBRbRhfxcmeRXDA0NI8BA12CV0uPxm9An2RAnZgWUpj5//VrSWMcG/u1mp5F+9SbnQlJcjjw9yiS+rU5Q1kgc/I9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLGE4vR9LDHVvO58xn2iHNLT8vC6TCUPh2ZHMYPZoII=;
 b=F6k8FvfIRfz68zGF9T442H0YaN8wYZeJKRZEk4JVlAy9hoAW+nTkNRrfXxWxN49u7q4JUVvFjIkM9YoeL/bVWA6d2/6VwmUEP9RqaJl85UWlMAJJGzASfP/SRdLD2wS0u1TbO+ZSBQeHIw8Ac1uGKA1aINKKpnxMrMIZK9PfPWWdRLXvV5/AvjiJbknyKiwNknll6MFMumIOLOruXRwaIHjydDkRKRZI3Y2pF340KV7N/17T3xHTpOudFNKhGYaA3PqtKSuvnj7mJrLi+Ai/4dBBO7TxWZbOntgaL4eEqkPc8lAVSPmPbI/hVKo6X5t8rhWgl0i8Ev21+P8xN4XdGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLGE4vR9LDHVvO58xn2iHNLT8vC6TCUPh2ZHMYPZoII=;
 b=HYSddi7iyfc28GUEjwDIt0fJ+PfA5cHzU5/VSL1GHakUGW/e2ZaDzoRWZCv0jEdmp6tuEGgVa5CjSEdGSXCi3x8l2nkJLCKziP39H4L5KSN8I5TdaAkcGS1C2fdncKXDKxHZV3KQhblyhBzI5eSEjn8Gi6tnSPHEuP3N9ThdrtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS5PR04MB10058.eurprd04.prod.outlook.com (2603:10a6:20b:683::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 17:44:20 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52%4]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 17:44:20 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH v2] toolchain-shar-relocate.sh: Add check for missing command 'file'
Date: Thu, 21 Mar 2024 12:44:09 -0500
Message-ID: <20240321174409.495457-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::38) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS5PR04MB10058:EE_
X-MS-Office365-Filtering-Correlation-Id: f58a6ee3-a15a-414c-2f85-08dc49ce89ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XMjr68lPyMHP/TK8skJY/ZrYi4xPq1BMr/9qaXbqJpTOhEx+7/eHSMHGNMtqR8hd1wkSuDikcTRK/fh5z+RgDpgVWhe70Pwj7VxOQc2SgGqkgbR+liU1YLYA3dO4kwzVGMmrM34TFm46eYNtND33rIQXadA/l6gjC+OI+k+xQSo4wbWNx28Cs6O4KghjE5kxXxZeDZ3h+Vxyn7RhXLlUqlJ6Czbip8t26zPTjtWvWdHoGUlrK+yX8805+n1gnbKLrK+mNbIhW3EJNCqDrv1A5c9dE4sD26ECj2RgRYjwZ4ohXsCbfQfSEZPOFY4/APcQ9gaTYEnm7Ub96M4dmtoxVdlJi2mqUp+eMRzlLBwx8W76o/J3GliaUNc+b8b+YhLiNNsae/dvSkQ75aw6ovQNaDSsRb17aIziLwq8r9yRzrMgQqIHZJkNpoAovq+FpV2/kyohnQQQ+BXmb8OlMSwgpfdM0qMA0MLCL6qjwIP4SRTDS8rDbX2w0fgI/o3nMEfVamTCFVuCxAMndRRajb0KaOaL7bAeEka5oEzCw2n3PX4mIlqSc8EA5lG++9gxAurOHn2tfIBQbM7uj8I94QR9Px+eU+NpFJc70b7CFKQKPOs8s8OYmVfsm79UAcFMhEnrY8hVmETdd7OMpjWmhoyBSFGCTAprRDQSeHCDafm3PdP6S8RI0RrFEXvGgWKa++kvWFyANgJLnHXl5QeWnQ79CklbY4n45D7y6dSqs1XoHGU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(366007)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wcbF9xfDtihHOYDxeXCadw6wyETOKzXDVPP+SrdDQju0QZUnvYAx5aBAMb6c?=
 =?us-ascii?Q?oomvu9VShaOZfGTEfvrCA0PQ/IPjxsbI4hjXy4usG7vz77wmAzaksPKcinr4?=
 =?us-ascii?Q?/3xz4H3m89H1F7ksFD/TzVpNquvR6XbUCnDh8g30QNzRAPxUkCMh0G2+OEXZ?=
 =?us-ascii?Q?mBhdOTqPlW8jLkcloaI6KVuaoR8GNhaUGN2hUPiKbVCCmTOOT4dJpyKZpv3r?=
 =?us-ascii?Q?nnXSJ7fdBizXzt7OJ+Ga1ibUS2PdriCcqYsACbD66XID3UxBzBm/l7t6odJp?=
 =?us-ascii?Q?EgEJz2zywrR6w+74wzvr/k1yrz+oDoGGBBEpCBH10eXEBKADfxUCoaX+NSWy?=
 =?us-ascii?Q?kNj0RO5tHx++MXHXQF3w4iYVqvzQypULHdfG1BsM5Db6bRB5jbUhrVM8FB6m?=
 =?us-ascii?Q?go8SRoeShhGY0WP6fsmv64vJhkHz90tdSW4BwhQUhHlErRzUNRiEgXkSdGrk?=
 =?us-ascii?Q?uEfYFCMRN7oLAKBHk4BnnWs34fmA4nh7JzP4MNAUq4Fr5nRFIy99WA3KHksT?=
 =?us-ascii?Q?cPG261Tbo9QpTXLZWJOjivOFW+NznfQwD3jRUMq9OpV6iSrhZ9baONvKS9lU?=
 =?us-ascii?Q?c2s8aHVs0xlcAOjh79f6WbOiXW5kFfitwG4tbgkv9zz6S2owXiQX8cx8LmF6?=
 =?us-ascii?Q?MCAtlXE/mtHXDAQVihi2Pe992mFCF4vW3UVmNsRWF+nNhbQab/yqAIKKPJLg?=
 =?us-ascii?Q?zVGNXhvlyika2op4T8P0tVFx2MSnAff1h4MKgARhvSBjEFcG0xpxKPLf7tWn?=
 =?us-ascii?Q?BWM6iu40/lHsZFE+3rMtY9B9gMEz/lVJx8IOt+WmaJtw0chVdOgq4XCEkyln?=
 =?us-ascii?Q?i+XcSKOSx2s5h+Jxd3xqzmQ0yCFmQtJh0ojVeDopnWYISe3EqDwJqPLGZCIC?=
 =?us-ascii?Q?YWyl5y4poi2yvjZ9LEAynaahhQZnXBNAubsW7sooHUl8lsu0LzNHTjsgUOMd?=
 =?us-ascii?Q?ie+2hghbU86f2yNSyRqOyA4JTopBMvfYbQHfZnovGAEko2y28YYgeoxZYVkT?=
 =?us-ascii?Q?KW9jB71DkYYet1fgvAqm7hSwKh1elHvuHDK4zsPPOmi0TJtpA7qokFyhBeic?=
 =?us-ascii?Q?EeD+b/TkWT1OVFrMH3W91/K3d28DwCNGgSkEN5iH4kU5qm0K5aYuXrjvNtWS?=
 =?us-ascii?Q?iAxReQbcNslVhj6vXbhFSvldiqaiNkDsc3WGcZcgJpIbsmB+nW1i7Sj74I19?=
 =?us-ascii?Q?ohlND7W8lWbXCKwtIV9gMu+5bWnPE3zJt/YrMScoqZuW9UMId7FyDcWbVGDd?=
 =?us-ascii?Q?sT0pHmEDxSEQMNjZeZQ62z70jW1CA0pP/gdSOhb23HAHs2/Vp96FjKZPCbjy?=
 =?us-ascii?Q?x6TClK44r3+bgH5f3nqJCb3gBBDrmWpbwzITgmo8wEtTMLYvhkcDOjACSqdF?=
 =?us-ascii?Q?9LYuc+AumGOiXkws6JLpGybMmCVk7f1girVAHuO3LziInTxXIk+Sg0O1YZTg?=
 =?us-ascii?Q?VpJw6n3Y3Ba5uv/gqF5DsEB614lF8Q+yqKG/zWtFBdV41qhjvoNXfbTuoFer?=
 =?us-ascii?Q?jsCKxu6iheCFKwA+/4WchELjzmcFYYmRh/Ckhj6bHoxe75sFtrYZzchFdvnZ?=
 =?us-ascii?Q?6Z+B1jjKTVWHmVXyMvIrT0wAaVcHHdr81T4Xh8lF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58a6ee3-a15a-414c-2f85-08dc49ce89ed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 17:44:20.8413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YHOVALBkOGWhbT6Ik39IHDS0vJNmmuJMc9yx2BqSBSj1TgtjCeJy4EbT5nbf83i+SDy/PuDKUfDTnQLuU0w1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 17:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197425

On a machine without the file command, the SDK install fails with a
cryptic error message.

```
xargs: file: No such file or directory
sed: no input files
Failed to replace perl. Relocate script failed. Abort!
```

Add a test for 'file' to print a clear error message.

```
The command 'file' is required by the relocation script, please install it =
first. Abort!
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/files/toolchain-shar-relocate.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-s=
har-relocate.sh
index e8ab357717..b017714df0 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -1,7 +1,9 @@
-if ! xargs --version > /dev/null 2>&1; then
-	echo "xargs is required by the relocation script, please install it first=
. Abort!"
-	exit 1
-fi
+for cmd in xargs file; do
+	if ! command -v $cmd > /dev/null 2>&1; then
+		echo "The command '$cmd' is required by the relocation script, please in=
stall it first. Abort!"
+		exit 1
+	fi
+done
=20
 # fix dynamic loader paths in all ELF SDK binaries
 # allow symlinks to be accessed via the find command too
--=20
2.25.1


