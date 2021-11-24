Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010A4C43217
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:15 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.72])
 by mx.groups.io with SMTP id smtpd.web10.6992.1637765289962517376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=B57OaKMD;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.72,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lemMhstt42mk3j7gXwpr/ngGBSvz9S5XYsgYFSTYg+Z8uj+QZJ7P56Kd73yGgXERmSciqptgZfUKY8NbNooA6kQlE0+rXJfgcDdw5gZkrLivD15RqiM24km+oiVJLsKtmf6QFv9Uxfcu3pjqiYQ47mfnn6en4Y9lDGf2+8vdfn11sa11Fjr+h8+rFppCwhCLqStN4jSUjdRvmf86gM/KWtW9wuFeweVGAhul+AjrcjfPgOC1DtLmq40qoVaidJGd7qTQZ74PynGXYNAZWf+UuuZrad4da8yNRGMgcYEHsjwfCXKRAI7v1+xa8z/kQgq6rYsM/wsYvZfcHbvAjcVTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeFiH5r+dtZRW2s2YYIQXhbBeDAmLHdxcwjzikd5/+4=;
 b=P9U+yE8jbJkkFLdrk4bYZcL0pANMXqZBHKEgHisLeOVGHIy5DkhTfZKzEeTAifctfqi6SdnYRloW7oIUYfrdt1wIXtJTxGETcLbzUTLRCE5bEsruX70aXJssen/SCmuEbi0uUfSZRFikwQCyO9zt/kpuxjjCHWOhhJ1J4FkDDyVQXVvj2HGTo9vIVPH/Q/jkYz2SPEMXdPL0zpmAjbEWieRjzoJw1Oa8WOcEJ6DOvisYRrWMNyedKi9Eb+WItybBhJW1OF26cXoKdo5dsVosNX8hdJZhNtRCLUT+VHUDweC4e+8kY+/xZabOq8+i4rwf23+uuCqz6dzVFzMknJY3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeFiH5r+dtZRW2s2YYIQXhbBeDAmLHdxcwjzikd5/+4=;
 b=B57OaKMDMLjLKArPr3AHLvzqYN4aF9ntHPoeIrfpvvZXg2DlbatyiW+0dp3PR6AB9VIXWoEw7wD1BWmn0hS1ecnNYLWnEZlm8L24WONqX+v3rK51f8xnjX+VbvJL7oiWWTyQSWfeVMw10BsxyOaZt+QRjWKSIbQN7AhbJtRFhr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:48:09 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:09 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 10/15] karma: add class to execute JavaScript code in real
 browsers
Date: Wed, 24 Nov 2021 15:47:34 +0100
Message-ID: 
 <20211124144739.2250-11-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 748b588f-f19d-4e43-edc5-08d9af596e93
X-MS-TrafficTypeDiagnostic: PR3PR08MB5801:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5801C6612FADA8A7DFB82C3FD7619@PR3PR08MB5801.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lZFjkS1MMudbqufxvOmUe4JU+o98+BM5/pNFhODLrxPr7RlLfzs75rffkMW5xX5KvgL0gb/JlOVHGWpe7VkKqtRIA//WlDyl5To0DV5/MWefQZt+EgHjycDBT+ROQqluRksuvY4iAD6EgFiS8Iso+EcBiGotl9OfdEKky0YkYBSyDsp5yKHim0HA2oRoYuywH57UW8u4fwUgZV/umZ387v3XXkplD+k89UQSm1vK6VhcYHmLTN+UYm519ZVfzX3/8/8jCIdEnYRTJRBPnuB/NdahzrFgJY919wwAP7LNmCppV67yQT8rKUXLojpQfe4AaQ+GbJvrgUZdyQhmwWtoBNmh6FvKdRmIDa4rX6Eyp/Fp4ICVJadeu3iBPJ8BNeXGjdbK546R2M286QRBrhbvOSWm4XfkLtiACbw+nHCg4r8TfFWGEeYI+URjAHomPv9s6NAPhqlOppR6mGD/4v4o5/VniqOs/TnLEhzXySNlmo7DKhUYTqzK8Ajnlwv9KNt5uf7TXThjDn6qk8PsUN0oMthX7gnTmbkiVBxy7M18HzvwXGJPKqn3u1tCknqPo+aMlMpppJDJWDS/csRQLycA5gq5B5P56dndX62KHwt9+Ja/ESMB3rGDB2rQ4m4BekiaAE6JWQWv1fU+USmK9bfFnklnLpv88ABHxqUypeMGQ5SoQT2TOWdw+PqqoH9vxAh51CqpNco3uHET/NwyxVxBuA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66476007)(4744005)(66946007)(52116002)(66556008)(6666004)(8936002)(107886003)(8676002)(7696005)(2616005)(186003)(26005)(1076003)(66574015)(38100700002)(5660300002)(38350700002)(2906002)(956004)(110136005)(316002)(508600001)(4326008)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ulRUaVH3yAAoG3BtgOVNOhcrq/0JjgaIwRJ80QtEUqSevxRiJsG6Nmn5l8B9?=
 =?us-ascii?Q?3vH5pvYkREjlJFcf9ibyZcgENCnKRTrkrZcdSBEhbQ5SM0sWHYRUlI7On5Ty?=
 =?us-ascii?Q?DLWcj3Ft0G87BUXLJazKe2kfvyNpLR+4SROE2aGdeQI79tZa4qERIKX1PU8F?=
 =?us-ascii?Q?7qALvZtDekvlTPXyo1SpIGj6VjugEPz5coePrckTYrWcMGpjbXKKOlIQ4bwv?=
 =?us-ascii?Q?bDVaop5jAiOMAeBxL+w7VAv2WDic1iIefacvOx/Ks9i5XaoVzzxwf6//i64M?=
 =?us-ascii?Q?o9pQdrU+sJ4y48Xyu4S1r7lsKfKYLNUhFnVYNAlilcxDGS/g5aZhrZLIJi8V?=
 =?us-ascii?Q?uEiV+WHlf6ltRZIJ3w23g6o0QKhKrNHlmWe89ujkXwe447jQeCDdbqwM24dT?=
 =?us-ascii?Q?fEcNjvOdOuo9woaTLBzc5+/duXrVyU4CCrKeAb907c808XpNmqvXc15ujx2W?=
 =?us-ascii?Q?N3nzUGKwYgBpCw/hF20+ogAWTD4aSQQX9Wvj0fj3jPBoUbLblh/TobdbnVkX?=
 =?us-ascii?Q?BPKEE9fcBtmA2fTb+5+K1h13VUaFS1YdzMp4pIkxtDzCiJbCD9Tjwsp40NQ6?=
 =?us-ascii?Q?f9p/Ns13O50o5U6Vo7skTqv1f6iiM+5KA+LOJ94u7/YzjLi1A5zv9uWo6MQ4?=
 =?us-ascii?Q?TZnh4eH5jG63bRmbn8jODoP8JWYAh+nk+/CeaDwz3m5jXWVEIK1FKoCTZMUA?=
 =?us-ascii?Q?ssz0k7d6Yj8/RGdi0Er8l7m9T+aQoIEppGDLW2BPxLYufn1AOtMNMIZ5i4+Y?=
 =?us-ascii?Q?eW01JJG/3Gd2SVXbPCJsXFCW2l9XYmpmwYCJvQCKdEXJv6aGYkJK7ezyjp7E?=
 =?us-ascii?Q?0lK8dJ36iOtEswabMgR9225uJ6BVkMLgPYxchXjxXNo9HTMbBne353gueYMp?=
 =?us-ascii?Q?+ZtxgvX18gyMn6NORh9znuSScXKznWUi1bZUyFdtnv/vWFLFyWpCXRawnGU3?=
 =?us-ascii?Q?NcUHRn8TTeJ6gMEYV5katS0US7PzTF98fSDKiZJ+dMadLzJPOS/pYRHln0T+?=
 =?us-ascii?Q?EZHPiEndX8BSVSJlHTYBWzLoIqOQCpYxrqXCtFnimilwvI7dqU5YB7mPjc1d?=
 =?us-ascii?Q?VH2lQKJuSRmMivd0HXMqX3yCPLOB+RYrxLkIoToKD2fRf/LeY3tmVjlxW80U?=
 =?us-ascii?Q?PIXYcQ5kb57F0b2em9XTADvXm/MB4TpujE7tvY9HgC2wmrRj6v3sCFs9UjvK?=
 =?us-ascii?Q?VsLWpHdSDux4U3FyVpxEQLLqsLALCE5Pu6lOQZEY+5QoIwRTOazJ87n3rTw2?=
 =?us-ascii?Q?Ag2908YEHVZ6VmGfqLLC9lN0w5KLskbo0WENwYFRUzdb1rlDHaS0pQRMWbtG?=
 =?us-ascii?Q?0y/SBJnNeMRx92M8LmBNOYa6DswmUxYlDGg8cNE5E3y7kfMFvNeukEMcQK4W?=
 =?us-ascii?Q?KBEEdLVKl6Nnt9l8o1dcf2wBkBMB4/yOKWwHTS3AD9/vRmynXzYuItlQqXlY?=
 =?us-ascii?Q?5dDwmygjzng8RUgmp7aUWFirqZ/hXswOgoca+Ijk1ydEj3Gy3TbMH+IsQJnV?=
 =?us-ascii?Q?rjkMjstRYokr1kFbj/U085/5OrAIDPx4A8yEAVqTOBroALHNVZVGl6Zo4+Os?=
 =?us-ascii?Q?9sDIa6KadSGme3JAx0pBfPIs701mmuX5fAq9e5tp2I/WjzX6NK6tIn5BDaZv?=
 =?us-ascii?Q?ku71jjxlIFm4xqCwparYskU=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 748b588f-f19d-4e43-edc5-08d9af596e93
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:09.3178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4WyjOLRRitQNvwYx/HdsIpsuTQFhPkSG1uXCnYqz44L3msVm5DYxnA80LVHj0j099qMntitP6mzscxpXmNOf7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158702

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/karma.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes/karma.bbclass

diff --git a/meta/classes/karma.bbclass b/meta/classes/karma.bbclass
new file mode 100644
index 0000000000..6b23c17a6e
--- /dev/null
+++ b/meta/classes/karma.bbclass
@@ -0,0 +1,18 @@
+# Copyright (C) 2021 Weidm=C3=BCller Interface GmbH & Co. KG
+# Author: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
+#
+# A bbclass to execute JavaScript code in real browsers.
+#
+# Requires a Google Crome browser
+#
+#
+# Usage:
+#  inherit karma
+#
+# Optional variables:
+#  CHROME_BIN:
+#    Override the default google chrome browser
+
+export CHROME_BIN =3D "/usr/bin/google-chrome"
+
+inherit npm_test
--=20
2.20.1


