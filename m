Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F51C369D1
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 04:05:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3042.1745121949692612426
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Apr 2025 21:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6205c0d41f=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K45cBa012818
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8rqsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrWiUmQ2jgjk3qPOOZOpexvFXU76B/R4mI5hMxopmHL+MspIvjXfI4sML5LV9q9NCgJBNF/3l5Dwn6ExlDqfB2sxWcOeT7fDEK+JMTzSsjTrKtdpDhRS6kQL3IOFM/SAiADVBegdellwqP6Rwtm+r4yCnEm7dTbrkY2C2q8/CeHfaJvTer6JmAOQroRl5jTmYlPT8Gb3xBUAn43QZ/Pwl4dh7pQFDF3R//M08vz0OrJwO18GB8BFTKNdff8qbg4B1ayAAPwikFoZEFFXISA74fJpX1XVVk5cjdhR7Y8jV+fd2vpyT9P3rAEHaF2HE/+xWKMXZPOW30Gxc09momsHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7w/pe9MhG2x891uRxeOcSuhQFjAatoOP9Sn39jt71M=;
 b=uJXP/N/9N1WLuJfiV4CxBKFsC/RsERi/SxnPEi1YukmBkH8YMfTHboOOoN9J8sovVchj9U9oM60VxKLToRl4i473pi4ZGmI20zoqZKnBR8kz1MKpH3Ovl20luFxF3mbpH9qVx/0b6Rike5G9L1EdJ1yrULa8O3VEpDip1Vi1AJZwwGCd9oLL90DiCXrpNh8MTRY2oC8PwTltLMJ4qaT7YANzyYLbLPailQlRrd3mImVIM/72jJlyNStmRQY6BlOcgtvrloehHsiI4x3kJN7VddaS4d/BPGTl39iJe67TxPpVKShU9+ilaDlr//I5iMJE7lRbmtXGh0qo4bho1iCyNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9424.namprd11.prod.outlook.com (2603:10b6:208:583::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Sun, 20 Apr
 2025 04:05:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.031; Sun, 20 Apr 2025
 04:05:44 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V4 1/5] classes/recipes: remove unnecessary qemu inherit and use qemuwrapper-cross
Date: Sun, 20 Apr 2025 12:05:24 +0800
Message-Id: <20250420040528.4012613-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: e6491802-b6d8-4299-a271-08dd7fc09f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S+JOwfYtfqsaXgc2NsVovVA17dNYjqVJjeO5so8/fWkGYH3Hl8GS1w7EgVFB?=
 =?us-ascii?Q?I9nWbO96HZuVXXeN3bDJ9kvVM/3zc7pP4GdvMDcH9TXjPjsCbN/gLge6ekUX?=
 =?us-ascii?Q?He4A723Y0J1+n0lw0IrVXhK/F6vqOHYG9cOXKFS10eOwnbn2c9KIKF4eUcLG?=
 =?us-ascii?Q?UGSicBvCIJcyRa7FPfp48GtvQpAD/E99fquL/NQTrFYAKI8zVfJ4s5EcoBWW?=
 =?us-ascii?Q?m+/DQ/guYvyPutcs6qY748QHCpvcPGox4vq/2tw5MwRaWCB57lcFBBcrzxb5?=
 =?us-ascii?Q?mtBXLIalhGfVSo6hB+41p5NEloWHnnHLLeQPtpFDiX5Umgs18y/scq6GH+wH?=
 =?us-ascii?Q?Cvp9v396RhOMR4CGq4CB6F1NTNNycQZzJ9S/k4ZtwGZiVzQr1ipKAESDs0qK?=
 =?us-ascii?Q?E0e3St0BSrBnZTVZKMRp61I+e98HITGe+Q6F4feC3EToZVqmWx7JXiRs1phl?=
 =?us-ascii?Q?zrzPq8SXNodQ+2IwhNi6FgjbAhBRy9PdQBMlmxaHtgoFhbrT/lcRYXQG6jps?=
 =?us-ascii?Q?Wa22FLlPASzMimPEYj8I/C7XcSWqyD9ZdFb7ljw7dQPIh/xG20JtFX8obRjQ?=
 =?us-ascii?Q?QeFFRajYn2sDrWEdUagNbncAZY/SErj9Ar1slFjJKG2KhT5OQCrlxo3s7nbR?=
 =?us-ascii?Q?yh9cdHF+VFsVrx9tjTiwuATH83cndCoAZ53BeZtYVd3bAZ96Bo/lIx4vDsw4?=
 =?us-ascii?Q?+5c3UvHpSoUoM5xj4OxBVlsfL4dVfZkDkhWwsbeixb+fpNXAMzDSn0iPpOo8?=
 =?us-ascii?Q?EZykQBBQ7d02AMHRcoyT1DBqLGhwHX4vuFrS8nUjBh/NmMeIDg/M3lThrcw3?=
 =?us-ascii?Q?scdtzK1DIq/zoQNHe8lq7XtlTMnaygTO+OwHpc+7IiNg9WR+JZzhZHkm52XL?=
 =?us-ascii?Q?uBYWepPWzASF6wP9ERniTQjYugfSqHKWM6/LOrlMLt0wcXRD/bpSQsKjWmrW?=
 =?us-ascii?Q?IrL4JOfkzxvggexmd7ZxJvHwe+tVPsZySo+TfVCtcNNut7hSXuQHyI7v4a1P?=
 =?us-ascii?Q?vrjaT1cLhohN23Es2yYVtfDB+6WJAc3EG8VwzNQ9NoyYUZrsKk1FOStAQpuQ?=
 =?us-ascii?Q?2Alxd+6wua2DNLjv/5Zvu3ueCSwo198aOOckDwARcXR97HEuS/KdyazLyMES?=
 =?us-ascii?Q?/Q7lpRURoqmZZ7By5r+QboKeFG1S88c7FJucTkl1Vr/sHErTutIhxOKQp5Nh?=
 =?us-ascii?Q?O5cFuscx5zd2eihQq4w9ntyhol4jNa29m5IaNmePlniRaiHg4qozH3UMcr9I?=
 =?us-ascii?Q?BAEBU2gPpqwINX45xHXqkXmbF0Hsapw8w4Gwci2Wtm7zrLlfyLQ6Xzw5gJzI?=
 =?us-ascii?Q?fstGGk5j23aYqPuiZvd8n28gSiAYLrYgM65hKhiAXYjngJf/IzCLVWF50SPo?=
 =?us-ascii?Q?7hULE/DY/yke4EDIstAhxPwmcokPLoduOfOseDiwmr14SyxiUDh32YikLsW7?=
 =?us-ascii?Q?+DsZbziG7AzWd6Kmt5odbE04ESsOSr2nPSXsljUWTd55/CM7gztezZUhXeYp?=
 =?us-ascii?Q?g3UAGl/jirMUp+I=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0utQwNx7fm9l8Xp/ix3x3+gFcAUs7qXS4AACOubZ9Puq11Nd3Ubq47rup4v6?=
 =?us-ascii?Q?2RxRyWQ5RM2wNfUol8LFaBbBaNfqQuDOwjY8cinBDuvzeUklqkNKlUlH3bAB?=
 =?us-ascii?Q?rC2mWF84l5301asTVQY+dR0rNq3NqUgxhIKnY4PVU2VqcyD6LSF7LpUJEKI4?=
 =?us-ascii?Q?NXMvuwt7k40btdSW+DZlfzOd3Ia+Zl2ylXWpxSZj72bFvG/1vC58cqzCJlmH?=
 =?us-ascii?Q?LFk6s00ilY9yttCfl9nBo5u9HtHN2Jo34+m2iZl5OvSJU0iIAX+JVXDKm+U+?=
 =?us-ascii?Q?sg7d4keVgwee56K5vNp7ooNmPs3mfVTqz5w4WzEiwPF4QbuBisqh52CdvzVY?=
 =?us-ascii?Q?9Z+3kTJlSRgseyuxXAFb0GjNEWKVWZHmLDD6dp34nDOJu/CfaRcaeunCBLO0?=
 =?us-ascii?Q?2DOJzG9fgblI8ycnfNIZ0ym3MAv8l4PMoKJF3xXOHdyT4V9ygwMumsbt9eYr?=
 =?us-ascii?Q?csswubE+B1DMLMSkusx/I+pmovMVk0wF8U8u+vAxmr+HmxZmYcBd6wsvNCLV?=
 =?us-ascii?Q?dDN8AAFP2Wl4pLWGOnrQXvb9fW27/jnaXKUSpPFT8SN1LQa/43q7GJ3v/Gxl?=
 =?us-ascii?Q?XhXCeABnXT/xvmhLLfAQXhNVFTVpSzMisLbqJnT/68URNeL0w3Yo+XSCExK0?=
 =?us-ascii?Q?/45nRq5OxRx71YBQIsoSm0yCwcr2a7Ee/tVUzQ1UyiT6p1jiOhDz8qNEH/kx?=
 =?us-ascii?Q?KHBkSDmSbPvoU65ukvbY3anIr3JelAGycbArs4IBze+bd4hr3vt5u7vdGMhe?=
 =?us-ascii?Q?gHGrTaIHJZeOQudd1OLXKAJ0s2gNQTeo3fVc54N/8fYZxQopMnPOfZz8gKFn?=
 =?us-ascii?Q?jN3ZFP7wSG3jMB1z18Q2xgvFvUcx+JpvVrr6JdTdiLiVjLwJIoskcV7luO8C?=
 =?us-ascii?Q?bJdVipFbkj4+YvHu+Q2ipoRpkoal/C5fyPUot//VyDEZs+F33aTvSL0pMiF/?=
 =?us-ascii?Q?BYyk1vkJZf1En9mJxVwiJHnb7nWuSNjDV0ec17obsSAwnQ/hhST2b5UA+R4b?=
 =?us-ascii?Q?rpvje1m8/yjOSkuTRGXj6UgePvWSjHIRs2nYKgTGgO7IvyhgMuLbwEpGJn3f?=
 =?us-ascii?Q?9xWi2QedsR83fXHfMOw/721g60LmI6YXN4IXyFAuNlzczkg/+El4/kKZiopM?=
 =?us-ascii?Q?zZE+kHdBe0r3Kb1CkTdIUye8KL+eI/c8K9L5rokx8zwE2Oj6qDagPF42ekdg?=
 =?us-ascii?Q?Ie12mUdt/dBxfiLmazsuS4PYtIIfDWGU60lJVApJFNKaD5AlHoXUop1nf+z0?=
 =?us-ascii?Q?0dJeqUVNfY76fdLx78OE48il2E9vqGudbeTfNj8XrwsCyyY/9Pxx+7mZV/ZB?=
 =?us-ascii?Q?xe7EktwaXJjGdVIjQTjbJAuZEXuVQfSUTGdiM6zrPCjE11OLmKm+yZSM4kDh?=
 =?us-ascii?Q?Voe+QKLAKkdwtWJFK2EfgN3fC8TBLoYB4SC8P6OaoRibg6csL6oCfYrRQ9+8?=
 =?us-ascii?Q?2aKQrouEHAZJ5kkcivJA8NdRRsN+7ajwAoGAD9AHle9PaBg8tOA4QEM/kadm?=
 =?us-ascii?Q?GsNS09jdZIcsXbSyDu++3y5eEAqbqQ/rZi2IdMALFBViBpZeASF0QUT4PpyA?=
 =?us-ascii?Q?ZG8NlAoqOBJb1YJyET8tDcOo/X7mYtcCKZ7TY6Nc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6491802-b6d8-4299-a271-08dd7fc09f64
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 04:05:44.3478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGpHK7/SDLuAZXNj2AitCGoBxOlrqj7KpiC5tErYc+muJm+adC+/mXAxolGKwJ6+KmT8egm9mIbEsWx+ZOcN3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9424
X-Proofpoint-ORIG-GUID: 3GEfCDAWY-lnLbDUN-1_l-fmmteLEPkK
X-Proofpoint-GUID: 3GEfCDAWY-lnLbDUN-1_l-fmmteLEPkK
X-Authority-Analysis: v=2.4 cv=TJ9FS0la c=1 sm=1 tr=0 ts=6804729c cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=WEx28BAWv0HXPgO7D68A:9 a=QMWXZvJJMeQF5stC:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504200031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215145

From: Chen Qi <Qi.Chen@windriver.com>

These classes/recipes inherit qemu.bbclass but do not use anything from it.
What they use is qemuwrapper-cross, which is needed at do_rootfs time and
needs to be pulled-in by PACKAGE_WRITE_DEPS.

Also, in meta/conf/layer.conf, exclude qemuwrapper-cross deps for all arch
recipes that depend on it. This it ensure allarch recipes have the same
signature across different machines.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/fontcache.bbclass           | 3 +--
 meta/classes-recipe/gio-module-cache.bbclass    | 3 +--
 meta/classes-recipe/gtk-immodules-cache.bbclass | 4 +---
 meta/classes-recipe/manpages.bbclass            | 2 +-
 meta/classes-recipe/pixbufcache.bbclass         | 5 +----
 meta/conf/layer.conf                            | 3 +++
 meta/recipes-core/systemd/systemd_257.5.bb      | 5 +++--
 meta/recipes-core/udev/eudev_3.2.14.bb          | 4 ++--
 8 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/fontcache.bbclass
index 6f4978369d..deadcd2fbb 100644
--- a/meta/classes-recipe/fontcache.bbclass
+++ b/meta/classes-recipe/fontcache.bbclass
@@ -9,8 +9,7 @@
 # packages.
 #
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-inherit qemu
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 
 FONT_PACKAGES ??= "${PN}"
 FONT_PACKAGES:class-native = ""
diff --git a/meta/classes-recipe/gio-module-cache.bbclass b/meta/classes-recipe/gio-module-cache.bbclass
index d12e03c4a0..3714678c7c 100644
--- a/meta/classes-recipe/gio-module-cache.bbclass
+++ b/meta/classes-recipe/gio-module-cache.bbclass
@@ -4,8 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-inherit qemu
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 
 GIO_MODULE_PACKAGES ??= "${PN}"
 
diff --git a/meta/classes-recipe/gtk-immodules-cache.bbclass b/meta/classes-recipe/gtk-immodules-cache.bbclass
index 8fbe1dd1fb..585838c105 100644
--- a/meta/classes-recipe/gtk-immodules-cache.bbclass
+++ b/meta/classes-recipe/gtk-immodules-cache.bbclass
@@ -8,9 +8,7 @@
 #
 # Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to update the inputmethod modules
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-
-inherit qemu
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 
 GTKIMMODULES_PACKAGES ?= "${PN}"
 
diff --git a/meta/classes-recipe/manpages.bbclass b/meta/classes-recipe/manpages.bbclass
index e9ca2f895b..f3d034b046 100644
--- a/meta/classes-recipe/manpages.bbclass
+++ b/meta/classes-recipe/manpages.bbclass
@@ -10,7 +10,7 @@
 # by default.
 PACKAGECONFIG:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'manpages', '', d)}"
 
-inherit qemu
+PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'qemuwrapper-cross', '', d)}"
 
 # usually manual files are packaged to ${PN}-doc except man-pages
 MAN_PKG ?= "${PN}-doc"
diff --git a/meta/classes-recipe/pixbufcache.bbclass b/meta/classes-recipe/pixbufcache.bbclass
index 107e38885e..c32673df55 100644
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
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross gdk-pixbuf-native"
 
 pixbufcache_common() {
 if [ "x$D" != "x" ]; then
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 6a70cb63a5..e19431e724 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -89,6 +89,9 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   adwaita-icon-theme->gdk-pixbuf \
   adwaita-icon-theme->gtk+3 \
   run-postinsts->util-linux \
+  cantarell-fonts->qemuwrapper-cross \
+  liberation-fonts->qemuwrapper-cross \
+  ttf-bitstream-vera->qemuwrapper-cross \
 "
 
 # Avoid adding bison-native to the sysroot without a specific
diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.5.bb
index bd57f1f5a5..1379b21889 100644
--- a/meta/recipes-core/systemd/systemd_257.5.bb
+++ b/meta/recipes-core/systemd/systemd_257.5.bb
@@ -8,7 +8,7 @@ DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check mime
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives systemd gettext bash-completion manpages features_check mime
 
 # unmerged-usr support is deprecated upstream, taints the system and will be
 # removed in the near future. Fail the build if it is not enabled.
@@ -932,7 +932,8 @@ pkg_prerm:${PN}:libc-glibc () {
 	fi
 }
 
-PACKAGE_WRITE_DEPS += "qemu-native"
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
+
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} \
diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index b3e7d092c5..a2d222e655 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc192
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 
-inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases
+inherit autotools update-rc.d pkgconfig features_check manpages github-releases
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -77,7 +77,7 @@ RDEPENDS:${PN} += "kmod"
 RPROVIDES:${PN} = "hotplug udev"
 RPROVIDES:${PN}-hwdb += "udev-hwdb"
 
-PACKAGE_WRITE_DEPS += "qemu-native"
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 pkg_postinst:${PN}-hwdb () {
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
-- 
2.34.1


