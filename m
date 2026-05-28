Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDD1CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 17:22:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16084.1779988951062882231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 10:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SH0Nr+5r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=060824051e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SFTSqQ2125529
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 10:22:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=R8uBFkcaMcUshP8vmOum/N5zZfrvfceTqUKO3PLk/pI=; b=
	SH0Nr+5rKNOyWErlhyZZgpv0ZxH+jx3Y7/Vuv9nBLiV5Sn/Szhkri4rLiK7S6zvh
	D/joB5hIrmsxkufhUeusVTzOHL67OhirMSP8HymIwIECfAGDZ7+HNJcZUA2bi6qt
	xQ0nYd+7uuyz1Q0IRBP0BEpQLfTKmdQXUzcWJQsM4XsDSXoGA0f+dfK4vJVoe/CN
	fDZ1YBgYMEXih/Zz4X/doC52Yn2S5Vvc0CilJWlQjJ0i92JqFr4qeMPNuNetVmer
	2D450WC77JZ5iSI8NWt8QJjGbOh3aZoHEKUXzQxJGgRRABX7eUOSXU8Dx6ghR94d
	k6DdKXhCIeM0KEjNdZMy8g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6h743-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 10:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXTxov7nqHaybFc0C5lYGU6HSPnC+CUcw5KHbAHKIWPJPDb+fvTuF2Ugs7OIO3aTZUnPqAaLH0jBaS5ZhUfjMTGoQjIcPvHCmW4k7I1NfQDN6ZivgOxUhz31PRDi6CbjDdlncYXvBw5pimXQZvR1WpET2PIsn3B18VKenwM/Zzun9JvTXsVMiK/aWVM9SL5iNRJU+MFdoweCcCvv8jlmOfhFnnti4+6zKAj/YYgbiO28s0svL07cw1MSZJeEeZ6mJq+SbR4L94Wrt8VjAQulwnQknhXN/Figr6psQN1yn0buJKWEwq7YnppcvLzVu72dWhFOsOhU35UBJ8EDfeCzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8uBFkcaMcUshP8vmOum/N5zZfrvfceTqUKO3PLk/pI=;
 b=fYeeSlbIdDfS+G/wvg0OAvdxA0nY+qmH31rRW/cNvGX0WZ91VYC5trsWNLpmyoCgIov14uiua2pEfDMcaJxP1hucicA6xkiirpxm4uogJFDhoPjz9Xge+L10qEY2K3/lZJHhfMNHofxuiTHqCr0Ehf201Id9GggbwjE7QbWpALrOJ0NN0hl3MmYA89o9HrYCo09L8N+zMK5nyohjOijXcvAtT7gEI6hwFCuPI1+kelak6vkfmjfnmh3xm3OFt9I1RNHPIqpursMpTKiZoC9XA10E0ZTmGTfUnTZIHIoovLc9OZbqz3y6QS/l05PamAl134IVdN0s+ROTY4BaEM2XeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SAWPR11MB9712.namprd11.prod.outlook.com (2603:10b6:806:4ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 17:22:28 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:22:28 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 2/2] populate_sdk_base: Add Rust-in-kernel dependent packages for SDK
Date: Thu, 28 May 2026 10:22:11 -0700
Message-ID: <20260528172211.2652140-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260528172211.2652140-1-Harish.Sadineni@windriver.com>
References: <20260528172211.2652140-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SAWPR11MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: f74a7bdf-5125-4ca3-0267-08debcddb190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	MsGdI9+/Uehlh9w8rQ6AFjR+grqJKlGDQ6KnbXMMjZKZGQCfhQLYEczy7Oktr8hHrM607rCrF1Nhr1gW++vib6XwE2Hozsn434AnPO7ZM64W9zGvrizyIlzSEegEBInc1pIDhhDoVSecMuagliVocy9Si/TR6Wtu7EBUmtKEHoFZDKqCixKALZ3uD/OeXaHoL4IHqPk7K+jXzYlFe23ZDmE305wu++4Y3m9L1Dszau0RlBiB2yTVgaII0MYMEd0LuIXMEJgOxqIEgXoiAXcSy2Ixob1Rn86BX1Yx2jIzYzQr8et90vajHmT+aVNDFdDkuZGvEDw90LkanNixgHPG54Td+VnwDz5xyKEsAA3FVYHfJoNr31caJSow9KDMTWTMDm+8XsfS5fNYdI2uu5aO2AAqI2kZhlQ5XjWvzktsgCBilB+kbeci5xAy25tsxqCGNde1Olsfpav6bD5lHlC5rPpLLNVbawKGSU/I/GJFIZV2qomLt3pbhpwtLXqp3+VEJkmnT/HlwD94oYWv8JFjiPOwxEAXh1c+hLtd5NhKqQaaBaWNUgtCr6XfQ4B5PLuKPNEMSjV1SxiGq3RTQ8Zvge1o1FuS7kPASbjhnwz2/KFBIkWHQRipQGcsFPSCjYiwLuDseVZ8Q6zK2TTUGmJOzo3edskUYsObCEsJimtF+DMMdUBdW0bkHu4upmSe2ChVSEZ4x5gG80gEKnPdGmIAw5Qw6wX0XGH8sWEd5e9bvJPEkt1259C7I+G2IQzWgKT7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8iizETszKBYAGlLmngr7XkH3hXsbHSF5aZnr/9YVORPLffrKSj7vhRtWfbaX?=
 =?us-ascii?Q?+orEaI4yk/Q/9Mx58wd/ImFym6is70HOSDmbhzSWzSL09KMHBTKbnurdHOBz?=
 =?us-ascii?Q?VJbD5ra7Ne3BeI6YvmxOVso8jeJ/iNObyVBWRx/z4pAUY0irl6CPOn60TfZT?=
 =?us-ascii?Q?G0O4DgiTObC6PAcjAdWaS8ZIYZuLWadeDvXHPXe8ZP9LHH+Ysw9tI+yTdnIS?=
 =?us-ascii?Q?os/feOnYj518kJevqpGmim/jbcDgtqMDv27/fcmHIuFCbaloLoldNoTX8HHE?=
 =?us-ascii?Q?YbDcxEOisdUysoxyi2AEnseVZf3GIAv+Rqyiyt3RXrYJVuNehpNRZuUViyOr?=
 =?us-ascii?Q?zf+hPH8MjKa9eO5TwB7NdOWA1uPI+gSX5EsFa1NUew/gZ+fYYfAqsRtx1yD8?=
 =?us-ascii?Q?4KliIUvIN7e1Qb+SZn0q+/YDOtVoMQHJ0E9LFvTRss+PMbZV440VIwioKWad?=
 =?us-ascii?Q?eFHvq8XVd0PeThQdjvIkBdkFeWFGOhQ1cm2Z66UJ9ewc0xUIG41kX/WIA7ct?=
 =?us-ascii?Q?kAuC+/+OQjuSsxM0PWKFVVN1c4kQ9Jb0xRJZykY1nKnpimNvcsdi0dPYg7a2?=
 =?us-ascii?Q?/LlMyF0HDrPZ1jjxo9/p6G53MNPfAyQ4jcOC4cAH0ixBXwRtxPm0Dj2IOaoB?=
 =?us-ascii?Q?yCTGKZwLRD3ule6qGCc8Ifq7lFgcDAeScDAIFcoI/ECT9JL4wVJYgV8FPNos?=
 =?us-ascii?Q?bRPxVPfpS+8M+qGGVMYxx/ckf6+n/beJ7iJbqgrNyglbNVumHugm+B+S4ZsX?=
 =?us-ascii?Q?Av4lZ/h6E+fdzdKeP8iTTHgfxeMPAJqimym8pstI6dxOonn7L2coivEQj3aI?=
 =?us-ascii?Q?yJ9mhDzyyB9wSMEpOq5DRQPVrrkoHWK7EC52zEgnGwvgzvJkxv1WnLIZeK04?=
 =?us-ascii?Q?8V752tWnA+Vs07swaKY612G69XBHE/nfRn1EVHjNroe/zzmrcmauqAOBnkxF?=
 =?us-ascii?Q?e4aLzAYpPcY+SoKcv3fGgQYMxYSV8ErfaLdhRwGvzFAICL2HNZ35YP0X+KiP?=
 =?us-ascii?Q?5Lyqe0fnseQ+xhDcGmy55s3FH+n7Q4Fc3/37S2KH8VxK95NiKGrL4zIbnTfK?=
 =?us-ascii?Q?oum13yqoRGqQjDDiPziFjvu5M7vDKBfSQjKdgZZDXGJz9+iSLGEvV/PhYMDM?=
 =?us-ascii?Q?Sr91fJI2T//n6w8gQIHKgx4TpDSZRlaY81BSMQl6GA5VMJk0X8dKpnZ6XVgI?=
 =?us-ascii?Q?372F+ohpQO4UEkzVjZr4fo0OrgFzFvNOlIt5WFz3pPI6tXGsL87n+H9pgtGm?=
 =?us-ascii?Q?LBdzmDcOwtOq2tCptOEQKdbBZ/UgZ/ev/EbjJE1nLI/aktRwTORkY0gsVNZ9?=
 =?us-ascii?Q?e9vic7cIQiqZm0w6Q/qnL3IxgJy4+IOD7gnvxsf9E8lyCj5nyv9UmV1eK6Tc?=
 =?us-ascii?Q?UUGj9rA5Up3ssoXCAjP3sjSg0kpPwhKKruQwkQs8zIvnNcoMraQMhZN92x65?=
 =?us-ascii?Q?6DBs81RiI72GAoc7tngw9vO5vQfqcsbCwDtasga9u65+1wZpZ0uf7SmjegkG?=
 =?us-ascii?Q?s/sef6jO9yRkhRdjsEXC0hycNzIzWKUIax41U0B8tbeAUW6oe/JwlBfN1CAl?=
 =?us-ascii?Q?jOmv80sfsES4kKCkxzULv97S5EeDUvFlO1X2CTDgoaj86S7UUFu9no/yEME5?=
 =?us-ascii?Q?e9sr9lDqcrla7bAKC1zqNKr75jHdV0GTSDnIE6hSG8wEqbssiyWAg7+RNFmc?=
 =?us-ascii?Q?Xi9gHYZcXTmTpK3wXK4YNV2hmCSnVfXwXkqQQHU+WJ5Dw8XketD8h1KXs4EC?=
 =?us-ascii?Q?bw8WZzRtVumoZ/y+vW0SyuXUX+6fKHQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	RADzVWNpo3FkoKf4o8FJapZEhy/FO1KboazDkogMJmZ9JkzFG7s5hI7DPmiU+ToP+UjkoM/ZukEpkMMqVmQSqVPYlh2fvj5GH02awRJa5AYDThpROOp6vAqwveu067HaIsNCrOz7rLTJhj/rLIfwiuQFs4wKNU8PcatQNPL/NUF92P6qaVHAV5TUD53cej3He/ob+Klhpiqv7sd5K1yimxQJ36/8RZYupg7czQpDeBWO9F4XuzyTK4imbJBhmfK+7ftEEeODuHNFlGB3iGYp+l1NLFimV33cnwC45dyOmOUTbjHewUbOdTcb8OrEDwjk98ZGmxqWyjnDbqxqEedmXQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74a7bdf-5125-4ca3-0267-08debcddb190
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:22:28.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62wYWgLtpoziwG0bb6XVQvc5mbhJrzE2zv1d3NSGtcbG92lNinAXo6TEeUHXz+N/TV3hmllWylicB/TIJfDgF1mvei2Y0rLbUF1IEn57gTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9712
X-Proofpoint-GUID: hAKEF9MbVA3O3oVNpPmCEiY-Vu1pTyT1
X-Proofpoint-ORIG-GUID: hAKEF9MbVA3O3oVNpPmCEiY-Vu1pTyT1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE3NSBTYWx0ZWRfX5rr/V629OUB5
 pgtZzLQv84nGyw6KUHk04i7MnC9ghA6iCXStbLwlw0ibzoTPHMBskYPkPo3+7AWPw/ud/iJEa5V
 wQnpCGGNZ5QB1J03/QTbsmGhkBD53JXrt/89oS6N/TkaOcISP6LZtNNRpMZUCC22vB6vZhIerkd
 jRIu+O/E29IgE4KuNk2nuIzQobhrBlNQdoSpA/XD/trkQcSvNA4/Ze0s2YTNQUr389126vDNz3d
 elQ3K2nkaC9FU6bwjyEBUaSAlrkmgyBMC5jxC9PO6JWVtwXkbjpUoZN40mN+Z9PiONj6pYCAOd+
 CU0VnWMhDk6bth9XYldPP3qfSh28Cqk7Sg0egJQ4eeac1JuJ7wMY8nOvOJswwuRqVC6jtidXWnO
 G9o++lVK2kKUGQahMDzDebRO4aPf5rUwKv7tDBdVY9NS9jy2KKfMpXhdYoPX6cPStS/w1hjLC66
 ZqAg4rSqQDooc/grgtA==
X-Authority-Analysis: v=2.4 cv=bY1bluPB c=1 sm=1 tr=0 ts=6a1879d6 cx=c_pps
 a=0llFe6yxug+qBfU07gGDXw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=wjDzxInv0cueWuOuEOwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 17:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237720

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When KERNEL_FEATURES includes 'rust', add the required host and target
packages to the SDK to support Rust kernel module development.

Host side (TOOLCHAIN_HOST_TASK):
  - nativesdk-bindgen-cli
  - nativesdk-libclang
  - nativesdk-rust-src-lib
  - packagegroup-rust-cross-canadian-${MACHINE}

Target side (TOOLCHAIN_TARGET_TASK):
  - kernel-devsrc

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index b427ff2761..b345a65db7 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -74,12 +74,14 @@ TOOLCHAIN_HOST_TASK ?= " \
     packagegroup-cross-canadian-${MACHINE} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-cross-canadian-${MACHINE}', '', d)} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
+    ${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'nativesdk-bindgen-cli nativesdk-libclang nativesdk-rust-src-lib packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
 "
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= " \
     ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
+    ${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'kernel-devsrc', '', d)} \
     target-sdk-provides-dummy \
 "
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
-- 
2.49.0


