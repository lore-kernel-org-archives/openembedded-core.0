Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B6AC54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 05:36:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4317.1747805806200637906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 22:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7236248e0e=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5RDUv029013
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 05:36:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfx0tc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 05:36:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCSWRrw9Zu4U5ECAF4i0bGKWZffjBs7mnQebTPzNzas0hD57mAdinuI8EP6PjcECp1i7Bhv1igrI7bcdPeQmrQmhkzAZlYWaEjx4u6eYH38+tQRD8B2wXnTE1cHbj/E7SCcheKSgHJE8oN3ZyCdnS7AxF9JZ1H/LDMErset8KkJ/6d8k+UUHt4/zRcPigJnXQmxfVUlhokGU80qRb+LkBUm4umZnQ4rvxAA6sNB/uWHZEIHWv9SxBwQgKm0gJ9bcHlSfb1EvZdPU5149NMkw0LD7VM/bt2qQKkCaGytw5gb6NKj9J1uSM4/egOOHzr8FmulI9VWIjDcJRdVZwVvrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=953bgaZglsOx/bFGq9QwCci/lQ3XDphnS8xizVCE6mQ=;
 b=BVbGVP3ydmgtkkChRF33RQyLYLIzQNcem54nrUrCWomwg0YLlFbRbj3uO6gX//2bZ7iO5fOFFBUYZGIS/nIZ0yJGljun/BHp1Gj/zmsiZ/oJf3leQi222G/0180321usnsG495pKvVJma8cPzC6XkXct6FdpvjWttZvoKRHcKfXtccX9YUzn+A8JYKG73btGUSKxJ6BzYUWqqMNhWXBYnQLVH934JyoyDVmwRdoDrkbzv/r3SNl/X3syCHr3v3BWiFMNH23o28nqcJ/6Fzqyc5d0AB2pr2FBQolzNIDjhtX9NZTZGuM5bs0yvhqYzQQmF6wmakVwdr/5BB5VwdTOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 05:36:42 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 05:36:41 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH] binutils: Fix CVE-2025-1178
Date: Tue, 20 May 2025 22:36:23 -0700
Message-ID: <20250521053623.2215756-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: d451e2f9-9375-4902-f2ea-08dd982976fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u2bli4m/UaqcWXMLNIDc/mpUDRinbIMRgfFsRY3o1GnaqweHH2Fv78UXLO7v?=
 =?us-ascii?Q?/ATWUesoxyjGglYSnTIlKFRdbkRslE5Wbjy3EkPJgiq0wmwL8VGgHvnpf6dH?=
 =?us-ascii?Q?8NSr9TeQUh7MtnNPgcXRJm1QjXY0q0cbUt+ryfHV4IBiqBuSIrj7NkNjMRTs?=
 =?us-ascii?Q?vfpjDB6I2aIb/j+cN5F8j/i/TsZ5bPipl5/nmjfIVV3fKs83f8dds0+bqYwX?=
 =?us-ascii?Q?Hv9Rvmg0/54ApWFMcezlB51Kv23YHORigcHlBILa5QHx8VzdInvoPNkjbfLe?=
 =?us-ascii?Q?qxusR/Fss6v2yN5HNtx2N3OiyWOWnftIDk9XwbbTTWuyYC2j3RESaWZY+DVg?=
 =?us-ascii?Q?a/T8INDsR2YvOyYnEOO4cxLCn7EAq0nV+PWv+xLKqxYlI9TH6TPWbvaxU2q6?=
 =?us-ascii?Q?l7w0nGx7QYUBd3ZZ4g27GPQbFtXxHzBqaNG9dpEjQ9IPFW1NiZSX3w48FuDQ?=
 =?us-ascii?Q?iVAYtkkYazhavvjFsLdDXit+wdUoL7Mh4EUj068MX9j1JTW+aaf/3aoh1NJA?=
 =?us-ascii?Q?r6VdHhNYvF3UDA6sDM0bW2lOLnIOkbAllETLGZIBd+yx9OTLzi5upgISh/kp?=
 =?us-ascii?Q?YOX6FK6ZPLo2k0aL9B0B2aZ3Pu8pcpBSJxIg7DxBWUDPgpBE7l52iTimxsc1?=
 =?us-ascii?Q?zvOvep41mtZD61q3lF90WIdQjw2r2WkhM0f+5aiU/1AFZ7xQ2ssvWCSzFyLt?=
 =?us-ascii?Q?9cGg+1YSkQStdWjicy/A0E8QlwIPaE5VodSXsLrd2R0gIJGU9asfFRZq2ynC?=
 =?us-ascii?Q?NnU2Wqz57/2Ca4d2L0FrKYe7k2t36XT5d0XKlrdc3eDTrwmaJIiLZQvAPrP0?=
 =?us-ascii?Q?5tJabt57upWyxldBIb6G6iLMdLtmPeBYHZ+gz3AaurNS/UMyp743Ht+GZsfR?=
 =?us-ascii?Q?rrwTxfZVcID8HeUmkRiFK8u2l0MTWiZk0eiu1P9LqWz4NaaRS8YMTxP4/aHg?=
 =?us-ascii?Q?D2NW7U3daT18iTN8gxFywt2KrVzM5ZIuI+kSxTusdmLX98RQasv3JuUo+QiB?=
 =?us-ascii?Q?gbzRTdLSQ3eiymWWN+rzPU3gJh9n0xXYrsDI3bYD3rG9Sw08OuXrhexd9Gkn?=
 =?us-ascii?Q?ryEDq+0X6rxBBhgqFlamogUV98/XqIoNIlLWQI2GGXeCe9Enow3q+BNrfOAd?=
 =?us-ascii?Q?e1z5DjYKOlrbfh9Bmi9wLjZoW9AzTxWGe/q4c1igxIxfBPZLj2RYBhgEmA2B?=
 =?us-ascii?Q?xWMfwULhPUBej4239NQX6BEDLcT153y1XhjruziD+S6W7x+pMNrV8H1Hzq8Q?=
 =?us-ascii?Q?5uIG8fZTbJmiVA2qXY8+RpXgij0fvEEOqzeRtyhuE+3BT0yS6IsiHrmAqBYj?=
 =?us-ascii?Q?Emrlvag0mXFJlZelovMSJYPC6diJnPFHIFkgyt234torvLCFvQWcUbpbQMaz?=
 =?us-ascii?Q?KtIJBIOP4clYIgfLltL7JtCSpebwVcvMtYhx1BuQ02EdzkzcBfms6Kd946oz?=
 =?us-ascii?Q?VWiiBohLnU8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zpmya/lxBLkFhJ4PXRM441u4cxRB8PMYDPxE7EPznnkaMvH5fpTeUKknSgEb?=
 =?us-ascii?Q?5qkDx5SFbLOTe0rsvVb/oORioZwytbbafg27uF7mjpgdXpgi5DC6aH0Gd3/o?=
 =?us-ascii?Q?1yr0+J2VVfpIxApCkW51QNCD+rQPJ7foVcYtYin/fd7koXW5fo2wnoJE73Yu?=
 =?us-ascii?Q?GXsRs2qM8j3idUIF4A5wqpVXmlVorOv6JYvl7A0PhwtbYSJfwvMXsIn8VQM6?=
 =?us-ascii?Q?U3vAiiRrrXYnFQTwApUJ3FedmkU7c8ZdH6gFuY9FT5oNuFW/b6ePSmxV/1h8?=
 =?us-ascii?Q?AHBn9KquGkJETvyllm15mv5W19IpSaPYX6wbpi/iC5kj4fqFtVvNYUagh/iY?=
 =?us-ascii?Q?1LgldRx42f5jW5/Xa1XqyMFnIVlM9N1h9ed5ZzMA7kX4dSHifrbrFIhPkV99?=
 =?us-ascii?Q?fEG0/hOz1dOLvEmpoe2XdIqnAGTIgbMQ1YNa+OaDnpDcrTJB270LGL+zBNQq?=
 =?us-ascii?Q?zdMP/fA7+ZJyUGYwlwWkekrZ3Z7ydS/apdGoOeM930JuSTmTc8IgxE7m92rR?=
 =?us-ascii?Q?91c2K1SnsXJC0zty08YGIIMwuOxj0SQ3zIzkCyorXb+zLEkgV4OoE2+Tod8a?=
 =?us-ascii?Q?MF5qEyKsMrewv/nvSC3JasJABR7j7wDXaEgtpZTphRc4+rmgTngwjOqDzlLf?=
 =?us-ascii?Q?bnlHy8a914c/Hwr4tulXO4O8kEhok1W2lxfYpl2CkTY9I+1wRFItsXDbztX3?=
 =?us-ascii?Q?DfFJklHNYjccqGXLYmir68Rc034S2kFruepNr9HV1xrOiRfGq6cUhC4A5EwV?=
 =?us-ascii?Q?6oyeBbHNlamyZQaYZDIV/VNE+d0JDIEA8n6Ok4UMGgQ7St/OJ1qHW4Ee1/XD?=
 =?us-ascii?Q?DhlweHZ17m2k8BZnvrP2ubvplvIf4mSriWuUXbR4qe8cwBT9qlr+/h/b3SCL?=
 =?us-ascii?Q?NNEBKDHRMDfY1iaD8zcJDyfi4LaxE9qq7Y8hLvrjUCTjtd9ll0ecb7DvHh3q?=
 =?us-ascii?Q?iUvjm/G84yDFvACTPLEBSUVI/Uju5THDQ7m7dIPHfgOjmPMK7icBLNV+NAkP?=
 =?us-ascii?Q?YzCzbmeIhTCVb+CmrNY6pjg0mDM0pUCUdiQ4B8W44RvKY0laexDbsevXBVm6?=
 =?us-ascii?Q?Ba9jBIWMU4KMWIbE7JPQPbBQhVKKym3bXOgZdhUbg/nyl5uAx/pOqzhIXG2C?=
 =?us-ascii?Q?qyhCyu+W41Lss05+ee5J5oEj8jnqaP6kQGkXadyVZrDJ9Rwv1DX6+slpA7M1?=
 =?us-ascii?Q?ss98BWzYqKLI3Jv99FjSXn3jztXB37fLpN2PcQxUtAie4FwiXNBS7lANrGzT?=
 =?us-ascii?Q?jXWn3ZCELfqvh/m2DJoRuPXYkcH9nu6cOJBOgRrgOSBVJPVe09lPTBOhVx+2?=
 =?us-ascii?Q?VDi8BbLTjMPy+x+tFVUOYOkhLpc0XUAtjwBm4OeRl2PI0UVQGLkHUqoZbzv5?=
 =?us-ascii?Q?PmyTGvxX3xuaCl6IapPFnQQC/yxFrZzTs5EKEUkxvPoI4WJ5fqc8YyFLs/0b?=
 =?us-ascii?Q?Li0IhgQZv8LkxNPFllf5zMdBMHAysDIaz4lqk30RCcabwuwXSL6GcSp53e+3?=
 =?us-ascii?Q?hIc6FQjUxgbfsW7dvcQgwHMklpgfDPlQl1eo/zPjB/2BMZ7qcm12hh75DUCJ?=
 =?us-ascii?Q?hmhoJnhJeU8Wt/YPBcZYTZKLCd62FRH6Ddb0iHcBECRz961ZDfpBmoRwuxVI?=
 =?us-ascii?Q?z9QZwcxpfjDL3I9h4ZCnbLU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d451e2f9-9375-4902-f2ea-08dd982976fa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 05:36:41.5070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fh6U9G2ExZ20MNapiBJdQwNAFS4rO7/R3ZqrvkT4pUQtIEVPNP1WPfU/GEdvt6eUDI5wk9YAmh5fndwt4OEVwy6Wk42SCy4eWBnKRmVf3ARR1EqABhBopN2dZfbjEjF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
X-Authority-Analysis: v=2.4 cv=ObSYDgTY c=1 sm=1 tr=0 ts=682d666c cx=c_pps a=DnJuoDeutjy/DnsrngHDCQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=i07ikm3d_HJQnWEEXj0A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA1MyBTYWx0ZWRfX/D0iGocbxTQn /ROesCmxkfvQpBqdSUFh9gyjmD/J4SU9qiSxdBBWiY3tvzTVYJUpTd8KeYTxkBy/ILHO4KUwdMS lCaDhnj7o4j/vUQIXaLCNn+JpcwNadzX+zGBNOTt1wWdDwMpVO5bix6A9BCzwic8AFryD/nBJVQ
 nAdCjNl4VHr3+S9myfNDs0d0htVuOVV193V0bZiGkQ52m3pqwltRIoyqeO7+WyUo/niLGNSBSDC R9PnkrT4N6AQIH7vfBkiMKqPr6k1QnSujkL+hFWjC+aWRkyGZllzvPVdkmCmKPmaDsbLa71nY/r 5jAPDB9p32zGq7JVtNRy0SYtBaKClnh+GwO8pr3kJ5nXcqxesTQIrK7iAkz1KjmEvCNxZE4LACF
 BipjMeAUyIYBsFrx/XTNaHdhir8kkm/IwMphdzOCF54icV9d+8BS58ZsTK5aZJVGSZ4KmoyU
X-Proofpoint-GUID: D1uOkAcQecAzKsDPcAJom0EPY_9hXxh3
X-Proofpoint-ORIG-GUID: D1uOkAcQecAzKsDPcAJom0EPY_9hXxh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 05:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216967

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Prevent an abort in the bfd linker when attempting to
generate dynamic relocs for a corrupt input file.

PR 32638

Backport a patch from upstream to fix CVE-2025-1178
Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0015-CVE-2025-1178.patch         | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 6bc65a0fea..1c988bafd4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://0015-CVE-2025-1178.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
new file mode 100644
index 0000000000..c39f43fba4
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
@@ -0,0 +1,33 @@
+From 75086e9de1707281172cc77f178e7949a4414ed0 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 13:26:51 +0000
+Subject: [PATCH] Prevent an abort in the bfd linker when attempting to
+ generate dynamic relocs for a corrupt input file.
+
+PR 32638
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]
+CVE: CVE-2025-1178
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index cb32732e..a08e9c97 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -5031,6 +5031,15 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+ 
+       if (generate_dynamic_reloc)
+ 	{
++	  /* If the relgot section has not been created, then
++	     generate an error instead of a reloc.  cf PR 32638.  */
++	  if (relgot == NULL || relgot->size == 0)
++	    {
++	      info->callbacks->einfo (_("%F%pB: Unable to generate dynamic relocs because a suitable section does not exist\n"),
++					output_bfd);
++	      return false;
++	    }
++	  
+ 	  if (relative_reloc_name != NULL
+ 	      && htab->params->report_relative_reloc)
+ 	    _bfd_x86_elf_link_report_relative_reloc
-- 
2.49.0


