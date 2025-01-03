Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C79E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 07:09:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.25940.1735888189809136129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 23:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3098b60913=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5036ubvQ008111
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jan 2025 07:09:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a84vxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 07:09:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IahG8bkXrlRQbsajgpOFjUrrsKKpXr7hbPjVlmz0n1iwLE3BJCND9TBOGZ2dTwXlHBULQ+Pe60iFppt9GgyquWHhf1jnA5TumaiI/MyYcz4zxc6D0/aLU2ONIxlZ0KdriKG1R42ZKhQxo8T9tDKorlv1cKVVdo4mM7e1lHepEAlcnsL63o+FI604l329rQ3WrVv9mHlKv0QdPcPtRk0hSFp3UXzbICdn+Fsb618NKticZ4FL3ssFl/3hzT+eBBsxUSpS1Tv0tSo9rpSAyqLj1Ujx6vDGFu12fOOl28fI3PQtRCePJID7GA8nEyXrt/YN+jMPUuMva4H0pW7n/9+IBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpOP8LXDX2M2TN1kKrWg022mA5hjzYZpbHSH364kx9c=;
 b=D9iQuQePabmntxGcyLLFphLfhZp7tifKRdCLewZqQQZqAtbBtB+KxGfYHS3vNyKcxAey3q+mVQm/hT4muAUEGT4BnPyXExupVrUI6jkGceKSoFbi951LERdiMRzNG/HHvc3baxx3avCXCgAJO3Q+EauH11CRtolYCj/qlqPvDgnJ46czsyGv0Xe5AhAvhxoM+7KtuOEppTOeBjZZKdbmIYJV5xYh/f4M6jbPyRcKCnjetyVA1LYIjYW8yVtqVq0WCzK7Fnu1fbNw1X64kxcZGKgfh9BkcCbHK2CoSwDprssjjPc74qDtp0Zv5cd0yHS7bB1AOP0VQCQl4f+4LpPlKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SJ0PR11MB5814.namprd11.prod.outlook.com (2603:10b6:a03:423::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Fri, 3 Jan
 2025 07:09:40 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8314.012; Fri, 3 Jan 2025
 07:09:38 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] rpm: avoid empty plugindir error
Date: Thu,  2 Jan 2025 23:09:27 -0800
Message-Id: <20250103070927.3908610-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SJ0PR11MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ea705f-e50b-4eed-0242-08dd2bc5964a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xjirxXT5Ynb1Rj8t8zu4iMPbFLK5sj7a8GrDdx5d4i/dWYYmF2+Pn5NtlWqT?=
 =?us-ascii?Q?lIhVI1duC0Y1qsswOgPVHhTeFxuTfvefi7W5XhStAaxKxFkiAQRD1P6piecz?=
 =?us-ascii?Q?62gMJb8SaMZDnXNCW4+X0ORoAQ75a+FJ6eoO3E6boElQivXX7YiAuPjcx9TX?=
 =?us-ascii?Q?i6pYB+asCan1+JjG6Bad6tw8hb84kUpygKm97bcwM08FLmD7UsMG/lGsMWlI?=
 =?us-ascii?Q?d15A1JoEEBqxDROqnAAgZlMkZVtN0yAbCjnST/h+Ml7y32MHQyh97aZd+YVM?=
 =?us-ascii?Q?Ma/y70sbkaTzWceLxnlPbz808mTmF/jQIqmpasqkbQL92wB105hazC0Ks1Ov?=
 =?us-ascii?Q?wI5waPg8JCBtV3AWShTLLKoqrWFp5aOO/i+pqz9fiQaz/PTYiwoyVML3bN30?=
 =?us-ascii?Q?t0+HAgkYQ6LUivfPM8xIzY9g6pjoNAQeNuRnSI1n1ltsk+IkIJkoCnOfJ3Ux?=
 =?us-ascii?Q?tIzIBnewftilpC1DYyMgKPMKe5L676Z9/yBXqX+/4ZnNdAFaxUnDNVBQe5pR?=
 =?us-ascii?Q?MPnH0byYpzDpARwu2qZD7FCHx6CGjMMhapR9beVjyHgfjr43qd4/dD0UkUjp?=
 =?us-ascii?Q?b+0/Dj+2Shi2gVErOGTblAu2MMdRglQamMIN44U/wLlpaQ6VWZvjBSLIs7Qb?=
 =?us-ascii?Q?JCB/S0VxummmplMpdKT2X4vowhbWnSDIGelPEi68ZYTpis5hQ030lU4RP21U?=
 =?us-ascii?Q?LiSyoydUUmAC4/mYp8ad30kBHkih8htC74/2USr/cE81ZfWiqqZWFz/6M0Uq?=
 =?us-ascii?Q?jhujhmADkwOr0Tk+jcqa5Jy+2TYjkEfBYJ9oxYVwmhqRhR+0vAsrG3XfKWi5?=
 =?us-ascii?Q?LDeF2lH1677SVUCvzG3sxlpEGzGFHZInH4rMVCDhtpGxRN+iuPMApceFRh2S?=
 =?us-ascii?Q?/q6oJB/hf55/POZBRcrPM4DifwNAEkb6H1gGR+ocgnaOwFKZt+vg5DMYt6m0?=
 =?us-ascii?Q?jRGvQg0PLLYqSq1HbyQ9uRtc7c9huFXHbxKW3cJM8KrhzZFmdWNhrO/XVfDF?=
 =?us-ascii?Q?hyCnWtch8SCD/Zdkd5NM/Ve/qj2/IZZWTCnb0HpeyircXbudg787qA52JJ5x?=
 =?us-ascii?Q?nJFtxxQCk5hCVyX0xh8fB/bwbBckv0DFrbB2Dz6zMz63qnp3PN7iJEdkSHzf?=
 =?us-ascii?Q?LGmFpqaFBReF0f/n6nFDHJNl9/NULpkNF79gOpP5FBu9RBqp9BtS6WVLDWzR?=
 =?us-ascii?Q?gJilk+bLIervZ/Rb7NwvGxWMBd1AIg4R/ZusaTDMiMrtgjIVzOyn9N/8p1uF?=
 =?us-ascii?Q?OIokhAz4m7KHusC89jnUE44XfXf/blvq5Gg/lv2EKmn9YZ2T9QgwTpIjs3lf?=
 =?us-ascii?Q?aKi6aGdYUqEmVwmiXhk4Nnoxdajlw1uY+vU0YJ3PgL8VVlYzxYRNI5eEv50a?=
 =?us-ascii?Q?pINupShs0T4aNhujq+vWzihoelaf1tvA0SjsOwbfimiaKPOCn+elgFVoo0ot?=
 =?us-ascii?Q?MuqSZBhpzKPxf+2NLrsY8s7Ftr1ne57z5px5ps7kxE0Q6znOsBYFCg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ymrs1XVwDCvV9Iq4s7MAovQhI46bA2Q4C+zO1SOAoBydMDSj17htWsNhgfLB?=
 =?us-ascii?Q?Vs2yu9ItH6IrFHNVUhJzUSsSz4kJrBY/wR9oCPvG4SI+MhGFXDZMRokygQnd?=
 =?us-ascii?Q?LqoMdG0vTaikXlDyhpsrmP6NWFASAZhcWYYNyA/RLGSvRwxU/arbSwgsjein?=
 =?us-ascii?Q?WShPLBcoV2yRGc+pCSXnJP91woVfXR7mI9wiWlu+OwQFEwCaoAXwJZE8bmTy?=
 =?us-ascii?Q?A28r0SZn7thXM976rpsjwBM1BuQPA66L0j3i6qRXIJK7VjMPYgFU9cVHWtLt?=
 =?us-ascii?Q?TBOhAjagf9IY7Vm3niFcb/HBXR/oVaLnFdGMbf/H+VhxhtFxvrAXpqybTPxX?=
 =?us-ascii?Q?Zt1NiM6oa+k/ez+I5k0FdbMou8FF6YB7qB8RLmYgzj7KVEHBmUduFUpIo0px?=
 =?us-ascii?Q?QaONIz4PXIkrQI2rpzeku6yeYhCexVNmKTuVZnqRO7ff10z+3p9Iwz/6oG2H?=
 =?us-ascii?Q?aIH3HRE8lSWVf9ulujJLrxCmMgA0Lin+dm/s54BxiLX8A/bdX9Q8hBsEu1mB?=
 =?us-ascii?Q?smIYCwbhrwboc+9M69EL0vljV3CjYHwUU0lZcEvSJinP5ZBRvfKSTo93D8mG?=
 =?us-ascii?Q?bFkIKcXPngUmYKrKTvl1JaHY+V8w3uW1XIYJue0l17lz6frdgrRO33UshU4G?=
 =?us-ascii?Q?0XUfjVS243gncCpNc+YAeFUwyw/zfrSoPjyqhxuQ/Yfnn89BAFeoHlESLNvE?=
 =?us-ascii?Q?vGzSfMaxngQtQeVHjW4Io5bV0d3BiYKdiamdE9ceQP0N5xklUW4IUxzgXkqA?=
 =?us-ascii?Q?uWTRTlgBgRbJLHCNMumSXnMLyFOh5m/5AiPagHZ+X4qDDv+C7V6htTXlf6uW?=
 =?us-ascii?Q?iGsC+y/oYP+cwYt1QprNo+BDX5Dmtn1mFq1fCHktxJ6DvrZT6zq/VuF6rmeY?=
 =?us-ascii?Q?CNP8pgjlITDzsv7x+x1fDdsQSwl6bIpbMIUmutHVW3+TquiSp7rxy+98ou9H?=
 =?us-ascii?Q?eTOOujGXsk3/B0M98yNsCW0VZi+nRiByHJ4K8oH60ca3joPzC3DEJSjAVtBX?=
 =?us-ascii?Q?oaHFfUH4D0pC2Q85ldXHbXUZ7PlFqrP4rQGd7V957/FVbrVToVVmCNt4WrvV?=
 =?us-ascii?Q?ZQhDn6q+Vl2w9u84ds3FrVN90PFcEa2V+vj4Kk5xfIczdj53q7u5zqSXJtIE?=
 =?us-ascii?Q?1mEVg9jQyoqQUApiwaqBaKwlminO+WSIPZdh9qE6Z/JPeVF6dHqEcrFQbP3O?=
 =?us-ascii?Q?CW1MrT/HbblsGGLWZEvA+DRqJ1MQAJmE7jOHgIg9dlb1DQK6aYb8fJcofva5?=
 =?us-ascii?Q?d5oVc4frBjjSdOqdhG+37NsLTvtYV9MGtpfNnKTboZXjR1WLYHPVAtfkfWf2?=
 =?us-ascii?Q?/dQdzCTTfKOjmVvV8s1on719gU3hkt6Gtr9F998GKKHDg/JpeJtH2JVW8RYe?=
 =?us-ascii?Q?3iwefxfefUl1Ujz/txQTKenWMW7UJzQ4z5cP76zyoVfNTkjZHuXfKIZpcZem?=
 =?us-ascii?Q?GVB7Si3HnqpmyEYlID1P4QFNVrPacHBh3C4z5yntekCPopXhHuTzlPN5EkC+?=
 =?us-ascii?Q?+teInpvSWpxAEBrPaGwrCcWFZ1xfuFsoOupgTArem6qaTijieSY3gj+N4pMc?=
 =?us-ascii?Q?8dBj/ikAgL3eVPQJCIGXlJoNC2B/YgOajIn+YWNMGY4iFTzw2K+uZm37uakD?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ea705f-e50b-4eed-0242-08dd2bc5964a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 07:09:38.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rIZwl2mBt8XqAw+s1Jrj+npU6F51rQLR293v5C96CpmMK5FjYgapi6l2rrKqy2QZTFeSYTxJlxmkcgx6I5wSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5814
X-Proofpoint-GUID: LJ7DF-eR7SFeUPdtAYm3oEZRI0Z1ZCGl
X-Proofpoint-ORIG-GUID: LJ7DF-eR7SFeUPdtAYm3oEZRI0Z1ZCGl
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=67778d3c cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=6J3N_EiaHUe3Zf-reCMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501030060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 07:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209320

From: Chen Qi <Qi.Chen@windriver.com>

When using dnf/rpm, we'll see error messages like below:

  error: /usr/lib64/rpm/macros: line 1183: Macro %__plugindir has empty body

The problem was introduced by the following commit in RPM upstream:
https://github.com/rpm-software-management/rpm/commit/ab28534f9e68aff8be65cd1adbac86b5a2cafde4

We'll need to move RPM_PLUGINDIR definition to top-level CMakefile.txt
to solve this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...LUGINDIR-in-top-level-CMakeLists.txt.patch | 57 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.20.0.bb       |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch b/meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch
new file mode 100644
index 0000000000..5db69340ad
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch
@@ -0,0 +1,57 @@
+From 2d6beb620896a59cfd685b51a19057e5c5c4ab41 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 19 Dec 2024 11:54:54 +0800
+Subject: [PATCH] Set RPM_PLUGINDIR in top level CMakeLists.txt
+
+We have in macros.in:
+  %__plugindir          @RPM_PLUGINDIR@
+
+This means, if RPM_PLUGINDIR is not set, %__plugindir will be empty.
+This in turn results in error message when running 'dnf'.
+
+e.g.,
+dnf --help >/dev/null
+error: /usr/lib64/rpm/macros: line 1183: Macro %__plugindir has empty body
+error: /usr/lib64/rpm/macros: line 1183: Macro %__plugindir has empty body
+
+So we should move this directory setting into the top level CMakeLists.txt.
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/3496]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ CMakeLists.txt         | 3 +++
+ plugins/CMakeLists.txt | 3 ---
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 758ba73f4..e694b9650 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -453,6 +453,9 @@ if (ENABLE_PYTHON)
+ 	add_subdirectory(python)
+ endif()
+ 
++set(RPM_PLUGINDIR ${CMAKE_INSTALL_FULL_LIBDIR}/rpm-plugins
++       CACHE PATH "rpm plugin directory")
++
+ if (ENABLE_PLUGINS)
+ 	add_subdirectory(plugins)
+ endif()
+diff --git a/plugins/CMakeLists.txt b/plugins/CMakeLists.txt
+index a44056fe3..6e61a7c20 100644
+--- a/plugins/CMakeLists.txt
++++ b/plugins/CMakeLists.txt
+@@ -42,9 +42,6 @@ if (HAVE_UNSHARE)
+ 	add_library(unshare MODULE unshare.c)
+ endif()
+ 
+-set(RPM_PLUGINDIR ${CMAKE_INSTALL_FULL_LIBDIR}/rpm-plugins
+-	CACHE PATH "rpm plugin directory")
+-
+ get_property(plugins DIRECTORY PROPERTY BUILDSYSTEM_TARGETS)
+ foreach(plugin ${plugins})
+ 	target_link_libraries(${plugin} PRIVATE librpmio librpm ${Intl_LIBRARIES})
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 97483f7ddd..6c995ff50c 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protoc
            file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch \
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch \
+           file://0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch \
            "
 
 PE = "1"
-- 
2.25.1


