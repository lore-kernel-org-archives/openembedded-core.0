Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75304C369D4
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 04:05:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2981.1745121952264153048
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Apr 2025 21:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6205c0d41f=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K45cBe012818
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4642t8rqsk-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:05:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5Gbe9SHb6c+T3J/e56Wir9BQg3Y06F8beHVHPAyWDvZyziRdmN20G1mdwYV1EorZ8HYc6/qx5ybID0B/C1fWqp6NqT0wYCMsPYp3TiHWmo6/4NaJ81eeB1vnudxr53qfeBb6Ekw10GwHXt7GFCpggDeUjqN3+LANwiGVC1u63o7/N71DnPfMLOJos/TS25hvF4raWurtmmeuqmLYqRtzWNHZ8ST9vFCvqzkgPJIfDMPsqjWyjTq3fsXWxgM0Eh1gs5bfFAFHjS8DzncVB33X4JIrrOOLNmVljIMYeJ0BPAPybk6fOwObVsDvaNNSM7rE5bWqyriOYP47rSAdcmmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUKqp0NlbmY3B7/7ntg5HLgwfk+CxV6xUPfCf7z5nA0=;
 b=WHVEyTWrasoc+jOItBeF8dZqOW7Y9yJqlvK7pNCJvRvd33yZsQ0k8A+iuRAnlcMv/MY9yxl3GXcDGqtOcW7bIMGLGmDjKmmXEI8oXL0yHUSxBwmJdmb3ngvNHCyDJHGFoiImWR1kgtHqpgFICB6fvRRGrV6xPFuPvGXLLgEd7InnCm4gnAJtLDqHBYR7v2NFCwZlS5D/KsnBCm6ZOwSuEiVpjc0HOvhjXUq3Pxg6wpGQv2GcVmpiph7BfS+I9nvB1tbeEaKqRmBNjKbJ7ZvE7jSEMHzUhZnB67ig2vzrC9btpclWJwesYXlKRYpLitoKo9av4BgjbeOP2NQnbDzWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9424.namprd11.prod.outlook.com (2603:10b6:208:583::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Sun, 20 Apr
 2025 04:05:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.031; Sun, 20 Apr 2025
 04:05:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V4 5/5] lib/classes/recipes: refactor qemu.bbclass functions into library functions
Date: Sun, 20 Apr 2025 12:05:28 +0800
Message-Id: <20250420040528.4012613-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250420040528.4012613-1-Qi.Chen@windriver.com>
References: <20250420040528.4012613-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f98ce77-d796-4ed9-2ec5-08dd7fc0a1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8geKtNR3Kg3e5RMaFBhA1FwHyKWqaa/gfCqAeGsecjljsz3kf5p3JnKcKBkW?=
 =?us-ascii?Q?8zjq+aze5SMmekSM7dJal9bdX0a36kbNz3VYFluhtNcc4jkxxqtIiR5l/VTb?=
 =?us-ascii?Q?HFxwEyw647AS+g+d3yujRvOsaWGuRqKOSC7H8H68ONsqvcrr9AJjZf+DuXq/?=
 =?us-ascii?Q?JtBXguCxaTeHQz6m91BYhocsXd4jcPEj4FqerhWBHEwoeZ6xBnVccb6332d/?=
 =?us-ascii?Q?Kygj8bK7VOh9QGPdDeNnAh/IO6EWJew8OlTcRmTaJVfSQnhRpAS9DPcc1Ava?=
 =?us-ascii?Q?CmCuwDrcfLzObSuR3e4aCYC9smmvLjgcaAFFe6ph9bTBifeO5np4marWWxuq?=
 =?us-ascii?Q?HMjdXYKwgPDOd670ekxZ/g+Q9GT84snuAem3xkZc2Dc2lFjZ3/clFiu2mKUA?=
 =?us-ascii?Q?3wLZV+fflksS8D0jxCiuNMSe+Gk9am+DgYNOXpA/NKGvGxDJXhMgTiiRNbBc?=
 =?us-ascii?Q?ZhXyGyrJhm+9tGXvp+SzbyC5TBYiz/K5AuYUicfqGkjYLxmSPkQglw6PkXVf?=
 =?us-ascii?Q?JMDKUyC/w4cq0wKRWi4SPe/xer8PqBKO23Kge/lR+ub/QMckuytHLeVkMjm4?=
 =?us-ascii?Q?YX3eS3djL9gAvGNnUf9F/Rvmasy2ouV4i5KQe+C94NzNe2damlBsbCplHiTt?=
 =?us-ascii?Q?LL12LggqrbXGD8TFeG66Fk5QtPNfqJVUNJ08IBepfxbKHczgHVEpRuONzwgl?=
 =?us-ascii?Q?f8ZO8xFZzifpatKYb5vFaRvPxQKVdNC2gWLu5/11Zobbxuk5DAWPYWqnMkW4?=
 =?us-ascii?Q?wSgHYqG3gvPOZJxB37Dc3xxEedyr0dtzQA4STFI2SXJibfy/iF9MRmAY8TOI?=
 =?us-ascii?Q?ggdfDYcAY2zk3Ll59g3hFZJLrZMuSg7pp1HbB4zLbju57xkX5/REAJAfFWGr?=
 =?us-ascii?Q?vu/wSc9MURXlOQ1s1ObjHbn2t6JJD4jgI6/xSGYX6IHPE3Vn90/KZJfyTG4u?=
 =?us-ascii?Q?7Z0ofAELPFT4T0FcLI5jI6YVQGZ6M/SqojsH6c4SQxYzstBsEdtUb3h+bxUa?=
 =?us-ascii?Q?ULgvt5G06egzPeDGs5tJ9IMpvi/EzKZWQ9C43ZE1s/fY11WpbXWGOPSGuZvm?=
 =?us-ascii?Q?jadU6wT3Ost3QeVtbU3whMYVDWoG1j2WE0db5Vlam7sZstT+HiApSG2KZVlm?=
 =?us-ascii?Q?jwfZ5cA4dLxLSIUX0fYVyXNqX81HMzDq+L7x7tpGlualo514fO3TYJfEoxnn?=
 =?us-ascii?Q?O4AODhiMl8a6zY2fNHUSoLkGgpLwAKbLK9Z9z37tVcXvcg5P89YvRuwnO1oL?=
 =?us-ascii?Q?eI2d+QQDUP+Ko4zaiLugipV8Ff5umiGBQpxrJS7v4G25rsXJHEaXyui6Gj9Z?=
 =?us-ascii?Q?dEB2Xy3bxbj4B2EMirfdKWoh1eoWaYuXptlBeWn8bcrk5SgeAC5Y4QQEpcO1?=
 =?us-ascii?Q?xzFImmw6F6sOKSl+HMgL9SijYAAu/728QuGBV00qZzCOGBgyi4fWdJyS7ZLN?=
 =?us-ascii?Q?7g2F8HqyPjynXlExwbBrrAMn1bhDOBEfPQANEcSYavyTod+3FlAxPg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L0EsQMV72jBkuSm8Car2z76gmGmfNLLuRN6UBlVeJBXi9CFxNiB9P8NSbm1d?=
 =?us-ascii?Q?Q0Ao/VrZR60ewwLXAQg8+Xce2N6DTR0ABZK9kmgKC8M8mEpGnf7nzhUH1P0c?=
 =?us-ascii?Q?Dg7Ay1uszCeqVwnEXrG+xdu6+LxBmLINY4dXmYgs46xyA1klKA5mvOTs8n3R?=
 =?us-ascii?Q?IBiDDOSd0y8c008bVJP4xAQ9Rn+fFOCODrJx84asQD16NvX4fJfGGCNoscDb?=
 =?us-ascii?Q?Tr+SDJLby2PbXjNYy5Houu78Yb/4wB+h94FmIUFicgEDdAC+brZNLWeYu+Nu?=
 =?us-ascii?Q?rnz6vY48djMSll5ejPsKgEfEM2Dv7guCEpj1C8xxThhelnmllCcAHUrv0RIW?=
 =?us-ascii?Q?8WFXzUm+rgepKUReLAQLjKQiyqhWNO1Qx7xscNYEnxZEHJlHPXg/gNPzHAD3?=
 =?us-ascii?Q?XnNw7I63cDX7iFMzmVJMVtqxWJVQfS/vEFfkLLbnaB0bwjYFIgno75ufFKZ+?=
 =?us-ascii?Q?eATkLNlCPEo4seSTAi69DwGIS3dD6k6VhfmqpzjzCnADmKqaqvQ7cgPMj01A?=
 =?us-ascii?Q?y53eKrKckZ8kpe75UKlLbyxks4+FDPPwAX25lZ2/vo7hKqcbYF1sDsNKtb95?=
 =?us-ascii?Q?yyPkQeIaSk3a4zGP6ZZ5WX6QWggSbOLf0oc7AufRmNHn7TnmDFt2NqTRYfb5?=
 =?us-ascii?Q?FPM6+pfmRS83dS1BaVpnwL1b13vo2kkTVTkGjZPC4JeLVP/V+beXvViUHGRi?=
 =?us-ascii?Q?jx1/LH1c7PzNXFWmggiYmMlqrX8I5l/ivz+v0wUhw7y6oeCmq/wwEfNV/b11?=
 =?us-ascii?Q?dNLo1Mv4/k3ZdWXL4h5cgguMo2dnuN24sQ/2JcInvTp163SxDtukX0b0BUaX?=
 =?us-ascii?Q?YcmrvomCd8MBr7Gxuh77+RblBs5xkPqee94Qv0djl4Kl4PWafsoe40bl4QIf?=
 =?us-ascii?Q?NJ9GKOpx7pj11AES/V+v6xJx2HTf/YmotTmsEGsePvVGsaguD+MFlaJxHvAE?=
 =?us-ascii?Q?dGSfvvoJvdTV+LFG5ahagfHIFoO/oqHVxioFgAETR2O3zMX7pvzamGryKDgc?=
 =?us-ascii?Q?qKRD1FKpQQEZZQangu4AxWmkenMfKgHSnJcuNGixbdquxkKvOY0wcfju12ZD?=
 =?us-ascii?Q?TMBiBlAM4s87ZQ2azb1DsWnS6+xcnogzYSBBEbpSjBNhWBUFOFhqHXUeMhwB?=
 =?us-ascii?Q?OjwKl7EL7cBNmgy4bEhphEzDos6vab+A8pJSKj21a2S/aoTNyBAXB9sopn8R?=
 =?us-ascii?Q?dP0qDo4PRhIObJZKXpxA9VailrBNZNmj/soHjWAdk2W+WjpgWmnEDQO6DH/6?=
 =?us-ascii?Q?C/u8mOnbnPaJzhiGAuZPYHOAxl8LlFBWENq0X8zcGWCUTDm+BYjaLyvJ4Fak?=
 =?us-ascii?Q?Hz0WItVwM3sNlel1M0f4H4pDW12dUt9hgrXpx4DlmVPatAUe6Bof3IgabUeh?=
 =?us-ascii?Q?QJxB/U6F/7rY6i746EL0Ilgzh1DQwVon4FGOVhTLjpJUkE0zgujO1c9AaXr7?=
 =?us-ascii?Q?qN3gQUF2vAeVUr6lB6720HSOiirpAqVtn2F6ApxxVv4A+raejUbMNjKt7W+u?=
 =?us-ascii?Q?//L/n0YnjWhizVQJHA15m5mT2gV1dpUbiLBz7B192+MKmUDd1y34GOOWbg9U?=
 =?us-ascii?Q?G1qoPTDiMaDN9BYYuXPkbF3c50YxTxogKIi9X7Al?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f98ce77-d796-4ed9-2ec5-08dd7fc0a1e5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 04:05:48.5910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBzsODgStrAIDwjF9xFLYu0gZeCr/XtHDPhSwUz2clbWBxS3AwWO4XUxJbFGz7+WRZDzqlOqfj1i3TTSyeRuaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9424
X-Proofpoint-ORIG-GUID: fRvK55nCC1SZqOnOcybF1lQICNfWZO4t
X-Proofpoint-GUID: fRvK55nCC1SZqOnOcybF1lQICNfWZO4t
X-Authority-Analysis: v=2.4 cv=TJ9FS0la c=1 sm=1 tr=0 ts=6804729f cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=05caZQWP-9MGXGHOnJUA:9 a=ILrxbXL7mD7Ha1I0:21 a=FdTzh2GWekK77mhwV6Dw:22
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215149

From: Chen Qi <Qi.Chen@windriver.com>

Move the functions in qemu.bbclass to meta/lib/oe/qemu.py as they are generally
useful. Add a deprecation notice in qemu.bbclass so that we can remove it in
the future.

The re-definition of qemu_wrapper_cmdline in allarch.bbclass is replaced by
re-definition of the write_qemuwrapper function. We need to do this
because we need to have the same signature across different machines for
recipes inheriting both allarch and meson.

Note that we cannot use vardepsexclude on oe.qemu.qemu_xxx functions
conditionally in allarch.bbclass because python module functions currently
do not support per-recipe vardepsexclude handling.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/allarch.bbclass           |  3 +-
 meta/classes-recipe/cmake-qemu.bbclass        |  4 +-
 meta/classes-recipe/gtk-doc.bbclass           |  4 +-
 meta/classes-recipe/libc-package.bbclass      |  4 +-
 meta/classes-recipe/meson.bbclass             |  4 +-
 meta/classes-recipe/qemu.bbclass              | 57 +++----------------
 meta/conf/bitbake.conf                        |  9 +++
 meta/lib/oe/__init__.py                       |  2 +-
 meta/lib/oe/qemu.py                           | 54 ++++++++++++++++++
 .../glibc/glibc-testsuite_2.41.bb             |  4 +-
 meta/recipes-devtools/gcc/gcc-testsuite.inc   |  4 +-
 .../recipes-devtools/python/python3_3.13.2.bb |  4 +-
 .../qemu/qemuwrapper-cross_1.0.bb             |  4 +-
 .../gobject-introspection_1.84.0.bb           |  4 +-
 14 files changed, 89 insertions(+), 72 deletions(-)
 create mode 100644 meta/lib/oe/qemu.py

diff --git a/meta/classes-recipe/allarch.bbclass b/meta/classes-recipe/allarch.bbclass
index e429b92437..0875bbed0d 100644
--- a/meta/classes-recipe/allarch.bbclass
+++ b/meta/classes-recipe/allarch.bbclass
@@ -64,7 +64,8 @@ python () {
         d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
         d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
 
-        d.setVar("qemu_wrapper_cmdline", "def qemu_wrapper_cmdline(data, rootfs_path, library_paths):\n    return 'false'")
+        # Avoid write_qemuwrapper to depend on oe.qemu.qemu_wrapper_cmdline.
+        d.setVar("write_qemuwrapper", "write_qemuwrapper() {\n false \n}")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
diff --git a/meta/classes-recipe/cmake-qemu.bbclass b/meta/classes-recipe/cmake-qemu.bbclass
index 383fc74bf2..7b988f45ed 100644
--- a/meta/classes-recipe/cmake-qemu.bbclass
+++ b/meta/classes-recipe/cmake-qemu.bbclass
@@ -14,7 +14,7 @@
 # with this use case in mind this works very nicely also out of an IDE
 # configured to use cmake-native for cross compiling.
 
-inherit qemu cmake
+inherit cmake
 
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
 
@@ -22,7 +22,7 @@ cmake_do_generate_toolchain_file:append:class-target() {
     if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
         # Write out a qemu wrapper that will be used as exe_wrapper so that cmake
         # can run target helper binaries through that. This also allows to execute ctest.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
         echo "#!/bin/sh" > "${WORKDIR}/cmake-qemuwrapper"
         echo "$qemu_binary \"\$@\"" >> "${WORKDIR}/cmake-qemuwrapper"
         chmod +x "${WORKDIR}/cmake-qemuwrapper"
diff --git a/meta/classes-recipe/gtk-doc.bbclass b/meta/classes-recipe/gtk-doc.bbclass
index 9d3911966b..28c0adba0a 100644
--- a/meta/classes-recipe/gtk-doc.bbclass
+++ b/meta/classes-recipe/gtk-doc.bbclass
@@ -35,14 +35,14 @@ DEPENDS:append = " gtk-doc-native"
 
 export STAGING_DIR_HOST
 
-inherit python3native pkgconfig qemu
+inherit python3native pkgconfig
 DEPENDS:append = "${@' qemu-native' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 do_compile:prepend:class-target () {
     if [ ${GTKDOC_ENABLED} = True ]; then
         # Write out a qemu wrapper that will be given to gtkdoc-scangobj so that it
         # can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
         cat > ${B}/gtkdoc-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe/libc-package.bbclass
index c06a2ce90a..b6094adbb1 100644
--- a/meta/classes-recipe/libc-package.bbclass
+++ b/meta/classes-recipe/libc-package.bbclass
@@ -94,8 +94,6 @@ do_collect_bins_from_locale_tree() {
 	cross-localedef-hardlink -c -v ${WORKDIR}/locale-tree
 }
 
-inherit qemu
-
 python package_do_split_gconvs () {
     import re
     if (d.getVar('PACKAGE_NO_GCONV') == '1'):
@@ -284,7 +282,7 @@ python package_do_split_gconvs () {
             cmd = "PATH=\"%s\" I18NPATH=\"%s\" GCONV_PATH=\"%s\" cross-localedef %s" % \
                 (path, i18npath, gconvpath, localedef_opts)
         else: # earlier slower qemu way 
-            qemu = qemu_target_binary(d) 
+            qemu = oe.qemu.qemu_target_binary(d)
             localedef_opts = "--force --no-hard-links --no-archive --prefix=%s \
                 --inputfile=%s/i18n/locales/%s --charmap=%s %s" \
                 % (treedir, datadir, locale, encoding, name)
diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index cbfc45b94b..c4e764e620 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit python3native meson-routines qemu
+inherit python3native meson-routines
 
 DEPENDS:append = " meson-native ninja-native"
 
@@ -132,7 +132,7 @@ EOF
 write_qemuwrapper() {
     # Write out a qemu wrapper that will be used as exe_wrapper so that meson
     # can run target helper binaries through that.
-    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+    qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
     cat > ${WORKDIR}/meson-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index e9fe757c7f..5b5a26dfc9 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -9,56 +9,17 @@
 # existence.
 #
 
-def qemu_target_binary(data):
-    package_arch = data.getVar("PACKAGE_ARCH")
-    qemu_target_binary = (data.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
-    if qemu_target_binary:
-        return qemu_target_binary
-
-    target_arch = data.getVar("TARGET_ARCH")
-    if target_arch in ("i486", "i586", "i686"):
-        target_arch = "i386"
-    elif target_arch == "powerpc":
-        target_arch = "ppc"
-    elif target_arch == "powerpc64":
-        target_arch = "ppc64"
-    elif target_arch == "powerpc64le":
-        target_arch = "ppc64le"
+python () {
+    funcs = ["qemu_target_binary", "qemu_wrapper_cmdline", "qemu_run_binary"]
+    bb.warn("qemu.bbclass has been deprecated, please remove 'inherit qemu' and replace function invocation:\n\t%s" %
+            '\n\t'.join(["{0} -> oe.qemu.{0}".format(f) for f in funcs]))
+}
 
-    return "qemu-" + target_arch
+def qemu_target_binary(data):
+    return oe.qemu.qemu_target_binary(data)
 
 def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
-    import string
-
-    qemu_binary = qemu_target_binary(data)
-    if qemu_binary == "qemu-allarch":
-        qemu_binary = "qemuwrapper"
-
-    qemu_options = data.getVar("QEMU_OPTIONS") or ""
-
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
-            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
+    return oe.qemu.qemu_wrapper_cmdline(data, rootfs_path, library_paths)
 
-# Next function will return a string containing the command that is needed to
-# to run a certain binary through qemu. For example, in order to make a certain
-# postinstall scriptlet run at do_rootfs time and running the postinstall is
-# architecture dependent, we can run it through qemu. For example, in the
-# postinstall scriptlet, we could use the following:
-#
-# ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
-#
 def qemu_run_binary(data, rootfs_path, binary):
-    libdir = rootfs_path + data.getVar("libdir", False)
-    base_libdir = rootfs_path + data.getVar("base_libdir", False)
-
-    return qemu_wrapper_cmdline(data, rootfs_path, [libdir, base_libdir]) + rootfs_path + binary
-
-# QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are
-# PACKAGE_ARCH, *NOT* overrides.
-# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
-# enough and a PACKAGE_ARCH specific -cpu option is needed (hence we have to do
-# this dance). For others (e.g. arm) a -cpu option is not necessary, since the
-# qemu-arm default CPU supports all required architecture levels.
-
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
-QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
+    return oe.qemu.qemu_run_binary(data, rootfs_path, binary)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 501808204e..b6215fd7ee 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -896,6 +896,15 @@ ZSTD_DEFAULTS[vardepsexclude] = "ZSTD_THREADS"
 # may fallback to using all CPUs
 export OMP_NUM_THREADS = "${BB_NUMBER_THREADS}"
 
+# QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are
+# PACKAGE_ARCH, *NOT* overrides.
+# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
+# enough and a PACKAGE_ARCH specific -cpu option is needed (hence we have to do
+# this dance). For others (e.g. arm) a -cpu option is not necessary, since the
+# qemu-arm default CPU supports all required architecture levels.
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
+
 ##################################################################
 # Magic Cookie for SANITY CHECK
 ##################################################################
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index a55694669d..dd094a874a 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -10,6 +10,6 @@ __path__ = extend_path(__path__, __name__)
 # Modules with vistorcode need to go first else anything depending on them won't be
 # processed correctly (e.g. qa)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
-             "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
+             "packagegroup", "sstatesig", "lsb", "cachedpath", "license", "qemu", \
              "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common", \
              "cve_check"]
diff --git a/meta/lib/oe/qemu.py b/meta/lib/oe/qemu.py
new file mode 100644
index 0000000000..769865036c
--- /dev/null
+++ b/meta/lib/oe/qemu.py
@@ -0,0 +1,54 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+def qemu_target_binary(d):
+    package_arch = d.getVar("PACKAGE_ARCH")
+    qemu_target_binary = (d.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
+    if qemu_target_binary:
+        return qemu_target_binary
+
+    target_arch = d.getVar("TARGET_ARCH")
+    if target_arch in ("i486", "i586", "i686"):
+        target_arch = "i386"
+    elif target_arch == "powerpc":
+        target_arch = "ppc"
+    elif target_arch == "powerpc64":
+        target_arch = "ppc64"
+    elif target_arch == "powerpc64le":
+        target_arch = "ppc64le"
+
+    return "qemu-" + target_arch
+
+def qemu_wrapper_cmdline(d, rootfs_path, library_paths, qemu_options=None):
+    import string
+
+    package_arch = d.getVar("PACKAGE_ARCH")
+    if package_arch == "all":
+        return "false"
+
+    qemu_binary = qemu_target_binary(d)
+    if qemu_binary == "qemu-allarch":
+        qemu_binary = "qemuwrapper"
+
+    if qemu_options == None:
+        qemu_options = d.getVar("QEMU_OPTIONS") or ""
+
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
+            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
+
+# Next function will return a string containing the command that is needed to
+# to run a certain binary through qemu. For example, in order to make a certain
+# postinstall scriptlet run at do_rootfs time and running the postinstall is
+# architecture dependent, we can run it through qemu. For example, in the
+# postinstall scriptlet, we could use the following:
+#
+# ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
+#
+def qemu_run_binary(d, rootfs_path, binary):
+    libdir = rootfs_path + d.getVar("libdir", False)
+    base_libdir = rootfs_path + d.getVar("base_libdir", False)
+
+    return qemu_wrapper_cmdline(d, rootfs_path, [libdir, base_libdir]) + rootfs_path + binary
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.41.bb b/meta/recipes-core/glibc/glibc-testsuite_2.41.bb
index 3a2764e40b..d5e3a2cb19 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.41.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.41.bb
@@ -1,8 +1,6 @@
 require glibc_${PV}.bb
 require glibc-tests.inc
 
-inherit qemu
-
 SRC_URI += "file://check-test-wrapper"
 
 # strip provides
@@ -22,7 +20,7 @@ do_check:append () {
 
     oe_runmake -i \
         QEMU_SYSROOT="${RECIPE_SYSROOT}" \
-        QEMU_OPTIONS="${@qemu_target_binary(d)} ${QEMU_OPTIONS}" \
+        QEMU_OPTIONS="${@oe.qemu.qemu_target_binary(d)} ${QEMU_OPTIONS}" \
         SSH_HOST="${TOOLCHAIN_TEST_HOST}" \
         SSH_HOST_USER="${TOOLCHAIN_TEST_HOST_USER}" \
         SSH_HOST_PORT="${TOOLCHAIN_TEST_HOST_PORT}" \
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 3257f86907..42f7f244c3 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -1,5 +1,3 @@
-inherit qemu
-
 TOOLCHAIN_TEST_TARGET ??= "user"
 TOOLCHAIN_TEST_HOST ??= "localhost"
 TOOLCHAIN_TEST_HOST_USER ??= "root"
@@ -41,7 +39,7 @@ python check_prepare() {
         content.append('process_multilib_options ""')
 
         # qemu args
-        qemu_binary = qemu_target_binary(d)
+        qemu_binary = oe.qemu.qemu_target_binary(d)
         if not qemu_binary:
             bb.fatal("Missing target qemu linux-user binary")
 
diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 0f0505c66c..30835796e9 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -57,7 +57,7 @@ S = "${WORKDIR}/Python-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
+inherit autotools pkgconfig ptest multilib_header update-alternatives
 
 MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
 
@@ -168,7 +168,7 @@ write_pgo_wrapper() {
                 cat >pgo-wrapper <<EOF
 #!/bin/sh
 cd ${B}
-${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])} "\$@"
+${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])} "\$@"
 EOF
                 chmod +x pgo-wrapper
         fi
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 6d0e7883ad..9fe43a6ce2 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -7,14 +7,12 @@ UNPACKDIR = "${S}"
 
 DEPENDS += "qemu-native"
 
-inherit qemu
-
 do_populate_sysroot[depends] = ""
 
 do_install () {
 	install -d ${D}${bindir_crossscripts}/
 
-	qemu_binary=${@qemu_target_binary(d)}
+	qemu_binary=${@oe.qemu.qemu_target_binary(d)}
 	qemu_options='${QEMU_OPTIONS} -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir}'
 
 	cat >> ${D}${bindir_crossscripts}/${MLPREFIX}qemuwrapper << EOF
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
index ac5f4e9370..3110c151a6 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-inherit meson pkgconfig gtk-doc python3targetconfig qemu gobject-introspection-data upstream-version-is-even multilib_script
+inherit meson pkgconfig gtk-doc python3targetconfig gobject-introspection-data upstream-version-is-even multilib_script
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
@@ -64,7 +64,7 @@ do_configure:prepend:class-native() {
 do_configure:prepend:class-target() {
         # Write out a qemu wrapper that will be given to gi-scanner so that it
         # can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
         cat > ${B}/g-ir-scanner-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
-- 
2.34.1


