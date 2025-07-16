Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62C5C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 12:45:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21151.1752669939203980741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 05:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92925dd44a=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G7AGOx2112298
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 05:45:38 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0sv9h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 05:45:38 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56GCjbDE2670242
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 05:45:37 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0sv9f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 05:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VustLXvYwaQAUGuCJjeKM6WFKllISzVyXFYtTtlJ501tqq9tew5YZf4nFh9IKoUSg7+hp0v5QS+Q9WeOEstgNd/zRyAn58AuQtgACKSMrZ7ky9S5T0E5xJUh3KEuSIUSdbotj29Kt88nkqSngX/RAa5NEyAio6tci+VgL9pC7VAmD1lWcmJvvg0e+6G3vQeHG95rfckD8s44EAdOR2C9tU0fznjUDlenydi8+OSICtQM+E0jA9RQeKAq/EG5Ky5fndFSa26576ha4pQmJ2XWa/7whkfcuNsYo1GDHKOkX0hqOKL5EBJMLn6ysHKHMT/ZrreEzOP5dUgneXbmDJriQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhTHovY+TfnqzvtbVPOsPPL+QOKgnYsjVtkX15CSUDU=;
 b=qm7PD6YJePc7vVqR46NmIXn/1NCstLqDvCF0UXiqgUNLETaV57ujGRsZ2k8Gt7fqdtXXUDX6Q0zXFrSLj4Eg2rRsnKcalM2MMztu1hWTg/L/f8bGSWz+OaBOmJT/np0JqK1myDMVgv45b6VugeCdY7uy3PbotFnc/pNe4QOPgeaRhO2QvEucrJPi6tPORk02jIoMywwTOhyPFzqBSqSQnN9mOHKJ0CQTAPlTXoaUGzKRFMmBqVMpxmaOsSeV8/3jgEssycWeinLhCBuopiK7f2qJvvKuOjvff8YQtGHOPzQXnGlUdJp+p7p3kDbo0kfvjNrrmt8o/3gY4mz0/Wt4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 12:45:34 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%7]) with mapi id 15.20.8901.036; Wed, 16 Jul 2025
 12:45:34 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [walnascar][PATCH] binutils: Fix CVE-2025-7546
Date: Wed, 16 Jul 2025 05:34:55 -0700
Message-ID: <20250716123455.901574-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:a03:80::46) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH0PR11MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd031f5-de41-49be-8df1-08ddc466a835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RtjlKEN5sB1gzePhcms/bZ3Um2Zrl6kXRwGQp9ECJcToVnf++BdPA++5PcQM?=
 =?us-ascii?Q?4F9Hzu7yhl5NLe80IPW/3x/+LIK9UucaaBPHDG+llZQuc+XHDP8f/+o8Fkcb?=
 =?us-ascii?Q?N/KjHmWGz6+F8gizaeySzaO3O3PyXTreIeGjlMKm746+68vFpGk4D2a0H67h?=
 =?us-ascii?Q?p3fMhEpeGLAA3dEvVix3WCHAMmoxP3ymZPZ/DEN3Tm+3d96d9UC4WsjqBSng?=
 =?us-ascii?Q?7iB5h2Pwe48WSwbK+/ih9a0workCvN3nE1NWvCtVKP4eYfbsOCoPigBQcjdu?=
 =?us-ascii?Q?yYjPytESv5qREnyPZceAY+y8nOyC4nSHoXHDLmIg3uV3tkX6bd4DVVE4oqGd?=
 =?us-ascii?Q?kvKzaJBGcsET5HTORIt7SSMeMKO5FBbM0sPDV2LHcy7VVjmgACN3+Z+yuKc7?=
 =?us-ascii?Q?A9ubmyDFdmcj51ZvB8CcOCjVAdKgOtzIu2tIPP5PlIZUDc1vU2vmLGnT7fyR?=
 =?us-ascii?Q?U/aK9k81Tqeoigoi+rxKo4dw81LQ9kfODJ+Kk5X1bWF5ilvLYyDbhkFJbWXt?=
 =?us-ascii?Q?ht3D1GAmgFh56CE4O2eIoLa0z5D8pft2cKOGeQhPW+6TgyJ3ySbdN5YDQXor?=
 =?us-ascii?Q?AdJL833CllKFW2BXC69uWCeV9/RQvAJg7rlFSf0Lc01Uy4FL9d3Ct8n2QQwb?=
 =?us-ascii?Q?4cy27PQMqFxlh0iwtfS78Xzf5KmIAruYAQ9aLLpXI9XhN4hyo6GWLiwAokMw?=
 =?us-ascii?Q?jMIiYpykT8cPG47iDY9WYTZKqtsn8Mv5DHrHIw8x6sx/4Z5hEqOQDKPjHCQh?=
 =?us-ascii?Q?uue3V0n2aJUCYxo0PrlPlEo9i2fjrSyAxFviToxy6XziM2OdXnyXWdgb/Csr?=
 =?us-ascii?Q?9T8puSEE96oHeU5zw3uL15eK/OdoOgGGfy6NMZ7ghmQEC14GFE2w3VAhP6Ma?=
 =?us-ascii?Q?gcD+9wdBYM7PO6FTUkTQqxY915pE/cjmbrsSWyqDsG0R+ksnzHvYYZJ+p9JG?=
 =?us-ascii?Q?FbyUy2VIFlMdd+dxIkJckEzyTMvfuLwma/uticWoLzOwMJmUr/bLiXbemfBD?=
 =?us-ascii?Q?/lVujbMIxowWOupk2guEYHwPEEsyXzghk8uMclKxtFoA9pbI9bkCFL3NVinh?=
 =?us-ascii?Q?ZmrvtIjyPa/WSxzTX1uGDgt21l0ygimrYXVnEfYsZXGU8Detcz6s+6PLB7Vy?=
 =?us-ascii?Q?jyn6dT9UaUYdSKsbNWGvAYi05GsRBHcgOPvG22ty64x9ptOHCf+4pQFJHzB4?=
 =?us-ascii?Q?uBOdOX3GzAHCJuasgut/Tr6h+iboMvudFkzKa5jFArEpnRKHVRgF6Cfu4KK+?=
 =?us-ascii?Q?XdquumSz+gnGZnI9NxiqgCpPXJz5t+SqCYqnoJZxKDo3bllZFsCurWU+0eMo?=
 =?us-ascii?Q?3sMkSLz5JVLMMoUQlX3lMlcIgfp7TMoPA4ACh33QKiyfIbKj/EetZ+cfrrVv?=
 =?us-ascii?Q?LP0xuKx8Tcfr60tgyt4n8s+J6o+5OEsyLz8U6dePxJehlyqujhnV8pZTA3Xu?=
 =?us-ascii?Q?9ROWEfW9ZHs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HMrv2qHrUCdyHf8Z13f6rXiC/ZS5gGEiPZBggYgAHUQnSIf7tEc16cyl6is3?=
 =?us-ascii?Q?qUV/iKmIRQtv3wt5x8u1l/XFv/d7s4DmkYBQc3HsqsEdwHzVH2gwXR+4jSq5?=
 =?us-ascii?Q?O8jifbQPFwlmFDTTXi+Gjmnbw4l2e4dg31RlatRJB6BFTFLORkN8SdOVoVkb?=
 =?us-ascii?Q?lD2PUNXsLBknCxLNbi5Z8YAJYVuDg2Ul97pxptiwKkOLD5hjkE/6/PBGmlDY?=
 =?us-ascii?Q?VpSBEGos3Re0tPGhjT2DqB+sOgo+LiUFl2JGw4RGy90s+zWEuWxkS2hNvIAV?=
 =?us-ascii?Q?jVSoqnLCkI3+JJQg6f0IfIyLE4dMeeWqhKS3IGjSmbHrTsMDvZs1cg0oSFqC?=
 =?us-ascii?Q?QE/9YuT1B05/s1aPxHtvtfLJVwxG5t8Z79il+bESNHnEL/XfCC0kxbXmYzX9?=
 =?us-ascii?Q?19PlM2PhQ9BTM7YDX073hRvIqamxm2LMHp+LdiOdQOBvmL/6Ou/P+BX8AHWm?=
 =?us-ascii?Q?pqEmiUS24geuC5YepDhzPyeSMQzYwPiI2NvXZZMZUutE6p5/wBiDym6StR3s?=
 =?us-ascii?Q?vQe4KPhAUtb2HoBl5gTrYPLi23hB8A1qWHuC1ouYgQWZ+quZLwNqDckqq55g?=
 =?us-ascii?Q?+YnnCNQyilNCob2gFU7tf8o24MRezaJBEeQ2YRRKu3PsbRR59AjSgVc7Pfs5?=
 =?us-ascii?Q?2+MmFrg2X/HrYJky3jxgd8f1Kxwqkz9AB5cGxUjdmiTxyQM8wTsX948wMHAt?=
 =?us-ascii?Q?hEX9QOAlcLmD58RLDEAly8KqnSN1CCpolnlVZcQ9GdSPUc3l0nNnqfTay1sD?=
 =?us-ascii?Q?zwh4UkmVrDsJg6aDsAJeUGcTpBwC5mq/MlaBXRT1zXuGM97EE5YH+CVvFbBP?=
 =?us-ascii?Q?vRqEnnbNsaprqL0UJ+luwaHJRHNJf75a7OQ9f78aUoC/s3gDVNVD5tyNMSXG?=
 =?us-ascii?Q?y5SI1KXGahx/hSWwGYQFU3iDu69JVfv6gF1qIcFnZ8kx5fqCTh81MIgcrYMM?=
 =?us-ascii?Q?wjCRvz1zvOg/O1cTV8e/HNawNDH6mOhxcH8tn0NQhQxlhss2kjz/HM7RGxqt?=
 =?us-ascii?Q?z7XJmPGhkpnFU10QK+MgOYXXSCDGRjjdVxZ7SZavRZokUoJr78mK8UXhUY8L?=
 =?us-ascii?Q?GdpwPMXfIFdRj3OASgW6CRFUixgwZGuREJj4pJw25X6Q4vX9zC7t0yc7IcxQ?=
 =?us-ascii?Q?aeuUkSzmxkwfsUiTRclkZRqSftI/GFGSQpA2Dztw2B3dCj34Vi5PJprZaDt5?=
 =?us-ascii?Q?tKxZTR9pfrVHcXADyqfdrkfwvntrmo56UJ0wYrixTh7L4Iyk5J4w6/5xWXzM?=
 =?us-ascii?Q?Gxma6c1jxE4k9Gv0trUr+8ia+LBZ5ylfeD55Sw4id4YYEMMMuaNnPDVlNTP4?=
 =?us-ascii?Q?g4Wg99omLu2Wp7LYOIdTJpY74aydIQLQOXGrTM1kZ2hxgg4bd+YYX/SlFBkr?=
 =?us-ascii?Q?et0Qh6Yc+zfanU5mKnlfG+W5oRFLBP+eSX53yDXDGMXCZewdOMGuJ+ZEd+dL?=
 =?us-ascii?Q?f8sle7JSYn73XW+1cV7l5MN1A5EUerG3rqhpypnDi+4ktO9i/gwybncBO2MZ?=
 =?us-ascii?Q?tzsRilvQPsQTxYQNMLjkOuPHHwPZYiQLu1WQP2j7C083gnOA24tm0rvXPlk1?=
 =?us-ascii?Q?nLNdi46IWQUVvVF2bB8UqN4vs1H4SWQLzSH1Lo9vt3Y2k5EB/YuqAOWgFMY+?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd031f5-de41-49be-8df1-08ddc466a835
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 12:45:34.5800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUTg/wzvrY5wuys1gs8g/Iwj81N1qTgkNeVzNkhebTistmbOwVBxQsPJG2AEzqkbEx9VjhG9ujVV5xcH2QHKKaYvb3rqjW8rTOUUN8URx60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
X-Proofpoint-ORIG-GUID: nYp944jwZzzhPnAuL6H2j4veFb0LyO9u
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=68779ef2 cx=c_pps
 a=mBgp/6vq0jBVdDewdQNmxA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=JpM3RfheRiMeTFbm_d0A:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfXzEaR3L3Usz7r
 CzHyrrr/MR4GaETLYfUPug2AgC4WFgwBZLo1ZfgTGTXYFPuenxXqqI2YVrZIQrfTM5KZtFqoSyF
 3FGWeh0R6pZbkKUlpNGWFksu9lD9g4OetE+0YEjiCBLy4As83qoqjaObDkLG6/flvet3a1Ob1vG
 Txq21GkGbzJB8482asJzLrxFe/rtREqfzl3Uu3xG9Em6b5aBwZPzHzX6qFloPTaNrM/NEcL0u31
 +j9ujhZzGcV/1uBbOgX/6POWOSUvHGjVYAGrXwHtMIBMAfQCoqDxnpKxEUr1BF5V9kTa++cuZlA
 oyHwMQep1sgEcezNDT0b27vUPiZjQrcP2usCsVvjTlhvG+IeiomjTSDgQsw9UeQ4WYrDGKmaLAC
 LHZ5oUml
X-Proofpoint-GUID: 1zAcH2TzvMqH3txNGqc1lda8cYbJXkyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 12:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220450

From: Yash Shinde <Yash.Shinde@windriver.com>

Report corrupted group section instead of trying to recover.

CVE: CVE-2025-7546
Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
PR  33050 [https://sourceware.org/bugzilla/show_bug.cgi?id=33050]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0018-CVE-2025-7546.patch         | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index e5df62b14e..3c32ad6cc2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -42,5 +42,6 @@ SRC_URI = "\
      file://0017-CVE-2025-1181-2.patch \
      file://0016-CVE-2025-5244.patch \
      file://0016-CVE-2025-3198.patch \
+     file://0018-CVE-2025-7546.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch
new file mode 100644
index 0000000000..23c38091a2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-7546.patch
@@ -0,0 +1,58 @@
+From 41461010eb7c79fee7a9d5f6209accdaac66cc6b Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 21 Jun 2025 06:52:00 +0800
+Subject: [PATCH] elf: Report corrupted group section
+
+Report corrupted group section instead of trying to recover.
+
+	PR binutils/33050
+	* elf.c (bfd_elf_set_group_contents): Report corrupted group
+	section.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
+CVE: CVE-2025-7546
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+ bfd/elf.c | 23 ++++++++++-------------
+ 1 file changed, 10 insertions(+), 13 deletions(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 14ce15c7254..ee894eb05f2 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -3971,20 +3971,17 @@ bfd_elf_set_group_contents (bfd *abfd, asection *sec, void *failedptrarg)
+ 	break;
+     }
+ 
+-  /* We should always get here with loc == sec->contents + 4, but it is
+-     possible to craft bogus SHT_GROUP sections that will cause segfaults
+-     in objcopy without checking loc here and in the loop above.  */
+-  if (loc == sec->contents)
+-    BFD_ASSERT (0);
+-  else
++  /* We should always get here with loc == sec->contents + 4.  Return
++     an error for bogus SHT_GROUP sections.  */
++  loc -= 4;
++  if (loc != sec->contents)
+     {
+-      loc -= 4;
+-      if (loc != sec->contents)
+-	{
+-	  BFD_ASSERT (0);
+-	  memset (sec->contents + 4, 0, loc - sec->contents);
+-	  loc = sec->contents;
+-	}
++      /* xgettext:c-format */
++      _bfd_error_handler (_("%pB: corrupted group section: `%pA'"),
++			  abfd, sec);
++      bfd_set_error (bfd_error_bad_value);
++      *failedptr = true;
++      return;
+     }
+ 
+   H_PUT_32 (abfd, sec->flags & SEC_LINK_ONCE ? GRP_COMDAT : 0, loc);
+-- 
+2.43.5
+
-- 
2.49.0


