Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1352C2BD09
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 01:59:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8147.1719539937555005408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 18:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6909187cab=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RNl61O009179
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 18:58:57 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fwbn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 18:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KerLUS4kQD5wjmBZwKPYOwFns1OGPIxf/XqTS3ivXw0MK2oH9IpsaGGUeuCVMq0Owwz3cCNe095xwVsJN5Uh79zNIbU/DinXBuNBzZOWkc8bwPNgjL8klZrcENHZps6Z0pp+X//WvgMy43cpIdnMyzlOWeAO5yX0ncqkJPg+Pd+eB1s7sH9EDU57H2oa0wsBunj2N91D6Lo4hoh2yPVy5uGq0/lIrTDoneRZR9tLIx8d+5blFKvFO3szAnvlxPX5SMvN20SXYaxV1w0YliqKm56V/XxBzPZvcTh6ayqH6QMyAm5qGuqZN4md0VbfWQX/oXfr0AkoB/XpVBx1CnoU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avv9H06hF0GZjEGZOEY1Zm4krwJlKjAs4eFoGOak8Ok=;
 b=NRyuCqa9z/GofTqIb/8ppBSHPGs9dFh+9qrxHahg1z3+ByGDxuS0kq7UqeZh7XJFpf8H6DnIX2EjjRxkRTshPufakcQ8BXemFwW1eeE3DKUr9gxb/e26pxJ0nMAfWz/YUT9ABFEP1RKepgv5N0xqBd4y7TcTge72nKHtqNjtGgTevD53GYQUo2G6tDitiDqagmCAFmxecbi6Li2qL/OC0Tz9Aevnmpw4yQwc6nW7bM5yfHMdQpwQyK9fPe9S+uinIB/0cy6ieKKpnJe0KwiDwR42Qe4cfgef8sErDDPHBA+V8mKzhAx0GSxviAZHgHdVXRmDxFaYt4zJWgYD5vR2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB6196.namprd11.prod.outlook.com (2603:10b6:208:3e8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Fri, 28 Jun 2024 01:58:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 01:58:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] blktrace: ask for python3 specifically
Date: Fri, 28 Jun 2024 09:58:42 +0800
Message-Id: <20240628015842.588768-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9bacff-6259-47d1-8675-08dc9715dd5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2711HMGtgFvLluXyLVp7L5g1Kl95lT2RgJcd7ALxhZtQ+wI8LV93MIpDdxyj?=
 =?us-ascii?Q?Y8XdDr01UcdLcj/mRFYDNGKbc9XIIRV4v9b6sYol88vEAxCcir3Nnx5jMEhJ?=
 =?us-ascii?Q?x9FKBPkFqQ10Z529vRMEwww2JjvOSKdSqcWp9wXth7HWjJusPOgTgFvD2QV7?=
 =?us-ascii?Q?omVJdj1mTDcKc8uA7SMn78KKzYfsJGEaLeBTbkR/CadxrWRivcBq6m36KlTy?=
 =?us-ascii?Q?iyRr4Nxw2Q0+uMvpgBaNQFnXhgUyPKa+FT3hYkKr4Y0JyzpI8M2TdZ1JD1VU?=
 =?us-ascii?Q?SMQ0oF5zKbQ7Rw+OACPZgkDKw8zl4P/jIfLMaYy6yYvOmNINZdbCfEXR90HK?=
 =?us-ascii?Q?6JSFM5/6kbLUKDvRPz4YmmcqXG7hIhhySQjT+8qseZeccYbbufNvsaRTPhfm?=
 =?us-ascii?Q?gmcrlWQwNULh6pNdg57RXoR9aJ5LJC6HKl9yHTqIy28zKLR1KUpTfmAeXKZM?=
 =?us-ascii?Q?cv1zkZGCZFhzOp5OePBFIRul+X0IKY95Een9u5xyr2TDt2kdpezMmzxjnuHF?=
 =?us-ascii?Q?RCE/4WsNdUvHiT/yDemgo7mMj+yrYVp0JcgMb3GyIqmkFTgoDe1tMxiPhIPn?=
 =?us-ascii?Q?EPga3HeuRa0ai7ckPkms5O12qZSj5gmvXAwC/utZesOtmcw5Q8sI0LX3WGAz?=
 =?us-ascii?Q?vLdIQbxXnAvBrBaAz9RQPGG3cmCOCjWxWN8olVVo937PkA+8cl+JQHblfj35?=
 =?us-ascii?Q?hDBd5LYTbS4AGckd3/upCq3QTOHXIgAfjj991QknFiHORHzhEFCRt+5FO8zi?=
 =?us-ascii?Q?BxG93fg7s0btj19iijRnf5Jr2NaTTMx9OHpYP6wxpZC2tXz+J1K5D16TNWM6?=
 =?us-ascii?Q?YGHfTibLU3sYrKeq1j3y6Jdb5R6bfaF5Bl+2ZPNMc3RRtHN6O7e3NqgosoCx?=
 =?us-ascii?Q?2SNkuS7WqZAymwLIjOii8m2qErOAkrYfEbG7T02aaIK2LwVKQJyP7Rk5BI0T?=
 =?us-ascii?Q?9X9ZFmJUmUfarYMhnyPzOCkBmedu8agJCV+1S9MQAP+s2dPbGUaY/bIsfE7B?=
 =?us-ascii?Q?l13ffTcYuTXTuFwAcV7kyL0TCIAuN3HWw8Q/5NJiEbuVv8ujKdcA9tBSlAby?=
 =?us-ascii?Q?hNH49Cd37u9+n+m29a4+M9MveDoni63vV2Wee43Sf1PPiO+5ipv+RqQKp/LH?=
 =?us-ascii?Q?DUrVUT+oGtKbQ+I/G63wKdi/quxzkmWn62RI4k/F9VP9ML1icxg9S8G8pH0S?=
 =?us-ascii?Q?69X/4Nne6VHSmXd/KQydEFYGjOoRrM9XWjFz7u6ogsSi/JRjMiglE3RMsP8K?=
 =?us-ascii?Q?PRxSeB0+TJeFC2xoLnurRxZnNbv8k0o2Zi2h06ADeS4TC+7MxqDkUV+XLOTt?=
 =?us-ascii?Q?Ep4m2XsPF/zyNIT2JQk+sKwdQ+auTXf7TdeMl1NYsl2flUksrllJmfhPh0E0?=
 =?us-ascii?Q?gbMmZvU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?siUpXnOb+FnsEBtYrJc1NbLS2LvxNVJ86if5Ko8C6K5rDkIVr/GuZx5hEQwE?=
 =?us-ascii?Q?rAwjC9Cgwl/fCrM4kPEiEKytBBpNcBB89YBezqP77mioB8qzZlwcBRACfsDH?=
 =?us-ascii?Q?txfabO3I/UPVXSuSAW1TOzsI8VffR+r2mXOwO259qsS9uJRV6kkI+GgwI8pB?=
 =?us-ascii?Q?9b1MDy7bZ2ccLeR2QpdMD5VHzu3e0vmC2btALsLdNwjMIVvsspBqo6RS6/4u?=
 =?us-ascii?Q?NQEFLwP62KKyfkB5h5SgWiuOZ5JikD1lPumTO7yKG4IaHmGdKup9byTnSxyh?=
 =?us-ascii?Q?2ycyfrbyjX+b3KCrIp9Df+eExNGBRV10hK0Z2I3RFG/CFB8HK8lUPv9ZdffK?=
 =?us-ascii?Q?19w/x3RZGNapRUc9q8lI/fcAIGKk2rJmArI6yYHm382X2HIJdQMdwl0NQERV?=
 =?us-ascii?Q?2ZaqcrIY/OaseK+vQlCecofthfeUZzsotuiFVnFJieAy32HJxf8Or4Mq8q6J?=
 =?us-ascii?Q?3QUaZdN/hB2xwdgbVnf+/kqkKB0g6CtdtBh6j2iBz+n0DvH+KcLA4uwWSFgQ?=
 =?us-ascii?Q?WFKIM6QsYBr7TTNHGZhKQY0nu22McFzIe841N6846DoteLjWf8PXbfaF25TX?=
 =?us-ascii?Q?2mOUDpaEmFJ2dgMF7RwXxJHKrW1DJHJLSm2hh07AXT8QDz7BPypxl2+fXKlg?=
 =?us-ascii?Q?GzXNawdMYDQtapcW3WULTMdFshvtsPdh6U3epS7rGpWfLh/iRCAUXUjPYq2C?=
 =?us-ascii?Q?JkI8UwjFbXavrShyQxIjRTJY6D+75NuoPt+iYuw9i0gh794QFM+CLtqoGTgH?=
 =?us-ascii?Q?Z4EuMvnZBy+gCNpIgCSgGPpR3L8f4gYbhWzsgOAE43V4p2PaMer4EDEcthvI?=
 =?us-ascii?Q?OSMoLfFsMfMkIgIz3SWBAI+B1ZWaO3huHGDMRV+e7KpWzYZJFdEv9K280799?=
 =?us-ascii?Q?zw52PStgeb7vdw36QP30RMfAZ+ElJcEl/kivyZjCk91ledGuEGnDLFmcGt1Z?=
 =?us-ascii?Q?LghyyKDAwIBSP6noZTsR8mPi14eaKuRUHZeSY+0MWzHoXvxUE2oTRQmN69Lp?=
 =?us-ascii?Q?/yEYhzB/3SRoHoAq+WWAYLwgY5mqGve+oKQ/msdnPEazF7v8W7D3CR7irtX7?=
 =?us-ascii?Q?D2JUE9ikG5tPNgmViynHIdObJvBPcLvwXxy+L4bXow7YOp1xH9HrgDV0tGtb?=
 =?us-ascii?Q?phgRQHk3dKSiSo0NFhZ4QttOkjE94NMFGfhCVoKtmMsh6kYB1aAJX1uP5Qlw?=
 =?us-ascii?Q?3TEi7jonuKUAJuhvC087g+WZ7EbTBLFb3fR+9/Gm2RtdebbbWMF+roj17T5R?=
 =?us-ascii?Q?F1rIhMt8s4RH2ACc9lCQTchprzp54UR8QwA6mepvFY0hoPNn+qTSns1z0eKM?=
 =?us-ascii?Q?eWxFfJZvugr495F4nBXOKsceIg0xqOt/8eaEkRtJujqnBwYcp2tW9NqQcbV5?=
 =?us-ascii?Q?6vAh4LBYQhB+DmuHHnmR8h+Gpu/6aw4UD5BS2DS8B77/tBUdGnrJDdKfuRva?=
 =?us-ascii?Q?UDjymcRgXrOwJQG3NEVQAacVnYIPCGK/PDJ3Z3baVksk4A+yUd1bKr3cXYTG?=
 =?us-ascii?Q?zqY0JscUXbt/otQHNaX96IlTuJw3dAeQbjFRxkUVb0DsQVVTWHL3/Rs3dgLN?=
 =?us-ascii?Q?ivEXXAGENDg/qAsd1jFOlFSjYfjVMlCKJa8Uwen8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9bacff-6259-47d1-8675-08dc9715dd5a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:58:54.5369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpVIpCjjXDVlIm0qjfF1k8lwq6znRps0pzfiyqVoTVJ+l2wEsCPdxDPuPzHnK8RaeApWDx+NDH+PR1Uy5PSTHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
X-Proofpoint-GUID: -YENWlhaloyxc9ps_eLeyRGV0B1MIcqX
X-Proofpoint-ORIG-GUID: -YENWlhaloyxc9ps_eLeyRGV0B1MIcqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_16,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=657 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406280013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 01:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201217

From: Sakib Sajal <sakib.sajal@windriver.com>

python2 has been deprecated, use python3 instead.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...plot.py-Ask-for-python3-specifically.patch | 35 +++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
new file mode 100644
index 0000000000..e2305a1111
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
@@ -0,0 +1,35 @@
+From 6f4769e6e2c5cdc1262891470995e6dead937c7a Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Mon, 26 Jun 2023 17:57:36 -0400
+Subject: [PATCH] bno_plot.py, btt_plot.py: Ask for python3 specifically
+
+python2 is deprecated, use python3.
+
+Upstream-Status: Denied [https://www.spinics.net/lists/linux-btrace/msg01364.html]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ btt/bno_plot.py | 2 +-
+ btt/btt_plot.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/btt/bno_plot.py b/btt/bno_plot.py
+index 3aa4e19..d7d7159 100644
+--- a/btt/bno_plot.py
++++ b/btt/bno_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt blkno plotting interface
+ #
+diff --git a/btt/btt_plot.py b/btt/btt_plot.py
+index 40bc71f..8620d31 100755
+--- a/btt/btt_plot.py
++++ b/btt/btt_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt_plot.py: Generate matplotlib plots for BTT generate data files
+ #
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index d4f5bac84f..8fc30d74fd 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,9 @@ SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https"
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https \
+           file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


