Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29418C35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 09:13:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.92])
 by mx.groups.io with SMTP id smtpd.web11.3603.1742375625665261312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 02:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=dX+eEgrg;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.92, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUx9T0Y2Oy9eNB547fFTlh8nR2kMIhwQm/vyCSU+XMLP460YeTWfXeczHDDGs4FkSbbMJCR5bR/zAijv/scV1Cd1TAHIdP8m0nEUwDY9NYHG2sys4E5v5gDv5Xz6JzgFYJjYKSo02r5oRykGyVxieEqRCbHlzh56GzN++KQw+yLnilL2lrG8JPP/di+QzRpVX1DBsEQm5JlOQPlE1A/HWXJA2iGNUCpnGypyKzxVI2GaGwtr7Fhf7mcVGB+Ib6Ek90y3brk0GlsGL9c0gKij2HWjH2lnf2i5epEUkAFmSTXdD/N5SQUyr0SWluYACdZt5pVyn6jSLzwpCS/ebE9R7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izeLppfQ3bJA4q0Y/UpnrPaSwtKZofAB5SYWUs1tHA8=;
 b=aRzcS02jjWmVfxRgnn2d5qbalnq1vctMe43Q3WzB5oDiitOd/W+thQJ2STZXSshgikFmfOM4RwkEkZSzhKdxZYbZSdZy+lRlACvEs8YD3Ha3I4JKnH3i/5CTmpMzqo4HFf7LLjLWSSpgX2EySKoq2zUNiu/GX/7856xJS8ddDm0jilqFL2KLiRN8LWrNZEIhwkz+RpkazxZxLQfyFxIgR64aITkOJkmy9SCTtiyDito2z4KyE85ImZJBSC/unPEgH1zVthyLvKEwm09mEMD23btaWPxz+KTAMCVS0olCXCumQWVTZRImDz7CdM85d4JlJDmmO2MlG7boObb0DGXOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izeLppfQ3bJA4q0Y/UpnrPaSwtKZofAB5SYWUs1tHA8=;
 b=dX+eEgrgGzlwEZWORXsWyLY6lg14h7adOjFriKqkHZtUoDJxdkzyensA5vV3h38ZWM+8a2F7ZS6KWVqi7PKKBxozUUUIKUgrxPu3H+0rxsP7PEe3u79e3I4c+6Wj73gH+ScjHm7gXcK66c1/jqJKfIc3SVrEy1Fh5FZwpsDXoGPdrm1Vg06qP8uPj11BcZeqotAa+DrQTnT1Cewg3hSgzrLHTTXahtcnKM7dy6t1z7/pLbabyq4SyD7wVOkLG7DIXcI/uvwXbW5N/z7TICbt2VsM8V3pYhusbybs326tup63fDRThCshapSNiI/BA56mIHksCBc97aTbPAci7oXerA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by DBAPR06MB6984.eurprd06.prod.outlook.com (2603:10a6:10:1ab::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 09:13:42 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%3]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 09:13:42 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/2] packagegroup-core-x11: Drop dbus-x11 in REDEPENDS:${PN}-utils
Date: Wed, 19 Mar 2025 09:13:29 +0000
Message-ID: <20250319091329.3057329-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319091329.3057329-1-niko.mauno@vaisala.com>
References: <20250319091329.3057329-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00004598.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::443) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|DBAPR06MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe2be59-5301-45a1-7faf-08dd66c657c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P1mTlmDrXWaICSauOaSMkAHKcY1HI76nVvoaYSLr1xDmSk+PpytScFP9H6b5?=
 =?us-ascii?Q?UIFwXWauc1FdulLK/QeKZLZO6ne+rtw5PDPFWyVJc8PgqwPUP0V41IOjgL+k?=
 =?us-ascii?Q?G4etPgkn8b73jit9pYycqKvv8Hj8NkBtuB6y6AP9cJFDkHMcC+rnDYPEEiIA?=
 =?us-ascii?Q?skg3tVLkgDtgzfK8jZGjkeQcKsdYfXMdO8sTZCV063/NfcBOqOZO/hJAk6GT?=
 =?us-ascii?Q?AFuRJiOXSmDtCLNoYVqUjghoqy6nqpD9ji6OZpFaYQPdgvVqZ4gwr9nPGnae?=
 =?us-ascii?Q?JxiU6P4DKo9ccKfzWZe3zB2Ph9xoFpKIXlAhjNLqNpb2jPQxDgPlEA6V08mZ?=
 =?us-ascii?Q?TCY/MK5VCZGG96MBJGJd0Cj33mzbn9ALmOwxChsGeIUa+HkvkP+PjPfa9TBo?=
 =?us-ascii?Q?fehMCT8GwjE5Q6hM0LQvD2gzICZjU/1VQ/8ICNn/5NwcFPgrLtZGkYO4iqg/?=
 =?us-ascii?Q?HGjaPlG3sUeuW8Gb9V/OUYcUWuTzTBLQjabSiA6Q8jVMduqZ12s0fhFW8kjI?=
 =?us-ascii?Q?uOxEYxBZrtncVXK0giD8swAMDZbhogbtSQsM1Gf7W67tbgU2XJ/Mw5Hi0xCi?=
 =?us-ascii?Q?a3xZTMLa+2e76adhEoJ2t9nucC2+b3z2+BNJvmxYcc43NNSL0tXXiUwkB6QP?=
 =?us-ascii?Q?dt92ZFMNn9Pr7tVq8Ty2xqoWC5wYFuJS8hjdJKM7u0JvRnZ6epENtetGVIsJ?=
 =?us-ascii?Q?4+qa/AvdmubLvG1vPbyQxmDyVSRXV/V3czioURQeOcOO8x6m5tpKZWSphVeo?=
 =?us-ascii?Q?7SeDzTaj9MPm1n5TlprgniDRyZdrXDlHx+Gawuga2pw4Ru3B4HYVtGTaPCwq?=
 =?us-ascii?Q?BM5sZGaN3U3uv7TXpOLUkdIWRkRXPanDV7SykbGbtboF8D4sUwNGtgJkDZE8?=
 =?us-ascii?Q?4paRpSDyOPdfOal7WrtygMHq/BjE1rZvJYJEYjDPxm6R1xo2oSz9MIH7lAqg?=
 =?us-ascii?Q?WPSo2hTI4TTVZQTKADPDczj8mA081MJo9tF0Lquceo2XdnFmzpKe2Vm6Zzq6?=
 =?us-ascii?Q?MuGVY4WW961Cv2ri4s5RvELtKbmfe50J8T1hpRW9XLjuiEZl9hN7Jhs+Rb/a?=
 =?us-ascii?Q?4PM7kT5NnSJmnJK5HwdEd6d9tn6hN3kN7D1p953ArHhq2sPe3qVzFLKdh5X1?=
 =?us-ascii?Q?MPiLp7uxvOpqE9eSASjcVZQTPdzdBDFR+sRxLAATGc2VWZjDT0BmqOezgn4p?=
 =?us-ascii?Q?bMTZQbF31v1Af9XzUYu2pIKGAH9c2raM4/w42A9wIyqtXitP98XEdf6qPZtq?=
 =?us-ascii?Q?h1skfhIp8DOJmo2ZspGKmB1nFJfcgUMLNxBqIkFKym0xNg7p1mpX2keEFPKd?=
 =?us-ascii?Q?VjdbqbJr1/aR/sofMnVzX0huqHHzmE2yDThxw3rxHtzrG6IIaI+tiqq29UBv?=
 =?us-ascii?Q?xZiHPQVvTZRkyf2XUCIORxymPdemmHneYPVWZ7ISWTegz9BpuyUQOF5aUJpA?=
 =?us-ascii?Q?Yf9VnLcTfDRb6CM2P0BTDp7myFf197N0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SiudkNaTKPSNdxugTPLNmlTwf/A5R/zmske5S5IXAo7npbtP8bicWORvkwhc?=
 =?us-ascii?Q?hHcfRTp4D796pEq6HSPVAZTzQ3WHnz7WkXUnrC7V7t45omM/5RgGJZbhUy0B?=
 =?us-ascii?Q?EoYXHwUMyZAaY0hM+K88Jtdu3dHqt3h8otLHCBknX5MGth5LwDwaxopDRnsF?=
 =?us-ascii?Q?hl1Aw3hwz442OtB32y6rPzRrpkmkZ+sn+b7wBbEnspTNbxkPN4cq+yN4Cb3n?=
 =?us-ascii?Q?SPToi+j8adU97USY/V0tsid2HIK9GC0C//+2naWyIhDv4md9U6jAe7N8ZPPK?=
 =?us-ascii?Q?HMM3dh9CjSL426i6ZtiW1ctyc+IqPpqeDe1kZ4Bb1DyG2rkM+U+jeWkBQKCp?=
 =?us-ascii?Q?W7iYQHA73uIUFIbWCDBgi+UJKZCBwAnPuQtSFsXkWwcZWJmWEH1fVvjehH/4?=
 =?us-ascii?Q?2nvWsww+mVOZqHGFpS16+4USQGdSwQMVq4yVD8i3ohwG97Y6vILA3aWfag76?=
 =?us-ascii?Q?HtPYgkimdtKO/K8S78DbgUI2OsY/TRsTh7LEwkg9DvGgkno4JFYp0vZzukkW?=
 =?us-ascii?Q?njmEeBybPDxEs38BBVtf1Qd3lMzcqlmr9tgxFE7oWNqIkoTl06VMYLrfSshe?=
 =?us-ascii?Q?qR/SXvvA0C1OXxIXKncvphAwGjs3ppObKDLke1YaWLTLP9BX1nAG4Lrvw5IQ?=
 =?us-ascii?Q?Kdo4dmOCjAowNqBD/Gfv+qWgw/uSOarQbZfpZ3zruAXmr0YCVnn3XbRp8scN?=
 =?us-ascii?Q?o1InTPoZ0ibsGdOFCY+0XwpYiMVYxW+KyVfnR+npLt9ud057SzvHS8N1bUCO?=
 =?us-ascii?Q?Qd9WKuVqMjqmBjjaTom9+zCSiKSQxl6BPRMjLmd42Ni4XuFwe+e0OtJw3K7h?=
 =?us-ascii?Q?wr6S7FpXwbX51467UA4P94WhOBA4CQVsjzAdCE6fAnQIVUy3oV9ql4X6I/Xa?=
 =?us-ascii?Q?vUvTHp5QnlqKbdQryjFUEBisILU42TcuawBT3sZvN9IJ5/opmd3xdC7zCdOA?=
 =?us-ascii?Q?FYtl7/+Sg6TxIjeaeKVrWDO1XbzSfiC4UQS/0hVp0Y8DSTFoadLPGx+YPmLe?=
 =?us-ascii?Q?M8dGRWLBFXcwUUPGdSVLmoZ+YjwV9xK4thZiSJm4HaK0jTXmFmD+TPcfByJP?=
 =?us-ascii?Q?Q3zNXsnJlTQXQHItSdugejRoY2O6PV25i+MbTd/BFh9c90raxCzEF31cF9wf?=
 =?us-ascii?Q?5a3GlwPMKUCszpsH53AlnfZRehykXmCH8d1YKYjp9+Sqra62kvO3eG/F0R2P?=
 =?us-ascii?Q?0DhQ3AYzM3gmJF6aQC+eB7tWrt5/D5KGOVBvvREm+XdJ8eT2CLbb3vDf1HKd?=
 =?us-ascii?Q?X6T3gzycecE3n+r58I81wT80vrvD6OdiCwVIB0mCtrS17emQ0cteZYF5W+hO?=
 =?us-ascii?Q?SBgTCLLLg0B9Pm2AXpD9BgRPfgOCf/8m8PefrmXC07A/zhzmLcNZUdG5xRb3?=
 =?us-ascii?Q?otjnL6tJUyQTooAweuaycqNWx7PZwEXgu6qNRDgyMZWJ+lOPCXKJ8F8Q16+o?=
 =?us-ascii?Q?0sXEwFS8rvFmCM1tLSD+ZK7lnKVRe9UwdWyxQ9g65iMxv5OksWbGyqywmKdy?=
 =?us-ascii?Q?sY0zxHLWAtpUHBm5+GjEP5Djh2gv+IG3bGG4pXgaZfV0+YP9NU6umhF9ctU6?=
 =?us-ascii?Q?RC6/VYsvOoGoK8SMFumCYjPjTkVJP1cfwv3iY8aTWJkRavL89k4HY0b8L/ov?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe2be59-5301-45a1-7faf-08dd66c657c5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:13:42.0600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WepWFfFYq9SZ7zyYyWf86OH9sg0BtlaUtysotWvaKmxCxF+wOVsBm/RtPC8qIzsJ4AbIYkfu5pAMJydiT03KlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213313

Commit 5dfca64b78375de279b6ce7c9bffcaa35db5dc17 ("dbus-glib: depend on
dbus, not dbus-x11") mentions that

  dbus-x11 hasn't existed as a package since 2012[1] and is just a
  RPROVIDES in dbus, so depend on dbus directly instead.

Since similar change here would induce an error:

  An allarch packagegroup shouldn't depend on packages which are dynamicall=
y renamed (dbus to dbus-1)

and since dbus package can hardly be considered a X11 utility,
remove the entry altogether.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b=
/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 10184f1cf1..41335cbf6d 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -31,5 +31,4 @@ RDEPENDS:${PN}-utils =3D "\
     xmodmap \
     xdpyinfo \
     xinput-calibrator \
-    dbus-x11 \
     "
--=20
2.39.5


