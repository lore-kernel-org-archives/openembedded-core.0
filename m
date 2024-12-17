Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDEBE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:47:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.78697.1734432476600927833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 02:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2081375956=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH7VaJC018648
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 10:47:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43gy80k261-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 10:47:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqwM5wtHjjwXtF152JXh/izGyTecTL9H6OB+nKTftDmGszUwDjJ1s16JfQUHtFhGpNP3Il9NBi1iB1QycXKZwCaJAmLqLPFw9MjcVGICV0JC5eXMKanZiC8rCxCNpuJtBzUfzjYuISqHwdgMQ3JTE/zBKQncMqwuVsPJH6Iq40PAeXRo22WwKYbbqaSrnE/FRm3UgUT2JWkRY4K94qob9wOpFSTkLw4zxZs43GvsMQOPj5dQ/kqFJVCsb0gmRLt4s0bGC5PmpWBx7sE77/yBnWTpIGVKQ+tJnH4J8fY20a2Tmrtt52dl/M8aUKXtVRWhF0CqReBDhNwXL7m+4RM7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EZu2IGmfU/ALTfRpRwXq4U+IIJKFrO6q1BaSDe2ang=;
 b=Cuw5WsrrY9PLnHkmRCSMapRqLLAqXA62aQr3gsLWNS9EhRgnHiBBK8SHrDjlGoJyEHR11Yf5CdXvRRWiJbbwwTgQqdBlxrTQTqb//xvGILnRI7faw5fBpk5e93BJ3B2TvkLqQA4zYXDfJ46w7eqR/Z488TaIFDk1HVlymgSLtLuDQdZ+BhxAuHxAz6+hfq/S2uGPq1WxMbLVCZRy/362XyeEEZOelxLj3TiL571pcEAFMwXBsgRMh1uRKWDPQJODSXScAkrDW7rlX0rsD75j1Q/dZPfSq2XgbO76AhDfIKyqzRHsTA87DiCVPK43GB0CTaSLcQjbqMczQ+A5QWVPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 10:47:52 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 10:47:51 +0000
From: Bin Lan <bin.lan.cn@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gcc: backport patch to fix data relocation to !ENDBR: stpcpy
Date: Tue, 17 Dec 2024 18:47:29 +0800
Message-Id: <20241217104729.4115134-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0137.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::29) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e11823-5ff5-4a36-ecd9-08dd1e884126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I2Q8HLquJssJC47TX9ShXNPi9ZkLKv1sEuB/kUAFDxjyAR4ZKyrsM7P9cLH0?=
 =?us-ascii?Q?rR8RkJ036q6pYQBmH7wX2Qcf0NrnMD9XWQVecY8BA0dzp0L3bYeiel5X9aMX?=
 =?us-ascii?Q?/X8wHLwnCMjHrjwqsCpBi9eeaQVbFnkydSu/RoxxqZVk9qFYsZ7ZX5wJGtGa?=
 =?us-ascii?Q?8TOMNXM4l70Mc9C5lR5LeXrpOJTrltsq1Dv4AWrmOZ5uOcuKteL+YVSJx0r+?=
 =?us-ascii?Q?GhBt6PY+gCFkrWh7wwBgqD9AIIywDbOJlPIZFguDxh8kIwsplzM8l+Na4a0+?=
 =?us-ascii?Q?cS2iH/JqA8FHUAaluP04UoHGfeHSHgNJgiuN3d/xnoKZscv8jxy3fEZeeeCx?=
 =?us-ascii?Q?tZTKD4BTeRN/gos3RcTqBzGa9lwiAL6LuzfSvaLoi4JnteO+L7vnmkdDyK10?=
 =?us-ascii?Q?ZTnfTDyy37oLZ6oGlnxtMENzZBNxH4OWVLcixCke88uU64qFkLlMQH4RxTzb?=
 =?us-ascii?Q?lbHR0MFTKKxzRwISiOpduKzbytfofG57/amPxRZAg/Pphk97KG8tzrdl7OS2?=
 =?us-ascii?Q?DClR+1uHlQkOLONW7nkuRLaQfA/IY7s/OP0SHQmirHYM44nFhR++aTF7VCoK?=
 =?us-ascii?Q?5rZtO77pw8EJgWosfKUugmzZ7uxbHPfNVJ6zizV6Xkt6wElPnP6ZtTGqP0a2?=
 =?us-ascii?Q?JqzXQUGBHqReLFqJO+QblOvR3/vjzmxt1sSbOQdp2EcUybKi3g8pb+WmlWGy?=
 =?us-ascii?Q?Ty70LgG5f45hdjxih0xphh2ao0HbAYxS+KEnjdrb5BJ5t62rzS/yatK5dBrL?=
 =?us-ascii?Q?lZd6a00W1ox7/qubIjf3y+fEhX7BlSUUFHtXnMpoDY/Lp8aM1+tk6pDSnniU?=
 =?us-ascii?Q?+QTz3TBUl1xHA1Cr8pGCyh6/09G61EFov362EhtRQ5Dpf10jUuLvOdwNAcoa?=
 =?us-ascii?Q?VX/AjMSfATS7xrpj12T1rTR2M2bsKPjBYVLzxsIqMzsONCVtzTGMtKpVv8sK?=
 =?us-ascii?Q?snoU3yf56RST/RgYu48HY6i8UZ7ldIzo0vTtoB6JL2KOhlpUapp38RRpKEBP?=
 =?us-ascii?Q?+wv5xVfQoRtkRdS8fjbAxIS+sWn9quRb+O6m9Ny+zBvZYhODmnhtyIt/5+bk?=
 =?us-ascii?Q?DCIH/VMxZZcHnE5s0NoJJ3aba2JzL5HW6lGO+m2GZZ/+8gzBBOXOziAv8lnL?=
 =?us-ascii?Q?67PSsQfo4broqZXv76Wb/Ft+s7QL9x716e/R4cGzFgJfZ5WwAT/WI1Hk9WmV?=
 =?us-ascii?Q?EIr/TF+uY6vgrMBjiwt9ENNmWkGWDE8THfG12LyQZQPOQJFFm5T3xb/bUY4y?=
 =?us-ascii?Q?z1ecUs19W/lg4XXEYR6K4IGvKk6eUH7Sfn2ViSKQyE0HmfiO/LPm5ygfafcx?=
 =?us-ascii?Q?AefyEWodxSKnbwKvA1upNCsvMaTJcm9M+e7wxPbnQljljxnmGrTzuOpARLtK?=
 =?us-ascii?Q?PqbLTA5/t2rhxLe0pUYgDDBlXuR0yO0pJiWw1wn7q48DxcEx3g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mjtix/FjUo3wXBgUwPzoJzV9usBqjtMB/BojIulEhL5SJySf3PwJvKDUTDQD?=
 =?us-ascii?Q?ElorvHyud7GTyeiQBg2Z+vIWS9lEBWcnJIqZkcOBAdHbk/bK5OLDJdCkbFJv?=
 =?us-ascii?Q?cJ61AR4u1BuQaq4CukGEoEAP9Mln/ZfWUpIF0Ry0j5oKosePelXw+7BfchzF?=
 =?us-ascii?Q?2nf1jUc82nULxrrJ3s7VtZ4NvuJ3LhWZfkwfZC2e/KUzF7zLrYWnk7bPPUmI?=
 =?us-ascii?Q?iT69iLe98+Nf/K3SddxtmTj0NMj5pcmIJXLY7WPbpLb6W98DSf8IQnFZi4Ew?=
 =?us-ascii?Q?eMya2axj1Mm8gF8F/fQrK90L2ZBt8yqqC6L+VE965+Z2vrdRe7GTOoHZWLGW?=
 =?us-ascii?Q?vBK1ZzN7VLPhHIpnaLDBeuqNTJUZ1NO87Pn4o+hGnADdHIEpThujL7wAE9gD?=
 =?us-ascii?Q?ymblpqRhLEbRMBkxbaxQ3oudIQGZlv/Ox7kg1QTfWU7DHaz2Ga2m2tBeSMN8?=
 =?us-ascii?Q?JjmCjSwUZ7gGihpyFyWLaPWz4PrkxOlvdQKTTK+zJkyJTWLkm95Dc0lnI97/?=
 =?us-ascii?Q?5jhVJqs3KzmAo5jOfK/zoJhA32O3D3pIpllYuRSzlU18CzUkgiD0WGN0Ka9S?=
 =?us-ascii?Q?tmbAJac3jg0Kb4Ft+jueb63bYqso05qhgb8JVT9kAbYFxn1VmfT55oPldHVC?=
 =?us-ascii?Q?34q8tUq8mTnUfhcYQ297pFxCTMcma92aBDwhP4mSpWfTEXlN+vQCeEkOlRlA?=
 =?us-ascii?Q?ijVZVk2H0xCU7S+6dq14CYYemOCdUFS3BBnu6drtWFycTqdXIcFrDh7dUoIb?=
 =?us-ascii?Q?JK4H5hGaq1QJUugpV7etHORO44ms7Eep0vZFXcaVp5iXn4pn6lKypnf66u1h?=
 =?us-ascii?Q?VgTiKWTLBezh/n6KPaqJHHWPgowSYjMCvI4WLMTUUdV9sN4XtOivMvAP3W3p?=
 =?us-ascii?Q?1DRkvnsH1NRdyDZZUcpXmMqmWAt/X2v53KMrUHbbLweQcT5EoEVhDd5s8hMR?=
 =?us-ascii?Q?1dlVC+uiGNNeo0TEZuhmq0wM+biWoIyWiCvFvBJk+oUp0pMBfa1E3mbFuDkE?=
 =?us-ascii?Q?mZz3p0F6+S+xZ699acbHMjJWNZniHnY1oUH6R+bI+GCBIQn6saL6ShSW1Msf?=
 =?us-ascii?Q?CP8Z9jSBC6K5Tnn6u04AOsn7NGQ3ag1I3hyPJP8auej2EkUDK4YHLkq+RLHC?=
 =?us-ascii?Q?9wNcoMl9BayswLmD2yC5oT7SrooAe6t2AsGP03BXRqO7keW68zFML5n45uIg?=
 =?us-ascii?Q?ffNNtAz7uO5fjTiSUc7xu/jwHH8fQXf8i8/hOsrYD0g6Rg3X+470aRoYuZon?=
 =?us-ascii?Q?ywXPSJv8aD0hjTBErAJy519Q0tWdW4nGUWPnqtzFxxLzsu2ehBgQrzu8xWj9?=
 =?us-ascii?Q?UX5DcHzHPP57sz4wxK6l1w9taAUt6RAepXk/+3amWkBg058SEvz2aMwpGbQH?=
 =?us-ascii?Q?14uhInbX4FCE/hKVOABsvy7fnUh8nfJqgRCb4ht9Bscdx1nbJnOVx6L8zvXt?=
 =?us-ascii?Q?KSRtidE3u9CQSylL4bS8FIcUylzrObtINDjgKBFQqNsU/6zfgR+hrYhljtrF?=
 =?us-ascii?Q?nj9zhYifwFDJoizaKP1TVbF5VDbXW1bFD3wlwFVDb03AFPnfrP8D2AkqhdOq?=
 =?us-ascii?Q?n5OOqXntYb/ay5CoKtz9PDfSNbS14ehi9RZdX2abtdUl+EAFLAqwpsMr3xMT?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e11823-5ff5-4a36-ecd9-08dd1e884126
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 10:47:51.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTmZkWD2QwdeAceTfUXUlywlO7Vqa8ScoBJ+HoAZI0OR4S/hUpD/KFyUWAyh0Qh1zXxJ/jCQcI3UsLEtLgPlZ/swoFYG2rZ1eiRTddqBSyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-Authority-Analysis: v=2.4 cv=I4ufRMgg c=1 sm=1 tr=0 ts=676156db cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8 a=yavTwVZAe6zzyaeksCQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Y_QCuX2b_j73ula4n57WxFasVqzFywRz
X-Proofpoint-ORIG-GUID: Y_QCuX2b_j73ula4n57WxFasVqzFywRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-17_06,2024-12-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412170089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 10:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208831

There is the following warning when building linux-yocto with
default configuration on x86-64 with gcc-14.2:
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  vmlinux.o: warning: objtool: .export_symbol+0x332a0: data relocation to !ENDBR: stpcpy+0x0

This change set removes the warning.

PR target/116174 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116174]

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...ch-to-fix-data-relocation-to-ENDBR-s.patch | 447 ++++++++++++++++++
 2 files changed, 448 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
index 4f505bef68..a25bc019e5 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -69,6 +69,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
 	   file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
+           file://0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch b/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
new file mode 100644
index 0000000000..5bede60816
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
@@ -0,0 +1,447 @@
+From 4e7735a8d87559bbddfe3a985786996e22241f8d Mon Sep 17 00:00:00 2001
+From: liuhongt <hongtao.liu@intel.com>
+Date: Mon, 12 Aug 2024 14:35:31 +0800
+Subject: [PATCH] Move ix86_align_loops into a separate pass and insert the
+ pass after pass_endbr_and_patchable_area.
+
+gcc/ChangeLog:
+
+	PR target/116174
+	* config/i386/i386.cc (ix86_align_loops): Move this to ..
+	* config/i386/i386-features.cc (ix86_align_loops): .. here.
+	(class pass_align_tight_loops): New class.
+	(make_pass_align_tight_loops): New function.
+	* config/i386/i386-passes.def: Insert pass_align_tight_loops
+	after pass_insert_endbr_and_patchable_area.
+	* config/i386/i386-protos.h (make_pass_align_tight_loops): New
+	declare.
+
+gcc/testsuite/ChangeLog:
+
+	* gcc.target/i386/pr116174.c: New test.
+
+(cherry picked from commit c3c83d22d212a35cb1bfb8727477819463f0dcd8)
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=4e7735a8d87559bbddfe3a985786996e22241f8d]
+
+Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
+---
+ gcc/config/i386/i386-features.cc         | 191 +++++++++++++++++++++++
+ gcc/config/i386/i386-passes.def          |   3 +
+ gcc/config/i386/i386-protos.h            |   1 +
+ gcc/config/i386/i386.cc                  | 146 -----------------
+ gcc/testsuite/gcc.target/i386/pr116174.c |  12 ++
+ 5 files changed, 207 insertions(+), 146 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/pr116174.c
+
+diff --git a/gcc/config/i386/i386-features.cc b/gcc/config/i386/i386-features.cc
+index e3e004d55267..7de19d423637 100644
+--- a/gcc/config/i386/i386-features.cc
++++ b/gcc/config/i386/i386-features.cc
+@@ -3253,6 +3253,197 @@ make_pass_remove_partial_avx_dependency (gcc::context *ctxt)
+   return new pass_remove_partial_avx_dependency (ctxt);
+ }
+ 
++/* When a hot loop can be fit into one cacheline,
++   force align the loop without considering the max skip.  */
++static void
++ix86_align_loops ()
++{
++  basic_block bb;
++
++  /* Don't do this when we don't know cache line size.  */
++  if (ix86_cost->prefetch_block == 0)
++    return;
++
++  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
++  profile_count count_threshold = cfun->cfg->count_max / param_align_threshold;
++  FOR_EACH_BB_FN (bb, cfun)
++    {
++      rtx_insn *label = BB_HEAD (bb);
++      bool has_fallthru = 0;
++      edge e;
++      edge_iterator ei;
++
++      if (!LABEL_P (label))
++	continue;
++
++      profile_count fallthru_count = profile_count::zero ();
++      profile_count branch_count = profile_count::zero ();
++
++      FOR_EACH_EDGE (e, ei, bb->preds)
++	{
++	  if (e->flags & EDGE_FALLTHRU)
++	    has_fallthru = 1, fallthru_count += e->count ();
++	  else
++	    branch_count += e->count ();
++	}
++
++      if (!fallthru_count.initialized_p () || !branch_count.initialized_p ())
++	continue;
++
++      if (bb->loop_father
++	  && bb->loop_father->latch != EXIT_BLOCK_PTR_FOR_FN (cfun)
++	  && (has_fallthru
++	      ? (!(single_succ_p (bb)
++		   && single_succ (bb) == EXIT_BLOCK_PTR_FOR_FN (cfun))
++		 && optimize_bb_for_speed_p (bb)
++		 && branch_count + fallthru_count > count_threshold
++		 && (branch_count > fallthru_count * param_align_loop_iterations))
++	      /* In case there'no fallthru for the loop.
++		 Nops inserted won't be executed.  */
++	      : (branch_count > count_threshold
++		 || (bb->count > bb->prev_bb->count * 10
++		     && (bb->prev_bb->count
++			 <= ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2)))))
++	{
++	  rtx_insn* insn, *end_insn;
++	  HOST_WIDE_INT size = 0;
++	  bool padding_p = true;
++	  basic_block tbb = bb;
++	  unsigned cond_branch_num = 0;
++	  bool detect_tight_loop_p = false;
++
++	  for (unsigned int i = 0; i != bb->loop_father->num_nodes;
++	       i++, tbb = tbb->next_bb)
++	    {
++	      /* Only handle continuous cfg layout. */
++	      if (bb->loop_father != tbb->loop_father)
++		{
++		  padding_p = false;
++		  break;
++		}
++
++	      FOR_BB_INSNS (tbb, insn)
++		{
++		  if (!NONDEBUG_INSN_P (insn))
++		    continue;
++		  size += ix86_min_insn_size (insn);
++
++		  /* We don't know size of inline asm.
++		     Don't align loop for call.  */
++		  if (asm_noperands (PATTERN (insn)) >= 0
++		      || CALL_P (insn))
++		    {
++		      size = -1;
++		      break;
++		    }
++		}
++
++	      if (size == -1 || size > ix86_cost->prefetch_block)
++		{
++		  padding_p = false;
++		  break;
++		}
++
++	      FOR_EACH_EDGE (e, ei, tbb->succs)
++		{
++		  /* It could be part of the loop.  */
++		  if (e->dest == bb)
++		    {
++		      detect_tight_loop_p = true;
++		      break;
++		    }
++		}
++
++	      if (detect_tight_loop_p)
++		break;
++
++	      end_insn = BB_END (tbb);
++	      if (JUMP_P (end_insn))
++		{
++		  /* For decoded icache:
++		     1. Up to two branches are allowed per Way.
++		     2. A non-conditional branch is the last micro-op in a Way.
++		  */
++		  if (onlyjump_p (end_insn)
++		      && (any_uncondjump_p (end_insn)
++			  || single_succ_p (tbb)))
++		    {
++		      padding_p = false;
++		      break;
++		    }
++		  else if (++cond_branch_num >= 2)
++		    {
++		      padding_p = false;
++		      break;
++		    }
++		}
++
++	    }
++
++	  if (padding_p && detect_tight_loop_p)
++	    {
++	      emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2 (size)),
++						    GEN_INT (0)), label);
++	      /* End of function.  */
++	      if (!tbb || tbb == EXIT_BLOCK_PTR_FOR_FN (cfun))
++		break;
++	      /* Skip bb which already fits into one cacheline.  */
++	      bb = tbb;
++	    }
++	}
++    }
++
++  loop_optimizer_finalize ();
++  free_dominance_info (CDI_DOMINATORS);
++}
++
++namespace {
++
++const pass_data pass_data_align_tight_loops =
++{
++  RTL_PASS, /* type */
++  "align_tight_loops", /* name */
++  OPTGROUP_NONE, /* optinfo_flags */
++  TV_MACH_DEP, /* tv_id */
++  0, /* properties_required */
++  0, /* properties_provided */
++  0, /* properties_destroyed */
++  0, /* todo_flags_start */
++  0, /* todo_flags_finish */
++};
++
++class pass_align_tight_loops : public rtl_opt_pass
++{
++public:
++  pass_align_tight_loops (gcc::context *ctxt)
++    : rtl_opt_pass (pass_data_align_tight_loops, ctxt)
++  {}
++
++  /* opt_pass methods: */
++  bool gate (function *) final override
++    {
++      return optimize && optimize_function_for_speed_p (cfun);
++    }
++
++  unsigned int execute (function *) final override
++    {
++      timevar_push (TV_MACH_DEP);
++#ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
++      ix86_align_loops ();
++#endif
++      timevar_pop (TV_MACH_DEP);
++      return 0;
++    }
++}; // class pass_align_tight_loops
++
++} // anon namespace
++
++rtl_opt_pass *
++make_pass_align_tight_loops (gcc::context *ctxt)
++{
++  return new pass_align_tight_loops (ctxt);
++}
++
+ /* This compares the priority of target features in function DECL1
+    and DECL2.  It returns positive value if DECL1 is higher priority,
+    negative value if DECL2 is higher priority and 0 if they are the
+diff --git a/gcc/config/i386/i386-passes.def b/gcc/config/i386/i386-passes.def
+index 7d96766f7b96..e500f15c9971 100644
+--- a/gcc/config/i386/i386-passes.def
++++ b/gcc/config/i386/i386-passes.def
+@@ -31,5 +31,8 @@ along with GCC; see the file COPYING3.  If not see
+   INSERT_PASS_BEFORE (pass_cse2, 1, pass_stv, true /* timode_p */);
+ 
+   INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_insert_endbr_and_patchable_area);
++  /* pass_align_tight_loops must be after pass_insert_endbr_and_patchable_area.
++     PR116174.  */
++  INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_align_tight_loops);
+ 
+   INSERT_PASS_AFTER (pass_combine, 1, pass_remove_partial_avx_dependency);
+diff --git a/gcc/config/i386/i386-protos.h b/gcc/config/i386/i386-protos.h
+index 46214a63974d..36c7b1aed42b 100644
+--- a/gcc/config/i386/i386-protos.h
++++ b/gcc/config/i386/i386-protos.h
+@@ -419,6 +419,7 @@ extern rtl_opt_pass *make_pass_insert_endbr_and_patchable_area
+   (gcc::context *);
+ extern rtl_opt_pass *make_pass_remove_partial_avx_dependency
+   (gcc::context *);
++extern rtl_opt_pass *make_pass_align_tight_loops (gcc::context *);
+ 
+ extern bool ix86_has_no_direct_extern_access;
+ 
+diff --git a/gcc/config/i386/i386.cc b/gcc/config/i386/i386.cc
+index 6f89891d3cb5..288c69467d62 100644
+--- a/gcc/config/i386/i386.cc
++++ b/gcc/config/i386/i386.cc
+@@ -23444,150 +23444,6 @@ ix86_split_stlf_stall_load ()
+     }
+ }
+ 
+-/* When a hot loop can be fit into one cacheline,
+-   force align the loop without considering the max skip.  */
+-static void
+-ix86_align_loops ()
+-{
+-  basic_block bb;
+-
+-  /* Don't do this when we don't know cache line size.  */
+-  if (ix86_cost->prefetch_block == 0)
+-    return;
+-
+-  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
+-  profile_count count_threshold = cfun->cfg->count_max / param_align_threshold;
+-  FOR_EACH_BB_FN (bb, cfun)
+-    {
+-      rtx_insn *label = BB_HEAD (bb);
+-      bool has_fallthru = 0;
+-      edge e;
+-      edge_iterator ei;
+-
+-      if (!LABEL_P (label))
+-	continue;
+-
+-      profile_count fallthru_count = profile_count::zero ();
+-      profile_count branch_count = profile_count::zero ();
+-
+-      FOR_EACH_EDGE (e, ei, bb->preds)
+-	{
+-	  if (e->flags & EDGE_FALLTHRU)
+-	    has_fallthru = 1, fallthru_count += e->count ();
+-	  else
+-	    branch_count += e->count ();
+-	}
+-
+-      if (!fallthru_count.initialized_p () || !branch_count.initialized_p ())
+-	continue;
+-
+-      if (bb->loop_father
+-	  && bb->loop_father->latch != EXIT_BLOCK_PTR_FOR_FN (cfun)
+-	  && (has_fallthru
+-	      ? (!(single_succ_p (bb)
+-		   && single_succ (bb) == EXIT_BLOCK_PTR_FOR_FN (cfun))
+-		 && optimize_bb_for_speed_p (bb)
+-		 && branch_count + fallthru_count > count_threshold
+-		 && (branch_count > fallthru_count * param_align_loop_iterations))
+-	      /* In case there'no fallthru for the loop.
+-		 Nops inserted won't be executed.  */
+-	      : (branch_count > count_threshold
+-		 || (bb->count > bb->prev_bb->count * 10
+-		     && (bb->prev_bb->count
+-			 <= ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2)))))
+-	{
+-	  rtx_insn* insn, *end_insn;
+-	  HOST_WIDE_INT size = 0;
+-	  bool padding_p = true;
+-	  basic_block tbb = bb;
+-	  unsigned cond_branch_num = 0;
+-	  bool detect_tight_loop_p = false;
+-
+-	  for (unsigned int i = 0; i != bb->loop_father->num_nodes;
+-	       i++, tbb = tbb->next_bb)
+-	    {
+-	      /* Only handle continuous cfg layout. */
+-	      if (bb->loop_father != tbb->loop_father)
+-		{
+-		  padding_p = false;
+-		  break;
+-		}
+-
+-	      FOR_BB_INSNS (tbb, insn)
+-		{
+-		  if (!NONDEBUG_INSN_P (insn))
+-		    continue;
+-		  size += ix86_min_insn_size (insn);
+-
+-		  /* We don't know size of inline asm.
+-		     Don't align loop for call.  */
+-		  if (asm_noperands (PATTERN (insn)) >= 0
+-		      || CALL_P (insn))
+-		    {
+-		      size = -1;
+-		      break;
+-		    }
+-		}
+-
+-	      if (size == -1 || size > ix86_cost->prefetch_block)
+-		{
+-		  padding_p = false;
+-		  break;
+-		}
+-
+-	      FOR_EACH_EDGE (e, ei, tbb->succs)
+-		{
+-		  /* It could be part of the loop.  */
+-		  if (e->dest == bb)
+-		    {
+-		      detect_tight_loop_p = true;
+-		      break;
+-		    }
+-		}
+-
+-	      if (detect_tight_loop_p)
+-		break;
+-
+-	      end_insn = BB_END (tbb);
+-	      if (JUMP_P (end_insn))
+-		{
+-		  /* For decoded icache:
+-		     1. Up to two branches are allowed per Way.
+-		     2. A non-conditional branch is the last micro-op in a Way.
+-		  */
+-		  if (onlyjump_p (end_insn)
+-		      && (any_uncondjump_p (end_insn)
+-			  || single_succ_p (tbb)))
+-		    {
+-		      padding_p = false;
+-		      break;
+-		    }
+-		  else if (++cond_branch_num >= 2)
+-		    {
+-		      padding_p = false;
+-		      break;
+-		    }
+-		}
+-
+-	    }
+-
+-	  if (padding_p && detect_tight_loop_p)
+-	    {
+-	      emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2 (size)),
+-						    GEN_INT (0)), label);
+-	      /* End of function.  */
+-	      if (!tbb || tbb == EXIT_BLOCK_PTR_FOR_FN (cfun))
+-		break;
+-	      /* Skip bb which already fits into one cacheline.  */
+-	      bb = tbb;
+-	    }
+-	}
+-    }
+-
+-  loop_optimizer_finalize ();
+-  free_dominance_info (CDI_DOMINATORS);
+-}
+-
+ /* Implement machine specific optimizations.  We implement padding of returns
+    for K8 CPUs and pass to avoid 4 jumps in the single 16 byte window.  */
+ static void
+@@ -23611,8 +23467,6 @@ ix86_reorg (void)
+ #ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
+       if (TARGET_FOUR_JUMP_LIMIT)
+ 	ix86_avoid_jump_mispredicts ();
+-
+-      ix86_align_loops ();
+ #endif
+     }
+ }
+diff --git a/gcc/testsuite/gcc.target/i386/pr116174.c b/gcc/testsuite/gcc.target/i386/pr116174.c
+new file mode 100644
+index 000000000000..8877d0b51af1
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/pr116174.c
+@@ -0,0 +1,12 @@
++/* { dg-do compile { target *-*-linux* } } */
++/* { dg-options "-O2 -fcf-protection=branch" } */
++
++char *
++foo (char *dest, const char *src)
++{
++  while ((*dest++ = *src++) != '\0')
++    /* nothing */;
++  return --dest;
++}
++
++/* { dg-final { scan-assembler "\t\.cfi_startproc\n\tendbr(32|64)\n" } } */
+-- 
+2.43.5
-- 
2.34.1


