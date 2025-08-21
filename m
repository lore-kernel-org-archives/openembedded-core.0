Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AFDCA0EFF
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 03:25:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.922.1755746710616703165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 20:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sbawJHWJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0328fb377e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L3PAEJ1568765
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 20:25:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=h5XHSKFWXoT+VLTn8JO6dBpJQ9PUDrUivQDsKtISSLY=; b=
	sbawJHWJ2Mi/zeCvQMOMtpfxhDirdgXeSli4B+nBePs7nVYeKW7VzGMHeJCoIXwi
	i8l+/WPNrEMGFOKC5/sqlxMVdKWVMUyOG07ArJMvDmhWHjhP+VVIJxr/yxH/B4CR
	gbnhy7zoStO3poYHz601kSV/zjeJJKw1CeZKgtjcA5Za2Ft09X4FP6trkg9gJfyl
	qHHAqVLFY/041RYHZwYZ2ekghKrEKEYA6hKgtQc0ET1Qw/YFnl9Xs7QsTat4kAns
	ySMsKopEjVLXNuTX8qdEb4M9/O8aV7UxYbAiYNx/XY5OW8s58fomRTrE6IYmfmeO
	6XWotE5NIEOdDbvm1TnJgQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq9n6y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 20:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vb4YXRq/LrPG3n0ElBwbXnJ2mZYVGHFGq3ZhVx8NheaJWSxObfI73mxAB8i6uU7a9ge0Ssr3ttPoiRkAPxqEywviW0+VDZriYwSoKpfZi67nGKLLfyRjAAFMfgH0E19zfq5dSCWO/tOM3PmcAsd6GxvqW3vzQhqar1QACY4yzSmokx5x9YCSp2dyx10QOu1bz0+vKb9oJPiJfP4G3BPYLHkG6H5rJFn6KCJzA9YTPc/ZEtYZpBWbKjIckCiFOcp3m4k/8okiePB1QqoNCHnxJ72szmGF1B2QfyeX2mjO53J5RvLGXrBe4FS54Ygi/PnUfPG8GtNPSCMuOcWqj3ThEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5XHSKFWXoT+VLTn8JO6dBpJQ9PUDrUivQDsKtISSLY=;
 b=UYmv8oLmmQYEiCeEo2oeNbo6UEk5/r5mn6HOGlW3bd6JhvMhP1JQa1k4dq5erm8QqfCE2GXBD/Mr95buP4HDcsxjd5QWsYJyaARVi9c9QcQfbTSwdwUa/EbQePPGypcrP+BvWAcCJ1HwTlCwkbRVB2+QMHyK3xdpP4HEjGhHHYuc2g4+BglEo8MUjZ3VkjNL96kutgcjzbrbfRUXHBQwFqzk4iz+0Dj9RFNWI9E5Sp2LPPUvKdD9WYO7HJxs1AZ7Yycc95E5GLrb6fTTn1bx+OWniO2Y2/yi5mTBVLrhRGvEr6k4F8PL9VarxUiml2x7GVHdNpv3r7NLjrkIrVHkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 03:25:08 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 03:25:08 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 2/3] oeqa/selftest/cases/gcc.py: Increase QEMU RAM to 4GB
Date: Wed, 20 Aug 2025 20:24:23 -0700
Message-ID: <20250821032424.92606-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821032424.92606-1-Harish.Sadineni@windriver.com>
References: <20250821032424.92606-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0030.prod.exchangelabs.com (2603:10b6:a02:80::43)
 To PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c541a3-3f23-4ebb-1b04-08dde062544b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HeFjWiYRKrROiyGv2xvN5ea8/qoi7FBCYnAdKEAwTR79rkb22x2j5rLbKYuZ?=
 =?us-ascii?Q?dcNB6xqN1Wj35bi5tfQsqluVDPLJXbLB9XGcm+BegpkU7OEEdCkdBlzQM4N1?=
 =?us-ascii?Q?q+418pvGjuyESZYwLLB3rYXDRZtgXm5GdHYLyyluip6RLBbS1E2fXehf9hAv?=
 =?us-ascii?Q?t83aG21By2SvmJ2yPQ7bxCVUwqvvzwcQKy4POZnf8LAJeE0b5BWToc77jvVY?=
 =?us-ascii?Q?oj+Tq9cVPobiz6/ORSm+7VlO9cTP/TiVsAvPjtz3nHIgpzpAIyBJVIJCmEOS?=
 =?us-ascii?Q?OEQRoAQ1YODgTV6Z63Dx7xmh+zQLJiPpVN8l7SO2EAfPPlR+Tw2jvfifXIDv?=
 =?us-ascii?Q?7qVw+9phciMSZ0zkFRy3x+sE4FSJrxusMS1ca6kySX98wA8JHZFMmHFF0x2D?=
 =?us-ascii?Q?ki8jfmIciFDHg4I1uRFn+LEzwthfqpOEUgVS9SnRWJ4EqC3aVqcyeWIkigCs?=
 =?us-ascii?Q?pKvoysYHWmcPcN5M4pl1vfrV/4jtFBdfF6eNqkL3D4bfHyQYPAfE1jmgSj4m?=
 =?us-ascii?Q?dc16zT11yQqK7PZVTOhXX2Nmi9LzC1v4QV2sYMUQI6UfTcbwlhxwyxnX4ICq?=
 =?us-ascii?Q?P2VqmhnaSpR+JVkUfn1WpjxTNHXBELaD0InGEAfxX5gEW8ZwTQ4reR2tPqA3?=
 =?us-ascii?Q?OfUcO9zu07NQbpAhVV3ZbXduszWLvbB1TZHWy7dWmyUUexrlKTNiaXfVVeEl?=
 =?us-ascii?Q?m0iWpZvI5A9cTa0pf49ZGsHLUnlhGV3EpMoNxVOL+9hPN3kcMutyUNJQT1Y4?=
 =?us-ascii?Q?pR7kdNqMwGtWqMMNJsQqzQpsxYSQeej+aRC9i/QIdi05AFpOOyl8BVKbrNe+?=
 =?us-ascii?Q?SqR4jOHjMiOjwm8yl7r61EMhgzwk+8e/Z8qdG/djJeUsAs8R/nmTNBOeBMIL?=
 =?us-ascii?Q?8Ux/r0dAwXSnkRfLIUSFBn1WfiYFNR6/n5lQJ/4k8vrpdl2Vbfbws0DUBDYj?=
 =?us-ascii?Q?y0ObdNsh/Z0lsusCATUrOy9tuTtcFb/1GIgO0ruEDv3eDwHetOGumMCcOSxd?=
 =?us-ascii?Q?J2LXoiuKmQqV5mviQULIM/UcpwtrHYzFhNRLNcZOE09bKk8Z6CIRUt/MdS03?=
 =?us-ascii?Q?lVdWIMHJVkqWBQDf4DKg9MUleMo8nmtsbhTNDyFPmho985w1IOUKfHobWbMw?=
 =?us-ascii?Q?pFl9D8TZHxhVqPOIYnI2AjidWVYDy1/GYPfWM+Z1Z+8yiIjqYy8cpA9zUaW0?=
 =?us-ascii?Q?qiPZE1HonRQjXrggnKuJ2bW3Iy3FklhQMM9m/lHLro0wzBPki+vdvVuCBPdD?=
 =?us-ascii?Q?xg2spQXgOSPqdTLU/lTAycJAAhCmi0GZ4CZVTBlcQKNgLnStxaEjUocgCEvS?=
 =?us-ascii?Q?dSt9lumBz09YUpGV07t+XptuXGd3lXEyP5UlMYP6wTZhaUvajInI0qdZRQ+1?=
 =?us-ascii?Q?WRl8nP1YY+ze+ru88h3yty4sidtVv1OjxRWhqf8bfDAEhS+2/8mz6t8sTOM1?=
 =?us-ascii?Q?eaZJhAz/uqqDQ3OUS/B+wMzibpRq1FHy9j38VZqwMqghWgPLn868vA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vj4YJzWd1HcvFuu1saUtWc4T5dTj+cDshDgnkBrWBPlasPeEbsJXNmA37li3?=
 =?us-ascii?Q?PKdc6/Xsil/5K9jsou7T5aZ55lanVUXZba9aYhaxgmX6honuHDO6gs/6PwM6?=
 =?us-ascii?Q?Swx9nYfIodvU+fxfrIn9AXl73G1CzPLZ51lB8JzLQ6qa1sXc8ZtjE9eC9FZj?=
 =?us-ascii?Q?iKm4dYY1hpaOcd51GyA+Tac6a5RlIBc9NzIUJDbOxDd7CUkKE1a8WrHaVrAp?=
 =?us-ascii?Q?b/0fsbjrackXjMS1gLttq9SiWZ4XLF8kRAxMSipfuwC7kFFr3nOfsWbiARB+?=
 =?us-ascii?Q?mWa4JA37uJggpNLp13I7JRLASHT8CKUx+nO12X8d5XW4RL7A+NjZ5WbCFThB?=
 =?us-ascii?Q?HrtuaSpVM/KFBN0WE+UvT9j/oNrVzHe4xwEddQlQsv3/Hiyj023m1n++vsn0?=
 =?us-ascii?Q?f2DroUW8flZvmtng2K/BgbXJusod/asDC3UI4ZFFhz1a4zpbYLE6acIX8SXN?=
 =?us-ascii?Q?qZvddVSIqzTsNWKQwF3FP4sozz0AQ//dMO2LC8//+Y3KhVsNcEiyChSiIH8U?=
 =?us-ascii?Q?5qf7zLYn9K25cAGj+mS3W3Ul1MMwJwKwvqW18Do+qZVsvT5ORAzpdCGd8q4A?=
 =?us-ascii?Q?YNaNe/vBuOB3px/xfM1Pll+8UCvZ5AsMIvjKxeoTdo3ejIh7oDQlhkYmHqMU?=
 =?us-ascii?Q?sYxpG2qtzieZvn0gumldYK0KXfm+2d10A6ywW9Fp1XHpkCMRkjTQZ4TXloi7?=
 =?us-ascii?Q?Hs8GyYZJlQdAk9PEfp0HrCcmaRG+00CDeN13kLPcXAHfOM3fKESUQC/C/kH3?=
 =?us-ascii?Q?TJYOUdKuha2U/8t6whMD9PfJJe19DM6bKVwpBKwj0kvccK6W+bZXBBY+o50a?=
 =?us-ascii?Q?AxuJ4uCbSTnIys9ReW3l7jjM5U5NJUpe2zloeqJjhLCaH7Q7OfOXdlgvHNIG?=
 =?us-ascii?Q?o5+wfV0vGW8IrJLeMI57lBKvuzfFCtQEEmi3NHoA6UnA0NwDD8G6pEWZ9Tko?=
 =?us-ascii?Q?yDv0rV00mBk3kleCpAWr9Z453q2BAvchCCXeHUE4bqwIbt6j940lZVBLTCyK?=
 =?us-ascii?Q?UINWs0txo2DR9XUGSy6HlHLwQ5yf3w1Top7RKP2Z+fzKC4sGuyII9zJMcHV4?=
 =?us-ascii?Q?bHOynvkerFASn0CVVdiPRT61KFz8Pe6RadkhAfBfwoCoYo6vrKMyryyKCstN?=
 =?us-ascii?Q?MUHjFiPMgkm9ZCfS5eEZX4g2fzZf+FU++iFQSibxdkM/sOfgdIc+sWZ0wtml?=
 =?us-ascii?Q?8IvvCXqh0Ukxse4zvnlK6Uoj9ihIDHknkPWB/WTeMdJRGdw93jt+DLG9mK3x?=
 =?us-ascii?Q?/FOGjmDWik10Fi1zxqOxYqYsCKXy4Qh/XlnzBpfPv3v6E19UYeFeRlLwSoJg?=
 =?us-ascii?Q?LxWN8EVSJ0//NW5BU8bXkJBGkQcuAy0mSC3KI4si3TlbptuWJekNLSUCxSkZ?=
 =?us-ascii?Q?ma4xKcFaNL3UHKpST+oeRxdgolDbCzskQsTYvqmRIC/++yPIIi4YcGjQxsfP?=
 =?us-ascii?Q?y+bl+aPHIcBcvdVp0452JBpVfBYsmGO3Uwq/UDewqhl1auJOigmCJRLqIiXv?=
 =?us-ascii?Q?9mEOUGm9haPYn1SNoSnhxuNWFJ6+mNHjZ/c1RGKmMjLJO51Zy08wJitQNVib?=
 =?us-ascii?Q?6u2Xioma5zs+cDduPcwYBss1ou3PHmCzYehvrIhah7fRi9rTeOwPWTRRBcWP?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c541a3-3f23-4ebb-1b04-08dde062544b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 03:25:08.3518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+0x6FSdjqpZ/UZ+B7SMTjH16uUMyYH/hu/OZ1KZct7p4Pl7EtvBGopzge0fGIilOwDrRlRcbA8HgD1/jZCgMN70TH2bR/lBek6mk6xyfDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDAyNSBTYWx0ZWRfX8z9Hi4FTLkoD
 xyh/DTKyDnFNb7e01HAYTvqq1NixRjeuhL8xGqTimPi/m2g9b8J3g2U9zuUyIzk/4jphQSxq1Em
 +M7nhy1LsIRBycYxg1ktjbK9YfkcBAqHjSZ9Mwzwl17FxlWZO3j5LcLS7friQ5KFxgJxrEEt5Nc
 sqDIZSzHlqjGuzbwwgvttW72zK2+xC+ATQe8oMvtmjvCpEOyrhSrhc5IxqNDvV09BmDLNx12Fvi
 5aazZ91B2jQobxCbsVPA9n7oNfbODL5pBRFBS0E33SM/e0fn0rbgwLpm1oE4UKkCC18iFhgXtf5
 +GJUkvbKLHQCeqzzl79kX7gBIgper8B/PZKcG00IF0GkiKYjvnEmfPXGGt6PnUIaFsnWW4TG34p
 8ttwsg/uho9F5mpSpWJL+fNUYIhd9Q==
X-Proofpoint-GUID: xF6ORapCAFv-mSvzeJ83hPdWaIT69bKb
X-Authority-Analysis: v=2.4 cv=aKupab9m c=1 sm=1 tr=0 ts=68a69196 cx=c_pps
 a=x6qgWyjPDOdqnx7vgGQFOQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=jf1-vt5JTc_DrvcgX_4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xF6ORapCAFv-mSvzeJ83hPdWaIT69bKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 03:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222201

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The test pr61599-1.c fails because it requires more than 3GB of RAM.
This change increases the allocated RAM to 4GB to prevent test failures.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 1bda29a72b..8025c8ac87 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -79,7 +79,7 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("core-image-minimal")
 
         # wrap the execution with a qemu instance
-        with runqemu("core-image-minimal", runqemuparams = "nographic") as qemu:
+        with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams=" -m 4096") as qemu:
             # validate that SSH is working
             status, _ = qemu.run("uname")
             self.assertEqual(status, 0)
-- 
2.49.0


