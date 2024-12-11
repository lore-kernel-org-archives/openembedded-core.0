Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F37E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:17:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1632.1733941033132797303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2075040ffa=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBARh3b013458
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:17:12 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy3mhs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:17:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1Om+ImAPLa82lPOVyLFxdWJAGJPy3AOfUdr9a2oxEYspSOsuNOi9Vrr4IyEaIwwygNhKPokQx34/qtNtsyEvkj7Cq5J1yEFXloiVOMRLRauzyu63Ow/yF8sxf3OJsVuREApZ9zMoNXiVV98iRNGUivdNPXczwt3H4RD0akBLBRHz8THeYOPCrUbg1v5NTOLPP5xkWX/P3NP3T4Dk7fntv0FmJH6wxvL0wOETGXx/qVIxvIeqLSGJk73JeSsWtMcs6BIRXaw8CheErqHl9+n/b9ZMJt0O/lQx3V3NK85gSrlwjOe5PWYDbDDBAzJ312f3aFwjS0Vpn6tbjiE2s5PKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqm8wC+89k+7m0H3CPJwrAEiPAon5oVxLjpNfMzqvbQ=;
 b=JuGQ3XoMJUrgS1sskzTPBailP1uMNKnqm+2bNaKOEo1Cf+ZyvDhjI6AKpBS6UMUZWNy9DRhbNN5VH+GlEPZ97HG13ttQcrcEKEqmevkcwyQ4XDYmKhkuCMrv0TwWEuKAF4LetJdvw/cl56MyAm/kmoZGofazRJPnIcI8fA9PXSL3gyYtxtY09Trb2j3ciAYu2lP3hAAmKGStXs4iD14Jgm5BVZGiPRKbCTa72Q9TVhKA67LEO9IacjUC/UZSF/hI88XC83BkPZaQnBGu7r/o3eeIYdL0DuoqF62ffS2hPz6w6dTWekvzm8QIk7NSBIEkv3tT1V2HgEXNAsUjl5ntqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS7PR11MB8806.namprd11.prod.outlook.com (2603:10b6:8:253::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Wed, 11 Dec 2024 18:17:08 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 18:17:08 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
Date: Wed, 11 Dec 2024 10:16:53 -0800
Message-ID: <20241211181653.1735144-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0380.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::25) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS7PR11MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 96477be4-403b-4161-a576-08dd1a100665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YdoZ5IFu4dVTT9ZVs1ffReBtkr5EjmK7p2fZKQUtiEdXql332HQOhzvbvH0B?=
 =?us-ascii?Q?UdDabHxV71MEC896IGecBQWP/u3qpZmJFuXEeQ65/OwkzfGAqeq9/vz+dkKJ?=
 =?us-ascii?Q?t1VZu8U7lDo91C3LR0ujpKtJv1twyKsh9JyfcwiiIJo3p85iegUwTig6TJcP?=
 =?us-ascii?Q?5lFpN1YJRGcyQE6V1EKucpbjDLSl29gmLkjZV3JlSkdzmgUWHSTDYKmCjQHN?=
 =?us-ascii?Q?d+/G5HG7CxqsrA/oa4uLyJ6R8IVSY02Pi0kV2DRDCYKobXQe+OeSsdzGln4A?=
 =?us-ascii?Q?elH1SfZIHJ0z8jvtkLzn+GJaQJyJNHMgPwC1tx+ZMzT91TPw+9QOb9N2OgEp?=
 =?us-ascii?Q?6x991HS1h4+wn4WkDf+mcSBKGLPa86egxWs7bRxBfYpN2jJOtYrFx5hQiKuN?=
 =?us-ascii?Q?d6/av7ZpwdEBCReRKK8yzFcVFYFu8OMnkeseS7csBVJe2R6Wu8pboD5nQDSK?=
 =?us-ascii?Q?F8c84Vm/ZltURCILxxZZ+ipHcxqiJ5JCBtRohQg7Ppo64f3rAY0cwUWF6jUE?=
 =?us-ascii?Q?7ok+vQKlFlcpE78hQkOJCGtoHmstEvjPr7H/jmcc/H2/XH7f30anrOM04gSD?=
 =?us-ascii?Q?dtJ+KP6beEzPUAms9aGYeXLRH2UxXZnlRi+gmB3lIY7SLn33iP7UrnqsIONg?=
 =?us-ascii?Q?IP8VR4+jgd6w5GM+Y9rKMCPyC+V9gyNT8OSDiPTrbRAo9tid8jqUKfpr2aIy?=
 =?us-ascii?Q?aBj/06BZJMy9P/hMD2O5S6GtAjQDSD9bUgfdelym/ntAR9gufmNm4YoCa2pf?=
 =?us-ascii?Q?PEJjD0SVGmX6g7GRLNjpU7vr8ybboyl2o1EdlEpeA+zyg96D+kLIStgYqzoQ?=
 =?us-ascii?Q?eaiLklq9TbnE+dDtRRbh6CVdWPA9fw+rsntJGqS87FPtfuainx4SABTVa3r/?=
 =?us-ascii?Q?PvNFpyGHmzKK/B6vvasWk1xYuia9xC+hVBCJZoFHyV05jYrNiJdBVisK3DaQ?=
 =?us-ascii?Q?7KWBlkGk3Stq3lwflvPsjCsVTWVMsVXq+aMn+tZUR12pT5qOpL0SjSBO3gaI?=
 =?us-ascii?Q?Ep20qeTJDYxXiWytH9PBPBes16QcEH/VpAhmvb+kgzk57Wsha8c89Tt8T9V2?=
 =?us-ascii?Q?+NW4Y54Q+Wd0LZ+7iSmVJXK7vzsRgof/yJRH4+CKpCnxik+CB008uHq+MaPk?=
 =?us-ascii?Q?7Lfmx4TA9i/AAtoR9RITJJSnHiAKQNWb8aWdMpuDiB14rlRnLNN9LPpvB4Hy?=
 =?us-ascii?Q?TE/3p3WtMThdth5bh+t3v/8aNy8EWEcQ3bAxs8pxYk/507nxaEdwjeg/b5fZ?=
 =?us-ascii?Q?X+iit8bXWtcymcg/PxG1LmHC2Minshk1i5lUAFYmHKuzzRyT6Jm34+5VV2VM?=
 =?us-ascii?Q?mYkgk+WGbvKI+FtTLPNSopAL2A4k7rjxmgtn49YkrhyT3Cq45UB03s7xNk4f?=
 =?us-ascii?Q?JTO8G8E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?euaBStrAdaaUgC8uUwzJfpieV0fJJQ8FSfV7l/5zkO6yWtJGw/4r6avsfGAR?=
 =?us-ascii?Q?2rQLWu6cpPsqOZxU5G+KeZ6YIKBte2+OomXLU7QzIs4NKfeRjevCJT+iLu05?=
 =?us-ascii?Q?JkqjN11mwSi0JlIGAnyOTt0UDPsPCs7G1Wgwxb9KeXbRNIgE2mo+5h3mx5e6?=
 =?us-ascii?Q?tbVh2/ZFsTcE98+TfRlvMIpH+qyxDd53afF2nAenxY5UEzWiqXo5SQMPlyXS?=
 =?us-ascii?Q?lZlCrZqP9ghMzuCoK5QCnTM3p/Pxf0UHMfsXN0dJlG7PGSaBMpJ/koT9CePC?=
 =?us-ascii?Q?+PCSm6ZGg4NWfYfj80PJVELm+rhvGHxvgP5HTxFcJ9/W0U1mh2t7nim/92jj?=
 =?us-ascii?Q?plybl9UgJ5sfdfo+WefDXSix3/r9lDD758YtObCIEJ5ur5JzG/vsIu4JW34Z?=
 =?us-ascii?Q?U6t2jFjseu4mob9636HP8QSbfQxEbHk/APQ4e+hAXlbQI0c5lHGQdD3dMHQp?=
 =?us-ascii?Q?ptsFs5zmYiPmmV0n5UApnh8JwFBoW6J1GUDt4q4doZxLDYrKdtbqTa0697VW?=
 =?us-ascii?Q?5EXWauVBxsVGoSeDFHQIk5m/Q/vJH3LfgRW4fSqJp+R4duooj5bEAoycnpcp?=
 =?us-ascii?Q?Rbak4NP1hAo13AJQZQG//S3OCulw77b71EYzIzddy3nT+CuKKMyeoijG9+V+?=
 =?us-ascii?Q?DfvNWqW3Sozp+T6uAsZkjXjiIMikweUj0CPxLQZyCVRr16kom+ZHHIvqGpQz?=
 =?us-ascii?Q?HgyvNyaQCZiKyV7jqWBy5H/hEm8SLVhadnCUZK+UrdKMEqlhLyIjxHnoCiNf?=
 =?us-ascii?Q?tL+6QI0+xXPHHho9n15K7U3tPa//gSznVB1w9pU8McurIaPspdC/aIWrf/Qg?=
 =?us-ascii?Q?fWuxhB8IR6GYOCtay5Pd4bNlvVWumQDfLBdJ96fv0eowIuXh/ZDjjbeAf4KK?=
 =?us-ascii?Q?GHxcOJJof9qzt7mPRUJc4coIViMnvrBl73MZETjaHTWfLfogfQuRGCWTqqGV?=
 =?us-ascii?Q?zHehq4R4XCPdFknZJeTpp82ur+/jPDosN8qqQ+sFROvo9+C0at3n42h6GsnE?=
 =?us-ascii?Q?tZJ6Ev9dDejrJf+Zi877/SutSZH5dRkJhNMvwsmiCp4J7OqSkKBXnIavB2Bf?=
 =?us-ascii?Q?mpfCeR/6r7Nv+L1C/xQIazM+hSoJczkoUxNDKxByglWLJ//eY6un6AEFuKfZ?=
 =?us-ascii?Q?Lp4SXjqRxQNmRH9dpgfObFN8SyUDjAt/A5+dhPRIFG/ZJ8iSrSWwo9IrF7Vn?=
 =?us-ascii?Q?GBAqWM0W6uzN2TLGUIfaxoSMhpcbodAs3vEdCYN1b09C1TxdBOrps24tqNe8?=
 =?us-ascii?Q?rpAhE3Y0Hywiomul9reUZdYiJTmSXKem/y5pWGOpqAgnNJig0L2AvRECRAmm?=
 =?us-ascii?Q?NpjXnO+SOoujDLD2d0dbN8WSHBi6CZRqgi+d1NGWBWR2wVhBzMKuPYAr+iBw?=
 =?us-ascii?Q?RoJ5LHqu2j/r+SjX13jcxVc29OhNSg6p3WpU8GHiRYhJZrX3fYYAyeKx8ZdG?=
 =?us-ascii?Q?4HA/zJW5BDAnw7JAJAMsVY2lTT0NTM/mMjF85qCNvXjJo1Qv66jmwJGX7Jrb?=
 =?us-ascii?Q?/95xs1vlRZe9UIoLbXKITyq88lwzvTSQt5cFaVwx8/M65GfSrtXlPFBD2HEh?=
 =?us-ascii?Q?bc3R/PX95pB9s1aXmsEtuH/fN0txbceDico7Lg+J1FAEQo2DhExmN8EejxSx?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96477be4-403b-4161-a576-08dd1a100665
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 18:17:08.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xw2Yd6tjEFyVG/bQ1vhkZ1Zaq36HXt4YuZj01jbVQ+5+HaC2J4R6UOceVF6wNloNOp/UKWSKE7gmTPyXfq599ur1zDr76dcmniWkBlftNgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8806
X-Proofpoint-GUID: a6E8zAtqdyFqDlafp75D3y25fk-77dN7
X-Proofpoint-ORIG-GUID: a6E8zAtqdyFqDlafp75D3y25fk-77dN7
X-Authority-Analysis: v=2.4 cv=D7O9KuRj c=1 sm=1 tr=0 ts=6759d727 cx=c_pps a=2TzYObwzRp/N0knVItohZg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=hFgfYRswjOba8Sqq2acA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_11,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412110131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208607

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


