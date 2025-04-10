Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC12FC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 04:08:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26670.1744258118916286605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 21:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A3mq72030775
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Apr 2025 21:08:38 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m5w52-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 21:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5n+wkkpBF0Hcj8SAMnEL5O9+tE2bBGOLEFzY4CQGFqRg3VGkSO9S3hjG4NeOTdT58uYgRgXrdXqveaDEd5IItYrJBA1bFVbYUZMaIZG6dQE2YU22z9L9sduOuW5KEtPCXZejtp0du4FYqX+xdwiAn6zGXmyOcFXcC4aUPxTFAnb/qPcF/SFwEqIu6RAXfZLqONZCVihboBmG2ElceQz38E7R2GEt2qGL5DY/37e8h/3cb4qzsBgrNcU2ef5QFXmQ3p23NXc1czqJpfbpsI6ZR5kRRGa3RKz8wrIgfb0IoatmO7/d24a+1BiWF91QVP49rSpouAoCy+G/PcL2vBRuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmJHWC1wi2eFq+NEIKbGpiMpAESG5OHxAuVxEGXul4s=;
 b=NpVSgADpNvSqtsEb730vvVTeVyNzLX+ffWBJvnXwXDnMSbKeVVUsVwkvoeOKXLv4bVQ9HMbo3rAk2SqxNZHJPxNrSSiSC3G86WdzqntMIb7ZGQxSJywrHdrpEellqoPM3EZ7Zpgj+4Dqd+lkZiLgBp3FQC0HhVKAcRUKUUOuWoRtpfwpMm1TQVq5YPQxvHG9OLyXexRiZWWCddgvG2eDRysAbR78TP4IomNcHT+L2tdKaty86rCbUC0lbtl/zDrRKGusw/10mevtsGyQTJzaJRwqyG2goEja6nowclzlZ4PZ/paQbzosn5m+qRb1cHvz80R/D4usGyReCn55Y9MhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 04:08:33 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 04:08:33 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] classes/recipes: remove unnecessary qemu inherit and qemu-native dependency
Date: Wed,  9 Apr 2025 21:08:24 -0700
Message-ID: <20250410040825.1283228-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:610:50::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4284f5-1ea2-4fda-12ff-08dd77e55bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PdN9pQzQm4RMnkyq5W5AbpxAHGE/OP4CjF5w1efAu8wObuYnhM1aXUY0aKin?=
 =?us-ascii?Q?xUQF0+jswWqBOyXhz/VNnQqX9EQ6KzysThjmBnWivcMiS1LNpD4tMXDKEo7J?=
 =?us-ascii?Q?5MwZ7R6bJkCswSyWqLf5cFgcngPWuPLG/JIpF0Ngnvg2P7hqkL0SPrptX7WB?=
 =?us-ascii?Q?VYLVFvrySP1uhX42XrrTWdHbDQK4TfnAGw+s0GMKrJyvBMPh7l/Zx4OxVcS5?=
 =?us-ascii?Q?/AECrFttJwCsuqRglxtigKEio0DfrROJJp4OkrNOvEsi9SEtJQ61aKi7nx+s?=
 =?us-ascii?Q?U6wbw1V+5E+ixXhnhb/iJ6INQRTWdWbCA0PksxfUNXW/rCfnXCBhtwjbWHmn?=
 =?us-ascii?Q?Os8gF9VdqhbEpst3vXey13TCFRfhRxGBZmTXY9QOmqp+gAvBUECYRWWJYzwl?=
 =?us-ascii?Q?hDadHhnasIuZYgqmtTSg/4isSVaTmodmIVxkuKKWFHky0CCjxUfMbPyhJu7G?=
 =?us-ascii?Q?EeLoungnHKZ1KPPDvGT2Po0i/IP1e8z05REyEFSW0vJd8sOAVo00/Teqw/qm?=
 =?us-ascii?Q?hxwHaSWsw84/dShbP/5TTSefKLJlF8TLxb5iVrf4veiKF+oKGmCP21/SVIFT?=
 =?us-ascii?Q?NAelbV9zzptYsFFlrIjGqRx140nW68myppVboOFLOfmbgxnRQpW6FBcLllv4?=
 =?us-ascii?Q?53NnAU7zw8/BBdKZI67/2o6ocOb8dmQkAhBInVWfFR4N9QnepjkaK/b1yx2z?=
 =?us-ascii?Q?jfGhbn76vF2UHjHJr+HqRSXwfyVYOE7plgLjx6pZ4aBBJ1HYWYl8Fzzj01ye?=
 =?us-ascii?Q?ymmuTwhpAZHRZ/wHJbWlKMWX7zmeUrgrRFCSDMyiDtrSAgco2FMe70CBh+76?=
 =?us-ascii?Q?RlUMkoll56w0ES0gzo59maHKjLHbsLaUpGxRrkBYA2Lqk0XrTSv17mmsUZF0?=
 =?us-ascii?Q?BSrSWgh+DrvUdQF9m/G5/AtqhsmLeXgnTqed06/ETsLf+sc//4IDjtpKHfaP?=
 =?us-ascii?Q?pR/MIlt+ZoaaJZWWjMP3vKL9972LbjWBuUrT8yxzwYQdt2EjK0DF8eizuAuF?=
 =?us-ascii?Q?xlOwrKL+14mR7ORer1zzbbQX9kHE2UbLsEJkundhY/WQFlIofvZ0n840+blp?=
 =?us-ascii?Q?culhk/o67UgQ0jwwuvi+7b/xvVkOXerpM8tGuG7ly8sqxAEn/Ehha2LLKzDj?=
 =?us-ascii?Q?cxOvJIL7x069IQQi8tZzyE9ndQFsX6G7vwZET+LDBW0CDJe5ymBZJXNYIrUA?=
 =?us-ascii?Q?DK70JS3QZLHThcfI9rsHMpuyg4KJMPHWXFt8/FRq+lGpfXFxpG8cWvpKiFKW?=
 =?us-ascii?Q?upc4PhPepsFpZDjE9oXj1kW6SH1X347E1fTP05gxLsMldmEN3rHMa5PBhDOJ?=
 =?us-ascii?Q?j0fgJs+kH/hVKKEvavy+kS+w7iAlO7H5QzkfCrHsS2edcDhUkyX9X1gAlZH4?=
 =?us-ascii?Q?ElZgV7yvUiKfFyrYBkaNIlNMhybsg4pkQW9AM9kpGHzOnTz+MHi3hNRJbtIU?=
 =?us-ascii?Q?/GTGMKKmA4qy0FDxRArXtXAHvxxTPzd5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ezaBNokt9H1MAx4COnaQivsZToy9MMjw9v6QUKBbUY582G5VHfojuPf2tlqT?=
 =?us-ascii?Q?CVyT3KPDnVyvi/ptvjhTnKG8NUCIYM7lBrwy1jSarR2vj07WRQLRgiaWfyG6?=
 =?us-ascii?Q?UZsf2ej23Nsq7QsuB0Q4t8ZuXOfm+0+v405L20/8JuASEknLf7FkHeEZWYAQ?=
 =?us-ascii?Q?zynzTe2LX2r2Bj1pNxuo3APvl2z+vc/g8ru+QaHY2d1U0U4pfhSgqdHjd1l2?=
 =?us-ascii?Q?9rotd65tGY1ifw8C5brKJ93HWp8K0CtVoSj7MaWVG++qdFa2O5cUZmBLDCCB?=
 =?us-ascii?Q?F3jLvXIh3OBYQ5urgybyALGdBoQdFPAiIkd4Y60PyTcrMHryhxKOPBN2lGBK?=
 =?us-ascii?Q?Ht33CN6NMZTC3RD5XRiuaKAgHwWQedd411c9dFk3/gJmtM6wrndmCyVBEwuw?=
 =?us-ascii?Q?tQgZV67Q2u8SZ/E7YHf6RrPQ8YaoGAPBVhkzb/rYBmTX3ZuXozewOEqrw7X+?=
 =?us-ascii?Q?VR5hK2mG6mpfeGp6UdSIO/rAiq3/wz/4aGaVtih2jUI0eQBHuNDddjJix5uS?=
 =?us-ascii?Q?tfr1nKkUlJ5ikdj2hxAOYiInuS2eaWwyTg9xBnCA4CAYCwqnXj5RTIF5nHSi?=
 =?us-ascii?Q?6QCrxDoP5lpp2tL/uayv3V+QLVhIp5VVECNilro0URiq29gWQPSaAF06rE56?=
 =?us-ascii?Q?js9wwxlm6g4nKR3AcXne4oN+eVaAcPHDnP0YbMiGxGOc8IhPZKUv5tbfDlwH?=
 =?us-ascii?Q?Ygx3LXAUjr17V63D1CTDm+j3oKLvIfCM7JBFtrqNIs0/4xbHzS7dHj010xmq?=
 =?us-ascii?Q?V6HvmwuqWcVOVP04SVIKRFhRbjuFrneUE9ONJPh2blyElY9SzzaEpD4QyJTv?=
 =?us-ascii?Q?LEOPumHL8klhGym9KvUFi8+6p0RkfzGA8/gTxcDv63wk641Pw80TesvZBdtt?=
 =?us-ascii?Q?vgdzjiT/4XbKWjuAVRN2qvrm7X2SPp+JfAtw8T3EDn3ybCfxOZ3lY8zdDDDX?=
 =?us-ascii?Q?QBBR3DHG1dDuSvVfotBQ6IzwCT0Yhy0r7n4kmBKAM7XwVMM398lhWx9ZqQmK?=
 =?us-ascii?Q?v3LsirCRgGH8BAAlB24XogkV0ELIPkFP9TbPCIY+ULllaKvxkaC5nlkOTjHO?=
 =?us-ascii?Q?eWcSICKXPNIoixH1Wx7IWnCOx7HUxxRRiEfOUia8zMQkPGlaAOxthDKZZFZj?=
 =?us-ascii?Q?2bvXQGGugt2KFejWfcxCwZO1XIbSN5aeH6WoRR/J00th3WU3/I1lNJWMZ46/?=
 =?us-ascii?Q?MBwTffRAJ1cU9aKCbFAvmxvSu10/XgLrcfjX+ldH0hwkS2f+PUBFywh5OD3t?=
 =?us-ascii?Q?i+tAAm8JOnRykdCzuYly7rP/LD+6rbbt3DMlqbTx89t5i8tWwaJ3VPDZKvXK?=
 =?us-ascii?Q?VUtlUkjeQcZIF1sADEQfw0IBjaD/flqaIbyEP2AGdvkI268ksZFRTHXQeIaB?=
 =?us-ascii?Q?KXEDP94cDG4RhEj4sGLTQLEfqaoLJNCieMdkQmlflSgWMETu15UetApnAyqd?=
 =?us-ascii?Q?MK/aW+MBZDospw+l4ED7MRU3a6E9ugoTjTEcjgSe4nPyrSqXhu8pnYzkdoZQ?=
 =?us-ascii?Q?IGrSdwc7dvvW5z6N1JN12KuQel5/S41eV0befJ+4xOZY1gftuK2ubm8Jttc0?=
 =?us-ascii?Q?UJd3ziGK8l00l3g070atKtAsvLFqKk5o++GktyzUBCwtJ1jaA9XQcA0AHJXg?=
 =?us-ascii?Q?OA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4284f5-1ea2-4fda-12ff-08dd77e55bfa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 04:08:33.2165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBy4m5nWo8F8RyyJYxvreKKCUgqeeqiCyqENdyItWew3HMhLWD/k8PjXfMBR19xxldY3NlfDrICaLJ+tLMonrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
X-Proofpoint-GUID: cvwhHcxStLGJ1xx_lbHlMCcbnOLqHjKT
X-Proofpoint-ORIG-GUID: cvwhHcxStLGJ1xx_lbHlMCcbnOLqHjKT
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f74446 cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=C8kN1T1fmjDBIZZgf1sA:9 a=J6Dv6ctt5JGYP2we:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=970 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214616

From: Chen Qi <Qi.Chen@windriver.com>

Some classes/recipes inherit qemu.bbclass but does not actually use anything
from it. Besides, putting qemu-native in PACKAGE_WRITE_DEPS is not needed because
the process of generating package does not need qemu-native.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/fontcache.bbclass           | 3 ---
 meta/classes-recipe/gio-module-cache.bbclass    | 3 ---
 meta/classes-recipe/gtk-immodules-cache.bbclass | 4 ----
 meta/classes-recipe/manpages.bbclass            | 2 --
 meta/classes-recipe/pixbufcache.bbclass         | 5 +----
 meta/recipes-core/systemd/systemd_257.4.bb      | 3 +--
 meta/recipes-core/udev/eudev_3.2.14.bb          | 2 +-
 7 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/fontcache.bbclass
index 6f4978369d..6082af08f3 100644
--- a/meta/classes-recipe/fontcache.bbclass
+++ b/meta/classes-recipe/fontcache.bbclass
@@ -9,9 +9,6 @@
 # packages.
 #
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-inherit qemu
-
 FONT_PACKAGES ??= "${PN}"
 FONT_PACKAGES:class-native = ""
 FONT_EXTRA_RDEPENDS ?= "${MLPREFIX}fontconfig-utils"
diff --git a/meta/classes-recipe/gio-module-cache.bbclass b/meta/classes-recipe/gio-module-cache.bbclass
index d12e03c4a0..4340715b01 100644
--- a/meta/classes-recipe/gio-module-cache.bbclass
+++ b/meta/classes-recipe/gio-module-cache.bbclass
@@ -4,9 +4,6 @@
 # SPDX-License-Identifier: MIT
 #
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-inherit qemu
-
 GIO_MODULE_PACKAGES ??= "${PN}"
 
 gio_module_cache_common() {
diff --git a/meta/classes-recipe/gtk-immodules-cache.bbclass b/meta/classes-recipe/gtk-immodules-cache.bbclass
index 8fbe1dd1fb..83deb2d48a 100644
--- a/meta/classes-recipe/gtk-immodules-cache.bbclass
+++ b/meta/classes-recipe/gtk-immodules-cache.bbclass
@@ -8,10 +8,6 @@
 #
 # Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to update the inputmethod modules
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-
-inherit qemu
-
 GTKIMMODULES_PACKAGES ?= "${PN}"
 
 gtk_immodule_cache_postinst() {
diff --git a/meta/classes-recipe/manpages.bbclass b/meta/classes-recipe/manpages.bbclass
index e9ca2f895b..bdd91b8564 100644
--- a/meta/classes-recipe/manpages.bbclass
+++ b/meta/classes-recipe/manpages.bbclass
@@ -10,8 +10,6 @@
 # by default.
 PACKAGECONFIG:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'manpages', '', d)}"
 
-inherit qemu
-
 # usually manual files are packaged to ${PN}-doc except man-pages
 MAN_PKG ?= "${PN}-doc"
 
diff --git a/meta/classes-recipe/pixbufcache.bbclass b/meta/classes-recipe/pixbufcache.bbclass
index 107e38885e..66ac4ed23c 100644
--- a/meta/classes-recipe/pixbufcache.bbclass
+++ b/meta/classes-recipe/pixbufcache.bbclass
@@ -9,12 +9,9 @@
 # packages.
 #
 
-DEPENDS:append:class-target = " qemu-native"
-inherit qemu
-
 PIXBUF_PACKAGES ??= "${PN}"
 
-PACKAGE_WRITE_DEPS += "qemu-native gdk-pixbuf-native"
+PACKAGE_WRITE_DEPS += "gdk-pixbuf-native"
 
 pixbufcache_common() {
 if [ "x$D" != "x" ]; then
diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core/systemd/systemd_257.4.bb
index 24aad11c0a..4066509f7d 100644
--- a/meta/recipes-core/systemd/systemd_257.4.bb
+++ b/meta/recipes-core/systemd/systemd_257.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check mime
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives systemd gettext bash-completion manpages features_check mime
 
 # unmerged-usr support is deprecated upstream, taints the system and will be
 # removed in the near future. Fail the build if it is not enabled.
@@ -932,7 +932,6 @@ pkg_prerm:${PN}:libc-glibc () {
 	fi
 }
 
-PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} \
diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index b3e7d092c5..24551a3fc5 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc192
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 
-inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases
+inherit autotools update-rc.d pkgconfig features_check manpages github-releases
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
-- 
2.49.0


