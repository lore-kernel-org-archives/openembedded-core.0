Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB78C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 04:49:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.51839.1749444550852099762
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 21:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82556ac094=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55947ClR028489
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jun 2025 04:49:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd91dbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 04:49:09 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5594n8XN023818
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jun 2025 04:49:08 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd91dbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 04:49:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRUEVLeXJggfWGlx0b1FIPgD9hrsXFfxWivryxdgKcpwf0xygulI5ucNvzgNB7s3W4uQMAeqww9z1NupHEO3LYzMBL/976qdAt5r5KK7EZ0lXbYZ7ZwF143NLhhiNFRBo09N5PhiQuVSjY9ZhYBvZuCC42Qhh1G/T7+WRoNwTIroQVjiw+L7wto84f53aN7sdYCiYCLg6NIz/NYR/NqxJ3qVcUnbYQbTJhL1AoKQew9VJoFkgN8eSm1K1pHxusUxtiR2lqQ5lYHm/20saaVDBFbs0UoTBQ5cKDgNLnTXrKNX8O6Lgk9H5dxpPHaSyFd6VVomtrMHK5TqM0QwHHlUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHFd6WabsRMYQn6QlqnQhdYCu5Dk4tc38xmcGqYyzjk=;
 b=tZCwSFdOHTlRLZFD5mSeDhRc7S5bM8Oqwc5+iaFyY1aUxNv0fM4a8Y+ZvVkIVcvd5dWTnl5hqRNAiWXaz8mRHh3nG9yOfa2ioGDCAs219IdsfkdW+9NkbOMzwCCSRvIEjeQyJx/N/UqTyqWql3anD2aOIHkg8LRRlHac0mDzuYHrp/Yg5wmmmiDVfeV2iPE0pEkzMbHKhPoyWCJ7kMK1xgxmwC+fZpSAj1JV1Tf9hRyiF7k5GLhhcSMCzg/prKmOns4zQh/qleBqbWNtdhByLS2tLGz4vBCcR543J0iwGIdtYpRhLs7y2eA1QN0w/AaY+gckbcoAM4PRVoOJNEEECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 04:49:05 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 04:49:05 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH V2] binutils: Fix CVE-2025-5244 & CVE-2025-5245
Date: Sun,  8 Jun 2025 21:48:49 -0700
Message-ID: <20250609044849.1114283-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4P288CA0036.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ0PR11MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c2e810-213d-4553-36b7-08dda710f65a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qCPa1x5xlyHKvEwDCQoH37jKIyBgeYqvLylfPAlOqfU7hmlRVVqjNInYcHK2?=
 =?us-ascii?Q?2QbRfDw6XJTYvYG3wsxAnOJuQbldgmFjoi95dUCgGULdme/lXZbDlgiJk08G?=
 =?us-ascii?Q?eFY8FrJiBYn6p3bdL1u3fv3JdDH0MeBSN+klONrm51xhqlTBnRhIyuIrw+wN?=
 =?us-ascii?Q?vs0tixJjqx43r0mcBtX9tcEGTkHAbH8yv2WEnG39e4ecgTLmjwhagpA1I2sn?=
 =?us-ascii?Q?9mFDpPs8ivYAOav5PwVKC+MOLG9hrPL2bDk1aE6Kf1jeWpBGcx/+FvwV/1lv?=
 =?us-ascii?Q?ZMMZKd1uha5Cf23EiVyefIc3kD1Ih/FiUJJ7G1k21F0UWnNKy8VmIGC4Gp8s?=
 =?us-ascii?Q?ccBNjWeumUeovPpXZ4obzVK46395ryaJHHSbqzJQStrTlKBgxhS0ZT/1EkuB?=
 =?us-ascii?Q?Ch3zpeL+TZzu71ib1K9ywrann1YT1bVF+okat4sWmM2MAUenAOBbUN8DODW0?=
 =?us-ascii?Q?eJbpzfv/u53Rbi0OZgtgQRjIc617G8gbxM3XjU74WtlDa4MYOwqaMW43SLzn?=
 =?us-ascii?Q?HRjN7QLKvkrivZESS9yFXFaifg/wWlePUMhPrBIQdq5CnTTEu8G1dmnHylDv?=
 =?us-ascii?Q?1by+D/a14tSRbzHtCnDd1x2PXwZjXUdLeOxTiUyT9yiTMmWPgFx5HxpllM/U?=
 =?us-ascii?Q?4KxMhIZ5MPpzQgCrZ2OGr62xudhgN9jM+V3AwY7SnR+f/hKKhLCpJelm0wxa?=
 =?us-ascii?Q?ECy1s4MWZ/p3BE64CzgjL7DRjrr4afTurOngxS0jOwZEGc9Ou61Pf98/AjjQ?=
 =?us-ascii?Q?Fhd/fuNMhB4QXb4paXT/hRWVtZss6kDmF6sIznAwRsp1ujCQimp6MDFfHSX7?=
 =?us-ascii?Q?BYLfXP/7ke39k9FVPRQzHLPMknrqywykgu17ZkS8/gT/OYvb6pO5cnnJIFlz?=
 =?us-ascii?Q?sSr+OsZjhUn/Za09LMMdMCsF2GPNru3ujN0B1/NtIMTD9lIeR37H5EwfjkCj?=
 =?us-ascii?Q?5a0Eqoeiy2LMLDWuGPEVhN7+CzMq16yH4OqhgT/x8WMOtFdI4lVI4bHJ+hDB?=
 =?us-ascii?Q?bQJRFr+dNINvNo3PK/Yvt3W/kuDygBv4WzVqcdTN+zNMT5BwJTc9I4/8JMZm?=
 =?us-ascii?Q?prHLyrqeAsUJe3lqd3Ms86VDgLNISkySQdOypmVZJFKwL2rE22zDOeoajoOM?=
 =?us-ascii?Q?yKyxHISrb91YQN+q7EMimN/ToFbPLvxxeAHUxInrBBsIR0ApAHnvyTdLos2/?=
 =?us-ascii?Q?Ge9ZDombRjhFbvhgMi0u1YK9R7WaqoZdWYOfpyQS3AlZxjSIjj/++/JoDoZJ?=
 =?us-ascii?Q?6xnYp/Uu45a0Z2NzBVL050I0nkJBt6y1BBTTPx8JTr+hlQM1UPAeF02ngVdw?=
 =?us-ascii?Q?2nycIs048TPWvdPGDCSFYL+tqiVSIT98qspwrpyYbmLu6wHAc5FePKD0/tLl?=
 =?us-ascii?Q?q0FgJrfyyIvANU4/BJtPq3mF4FUe5N0Vdk9xhqYAMCYVRu+/Erk9al+A/CNX?=
 =?us-ascii?Q?VLStiYjYjC0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?11XB4UNWZUS49qi4t77YyEa//oZRWWCIub4eB6L/pRhT++fMyfthsZsO59K2?=
 =?us-ascii?Q?QIJKKxdyhw0TlnMAv4Wvr3J9epVMV2uBwJGe/gIdTxysU7BG3eG/pv5QFFqq?=
 =?us-ascii?Q?2xil/YiixBOzSxr4//xhDWCl9atAxnJhTkiwVkIha8XLHVOx5IZtTF1x1AJr?=
 =?us-ascii?Q?IYMQrqdRCtu0lDAN2Jk0KW7vlN7+3tgAdYjszZvfV1T7DV31dA0RXZ8KvBKr?=
 =?us-ascii?Q?2CcVsXtUh08iOAtLjgxvhmoZKmaaBuMnjVp8RATAyP1bYbVoQDOYTXzqllqO?=
 =?us-ascii?Q?4kc2WzGyTAp+qlg0q+Qj4Qp2UbfPU/tHbrEGbO+epKysWht85vGijiw/P2ZO?=
 =?us-ascii?Q?g5OQsIuUW0zk2L7TRK2qaPEf8PFudTijWWIMsFFJGOCIvV+mW1VqVIHh0h+N?=
 =?us-ascii?Q?q0jFie05GmS3PZCmwBlECYjcigDlOh6fRDembu8xjf6VGWymJ017Cz56LATm?=
 =?us-ascii?Q?5suJMdOe1isl+KCTur/eGwbpCaa3shpg3H0biGqL4L2SExyg559e7iVOCimx?=
 =?us-ascii?Q?K5lu7JFfRUAPu1W/NXw+wBO5v13r28ZlyWyBFDLUlfRFhDM1OQQDM5sc3cot?=
 =?us-ascii?Q?YcIhbPOAtUIdmwb/GTmxUWahDI6j3BODV3FAIPQe9980PzrjzLsI0oCgE3di?=
 =?us-ascii?Q?tFOQa70jXyXd/z7byZ7YEjrJLxvpsx3cp62Y9LvpYWlhSTYdtWm+NbWbr7fe?=
 =?us-ascii?Q?Haj+2LsbvyEwbH/D7ly+hOVN1QH5jDNbPijt77ueQw6JFVaRsLc99yrEU8h3?=
 =?us-ascii?Q?0cvk6ouMnwXWfKIE2JiE7iXq9Xl4+VXfbj2Q0MSBJvtR28sJUatBwlBzLIoM?=
 =?us-ascii?Q?ZZ2bKp3bg3n7qu/62TuSHwnFFf1yIiMqKgdsCDpxl6j4wL7viP7elPv9FsAS?=
 =?us-ascii?Q?2EFAUg4sHhZgfRQSE2POK19K3fVDJf9cOrV9RdhjOI0eu00bLmSWfQnbSRHy?=
 =?us-ascii?Q?cnozo4pB1x+yxuG4OoF5Co0WOG1OOufkUE3IdDZvzG7JNHsaEgs9eea2MoNV?=
 =?us-ascii?Q?IVvuXClTrfb3W48QRMj2cliVG7X/01pnwxXxJc/Xs4E2M5lRnB1hWzPk+giY?=
 =?us-ascii?Q?T5D7lu1hExodTPoOi8XDIJJSQsyxjGELr/vtTfis0xTsGuyUxDucC25/RNPb?=
 =?us-ascii?Q?nXe/fTCKrjJLl8+NJOqW7pE/kVygsxrcXDMptfP+G0HBLflpknfPWXFDim4W?=
 =?us-ascii?Q?ZtlVT/SsSQOVZ7k4l7m9ZqXtkbo1CHkiimuerYyXMueeQwH8AcsKrrK8ljgj?=
 =?us-ascii?Q?hXNEGJMypb5/vnyzKubzWafFdS97u0D6MR8hiu7pslKngedDBLd0pw2salvC?=
 =?us-ascii?Q?eWZP0Uk5Gi2MaaKK9z98qvgVgUyzdQp+4GBPjIJRwPjBqj5+sLxUG427Wcvr?=
 =?us-ascii?Q?bQ92/ZupjABE0F6ppUyCwV0FDVMcxFikdpwmuXLUG2yh6dVbXN9YHzn64ewF?=
 =?us-ascii?Q?N2z0MWkPdUySPUbvREeZmfik9qVtJNuAWdrIO4l5e7degWhb/SGWZhpTS6dz?=
 =?us-ascii?Q?rSwrpw+8jrZlsqAgENLncVw0QTre+kfpLiZw0f49AdarRNz2QZfm4ILZrP69?=
 =?us-ascii?Q?9g7jOBRewXhKtLjqR1M6adc6AD4DGUnISoH3HsYiip3/TKAP8Ik3u1GPJN/b?=
 =?us-ascii?Q?/YEr5XileEmH7eEpt2ZIllA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c2e810-213d-4553-36b7-08dda710f65a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 04:49:05.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjjXgpExrrxrVM3rzYEimyUGTrKC8cJo9Yxi1UOZgsWWOypTZj39jKAmo07CYFgGrYXMvsXueC98qtTmSfC8Zi+0hIfh2OeJrlFXSAKosLeUocmE3TNC2mkfKoEGPXn8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684667c5 cx=c_pps a=23ZrAAxOjRKSzRVqk0KFSw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=mGrF08BalrmzBf0XvhMA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDAzNSBTYWx0ZWRfXxenkRz+bfEys aiZvD3tdGVJOBrdHluiLB8Owo8xucbiDQmLcjL1/KYQw7MTLQjVLT6KwCxzNuLbc8KPgI2hSEuK QtwXBw3OXCB0fN3gsrZt3awTQfmjFU7WVMIJrCrnTLIdMSWUFnwb+6vcKpb1cu+sI9OD0zBiP9v
 Yd7Aj8ESIip5qsJIB5F4ZH+a/MS2U2KI0usucLb3+amYoPRF8BKclCKgn7ZNn5PVJIse5GJHlp0 EVuQPhFbZbwZumJUPYNXpPtUW2n2KTcV28qAZ50Ea7u5Mm4e53tngIK75VuY7/BfWqANaejdMSc QrXSf81MScrQ/Gev6i/SVU7+r1+rTIs0kmQ4bXxHuwlLk7AMaQvpfJ90ZeIa26Y03Q1WC5lB44Z
 a1WkY++3zB27k8e0yu0mgJKqP5QAmH79tBMIP3g1fI/LaYjQ3isjUC/c68LnXhWLqE5BHY+N
X-Proofpoint-ORIG-GUID: nfxZX6AS2ZDVoLYOPadkSv7mbzBNNEWp
X-Proofpoint-GUID: PYjSad-oC8LRP7OqQANvaXb5yZJTJa_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=986
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506090035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 04:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218241

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32858 ld segfault on fuzzed object
We missed one place where it is necessary to check for empty groups.

PR32829, SEGV on objdump function debug_type_samep
u.kenum is always non-NULL, see debug_make_enum_type.

Upstream-Status: Backport
[https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]
&& [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  2 +
 .../binutils/0041-CVE-2025-5244.patch         | 25 ++++++++++++
 .../binutils/0042-CVE-2025-5245.patch         | 38 +++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0042-CVE-2025-5245.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 01fd03d2f4..babb893f53 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -75,5 +75,7 @@ SRC_URI = "\
      file://0038-CVE-2025-0840.patch \
      file://0039-CVE-2025-1178.patch \
      file://0040-CVE-2025-1180.patch \
+     file://0041-CVE-2025-5244.patch \
+     file://0042-CVE-2025-5245.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch
new file mode 100644
index 0000000000..e8855a4b4b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch
@@ -0,0 +1,25 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 10 Apr 2025 19:41:49 +0930
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]
+CVE: CVE-2025-5244
+
+PR32858 ld segfault on fuzzed object
+We missed one place where it is necessary to check for empty groups.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index a76e8e38da7..549b7b7dd92 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14408,7 +14408,8 @@ elf_gc_sweep (bfd *abfd, struct bfd_link_info *info)
+ 	  if (o->flags & SEC_GROUP)
+ 	    {
+ 	      asection *first = elf_next_in_group (o);
+-	      o->gc_mark = first->gc_mark;
++	      if (first != NULL)
++		o->gc_mark = first->gc_mark;
+ 	    }
+ 
+ 	  if (o->gc_mark)
diff --git a/meta/recipes-devtools/binutils/binutils/0042-CVE-2025-5245.patch b/meta/recipes-devtools/binutils/binutils/0042-CVE-2025-5245.patch
new file mode 100644
index 0000000000..2de6abbe93
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0042-CVE-2025-5245.patch
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
+@@ -3098,9 +3095,9 @@ debug_type_samep (struct debug_handle *info, struct debug_type_s *t1,
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


