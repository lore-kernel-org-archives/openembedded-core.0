Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7469FCA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 12:49:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12662.1790772580102138270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 05:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=i+m4S7A/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4733047ffa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8dJ22368711
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:49:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=55t0/JppU
	g9vVL/AaUWm3VO59xHA7mlNoQvb0wReRPk=; b=i+m4S7A/M0poStu7tfIyF8dgH
	JYU6Ta3MUXCH+P9d5q8kIxaSRnNgTA+XAebYnGw/cfZV8c85ttMFIuW52WVv4i0H
	42AzH5dRq7ayq36RDRBX/H3hZdmjHqkMqiLaDV4WO2aVzaWJtAPO2F5Wykz4DW0f
	oGSmlu6lk2WJuwK0yYEIxrAg3zLPBS49xiFY8dKDYZYcCdkUTOtZnb8DlW8C3lc0
	/HeRlnRY+srwqW7JvOiLRmuYDkwVODJPaM0AxnHblRXgSNhZqRrtIfKr9fqUrM55
	hKVKB19AMyIdYc1l3WmsLLc0b74kM2xJPNmeTN4RhnnLVkw6eMlO6st+e5PKg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023134.outbound.protection.outlook.com [40.93.196.134])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx9b1xfh6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqyYCtoSZV2sF4mUBgQmUmJXYaTmnw38OgEnQNtdUGBomo8slurKawsSTYhxYm1YSR/uLVbisAXRn3BqATaME8SAwWQGYvkMvfNv58I9NTnqtlAdHRBGXaW+8gQmMn//WD+LQxXIzqJ33VCQfd/+GwaYc1NgRnZ+G7n/+F/ySlnJoc8L9KUlB0ihoQYowdAsKKZyw6OU3ySyGk5diLh3eV4/9IFQZas+wrAl+g5X7zl5opQQqr9N6yiDiN1shKPByl+1p34WJyeKiDeQ5Gkb8uDxFWcsBIhEDEXChn0GSd3MQbZkjC4QXhhVsFZKwKynLeKWbZeZ2WiUMgrbqoMFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55t0/JppUg9vVL/AaUWm3VO59xHA7mlNoQvb0wReRPk=;
 b=Tm0sPJr8w99viWtvnLyQC+Sz61J7E77ucoKJpU69e53VtQqaLR7bQDLHkhtE5HrFO2yLnFvBhZPSA3WlYphXfmrD9UHq6dMX3MbHZBQEbdIZexBlM7+77OE33O4G29mP1xsUebX+FBKsaTilhEoUlrTfvF2NKZE3mR6WcVFsZzqMbyHje2n7lfdhMFyFF5pw5G4xmtAVNRlWXXpTrF3mb1c0rrGWIrOqS6uOjCOiivgLaYtok5asitFnIDz8AKEDUyKdGQs0FECfgqmy7i02P2Z37ngShvEgzmtJZygKtdELPdEUd/PaoAj11nsTtsdjnBWD4Uia6llXVR1cxZTfBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5120.namprd11.prod.outlook.com (2603:10b6:a03:2d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 12:49:37 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%3]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 12:49:37 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v3 1/4] toolchain-scripts: drop unused OECORE_TARGET_SYSROOT environment-setup.d sourcing
Date: Wed, 30 Sep 2026 05:49:19 -0700
Message-ID: <20260930124922.2397906-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 920ac723-f1ee-4751-7656-08df1ef148e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|23010399003|10067099003|56012099006|5023799004|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	9cayYLN53KLx7Kb+gLdouA321oksAJAGO0OOK8xN2T444AxngFwoQIFFtG32o1B6dSUcZ33Iyl5ltIk+UtJDCgL0dKZLpUWC+vyiuEOf52eDfMT1Dz2JmqwQx5cPibRY0gtqNbh3CEVWKHMiB+jZlIWdiNCvdjE4h5PrsMnEOOIRTZhqv20CIrTi2HPOZtpgdic6hnz8aUJ62moPNt1wU96BxWL2nLrciLwONFLnTLGUWLLbNxW4BI4w7lESg8PmSfaxTdInAklWMTwX7gTcAsStM8djcL9qDQGBQN9+/LQcFFl4dQQzGjsaRXqv4blaiOqT50ddYKdSMNTGUc+4nCPFPszAswRLpI1fLXL75evhtvpBdHTxt73SQaeoTpXKVD0PpVpd5n5uJwfEzsVUz+hwtMZEp7I7HNEOjqfcTis8L9QwXvwU25hMijyAArFIzJSdaHFBVrVEG8LikhayKnOV0PzT5t6VvCHulmbGPs6ZmRYpZl8pt3iv8zPy+LUzLKeZ4xDORt29qW/NDAQtog7NeCc23ttUkVYVSg7vOUVZJhcoWnsCxZjZ0nnvKyQC63p0g99iuTiulhUbOSjne1+Ln6njlxgVKikXfCju/9NGSh2EbfppUHBx2k+B9lfdY4eBDX2sDe4S7MR5jKunrEhLZzc1mgfNy9DmQ+yfpBFb7Bo4j0nrLyaln0ydlCMXVxUPXqhFYLUjsLvvJ/3DQWDi8q0UiNEAWmzw45IrFSI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L7qTCtcYK3ZLlna/HhIMFYVOOo28tyqsFMuCKg1n6fBYES67m922/pAwi0Ho?=
 =?us-ascii?Q?u3ZM9UoiQb6JgL2NB5qNclBMbY4b5v8NhUs+mnO6IiUDVl2g1utlD81J60xC?=
 =?us-ascii?Q?gvZDXkuf/NccLckKGGrnh9NKVnTiC3jQVyTTj1PWjS3X2Gjb4u50EtVbUkiY?=
 =?us-ascii?Q?tQfBWAq1Fa5ukIhpmmzcx91r27YSCtbhGqcOSAaerahbsJvxC4gLC29FPnsT?=
 =?us-ascii?Q?fiOeFAh3G3U2UVFfWn1j1sei6psCSLo2Zx6qAzmtAHWZBHD0Qlpm8pO4v2BL?=
 =?us-ascii?Q?aAm9/FY3bCo8UeYWV9bbpaUGbPIlYAHpM7Nx2fs0fF20uP/RvqcobUpO7LDL?=
 =?us-ascii?Q?LrFP4NeLtP7iXVjoaPn1RuEf3Bl2viIIfntaAWXDURSnbo9e6eCKMJTcET8G?=
 =?us-ascii?Q?F8Moap820a7eYWB4MD6DZsINYh5gF0rwcSBCCEiMA+rEPsEjIfN8wZcazTra?=
 =?us-ascii?Q?e6ni/YP7GcrW2TqxOklDzOEJdCYzEwPoXgk/ShlBjYblFejSz5rnmAJnADQH?=
 =?us-ascii?Q?3njjUHWCr34jv5nfYaIorMdUUFiRnUpEl4J6DnIoiZWr4a6+WUbYVyoMOTuz?=
 =?us-ascii?Q?mffg6oKjHtliUQUrmEeTZk+B/5pdLu4Hm4Did73Y8RPlOftRTpXWTZl1oK7S?=
 =?us-ascii?Q?7hU7rdorCEC3/splTCbtvzPDOS0eRIfGMGFFVOsVgvTwBeZOIZPQWJfWfqpA?=
 =?us-ascii?Q?7HI5a/7zB2C1No1B2U1+Z9v9LSZk+RmJ+AcNeZdZ3PNPvORGIq2z6z+FjliO?=
 =?us-ascii?Q?g2VNfM38VeRc7YZpRD3HO9+QkocAQT9pqZq4bbpv3dHSB1ElWUx2noFvwU5r?=
 =?us-ascii?Q?v4MPXZK+ADpkYOkUiZBOhtYVYkDflwWwEsficQvEn6WUNkpNditnbNfCGGCU?=
 =?us-ascii?Q?UX+juChzhJn8jkNOIXahOkm2kqN+5w1YnaIffL5ioLB93MHVy7d0NsHs94Fm?=
 =?us-ascii?Q?HCsFdIErG9lVNXi2XWBWEkc+nzqFcwzIB3NfRfG5mbhaUolvFgWe802BUenh?=
 =?us-ascii?Q?HABAgK6mzhSXtLRkLNX9/Je73vO0hp4xqhONWHufm6f8CmKjIxeDpgsZJv3p?=
 =?us-ascii?Q?UqnrGO6Id/vD4TR3Da46bWh78IzR1OiyRx+hBc7pIuBYDSh0tGDIj0AK8zQV?=
 =?us-ascii?Q?na/9An2WiATa8YCPw8mkkIfPA2Dy+iNy1b1RCOYGSSDU5VRMFVVLtv65OP7m?=
 =?us-ascii?Q?inQMwrsNHGu53cZDyJQkrYr7psALhvlQiD3YhjgIewBGbFP9Ug5AW1eUH/jK?=
 =?us-ascii?Q?3Bg10Gt7I8w64uGBcK2gAfQCCx3mte4/R5iO1IiTgyWSPHPrrtnrvvCxQzyq?=
 =?us-ascii?Q?gmStKQ45GquMHoUSgxWJ7BMZa+ZidXHGalkZ1sGDUi8JxUWJ99/7r0bAP+Mf?=
 =?us-ascii?Q?LMCy114L/GPbX8HhkPndTDQBU/q1pZgDXiN8aJd/270n4k3EbvMRhBQtj55T?=
 =?us-ascii?Q?BWL1hunVZ+RmEogLzvR/3L0jfstjIYSb+O8zPS5hizXZdPtvEdQ/nk7Jauu4?=
 =?us-ascii?Q?OeKkPm4mpc1C7af4TiThawGXJpwqEOXivQBjcEIOWLhieLANz7osTppAqah5?=
 =?us-ascii?Q?WJBCoEGi5w+jfDQpiKVwsiI13U4d4DbCUTG59fiJJGsJGSZh1WqpxAZIUjeT?=
 =?us-ascii?Q?YNzd2/eeuNF2fBQKOgZHEIIC0rvOP8q7wDQamMpIeujKOCKpSuTSo8Wa11el?=
 =?us-ascii?Q?k0vWnEWV9He2gsUw3mRVOF6xoBpABJ06qBNl3U7rptcSr6P33VVz7nCkcujy?=
 =?us-ascii?Q?GMFeMjJvmkE+rlP26Ov4UDFv1ecDn38=3D?=
X-Exchange-RoutingPolicyChecked: 
	FhadUWA8IiOYLo/lh3B0AiSBe9Erdn6vRYYcV5EwGYQGapb5ibVpvFu7xWkBZQ4+j4hCJETLd3uXxd/nT7ciznKqnGsWKPKecGOi54ff5v33KILDgTvoeN3u92mzkRCqz1GALuDX2kYZxMbeXmgTmvItN1H6XieS794H5bBu62rkhrw2USSzjLvkWuliIs/UedT7nqLbJ1dkWYqW04N9hkg/fa1NpqU+MhODr6aWmGXd8bbuhB+wh9THNqiMHgLgwDS2GXY9mKcL5M/Dhr25OPhMhYFK+T1JNcGEKxqj3RGm5bcYNY0gmOlEmiRTq8PIJeWKXuJJ5Tu0JmcoZjLX6g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920ac723-f1ee-4751-7656-08df1ef148e8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 12:49:36.9938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PZkZ58FIYyqx5UUc0kaYCFoWU00zZrBvqAQAHc8SLI/+NUkHtREnWpCG6/df4TxfJNHgI2mdtgQN7lBp0lzP831rs6RVu4WkMfGzpTYbk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5120
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX+2wrHtFUUMKK
 xMg0OmMbyczLxvYdIBujA8iH/wBEHGc1ccXFDtzj7owbiI5TVv06Ctu1Y7GLO/c7Qm1lbVcmami
 82smWEa9o/uYj3h4alzK5k/0Xpiqcg5J0Fs1/3kd7o8iG1t8rlZSouJYYAXiCiQRqOO41RX8I9v
 QP5ylqF8GpR65BE1168X5oLrQlptyb//FmiKdci+wI+d0YFXtaq7oPzjv7ePQ3LVDug/kO3j7jf
 +U8J79VUbjJHXSSeaxA7YYhdT4F6bcOa9IqxgnVe+0UiHwRzppcdlu79lVz4eNTemLRF46ZzN2O
 rD/UqQSQWnvnxixAM8hMVEs0AWo9gnvDw5Bo0BrLDxPPdy5rIFpiq33SHQiiUOM3MvQboqmW5q0
 oEsDeO8wfeWfuVqeqMqlm1fdt9Tn4KoY7yibHf+CRhDzhzlxH99Lh9cKcKXMEP5CNOoShsL+2fC
 wsqiG7foskV1U/IOD+Q==
X-Authority-Analysis: v=2.4 cv=bvrZl0ai c=1 sm=1 tr=0 ts=6abd0563 cx=c_pps
 a=nwo5dP4YXfprkeZ3FPreQQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=ag1SF4gXAAAA:8 a=RTyAfxNcIBcxbLWgfY4A:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: qVvqElr2zCr1B4j8nfSZBdD7DWg5L2ci
X-Proofpoint-GUID: qVvqElr2zCr1B4j8nfSZBdD7DWg5L2ci
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX6tkZcS5hCV4L
 RyhZ0zYoucbvZEFiZmfNtps3xxpVXjXGlGzW3omgCEIAQgsVb1gGa3zHnhEp+gM8PtTdGORuA6S
 lGnbUkeJTLi2PoIAJANpXoW3KJt2ECm2zsjch2KaQ37J0ReDnT9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246964

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes [YOCTO #15061]

The generated SDK/tree environment scripts source *.sh fragments from
$OECORE_TARGET_SYSROOT/environment-setup.d. This target-sysroot handling
was added in 2d9466734f0c ("toolchain-scripts: Add mechanism to add
environment setup scripts") back in 2014, but nothing in oe-core (or the
other core layers) has ever installed a fragment into the target
sysroot's environment-setup.d. Every environment-setup.d producer
(openssl, rpm, git, curl, file, babeltrace2, python3-requests, cmake,
rust, cargo, rust-cross-canadian, ...) installs into the native sysroot
(SDKPATHNATIVE / native base_prefix), i.e. everything is nativesdk based.

The target-sysroot loop is therefore dead code that only adds confusion
about where environment fragments are expected to live. Remove it.

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index e971b9a270..8bfcde55b5 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -164,11 +164,6 @@ toolchain_shared_env_script () {
     cat >> $script <<EOF
 
 # Append environment subscripts
-if [ -d "\$OECORE_TARGET_SYSROOT/environment-setup.d" ]; then
-    for envfile in \$OECORE_TARGET_SYSROOT/environment-setup.d/*.sh; do
-	    . \$envfile
-    done
-fi
 if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
     for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
 	    . \$envfile
-- 
2.51.0


