Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536C3C35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 09:36:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3883.1742376955750051636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 02:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5173a78b67=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J7UKt6003009
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:35:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h94bk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:35:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkjO72rM9ykiIBRI+NwMQZq2X8+4SYugrsFqTiRR6Y5ElV9M7Y7NR+CqcEevKZQmimV1jhXn6UuY7HigjlHpzakP7O6931umpjQl5q1+x52XsPXuasLdjgggcXvRonJQjjlup5UD3PwpdJPAlQpzm4JpCktXrRgQ7uYam73B5YSks8V6HxBgFXe8shd0acJUcnNzI9vSLoLJh8hMHr8JM0wtu4E+/Pl4QYkH6eDYaCla/82MuLwzAVw+fhWd1nU213O+arNgvRWGpvN5zCf6tsJDt+9DRQni7qEvDvCtSbdSDWwhG5VNem1E8wdlYhBMpehcCHMDN1kW8zRfgQlzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AA5wxcitO2ChQvmG3IbfkqU66abHBOGJRuoeectNSkQ=;
 b=fWrtYkKfbEVlURu8yjb7vOhQGhEYDLLo4Htay6uRiZ6mFwh0K0f+j8i5GIIipOghAN3qmCaLs6mnpIY7Jew04rxW8FqxIeYt4M4hMhQ3O2qskwjZef2nyapDOUw/F6GbP4BEaHdqO8PPGoTjmOfncC9IjamZs32QvEpdceAFxrkQvPSiaUq89OhbFGe+qtK1woV2NsRghmd/RE2Izlf2VNWxGJP4l7zBaUm8mthrxU9O8oRRoAQZ6M+9OxDh764qj3Je91fj0PJXuQHqHKVIy8YcWFGiGF1f05M6NotUFFsqRZrqLpfSdWCC5En1H3iNEuK3Lc7dijhi5cOpkyC9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 09:35:50 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 09:35:50 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: Fix CVE-2025-1148
Date: Wed, 19 Mar 2025 02:35:35 -0700
Message-ID: <20250319093535.3368863-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 861b890f-a7e0-4280-10d4-08dd66c96fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d0REUaWLMsggFE07XKDj4ZybxCK1YPnscEobrdW33mqJVWGMSxf8Z5VR+p7E?=
 =?us-ascii?Q?72DS5XYLvBpYVmQYTIShiKQyHgqUqHlQW9PbgzwSS4PEnlzRxz2NLy9uOC5O?=
 =?us-ascii?Q?9MzIGG1BGaEUaYFQJ+Af2wTaze6Hzbyr6SsauRoMxVm1C4KiLtQ6GxDJ17fP?=
 =?us-ascii?Q?HIWsLtYGKeh69aSMjNiSvnboKZLsNMCwO3zUIqA/b/FfPxCnOcUZ6vmTPDKU?=
 =?us-ascii?Q?r8ih6RlgWBxS4sVPLwv13uN+zqEdk/K8OIMi7WLYB3Morc19gu0A4QBMEd+D?=
 =?us-ascii?Q?cBTJ4c8rXD+eL49pxT4b3Kmt7l1BwMrJTu1goJ9C1Be1ADTBFL5IetsPtgBo?=
 =?us-ascii?Q?p1T92PwMeBQ9xjWen9vjMno1XWEsuuvpBiRqVI4dPOPVvZ+3gAh69JfIdkZa?=
 =?us-ascii?Q?QuRhnGLen8saLnzWd+vf08wvHVggGgeOWFumnPQoj7IlVHzEM+jHvcA1wHHN?=
 =?us-ascii?Q?Tir8e2graniIGZz95WkFH+T2fichsutTLs6eyK4zhBve26CDHiq+HmXpHRHt?=
 =?us-ascii?Q?Fmc80jPrUhjM7jidsoAN2r40C0Az1D+vNn9TOsUBsnUFi+xoUYg8OdhUA79H?=
 =?us-ascii?Q?i+Sb4B8U5+Upr7hMAZf7AKVEF4/BllpV6BPRtrAUeaYpf+HH2jlK3vGAUD9/?=
 =?us-ascii?Q?iTZH+1aQJ9VgboaBIuPPFSNUQ6Ohs/FdKvAVvCtkaicSnBtrHDxvOtW5oxKn?=
 =?us-ascii?Q?pkRfMJTk3BVYvD3hI8UVZlhmPMrlDiuIIqvNXt4aSA1gS5zUiFNYdMRp+eV6?=
 =?us-ascii?Q?Nson1bBqkb2TBX6B8Ybjvlbmxe2HaNCdy9C8ouOiR0r1xBiIPg/PEyGQu5Eb?=
 =?us-ascii?Q?/HSwJdqwUuYhWqy63qorit3FA2hajRETya50C2eUX/+0cX+2GcqhLvUit3J4?=
 =?us-ascii?Q?7E/Zos9aKuAb33c1GEmVtdRCz4ZuclTIbywU/z7wyMhUD/A8UWJ89h3vV1IY?=
 =?us-ascii?Q?6Kx9YHJkkuudgT+GfsGLUwNO2RfVCPuGt4QMftruCPeojaZ8ax9De76a5EXB?=
 =?us-ascii?Q?Mv4n3hZgGtjHgmTw1BpD153QxkJFuAA25/brwdMQZG5pggU22SbJfixoyT5w?=
 =?us-ascii?Q?RnWbEXksCLCXV5ZrTgtf4W5PM/6HTcJ8j5uUcdkmwjNdqD+jc1sXurhjn4Wh?=
 =?us-ascii?Q?aryyZFgDQZSyAxifXbBr2qtX1Q3xssyMtfpzpMtGd1bUJyMmAnsc07M3U/IK?=
 =?us-ascii?Q?7YIFrg0zj7ob5MnA6r2r7b5yxE8f5TH1GzvI5ut30FH58S9TTqEqHM7uw+f2?=
 =?us-ascii?Q?D5FfGYK4uhyoSe4QuUsDz4whIlfLsrOuh2Iz/E498QhlL6YCWS4lE/pefIa+?=
 =?us-ascii?Q?fTKFsAl9sOR7QHsKdi2sENdyamThuYwL3ZNhewMhdgeRfAO8QsHsoHVzcb3O?=
 =?us-ascii?Q?uBYma16JZ31Qqz/R/NNj+v72ZGHFJALBSVixDtdEoIuNgM82LBRWWZtwOGBR?=
 =?us-ascii?Q?G1TU6uCbHjB1g5kYsrJd2cOaN9kaZfpE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Euhn5qQS+R9VXl4TD7/ntY12AC+8Z3mtVuQNF6qu+mTua/mGEKwCq/paJTMv?=
 =?us-ascii?Q?iU2eLdRX7mFGeUqKqZT7rhqUScfJiNnGze844s6fvT2Is29t8NPhBttz0+fp?=
 =?us-ascii?Q?kPAUeMMQ79Qv7bjovZi89jbyyJ3tCsS/YT28VJFLFWK0w+YGTTTRj7luALHn?=
 =?us-ascii?Q?3u93hGylwP2lRD/RfN/RNJSxLGGTqMsZOdViHG3/xeuCVYaYkagK7TA1/jsJ?=
 =?us-ascii?Q?0nyOmvSAbXRL3utk8zHftUnfpt2q2WS4N8oMRNm3qOqEmD1jhNewQ7zhg6lR?=
 =?us-ascii?Q?ur/pYc1n2FJ9TEUrR8osFs5C9SXZ2EtsxhSB7gmcIAy8lLyoVKv6sAm2cmbM?=
 =?us-ascii?Q?ntCAplEL/+EfFkK5L1nkdE/60cB3Q09BCnppTyQ3IIPoXlXGdp6PLteEXm+l?=
 =?us-ascii?Q?biXSpepio9f/3tznfflg9HX96tJsE+sPa/IybgA2x1Zf9YL11NodFc/Cv2XO?=
 =?us-ascii?Q?sM3t0AhK1UJ4NbuG5WyZ1n32zvmrfI8sWRDF3CFP+475J3CJsFcBdlExJPBg?=
 =?us-ascii?Q?iJbwjVjpM1OxrpkUghICECddDBJes/fJkxdOIkMozH7QAtVJgqg2nBeojuVC?=
 =?us-ascii?Q?R2o/B9+YH5b/xix88lbj4Dk6gMuAK7F69+eJdhlk+47u0ZXh4ro5zfrULEa8?=
 =?us-ascii?Q?E57kNTLRUnXGeiqs2VyMSl3ueEcyFgBNSYsvTDCCv1BAaxu0joUY43z2VsOT?=
 =?us-ascii?Q?2/mP1q++FHR/yzN+Yv3x/bJH6BDEqyZdVnyB4+9PnrMZOSIz2HqgofpzJWzA?=
 =?us-ascii?Q?6zLau4FTXU9nSGy5r5uEgk3l75NUhl2++0Yydjw2NKYpY31Wq+Hijwj0EMkH?=
 =?us-ascii?Q?ifI4pcBF1Bdw//87agK0xSfWl0XF5GcrQm16+G7lQVix6vHg6oJK1KVt5ZDi?=
 =?us-ascii?Q?ct5UplAWKNKMmGauyGCwA9XgaTAZdQA89dzhS16xDv0SPOhAp6cM3puidKZj?=
 =?us-ascii?Q?Klm3mEV7VdKc5z1q/BicOIcZmamyt7mONg5urBjOHqFXZiQaGI5bePYgsh0d?=
 =?us-ascii?Q?kk3vkyvnUtIJmwaxBYL6MGF1XKeVD42+TPO5/eht+TMwPYFgjREu5+NWCjPS?=
 =?us-ascii?Q?1Gh720HeJ/CXoHmXqEGROwHkqPBgFGed+gax6Bc83PTWk0qzlJXEbxVuiiOn?=
 =?us-ascii?Q?gLsSq5KlFj2+xVfBR6xSIjr+x/L0kb3ObtHv/ZQ+jJqIrNtB6voEQ/2ZjVqV?=
 =?us-ascii?Q?g6o5wBXdn6P3Lt89t1R1w3Quv06FNMwOVH6hYU6Hl8yVQLijNuEXGyQytv8A?=
 =?us-ascii?Q?HRhrgh87tsbzJS+mkXGLpSxcHYRDIIsBqKFJlhkfy/Hj0hbRlZWVb27+OSCC?=
 =?us-ascii?Q?Qau6nk+z1s/RcCg4EnBS4epvFwbReSHcmldLH27cgNXuQSs8OhENWnhxXgDM?=
 =?us-ascii?Q?Jzv3ITg7ndviKO1qpxMgHss3cD8rcwcLlIxMUwuNKzTKx73/BeHuPpobRpGy?=
 =?us-ascii?Q?jHQtDLD8T/+G3fD12DkA9xk/wEAJMV+ZSUhnYOwSiZqTPG48Qfhctgwv8P26?=
 =?us-ascii?Q?rILSem5Z3z3f/CmxbRAzoEK/jYv+R53x+iyvtEtpg8Ox+wYJLLQ3qnD9LQio?=
 =?us-ascii?Q?+E5nMJ+2LgFNndAGDEUVo6ByXfX/B/Y1Q2DUHgeT3vZI/HjUBs5aebFIujsA?=
 =?us-ascii?Q?Sk/1T1/UzJWd0sGDYDdKNA0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861b890f-a7e0-4280-10d4-08dd66c96fa2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:35:50.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrJ2H8ZPjLS7OW5jq09jJg1mqs/o8lieX1nZkYxsnow9NdcIU3qN/urbzcsFYrqHmO5xdDVhnw+3AS5zL/EVkFhJ9cxwVuo2M7orewRidzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
X-Proofpoint-ORIG-GUID: -ZWTVMxHGx-_JGh_55H61ofWdT4HCLpg
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67da8ffa cx=c_pps a=WCFCujto17ieNoiWBJjljg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Md1DUJNPIsd-qgsP6tkA:9 a=L03L2QfmqWoA:10 a=3ZKOabzyN94A:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -ZWTVMxHGx-_JGh_55H61ofWdT4HCLpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503190066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213315

From: Harish Sadineni <Harish.Sadineni@windriver.com>

A few place dealing with ld script handling made some attempt to free
memory, but this was generally ignored and would be quite a lot of
work to implement.  Instead, use the stat_obstack rather than
mallocing in many more cases.

Backport a patch from upstream to fix CVE-2025-1148
Upstream-Status: Backport [https://sourceware.org/cgit/binutils-gdb/commit/?id=d4115c2c8d447e297ae353892de89192c1996211]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.44.inc                |   1 +
 .../binutils/0016-CVE-2025-1148.patch         | 596 ++++++++++++++++++
 2 files changed, 597 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1148.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 1aafbd5285..7b376d3676 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -36,5 +36,6 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-CVE-2025-1153.patch \
+     file://0016-CVE-2025-1148.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1148.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1148.patch
new file mode 100644
index 0000000000..5d8b947431
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1148.patch
@@ -0,0 +1,596 @@
+From d4115c2c8d447e297ae353892de89192c1996211 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 11 Jan 2025 16:19:09 +1030
+Subject: [PATCH] Replace xmalloc with stat_alloc in ld parser
+
+A few place dealing with ld script handling made some attempt to free
+memory, but this was generally ignored and would be quite a lot of
+work to implement.  Instead, use the stat_obstack rather than
+mallocing in many more cases.
+
+        * ldexp.c (exp_get_fill): Use stat_alloc for fill.
+        * ldfile.c (ldfile_try_open_bfd): Don't free yylval fields.
+        * ldgram.y: Replace xmalloc with stat_alloc throughout.
+        * ldlang.c (stat_memdup, stat_strdup): New functions.
+        (ldirname): Use stat_memdup.  Don't strdup ".".
+        (output_section_callback_sort): Use stat_alloc.
+        (output_section_callback_tree_to_list): Don't free.
+        (lang_memory_region_lookup): Use stat_strdup.
+        (lang_memory_region_alias): Likewise.
+        (add_excluded_libs): Use stat_alloc and stat_memdup.
+        (ldlang_add_undef, ldlang_add_require_defined): Use stat_strdup.
+        (lang_add_nocrossref, lang_leave_overlay): Use stat_alloc.
+        (realsymbol): Use stat_strdup for return value and always
+        free symbol.
+        (lang_new_vers_pattern, lang_new_vers_node): Use stat_alloc.
+        (lang_finalize_version_expr_head): Don't free.  Delete FIXME.
+        (lang_register_vers_node): Don't free.
+        (lang_add_vers_depend): Use stat_alloc.
+        (lang_do_version_exports_section): Likewise.
+        (lang_add_unique): Use stat_alloc and stat_strdup.
+        (lang_append_dynamic_list): Use stat_alloc.
+        * ldlang.h (stat_memdup, stat_strdup): Declare.
+        * ldlex.l: Replace xstrdup with stat_strdup throughout.
+        Replace xmemdup with stat_memdup too.
+        * lexsup.c (parse_args): Don't free export list or dynamic
+        list.
+
+(cherry picked from commit: d4115c2c8d447e297ae353892de89192c1996211)
+
+Upstream-Status: Backport [https://sourceware.org/cgit/binutils-gdb/commit/?id=d4115c2c8d447e297ae353892de89192c1996211]
+CVE: CVE-2025-1148
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+
+---
+ ld/ldexp.c  |  4 +--
+ ld/ldfile.c | 17 ++---------
+ ld/ldgram.y | 21 ++++++-------
+ ld/ldlang.c | 87 ++++++++++++++++++++++++++---------------------------
+ ld/ldlang.h |  4 +++
+ ld/ldlex.l  | 23 +++++++-------
+ ld/lexsup.c | 22 +-------------
+ 7 files changed, 74 insertions(+), 104 deletions(-)
+
+diff --git a/ld/ldexp.c b/ld/ldexp.c
+index 035cef60448..87d882e5066 100644
+--- a/ld/ldexp.c
++++ b/ld/ldexp.c
+@@ -1630,7 +1630,7 @@ exp_get_fill (etree_type *tree, fill_type *def, char *name)
+     {
+       unsigned char *dst;
+       unsigned char *s;
+-      fill = (fill_type *) xmalloc ((len + 1) / 2 + sizeof (*fill) - 1);
++      fill = stat_alloc ((len + 1) / 2 + sizeof (*fill) - 1);
+       fill->size = (len + 1) / 2;
+       dst = fill->data;
+       s = (unsigned char *) expld.result.str;
+@@ -1655,7 +1655,7 @@ exp_get_fill (etree_type *tree, fill_type *def, char *name)
+     }
+   else
+     {
+-      fill = (fill_type *) xmalloc (4 + sizeof (*fill) - 1);
++      fill = stat_alloc (4 + sizeof (*fill) - 1);
+       val = expld.result.value;
+       fill->data[0] = (val >> 24) & 0xff;
+       fill->data[1] = (val >> 16) & 0xff;
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 12551504ae6..404af5fba14 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -438,18 +438,11 @@ ldfile_try_open_bfd (const char *attempt,
+ 			  if (token == ',')
+ 			    {
+ 			      if ((token = yylex ()) != NAME)
+-				{
+-				  free (arg1);
+-				  continue;
+-				}
++				continue;
+ 			      arg2 = yylval.name;
+ 			      if ((token = yylex ()) != ','
+ 				  || (token = yylex ()) != NAME)
+-				{
+-				  free (arg1);
+-				  free (arg2);
+-				  continue;
+-				}
++				continue;
+ 			      arg3 = yylval.name;
+ 			      token = yylex ();
+ 			    }
+@@ -468,18 +461,12 @@ ldfile_try_open_bfd (const char *attempt,
+ 			      if (strcmp (arg, lang_get_output_target ()) != 0)
+ 				skip = 1;
+ 			    }
+-			  free (arg1);
+-			  free (arg2);
+-			  free (arg3);
+ 			  break;
+ 			case NAME:
+ 			case LNAME:
+ 			case VERS_IDENTIFIER:
+ 			case VERS_TAG:
+-			  free (yylval.name);
+-			  break;
+ 			case INT:
+-			  free (yylval.bigint.str);
+ 			  break;
+ 			}
+ 		      token = yylex ();
+diff --git a/ld/ldgram.y b/ld/ldgram.y
+index 6d516db38c7..9bb98de2f0a 100644
+--- a/ld/ldgram.y
++++ b/ld/ldgram.y
+@@ -543,7 +543,7 @@ section_name_spec:
+ sect_flag_list:	NAME
+ 			{
+ 			  struct flag_info_list *n;
+-			  n = ((struct flag_info_list *) xmalloc (sizeof *n));
++			  n = stat_alloc (sizeof *n);
+ 			  if ($1[0] == '!')
+ 			    {
+ 			      n->with = without_flags;
+@@ -561,7 +561,7 @@ sect_flag_list:	NAME
+ 	|	sect_flag_list '&' NAME
+ 			{
+ 			  struct flag_info_list *n;
+-			  n = ((struct flag_info_list *) xmalloc (sizeof *n));
++			  n = stat_alloc (sizeof *n);
+ 			  if ($3[0] == '!')
+ 			    {
+ 			      n->with = without_flags;
+@@ -582,7 +582,7 @@ sect_flags:
+ 		INPUT_SECTION_FLAGS '(' sect_flag_list ')'
+ 			{
+ 			  struct flag_info *n;
+-			  n = ((struct flag_info *) xmalloc (sizeof *n));
++			  n = stat_alloc (sizeof *n);
+ 			  n->flag_list = $3;
+ 			  n->flags_initialized = false;
+ 			  n->not_with_flags = 0;
+@@ -595,7 +595,7 @@ exclude_name_list:
+ 		exclude_name_list wildcard_name
+ 			{
+ 			  struct name_list *tmp;
+-			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
++			  tmp = stat_alloc (sizeof *tmp);
+ 			  tmp->name = $2;
+ 			  tmp->next = $1;
+ 			  $$ = tmp;
+@@ -604,7 +604,7 @@ exclude_name_list:
+ 		wildcard_name
+ 			{
+ 			  struct name_list *tmp;
+-			  tmp = (struct name_list *) xmalloc (sizeof *tmp);
++			  tmp = stat_alloc (sizeof *tmp);
+ 			  tmp->name = $1;
+ 			  tmp->next = NULL;
+ 			  $$ = tmp;
+@@ -615,7 +615,7 @@ section_name_list:
+ 		section_name_list opt_comma section_name_spec
+ 			{
+ 			  struct wildcard_list *tmp;
+-			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
++			  tmp = stat_alloc (sizeof *tmp);
+ 			  tmp->next = $1;
+ 			  tmp->spec = $3;
+ 			  $$ = tmp;
+@@ -624,7 +624,7 @@ section_name_list:
+ 		section_name_spec
+ 			{
+ 			  struct wildcard_list *tmp;
+-			  tmp = (struct wildcard_list *) xmalloc (sizeof *tmp);
++			  tmp = stat_alloc (sizeof *tmp);
+ 			  tmp->next = NULL;
+ 			  tmp->spec = $1;
+ 			  $$ = tmp;
+@@ -926,7 +926,7 @@ nocrossref_list:
+ 		{
+ 		  struct lang_nocrossref *n;
+ 
+-		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
++		  n = stat_alloc (sizeof *n);
+ 		  n->name = $1;
+ 		  n->next = $2;
+ 		  $$ = n;
+@@ -935,7 +935,7 @@ nocrossref_list:
+ 		{
+ 		  struct lang_nocrossref *n;
+ 
+-		  n = (struct lang_nocrossref *) xmalloc (sizeof *n);
++		  n = stat_alloc (sizeof *n);
+ 		  n->name = $1;
+ 		  n->next = $3;
+ 		  $$ = n;
+@@ -1225,8 +1225,7 @@ phdr_opt:
+ 		{
+ 		  struct lang_output_section_phdr_list *n;
+ 
+-		  n = ((struct lang_output_section_phdr_list *)
+-		       xmalloc (sizeof *n));
++		  n = stat_alloc (sizeof *n);
+ 		  n->name = $3;
+ 		  n->used = false;
+ 		  n->next = $1;
+diff --git a/ld/ldlang.c b/ld/ldlang.c
+index 74c0271973f..f613fc91f0a 100644
+--- a/ld/ldlang.c
++++ b/ld/ldlang.c
+@@ -188,6 +188,23 @@ stat_alloc (size_t size)
+   return obstack_alloc (&stat_obstack, size);
+ }
+ 
++void *
++stat_memdup (const void *src, size_t copy_size, size_t alloc_size)
++{
++  void *ret = obstack_alloc (&stat_obstack, alloc_size);
++  memcpy (ret, src, copy_size);
++  if (alloc_size > copy_size)
++    memset ((char *) ret + copy_size, 0, alloc_size - copy_size);
++  return ret;
++}
++
++char *
++stat_strdup (const char *str)
++{
++  size_t len = strlen (str) + 1;
++  return stat_memdup (str, len, len);
++}
++
+ /* Code for handling simple wildcards without going through fnmatch,
+    which can be expensive because of charset translations etc.  */
+ 
+@@ -277,15 +294,13 @@ static char *
+ ldirname (const char *name)
+ {
+   const char *base = lbasename (name);
+-  char *dirname;
+ 
+   while (base > name && IS_DIR_SEPARATOR (base[-1]))
+     --base;
+-  if (base == name)
+-    return strdup (".");
+-  dirname = strdup (name);
+-  dirname[base - name] = '\0';
+-  return dirname;
++  size_t len = base - name;
++  if (len == 0)
++    return ".";
++  return stat_memdup (name, len, len + 1);
+ }
+ 
+ /* If PATTERN is of the form archive:file, return a pointer to the
+@@ -733,7 +748,7 @@ output_section_callback_sort (lang_wild_statement_type *ptr,
+   if (wont_add_section_p (section, os))
+     return;
+ 
+-  node = (lang_section_bst_type *) xmalloc (sizeof (lang_section_bst_type));
++  node = stat_alloc (sizeof (*node));
+   node->left = 0;
+   node->right = 0;
+   node->section = section;
+@@ -764,8 +779,6 @@ output_section_callback_tree_to_list (lang_wild_statement_type *ptr,
+ 
+   if (tree->right)
+     output_section_callback_tree_to_list (ptr, tree->right, output);
+-
+-  free (tree);
+ }
+ 
+ 
+@@ -1454,7 +1467,7 @@ lang_memory_region_lookup (const char *const name, bool create)
+ 
+   new_region = stat_alloc (sizeof (lang_memory_region_type));
+ 
+-  new_region->name_list.name = xstrdup (name);
++  new_region->name_list.name = stat_strdup (name);
+   new_region->name_list.next = NULL;
+   new_region->next = NULL;
+   new_region->origin_exp = NULL;
+@@ -1509,7 +1522,7 @@ lang_memory_region_alias (const char *alias, const char *region_name)
+ 
+   /* Add alias to region name list.  */
+   n = stat_alloc (sizeof (lang_memory_region_name));
+-  n->name = xstrdup (alias);
++  n->name = stat_strdup (alias);
+   n->next = region->name_list.next;
+   region->name_list.next = n;
+ }
+@@ -2989,11 +3002,9 @@ add_excluded_libs (const char *list)
+       end = strpbrk (p, ",:");
+       if (end == NULL)
+ 	end = p + strlen (p);
+-      entry = (struct excluded_lib *) xmalloc (sizeof (*entry));
++      entry = stat_alloc (sizeof (*entry));
+       entry->next = excluded_libs;
+-      entry->name = (char *) xmalloc (end - p + 1);
+-      memcpy (entry->name, p, end - p);
+-      entry->name[end - p] = '\0';
++      entry->name = stat_memdup (p, end - p, end - p + 1);
+       excluded_libs = entry;
+       if (*end == '\0')
+ 	break;
+@@ -4017,7 +4028,7 @@ ldlang_add_undef (const char *const name, bool cmdline ATTRIBUTE_UNUSED)
+   new_undef->next = ldlang_undef_chain_list_head;
+   ldlang_undef_chain_list_head = new_undef;
+ 
+-  new_undef->name = xstrdup (name);
++  new_undef->name = stat_strdup (name);
+ 
+   if (link_info.output_bfd != NULL)
+     insert_undefined (new_undef->name);
+@@ -4096,7 +4107,7 @@ ldlang_add_require_defined (const char *const name)
+   ldlang_add_undef (name, true);
+   ptr = stat_alloc (sizeof (*ptr));
+   ptr->next = require_defined_symbol_list;
+-  ptr->name = strdup (name);
++  ptr->name = stat_strdup (name);
+   require_defined_symbol_list = ptr;
+ }
+ 
+@@ -9183,7 +9194,7 @@ lang_add_nocrossref (lang_nocrossref_type *l)
+ {
+   struct lang_nocrossrefs *n;
+ 
+-  n = (struct lang_nocrossrefs *) xmalloc (sizeof *n);
++  n = stat_alloc (sizeof *n);
+   n->next = nocrossref_list;
+   n->list = l;
+   n->onlyfirst = false;
+@@ -9366,7 +9377,7 @@ lang_leave_overlay (etree_type *lma_expr,
+ 	{
+ 	  lang_nocrossref_type *nc;
+ 
+-	  nc = (lang_nocrossref_type *) xmalloc (sizeof *nc);
++	  nc = stat_alloc (sizeof *nc);
+ 	  nc->name = l->os->name;
+ 	  nc->next = nocrossref;
+ 	  nocrossref = nc;
+@@ -9546,13 +9557,10 @@ realsymbol (const char *pattern)
+   if (changed)
+     {
+       *s = '\0';
+-      return symbol;
+-    }
+-  else
+-    {
+-      free (symbol);
+-      return pattern;
++      pattern = stat_strdup (symbol);
+     }
++  free (symbol);
++  return pattern;
+ }
+ 
+ /* This is called for each variable name or match expression.  NEW_NAME is
+@@ -9567,7 +9575,7 @@ lang_new_vers_pattern (struct bfd_elf_version_expr *orig,
+ {
+   struct bfd_elf_version_expr *ret;
+ 
+-  ret = (struct bfd_elf_version_expr *) xmalloc (sizeof *ret);
++  ret = stat_alloc (sizeof *ret);
+   ret->next = orig;
+   ret->symver = 0;
+   ret->script = 0;
+@@ -9604,7 +9612,8 @@ lang_new_vers_node (struct bfd_elf_version_expr *globals,
+ {
+   struct bfd_elf_version_tree *ret;
+ 
+-  ret = (struct bfd_elf_version_tree *) xcalloc (1, sizeof *ret);
++  ret = stat_alloc (sizeof (*ret));
++  memset (ret, 0, sizeof (*ret));
+   ret->globals.list = globals;
+   ret->locals.list = locals;
+   ret->match = lang_vers_match;
+@@ -9686,15 +9695,7 @@ lang_finalize_version_expr_head (struct bfd_elf_version_expr_head *head)
+ 		    }
+ 		  while (e1 && strcmp (e1->pattern, e->pattern) == 0);
+ 
+-		  if (last == NULL)
+-		    {
+-		      /* This is a duplicate.  */
+-		      /* FIXME: Memory leak.  Sometimes pattern is not
+-			 xmalloced alone, but in larger chunk of memory.  */
+-		      /* free (e->pattern); */
+-		      free (e);
+-		    }
+-		  else
++		  if (last != NULL)
+ 		    {
+ 		      e->next = last->next;
+ 		      last->next = e;
+@@ -9734,7 +9735,6 @@ lang_register_vers_node (const char *name,
+     {
+       einfo (_("%X%P: anonymous version tag cannot be combined"
+ 	       " with other version tags\n"));
+-      free (version);
+       return;
+     }
+ 
+@@ -9827,7 +9827,7 @@ lang_add_vers_depend (struct bfd_elf_version_deps *list, const char *name)
+   struct bfd_elf_version_deps *ret;
+   struct bfd_elf_version_tree *t;
+ 
+-  ret = (struct bfd_elf_version_deps *) xmalloc (sizeof *ret);
++  ret = stat_alloc (sizeof *ret);
+   ret->next = list;
+ 
+   for (t = link_info.version_info; t != NULL; t = t->next)
+@@ -9860,7 +9860,7 @@ lang_do_version_exports_section (void)
+ 	continue;
+ 
+       len = sec->size;
+-      contents = (char *) xmalloc (len);
++      contents = stat_alloc (len);
+       if (!bfd_get_section_contents (is->the_bfd, sec, contents, 0, len))
+ 	einfo (_("%X%P: unable to read .exports section contents\n"), sec);
+ 
+@@ -9871,8 +9871,6 @@ lang_do_version_exports_section (void)
+ 	  p = strchr (p, '\0') + 1;
+ 	}
+ 
+-      /* Do not free the contents, as we used them creating the regex.  */
+-
+       /* Do not include this section in the link.  */
+       sec->flags |= SEC_EXCLUDE | SEC_KEEP;
+     }
+@@ -9936,8 +9934,8 @@ lang_add_unique (const char *name)
+     if (strcmp (ent->name, name) == 0)
+       return;
+ 
+-  ent = (struct unique_sections *) xmalloc (sizeof *ent);
+-  ent->name = xstrdup (name);
++  ent = stat_alloc (sizeof *ent);
++  ent->name = stat_strdup (name);
+   ent->next = unique_section_list;
+   unique_section_list = ent;
+ }
+@@ -9960,7 +9958,8 @@ lang_append_dynamic_list (struct bfd_elf_dynamic_list **list_p,
+     {
+       struct bfd_elf_dynamic_list *d;
+ 
+-      d = (struct bfd_elf_dynamic_list *) xcalloc (1, sizeof *d);
++      d = stat_alloc (sizeof (*d));
++      memset (d, 0, sizeof (*d));
+       d->head.list = dynamic;
+       d->match = lang_vers_match;
+       *list_p = d;
+diff --git a/ld/ldlang.h b/ld/ldlang.h
+index 91779a584b4..b074d6f5e37 100644
+--- a/ld/ldlang.h
++++ b/ld/ldlang.h
+@@ -664,6 +664,10 @@ extern void lang_for_each_statement_worker
+   (void (*) (lang_statement_union_type *), lang_statement_union_type *);
+ extern void *stat_alloc
+   (size_t);
++extern void * stat_memdup
++  (const void *, size_t, size_t);
++extern char *stat_strdup
++  (const char *);
+ extern void strip_excluded_output_sections
+   (void);
+ extern void lang_clear_os_map
+diff --git a/ld/ldlex.l b/ld/ldlex.l
+index e704a979722..58eca1b2fe7 100644
+--- a/ld/ldlex.l
++++ b/ld/ldlex.l
+@@ -188,7 +188,8 @@ V_IDENTIFIER [*?.$_a-zA-Z\[\]\-\!\^\\]([*?.$_a-zA-Z0-9\[\]\-\!\^\\]|::)*
+ 					   && (yytext[1] == 'x'
+ 					       || yytext[1] == 'X'))
+ 				    {
+-				      yylval.bigint.str = xstrdup (yytext + 2);
++				      yylval.bigint.str
++					= stat_strdup (yytext + 2);
+ 				    }
+ 				  return INT;
+ 				}
+@@ -391,32 +392,32 @@ V_IDENTIFIER [*?.$_a-zA-Z\[\]\-\!\^\\]([*?.$_a-zA-Z0-9\[\]\-\!\^\\]|::)*
+ 
+ <MRI>{FILENAMECHAR1}{NOCFILENAMECHAR}*	{
+ /* Filename without commas, needed to parse mri stuff */
+-				  yylval.name = xstrdup (yytext);
++				  yylval.name = stat_strdup (yytext);
+ 				  return NAME;
+ 				}
+ 
+ 
+ <SCRIPT,INPUTLIST>{FILENAMECHAR1}{FILENAMECHAR}*	{
+-				  yylval.name = xstrdup (yytext);
++				  yylval.name = stat_strdup (yytext);
+ 				  return NAME;
+ 				}
+ <INPUTLIST>"="{FILENAMECHAR1}{FILENAMECHAR}*	{
+ /* Filename to be prefixed by --sysroot or when non-sysrooted, nothing.  */
+-				  yylval.name = xstrdup (yytext);
++				  yylval.name = stat_strdup (yytext);
+ 				  return NAME;
+ 				}
+ <INPUTLIST>"-l"{FILENAMECHAR}+ {
+-				  yylval.name = xstrdup (yytext + 2);
++				  yylval.name = stat_strdup (yytext + 2);
+ 				  return LNAME;
+ 				}
+ <EXPRESSION>{SYMBOLNAMECHAR1}{SYMBOLNAMECHAR}* {
+-				  yylval.name = xstrdup (yytext);
++				  yylval.name = stat_strdup (yytext);
+ 				  return NAME;
+ 				}
+   /* The following rule is to prevent a fill expression on the output
+      section before /DISCARD/ interpreting the '/' as a divide.  */
+ <EXPRESSION>"/DISCARD/"		{
+-				  yylval.name = xstrdup (yytext);
++				  yylval.name = stat_strdup (yytext);
+ 				  return NAME;
+ 				}
+ <WILD>{WILDCHAR}* {
+@@ -431,14 +432,14 @@ V_IDENTIFIER [*?.$_a-zA-Z\[\]\-\!\^\\]([*?.$_a-zA-Z0-9\[\]\-\!\^\\]|::)*
+ 		  }
+ 		else
+ 		  {
+-		    yylval.name = xstrdup (yytext);
++		    yylval.name = stat_strdup (yytext);
+ 		    return NAME;
+ 		  }
+ 	}
+ 
+ <SCRIPT,EXPRESSION,WILD,VERS_NODE,INPUTLIST>"\""[^\"]*"\"" {
+ 		/* No matter the state, quotes give what's inside.  */
+-		yylval.name = xmemdup (yytext + 1, yyleng - 2, yyleng - 1);
++		yylval.name = stat_memdup (yytext + 1, yyleng - 2, yyleng - 1);
+ 		return NAME;
+ 	}
+ 
+@@ -457,10 +458,10 @@ V_IDENTIFIER [*?.$_a-zA-Z\[\]\-\!\^\\]([*?.$_a-zA-Z0-9\[\]\-\!\^\\]|::)*
+ 
+ <VERS_NODE>extern		{ RTOKEN(EXTERN); }
+ 
+-<VERS_NODE>{V_IDENTIFIER}	{ yylval.name = xstrdup (yytext);
++<VERS_NODE>{V_IDENTIFIER}	{ yylval.name = stat_strdup (yytext);
+ 				  return VERS_IDENTIFIER; }
+ 
+-<VERS_SCRIPT>{V_TAG}		{ yylval.name = xstrdup (yytext);
++<VERS_SCRIPT>{V_TAG}		{ yylval.name = stat_strdup (yytext);
+ 				  return VERS_TAG; }
+ 
+ <VERS_START>"{"			{ BEGIN(VERS_SCRIPT); return *yytext; }
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 5399aa45b72..58b9bdd4974 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -1989,16 +1989,6 @@ parse_args (unsigned argc, char **argv)
+ 	  if (opt_dynamic_list != dynamic_list_data)
+ 	    opt_dynamic_list = dynamic_list;
+ 	}
+-      else
+-	{
+-	  /* Free the export list.  */
+-	  for (; head->next != NULL; head = next)
+-	    {
+-	      next = head->next;
+-	      free (head);
+-	    }
+-	  free (export_list);
+-	}
+     }
+ 
+   switch (opt_dynamic_list)
+@@ -2022,17 +2012,7 @@ parse_args (unsigned argc, char **argv)
+ 	break;
+       case symbolic:
+ 	link_info.symbolic = true;
+-	if (link_info.dynamic_list)
+-	  {
+-	    struct bfd_elf_version_expr *ent, *next;
+-	    for (ent = link_info.dynamic_list->head.list; ent; ent = next)
+-	      {
+-		next = ent->next;
+-		free (ent);
+-	      }
+-	    free (link_info.dynamic_list);
+-	    link_info.dynamic_list = NULL;
+-	  }
++	link_info.dynamic_list = NULL;
+ 	break;
+       case symbolic_functions:
+ 	link_info.dynamic = true;
-- 
2.43.0


