Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFA9E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 17:23:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.336.1733937786193956559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 09:23:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2075040ffa=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB6qCCv028259
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 17:23:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx4xcf1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 17:23:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2XzpkR75cWCIfrcDM3EWlZX1riC7eX6F1sv6UT0caYESDcZbLBw3Qhv7a5wmKVwTW7J5Tb1i6kZWVpDOCzsDOEfWtPxxZJE/KXp9QMLV3sZnAruRLJNvVcho9E2rpZ3nNdEKwbY96lyDBdO5+xjSsliuy/4dvvHlw17TFoiFHg7FHN38Z3YcVERyDq4xIB0fwLPwSNWpAL9msNDRhpivWzPKbC5QAmRSpp9hkKs+7Uf4YjZll+xsy+g6fgVRNJiPbz+xDj4Zb80wIPcLVV61Ayc1ARikNJ4p2H5ZcEwv9CO7YPUcQpnnZ4pNefaalsbV9f7RrAgx+YqyKdqtR7QJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP/cz4YtBzmSVlsCKMVR2BQnTbVzyZb4I0tQd+2CGsY=;
 b=FvhuDKaQYvU3xD35NQYD9Z81trF/UrwPBwHArqcIxnq8RBFaUgd386J2sdAbwSV4TIbjhIQ7AzjZr46cnXX71SnKyBFVhH/rLCR3BYV6zsXP8tRcglQDjpv22Vo7sDxHjIvKrneEIb5BTjwSiP00V2s1kbFPBAq87oYFuAtDHjx6QEwpbKBQHCzaUvH+ilqCUOz/pe5hW7Bz0+lF6hQ/bu+nty9+Axf1V+QVyc3TxExULxfvI6MvTo3ktdzzwU/dgABxJET1p552bDZ08Q8Br86jSwVAd2vmgL/+I7+K2XsjMJmRzy+EN5hb4ZHhMt4SLLiRdNpUCIFlwErVSZ/uOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15; Wed, 11 Dec 2024 17:22:57 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 17:22:57 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [styhead][PATCH] Backport: Fix c++: tweak for Wrange-loop-construct
Date: Wed, 11 Dec 2024 09:22:42 -0800
Message-ID: <20241211172242.4040469-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::13) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: 2230fa23-4614-4123-3a0d-08dd1a087441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P84qKz6oRIZv2Xuwfhy0VpgCrgKfbT+Ja658nbhC7h1XXDNhLe2F1YV/1cy+?=
 =?us-ascii?Q?3nOzXPK/KJwLpYgigSfi3IRmvYpc/JsazDzmmNyqDp4Fpi8vhwn+GAcYBSnk?=
 =?us-ascii?Q?j/Www8nHtgTz2z9rBLc6FtpVproOrJaK6T4QwO/cXHvO/HZ4Y8QJgUWCxMHi?=
 =?us-ascii?Q?X21FzJ61FdmiAx6BqnrBUKGIIta8AIYeSwWI/XizpuJ6S0nHEFf/+r59fu+c?=
 =?us-ascii?Q?pvcu0QNWLXlYsF2GJW10daN0XypUsZlK3c5ny53gaVobKAwSjIlwTs34779U?=
 =?us-ascii?Q?7ZnsbIN1LEsE6Lj87IU5canGzTm23EghFgb8jmXs7mKKP56fGjh6tIyiw99W?=
 =?us-ascii?Q?aOs1P5nJNuQzjuPEP+aQQJSi+rJTxvUm9M0Fhia+ktvtcc5xxIYg6kvWWobd?=
 =?us-ascii?Q?dfTgyCEz+h3HUcPKfHKUCC/UhGWsfX+17UFBEP0vj1XivhCA5txNp91W2k4I?=
 =?us-ascii?Q?N7xlXCmuLmLGAQv9Vt8os81E78gKZJQWvRBT8CvPjA8pUfA1ZrROYO0cAnfW?=
 =?us-ascii?Q?BdS0QcnFAE55fnN3exGbcnnz8jPb3wo9GNHSvQDg/u784ZmKVfhJ6vlmcYCJ?=
 =?us-ascii?Q?FsXPrEvGf6V0WCOODVDXGz3/HribWFB19QEYK6GVmrxMsLWM6pl/oP52ROXQ?=
 =?us-ascii?Q?m2ulAP23ykVfvBilq4vJ3hw6ELxbxSjIKdKYNEvbCzwmm4A0ZlYllgR8inxH?=
 =?us-ascii?Q?IaH31cZ48eUKgQLetbmM7/orYxM1UKlJUEmnlQFCyv5in5r1TSk5i/w5HCe6?=
 =?us-ascii?Q?7mq0f9AXRvV1QbWr1q0JyFUe4bBUffk/2TNgIb5PpGtOitUqc48rUeiML41J?=
 =?us-ascii?Q?nndbUcbhozCZ3hFu8z8ffw+kvVSwy0ut/qXvcuXgkE+jYS/ia7FpE0YwDJ5k?=
 =?us-ascii?Q?M99KkgsysZnNXO4HMF/ReHNKPKrxtfwHrczo2OnryHxLkP5OT4/obrz0VIcT?=
 =?us-ascii?Q?1IErBuolCyP5dZIkFMhTp1ZG1ppIT/bQdNimhqDqRb92K2CnIdooezkMLEEM?=
 =?us-ascii?Q?6H75ri+XDn9zCV5c/3hGFPTFa6rmT15dheozt9hxnmW8erfIJ9kKW5Po33Nm?=
 =?us-ascii?Q?Utuf2nE99G4D5IJh6B8/V6o7dRFXjee3i7judVbXPEK26TUR2fdEuljbukPB?=
 =?us-ascii?Q?YwVCKtkQaKztDEJTzcxYrfPrs/kaF0/R4K5qNOjL9bqQABM/LT05JALUIJAT?=
 =?us-ascii?Q?igxJYgjNrpbnBmREDPh9pUwAMsCtBHoIzJDogLVz6g3pXrZ+qchvlz6Ze8PA?=
 =?us-ascii?Q?dOfQFGHvWjSjWsFQTNuG0AgLzIzdjw0fmKQCHTITG6285JAzyUdkZmHMiFqq?=
 =?us-ascii?Q?8rxwQvlH6cvbaGf7turebrVPgfmtoIhR3b2Hu1QbRt9OfdrnHqkh8AutJjV+?=
 =?us-ascii?Q?5lPYZMI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M5ZVv3YZSa+FfG3iu7XN3lobLuXZj890DvmaSrGaefymnb04Rrcap+8ipHf7?=
 =?us-ascii?Q?qPnmQXyRAaedM/mJZjaEHfnrPiWBx1cn27XuKbSVP6XJvRs5suQY1t8kb4i4?=
 =?us-ascii?Q?h6MI4ICL4n0MG25O/2pB7cRJl7XJHhSAHZIAlDDNSmG8scCdXYyLugeskuzq?=
 =?us-ascii?Q?0dhaD/RgtD7ZcU3KNzzpgoNm+wtMjglUJHQAn1jjxPlbNSea8ASq2AXgiQO+?=
 =?us-ascii?Q?GQTKufprW30yPlV1mFxKmXTvV7H8CU+hTb6gstpbL3kj3FiypBXdX+samGA9?=
 =?us-ascii?Q?7JZjp34BdANGTDQ4Q0vgeVZSWsgbyuoLuWfaf3hkrfURXA0bGFSs244is9ds?=
 =?us-ascii?Q?p3y2LOvJxImlvQRyGeglIiTgIU+o49bqWG1OKe2heMCoUrhx0727fJkptN/w?=
 =?us-ascii?Q?itTa+V1WwNKaVDevl4Y3/ChJ6iIkgkgyPsHSHcOqHpBNn3lrZxfiiXvX4ZVW?=
 =?us-ascii?Q?aQhmEaBvog3oqW9I3S9VzyCt0xusEDwdfiddZCjzqAjsvQzMb0nWyxJgftaI?=
 =?us-ascii?Q?Ks76VYWQ2S83Kl1HiZdx4fjpfrZVDciVIF6K7JeIG3YIr0kGpGrzHoiBzXls?=
 =?us-ascii?Q?x111uuu4A909TfQwoqgQ89QCMJiHKpC83cE9TETZrC6pwR9EnvzZ4baYQUKD?=
 =?us-ascii?Q?xjv1BPrdWNTNvlteJXgWEF+8eNJY3TAm3pfPjIFG6kgxEZaisyvR9Yr4Dskf?=
 =?us-ascii?Q?BW+7wa4phYPYK+B88INDHhJWonLlepvUMEBzbfRlzy5TlqJaaoHBhtqcyHte?=
 =?us-ascii?Q?QAp6TO/P5dZ5QfiHNHaX73KWIKu2lDlFnvbNdl6MMyAEc4zW78LEydBHXp8w?=
 =?us-ascii?Q?XYCbLLbkiWSgksJGVut0dvOiS22sebW7C8f3RKfDbAAl07g9KoM4xbziCsyg?=
 =?us-ascii?Q?VGXtHd3rPOpJhP7U0IGNBsFl4NEQuS3Y9l5XJW1Ouxst40RXE4QaVMdsQvtG?=
 =?us-ascii?Q?Tz4HiszvxT9IsKqZD0E10i3ifqnmOJYT4XLMILZQWlvkx8Lo58AZPEW/GrZR?=
 =?us-ascii?Q?Yig/kt4XZ5oYcIWXb8v+n79+M/jw2FIoB/VtP+2qtzQVvOXhZgpe53D2d25R?=
 =?us-ascii?Q?0wyMw7Y71NEdKqls6KUe+HErrjvxlJy805amPlwxdy23gvc7SlrYTuCfoesP?=
 =?us-ascii?Q?2D20h6117UGmvSrbX/Tf4V9PaQhU9V69Uvx/+Wg5rtl8182923iqK91EyeUd?=
 =?us-ascii?Q?VOpB5u+55WhauoovqT9kQfIbQwPcsvpvQLKdPS8JAcfTOkB7RTGXsXrSu+wt?=
 =?us-ascii?Q?3JW0qQA2vquDVhYcD5Nog1v6nsPTckfsSLHAtCcpUWNrUUVEGNGXvB74oeD/?=
 =?us-ascii?Q?9r6mpL+cxH3jJsn+1PGid3RVFb22gBK2RKBPQr+CXBJ3IU4/KV0clZZOIeCp?=
 =?us-ascii?Q?M4IPBgAoV4yt6vK46dTDyErzVzDXcLEY8vfby1KBhZDCW6f/v6GKIyVplGKD?=
 =?us-ascii?Q?9vzVtT5p772insk7UcOme1bD8RL4IB79GRqO2h2nYXf53CTjvhHHFkvHt2E/?=
 =?us-ascii?Q?2AsPq03RCrv41W69JaWeWNZSEmc98/OwQWOhS0LoYBLnbTUk0PVzDxJAsb4r?=
 =?us-ascii?Q?OaT7nfqcGS33L3y9poGy21tCRQDk2DaUlshAoSWiE7mKlv8PbUiCy7mwwLDI?=
 =?us-ascii?Q?JQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2230fa23-4614-4123-3a0d-08dd1a087441
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 17:22:57.0334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4U9TVK9pSlGMCRUB5r61IPRtFg8SJccuGLABPONLIhB/8iwUwyURKSI87DXoTM8dhn8TzrdY9lEWnquDUEbAoHLUb+dxSP0NObmFSQyLf2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
X-Proofpoint-GUID: UfqlZ_3S99unBh7grx9StjQ8U5f6ZH-6
X-Proofpoint-ORIG-GUID: UfqlZ_3S99unBh7grx9StjQ8U5f6ZH-6
X-Authority-Analysis: v=2.4 cv=Y/UCsgeN c=1 sm=1 tr=0 ts=6759ca79 cx=c_pps a=AVVanhwSUc+LQPSikfBlbg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=USuHR67c37jO-1kvC0cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_11,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412110125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 17:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208598

From: Sunil Dora <sunilkumar.dora@windriver.com>

This commit updates the warning to use a check for "trivially constructible" instead of
"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
to types that can be copied trivially, whereas "trivially constructible" is the correct check
for types that can be trivially default-constructed.

This change ensures the warning is more accurate and aligns with the proper type traits.

LLVM accepted a similar fix:
https://github.com/llvm/llvm-project/issues/47355

PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]

Upstream-Status: Backport [https://gcc.gnu.org/g:6ac4e2f4b2ca9980670e7d3815a9140730df1005]

Signed-off-by: Marek Polacek <polacek@redhat.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 114 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
index e90b5b4c2a..1378cfc1c3 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -68,6 +68,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+	   file://0026-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc/0026-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0026-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch
new file mode 100644
index 0000000000..0a2db4e36a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-Backport-Fix-c-tweak-for-Wrange-loop-construct.patch
@@ -0,0 +1,114 @@
+From acc5e13c2ea91d2a138c03cd9e5d8826a1a74e4d Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Wed, 11 Dec 2024 00:09:43 -0800
+Subject: [PATCH] Backport: Fix c++: tweak for Wrange-loop-construct
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


