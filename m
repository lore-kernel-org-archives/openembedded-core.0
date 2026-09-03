Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89839C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 10:02:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4208.1788429747823572226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 03:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a5U0AUnY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=370613ba34=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392URt2571894
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Sep 2026 03:02:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ox46Ush6Z
	kTFdC5HDT4EkTjY2tTwc+dynN0q36ta+G0=; b=a5U0AUnYFJG+P1ilygo3XV+sW
	L7mazSiKdXSxbB7hNuqC/4Fjusi4ttHmCEnirMlmggQdlpeTeICWHCzjEFMkBrpn
	NP91FbtiUy4Nh0WMSEOhaq3UKPVXvRlpiMWfCwJFed+UQaPU3WVxb2ndwGFquRrQ
	nnc2Tk6km78WYVMnsFdov+0Jn29z3FxksrajBK407BcxCF+G4sHBBvG/m+J9Uvgk
	B1lM5O/qci6hJLRvEV/lEl0UVqSUTu6PEBSlrh7ve24Faf7t2/1+nv/+OR069mM2
	r+ZPwpt40ho8EkXI7HfygsuEUoqj48gveHNF0nwYxPC+srBbTryGNO38AEPtQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020140.outbound.protection.outlook.com [52.101.201.140])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gf5qsg34a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 03:02:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aO6rMHWLgMcLzD2HRxDwzyzkpT5OZ4uUP/HyKif//ig6mlEy8nYfvgdVVsSf1ujYpR2p6UcXjK0yJQA7C58eukxNPsRVMSx4mpr+NwQjVR9pVy6u3XxUvBjBtawaJFau5IRTYSZsW8EPhG08FrarZUpEoc5iHqsHZofU6hALFgYe9aAXTxDYwJYKzP4aTgJ55nySmFhylT3rl+7PHjyzj/N2F+RFA0sEjAWHJQX32dYrAVApByWhhnLhz1WYA7lzfZiLWynv/1iwCE6MVZoq2BbrP8WDjk+yDEx1yh+zCCVOVOEC8X1u32bYKyNBoWfEjx+71c2D9OTJW2Aq9Jf2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ox46Ush6ZkTFdC5HDT4EkTjY2tTwc+dynN0q36ta+G0=;
 b=WSKO9SooNnaCJFPaRdqAHaZxpCstDo3cgYRfTnBskpk4JPZJNFeKT9rBxQus7TL/hquRnEkeXMxCdV3KNB29bY18+Isl48y13Q0TX8KtDqf4F4n5yhh5QPVbQXKJ7Tv7rXSBgc6wBV4u1DiuNzeUJ9ZjJRmfDa/FRm0OILEWofSfMxSdahaClmGx9zD89/QLuU0Ajv6Dmkw5wwBEE61LrgjdIdeJXqu52XtdsVC2ae3czAhdxddKtykifMudThCNqBNUGv8xWP3I8GQ/nFdGnCFfqO4hpLj7YH9F1ybYmVX3/WyWpZzqEMW3sBNI1xhKzknAWAueRiJmZFoqcCFU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LV2PR11MB9597.namprd11.prod.outlook.com (2603:10b6:408:379::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 10:02:24 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%5]) with mapi id 15.21.0360.006; Thu, 3 Sep 2026
 10:02:24 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] glibc: fix CVE-2026-19542
Date: Thu,  3 Sep 2026 03:01:59 -0700
Message-ID: <20260903100159.1114249-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|LV2PR11MB9597:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bcfdbb-ee53-4197-3a5b-08df09a273ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|23010399003|13003099007|38350700014|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jmSWQjGkXFqCYccWvat2pAlhKuYC913PvQtg4BxX41btFcmXapjXnUlVVKcojr1dWa1Ml8xSFglE5uIzjaRg+FjxJhWKBBAX0Memp/nmVvnFs5Fmvozw/tGfESjn5/3IxKgO4q8XVHGmKGd5w1Lm7Ej3YEYJOTfAUalBptkTtlA3siNCJ8onlVxqZyZNvVcgcOYbYNhjYUjYoa6c61fLofhFOYOWd1nwu2VHEwlATCS9z1mAzAVT3KeiNggd23Tfeh66UfV9XcftN5V69Mp9ZwZIdweKEMREyae7k851exI0egA2bCpV+Wilx6qXCxX1Am4FV7d9bbh5XVGH7ZHRmavpOvOmKwdc37vdETWS9FFpAPOgqEMlbrpiUCTMaVbOKk3TaIkqEX5cPvGss0gL01UEx2q61e0UH3X6Ekemn4wNc1Pet5PCCKW/PsYq1y0mSJhFPPj/uEd19j8mab8KaTkgZsSjBTek/Y6mloEh9qjE0IghY/9eTwJ+FrijvGZdn+cNsnsP9BJzZ+IcifFyuKlW24TCnWe9OjIu7BIrSIhzejsmR5Dpk1gV8ry049UqeHirD7kFSCTRmMZjdgFbrGPzPoHhwnARjk/aRkYSkJY/pjUBqvLU3MsgSmDUse2XucHjw0CKiATrswpf5PXv52/C82Y7mo4NJzRdIKME1qs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(23010399003)(13003099007)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c5YOHLWDGYl7EPf25nWkKK787EyR5J8fU0su25pp0s/WL1yax1+XYTmbjr1k?=
 =?us-ascii?Q?4re9k7nrJ0BGDDhBn2Lvk1H2Fwh7fnu6Q7b4DNdRg0X7NIuPGXRbAOCM4QqB?=
 =?us-ascii?Q?IWSQvm5SeRGgVvD+wDiSWa6snE/iJ/H+UtvnRS69E85C6JthCxcRY7Aq/geD?=
 =?us-ascii?Q?wR/mFKVhp36+PFS9VwubuzQMuhmDsP1NIelpObxNZUTl4cnB8TilHzjaI/x0?=
 =?us-ascii?Q?9b+sIRTqssMj0rV3U5YWXrMdjDOTJj4oLV8HDA2JjChn+y+fSClkLn/1s57K?=
 =?us-ascii?Q?AmMezzYy1RHipmD2AxHIek4RmG2fJsgyZ+/4sOEh0qD9e0K4FfcKxk66Hqfw?=
 =?us-ascii?Q?hpM1SBq+rDkgef2ui7G6Vo3qE2ewkJce3/3VoE5DqXkc5qVN/va21cUEIgzh?=
 =?us-ascii?Q?cOZ9z3GX5f5m9Ut3p9E8pawR2dF0AF4hXRHudg7toMxHqwsQHSD7QLN+W0Fa?=
 =?us-ascii?Q?3Fvxj2Ou86KRe88tIgM4EDFZbPTzARP/D1+MDaylCFueSeSfZSVfFpJwIVcp?=
 =?us-ascii?Q?aHvyH8Ze7qz89C442C9kRBeA5QBh92Kil7PDm5so0oVEnON1onhuXH0j8fv/?=
 =?us-ascii?Q?otBYjKP5mTwh/zwboZJuUllT4lTyC27lf2vXf4MFcn976NZ3V3kwZzr0mivB?=
 =?us-ascii?Q?lBwBsmod0I5X6MBudg/7QPJ9WrsTX8oHzkNP1WuRKstiUa47QVK4CroGR6j8?=
 =?us-ascii?Q?KpHF2p+yKcckvjbuAZFdwVcZTVaG0G2Jg0uNvZg8oe5kZSUT9+1jQ7yEGeR3?=
 =?us-ascii?Q?hRi+XWFrT1BN6ARIYHvN3775P5XKeNts0CySo0oPwtFaJ0BKUD/Ox2dw0QtS?=
 =?us-ascii?Q?oOFCbmuBPJolrS90zcjM7fSF6ywuOKCgG/OsNMagkGGAFaV8+0MuvZ6AVsyG?=
 =?us-ascii?Q?m60Fb1KkoSpzwbiFxolyPayd6W20EwnsGG6iAmviGsqz98drG09gvG8V5eZF?=
 =?us-ascii?Q?SjL9WvREEU/UghiqHlieacIUWb1Fx/vzuIGfn2Q9admqxDQUc9YlANA4D4EV?=
 =?us-ascii?Q?R2S1b98Umaj56neShG7a4ogBWCm+XAJ5vgZfCpxRzndyJ/R+eluIMEnK63EV?=
 =?us-ascii?Q?Mhk59vn1xhIcxaKnxi3gdviJLow4RnyJhd0jQ4je52awZ3KYIAjCgUm/xhpQ?=
 =?us-ascii?Q?bfbQjUC3g7N7BgDM6azbLfpB9xR5SO9yadSARdEWXOTtPWWoDhnMQHk4SfJK?=
 =?us-ascii?Q?90D+Htw0jFTAIf7tmAADKX9XYAqEbh6x7qJYfuEg+AQmZGrSf6SRpovI9pQ+?=
 =?us-ascii?Q?sNx/dnRMAA5YRX6lwgdSYCfmmG0NnfFjbOxq2J3z+Oy/y7eQe9R3OIJ1ul0P?=
 =?us-ascii?Q?XGby/SsRklcCsN6EwGCi3ElrMNKJ+3IQZejAhWsPYG0yYKiyywP5OC6sT7IQ?=
 =?us-ascii?Q?L0pPnMuUWsFQKj5tc2UL3IqsP2V4FOdoLz8WF/pNDIEytiqS+VILSxMyNNbf?=
 =?us-ascii?Q?t/KIbVg8bDBd9QUuiHY7JXHh3yrXmqwM3YiQ3q1SI1BF9ZECAXbbX3nvsTUI?=
 =?us-ascii?Q?wCNm8+m/BB32zSDtPz4r8ULmNf81IXA49czGiaaT78d6CQOgDOr9MMACHhCn?=
 =?us-ascii?Q?W2LASYqsSkbrd7KdgmIgOHDT+hdGjrpc0jqEui0yuO+KfjgVTcHtRjvNsnhq?=
 =?us-ascii?Q?KWlI1GYU3cFZEDaYmi5u8ZfmHPwl6YvaM0d6xUvRh4Tzt9pD/1KScLIYrkjD?=
 =?us-ascii?Q?+6EMoWHwBAfhXYp2nbEDBoHn97Xgy92BRRYbNwS7EPP5sdoDNT6hLuMciBLw?=
 =?us-ascii?Q?wrmS6lUeTWqsukNPGKi1LnilVdgw1Rg=3D?=
X-Exchange-RoutingPolicyChecked: 
	QT1YswaG6RXKpZKmTdTZERF3r0ojMst+IkhSVJCyZmZwFKRbUV49nq8Jtpc3i4C6pPiRW5L+OmffYBO3gJKkHcCvdFuuaHoVIACrnkBxGgMJbyKGfVqbM26vgCAdl5ukj8xPQvhhIgI5hW7WdUOjgwYtBtN8CpNd96yTlyN3s5enpne9Xco7q/UurT9Y2aOXHV57n/DdolcSIjfwTn/AqppZOASl6zPZQqeDOnI5wyEy5tjI3aJQRUUsNHiP2XWGqJ8MsDkHloQSSSWkb74GAh63zqssb8Pqa6qSGia0pm378NyrC1teIjiiNRU3M/OUu/xWueW1Hcajb/0GankkEw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bcfdbb-ee53-4197-3a5b-08df09a273ad
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:02:24.1028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08HPeEo9DjdoIkB3ZgiEelSUK/fUz18Ge1BrUNAuDmi1hldlART8IMumX+6UBtVp8qbQ+YHso01MhbZU8e8K22jYZu00NZrJZ76/KnDbGtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9597
X-Proofpoint-ORIG-GUID: SleMhD_GcFeNqDvc-wTTN6eDycMQs4pG
X-Authority-Analysis: v=2.4 cv=AMY1HWas c=1 sm=1 tr=0 ts=6a9945b2 cx=c_pps
 a=7xlfGB0ub5Zhz2aq4ZyXAQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=CCpqsmhAAAAA:8
 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8
 a=G6R0OveSbEgIj4TFKTsA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SleMhD_GcFeNqDvc-wTTN6eDycMQs4pG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4NiBTYWx0ZWRfX17jjCZLZexrA
 evHcABxu4h9CdcPC3LpVPTVsVXcf9C0AgmomHeQUKarTnriGxp3EJt8OJpwsDZWNywzid6TOopO
 z8aSDAsQhhTjzcdz9xylsQXFLRj46yTZnu5nhmPFqopANTy2XcPD/anI2yvFNWyOxgDdxe8s/ET
 Iv8kUFh4zrcWnSlDJOpw3HSa/xQNHZB2WdRecteLSLTHk+WCYnlW87F09ia8CMJMtopEJMTTRi/
 ODX4mPB3rz33Fpg2QWHWbRnGjkLI/AIJqnDhBBwzBykFMivgQLtOI/BfKp2ZMJ2jI51YhMBnMEU
 RpLNmUncOchXCoG/ZnV7BcIqa64Ab+EOlgkPOwvnY5/CJz5HYGekbohwPhpuOdD0YxOES6C3vQr
 OLjfPLuMadfVRxP5VJNZWP9ncS3fcnO3bd09nxACCzMuoAnKjOpkf83wf56xB7XcCfZ1OQypQNr
 ElxaDG23LX+NCsS4AdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4NiBTYWx0ZWRfX8YmKPu+uvfoY
 u20zPEP2ylLhZ1tQ1ZZ0ia8IYv1uRGoybQpSPkntX3NFZ5ulTlzQltJwCFhVLNp+mhgnsgOXskx
 xAIWfV5iHU/CqTnchqpth/3AR7d4dQdlZ/OAqE9C9nAbXMwZiAnU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 10:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245023

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Allocate the maximum array sizes directly, instead of resizing
the arrays as needed.  This eliminates alloca usage from the
function, and fixes the out-of-bounds accesses.  The asserts
guard against the bug coming back if the balancing of the tree
turns out not to work correctly.

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3]
CVE: CVE-2026-19542

Reference:
[1]https://security-tracker.debian.org/tracker/CVE-2026-19542
[2]https://sourceware.org/bugzilla/show_bug.cgi?id=34506
[3]https://sourceware.org/git/?p=glibc.git;a=commit;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../glibc/glibc/0023-CVE-2026-19542.patch     | 98 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.44.bb         |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
new file mode 100644
index 0000000000..d4b42c6ea4
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
@@ -0,0 +1,98 @@
+From e2789c46e3bfdcd67a82bea9946b315c179e83d3 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 14 Aug 2026 13:41:16 +0200
+Subject: [PATCH] misc: Fix out-of-bounds array write in tdelete (bug 34506)
+
+Allocate the maximum array sizes directly, instead of resizing
+the arrays as needed.  This eliminates alloca usage from the
+function, and fixes the out-of-bounds accesses.  The asserts
+guard against the bug coming back if the balancing of the tree
+turns out not to work correctly.
+
+CVE: CVE-2025-19542
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3]
+
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ misc/tsearch.c | 31 +++++++++++--------------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/misc/tsearch.c b/misc/tsearch.c
+index 9b2eb34b25..e517dfa712 100644
+--- a/misc/tsearch.c
++++ b/misc/tsearch.c
+@@ -85,6 +85,7 @@
+ #include <assert.h>
+ #include <stdalign.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <search.h>
+@@ -406,12 +407,13 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+   int cmp;
+   node *rootp = (node *) vrootp;
+   node root, unchained;
+-  /* Stack of nodes so we remember the parents without recursion.  It's
+-     _very_ unlikely that there are paths longer than 40 nodes.  The tree
+-     would need to have around 250.000 nodes.  */
+-  int stacksize = 40;
++  /* Stack of nodes so we remember the parents without recursion.  The
++     stack size is a conservative approximation of the maximum height
++     of a red-black tree, based on size of the address space.
++     Actual numbers are closer to 57 (32 bit) and 117 (63 bit).  */
++  enum { stacksize = 2 * UINTPTR_WIDTH };
+   int sp = 0;
+-  node **nodestack = alloca (sizeof (node *) * stacksize);
++  node *nodestack[stacksize];
+ 
+   if (rootp == NULL)
+     return NULL;
+@@ -424,14 +426,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+   root = DEREFNODEPTR(rootp);
+   while ((cmp = (*compar) (key, root->key)) != 0)
+     {
+-      if (sp == stacksize)
+-	{
+-	  node **newstack;
+-	  stacksize += 20;
+-	  newstack = alloca (sizeof (node *) * stacksize);
+-	  nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
+-	}
+-
++      assert (sp < stacksize);
+       nodestack[sp++] = rootp;
+       p = DEREFNODEPTR(rootp);
+       if (cmp < 0)
+@@ -470,13 +465,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+       node upn;
+       for (;;)
+ 	{
+-	  if (sp == stacksize)
+-	    {
+-	      node **newstack;
+-	      stacksize += 20;
+-	      newstack = alloca (sizeof (node *) * stacksize);
+-	      nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
+-	    }
++	  assert (sp < stacksize);
+ 	  nodestack[sp++] = parentp;
+ 	  parentp = up;
+ 	  upn = DEREFNODEPTR(up);
+@@ -541,6 +530,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+ 		  SETNODEPTR(pp,q);
+ 		  /* Make sure pp is right if the case below tries to use
+ 		     it.  */
++		  assert (sp < stacksize);
+ 		  nodestack[sp++] = pp = LEFTPTR(q);
+ 		  q = RIGHT(p);
+ 		}
+@@ -625,6 +615,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+ 		  SETLEFT(p,RIGHT(q));
+ 		  SETRIGHT(q,p);
+ 		  SETNODEPTR(pp,q);
++		  assert (sp < stacksize);
+ 		  nodestack[sp++] = pp = RIGHTPTR(q);
+ 		  q = LEFT(p);
+ 		}
diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/glibc/glibc_2.44.bb
index b4a5fbf8c3..f0714a5c8a 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -57,6 +57,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
+           file://0023-CVE-2026-19542.patch \
 "
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
2.49.0


