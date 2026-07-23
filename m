Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87E4C531CF
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 11:21:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21238.1784805675265881459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 04:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GJ3gpjS3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1664a73ee3=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8sIn72947885
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=bKXi3qUJ7QE2hyKZ8c5BfSfySFMOzud2D6oBcYrvvRM=; b=
	GJ3gpjS3Jo9jOSLuAPygwBAgmcs4af34Kol4jF93VOQD5ZBHGHSZQdWInZB/vYX2
	E/JcO6z4+Z7HiGCvl+KqnsWcvpNKtSZfJf6V+bAVyBv270WyL9q1bXSqm5gwV4gt
	b1Q28D3Z0LSAn7wgcjxZakA/4v9VvLusL9PAZRMlD79PgHl6VaisDw5Tmd/rXuY2
	9faiXFPoh0qJHxWjzv89A7gnKy6FN44AKp8hGHxko40FPxNAkhVjH5O2+z86fNj1
	QpevuNhcW6zuEA6IqjE/U3dH2TzCS+VQkRUt8J7hXsC9rmEpfsTMTWQZfCUxrruM
	19qdzJZVIiUqkK4IXvnv4A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fkdhy0c27-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:21:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAIV5yQyoxKLaYEFRvyTH39Up8wy5fqJFOrMtYS31gPFy5rgp92M+5GhStqoRgFkibee4mKf/NSGKe5fcg7pSytkIfjGskgGkzcbsLmgwRnIr0+vFqiXIT17fdrIsRLJC92nkAak+0eztP21s/qKorIAIkzPF02vreMMZSOjRqqNN5x5FCbdPRbATD2M3yHM3BQ9ETFZzKhWYf7iCi1p7aA+843NPWupXdGrNDLdaPQ32BVLCYU6xJlzWDLvICx9JshHZtCFCkjgLaQHnCKOGJJ9ZEQgBUHxwg/aguI4J8PeuI18WkOWGrNaS6HD3UZrR6VsskzNwCKbjyzUUXhtvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKXi3qUJ7QE2hyKZ8c5BfSfySFMOzud2D6oBcYrvvRM=;
 b=DXhFax5ue462qLlMmdeHZIUUxxMOGUso5hxj+KBudkpVRQDmd/NqsultWu3C5wuuZt5ZbSnU2snFg7huMBfk44KHkbQzm+sDacaWC4n9orb0BT+1d5pwXjSXUD8UUluDAGzAIyuWZbq743P3JIfrg16ZcvuFMT+f8HesHkO7AL6Zy5zTfaMuxfwK7e1ThrNSFd24+UB8VYjkWYw4Awrd/GGvUsA/JkTRupkvjxV7hlQvS0Gv8hZyOIG96FjK49c6ckiGALUAcyGx6HEBpd3rliZ+J45iFgfl7Oi/Inn+CujAaidnrVRlQwNozlP1iZuPQKlf7Qbz2jpT4llT/GQnvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 11:21:12 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 11:21:12 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 2/3] toolchain-scripts: source target-specific environment setup scripts
Date: Thu, 23 Jul 2026 04:20:46 -0700
Message-ID: <20260723112047.3535219-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723112047.3535219-1-Harish.Sadineni@windriver.com>
References: <20260723112047.3535219-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA2PR11MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: b52f6b0d-0754-49c6-1e1e-08dee8ac8085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Z/iy3cy8vQR9fVvp0PBN9JHtCwzH1s+CKh1Mg2MwD8p6vEVHRK2roECa7O7VnMY6RefQHgQaU1H8fMc3w+lUfIM8ptjQpwO/rZR0TXYqvxOWG0k+XksHyRI982V/84WyV0D5ZkLiAZMvSB0BCWtJVzs9AXZztTmXZzln8esXLiY0UgRIPmqEp/enfWPFM04Kh39CBDVDmvxCtznITJzuRVGmhW4jnAXsLk2qPOPBDlsq/GpPw9uVTSVEMaxDlwqWQkC2ghRsnA9zgTcoBoMJyTYLBxkrtInU3mZHyg6OKffMB7v+43U2DtwsbARB4a88sbsFiHttk/QJ51RUCMrXav89mOdDA+lClgg5P5bddnOOGzTFVGNgKEBcBeLjsOfUL58zOZXQ7qxKW6khAWzNKjKKmlXznNS4tc3ikJ/PMuJfJrRnjKCGcwi0eQEcY12v5/0f1AfGLDAQYmo1JitPeC0k3BHuKEjShOgky7URnPAmsAKF0XEV32EMCJOtECZ1+IVH3wTZqtyU1syRtBopqT5FMvYqN/xQUzrGFsjQy9/ZqyzU0SdW+fdWWbOEzJU6ez57IR54NgGT++s+o4hnw6bPUA5TMqmZ1eUhUNtYORvNEhpGH4nQpbpWq3MaHbZTZxZbFhbsp4chnlEwomtst7u8SaaUWlt7oN1JNzssqMw/0WRKe2pqyOdMcmm1wQ0RXPOIGrZCl6/SR/MNzfsiNr1ZuK3GFQR+KxCIyRkClgU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K7IinTxpSfsWhJLBYp2FQMSH8FZmguk41xRI5GefIxLUMOFoAKL1IitNEOYf?=
 =?us-ascii?Q?xZY+ZelsQ4j4w/gN/96yGWGubEAVXRemz4HWT067NSRMUu72bwUL+MllSNup?=
 =?us-ascii?Q?Tb47L9AYbgn+2AouHQXosVBhPR8qphW7tw99kR22n38ziT6JKTyYpm8cQ59h?=
 =?us-ascii?Q?9QjgXmOdZifS8o6imupIVOfRWKnI9/tZTUkYEoJ6GV/A26IpkGSlcvOvtO/5?=
 =?us-ascii?Q?YAHPhO5oigf2Zhw++gt/okvtdHTAjOpOqojAtmfoCnhWk/bifFX2nhLwWbTy?=
 =?us-ascii?Q?qVYlI0WQwpB09nJ1cAfw0WXYXUTalV+4wEUwFj0SsyYHmGU2wbe8M6PX2zdh?=
 =?us-ascii?Q?Q+8lbcjquNYxpA5iBgjNE+Rz+kioLkszBJEFWptkxJNHZ0HsmJOw9xXbUIf9?=
 =?us-ascii?Q?yAWCMCmjcXM89+/fJIOQhj3upg11ujLjWJOicbLeMiaaPZEsZTGn1EkBMtwN?=
 =?us-ascii?Q?BrawjVb8FwUkc1gsRUP0aBjRltzBMrpYES64vI2eNaxpaIothv4HxfGy9G4W?=
 =?us-ascii?Q?nlKJs2kUGKE8l+9F9Q7Ijfw/BFqe4osRjANiWUTpW/yUaQlbJuiT1L9OLl4E?=
 =?us-ascii?Q?UV+igr0D3Wg4E4F9SIa6FLMTxKLV52o2VfqFEzJrgQHcgZSAhpb4HIkQ3E/a?=
 =?us-ascii?Q?Mr8VSjIjDR2tAXPz/omFjwRoCN4FYQ+AlR8H/j5m2y6N9GXB9uAJaHpHYEB+?=
 =?us-ascii?Q?rEodRuOkJaLw8l8kICyxi+wTa3YtHcC+j/31Mr2f+azD7Rnct0AKxySJtGB7?=
 =?us-ascii?Q?8o/Eh7iX4pwedLzbqwC/PlGqKhs+iabzv3FeWrL8zuZ9VrRpYe6BdS2Ts1yA?=
 =?us-ascii?Q?xHztlo+omd/ZLo7zKa/1+AjxVO8FIwrLQSFF5uCtYQK4iKoFyiKvYNyW5Sak?=
 =?us-ascii?Q?Vaazo2cwvyhNx49IwDnSu8NJwRGXeTWvepR8uAeKViXzwMdAcI1JFNTm8TMh?=
 =?us-ascii?Q?zOl2qoQ4aO83pxbISi60yqrI8foPi6DdxC++UCLPz83Z1PG7WCBBD46WwMqk?=
 =?us-ascii?Q?L0aP4yCPCJfO+9n54K4Fy8JRefHS+89Wa45wVlqliMBqM1RKDfI0gmH55Jft?=
 =?us-ascii?Q?OyAplQWdvIUSuMaPokjVb2nY5dhAAd8hUpNjb1osOphEWKRAZ1QpJ0XIvtN0?=
 =?us-ascii?Q?o2pgR4EDcWDmGMB2YylycE6kegNEapubym8ERV2WdFxaogKjJ+l2m/8ctmL6?=
 =?us-ascii?Q?mUqk8zau8dSz+xK2d5SUjOU3CLgQrXR3nk8BB6Ml9oIviTflWLFrQ4bez9+5?=
 =?us-ascii?Q?St8lkRRGGI6P2mK9XGdGoXuZNYRB9/mjVBXgG24qJDzsAQsb31oZmHPZvMYI?=
 =?us-ascii?Q?6ubg0Xx6TFlgSMRxU/6nPafAVrRDIqBkJhHEScmpSkojfU/fwN+YIADTK32b?=
 =?us-ascii?Q?nOec00axJlNcSoMigDgwCGBTQ/lUFD09eJHQJBtpJ8RC1mPLXhcKH+rTc5yY?=
 =?us-ascii?Q?eBE9hcrj9FAv9mzk1WGCpmkLPRUGMfjNIh0nbm3RiBjRNo+oolh4qINE8BU5?=
 =?us-ascii?Q?9fFOQeqoGKomB8Amkjj2SYtDeQfZxsv15m7lTIhjyvGEUCE7lo4VBrpJ0ZnD?=
 =?us-ascii?Q?JivZILwkMs7O05uT7WUVxF+s6fFy2LDhioHt5JFWsgkfvbvOGRszxSCieW77?=
 =?us-ascii?Q?QiGeInPB+zEE8yuEr/olvdRVVjzf0rrNUc8i/yvO9mvw86WoDoElyITfZRlU?=
 =?us-ascii?Q?L7P2sikbkcQcTQs8rL2ebfEeOgG2LElQoN5cdi6+GrPKBBeVdGvnl3K17inQ?=
 =?us-ascii?Q?EM3ZxCm+lyGg0g9qhx9ZFPHIaWFXgIk=3D?=
X-Exchange-RoutingPolicyChecked: 
	QQmp8lgBKZPmEz4ru173j4Ur4d0CzScrKfjsmMrPCQAWG/8jwaTqXeEpLrljeFTh+Rsvdy5duvdOlojbMQc1+2z4MyAQs8x2WIg5z2nHaw4qYWjWaaLNtbzD0zp3iXWZI8t49lP4ql07pbF5RElRGqoqVKplnMqvIMIVkrpG50oWin4aVlagZeeHvxjhor7H9ZcOH3tRWz3+JPgUmwrCBFS99VpBNHhdAKGfq2of9qZ/GTjE9m8bvvsjg2IlvqE1jqWoCdxuTaTgcpNtbNyKiZsZ2K972zLi6N/nwv7f8lGzCjhf2Tor+Bwm55uz+Mk3boyTx0LaZeBrBVdN0W1SZg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52f6b0d-0754-49c6-1e1e-08dee8ac8085
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:21:12.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69C9NETRP9tA6dOX02SCv8ByjQWkjX8lSXAFS440uugESUvkD1BfwpAoXmQfvzvKtiYBRywvG0Pd05IH0Ts2/NMZoCQFEmyaYzcMSgoPyzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
X-Proofpoint-GUID: eiQGA4WcLJ-Dis8B8-LIa8tHf0u4RSCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExMCBTYWx0ZWRfX3kJcgtZ7NOnH
 yW8J6bt10oWee1E3SCdLOVYtgGJAbgDu3YwNebjwP2azGhwfc24PBmxdPUaGw/HgXg/8lmL7/wP
 rTCUatLt11YV+D1fcgQ6Vbre+ekI14MI4cMhe4+N/U4/Lwf69UtrBdKnZKPTCROA5Lwyvn/H71o
 +4068hVhLde4xtFVp8I8Z+RfCY2SSqu0H3JBIAhtI2BwzdVXbuMlETXzKILXvpeSHz3mxpDkU9R
 DC6L3dGzsBicnpBZbulXCjBiq7x05XO6GvIXPrlHxxyeGj7ch3qvhZgfpjGciycsNSerQ+OlovM
 1XxFGHKjEdb79XeaYbzYG6qu71o3EzDqMwdhEwvg0DRzDmqL2xp7CXGusW5EkTr4wLQQ8fK5IEE
 u8edZN+yEkAqP2yRLXuPDUbOeG4akCyjSx92Q1dArydBSw0UEMDTwAsVYIViBlYyv232ksGMBmd
 cTuUJPuow8QUmRaR1nQ==
X-Proofpoint-ORIG-GUID: eiQGA4WcLJ-Dis8B8-LIa8tHf0u4RSCi
X-Authority-Analysis: v=2.4 cv=T7m8ifKQ c=1 sm=1 tr=0 ts=6a61f929 cx=c_pps
 a=Et1EcG/LeKhR1br1BBFfMA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=KS2_OJWHKhWuo-98OvgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExMCBTYWx0ZWRfXyZehdXa8twFL
 7rAs+rIBZwgcH+C3rcxLBFqboODKRLyAcZkzdD4HwwU7QgLQ8dNBih1woadc9mqG7elL5tyo8QL
 1hi2pGWWolxdH0o4NFXS8KDPVe/BfXhL932HmFub8xf9gxOIodLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241822

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Export `OECORE_TARGET_SYS` in the generated SDK and tree environment
setup scripts, and source any `*.sh` files from
`environment-setup.d/${TARGET_SYS}` in addition to the existing
`environment-setup.d` directory.

This complements the rust-cross-canadian changes, where Rust
environment setup scripts are installed under a target-specific
directory. By sourcing only the scripts that match the active target,
the SDK avoids loading environment settings for other target variants,
such as mixing 32-bit and 64-bit configurations in multilib SDKs.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 8c062ef0e7..9405b3b1e6 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -76,6 +76,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_MESON_HOST_CPU_FAMILY="${@meson_cpu_family('TARGET_ARCH', d)}"' >>$script
 	echo 'export OECORE_MESON_HOST_CPU="${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_MESON_HOST_ENDIAN="${@meson_endian('TARGET', d)}"' >>$script
+	echo 'export OECORE_TARGET_SYS="${TARGET_SYS}"' >> $script
 
 	echo 'unset command_not_found_handle' >> $script
 
@@ -110,6 +111,7 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_MESON_HOST_CPU_FAMILY="${@meson_cpu_family('TARGET_ARCH', d)}"' >>$script
 	echo 'export OECORE_MESON_HOST_CPU="${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_MESON_HOST_ENDIAN="${@meson_endian('TARGET', d)}"' >>$script
+        echo 'export OECORE_TARGET_SYS="${TARGET_SYS}"' >> $script
 
 	toolchain_shared_env_script
 
@@ -172,6 +174,12 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	    . \$envfile
     done
 fi
+if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_SYS" ]; then
+    for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_SYS/*.sh; do
+            . \$envfile
+    done
+fi
+
 EOF
 }
 
-- 
2.51.0


