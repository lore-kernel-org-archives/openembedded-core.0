Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F2CC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 05:17:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4729.1743139055555700929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 22:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51822bc331=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S48nBt024336
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 05:17:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1pvws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 05:17:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsN6RpFZW1fvRFUvlu3sd3F/4fS2QSR2KwEtVbgx2nPLi0B8dgcFOUQgHARjn/Ik3mVFAsj9iPC1Kf4r8q1EZyTOl9GKdmk6vSK0VcYXoeZ695YxYUkAkOd8LZUjOUlucd77GuDW1b3IwQOeB+CFpFuaJub7cuGgfmJ42qLEHntdOUUw6I64ZtXH/C1WBDrq0nQmrElE0U/961K2236v9+rILzOmUZrd2WaFDjb6TvUH/jZbD6q3h7TQ8xo94sdK+GfMqtxmfEA6FG9c3/gg7KhdMkVOMz5IELpf7nKzB1vm78PaEPjD56k1IQJthXBaADWIKG4WTAnUF5iu/Lxz+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buz2J04Pmh9ARzDt1joofyoKPfqbY68X6ymEfrlOkJw=;
 b=sjjDGtO39unUYBTEBaiThe9L19bdXgqUn7G2qo7ZNL1fzqb+oi5gzouRsfDt2JfvRT2dP/iuNZNO41Vd5GZ6VqHAzZKVBbkqOJylQtI70aUwcbgkeC6/nswSTiNK6lsytBa/Mj5INrDoSZKWu9YxKDqg0DZSreTsE7eE4JbsKOpf0d7sHh8Ybson8PnxfQTTfMNqtNkNrMqwp0gjfXG4+skYiqKYZ4u4BVTh8PT49BGj8/k6EI5qnDBn0Re7pPTl3CDauU8ELIUTFgH3EvwACfuIJfBfIYuSqwnHFLVJ1FURKa67IpdYK+F0ivyvTkVFAizFvb7ew5yv3dnhbrczDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 05:17:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 05:17:30 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] time: fix runtime version from UNKNOWN to 1.9
Date: Thu, 27 Mar 2025 22:17:15 -0700
Message-ID: <20250328051715.921849-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4P288CA0093.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW4PR11MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c556b1-5051-4c29-b028-08dd6db7d685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q9Z8Hp/jc5vmtn1ohaSlcqQjvDlARiF3AjU6lLRYtGWUxrgxuLkHW06bZ63R?=
 =?us-ascii?Q?ZH8WqhRuHfy9DHV6rpa2RDXBzTehGFkyyLKypXnMDfvepE18sQFV6UdAjr7u?=
 =?us-ascii?Q?VEajRksbvwSEn5jNX2yjRg0zo8gXssD8d3W/QtuK6nV+LOn++xlyVzx8u/0v?=
 =?us-ascii?Q?SISAxpgoFaykT+PkWQ/fS8wgYVycL0j6nooe+KSsvUOdhcgd9zYuklRY1dLc?=
 =?us-ascii?Q?OcCLhwxg+mzTrDYY/kO+UGRfF8bacftTzy+QkBlohVNOgDffVpEVJdAZaA7j?=
 =?us-ascii?Q?i8i+so3tTpvTiNUp9+LD2KE65O7G5T9xQ51UdfJ5/Qzs0NPQCgtH1EHyI9Fk?=
 =?us-ascii?Q?PnUUc0us/jXwJ8+rMZfbfsH8t7pDDD4czl8YjeHuxOhfTLm0AfGuwD5nLU1+?=
 =?us-ascii?Q?VLlHBCHYdxyDEWXkdkIUOQZAZ/Epvt+n6Zg/JkDORGqQo7+TO2lG3SHVsQ2m?=
 =?us-ascii?Q?uv1vpRu2ARbxadsZQXAOqv86JRotxBPiPKVvqn1R/NClSnTu5I+vHNFuPjQA?=
 =?us-ascii?Q?ef6fFYY/xro7yi1GWU+ieDLNnVAAzusbvogKofz9LJxSUoyE7zshknE9ucB0?=
 =?us-ascii?Q?Yb/KQkihdOvicN93pgo7/LDJ/XizaRN43eSvZaF78vjH91uWioRAXoR/cQeM?=
 =?us-ascii?Q?Qnvo/b2BHgfmjdyjDI+vIk1RqsMCWvVA/QobJi79Oq75rfviU2iPr68165vp?=
 =?us-ascii?Q?NNmyYicJp/qWWIcyCf6lY9KnIZofK6c0iYFZ5jlVnrOSrMD69hFdIj+ul0cx?=
 =?us-ascii?Q?XlXhwijJW1HPUDFVE2vnHnSbcR+60rO0xhDNCPrmJAJCyBanpdLFK0NfYPVx?=
 =?us-ascii?Q?H4GyyMT4HLYRWFaYnC1UV37rIvSTSHbUxPNEDF0YDn8FUlOoIt4NgfxOIOZJ?=
 =?us-ascii?Q?tsv/VhGP4hGWpDYcnQwp3LsUBghkNyJc5AW4MAmS5StCFSGXxU45u90orU73?=
 =?us-ascii?Q?j81HVGmL7K1MDE7ARFr14IW05NVNXiRd2W1wEBDXWFw5+tdm3Y4yD3ENNmjQ?=
 =?us-ascii?Q?Y4N63wVCxB3TtXOZZQuct4W6M0xq56ezMy933nmOWny6xzhtFzWAuAVlc8EG?=
 =?us-ascii?Q?KOWOzk5AiEqJCJJA29RYJgcw5O2utpwUKrvs/joLswEpK7/eDvXh/oUKvtL3?=
 =?us-ascii?Q?mPPUOTVHknaTQUMbawaVW5+lSRXVdKtKQ9HdSHYK7KDiqoQfr4/yns9HJK0o?=
 =?us-ascii?Q?8UyPP8Ijaw1x2wLTpsj4933K9Lj8wkRx5STQMnD9oLKNG/5aEGV9FUtbRg3d?=
 =?us-ascii?Q?asNSZ0BFSwfv+h6MAMdmK2N88yjs9l91A6yYHw+UhusnSLqjlkrc+Le8nCKO?=
 =?us-ascii?Q?l5p6fGVKBuQhSjbykhA6zYVO+iLtTsvXo6x7z2i+MP7aXiH00bXonytUsoWA?=
 =?us-ascii?Q?nNX/Ai+sWSMcVj8SBLnZlyrpIUtwsgNs15G8UPqU9Qb4WvIcsFaKlBY2/XCy?=
 =?us-ascii?Q?xttiMbHmXiHsxbXuW1k791PmmKILRXf9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xW2Yxyh8Zz7y2a/R2Ub107vrIEsKv1eG/FHEiG1Oo7WgDaBkLtasQHk22Tvh?=
 =?us-ascii?Q?tyI2Cx5YmUyRw+E4Tj8HYPcnmAitTL9SmqGbRwDgFEBTl3rXtjpCBsYq2Y2w?=
 =?us-ascii?Q?U41cSNFaae9PRgZUlrF8gjZsmD5sdW+0CVrsQqcDVhfAkhspWn+vavj75Y1s?=
 =?us-ascii?Q?ONNek71vyYF4fR1MM+LO5EBXDDE58JarhmD3shkBPWdxlBIhMZOKyQUjfKFe?=
 =?us-ascii?Q?WHCZEyMZZR9xmfmYrpgB+JLs0T/3WaS9RQG1qHHsQqewcyNZ+SguLgQWH0pK?=
 =?us-ascii?Q?L94OswZ3Wp99O4+TOX37YoRlG9/pcr3qMz8kevFNkbpyyIltNPhE5D6JUnA5?=
 =?us-ascii?Q?6jJqFLZSu8+HLKvSxSRkMH87IaNWjOLM/fSTWaidi09P4LpaiOeDbgUU3zhU?=
 =?us-ascii?Q?AvZ1YiYNB3mzZAkJrqwi9AOHrsAmibcbPDAb8cX78jKAfYlFR5hH1XkqeAhB?=
 =?us-ascii?Q?LA7BKnm9nWfwUG8DF1sSO4vpcUuDtPYLx6mvyFsBoOVCpZkGulHqv1t8xrRy?=
 =?us-ascii?Q?5IYZL7aW3ub5BELvCZNwN3nY1tbPU2tpHK6j0GJS6CuPSAShVxM6W2JTdiXh?=
 =?us-ascii?Q?++AWjeMVXzXicaGBG9dMGOSn0dBIuFAH7B51bphnIHGGmNKEBcBnRoZQYuK9?=
 =?us-ascii?Q?e3ykq2prdSq3+4kCz1Zurd3WFsc1/5JFrk+RDCEOdrhjV3IeBJlxUmJJaY4S?=
 =?us-ascii?Q?ncu93LhKS45x79UD+22MIUOImfAvA6ai0IdlFOLKs6X/Nl4Cc8z+RDy4XWpi?=
 =?us-ascii?Q?9zEcz5zEvbKlroWdBL0lSGXNQnq+xF3sZ+/GOlRSsx5KLXSbUcfzsLhrtLjj?=
 =?us-ascii?Q?y/cTwj068wVu5+OqQq9tIFQ2ZQFFSN0NciJc4PXZ9FhFTAenw5Cp9/giWWv2?=
 =?us-ascii?Q?u4O0evEvddN2JQy6B8blUB9e2JH85h0g52/EdpzubkQXzY5FfLchqQFR+7Y7?=
 =?us-ascii?Q?JVwdstH2ajrFmFEfB3QPhBx5DhPUWdQNW87QByVj8/1vAEZ8oW4nwIHkuIW+?=
 =?us-ascii?Q?sc/7I6hHQUMZkj8dmovD84jPmfcMJ/AuE1FiiQPCY95zddduZv2p47hCI1IB?=
 =?us-ascii?Q?V70DLLhBNo4K8gidoFk8xWNUIjCHhjev4V1UmjHawU/UFnopiSlV8ofvsaWx?=
 =?us-ascii?Q?XvkZQNsZewKBFuZAOPOxl6rz5AEPiHkNdNnoQSklVA7Su5M9Bd1+7ydaXa4i?=
 =?us-ascii?Q?t3k/tGUs5tYex3y/Lh58Nb/G3T3rNncdn2xlJ7wnHv5oMOyaicA+UeZHpgj/?=
 =?us-ascii?Q?+qmXgFhYAuGE1uLD9WE7j47jlaIlR1z5nmgcr920NJct9qFucRrwVxDxt0We?=
 =?us-ascii?Q?0fgRhEL/81vJjULrSaVdHOZAX/00A+XGG4b8E2R8VG2f+XKeXub7wkfKB6AB?=
 =?us-ascii?Q?93NddMQK+o9jbTq2Y+K83beGKFQDMsi5l59cpqQ9v+OU5cbK6XFm+j4SAJhX?=
 =?us-ascii?Q?jhMqQSFvM0fQIlmmXkNhO4do6NcHY07Ztbq7EK2ZhEIjembQQJgwZkluGgdw?=
 =?us-ascii?Q?VkVato+/G1sdMGf0S5PrZfLR5nc/OdAZtPzuCGE6NhDTl5XBeyTtkS/bKYKn?=
 =?us-ascii?Q?6Sk9X9/7FMdI5ilLAe+jGLIlwxNh8jrE07qnSriK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c556b1-5051-4c29-b028-08dd6db7d685
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 05:17:30.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kaCeWdhBajOpMkdRvGNDkwPLYaqg7NrYu0FLZiABv7MScW56EDVLEsWjgNfFpvN4z+rU9lBCE+wjxmTlejIRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e630ee cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=uruxHgBA79GqQsptt8UA:9 a=1V_NPmwlr5UA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5P3FDoDprJqozQLNuHk328wAWr0U4tRL
X-Proofpoint-ORIG-GUID: 5P3FDoDprJqozQLNuHk328wAWr0U4tRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 05:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213810

From: Chen Qi <Qi.Chen@windriver.com>

The runtime version of time is determined by:
build-aux/git-version-gen .tarball-version

But there's no .tarball-version in the tarball. So we add this file
manually with ${PV} as the content if it does not exist.

Note that there's a patch for upstream:
https://lists.gnu.org/archive/html/bug-time/2021-01/msg00000.html
So it's possible that when this time recipe is upgraded to a new
version, we won't need such adjust any more.

Before the fix, time --version:
time (GNU Time) UNKNOWN

After the fix, time --version:
time (GNU Time) 1.9

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/time/time_1.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index 366a64d8e5..125554b378 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -23,3 +23,8 @@ SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"
 SRC_URI[sha256sum] = "fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e"
 
 inherit autotools
+
+# Submitted fix: https://lists.gnu.org/archive/html/bug-time/2021-01/msg00000.html
+do_configure:prepend () {
+    [ ! -e ${S}/.tarball-version ] && echo ${PV} > ${S}/.tarball-version
+}
-- 
2.48.1


