Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF912C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 04:50:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.329.1749099033924346227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 21:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82513ac62d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5554bpsM008301
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 21:50:33 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9ruf5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 21:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwe2fBij913la/RZDg9lB/J+2THsU2Nn0nRbSWR6Nv+lFVPelUEPD/Jlb/cAV80ixSZFY2y/3W3VInFCPeIiQYPrGSQzH1z+ZdHjwgBYzns8UwNNTAELsBGodjSJ1gRD34M7ENqylbExh/KdRY87IyfUuso0FTamWKL8aIq0uUbYhJRBMdh6FaNDgG3M4FEcGsp61vo2M3WPa3smcxM9674eRUm7ZJQzqqTHyakPsMHC9XW3/K4/5eQdwd455yKJ+YJ2Y/eNhF/r0tDe2LQqnVYqNttFwP5QMK8izO/bBCDYSIy7f7UJfagJxTDbyWDmM18uNLItkSghwsf82dM8lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DshVFVtWw+a20nZU6JWZjICfYGLw4g69geAlQ9sp9aY=;
 b=qmJRbiiYvAxCNcl63857fsIRRdhSCvgxaNpAGVAZ7E/VEDDUrauMU9xevQAmjwyTTDJyrtUqSY32YFHUrFithxuLtUWkxWtEVwjyRIn6GPC6batqRekHT8yfgJX7tfOgOTgdNLClMcNl+UsqzSECxtIza+VH6ZzITjINDIiM5sjUfKfjbUOJnjG8NzGGcL5tduaobyziOu23K2ecUdN4CYCCjgHAJrZ32PewW53NMvNM7aJql87v3kcCCrwFzh68KKM14t/8iCN2O85VvwFLUvBUnAV3O/uStsMtGSG299asTioDXwQajHqzu/i0VbfdnfHWwI8yUtZgBAA44yaSvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 04:50:28 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 04:50:28 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] binutils: Fix CVE-2025-5245
Date: Wed,  4 Jun 2025 21:50:26 -0700
Message-ID: <20250605045026.534911-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0022.namprd22.prod.outlook.com
 (2603:10b6:208:238::27) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CH3PR11MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: cc010019-eacc-4a0f-7444-08dda3ec7e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7VFmHX1YOwRLEnGVEImtkw/qKEUtpUOXXalLSKZwwldfKiXqmq9xkNJZnvzZ?=
 =?us-ascii?Q?Qwu/g8mEveomaPH8P96mwtQQU9iKBn3MB+2iJPcOkXP9AiZhYxAxB7meDJJw?=
 =?us-ascii?Q?O3WINOSgWqyOHP6TEGKK6doxBnFKIj+Q71gb7gKCbHqPrJ8r1pDxpUcfNi/W?=
 =?us-ascii?Q?Aly4qQHydCqmJln3ZPKB1bWPQcCtcROXPlFHRS1JOoKv7xMmgRI2eU+nk3Pb?=
 =?us-ascii?Q?+7A1DkczivVC1w9WI2p1MFj7FOa6A2NzhKCzvImlZxit+QzL9wXsevbSkjlg?=
 =?us-ascii?Q?+j/YoKPONDIqvM3Put2yBaC0qTc+sheoNz2KWxID1DDuwyOlEEnu1lZIm+58?=
 =?us-ascii?Q?3D3YPH6na8MuYMvlziNZVJKEYZE4W40Tl/2Kvj58Y71X1MwIkgO1Wa+kpFTj?=
 =?us-ascii?Q?lJm+j+a9OBQhiq7kYBykq1nQSufsEQKvDWikAahMclepC2fxCy0habBzSduN?=
 =?us-ascii?Q?eC9RyKSHBpPFSbOIRCTGChUzWtWBtrVFyswamlmqnPYTrJSd+tMEi0Y56P8H?=
 =?us-ascii?Q?Bl+tPQCvBU8Y0n2aWos9sXdb61MbLiXvfPk5ShX0scTVw7KxBExHJSiAZ+pl?=
 =?us-ascii?Q?gIYSX6yNRn7p1AAecZPxA2AoUK6/uoGTfGX1IX9uZG5dDQhOauNXsCVhmRxv?=
 =?us-ascii?Q?ue5jKPqZfS21/0IHD3r3T4V7JYQMPPTDhJ0w1wRy5XpqBu2NjWcGhNw2oUdF?=
 =?us-ascii?Q?ZCCjEDscnJioUzi1YKNBugfQ8JD7ye1lMLngvC9MhXyH8OZWuEvirny+9byL?=
 =?us-ascii?Q?gBGeMvvAa20Qvl32emGMmslz+0oVI4kykO6mODYVnxWJpuH5AHyERS7jLrfa?=
 =?us-ascii?Q?ewd35EVpvu8khPT84iq+kjOrvj0+qXnFiDvlicwUPSPv75lbSWRpQ6ZMPiyu?=
 =?us-ascii?Q?fW2e0L9YgUOpZq1MGNPPw2lFiB2ouDHo0eBZvl91Jwj+ga9wQ16z8RDS50aC?=
 =?us-ascii?Q?8dVre9iJz7G3fUCNNkdyp1YK5sMSeppot6NEEBYNbE6UkBEct0sb5Ohy4x7q?=
 =?us-ascii?Q?qm/sZv96C10Rg9TDU/IYyb7FWE0WB4jnH8jQjxuKSCKniCDhhnDLyOINxYzv?=
 =?us-ascii?Q?LG3/3ZTxCSjUPmrUOmLVp1vemGw1pUEdVvkvrn79ym4Fdq9B2Yw/Annep9W8?=
 =?us-ascii?Q?ZnYnYMNWSmJipyy4m5x6Dj2HctUuiGSQvT5xb1NGWgiahU3QZg06m09Q+1CI?=
 =?us-ascii?Q?rV7cquVZS8l4PK3a4TIteO8e5Oi8QmVI8Kvi3L2LoCIYhxxzeLnK6EkantjK?=
 =?us-ascii?Q?KG9xga7Zt0q0X92E6hJywKXg4rNDpW2SNi/0itvFKbKrPWrg3ujYH4fJ+6Ye?=
 =?us-ascii?Q?T2v0JKGEOLNSt1hoVnKG5lGd+M33IspOoceTXEk9nrgcD67DaCVZPCmtESaU?=
 =?us-ascii?Q?hiXccianGqLuUHi5DIK8WU5UlXiD0Cs45w2JT/eLnTkwDJnV0foarJU0Rl3j?=
 =?us-ascii?Q?G1vCSDMbyqc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VSuKDxmMoAn57pNb9qbbcUbSFG9sSzrK0ULFS3I5ZCYdE3qm5AI/JoO83aig?=
 =?us-ascii?Q?V5JAnerkn2twJB3xR/k3qXtJ+qDybS6fBbcH53YtENTBgwcSGe2Pv6eGI+cp?=
 =?us-ascii?Q?uZzyr8EYnW7XyNsk9sphDgGPkhQG7jl2u7wNIFstgTSxDKj+i24pIYMpJuA+?=
 =?us-ascii?Q?otnAjZFEPDQD4FoJ10A4/OZoYuCc60ILsif8xBdUTh0201Q8xvgiP/OXZeAm?=
 =?us-ascii?Q?fX2qk5bMEu2uZvbbMQbY43axz17syasdoE0B5Z0URLyE+E3MxN4dqdNYAJYR?=
 =?us-ascii?Q?wPI4ofsW0idSY3KiQV7CWpa2PqElAxzMVtdYtN3+7aF2Vufo2n08JcY14TZG?=
 =?us-ascii?Q?oF+64NMbJY1Tgs1ZOAd/qT6Rpl2jUPrHJOGMexoRmpPDTIhhPKlk6Z5FPrJH?=
 =?us-ascii?Q?/O39m11EbxmKzNmIpVqmsMaBphCP0gCASzoBvAGnurSGuP8o92ymnaAd/MrD?=
 =?us-ascii?Q?xDhktw1V+fwRrEkRBfrP6SRtoHxVjlwkuULHjfvj4nnvhSiwFVbuC161QOOe?=
 =?us-ascii?Q?h55qsv9Unx3An4W7Ax8aVg427Mh0py3ppcZWI2A0tBu/56o3nvd9G5fecpac?=
 =?us-ascii?Q?gDNfqpAkJxo83DR8xRofZEfKyqGQQFqCTTrAm+v+jAT6GEG0moECPQXCcf0C?=
 =?us-ascii?Q?wnwxinhxweUT6VOZi91QHt252iDveBAesmfoH8sJ1d70ppxe2tMcacq1x2A9?=
 =?us-ascii?Q?aKhdVHIc6Yy45n2H3nA0spDBcwjvR8UCUyZpQgeCgOk8ZSkzR9vrAUQWGmVh?=
 =?us-ascii?Q?6ZmQi7AROaPeFevqV3NvAr5Xw1krgOS9xrLDykF7olIPpPLzi5smOx4/BH5l?=
 =?us-ascii?Q?u9g751y8CYZanzXLQUlR3sRr5+YyNHxtp9z4q5I0O+MUKpXY8oY3puL6GG+l?=
 =?us-ascii?Q?1RiKlitDwl0CGqSd6RVUXU0jraod069dElLSwJYfmkbWtNaeLEk8ek16/SEG?=
 =?us-ascii?Q?NESysW7PAJXJQ/78T+jBMhD96Yk0gXa1k6pRlsibffRsxKSmbNE6ZOW3EtPY?=
 =?us-ascii?Q?m/egmCUKl+CuqCGCBouY5KSqUWWGeYMY535dr6U2hzPJoa2Pp85jJab1t8RX?=
 =?us-ascii?Q?up4RIjHo0a5I+AjS43rTzPxgHU7thRzm7vs40irSv/HIJJWPrrBQxKWc+PDb?=
 =?us-ascii?Q?3pg6D4VQyCDv4tVwpPFoM+uEJyYTMJbyMN6IcjXv6sVpYQqp8GMNwFToF+4i?=
 =?us-ascii?Q?BM9UU2uSYQxv9ZKU6WXBYdQl5VF6t1pwzOWAjhap/PbMh4Cvb0hR7X+g03n9?=
 =?us-ascii?Q?8IGs3lJ5LxQIkh+1/328CWG75x/EcE0CCMgTzDSRC6oBmSEi54D5TpOhC8gh?=
 =?us-ascii?Q?vDqn9Zbk4DejNmGqo8TZ+OdPVAqfYWvUSNp51d/f6zv/qnkbVRiTDIyOFihA?=
 =?us-ascii?Q?gs8T+d+JwtHtE0wabAsRYrpR3oyQSURj99XMkwBclQellE+dTZIUlHbVJubF?=
 =?us-ascii?Q?t6CUGLh0R/5E0vYVOLJWmmZ/1r30OR8wKf0WmSrRgRs6xKlrqub7xw1T8SkW?=
 =?us-ascii?Q?t6uiXOctleQgKNn9a0Fa110cBPbMkAGWAqI9sM1H5qBWJFU4t+Bkxcy43J+r?=
 =?us-ascii?Q?H7WO8QdNbcegLWctqrx2Riahaz+qtJfQCdtdFqD4WE34U/ZMA067ybfqIATy?=
 =?us-ascii?Q?OKKLZUYNHFXtC6N4cvS883I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc010019-eacc-4a0f-7444-08dda3ec7e42
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 04:50:28.3883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PRsr1Mdim+LzIiQqVrykqX9U6OO0KqpFtuDmNmFA4aX9IJWSTBLkuWPK6fI97JTixHlbmhz/9tiELXfbal0haXJ4w9Q+K5tkOMGH+Ga62dXp8voqwTQsKFszfU51zHR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
X-Proofpoint-GUID: st45om7RrMKGnzDiQfMxgmWq09TVUOpS
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68412219 cx=c_pps a=1qom1VPyPr7zHzn88zifxA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=G7adr3sDebAgiyP3PKIA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA0MCBTYWx0ZWRfX8fe2E5cV8FhO gwZN2OTq/rspNgwRKFdhxmCdDiNMtzogNF5mcNpsm6h46l52mZsT5Q6poqvq1lnzteKM/EmhqUJ mT968biU+P7Iq1E+xdYgkMr2tuAM+C2jkLttwoKv1/p5bxO0jxqKEhG5+/QfdK9jiTUm4ExKxyf
 jH79vU6be1FGxWQYCza7yVK7CibM0H0SNpYWeLp16ekjnJbMbFhgpmt4zMws3/ErRVpDm986dqy 61hwmFsOQBDEim3dsrYR1RaX4R8aSSRbY5MPve3pWWOwpLSvYx52G/rUKwVzNmy8iUgdkAeE1mX /U4L6fb74RMF91Nzh2XrO2AEqkFwuHW6Zl4wzsY+FKluMUqVyz6FUZxnixKtbK49OhEEoQ0U+AX
 wkCpQpApb2hqaiVV3+EfqTttU/3b/GHOEkhPNeFuiRJSKY4VmYEazNQFF/C2x1wuLT40gt25
X-Proofpoint-ORIG-GUID: st45om7RrMKGnzDiQfMxgmWq09TVUOpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=851
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 04:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217980

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32829, SEGV on objdump function debug_type_samep
u.kenum is always non-NULL, see debug_make_enum_type.

Backport a patch from upstream to fix CVE-2025-5245
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0018-CVE-2025-5245.patch         | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 5838b2ebeb..c3a597cd7b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -40,5 +40,6 @@ SRC_URI = "\
      file://CVE-2025-1182.patch \
      file://0016-CVE-2025-1181-1.patch \
      file://0017-CVE-2025-1181-2.patch \
+     file://0018-CVE-2025-5245.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
new file mode 100644
index 0000000000..d4b7d55966
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
@@ -0,0 +1,38 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 1 Apr 2025 22:36:54 +1030
+
+PR32829, SEGV on objdump function debug_type_samep
+u.kenum is always non-NULL, see debug_make_enum_type.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]
+CVE: CVE-2025-5245
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/debug.c b/binutils/debug.c
+index dcc8ccde..465b18e7 100644
+--- a/binutils/debug.c
++++ b/binutils/debug.c
+@@ -2554,9 +2554,6 @@ debug_write_type (struct debug_handle *info,
+     case DEBUG_KIND_UNION_CLASS:
+       return debug_write_class_type (info, fns, fhandle, type, tag);
+     case DEBUG_KIND_ENUM:
+-      if (type->u.kenum == NULL)
+-	return (*fns->enum_type) (fhandle, tag, (const char **) NULL,
+-				  (bfd_signed_vma *) NULL);
+       return (*fns->enum_type) (fhandle, tag, type->u.kenum->names,
+ 				type->u.kenum->values);
+     case DEBUG_KIND_POINTER:
+@@ -3097,9 +3094,9 @@ debug_type_samep (struct debug_handle *info, struct debug_type_s *t1,
+       break;
+ 
+     case DEBUG_KIND_ENUM:
+-      if (t1->u.kenum == NULL)
+-	ret = t2->u.kenum == NULL;
+-      else if (t2->u.kenum == NULL)
++      if (t1->u.kenum->names == NULL)
++	ret = t2->u.kenum->names == NULL;
++      else if (t2->u.kenum->names == NULL)
+ 	ret = false;
+       else
+ 	{
-- 
2.49.0


