Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A8CC369B4
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 17:28:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.1])
 by mx.groups.io with SMTP id smtpd.web10.32589.1744392526803705511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 10:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=M0jNI6BZ;
 spf=pass (domain: oss.nxp.com, ip: 52.101.67.1, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZInglvMZalv8Mzd8JigC3ArqyZiOinita39JjjxTPqk4maPVoe3vIVTU09avyjyjb+FlZQhX8EbE6iZgGtvt/IlFRXTVQkrbdLh0fFiCpZLnNFTZF6p6NBRtkGLKlIaeNyha/agysQIy29CdwluCEXbXXZsRWgfgsFooaiwnvrPs0AbeRGmHGd+Rn+/4pTijR8YmfhC/C1AKr1rkK4TKILCK0BzCG0PgwcWeR5iKWcruwjCJdjgKnflSEBUGAtbcSn0oHhnczSY4gWwO/B6aEqcF2CPYXHSoxIcvwQJdf2+w6rOj/L3WfJT5f8ZViHOy1aGBmK2JNAk3hOLyGeu6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sfiapi8A1uopjiQGjIyiV+tFfiPhGA3JfwazFGi1nWY=;
 b=ABt6DQiWaEQ8ulmBuUkGGmPiVexbbyCYnWlhKKkdBWU+CcxWB0zzB8ULASE9suUgTtZamO1b3oU5TgacPhQka8TvakMafLVLOLz6dbNBVLOhn55Qk2rpDJTG7WobnKFqAGlltuJtY3ZLXOs/q35mq4pr/IvOz7G2bhCnkcxvze4XtqjaIRlkOI5kQI5p9/tuqZqLSXeW7tnd2UV/YTVM1Wk8xkMHAhg641pMPh44cUpY6GeAtnAcYcMngJ6pJD0jdnfK+Y2sVJrLebhRiVZ1+QeNwpBUABOjcMvVaVLxaEamNpCVpHMe8pULioojGALB7KJCZ94tueRzpyeB/NvJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sfiapi8A1uopjiQGjIyiV+tFfiPhGA3JfwazFGi1nWY=;
 b=M0jNI6BZEBAvnVy7lEMQu+DouwwWhrj+7TN2rGLrmkPp/8+Qu1cSjgYTNOnsnswMz3w3meAZPk51F5cqfAfOH+lTunut7/REoHySNmGVgo2gzyzmM+bmkMyHI3PrgVsLbmYiLB8a1DTKfZtRXrLfV7pG26HDKYCpUmQgJ1XWbpsizmNN8BRJWOSsVVVztKDHS49hKbGKHiADig7Nv3VjjiyCLwONG0qiEFjSNhnXMh71qOvvxVdP82aHg+k5kKwCjOq/zwWYSTpM08pY8xNWA/DagH52K+9ys5FPkqSTKpr35/hUYDS6ceWaTJniNAKdMxOHQWRLC3IqwCi+ed9QIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Fri, 11 Apr
 2025 17:28:44 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 17:28:44 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v6 2/6] toolchain-scripts: Add Meson settings for Yocto build SDK
Date: Fri, 11 Apr 2025 12:27:59 -0500
Message-ID: <20250411172803.3706607-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
References: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040AF.namprd05.prod.outlook.com
 (2603:10b6:518:1::5a) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: f22ac7eb-fcc6-462a-832d-08dd791e4ee2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Z97h17pAFprsJxnAK1XqkbP/vNfk3SrNZrCGLWJb3Qrb52XYkCpAn8OK+QbQ?=
 =?us-ascii?Q?FeGpF0nU6lvHqxJl9g/dRCRcMA0pMFRafzV9PZcuSLfcT2vV+hOWDQaRABln?=
 =?us-ascii?Q?YAeRW//zkfHNPFqism3Kv6A4AXXnThmV0HwtGzQj5UkZKHfflDpHsChZMoOq?=
 =?us-ascii?Q?AsghF7ixYeVwVDkDbgkqXPtGEoveF/ptFbzcGamc3VxIyiRYOJpg+6qf7/G+?=
 =?us-ascii?Q?OkshkZU1QpGfa5RSongqvP3VNEv6UEgPDUi6qYgMkMQahFQZVXGsP83/fiwi?=
 =?us-ascii?Q?rWdMo5CuqMIbMao6AeV58weVa7Rxf3nQ8B3g5F+I4jjieiH4U78kY5PkwwLe?=
 =?us-ascii?Q?yoOmziI9JdUbCJsgek7GOQP3fXRFr6dMU834E/5TU9VXp0Etx9gtzRrOWmyl?=
 =?us-ascii?Q?9N4w8ZmhqSAliZlQwjiCYy3UCq23C4i3bskmP/SrBAqw0GBjpFpxKSkdNTTS?=
 =?us-ascii?Q?OTF1NKo9IeNSDDsydGCBEnXvNppyfh0zoiX+Q5BEAy3OTq4TG3D6z1lOh++n?=
 =?us-ascii?Q?+H984pkErb6h1YgTklzEYF4BdcxkzKyPkI46kX7hIyaYdQpm26G0TOMB+sC1?=
 =?us-ascii?Q?VqtE8BwwtOwRBiLWlxtyHWAGYa8iHDpqzdKrKsdH8s6Zk7EWqRGqAsmgn19b?=
 =?us-ascii?Q?gGFBNrLLyqkWEPdN67CoYUOLlMJJ5SE3+7TCS+bo6YA9YJvcLA2gIiO1BwxR?=
 =?us-ascii?Q?AliaIUjARBOq2VcrmKJT0NC4r2mdknmoDwTjT3Y/rl0axZt2tbzQ334m9hPS?=
 =?us-ascii?Q?7R6WpEs0loTt0IkYt+6//mS2cnJPHE/xg8tF37mq7kVyJ95iQuE8Huyah+4K?=
 =?us-ascii?Q?hBJJWK9V+A4xaVMGH1HdMXeMhvnc2fT+z3BBnk868leo+3OsXBidPZJ8aR2K?=
 =?us-ascii?Q?zktxmVOxAqKMSd/piwgc68Gz6wjcgy0+gLNQzZ7mrGA/1ITlXw+isH7N7e0o?=
 =?us-ascii?Q?/bz2qQmWDFpZZ7BfnszyNiZa3dMC0JLNC7eAgLdAK9HSgrmuUa274hLag3PO?=
 =?us-ascii?Q?jEohPX47gf72HODZAn4VLZtBLTOf7pWJqcG+AhfLyCqll6kgZs4ETYrflxmR?=
 =?us-ascii?Q?+S9QeFA1ATTWjFsoZj3qZs1H/Zj7eSZBNy0W0cr8kAqQoCRZOgnfYDv7fUEv?=
 =?us-ascii?Q?U7/FHyQdbIBZ3slUjwORfqP+G7GgkLNH7mNDNHojflLNoLHnxowlYklSwVba?=
 =?us-ascii?Q?GW1ShMHnc2U0qruaAWZFGxXkAUlBJgpZBozeB0alBfbHF0EN9P4GEhKvrvie?=
 =?us-ascii?Q?DK7haiXOWaNtXk1F1CUpOYL8wBumwZ+/mZT/O8XKre+8oIimhFBQozinJkC3?=
 =?us-ascii?Q?wKAN4OfdS2wub8S68tiAuGo3Str2+zLG7vDSv8i0t3HoEhACBo8bsmektVt1?=
 =?us-ascii?Q?iUzs01S4ejkEx7JXYx6l+1H+vGVHzJ8vs9fvRk8pR2vMdQwiOVE2iUFLNmcB?=
 =?us-ascii?Q?qV5LLnVOh3wGrBlr+6CVdOJvABjzP6GzHepsN1tx2ppQZodAxR+iKA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BoDrzklCrxl99hAZW7YPBqOX6VM1uSTZ78rSEGfRfS134plmVHq8q22v55pJ?=
 =?us-ascii?Q?ogNRiDIQrXA0bmj3xUb+lb1S7ctInrcjheW7D+F+VXLWZvma1JF0FmaZicab?=
 =?us-ascii?Q?Gri5KiuxNBqxUUATGsTS5XTcoEkBYpY2Ow9ZYRNC6ryaFWnj128ldYnNaLZM?=
 =?us-ascii?Q?hYTljN5D8JAhj45FHl5jTXwp9qhWrBhhMI0Awm3rDPSU+Sxy191e7x0MVRsB?=
 =?us-ascii?Q?fZ06WIzEb3hzNYEOtGeAX41E0AK97C+X9LhCoKZ4040+ub2g9ADdRKPUEwrK?=
 =?us-ascii?Q?mwkPjXZHrPKaej4uveJZUdzyAvevtAE77cjhC5z/QuppGhS4hgmH3ZlJLyZl?=
 =?us-ascii?Q?5YVRLhmTN0VfuMgKywOyf4g6feCUexs3LNzh7XCSlh5zbq0a4mj5nRxTQUMe?=
 =?us-ascii?Q?/HufTbSGqad8J4j9RvEIHKqg8LT1suFIiwF4woX7PB7jzK8rErGV3tiVtI83?=
 =?us-ascii?Q?gJx1VcwOs/eBRBexKCiEs0Moiu8w2aQw6UeGmWF3jv2Q8yki8aODYR5Co09Q?=
 =?us-ascii?Q?qLmnS5htis3lHRnG6oRQNRvcsooV2LFEFYM3Ebp0fgwLsuuaYl3Qqmt7mczg?=
 =?us-ascii?Q?mRUltzSky1pcrZQQNw75kMu3hVoKlbFkvBL17XwKWBFcReJxDvG7akUvhwwN?=
 =?us-ascii?Q?MrHkJUY7FJVJ2tdfUYKe+C8VB/XBc8DF/wL8/J20JryAiJUzyDtV+cVWiYuW?=
 =?us-ascii?Q?irHNG7onA5Avj8jo+YjOQj/2P60/kJUWZ+lD/4tD5OQ+BfOm8Zt03uaA80Lw?=
 =?us-ascii?Q?xS0lB72dE7Ro3MwaP47565fB8RJdwZh30Bampo3mRTrHnZgWjCcEXnF7LiDi?=
 =?us-ascii?Q?y9bnW04lOXIJ9t146UburpUZNJNs/WB0n4fIYAXUC4QGrVe8x84a5F6HEPbY?=
 =?us-ascii?Q?Smn18glrBH1BZovIlw/gysYglkH9wefZ3Z/6iGfcFprU4E6y/PXB/dyHVZqJ?=
 =?us-ascii?Q?tAdgKa818j4oBgswCd0DeyjCQTCLJKHyeo9uvYVDYKikY5PibXK5Owky4MhD?=
 =?us-ascii?Q?8Y3xy1KK6DSh1n73NOuli7a2mjXh1yK7EVlwsht037OMKybuHfUfpL5KWWmK?=
 =?us-ascii?Q?r2qhvKGLzHZnqwpYqDtvevBB7Ca7tdsLu9FIBgH4aB1lT5gAdzVO4LcC92W9?=
 =?us-ascii?Q?V7XfN4JlKBQ57TUdxiesq74NEEOfxNqaDXGZ0EfdpiCggak85ip1qVegatIK?=
 =?us-ascii?Q?iDpeU1w5SyEP+k4u89rcvtvgZm/aJPbqE3mCvHhfSpdDuhIqVR/Dl73OOulc?=
 =?us-ascii?Q?HQ0JTLZ0Ui30ShF47/w0soqkre0+FZRMz5OnpFvqEAYAO4RIe0kazCFQswrh?=
 =?us-ascii?Q?qD4geiVuhXWwMj6Dbaix9gAFFpiNs9tOTj7WmbvTjtFsZyCX4VkihSECaFwL?=
 =?us-ascii?Q?DfsoWhDQpWQ8ydgSDPJkiB6suTN4kZc3dej3VUqeN4prm7mtmzmYumP9QI1o?=
 =?us-ascii?Q?VcZ62lDy89Ofk0+A9LD/nJj8836LprBokzh9POgDRJ07NrkzJmI8/SWjY6df?=
 =?us-ascii?Q?GBEhwdoaqx/0z2t/W3edyEXkQUig0MSxniLQV3Ity2MUA1a+IkREi5+tQyCk?=
 =?us-ascii?Q?ViTJiqoz4IQ0EWF1QFxzgNn5WUmNiU49aq/mtSNY0/li8BHtarpjJj+plY3N?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22ac7eb-fcc6-462a-832d-08dd791e4ee2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:28:43.9586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TElyFPVJGR86zXZce7wU33KZsSgYSVxY3Hqd+t/8DVAUs3bSp8yyO/Q8bH9AbSX1vfilla57lhU6arC8k3KHiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 17:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214748

The Meson settings for the standalone SDK also need to be available for
the Yocto build SDK, a.k.a. meta-ide-support.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index b59a295abc..9e4320f876 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -99,6 +99,8 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_BASELIB=3D"${baselib}"' >> $script
 	echo 'export OECORE_TARGET_ARCH=3D"${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
+	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
+	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
=20
 	toolchain_shared_env_script
=20
--=20
2.34.1


