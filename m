Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50462E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:15:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1590.1733940933565334805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2075040ffa=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8PnlT024536
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 10:15:33 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx1u4j46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 10:15:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Li67HdpZ+JJpgY6QfcuMSs6cD6pKpXd2Fz8x5Eyb5K9DYraQAQoLM8gsp0JNhb0E7naesd0vTTg4qMCov0eupszn09BQiOpeHg6twdd+9QHBM68hKtua5Wi/+/8psbCamPHJtl4g4U1N/kMU+zhTtXK8lCK+6Tg4FrjXynVVtSaH/2iL9/O9IWjfQ1ZW8QKg+qtRkNKvo44mvXQKZPUUiGl7eybRlkcliFxCxxqXJLFyiPwM5G04IdjiV2VYJ2d9UPLhlD8ynsltiIzq9YiOFtWt7WrQL2PRf7x98PxZbqxl5GJtbQvSZKXxhTDcpHAOUF1YRYIDFZnHeKRO2B1bSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqm8wC+89k+7m0H3CPJwrAEiPAon5oVxLjpNfMzqvbQ=;
 b=ilKd3TdmMZqHqTKLMQo2HkMkH8mklrKyesLtkJQquZcUH6GGR7NHsmxzUPZA67VoTWbuGD5MJMYbx/axSwe/ft4yfNBFXP/7LcKOmrpgs5dRnbBYIiZOTgkLblEAZ1zdvusIQMey1/tg+ikOCxz9qqgCWEIK0Nh9Dz+ncscQc3aRp/orVfpKvgh8HD7N5mbVkaqwc9IXKWcLOoBrrJZBi5STZFrEu8RWUrMWxWm4CJQingbt2YlFLko63V4yEcg3CFH8sdx9G0y3Oh5o3rFIqQZHPMI4nlUwYes+8RAEpHOirLYXsLieTQE40S6CDJG2S+qJKb0V6aSdVAesT2m/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS7PR11MB8806.namprd11.prod.outlook.com (2603:10b6:8:253::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Wed, 11 Dec 2024 18:15:28 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 18:15:27 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [styhead][PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
Date: Wed, 11 Dec 2024 10:15:12 -0800
Message-ID: <20241211181512.1729235-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0263.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::28) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS7PR11MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: becf8daf-36b1-43a9-ea29-08dd1a0fc9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1aefvBR8Qa57SGh9OsVRJfHIY70akZYrBkrERh32aXp1XjjROEplTKQeKV97?=
 =?us-ascii?Q?gbc/iJ63z9z+i+u9bpkbaV8c/Hfm0nG1/g2hPO/u9usBZhelfnuVdADB4/x0?=
 =?us-ascii?Q?wf+KQVnHMnYR2MFKbkr2YB9m/SSvHrGt2YMxJA0Mf7gXhDCTpOUknmFsgjtf?=
 =?us-ascii?Q?zDkhDrI+AZ0ROkySTwiBN3G/a6yXZytPOG02qpRUJmc/2jihbkXSp8TDAm2K?=
 =?us-ascii?Q?cLauWLxt+CqeIZs2zFNg2hdgzAb0ObYsiHXyqQ8fT3o7ADMz8sh0rKbgbh4S?=
 =?us-ascii?Q?RkU7P8GnFHtjGfAix0Om0Js0Hc+LqerBBQubaLu0CpNaEmP0uN1K5XoiiRUC?=
 =?us-ascii?Q?lp84vDZbNhyPjMtiT8hGNdJ6v7IbRbiIhNc10uKdAbWHs0FhHpMH6G1ZKAqJ?=
 =?us-ascii?Q?RY5lkEoWNG4+01m9RIav3DQKihJqFGXef6tYwm/6BDnzt00PWzeGb/qnM1fQ?=
 =?us-ascii?Q?RrtGBeHh0L+xi4bfmjf2BRCL5p4WVx0Wul/UOWIp7i/kPB43PGf6KQgaGGKO?=
 =?us-ascii?Q?SFZlqxBCX3uBwmtpccIbdxqq37Q9kwJDr+h+xq7Urw67m6veWrBB7OGXd2Dv?=
 =?us-ascii?Q?abgNzT6oWnFSUPKPxTgfqQDSEHEp55wG40bZWsQIamvuXJTOkIjpaQKr4ymG?=
 =?us-ascii?Q?7VdbXTNTFWYDR/tG9TP5vXoookFnxy033LTPayOLrQ9eprVTcsNAzlhAIj44?=
 =?us-ascii?Q?aUazsjXcEX50roO3kWJZ+VXXG9qabJ7oaB3v8mWe8+O8DxTMPDAKPc2lVy1q?=
 =?us-ascii?Q?72dwjy55oWo6Na7TkuBPMfvz3RTaz4NI+KJ6Bkw176+KnYGyrqYREPj3Iib1?=
 =?us-ascii?Q?zRxg6vmWvZm+v3ZSL5/3et1yk4K2AY6Cbh4EI0katTRNW5B+dCURMaDBwG9H?=
 =?us-ascii?Q?LSckiUj/to6bSnYPyYRs6mGa+bxHQ3vCIfCPJXvBSv9sIMfKJ/aJMGZq5Xju?=
 =?us-ascii?Q?Yf7XfO6ILExYbOmX+m7XgszGd0q+6SDwpY+gedILO+NI1NXvtgjslfiRrmB9?=
 =?us-ascii?Q?xbxLa+fljdy6+Oz9pL6UMLTBLzoxV/Q+O1rtwxu4E/V1AKf8emWdhlqcoAHw?=
 =?us-ascii?Q?cRruuZlzeNfYdIYqIBMmeimvxuMv9DBOCsiKRfZy0D/yQoaZYhKYSlQYGwC0?=
 =?us-ascii?Q?kyCK+ynPCCW3QHpwS9x1JjY3SCWOt5G6O3m/sdEdHH/tSdAlV7PclqzCF/6W?=
 =?us-ascii?Q?zVplk2grPMfSvr/OGh/5LFhmHe6DLKVOzX8Pty8+7FzdZi0N5d9ZPXu0xK/M?=
 =?us-ascii?Q?KTIXM6Yr/1I7MIS1wwosnRJKhyvQvEoHuxTgDb8sQOQLpFOTXBmQfggKzOpV?=
 =?us-ascii?Q?h/1wFtYV8rCGuuzY0pi4lAOk5n2UYoYvWeK3HKbVoglZHwu66kRiE6k4gc/V?=
 =?us-ascii?Q?jOe9DjY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cnQ6mdFc2+HfR4miK4jKC2YTk1Qet1Gi/Adzl2YQhi4Brr3CNmvJVMGju97y?=
 =?us-ascii?Q?rnsbAr54aNMBSvxbE20Bi/jt+fdDtCm7LrmiQZjRpUEf53vahhi0a+LJ4clM?=
 =?us-ascii?Q?8das+wRdU/t6Ub26wxW88O6PFyHFo47pOa2KO1aPG+6vSjzdSpMy4rmifZfI?=
 =?us-ascii?Q?YppZjcBghsUNFx4iVmajQJD9SUsxLDLkcw4LhNSjPX73MWhGq/Ef8MBcFwh6?=
 =?us-ascii?Q?lWjwli57mq9/a9tXM6xSflAMtXcgGnOj2gCjkpX6b98vy4Noyz2o7TGN09rM?=
 =?us-ascii?Q?QGTbk3TEfNRwY/pyK8vZV+rNHNdB1ckcx9qqnCzOem6/yIydBxrgDq5Ss0zs?=
 =?us-ascii?Q?ts4hce2io5A0DFsDtYeqt6gDqyUCZWJJCSD1kZ7whwJuXDqkmnJ/VEbqsXsL?=
 =?us-ascii?Q?grqF/I+b7r/4FDhI0+zM7IHOucEkYwVnihJqoNNSGqUX+9767gx2wejqX4Cm?=
 =?us-ascii?Q?ViSOoHhCjiKE5wNu7VKKZM9zz1urHqZrFJbkawKZ3AHs5pMNcybrWXXBjFTK?=
 =?us-ascii?Q?jrdJ3MlWMBRK8z/bazxBGPSjtP0892jxTQixwODRGdBz7Zohk9CGjxCNHzJl?=
 =?us-ascii?Q?u0wHmamPjD9wL/gL1zX8rmQuGPQL1EVCVXzdkE69+z41LpcHFuiDbGeItzQN?=
 =?us-ascii?Q?joIg6pqSsqaJTEsO8HWGq18KvhQiyBwQLpfvNWErf9OG0eZgTtm4JCFV7DcJ?=
 =?us-ascii?Q?IKezYZvaLE+zv6A/IB+ckW+IytySe/65GnrdcB4zZLx+yGHw7qXlR7gST6tC?=
 =?us-ascii?Q?z+l5N3GmTDvHjdE0wcRxiXd4ChsSnifBKMLh6JWmbIuPie6G0Zmk1bjJxCh4?=
 =?us-ascii?Q?Qn9o4/5aymHsGRgDOwXjzFDw9Eap71ain/bcApVmILJhS79NdNx4RTjpP5Ln?=
 =?us-ascii?Q?4ZRjgeSHdiDmxRZLiWS4EkA3eKcaa3TyzMKZzcvCaW3N0hVzTWPo6sr4SV2D?=
 =?us-ascii?Q?wl/ZlfwqLVimTuolbAOlaurZXS3IrNxyw/nksUIALebuuFgYOpVk2x+SCxdu?=
 =?us-ascii?Q?DW5a5qfoXAeWvxjDaSwOfz2NVxAl/+dqzTckTIiZfq2Zm/+Z0B4mPkFfFn4y?=
 =?us-ascii?Q?b+NLjdoxfR+l/tlIhg94v7dX4vC6J6l9iXAk5kmz0Rj20VbrvjyD9KAu1l71?=
 =?us-ascii?Q?oPdO81lIOd2oDw9TTHFDvaAKBMo3TyRp1AIERTK6DAhMOhN66Wgm11crrvcD?=
 =?us-ascii?Q?6YCMZsF9ybISJErmkfAKmwaswc07TbfUQApPQ+4lmqVCI1AhGeiKlkn+ef5/?=
 =?us-ascii?Q?v64LoSipKbl4orkulACcBw18Vy5jRNYxF9tJCq3KlXlSvJAmGktkXvSJ99+3?=
 =?us-ascii?Q?+vv+rR0g6h42mOn6hRWT9Z/YJRIzu47Zy5kE5t9AbfM5T/tedJdlVvVUjHKR?=
 =?us-ascii?Q?Akj7IEZkCtco/Ym5gJ0FGIspH01GHK0rA7k6v5tUsuw/ZJUEonzSFW5it45z?=
 =?us-ascii?Q?jOhwbzA9E5ixtqYx/ntvm5mUIuZUZgeYJo6chfBXoyIgygLRbueip96XQRj/?=
 =?us-ascii?Q?8u9ehjg1wq7+GmWEmyYNgNkHfeW3kFkFKbO2p7QHGgullMgUdEiapX4ltEmU?=
 =?us-ascii?Q?84pG1VdAKFrns9eBSwbQWeKHp5TF+KoWARTUoE03YlkSsCequxzj5NRUZ51y?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: becf8daf-36b1-43a9-ea29-08dd1a0fc9ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 18:15:27.0937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5XxTtbRb656lBjLZbqAHxmd049DmH/F+h3RJgpGSuLdHGZP4qMmTHMKhn1PhQKbOGFTZDECACl9/dbM1ZINlnpvk9sZ4hHjoLhQ+LahZ40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8806
X-Authority-Analysis: v=2.4 cv=H/shw/Yi c=1 sm=1 tr=0 ts=6759d6c4 cx=c_pps a=2/f09Pi2ycfuKzF0xiDRrg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=hFgfYRswjOba8Sqq2acA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: MvUmX0YtHxEelnLPt1ALEn_Bguwkzp59
X-Proofpoint-GUID: MvUmX0YtHxEelnLPt1ALEn_Bguwkzp59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_11,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412110131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208606

From: Sunil Dora <sunilkumar.dora@windriver.com>

This commit updates the warning to use a check for "trivially constructible" instead of
"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
to types that can be copied trivially, whereas "trivially constructible" is the correct check
for types that can be trivially default-constructed.

This change ensures the warning is more accurate and aligns with the proper type traits.

LLVM accepted a similar fix:
https://github.com/llvm/llvm-project/issues/47355

PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]

Signed-off-by: Marek Polacek <polacek@redhat.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 114 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
index e90b5b4c2a..932a27995b 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -68,6 +68,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+	   file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
new file mode 100644
index 0000000000..c9bc863eea
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
@@ -0,0 +1,114 @@
+From 05106fea707f010779369c5d6e89787953d2976f Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Wed, 11 Dec 2024 10:04:56 -0800
+Subject: [PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
+
+This commit updates the warning to use a check for "trivially constructible" instead of
+"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
+to types that can be copied trivially, whereas "trivially constructible" is the correct check
+for types that can be trivially default-constructed.
+
+This change ensures the warning is more accurate and aligns with the proper type traits.
+
+LLVM accepted a similar fix:
+https://github.com/llvm/llvm-project/issues/47355
+
+PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]
+
+Upstream-Status: Backport [https://gcc.gnu.org/g:6ac4e2f4b2ca9980670e7d3815a9140730df1005]
+
+Signed-off-by: Marek Polacek <polacek@redhat.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ gcc/cp/parser.cc                              |  8 ++-
+ .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++++
+ 2 files changed, 62 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+
+diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
+index 7e81c1010..8206489a2 100644
+--- a/gcc/cp/parser.cc
++++ b/gcc/cp/parser.cc
+@@ -14301,11 +14301,13 @@ warn_for_range_copy (tree decl, tree expr)
+   else if (!CP_TYPE_CONST_P (type))
+     return;
+ 
+-  /* Since small trivially copyable types are cheap to copy, we suppress the
+-     warning for them.  64B is a common size of a cache line.  */
++  /* Since small trivially constructible types are cheap to construct, we 
++     suppress the warning for them.  64B is a common size of a cache line.  */
++  tree vec = make_tree_vec (1);
++  TREE_VEC_ELT (vec, 0) = TREE_TYPE (expr);
+   if (TREE_CODE (TYPE_SIZE_UNIT (type)) != INTEGER_CST
+       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <= 64
+-	  && trivially_copyable_p (type)))
++	  && is_trivially_xible (INIT_EXPR, type, vec)))
+     return;
+ 
+   /* If we can initialize a reference directly, suggest that to avoid the
+diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+new file mode 100644
+index 000000000..3d9d0c908
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+@@ -0,0 +1,57 @@
++// PR c++/116731
++// { dg-do compile { target c++11 } }
++// { dg-options "-Wrange-loop-construct" }
++
++void
++f0 ()
++{
++  struct S {
++    char a[64];
++    S& operator=(const S&) { return *this; };
++  };
++
++  S arr[8];
++  for (const auto r : arr)
++    (void) r;
++}
++
++void
++f1 ()
++{
++  struct S {
++    char a[65];
++    S& operator=(const S&) { return *this; };
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
++
++void
++f2 ()
++{
++  struct S {
++    char a[64];
++    S& operator=(const S&) { return *this; };
++    ~S() { }
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
++
++void
++f3 ()
++{
++  struct S {
++    char a[65];
++    S& operator=(const S&) { return *this; };
++    ~S() { }
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
+-- 
+2.43.0
+
-- 
2.43.0


