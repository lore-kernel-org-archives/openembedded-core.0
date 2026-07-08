Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CE3C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 15:19:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11211.1783523949412028695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 08:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Sa4fuZRc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3eVW3933826
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 08:19:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ug4RCMhycYzw4SqBp07RJV9yWWU8T+AIE/EEIYKe9hg=; b=
	Sa4fuZRcFFGfbHU3ziIt0dcME4hY20EGAUYKnRrjUJKibGg8Gnn3K+Ro/h9idS0+
	SOkZDPI3Zk7L0uMijRPqkG4LtWCu1T4LkmwJHy49ifqJeo0arb7vjgt14rkXeKKL
	qkcblqDpOpfNVBJuu14zJymqwzIzKQLHH6Aqu3YLUP9gHnMmUTWO7MFvKrNHBjLy
	2Hd30SFpNhPMs74eSo6fSaQtVf5oaaX+gcr3tP/NKZmWvVm2cC3Ey66F0OVZLoxt
	8YrQjqdv2fsZu3XE2ZeF2Uk/l5Z8hb45J7seq6vkvxF2sry9eft0yQaIkazdIw1W
	kR8nLbR3F/qXO6z6csQc3Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6wf1e8mx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 08:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUoGfBxC3TYGg1bHdT8d8EH5GDApFe1b5ib/fP3uDVEuU5nocjOoQQ/9KAxdHg8j+/VtLMehHdk7NFPSnD9GTXxvqZSBd84pVEr1sKcjZIMbhcG6A507LakKkfPkpEvUPLA0QCr3ZienCiyNhEscMSUxP9G95pr6ysVEZL+TAqbMtmKiI0VHWKj/qE/7CeVKaOEY/rnnbRgw/dRm9n0q8s7akPJ+J3N6m46QjplMsc7e3TohFFw4ctpki1Jnl1mee3ad84l9UBCtN4ErqNC3V0kHsD6/JZbT9LRMBeANwuVxxOhgyQoTYRGNAo47CrmeW0Z7ohgPdWiEDEKbUgCU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug4RCMhycYzw4SqBp07RJV9yWWU8T+AIE/EEIYKe9hg=;
 b=LvjeMAHU1vcw+ln7LBsgcWWdaJcWfaZqMNZsxjEotjNS2GSnfOsldHjgqLydBOyzycn+zQIHK6R5dayEaTDWHf+D88JhtGHGFMzApsIXtvCvmhhcDnFi+If3wRN6eOQXMICEYw/EWcY06C1bm+gPkQchrtyVh9fvP1xmpCWsTvxmZOS1hKGksKduD9ehpz7+EL/1upXkSM+3GZGhNXYYbEdNXXYqlAtNvsbaO2zNlg5WVlrT3UQ6nlHzxDKOPwnauFTkDqgye4GI4eSSQZ9p8aF1xQmM2be4h3L0yEB1OjFyefEaZhyAv5NezZ6d8qF6k7CkRww9SSyqnFzAJuS0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LVUPR11MB9810.namprd11.prod.outlook.com (2603:10b6:408:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 15:19:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 15:19:06 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH v3 1/4] kernel-arch: Add clang toolchain support
Date: Wed,  8 Jul 2026 08:18:13 -0700
Message-ID: <20260708151816.2115030-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260708151816.2115030-1-Harish.Sadineni@windriver.com>
References: <20260708151816.2115030-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|LVUPR11MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9b897c-0ce3-401c-ab15-08dedd04407f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|38350700014|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	9XGNbmGbLzEXMOznZbFelv391HEbcSpaJPKEXZtAevR3ZUpqqMgGspbV6ciYed/+6PvKHSFbi1CaY2baonQ40Rkx3emNu5rdjvMNBHXs8VabneT/RXrzx1uD2OSshUlxzeHRB0BlFTEJg8hpbojQ8V0wTzUZxGPEjVEiXD4+b9cK1pCgsM+ydOVnjR2euP+EeIKdnCUqdWtofiErpy4MG3J8LyPxywWex39Snhk4mfKfAqDBi5soVWxZrsdOZGEV2z9Qq1FXeV/hJiJEao4ngwhQuaWEXGpgZeqjiWgdtFFjbN5StmpFltui8dNOAuV9F087nvlE6l4ZPVNODAFXg9T6JCG6s3bUC1azHmxV4d4UVpMGeFRqkwkgSKeA2fm/f2J/4umELP8igiC1D5bKgsInXwzCDPuar7SjIuEuT8vH9bJSBXyJw3VBZSgvPLDkE9PrUth8r7ZKn/7PlWSO6Jl1HRNXEp3JICLFto8STFKpOlm6Etq3HoyK1xHLl5/Ms+HXhlZD0JG8E4tx28mseJSqfO+TI6JA3V9e3KuRfQObfqFqF7qEYDl5/qkGXZ4WGiqGuqD6f1i+UeJaSuaz8LTbeafGrKl0rtCPUNC85sgaJ+la4zEFwKSgBOomVJ02j93arPFkAFzAOAOZu3u64VX8VXJom2C6Vc1Ikg/W9DxhvHS8LHgT7bqgFcUe9z04y3DbF5xmwN8cK4f0+EovcbnJId1b4tTZz1+e7KXFNdM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(38350700014)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j25y4Jy3tfVPby8D3DAh/5cj8Bdr49bqdlPVTLCQI2l6scLde0FJb7NbDjYU?=
 =?us-ascii?Q?MhHZzA66TY11yZXGzWLyplLbHgo53s3rcxPYdNHs5UgzGJmVcyxvIoOMSQb/?=
 =?us-ascii?Q?YDZ+GBAUbGtkKiz+I50N8E0ZnrhBnp0BqS/lRYx2X8RpKJ27znP3S6Z+QQg1?=
 =?us-ascii?Q?UxpqkSmVOE0VAe+jEdR03m50GvtjHa/MT5GDLRSPvn7P1cQ9nc+g2ui7rqkT?=
 =?us-ascii?Q?HBEad745aKbAlm3vMU5EJ38824sv3ght93yE9bgKETciBZ4Zrt8bk8ROOcr9?=
 =?us-ascii?Q?dlQKPpRkXN6WLwdKLFgNKz2b4U+4Axg2JZV9jy+iDSPqWTFP/l3apZrQfBjd?=
 =?us-ascii?Q?WPObpJmdKmxQie5YJj+z6rRQ2RnLrO0UHfGg/3hRz/W1+/Ipk/bSje05pedt?=
 =?us-ascii?Q?Etk/L+V9AqdaiIcwA4aip181fRIqXJXNaMf1zOyZ07NPc3wWqulcrSBIKybL?=
 =?us-ascii?Q?Oqr7WKLTl8gH5K7XD65sXpRy3gceAKhEr5y41IT3LxL2yL1tIooducgSYq7U?=
 =?us-ascii?Q?DSpo3xDBGgWb5zR2uE4xwIRw8OFL4nYAXOmt+pyzhaZfXnivIoeMZ5j6kKCG?=
 =?us-ascii?Q?NRp3TeYYnvnzt5bW5tzoo55QSqEnfL6cf868vS2xUvhSjcNnU8QMrqvvDGji?=
 =?us-ascii?Q?0U1RliGD+/XpPoF1b99a+V/3bRE+7AAu8jEKzw58GdDo7EydZvig+nijubfk?=
 =?us-ascii?Q?3h4Ic9tN0zfuSHLaOKfYOaVaFhMijATUFj3jKxnSmpa6xLPoz7c8BpCr0T1r?=
 =?us-ascii?Q?hGDFczJrc2+w0WZIv8oJTGTO+XpQ/+bsm/Gahgiv61OVGg/q7/TnG+Gl2f9T?=
 =?us-ascii?Q?QU9Fx5a+4mzD49KF6qOhxyIfaJcsS6PPutUYJ5U6rniBdMLoW6uFOjkpddKn?=
 =?us-ascii?Q?qUGKDaikFKBVaORff1LkGrEH/P8DpXJwl7WMBzG6whhpJOFN1g8jsUGeqQYr?=
 =?us-ascii?Q?1RS/HWBU/0fwQ5X1LL5TYZKYXkLBtfln08PTufnRzotyZLQQpoAfYDTbJ2x5?=
 =?us-ascii?Q?GR6Ja8IBFKmpoWwoqAROy4vHUtQcGJUMsVlBnfHl77ssXtnLaz2Dg7o8ovIl?=
 =?us-ascii?Q?ecxMnEBgyA+5NI1niU8/SUwFughtn+BIyQneKkdGCdga7E2kin4vEB9iG9aP?=
 =?us-ascii?Q?LLmhKeTFkGiJTdtsTl6n+00w1RsiUv5AagH2Ci6eIYB24/hypg1FZ1Xnbpdt?=
 =?us-ascii?Q?gzF/8cgXgoX9UN+V1T6lnJqGhabh3Gz4WgSRO1Kp0AvbUYBm2RWwzFg+vLU7?=
 =?us-ascii?Q?6d+qWrOqBDQRA2wr8JqXHL0JshBJs4RttBPVCDHsByhmWAYHYp7SiXBl8JJe?=
 =?us-ascii?Q?iYxKQu1PasbNcyGE1FYhAsQMn6e7eKyQFBgLfPk9ryAmSn1lKkjqjOk73BBr?=
 =?us-ascii?Q?fRVaWv8XHFeGTMmhgoa/BTCKoC2PKpXxrKlSaJ6ZZxbMI5v2+33WYDNnd8Gx?=
 =?us-ascii?Q?na01IkzTszF1Zs3l94l3mbspOJK/DY6f2Nbx1vyn3wWXu8q5HVmhAzugDdAy?=
 =?us-ascii?Q?OG+A4w/6oaNAKhDntqM/wxxP4iGsaxWWWi5/ZCMXiyHPAUfU3kTxxyFKgAIM?=
 =?us-ascii?Q?x+YiKjMAGGWE6E/ef5ij/3wdgzii/2AYLcJd8nMM4YiTqYuUZrJjxAHG1SHs?=
 =?us-ascii?Q?gSDy8S1g48EYXvOKM2wBSngwrLWjj6XLdknApi+QcwICjWOrzO7/IK90PVUO?=
 =?us-ascii?Q?5fgCerQHkTAhyaRksxZPulzcxD9tFedxCE9bMhPshG6db1iQ+2pw+IG5ZM8V?=
 =?us-ascii?Q?yt6KUFBSL1LkZ1+7R1IgimWR9q/KCv4=3D?=
X-Exchange-RoutingPolicyChecked: 
	d5tJpbdR/jReyn+ZiZ1yrmTkjSfD5Cc/GHwHu85hTJFR75lPAVs74g5gg4vlKD/+xAaS1QhZNmEl7DslPV/2BilSUk7gTX9uFxrf+quPv7v6POad2cCUJiQOxDCMA7aF4mIgGu7aw846FIs+g9SO6Xm7ag3EUPQxpWggTwoqb/C4e1kZsaPmUam8xkUp5oBxSFN8rFQHYcWQ6R5I5GnkAabvt47jFIHsclptawa8B5noY/6iSzazF01NaXELcw5TnUUPyVfgnbw8uLxGpRfoPkj2Co6Rf3fwjcI/VhmXElMGbmfHgg4nc1Lqp4m3s3ryWCAzIdXjoGXoUg8uGYavEA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9b897c-0ce3-401c-ab15-08dedd04407f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:19:06.5994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCC3aW8caJM237Dt2OoEM3NWzsEOF+mHmqRpKSEEIHtazuvgductbmiyaKb2gfksRWDFU+/X6/Q4AfW9i9iL/INVCx/AxVcl5gvycAhOiN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9810
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX+mm5YWHZ+Hq9
 5/476Ew9vIlyduB0Z4QULPucx9nTkC2j6w+ljIITJjc29JJf8BNOyFudWzi9xKRlkdT8LjN+W2a
 6UVMZmFFXnx4UU2GVZylyDk3nNCgQc1w+D2WBPESf2LIYEq2XQWZeYPKpxO1XWP+QcALT124Omn
 t/yMdWzXJDKmdQzgbq8MUNG6iE1pFi2QtSjpnX+Lm7QhKQizPsr/NYHuWqvK1FlS6y1auEQjyc6
 MXWjgWfzFiRZNQDxDeo4BPar5dbgHMNclGjKdv7lSDEuB5gY6r4RPkYuSK7thbhi/MmBwZYuuiN
 wlfCCOUjJSmGm7pWsMoJcKi4QHRQt/ZP6l519TyxvbOkCngxfHnEdmlakhwo77SwTQWd5RLbc85
 E+RXXFKJYYkzVHT0LfSK6xGCzocD0wV85xMrZp1PPo8upDnL6DoDTLM8YlyXmCZ9lXuKv6JLrWc
 u9vW7jyfUp7KR7pzxMw==
X-Proofpoint-ORIG-GUID: OOEYSJ0X3ItGnLICZBDwdtGRq_-maAe_
X-Proofpoint-GUID: JDBEa0BJjpclfoGU54zi3XXUSOe-H4cL
X-Authority-Analysis: v=2.4 cv=cuarVV4i c=1 sm=1 tr=0 ts=6a4e6a6c cx=c_pps
 a=LWr4lAA3g636x20Wckjs+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=kWAUPiode8oiIj8Mea4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX3TbKWFyb3Swj
 t0x9VtLicHlonVd+kvpSIDNIVb1BQRSiozSsTo0rubI+xk2OzE7IOZHC5tC7BZZ4XtU29UDl19H
 CiIQvI4L5LMrQQ39jZz/Dm2FOhm9UES95ImiXkvYndVvMlYF/aiz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 15:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240491

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Convert the existing GCC tool definitions to use the `:toolchain-gcc`
override so they only apply when `TOOLCHAIN = "gcc"` (the default).

Introduce new definitions for `:toolchain-clang` that use clang,
ld.lld, llvm-ar, llvm-objcopy, and llvm-strip, allowing the kernel
to be built with the LLVM/Clang toolchain.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 7aea9cd3e8..6ebc0f13ea 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -71,14 +71,25 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
 HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
+KERNEL_CC:toolchain-gcc = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
  -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
  -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
  -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
-KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_LD:toolchain-gcc = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR:toolchain-gcc = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY:toolchain-gcc = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 # Code in package.py can't handle options on KERNEL_STRIP
-KERNEL_STRIP = "${HOST_PREFIX}strip"
+KERNEL_STRIP:toolchain-gcc = "${HOST_PREFIX}strip"
+
+
+KERNEL_CC:toolchain-clang = "${CCACHE}clang ${HOST_CC_KERNEL_ARCH} \
+ ${DEBUG_PREFIX_MAP} \
+ -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+"
+KERNEL_LD:toolchain-clang = "ld.lld ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR:toolchain-clang = "llvm-ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_STRIP:toolchain-clang = "llvm-strip"
 TOOLCHAIN = "gcc"
-- 
2.49.0


