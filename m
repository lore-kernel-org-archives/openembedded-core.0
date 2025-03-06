Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B806EC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 05:44:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5867.1741239846499847575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 21:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5160fcc99f=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526402Ld019255
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Mar 2025 05:44:05 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux1n1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 05:44:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZ/l5jCAy+C5FJIq0uONQPmhFysOcvBKkgaUHGiBjcNWRK6/UvRW/grKGE38JhxuZyqUyL52I8/CWiSRnISf+Kz24CtSDozok9hZ4CgyCj5/b8b5KCKlLo7qHUUAKKl6/elwsc4PSto7i+TP81kAqzMBfOCP8f96t29ZmIsES1YOxEumEXB5mrYlbCgf+RrUropMVcRAhjzG0s6NypkdUUfhlZt6C/fNbETw/8EbpN8E5CjyH9knpgcg+3SHHQiuf6MWZIgehASYC+5JUal3iFAI9uq2OECishc38BXBudKz4UzbcbHE92456LZzHu4KdnlWmIVbPLqpXqo4n6eitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPFAJTrpMS0jHAOGGlrvJkInPnlbv036OeF36ZiDnyE=;
 b=Ru8R0iS7a9p90ULHhgQnbnQoU/ORYUo43vDFgABc7HQA42ZlsWzn/EeRK2FUGSQhPQsiXnPXVhPpZ+cgXI7Y5ZyK7kXWlJPkOvwd4ZSua7SPiOK99OlJfneJf5eh3rPCpWx5IU+PZYUAd2r9azLI6H9onP3NiJbvqzmK88c7n84YFGn/G9lyvzCktmmbVSxrqgC9SgNZ60nqDUaSy87j49iH6Tog56aHQxtedhw6wDtBFHolviQvWQ2EZvNOC+W8I3LLEwDRxePFfwSHEr/IL99WbXnGGYNeyiHy3BC6+CGNvFm6ZyzZscn3cJ4rr55lc4EPw0Rp6rVCR7HM4d5sYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 05:44:02 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:44:02 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix CVE-2025-0840
Date: Wed,  5 Mar 2025 21:43:48 -0800
Message-ID: <20250306054348.1337979-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27)
 To SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: a5044063-ed0e-4ed6-d43d-08dd5c71e6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BTy7WdNfYjwi3q5UFJeVqWUSoqqKGpPhrJxbsMKjArobcIXQGBbBYvyeNqeG?=
 =?us-ascii?Q?nMLOtDvb1j8gjs0TIpK2H3hxRBurjyFFd9UmsKWEFQLup9jNxy9S7ZuKUE6Q?=
 =?us-ascii?Q?8J9h4SzFjKB+n1eRTUoAT/EPkM5aDlHozze05X9AX6HKiSSupX5Z25BgRtCk?=
 =?us-ascii?Q?HZ5IWgLTGct0YVoTyOaFwi9FZHENq59x9Nk5EuEtUXwaHLFUf5s4mnoEzmCo?=
 =?us-ascii?Q?AD4OCTc8qgogzq3bFbUGjqA3IRD/aUAyA+Q4WUoggL2UFOaqBradHIaJGjEM?=
 =?us-ascii?Q?cYp0BhwgYLwO6SLT1daLQspI8KnJqTj9W5R5scuy2c4tib3HY6tnIeHYMHav?=
 =?us-ascii?Q?+AfiwVDOmTflHBsKTSE2zWY2lrt3A7EsxIp+29WUSVUqKGadYO5B1pR4dFV/?=
 =?us-ascii?Q?aIM9ni8NxpUPVS6p9bueS3CVplTp33oGhRqXjJMKQWqzbwOLuw4qJo4cuDQL?=
 =?us-ascii?Q?ex2dd4ea4O999CYnu9tnzKiHRFGYFHzKoERshdMnhPOPgHYvgNnN7/ruEaWN?=
 =?us-ascii?Q?kgzTjAv08pHPi+3vzkFsyGZhmywKHI5j1fbYKfPiDqqiGPc3p/KSQL340d75?=
 =?us-ascii?Q?uX8gf9G6Ap1Rx8BS0C/+HsQ7GwtMSdL7q742k3p62vCI+LW9ZZ3y8DbH1bHO?=
 =?us-ascii?Q?v0XF6LnGNEDvfUVVlQ0X6++9K2kSWaiHq09AsDhhDDtA8vsp8kXO7PYOSw4g?=
 =?us-ascii?Q?w+lllvZWIm8Njd9Vp71v348jK8vwBKqGKRR2MA8dsbfBxiO4YMpgXAGskQOH?=
 =?us-ascii?Q?h/akXSRaavNWW+AUFPQ4h2oSdrA3/ykwRpVrcW07M1M9apn5Que7n+CY3ymK?=
 =?us-ascii?Q?kRF7vXUlNp7Jv0E1e1PLCOtkTxFzvUskVjL2o1RaNIIMNkUzfzLue7LsXaDc?=
 =?us-ascii?Q?57JDrLa/MG0z2aUJu7CczuS5I951JKaxalF7x4dNyMPGdzw2kU6fMET26zWf?=
 =?us-ascii?Q?/7v4Y73FyJRNumP0mmzkTxJ8GQkCAjm00yF+jPgI+Z+J/dSpHcFWNZ2SudmY?=
 =?us-ascii?Q?afxlGfnxZDpntbEwPSrsNyxPrGrEtDf7L3SeFJZbKJs8/1h2kQc2adg/tetB?=
 =?us-ascii?Q?ZPay/B1aFjTo713i9X1vvKAqdmlKHabYuk9fJIIknWvPO0kpXSuh0yX9Y3RZ?=
 =?us-ascii?Q?6Fe+wquatI0IvDyBTUpmZik50AE20v+/kzZxBvTwtU8SqdTuFi5/GtLJhLCa?=
 =?us-ascii?Q?fdGMVzYqhakzXqvA9Wd9McIpL1YrUiLurhHmC5LxnwXWIl9OBYDqZJeqSmds?=
 =?us-ascii?Q?ZFvCjzmlNJG+7dYnVv12OhTwfgaIofSjeP8hK74wuJMTaezCvwEQcy9PWdQG?=
 =?us-ascii?Q?+biVpAT2kiAdug2FJSDEV2Nb3nfgVOKvbgRLeXOSNM+hhcDofp/ldAwT4rim?=
 =?us-ascii?Q?KmJ8dWMUbPHzgQbwd+QxLzlj9sSd1fYiuizIHQWxk85PfCVhYQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M6eMlTQGgRRic7paStt3exiRdiXxSjxL+bI1YU6IbQuE9ksHMB9sM+hrph4k?=
 =?us-ascii?Q?jeJeGyNjZqCbEIM8bs1rf/ZP4I9XtopBpu7FjNXwlZQRTQNYE4EoivrImAKZ?=
 =?us-ascii?Q?12zeRkz9XXhE5srd5oQ6Fs7eC/4OAQRXYnWfFByoFjV79bSHLhwkP5zGPnT7?=
 =?us-ascii?Q?QgLyz+XpDJBXeZ0z+6a9zXfEfKHzWOXkDQXHC1JZmOlxI1/MbbgTxovJxNIy?=
 =?us-ascii?Q?WbydUm4q81cWTBuI69WxkK3YcEXGwcldidSnAb/7NDjFwafQuvNLV6RUd07L?=
 =?us-ascii?Q?5O2Lez+fPc4+pNOUzFt9GdGC1W+t/0xrdOTAmBvGT3X0+AzXgjnHwV4cAV4h?=
 =?us-ascii?Q?9/seaqD/U9KCNfbxuqHnjm9LiqhCkpL0RlIBWLx8SzmuzKBqAMX+iLHVexG8?=
 =?us-ascii?Q?U0xvU+OK9cmlnLOSsnJ/ahaYHrk7Me1PNGBU8Bvlj8Z7A82DhcsyUFat1Vf7?=
 =?us-ascii?Q?bARjtm7bA3uwouuHVyubsTaTFQC0QJmwx2Y8p9Rsi6HF0vU1/k0Y7xBAcGsx?=
 =?us-ascii?Q?3qE20g93fuEqYBqM6VgH5IgMSzQ+j9VmGiOyHevqWJiVIe04ZnymJEZ8BuOa?=
 =?us-ascii?Q?KsiNINGTodko/nO39UJODzfJhyH7dDgYzcRNvDOcVS8av/FB4eWuLHkuxyLB?=
 =?us-ascii?Q?CFqLh+EMCWnFaCPKaNb2M9lyVk/BI2v3oe3dzo69UE+ncXz9iW1ra4dTKDlz?=
 =?us-ascii?Q?ZgGANA9wsnbodNGCuR68kJcsggeETtxfPyHE4n0X5MNNOS0tzEISQYduBO86?=
 =?us-ascii?Q?dpbge8Sc1Uo2C68L5wJS09omNTfh4klD7u+OJvkO5xq6WH5F23JpSxt1URSa?=
 =?us-ascii?Q?pOTvHumpNTx+Zvyy1xsX1On+5tKxSRVGGiPZ7rnD57CJPO4CxXjPrey4BxyS?=
 =?us-ascii?Q?4JipXiWblZlx3906ap7WIJhDRoSjFbAtx2MVVx3y2rRBu2AEz2Q9JaaOMpog?=
 =?us-ascii?Q?z4EwhrN4Whgn9w4/tOWRAfuiuPCnuQjNInpZMFzpFsrFyA1kZxKjTuzp3bXp?=
 =?us-ascii?Q?q+BI0N34IcuUtaCc4uOe94DQhWRA89XcBtdd3halkMTZN6MaAhGfqF7nFgjq?=
 =?us-ascii?Q?y61G+jXL1m54l1o7S7whgreYEfsR2jl1YEJHJt9EZh+FwfGYtOIpYpBz9V3c?=
 =?us-ascii?Q?F5fk29tY8sS9E6ShwNNatejk14M6CU58QDnw6H7rZA2CrkLjqbdjAbhv6qh7?=
 =?us-ascii?Q?ZtwQdeWd0pQYSb5Imrp3iGH67zPWBawOBBu+NxvnsGJHcjh0Go5igymxXKdG?=
 =?us-ascii?Q?0YFZyBUmOfMIQMSQkRt6BGfCJcZzfg3HfqsNOUGJt+9bwvNzmFNY9ITo9heW?=
 =?us-ascii?Q?vUMHlQ2mX5b1l13dJC1jdKoJCtYSJwmF6fxoRzXJ51ikj8sNPFJe1SnD5Yup?=
 =?us-ascii?Q?gct4Cjazk94JBERvZ4h6WMs9q29Eo8rRyZrCQO0JMpoRzlSl97qUCtNpbnTN?=
 =?us-ascii?Q?bOP1aptvYS9FaBlMlPQcFJQMlzJaaEbT42LSPp4ss95h5+lQ4hvzNbbXG1H3?=
 =?us-ascii?Q?XgRVlmwbIokcyEdv3ykZG9FjL7obGuvQ1hps3JGkaNxikGLfR21OQckOlVPF?=
 =?us-ascii?Q?dDlO5OyILPhOl60Tf6rdLAjPPY0biSwZuiO6DC1X6ajWOMC0gFawz0ciPvz7?=
 =?us-ascii?Q?B+41FOogDVVXRKYuVqX4/x0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5044063-ed0e-4ed6-d43d-08dd5c71e6a8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 05:44:02.8320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaW6RSAUEW6JItdjmY7lnsskfmYAA0VHyHYbkKmIHK9iP8REaTM1frBzl0JmRcqJ+yNOTK9MYFi9m8CL2U0GvZ8MzwJ70ifCpZugyFdqUFgCzbPLnPbpWY+053RgocK5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7459
X-Proofpoint-GUID: 6E0XzmlPkZv-KTrmTBGAqkaWSwCACaCw
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67c93625 cx=c_pps a=sGbpJkUcFVeWJOR+0qTsNQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=RxL7RjZ82U5L4JDu-X8A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6E0XzmlPkZv-KTrmTBGAqkaWSwCACaCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_02,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=977 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503060040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 05:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212369

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32560 stack-buffer-overflow at objdump disassemble_bytes

Backport a patch from upstream to fix CVE-2025-0840
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=baac6c221e9d69335bf41366a1c7d87d8ab2f893]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0018-CVE-2025-0840.patch         | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-0840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 8bccf8c56a..809c4207d4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -38,5 +38,6 @@ SRC_URI = "\
      file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
      file://0016-CVE-2024-53589.patch \
      file://0017-dlltool-file-name-too-long.patch \
+     file://0018-CVE-2025-0840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-0840.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-0840.patch
new file mode 100644
index 0000000000..3814d63e1f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-0840.patch
@@ -0,0 +1,53 @@
+Author: Alan Modra <amodra@gmail.com>
+Date:   Wed, 15 Jan 2025 19:13:43 +1030
+
+PR32560 stack-buffer-overflow at objdump disassemble_bytes
+
+There's always someone pushing the boundaries.
+
+	PR 32560
+	* objdump.c (MAX_INSN_WIDTH): Define.
+	(insn_width): Make it an unsigned long.
+	(disassemble_bytes): Use MAX_INSN_WIDTH to size buffer.
+	(main <OPTION_INSN_WIDTH>): Restrict size of insn_width.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=baac6c221e9d69335bf41366a1c7d87d8ab2f893]
+CVE: CVE-2025-0840
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 49e944b1..dba726e3 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -116,7 +116,8 @@ static bool disassemble_all;		/* -D */
+ static int disassemble_zeroes;		/* --disassemble-zeroes */
+ static bool formats_info;		/* -i */
+ int wide_output;			/* -w */
+-static int insn_width;			/* --insn-width */
++#define MAX_INSN_WIDTH 49
++static unsigned long insn_width;       /* --insn-width */
+ static bfd_vma start_address = (bfd_vma) -1; /* --start-address */
+ static bfd_vma stop_address = (bfd_vma) -1;  /* --stop-address */
+ static int dump_debugging;		/* --debugging */
+@@ -3327,7 +3328,7 @@ disassemble_bytes (struct disassemble_info *inf,
+ 	}
+       else
+ 	{
+-	  char buf[50];
++	  char buf[MAX_INSN_WIDTH + 1];
+ 	  unsigned int bpc = 0;
+ 	  unsigned int pb = 0;
+ 
+@@ -5995,8 +5996,9 @@ main (int argc, char **argv)
+ 	  break;
+ 	case OPTION_INSN_WIDTH:
+ 	  insn_width = strtoul (optarg, NULL, 0);
+-	  if (insn_width <= 0)
+-	    fatal (_("error: instruction width must be positive"));
++	  if (insn_width - 1 >= MAX_INSN_WIDTH)
++	    fatal (_("error: instruction width must be in the range 1 to "
++	             XSTRING (MAX_INSN_WIDTH)));
+ 	  break;
+ 	case OPTION_INLINES:
+ 	  unwind_inlines = true;
-- 
2.43.0


