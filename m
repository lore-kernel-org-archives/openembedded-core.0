Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC221C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:31:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.82075.1749544283557740693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 01:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8256e8dbea=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A479hi032450
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 01:31:23 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq42ng8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 01:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8GU3IsErWlIZEhl4AG4sTkcBuU+0Xb/JeuPut2/ixTkHVRd9S6Nw2R96y0dCe15tKLjyHkZEGHiuD6T3qqZyYgnlNi4whjpJ7hcmpN0h9qknh4sUDUUWs8x1eg8AU3w//5/xqPk6rXX3GQF80/7973dayzCrL+lONNmWVLwQbDfk6mNWLJW/dEo9KU0tK+8b6Q1/2A43dXr6dRHVzK8lZKcjrmZQhC3N0JI1hGQbJ/sWGN49UAjdpdmWDMixu4F+3sC2HXkkhamNU/Nxf/UJjJmM4cFt+HqiUglPXPhgTdi2u+YcCrmG6FMHKBdOyzoLtMW3UzBqbhSiW3YDVEekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVDhM1Y1FUmZAmmBhM3CZ5S3dWViexUR/t2GRhEgQvk=;
 b=EhfIa6jmEM0pDuQJEaZhLCqmy51W5ajQAirft0Wc8GahBbGfaaCe7+Q7j74coNf+l/Fl16UOFhhlCahKbc3Urw02biwhBhg1tLCegP7l2bJxmKHhMANyfT3qYeam8s9EdOgPkjWUWNLsfdltY9ERbQJSgxK+F1JRn5KARwLHCEX7EXD77uOOCTMyiXcw8bEvbLZXHurxt/phMyTcQh1PLPJPnIu8w6GX6osWBcnq2sN+ipPXjjhTvBn7W+OraMcanfZQc/SqC3cQw+ZESgPoO8o8C3OBmg34S/sVeCnOFuRCi2JNSNibgIrZQQteLmxCzxnOFPEkuwtehduUctx41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB8152.namprd11.prod.outlook.com (2603:10b6:208:446::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Tue, 10 Jun
 2025 08:31:19 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 08:31:18 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: Fix for CVE-2025-3198
Date: Tue, 10 Jun 2025 01:30:59 -0700
Message-ID: <20250610083059.1686780-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:208:120::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1625ab-e95a-4576-9aa3-08dda7f92c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pXRNF2p7ePpNnrQ2G/qUAwk+pgCAD1tLpwCiMFAJje8FvojHtUlBAbz6G0DJ?=
 =?us-ascii?Q?X+F/UAGIaiemoqfulJp1n5YNw8ssjifoGcWRW4rj7cyDmeTQP4Wai4JThz9y?=
 =?us-ascii?Q?fNXcE2Ddjng7oCBhUs7Nh4C/Lxf0hNbESrqibRiwvjisu/TXTt+ppLyZW/ti?=
 =?us-ascii?Q?9NcMkgzhWb9OGWuiFUvGHf0RLyvUADKhX//zdynAJAOp3IUjHts+jnR1eKiN?=
 =?us-ascii?Q?z6nWFVNsPRJd31ol8U6u6N9+GTtzQHUs387LMNHfjCJzOXzsl6hKoXAXpZZE?=
 =?us-ascii?Q?5NBk708ATkvN+QZH2G0NyTm48CLLjrAjSkdJSMX3FBh5qhzQx142x19UXgPZ?=
 =?us-ascii?Q?evo6WSvRtfcMbNxnzbhXFHpZpxtEWdgQyFniy5KQrjjPFJOnG6V0GiTMoLDz?=
 =?us-ascii?Q?omWYkB/E5ZfIk17WmR1OVV6CZWiVTsRHduItXGLKLhQAePOt8q6682bxQ0vD?=
 =?us-ascii?Q?F6OY7F/1ul3Y8Z9tdtesOovPbtTz+DFJISzILuj+KkGaA93VAM2xReTtehiJ?=
 =?us-ascii?Q?dI59c6WFm02egRzkpofkyMCPCGKmChgpkk5t169yZkH/BFn+QHizJlRdIn+2?=
 =?us-ascii?Q?lWy0ZQ128cV2zrbn44bNnLMel9swhqFovbZEBwvnAB+xz6oyu5fS99ss3eOq?=
 =?us-ascii?Q?pOCRxHMb3Q1O5sjsJrj0k58bDDhSId5TM4I5zw2Qvwi8UeM8P6JfMlDbErJw?=
 =?us-ascii?Q?3VWEPBxfGMCLnQYkUT0EhJjf4TObvSFqw5tFUcoCw0tL3DbXFDHxbMHJ3LW6?=
 =?us-ascii?Q?x8XBTKJ4ySp0vaZZ1PEm0Y3Q3uOSrvnw4iXb+/XjCyrTfp8q6xte1AejnNNa?=
 =?us-ascii?Q?b+MvWNCXfRMHbIwWNwCxJl1c+angJCBewga2AJeLby5VnvZlAK1050y6NlMu?=
 =?us-ascii?Q?DPawzei1gW4f/Lc5gcnmmCa8iWB0eOHx1sBRYKCDEqMDO2Hk0p9RfFIjVblu?=
 =?us-ascii?Q?bk9J6M/ohcvOtdOyJg/ZvU+zErFEErhK+wmo/tkZDSqXxDhjvgTbRu2sxw6y?=
 =?us-ascii?Q?dfMlyeyGQZbSOmDJGrAFQmk3HdC3wwX47o7D83Y8UJTXju9elJDkGHqt4Sju?=
 =?us-ascii?Q?MpytSCkSF9/PnOdfYbbE6qoP36KCGwaYAC6tEuFAGhAY+BBpXbJof8IiH5hf?=
 =?us-ascii?Q?4cgektUZDFqM4AzVco5YgjLSRx/cPTgvSDbECTCo7sob3hWdViJfXgZoDU8D?=
 =?us-ascii?Q?0YESld3U2PUvGIXWoGIbxNzxwUdsOuv53jYPs9eXkqwPkZZrul8oVXWRDLyp?=
 =?us-ascii?Q?geB9oWe0Jxp471ISy9g3QFe+kOTZKZ8dW8XOx9FrijHoBOfR3hEX8aibv1WQ?=
 =?us-ascii?Q?VmSMwSqke5mOlRPpeXpIiT5wH2SMiA5C7/epZbyQLvjoQKCt91TuB8lilCl+?=
 =?us-ascii?Q?5i+kCiNkVe3sFWw733sffBw2pFIptgSVLW3uPGrCe+bsBtxLAikzthwaatUx?=
 =?us-ascii?Q?H8KpBVJ9W8k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZtfGlQB9BXYoavin8M3XArQt3euzpYtm+IL1nFU2j6A41fjhq9+ibi//It/M?=
 =?us-ascii?Q?/MkvFuxuJpte5FcIIDFUEYQRqh3NMcWrXx/t/pqY6RMx3sQaCuVMCvqpKEtH?=
 =?us-ascii?Q?fEg/ADLLN7fouDtRw4zDI/bFgkPCjxg36xQaytEEHZK6KpUPpPmAzEDpjq1m?=
 =?us-ascii?Q?QHvyxniNIRPLLCrcB17fbNrjBXTJPpZtgPXyfBeAFDVzhhzrOfrdf3K/nGZT?=
 =?us-ascii?Q?DBN0xl3hv8+8INt/7id4vVrW4jD7hNQKkTeXnHNIox7pOiZY7cuTGWvbWgiz?=
 =?us-ascii?Q?Gnk1jwv1z1idMYHJLbWtdNdVXBrgHS0tHmAhqCETcV2bxDQXl66k3E6Sok3x?=
 =?us-ascii?Q?ZAXRTyMQqcT7cN1VuwEr7wnNdTdMDUrvC+YCrRr81sQmiA/NeHV4YGuReyE+?=
 =?us-ascii?Q?mY1A6h/hKp6Gd4VJmEBDYhASOz6QNAwZ9Hb51bqUFI3yB1TRIeyt5/FweQxn?=
 =?us-ascii?Q?PpU7YtlNJudz7nmsIR4mVQoY35XtLVaX9B80zBL7uuzi6YLIxBERXSwapS/t?=
 =?us-ascii?Q?/g4xI3bVRiEYpAjlfYg3ZWv1YFKxUAqiBrNXTbJtqD9z60qR/T31+q2IW6c6?=
 =?us-ascii?Q?Tnthqr72ytl/ZYNXwM3U55t4ELvzOnndr3ifaCNSOqYP+cyPB3mY2aj08fM+?=
 =?us-ascii?Q?mjfrpDWsTZ6FsPWkNEvERuIHGzRrRqm3txAeNroOlwSHCQH3xugD7nuEq791?=
 =?us-ascii?Q?UZRkiGqHz7Q72Rm+Z7qsfNRLYTcGpphrdzV7jnvChSI6SnEyl5ZnmdSSvr42?=
 =?us-ascii?Q?aX61D7pUOVEBZM2QGS6IfCPFrTivhDCuf17J6vI1d61TkIZ23ZM+qRgxX5oj?=
 =?us-ascii?Q?t7r8Z0XANxIjO16cjM+c6fi+p90tMpWtBuT9mH2+HwbndrDuu04jxgw9bJRJ?=
 =?us-ascii?Q?Z6ae1TFUv5E8UY9CTJJl9xjtUCaUCxoCdA6GajbhpH37WX4f8dNP0/ZBuWuw?=
 =?us-ascii?Q?ILvRvqXn9CaURsS+IOVjFNKPPTsktnXWlIfiHRenyGmCwpzTHkghrXrJBzma?=
 =?us-ascii?Q?Am8c8+2aUPTPEgNwzrNWLup1WQsPqSRlvsiHrgM0aYIv8s7mvvXRi1um7aSx?=
 =?us-ascii?Q?FUyr3qCMysIBllzbQjluCPidtSz0HXnd/D1j/kzvPUBBimA+06sS29GmA4d+?=
 =?us-ascii?Q?G9/ugz4CfMUSXntqr6+kSbe5S74DCzrwOsMbMB1mbP/5nIx37VG51EnQcZuG?=
 =?us-ascii?Q?zqiXTn6BdiXWqm/h3tFiNPm1DKVg/8UdzrLqXc1alDnK0/UYdo3QUJZtT4bf?=
 =?us-ascii?Q?LYesxLnopa0Xv0wLvnxqr2xugUrgqsn4bOt93//fdmDFKshgDfiyd6c8fFpl?=
 =?us-ascii?Q?JtLv0EF/XHvbjRPUmI+qodmHYrcNaYWaqS6ga1I0H7KuWk5rFt5+6lTZaI75?=
 =?us-ascii?Q?sFUhYLDl+bx5KlNbt4XzEfmfC3PeGB6m+UXNwWpwoyEVn7lqTv5ubPS6Gyyh?=
 =?us-ascii?Q?OUEvnprMIAwNZ1OzV0VoqHzSiIPpzttGZYLLVngN/konDc8ODxqgfb3gIQFC?=
 =?us-ascii?Q?ngIjjFqxDDJO1epiVaShC53YoaxSg7kBZLK7cDg3yo7u/Vzs76Qa/4CYlIBy?=
 =?us-ascii?Q?R105H8VxawwhsjvFgdL3IXhIqMTIdJsinDoLMU0SUJET77csu/hFaV+F9+nn?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1625ab-e95a-4576-9aa3-08dda7f92c26
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 08:31:18.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLUyxzV4aAZjPNBSheyliReiclz2famxkwnzSwTZ0Sd72kOD9mgCWcRxRQq1fcIfuhl/2gTISlTrMqcccva/3FypnGPyT2/q324fV2MljFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8152
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6847ed5b cx=c_pps a=g+dQH1R+REXWkVycoqRBYA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=wuJOWgjOAAAA:8 a=LuMsIxk2OdcpWZheutsA:9 a=3ZKOabzyN94A:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=kgah36pxWqcyCo4vgcyy:22
X-Proofpoint-GUID: y7hnVqA24y9KR__CcgVL9DRJDDk6sdwv
X-Proofpoint-ORIG-GUID: y7hnVqA24y9KR__CcgVL9DRJDDk6sdwv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA2NCBTYWx0ZWRfXzF72eijqK7QG DlWYpCm1mrZn5pQUS9eY0oS/Z8IYEu8xa5L37CxAdGm9EqA3zFMzl1OriHcoN2drQnFaS8V3Hqs ZqV7e1TCnsgqiCDvgrHpl7MBThABASTu6wBItDzOkyXGb4Afo0yqvG+jv4wxRHjC7YpoWZJW3K2
 o76y8hXgSlnL5i1neQzVvg+NrQ0Zj8CRF/OuB6Id2HIsoladeca97sGgkQPU6ofJzSaskgUPYUR DnQx18D4j2Lsi/Gl08oVfk+d0Iatt48IW02uTwDvxPzC1sK5vNtT6SiNQOnDachWApaBGYz0qUO RCb3nf28fx6JoCBiiDiDJ3BXXK0qMNEfD0BC4ywZq/gy1mXl1cl5GO5Xix8XLwoCVW1SnztoPa9
 jNayb6N5u4xeDd287N8hQJE+wYWo8+vWpZyUsoLyQv8H9GA2N0WqWscNmb1HeRafoD82FOLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=878
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218320

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d]
CVE: CVE-2025-3198

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0019-CVE-2025-3198.patch         | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-3198.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index c3a597cd7b..c78ca1ce9b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -41,5 +41,6 @@ SRC_URI = "\
      file://0016-CVE-2025-1181-1.patch \
      file://0017-CVE-2025-1181-2.patch \
      file://0018-CVE-2025-5245.patch \
+     file://0019-CVE-2025-3198.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-3198.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-3198.patch
new file mode 100644
index 0000000000..49d7c94b9f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-3198.patch
@@ -0,0 +1,28 @@
+From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 07:58:54 +1030
+Subject: [PATCH] PR32716, objdump -i memory leak
+
+	PR binutils/32716
+	* bucomm.c (display_info): Free arg.info.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d]
+CVE: CVE-2025-3198
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ binutils/bucomm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index ccf54099154..d4554737db1 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -435,6 +435,7 @@ display_info (void)
+   if (!arg.error)
+     display_target_tables (&arg);
+ 
++  free (arg.info);
+   return arg.error;
+ }
+ 
-- 
2.49.0


