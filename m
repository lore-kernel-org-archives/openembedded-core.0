Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDF6CF3973
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11854.1763570912079121056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=enBsAiVZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ96j0U2987567
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=UXE3cNIj+5jpqHZgE7b8G11dcBA60yg0hSpmGp5l8M4=; b=
	enBsAiVZxMqzfsFZEW4YnrDVsqrM5xgh4n2gxoUlyUUfiA0gmo9txXIU29+AggDq
	X52vzZCOTKoMWufuvFWjUqX9PxKe5jz6si3gZjGwcZT6IY/ghN8GWHvuGEcKLaTi
	jT0JnFeYCmB7xUJuvpcoDpHj+mA9Fe9nTg19JCHW/qwwjLKIyAoXyJyWmq1WpbGe
	5iNDBlsKYYgmgCXfkqtAkGCaWHyElrjZsbpUIMPsLTr/GlvIfuLm/SXBwbdj1Igz
	/yNBiJw96mZfuLCbs0+DMik2Ex9ZtuIYhTPT7io150T3V0FqFGTnd0J7Y73mSwM9
	B9A25mbTW7blnS+t674YcQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahayrrh8b-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKIlK99xNOv6Lwro3tX+DbhjUZ2RwdFLf9xMFvgigly2esvRqNYfJmi733Jr87Jj8PYaIrXzesuzyK1CBmBxXHbxA55qq+rY0olYjE/oGEQRaFq5hDxZilbh4iesFreVQTIDhCCI4UnJTbd/1znl/MNOMlPRckJXcRQwTr/+8Pth7hJJI3ZhjoBFp5jYKT1qIgAnwPRvF6zh71rtaRXy6rB0dUiMGP32lDN8ARzq0pIxzWZCo0wO+aa9o/jGzBXg6+zySLOQqRSqjqkgn0BVx4/8DXztrU3qNeukYIB0Gbds1tF2uqw4x4OIiPrPvEEUF5vnZFosOleXB1RnyoVcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXE3cNIj+5jpqHZgE7b8G11dcBA60yg0hSpmGp5l8M4=;
 b=P20OJ4Wtmf07CoSYIIh5iOhEbHVMl/z/RXvhYjf8gu3D6muvvgh1eaXwQaxhpYrtxnmLhii1Os1BQ/hhLktkfFjH/ADFMbBoT6hWLFuOzoYhv2EwatpQW3xe1QcNBofYKmid+XxUYxbxnd7ab84+yW7rDPpH/B/YDAgx7eOiccW9yG8Xtxd4P950OAxyhww67a9soTXuuSRX8eXQq+H8/54k+xMK3Q6Ci95feLYveKlLru1wQuo54MsyBjE0wMpzDlzvqa+35XPqV3DstC8xWpSuiVynCFUXPvkvoMdZUw7TXid301He3Aisgce6Z6U+oVWwR+xAe4B00RoTHgR9mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:28 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:28 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 10/11] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Wed, 19 Nov 2025 08:48:02 -0800
Message-ID: <20251119164804.256364-11-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac1bb81-9272-4ca1-04e3-08de278b7602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UZgW9f3+Jox83yezMNRwPfqkyfMNBlSTAsTaSHILBaIU05aAvyKrcs/t3Sxx?=
 =?us-ascii?Q?bukHsoVBqnF6ba7fg6P8RkRVSze59lB8uBjdwFBtccOm7QBSEM+PzYqF62xP?=
 =?us-ascii?Q?Sd+g30JAq5rdgbUaAqkpZ1y1ihvs7mkAFoYBNtrNXWwdYjjHMX4n7Y5Ro1jX?=
 =?us-ascii?Q?amlYXLujZGDf8zlfEvDamLAGq+BI9pDGp0RdaTTCS9vx2s6JQr1sdPouXJEM?=
 =?us-ascii?Q?iWkRdNqr+5+DfECR+ZH/yQcJWQkZDKCNumDxFnUCmJ0cNkTdQmzbEA5xBJlK?=
 =?us-ascii?Q?ZGRNAAtVz1GSny7AQ5ocT8G8jUNeuo6rbEFcLcK9Ie+CUxe90DoKAwzjai5E?=
 =?us-ascii?Q?Uo0YYZmdBxU6/maPPcdbzN9eHKKBVEnHUbbQwcMDcS4Ivxn4fzM2R0oTpPV+?=
 =?us-ascii?Q?xhE53Mi7f80AiQFj8mq1g2tUdFQ31He8w/sepoz4SQk5J5zQ+afz/TGk3ROm?=
 =?us-ascii?Q?GuPZEr3+gFhcRwr10iEPV/QB27gvn6qnHHefnF6SXwRg/Qe3l8BigbpFkThz?=
 =?us-ascii?Q?zE5C6O9NhGczIItUZpUyeZDUeWjL39/0CtfODAvzUEFpIc5VRxKwXiKLernY?=
 =?us-ascii?Q?J1d92D7ifQUiMPXPfUcALmaagQ70WGbOM5GVho3Wt2dDlvkorS6NX4tgJDZe?=
 =?us-ascii?Q?UZIx2VWM0UgLiGj3B+zab95zcoHNG0j8Da0gGfXP45NilKFTjEQYAfx3p4tA?=
 =?us-ascii?Q?nnquIpx9VcKxvhX8vjiR3jskxRau1EcjyYZ3cyLOjxCu9aYEmKVseoPh8gXs?=
 =?us-ascii?Q?+lbclTpimJnRbYHpMNyMqKhgzQtE8+V9x9xK18ilE1ZoFLb6oajGuPNhzqEM?=
 =?us-ascii?Q?kLogloqBDf9SgVhCsouTkurtbpjXhCvPjr758ASoDxg4nhBW80HnphFW20QX?=
 =?us-ascii?Q?HpIH0NrtISbPmOOYA7oh4hU0QYkfzsWeE84nuIgKfB9DJ9CsIMosJm+ZaO0w?=
 =?us-ascii?Q?DRjm3tbxRYaAGJHbfKbroUJe8bP0mdLeY2LFnhJeLDXoqXDBEeiLEjvh/rO9?=
 =?us-ascii?Q?YdLQOm5IDHoigTCtD80zHfXrKzt32im4oLFrXv9EQq6F3vLsdM3lEUm7+eM9?=
 =?us-ascii?Q?A8N+WYNOBz4E+r4Q6THWXnkzUsgYY5pIw478IddJn9w5USRn+zpT61aCvXUV?=
 =?us-ascii?Q?kG1G974PhZXeNXpRERFz3HdU4+Jhyw2BkJGfVgyo72o0MMMyJ0OVUjCJ3KMS?=
 =?us-ascii?Q?gWNuyR0qSND0PjZPROORF4x65Kev4dtWf7zfhVjGExW5obdbbel0Cjd7Shov?=
 =?us-ascii?Q?jdHtCyGR4HsxLBYQknnaICpFKNyORyHymMnBMxYZ4z0iP5Gq/pOsF41A72eB?=
 =?us-ascii?Q?op/rW4r9W34EzqHVO6mL6yuZ/B6QOiUne5TvKkrYCp1dGmHTmOgZ8MxEgxN5?=
 =?us-ascii?Q?AU/8s5Ul/fri3WDDWEapEzqMMRkfO5lYKxrn/0Nu4bPkIa74T5KrVW8Q0Vxa?=
 =?us-ascii?Q?G/y+Ymp3KbzwtC6nft5XQj8FmrBWWrs2n01IA49yE8Lk0/LY27fog+AMV4jO?=
 =?us-ascii?Q?ANiEAGN4jWphu4K+tWMV9ALPz7K/alp3yGcW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+2LERjYdozXrVR6Gvi0htqzMyqh5cPiKZHKyrul92bitAd/4GjwMayfQrzvv?=
 =?us-ascii?Q?JKDgkJFJKAzrGCks+H05/b20ApNhs9zlXZSqZdbEC5wjzsoOrHSfv3eCW+G7?=
 =?us-ascii?Q?Jiyih0dyCwaEyDeFq959GqygSqLbc+y601eF4Db+++kyQ/FJ+hrbbqMDsSTA?=
 =?us-ascii?Q?f5b2kK+ctKE5D09uZxYwXBykJoZd1IwWTjXaxWI5dUbHfVkZgTmd0R0LI5aJ?=
 =?us-ascii?Q?tpyqYwmJzV2dyE9ye0IgvEJ6qrtsUMZ6H1k/Yg6ZJGQ4rr7dRdBmnaTdRXv4?=
 =?us-ascii?Q?rSohvPBwFy7K+wOZaZx9qiJxe+fDC9MV9jdq40X/em8XaMfFTpIqWn/UUR3g?=
 =?us-ascii?Q?Q5tl8e+iIjD4Xhqs1Z4kYQcAzsdISqXQvMnzLFa0Dn8hiPJFEMl2bRmfCINh?=
 =?us-ascii?Q?witRfEYoArZ7/RXi8d6kFLAfC1IuckJ8rNAMJ94Rkt2fwftPCDcFfa9mFUpG?=
 =?us-ascii?Q?Fqe4DiuJUKNJxb3uOZBcCgZpONyQofei7G37TzBDcpRXBBswunr0k1Na7PeN?=
 =?us-ascii?Q?nXRjf9TRwGUk1801P6QSUfHY67s/MmPAdB4L8rtHlwFW5KheeO98hwGXUjRE?=
 =?us-ascii?Q?L3j6/9gLeukirMn625/SlQ13CeaiCuNNZi3V8xRlF09OTOmXvnwEulq5jNN5?=
 =?us-ascii?Q?dTZlxU6swBvoJJUYuQpSaCf1IpjDeTZNEmqiclb+txZT4gZwubgRkFnajlNk?=
 =?us-ascii?Q?43SFf37afekWvT5pgeyuvqKJbeVZ4tkun3wzSG7J/mCxR4wcvkZOOj1dV+Bq?=
 =?us-ascii?Q?eddczB/WeIK4/klsYE49/RYXxh1UKqZDBIFKWKxo/CoaqwbLTpqF74AuM4OK?=
 =?us-ascii?Q?KNQa2eMSsBm/5pAHS/PI9+AmmaDt3HXCMpOiwELgyT703I7GF3akoEpu1EbK?=
 =?us-ascii?Q?1IK1a2bIhzzmMcLbRwN7dd1ZVpJkh6QNCN+PMV8aZl8APgL9vBhlc2kz59Ph?=
 =?us-ascii?Q?p10tJhVWuDUbIZF5rBIQ417r0XkyLxDDZjHLOQvWmPiu8UjFJqwCCda1qMQ4?=
 =?us-ascii?Q?OI58k1cc85GBxljhYcqI7hxh9sc4pFs8n/zmUiFuRBiiKVgIWdLvopYbQmVZ?=
 =?us-ascii?Q?fH6NFudalKXS844V0NBMSd/4r8ws+twJhM7oJZ6e+rJPIJon/1DyPwc7rVvy?=
 =?us-ascii?Q?hhLYK0+GK5QQui0Kgm+0zJvNB0Jn30C02iDx0S/pu+ohuEOlIBDJrWQIcZol?=
 =?us-ascii?Q?be8eI/Knb5l1WaoP/MshXrhSWIdEC4Nt8C+b8G8NcYeTnYZrb/PWh3Ncagr9?=
 =?us-ascii?Q?4/0e89gVgOJsVSvVii5WQVLMkzb5nx/bseJXRQTqqQQtO5gVo2R5clQ6v0JN?=
 =?us-ascii?Q?bVCGyKW/IPs8mHm3zFG/DrkGfkmcRa7FUiBsZHgN0Gx1ke8w619FaRYJdj00?=
 =?us-ascii?Q?JN5/ADdDQWlXt/jO9x6cK2v07MvfFABOhuOa4tOtSP0JOp8zPO15I7OiteEk?=
 =?us-ascii?Q?FyvKJuURNDxXch/iSv+hJTB6Z0Yq63Fj1yN+t5pdoNqnlugGaDEIIKLAdueg?=
 =?us-ascii?Q?4heYmQoMP8QFZNfS+HbufOQh7KCWHmi/r7bIe7tNxgptXKk0/0aKl98DuKhC?=
 =?us-ascii?Q?eav5bqk3hmL7XCz+Sh27/CNxoaa47GYYnMa7hI3QeMlb5nlYV9xgeUMBErnj?=
 =?us-ascii?Q?15iZDd1mvTGrh4CVTOhWc4k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac1bb81-9272-4ca1-04e3-08de278b7602
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:26.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7/9LT0oY1N3G47PNUdEu6gIxeeDLgkyj9r3LrG37DPwb6etggP0d9c0TvCK30XKzDyR+an5+R4U3UJJgPtXhwPy0iicwXoPthhlMs88tTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 9rysbljUbpcx5wTjAHpUR2XJnMFRM7kR
X-Authority-Analysis: v=2.4 cv=EdXFgfmC c=1 sm=1 tr=0 ts=691df4df cx=c_pps
 a=7v6vjeP3yXOm/Y6ajRpg3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=VriWPxvw67vVHQydT3oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lfpzjvLfmjdDo9MjNTghEB0Mt_A2j6rv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfX187ZAVixERPn
 irXamlHAZArtSgArECsS71svRY/Frz9yvFOynvAlrdWG7uM4Wz+tdO3BQgWrdBKuZpewHPR7SbO
 OlStsX9wEBIsUEAF5uoQ6CYzc58eD18tx9GuMzKtI4gCf1P5qU2HbWSaqt4kDMQypbB9NvwaHZ3
 lO373Hm4U41OerXxWtbCMGynAPHzG26MJhKrxpVDueLtVsYzv4fZ24okCA+dO7cQ1LVjR+SAiFR
 taXFr5dqlX1CjuUxtJEPq6vlKYVnqDXK8ZxsvojX+L/m8oVF0dp8tdTZKJhCfOhqGgcDe58BeuH
 Xj1qj0yyKdFzQb2XEaKcxqPXmF/T9Jf7JqyYgVPO/pO1XmgYbmKL1+UPm5J9Lkm3S+NzQLl2xZ+
 UNFT7Z0Ws/GBZajspoKN/+Ef/ybI6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226570

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In sdk while running make prepare in kernel-source directory after rust
enabling rust config. it will throw erros since only makefile is present
in rust kernel souces.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 411c99ba30..615c53dd22 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -139,6 +139,10 @@ do_install() {
         cd ${S}
 
         cp -a scripts $kerneldir/build
+        
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
 
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
-- 
2.49.0


