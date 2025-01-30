Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56A4C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 11:36:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13450.1738236968691580938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 03:36:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41258a3d49=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UAj3BE019021
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 11:36:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny72kkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 11:36:07 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50UBa6uf027797
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 11:36:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny72kkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 11:36:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=logDs5WGcx2w78JLpS0dd8FwVylLSgqGsfBy/Z20Pp4t9PSf+1K4bEbVYZv2faQvwVF5ZF/M9X4bYDqUR2Muad4k6jp7JE/9Lx3DQ0fn6cdZv6KIOKRvVwY5VtLAZnj77yKb/aRJHU78zgtF3sKG6h4Exj/uXDP7ePdn7QHRva2RQaKz3CO0TICbJ0Jhp0ZQhqrFYW+5MYQP83AXtEJAulGApSoQ71EoDDSbqEZJ1H0SlKFzowN9doPmQWY8hhs/qWxKSuQ8ch9UDyO3g9M0yaZCER70kYOlkfLjRePN0waJnNMM6ShL1IwAjQ4FPthr/I5tFe5BSsFlogw4heEA6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTp1nYQeK2BKWyE7iAjAAvC5kt+w1j9zFTmFsiMYi/M=;
 b=kZ5f8hboNZgcxk0I1HTUZPrFcRlonODOopeTn8xsd2xvTSCTFwMjDSbLNe++h/8WkelhHXH/QpcdRJeH40U88cm8Bet1wmpF7AeWnIgpTzne6JUE6T+MvN1g08ent2m91WCOKwqIWrgNONplapdjEyXZnci/27uG/MDMS7+2ujDSnVDMwrWOQ5FhSKT8RiNKN2UsFY1G+xtZ2xQvjq8vw4XaGY/EJK2YMnOL3W5WS843dN7oT3SWrEFdRlGA0B9tz1ZHPUxosELxRzMcZjMYX3je110XHds27D2Y797s54GDU0eP/Uff2tWugRmvgGLQk1/95FnsMsKiF0P6S7iB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 11:36:04 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 11:36:04 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [kirkstone][PATCH] gdb: Fix CVE-2024-53589
Date: Thu, 30 Jan 2025 03:35:44 -0800
Message-ID: <20250130113544.2253717-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|MN2PR11MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecca6cb-fa83-4fca-e34c-08dd412247c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iu72RSDnXS7LOc0n1ZI6+fECY9/3/nExW8sO4i7HSAUEr12T5njw8uqQYDYy?=
 =?us-ascii?Q?cR381RV3Zng7pcXtSUgvEV6KWMhQPeitgQ73Bf05fiOeX7azLhLo1MMdr5x6?=
 =?us-ascii?Q?gr8rQrO+bUprdY68i2iPd+ia7Ujw5dxQP9WJRALUGOTZ3HoLarKcbUfC1Kmc?=
 =?us-ascii?Q?WcgtlanK2Ln7571IxgP3Wi53Knm07stCtVStWgqO03AUcnI85eqhogyAmNz7?=
 =?us-ascii?Q?1bbQIiaPu8sjgaqoNHr0L6ith5NvmCy2bf9ms2D4HzEFjM1tWzj53gSl+Li5?=
 =?us-ascii?Q?wf9KHx5BI9Vfr1HKzBjs/nuCwD9IxomwAH4iln+QMRDkCYtKUdY/gBeX22YY?=
 =?us-ascii?Q?4nN29mgvHiFdR0iiiTqNlKE1WoMS9HY1LquLbDu2EplSM6gfXQuENtKF3iM4?=
 =?us-ascii?Q?RiX8A8koKvlQuw61Fo1X599yLVFoKlSSSpP2R5/i+V5thkG8wkKtiGJei5WH?=
 =?us-ascii?Q?N5t1RuT0CzPk3tgPusdiHzpOxgVNLL1A0iLEJ6mSwecyfOS9cKkGSMmQJxgd?=
 =?us-ascii?Q?Z9LmZurNCOrmldQzPTmZf3cjCB3xM6JGFM8Y45hDvJhxS81a54i9pcPdBwUX?=
 =?us-ascii?Q?PnUEOW1P9/mK3M4eXJsYi3jvzI44HTVbrcZ1kD9c+w2rdn1aC4MAIJqw+dme?=
 =?us-ascii?Q?ipdXtwwtsRawgmk73JJmN7oP6RpBkEZtLrirdqLEsdbEnwWF4b5YOEW7LieG?=
 =?us-ascii?Q?HEGff1AQFh/k5C59xaWRIsOhdC/+fp7ty+YQk8ywjNATpsMS3Z6/qBRHMjAu?=
 =?us-ascii?Q?+9plspK/jgpVjHBqRAoLhixgoaBQtDgXgjREyDveiyHIskPfH4j3YAu4/x9L?=
 =?us-ascii?Q?DP/fgmSVkooLHtWo78DWt+nQCI1OsRR+o5aBWo1TCDDuJSC92eMAx3gA4WW4?=
 =?us-ascii?Q?UHOyGt+F7vqKLiShW4FVLV3DsxweICfdPVl/mJ1aS+gE1aoqu3jGVUM3qxt6?=
 =?us-ascii?Q?vxazyTe84kgbINCvI41B/DghgoEUiEQALLA466Gq4Tm4XTTUK5TGKRQDslIf?=
 =?us-ascii?Q?l/jpHIGk3VImfds6i724CKlLd905SCGP3PMucwaDGuVnQFEaMznqyKDCsbFY?=
 =?us-ascii?Q?agQLozv15cOsiyfZZNRy/wlhtI81Wsw84zkyMzpNPnIVWCxcVWUMRdp2JJ4O?=
 =?us-ascii?Q?63ODMI3P+LUmbxPDYDwfe27nvdk2eMzzl5ieQLl2gxgWLGHaU1eGwzwjlQDe?=
 =?us-ascii?Q?zQeqGck0w2nmlFsL29WNrtDQXVdTxC/IGJjd9ju9kd3OK7WGcSkvx3Fu7ptF?=
 =?us-ascii?Q?9mXMRD4oEj7M9o0EJjB6Uu4tjt25s8vnQksIwU7O9xyijNEX/RnneMnCiYt9?=
 =?us-ascii?Q?WnxJnnTg+16xDJVeDAezrQootae2lrgf3qZx5X6klRAbme33hrkZcHfaamKL?=
 =?us-ascii?Q?c6HrefWWU6DOEEPiXu+cgn5d/RbW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?blRD9K4p3PSd4C2Ve7pKPqmnworXzcn01mFQT8tXzqvaiyvDUmbhErNZWgVM?=
 =?us-ascii?Q?sG8GIP3slRNNa+eFy0YBSNJpZHDPy7Yjn21OzbQ7vKvNWmtEzTvRCRhgh1T+?=
 =?us-ascii?Q?qtVHiZr2VaNIjRspviYTuMQDH3Iixw5ydSDUGCMX0Q+FUmVPGKWkJPlEmo1S?=
 =?us-ascii?Q?ytioN2raFrAZJcgVT8ii4/hEpeJVqoW8WM5ByItl3IjNMZACByCqt2xUH6yL?=
 =?us-ascii?Q?Y6iuJagM6M8TakAqxvcOOHsBGBaUoE+p9qCBFn2ehuq6H6PKu82SamoGVVVY?=
 =?us-ascii?Q?WWqnDS9Bbtema9GkY3NxR/6H4Wnz+x5qjRlkudL076wQ26FkI1ygrCOoZWse?=
 =?us-ascii?Q?6T/q01U3w8eB3tJxb6fFkZlDalxT7AJDe1c+Ljui8C5bMISzJErev8HttAIh?=
 =?us-ascii?Q?VQxIHL+kEs6LEsyRG6VpJ+jxJ8mGRuugOO1aTRpAKhhGK6vCgOkqijrA8Nhn?=
 =?us-ascii?Q?P28YXDYcLe5rhYoDGBq5xTyxEmN0i38kB1AZzNdrlNeW4wH0ZkQ9KPgOvBkg?=
 =?us-ascii?Q?8ZzOZu3wMxP6/onuT+cEt+b/BhzK6KPWmAb4Zk6ytihsMXFJCF8SgG8GwSbp?=
 =?us-ascii?Q?k8m+UCbeh/OW0HmgshIkoAzHnv2G9/Jcntn3m4LSiUrRcw0AFHluWFl5m2yH?=
 =?us-ascii?Q?8b4NFM5mAqsgYHMLWjKcKI9+qaMZhHgXzrqTkV2MGoXIGkMWKPSOABgISS5B?=
 =?us-ascii?Q?grNahoDKStF7DNTI/mnnGF+ZMNntWsvJZRRoSCyzJFQ4cH7qJdPbtXzHlguL?=
 =?us-ascii?Q?2xEp6Af409fa2jZZ4BcNcVyP1hWxtKN6/XpJFFDHtLqn5VTCXoyZoFsqlLot?=
 =?us-ascii?Q?x4oBnfMKmPF5di5duLPmJqV6heKBf144XniR2jCpagMnyUy6cws2wmr78A3l?=
 =?us-ascii?Q?9oonb7fDWHxskkIKk4cqu56WYwOH0KNGetuURo7T89ia4XSdiSyQuZKc/wkz?=
 =?us-ascii?Q?JBqkQgZDFO4RssUGhWtIFCAiztHqVMR8/anoa/kfd7Nf9GFkdq/MEODJhB/S?=
 =?us-ascii?Q?2L/NEvQxH/7Ivk/jOoKkRiZHM16hVoYCxDCyn8TI2fVon7VakYfuueC8X4cl?=
 =?us-ascii?Q?lgsi7PqltwiVjGgoIFD4krSar/x4pRGku5/Gpdys4Oku+cpVuQA8r3kwIXba?=
 =?us-ascii?Q?mIm6ZHyh241IOkKyuRBeQfuC7AxDT0qQfCrVznpOA651sAzYD1J/zNFBmBP8?=
 =?us-ascii?Q?F5lXgH+PjoPHfZcQ+hUZrOJncQYB4vTpSiXpDgAYMfOlyivvJKHRxrMNlG6g?=
 =?us-ascii?Q?EtTw8KWuEfMF55nUgEz8o1dE3+WB/qZq+ClgVncdWiO/qpPN0iLPt/91l510?=
 =?us-ascii?Q?2Sf8FhjZpErWuBOuXES8ieLJxazziP0+tOKpyN0/XfSqFgfTGpL9pLsReXln?=
 =?us-ascii?Q?TP7UFT+hWoyZXl1rhmiJ9ryB96ArQJ7KPanQvEq0bBerr/cVM5R1hDDu1vKO?=
 =?us-ascii?Q?OUyQCw8VBXe6PF4sd9HhvDPoxw/Z7osveDSC/84lQFwX39yJq/lM7t9lGgLF?=
 =?us-ascii?Q?wC6Fc3RYI669mYXxWbsQ5D3/I+HngoVptF+LflcH3BuobRPlNl0hDOixK+sF?=
 =?us-ascii?Q?VSclubV3YvfhsTl5KqwHHL8YYflPLiI4Ncb7DnSFow4lDXz/AkqWYEwJ1qvo?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecca6cb-fa83-4fca-e34c-08dd412247c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 11:36:04.6754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zN6SwC4q/26E4TZoK/QIlsiBZ6RUIL3/IxjnsFQhrXEFem9QaQcJiJnF3R7YpRFxaXbDyYu7N1hxdBjZm5L4IMTpS1neyjySbZqZPNOA2Hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
X-Proofpoint-GUID: CAZSQ6izYXPMozuFS1WZZEsiWhfQ85Iv
X-Authority-Analysis: v=2.4 cv=fYZXy1QF c=1 sm=1 tr=0 ts=679b6427 cx=c_pps a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=LSWmyYrqe-3-NsyWFpEA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: S5JCgAMhMpmL2JgYUCIWARjrqJMlb8e4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501300090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 11:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210439

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2024-53589

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/0014-CVE-2024-53589.patch         | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0014-CVE-2024-53589.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 6c9fe60cab..84cc65f79b 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -17,5 +17,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0011-CVE-2023-39128.patch \
 	   file://0012-CVE-2023-39129.patch \
 	   file://0013-CVE-2023-39130.patch \
+           file://0014-CVE-2024-53589.patch \
            "
 SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0014-CVE-2024-53589.patch b/meta/recipes-devtools/gdb/gdb/0014-CVE-2024-53589.patch
new file mode 100644
index 0000000000..380112a3ba
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0014-CVE-2024-53589.patch
@@ -0,0 +1,92 @@
+Author: Alan Modra <amodra@gmail.com>
+Date:   Mon Nov 11 10:24:09 2024 +1030
+
+    Re: tekhex object file output fixes
+
+    Commit 8b5a212495 supported *ABS* symbols by allowing "section" to be
+    bfd_abs_section, but bfd_abs_section needs to be treated specially.
+    In particular, bfd_get_next_section_by_name (.., bfd_abs_section_ptr)
+    is invalid.
+
+            PR 32347
+            * tekhex.c (first_phase): Guard against modification of
+            _bfd_std_section[] entries.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e0323071916878e0634a6e24d8250e4faff67e88]
+CVE: CVE-2024-53589
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/tekhex.c b/bfd/tekhex.c
+index aea2ebb23df..b305c1f96f1 100644
+--- a/bfd/tekhex.c
++++ b/bfd/tekhex.c
+@@ -361,6 +361,7 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+ {
+   asection *section, *alt_section;
+   unsigned int len;
++  bfd_vma addr;
+   bfd_vma val;
+   char sym[17];			/* A symbol can only be 16chars long.  */
+
+@@ -368,20 +369,16 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+     {
+     case '6':
+       /* Data record - read it and store it.  */
+-      {
+-	bfd_vma addr;
+-
+-	if (!getvalue (&src, &addr, src_end))
+-	  return false;
+-
+-	while (*src && src < src_end - 1)
+-	  {
+-	    insert_byte (abfd, HEX (src), addr);
+-	    src += 2;
+-	    addr++;
+-	  }
+-	return true;
+-      }
++      if (!getvalue (&src, &addr, src_end))
++       return false;
++
++      while (*src && src < src_end - 1)
++       {
++         insert_byte (abfd, HEX (src), addr);
++         src += 2;
++         addr++;
++       }
++      return true;
+
+     case '3':
+       /* Symbol record, read the segment.  */
+@@ -406,13 +403,16 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+	    {
+	    case '1':		/* Section range.  */
+	      src++;
+-	      if (!getvalue (&src, &section->vma, src_end))
++             if (!getvalue (&src, &addr, src_end))
+		return false;
+	      if (!getvalue (&src, &val, src_end))
+		return false;
+-	      if (val < section->vma)
+-		val = section->vma;
+-	      section->size = val - section->vma;
++             if (bfd_is_const_section (section))
++               break;
++             section->vma = addr;
++             if (val < addr)
++               val = addr;
++             section->size = val - addr;
+	      /* PR 17512: file: objdump-s-endless-loop.tekhex.
+		 Check for overlarge section sizes.  */
+	      if (section->size & 0x80000000)
+@@ -455,6 +455,8 @@ first_phase (bfd *abfd, int type, char *src, char * src_end)
+		  new_symbol->symbol.flags = BSF_LOCAL;
+		if (stype == '2' || stype == '6')
+		  new_symbol->symbol.section = bfd_abs_section_ptr;
++               else if (bfd_is_const_section (section))
++                 ;
+		else if (stype == '3' || stype == '7')
+		  {
+		    if ((section->flags & SEC_DATA) == 0)
-- 
2.43.0


