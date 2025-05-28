Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689B4C5AE59
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 05:00:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8870.1748408397032619435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 21:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7243c53df4=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S4od5x027116
	for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 04:59:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5393m0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 04:59:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7QNFadppJpXzTr5WJXzA8a1mZCJkUG2fzlIaUj/TXC9T8RMLGR0iYvW3GvosuRanKxasG8h4FxjhtLHBqPCfvlKfQqcWZ2+sc4uOUEHLopV+qlLf7TfFB2U4IHr9Xy6i2QBPHbD1Lz2sjpgw++pJihRdXbdmKVjvGgKAIAImHlIX8MMVKsb5KMF1N/Jhx4IVHbK2UJr5J3rr1qVKAdxOfQ54UHP97i5KTk+6/MgzlFWbdyw10n18YOjfDZf0W/AjxvN2vh+iMYhescfSJQ+kAP/0+erOPUvryeU1JxUo/06oYFqj34IX1r7t9xml1M1z+qNZbw/c6B1BTV6sQNRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAoBIGp5NEOQYVa69jMO7sJbZ13CC+3IZUo8l+CTTDs=;
 b=QwSNiXORiJzDOGtDZy6JoilfTH9CEIzUgk5fFp/OVl+E22gapUAT5aByag7Wj8SnhVjz7WN9Hkvdv5Rz1GI/7tyEgNYoxaOQafgLx8t94FoBRu1moP8o+TzEomZzyFKhOndOlisYq5p79zgeay24naGbVr/EtMDf+chAi/J7eG4bzU496rw7WJfbnPfX4FDKxAcTRx4E/jm3wcJVkh1QuW0Ir1bjrUTW6YbcidE6q7xePaJFvLUWb7JNk92bg9TEcnXsYcICJXvW9kQp6O6ZAFPyNupsy/fHtPbDS7Imbvj8NmkgphyseQxJFtsC9sHeShEzFwgdPlWYISINiCqzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ1PR11MB6106.namprd11.prod.outlook.com (2603:10b6:a03:48b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 04:59:52 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 04:59:51 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [walnascar][PATCH] binutils: Fix CVE-2025-1182
Date: Tue, 27 May 2025 21:59:13 -0700
Message-ID: <20250528045913.1395184-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0122.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ1PR11MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 625fa72c-5b32-45b7-7913-08dd9da47abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XokmJYw+XfEH6Yl4Zs+PN56mCqIpI1hMhLTYclgzdxaeo269Hm/kjON8FxZe?=
 =?us-ascii?Q?aeD5JUM479VaZhnkAzmSF+uMGcFfqhBTxcSwpwI8iE2gd2ckxU+8O8KU9aEI?=
 =?us-ascii?Q?kmXpNwccPPuHOwAOxgqX8fPBQ7pOVlZYiKZ5UgAeyfegee50wcNXf3gD3yYn?=
 =?us-ascii?Q?jFAf2dkJi6/snjlRZmW4L6SQXS7F08umtWDRox+MgbnTe0qhh6zzDK8xcBqK?=
 =?us-ascii?Q?KbQ2znl70QQiXi9W3WDXDQD0ArLJorj0yF/SZB0VsxHg+pp8shHnA0R6xjRm?=
 =?us-ascii?Q?U+f2VBp0uth0jmDYLyrMbbXXHDduIJEeGlZ2x565qSDYc02VzJLU37CXvxSB?=
 =?us-ascii?Q?Y/UiFa7001PyTexjPcDXyhulnkpFmdYyzYizfCyHEo+VMk2TvgU90aK8Cm6G?=
 =?us-ascii?Q?9V6QvkcmqRxQYzMyvQe21wv/B/rK6O6cohSc0nu/PKDt8YXdKEqtAaJPMucf?=
 =?us-ascii?Q?GA16Ks8klnMVX2PXpk5Dzc9uNUmjR5X1wkL4TafGRis6xUD/XkmkQLBjNtf/?=
 =?us-ascii?Q?JlRpF2JXKXYxHhDhc1LFMNpRDMu/ILi0FFNwGB+fLrq3Qw9t5nfrAGa9lf3T?=
 =?us-ascii?Q?wl+gOVTNGidsFvWACtqnCpFhu5WEHZMqV1eNrvkZnIELMZpSx2RebP3pBqyA?=
 =?us-ascii?Q?qMxwfVkyn2jfb0lzjyE5LoMycC0X6SywnrFr1uYg81HuiIIdLn2UwvKbji6O?=
 =?us-ascii?Q?XdU30EjQiYf6VPMRLW7EQdB6iTg7QJTj7paFVXOaN5mFP1OrlehOmvL82wJE?=
 =?us-ascii?Q?/7fgcZRRdNP0slbKA0BsHHlKFUim3yjLNXQfnnAcewYO0WDPssesaKbeguBb?=
 =?us-ascii?Q?Ce5vfe44fru//fUUaSk1o+LE7DkWtICiy/iyLamFp3KkP1IpTv7um5t1KM9g?=
 =?us-ascii?Q?XWTiIjNCLk48BzCSQQc7WZE/9eK4stLNanSY5SAABK3UBdBGDLT/MrdtvkA6?=
 =?us-ascii?Q?i/9PYcrnQqChlgr5N7SZUzAMP+wAUKqBz6ZBBgfw435Ioks3csZdn8FGDWDb?=
 =?us-ascii?Q?Hx4dLecFjvrBYY3R1fnucrYQ0xD41U6ShS3+VD5tGzwMbN5pPYkj8zkCHWTV?=
 =?us-ascii?Q?TQ4g6c3dOw62NVYjCsJr6l01inT66s7ZU2u6qphbmyPquusJBDeSh6L6gixN?=
 =?us-ascii?Q?HOlofFvPR2g/vqNwKnam0Jw1qn7t9u1JxbEEL5B1LORBcxl0w1LwFadXs7PN?=
 =?us-ascii?Q?TFPn+M7cmadItHb4TTsnkZlFu7jxgQsJbelc85k6350Q/oKPkr2zAF3xnuxK?=
 =?us-ascii?Q?U5LgZl5iB9BL9HkGc9Wau2h5XBgAHTpBuQM0yzydHbe4Q7AlaM1eUe7iIow3?=
 =?us-ascii?Q?7xhDhmeCSj/R5gUQdux8rQ5d2TgRcC1OcKyCS/LMoI95FHdKqMEfH3bm5ChJ?=
 =?us-ascii?Q?b5Ralpa+bEn4dtR/W4PaC+aWJDJ/VyE6jzfPZ9IXUZ6tale3maD8Ay/zalkN?=
 =?us-ascii?Q?GBJyf//8s0c8vybQ0Ak+GvHRhUBvp64PD26lLumjL64NHsyvFJzVDZHecHca?=
 =?us-ascii?Q?BhHiLiJZm/VTIs0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M044jWKLPrQZSOD3e45uPLJ3/0naLb/WZlpD4mm4/95StFCOjOOMNQ10h9Gp?=
 =?us-ascii?Q?oW0cfx+uWfjCvnnpJszp86JuaUEjAbgHYP6VmIND9/h5d5PPJ55cBXzruYDh?=
 =?us-ascii?Q?wiO/M+J4gYU+EwLnI6u/ugB+O3jBKPnt15EVZP10Hiba1akuGEPoKCZgiYF5?=
 =?us-ascii?Q?aTChNAhjeu/WUBZ7w4Ovi4dhk9y89xNZtDbI345D35LKGrjTzx/uU2H3leB4?=
 =?us-ascii?Q?aZ0KxI7kfqyGro/elCkwckBa7MxmCmiICrsgMP7L2NNc9sL/KcdftgpR4EAy?=
 =?us-ascii?Q?auMLlnbcrGu81QjMRtWde5YHKGniloxV/4xzFyoMdhdSVubNpImSy2rIpOTC?=
 =?us-ascii?Q?lsrSDzDgDa8E69PmyuyWj+PE8yemriEdQgv5yfRaIobQ+Sego4iAOPglFu6C?=
 =?us-ascii?Q?uhSWnsm4DUUEnwMph9YIlFGCC5Vwb91MDQZrid/yV2mbv+MkeTc8YAAzmnyQ?=
 =?us-ascii?Q?yCyryN1ZdDXXR4iooPaKsY/4NDrKzE5Wt0geVJRCC+seGeiUagvEMi4xjYKj?=
 =?us-ascii?Q?E+t09a03gO6Kl+TDSfPZLblZGRAbsYIHWf9u8/Rsr5f/m8Po3sAE3rx64RMx?=
 =?us-ascii?Q?XNIsv918z1Vg5Oy/HDyP2cJ1fdn7ywY7c6r4n/bgnJEX22eViEaA/fqIe0BL?=
 =?us-ascii?Q?DFuajgBnDS+cUKwFymeRSpqoLY5/Vkl9gTZPLEBdHWhBW8Q2vZpOIYuCm8cN?=
 =?us-ascii?Q?N7mSkhkDU1spFP/dfmKSCtpp3n1W3ywcw36JSmdZ4JuzSfV7eP0/eL2i9ZxF?=
 =?us-ascii?Q?16c/IAUisgNfAkwyU89yB9tJ+qtmO0+cBB6Ku0fqkwYbSCFTaS0lGaTIgu0R?=
 =?us-ascii?Q?u2Mixc1QQ3HAYXJdFSeYaFMpAljPLrvw30kQCgZZQsmPcHZXN/zt9diCAtQe?=
 =?us-ascii?Q?4sB3DTD+lOWCPfh51yLvXaHCOgllFctcOnjK37k7OtVsmQHecrdLB8dyFwdX?=
 =?us-ascii?Q?EDA0gq5NO9QBRRFTMkl4iXlcuuoQyPcu6ROEP6qyr7joWK1Oam4RBv5je8kh?=
 =?us-ascii?Q?lrlQTN2fqWMBdhSCWUTA4VE+1U6Ptx6kjmwiR3CU5RDOukNDWZwKPDNcc0aR?=
 =?us-ascii?Q?vOKmA9Idos0eAn/SgGPeRwYtQhlJEOFQ2W302zjJLAvJdzG6sqQMZw4pwxDX?=
 =?us-ascii?Q?PQq2aavXgXkbWX9qxvWZ53OlhV2NmMilJjvfAx86vyQLvIu746sSbZRFXWLu?=
 =?us-ascii?Q?c5VY/BHq+dOfc4RR3M6D1owMnYq6Wrc+ZjPLIm4x/E3ArpE/o72vUNTgieTK?=
 =?us-ascii?Q?6CkJWOpoqqZtetJ3NWzvWgXT8faaeJyeJjeZciP0oxGuIc8XT3/bNUHq+D1o?=
 =?us-ascii?Q?IQ8zokxbMYbmUsG8KwgPoShKXt1SYBmShykz2on3HRrvD/wcpRKhP1xBeVl2?=
 =?us-ascii?Q?ArXk3Px7rG9QT84ddpwv688+0IZmuzBBlriMUn//D6xDq3vusapS+fsh3j24?=
 =?us-ascii?Q?5DgnXeGY9Ui8pAOMT6Fv9kWuzwKw6Qb1EJHOVC4Bvu5roMyjHFigqbzlWhYk?=
 =?us-ascii?Q?+oi3DcEshw1S/1hIVWcw+tK0qtW2qj7/12syhMCVqgP0eOi2aL2X+af7tIQs?=
 =?us-ascii?Q?QZbs9oSlJaq1uAfuds4oX1p3nrS1U78gof/FeORr+b7lVJM3kfOAFX2jj5Yr?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625fa72c-5b32-45b7-7913-08dd9da47abc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 04:59:51.7908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OM1D/QS19vn/rldvdqJH7vfPe6w0rWURcH+o/eD+dpncnLff7hMG+DbQIjaejd3XtJbzYN3YduvMoj8mIKSoLRa+o+zPMoCafwEIxKU/CC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA0MSBTYWx0ZWRfXxE2edUhvzO2C hlELtZ5of7p7mwsnjqqQZ4gG8dKSJMEjP3xf3KxyuVLu5uIwpglbrHSCiYijU+MJyYkEb3c8dee LCJ9euc12eavfEDrN3fpbkDT8Q5+XjmQ7qIufgPphxqjC/mSryIPvGHLcVxDVDiMaUUPIkNT1RR
 98bV+xEMSbFTCNOLjK+cThRveYMPPL/UApmC/D9t5EfAyIHZh6TDGSb+OItY18dO+R4qP+I/ydL lPmLul7KHbxEf3z5trmc8Dn6Lkcn8s6dBfvYxv4+UZUKIuOPrxkyLwDQ0u+s7xx559fL0BwFZ7X TNY1wm+ehULH73VkjokoF2s02VzgYlq31yIIAHRax0d0PLBSnaNlqveWzQ/f+BTmtYTS1pt5rpX
 kEVkvD/X/hO4W3LSQU+u0bKxklTGLiD1IcMIn0J+QEmuwILCQBvDwVEj8WB6qgtH+Y40iH/n
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=6836984b cx=c_pps a=2PF/rzsYy3Hr2OqMyPqH5A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=i07ikm3d_HJQnWEEXj0A:9 a=Crtr6NTttn0A:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PmI6fvdJxQpXnJpid_3bByeHZnQkXeyl
X-Proofpoint-GUID: PmI6fvdJxQpXnJpid_3bByeHZnQkXeyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505280041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 05:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217333

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141415.html]
CVE: CVE-2025-1182

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/binutils/CVE-2025-1182.patch     | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 7a19aa31d5..53059393af 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://CVE-2025-1182.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
new file mode 100644
index 0000000000..b02b9fd1d2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
@@ -0,0 +1,36 @@
+From 92bcd04fcd97f261ff40e9248e00a1dbebf3a536 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 27 May 2025 03:37:50 -0700
+Subject: [PATCH] Backport fix for PR 32644(CVE-2025-1182)
+
+Fix another illegal memory access triggered by corrupt ELF input files.
+
+PR 32644
+
+(cherry picked from commit:b425859021d17adf62f06fb904797cf8642986ad)
+Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141415.html]
+CVE: CVE-2025-1182
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 6346d7e2b4b..a0b237b2224 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -15084,6 +15084,10 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+ 	}
+       else
+ 	{
++	  if (r_symndx >= rcookie->locsymcount)
++	    /* This can happen with corrupt input.  */
++	    return false;
++
+ 	  /* It's not a relocation against a global symbol,
+ 	     but it could be a relocation against a local
+ 	     symbol for a discarded section.  */
+-- 
+2.49.0
+
-- 
2.49.0


